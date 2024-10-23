
target/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0000c117          	auipc	sp,0xc
    8020000a:	a8213103          	ld	sp,-1406(sp) # 8020ba88 <_GLOBAL_OFFSET_TABLE_+0x50>
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
    8020009a:	b64080e7          	jalr	-1180(ra) # 80206bfa <consputc>
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
    802000d0:	b2e080e7          	jalr	-1234(ra) # 80206bfa <consputc>
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
    80200224:	9da080e7          	jalr	-1574(ra) # 80206bfa <consputc>
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
    802002b6:	948080e7          	jalr	-1720(ra) # 80206bfa <consputc>
  consputc('x');
    802002ba:	07800513          	li	a0,120
    802002be:	00007097          	auipc	ra,0x7
    802002c2:	93c080e7          	jalr	-1732(ra) # 80206bfa <consputc>
    802002c6:	84ea                	mv	s1,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c8:	03c95793          	srli	a5,s2,0x3c
    802002cc:	97da                	add	a5,a5,s6
    802002ce:	0007c503          	lbu	a0,0(a5)
    802002d2:	00007097          	auipc	ra,0x7
    802002d6:	928080e7          	jalr	-1752(ra) # 80206bfa <consputc>
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
    802002fc:	902080e7          	jalr	-1790(ra) # 80206bfa <consputc>
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
    8020031e:	8e0080e7          	jalr	-1824(ra) # 80206bfa <consputc>
      break;
    80200322:	b719                	j	80200228 <printf+0x9a>
      consputc('%');
    80200324:	8556                	mv	a0,s5
    80200326:	00007097          	auipc	ra,0x7
    8020032a:	8d4080e7          	jalr	-1836(ra) # 80206bfa <consputc>
      consputc(c);
    8020032e:	8526                	mv	a0,s1
    80200330:	00007097          	auipc	ra,0x7
    80200334:	8ca080e7          	jalr	-1846(ra) # 80206bfa <consputc>
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
    80200454:	0000b797          	auipc	a5,0xb
    80200458:	60c7b783          	ld	a5,1548(a5) # 8020ba60 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80200544:	52053503          	ld	a0,1312(a0) # 8020ba60 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80200a12:	ce0080e7          	jalr	-800(ra) # 802026ee <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a16:	00006097          	auipc	ra,0x6
    80200a1a:	fa2080e7          	jalr	-94(ra) # 802069b8 <plicinithart>
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
    80200a36:	00006097          	auipc	ra,0x6
    80200a3a:	394080e7          	jalr	916(ra) # 80206dca <consoleinit>
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
    80200a66:	00004097          	auipc	ra,0x4
    80200a6a:	508080e7          	jalr	1288(ra) # 80204f6e <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200a6e:	00002097          	auipc	ra,0x2
    80200a72:	c80080e7          	jalr	-896(ra) # 802026ee <trapinithart>
    procinit();
    80200a76:	00001097          	auipc	ra,0x1
    80200a7a:	f24080e7          	jalr	-220(ra) # 8020199a <procinit>
    plicinit();
    80200a7e:	00006097          	auipc	ra,0x6
    80200a82:	f22080e7          	jalr	-222(ra) # 802069a0 <plicinit>
    plicinithart();
    80200a86:	00006097          	auipc	ra,0x6
    80200a8a:	f32080e7          	jalr	-206(ra) # 802069b8 <plicinithart>
    disk_init();
    80200a8e:	00004097          	auipc	ra,0x4
    80200a92:	57c080e7          	jalr	1404(ra) # 8020500a <disk_init>
    binit();         // buffer cache
    80200a96:	00003097          	auipc	ra,0x3
    80200a9a:	89c080e7          	jalr	-1892(ra) # 80203332 <binit>
    fileinit();      // file table
    80200a9e:	00003097          	auipc	ra,0x3
    80200aa2:	ca0080e7          	jalr	-864(ra) # 8020373e <fileinit>
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
    80200dc8:	c944b483          	ld	s1,-876(s1) # 8020ba58 <_GLOBAL_OFFSET_TABLE_+0x20>
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
    80200e04:	c405b583          	ld	a1,-960(a1) # 8020ba40 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80201a9c:	c92080e7          	jalr	-878(ra) # 8020272a <usertrapret>
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
    80201ab6:	c42080e7          	jalr	-958(ra) # 802056f4 <fat32_init>
    myproc()->cwd = ename("/");
    80201aba:	00000097          	auipc	ra,0x0
    80201abe:	f82080e7          	jalr	-126(ra) # 80201a3c <myproc>
    80201ac2:	84aa                	mv	s1,a0
    80201ac4:	00008517          	auipc	a0,0x8
    80201ac8:	b6c50513          	addi	a0,a0,-1172 # 80209630 <digits+0x2b0>
    80201acc:	00005097          	auipc	ra,0x5
    80201ad0:	e9a080e7          	jalr	-358(ra) # 80206966 <ename>
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
    80201b40:	f046b683          	ld	a3,-252(a3) # 8020ba40 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80201d6a:	c8090693          	addi	a3,s2,-896 # c80 <_entry-0x801ff380>
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
    80201f02:	902080e7          	jalr	-1790(ra) # 80203800 <filedup>
    80201f06:	00a93023          	sd	a0,0(s2)
    80201f0a:	b7e5                	j	80201ef2 <fork+0xb0>
  np->cwd = edup(p->cwd);
    80201f0c:	158ab503          	ld	a0,344(s5)
    80201f10:	00004097          	auipc	ra,0x4
    80201f14:	050080e7          	jalr	80(ra) # 80205f60 <edup>
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
    8020200c:	a78bbb83          	ld	s7,-1416(s7) # 8020ba80 <_GLOBAL_OFFSET_TABLE_+0x48>
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
    80202052:	00000097          	auipc	ra,0x0
    80202056:	632080e7          	jalr	1586(ra) # 80202684 <swtch>
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
    80202122:	566080e7          	jalr	1382(ra) # 80202684 <swtch>
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
    panic("init exiting");
    802021d4:	00007517          	auipc	a0,0x7
    802021d8:	4bc50513          	addi	a0,a0,1212 # 80209690 <digits+0x310>
    802021dc:	ffffe097          	auipc	ra,0xffffe
    802021e0:	f68080e7          	jalr	-152(ra) # 80200144 <panic>
      fileclose(f);
    802021e4:	00001097          	auipc	ra,0x1
    802021e8:	66e080e7          	jalr	1646(ra) # 80203852 <fileclose>
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
    80202200:	00004097          	auipc	ra,0x4
    80202204:	042080e7          	jalr	66(ra) # 80206242 <eput>
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
    802025f4:	698b8b93          	addi	s7,s7,1688 # 8020ac88 <states.0>
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

0000000080202684 <swtch>:
    80202684:	00153023          	sd	ra,0(a0)
    80202688:	00253423          	sd	sp,8(a0)
    8020268c:	e900                	sd	s0,16(a0)
    8020268e:	ed04                	sd	s1,24(a0)
    80202690:	03253023          	sd	s2,32(a0)
    80202694:	03353423          	sd	s3,40(a0)
    80202698:	03453823          	sd	s4,48(a0)
    8020269c:	03553c23          	sd	s5,56(a0)
    802026a0:	05653023          	sd	s6,64(a0)
    802026a4:	05753423          	sd	s7,72(a0)
    802026a8:	05853823          	sd	s8,80(a0)
    802026ac:	05953c23          	sd	s9,88(a0)
    802026b0:	07a53023          	sd	s10,96(a0)
    802026b4:	07b53423          	sd	s11,104(a0)
    802026b8:	0005b083          	ld	ra,0(a1)
    802026bc:	0085b103          	ld	sp,8(a1)
    802026c0:	6980                	ld	s0,16(a1)
    802026c2:	6d84                	ld	s1,24(a1)
    802026c4:	0205b903          	ld	s2,32(a1)
    802026c8:	0285b983          	ld	s3,40(a1)
    802026cc:	0305ba03          	ld	s4,48(a1)
    802026d0:	0385ba83          	ld	s5,56(a1)
    802026d4:	0405bb03          	ld	s6,64(a1)
    802026d8:	0485bb83          	ld	s7,72(a1)
    802026dc:	0505bc03          	ld	s8,80(a1)
    802026e0:	0585bc83          	ld	s9,88(a1)
    802026e4:	0605bd03          	ld	s10,96(a1)
    802026e8:	0685bd83          	ld	s11,104(a1)
    802026ec:	8082                	ret

00000000802026ee <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    802026ee:	1141                	addi	sp,sp,-16
    802026f0:	e406                	sd	ra,8(sp)
    802026f2:	e022                	sd	s0,0(sp)
    802026f4:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    802026f6:	00009797          	auipc	a5,0x9
    802026fa:	35a7b783          	ld	a5,858(a5) # 8020ba50 <_GLOBAL_OFFSET_TABLE_+0x18>
    802026fe:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202702:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202706:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020270a:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    8020270e:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    80202712:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    80202716:	10479073          	csrw	sie,a5
  set_next_timeout();
    8020271a:	00003097          	auipc	ra,0x3
    8020271e:	87c080e7          	jalr	-1924(ra) # 80204f96 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
  #endif
}
    80202722:	60a2                	ld	ra,8(sp)
    80202724:	6402                	ld	s0,0(sp)
    80202726:	0141                	addi	sp,sp,16
    80202728:	8082                	ret

000000008020272a <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    8020272a:	1141                	addi	sp,sp,-16
    8020272c:	e406                	sd	ra,8(sp)
    8020272e:	e022                	sd	s0,0(sp)
    80202730:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    80202732:	fffff097          	auipc	ra,0xfffff
    80202736:	30a080e7          	jalr	778(ra) # 80201a3c <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020273a:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    8020273e:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202740:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80202744:	00009697          	auipc	a3,0x9
    80202748:	2fc6b683          	ld	a3,764(a3) # 8020ba40 <_GLOBAL_OFFSET_TABLE_+0x8>
    8020274c:	00009717          	auipc	a4,0x9
    80202750:	32473703          	ld	a4,804(a4) # 8020ba70 <_GLOBAL_OFFSET_TABLE_+0x38>
    80202754:	8f15                	sub	a4,a4,a3
    80202756:	040007b7          	lui	a5,0x4000
    8020275a:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c200001>
    8020275c:	07b2                	slli	a5,a5,0xc
    8020275e:	973e                	add	a4,a4,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202760:	10571073          	csrw	stvec,a4

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80202764:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    80202766:	18002673          	csrr	a2,satp
    8020276a:	e310                	sd	a2,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    8020276c:	7130                	ld	a2,96(a0)
    8020276e:	6138                	ld	a4,64(a0)
    80202770:	6585                	lui	a1,0x1
    80202772:	972e                	add	a4,a4,a1
    80202774:	e618                	sd	a4,8(a2)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80202776:	7138                	ld	a4,96(a0)
    80202778:	00000617          	auipc	a2,0x0
    8020277c:	0f460613          	addi	a2,a2,244 # 8020286c <usertrap>
    80202780:	eb10                	sd	a2,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80202782:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    80202784:	8612                	mv	a2,tp
    80202786:	f310                	sd	a2,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202788:	10002773          	csrr	a4,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    8020278c:	eff77713          	andi	a4,a4,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80202790:	02076713          	ori	a4,a4,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202794:	10071073          	csrw	sstatus,a4
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80202798:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    8020279a:	6f18                	ld	a4,24(a4)
    8020279c:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    802027a0:	692c                	ld	a1,80(a0)
    802027a2:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    802027a4:	00009717          	auipc	a4,0x9
    802027a8:	2a473703          	ld	a4,676(a4) # 8020ba48 <_GLOBAL_OFFSET_TABLE_+0x10>
    802027ac:	8f15                	sub	a4,a4,a3
    802027ae:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    802027b0:	577d                	li	a4,-1
    802027b2:	177e                	slli	a4,a4,0x3f
    802027b4:	8dd9                	or	a1,a1,a4
    802027b6:	02000537          	lui	a0,0x2000
    802027ba:	157d                	addi	a0,a0,-1 # 1ffffff <_entry-0x7e200001>
    802027bc:	0536                	slli	a0,a0,0xd
    802027be:	9782                	jalr	a5
}
    802027c0:	60a2                	ld	ra,8(sp)
    802027c2:	6402                	ld	s0,0(sp)
    802027c4:	0141                	addi	sp,sp,16
    802027c6:	8082                	ret

00000000802027c8 <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    802027c8:	1101                	addi	sp,sp,-32
    802027ca:	ec06                	sd	ra,24(sp)
    802027cc:	e822                	sd	s0,16(sp)
    802027ce:	e426                	sd	s1,8(sp)
    802027d0:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    802027d2:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    802027d6:	00074d63          	bltz	a4,802027f0 <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    802027da:	57fd                	li	a5,-1
    802027dc:	17fe                	slli	a5,a5,0x3f
    802027de:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    802027e0:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    802027e2:	06f70f63          	beq	a4,a5,80202860 <devintr+0x98>
}
    802027e6:	60e2                	ld	ra,24(sp)
    802027e8:	6442                	ld	s0,16(sp)
    802027ea:	64a2                	ld	s1,8(sp)
    802027ec:	6105                	addi	sp,sp,32
    802027ee:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    802027f0:	0ff77793          	zext.b	a5,a4
    802027f4:	46a5                	li	a3,9
    802027f6:	fed792e3          	bne	a5,a3,802027da <devintr+0x12>
		int irq = plic_claim();
    802027fa:	00004097          	auipc	ra,0x4
    802027fe:	200080e7          	jalr	512(ra) # 802069fa <plic_claim>
    80202802:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    80202804:	47a9                	li	a5,10
    80202806:	02f50163          	beq	a0,a5,80202828 <devintr+0x60>
		else if (DISK_IRQ == irq) {
    8020280a:	4785                	li	a5,1
    8020280c:	04f50563          	beq	a0,a5,80202856 <devintr+0x8e>
		return 1;
    80202810:	4505                	li	a0,1
		else if (irq) {
    80202812:	d8f1                	beqz	s1,802027e6 <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    80202814:	85a6                	mv	a1,s1
    80202816:	00007517          	auipc	a0,0x7
    8020281a:	ef250513          	addi	a0,a0,-270 # 80209708 <digits+0x388>
    8020281e:	ffffe097          	auipc	ra,0xffffe
    80202822:	970080e7          	jalr	-1680(ra) # 8020018e <printf>
    80202826:	a821                	j	8020283e <devintr+0x76>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    80202828:	4501                	li	a0,0
    8020282a:	4581                	li	a1,0
    8020282c:	4601                	li	a2,0
    8020282e:	4681                	li	a3,0
    80202830:	4889                	li	a7,2
    80202832:	00000073          	ecall
    80202836:	2501                	sext.w	a0,a0
			if (-1 != c) {
    80202838:	57fd                	li	a5,-1
    8020283a:	00f51963          	bne	a0,a5,8020284c <devintr+0x84>
		if (irq) { plic_complete(irq);}
    8020283e:	8526                	mv	a0,s1
    80202840:	00004097          	auipc	ra,0x4
    80202844:	1e4080e7          	jalr	484(ra) # 80206a24 <plic_complete>
		return 1;
    80202848:	4505                	li	a0,1
    8020284a:	bf71                	j	802027e6 <devintr+0x1e>
				consoleintr(c);
    8020284c:	00004097          	auipc	ra,0x4
    80202850:	3ec080e7          	jalr	1004(ra) # 80206c38 <consoleintr>
    80202854:	b7ed                	j	8020283e <devintr+0x76>
			disk_intr();
    80202856:	00003097          	auipc	ra,0x3
    8020285a:	800080e7          	jalr	-2048(ra) # 80205056 <disk_intr>
    8020285e:	b7c5                	j	8020283e <devintr+0x76>
		timer_tick();
    80202860:	00002097          	auipc	ra,0x2
    80202864:	75c080e7          	jalr	1884(ra) # 80204fbc <timer_tick>
		return 2;
    80202868:	4509                	li	a0,2
    8020286a:	bfb5                	j	802027e6 <devintr+0x1e>

000000008020286c <usertrap>:
{
    8020286c:	1101                	addi	sp,sp,-32
    8020286e:	ec06                	sd	ra,24(sp)
    80202870:	e822                	sd	s0,16(sp)
    80202872:	e426                	sd	s1,8(sp)
    80202874:	e04a                	sd	s2,0(sp)
    80202876:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202878:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    8020287c:	1007f793          	andi	a5,a5,256
    80202880:	e3ad                	bnez	a5,802028e2 <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202882:	00009797          	auipc	a5,0x9
    80202886:	1ce7b783          	ld	a5,462(a5) # 8020ba50 <_GLOBAL_OFFSET_TABLE_+0x18>
    8020288a:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    8020288e:	fffff097          	auipc	ra,0xfffff
    80202892:	1ae080e7          	jalr	430(ra) # 80201a3c <myproc>
    80202896:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    80202898:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    8020289a:	14102773          	csrr	a4,sepc
    8020289e:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    802028a0:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    802028a4:	47a1                	li	a5,8
    802028a6:	04f71c63          	bne	a4,a5,802028fe <usertrap+0x92>
    if(p->killed)
    802028aa:	591c                	lw	a5,48(a0)
    802028ac:	e3b9                	bnez	a5,802028f2 <usertrap+0x86>
    p->trapframe->epc += 4;
    802028ae:	70b8                	ld	a4,96(s1)
    802028b0:	6f1c                	ld	a5,24(a4)
    802028b2:	0791                	addi	a5,a5,4
    802028b4:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802028b6:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802028ba:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802028be:	10079073          	csrw	sstatus,a5
    syscall();
    802028c2:	00000097          	auipc	ra,0x0
    802028c6:	5d4080e7          	jalr	1492(ra) # 80202e96 <syscall>
  if(p->killed)
    802028ca:	589c                	lw	a5,48(s1)
    802028cc:	ebd1                	bnez	a5,80202960 <usertrap+0xf4>
  usertrapret();
    802028ce:	00000097          	auipc	ra,0x0
    802028d2:	e5c080e7          	jalr	-420(ra) # 8020272a <usertrapret>
}
    802028d6:	60e2                	ld	ra,24(sp)
    802028d8:	6442                	ld	s0,16(sp)
    802028da:	64a2                	ld	s1,8(sp)
    802028dc:	6902                	ld	s2,0(sp)
    802028de:	6105                	addi	sp,sp,32
    802028e0:	8082                	ret
    panic("usertrap: not from user mode");
    802028e2:	00007517          	auipc	a0,0x7
    802028e6:	e4650513          	addi	a0,a0,-442 # 80209728 <digits+0x3a8>
    802028ea:	ffffe097          	auipc	ra,0xffffe
    802028ee:	85a080e7          	jalr	-1958(ra) # 80200144 <panic>
      exit(-1);
    802028f2:	557d                	li	a0,-1
    802028f4:	00000097          	auipc	ra,0x0
    802028f8:	88c080e7          	jalr	-1908(ra) # 80202180 <exit>
    802028fc:	bf4d                	j	802028ae <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    802028fe:	00000097          	auipc	ra,0x0
    80202902:	eca080e7          	jalr	-310(ra) # 802027c8 <devintr>
    80202906:	892a                	mv	s2,a0
    80202908:	c501                	beqz	a0,80202910 <usertrap+0xa4>
  if(p->killed)
    8020290a:	589c                	lw	a5,48(s1)
    8020290c:	c3b1                	beqz	a5,80202950 <usertrap+0xe4>
    8020290e:	a825                	j	80202946 <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202910:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    80202914:	16048693          	addi	a3,s1,352
    80202918:	5c90                	lw	a2,56(s1)
    8020291a:	00007517          	auipc	a0,0x7
    8020291e:	e2e50513          	addi	a0,a0,-466 # 80209748 <digits+0x3c8>
    80202922:	ffffe097          	auipc	ra,0xffffe
    80202926:	86c080e7          	jalr	-1940(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    8020292a:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    8020292e:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202932:	00007517          	auipc	a0,0x7
    80202936:	e4650513          	addi	a0,a0,-442 # 80209778 <digits+0x3f8>
    8020293a:	ffffe097          	auipc	ra,0xffffe
    8020293e:	854080e7          	jalr	-1964(ra) # 8020018e <printf>
    p->killed = 1;
    80202942:	4785                	li	a5,1
    80202944:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202946:	557d                	li	a0,-1
    80202948:	00000097          	auipc	ra,0x0
    8020294c:	838080e7          	jalr	-1992(ra) # 80202180 <exit>
  if(which_dev == 2)
    80202950:	4789                	li	a5,2
    80202952:	f6f91ee3          	bne	s2,a5,802028ce <usertrap+0x62>
    yield();
    80202956:	00000097          	auipc	ra,0x0
    8020295a:	94e080e7          	jalr	-1714(ra) # 802022a4 <yield>
    8020295e:	bf85                	j	802028ce <usertrap+0x62>
  int which_dev = 0;
    80202960:	4901                	li	s2,0
    80202962:	b7d5                	j	80202946 <usertrap+0xda>

0000000080202964 <kerneltrap>:
kerneltrap() {
    80202964:	7179                	addi	sp,sp,-48
    80202966:	f406                	sd	ra,40(sp)
    80202968:	f022                	sd	s0,32(sp)
    8020296a:	ec26                	sd	s1,24(sp)
    8020296c:	e84a                	sd	s2,16(sp)
    8020296e:	e44e                	sd	s3,8(sp)
    80202970:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202972:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202976:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    8020297a:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    8020297e:	1004f793          	andi	a5,s1,256
    80202982:	cb85                	beqz	a5,802029b2 <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202984:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202988:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    8020298a:	ef85                	bnez	a5,802029c2 <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    8020298c:	00000097          	auipc	ra,0x0
    80202990:	e3c080e7          	jalr	-452(ra) # 802027c8 <devintr>
    80202994:	cd1d                	beqz	a0,802029d2 <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202996:	4789                	li	a5,2
    80202998:	08f50b63          	beq	a0,a5,80202a2e <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    8020299c:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802029a0:	10049073          	csrw	sstatus,s1
}
    802029a4:	70a2                	ld	ra,40(sp)
    802029a6:	7402                	ld	s0,32(sp)
    802029a8:	64e2                	ld	s1,24(sp)
    802029aa:	6942                	ld	s2,16(sp)
    802029ac:	69a2                	ld	s3,8(sp)
    802029ae:	6145                	addi	sp,sp,48
    802029b0:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    802029b2:	00007517          	auipc	a0,0x7
    802029b6:	de650513          	addi	a0,a0,-538 # 80209798 <digits+0x418>
    802029ba:	ffffd097          	auipc	ra,0xffffd
    802029be:	78a080e7          	jalr	1930(ra) # 80200144 <panic>
    panic("kerneltrap: interrupts enabled");
    802029c2:	00007517          	auipc	a0,0x7
    802029c6:	dfe50513          	addi	a0,a0,-514 # 802097c0 <digits+0x440>
    802029ca:	ffffd097          	auipc	ra,0xffffd
    802029ce:	77a080e7          	jalr	1914(ra) # 80200144 <panic>
    printf("\nscause %p\n", scause);
    802029d2:	85ce                	mv	a1,s3
    802029d4:	00007517          	auipc	a0,0x7
    802029d8:	e0c50513          	addi	a0,a0,-500 # 802097e0 <digits+0x460>
    802029dc:	ffffd097          	auipc	ra,0xffffd
    802029e0:	7b2080e7          	jalr	1970(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    802029e4:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    802029e8:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    802029ec:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    802029ee:	00007517          	auipc	a0,0x7
    802029f2:	e0250513          	addi	a0,a0,-510 # 802097f0 <digits+0x470>
    802029f6:	ffffd097          	auipc	ra,0xffffd
    802029fa:	798080e7          	jalr	1944(ra) # 8020018e <printf>
    struct proc *p = myproc();
    802029fe:	fffff097          	auipc	ra,0xfffff
    80202a02:	03e080e7          	jalr	62(ra) # 80201a3c <myproc>
    if (p != 0) {
    80202a06:	cd01                	beqz	a0,80202a1e <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202a08:	16050613          	addi	a2,a0,352
    80202a0c:	5d0c                	lw	a1,56(a0)
    80202a0e:	00007517          	auipc	a0,0x7
    80202a12:	e0250513          	addi	a0,a0,-510 # 80209810 <digits+0x490>
    80202a16:	ffffd097          	auipc	ra,0xffffd
    80202a1a:	778080e7          	jalr	1912(ra) # 8020018e <printf>
    panic("kerneltrap");
    80202a1e:	00007517          	auipc	a0,0x7
    80202a22:	e0a50513          	addi	a0,a0,-502 # 80209828 <digits+0x4a8>
    80202a26:	ffffd097          	auipc	ra,0xffffd
    80202a2a:	71e080e7          	jalr	1822(ra) # 80200144 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202a2e:	fffff097          	auipc	ra,0xfffff
    80202a32:	00e080e7          	jalr	14(ra) # 80201a3c <myproc>
    80202a36:	d13d                	beqz	a0,8020299c <kerneltrap+0x38>
    80202a38:	fffff097          	auipc	ra,0xfffff
    80202a3c:	004080e7          	jalr	4(ra) # 80201a3c <myproc>
    80202a40:	4d18                	lw	a4,24(a0)
    80202a42:	478d                	li	a5,3
    80202a44:	f4f71ce3          	bne	a4,a5,8020299c <kerneltrap+0x38>
    yield();
    80202a48:	00000097          	auipc	ra,0x0
    80202a4c:	85c080e7          	jalr	-1956(ra) # 802022a4 <yield>
    80202a50:	b7b1                	j	8020299c <kerneltrap+0x38>

0000000080202a52 <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202a52:	1101                	addi	sp,sp,-32
    80202a54:	ec06                	sd	ra,24(sp)
    80202a56:	e822                	sd	s0,16(sp)
    80202a58:	e426                	sd	s1,8(sp)
    80202a5a:	1000                	addi	s0,sp,32
    80202a5c:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202a5e:	792c                	ld	a1,112(a0)
    80202a60:	00007517          	auipc	a0,0x7
    80202a64:	dd850513          	addi	a0,a0,-552 # 80209838 <digits+0x4b8>
    80202a68:	ffffd097          	auipc	ra,0xffffd
    80202a6c:	726080e7          	jalr	1830(ra) # 8020018e <printf>
  printf("a1: %p\t", tf->a1);
    80202a70:	7cac                	ld	a1,120(s1)
    80202a72:	00007517          	auipc	a0,0x7
    80202a76:	dce50513          	addi	a0,a0,-562 # 80209840 <digits+0x4c0>
    80202a7a:	ffffd097          	auipc	ra,0xffffd
    80202a7e:	714080e7          	jalr	1812(ra) # 8020018e <printf>
  printf("a2: %p\t", tf->a2);
    80202a82:	60cc                	ld	a1,128(s1)
    80202a84:	00007517          	auipc	a0,0x7
    80202a88:	dc450513          	addi	a0,a0,-572 # 80209848 <digits+0x4c8>
    80202a8c:	ffffd097          	auipc	ra,0xffffd
    80202a90:	702080e7          	jalr	1794(ra) # 8020018e <printf>
  printf("a3: %p\n", tf->a3);
    80202a94:	64cc                	ld	a1,136(s1)
    80202a96:	00007517          	auipc	a0,0x7
    80202a9a:	dba50513          	addi	a0,a0,-582 # 80209850 <digits+0x4d0>
    80202a9e:	ffffd097          	auipc	ra,0xffffd
    80202aa2:	6f0080e7          	jalr	1776(ra) # 8020018e <printf>
  printf("a4: %p\t", tf->a4);
    80202aa6:	68cc                	ld	a1,144(s1)
    80202aa8:	00007517          	auipc	a0,0x7
    80202aac:	db050513          	addi	a0,a0,-592 # 80209858 <digits+0x4d8>
    80202ab0:	ffffd097          	auipc	ra,0xffffd
    80202ab4:	6de080e7          	jalr	1758(ra) # 8020018e <printf>
  printf("a5: %p\t", tf->a5);
    80202ab8:	6ccc                	ld	a1,152(s1)
    80202aba:	00007517          	auipc	a0,0x7
    80202abe:	da650513          	addi	a0,a0,-602 # 80209860 <digits+0x4e0>
    80202ac2:	ffffd097          	auipc	ra,0xffffd
    80202ac6:	6cc080e7          	jalr	1740(ra) # 8020018e <printf>
  printf("a6: %p\t", tf->a6);
    80202aca:	70cc                	ld	a1,160(s1)
    80202acc:	00007517          	auipc	a0,0x7
    80202ad0:	d9c50513          	addi	a0,a0,-612 # 80209868 <digits+0x4e8>
    80202ad4:	ffffd097          	auipc	ra,0xffffd
    80202ad8:	6ba080e7          	jalr	1722(ra) # 8020018e <printf>
  printf("a7: %p\n", tf->a7);
    80202adc:	74cc                	ld	a1,168(s1)
    80202ade:	00007517          	auipc	a0,0x7
    80202ae2:	d9250513          	addi	a0,a0,-622 # 80209870 <digits+0x4f0>
    80202ae6:	ffffd097          	auipc	ra,0xffffd
    80202aea:	6a8080e7          	jalr	1704(ra) # 8020018e <printf>
  printf("t0: %p\t", tf->t0);
    80202aee:	64ac                	ld	a1,72(s1)
    80202af0:	00007517          	auipc	a0,0x7
    80202af4:	d8850513          	addi	a0,a0,-632 # 80209878 <digits+0x4f8>
    80202af8:	ffffd097          	auipc	ra,0xffffd
    80202afc:	696080e7          	jalr	1686(ra) # 8020018e <printf>
  printf("t1: %p\t", tf->t1);
    80202b00:	68ac                	ld	a1,80(s1)
    80202b02:	00007517          	auipc	a0,0x7
    80202b06:	d7e50513          	addi	a0,a0,-642 # 80209880 <digits+0x500>
    80202b0a:	ffffd097          	auipc	ra,0xffffd
    80202b0e:	684080e7          	jalr	1668(ra) # 8020018e <printf>
  printf("t2: %p\t", tf->t2);
    80202b12:	6cac                	ld	a1,88(s1)
    80202b14:	00007517          	auipc	a0,0x7
    80202b18:	d7450513          	addi	a0,a0,-652 # 80209888 <digits+0x508>
    80202b1c:	ffffd097          	auipc	ra,0xffffd
    80202b20:	672080e7          	jalr	1650(ra) # 8020018e <printf>
  printf("t3: %p\n", tf->t3);
    80202b24:	1004b583          	ld	a1,256(s1)
    80202b28:	00007517          	auipc	a0,0x7
    80202b2c:	d6850513          	addi	a0,a0,-664 # 80209890 <digits+0x510>
    80202b30:	ffffd097          	auipc	ra,0xffffd
    80202b34:	65e080e7          	jalr	1630(ra) # 8020018e <printf>
  printf("t4: %p\t", tf->t4);
    80202b38:	1084b583          	ld	a1,264(s1)
    80202b3c:	00007517          	auipc	a0,0x7
    80202b40:	d5c50513          	addi	a0,a0,-676 # 80209898 <digits+0x518>
    80202b44:	ffffd097          	auipc	ra,0xffffd
    80202b48:	64a080e7          	jalr	1610(ra) # 8020018e <printf>
  printf("t5: %p\t", tf->t5);
    80202b4c:	1104b583          	ld	a1,272(s1)
    80202b50:	00007517          	auipc	a0,0x7
    80202b54:	d5050513          	addi	a0,a0,-688 # 802098a0 <digits+0x520>
    80202b58:	ffffd097          	auipc	ra,0xffffd
    80202b5c:	636080e7          	jalr	1590(ra) # 8020018e <printf>
  printf("t6: %p\t", tf->t6);
    80202b60:	1184b583          	ld	a1,280(s1)
    80202b64:	00007517          	auipc	a0,0x7
    80202b68:	d4450513          	addi	a0,a0,-700 # 802098a8 <digits+0x528>
    80202b6c:	ffffd097          	auipc	ra,0xffffd
    80202b70:	622080e7          	jalr	1570(ra) # 8020018e <printf>
  printf("s0: %p\n", tf->s0);
    80202b74:	70ac                	ld	a1,96(s1)
    80202b76:	00007517          	auipc	a0,0x7
    80202b7a:	d3a50513          	addi	a0,a0,-710 # 802098b0 <digits+0x530>
    80202b7e:	ffffd097          	auipc	ra,0xffffd
    80202b82:	610080e7          	jalr	1552(ra) # 8020018e <printf>
  printf("s1: %p\t", tf->s1);
    80202b86:	74ac                	ld	a1,104(s1)
    80202b88:	00007517          	auipc	a0,0x7
    80202b8c:	d3050513          	addi	a0,a0,-720 # 802098b8 <digits+0x538>
    80202b90:	ffffd097          	auipc	ra,0xffffd
    80202b94:	5fe080e7          	jalr	1534(ra) # 8020018e <printf>
  printf("s2: %p\t", tf->s2);
    80202b98:	78cc                	ld	a1,176(s1)
    80202b9a:	00007517          	auipc	a0,0x7
    80202b9e:	d2650513          	addi	a0,a0,-730 # 802098c0 <digits+0x540>
    80202ba2:	ffffd097          	auipc	ra,0xffffd
    80202ba6:	5ec080e7          	jalr	1516(ra) # 8020018e <printf>
  printf("s3: %p\t", tf->s3);
    80202baa:	7ccc                	ld	a1,184(s1)
    80202bac:	00007517          	auipc	a0,0x7
    80202bb0:	d1c50513          	addi	a0,a0,-740 # 802098c8 <digits+0x548>
    80202bb4:	ffffd097          	auipc	ra,0xffffd
    80202bb8:	5da080e7          	jalr	1498(ra) # 8020018e <printf>
  printf("s4: %p\n", tf->s4);
    80202bbc:	60ec                	ld	a1,192(s1)
    80202bbe:	00007517          	auipc	a0,0x7
    80202bc2:	d1250513          	addi	a0,a0,-750 # 802098d0 <digits+0x550>
    80202bc6:	ffffd097          	auipc	ra,0xffffd
    80202bca:	5c8080e7          	jalr	1480(ra) # 8020018e <printf>
  printf("s5: %p\t", tf->s5);
    80202bce:	64ec                	ld	a1,200(s1)
    80202bd0:	00007517          	auipc	a0,0x7
    80202bd4:	d0850513          	addi	a0,a0,-760 # 802098d8 <digits+0x558>
    80202bd8:	ffffd097          	auipc	ra,0xffffd
    80202bdc:	5b6080e7          	jalr	1462(ra) # 8020018e <printf>
  printf("s6: %p\t", tf->s6);
    80202be0:	68ec                	ld	a1,208(s1)
    80202be2:	00007517          	auipc	a0,0x7
    80202be6:	cfe50513          	addi	a0,a0,-770 # 802098e0 <digits+0x560>
    80202bea:	ffffd097          	auipc	ra,0xffffd
    80202bee:	5a4080e7          	jalr	1444(ra) # 8020018e <printf>
  printf("s7: %p\t", tf->s7);
    80202bf2:	6cec                	ld	a1,216(s1)
    80202bf4:	00007517          	auipc	a0,0x7
    80202bf8:	cf450513          	addi	a0,a0,-780 # 802098e8 <digits+0x568>
    80202bfc:	ffffd097          	auipc	ra,0xffffd
    80202c00:	592080e7          	jalr	1426(ra) # 8020018e <printf>
  printf("s8: %p\n", tf->s8);
    80202c04:	70ec                	ld	a1,224(s1)
    80202c06:	00007517          	auipc	a0,0x7
    80202c0a:	cea50513          	addi	a0,a0,-790 # 802098f0 <digits+0x570>
    80202c0e:	ffffd097          	auipc	ra,0xffffd
    80202c12:	580080e7          	jalr	1408(ra) # 8020018e <printf>
  printf("s9: %p\t", tf->s9);
    80202c16:	74ec                	ld	a1,232(s1)
    80202c18:	00007517          	auipc	a0,0x7
    80202c1c:	ce050513          	addi	a0,a0,-800 # 802098f8 <digits+0x578>
    80202c20:	ffffd097          	auipc	ra,0xffffd
    80202c24:	56e080e7          	jalr	1390(ra) # 8020018e <printf>
  printf("s10: %p\t", tf->s10);
    80202c28:	78ec                	ld	a1,240(s1)
    80202c2a:	00007517          	auipc	a0,0x7
    80202c2e:	cd650513          	addi	a0,a0,-810 # 80209900 <digits+0x580>
    80202c32:	ffffd097          	auipc	ra,0xffffd
    80202c36:	55c080e7          	jalr	1372(ra) # 8020018e <printf>
  printf("s11: %p\t", tf->s11);
    80202c3a:	7cec                	ld	a1,248(s1)
    80202c3c:	00007517          	auipc	a0,0x7
    80202c40:	cd450513          	addi	a0,a0,-812 # 80209910 <digits+0x590>
    80202c44:	ffffd097          	auipc	ra,0xffffd
    80202c48:	54a080e7          	jalr	1354(ra) # 8020018e <printf>
  printf("ra: %p\n", tf->ra);
    80202c4c:	748c                	ld	a1,40(s1)
    80202c4e:	00007517          	auipc	a0,0x7
    80202c52:	9c250513          	addi	a0,a0,-1598 # 80209610 <digits+0x290>
    80202c56:	ffffd097          	auipc	ra,0xffffd
    80202c5a:	538080e7          	jalr	1336(ra) # 8020018e <printf>
  printf("sp: %p\t", tf->sp);
    80202c5e:	788c                	ld	a1,48(s1)
    80202c60:	00007517          	auipc	a0,0x7
    80202c64:	cc050513          	addi	a0,a0,-832 # 80209920 <digits+0x5a0>
    80202c68:	ffffd097          	auipc	ra,0xffffd
    80202c6c:	526080e7          	jalr	1318(ra) # 8020018e <printf>
  printf("gp: %p\t", tf->gp);
    80202c70:	7c8c                	ld	a1,56(s1)
    80202c72:	00007517          	auipc	a0,0x7
    80202c76:	cb650513          	addi	a0,a0,-842 # 80209928 <digits+0x5a8>
    80202c7a:	ffffd097          	auipc	ra,0xffffd
    80202c7e:	514080e7          	jalr	1300(ra) # 8020018e <printf>
  printf("tp: %p\t", tf->tp);
    80202c82:	60ac                	ld	a1,64(s1)
    80202c84:	00007517          	auipc	a0,0x7
    80202c88:	cac50513          	addi	a0,a0,-852 # 80209930 <digits+0x5b0>
    80202c8c:	ffffd097          	auipc	ra,0xffffd
    80202c90:	502080e7          	jalr	1282(ra) # 8020018e <printf>
  printf("epc: %p\n", tf->epc);
    80202c94:	6c8c                	ld	a1,24(s1)
    80202c96:	00007517          	auipc	a0,0x7
    80202c9a:	ca250513          	addi	a0,a0,-862 # 80209938 <digits+0x5b8>
    80202c9e:	ffffd097          	auipc	ra,0xffffd
    80202ca2:	4f0080e7          	jalr	1264(ra) # 8020018e <printf>
}
    80202ca6:	60e2                	ld	ra,24(sp)
    80202ca8:	6442                	ld	s0,16(sp)
    80202caa:	64a2                	ld	s1,8(sp)
    80202cac:	6105                	addi	sp,sp,32
    80202cae:	8082                	ret

0000000080202cb0 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202cb0:	1101                	addi	sp,sp,-32
    80202cb2:	ec06                	sd	ra,24(sp)
    80202cb4:	e822                	sd	s0,16(sp)
    80202cb6:	e426                	sd	s1,8(sp)
    80202cb8:	1000                	addi	s0,sp,32
    80202cba:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202cbc:	fffff097          	auipc	ra,0xfffff
    80202cc0:	d80080e7          	jalr	-640(ra) # 80201a3c <myproc>
  switch (n) {
    80202cc4:	4795                	li	a5,5
    80202cc6:	0497e163          	bltu	a5,s1,80202d08 <argraw+0x58>
    80202cca:	048a                	slli	s1,s1,0x2
    80202ccc:	00007717          	auipc	a4,0x7
    80202cd0:	dd870713          	addi	a4,a4,-552 # 80209aa4 <digits+0x724>
    80202cd4:	94ba                	add	s1,s1,a4
    80202cd6:	409c                	lw	a5,0(s1)
    80202cd8:	97ba                	add	a5,a5,a4
    80202cda:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202cdc:	713c                	ld	a5,96(a0)
    80202cde:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202ce0:	60e2                	ld	ra,24(sp)
    80202ce2:	6442                	ld	s0,16(sp)
    80202ce4:	64a2                	ld	s1,8(sp)
    80202ce6:	6105                	addi	sp,sp,32
    80202ce8:	8082                	ret
    return p->trapframe->a1;
    80202cea:	713c                	ld	a5,96(a0)
    80202cec:	7fa8                	ld	a0,120(a5)
    80202cee:	bfcd                	j	80202ce0 <argraw+0x30>
    return p->trapframe->a2;
    80202cf0:	713c                	ld	a5,96(a0)
    80202cf2:	63c8                	ld	a0,128(a5)
    80202cf4:	b7f5                	j	80202ce0 <argraw+0x30>
    return p->trapframe->a3;
    80202cf6:	713c                	ld	a5,96(a0)
    80202cf8:	67c8                	ld	a0,136(a5)
    80202cfa:	b7dd                	j	80202ce0 <argraw+0x30>
    return p->trapframe->a4;
    80202cfc:	713c                	ld	a5,96(a0)
    80202cfe:	6bc8                	ld	a0,144(a5)
    80202d00:	b7c5                	j	80202ce0 <argraw+0x30>
    return p->trapframe->a5;
    80202d02:	713c                	ld	a5,96(a0)
    80202d04:	6fc8                	ld	a0,152(a5)
    80202d06:	bfe9                	j	80202ce0 <argraw+0x30>
  panic("argraw");
    80202d08:	00007517          	auipc	a0,0x7
    80202d0c:	c4050513          	addi	a0,a0,-960 # 80209948 <digits+0x5c8>
    80202d10:	ffffd097          	auipc	ra,0xffffd
    80202d14:	434080e7          	jalr	1076(ra) # 80200144 <panic>

0000000080202d18 <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80202d18:	7179                	addi	sp,sp,-48
    80202d1a:	f406                	sd	ra,40(sp)
    80202d1c:	f022                	sd	s0,32(sp)
    80202d1e:	ec26                	sd	s1,24(sp)
    80202d20:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80202d22:	4501                	li	a0,0
    80202d24:	00000097          	auipc	ra,0x0
    80202d28:	f8c080e7          	jalr	-116(ra) # 80202cb0 <argraw>
    80202d2c:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80202d2e:	ffffe097          	auipc	ra,0xffffe
    80202d32:	892080e7          	jalr	-1902(ra) # 802005c0 <freemem_amount>
    80202d36:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80202d3a:	00000097          	auipc	ra,0x0
    80202d3e:	91a080e7          	jalr	-1766(ra) # 80202654 <procnum>
    80202d42:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80202d46:	4641                	li	a2,16
    80202d48:	fd040593          	addi	a1,s0,-48
    80202d4c:	8526                	mv	a0,s1
    80202d4e:	ffffe097          	auipc	ra,0xffffe
    80202d52:	624080e7          	jalr	1572(ra) # 80201372 <copyout2>
    return -1;
  }

  return 0;
}
    80202d56:	957d                	srai	a0,a0,0x3f
    80202d58:	70a2                	ld	ra,40(sp)
    80202d5a:	7402                	ld	s0,32(sp)
    80202d5c:	64e2                	ld	s1,24(sp)
    80202d5e:	6145                	addi	sp,sp,48
    80202d60:	8082                	ret

0000000080202d62 <fetchaddr>:
{
    80202d62:	1101                	addi	sp,sp,-32
    80202d64:	ec06                	sd	ra,24(sp)
    80202d66:	e822                	sd	s0,16(sp)
    80202d68:	e426                	sd	s1,8(sp)
    80202d6a:	e04a                	sd	s2,0(sp)
    80202d6c:	1000                	addi	s0,sp,32
    80202d6e:	84aa                	mv	s1,a0
    80202d70:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202d72:	fffff097          	auipc	ra,0xfffff
    80202d76:	cca080e7          	jalr	-822(ra) # 80201a3c <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80202d7a:	653c                	ld	a5,72(a0)
    80202d7c:	02f4f763          	bgeu	s1,a5,80202daa <fetchaddr+0x48>
    80202d80:	00848713          	addi	a4,s1,8
    80202d84:	02e7e563          	bltu	a5,a4,80202dae <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    80202d88:	4621                	li	a2,8
    80202d8a:	85a6                	mv	a1,s1
    80202d8c:	854a                	mv	a0,s2
    80202d8e:	ffffe097          	auipc	ra,0xffffe
    80202d92:	6c4080e7          	jalr	1732(ra) # 80201452 <copyin2>
    80202d96:	00a03533          	snez	a0,a0
    80202d9a:	40a00533          	neg	a0,a0
}
    80202d9e:	60e2                	ld	ra,24(sp)
    80202da0:	6442                	ld	s0,16(sp)
    80202da2:	64a2                	ld	s1,8(sp)
    80202da4:	6902                	ld	s2,0(sp)
    80202da6:	6105                	addi	sp,sp,32
    80202da8:	8082                	ret
    return -1;
    80202daa:	557d                	li	a0,-1
    80202dac:	bfcd                	j	80202d9e <fetchaddr+0x3c>
    80202dae:	557d                	li	a0,-1
    80202db0:	b7fd                	j	80202d9e <fetchaddr+0x3c>

0000000080202db2 <fetchstr>:
{
    80202db2:	1101                	addi	sp,sp,-32
    80202db4:	ec06                	sd	ra,24(sp)
    80202db6:	e822                	sd	s0,16(sp)
    80202db8:	e426                	sd	s1,8(sp)
    80202dba:	1000                	addi	s0,sp,32
    80202dbc:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    80202dbe:	85aa                	mv	a1,a0
    80202dc0:	8526                	mv	a0,s1
    80202dc2:	ffffe097          	auipc	ra,0xffffe
    80202dc6:	792080e7          	jalr	1938(ra) # 80201554 <copyinstr2>
  if(err < 0)
    80202dca:	00054763          	bltz	a0,80202dd8 <fetchstr+0x26>
  return strlen(buf);
    80202dce:	8526                	mv	a0,s1
    80202dd0:	ffffe097          	auipc	ra,0xffffe
    80202dd4:	b16080e7          	jalr	-1258(ra) # 802008e6 <strlen>
}
    80202dd8:	60e2                	ld	ra,24(sp)
    80202dda:	6442                	ld	s0,16(sp)
    80202ddc:	64a2                	ld	s1,8(sp)
    80202dde:	6105                	addi	sp,sp,32
    80202de0:	8082                	ret

0000000080202de2 <argint>:
{
    80202de2:	1101                	addi	sp,sp,-32
    80202de4:	ec06                	sd	ra,24(sp)
    80202de6:	e822                	sd	s0,16(sp)
    80202de8:	e426                	sd	s1,8(sp)
    80202dea:	1000                	addi	s0,sp,32
    80202dec:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202dee:	00000097          	auipc	ra,0x0
    80202df2:	ec2080e7          	jalr	-318(ra) # 80202cb0 <argraw>
    80202df6:	c088                	sw	a0,0(s1)
}
    80202df8:	4501                	li	a0,0
    80202dfa:	60e2                	ld	ra,24(sp)
    80202dfc:	6442                	ld	s0,16(sp)
    80202dfe:	64a2                	ld	s1,8(sp)
    80202e00:	6105                	addi	sp,sp,32
    80202e02:	8082                	ret

0000000080202e04 <sys_test_proc>:
sys_test_proc(void) {
    80202e04:	1101                	addi	sp,sp,-32
    80202e06:	ec06                	sd	ra,24(sp)
    80202e08:	e822                	sd	s0,16(sp)
    80202e0a:	1000                	addi	s0,sp,32
    argint(0, &n);
    80202e0c:	fec40593          	addi	a1,s0,-20
    80202e10:	4501                	li	a0,0
    80202e12:	00000097          	auipc	ra,0x0
    80202e16:	fd0080e7          	jalr	-48(ra) # 80202de2 <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    80202e1a:	fffff097          	auipc	ra,0xfffff
    80202e1e:	c22080e7          	jalr	-990(ra) # 80201a3c <myproc>
    80202e22:	8612                	mv	a2,tp
    80202e24:	fec42683          	lw	a3,-20(s0)
    80202e28:	5d0c                	lw	a1,56(a0)
    80202e2a:	00007517          	auipc	a0,0x7
    80202e2e:	b2650513          	addi	a0,a0,-1242 # 80209950 <digits+0x5d0>
    80202e32:	ffffd097          	auipc	ra,0xffffd
    80202e36:	35c080e7          	jalr	860(ra) # 8020018e <printf>
}
    80202e3a:	4501                	li	a0,0
    80202e3c:	60e2                	ld	ra,24(sp)
    80202e3e:	6442                	ld	s0,16(sp)
    80202e40:	6105                	addi	sp,sp,32
    80202e42:	8082                	ret

0000000080202e44 <argaddr>:
{
    80202e44:	1101                	addi	sp,sp,-32
    80202e46:	ec06                	sd	ra,24(sp)
    80202e48:	e822                	sd	s0,16(sp)
    80202e4a:	e426                	sd	s1,8(sp)
    80202e4c:	1000                	addi	s0,sp,32
    80202e4e:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202e50:	00000097          	auipc	ra,0x0
    80202e54:	e60080e7          	jalr	-416(ra) # 80202cb0 <argraw>
    80202e58:	e088                	sd	a0,0(s1)
}
    80202e5a:	4501                	li	a0,0
    80202e5c:	60e2                	ld	ra,24(sp)
    80202e5e:	6442                	ld	s0,16(sp)
    80202e60:	64a2                	ld	s1,8(sp)
    80202e62:	6105                	addi	sp,sp,32
    80202e64:	8082                	ret

0000000080202e66 <argstr>:
{
    80202e66:	1101                	addi	sp,sp,-32
    80202e68:	ec06                	sd	ra,24(sp)
    80202e6a:	e822                	sd	s0,16(sp)
    80202e6c:	e426                	sd	s1,8(sp)
    80202e6e:	e04a                	sd	s2,0(sp)
    80202e70:	1000                	addi	s0,sp,32
    80202e72:	84ae                	mv	s1,a1
    80202e74:	8932                	mv	s2,a2
  *ip = argraw(n);
    80202e76:	00000097          	auipc	ra,0x0
    80202e7a:	e3a080e7          	jalr	-454(ra) # 80202cb0 <argraw>
  return fetchstr(addr, buf, max);
    80202e7e:	864a                	mv	a2,s2
    80202e80:	85a6                	mv	a1,s1
    80202e82:	00000097          	auipc	ra,0x0
    80202e86:	f30080e7          	jalr	-208(ra) # 80202db2 <fetchstr>
}
    80202e8a:	60e2                	ld	ra,24(sp)
    80202e8c:	6442                	ld	s0,16(sp)
    80202e8e:	64a2                	ld	s1,8(sp)
    80202e90:	6902                	ld	s2,0(sp)
    80202e92:	6105                	addi	sp,sp,32
    80202e94:	8082                	ret

0000000080202e96 <syscall>:
{
    80202e96:	7179                	addi	sp,sp,-48
    80202e98:	f406                	sd	ra,40(sp)
    80202e9a:	f022                	sd	s0,32(sp)
    80202e9c:	ec26                	sd	s1,24(sp)
    80202e9e:	e84a                	sd	s2,16(sp)
    80202ea0:	e44e                	sd	s3,8(sp)
    80202ea2:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202ea4:	fffff097          	auipc	ra,0xfffff
    80202ea8:	b98080e7          	jalr	-1128(ra) # 80201a3c <myproc>
    80202eac:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80202eae:	06053903          	ld	s2,96(a0)
    80202eb2:	0a893783          	ld	a5,168(s2)
    80202eb6:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80202eba:	37fd                	addiw	a5,a5,-1
    80202ebc:	0d500713          	li	a4,213
    80202ec0:	04f76763          	bltu	a4,a5,80202f0e <syscall+0x78>
    80202ec4:	00399713          	slli	a4,s3,0x3
    80202ec8:	00008797          	auipc	a5,0x8
    80202ecc:	de878793          	addi	a5,a5,-536 # 8020acb0 <syscalls>
    80202ed0:	97ba                	add	a5,a5,a4
    80202ed2:	639c                	ld	a5,0(a5)
    80202ed4:	cf8d                	beqz	a5,80202f0e <syscall+0x78>
    p->trapframe->a0 = syscalls[num]();
    80202ed6:	9782                	jalr	a5
    80202ed8:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    80202edc:	1704a783          	lw	a5,368(s1)
    80202ee0:	4137d7bb          	sraw	a5,a5,s3
    80202ee4:	8b85                	andi	a5,a5,1
    80202ee6:	c3b9                	beqz	a5,80202f2c <syscall+0x96>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    80202ee8:	70b8                	ld	a4,96(s1)
    80202eea:	098e                	slli	s3,s3,0x3
    80202eec:	00008797          	auipc	a5,0x8
    80202ef0:	47c78793          	addi	a5,a5,1148 # 8020b368 <sysnames>
    80202ef4:	97ce                	add	a5,a5,s3
    80202ef6:	7b34                	ld	a3,112(a4)
    80202ef8:	6390                	ld	a2,0(a5)
    80202efa:	5c8c                	lw	a1,56(s1)
    80202efc:	00007517          	auipc	a0,0x7
    80202f00:	a8450513          	addi	a0,a0,-1404 # 80209980 <digits+0x600>
    80202f04:	ffffd097          	auipc	ra,0xffffd
    80202f08:	28a080e7          	jalr	650(ra) # 8020018e <printf>
    80202f0c:	a005                	j	80202f2c <syscall+0x96>
    printf("pid %d %s: unknown sys call %d\n",
    80202f0e:	86ce                	mv	a3,s3
    80202f10:	16048613          	addi	a2,s1,352
    80202f14:	5c8c                	lw	a1,56(s1)
    80202f16:	00007517          	auipc	a0,0x7
    80202f1a:	a8250513          	addi	a0,a0,-1406 # 80209998 <digits+0x618>
    80202f1e:	ffffd097          	auipc	ra,0xffffd
    80202f22:	270080e7          	jalr	624(ra) # 8020018e <printf>
    p->trapframe->a0 = -1;
    80202f26:	70bc                	ld	a5,96(s1)
    80202f28:	577d                	li	a4,-1
    80202f2a:	fbb8                	sd	a4,112(a5)
}
    80202f2c:	70a2                	ld	ra,40(sp)
    80202f2e:	7402                	ld	s0,32(sp)
    80202f30:	64e2                	ld	s1,24(sp)
    80202f32:	6942                	ld	s2,16(sp)
    80202f34:	69a2                	ld	s3,8(sp)
    80202f36:	6145                	addi	sp,sp,48
    80202f38:	8082                	ret

0000000080202f3a <sys_exec>:

extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    80202f3a:	d9010113          	addi	sp,sp,-624
    80202f3e:	26113423          	sd	ra,616(sp)
    80202f42:	26813023          	sd	s0,608(sp)
    80202f46:	24913c23          	sd	s1,600(sp)
    80202f4a:	25213823          	sd	s2,592(sp)
    80202f4e:	25313423          	sd	s3,584(sp)
    80202f52:	25413023          	sd	s4,576(sp)
    80202f56:	23513c23          	sd	s5,568(sp)
    80202f5a:	23613823          	sd	s6,560(sp)
    80202f5e:	23713423          	sd	s7,552(sp)
    80202f62:	1c80                	addi	s0,sp,624
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80202f64:	10400613          	li	a2,260
    80202f68:	ea840593          	addi	a1,s0,-344
    80202f6c:	4501                	li	a0,0
    80202f6e:	00000097          	auipc	ra,0x0
    80202f72:	ef8080e7          	jalr	-264(ra) # 80202e66 <argstr>
    return -1;
    80202f76:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80202f78:	0c054c63          	bltz	a0,80203050 <sys_exec+0x116>
    80202f7c:	da040593          	addi	a1,s0,-608
    80202f80:	4505                	li	a0,1
    80202f82:	00000097          	auipc	ra,0x0
    80202f86:	ec2080e7          	jalr	-318(ra) # 80202e44 <argaddr>
    80202f8a:	0c054363          	bltz	a0,80203050 <sys_exec+0x116>
  }
  memset(argv, 0, sizeof(argv));
    80202f8e:	da840a13          	addi	s4,s0,-600
    80202f92:	10000613          	li	a2,256
    80202f96:	4581                	li	a1,0
    80202f98:	8552                	mv	a0,s4
    80202f9a:	ffffd097          	auipc	ra,0xffffd
    80202f9e:	7c8080e7          	jalr	1992(ra) # 80200762 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    80202fa2:	84d2                	mv	s1,s4
  memset(argv, 0, sizeof(argv));
    80202fa4:	89d2                	mv	s3,s4
    80202fa6:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80202fa8:	d9840a93          	addi	s5,s0,-616
    if(i >= NELEM(argv)){
    80202fac:	02000b13          	li	s6,32
    80202fb0:	00090b9b          	sext.w	s7,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80202fb4:	00391513          	slli	a0,s2,0x3
    80202fb8:	85d6                	mv	a1,s5
    80202fba:	da043783          	ld	a5,-608(s0)
    80202fbe:	953e                	add	a0,a0,a5
    80202fc0:	00000097          	auipc	ra,0x0
    80202fc4:	da2080e7          	jalr	-606(ra) # 80202d62 <fetchaddr>
    80202fc8:	02054a63          	bltz	a0,80202ffc <sys_exec+0xc2>
      goto bad;
    }
    if(uarg == 0){
    80202fcc:	d9843783          	ld	a5,-616(s0)
    80202fd0:	c3b9                	beqz	a5,80203016 <sys_exec+0xdc>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    80202fd2:	ffffd097          	auipc	ra,0xffffd
    80202fd6:	588080e7          	jalr	1416(ra) # 8020055a <kalloc>
    80202fda:	85aa                	mv	a1,a0
    80202fdc:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    80202fe0:	cd11                	beqz	a0,80202ffc <sys_exec+0xc2>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80202fe2:	6605                	lui	a2,0x1
    80202fe4:	d9843503          	ld	a0,-616(s0)
    80202fe8:	00000097          	auipc	ra,0x0
    80202fec:	dca080e7          	jalr	-566(ra) # 80202db2 <fetchstr>
    80202ff0:	00054663          	bltz	a0,80202ffc <sys_exec+0xc2>
    if(i >= NELEM(argv)){
    80202ff4:	0905                	addi	s2,s2,1
    80202ff6:	09a1                	addi	s3,s3,8
    80202ff8:	fb691ce3          	bne	s2,s6,80202fb0 <sys_exec+0x76>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80202ffc:	100a0a13          	addi	s4,s4,256
    80203000:	6088                	ld	a0,0(s1)
    80203002:	c531                	beqz	a0,8020304e <sys_exec+0x114>
    kfree(argv[i]);
    80203004:	ffffd097          	auipc	ra,0xffffd
    80203008:	43c080e7          	jalr	1084(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020300c:	04a1                	addi	s1,s1,8
    8020300e:	ff4499e3          	bne	s1,s4,80203000 <sys_exec+0xc6>
  return -1;
    80203012:	597d                	li	s2,-1
    80203014:	a835                	j	80203050 <sys_exec+0x116>
      argv[i] = 0;
    80203016:	0b8e                	slli	s7,s7,0x3
    80203018:	fb0b8793          	addi	a5,s7,-80
    8020301c:	00878bb3          	add	s7,a5,s0
    80203020:	de0bbc23          	sd	zero,-520(s7)
  int ret = exec(path, argv);
    80203024:	da840593          	addi	a1,s0,-600
    80203028:	ea840513          	addi	a0,s0,-344
    8020302c:	00001097          	auipc	ra,0x1
    80203030:	ecc080e7          	jalr	-308(ra) # 80203ef8 <exec>
    80203034:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203036:	100a0a13          	addi	s4,s4,256
    8020303a:	6088                	ld	a0,0(s1)
    8020303c:	c911                	beqz	a0,80203050 <sys_exec+0x116>
    kfree(argv[i]);
    8020303e:	ffffd097          	auipc	ra,0xffffd
    80203042:	402080e7          	jalr	1026(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203046:	04a1                	addi	s1,s1,8
    80203048:	ff4499e3          	bne	s1,s4,8020303a <sys_exec+0x100>
    8020304c:	a011                	j	80203050 <sys_exec+0x116>
  return -1;
    8020304e:	597d                	li	s2,-1
}
    80203050:	854a                	mv	a0,s2
    80203052:	26813083          	ld	ra,616(sp)
    80203056:	26013403          	ld	s0,608(sp)
    8020305a:	25813483          	ld	s1,600(sp)
    8020305e:	25013903          	ld	s2,592(sp)
    80203062:	24813983          	ld	s3,584(sp)
    80203066:	24013a03          	ld	s4,576(sp)
    8020306a:	23813a83          	ld	s5,568(sp)
    8020306e:	23013b03          	ld	s6,560(sp)
    80203072:	22813b83          	ld	s7,552(sp)
    80203076:	27010113          	addi	sp,sp,624
    8020307a:	8082                	ret

000000008020307c <sys_exit>:

uint64
sys_exit(void)
{
    8020307c:	1101                	addi	sp,sp,-32
    8020307e:	ec06                	sd	ra,24(sp)
    80203080:	e822                	sd	s0,16(sp)
    80203082:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    80203084:	fec40593          	addi	a1,s0,-20
    80203088:	4501                	li	a0,0
    8020308a:	00000097          	auipc	ra,0x0
    8020308e:	d58080e7          	jalr	-680(ra) # 80202de2 <argint>
    return -1;
    80203092:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80203094:	00054963          	bltz	a0,802030a6 <sys_exit+0x2a>
  exit(n);
    80203098:	fec42503          	lw	a0,-20(s0)
    8020309c:	fffff097          	auipc	ra,0xfffff
    802030a0:	0e4080e7          	jalr	228(ra) # 80202180 <exit>
  return 0;  // not reached
    802030a4:	4781                	li	a5,0
}
    802030a6:	853e                	mv	a0,a5
    802030a8:	60e2                	ld	ra,24(sp)
    802030aa:	6442                	ld	s0,16(sp)
    802030ac:	6105                	addi	sp,sp,32
    802030ae:	8082                	ret

00000000802030b0 <sys_getpid>:

uint64
sys_getpid(void)
{
    802030b0:	1141                	addi	sp,sp,-16
    802030b2:	e406                	sd	ra,8(sp)
    802030b4:	e022                	sd	s0,0(sp)
    802030b6:	0800                	addi	s0,sp,16
  return myproc()->pid;
    802030b8:	fffff097          	auipc	ra,0xfffff
    802030bc:	984080e7          	jalr	-1660(ra) # 80201a3c <myproc>
}
    802030c0:	5d08                	lw	a0,56(a0)
    802030c2:	60a2                	ld	ra,8(sp)
    802030c4:	6402                	ld	s0,0(sp)
    802030c6:	0141                	addi	sp,sp,16
    802030c8:	8082                	ret

00000000802030ca <sys_fork>:

uint64
sys_fork(void)
{
    802030ca:	1141                	addi	sp,sp,-16
    802030cc:	e406                	sd	ra,8(sp)
    802030ce:	e022                	sd	s0,0(sp)
    802030d0:	0800                	addi	s0,sp,16
  return fork();
    802030d2:	fffff097          	auipc	ra,0xfffff
    802030d6:	d70080e7          	jalr	-656(ra) # 80201e42 <fork>
}
    802030da:	60a2                	ld	ra,8(sp)
    802030dc:	6402                	ld	s0,0(sp)
    802030de:	0141                	addi	sp,sp,16
    802030e0:	8082                	ret

00000000802030e2 <sys_wait>:

uint64
sys_wait(void)
{
    802030e2:	1101                	addi	sp,sp,-32
    802030e4:	ec06                	sd	ra,24(sp)
    802030e6:	e822                	sd	s0,16(sp)
    802030e8:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    802030ea:	fe840593          	addi	a1,s0,-24
    802030ee:	4501                	li	a0,0
    802030f0:	00000097          	auipc	ra,0x0
    802030f4:	d54080e7          	jalr	-684(ra) # 80202e44 <argaddr>
    802030f8:	87aa                	mv	a5,a0
    return -1;
    802030fa:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    802030fc:	0007c863          	bltz	a5,8020310c <sys_wait+0x2a>
  return wait(p);
    80203100:	fe843503          	ld	a0,-24(s0)
    80203104:	fffff097          	auipc	ra,0xfffff
    80203108:	25a080e7          	jalr	602(ra) # 8020235e <wait>
}
    8020310c:	60e2                	ld	ra,24(sp)
    8020310e:	6442                	ld	s0,16(sp)
    80203110:	6105                	addi	sp,sp,32
    80203112:	8082                	ret

0000000080203114 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80203114:	7179                	addi	sp,sp,-48
    80203116:	f406                	sd	ra,40(sp)
    80203118:	f022                	sd	s0,32(sp)
    8020311a:	ec26                	sd	s1,24(sp)
    8020311c:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    8020311e:	fdc40593          	addi	a1,s0,-36
    80203122:	4501                	li	a0,0
    80203124:	00000097          	auipc	ra,0x0
    80203128:	cbe080e7          	jalr	-834(ra) # 80202de2 <argint>
    8020312c:	87aa                	mv	a5,a0
    return -1;
    8020312e:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    80203130:	0207c063          	bltz	a5,80203150 <sys_sbrk+0x3c>
  addr = myproc()->sz;
    80203134:	fffff097          	auipc	ra,0xfffff
    80203138:	908080e7          	jalr	-1784(ra) # 80201a3c <myproc>
    8020313c:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    8020313e:	fdc42503          	lw	a0,-36(s0)
    80203142:	fffff097          	auipc	ra,0xfffff
    80203146:	c84080e7          	jalr	-892(ra) # 80201dc6 <growproc>
    8020314a:	00054863          	bltz	a0,8020315a <sys_sbrk+0x46>
    return -1;
  return addr;
    8020314e:	8526                	mv	a0,s1
}
    80203150:	70a2                	ld	ra,40(sp)
    80203152:	7402                	ld	s0,32(sp)
    80203154:	64e2                	ld	s1,24(sp)
    80203156:	6145                	addi	sp,sp,48
    80203158:	8082                	ret
    return -1;
    8020315a:	557d                	li	a0,-1
    8020315c:	bfd5                	j	80203150 <sys_sbrk+0x3c>

000000008020315e <sys_sleep>:

uint64
sys_sleep(void)
{
    8020315e:	7139                	addi	sp,sp,-64
    80203160:	fc06                	sd	ra,56(sp)
    80203162:	f822                	sd	s0,48(sp)
    80203164:	f426                	sd	s1,40(sp)
    80203166:	f04a                	sd	s2,32(sp)
    80203168:	ec4e                	sd	s3,24(sp)
    8020316a:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    8020316c:	fcc40593          	addi	a1,s0,-52
    80203170:	4501                	li	a0,0
    80203172:	00000097          	auipc	ra,0x0
    80203176:	c70080e7          	jalr	-912(ra) # 80202de2 <argint>
    return -1;
    8020317a:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    8020317c:	06054763          	bltz	a0,802031ea <sys_sleep+0x8c>
  acquire(&tickslock);
    80203180:	00009517          	auipc	a0,0x9
    80203184:	8e853503          	ld	a0,-1816(a0) # 8020ba68 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203188:	ffffd097          	auipc	ra,0xffffd
    8020318c:	53e080e7          	jalr	1342(ra) # 802006c6 <acquire>
  ticks0 = ticks;
    80203190:	00009797          	auipc	a5,0x9
    80203194:	8e87b783          	ld	a5,-1816(a5) # 8020ba78 <_GLOBAL_OFFSET_TABLE_+0x40>
    80203198:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    8020319c:	fcc42783          	lw	a5,-52(s0)
    802031a0:	cf85                	beqz	a5,802031d8 <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    802031a2:	00009997          	auipc	s3,0x9
    802031a6:	8c69b983          	ld	s3,-1850(s3) # 8020ba68 <_GLOBAL_OFFSET_TABLE_+0x30>
    802031aa:	00009497          	auipc	s1,0x9
    802031ae:	8ce4b483          	ld	s1,-1842(s1) # 8020ba78 <_GLOBAL_OFFSET_TABLE_+0x40>
    if(myproc()->killed){
    802031b2:	fffff097          	auipc	ra,0xfffff
    802031b6:	88a080e7          	jalr	-1910(ra) # 80201a3c <myproc>
    802031ba:	591c                	lw	a5,48(a0)
    802031bc:	ef9d                	bnez	a5,802031fa <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    802031be:	85ce                	mv	a1,s3
    802031c0:	8526                	mv	a0,s1
    802031c2:	fffff097          	auipc	ra,0xfffff
    802031c6:	11e080e7          	jalr	286(ra) # 802022e0 <sleep>
  while(ticks - ticks0 < n){
    802031ca:	409c                	lw	a5,0(s1)
    802031cc:	412787bb          	subw	a5,a5,s2
    802031d0:	fcc42703          	lw	a4,-52(s0)
    802031d4:	fce7efe3          	bltu	a5,a4,802031b2 <sys_sleep+0x54>
  }
  release(&tickslock);
    802031d8:	00009517          	auipc	a0,0x9
    802031dc:	89053503          	ld	a0,-1904(a0) # 8020ba68 <_GLOBAL_OFFSET_TABLE_+0x30>
    802031e0:	ffffd097          	auipc	ra,0xffffd
    802031e4:	53a080e7          	jalr	1338(ra) # 8020071a <release>
  return 0;
    802031e8:	4781                	li	a5,0
}
    802031ea:	853e                	mv	a0,a5
    802031ec:	70e2                	ld	ra,56(sp)
    802031ee:	7442                	ld	s0,48(sp)
    802031f0:	74a2                	ld	s1,40(sp)
    802031f2:	7902                	ld	s2,32(sp)
    802031f4:	69e2                	ld	s3,24(sp)
    802031f6:	6121                	addi	sp,sp,64
    802031f8:	8082                	ret
      release(&tickslock);
    802031fa:	00009517          	auipc	a0,0x9
    802031fe:	86e53503          	ld	a0,-1938(a0) # 8020ba68 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203202:	ffffd097          	auipc	ra,0xffffd
    80203206:	518080e7          	jalr	1304(ra) # 8020071a <release>
      return -1;
    8020320a:	57fd                	li	a5,-1
    8020320c:	bff9                	j	802031ea <sys_sleep+0x8c>

000000008020320e <sys_kill>:

uint64
sys_kill(void)
{
    8020320e:	1101                	addi	sp,sp,-32
    80203210:	ec06                	sd	ra,24(sp)
    80203212:	e822                	sd	s0,16(sp)
    80203214:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    80203216:	fec40593          	addi	a1,s0,-20
    8020321a:	4501                	li	a0,0
    8020321c:	00000097          	auipc	ra,0x0
    80203220:	bc6080e7          	jalr	-1082(ra) # 80202de2 <argint>
    80203224:	87aa                	mv	a5,a0
    return -1;
    80203226:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    80203228:	0007c863          	bltz	a5,80203238 <sys_kill+0x2a>
  return kill(pid);
    8020322c:	fec42503          	lw	a0,-20(s0)
    80203230:	fffff097          	auipc	ra,0xfffff
    80203234:	296080e7          	jalr	662(ra) # 802024c6 <kill>
}
    80203238:	60e2                	ld	ra,24(sp)
    8020323a:	6442                	ld	s0,16(sp)
    8020323c:	6105                	addi	sp,sp,32
    8020323e:	8082                	ret

0000000080203240 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80203240:	1101                	addi	sp,sp,-32
    80203242:	ec06                	sd	ra,24(sp)
    80203244:	e822                	sd	s0,16(sp)
    80203246:	e426                	sd	s1,8(sp)
    80203248:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    8020324a:	00009517          	auipc	a0,0x9
    8020324e:	81e53503          	ld	a0,-2018(a0) # 8020ba68 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203252:	ffffd097          	auipc	ra,0xffffd
    80203256:	474080e7          	jalr	1140(ra) # 802006c6 <acquire>
  xticks = ticks;
    8020325a:	00009797          	auipc	a5,0x9
    8020325e:	81e7b783          	ld	a5,-2018(a5) # 8020ba78 <_GLOBAL_OFFSET_TABLE_+0x40>
    80203262:	4384                	lw	s1,0(a5)
  release(&tickslock);
    80203264:	00009517          	auipc	a0,0x9
    80203268:	80453503          	ld	a0,-2044(a0) # 8020ba68 <_GLOBAL_OFFSET_TABLE_+0x30>
    8020326c:	ffffd097          	auipc	ra,0xffffd
    80203270:	4ae080e7          	jalr	1198(ra) # 8020071a <release>
  return xticks;
}
    80203274:	02049513          	slli	a0,s1,0x20
    80203278:	9101                	srli	a0,a0,0x20
    8020327a:	60e2                	ld	ra,24(sp)
    8020327c:	6442                	ld	s0,16(sp)
    8020327e:	64a2                	ld	s1,8(sp)
    80203280:	6105                	addi	sp,sp,32
    80203282:	8082                	ret

0000000080203284 <sys_trace>:

uint64
sys_trace(void)
{
    80203284:	1101                	addi	sp,sp,-32
    80203286:	ec06                	sd	ra,24(sp)
    80203288:	e822                	sd	s0,16(sp)
    8020328a:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    8020328c:	fec40593          	addi	a1,s0,-20
    80203290:	4501                	li	a0,0
    80203292:	00000097          	auipc	ra,0x0
    80203296:	b50080e7          	jalr	-1200(ra) # 80202de2 <argint>
    return -1;
    8020329a:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    8020329c:	00054b63          	bltz	a0,802032b2 <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    802032a0:	ffffe097          	auipc	ra,0xffffe
    802032a4:	79c080e7          	jalr	1948(ra) # 80201a3c <myproc>
    802032a8:	fec42783          	lw	a5,-20(s0)
    802032ac:	16f52823          	sw	a5,368(a0)
  return 0;
    802032b0:	4781                	li	a5,0
}
    802032b2:	853e                	mv	a0,a5
    802032b4:	60e2                	ld	ra,24(sp)
    802032b6:	6442                	ld	s0,16(sp)
    802032b8:	6105                	addi	sp,sp,32
    802032ba:	8082                	ret

00000000802032bc <sys_brk>:

uint64
sys_brk(void){
    802032bc:	1101                	addi	sp,sp,-32
    802032be:	ec06                	sd	ra,24(sp)
    802032c0:	e822                	sd	s0,16(sp)
    802032c2:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    802032c4:	fec40593          	addi	a1,s0,-20
    802032c8:	4501                	li	a0,0
    802032ca:	00000097          	auipc	ra,0x0
    802032ce:	b18080e7          	jalr	-1256(ra) # 80202de2 <argint>
  printf("hello brk from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    802032d2:	ffffe097          	auipc	ra,0xffffe
    802032d6:	76a080e7          	jalr	1898(ra) # 80201a3c <myproc>
    802032da:	8612                	mv	a2,tp
    802032dc:	fec42683          	lw	a3,-20(s0)
    802032e0:	5d0c                	lw	a1,56(a0)
    802032e2:	00006517          	auipc	a0,0x6
    802032e6:	7de50513          	addi	a0,a0,2014 # 80209ac0 <digits+0x740>
    802032ea:	ffffd097          	auipc	ra,0xffffd
    802032ee:	ea4080e7          	jalr	-348(ra) # 8020018e <printf>
  return 0;
}
    802032f2:	4501                	li	a0,0
    802032f4:	60e2                	ld	ra,24(sp)
    802032f6:	6442                	ld	s0,16(sp)
    802032f8:	6105                	addi	sp,sp,32
    802032fa:	8082                	ret

00000000802032fc <sys_poweroff>:

// Power off QEMU
uint64
sys_poweroff(void)
{
    802032fc:	1141                	addi	sp,sp,-16
    802032fe:	e406                	sd	ra,8(sp)
    80203300:	e022                	sd	s0,0(sp)
    80203302:	0800                	addi	s0,sp,16
  printf("Powering off...\n");
    80203304:	00006517          	auipc	a0,0x6
    80203308:	7ec50513          	addi	a0,a0,2028 # 80209af0 <digits+0x770>
    8020330c:	ffffd097          	auipc	ra,0xffffd
    80203310:	e82080e7          	jalr	-382(ra) # 8020018e <printf>
	SBI_CALL_0(SBI_SHUTDOWN);
    80203314:	4501                	li	a0,0
    80203316:	4581                	li	a1,0
    80203318:	4601                	li	a2,0
    8020331a:	4681                	li	a3,0
    8020331c:	48a1                	li	a7,8
    8020331e:	00000073          	ecall
  sbi_shutdown();
  panic("sys_poweroff");
    80203322:	00006517          	auipc	a0,0x6
    80203326:	7e650513          	addi	a0,a0,2022 # 80209b08 <digits+0x788>
    8020332a:	ffffd097          	auipc	ra,0xffffd
    8020332e:	e1a080e7          	jalr	-486(ra) # 80200144 <panic>

0000000080203332 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80203332:	7139                	addi	sp,sp,-64
    80203334:	fc06                	sd	ra,56(sp)
    80203336:	f822                	sd	s0,48(sp)
    80203338:	f426                	sd	s1,40(sp)
    8020333a:	f04a                	sd	s2,32(sp)
    8020333c:	ec4e                	sd	s3,24(sp)
    8020333e:	e852                	sd	s4,16(sp)
    80203340:	e456                	sd	s5,8(sp)
    80203342:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80203344:	00006597          	auipc	a1,0x6
    80203348:	7d458593          	addi	a1,a1,2004 # 80209b18 <digits+0x798>
    8020334c:	00015517          	auipc	a0,0x15
    80203350:	7a450513          	addi	a0,a0,1956 # 80218af0 <bcache>
    80203354:	ffffd097          	auipc	ra,0xffffd
    80203358:	32e080e7          	jalr	814(ra) # 80200682 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    8020335c:	00019797          	auipc	a5,0x19
    80203360:	79478793          	addi	a5,a5,1940 # 8021caf0 <bcache+0x4000>
    80203364:	0001a717          	auipc	a4,0x1a
    80203368:	df470713          	addi	a4,a4,-524 # 8021d158 <bcache+0x4668>
    8020336c:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    80203370:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203374:	00015497          	auipc	s1,0x15
    80203378:	79448493          	addi	s1,s1,1940 # 80218b08 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    8020337c:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    8020337e:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    80203380:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    80203382:	00006a97          	auipc	s5,0x6
    80203386:	79ea8a93          	addi	s5,s5,1950 # 80209b20 <digits+0x7a0>
    b->refcnt = 0;
    8020338a:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    8020338e:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    80203392:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    80203396:	6b893783          	ld	a5,1720(s2)
    8020339a:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    8020339c:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    802033a0:	85d6                	mv	a1,s5
    802033a2:	01048513          	addi	a0,s1,16
    802033a6:	00000097          	auipc	ra,0x0
    802033aa:	26e080e7          	jalr	622(ra) # 80203614 <initsleeplock>
    bcache.head.next->prev = b;
    802033ae:	6b893783          	ld	a5,1720(s2)
    802033b2:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    802033b4:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    802033b8:	25848493          	addi	s1,s1,600
    802033bc:	fd3497e3          	bne	s1,s3,8020338a <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    802033c0:	70e2                	ld	ra,56(sp)
    802033c2:	7442                	ld	s0,48(sp)
    802033c4:	74a2                	ld	s1,40(sp)
    802033c6:	7902                	ld	s2,32(sp)
    802033c8:	69e2                	ld	s3,24(sp)
    802033ca:	6a42                	ld	s4,16(sp)
    802033cc:	6aa2                	ld	s5,8(sp)
    802033ce:	6121                	addi	sp,sp,64
    802033d0:	8082                	ret

00000000802033d2 <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    802033d2:	7179                	addi	sp,sp,-48
    802033d4:	f406                	sd	ra,40(sp)
    802033d6:	f022                	sd	s0,32(sp)
    802033d8:	ec26                	sd	s1,24(sp)
    802033da:	e84a                	sd	s2,16(sp)
    802033dc:	e44e                	sd	s3,8(sp)
    802033de:	1800                	addi	s0,sp,48
    802033e0:	892a                	mv	s2,a0
    802033e2:	89ae                	mv	s3,a1
  acquire(&bcache.lock);
    802033e4:	00015517          	auipc	a0,0x15
    802033e8:	70c50513          	addi	a0,a0,1804 # 80218af0 <bcache>
    802033ec:	ffffd097          	auipc	ra,0xffffd
    802033f0:	2da080e7          	jalr	730(ra) # 802006c6 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    802033f4:	0001a497          	auipc	s1,0x1a
    802033f8:	db44b483          	ld	s1,-588(s1) # 8021d1a8 <bcache+0x46b8>
    802033fc:	0001a797          	auipc	a5,0x1a
    80203400:	d5c78793          	addi	a5,a5,-676 # 8021d158 <bcache+0x4668>
    80203404:	02f48f63          	beq	s1,a5,80203442 <bread+0x70>
    80203408:	873e                	mv	a4,a5
    8020340a:	a021                	j	80203412 <bread+0x40>
    8020340c:	68a4                	ld	s1,80(s1)
    8020340e:	02e48a63          	beq	s1,a4,80203442 <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    80203412:	449c                	lw	a5,8(s1)
    80203414:	ff279ce3          	bne	a5,s2,8020340c <bread+0x3a>
    80203418:	44dc                	lw	a5,12(s1)
    8020341a:	ff3799e3          	bne	a5,s3,8020340c <bread+0x3a>
      b->refcnt++;
    8020341e:	40bc                	lw	a5,64(s1)
    80203420:	2785                	addiw	a5,a5,1
    80203422:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203424:	00015517          	auipc	a0,0x15
    80203428:	6cc50513          	addi	a0,a0,1740 # 80218af0 <bcache>
    8020342c:	ffffd097          	auipc	ra,0xffffd
    80203430:	2ee080e7          	jalr	750(ra) # 8020071a <release>
      acquiresleep(&b->lock);
    80203434:	01048513          	addi	a0,s1,16
    80203438:	00000097          	auipc	ra,0x0
    8020343c:	216080e7          	jalr	534(ra) # 8020364e <acquiresleep>
      return b;
    80203440:	a8b9                	j	8020349e <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203442:	0001a497          	auipc	s1,0x1a
    80203446:	d5e4b483          	ld	s1,-674(s1) # 8021d1a0 <bcache+0x46b0>
    8020344a:	0001a797          	auipc	a5,0x1a
    8020344e:	d0e78793          	addi	a5,a5,-754 # 8021d158 <bcache+0x4668>
    80203452:	00f48863          	beq	s1,a5,80203462 <bread+0x90>
    80203456:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    80203458:	40bc                	lw	a5,64(s1)
    8020345a:	cf81                	beqz	a5,80203472 <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8020345c:	64a4                	ld	s1,72(s1)
    8020345e:	fee49de3          	bne	s1,a4,80203458 <bread+0x86>
  panic("bget: no buffers");
    80203462:	00006517          	auipc	a0,0x6
    80203466:	6c650513          	addi	a0,a0,1734 # 80209b28 <digits+0x7a8>
    8020346a:	ffffd097          	auipc	ra,0xffffd
    8020346e:	cda080e7          	jalr	-806(ra) # 80200144 <panic>
      b->dev = dev;
    80203472:	0124a423          	sw	s2,8(s1)
      b->sectorno = sectorno;
    80203476:	0134a623          	sw	s3,12(s1)
      b->valid = 0;
    8020347a:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    8020347e:	4785                	li	a5,1
    80203480:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203482:	00015517          	auipc	a0,0x15
    80203486:	66e50513          	addi	a0,a0,1646 # 80218af0 <bcache>
    8020348a:	ffffd097          	auipc	ra,0xffffd
    8020348e:	290080e7          	jalr	656(ra) # 8020071a <release>
      acquiresleep(&b->lock);
    80203492:	01048513          	addi	a0,s1,16
    80203496:	00000097          	auipc	ra,0x0
    8020349a:	1b8080e7          	jalr	440(ra) # 8020364e <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    8020349e:	409c                	lw	a5,0(s1)
    802034a0:	cb89                	beqz	a5,802034b2 <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    802034a2:	8526                	mv	a0,s1
    802034a4:	70a2                	ld	ra,40(sp)
    802034a6:	7402                	ld	s0,32(sp)
    802034a8:	64e2                	ld	s1,24(sp)
    802034aa:	6942                	ld	s2,16(sp)
    802034ac:	69a2                	ld	s3,8(sp)
    802034ae:	6145                	addi	sp,sp,48
    802034b0:	8082                	ret
    disk_read(b);
    802034b2:	8526                	mv	a0,s1
    802034b4:	00002097          	auipc	ra,0x2
    802034b8:	b6e080e7          	jalr	-1170(ra) # 80205022 <disk_read>
    b->valid = 1;
    802034bc:	4785                	li	a5,1
    802034be:	c09c                	sw	a5,0(s1)
  return b;
    802034c0:	b7cd                	j	802034a2 <bread+0xd0>

00000000802034c2 <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    802034c2:	1101                	addi	sp,sp,-32
    802034c4:	ec06                	sd	ra,24(sp)
    802034c6:	e822                	sd	s0,16(sp)
    802034c8:	e426                	sd	s1,8(sp)
    802034ca:	1000                	addi	s0,sp,32
    802034cc:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    802034ce:	0541                	addi	a0,a0,16
    802034d0:	00000097          	auipc	ra,0x0
    802034d4:	218080e7          	jalr	536(ra) # 802036e8 <holdingsleep>
    802034d8:	c919                	beqz	a0,802034ee <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    802034da:	8526                	mv	a0,s1
    802034dc:	00002097          	auipc	ra,0x2
    802034e0:	b60080e7          	jalr	-1184(ra) # 8020503c <disk_write>
}
    802034e4:	60e2                	ld	ra,24(sp)
    802034e6:	6442                	ld	s0,16(sp)
    802034e8:	64a2                	ld	s1,8(sp)
    802034ea:	6105                	addi	sp,sp,32
    802034ec:	8082                	ret
    panic("bwrite");
    802034ee:	00006517          	auipc	a0,0x6
    802034f2:	65250513          	addi	a0,a0,1618 # 80209b40 <digits+0x7c0>
    802034f6:	ffffd097          	auipc	ra,0xffffd
    802034fa:	c4e080e7          	jalr	-946(ra) # 80200144 <panic>

00000000802034fe <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    802034fe:	1101                	addi	sp,sp,-32
    80203500:	ec06                	sd	ra,24(sp)
    80203502:	e822                	sd	s0,16(sp)
    80203504:	e426                	sd	s1,8(sp)
    80203506:	e04a                	sd	s2,0(sp)
    80203508:	1000                	addi	s0,sp,32
    8020350a:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    8020350c:	01050913          	addi	s2,a0,16
    80203510:	854a                	mv	a0,s2
    80203512:	00000097          	auipc	ra,0x0
    80203516:	1d6080e7          	jalr	470(ra) # 802036e8 <holdingsleep>
    8020351a:	c92d                	beqz	a0,8020358c <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    8020351c:	854a                	mv	a0,s2
    8020351e:	00000097          	auipc	ra,0x0
    80203522:	186080e7          	jalr	390(ra) # 802036a4 <releasesleep>

  acquire(&bcache.lock);
    80203526:	00015517          	auipc	a0,0x15
    8020352a:	5ca50513          	addi	a0,a0,1482 # 80218af0 <bcache>
    8020352e:	ffffd097          	auipc	ra,0xffffd
    80203532:	198080e7          	jalr	408(ra) # 802006c6 <acquire>
  b->refcnt--;
    80203536:	40bc                	lw	a5,64(s1)
    80203538:	37fd                	addiw	a5,a5,-1
    8020353a:	0007871b          	sext.w	a4,a5
    8020353e:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80203540:	eb05                	bnez	a4,80203570 <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80203542:	68bc                	ld	a5,80(s1)
    80203544:	64b8                	ld	a4,72(s1)
    80203546:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203548:	64bc                	ld	a5,72(s1)
    8020354a:	68b8                	ld	a4,80(s1)
    8020354c:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    8020354e:	00019797          	auipc	a5,0x19
    80203552:	5a278793          	addi	a5,a5,1442 # 8021caf0 <bcache+0x4000>
    80203556:	6b87b703          	ld	a4,1720(a5)
    8020355a:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    8020355c:	0001a717          	auipc	a4,0x1a
    80203560:	bfc70713          	addi	a4,a4,-1028 # 8021d158 <bcache+0x4668>
    80203564:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    80203566:	6b87b703          	ld	a4,1720(a5)
    8020356a:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    8020356c:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    80203570:	00015517          	auipc	a0,0x15
    80203574:	58050513          	addi	a0,a0,1408 # 80218af0 <bcache>
    80203578:	ffffd097          	auipc	ra,0xffffd
    8020357c:	1a2080e7          	jalr	418(ra) # 8020071a <release>
}
    80203580:	60e2                	ld	ra,24(sp)
    80203582:	6442                	ld	s0,16(sp)
    80203584:	64a2                	ld	s1,8(sp)
    80203586:	6902                	ld	s2,0(sp)
    80203588:	6105                	addi	sp,sp,32
    8020358a:	8082                	ret
    panic("brelse");
    8020358c:	00006517          	auipc	a0,0x6
    80203590:	5bc50513          	addi	a0,a0,1468 # 80209b48 <digits+0x7c8>
    80203594:	ffffd097          	auipc	ra,0xffffd
    80203598:	bb0080e7          	jalr	-1104(ra) # 80200144 <panic>

000000008020359c <bpin>:

void
bpin(struct buf *b) {
    8020359c:	1101                	addi	sp,sp,-32
    8020359e:	ec06                	sd	ra,24(sp)
    802035a0:	e822                	sd	s0,16(sp)
    802035a2:	e426                	sd	s1,8(sp)
    802035a4:	1000                	addi	s0,sp,32
    802035a6:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    802035a8:	00015517          	auipc	a0,0x15
    802035ac:	54850513          	addi	a0,a0,1352 # 80218af0 <bcache>
    802035b0:	ffffd097          	auipc	ra,0xffffd
    802035b4:	116080e7          	jalr	278(ra) # 802006c6 <acquire>
  b->refcnt++;
    802035b8:	40bc                	lw	a5,64(s1)
    802035ba:	2785                	addiw	a5,a5,1
    802035bc:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    802035be:	00015517          	auipc	a0,0x15
    802035c2:	53250513          	addi	a0,a0,1330 # 80218af0 <bcache>
    802035c6:	ffffd097          	auipc	ra,0xffffd
    802035ca:	154080e7          	jalr	340(ra) # 8020071a <release>
}
    802035ce:	60e2                	ld	ra,24(sp)
    802035d0:	6442                	ld	s0,16(sp)
    802035d2:	64a2                	ld	s1,8(sp)
    802035d4:	6105                	addi	sp,sp,32
    802035d6:	8082                	ret

00000000802035d8 <bunpin>:

void
bunpin(struct buf *b) {
    802035d8:	1101                	addi	sp,sp,-32
    802035da:	ec06                	sd	ra,24(sp)
    802035dc:	e822                	sd	s0,16(sp)
    802035de:	e426                	sd	s1,8(sp)
    802035e0:	1000                	addi	s0,sp,32
    802035e2:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    802035e4:	00015517          	auipc	a0,0x15
    802035e8:	50c50513          	addi	a0,a0,1292 # 80218af0 <bcache>
    802035ec:	ffffd097          	auipc	ra,0xffffd
    802035f0:	0da080e7          	jalr	218(ra) # 802006c6 <acquire>
  b->refcnt--;
    802035f4:	40bc                	lw	a5,64(s1)
    802035f6:	37fd                	addiw	a5,a5,-1
    802035f8:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    802035fa:	00015517          	auipc	a0,0x15
    802035fe:	4f650513          	addi	a0,a0,1270 # 80218af0 <bcache>
    80203602:	ffffd097          	auipc	ra,0xffffd
    80203606:	118080e7          	jalr	280(ra) # 8020071a <release>
}
    8020360a:	60e2                	ld	ra,24(sp)
    8020360c:	6442                	ld	s0,16(sp)
    8020360e:	64a2                	ld	s1,8(sp)
    80203610:	6105                	addi	sp,sp,32
    80203612:	8082                	ret

0000000080203614 <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203614:	1101                	addi	sp,sp,-32
    80203616:	ec06                	sd	ra,24(sp)
    80203618:	e822                	sd	s0,16(sp)
    8020361a:	e426                	sd	s1,8(sp)
    8020361c:	e04a                	sd	s2,0(sp)
    8020361e:	1000                	addi	s0,sp,32
    80203620:	84aa                	mv	s1,a0
    80203622:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203624:	00006597          	auipc	a1,0x6
    80203628:	52c58593          	addi	a1,a1,1324 # 80209b50 <digits+0x7d0>
    8020362c:	0521                	addi	a0,a0,8
    8020362e:	ffffd097          	auipc	ra,0xffffd
    80203632:	054080e7          	jalr	84(ra) # 80200682 <initlock>
  lk->name = name;
    80203636:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    8020363a:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    8020363e:	0204a423          	sw	zero,40(s1)
}
    80203642:	60e2                	ld	ra,24(sp)
    80203644:	6442                	ld	s0,16(sp)
    80203646:	64a2                	ld	s1,8(sp)
    80203648:	6902                	ld	s2,0(sp)
    8020364a:	6105                	addi	sp,sp,32
    8020364c:	8082                	ret

000000008020364e <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    8020364e:	1101                	addi	sp,sp,-32
    80203650:	ec06                	sd	ra,24(sp)
    80203652:	e822                	sd	s0,16(sp)
    80203654:	e426                	sd	s1,8(sp)
    80203656:	e04a                	sd	s2,0(sp)
    80203658:	1000                	addi	s0,sp,32
    8020365a:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    8020365c:	00850913          	addi	s2,a0,8
    80203660:	854a                	mv	a0,s2
    80203662:	ffffd097          	auipc	ra,0xffffd
    80203666:	064080e7          	jalr	100(ra) # 802006c6 <acquire>
  while (lk->locked) {
    8020366a:	409c                	lw	a5,0(s1)
    8020366c:	cb89                	beqz	a5,8020367e <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    8020366e:	85ca                	mv	a1,s2
    80203670:	8526                	mv	a0,s1
    80203672:	fffff097          	auipc	ra,0xfffff
    80203676:	c6e080e7          	jalr	-914(ra) # 802022e0 <sleep>
  while (lk->locked) {
    8020367a:	409c                	lw	a5,0(s1)
    8020367c:	fbed                	bnez	a5,8020366e <acquiresleep+0x20>
  }
  lk->locked = 1;
    8020367e:	4785                	li	a5,1
    80203680:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    80203682:	ffffe097          	auipc	ra,0xffffe
    80203686:	3ba080e7          	jalr	954(ra) # 80201a3c <myproc>
    8020368a:	5d1c                	lw	a5,56(a0)
    8020368c:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    8020368e:	854a                	mv	a0,s2
    80203690:	ffffd097          	auipc	ra,0xffffd
    80203694:	08a080e7          	jalr	138(ra) # 8020071a <release>
}
    80203698:	60e2                	ld	ra,24(sp)
    8020369a:	6442                	ld	s0,16(sp)
    8020369c:	64a2                	ld	s1,8(sp)
    8020369e:	6902                	ld	s2,0(sp)
    802036a0:	6105                	addi	sp,sp,32
    802036a2:	8082                	ret

00000000802036a4 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    802036a4:	1101                	addi	sp,sp,-32
    802036a6:	ec06                	sd	ra,24(sp)
    802036a8:	e822                	sd	s0,16(sp)
    802036aa:	e426                	sd	s1,8(sp)
    802036ac:	e04a                	sd	s2,0(sp)
    802036ae:	1000                	addi	s0,sp,32
    802036b0:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    802036b2:	00850913          	addi	s2,a0,8
    802036b6:	854a                	mv	a0,s2
    802036b8:	ffffd097          	auipc	ra,0xffffd
    802036bc:	00e080e7          	jalr	14(ra) # 802006c6 <acquire>
  lk->locked = 0;
    802036c0:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    802036c4:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    802036c8:	8526                	mv	a0,s1
    802036ca:	fffff097          	auipc	ra,0xfffff
    802036ce:	d92080e7          	jalr	-622(ra) # 8020245c <wakeup>
  release(&lk->lk);
    802036d2:	854a                	mv	a0,s2
    802036d4:	ffffd097          	auipc	ra,0xffffd
    802036d8:	046080e7          	jalr	70(ra) # 8020071a <release>
}
    802036dc:	60e2                	ld	ra,24(sp)
    802036de:	6442                	ld	s0,16(sp)
    802036e0:	64a2                	ld	s1,8(sp)
    802036e2:	6902                	ld	s2,0(sp)
    802036e4:	6105                	addi	sp,sp,32
    802036e6:	8082                	ret

00000000802036e8 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    802036e8:	7179                	addi	sp,sp,-48
    802036ea:	f406                	sd	ra,40(sp)
    802036ec:	f022                	sd	s0,32(sp)
    802036ee:	ec26                	sd	s1,24(sp)
    802036f0:	e84a                	sd	s2,16(sp)
    802036f2:	e44e                	sd	s3,8(sp)
    802036f4:	1800                	addi	s0,sp,48
    802036f6:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    802036f8:	00850913          	addi	s2,a0,8
    802036fc:	854a                	mv	a0,s2
    802036fe:	ffffd097          	auipc	ra,0xffffd
    80203702:	fc8080e7          	jalr	-56(ra) # 802006c6 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203706:	409c                	lw	a5,0(s1)
    80203708:	ef99                	bnez	a5,80203726 <holdingsleep+0x3e>
    8020370a:	4481                	li	s1,0
  release(&lk->lk);
    8020370c:	854a                	mv	a0,s2
    8020370e:	ffffd097          	auipc	ra,0xffffd
    80203712:	00c080e7          	jalr	12(ra) # 8020071a <release>
  return r;
}
    80203716:	8526                	mv	a0,s1
    80203718:	70a2                	ld	ra,40(sp)
    8020371a:	7402                	ld	s0,32(sp)
    8020371c:	64e2                	ld	s1,24(sp)
    8020371e:	6942                	ld	s2,16(sp)
    80203720:	69a2                	ld	s3,8(sp)
    80203722:	6145                	addi	sp,sp,48
    80203724:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203726:	0284a983          	lw	s3,40(s1)
    8020372a:	ffffe097          	auipc	ra,0xffffe
    8020372e:	312080e7          	jalr	786(ra) # 80201a3c <myproc>
    80203732:	5d04                	lw	s1,56(a0)
    80203734:	413484b3          	sub	s1,s1,s3
    80203738:	0014b493          	seqz	s1,s1
    8020373c:	bfc1                	j	8020370c <holdingsleep+0x24>

000000008020373e <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    8020373e:	1101                	addi	sp,sp,-32
    80203740:	ec06                	sd	ra,24(sp)
    80203742:	e822                	sd	s0,16(sp)
    80203744:	e426                	sd	s1,8(sp)
    80203746:	e04a                	sd	s2,0(sp)
    80203748:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    8020374a:	00006597          	auipc	a1,0x6
    8020374e:	41658593          	addi	a1,a1,1046 # 80209b60 <digits+0x7e0>
    80203752:	0001a517          	auipc	a0,0x1a
    80203756:	cfe50513          	addi	a0,a0,-770 # 8021d450 <ftable>
    8020375a:	ffffd097          	auipc	ra,0xffffd
    8020375e:	f28080e7          	jalr	-216(ra) # 80200682 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203762:	0001a497          	auipc	s1,0x1a
    80203766:	d0648493          	addi	s1,s1,-762 # 8021d468 <ftable+0x18>
    8020376a:	0001b917          	auipc	s2,0x1b
    8020376e:	c9e90913          	addi	s2,s2,-866 # 8021e408 <tickslock>
    memset(f, 0, sizeof(struct file));
    80203772:	02800613          	li	a2,40
    80203776:	4581                	li	a1,0
    80203778:	8526                	mv	a0,s1
    8020377a:	ffffd097          	auipc	ra,0xffffd
    8020377e:	fe8080e7          	jalr	-24(ra) # 80200762 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203782:	02848493          	addi	s1,s1,40
    80203786:	ff2496e3          	bne	s1,s2,80203772 <fileinit+0x34>
  }
  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    8020378a:	60e2                	ld	ra,24(sp)
    8020378c:	6442                	ld	s0,16(sp)
    8020378e:	64a2                	ld	s1,8(sp)
    80203790:	6902                	ld	s2,0(sp)
    80203792:	6105                	addi	sp,sp,32
    80203794:	8082                	ret

0000000080203796 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80203796:	1101                	addi	sp,sp,-32
    80203798:	ec06                	sd	ra,24(sp)
    8020379a:	e822                	sd	s0,16(sp)
    8020379c:	e426                	sd	s1,8(sp)
    8020379e:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    802037a0:	0001a517          	auipc	a0,0x1a
    802037a4:	cb050513          	addi	a0,a0,-848 # 8021d450 <ftable>
    802037a8:	ffffd097          	auipc	ra,0xffffd
    802037ac:	f1e080e7          	jalr	-226(ra) # 802006c6 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    802037b0:	0001a497          	auipc	s1,0x1a
    802037b4:	cb848493          	addi	s1,s1,-840 # 8021d468 <ftable+0x18>
    802037b8:	0001b717          	auipc	a4,0x1b
    802037bc:	c5070713          	addi	a4,a4,-944 # 8021e408 <tickslock>
    if(f->ref == 0){
    802037c0:	40dc                	lw	a5,4(s1)
    802037c2:	cf99                	beqz	a5,802037e0 <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    802037c4:	02848493          	addi	s1,s1,40
    802037c8:	fee49ce3          	bne	s1,a4,802037c0 <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    802037cc:	0001a517          	auipc	a0,0x1a
    802037d0:	c8450513          	addi	a0,a0,-892 # 8021d450 <ftable>
    802037d4:	ffffd097          	auipc	ra,0xffffd
    802037d8:	f46080e7          	jalr	-186(ra) # 8020071a <release>
  return NULL;
    802037dc:	4481                	li	s1,0
    802037de:	a819                	j	802037f4 <filealloc+0x5e>
      f->ref = 1;
    802037e0:	4785                	li	a5,1
    802037e2:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    802037e4:	0001a517          	auipc	a0,0x1a
    802037e8:	c6c50513          	addi	a0,a0,-916 # 8021d450 <ftable>
    802037ec:	ffffd097          	auipc	ra,0xffffd
    802037f0:	f2e080e7          	jalr	-210(ra) # 8020071a <release>
}
    802037f4:	8526                	mv	a0,s1
    802037f6:	60e2                	ld	ra,24(sp)
    802037f8:	6442                	ld	s0,16(sp)
    802037fa:	64a2                	ld	s1,8(sp)
    802037fc:	6105                	addi	sp,sp,32
    802037fe:	8082                	ret

0000000080203800 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203800:	1101                	addi	sp,sp,-32
    80203802:	ec06                	sd	ra,24(sp)
    80203804:	e822                	sd	s0,16(sp)
    80203806:	e426                	sd	s1,8(sp)
    80203808:	1000                	addi	s0,sp,32
    8020380a:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    8020380c:	0001a517          	auipc	a0,0x1a
    80203810:	c4450513          	addi	a0,a0,-956 # 8021d450 <ftable>
    80203814:	ffffd097          	auipc	ra,0xffffd
    80203818:	eb2080e7          	jalr	-334(ra) # 802006c6 <acquire>
  if(f->ref < 1)
    8020381c:	40dc                	lw	a5,4(s1)
    8020381e:	02f05263          	blez	a5,80203842 <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203822:	2785                	addiw	a5,a5,1
    80203824:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203826:	0001a517          	auipc	a0,0x1a
    8020382a:	c2a50513          	addi	a0,a0,-982 # 8021d450 <ftable>
    8020382e:	ffffd097          	auipc	ra,0xffffd
    80203832:	eec080e7          	jalr	-276(ra) # 8020071a <release>
  return f;
}
    80203836:	8526                	mv	a0,s1
    80203838:	60e2                	ld	ra,24(sp)
    8020383a:	6442                	ld	s0,16(sp)
    8020383c:	64a2                	ld	s1,8(sp)
    8020383e:	6105                	addi	sp,sp,32
    80203840:	8082                	ret
    panic("filedup");
    80203842:	00006517          	auipc	a0,0x6
    80203846:	32650513          	addi	a0,a0,806 # 80209b68 <digits+0x7e8>
    8020384a:	ffffd097          	auipc	ra,0xffffd
    8020384e:	8fa080e7          	jalr	-1798(ra) # 80200144 <panic>

0000000080203852 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80203852:	7139                	addi	sp,sp,-64
    80203854:	fc06                	sd	ra,56(sp)
    80203856:	f822                	sd	s0,48(sp)
    80203858:	f426                	sd	s1,40(sp)
    8020385a:	f04a                	sd	s2,32(sp)
    8020385c:	ec4e                	sd	s3,24(sp)
    8020385e:	e852                	sd	s4,16(sp)
    80203860:	e456                	sd	s5,8(sp)
    80203862:	0080                	addi	s0,sp,64
    80203864:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80203866:	0001a517          	auipc	a0,0x1a
    8020386a:	bea50513          	addi	a0,a0,-1046 # 8021d450 <ftable>
    8020386e:	ffffd097          	auipc	ra,0xffffd
    80203872:	e58080e7          	jalr	-424(ra) # 802006c6 <acquire>
  if(f->ref < 1)
    80203876:	40dc                	lw	a5,4(s1)
    80203878:	04f05863          	blez	a5,802038c8 <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    8020387c:	37fd                	addiw	a5,a5,-1
    8020387e:	0007871b          	sext.w	a4,a5
    80203882:	c0dc                	sw	a5,4(s1)
    80203884:	04e04a63          	bgtz	a4,802038d8 <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    80203888:	0004a903          	lw	s2,0(s1)
    8020388c:	0094ca03          	lbu	s4,9(s1)
    80203890:	0104b983          	ld	s3,16(s1)
    80203894:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    80203898:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    8020389c:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    802038a0:	0001a517          	auipc	a0,0x1a
    802038a4:	bb050513          	addi	a0,a0,-1104 # 8021d450 <ftable>
    802038a8:	ffffd097          	auipc	ra,0xffffd
    802038ac:	e72080e7          	jalr	-398(ra) # 8020071a <release>

  if(ff.type == FD_PIPE){
    802038b0:	4785                	li	a5,1
    802038b2:	04f90463          	beq	s2,a5,802038fa <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    802038b6:	4789                	li	a5,2
    802038b8:	02f91863          	bne	s2,a5,802038e8 <fileclose+0x96>
    eput(ff.ep);
    802038bc:	8556                	mv	a0,s5
    802038be:	00003097          	auipc	ra,0x3
    802038c2:	984080e7          	jalr	-1660(ra) # 80206242 <eput>
    802038c6:	a00d                	j	802038e8 <fileclose+0x96>
    panic("fileclose");
    802038c8:	00006517          	auipc	a0,0x6
    802038cc:	2a850513          	addi	a0,a0,680 # 80209b70 <digits+0x7f0>
    802038d0:	ffffd097          	auipc	ra,0xffffd
    802038d4:	874080e7          	jalr	-1932(ra) # 80200144 <panic>
    release(&ftable.lock);
    802038d8:	0001a517          	auipc	a0,0x1a
    802038dc:	b7850513          	addi	a0,a0,-1160 # 8021d450 <ftable>
    802038e0:	ffffd097          	auipc	ra,0xffffd
    802038e4:	e3a080e7          	jalr	-454(ra) # 8020071a <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    802038e8:	70e2                	ld	ra,56(sp)
    802038ea:	7442                	ld	s0,48(sp)
    802038ec:	74a2                	ld	s1,40(sp)
    802038ee:	7902                	ld	s2,32(sp)
    802038f0:	69e2                	ld	s3,24(sp)
    802038f2:	6a42                	ld	s4,16(sp)
    802038f4:	6aa2                	ld	s5,8(sp)
    802038f6:	6121                	addi	sp,sp,64
    802038f8:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    802038fa:	85d2                	mv	a1,s4
    802038fc:	854e                	mv	a0,s3
    802038fe:	00000097          	auipc	ra,0x0
    80203902:	3a0080e7          	jalr	928(ra) # 80203c9e <pipeclose>
    80203906:	b7cd                	j	802038e8 <fileclose+0x96>

0000000080203908 <filestat>:
filestat(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80203908:	4118                	lw	a4,0(a0)
    8020390a:	4789                	li	a5,2
    8020390c:	04f71e63          	bne	a4,a5,80203968 <filestat+0x60>
{
    80203910:	7159                	addi	sp,sp,-112
    80203912:	f486                	sd	ra,104(sp)
    80203914:	f0a2                	sd	s0,96(sp)
    80203916:	eca6                	sd	s1,88(sp)
    80203918:	e8ca                	sd	s2,80(sp)
    8020391a:	e4ce                	sd	s3,72(sp)
    8020391c:	1880                	addi	s0,sp,112
    8020391e:	84aa                	mv	s1,a0
    80203920:	892e                	mv	s2,a1
    elock(f->ep);
    80203922:	6d08                	ld	a0,24(a0)
    80203924:	00003097          	auipc	ra,0x3
    80203928:	89a080e7          	jalr	-1894(ra) # 802061be <elock>
    estat(f->ep, &st);
    8020392c:	f9840993          	addi	s3,s0,-104
    80203930:	85ce                	mv	a1,s3
    80203932:	6c88                	ld	a0,24(s1)
    80203934:	00003097          	auipc	ra,0x3
    80203938:	a46080e7          	jalr	-1466(ra) # 8020637a <estat>
    eunlock(f->ep);
    8020393c:	6c88                	ld	a0,24(s1)
    8020393e:	00003097          	auipc	ra,0x3
    80203942:	8b6080e7          	jalr	-1866(ra) # 802061f4 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203946:	03800613          	li	a2,56
    8020394a:	85ce                	mv	a1,s3
    8020394c:	854a                	mv	a0,s2
    8020394e:	ffffe097          	auipc	ra,0xffffe
    80203952:	a24080e7          	jalr	-1500(ra) # 80201372 <copyout2>
    80203956:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    8020395a:	70a6                	ld	ra,104(sp)
    8020395c:	7406                	ld	s0,96(sp)
    8020395e:	64e6                	ld	s1,88(sp)
    80203960:	6946                	ld	s2,80(sp)
    80203962:	69a6                	ld	s3,72(sp)
    80203964:	6165                	addi	sp,sp,112
    80203966:	8082                	ret
  return -1;
    80203968:	557d                	li	a0,-1
}
    8020396a:	8082                	ret

000000008020396c <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    8020396c:	7179                	addi	sp,sp,-48
    8020396e:	f406                	sd	ra,40(sp)
    80203970:	f022                	sd	s0,32(sp)
    80203972:	ec26                	sd	s1,24(sp)
    80203974:	e84a                	sd	s2,16(sp)
    80203976:	e44e                	sd	s3,8(sp)
    80203978:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    8020397a:	00854783          	lbu	a5,8(a0)
    8020397e:	c3d5                	beqz	a5,80203a22 <fileread+0xb6>
    80203980:	84aa                	mv	s1,a0
    80203982:	89ae                	mv	s3,a1
    80203984:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    80203986:	411c                	lw	a5,0(a0)
    80203988:	4709                	li	a4,2
    8020398a:	06e78263          	beq	a5,a4,802039ee <fileread+0x82>
    8020398e:	470d                	li	a4,3
    80203990:	02e78b63          	beq	a5,a4,802039c6 <fileread+0x5a>
    80203994:	4705                	li	a4,1
    80203996:	00e78a63          	beq	a5,a4,802039aa <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    8020399a:	00006517          	auipc	a0,0x6
    8020399e:	1e650513          	addi	a0,a0,486 # 80209b80 <digits+0x800>
    802039a2:	ffffc097          	auipc	ra,0xffffc
    802039a6:	7a2080e7          	jalr	1954(ra) # 80200144 <panic>
        r = piperead(f->pipe, addr, n);
    802039aa:	6908                	ld	a0,16(a0)
    802039ac:	00000097          	auipc	ra,0x0
    802039b0:	466080e7          	jalr	1126(ra) # 80203e12 <piperead>
    802039b4:	892a                	mv	s2,a0
  }

  return r;
}
    802039b6:	854a                	mv	a0,s2
    802039b8:	70a2                	ld	ra,40(sp)
    802039ba:	7402                	ld	s0,32(sp)
    802039bc:	64e2                	ld	s1,24(sp)
    802039be:	6942                	ld	s2,16(sp)
    802039c0:	69a2                	ld	s3,8(sp)
    802039c2:	6145                	addi	sp,sp,48
    802039c4:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    802039c6:	02451783          	lh	a5,36(a0)
    802039ca:	03079693          	slli	a3,a5,0x30
    802039ce:	92c1                	srli	a3,a3,0x30
    802039d0:	4725                	li	a4,9
    802039d2:	04d76a63          	bltu	a4,a3,80203a26 <fileread+0xba>
    802039d6:	0792                	slli	a5,a5,0x4
    802039d8:	0001a717          	auipc	a4,0x1a
    802039dc:	9d870713          	addi	a4,a4,-1576 # 8021d3b0 <devsw>
    802039e0:	97ba                	add	a5,a5,a4
    802039e2:	639c                	ld	a5,0(a5)
    802039e4:	c3b9                	beqz	a5,80203a2a <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    802039e6:	4505                	li	a0,1
    802039e8:	9782                	jalr	a5
    802039ea:	892a                	mv	s2,a0
        break;
    802039ec:	b7e9                	j	802039b6 <fileread+0x4a>
        elock(f->ep);
    802039ee:	6d08                	ld	a0,24(a0)
    802039f0:	00002097          	auipc	ra,0x2
    802039f4:	7ce080e7          	jalr	1998(ra) # 802061be <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    802039f8:	874a                	mv	a4,s2
    802039fa:	5094                	lw	a3,32(s1)
    802039fc:	864e                	mv	a2,s3
    802039fe:	4585                	li	a1,1
    80203a00:	6c88                	ld	a0,24(s1)
    80203a02:	00002097          	auipc	ra,0x2
    80203a06:	eb8080e7          	jalr	-328(ra) # 802058ba <eread>
    80203a0a:	892a                	mv	s2,a0
    80203a0c:	00a05563          	blez	a0,80203a16 <fileread+0xaa>
            f->off += r;
    80203a10:	509c                	lw	a5,32(s1)
    80203a12:	9fa9                	addw	a5,a5,a0
    80203a14:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80203a16:	6c88                	ld	a0,24(s1)
    80203a18:	00002097          	auipc	ra,0x2
    80203a1c:	7dc080e7          	jalr	2012(ra) # 802061f4 <eunlock>
        break;
    80203a20:	bf59                	j	802039b6 <fileread+0x4a>
    return -1;
    80203a22:	597d                	li	s2,-1
    80203a24:	bf49                	j	802039b6 <fileread+0x4a>
          return -1;
    80203a26:	597d                	li	s2,-1
    80203a28:	b779                	j	802039b6 <fileread+0x4a>
    80203a2a:	597d                	li	s2,-1
    80203a2c:	b769                	j	802039b6 <fileread+0x4a>

0000000080203a2e <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80203a2e:	7179                	addi	sp,sp,-48
    80203a30:	f406                	sd	ra,40(sp)
    80203a32:	f022                	sd	s0,32(sp)
    80203a34:	ec26                	sd	s1,24(sp)
    80203a36:	e84a                	sd	s2,16(sp)
    80203a38:	e44e                	sd	s3,8(sp)
    80203a3a:	e052                	sd	s4,0(sp)
    80203a3c:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80203a3e:	00954783          	lbu	a5,9(a0)
    80203a42:	cbc5                	beqz	a5,80203af2 <filewrite+0xc4>
    80203a44:	84aa                	mv	s1,a0
    80203a46:	892e                	mv	s2,a1
    80203a48:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80203a4a:	411c                	lw	a5,0(a0)
    80203a4c:	4705                	li	a4,1
    80203a4e:	04e78963          	beq	a5,a4,80203aa0 <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80203a52:	470d                	li	a4,3
    80203a54:	04e78d63          	beq	a5,a4,80203aae <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80203a58:	4709                	li	a4,2
    80203a5a:	08e79463          	bne	a5,a4,80203ae2 <filewrite+0xb4>
    elock(f->ep);
    80203a5e:	6d08                	ld	a0,24(a0)
    80203a60:	00002097          	auipc	ra,0x2
    80203a64:	75e080e7          	jalr	1886(ra) # 802061be <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203a68:	00098a1b          	sext.w	s4,s3
    80203a6c:	8752                	mv	a4,s4
    80203a6e:	5094                	lw	a3,32(s1)
    80203a70:	864a                	mv	a2,s2
    80203a72:	4585                	li	a1,1
    80203a74:	6c88                	ld	a0,24(s1)
    80203a76:	00002097          	auipc	ra,0x2
    80203a7a:	f3c080e7          	jalr	-196(ra) # 802059b2 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80203a7e:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203a80:	05350b63          	beq	a0,s3,80203ad6 <filewrite+0xa8>
    }
    eunlock(f->ep);
    80203a84:	6c88                	ld	a0,24(s1)
    80203a86:	00002097          	auipc	ra,0x2
    80203a8a:	76e080e7          	jalr	1902(ra) # 802061f4 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80203a8e:	854a                	mv	a0,s2
    80203a90:	70a2                	ld	ra,40(sp)
    80203a92:	7402                	ld	s0,32(sp)
    80203a94:	64e2                	ld	s1,24(sp)
    80203a96:	6942                	ld	s2,16(sp)
    80203a98:	69a2                	ld	s3,8(sp)
    80203a9a:	6a02                	ld	s4,0(sp)
    80203a9c:	6145                	addi	sp,sp,48
    80203a9e:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    80203aa0:	6908                	ld	a0,16(a0)
    80203aa2:	00000097          	auipc	ra,0x0
    80203aa6:	26c080e7          	jalr	620(ra) # 80203d0e <pipewrite>
    80203aaa:	892a                	mv	s2,a0
    80203aac:	b7cd                	j	80203a8e <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80203aae:	02451783          	lh	a5,36(a0)
    80203ab2:	03079693          	slli	a3,a5,0x30
    80203ab6:	92c1                	srli	a3,a3,0x30
    80203ab8:	4725                	li	a4,9
    80203aba:	02d76e63          	bltu	a4,a3,80203af6 <filewrite+0xc8>
    80203abe:	0792                	slli	a5,a5,0x4
    80203ac0:	0001a717          	auipc	a4,0x1a
    80203ac4:	8f070713          	addi	a4,a4,-1808 # 8021d3b0 <devsw>
    80203ac8:	97ba                	add	a5,a5,a4
    80203aca:	679c                	ld	a5,8(a5)
    80203acc:	c79d                	beqz	a5,80203afa <filewrite+0xcc>
    ret = devsw[f->major].write(1, addr, n);
    80203ace:	4505                	li	a0,1
    80203ad0:	9782                	jalr	a5
    80203ad2:	892a                	mv	s2,a0
    80203ad4:	bf6d                	j	80203a8e <filewrite+0x60>
      f->off += n;
    80203ad6:	509c                	lw	a5,32(s1)
    80203ad8:	014787bb          	addw	a5,a5,s4
    80203adc:	d09c                	sw	a5,32(s1)
      ret = n;
    80203ade:	894e                	mv	s2,s3
    80203ae0:	b755                	j	80203a84 <filewrite+0x56>
    panic("filewrite");
    80203ae2:	00006517          	auipc	a0,0x6
    80203ae6:	0ae50513          	addi	a0,a0,174 # 80209b90 <digits+0x810>
    80203aea:	ffffc097          	auipc	ra,0xffffc
    80203aee:	65a080e7          	jalr	1626(ra) # 80200144 <panic>
    return -1;
    80203af2:	597d                	li	s2,-1
    80203af4:	bf69                	j	80203a8e <filewrite+0x60>
      return -1;
    80203af6:	597d                	li	s2,-1
    80203af8:	bf59                	j	80203a8e <filewrite+0x60>
    80203afa:	597d                	li	s2,-1
    80203afc:	bf49                	j	80203a8e <filewrite+0x60>

0000000080203afe <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203afe:	00854783          	lbu	a5,8(a0)
    80203b02:	cfdd                	beqz	a5,80203bc0 <dirnext+0xc2>
{
    80203b04:	7141                	addi	sp,sp,-496
    80203b06:	f786                	sd	ra,488(sp)
    80203b08:	f3a2                	sd	s0,480(sp)
    80203b0a:	efa6                	sd	s1,472(sp)
    80203b0c:	ebca                	sd	s2,464(sp)
    80203b0e:	e7ce                	sd	s3,456(sp)
    80203b10:	e3d2                	sd	s4,448(sp)
    80203b12:	ff56                	sd	s5,440(sp)
    80203b14:	1b80                	addi	s0,sp,496
    80203b16:	84aa                	mv	s1,a0
    80203b18:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203b1a:	6d18                	ld	a4,24(a0)
    80203b1c:	10074783          	lbu	a5,256(a4)
    80203b20:	8bc1                	andi	a5,a5,16
    return -1;
    80203b22:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203b24:	eb91                	bnez	a5,80203b38 <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
    80203b26:	70be                	ld	ra,488(sp)
    80203b28:	741e                	ld	s0,480(sp)
    80203b2a:	64fe                	ld	s1,472(sp)
    80203b2c:	695e                	ld	s2,464(sp)
    80203b2e:	69be                	ld	s3,456(sp)
    80203b30:	6a1e                	ld	s4,448(sp)
    80203b32:	7afa                	ld	s5,440(sp)
    80203b34:	617d                	addi	sp,sp,496
    80203b36:	8082                	ret
  int count = 0;
    80203b38:	e0042e23          	sw	zero,-484(s0)
  elock(f->ep);
    80203b3c:	853a                	mv	a0,a4
    80203b3e:	00002097          	auipc	ra,0x2
    80203b42:	680080e7          	jalr	1664(ra) # 802061be <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203b46:	e1c40a13          	addi	s4,s0,-484
    80203b4a:	e5840993          	addi	s3,s0,-424
    80203b4e:	a801                	j	80203b5e <dirnext+0x60>
    f->off += count * 32;
    80203b50:	e1c42783          	lw	a5,-484(s0)
    80203b54:	0057979b          	slliw	a5,a5,0x5
    80203b58:	5098                	lw	a4,32(s1)
    80203b5a:	9fb9                	addw	a5,a5,a4
    80203b5c:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203b5e:	86d2                	mv	a3,s4
    80203b60:	5090                	lw	a2,32(s1)
    80203b62:	85ce                	mv	a1,s3
    80203b64:	6c88                	ld	a0,24(s1)
    80203b66:	00003097          	auipc	ra,0x3
    80203b6a:	85c080e7          	jalr	-1956(ra) # 802063c2 <enext>
    80203b6e:	892a                	mv	s2,a0
    80203b70:	d165                	beqz	a0,80203b50 <dirnext+0x52>
  eunlock(f->ep);
    80203b72:	6c88                	ld	a0,24(s1)
    80203b74:	00002097          	auipc	ra,0x2
    80203b78:	680080e7          	jalr	1664(ra) # 802061f4 <eunlock>
  if (ret == -1)
    80203b7c:	57fd                	li	a5,-1
    return 0;
    80203b7e:	4501                	li	a0,0
  if (ret == -1)
    80203b80:	faf903e3          	beq	s2,a5,80203b26 <dirnext+0x28>
  f->off += count * 32;
    80203b84:	e1c42783          	lw	a5,-484(s0)
    80203b88:	0057979b          	slliw	a5,a5,0x5
    80203b8c:	5098                	lw	a4,32(s1)
    80203b8e:	9fb9                	addw	a5,a5,a4
    80203b90:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    80203b92:	e2040493          	addi	s1,s0,-480
    80203b96:	85a6                	mv	a1,s1
    80203b98:	e5840513          	addi	a0,s0,-424
    80203b9c:	00002097          	auipc	ra,0x2
    80203ba0:	7de080e7          	jalr	2014(ra) # 8020637a <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203ba4:	03800613          	li	a2,56
    80203ba8:	85a6                	mv	a1,s1
    80203baa:	8556                	mv	a0,s5
    80203bac:	ffffd097          	auipc	ra,0xffffd
    80203bb0:	7c6080e7          	jalr	1990(ra) # 80201372 <copyout2>
    return -1;
    80203bb4:	fff54513          	not	a0,a0
    80203bb8:	957d                	srai	a0,a0,0x3f
    80203bba:	8909                	andi	a0,a0,2
    80203bbc:	157d                	addi	a0,a0,-1
    80203bbe:	b7a5                	j	80203b26 <dirnext+0x28>
    return -1;
    80203bc0:	557d                	li	a0,-1
    80203bc2:	8082                	ret

0000000080203bc4 <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    80203bc4:	7179                	addi	sp,sp,-48
    80203bc6:	f406                	sd	ra,40(sp)
    80203bc8:	f022                	sd	s0,32(sp)
    80203bca:	ec26                	sd	s1,24(sp)
    80203bcc:	e84a                	sd	s2,16(sp)
    80203bce:	e44e                	sd	s3,8(sp)
    80203bd0:	e052                	sd	s4,0(sp)
    80203bd2:	1800                	addi	s0,sp,48
    80203bd4:	84aa                	mv	s1,a0
    80203bd6:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    80203bd8:	0005b023          	sd	zero,0(a1)
    80203bdc:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    80203be0:	00000097          	auipc	ra,0x0
    80203be4:	bb6080e7          	jalr	-1098(ra) # 80203796 <filealloc>
    80203be8:	e088                	sd	a0,0(s1)
    80203bea:	c551                	beqz	a0,80203c76 <pipealloc+0xb2>
    80203bec:	00000097          	auipc	ra,0x0
    80203bf0:	baa080e7          	jalr	-1110(ra) # 80203796 <filealloc>
    80203bf4:	00aa3023          	sd	a0,0(s4)
    80203bf8:	c92d                	beqz	a0,80203c6a <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80203bfa:	ffffd097          	auipc	ra,0xffffd
    80203bfe:	960080e7          	jalr	-1696(ra) # 8020055a <kalloc>
    80203c02:	892a                	mv	s2,a0
    80203c04:	c125                	beqz	a0,80203c64 <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    80203c06:	4985                	li	s3,1
    80203c08:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80203c0c:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    80203c10:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    80203c14:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80203c18:	00006597          	auipc	a1,0x6
    80203c1c:	db858593          	addi	a1,a1,-584 # 802099d0 <digits+0x650>
    80203c20:	ffffd097          	auipc	ra,0xffffd
    80203c24:	a62080e7          	jalr	-1438(ra) # 80200682 <initlock>
  (*f0)->type = FD_PIPE;
    80203c28:	609c                	ld	a5,0(s1)
    80203c2a:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    80203c2e:	609c                	ld	a5,0(s1)
    80203c30:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    80203c34:	609c                	ld	a5,0(s1)
    80203c36:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80203c3a:	609c                	ld	a5,0(s1)
    80203c3c:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    80203c40:	000a3783          	ld	a5,0(s4)
    80203c44:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    80203c48:	000a3783          	ld	a5,0(s4)
    80203c4c:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80203c50:	000a3783          	ld	a5,0(s4)
    80203c54:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    80203c58:	000a3783          	ld	a5,0(s4)
    80203c5c:	0127b823          	sd	s2,16(a5)
  return 0;
    80203c60:	4501                	li	a0,0
    80203c62:	a025                	j	80203c8a <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    80203c64:	6088                	ld	a0,0(s1)
    80203c66:	e501                	bnez	a0,80203c6e <pipealloc+0xaa>
    80203c68:	a039                	j	80203c76 <pipealloc+0xb2>
    80203c6a:	6088                	ld	a0,0(s1)
    80203c6c:	c51d                	beqz	a0,80203c9a <pipealloc+0xd6>
    fileclose(*f0);
    80203c6e:	00000097          	auipc	ra,0x0
    80203c72:	be4080e7          	jalr	-1052(ra) # 80203852 <fileclose>
  if(*f1)
    80203c76:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    80203c7a:	557d                	li	a0,-1
  if(*f1)
    80203c7c:	c799                	beqz	a5,80203c8a <pipealloc+0xc6>
    fileclose(*f1);
    80203c7e:	853e                	mv	a0,a5
    80203c80:	00000097          	auipc	ra,0x0
    80203c84:	bd2080e7          	jalr	-1070(ra) # 80203852 <fileclose>
  return -1;
    80203c88:	557d                	li	a0,-1
}
    80203c8a:	70a2                	ld	ra,40(sp)
    80203c8c:	7402                	ld	s0,32(sp)
    80203c8e:	64e2                	ld	s1,24(sp)
    80203c90:	6942                	ld	s2,16(sp)
    80203c92:	69a2                	ld	s3,8(sp)
    80203c94:	6a02                	ld	s4,0(sp)
    80203c96:	6145                	addi	sp,sp,48
    80203c98:	8082                	ret
  return -1;
    80203c9a:	557d                	li	a0,-1
    80203c9c:	b7fd                	j	80203c8a <pipealloc+0xc6>

0000000080203c9e <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80203c9e:	1101                	addi	sp,sp,-32
    80203ca0:	ec06                	sd	ra,24(sp)
    80203ca2:	e822                	sd	s0,16(sp)
    80203ca4:	e426                	sd	s1,8(sp)
    80203ca6:	e04a                	sd	s2,0(sp)
    80203ca8:	1000                	addi	s0,sp,32
    80203caa:	84aa                	mv	s1,a0
    80203cac:	892e                	mv	s2,a1
  acquire(&pi->lock);
    80203cae:	ffffd097          	auipc	ra,0xffffd
    80203cb2:	a18080e7          	jalr	-1512(ra) # 802006c6 <acquire>
  if(writable){
    80203cb6:	02090d63          	beqz	s2,80203cf0 <pipeclose+0x52>
    pi->writeopen = 0;
    80203cba:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    80203cbe:	21848513          	addi	a0,s1,536
    80203cc2:	ffffe097          	auipc	ra,0xffffe
    80203cc6:	79a080e7          	jalr	1946(ra) # 8020245c <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80203cca:	2204b783          	ld	a5,544(s1)
    80203cce:	eb95                	bnez	a5,80203d02 <pipeclose+0x64>
    release(&pi->lock);
    80203cd0:	8526                	mv	a0,s1
    80203cd2:	ffffd097          	auipc	ra,0xffffd
    80203cd6:	a48080e7          	jalr	-1464(ra) # 8020071a <release>
    kfree((char*)pi);
    80203cda:	8526                	mv	a0,s1
    80203cdc:	ffffc097          	auipc	ra,0xffffc
    80203ce0:	764080e7          	jalr	1892(ra) # 80200440 <kfree>
  } else
    release(&pi->lock);
}
    80203ce4:	60e2                	ld	ra,24(sp)
    80203ce6:	6442                	ld	s0,16(sp)
    80203ce8:	64a2                	ld	s1,8(sp)
    80203cea:	6902                	ld	s2,0(sp)
    80203cec:	6105                	addi	sp,sp,32
    80203cee:	8082                	ret
    pi->readopen = 0;
    80203cf0:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    80203cf4:	21c48513          	addi	a0,s1,540
    80203cf8:	ffffe097          	auipc	ra,0xffffe
    80203cfc:	764080e7          	jalr	1892(ra) # 8020245c <wakeup>
    80203d00:	b7e9                	j	80203cca <pipeclose+0x2c>
    release(&pi->lock);
    80203d02:	8526                	mv	a0,s1
    80203d04:	ffffd097          	auipc	ra,0xffffd
    80203d08:	a16080e7          	jalr	-1514(ra) # 8020071a <release>
}
    80203d0c:	bfe1                	j	80203ce4 <pipeclose+0x46>

0000000080203d0e <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80203d0e:	7159                	addi	sp,sp,-112
    80203d10:	f486                	sd	ra,104(sp)
    80203d12:	f0a2                	sd	s0,96(sp)
    80203d14:	eca6                	sd	s1,88(sp)
    80203d16:	e8ca                	sd	s2,80(sp)
    80203d18:	e4ce                	sd	s3,72(sp)
    80203d1a:	e0d2                	sd	s4,64(sp)
    80203d1c:	fc56                	sd	s5,56(sp)
    80203d1e:	f85a                	sd	s6,48(sp)
    80203d20:	f45e                	sd	s7,40(sp)
    80203d22:	f062                	sd	s8,32(sp)
    80203d24:	ec66                	sd	s9,24(sp)
    80203d26:	1880                	addi	s0,sp,112
    80203d28:	84aa                	mv	s1,a0
    80203d2a:	8b2e                	mv	s6,a1
    80203d2c:	8ab2                	mv	s5,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    80203d2e:	ffffe097          	auipc	ra,0xffffe
    80203d32:	d0e080e7          	jalr	-754(ra) # 80201a3c <myproc>
    80203d36:	892a                	mv	s2,a0

  acquire(&pi->lock);
    80203d38:	8526                	mv	a0,s1
    80203d3a:	ffffd097          	auipc	ra,0xffffd
    80203d3e:	98c080e7          	jalr	-1652(ra) # 802006c6 <acquire>
  for(i = 0; i < n; i++){
    80203d42:	09505763          	blez	s5,80203dd0 <pipewrite+0xc2>
    80203d46:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    80203d48:	21848a13          	addi	s4,s1,536
      sleep(&pi->nwrite, &pi->lock);
    80203d4c:	21c48993          	addi	s3,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    80203d50:	f9f40c93          	addi	s9,s0,-97
    80203d54:	5c7d                	li	s8,-1
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80203d56:	2184a783          	lw	a5,536(s1)
    80203d5a:	21c4a703          	lw	a4,540(s1)
    80203d5e:	2007879b          	addiw	a5,a5,512
    80203d62:	02f71b63          	bne	a4,a5,80203d98 <pipewrite+0x8a>
      if(pi->readopen == 0 || pr->killed){
    80203d66:	2204a783          	lw	a5,544(s1)
    80203d6a:	c3c1                	beqz	a5,80203dea <pipewrite+0xdc>
    80203d6c:	03092783          	lw	a5,48(s2)
    80203d70:	efad                	bnez	a5,80203dea <pipewrite+0xdc>
      wakeup(&pi->nread);
    80203d72:	8552                	mv	a0,s4
    80203d74:	ffffe097          	auipc	ra,0xffffe
    80203d78:	6e8080e7          	jalr	1768(ra) # 8020245c <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80203d7c:	85a6                	mv	a1,s1
    80203d7e:	854e                	mv	a0,s3
    80203d80:	ffffe097          	auipc	ra,0xffffe
    80203d84:	560080e7          	jalr	1376(ra) # 802022e0 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80203d88:	2184a783          	lw	a5,536(s1)
    80203d8c:	21c4a703          	lw	a4,540(s1)
    80203d90:	2007879b          	addiw	a5,a5,512
    80203d94:	fcf709e3          	beq	a4,a5,80203d66 <pipewrite+0x58>
    if(copyin2(&ch, addr + i, 1) == -1)
    80203d98:	4605                	li	a2,1
    80203d9a:	85da                	mv	a1,s6
    80203d9c:	8566                	mv	a0,s9
    80203d9e:	ffffd097          	auipc	ra,0xffffd
    80203da2:	6b4080e7          	jalr	1716(ra) # 80201452 <copyin2>
    80203da6:	03850663          	beq	a0,s8,80203dd2 <pipewrite+0xc4>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80203daa:	21c4a783          	lw	a5,540(s1)
    80203dae:	0017871b          	addiw	a4,a5,1
    80203db2:	20e4ae23          	sw	a4,540(s1)
    80203db6:	1ff7f793          	andi	a5,a5,511
    80203dba:	97a6                	add	a5,a5,s1
    80203dbc:	f9f44703          	lbu	a4,-97(s0)
    80203dc0:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    80203dc4:	2b85                	addiw	s7,s7,1
    80203dc6:	0b05                	addi	s6,s6,1
    80203dc8:	f97a97e3          	bne	s5,s7,80203d56 <pipewrite+0x48>
    80203dcc:	8bd6                	mv	s7,s5
    80203dce:	a011                	j	80203dd2 <pipewrite+0xc4>
    80203dd0:	4b81                	li	s7,0
  }
  wakeup(&pi->nread);
    80203dd2:	21848513          	addi	a0,s1,536
    80203dd6:	ffffe097          	auipc	ra,0xffffe
    80203dda:	686080e7          	jalr	1670(ra) # 8020245c <wakeup>
  release(&pi->lock);
    80203dde:	8526                	mv	a0,s1
    80203de0:	ffffd097          	auipc	ra,0xffffd
    80203de4:	93a080e7          	jalr	-1734(ra) # 8020071a <release>
  return i;
    80203de8:	a039                	j	80203df6 <pipewrite+0xe8>
        release(&pi->lock);
    80203dea:	8526                	mv	a0,s1
    80203dec:	ffffd097          	auipc	ra,0xffffd
    80203df0:	92e080e7          	jalr	-1746(ra) # 8020071a <release>
        return -1;
    80203df4:	5bfd                	li	s7,-1
}
    80203df6:	855e                	mv	a0,s7
    80203df8:	70a6                	ld	ra,104(sp)
    80203dfa:	7406                	ld	s0,96(sp)
    80203dfc:	64e6                	ld	s1,88(sp)
    80203dfe:	6946                	ld	s2,80(sp)
    80203e00:	69a6                	ld	s3,72(sp)
    80203e02:	6a06                	ld	s4,64(sp)
    80203e04:	7ae2                	ld	s5,56(sp)
    80203e06:	7b42                	ld	s6,48(sp)
    80203e08:	7ba2                	ld	s7,40(sp)
    80203e0a:	7c02                	ld	s8,32(sp)
    80203e0c:	6ce2                	ld	s9,24(sp)
    80203e0e:	6165                	addi	sp,sp,112
    80203e10:	8082                	ret

0000000080203e12 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80203e12:	715d                	addi	sp,sp,-80
    80203e14:	e486                	sd	ra,72(sp)
    80203e16:	e0a2                	sd	s0,64(sp)
    80203e18:	fc26                	sd	s1,56(sp)
    80203e1a:	f84a                	sd	s2,48(sp)
    80203e1c:	f44e                	sd	s3,40(sp)
    80203e1e:	f052                	sd	s4,32(sp)
    80203e20:	ec56                	sd	s5,24(sp)
    80203e22:	e85a                	sd	s6,16(sp)
    80203e24:	0880                	addi	s0,sp,80
    80203e26:	84aa                	mv	s1,a0
    80203e28:	892e                	mv	s2,a1
    80203e2a:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    80203e2c:	ffffe097          	auipc	ra,0xffffe
    80203e30:	c10080e7          	jalr	-1008(ra) # 80201a3c <myproc>
    80203e34:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    80203e36:	8526                	mv	a0,s1
    80203e38:	ffffd097          	auipc	ra,0xffffd
    80203e3c:	88e080e7          	jalr	-1906(ra) # 802006c6 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203e40:	2184a703          	lw	a4,536(s1)
    80203e44:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80203e48:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203e4c:	02f71463          	bne	a4,a5,80203e74 <piperead+0x62>
    80203e50:	2244a783          	lw	a5,548(s1)
    80203e54:	c385                	beqz	a5,80203e74 <piperead+0x62>
    if(pr->killed){
    80203e56:	0309a783          	lw	a5,48(s3)
    80203e5a:	ebc1                	bnez	a5,80203eea <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80203e5c:	85a6                	mv	a1,s1
    80203e5e:	8556                	mv	a0,s5
    80203e60:	ffffe097          	auipc	ra,0xffffe
    80203e64:	480080e7          	jalr	1152(ra) # 802022e0 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203e68:	2184a703          	lw	a4,536(s1)
    80203e6c:	21c4a783          	lw	a5,540(s1)
    80203e70:	fef700e3          	beq	a4,a5,80203e50 <piperead+0x3e>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80203e74:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    80203e76:	fbf40b13          	addi	s6,s0,-65
    80203e7a:	5afd                	li	s5,-1
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80203e7c:	05405163          	blez	s4,80203ebe <piperead+0xac>
    if(pi->nread == pi->nwrite)
    80203e80:	2184a783          	lw	a5,536(s1)
    80203e84:	21c4a703          	lw	a4,540(s1)
    80203e88:	02f70b63          	beq	a4,a5,80203ebe <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    80203e8c:	0017871b          	addiw	a4,a5,1
    80203e90:	20e4ac23          	sw	a4,536(s1)
    80203e94:	1ff7f793          	andi	a5,a5,511
    80203e98:	97a6                	add	a5,a5,s1
    80203e9a:	0187c783          	lbu	a5,24(a5)
    80203e9e:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    80203ea2:	4605                	li	a2,1
    80203ea4:	85da                	mv	a1,s6
    80203ea6:	854a                	mv	a0,s2
    80203ea8:	ffffd097          	auipc	ra,0xffffd
    80203eac:	4ca080e7          	jalr	1226(ra) # 80201372 <copyout2>
    80203eb0:	01550763          	beq	a0,s5,80203ebe <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80203eb4:	2985                	addiw	s3,s3,1
    80203eb6:	0905                	addi	s2,s2,1
    80203eb8:	fd3a14e3          	bne	s4,s3,80203e80 <piperead+0x6e>
    80203ebc:	89d2                	mv	s3,s4
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    80203ebe:	21c48513          	addi	a0,s1,540
    80203ec2:	ffffe097          	auipc	ra,0xffffe
    80203ec6:	59a080e7          	jalr	1434(ra) # 8020245c <wakeup>
  release(&pi->lock);
    80203eca:	8526                	mv	a0,s1
    80203ecc:	ffffd097          	auipc	ra,0xffffd
    80203ed0:	84e080e7          	jalr	-1970(ra) # 8020071a <release>
  return i;
}
    80203ed4:	854e                	mv	a0,s3
    80203ed6:	60a6                	ld	ra,72(sp)
    80203ed8:	6406                	ld	s0,64(sp)
    80203eda:	74e2                	ld	s1,56(sp)
    80203edc:	7942                	ld	s2,48(sp)
    80203ede:	79a2                	ld	s3,40(sp)
    80203ee0:	7a02                	ld	s4,32(sp)
    80203ee2:	6ae2                	ld	s5,24(sp)
    80203ee4:	6b42                	ld	s6,16(sp)
    80203ee6:	6161                	addi	sp,sp,80
    80203ee8:	8082                	ret
      release(&pi->lock);
    80203eea:	8526                	mv	a0,s1
    80203eec:	ffffd097          	auipc	ra,0xffffd
    80203ef0:	82e080e7          	jalr	-2002(ra) # 8020071a <release>
      return -1;
    80203ef4:	59fd                	li	s3,-1
    80203ef6:	bff9                	j	80203ed4 <piperead+0xc2>

0000000080203ef8 <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    80203ef8:	dd010113          	addi	sp,sp,-560
    80203efc:	22113423          	sd	ra,552(sp)
    80203f00:	22813023          	sd	s0,544(sp)
    80203f04:	20913c23          	sd	s1,536(sp)
    80203f08:	21213823          	sd	s2,528(sp)
    80203f0c:	21313423          	sd	s3,520(sp)
    80203f10:	21413023          	sd	s4,512(sp)
    80203f14:	ffd6                	sd	s5,504(sp)
    80203f16:	fbda                	sd	s6,496(sp)
    80203f18:	f7de                	sd	s7,488(sp)
    80203f1a:	f3e2                	sd	s8,480(sp)
    80203f1c:	efe6                	sd	s9,472(sp)
    80203f1e:	ebea                	sd	s10,464(sp)
    80203f20:	e7ee                	sd	s11,456(sp)
    80203f22:	1c00                	addi	s0,sp,560
    80203f24:	892a                	mv	s2,a0
    80203f26:	dca43c23          	sd	a0,-552(s0)
    80203f2a:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    80203f2e:	ffffe097          	auipc	ra,0xffffe
    80203f32:	b0e080e7          	jalr	-1266(ra) # 80201a3c <myproc>
    80203f36:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    80203f38:	ffffc097          	auipc	ra,0xffffc
    80203f3c:	622080e7          	jalr	1570(ra) # 8020055a <kalloc>
    80203f40:	2a050863          	beqz	a0,802041f0 <exec+0x2f8>
    80203f44:	8b2a                	mv	s6,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    80203f46:	6605                	lui	a2,0x1
    80203f48:	6cac                	ld	a1,88(s1)
    80203f4a:	ffffd097          	auipc	ra,0xffffd
    80203f4e:	874080e7          	jalr	-1932(ra) # 802007be <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    80203f52:	000b3023          	sd	zero,0(s6)
    80203f56:	000b3423          	sd	zero,8(s6)
  }

  if((ep = ename(path)) == NULL) {
    80203f5a:	854a                	mv	a0,s2
    80203f5c:	00003097          	auipc	ra,0x3
    80203f60:	a0a080e7          	jalr	-1526(ra) # 80206966 <ename>
    80203f64:	8a2a                	mv	s4,a0
    80203f66:	3a050e63          	beqz	a0,80204322 <exec+0x42a>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    80203f6a:	00002097          	auipc	ra,0x2
    80203f6e:	254080e7          	jalr	596(ra) # 802061be <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    80203f72:	04000713          	li	a4,64
    80203f76:	4681                	li	a3,0
    80203f78:	e4840613          	addi	a2,s0,-440
    80203f7c:	4581                	li	a1,0
    80203f7e:	8552                	mv	a0,s4
    80203f80:	00002097          	auipc	ra,0x2
    80203f84:	93a080e7          	jalr	-1734(ra) # 802058ba <eread>
    80203f88:	04000793          	li	a5,64
    80203f8c:	00f51a63          	bne	a0,a5,80203fa0 <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80203f90:	e4842703          	lw	a4,-440(s0)
    80203f94:	464c47b7          	lui	a5,0x464c4
    80203f98:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    80203f9c:	00f70963          	beq	a4,a5,80203fae <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    80203fa0:	4581                	li	a1,0
    80203fa2:	855a                	mv	a0,s6
    80203fa4:	ffffd097          	auipc	ra,0xffffd
    80203fa8:	6ce080e7          	jalr	1742(ra) # 80201672 <kvmfree>
  if(ep){
    80203fac:	a4bd                	j	8020421a <exec+0x322>
  if((pagetable = proc_pagetable(p)) == NULL)
    80203fae:	8526                	mv	a0,s1
    80203fb0:	ffffe097          	auipc	ra,0xffffe
    80203fb4:	b70080e7          	jalr	-1168(ra) # 80201b20 <proc_pagetable>
    80203fb8:	e0a43423          	sd	a0,-504(s0)
    80203fbc:	d175                	beqz	a0,80203fa0 <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80203fbe:	e6842783          	lw	a5,-408(s0)
    80203fc2:	e8045703          	lhu	a4,-384(s0)
    80203fc6:	cb3d                	beqz	a4,8020403c <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80203fc8:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80203fca:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80203fce:	e1040713          	addi	a4,s0,-496
    80203fd2:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    80203fd6:	6a85                	lui	s5,0x1
    80203fd8:	fffa8713          	addi	a4,s5,-1 # fff <_entry-0x801ff001>
    80203fdc:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80203fe0:	6d85                	lui	s11,0x1
    80203fe2:	7d7d                	lui	s10,0xfffff
    80203fe4:	a4c9                	j	802042a6 <exec+0x3ae>
      panic("loadseg: address should exist");
    80203fe6:	00006517          	auipc	a0,0x6
    80203fea:	bba50513          	addi	a0,a0,-1094 # 80209ba0 <digits+0x820>
    80203fee:	ffffc097          	auipc	ra,0xffffc
    80203ff2:	156080e7          	jalr	342(ra) # 80200144 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    80203ff6:	874a                	mv	a4,s2
    80203ff8:	009c86bb          	addw	a3,s9,s1
    80203ffc:	4581                	li	a1,0
    80203ffe:	8552                	mv	a0,s4
    80204000:	00002097          	auipc	ra,0x2
    80204004:	8ba080e7          	jalr	-1862(ra) # 802058ba <eread>
    80204008:	2501                	sext.w	a0,a0
    8020400a:	1ea91763          	bne	s2,a0,802041f8 <exec+0x300>
  for(i = 0; i < sz; i += PGSIZE){
    8020400e:	009d84bb          	addw	s1,s11,s1
    80204012:	013d09bb          	addw	s3,s10,s3
    80204016:	2774f863          	bgeu	s1,s7,80204286 <exec+0x38e>
    pa = walkaddr(pagetable, va + i);
    8020401a:	02049593          	slli	a1,s1,0x20
    8020401e:	9181                	srli	a1,a1,0x20
    80204020:	95e2                	add	a1,a1,s8
    80204022:	e0843503          	ld	a0,-504(s0)
    80204026:	ffffd097          	auipc	ra,0xffffd
    8020402a:	b88080e7          	jalr	-1144(ra) # 80200bae <walkaddr>
    8020402e:	862a                	mv	a2,a0
    if(pa == NULL)
    80204030:	d95d                	beqz	a0,80203fe6 <exec+0xee>
      n = PGSIZE;
    80204032:	8956                	mv	s2,s5
    if(sz - i < PGSIZE)
    80204034:	fd59f1e3          	bgeu	s3,s5,80203ff6 <exec+0xfe>
      n = sz - i;
    80204038:	894e                	mv	s2,s3
    8020403a:	bf75                	j	80203ff6 <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    8020403c:	4481                	li	s1,0
  eunlock(ep);
    8020403e:	8552                	mv	a0,s4
    80204040:	00002097          	auipc	ra,0x2
    80204044:	1b4080e7          	jalr	436(ra) # 802061f4 <eunlock>
  eput(ep);
    80204048:	8552                	mv	a0,s4
    8020404a:	00002097          	auipc	ra,0x2
    8020404e:	1f8080e7          	jalr	504(ra) # 80206242 <eput>
  p = myproc();
    80204052:	ffffe097          	auipc	ra,0xffffe
    80204056:	9ea080e7          	jalr	-1558(ra) # 80201a3c <myproc>
    8020405a:	8aaa                	mv	s5,a0
  uint64 oldsz = p->sz;
    8020405c:	04853d03          	ld	s10,72(a0)
  sz = PGROUNDUP(sz);
    80204060:	6785                	lui	a5,0x1
    80204062:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    80204064:	97a6                	add	a5,a5,s1
    80204066:	777d                	lui	a4,0xfffff
    80204068:	8ff9                	and	a5,a5,a4
    8020406a:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    8020406e:	6689                	lui	a3,0x2
    80204070:	96be                	add	a3,a3,a5
    80204072:	863e                	mv	a2,a5
    80204074:	85da                	mv	a1,s6
    80204076:	e0843483          	ld	s1,-504(s0)
    8020407a:	8526                	mv	a0,s1
    8020407c:	ffffd097          	auipc	ra,0xffffd
    80204080:	f8e080e7          	jalr	-114(ra) # 8020100a <uvmalloc>
    80204084:	8caa                	mv	s9,a0
  ep = 0;
    80204086:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    80204088:	16050863          	beqz	a0,802041f8 <exec+0x300>
  uvmclear(pagetable, sz-2*PGSIZE);
    8020408c:	75f9                	lui	a1,0xffffe
    8020408e:	95aa                	add	a1,a1,a0
    80204090:	8526                	mv	a0,s1
    80204092:	ffffd097          	auipc	ra,0xffffd
    80204096:	222080e7          	jalr	546(ra) # 802012b4 <uvmclear>
  stackbase = sp - PGSIZE;
    8020409a:	7bfd                	lui	s7,0xfffff
    8020409c:	9be6                	add	s7,s7,s9
  for(argc = 0; argv[argc]; argc++) {
    8020409e:	de843783          	ld	a5,-536(s0)
    802040a2:	6388                	ld	a0,0(a5)
    802040a4:	c92d                	beqz	a0,80204116 <exec+0x21e>
    802040a6:	e8840993          	addi	s3,s0,-376
    802040aa:	f8840c13          	addi	s8,s0,-120
  sp = sz;
    802040ae:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    802040b0:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    802040b2:	ffffd097          	auipc	ra,0xffffd
    802040b6:	834080e7          	jalr	-1996(ra) # 802008e6 <strlen>
    802040ba:	0015079b          	addiw	a5,a0,1
    802040be:	40f907b3          	sub	a5,s2,a5
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    802040c2:	ff07f913          	andi	s2,a5,-16
    if(sp < stackbase)
    802040c6:	1b796463          	bltu	s2,s7,8020426e <exec+0x376>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    802040ca:	de843d83          	ld	s11,-536(s0)
    802040ce:	000dba03          	ld	s4,0(s11) # 1000 <_entry-0x801ff000>
    802040d2:	8552                	mv	a0,s4
    802040d4:	ffffd097          	auipc	ra,0xffffd
    802040d8:	812080e7          	jalr	-2030(ra) # 802008e6 <strlen>
    802040dc:	0015069b          	addiw	a3,a0,1
    802040e0:	8652                	mv	a2,s4
    802040e2:	85ca                	mv	a1,s2
    802040e4:	e0843503          	ld	a0,-504(s0)
    802040e8:	ffffd097          	auipc	ra,0xffffd
    802040ec:	1fe080e7          	jalr	510(ra) # 802012e6 <copyout>
    802040f0:	18054363          	bltz	a0,80204276 <exec+0x37e>
    ustack[argc] = sp;
    802040f4:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    802040f8:	0485                	addi	s1,s1,1
    802040fa:	008d8793          	addi	a5,s11,8
    802040fe:	def43423          	sd	a5,-536(s0)
    80204102:	008db503          	ld	a0,8(s11)
    80204106:	c911                	beqz	a0,8020411a <exec+0x222>
    if(argc >= MAXARG)
    80204108:	09a1                	addi	s3,s3,8
    8020410a:	fb3c14e3          	bne	s8,s3,802040b2 <exec+0x1ba>
  sz = sz1;
    8020410e:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204112:	4a01                	li	s4,0
    80204114:	a0d5                	j	802041f8 <exec+0x300>
  sp = sz;
    80204116:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    80204118:	4481                	li	s1,0
  ustack[argc] = 0;
    8020411a:	00349793          	slli	a5,s1,0x3
    8020411e:	f9078793          	addi	a5,a5,-112
    80204122:	97a2                	add	a5,a5,s0
    80204124:	ee07bc23          	sd	zero,-264(a5)
  sp -= (argc+1) * sizeof(uint64);
    80204128:	00148693          	addi	a3,s1,1
    8020412c:	068e                	slli	a3,a3,0x3
    8020412e:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    80204132:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    80204136:	01797663          	bgeu	s2,s7,80204142 <exec+0x24a>
  sz = sz1;
    8020413a:	df943823          	sd	s9,-528(s0)
  ep = 0;
    8020413e:	4a01                	li	s4,0
    80204140:	a865                	j	802041f8 <exec+0x300>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80204142:	e8840613          	addi	a2,s0,-376
    80204146:	85ca                	mv	a1,s2
    80204148:	e0843503          	ld	a0,-504(s0)
    8020414c:	ffffd097          	auipc	ra,0xffffd
    80204150:	19a080e7          	jalr	410(ra) # 802012e6 <copyout>
    80204154:	12054563          	bltz	a0,8020427e <exec+0x386>
  p->trapframe->a1 = sp;
    80204158:	060ab783          	ld	a5,96(s5)
    8020415c:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    80204160:	dd843783          	ld	a5,-552(s0)
    80204164:	0007c703          	lbu	a4,0(a5)
    80204168:	cf11                	beqz	a4,80204184 <exec+0x28c>
    8020416a:	0785                	addi	a5,a5,1
    if(*s == '/')
    8020416c:	02f00693          	li	a3,47
    80204170:	a039                	j	8020417e <exec+0x286>
      last = s+1;
    80204172:	dcf43c23          	sd	a5,-552(s0)
  for(last=s=path; *s; s++)
    80204176:	0785                	addi	a5,a5,1
    80204178:	fff7c703          	lbu	a4,-1(a5)
    8020417c:	c701                	beqz	a4,80204184 <exec+0x28c>
    if(*s == '/')
    8020417e:	fed71ce3          	bne	a4,a3,80204176 <exec+0x27e>
    80204182:	bfc5                	j	80204172 <exec+0x27a>
  safestrcpy(p->name, last, sizeof(p->name));
    80204184:	4641                	li	a2,16
    80204186:	dd843583          	ld	a1,-552(s0)
    8020418a:	160a8513          	addi	a0,s5,352
    8020418e:	ffffc097          	auipc	ra,0xffffc
    80204192:	726080e7          	jalr	1830(ra) # 802008b4 <safestrcpy>
  oldpagetable = p->pagetable;
    80204196:	050ab503          	ld	a0,80(s5)
  oldkpagetable = p->kpagetable;
    8020419a:	058ab983          	ld	s3,88(s5)
  p->pagetable = pagetable;
    8020419e:	e0843783          	ld	a5,-504(s0)
    802041a2:	04fab823          	sd	a5,80(s5)
  p->kpagetable = kpagetable;
    802041a6:	056abc23          	sd	s6,88(s5)
  p->sz = sz;
    802041aa:	059ab423          	sd	s9,72(s5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    802041ae:	060ab783          	ld	a5,96(s5)
    802041b2:	e6043703          	ld	a4,-416(s0)
    802041b6:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    802041b8:	060ab783          	ld	a5,96(s5)
    802041bc:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    802041c0:	85ea                	mv	a1,s10
    802041c2:	ffffe097          	auipc	ra,0xffffe
    802041c6:	9fa080e7          	jalr	-1542(ra) # 80201bbc <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    802041ca:	058ab783          	ld	a5,88(s5)
    802041ce:	83b1                	srli	a5,a5,0xc
    802041d0:	577d                	li	a4,-1
    802041d2:	177e                	slli	a4,a4,0x3f
    802041d4:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    802041d6:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    802041da:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    802041de:	4581                	li	a1,0
    802041e0:	854e                	mv	a0,s3
    802041e2:	ffffd097          	auipc	ra,0xffffd
    802041e6:	490080e7          	jalr	1168(ra) # 80201672 <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    802041ea:	0004851b          	sext.w	a0,s1
    802041ee:	a089                	j	80204230 <exec+0x338>
    return -1;
    802041f0:	557d                	li	a0,-1
    802041f2:	a83d                	j	80204230 <exec+0x338>
    802041f4:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    802041f8:	df043583          	ld	a1,-528(s0)
    802041fc:	e0843503          	ld	a0,-504(s0)
    80204200:	ffffe097          	auipc	ra,0xffffe
    80204204:	9bc080e7          	jalr	-1604(ra) # 80201bbc <proc_freepagetable>
    kvmfree(kpagetable, 0);
    80204208:	4581                	li	a1,0
    8020420a:	855a                	mv	a0,s6
    8020420c:	ffffd097          	auipc	ra,0xffffd
    80204210:	466080e7          	jalr	1126(ra) # 80201672 <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    80204214:	557d                	li	a0,-1
  if(ep){
    80204216:	000a0d63          	beqz	s4,80204230 <exec+0x338>
    eunlock(ep);
    8020421a:	8552                	mv	a0,s4
    8020421c:	00002097          	auipc	ra,0x2
    80204220:	fd8080e7          	jalr	-40(ra) # 802061f4 <eunlock>
    eput(ep);
    80204224:	8552                	mv	a0,s4
    80204226:	00002097          	auipc	ra,0x2
    8020422a:	01c080e7          	jalr	28(ra) # 80206242 <eput>
  return -1;
    8020422e:	557d                	li	a0,-1
}
    80204230:	22813083          	ld	ra,552(sp)
    80204234:	22013403          	ld	s0,544(sp)
    80204238:	21813483          	ld	s1,536(sp)
    8020423c:	21013903          	ld	s2,528(sp)
    80204240:	20813983          	ld	s3,520(sp)
    80204244:	20013a03          	ld	s4,512(sp)
    80204248:	7afe                	ld	s5,504(sp)
    8020424a:	7b5e                	ld	s6,496(sp)
    8020424c:	7bbe                	ld	s7,488(sp)
    8020424e:	7c1e                	ld	s8,480(sp)
    80204250:	6cfe                	ld	s9,472(sp)
    80204252:	6d5e                	ld	s10,464(sp)
    80204254:	6dbe                	ld	s11,456(sp)
    80204256:	23010113          	addi	sp,sp,560
    8020425a:	8082                	ret
    8020425c:	de943823          	sd	s1,-528(s0)
    80204260:	bf61                	j	802041f8 <exec+0x300>
    80204262:	de943823          	sd	s1,-528(s0)
    80204266:	bf49                	j	802041f8 <exec+0x300>
    80204268:	de943823          	sd	s1,-528(s0)
    8020426c:	b771                	j	802041f8 <exec+0x300>
  sz = sz1;
    8020426e:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204272:	4a01                	li	s4,0
    80204274:	b751                	j	802041f8 <exec+0x300>
  sz = sz1;
    80204276:	df943823          	sd	s9,-528(s0)
  ep = 0;
    8020427a:	4a01                	li	s4,0
    8020427c:	bfb5                	j	802041f8 <exec+0x300>
  sz = sz1;
    8020427e:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204282:	4a01                	li	s4,0
    80204284:	bf95                	j	802041f8 <exec+0x300>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204286:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020428a:	e0043783          	ld	a5,-512(s0)
    8020428e:	0017869b          	addiw	a3,a5,1
    80204292:	e0d43023          	sd	a3,-512(s0)
    80204296:	df843783          	ld	a5,-520(s0)
    8020429a:	0387879b          	addiw	a5,a5,56
    8020429e:	e8045703          	lhu	a4,-384(s0)
    802042a2:	d8e6dee3          	bge	a3,a4,8020403e <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    802042a6:	2781                	sext.w	a5,a5
    802042a8:	def43c23          	sd	a5,-520(s0)
    802042ac:	03800713          	li	a4,56
    802042b0:	86be                	mv	a3,a5
    802042b2:	de043603          	ld	a2,-544(s0)
    802042b6:	4581                	li	a1,0
    802042b8:	8552                	mv	a0,s4
    802042ba:	00001097          	auipc	ra,0x1
    802042be:	600080e7          	jalr	1536(ra) # 802058ba <eread>
    802042c2:	03800793          	li	a5,56
    802042c6:	f2f517e3          	bne	a0,a5,802041f4 <exec+0x2fc>
    if(ph.type != ELF_PROG_LOAD)
    802042ca:	e1042783          	lw	a5,-496(s0)
    802042ce:	4705                	li	a4,1
    802042d0:	fae79de3          	bne	a5,a4,8020428a <exec+0x392>
    if(ph.memsz < ph.filesz)
    802042d4:	e3843683          	ld	a3,-456(s0)
    802042d8:	e3043783          	ld	a5,-464(s0)
    802042dc:	f8f6e0e3          	bltu	a3,a5,8020425c <exec+0x364>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    802042e0:	e2043783          	ld	a5,-480(s0)
    802042e4:	96be                	add	a3,a3,a5
    802042e6:	f6f6eee3          	bltu	a3,a5,80204262 <exec+0x36a>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    802042ea:	8626                	mv	a2,s1
    802042ec:	85da                	mv	a1,s6
    802042ee:	e0843503          	ld	a0,-504(s0)
    802042f2:	ffffd097          	auipc	ra,0xffffd
    802042f6:	d18080e7          	jalr	-744(ra) # 8020100a <uvmalloc>
    802042fa:	dea43823          	sd	a0,-528(s0)
    802042fe:	d52d                	beqz	a0,80204268 <exec+0x370>
    if(ph.vaddr % PGSIZE != 0)
    80204300:	e2043c03          	ld	s8,-480(s0)
    80204304:	dd043783          	ld	a5,-560(s0)
    80204308:	00fc77b3          	and	a5,s8,a5
    8020430c:	ee0796e3          	bnez	a5,802041f8 <exec+0x300>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    80204310:	e1842c83          	lw	s9,-488(s0)
    80204314:	e3042b83          	lw	s7,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204318:	f60b87e3          	beqz	s7,80204286 <exec+0x38e>
    8020431c:	89de                	mv	s3,s7
    8020431e:	4481                	li	s1,0
    80204320:	b9ed                	j	8020401a <exec+0x122>
    kvmfree(kpagetable, 0);
    80204322:	4581                	li	a1,0
    80204324:	855a                	mv	a0,s6
    80204326:	ffffd097          	auipc	ra,0xffffd
    8020432a:	34c080e7          	jalr	844(ra) # 80201672 <kvmfree>
  return -1;
    8020432e:	557d                	li	a0,-1
    80204330:	b701                	j	80204230 <exec+0x338>

0000000080204332 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80204332:	7179                	addi	sp,sp,-48
    80204334:	f406                	sd	ra,40(sp)
    80204336:	f022                	sd	s0,32(sp)
    80204338:	ec26                	sd	s1,24(sp)
    8020433a:	e84a                	sd	s2,16(sp)
    8020433c:	1800                	addi	s0,sp,48
    8020433e:	892e                	mv	s2,a1
    80204340:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80204342:	fdc40593          	addi	a1,s0,-36
    80204346:	fffff097          	auipc	ra,0xfffff
    8020434a:	a9c080e7          	jalr	-1380(ra) # 80202de2 <argint>
    8020434e:	04054063          	bltz	a0,8020438e <argfd+0x5c>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    80204352:	fdc42703          	lw	a4,-36(s0)
    80204356:	47bd                	li	a5,15
    80204358:	02e7ed63          	bltu	a5,a4,80204392 <argfd+0x60>
    8020435c:	ffffd097          	auipc	ra,0xffffd
    80204360:	6e0080e7          	jalr	1760(ra) # 80201a3c <myproc>
    80204364:	fdc42703          	lw	a4,-36(s0)
    80204368:	01a70793          	addi	a5,a4,26 # fffffffffffff01a <ebss_clear+0xffffffff7fdd901a>
    8020436c:	078e                	slli	a5,a5,0x3
    8020436e:	953e                	add	a0,a0,a5
    80204370:	651c                	ld	a5,8(a0)
    80204372:	c395                	beqz	a5,80204396 <argfd+0x64>
    return -1;
  if(pfd)
    80204374:	00090463          	beqz	s2,8020437c <argfd+0x4a>
    *pfd = fd;
    80204378:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    8020437c:	4501                	li	a0,0
  if(pf)
    8020437e:	c091                	beqz	s1,80204382 <argfd+0x50>
    *pf = f;
    80204380:	e09c                	sd	a5,0(s1)
}
    80204382:	70a2                	ld	ra,40(sp)
    80204384:	7402                	ld	s0,32(sp)
    80204386:	64e2                	ld	s1,24(sp)
    80204388:	6942                	ld	s2,16(sp)
    8020438a:	6145                	addi	sp,sp,48
    8020438c:	8082                	ret
    return -1;
    8020438e:	557d                	li	a0,-1
    80204390:	bfcd                	j	80204382 <argfd+0x50>
    return -1;
    80204392:	557d                	li	a0,-1
    80204394:	b7fd                	j	80204382 <argfd+0x50>
    80204396:	557d                	li	a0,-1
    80204398:	b7ed                	j	80204382 <argfd+0x50>

000000008020439a <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    8020439a:	1101                	addi	sp,sp,-32
    8020439c:	ec06                	sd	ra,24(sp)
    8020439e:	e822                	sd	s0,16(sp)
    802043a0:	e426                	sd	s1,8(sp)
    802043a2:	1000                	addi	s0,sp,32
    802043a4:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    802043a6:	ffffd097          	auipc	ra,0xffffd
    802043aa:	696080e7          	jalr	1686(ra) # 80201a3c <myproc>
    802043ae:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    802043b0:	0d850793          	addi	a5,a0,216
    802043b4:	4501                	li	a0,0
    802043b6:	46c1                	li	a3,16
    if(p->ofile[fd] == 0){
    802043b8:	6398                	ld	a4,0(a5)
    802043ba:	cb19                	beqz	a4,802043d0 <fdalloc+0x36>
  for(fd = 0; fd < NOFILE; fd++){
    802043bc:	2505                	addiw	a0,a0,1
    802043be:	07a1                	addi	a5,a5,8
    802043c0:	fed51ce3          	bne	a0,a3,802043b8 <fdalloc+0x1e>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    802043c4:	557d                	li	a0,-1
}
    802043c6:	60e2                	ld	ra,24(sp)
    802043c8:	6442                	ld	s0,16(sp)
    802043ca:	64a2                	ld	s1,8(sp)
    802043cc:	6105                	addi	sp,sp,32
    802043ce:	8082                	ret
      p->ofile[fd] = f;
    802043d0:	01a50793          	addi	a5,a0,26
    802043d4:	078e                	slli	a5,a5,0x3
    802043d6:	963e                	add	a2,a2,a5
    802043d8:	e604                	sd	s1,8(a2)
      return fd;
    802043da:	b7f5                	j	802043c6 <fdalloc+0x2c>

00000000802043dc <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    802043dc:	7169                	addi	sp,sp,-304
    802043de:	f606                	sd	ra,296(sp)
    802043e0:	f222                	sd	s0,288(sp)
    802043e2:	ee26                	sd	s1,280(sp)
    802043e4:	ea4a                	sd	s2,272(sp)
    802043e6:	e64e                	sd	s3,264(sp)
    802043e8:	1a00                	addi	s0,sp,304
    802043ea:	892e                	mv	s2,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    802043ec:	ed040593          	addi	a1,s0,-304
    802043f0:	00002097          	auipc	ra,0x2
    802043f4:	594080e7          	jalr	1428(ra) # 80206984 <enameparent>
    802043f8:	84aa                	mv	s1,a0
    802043fa:	c945                	beqz	a0,802044aa <create+0xce>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    802043fc:	00002097          	auipc	ra,0x2
    80204400:	dc2080e7          	jalr	-574(ra) # 802061be <elock>
  if (type == T_DIR) {
    80204404:	fff90613          	addi	a2,s2,-1
    80204408:	00163613          	seqz	a2,a2
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    8020440c:	0046161b          	slliw	a2,a2,0x4
    80204410:	ed040593          	addi	a1,s0,-304
    80204414:	8526                	mv	a0,s1
    80204416:	00002097          	auipc	ra,0x2
    8020441a:	294080e7          	jalr	660(ra) # 802066aa <ealloc>
    8020441e:	89aa                	mv	s3,a0
    80204420:	c529                	beqz	a0,8020446a <create+0x8e>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204422:	0009079b          	sext.w	a5,s2
    80204426:	4705                	li	a4,1
    80204428:	04e78c63          	beq	a5,a4,80204480 <create+0xa4>
    8020442c:	2901                	sext.w	s2,s2
    8020442e:	4789                	li	a5,2
    80204430:	00f91663          	bne	s2,a5,8020443c <create+0x60>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    80204434:	10054783          	lbu	a5,256(a0)
    80204438:	8bc1                	andi	a5,a5,16
    8020443a:	e7b9                	bnez	a5,80204488 <create+0xac>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    8020443c:	8526                	mv	a0,s1
    8020443e:	00002097          	auipc	ra,0x2
    80204442:	db6080e7          	jalr	-586(ra) # 802061f4 <eunlock>
  eput(dp);
    80204446:	8526                	mv	a0,s1
    80204448:	00002097          	auipc	ra,0x2
    8020444c:	dfa080e7          	jalr	-518(ra) # 80206242 <eput>

  elock(ep);
    80204450:	854e                	mv	a0,s3
    80204452:	00002097          	auipc	ra,0x2
    80204456:	d6c080e7          	jalr	-660(ra) # 802061be <elock>
  return ep;
}
    8020445a:	854e                	mv	a0,s3
    8020445c:	70b2                	ld	ra,296(sp)
    8020445e:	7412                	ld	s0,288(sp)
    80204460:	64f2                	ld	s1,280(sp)
    80204462:	6952                	ld	s2,272(sp)
    80204464:	69b2                	ld	s3,264(sp)
    80204466:	6155                	addi	sp,sp,304
    80204468:	8082                	ret
    eunlock(dp);
    8020446a:	8526                	mv	a0,s1
    8020446c:	00002097          	auipc	ra,0x2
    80204470:	d88080e7          	jalr	-632(ra) # 802061f4 <eunlock>
    eput(dp);
    80204474:	8526                	mv	a0,s1
    80204476:	00002097          	auipc	ra,0x2
    8020447a:	dcc080e7          	jalr	-564(ra) # 80206242 <eput>
    return NULL;
    8020447e:	bff1                	j	8020445a <create+0x7e>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204480:	10054783          	lbu	a5,256(a0)
    80204484:	8bc1                	andi	a5,a5,16
    80204486:	fbdd                	bnez	a5,8020443c <create+0x60>
    eunlock(dp);
    80204488:	8526                	mv	a0,s1
    8020448a:	00002097          	auipc	ra,0x2
    8020448e:	d6a080e7          	jalr	-662(ra) # 802061f4 <eunlock>
    eput(ep);
    80204492:	854e                	mv	a0,s3
    80204494:	00002097          	auipc	ra,0x2
    80204498:	dae080e7          	jalr	-594(ra) # 80206242 <eput>
    eput(dp);
    8020449c:	8526                	mv	a0,s1
    8020449e:	00002097          	auipc	ra,0x2
    802044a2:	da4080e7          	jalr	-604(ra) # 80206242 <eput>
    return NULL;
    802044a6:	4981                	li	s3,0
    802044a8:	bf4d                	j	8020445a <create+0x7e>
    return NULL;
    802044aa:	89aa                	mv	s3,a0
    802044ac:	b77d                	j	8020445a <create+0x7e>

00000000802044ae <sys_dup>:
{
    802044ae:	7179                	addi	sp,sp,-48
    802044b0:	f406                	sd	ra,40(sp)
    802044b2:	f022                	sd	s0,32(sp)
    802044b4:	ec26                	sd	s1,24(sp)
    802044b6:	e84a                	sd	s2,16(sp)
    802044b8:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    802044ba:	fd840613          	addi	a2,s0,-40
    802044be:	4581                	li	a1,0
    802044c0:	4501                	li	a0,0
    802044c2:	00000097          	auipc	ra,0x0
    802044c6:	e70080e7          	jalr	-400(ra) # 80204332 <argfd>
    return -1;
    802044ca:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    802044cc:	02054363          	bltz	a0,802044f2 <sys_dup+0x44>
  if((fd=fdalloc(f)) < 0)
    802044d0:	fd843903          	ld	s2,-40(s0)
    802044d4:	854a                	mv	a0,s2
    802044d6:	00000097          	auipc	ra,0x0
    802044da:	ec4080e7          	jalr	-316(ra) # 8020439a <fdalloc>
    802044de:	84aa                	mv	s1,a0
    return -1;
    802044e0:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    802044e2:	00054863          	bltz	a0,802044f2 <sys_dup+0x44>
  filedup(f);
    802044e6:	854a                	mv	a0,s2
    802044e8:	fffff097          	auipc	ra,0xfffff
    802044ec:	318080e7          	jalr	792(ra) # 80203800 <filedup>
  return fd;
    802044f0:	87a6                	mv	a5,s1
}
    802044f2:	853e                	mv	a0,a5
    802044f4:	70a2                	ld	ra,40(sp)
    802044f6:	7402                	ld	s0,32(sp)
    802044f8:	64e2                	ld	s1,24(sp)
    802044fa:	6942                	ld	s2,16(sp)
    802044fc:	6145                	addi	sp,sp,48
    802044fe:	8082                	ret

0000000080204500 <sys_read>:
{
    80204500:	7179                	addi	sp,sp,-48
    80204502:	f406                	sd	ra,40(sp)
    80204504:	f022                	sd	s0,32(sp)
    80204506:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204508:	fe840613          	addi	a2,s0,-24
    8020450c:	4581                	li	a1,0
    8020450e:	4501                	li	a0,0
    80204510:	00000097          	auipc	ra,0x0
    80204514:	e22080e7          	jalr	-478(ra) # 80204332 <argfd>
    return -1;
    80204518:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020451a:	04054163          	bltz	a0,8020455c <sys_read+0x5c>
    8020451e:	fe440593          	addi	a1,s0,-28
    80204522:	4509                	li	a0,2
    80204524:	fffff097          	auipc	ra,0xfffff
    80204528:	8be080e7          	jalr	-1858(ra) # 80202de2 <argint>
    return -1;
    8020452c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020452e:	02054763          	bltz	a0,8020455c <sys_read+0x5c>
    80204532:	fd840593          	addi	a1,s0,-40
    80204536:	4505                	li	a0,1
    80204538:	fffff097          	auipc	ra,0xfffff
    8020453c:	90c080e7          	jalr	-1780(ra) # 80202e44 <argaddr>
    return -1;
    80204540:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204542:	00054d63          	bltz	a0,8020455c <sys_read+0x5c>
  return fileread(f, p, n);
    80204546:	fe442603          	lw	a2,-28(s0)
    8020454a:	fd843583          	ld	a1,-40(s0)
    8020454e:	fe843503          	ld	a0,-24(s0)
    80204552:	fffff097          	auipc	ra,0xfffff
    80204556:	41a080e7          	jalr	1050(ra) # 8020396c <fileread>
    8020455a:	87aa                	mv	a5,a0
}
    8020455c:	853e                	mv	a0,a5
    8020455e:	70a2                	ld	ra,40(sp)
    80204560:	7402                	ld	s0,32(sp)
    80204562:	6145                	addi	sp,sp,48
    80204564:	8082                	ret

0000000080204566 <sys_write>:
{
    80204566:	7179                	addi	sp,sp,-48
    80204568:	f406                	sd	ra,40(sp)
    8020456a:	f022                	sd	s0,32(sp)
    8020456c:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020456e:	fe840613          	addi	a2,s0,-24
    80204572:	4581                	li	a1,0
    80204574:	4501                	li	a0,0
    80204576:	00000097          	auipc	ra,0x0
    8020457a:	dbc080e7          	jalr	-580(ra) # 80204332 <argfd>
    return -1;
    8020457e:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204580:	04054163          	bltz	a0,802045c2 <sys_write+0x5c>
    80204584:	fe440593          	addi	a1,s0,-28
    80204588:	4509                	li	a0,2
    8020458a:	fffff097          	auipc	ra,0xfffff
    8020458e:	858080e7          	jalr	-1960(ra) # 80202de2 <argint>
    return -1;
    80204592:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204594:	02054763          	bltz	a0,802045c2 <sys_write+0x5c>
    80204598:	fd840593          	addi	a1,s0,-40
    8020459c:	4505                	li	a0,1
    8020459e:	fffff097          	auipc	ra,0xfffff
    802045a2:	8a6080e7          	jalr	-1882(ra) # 80202e44 <argaddr>
    return -1;
    802045a6:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802045a8:	00054d63          	bltz	a0,802045c2 <sys_write+0x5c>
  return filewrite(f, p, n);
    802045ac:	fe442603          	lw	a2,-28(s0)
    802045b0:	fd843583          	ld	a1,-40(s0)
    802045b4:	fe843503          	ld	a0,-24(s0)
    802045b8:	fffff097          	auipc	ra,0xfffff
    802045bc:	476080e7          	jalr	1142(ra) # 80203a2e <filewrite>
    802045c0:	87aa                	mv	a5,a0
}
    802045c2:	853e                	mv	a0,a5
    802045c4:	70a2                	ld	ra,40(sp)
    802045c6:	7402                	ld	s0,32(sp)
    802045c8:	6145                	addi	sp,sp,48
    802045ca:	8082                	ret

00000000802045cc <sys_close>:
{
    802045cc:	1101                	addi	sp,sp,-32
    802045ce:	ec06                	sd	ra,24(sp)
    802045d0:	e822                	sd	s0,16(sp)
    802045d2:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    802045d4:	fe040613          	addi	a2,s0,-32
    802045d8:	fec40593          	addi	a1,s0,-20
    802045dc:	4501                	li	a0,0
    802045de:	00000097          	auipc	ra,0x0
    802045e2:	d54080e7          	jalr	-684(ra) # 80204332 <argfd>
    return -1;
    802045e6:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    802045e8:	02054463          	bltz	a0,80204610 <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    802045ec:	ffffd097          	auipc	ra,0xffffd
    802045f0:	450080e7          	jalr	1104(ra) # 80201a3c <myproc>
    802045f4:	fec42783          	lw	a5,-20(s0)
    802045f8:	07e9                	addi	a5,a5,26
    802045fa:	078e                	slli	a5,a5,0x3
    802045fc:	953e                	add	a0,a0,a5
    802045fe:	00053423          	sd	zero,8(a0)
  fileclose(f);
    80204602:	fe043503          	ld	a0,-32(s0)
    80204606:	fffff097          	auipc	ra,0xfffff
    8020460a:	24c080e7          	jalr	588(ra) # 80203852 <fileclose>
  return 0;
    8020460e:	4781                	li	a5,0
}
    80204610:	853e                	mv	a0,a5
    80204612:	60e2                	ld	ra,24(sp)
    80204614:	6442                	ld	s0,16(sp)
    80204616:	6105                	addi	sp,sp,32
    80204618:	8082                	ret

000000008020461a <sys_fstat>:
{
    8020461a:	1101                	addi	sp,sp,-32
    8020461c:	ec06                	sd	ra,24(sp)
    8020461e:	e822                	sd	s0,16(sp)
    80204620:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204622:	fe840613          	addi	a2,s0,-24
    80204626:	4581                	li	a1,0
    80204628:	4501                	li	a0,0
    8020462a:	00000097          	auipc	ra,0x0
    8020462e:	d08080e7          	jalr	-760(ra) # 80204332 <argfd>
    return -1;
    80204632:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204634:	02054563          	bltz	a0,8020465e <sys_fstat+0x44>
    80204638:	fe040593          	addi	a1,s0,-32
    8020463c:	4505                	li	a0,1
    8020463e:	fffff097          	auipc	ra,0xfffff
    80204642:	806080e7          	jalr	-2042(ra) # 80202e44 <argaddr>
    return -1;
    80204646:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204648:	00054b63          	bltz	a0,8020465e <sys_fstat+0x44>
  return filestat(f, st);
    8020464c:	fe043583          	ld	a1,-32(s0)
    80204650:	fe843503          	ld	a0,-24(s0)
    80204654:	fffff097          	auipc	ra,0xfffff
    80204658:	2b4080e7          	jalr	692(ra) # 80203908 <filestat>
    8020465c:	87aa                	mv	a5,a0
}
    8020465e:	853e                	mv	a0,a5
    80204660:	60e2                	ld	ra,24(sp)
    80204662:	6442                	ld	s0,16(sp)
    80204664:	6105                	addi	sp,sp,32
    80204666:	8082                	ret

0000000080204668 <sys_open>:

uint64
sys_open(void)
{
    80204668:	7129                	addi	sp,sp,-320
    8020466a:	fe06                	sd	ra,312(sp)
    8020466c:	fa22                	sd	s0,304(sp)
    8020466e:	f626                	sd	s1,296(sp)
    80204670:	f24a                	sd	s2,288(sp)
    80204672:	ee4e                	sd	s3,280(sp)
    80204674:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204676:	10400613          	li	a2,260
    8020467a:	ec840593          	addi	a1,s0,-312
    8020467e:	4501                	li	a0,0
    80204680:	ffffe097          	auipc	ra,0xffffe
    80204684:	7e6080e7          	jalr	2022(ra) # 80202e66 <argstr>
    80204688:	87aa                	mv	a5,a0
    return -1;
    8020468a:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    8020468c:	0807ce63          	bltz	a5,80204728 <sys_open+0xc0>
    80204690:	ec440593          	addi	a1,s0,-316
    80204694:	4505                	li	a0,1
    80204696:	ffffe097          	auipc	ra,0xffffe
    8020469a:	74c080e7          	jalr	1868(ra) # 80202de2 <argint>
    8020469e:	0e054163          	bltz	a0,80204780 <sys_open+0x118>

  if(omode & O_CREATE){
    802046a2:	ec442603          	lw	a2,-316(s0)
    802046a6:	20067793          	andi	a5,a2,512
    802046aa:	c7d1                	beqz	a5,80204736 <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    802046ac:	4589                	li	a1,2
    802046ae:	ec840513          	addi	a0,s0,-312
    802046b2:	00000097          	auipc	ra,0x0
    802046b6:	d2a080e7          	jalr	-726(ra) # 802043dc <create>
    802046ba:	892a                	mv	s2,a0
    if(ep == NULL){
    802046bc:	c561                	beqz	a0,80204784 <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    802046be:	fffff097          	auipc	ra,0xfffff
    802046c2:	0d8080e7          	jalr	216(ra) # 80203796 <filealloc>
    802046c6:	89aa                	mv	s3,a0
    802046c8:	c579                	beqz	a0,80204796 <sys_open+0x12e>
    802046ca:	00000097          	auipc	ra,0x0
    802046ce:	cd0080e7          	jalr	-816(ra) # 8020439a <fdalloc>
    802046d2:	84aa                	mv	s1,a0
    802046d4:	0a054c63          	bltz	a0,8020478c <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    802046d8:	10094783          	lbu	a5,256(s2)
    802046dc:	8bc1                	andi	a5,a5,16
    802046de:	e791                	bnez	a5,802046ea <sys_open+0x82>
    802046e0:	ec442783          	lw	a5,-316(s0)
    802046e4:	4007f793          	andi	a5,a5,1024
    802046e8:	e7d1                	bnez	a5,80204774 <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    802046ea:	4789                	li	a5,2
    802046ec:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    802046f0:	ec442783          	lw	a5,-316(s0)
    802046f4:	0047f693          	andi	a3,a5,4
    802046f8:	4701                	li	a4,0
    802046fa:	c299                	beqz	a3,80204700 <sys_open+0x98>
    802046fc:	10892703          	lw	a4,264(s2)
    80204700:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204704:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80204708:	0017c713          	xori	a4,a5,1
    8020470c:	8b05                	andi	a4,a4,1
    8020470e:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204712:	8b8d                	andi	a5,a5,3
    80204714:	00f037b3          	snez	a5,a5
    80204718:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    8020471c:	854a                	mv	a0,s2
    8020471e:	00002097          	auipc	ra,0x2
    80204722:	ad6080e7          	jalr	-1322(ra) # 802061f4 <eunlock>

  return fd;
    80204726:	8526                	mv	a0,s1
}
    80204728:	70f2                	ld	ra,312(sp)
    8020472a:	7452                	ld	s0,304(sp)
    8020472c:	74b2                	ld	s1,296(sp)
    8020472e:	7912                	ld	s2,288(sp)
    80204730:	69f2                	ld	s3,280(sp)
    80204732:	6131                	addi	sp,sp,320
    80204734:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204736:	ec840513          	addi	a0,s0,-312
    8020473a:	00002097          	auipc	ra,0x2
    8020473e:	22c080e7          	jalr	556(ra) # 80206966 <ename>
    80204742:	892a                	mv	s2,a0
    80204744:	c131                	beqz	a0,80204788 <sys_open+0x120>
    elock(ep);
    80204746:	00002097          	auipc	ra,0x2
    8020474a:	a78080e7          	jalr	-1416(ra) # 802061be <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    8020474e:	10094783          	lbu	a5,256(s2)
    80204752:	8bc1                	andi	a5,a5,16
    80204754:	d7ad                	beqz	a5,802046be <sys_open+0x56>
    80204756:	ec442783          	lw	a5,-316(s0)
    8020475a:	d3b5                	beqz	a5,802046be <sys_open+0x56>
      eunlock(ep);
    8020475c:	854a                	mv	a0,s2
    8020475e:	00002097          	auipc	ra,0x2
    80204762:	a96080e7          	jalr	-1386(ra) # 802061f4 <eunlock>
      eput(ep);
    80204766:	854a                	mv	a0,s2
    80204768:	00002097          	auipc	ra,0x2
    8020476c:	ada080e7          	jalr	-1318(ra) # 80206242 <eput>
      return -1;
    80204770:	557d                	li	a0,-1
    80204772:	bf5d                	j	80204728 <sys_open+0xc0>
    etrunc(ep);
    80204774:	854a                	mv	a0,s2
    80204776:	00002097          	auipc	ra,0x2
    8020477a:	9de080e7          	jalr	-1570(ra) # 80206154 <etrunc>
    8020477e:	b7b5                	j	802046ea <sys_open+0x82>
    return -1;
    80204780:	557d                	li	a0,-1
    80204782:	b75d                	j	80204728 <sys_open+0xc0>
      return -1;
    80204784:	557d                	li	a0,-1
    80204786:	b74d                	j	80204728 <sys_open+0xc0>
      return -1;
    80204788:	557d                	li	a0,-1
    8020478a:	bf79                	j	80204728 <sys_open+0xc0>
      fileclose(f);
    8020478c:	854e                	mv	a0,s3
    8020478e:	fffff097          	auipc	ra,0xfffff
    80204792:	0c4080e7          	jalr	196(ra) # 80203852 <fileclose>
    eunlock(ep);
    80204796:	854a                	mv	a0,s2
    80204798:	00002097          	auipc	ra,0x2
    8020479c:	a5c080e7          	jalr	-1444(ra) # 802061f4 <eunlock>
    eput(ep);
    802047a0:	854a                	mv	a0,s2
    802047a2:	00002097          	auipc	ra,0x2
    802047a6:	aa0080e7          	jalr	-1376(ra) # 80206242 <eput>
    return -1;
    802047aa:	557d                	li	a0,-1
    802047ac:	bfb5                	j	80204728 <sys_open+0xc0>

00000000802047ae <sys_mkdir>:

uint64
sys_mkdir(void)
{
    802047ae:	7169                	addi	sp,sp,-304
    802047b0:	f606                	sd	ra,296(sp)
    802047b2:	f222                	sd	s0,288(sp)
    802047b4:	ee26                	sd	s1,280(sp)
    802047b6:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    802047b8:	10400613          	li	a2,260
    802047bc:	ed840593          	addi	a1,s0,-296
    802047c0:	4501                	li	a0,0
    802047c2:	ffffe097          	auipc	ra,0xffffe
    802047c6:	6a4080e7          	jalr	1700(ra) # 80202e66 <argstr>
    return -1;
    802047ca:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    802047cc:	02054663          	bltz	a0,802047f8 <sys_mkdir+0x4a>
    802047d0:	4601                	li	a2,0
    802047d2:	4585                	li	a1,1
    802047d4:	ed840513          	addi	a0,s0,-296
    802047d8:	00000097          	auipc	ra,0x0
    802047dc:	c04080e7          	jalr	-1020(ra) # 802043dc <create>
    802047e0:	84aa                	mv	s1,a0
    802047e2:	c10d                	beqz	a0,80204804 <sys_mkdir+0x56>
  }
  eunlock(ep);
    802047e4:	00002097          	auipc	ra,0x2
    802047e8:	a10080e7          	jalr	-1520(ra) # 802061f4 <eunlock>
  eput(ep);
    802047ec:	8526                	mv	a0,s1
    802047ee:	00002097          	auipc	ra,0x2
    802047f2:	a54080e7          	jalr	-1452(ra) # 80206242 <eput>
  return 0;
    802047f6:	4781                	li	a5,0
}
    802047f8:	853e                	mv	a0,a5
    802047fa:	70b2                	ld	ra,296(sp)
    802047fc:	7412                	ld	s0,288(sp)
    802047fe:	64f2                	ld	s1,280(sp)
    80204800:	6155                	addi	sp,sp,304
    80204802:	8082                	ret
    return -1;
    80204804:	57fd                	li	a5,-1
    80204806:	bfcd                	j	802047f8 <sys_mkdir+0x4a>

0000000080204808 <sys_chdir>:

uint64
sys_chdir(void)
{
    80204808:	7169                	addi	sp,sp,-304
    8020480a:	f606                	sd	ra,296(sp)
    8020480c:	f222                	sd	s0,288(sp)
    8020480e:	ee26                	sd	s1,280(sp)
    80204810:	ea4a                	sd	s2,272(sp)
    80204812:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
    80204814:	ffffd097          	auipc	ra,0xffffd
    80204818:	228080e7          	jalr	552(ra) # 80201a3c <myproc>
    8020481c:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    8020481e:	10400613          	li	a2,260
    80204822:	ed840593          	addi	a1,s0,-296
    80204826:	4501                	li	a0,0
    80204828:	ffffe097          	auipc	ra,0xffffe
    8020482c:	63e080e7          	jalr	1598(ra) # 80202e66 <argstr>
    return -1;
    80204830:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204832:	04054063          	bltz	a0,80204872 <sys_chdir+0x6a>
    80204836:	ed840513          	addi	a0,s0,-296
    8020483a:	00002097          	auipc	ra,0x2
    8020483e:	12c080e7          	jalr	300(ra) # 80206966 <ename>
    80204842:	84aa                	mv	s1,a0
    80204844:	c931                	beqz	a0,80204898 <sys_chdir+0x90>
  }
  elock(ep);
    80204846:	00002097          	auipc	ra,0x2
    8020484a:	978080e7          	jalr	-1672(ra) # 802061be <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    8020484e:	1004c783          	lbu	a5,256(s1)
    80204852:	8bc1                	andi	a5,a5,16
    80204854:	c795                	beqz	a5,80204880 <sys_chdir+0x78>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    80204856:	8526                	mv	a0,s1
    80204858:	00002097          	auipc	ra,0x2
    8020485c:	99c080e7          	jalr	-1636(ra) # 802061f4 <eunlock>
  eput(p->cwd);
    80204860:	15893503          	ld	a0,344(s2)
    80204864:	00002097          	auipc	ra,0x2
    80204868:	9de080e7          	jalr	-1570(ra) # 80206242 <eput>
  p->cwd = ep;
    8020486c:	14993c23          	sd	s1,344(s2)
  return 0;
    80204870:	4781                	li	a5,0
}
    80204872:	853e                	mv	a0,a5
    80204874:	70b2                	ld	ra,296(sp)
    80204876:	7412                	ld	s0,288(sp)
    80204878:	64f2                	ld	s1,280(sp)
    8020487a:	6952                	ld	s2,272(sp)
    8020487c:	6155                	addi	sp,sp,304
    8020487e:	8082                	ret
    eunlock(ep);
    80204880:	8526                	mv	a0,s1
    80204882:	00002097          	auipc	ra,0x2
    80204886:	972080e7          	jalr	-1678(ra) # 802061f4 <eunlock>
    eput(ep);
    8020488a:	8526                	mv	a0,s1
    8020488c:	00002097          	auipc	ra,0x2
    80204890:	9b6080e7          	jalr	-1610(ra) # 80206242 <eput>
    return -1;
    80204894:	57fd                	li	a5,-1
    80204896:	bff1                	j	80204872 <sys_chdir+0x6a>
    return -1;
    80204898:	57fd                	li	a5,-1
    8020489a:	bfe1                	j	80204872 <sys_chdir+0x6a>

000000008020489c <sys_pipe>:

uint64
sys_pipe(void)
{
    8020489c:	7139                	addi	sp,sp,-64
    8020489e:	fc06                	sd	ra,56(sp)
    802048a0:	f822                	sd	s0,48(sp)
    802048a2:	f426                	sd	s1,40(sp)
    802048a4:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    802048a6:	ffffd097          	auipc	ra,0xffffd
    802048aa:	196080e7          	jalr	406(ra) # 80201a3c <myproc>
    802048ae:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    802048b0:	fd840593          	addi	a1,s0,-40
    802048b4:	4501                	li	a0,0
    802048b6:	ffffe097          	auipc	ra,0xffffe
    802048ba:	58e080e7          	jalr	1422(ra) # 80202e44 <argaddr>
    return -1;
    802048be:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    802048c0:	0c054e63          	bltz	a0,8020499c <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    802048c4:	fc840593          	addi	a1,s0,-56
    802048c8:	fd040513          	addi	a0,s0,-48
    802048cc:	fffff097          	auipc	ra,0xfffff
    802048d0:	2f8080e7          	jalr	760(ra) # 80203bc4 <pipealloc>
    return -1;
    802048d4:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    802048d6:	0c054363          	bltz	a0,8020499c <sys_pipe+0x100>
  fd0 = -1;
    802048da:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    802048de:	fd043503          	ld	a0,-48(s0)
    802048e2:	00000097          	auipc	ra,0x0
    802048e6:	ab8080e7          	jalr	-1352(ra) # 8020439a <fdalloc>
    802048ea:	fca42223          	sw	a0,-60(s0)
    802048ee:	08054a63          	bltz	a0,80204982 <sys_pipe+0xe6>
    802048f2:	fc843503          	ld	a0,-56(s0)
    802048f6:	00000097          	auipc	ra,0x0
    802048fa:	aa4080e7          	jalr	-1372(ra) # 8020439a <fdalloc>
    802048fe:	fca42023          	sw	a0,-64(s0)
    80204902:	06054763          	bltz	a0,80204970 <sys_pipe+0xd4>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204906:	4611                	li	a2,4
    80204908:	fc440593          	addi	a1,s0,-60
    8020490c:	fd843503          	ld	a0,-40(s0)
    80204910:	ffffd097          	auipc	ra,0xffffd
    80204914:	a62080e7          	jalr	-1438(ra) # 80201372 <copyout2>
    80204918:	00054f63          	bltz	a0,80204936 <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    8020491c:	4611                	li	a2,4
    8020491e:	fc040593          	addi	a1,s0,-64
    80204922:	fd843503          	ld	a0,-40(s0)
    80204926:	0511                	addi	a0,a0,4
    80204928:	ffffd097          	auipc	ra,0xffffd
    8020492c:	a4a080e7          	jalr	-1462(ra) # 80201372 <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80204930:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204932:	06055563          	bgez	a0,8020499c <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80204936:	fc442783          	lw	a5,-60(s0)
    8020493a:	07e9                	addi	a5,a5,26
    8020493c:	078e                	slli	a5,a5,0x3
    8020493e:	97a6                	add	a5,a5,s1
    80204940:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80204944:	fc042783          	lw	a5,-64(s0)
    80204948:	07e9                	addi	a5,a5,26
    8020494a:	078e                	slli	a5,a5,0x3
    8020494c:	00f48533          	add	a0,s1,a5
    80204950:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204954:	fd043503          	ld	a0,-48(s0)
    80204958:	fffff097          	auipc	ra,0xfffff
    8020495c:	efa080e7          	jalr	-262(ra) # 80203852 <fileclose>
    fileclose(wf);
    80204960:	fc843503          	ld	a0,-56(s0)
    80204964:	fffff097          	auipc	ra,0xfffff
    80204968:	eee080e7          	jalr	-274(ra) # 80203852 <fileclose>
    return -1;
    8020496c:	57fd                	li	a5,-1
    8020496e:	a03d                	j	8020499c <sys_pipe+0x100>
    if(fd0 >= 0)
    80204970:	fc442783          	lw	a5,-60(s0)
    80204974:	0007c763          	bltz	a5,80204982 <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    80204978:	07e9                	addi	a5,a5,26
    8020497a:	078e                	slli	a5,a5,0x3
    8020497c:	97a6                	add	a5,a5,s1
    8020497e:	0007b423          	sd	zero,8(a5)
    fileclose(rf);
    80204982:	fd043503          	ld	a0,-48(s0)
    80204986:	fffff097          	auipc	ra,0xfffff
    8020498a:	ecc080e7          	jalr	-308(ra) # 80203852 <fileclose>
    fileclose(wf);
    8020498e:	fc843503          	ld	a0,-56(s0)
    80204992:	fffff097          	auipc	ra,0xfffff
    80204996:	ec0080e7          	jalr	-320(ra) # 80203852 <fileclose>
    return -1;
    8020499a:	57fd                	li	a5,-1
}
    8020499c:	853e                	mv	a0,a5
    8020499e:	70e2                	ld	ra,56(sp)
    802049a0:	7442                	ld	s0,48(sp)
    802049a2:	74a2                	ld	s1,40(sp)
    802049a4:	6121                	addi	sp,sp,64
    802049a6:	8082                	ret

00000000802049a8 <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    802049a8:	7179                	addi	sp,sp,-48
    802049aa:	f406                	sd	ra,40(sp)
    802049ac:	f022                	sd	s0,32(sp)
    802049ae:	ec26                	sd	s1,24(sp)
    802049b0:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    802049b2:	fdc40593          	addi	a1,s0,-36
    802049b6:	4501                	li	a0,0
    802049b8:	ffffe097          	auipc	ra,0xffffe
    802049bc:	42a080e7          	jalr	1066(ra) # 80202de2 <argint>
    802049c0:	08054a63          	bltz	a0,80204a54 <sys_dev+0xac>
    802049c4:	fd840593          	addi	a1,s0,-40
    802049c8:	4505                	li	a0,1
    802049ca:	ffffe097          	auipc	ra,0xffffe
    802049ce:	418080e7          	jalr	1048(ra) # 80202de2 <argint>
    802049d2:	08054763          	bltz	a0,80204a60 <sys_dev+0xb8>
    802049d6:	fd440593          	addi	a1,s0,-44
    802049da:	4509                	li	a0,2
    802049dc:	ffffe097          	auipc	ra,0xffffe
    802049e0:	406080e7          	jalr	1030(ra) # 80202de2 <argint>
    802049e4:	08054063          	bltz	a0,80204a64 <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    802049e8:	fdc42783          	lw	a5,-36(s0)
    802049ec:	2007f793          	andi	a5,a5,512
    802049f0:	ebb1                	bnez	a5,80204a44 <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    802049f2:	fd842703          	lw	a4,-40(s0)
    802049f6:	47a5                	li	a5,9
    return -1;
    802049f8:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    802049fa:	04e7ee63          	bltu	a5,a4,80204a56 <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    802049fe:	fffff097          	auipc	ra,0xfffff
    80204a02:	d98080e7          	jalr	-616(ra) # 80203796 <filealloc>
    80204a06:	84aa                	mv	s1,a0
    80204a08:	c125                	beqz	a0,80204a68 <sys_dev+0xc0>
    80204a0a:	00000097          	auipc	ra,0x0
    80204a0e:	990080e7          	jalr	-1648(ra) # 8020439a <fdalloc>
    80204a12:	04054d63          	bltz	a0,80204a6c <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80204a16:	478d                	li	a5,3
    80204a18:	c09c                	sw	a5,0(s1)
  f->off = 0;
    80204a1a:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80204a1e:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80204a22:	fd842783          	lw	a5,-40(s0)
    80204a26:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    80204a2a:	fdc42783          	lw	a5,-36(s0)
    80204a2e:	0017c713          	xori	a4,a5,1
    80204a32:	8b05                	andi	a4,a4,1
    80204a34:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204a38:	8b8d                	andi	a5,a5,3
    80204a3a:	00f037b3          	snez	a5,a5
    80204a3e:	00f484a3          	sb	a5,9(s1)

  return fd;
    80204a42:	a811                	j	80204a56 <sys_dev+0xae>
    panic("dev file on FAT");
    80204a44:	00005517          	auipc	a0,0x5
    80204a48:	17c50513          	addi	a0,a0,380 # 80209bc0 <digits+0x840>
    80204a4c:	ffffb097          	auipc	ra,0xffffb
    80204a50:	6f8080e7          	jalr	1784(ra) # 80200144 <panic>
    return -1;
    80204a54:	557d                	li	a0,-1
}
    80204a56:	70a2                	ld	ra,40(sp)
    80204a58:	7402                	ld	s0,32(sp)
    80204a5a:	64e2                	ld	s1,24(sp)
    80204a5c:	6145                	addi	sp,sp,48
    80204a5e:	8082                	ret
    return -1;
    80204a60:	557d                	li	a0,-1
    80204a62:	bfd5                	j	80204a56 <sys_dev+0xae>
    80204a64:	557d                	li	a0,-1
    80204a66:	bfc5                	j	80204a56 <sys_dev+0xae>
    return -1;
    80204a68:	557d                	li	a0,-1
    80204a6a:	b7f5                	j	80204a56 <sys_dev+0xae>
      fileclose(f);
    80204a6c:	8526                	mv	a0,s1
    80204a6e:	fffff097          	auipc	ra,0xfffff
    80204a72:	de4080e7          	jalr	-540(ra) # 80203852 <fileclose>
    return -1;
    80204a76:	557d                	li	a0,-1
    80204a78:	bff9                	j	80204a56 <sys_dev+0xae>

0000000080204a7a <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80204a7a:	1101                	addi	sp,sp,-32
    80204a7c:	ec06                	sd	ra,24(sp)
    80204a7e:	e822                	sd	s0,16(sp)
    80204a80:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204a82:	fe840613          	addi	a2,s0,-24
    80204a86:	4581                	li	a1,0
    80204a88:	4501                	li	a0,0
    80204a8a:	00000097          	auipc	ra,0x0
    80204a8e:	8a8080e7          	jalr	-1880(ra) # 80204332 <argfd>
    return -1;
    80204a92:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204a94:	02054563          	bltz	a0,80204abe <sys_readdir+0x44>
    80204a98:	fe040593          	addi	a1,s0,-32
    80204a9c:	4505                	li	a0,1
    80204a9e:	ffffe097          	auipc	ra,0xffffe
    80204aa2:	3a6080e7          	jalr	934(ra) # 80202e44 <argaddr>
    return -1;
    80204aa6:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204aa8:	00054b63          	bltz	a0,80204abe <sys_readdir+0x44>
  return dirnext(f, p);
    80204aac:	fe043583          	ld	a1,-32(s0)
    80204ab0:	fe843503          	ld	a0,-24(s0)
    80204ab4:	fffff097          	auipc	ra,0xfffff
    80204ab8:	04a080e7          	jalr	74(ra) # 80203afe <dirnext>
    80204abc:	87aa                	mv	a5,a0
}
    80204abe:	853e                	mv	a0,a5
    80204ac0:	60e2                	ld	ra,24(sp)
    80204ac2:	6442                	ld	s0,16(sp)
    80204ac4:	6105                	addi	sp,sp,32
    80204ac6:	8082                	ret

0000000080204ac8 <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    80204ac8:	714d                	addi	sp,sp,-336
    80204aca:	e686                	sd	ra,328(sp)
    80204acc:	e2a2                	sd	s0,320(sp)
    80204ace:	fe26                	sd	s1,312(sp)
    80204ad0:	fa4a                	sd	s2,304(sp)
    80204ad2:	f64e                	sd	s3,296(sp)
    80204ad4:	f252                	sd	s4,288(sp)
    80204ad6:	ee56                	sd	s5,280(sp)
    80204ad8:	0a80                	addi	s0,sp,336
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    80204ada:	fb840593          	addi	a1,s0,-72
    80204ade:	4501                	li	a0,0
    80204ae0:	ffffe097          	auipc	ra,0xffffe
    80204ae4:	364080e7          	jalr	868(ra) # 80202e44 <argaddr>
    80204ae8:	87aa                	mv	a5,a0
    return -1;
    80204aea:	557d                	li	a0,-1
  if (argaddr(0, &addr) < 0)
    80204aec:	0607cc63          	bltz	a5,80204b64 <sys_getcwd+0x9c>

  struct dirent *de = myproc()->cwd;
    80204af0:	ffffd097          	auipc	ra,0xffffd
    80204af4:	f4c080e7          	jalr	-180(ra) # 80201a3c <myproc>
    80204af8:	15853483          	ld	s1,344(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    80204afc:	1204b783          	ld	a5,288(s1)
    80204b00:	cbbd                	beqz	a5,80204b76 <sys_getcwd+0xae>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80204b02:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    80204b06:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    80204b0a:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80204b0e:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80204b12:	8526                	mv	a0,s1
    80204b14:	ffffc097          	auipc	ra,0xffffc
    80204b18:	dd2080e7          	jalr	-558(ra) # 802008e6 <strlen>
    80204b1c:	862a                	mv	a2,a0
      s -= len;
    80204b1e:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    80204b22:	052a7f63          	bgeu	s4,s2,80204b80 <sys_getcwd+0xb8>
      strncpy(s, de->filename, len);
    80204b26:	85a6                	mv	a1,s1
    80204b28:	854a                	mv	a0,s2
    80204b2a:	ffffc097          	auipc	ra,0xffffc
    80204b2e:	d4c080e7          	jalr	-692(ra) # 80200876 <strncpy>
      *--s = '/';
    80204b32:	fff90993          	addi	s3,s2,-1
    80204b36:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80204b3a:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80204b3e:	1204b783          	ld	a5,288(s1)
    80204b42:	fbe1                	bnez	a5,80204b12 <sys_getcwd+0x4a>
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    80204b44:	fb843483          	ld	s1,-72(s0)
    80204b48:	854e                	mv	a0,s3
    80204b4a:	ffffc097          	auipc	ra,0xffffc
    80204b4e:	d9c080e7          	jalr	-612(ra) # 802008e6 <strlen>
    80204b52:	0015061b          	addiw	a2,a0,1
    80204b56:	85ce                	mv	a1,s3
    80204b58:	8526                	mv	a0,s1
    80204b5a:	ffffd097          	auipc	ra,0xffffd
    80204b5e:	818080e7          	jalr	-2024(ra) # 80201372 <copyout2>
    80204b62:	957d                	srai	a0,a0,0x3f
    return -1;
  
  return 0;

}
    80204b64:	60b6                	ld	ra,328(sp)
    80204b66:	6416                	ld	s0,320(sp)
    80204b68:	74f2                	ld	s1,312(sp)
    80204b6a:	7952                	ld	s2,304(sp)
    80204b6c:	79b2                	ld	s3,296(sp)
    80204b6e:	7a12                	ld	s4,288(sp)
    80204b70:	6af2                	ld	s5,280(sp)
    80204b72:	6171                	addi	sp,sp,336
    80204b74:	8082                	ret
    s = "/";
    80204b76:	00005997          	auipc	s3,0x5
    80204b7a:	aba98993          	addi	s3,s3,-1350 # 80209630 <digits+0x2b0>
    80204b7e:	b7d9                	j	80204b44 <sys_getcwd+0x7c>
        return -1;
    80204b80:	557d                	li	a0,-1
    80204b82:	b7cd                	j	80204b64 <sys_getcwd+0x9c>

0000000080204b84 <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    80204b84:	d6010113          	addi	sp,sp,-672
    80204b88:	28113c23          	sd	ra,664(sp)
    80204b8c:	28813823          	sd	s0,656(sp)
    80204b90:	28913423          	sd	s1,648(sp)
    80204b94:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    80204b96:	10400613          	li	a2,260
    80204b9a:	ed840593          	addi	a1,s0,-296
    80204b9e:	4501                	li	a0,0
    80204ba0:	ffffe097          	auipc	ra,0xffffe
    80204ba4:	2c6080e7          	jalr	710(ra) # 80202e66 <argstr>
    80204ba8:	0ea05a63          	blez	a0,80204c9c <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    80204bac:	157d                	addi	a0,a0,-1
    80204bae:	ed840713          	addi	a4,s0,-296
    80204bb2:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    80204bb6:	02f00693          	li	a3,47
    80204bba:	863a                	mv	a2,a4
    80204bbc:	00e7e963          	bltu	a5,a4,80204bce <sys_remove+0x4a>
    80204bc0:	0007c703          	lbu	a4,0(a5)
    80204bc4:	08d71a63          	bne	a4,a3,80204c58 <sys_remove+0xd4>
    s--;
    80204bc8:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    80204bca:	fec7fbe3          	bgeu	a5,a2,80204bc0 <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    80204bce:	ed840513          	addi	a0,s0,-296
    80204bd2:	00002097          	auipc	ra,0x2
    80204bd6:	d94080e7          	jalr	-620(ra) # 80206966 <ename>
    80204bda:	84aa                	mv	s1,a0
    80204bdc:	c561                	beqz	a0,80204ca4 <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    80204bde:	00001097          	auipc	ra,0x1
    80204be2:	5e0080e7          	jalr	1504(ra) # 802061be <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204be6:	1004c783          	lbu	a5,256(s1)
    80204bea:	8bc1                	andi	a5,a5,16
    80204bec:	c38d                	beqz	a5,80204c0e <sys_remove+0x8a>
  ep.valid = 0;
    80204bee:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204bf2:	d6c40693          	addi	a3,s0,-660
    80204bf6:	04000613          	li	a2,64
    80204bfa:	d7040593          	addi	a1,s0,-656
    80204bfe:	8526                	mv	a0,s1
    80204c00:	00001097          	auipc	ra,0x1
    80204c04:	7c2080e7          	jalr	1986(ra) # 802063c2 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204c08:	57fd                	li	a5,-1
    80204c0a:	06f51d63          	bne	a0,a5,80204c84 <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    80204c0e:	1204b503          	ld	a0,288(s1)
    80204c12:	00001097          	auipc	ra,0x1
    80204c16:	5ac080e7          	jalr	1452(ra) # 802061be <elock>
  eremove(ep);
    80204c1a:	8526                	mv	a0,s1
    80204c1c:	00001097          	auipc	ra,0x1
    80204c20:	46e080e7          	jalr	1134(ra) # 8020608a <eremove>
  eunlock(ep->parent);
    80204c24:	1204b503          	ld	a0,288(s1)
    80204c28:	00001097          	auipc	ra,0x1
    80204c2c:	5cc080e7          	jalr	1484(ra) # 802061f4 <eunlock>
  eunlock(ep);
    80204c30:	8526                	mv	a0,s1
    80204c32:	00001097          	auipc	ra,0x1
    80204c36:	5c2080e7          	jalr	1474(ra) # 802061f4 <eunlock>
  eput(ep);
    80204c3a:	8526                	mv	a0,s1
    80204c3c:	00001097          	auipc	ra,0x1
    80204c40:	606080e7          	jalr	1542(ra) # 80206242 <eput>

  return 0;
    80204c44:	4501                	li	a0,0
}
    80204c46:	29813083          	ld	ra,664(sp)
    80204c4a:	29013403          	ld	s0,656(sp)
    80204c4e:	28813483          	ld	s1,648(sp)
    80204c52:	2a010113          	addi	sp,sp,672
    80204c56:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    80204c58:	ed840713          	addi	a4,s0,-296
    80204c5c:	f6e7e9e3          	bltu	a5,a4,80204bce <sys_remove+0x4a>
    80204c60:	0007c683          	lbu	a3,0(a5)
    80204c64:	02e00713          	li	a4,46
    80204c68:	f6e693e3          	bne	a3,a4,80204bce <sys_remove+0x4a>
    80204c6c:	ed840713          	addi	a4,s0,-296
    80204c70:	02e78863          	beq	a5,a4,80204ca0 <sys_remove+0x11c>
    80204c74:	fff7c703          	lbu	a4,-1(a5)
    80204c78:	02f00793          	li	a5,47
    80204c7c:	f4f719e3          	bne	a4,a5,80204bce <sys_remove+0x4a>
    return -1;
    80204c80:	557d                	li	a0,-1
    80204c82:	b7d1                	j	80204c46 <sys_remove+0xc2>
      eunlock(ep);
    80204c84:	8526                	mv	a0,s1
    80204c86:	00001097          	auipc	ra,0x1
    80204c8a:	56e080e7          	jalr	1390(ra) # 802061f4 <eunlock>
      eput(ep);
    80204c8e:	8526                	mv	a0,s1
    80204c90:	00001097          	auipc	ra,0x1
    80204c94:	5b2080e7          	jalr	1458(ra) # 80206242 <eput>
      return -1;
    80204c98:	557d                	li	a0,-1
    80204c9a:	b775                	j	80204c46 <sys_remove+0xc2>
    return -1;
    80204c9c:	557d                	li	a0,-1
    80204c9e:	b765                	j	80204c46 <sys_remove+0xc2>
    return -1;
    80204ca0:	557d                	li	a0,-1
    80204ca2:	b755                	j	80204c46 <sys_remove+0xc2>
    return -1;
    80204ca4:	557d                	li	a0,-1
    80204ca6:	b745                	j	80204c46 <sys_remove+0xc2>

0000000080204ca8 <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    80204ca8:	c4010113          	addi	sp,sp,-960
    80204cac:	3a113c23          	sd	ra,952(sp)
    80204cb0:	3a813823          	sd	s0,944(sp)
    80204cb4:	3a913423          	sd	s1,936(sp)
    80204cb8:	3b213023          	sd	s2,928(sp)
    80204cbc:	39313c23          	sd	s3,920(sp)
    80204cc0:	39413823          	sd	s4,912(sp)
    80204cc4:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204cc6:	10400613          	li	a2,260
    80204cca:	ec840593          	addi	a1,s0,-312
    80204cce:	4501                	li	a0,0
    80204cd0:	ffffe097          	auipc	ra,0xffffe
    80204cd4:	196080e7          	jalr	406(ra) # 80202e66 <argstr>
      return -1;
    80204cd8:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204cda:	0c054d63          	bltz	a0,80204db4 <sys_rename+0x10c>
    80204cde:	10400613          	li	a2,260
    80204ce2:	dc040593          	addi	a1,s0,-576
    80204ce6:	4505                	li	a0,1
    80204ce8:	ffffe097          	auipc	ra,0xffffe
    80204cec:	17e080e7          	jalr	382(ra) # 80202e66 <argstr>
      return -1;
    80204cf0:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204cf2:	0c054163          	bltz	a0,80204db4 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    80204cf6:	ec840513          	addi	a0,s0,-312
    80204cfa:	00002097          	auipc	ra,0x2
    80204cfe:	c6c080e7          	jalr	-916(ra) # 80206966 <ename>
    80204d02:	84aa                	mv	s1,a0
    80204d04:	1c050963          	beqz	a0,80204ed6 <sys_rename+0x22e>
    80204d08:	ec840593          	addi	a1,s0,-312
    80204d0c:	dc040513          	addi	a0,s0,-576
    80204d10:	00002097          	auipc	ra,0x2
    80204d14:	c74080e7          	jalr	-908(ra) # 80206984 <enameparent>
    80204d18:	892a                	mv	s2,a0
    80204d1a:	cd35                	beqz	a0,80204d96 <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    80204d1c:	ec840513          	addi	a0,s0,-312
    80204d20:	00001097          	auipc	ra,0x1
    80204d24:	dbe080e7          	jalr	-578(ra) # 80205ade <formatname>
    80204d28:	89aa                	mv	s3,a0
    80204d2a:	c535                	beqz	a0,80204d96 <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    80204d2c:	07248563          	beq	s1,s2,80204d96 <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    80204d30:	87ca                	mv	a5,s2
    80204d32:	1207b783          	ld	a5,288(a5)
    80204d36:	c781                	beqz	a5,80204d3e <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    80204d38:	fef49de3          	bne	s1,a5,80204d32 <sys_rename+0x8a>
    80204d3c:	a8a9                	j	80204d96 <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    80204d3e:	8526                	mv	a0,s1
    80204d40:	00001097          	auipc	ra,0x1
    80204d44:	47e080e7          	jalr	1150(ra) # 802061be <elock>
  srclock = 1;
  elock(pdst);
    80204d48:	854a                	mv	a0,s2
    80204d4a:	00001097          	auipc	ra,0x1
    80204d4e:	474080e7          	jalr	1140(ra) # 802061be <elock>
  dst = dirlookup(pdst, name, &off);
    80204d52:	dbc40613          	addi	a2,s0,-580
    80204d56:	85ce                	mv	a1,s3
    80204d58:	854a                	mv	a0,s2
    80204d5a:	00001097          	auipc	ra,0x1
    80204d5e:	7f2080e7          	jalr	2034(ra) # 8020654c <dirlookup>
    80204d62:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    80204d64:	cd45                	beqz	a0,80204e1c <sys_rename+0x174>
    eunlock(pdst);
    80204d66:	854a                	mv	a0,s2
    80204d68:	00001097          	auipc	ra,0x1
    80204d6c:	48c080e7          	jalr	1164(ra) # 802061f4 <eunlock>
    if (src == dst) {
    80204d70:	01448963          	beq	s1,s4,80204d82 <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    80204d74:	1004c783          	lbu	a5,256(s1)
    80204d78:	100a4703          	lbu	a4,256(s4)
    80204d7c:	8ff9                	and	a5,a5,a4
    80204d7e:	8bc1                	andi	a5,a5,16
    80204d80:	ebb1                	bnez	a5,80204dd4 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    80204d82:	8526                	mv	a0,s1
    80204d84:	00001097          	auipc	ra,0x1
    80204d88:	470080e7          	jalr	1136(ra) # 802061f4 <eunlock>
  if (dst)
    eput(dst);
    80204d8c:	8552                	mv	a0,s4
    80204d8e:	00001097          	auipc	ra,0x1
    80204d92:	4b4080e7          	jalr	1204(ra) # 80206242 <eput>
  if (pdst)
    80204d96:	00090763          	beqz	s2,80204da4 <sys_rename+0xfc>
    eput(pdst);
    80204d9a:	854a                	mv	a0,s2
    80204d9c:	00001097          	auipc	ra,0x1
    80204da0:	4a6080e7          	jalr	1190(ra) # 80206242 <eput>
  if (src)
    eput(src);
  return -1;
    80204da4:	57fd                	li	a5,-1
  if (src)
    80204da6:	c499                	beqz	s1,80204db4 <sys_rename+0x10c>
    eput(src);
    80204da8:	8526                	mv	a0,s1
    80204daa:	00001097          	auipc	ra,0x1
    80204dae:	498080e7          	jalr	1176(ra) # 80206242 <eput>
  return -1;
    80204db2:	57fd                	li	a5,-1
}
    80204db4:	853e                	mv	a0,a5
    80204db6:	3b813083          	ld	ra,952(sp)
    80204dba:	3b013403          	ld	s0,944(sp)
    80204dbe:	3a813483          	ld	s1,936(sp)
    80204dc2:	3a013903          	ld	s2,928(sp)
    80204dc6:	39813983          	ld	s3,920(sp)
    80204dca:	39013a03          	ld	s4,912(sp)
    80204dce:	3c010113          	addi	sp,sp,960
    80204dd2:	8082                	ret
      elock(dst);
    80204dd4:	8552                	mv	a0,s4
    80204dd6:	00001097          	auipc	ra,0x1
    80204dda:	3e8080e7          	jalr	1000(ra) # 802061be <elock>
  ep.valid = 0;
    80204dde:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204de2:	c4c40693          	addi	a3,s0,-948
    80204de6:	04000613          	li	a2,64
    80204dea:	c5040593          	addi	a1,s0,-944
    80204dee:	8552                	mv	a0,s4
    80204df0:	00001097          	auipc	ra,0x1
    80204df4:	5d2080e7          	jalr	1490(ra) # 802063c2 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    80204df8:	57fd                	li	a5,-1
    80204dfa:	0cf51863          	bne	a0,a5,80204eca <sys_rename+0x222>
      elock(pdst);
    80204dfe:	854a                	mv	a0,s2
    80204e00:	00001097          	auipc	ra,0x1
    80204e04:	3be080e7          	jalr	958(ra) # 802061be <elock>
    eremove(dst);
    80204e08:	8552                	mv	a0,s4
    80204e0a:	00001097          	auipc	ra,0x1
    80204e0e:	280080e7          	jalr	640(ra) # 8020608a <eremove>
    eunlock(dst);
    80204e12:	8552                	mv	a0,s4
    80204e14:	00001097          	auipc	ra,0x1
    80204e18:	3e0080e7          	jalr	992(ra) # 802061f4 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    80204e1c:	0ff00613          	li	a2,255
    80204e20:	85ce                	mv	a1,s3
    80204e22:	8526                	mv	a0,s1
    80204e24:	ffffc097          	auipc	ra,0xffffc
    80204e28:	99a080e7          	jalr	-1638(ra) # 802007be <memmove>
  emake(pdst, src, off);
    80204e2c:	dbc42603          	lw	a2,-580(s0)
    80204e30:	85a6                	mv	a1,s1
    80204e32:	854a                	mv	a0,s2
    80204e34:	00001097          	auipc	ra,0x1
    80204e38:	d62080e7          	jalr	-670(ra) # 80205b96 <emake>
  if (src->parent != pdst) {
    80204e3c:	1204b783          	ld	a5,288(s1)
    80204e40:	01278d63          	beq	a5,s2,80204e5a <sys_rename+0x1b2>
    eunlock(pdst);
    80204e44:	854a                	mv	a0,s2
    80204e46:	00001097          	auipc	ra,0x1
    80204e4a:	3ae080e7          	jalr	942(ra) # 802061f4 <eunlock>
    elock(src->parent);
    80204e4e:	1204b503          	ld	a0,288(s1)
    80204e52:	00001097          	auipc	ra,0x1
    80204e56:	36c080e7          	jalr	876(ra) # 802061be <elock>
  eremove(src);
    80204e5a:	8526                	mv	a0,s1
    80204e5c:	00001097          	auipc	ra,0x1
    80204e60:	22e080e7          	jalr	558(ra) # 8020608a <eremove>
  eunlock(src->parent);
    80204e64:	1204b503          	ld	a0,288(s1)
    80204e68:	00001097          	auipc	ra,0x1
    80204e6c:	38c080e7          	jalr	908(ra) # 802061f4 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    80204e70:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    80204e74:	854a                	mv	a0,s2
    80204e76:	00001097          	auipc	ra,0x1
    80204e7a:	0ea080e7          	jalr	234(ra) # 80205f60 <edup>
    80204e7e:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    80204e82:	dbc42783          	lw	a5,-580(s0)
    80204e86:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    80204e8a:	4785                	li	a5,1
    80204e8c:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    80204e90:	8526                	mv	a0,s1
    80204e92:	00001097          	auipc	ra,0x1
    80204e96:	362080e7          	jalr	866(ra) # 802061f4 <eunlock>
  eput(psrc);
    80204e9a:	854e                	mv	a0,s3
    80204e9c:	00001097          	auipc	ra,0x1
    80204ea0:	3a6080e7          	jalr	934(ra) # 80206242 <eput>
  if (dst) {
    80204ea4:	000a0763          	beqz	s4,80204eb2 <sys_rename+0x20a>
    eput(dst);
    80204ea8:	8552                	mv	a0,s4
    80204eaa:	00001097          	auipc	ra,0x1
    80204eae:	398080e7          	jalr	920(ra) # 80206242 <eput>
  eput(pdst);
    80204eb2:	854a                	mv	a0,s2
    80204eb4:	00001097          	auipc	ra,0x1
    80204eb8:	38e080e7          	jalr	910(ra) # 80206242 <eput>
  eput(src);
    80204ebc:	8526                	mv	a0,s1
    80204ebe:	00001097          	auipc	ra,0x1
    80204ec2:	384080e7          	jalr	900(ra) # 80206242 <eput>
  return 0;
    80204ec6:	4781                	li	a5,0
    80204ec8:	b5f5                	j	80204db4 <sys_rename+0x10c>
        eunlock(dst);
    80204eca:	8552                	mv	a0,s4
    80204ecc:	00001097          	auipc	ra,0x1
    80204ed0:	328080e7          	jalr	808(ra) # 802061f4 <eunlock>
        goto fail;
    80204ed4:	b57d                	j	80204d82 <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    80204ed6:	892a                	mv	s2,a0
  if (dst)
    80204ed8:	bd7d                	j	80204d96 <sys_rename+0xee>
    80204eda:	0000                	unimp
    80204edc:	0000                	unimp
	...

0000000080204ee0 <kernelvec>:
    80204ee0:	7111                	addi	sp,sp,-256
    80204ee2:	e006                	sd	ra,0(sp)
    80204ee4:	e40a                	sd	sp,8(sp)
    80204ee6:	e80e                	sd	gp,16(sp)
    80204ee8:	ec12                	sd	tp,24(sp)
    80204eea:	f016                	sd	t0,32(sp)
    80204eec:	f41a                	sd	t1,40(sp)
    80204eee:	f81e                	sd	t2,48(sp)
    80204ef0:	fc22                	sd	s0,56(sp)
    80204ef2:	e0a6                	sd	s1,64(sp)
    80204ef4:	e4aa                	sd	a0,72(sp)
    80204ef6:	e8ae                	sd	a1,80(sp)
    80204ef8:	ecb2                	sd	a2,88(sp)
    80204efa:	f0b6                	sd	a3,96(sp)
    80204efc:	f4ba                	sd	a4,104(sp)
    80204efe:	f8be                	sd	a5,112(sp)
    80204f00:	fcc2                	sd	a6,120(sp)
    80204f02:	e146                	sd	a7,128(sp)
    80204f04:	e54a                	sd	s2,136(sp)
    80204f06:	e94e                	sd	s3,144(sp)
    80204f08:	ed52                	sd	s4,152(sp)
    80204f0a:	f156                	sd	s5,160(sp)
    80204f0c:	f55a                	sd	s6,168(sp)
    80204f0e:	f95e                	sd	s7,176(sp)
    80204f10:	fd62                	sd	s8,184(sp)
    80204f12:	e1e6                	sd	s9,192(sp)
    80204f14:	e5ea                	sd	s10,200(sp)
    80204f16:	e9ee                	sd	s11,208(sp)
    80204f18:	edf2                	sd	t3,216(sp)
    80204f1a:	f1f6                	sd	t4,224(sp)
    80204f1c:	f5fa                	sd	t5,232(sp)
    80204f1e:	f9fe                	sd	t6,240(sp)
    80204f20:	a45fd0ef          	jal	ra,80202964 <kerneltrap>
    80204f24:	6082                	ld	ra,0(sp)
    80204f26:	6122                	ld	sp,8(sp)
    80204f28:	61c2                	ld	gp,16(sp)
    80204f2a:	7282                	ld	t0,32(sp)
    80204f2c:	7322                	ld	t1,40(sp)
    80204f2e:	73c2                	ld	t2,48(sp)
    80204f30:	7462                	ld	s0,56(sp)
    80204f32:	6486                	ld	s1,64(sp)
    80204f34:	6526                	ld	a0,72(sp)
    80204f36:	65c6                	ld	a1,80(sp)
    80204f38:	6666                	ld	a2,88(sp)
    80204f3a:	7686                	ld	a3,96(sp)
    80204f3c:	7726                	ld	a4,104(sp)
    80204f3e:	77c6                	ld	a5,112(sp)
    80204f40:	7866                	ld	a6,120(sp)
    80204f42:	688a                	ld	a7,128(sp)
    80204f44:	692a                	ld	s2,136(sp)
    80204f46:	69ca                	ld	s3,144(sp)
    80204f48:	6a6a                	ld	s4,152(sp)
    80204f4a:	7a8a                	ld	s5,160(sp)
    80204f4c:	7b2a                	ld	s6,168(sp)
    80204f4e:	7bca                	ld	s7,176(sp)
    80204f50:	7c6a                	ld	s8,184(sp)
    80204f52:	6c8e                	ld	s9,192(sp)
    80204f54:	6d2e                	ld	s10,200(sp)
    80204f56:	6dce                	ld	s11,208(sp)
    80204f58:	6e6e                	ld	t3,216(sp)
    80204f5a:	7e8e                	ld	t4,224(sp)
    80204f5c:	7f2e                	ld	t5,232(sp)
    80204f5e:	7fce                	ld	t6,240(sp)
    80204f60:	6111                	addi	sp,sp,256
    80204f62:	10200073          	sret
	...

0000000080204f6e <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    80204f6e:	1141                	addi	sp,sp,-16
    80204f70:	e406                	sd	ra,8(sp)
    80204f72:	e022                	sd	s0,0(sp)
    80204f74:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80204f76:	00005597          	auipc	a1,0x5
    80204f7a:	c5a58593          	addi	a1,a1,-934 # 80209bd0 <digits+0x850>
    80204f7e:	00019517          	auipc	a0,0x19
    80204f82:	48a50513          	addi	a0,a0,1162 # 8021e408 <tickslock>
    80204f86:	ffffb097          	auipc	ra,0xffffb
    80204f8a:	6fc080e7          	jalr	1788(ra) # 80200682 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    80204f8e:	60a2                	ld	ra,8(sp)
    80204f90:	6402                	ld	s0,0(sp)
    80204f92:	0141                	addi	sp,sp,16
    80204f94:	8082                	ret

0000000080204f96 <set_next_timeout>:

void
set_next_timeout() {
    80204f96:	1141                	addi	sp,sp,-16
    80204f98:	e422                	sd	s0,8(sp)
    80204f9a:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    80204f9c:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80204fa0:	001dc7b7          	lui	a5,0x1dc
    80204fa4:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    80204fa8:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    80204faa:	4581                	li	a1,0
    80204fac:	4601                	li	a2,0
    80204fae:	4681                	li	a3,0
    80204fb0:	4881                	li	a7,0
    80204fb2:	00000073          	ecall
}
    80204fb6:	6422                	ld	s0,8(sp)
    80204fb8:	0141                	addi	sp,sp,16
    80204fba:	8082                	ret

0000000080204fbc <timer_tick>:

void timer_tick() {
    80204fbc:	1101                	addi	sp,sp,-32
    80204fbe:	ec06                	sd	ra,24(sp)
    80204fc0:	e822                	sd	s0,16(sp)
    80204fc2:	e426                	sd	s1,8(sp)
    80204fc4:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80204fc6:	00019497          	auipc	s1,0x19
    80204fca:	44248493          	addi	s1,s1,1090 # 8021e408 <tickslock>
    80204fce:	8526                	mv	a0,s1
    80204fd0:	ffffb097          	auipc	ra,0xffffb
    80204fd4:	6f6080e7          	jalr	1782(ra) # 802006c6 <acquire>
    ticks++;
    80204fd8:	4c9c                	lw	a5,24(s1)
    80204fda:	2785                	addiw	a5,a5,1
    80204fdc:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    80204fde:	00019517          	auipc	a0,0x19
    80204fe2:	44250513          	addi	a0,a0,1090 # 8021e420 <ticks>
    80204fe6:	ffffd097          	auipc	ra,0xffffd
    80204fea:	476080e7          	jalr	1142(ra) # 8020245c <wakeup>
    release(&tickslock);
    80204fee:	8526                	mv	a0,s1
    80204ff0:	ffffb097          	auipc	ra,0xffffb
    80204ff4:	72a080e7          	jalr	1834(ra) # 8020071a <release>
    set_next_timeout();
    80204ff8:	00000097          	auipc	ra,0x0
    80204ffc:	f9e080e7          	jalr	-98(ra) # 80204f96 <set_next_timeout>
}
    80205000:	60e2                	ld	ra,24(sp)
    80205002:	6442                	ld	s0,16(sp)
    80205004:	64a2                	ld	s1,8(sp)
    80205006:	6105                	addi	sp,sp,32
    80205008:	8082                	ret

000000008020500a <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    8020500a:	1141                	addi	sp,sp,-16
    8020500c:	e406                	sd	ra,8(sp)
    8020500e:	e022                	sd	s0,0(sp)
    80205010:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    80205012:	00002097          	auipc	ra,0x2
    80205016:	e8e080e7          	jalr	-370(ra) # 80206ea0 <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    8020501a:	60a2                	ld	ra,8(sp)
    8020501c:	6402                	ld	s0,0(sp)
    8020501e:	0141                	addi	sp,sp,16
    80205020:	8082                	ret

0000000080205022 <disk_read>:

void disk_read(struct buf *b)
{
    80205022:	1141                	addi	sp,sp,-16
    80205024:	e406                	sd	ra,8(sp)
    80205026:	e022                	sd	s0,0(sp)
    80205028:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    8020502a:	4581                	li	a1,0
    8020502c:	00002097          	auipc	ra,0x2
    80205030:	ffa080e7          	jalr	-6(ra) # 80207026 <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    80205034:	60a2                	ld	ra,8(sp)
    80205036:	6402                	ld	s0,0(sp)
    80205038:	0141                	addi	sp,sp,16
    8020503a:	8082                	ret

000000008020503c <disk_write>:

void disk_write(struct buf *b)
{
    8020503c:	1141                	addi	sp,sp,-16
    8020503e:	e406                	sd	ra,8(sp)
    80205040:	e022                	sd	s0,0(sp)
    80205042:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    80205044:	4585                	li	a1,1
    80205046:	00002097          	auipc	ra,0x2
    8020504a:	fe0080e7          	jalr	-32(ra) # 80207026 <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    8020504e:	60a2                	ld	ra,8(sp)
    80205050:	6402                	ld	s0,0(sp)
    80205052:	0141                	addi	sp,sp,16
    80205054:	8082                	ret

0000000080205056 <disk_intr>:

void disk_intr(void)
{
    80205056:	1141                	addi	sp,sp,-16
    80205058:	e406                	sd	ra,8(sp)
    8020505a:	e022                	sd	s0,0(sp)
    8020505c:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    8020505e:	00002097          	auipc	ra,0x2
    80205062:	254080e7          	jalr	596(ra) # 802072b2 <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    80205066:	60a2                	ld	ra,8(sp)
    80205068:	6402                	ld	s0,0(sp)
    8020506a:	0141                	addi	sp,sp,16
    8020506c:	8082                	ret

000000008020506e <read_fat>:
/**
 * Read the FAT table content corresponded to the given cluster number.
 * @param   cluster     the number of cluster which you want to read its content in FAT table
 */
static uint32 read_fat(uint32 cluster)
{
    8020506e:	1101                	addi	sp,sp,-32
    80205070:	ec06                	sd	ra,24(sp)
    80205072:	e822                	sd	s0,16(sp)
    80205074:	e426                	sd	s1,8(sp)
    80205076:	e04a                	sd	s2,0(sp)
    80205078:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    8020507a:	100007b7          	lui	a5,0x10000
    8020507e:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
        return cluster;
    80205080:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80205082:	00a7ea63          	bltu	a5,a0,80205096 <read_fat+0x28>
    }
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205086:	00019797          	auipc	a5,0x19
    8020508a:	3aa7a783          	lw	a5,938(a5) # 8021e430 <fat+0x8>
    8020508e:	2785                	addiw	a5,a5,1
        return 0;
    80205090:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205092:	00a7f963          	bgeu	a5,a0,802050a4 <read_fat+0x36>
    // here should be a cache layer for FAT table, but not implemented yet.
    struct buf *b = bread(0, fat_sec);
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    brelse(b);
    return next_clus;
}
    80205096:	8526                	mv	a0,s1
    80205098:	60e2                	ld	ra,24(sp)
    8020509a:	6442                	ld	s0,16(sp)
    8020509c:	64a2                	ld	s1,8(sp)
    8020509e:	6902                	ld	s2,0(sp)
    802050a0:	6105                	addi	sp,sp,32
    802050a2:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    802050a4:	0025149b          	slliw	s1,a0,0x2
    802050a8:	00019917          	auipc	s2,0x19
    802050ac:	38090913          	addi	s2,s2,896 # 8021e428 <fat>
    802050b0:	01095783          	lhu	a5,16(s2)
    802050b4:	02f4d7bb          	divuw	a5,s1,a5
    802050b8:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    802050bc:	9dbd                	addw	a1,a1,a5
    802050be:	4501                	li	a0,0
    802050c0:	ffffe097          	auipc	ra,0xffffe
    802050c4:	312080e7          	jalr	786(ra) # 802033d2 <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    802050c8:	01095783          	lhu	a5,16(s2)
    802050cc:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    802050d0:	1482                	slli	s1,s1,0x20
    802050d2:	9081                	srli	s1,s1,0x20
    802050d4:	009507b3          	add	a5,a0,s1
    802050d8:	4fa4                	lw	s1,88(a5)
    brelse(b);
    802050da:	ffffe097          	auipc	ra,0xffffe
    802050de:	424080e7          	jalr	1060(ra) # 802034fe <brelse>
    return next_clus;
    802050e2:	bf55                	j	80205096 <read_fat+0x28>

00000000802050e4 <alloc_clus>:
        brelse(b);
    }
}

static uint32 alloc_clus(uint8 dev)
{
    802050e4:	711d                	addi	sp,sp,-96
    802050e6:	ec86                	sd	ra,88(sp)
    802050e8:	e8a2                	sd	s0,80(sp)
    802050ea:	e4a6                	sd	s1,72(sp)
    802050ec:	e0ca                	sd	s2,64(sp)
    802050ee:	fc4e                	sd	s3,56(sp)
    802050f0:	f852                	sd	s4,48(sp)
    802050f2:	f456                	sd	s5,40(sp)
    802050f4:	f05a                	sd	s6,32(sp)
    802050f6:	ec5e                	sd	s7,24(sp)
    802050f8:	e862                	sd	s8,16(sp)
    802050fa:	e466                	sd	s9,8(sp)
    802050fc:	1080                	addi	s0,sp,96
    // should we keep a free cluster list? instead of searching fat every time.
    struct buf *b;
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    802050fe:	00019797          	auipc	a5,0x19
    80205102:	32a78793          	addi	a5,a5,810 # 8021e428 <fat>
    80205106:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    8020510a:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    8020510e:	539c                	lw	a5,32(a5)
    80205110:	10078363          	beqz	a5,80205216 <alloc_clus+0x132>
    80205114:	0029591b          	srliw	s2,s2,0x2
    80205118:	0009099b          	sext.w	s3,s2
    8020511c:	4b01                	li	s6,0
        b = bread(dev, sec);
    8020511e:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205122:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205124:	00019c97          	auipc	s9,0x19
    80205128:	304c8c93          	addi	s9,s9,772 # 8021e428 <fat>
    8020512c:	a0c9                	j	802051ee <alloc_clus+0x10a>
            if (((uint32 *)(b->data))[j] == 0) {
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    8020512e:	100007b7          	lui	a5,0x10000
    80205132:	17fd                	addi	a5,a5,-1 # fffffff <_entry-0x70200001>
    80205134:	c29c                	sw	a5,0(a3)
                bwrite(b);
    80205136:	8552                	mv	a0,s4
    80205138:	ffffe097          	auipc	ra,0xffffe
    8020513c:	38a080e7          	jalr	906(ra) # 802034c2 <bwrite>
                brelse(b);
    80205140:	8552                	mv	a0,s4
    80205142:	ffffe097          	auipc	ra,0xffffe
    80205146:	3bc080e7          	jalr	956(ra) # 802034fe <brelse>
                uint32 clus = i * ent_per_sec + j;
    8020514a:	0369093b          	mulw	s2,s2,s6
    8020514e:	0099093b          	addw	s2,s2,s1
    80205152:	00090a9b          	sext.w	s5,s2
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205156:	00019717          	auipc	a4,0x19
    8020515a:	2d270713          	addi	a4,a4,722 # 8021e428 <fat>
    8020515e:	01274783          	lbu	a5,18(a4)
    80205162:	ffe9099b          	addiw	s3,s2,-2
    80205166:	02f989bb          	mulw	s3,s3,a5
    8020516a:	4318                	lw	a4,0(a4)
    8020516c:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205170:	c7b1                	beqz	a5,802051bc <alloc_clus+0xd8>
    80205172:	4901                	li	s2,0
    80205174:	00019a17          	auipc	s4,0x19
    80205178:	2b4a0a13          	addi	s4,s4,692 # 8021e428 <fat>
        b = bread(0, sec++);
    8020517c:	013905bb          	addw	a1,s2,s3
    80205180:	4501                	li	a0,0
    80205182:	ffffe097          	auipc	ra,0xffffe
    80205186:	250080e7          	jalr	592(ra) # 802033d2 <bread>
    8020518a:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    8020518c:	20000613          	li	a2,512
    80205190:	4581                	li	a1,0
    80205192:	05850513          	addi	a0,a0,88
    80205196:	ffffb097          	auipc	ra,0xffffb
    8020519a:	5cc080e7          	jalr	1484(ra) # 80200762 <memset>
        bwrite(b);
    8020519e:	8526                	mv	a0,s1
    802051a0:	ffffe097          	auipc	ra,0xffffe
    802051a4:	322080e7          	jalr	802(ra) # 802034c2 <bwrite>
        brelse(b);
    802051a8:	8526                	mv	a0,s1
    802051aa:	ffffe097          	auipc	ra,0xffffe
    802051ae:	354080e7          	jalr	852(ra) # 802034fe <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    802051b2:	2905                	addiw	s2,s2,1
    802051b4:	012a4783          	lbu	a5,18(s4)
    802051b8:	fcf942e3          	blt	s2,a5,8020517c <alloc_clus+0x98>
            }
        }
        brelse(b);
    }
    panic("no clusters");
}
    802051bc:	8556                	mv	a0,s5
    802051be:	60e6                	ld	ra,88(sp)
    802051c0:	6446                	ld	s0,80(sp)
    802051c2:	64a6                	ld	s1,72(sp)
    802051c4:	6906                	ld	s2,64(sp)
    802051c6:	79e2                	ld	s3,56(sp)
    802051c8:	7a42                	ld	s4,48(sp)
    802051ca:	7aa2                	ld	s5,40(sp)
    802051cc:	7b02                	ld	s6,32(sp)
    802051ce:	6be2                	ld	s7,24(sp)
    802051d0:	6c42                	ld	s8,16(sp)
    802051d2:	6ca2                	ld	s9,8(sp)
    802051d4:	6125                	addi	sp,sp,96
    802051d6:	8082                	ret
        brelse(b);
    802051d8:	8552                	mv	a0,s4
    802051da:	ffffe097          	auipc	ra,0xffffe
    802051de:	324080e7          	jalr	804(ra) # 802034fe <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802051e2:	2b05                	addiw	s6,s6,1
    802051e4:	2b85                	addiw	s7,s7,1 # fffffffffffff001 <ebss_clear+0xffffffff7fdd9001>
    802051e6:	020ca783          	lw	a5,32(s9)
    802051ea:	02fb7663          	bgeu	s6,a5,80205216 <alloc_clus+0x132>
        b = bread(dev, sec);
    802051ee:	85de                	mv	a1,s7
    802051f0:	8556                	mv	a0,s5
    802051f2:	ffffe097          	auipc	ra,0xffffe
    802051f6:	1e0080e7          	jalr	480(ra) # 802033d2 <bread>
    802051fa:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802051fc:	fc098ee3          	beqz	s3,802051d8 <alloc_clus+0xf4>
    80205200:	05850793          	addi	a5,a0,88
    80205204:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    80205206:	86be                	mv	a3,a5
    80205208:	4398                	lw	a4,0(a5)
    8020520a:	d315                	beqz	a4,8020512e <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    8020520c:	2485                	addiw	s1,s1,1
    8020520e:	0791                	addi	a5,a5,4
    80205210:	fe999be3          	bne	s3,s1,80205206 <alloc_clus+0x122>
    80205214:	b7d1                	j	802051d8 <alloc_clus+0xf4>
    panic("no clusters");
    80205216:	00005517          	auipc	a0,0x5
    8020521a:	9c250513          	addi	a0,a0,-1598 # 80209bd8 <digits+0x858>
    8020521e:	ffffb097          	auipc	ra,0xffffb
    80205222:	f26080e7          	jalr	-218(ra) # 80200144 <panic>

0000000080205226 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    80205226:	00019797          	auipc	a5,0x19
    8020522a:	20a7a783          	lw	a5,522(a5) # 8021e430 <fat+0x8>
    8020522e:	2785                	addiw	a5,a5,1
    80205230:	06a7e963          	bltu	a5,a0,802052a2 <write_fat+0x7c>
{
    80205234:	7179                	addi	sp,sp,-48
    80205236:	f406                	sd	ra,40(sp)
    80205238:	f022                	sd	s0,32(sp)
    8020523a:	ec26                	sd	s1,24(sp)
    8020523c:	e84a                	sd	s2,16(sp)
    8020523e:	e44e                	sd	s3,8(sp)
    80205240:	e052                	sd	s4,0(sp)
    80205242:	1800                	addi	s0,sp,48
    80205244:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205246:	0025149b          	slliw	s1,a0,0x2
    8020524a:	00019a17          	auipc	s4,0x19
    8020524e:	1dea0a13          	addi	s4,s4,478 # 8021e428 <fat>
    80205252:	010a5783          	lhu	a5,16(s4)
    80205256:	02f4d7bb          	divuw	a5,s1,a5
    8020525a:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    8020525e:	9dbd                	addw	a1,a1,a5
    80205260:	4501                	li	a0,0
    80205262:	ffffe097          	auipc	ra,0xffffe
    80205266:	170080e7          	jalr	368(ra) # 802033d2 <bread>
    8020526a:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    8020526c:	010a5783          	lhu	a5,16(s4)
    80205270:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80205274:	1482                	slli	s1,s1,0x20
    80205276:	9081                	srli	s1,s1,0x20
    80205278:	94aa                	add	s1,s1,a0
    8020527a:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    8020527e:	ffffe097          	auipc	ra,0xffffe
    80205282:	244080e7          	jalr	580(ra) # 802034c2 <bwrite>
    brelse(b);
    80205286:	854a                	mv	a0,s2
    80205288:	ffffe097          	auipc	ra,0xffffe
    8020528c:	276080e7          	jalr	630(ra) # 802034fe <brelse>
    return 0;
    80205290:	4501                	li	a0,0
}
    80205292:	70a2                	ld	ra,40(sp)
    80205294:	7402                	ld	s0,32(sp)
    80205296:	64e2                	ld	s1,24(sp)
    80205298:	6942                	ld	s2,16(sp)
    8020529a:	69a2                	ld	s3,8(sp)
    8020529c:	6a02                	ld	s4,0(sp)
    8020529e:	6145                	addi	sp,sp,48
    802052a0:	8082                	ret
        return -1;
    802052a2:	557d                	li	a0,-1
}
    802052a4:	8082                	ret

00000000802052a6 <reloc_clus>:
 * @param   off         the offset from the beginning of the relative file
 * @param   alloc       whether alloc new cluster when meeting end of FAT chains
 * @return              the offset from the new cur_clus
 */
static int reloc_clus(struct dirent *entry, uint off, int alloc)
{
    802052a6:	715d                	addi	sp,sp,-80
    802052a8:	e486                	sd	ra,72(sp)
    802052aa:	e0a2                	sd	s0,64(sp)
    802052ac:	fc26                	sd	s1,56(sp)
    802052ae:	f84a                	sd	s2,48(sp)
    802052b0:	f44e                	sd	s3,40(sp)
    802052b2:	f052                	sd	s4,32(sp)
    802052b4:	ec56                	sd	s5,24(sp)
    802052b6:	e85a                	sd	s6,16(sp)
    802052b8:	e45e                	sd	s7,8(sp)
    802052ba:	0880                	addi	s0,sp,80
    802052bc:	84aa                	mv	s1,a0
    802052be:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    802052c0:	00019b97          	auipc	s7,0x19
    802052c4:	174bab83          	lw	s7,372(s7) # 8021e434 <fat+0xc>
    802052c8:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    802052cc:	11052703          	lw	a4,272(a0)
    802052d0:	07377563          	bgeu	a4,s3,8020533a <reloc_clus+0x94>
    802052d4:	8b32                	mv	s6,a2
        int clus = read_fat(entry->cur_clus);
        if (clus >= FAT32_EOC) {
    802052d6:	10000ab7          	lui	s5,0x10000
    802052da:	1add                	addi	s5,s5,-9 # ffffff7 <_entry-0x70200009>
    802052dc:	a81d                	j	80205312 <reloc_clus+0x6c>
            if (alloc) {
                clus = alloc_clus(entry->dev);
    802052de:	1144c503          	lbu	a0,276(s1)
    802052e2:	00000097          	auipc	ra,0x0
    802052e6:	e02080e7          	jalr	-510(ra) # 802050e4 <alloc_clus>
    802052ea:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    802052ee:	85ca                	mv	a1,s2
    802052f0:	10c4a503          	lw	a0,268(s1)
    802052f4:	00000097          	auipc	ra,0x0
    802052f8:	f32080e7          	jalr	-206(ra) # 80205226 <write_fat>
                entry->cur_clus = entry->first_clus;
                entry->clus_cnt = 0;
                return -1;
            }
        }
        entry->cur_clus = clus;
    802052fc:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    80205300:	1104a783          	lw	a5,272(s1)
    80205304:	2785                	addiw	a5,a5,1
    80205306:	0007871b          	sext.w	a4,a5
    8020530a:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    8020530e:	03377663          	bgeu	a4,s3,8020533a <reloc_clus+0x94>
        int clus = read_fat(entry->cur_clus);
    80205312:	10c4a503          	lw	a0,268(s1)
    80205316:	00000097          	auipc	ra,0x0
    8020531a:	d58080e7          	jalr	-680(ra) # 8020506e <read_fat>
    8020531e:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    80205322:	fd2adde3          	bge	s5,s2,802052fc <reloc_clus+0x56>
            if (alloc) {
    80205326:	fa0b1ce3          	bnez	s6,802052de <reloc_clus+0x38>
                entry->cur_clus = entry->first_clus;
    8020532a:	1044a783          	lw	a5,260(s1)
    8020532e:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    80205332:	1004a823          	sw	zero,272(s1)
                return -1;
    80205336:	557d                	li	a0,-1
    80205338:	a881                	j	80205388 <reloc_clus+0xe2>
    }
    if (clus_num < entry->clus_cnt) {
    8020533a:	04e9f163          	bgeu	s3,a4,8020537c <reloc_clus+0xd6>
        entry->cur_clus = entry->first_clus;
    8020533e:	1044a783          	lw	a5,260(s1)
    80205342:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    80205346:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    8020534a:	037a6963          	bltu	s4,s7,8020537c <reloc_clus+0xd6>
            entry->cur_clus = read_fat(entry->cur_clus);
            if (entry->cur_clus >= FAT32_EOC) {
    8020534e:	10000937          	lui	s2,0x10000
    80205352:	195d                	addi	s2,s2,-9 # ffffff7 <_entry-0x70200009>
            entry->cur_clus = read_fat(entry->cur_clus);
    80205354:	10c4a503          	lw	a0,268(s1)
    80205358:	00000097          	auipc	ra,0x0
    8020535c:	d16080e7          	jalr	-746(ra) # 8020506e <read_fat>
    80205360:	2501                	sext.w	a0,a0
    80205362:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    80205366:	02a96c63          	bltu	s2,a0,8020539e <reloc_clus+0xf8>
                panic("reloc_clus");
            }
            entry->clus_cnt++;
    8020536a:	1104a783          	lw	a5,272(s1)
    8020536e:	2785                	addiw	a5,a5,1
    80205370:	0007871b          	sext.w	a4,a5
    80205374:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205378:	fd376ee3          	bltu	a4,s3,80205354 <reloc_clus+0xae>
        }
    }
    return off % fat.byts_per_clus;
    8020537c:	00019797          	auipc	a5,0x19
    80205380:	0b87a783          	lw	a5,184(a5) # 8021e434 <fat+0xc>
    80205384:	02fa753b          	remuw	a0,s4,a5
}
    80205388:	60a6                	ld	ra,72(sp)
    8020538a:	6406                	ld	s0,64(sp)
    8020538c:	74e2                	ld	s1,56(sp)
    8020538e:	7942                	ld	s2,48(sp)
    80205390:	79a2                	ld	s3,40(sp)
    80205392:	7a02                	ld	s4,32(sp)
    80205394:	6ae2                	ld	s5,24(sp)
    80205396:	6b42                	ld	s6,16(sp)
    80205398:	6ba2                	ld	s7,8(sp)
    8020539a:	6161                	addi	sp,sp,80
    8020539c:	8082                	ret
                panic("reloc_clus");
    8020539e:	00005517          	auipc	a0,0x5
    802053a2:	84a50513          	addi	a0,a0,-1974 # 80209be8 <digits+0x868>
    802053a6:	ffffb097          	auipc	ra,0xffffb
    802053aa:	d9e080e7          	jalr	-610(ra) # 80200144 <panic>

00000000802053ae <rw_clus>:
{
    802053ae:	7119                	addi	sp,sp,-128
    802053b0:	fc86                	sd	ra,120(sp)
    802053b2:	f8a2                	sd	s0,112(sp)
    802053b4:	f4a6                	sd	s1,104(sp)
    802053b6:	f0ca                	sd	s2,96(sp)
    802053b8:	ecce                	sd	s3,88(sp)
    802053ba:	e8d2                	sd	s4,80(sp)
    802053bc:	e4d6                	sd	s5,72(sp)
    802053be:	e0da                	sd	s6,64(sp)
    802053c0:	fc5e                	sd	s7,56(sp)
    802053c2:	f862                	sd	s8,48(sp)
    802053c4:	f466                	sd	s9,40(sp)
    802053c6:	f06a                	sd	s10,32(sp)
    802053c8:	ec6e                	sd	s11,24(sp)
    802053ca:	0100                	addi	s0,sp,128
    802053cc:	f8c43423          	sd	a2,-120(s0)
    802053d0:	8b36                	mv	s6,a3
    802053d2:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    802053d4:	00f706bb          	addw	a3,a4,a5
    802053d8:	00019797          	auipc	a5,0x19
    802053dc:	05c7a783          	lw	a5,92(a5) # 8021e434 <fat+0xc>
    802053e0:	02d7ef63          	bltu	a5,a3,8020541e <rw_clus+0x70>
    802053e4:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    802053e6:	00019797          	auipc	a5,0x19
    802053ea:	04278793          	addi	a5,a5,66 # 8021e428 <fat>
    802053ee:	0107d683          	lhu	a3,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    802053f2:	ffe5099b          	addiw	s3,a0,-2
    802053f6:	0127c603          	lbu	a2,18(a5)
    802053fa:	02c989bb          	mulw	s3,s3,a2
    802053fe:	439c                	lw	a5,0(a5)
    80205400:	00f989bb          	addw	s3,s3,a5
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80205404:	02d757bb          	divuw	a5,a4,a3
    80205408:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    8020540c:	02d77abb          	remuw	s5,a4,a3
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205410:	0e0c0363          	beqz	s8,802054f6 <rw_clus+0x148>
    80205414:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    80205416:	20000d93          	li	s11,512
        if (bad == -1) {
    8020541a:	5d7d                	li	s10,-1
    8020541c:	a095                	j	80205480 <rw_clus+0xd2>
        panic("offset out of range");
    8020541e:	00004517          	auipc	a0,0x4
    80205422:	7da50513          	addi	a0,a0,2010 # 80209bf8 <digits+0x878>
    80205426:	ffffb097          	auipc	ra,0xffffb
    8020542a:	d1e080e7          	jalr	-738(ra) # 80200144 <panic>
                bwrite(bp);
    8020542e:	854a                	mv	a0,s2
    80205430:	ffffe097          	auipc	ra,0xffffe
    80205434:	092080e7          	jalr	146(ra) # 802034c2 <bwrite>
        brelse(bp);
    80205438:	854a                	mv	a0,s2
    8020543a:	ffffe097          	auipc	ra,0xffffe
    8020543e:	0c4080e7          	jalr	196(ra) # 802034fe <brelse>
        if (bad == -1) {
    80205442:	a02d                	j	8020546c <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    80205444:	05890613          	addi	a2,s2,88
    80205448:	1682                	slli	a3,a3,0x20
    8020544a:	9281                	srli	a3,a3,0x20
    8020544c:	963a                	add	a2,a2,a4
    8020544e:	85da                	mv	a1,s6
    80205450:	f8843503          	ld	a0,-120(s0)
    80205454:	ffffd097          	auipc	ra,0xffffd
    80205458:	0e2080e7          	jalr	226(ra) # 80202536 <either_copyout>
    8020545c:	8baa                	mv	s7,a0
        brelse(bp);
    8020545e:	854a                	mv	a0,s2
    80205460:	ffffe097          	auipc	ra,0xffffe
    80205464:	09e080e7          	jalr	158(ra) # 802034fe <brelse>
        if (bad == -1) {
    80205468:	07ab8763          	beq	s7,s10,802054d6 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    8020546c:	01448a3b          	addw	s4,s1,s4
    80205470:	01548abb          	addw	s5,s1,s5
    80205474:	1482                	slli	s1,s1,0x20
    80205476:	9081                	srli	s1,s1,0x20
    80205478:	9b26                	add	s6,s6,s1
    8020547a:	2985                	addiw	s3,s3,1
    8020547c:	058a7d63          	bgeu	s4,s8,802054d6 <rw_clus+0x128>
        bp = bread(0, sec);
    80205480:	85ce                	mv	a1,s3
    80205482:	4501                	li	a0,0
    80205484:	ffffe097          	auipc	ra,0xffffe
    80205488:	f4e080e7          	jalr	-178(ra) # 802033d2 <bread>
    8020548c:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    8020548e:	1ffaf713          	andi	a4,s5,511
        if (n - tot < m) {
    80205492:	414c07bb          	subw	a5,s8,s4
        m = BSIZE - off % BSIZE;
    80205496:	40ed863b          	subw	a2,s11,a4
    8020549a:	86be                	mv	a3,a5
    8020549c:	2781                	sext.w	a5,a5
    8020549e:	0006059b          	sext.w	a1,a2
    802054a2:	00f5f363          	bgeu	a1,a5,802054a8 <rw_clus+0xfa>
    802054a6:	86b2                	mv	a3,a2
    802054a8:	0006849b          	sext.w	s1,a3
        if (write) {
    802054ac:	f80c8ce3          	beqz	s9,80205444 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    802054b0:	05890513          	addi	a0,s2,88
    802054b4:	1682                	slli	a3,a3,0x20
    802054b6:	9281                	srli	a3,a3,0x20
    802054b8:	865a                	mv	a2,s6
    802054ba:	f8843583          	ld	a1,-120(s0)
    802054be:	953a                	add	a0,a0,a4
    802054c0:	ffffd097          	auipc	ra,0xffffd
    802054c4:	0ac080e7          	jalr	172(ra) # 8020256c <either_copyin>
    802054c8:	f7a513e3          	bne	a0,s10,8020542e <rw_clus+0x80>
        brelse(bp);
    802054cc:	854a                	mv	a0,s2
    802054ce:	ffffe097          	auipc	ra,0xffffe
    802054d2:	030080e7          	jalr	48(ra) # 802034fe <brelse>
}
    802054d6:	8552                	mv	a0,s4
    802054d8:	70e6                	ld	ra,120(sp)
    802054da:	7446                	ld	s0,112(sp)
    802054dc:	74a6                	ld	s1,104(sp)
    802054de:	7906                	ld	s2,96(sp)
    802054e0:	69e6                	ld	s3,88(sp)
    802054e2:	6a46                	ld	s4,80(sp)
    802054e4:	6aa6                	ld	s5,72(sp)
    802054e6:	6b06                	ld	s6,64(sp)
    802054e8:	7be2                	ld	s7,56(sp)
    802054ea:	7c42                	ld	s8,48(sp)
    802054ec:	7ca2                	ld	s9,40(sp)
    802054ee:	7d02                	ld	s10,32(sp)
    802054f0:	6de2                	ld	s11,24(sp)
    802054f2:	6109                	addi	sp,sp,128
    802054f4:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802054f6:	8a62                	mv	s4,s8
    802054f8:	bff9                	j	802054d6 <rw_clus+0x128>

00000000802054fa <eget>:
// by their whole path. But when parsing a path, we open all the directories through it, 
// which forms a linked list from the final file to the root. Thus, we use the "parent" pointer 
// to recognize whether an entry with the "name" as given is really the file we want in the right path.
// Should never get root by eget, it's easy to understand.
static struct dirent *eget(struct dirent *parent, char *name)
{
    802054fa:	7139                	addi	sp,sp,-64
    802054fc:	fc06                	sd	ra,56(sp)
    802054fe:	f822                	sd	s0,48(sp)
    80205500:	f426                	sd	s1,40(sp)
    80205502:	f04a                	sd	s2,32(sp)
    80205504:	ec4e                	sd	s3,24(sp)
    80205506:	e852                	sd	s4,16(sp)
    80205508:	e456                	sd	s5,8(sp)
    8020550a:	0080                	addi	s0,sp,64
    8020550c:	8a2a                	mv	s4,a0
    8020550e:	8aae                	mv	s5,a1
    struct dirent *ep;
    acquire(&ecache.lock);
    80205510:	00019517          	auipc	a0,0x19
    80205514:	0a850513          	addi	a0,a0,168 # 8021e5b8 <ecache>
    80205518:	ffffb097          	auipc	ra,0xffffb
    8020551c:	1ae080e7          	jalr	430(ra) # 802006c6 <acquire>
    if (name) {
    80205520:	060a8b63          	beqz	s5,80205596 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80205524:	00019497          	auipc	s1,0x19
    80205528:	0544b483          	ld	s1,84(s1) # 8021e578 <root+0x128>
    8020552c:	00019797          	auipc	a5,0x19
    80205530:	f2478793          	addi	a5,a5,-220 # 8021e450 <root>
    80205534:	06f48163          	beq	s1,a5,80205596 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80205538:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    8020553a:	89be                	mv	s3,a5
    8020553c:	a029                	j	80205546 <eget+0x4c>
    8020553e:	1284b483          	ld	s1,296(s1)
    80205542:	05348a63          	beq	s1,s3,80205596 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80205546:	11649783          	lh	a5,278(s1)
    8020554a:	ff279ae3          	bne	a5,s2,8020553e <eget+0x44>
    8020554e:	1204b783          	ld	a5,288(s1)
    80205552:	ff4796e3          	bne	a5,s4,8020553e <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    80205556:	0ff00613          	li	a2,255
    8020555a:	85d6                	mv	a1,s5
    8020555c:	8526                	mv	a0,s1
    8020555e:	ffffb097          	auipc	ra,0xffffb
    80205562:	2dc080e7          	jalr	732(ra) # 8020083a <strncmp>
    80205566:	fd61                	bnez	a0,8020553e <eget+0x44>
                if (ep->ref++ == 0) {
    80205568:	1184a783          	lw	a5,280(s1)
    8020556c:	0017871b          	addiw	a4,a5,1
    80205570:	10e4ac23          	sw	a4,280(s1)
    80205574:	eb81                	bnez	a5,80205584 <eget+0x8a>
                    ep->parent->ref++;
    80205576:	1204b703          	ld	a4,288(s1)
    8020557a:	11872783          	lw	a5,280(a4)
    8020557e:	2785                	addiw	a5,a5,1
    80205580:	10f72c23          	sw	a5,280(a4)
                }
                release(&ecache.lock);
    80205584:	00019517          	auipc	a0,0x19
    80205588:	03450513          	addi	a0,a0,52 # 8021e5b8 <ecache>
    8020558c:	ffffb097          	auipc	ra,0xffffb
    80205590:	18e080e7          	jalr	398(ra) # 8020071a <release>
                // edup(ep->parent);
                return ep;
    80205594:	a085                	j	802055f4 <eget+0xfa>
            }
        }
    }
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205596:	00019497          	auipc	s1,0x19
    8020559a:	fea4b483          	ld	s1,-22(s1) # 8021e580 <root+0x130>
    8020559e:	00019797          	auipc	a5,0x19
    802055a2:	eb278793          	addi	a5,a5,-334 # 8021e450 <root>
    802055a6:	00f48a63          	beq	s1,a5,802055ba <eget+0xc0>
    802055aa:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    802055ac:	1184a783          	lw	a5,280(s1)
    802055b0:	cf89                	beqz	a5,802055ca <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    802055b2:	1304b483          	ld	s1,304(s1)
    802055b6:	fee49be3          	bne	s1,a4,802055ac <eget+0xb2>
            ep->dirty = 0;
            release(&ecache.lock);
            return ep;
        }
    }
    panic("eget: insufficient ecache");
    802055ba:	00004517          	auipc	a0,0x4
    802055be:	65650513          	addi	a0,a0,1622 # 80209c10 <digits+0x890>
    802055c2:	ffffb097          	auipc	ra,0xffffb
    802055c6:	b82080e7          	jalr	-1150(ra) # 80200144 <panic>
            ep->ref = 1;
    802055ca:	4785                	li	a5,1
    802055cc:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    802055d0:	114a4783          	lbu	a5,276(s4)
    802055d4:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    802055d8:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    802055dc:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    802055e0:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    802055e4:	00019517          	auipc	a0,0x19
    802055e8:	fd450513          	addi	a0,a0,-44 # 8021e5b8 <ecache>
    802055ec:	ffffb097          	auipc	ra,0xffffb
    802055f0:	12e080e7          	jalr	302(ra) # 8020071a <release>
    return 0;
}
    802055f4:	8526                	mv	a0,s1
    802055f6:	70e2                	ld	ra,56(sp)
    802055f8:	7442                	ld	s0,48(sp)
    802055fa:	74a2                	ld	s1,40(sp)
    802055fc:	7902                	ld	s2,32(sp)
    802055fe:	69e2                	ld	s3,24(sp)
    80205600:	6a42                	ld	s4,16(sp)
    80205602:	6aa2                	ld	s5,8(sp)
    80205604:	6121                	addi	sp,sp,64
    80205606:	8082                	ret

0000000080205608 <read_entry_name>:
 * @param   buffer      pointer to the array that stores the name
 * @param   raw_entry   pointer to the entry in a sector buffer
 * @param   islong      if non-zero, read as l-n-e, otherwise s-n-e.
 */
static void read_entry_name(char *buffer, union dentry *d)
{
    80205608:	7139                	addi	sp,sp,-64
    8020560a:	fc06                	sd	ra,56(sp)
    8020560c:	f822                	sd	s0,48(sp)
    8020560e:	f426                	sd	s1,40(sp)
    80205610:	f04a                	sd	s2,32(sp)
    80205612:	ec4e                	sd	s3,24(sp)
    80205614:	0080                	addi	s0,sp,64
    80205616:	84aa                	mv	s1,a0
    80205618:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    8020561a:	00b5c703          	lbu	a4,11(a1)
    8020561e:	47bd                	li	a5,15
    80205620:	08f70563          	beq	a4,a5,802056aa <read_entry_name+0xa2>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
        buffer += NELEM(d->lne.name2);
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    } else {
        // assert: only "." and ".." will enter this branch
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    80205624:	4635                	li	a2,13
    80205626:	4581                	li	a1,0
    80205628:	ffffb097          	auipc	ra,0xffffb
    8020562c:	13a080e7          	jalr	314(ra) # 80200762 <memset>
        int i;
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80205630:	00094703          	lbu	a4,0(s2)
    80205634:	02000793          	li	a5,32
    80205638:	0af70c63          	beq	a4,a5,802056f0 <read_entry_name+0xe8>
    8020563c:	4785                	li	a5,1
    8020563e:	02000613          	li	a2,32
    80205642:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80205644:	00f486b3          	add	a3,s1,a5
    80205648:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020564c:	0007869b          	sext.w	a3,a5
    80205650:	00f90733          	add	a4,s2,a5
    80205654:	00074703          	lbu	a4,0(a4)
    80205658:	00c70563          	beq	a4,a2,80205662 <read_entry_name+0x5a>
    8020565c:	0785                	addi	a5,a5,1
    8020565e:	feb793e3          	bne	a5,a1,80205644 <read_entry_name+0x3c>
        }
        if (d->sne.name[8] != ' ') {
    80205662:	00894703          	lbu	a4,8(s2)
    80205666:	02000793          	li	a5,32
    8020566a:	00f70963          	beq	a4,a5,8020567c <read_entry_name+0x74>
            buffer[i++] = '.';
    8020566e:	00d487b3          	add	a5,s1,a3
    80205672:	02e00713          	li	a4,46
    80205676:	00e78023          	sb	a4,0(a5)
    8020567a:	2685                	addiw	a3,a3,1
        }
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    8020567c:	00890793          	addi	a5,s2,8
    80205680:	94b6                	add	s1,s1,a3
    80205682:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    80205684:	02000693          	li	a3,32
    80205688:	0007c703          	lbu	a4,0(a5)
    8020568c:	00d70863          	beq	a4,a3,8020569c <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    80205690:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80205694:	0785                	addi	a5,a5,1
    80205696:	0485                	addi	s1,s1,1
    80205698:	ff2798e3          	bne	a5,s2,80205688 <read_entry_name+0x80>
        }
    }
}
    8020569c:	70e2                	ld	ra,56(sp)
    8020569e:	7442                	ld	s0,48(sp)
    802056a0:	74a2                	ld	s1,40(sp)
    802056a2:	7902                	ld	s2,32(sp)
    802056a4:	69e2                	ld	s3,24(sp)
    802056a6:	6121                	addi	sp,sp,64
    802056a8:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    802056aa:	4629                	li	a2,10
    802056ac:	0585                	addi	a1,a1,1
    802056ae:	fc040993          	addi	s3,s0,-64
    802056b2:	854e                	mv	a0,s3
    802056b4:	ffffb097          	auipc	ra,0xffffb
    802056b8:	10a080e7          	jalr	266(ra) # 802007be <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    802056bc:	4615                	li	a2,5
    802056be:	85ce                	mv	a1,s3
    802056c0:	8526                	mv	a0,s1
    802056c2:	ffffb097          	auipc	ra,0xffffb
    802056c6:	280080e7          	jalr	640(ra) # 80200942 <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    802056ca:	4619                	li	a2,6
    802056cc:	00e90593          	addi	a1,s2,14
    802056d0:	00548513          	addi	a0,s1,5
    802056d4:	ffffb097          	auipc	ra,0xffffb
    802056d8:	26e080e7          	jalr	622(ra) # 80200942 <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    802056dc:	4609                	li	a2,2
    802056de:	01c90593          	addi	a1,s2,28
    802056e2:	00b48513          	addi	a0,s1,11
    802056e6:	ffffb097          	auipc	ra,0xffffb
    802056ea:	25c080e7          	jalr	604(ra) # 80200942 <snstr>
    802056ee:	b77d                	j	8020569c <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802056f0:	4681                	li	a3,0
    802056f2:	bf85                	j	80205662 <read_entry_name+0x5a>

00000000802056f4 <fat32_init>:
{
    802056f4:	7139                	addi	sp,sp,-64
    802056f6:	fc06                	sd	ra,56(sp)
    802056f8:	f822                	sd	s0,48(sp)
    802056fa:	f426                	sd	s1,40(sp)
    802056fc:	f04a                	sd	s2,32(sp)
    802056fe:	ec4e                	sd	s3,24(sp)
    80205700:	e852                	sd	s4,16(sp)
    80205702:	e456                	sd	s5,8(sp)
    80205704:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    80205706:	4581                	li	a1,0
    80205708:	4501                	li	a0,0
    8020570a:	ffffe097          	auipc	ra,0xffffe
    8020570e:	cc8080e7          	jalr	-824(ra) # 802033d2 <bread>
    80205712:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    80205714:	4615                	li	a2,5
    80205716:	00004597          	auipc	a1,0x4
    8020571a:	51a58593          	addi	a1,a1,1306 # 80209c30 <digits+0x8b0>
    8020571e:	0aa50513          	addi	a0,a0,170
    80205722:	ffffb097          	auipc	ra,0xffffb
    80205726:	118080e7          	jalr	280(ra) # 8020083a <strncmp>
    8020572a:	16051863          	bnez	a0,8020589a <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    8020572e:	00019497          	auipc	s1,0x19
    80205732:	cfa48493          	addi	s1,s1,-774 # 8021e428 <fat>
    80205736:	4609                	li	a2,2
    80205738:	06390593          	addi	a1,s2,99
    8020573c:	00019517          	auipc	a0,0x19
    80205740:	cfc50513          	addi	a0,a0,-772 # 8021e438 <fat+0x10>
    80205744:	ffffb097          	auipc	ra,0xffffb
    80205748:	07a080e7          	jalr	122(ra) # 802007be <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    8020574c:	06594683          	lbu	a3,101(s2)
    80205750:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80205754:	06695603          	lhu	a2,102(s2)
    80205758:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    8020575c:	06894703          	lbu	a4,104(s2)
    80205760:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80205764:	07492783          	lw	a5,116(s2)
    80205768:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    8020576a:	07892783          	lw	a5,120(s2)
    8020576e:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    80205770:	07c92583          	lw	a1,124(s2)
    80205774:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80205776:	08492503          	lw	a0,132(s2)
    8020577a:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    8020577c:	02b7073b          	mulw	a4,a4,a1
    80205780:	9f31                	addw	a4,a4,a2
    80205782:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80205784:	9f99                	subw	a5,a5,a4
    80205786:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80205788:	02d7d7bb          	divuw	a5,a5,a3
    8020578c:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    8020578e:	0104d783          	lhu	a5,16(s1)
    80205792:	02d787bb          	mulw	a5,a5,a3
    80205796:	c4dc                	sw	a5,12(s1)
    brelse(b);
    80205798:	854a                	mv	a0,s2
    8020579a:	ffffe097          	auipc	ra,0xffffe
    8020579e:	d64080e7          	jalr	-668(ra) # 802034fe <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    802057a2:	0104d703          	lhu	a4,16(s1)
    802057a6:	20000793          	li	a5,512
    802057aa:	10f71063          	bne	a4,a5,802058aa <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    802057ae:	00004597          	auipc	a1,0x4
    802057b2:	4ba58593          	addi	a1,a1,1210 # 80209c68 <digits+0x8e8>
    802057b6:	00019517          	auipc	a0,0x19
    802057ba:	e0250513          	addi	a0,a0,-510 # 8021e5b8 <ecache>
    802057be:	ffffb097          	auipc	ra,0xffffb
    802057c2:	ec4080e7          	jalr	-316(ra) # 80200682 <initlock>
    memset(&root, 0, sizeof(root));
    802057c6:	00019497          	auipc	s1,0x19
    802057ca:	c6248493          	addi	s1,s1,-926 # 8021e428 <fat>
    802057ce:	00019917          	auipc	s2,0x19
    802057d2:	c8290913          	addi	s2,s2,-894 # 8021e450 <root>
    802057d6:	16800613          	li	a2,360
    802057da:	4581                	li	a1,0
    802057dc:	854a                	mv	a0,s2
    802057de:	ffffb097          	auipc	ra,0xffffb
    802057e2:	f84080e7          	jalr	-124(ra) # 80200762 <memset>
    initsleeplock(&root.lock, "entry");
    802057e6:	00004597          	auipc	a1,0x4
    802057ea:	48a58593          	addi	a1,a1,1162 # 80209c70 <digits+0x8f0>
    802057ee:	00019517          	auipc	a0,0x19
    802057f2:	d9a50513          	addi	a0,a0,-614 # 8021e588 <root+0x138>
    802057f6:	ffffe097          	auipc	ra,0xffffe
    802057fa:	e1e080e7          	jalr	-482(ra) # 80203614 <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    802057fe:	47d1                	li	a5,20
    80205800:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    80205804:	50dc                	lw	a5,36(s1)
    80205806:	12f4aa23          	sw	a5,308(s1)
    8020580a:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    8020580e:	4785                	li	a5,1
    80205810:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    80205814:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    80205818:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020581c:	00019497          	auipc	s1,0x19
    80205820:	db448493          	addi	s1,s1,-588 # 8021e5d0 <ecache+0x18>
        de->next = root.next;
    80205824:	00019917          	auipc	s2,0x19
    80205828:	c0490913          	addi	s2,s2,-1020 # 8021e428 <fat>
        de->prev = &root;
    8020582c:	00019a97          	auipc	s5,0x19
    80205830:	c24a8a93          	addi	s5,s5,-988 # 8021e450 <root>
        initsleeplock(&de->lock, "entry");
    80205834:	00004a17          	auipc	s4,0x4
    80205838:	43ca0a13          	addi	s4,s4,1084 # 80209c70 <digits+0x8f0>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020583c:	0001d997          	auipc	s3,0x1d
    80205840:	3e498993          	addi	s3,s3,996 # 80222c20 <cons>
        de->dev = 0;
    80205844:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80205848:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    8020584c:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    80205850:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    80205854:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80205858:	15093783          	ld	a5,336(s2)
    8020585c:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    80205860:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    80205864:	85d2                	mv	a1,s4
    80205866:	13848513          	addi	a0,s1,312
    8020586a:	ffffe097          	auipc	ra,0xffffe
    8020586e:	daa080e7          	jalr	-598(ra) # 80203614 <initsleeplock>
        root.next->prev = de;
    80205872:	15093783          	ld	a5,336(s2)
    80205876:	1297b823          	sd	s1,304(a5)
        root.next = de;
    8020587a:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020587e:	16848493          	addi	s1,s1,360
    80205882:	fd3491e3          	bne	s1,s3,80205844 <fat32_init+0x150>
}
    80205886:	4501                	li	a0,0
    80205888:	70e2                	ld	ra,56(sp)
    8020588a:	7442                	ld	s0,48(sp)
    8020588c:	74a2                	ld	s1,40(sp)
    8020588e:	7902                	ld	s2,32(sp)
    80205890:	69e2                	ld	s3,24(sp)
    80205892:	6a42                	ld	s4,16(sp)
    80205894:	6aa2                	ld	s5,8(sp)
    80205896:	6121                	addi	sp,sp,64
    80205898:	8082                	ret
        panic("not FAT32 volume");
    8020589a:	00004517          	auipc	a0,0x4
    8020589e:	39e50513          	addi	a0,a0,926 # 80209c38 <digits+0x8b8>
    802058a2:	ffffb097          	auipc	ra,0xffffb
    802058a6:	8a2080e7          	jalr	-1886(ra) # 80200144 <panic>
        panic("byts_per_sec != BSIZE");
    802058aa:	00004517          	auipc	a0,0x4
    802058ae:	3a650513          	addi	a0,a0,934 # 80209c50 <digits+0x8d0>
    802058b2:	ffffb097          	auipc	ra,0xffffb
    802058b6:	892080e7          	jalr	-1902(ra) # 80200144 <panic>

00000000802058ba <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802058ba:	10852783          	lw	a5,264(a0)
    802058be:	0ed7e863          	bltu	a5,a3,802059ae <eread+0xf4>
{
    802058c2:	711d                	addi	sp,sp,-96
    802058c4:	ec86                	sd	ra,88(sp)
    802058c6:	e8a2                	sd	s0,80(sp)
    802058c8:	e4a6                	sd	s1,72(sp)
    802058ca:	e0ca                	sd	s2,64(sp)
    802058cc:	fc4e                	sd	s3,56(sp)
    802058ce:	f852                	sd	s4,48(sp)
    802058d0:	f456                	sd	s5,40(sp)
    802058d2:	f05a                	sd	s6,32(sp)
    802058d4:	ec5e                	sd	s7,24(sp)
    802058d6:	e862                	sd	s8,16(sp)
    802058d8:	e466                	sd	s9,8(sp)
    802058da:	e06a                	sd	s10,0(sp)
    802058dc:	1080                	addi	s0,sp,96
    802058de:	8a2a                	mv	s4,a0
    802058e0:	8bae                	mv	s7,a1
    802058e2:	8ab2                	mv	s5,a2
    802058e4:	8936                	mv	s2,a3
    802058e6:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802058e8:	9eb9                	addw	a3,a3,a4
        return 0;
    802058ea:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802058ec:	0b26e163          	bltu	a3,s2,8020598e <eread+0xd4>
    802058f0:	100a4703          	lbu	a4,256(s4)
    802058f4:	8b41                	andi	a4,a4,16
    802058f6:	ef41                	bnez	a4,8020598e <eread+0xd4>
    if (off + n > entry->file_size) {
    802058f8:	00d7f463          	bgeu	a5,a3,80205900 <eread+0x46>
        n = entry->file_size - off;
    802058fc:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205900:	10ca2703          	lw	a4,268(s4)
    80205904:	100007b7          	lui	a5,0x10000
    80205908:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
    8020590a:	06e7ef63          	bltu	a5,a4,80205988 <eread+0xce>
    8020590e:	080b0e63          	beqz	s6,802059aa <eread+0xf0>
    80205912:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205914:	00019c97          	auipc	s9,0x19
    80205918:	b14c8c93          	addi	s9,s9,-1260 # 8021e428 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020591c:	8c3e                	mv	s8,a5
    8020591e:	a82d                	j	80205958 <eread+0x9e>
    80205920:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    80205924:	87ea                	mv	a5,s10
    80205926:	86d6                	mv	a3,s5
    80205928:	865e                	mv	a2,s7
    8020592a:	4581                	li	a1,0
    8020592c:	10ca2503          	lw	a0,268(s4)
    80205930:	00000097          	auipc	ra,0x0
    80205934:	a7e080e7          	jalr	-1410(ra) # 802053ae <rw_clus>
    80205938:	2501                	sext.w	a0,a0
    8020593a:	04ad1863          	bne	s10,a0,8020598a <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020593e:	013489bb          	addw	s3,s1,s3
    80205942:	0124893b          	addw	s2,s1,s2
    80205946:	1482                	slli	s1,s1,0x20
    80205948:	9081                	srli	s1,s1,0x20
    8020594a:	9aa6                	add	s5,s5,s1
    8020594c:	10ca2783          	lw	a5,268(s4)
    80205950:	02fc6d63          	bltu	s8,a5,8020598a <eread+0xd0>
    80205954:	0369fb63          	bgeu	s3,s6,8020598a <eread+0xd0>
        reloc_clus(entry, off, 0);
    80205958:	4601                	li	a2,0
    8020595a:	85ca                	mv	a1,s2
    8020595c:	8552                	mv	a0,s4
    8020595e:	00000097          	auipc	ra,0x0
    80205962:	948080e7          	jalr	-1720(ra) # 802052a6 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205966:	00cca683          	lw	a3,12(s9)
    8020596a:	02d9763b          	remuw	a2,s2,a3
    8020596e:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    80205972:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205976:	9e91                	subw	a3,a3,a2
    80205978:	84be                	mv	s1,a5
    8020597a:	2781                	sext.w	a5,a5
    8020597c:	0006861b          	sext.w	a2,a3
    80205980:	faf670e3          	bgeu	a2,a5,80205920 <eread+0x66>
    80205984:	84b6                	mv	s1,a3
    80205986:	bf69                	j	80205920 <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205988:	4981                	li	s3,0
    return tot;
    8020598a:	0009851b          	sext.w	a0,s3
}
    8020598e:	60e6                	ld	ra,88(sp)
    80205990:	6446                	ld	s0,80(sp)
    80205992:	64a6                	ld	s1,72(sp)
    80205994:	6906                	ld	s2,64(sp)
    80205996:	79e2                	ld	s3,56(sp)
    80205998:	7a42                	ld	s4,48(sp)
    8020599a:	7aa2                	ld	s5,40(sp)
    8020599c:	7b02                	ld	s6,32(sp)
    8020599e:	6be2                	ld	s7,24(sp)
    802059a0:	6c42                	ld	s8,16(sp)
    802059a2:	6ca2                	ld	s9,8(sp)
    802059a4:	6d02                	ld	s10,0(sp)
    802059a6:	6125                	addi	sp,sp,96
    802059a8:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802059aa:	89da                	mv	s3,s6
    802059ac:	bff9                	j	8020598a <eread+0xd0>
        return 0;
    802059ae:	4501                	li	a0,0
}
    802059b0:	8082                	ret

00000000802059b2 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    802059b2:	10852783          	lw	a5,264(a0)
    802059b6:	0ed7e463          	bltu	a5,a3,80205a9e <ewrite+0xec>
{
    802059ba:	711d                	addi	sp,sp,-96
    802059bc:	ec86                	sd	ra,88(sp)
    802059be:	e8a2                	sd	s0,80(sp)
    802059c0:	e4a6                	sd	s1,72(sp)
    802059c2:	e0ca                	sd	s2,64(sp)
    802059c4:	fc4e                	sd	s3,56(sp)
    802059c6:	f852                	sd	s4,48(sp)
    802059c8:	f456                	sd	s5,40(sp)
    802059ca:	f05a                	sd	s6,32(sp)
    802059cc:	ec5e                	sd	s7,24(sp)
    802059ce:	e862                	sd	s8,16(sp)
    802059d0:	e466                	sd	s9,8(sp)
    802059d2:	1080                	addi	s0,sp,96
    802059d4:	8aaa                	mv	s5,a0
    802059d6:	8bae                	mv	s7,a1
    802059d8:	8a32                	mv	s4,a2
    802059da:	8936                	mv	s2,a3
    802059dc:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    802059de:	00e687bb          	addw	a5,a3,a4
    802059e2:	0cd7e063          	bltu	a5,a3,80205aa2 <ewrite+0xf0>
    802059e6:	02069793          	slli	a5,a3,0x20
    802059ea:	9381                	srli	a5,a5,0x20
    802059ec:	1702                	slli	a4,a4,0x20
    802059ee:	9301                	srli	a4,a4,0x20
    802059f0:	97ba                	add	a5,a5,a4
    802059f2:	577d                	li	a4,-1
    802059f4:	9301                	srli	a4,a4,0x20
    802059f6:	0af76863          	bltu	a4,a5,80205aa6 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    802059fa:	10054783          	lbu	a5,256(a0)
    802059fe:	8b85                	andi	a5,a5,1
    80205a00:	e7cd                	bnez	a5,80205aaa <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    80205a02:	10452783          	lw	a5,260(a0)
    80205a06:	cb89                	beqz	a5,80205a18 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80205a08:	080b0963          	beqz	s6,80205a9a <ewrite+0xe8>
    80205a0c:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205a0e:	00019c17          	auipc	s8,0x19
    80205a12:	a1ac0c13          	addi	s8,s8,-1510 # 8021e428 <fat>
    80205a16:	a891                	j	80205a6a <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    80205a18:	11454503          	lbu	a0,276(a0)
    80205a1c:	fffff097          	auipc	ra,0xfffff
    80205a20:	6c8080e7          	jalr	1736(ra) # 802050e4 <alloc_clus>
    80205a24:	2501                	sext.w	a0,a0
    80205a26:	10aaa223          	sw	a0,260(s5)
    80205a2a:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    80205a2e:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    80205a32:	4785                	li	a5,1
    80205a34:	10fa8aa3          	sb	a5,277(s5)
    80205a38:	bfc1                	j	80205a08 <ewrite+0x56>
    80205a3a:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    80205a3e:	87e6                	mv	a5,s9
    80205a40:	86d2                	mv	a3,s4
    80205a42:	865e                	mv	a2,s7
    80205a44:	4585                	li	a1,1
    80205a46:	10caa503          	lw	a0,268(s5)
    80205a4a:	00000097          	auipc	ra,0x0
    80205a4e:	964080e7          	jalr	-1692(ra) # 802053ae <rw_clus>
    80205a52:	2501                	sext.w	a0,a0
    80205a54:	04ac9d63          	bne	s9,a0,80205aae <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80205a58:	013489bb          	addw	s3,s1,s3
    80205a5c:	0124893b          	addw	s2,s1,s2
    80205a60:	1482                	slli	s1,s1,0x20
    80205a62:	9081                	srli	s1,s1,0x20
    80205a64:	9a26                	add	s4,s4,s1
    80205a66:	0569f463          	bgeu	s3,s6,80205aae <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    80205a6a:	4605                	li	a2,1
    80205a6c:	85ca                	mv	a1,s2
    80205a6e:	8556                	mv	a0,s5
    80205a70:	00000097          	auipc	ra,0x0
    80205a74:	836080e7          	jalr	-1994(ra) # 802052a6 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205a78:	00cc2683          	lw	a3,12(s8)
    80205a7c:	02d9763b          	remuw	a2,s2,a3
    80205a80:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    80205a84:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205a88:	9e91                	subw	a3,a3,a2
    80205a8a:	84be                	mv	s1,a5
    80205a8c:	2781                	sext.w	a5,a5
    80205a8e:	0006861b          	sext.w	a2,a3
    80205a92:	faf674e3          	bgeu	a2,a5,80205a3a <ewrite+0x88>
    80205a96:	84b6                	mv	s1,a3
    80205a98:	b74d                	j	80205a3a <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80205a9a:	89da                	mv	s3,s6
    80205a9c:	a015                	j	80205ac0 <ewrite+0x10e>
        return -1;
    80205a9e:	557d                	li	a0,-1
}
    80205aa0:	8082                	ret
        return -1;
    80205aa2:	557d                	li	a0,-1
    80205aa4:	a005                	j	80205ac4 <ewrite+0x112>
    80205aa6:	557d                	li	a0,-1
    80205aa8:	a831                	j	80205ac4 <ewrite+0x112>
    80205aaa:	557d                	li	a0,-1
    80205aac:	a821                	j	80205ac4 <ewrite+0x112>
        if(off > entry->file_size) {
    80205aae:	108aa783          	lw	a5,264(s5)
    80205ab2:	0127f763          	bgeu	a5,s2,80205ac0 <ewrite+0x10e>
            entry->file_size = off;
    80205ab6:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80205aba:	4785                	li	a5,1
    80205abc:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    80205ac0:	0009851b          	sext.w	a0,s3
}
    80205ac4:	60e6                	ld	ra,88(sp)
    80205ac6:	6446                	ld	s0,80(sp)
    80205ac8:	64a6                	ld	s1,72(sp)
    80205aca:	6906                	ld	s2,64(sp)
    80205acc:	79e2                	ld	s3,56(sp)
    80205ace:	7a42                	ld	s4,48(sp)
    80205ad0:	7aa2                	ld	s5,40(sp)
    80205ad2:	7b02                	ld	s6,32(sp)
    80205ad4:	6be2                	ld	s7,24(sp)
    80205ad6:	6c42                	ld	s8,16(sp)
    80205ad8:	6ca2                	ld	s9,8(sp)
    80205ada:	6125                	addi	sp,sp,96
    80205adc:	8082                	ret

0000000080205ade <formatname>:
{
    80205ade:	7179                	addi	sp,sp,-48
    80205ae0:	f406                	sd	ra,40(sp)
    80205ae2:	f022                	sd	s0,32(sp)
    80205ae4:	ec26                	sd	s1,24(sp)
    80205ae6:	e84a                	sd	s2,16(sp)
    80205ae8:	e44e                	sd	s3,8(sp)
    80205aea:	e052                	sd	s4,0(sp)
    80205aec:	1800                	addi	s0,sp,48
    80205aee:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    80205af0:	02000793          	li	a5,32
    80205af4:	02e00713          	li	a4,46
    80205af8:	a011                	j	80205afc <formatname+0x1e>
    80205afa:	0485                	addi	s1,s1,1
    80205afc:	0004c583          	lbu	a1,0(s1)
    80205b00:	fef58de3          	beq	a1,a5,80205afa <formatname+0x1c>
    80205b04:	fee58be3          	beq	a1,a4,80205afa <formatname+0x1c>
    for (p = name; *p; p++) {
    80205b08:	c1b9                	beqz	a1,80205b4e <formatname+0x70>
    80205b0a:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    80205b0c:	49fd                	li	s3,31
    80205b0e:	00006a17          	auipc	s4,0x6
    80205b12:	f12a0a13          	addi	s4,s4,-238 # 8020ba20 <illegal.1>
    80205b16:	02b9fe63          	bgeu	s3,a1,80205b52 <formatname+0x74>
    80205b1a:	8552                	mv	a0,s4
    80205b1c:	ffffb097          	auipc	ra,0xffffb
    80205b20:	ea4080e7          	jalr	-348(ra) # 802009c0 <strchr>
    80205b24:	e121                	bnez	a0,80205b64 <formatname+0x86>
    for (p = name; *p; p++) {
    80205b26:	0905                	addi	s2,s2,1
    80205b28:	00094583          	lbu	a1,0(s2)
    80205b2c:	f5ed                	bnez	a1,80205b16 <formatname+0x38>
        if (*p != ' ') {
    80205b2e:	02000693          	li	a3,32
    80205b32:	874a                	mv	a4,s2
    while (p-- > name) {
    80205b34:	0124fb63          	bgeu	s1,s2,80205b4a <formatname+0x6c>
        if (*p != ' ') {
    80205b38:	197d                	addi	s2,s2,-1
    80205b3a:	00094783          	lbu	a5,0(s2)
    80205b3e:	fed78ae3          	beq	a5,a3,80205b32 <formatname+0x54>
            p[1] = '\0';
    80205b42:	00070023          	sb	zero,0(a4)
            break;
    80205b46:	8526                	mv	a0,s1
    80205b48:	a031                	j	80205b54 <formatname+0x76>
    80205b4a:	8526                	mv	a0,s1
    80205b4c:	a021                	j	80205b54 <formatname+0x76>
    for (p = name; *p; p++) {
    80205b4e:	8526                	mv	a0,s1
    80205b50:	a011                	j	80205b54 <formatname+0x76>
            return 0;
    80205b52:	4501                	li	a0,0
}
    80205b54:	70a2                	ld	ra,40(sp)
    80205b56:	7402                	ld	s0,32(sp)
    80205b58:	64e2                	ld	s1,24(sp)
    80205b5a:	6942                	ld	s2,16(sp)
    80205b5c:	69a2                	ld	s3,8(sp)
    80205b5e:	6a02                	ld	s4,0(sp)
    80205b60:	6145                	addi	sp,sp,48
    80205b62:	8082                	ret
            return 0;
    80205b64:	4501                	li	a0,0
    80205b66:	b7fd                	j	80205b54 <formatname+0x76>

0000000080205b68 <cal_checksum>:
{
    80205b68:	1141                	addi	sp,sp,-16
    80205b6a:	e422                	sd	s0,8(sp)
    80205b6c:	0800                	addi	s0,sp,16
    80205b6e:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80205b70:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    80205b74:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    80205b76:	0075171b          	slliw	a4,a0,0x7
    80205b7a:	0785                	addi	a5,a5,1
    80205b7c:	0015551b          	srliw	a0,a0,0x1
    80205b80:	fff7c683          	lbu	a3,-1(a5)
    80205b84:	9d35                	addw	a0,a0,a3
    80205b86:	953a                	add	a0,a0,a4
    80205b88:	0ff57513          	zext.b	a0,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80205b8c:	fef615e3          	bne	a2,a5,80205b76 <cal_checksum+0xe>
}
    80205b90:	6422                	ld	s0,8(sp)
    80205b92:	0141                	addi	sp,sp,16
    80205b94:	8082                	ret

0000000080205b96 <emake>:
{
    80205b96:	7131                	addi	sp,sp,-192
    80205b98:	fd06                	sd	ra,184(sp)
    80205b9a:	f922                	sd	s0,176(sp)
    80205b9c:	f526                	sd	s1,168(sp)
    80205b9e:	f14a                	sd	s2,160(sp)
    80205ba0:	ed4e                	sd	s3,152(sp)
    80205ba2:	e952                	sd	s4,144(sp)
    80205ba4:	e556                	sd	s5,136(sp)
    80205ba6:	e15a                	sd	s6,128(sp)
    80205ba8:	fcde                	sd	s7,120(sp)
    80205baa:	f8e2                	sd	s8,112(sp)
    80205bac:	f4e6                	sd	s9,104(sp)
    80205bae:	f0ea                	sd	s10,96(sp)
    80205bb0:	ecee                	sd	s11,88(sp)
    80205bb2:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80205bb4:	10054783          	lbu	a5,256(a0)
    80205bb8:	8bc1                	andi	a5,a5,16
    80205bba:	c3d5                	beqz	a5,80205c5e <emake+0xc8>
    80205bbc:	8b2a                	mv	s6,a0
    80205bbe:	8d2e                	mv	s10,a1
    80205bc0:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    80205bc2:	01f67793          	andi	a5,a2,31
    80205bc6:	e7c5                	bnez	a5,80205c6e <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80205bc8:	02000613          	li	a2,32
    80205bcc:	4581                	li	a1,0
    80205bce:	f7040513          	addi	a0,s0,-144
    80205bd2:	ffffb097          	auipc	ra,0xffffb
    80205bd6:	b90080e7          	jalr	-1136(ra) # 80200762 <memset>
    if (off <= 32) {
    80205bda:	02000793          	li	a5,32
    80205bde:	0b97ec63          	bltu	a5,s9,80205c96 <emake+0x100>
        if (off == 0) {
    80205be2:	080c9e63          	bnez	s9,80205c7e <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80205be6:	462d                	li	a2,11
    80205be8:	00004597          	auipc	a1,0x4
    80205bec:	0b858593          	addi	a1,a1,184 # 80209ca0 <digits+0x920>
    80205bf0:	f7040513          	addi	a0,s0,-144
    80205bf4:	ffffb097          	auipc	ra,0xffffb
    80205bf8:	c82080e7          	jalr	-894(ra) # 80200876 <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    80205bfc:	47c1                	li	a5,16
    80205bfe:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80205c02:	104d2783          	lw	a5,260(s10) # fffffffffffff104 <ebss_clear+0xffffffff7fdd9104>
    80205c06:	0107d71b          	srliw	a4,a5,0x10
    80205c0a:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    80205c0e:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    80205c12:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    80205c16:	4605                	li	a2,1
    80205c18:	85e6                	mv	a1,s9
    80205c1a:	855a                	mv	a0,s6
    80205c1c:	fffff097          	auipc	ra,0xfffff
    80205c20:	68a080e7          	jalr	1674(ra) # 802052a6 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80205c24:	02000793          	li	a5,32
    80205c28:	0005071b          	sext.w	a4,a0
    80205c2c:	f7040693          	addi	a3,s0,-144
    80205c30:	4601                	li	a2,0
    80205c32:	4585                	li	a1,1
    80205c34:	10cb2503          	lw	a0,268(s6)
    80205c38:	fffff097          	auipc	ra,0xfffff
    80205c3c:	776080e7          	jalr	1910(ra) # 802053ae <rw_clus>
}
    80205c40:	70ea                	ld	ra,184(sp)
    80205c42:	744a                	ld	s0,176(sp)
    80205c44:	74aa                	ld	s1,168(sp)
    80205c46:	790a                	ld	s2,160(sp)
    80205c48:	69ea                	ld	s3,152(sp)
    80205c4a:	6a4a                	ld	s4,144(sp)
    80205c4c:	6aaa                	ld	s5,136(sp)
    80205c4e:	6b0a                	ld	s6,128(sp)
    80205c50:	7be6                	ld	s7,120(sp)
    80205c52:	7c46                	ld	s8,112(sp)
    80205c54:	7ca6                	ld	s9,104(sp)
    80205c56:	7d06                	ld	s10,96(sp)
    80205c58:	6de6                	ld	s11,88(sp)
    80205c5a:	6129                	addi	sp,sp,192
    80205c5c:	8082                	ret
        panic("emake: not dir");
    80205c5e:	00004517          	auipc	a0,0x4
    80205c62:	01a50513          	addi	a0,a0,26 # 80209c78 <digits+0x8f8>
    80205c66:	ffffa097          	auipc	ra,0xffffa
    80205c6a:	4de080e7          	jalr	1246(ra) # 80200144 <panic>
        panic("emake: not aligned");
    80205c6e:	00004517          	auipc	a0,0x4
    80205c72:	01a50513          	addi	a0,a0,26 # 80209c88 <digits+0x908>
    80205c76:	ffffa097          	auipc	ra,0xffffa
    80205c7a:	4ce080e7          	jalr	1230(ra) # 80200144 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    80205c7e:	462d                	li	a2,11
    80205c80:	00004597          	auipc	a1,0x4
    80205c84:	03058593          	addi	a1,a1,48 # 80209cb0 <digits+0x930>
    80205c88:	f7040513          	addi	a0,s0,-144
    80205c8c:	ffffb097          	auipc	ra,0xffffb
    80205c90:	bea080e7          	jalr	-1046(ra) # 80200876 <strncpy>
    80205c94:	b7a5                	j	80205bfc <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    80205c96:	896a                	mv	s2,s10
    80205c98:	856a                	mv	a0,s10
    80205c9a:	ffffb097          	auipc	ra,0xffffb
    80205c9e:	c4c080e7          	jalr	-948(ra) # 802008e6 <strlen>
    80205ca2:	f4a43423          	sd	a0,-184(s0)
    80205ca6:	00c5071b          	addiw	a4,a0,12
    80205caa:	47b5                	li	a5,13
    80205cac:	02f747bb          	divw	a5,a4,a5
    80205cb0:	f4f42c23          	sw	a5,-168(s0)
    80205cb4:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    80205cb8:	4631                	li	a2,12
    80205cba:	4581                	li	a1,0
    80205cbc:	f6040513          	addi	a0,s0,-160
    80205cc0:	ffffb097          	auipc	ra,0xffffb
    80205cc4:	aa2080e7          	jalr	-1374(ra) # 80200762 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80205cc8:	856a                	mv	a0,s10
    80205cca:	ffffb097          	auipc	ra,0xffffb
    80205cce:	c1c080e7          	jalr	-996(ra) # 802008e6 <strlen>
    80205cd2:	fff5079b          	addiw	a5,a0,-1
    80205cd6:	0207cf63          	bltz	a5,80205d14 <emake+0x17e>
    80205cda:	97ea                	add	a5,a5,s10
    80205cdc:	ffed0693          	addi	a3,s10,-2
    80205ce0:	96aa                	add	a3,a3,a0
    80205ce2:	fff5071b          	addiw	a4,a0,-1
    80205ce6:	1702                	slli	a4,a4,0x20
    80205ce8:	9301                	srli	a4,a4,0x20
    80205cea:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    80205cec:	02e00613          	li	a2,46
    80205cf0:	89be                	mv	s3,a5
    80205cf2:	0007c703          	lbu	a4,0(a5)
    80205cf6:	00c70663          	beq	a4,a2,80205d02 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80205cfa:	17fd                	addi	a5,a5,-1
    80205cfc:	fed79ae3          	bne	a5,a3,80205cf0 <emake+0x15a>
    char c, *p = name;
    80205d00:	89ea                	mv	s3,s10
        shortname[i++] = c;
    80205d02:	4481                	li	s1,0
        if (i == 8 && p) {
    80205d04:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80205d06:	4ba9                	li	s7,10
        if (c >= 'a' && c <= 'z') {
    80205d08:	4c65                	li	s8,25
                memset(shortname + i, ' ', 8 - i);
    80205d0a:	f6040793          	addi	a5,s0,-160
    80205d0e:	f4f43823          	sd	a5,-176(s0)
    80205d12:	a8d9                	j	80205de8 <emake+0x252>
    char c, *p = name;
    80205d14:	89ea                	mv	s3,s10
    80205d16:	b7f5                	j	80205d02 <emake+0x16c>
        if (i == 8 && p) {
    80205d18:	22098b63          	beqz	s3,80205f4e <emake+0x3b8>
            if (p + 1 < name) { break; }            // no '.'
    80205d1c:	0985                	addi	s3,s3,1
    80205d1e:	0949fc63          	bgeu	s3,s4,80205db6 <emake+0x220>
    80205d22:	f6040793          	addi	a5,s0,-160
    80205d26:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    80205d28:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    80205d2c:	4729                	li	a4,10
        shortname[i++] = ' ';
    80205d2e:	2485                	addiw	s1,s1,1
    80205d30:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    80205d34:	0785                	addi	a5,a5,1
    80205d36:	fe975ce3          	bge	a4,s1,80205d2e <emake+0x198>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    80205d3a:	f6040513          	addi	a0,s0,-160
    80205d3e:	00000097          	auipc	ra,0x0
    80205d42:	e2a080e7          	jalr	-470(ra) # 80205b68 <cal_checksum>
    80205d46:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    80205d4a:	47bd                	li	a5,15
    80205d4c:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    80205d50:	f4843783          	ld	a5,-184(s0)
    80205d54:	14f05c63          	blez	a5,80205eac <emake+0x316>
    80205d58:	f5842783          	lw	a5,-168(s0)
    80205d5c:	37fd                	addiw	a5,a5,-1
    80205d5e:	f4f42223          	sw	a5,-188(s0)
    80205d62:	00179b9b          	slliw	s7,a5,0x1
    80205d66:	00fb8bbb          	addw	s7,s7,a5
    80205d6a:	002b9b9b          	slliw	s7,s7,0x2
    80205d6e:	00fb8bbb          	addw	s7,s7,a5
    80205d72:	9bea                	add	s7,s7,s10
    80205d74:	8aee                	mv	s5,s11
    80205d76:	8c66                	mv	s8,s9
            int end = 0;
    80205d78:	4981                	li	s3,0
            uint8 *w = (uint8 *)de.lne.name1;
    80205d7a:	f7140793          	addi	a5,s0,-143
    80205d7e:	f4f43823          	sd	a5,-176(s0)
    80205d82:	0ff00913          	li	s2,255
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80205d86:	f7e40793          	addi	a5,s0,-130
    80205d8a:	f4f43c23          	sd	a5,-168(s0)
                switch (j) {
    80205d8e:	44ad                	li	s1,11
    80205d90:	f8c40a13          	addi	s4,s0,-116
    80205d94:	a0c5                	j	80205e74 <emake+0x2de>
            if (name > p) {                    // last '.'
    80205d96:	0549f663          	bgeu	s3,s4,80205de2 <emake+0x24c>
                memset(shortname + i, ' ', 8 - i);
    80205d9a:	47a1                	li	a5,8
    80205d9c:	4097863b          	subw	a2,a5,s1
    80205da0:	02000593          	li	a1,32
    80205da4:	f5043783          	ld	a5,-176(s0)
    80205da8:	00978533          	add	a0,a5,s1
    80205dac:	ffffb097          	auipc	ra,0xffffb
    80205db0:	9b6080e7          	jalr	-1610(ra) # 80200762 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80205db4:	89d2                	mv	s3,s4
        shortname[i++] = c;
    80205db6:	8a4e                	mv	s4,s3
    80205db8:	84d6                	mv	s1,s5
    80205dba:	4981                	li	s3,0
    80205dbc:	a02d                	j	80205de6 <emake+0x250>
            if (strchr(illegal, c) != NULL) {
    80205dbe:	85ca                	mv	a1,s2
    80205dc0:	00006517          	auipc	a0,0x6
    80205dc4:	c7050513          	addi	a0,a0,-912 # 8020ba30 <illegal.0>
    80205dc8:	ffffb097          	auipc	ra,0xffffb
    80205dcc:	bf8080e7          	jalr	-1032(ra) # 802009c0 <strchr>
    80205dd0:	c119                	beqz	a0,80205dd6 <emake+0x240>
                c = '_';
    80205dd2:	05f00913          	li	s2,95
        shortname[i++] = c;
    80205dd6:	f9048793          	addi	a5,s1,-112
    80205dda:	97a2                	add	a5,a5,s0
    80205ddc:	fd278823          	sb	s2,-48(a5)
    80205de0:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80205de2:	f49bcce3          	blt	s7,s1,80205d3a <emake+0x1a4>
        shortname[i++] = c;
    80205de6:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80205de8:	00190a13          	addi	s4,s2,1
    80205dec:	00094903          	lbu	s2,0(s2)
    80205df0:	02090663          	beqz	s2,80205e1c <emake+0x286>
        if (i == 8 && p) {
    80205df4:	f35482e3          	beq	s1,s5,80205d18 <emake+0x182>
        if (c == ' ') { continue; }
    80205df8:	02000793          	li	a5,32
    80205dfc:	fef903e3          	beq	s2,a5,80205de2 <emake+0x24c>
        if (c == '.') {
    80205e00:	02e00793          	li	a5,46
    80205e04:	f8f909e3          	beq	s2,a5,80205d96 <emake+0x200>
        if (c >= 'a' && c <= 'z') {
    80205e08:	f9f9079b          	addiw	a5,s2,-97
    80205e0c:	0ff7f793          	zext.b	a5,a5
    80205e10:	fafc67e3          	bltu	s8,a5,80205dbe <emake+0x228>
            c += 'A' - 'a';
    80205e14:	3901                	addiw	s2,s2,-32
    80205e16:	0ff97913          	zext.b	s2,s2
    80205e1a:	bf75                	j	80205dd6 <emake+0x240>
    while (i < CHAR_SHORT_NAME) {
    80205e1c:	47a9                	li	a5,10
    80205e1e:	f097d2e3          	bge	a5,s1,80205d22 <emake+0x18c>
    80205e22:	bf21                	j	80205d3a <emake+0x1a4>
                de.lne.order |= LAST_LONG_ENTRY;
    80205e24:	0407e793          	ori	a5,a5,64
    80205e28:	f6f40823          	sb	a5,-144(s0)
    80205e2c:	a891                	j	80205e80 <emake+0x2ea>
                    if ((*w++ = *p++) == 0) {
    80205e2e:	00084603          	lbu	a2,0(a6)
                        end = 1;
    80205e32:	00163513          	seqz	a0,a2
                    *w++ = 0;
    80205e36:	00278893          	addi	a7,a5,2
                    if ((*w++ = *p++) == 0) {
    80205e3a:	0805                	addi	a6,a6,1
                    *w++ = 0;
    80205e3c:	85ce                	mv	a1,s3
    80205e3e:	a8d5                	j	80205f32 <emake+0x39c>
            uint off2 = reloc_clus(dp, off, 1);
    80205e40:	4605                	li	a2,1
    80205e42:	85e2                	mv	a1,s8
    80205e44:	855a                	mv	a0,s6
    80205e46:	fffff097          	auipc	ra,0xfffff
    80205e4a:	460080e7          	jalr	1120(ra) # 802052a6 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80205e4e:	02000793          	li	a5,32
    80205e52:	0005071b          	sext.w	a4,a0
    80205e56:	f7040693          	addi	a3,s0,-144
    80205e5a:	864e                	mv	a2,s3
    80205e5c:	4585                	li	a1,1
    80205e5e:	10cb2503          	lw	a0,268(s6)
    80205e62:	fffff097          	auipc	ra,0xfffff
    80205e66:	54c080e7          	jalr	1356(ra) # 802053ae <rw_clus>
            off += sizeof(de);
    80205e6a:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    80205e6e:	1bcd                	addi	s7,s7,-13
    80205e70:	03505163          	blez	s5,80205e92 <emake+0x2fc>
            if ((de.lne.order = i) == entcnt) {
    80205e74:	0ffaf793          	zext.b	a5,s5
    80205e78:	fafd86e3          	beq	s11,a5,80205e24 <emake+0x28e>
    80205e7c:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    80205e80:	3afd                	addiw	s5,s5,-1
    80205e82:	885e                	mv	a6,s7
    80205e84:	4709                	li	a4,2
            int end = 0;
    80205e86:	854e                	mv	a0,s3
            uint8 *w = (uint8 *)de.lne.name1;
    80205e88:	f5043783          	ld	a5,-176(s0)
                switch (j) {
    80205e8c:	4315                	li	t1,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80205e8e:	4e35                	li	t3,13
    80205e90:	a851                	j	80205f24 <emake+0x38e>
    80205e92:	020c8c9b          	addiw	s9,s9,32
            off += sizeof(de);
    80205e96:	4781                	li	a5,0
    80205e98:	f4843703          	ld	a4,-184(s0)
    80205e9c:	00e05663          	blez	a4,80205ea8 <emake+0x312>
    80205ea0:	f4442783          	lw	a5,-188(s0)
    80205ea4:	0057979b          	slliw	a5,a5,0x5
    80205ea8:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    80205eac:	02000613          	li	a2,32
    80205eb0:	4581                	li	a1,0
    80205eb2:	f7040493          	addi	s1,s0,-144
    80205eb6:	8526                	mv	a0,s1
    80205eb8:	ffffb097          	auipc	ra,0xffffb
    80205ebc:	8aa080e7          	jalr	-1878(ra) # 80200762 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    80205ec0:	462d                	li	a2,11
    80205ec2:	f6040593          	addi	a1,s0,-160
    80205ec6:	8526                	mv	a0,s1
    80205ec8:	ffffb097          	auipc	ra,0xffffb
    80205ecc:	9ae080e7          	jalr	-1618(ra) # 80200876 <strncpy>
        de.sne.attr = ep->attribute;
    80205ed0:	100d4783          	lbu	a5,256(s10)
    80205ed4:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    80205ed8:	104d2783          	lw	a5,260(s10)
    80205edc:	0107d71b          	srliw	a4,a5,0x10
    80205ee0:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    80205ee4:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    80205ee8:	108d2783          	lw	a5,264(s10)
    80205eec:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80205ef0:	4605                	li	a2,1
    80205ef2:	85e6                	mv	a1,s9
    80205ef4:	855a                	mv	a0,s6
    80205ef6:	fffff097          	auipc	ra,0xfffff
    80205efa:	3b0080e7          	jalr	944(ra) # 802052a6 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80205efe:	02000793          	li	a5,32
    80205f02:	0005071b          	sext.w	a4,a0
    80205f06:	86a6                	mv	a3,s1
    80205f08:	4601                	li	a2,0
    80205f0a:	4585                	li	a1,1
    80205f0c:	10cb2503          	lw	a0,268(s6)
    80205f10:	fffff097          	auipc	ra,0xfffff
    80205f14:	49e080e7          	jalr	1182(ra) # 802053ae <rw_clus>
}
    80205f18:	b325                	j	80205c40 <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80205f1a:	f5843783          	ld	a5,-168(s0)
    80205f1e:	a011                	j	80205f22 <emake+0x38c>
                switch (j) {
    80205f20:	87d2                	mv	a5,s4
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80205f22:	2705                	addiw	a4,a4,1
    80205f24:	fff7069b          	addiw	a3,a4,-1
                if (end) {
    80205f28:	d119                	beqz	a0,80205e2e <emake+0x298>
                    *w++ = 0xff;
    80205f2a:	00278893          	addi	a7,a5,2
    80205f2e:	864a                	mv	a2,s2
    80205f30:	85ca                	mv	a1,s2
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80205f32:	00c78023          	sb	a2,0(a5)
                    *w++ = 0xff;
    80205f36:	00b780a3          	sb	a1,1(a5)
                switch (j) {
    80205f3a:	fe6680e3          	beq	a3,t1,80205f1a <emake+0x384>
    80205f3e:	fe9681e3          	beq	a3,s1,80205f20 <emake+0x38a>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80205f42:	0007079b          	sext.w	a5,a4
    80205f46:	eefe4de3          	blt	t3,a5,80205e40 <emake+0x2aa>
    80205f4a:	87c6                	mv	a5,a7
    80205f4c:	bfd9                	j	80205f22 <emake+0x38c>
        if (c == ' ') { continue; }
    80205f4e:	02000793          	li	a5,32
    80205f52:	e8f90ae3          	beq	s2,a5,80205de6 <emake+0x250>
        if (c == '.') {
    80205f56:	02e00793          	li	a5,46
    80205f5a:	eaf917e3          	bne	s2,a5,80205e08 <emake+0x272>
    80205f5e:	bd35                	j	80205d9a <emake+0x204>

0000000080205f60 <edup>:
{
    80205f60:	1101                	addi	sp,sp,-32
    80205f62:	ec06                	sd	ra,24(sp)
    80205f64:	e822                	sd	s0,16(sp)
    80205f66:	e426                	sd	s1,8(sp)
    80205f68:	1000                	addi	s0,sp,32
    80205f6a:	84aa                	mv	s1,a0
    if (entry != 0) {
    80205f6c:	c515                	beqz	a0,80205f98 <edup+0x38>
        acquire(&ecache.lock);
    80205f6e:	00018517          	auipc	a0,0x18
    80205f72:	64a50513          	addi	a0,a0,1610 # 8021e5b8 <ecache>
    80205f76:	ffffa097          	auipc	ra,0xffffa
    80205f7a:	750080e7          	jalr	1872(ra) # 802006c6 <acquire>
        entry->ref++;
    80205f7e:	1184a783          	lw	a5,280(s1)
    80205f82:	2785                	addiw	a5,a5,1
    80205f84:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80205f88:	00018517          	auipc	a0,0x18
    80205f8c:	63050513          	addi	a0,a0,1584 # 8021e5b8 <ecache>
    80205f90:	ffffa097          	auipc	ra,0xffffa
    80205f94:	78a080e7          	jalr	1930(ra) # 8020071a <release>
}
    80205f98:	8526                	mv	a0,s1
    80205f9a:	60e2                	ld	ra,24(sp)
    80205f9c:	6442                	ld	s0,16(sp)
    80205f9e:	64a2                	ld	s1,8(sp)
    80205fa0:	6105                	addi	sp,sp,32
    80205fa2:	8082                	ret

0000000080205fa4 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    80205fa4:	11554783          	lbu	a5,277(a0)
    80205fa8:	c3e5                	beqz	a5,80206088 <eupdate+0xe4>
{
    80205faa:	711d                	addi	sp,sp,-96
    80205fac:	ec86                	sd	ra,88(sp)
    80205fae:	e8a2                	sd	s0,80(sp)
    80205fb0:	e4a6                	sd	s1,72(sp)
    80205fb2:	e0ca                	sd	s2,64(sp)
    80205fb4:	fc4e                	sd	s3,56(sp)
    80205fb6:	1080                	addi	s0,sp,96
    80205fb8:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    80205fba:	11651703          	lh	a4,278(a0)
    80205fbe:	4785                	li	a5,1
    80205fc0:	00f70963          	beq	a4,a5,80205fd2 <eupdate+0x2e>
}
    80205fc4:	60e6                	ld	ra,88(sp)
    80205fc6:	6446                	ld	s0,80(sp)
    80205fc8:	64a6                	ld	s1,72(sp)
    80205fca:	6906                	ld	s2,64(sp)
    80205fcc:	79e2                	ld	s3,56(sp)
    80205fce:	6125                	addi	sp,sp,96
    80205fd0:	8082                	ret
    uint entcnt = 0;
    80205fd2:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    80205fd6:	4601                	li	a2,0
    80205fd8:	11c52583          	lw	a1,284(a0)
    80205fdc:	12053503          	ld	a0,288(a0)
    80205fe0:	fffff097          	auipc	ra,0xfffff
    80205fe4:	2c6080e7          	jalr	710(ra) # 802052a6 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    80205fe8:	1204b803          	ld	a6,288(s1)
    80205fec:	4785                	li	a5,1
    80205fee:	0005071b          	sext.w	a4,a0
    80205ff2:	fcc40693          	addi	a3,s0,-52
    80205ff6:	4601                	li	a2,0
    80205ff8:	4581                	li	a1,0
    80205ffa:	10c82503          	lw	a0,268(a6)
    80205ffe:	fffff097          	auipc	ra,0xfffff
    80206002:	3b0080e7          	jalr	944(ra) # 802053ae <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206006:	fcc42583          	lw	a1,-52(s0)
    8020600a:	fbf5f593          	andi	a1,a1,-65
    8020600e:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    80206012:	0055959b          	slliw	a1,a1,0x5
    80206016:	11c4a783          	lw	a5,284(s1)
    8020601a:	4601                	li	a2,0
    8020601c:	9dbd                	addw	a1,a1,a5
    8020601e:	1204b503          	ld	a0,288(s1)
    80206022:	fffff097          	auipc	ra,0xfffff
    80206026:	284080e7          	jalr	644(ra) # 802052a6 <reloc_clus>
    8020602a:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    8020602e:	1204b503          	ld	a0,288(s1)
    80206032:	02000793          	li	a5,32
    80206036:	874e                	mv	a4,s3
    80206038:	fa840913          	addi	s2,s0,-88
    8020603c:	86ca                	mv	a3,s2
    8020603e:	4601                	li	a2,0
    80206040:	4581                	li	a1,0
    80206042:	10c52503          	lw	a0,268(a0)
    80206046:	fffff097          	auipc	ra,0xfffff
    8020604a:	368080e7          	jalr	872(ra) # 802053ae <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    8020604e:	1044a783          	lw	a5,260(s1)
    80206052:	0107d71b          	srliw	a4,a5,0x10
    80206056:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    8020605a:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    8020605e:	1084a783          	lw	a5,264(s1)
    80206062:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206066:	1204b503          	ld	a0,288(s1)
    8020606a:	02000793          	li	a5,32
    8020606e:	874e                	mv	a4,s3
    80206070:	86ca                	mv	a3,s2
    80206072:	4601                	li	a2,0
    80206074:	4585                	li	a1,1
    80206076:	10c52503          	lw	a0,268(a0)
    8020607a:	fffff097          	auipc	ra,0xfffff
    8020607e:	334080e7          	jalr	820(ra) # 802053ae <rw_clus>
    entry->dirty = 0;
    80206082:	10048aa3          	sb	zero,277(s1)
    80206086:	bf3d                	j	80205fc4 <eupdate+0x20>
    80206088:	8082                	ret

000000008020608a <eremove>:
    if (entry->valid != 1) { return; }
    8020608a:	11651703          	lh	a4,278(a0)
    8020608e:	4785                	li	a5,1
    80206090:	00f70363          	beq	a4,a5,80206096 <eremove+0xc>
    80206094:	8082                	ret
{
    80206096:	715d                	addi	sp,sp,-80
    80206098:	e486                	sd	ra,72(sp)
    8020609a:	e0a2                	sd	s0,64(sp)
    8020609c:	fc26                	sd	s1,56(sp)
    8020609e:	f84a                	sd	s2,48(sp)
    802060a0:	f44e                	sd	s3,40(sp)
    802060a2:	f052                	sd	s4,32(sp)
    802060a4:	ec56                	sd	s5,24(sp)
    802060a6:	0880                	addi	s0,sp,80
    802060a8:	89aa                	mv	s3,a0
    uint entcnt = 0;
    802060aa:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    802060ae:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    802060b2:	4601                	li	a2,0
    802060b4:	85d2                	mv	a1,s4
    802060b6:	12053503          	ld	a0,288(a0)
    802060ba:	fffff097          	auipc	ra,0xfffff
    802060be:	1ec080e7          	jalr	492(ra) # 802052a6 <reloc_clus>
    802060c2:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    802060c6:	1209b503          	ld	a0,288(s3)
    802060ca:	4785                	li	a5,1
    802060cc:	8726                	mv	a4,s1
    802060ce:	fbc40693          	addi	a3,s0,-68
    802060d2:	4601                	li	a2,0
    802060d4:	4581                	li	a1,0
    802060d6:	10c52503          	lw	a0,268(a0)
    802060da:	fffff097          	auipc	ra,0xfffff
    802060de:	2d4080e7          	jalr	724(ra) # 802053ae <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    802060e2:	fbc42783          	lw	a5,-68(s0)
    802060e6:	fbf7f793          	andi	a5,a5,-65
    802060ea:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    802060ee:	5795                	li	a5,-27
    802060f0:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    802060f4:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    802060f6:	fbb40a93          	addi	s5,s0,-69
    802060fa:	1209b503          	ld	a0,288(s3)
    802060fe:	4785                	li	a5,1
    80206100:	8726                	mv	a4,s1
    80206102:	86d6                	mv	a3,s5
    80206104:	4601                	li	a2,0
    80206106:	4585                	li	a1,1
    80206108:	10c52503          	lw	a0,268(a0)
    8020610c:	fffff097          	auipc	ra,0xfffff
    80206110:	2a2080e7          	jalr	674(ra) # 802053ae <rw_clus>
        off += 32;
    80206114:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    80206118:	4601                	li	a2,0
    8020611a:	85d2                	mv	a1,s4
    8020611c:	1209b503          	ld	a0,288(s3)
    80206120:	fffff097          	auipc	ra,0xfffff
    80206124:	186080e7          	jalr	390(ra) # 802052a6 <reloc_clus>
    80206128:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    8020612c:	0019079b          	addiw	a5,s2,1
    80206130:	0007891b          	sext.w	s2,a5
    80206134:	fbc42703          	lw	a4,-68(s0)
    80206138:	fd2771e3          	bgeu	a4,s2,802060fa <eremove+0x70>
    entry->valid = -1;
    8020613c:	57fd                	li	a5,-1
    8020613e:	10f99b23          	sh	a5,278(s3)
}
    80206142:	60a6                	ld	ra,72(sp)
    80206144:	6406                	ld	s0,64(sp)
    80206146:	74e2                	ld	s1,56(sp)
    80206148:	7942                	ld	s2,48(sp)
    8020614a:	79a2                	ld	s3,40(sp)
    8020614c:	7a02                	ld	s4,32(sp)
    8020614e:	6ae2                	ld	s5,24(sp)
    80206150:	6161                	addi	sp,sp,80
    80206152:	8082                	ret

0000000080206154 <etrunc>:
{
    80206154:	7179                	addi	sp,sp,-48
    80206156:	f406                	sd	ra,40(sp)
    80206158:	f022                	sd	s0,32(sp)
    8020615a:	ec26                	sd	s1,24(sp)
    8020615c:	e84a                	sd	s2,16(sp)
    8020615e:	e44e                	sd	s3,8(sp)
    80206160:	e052                	sd	s4,0(sp)
    80206162:	1800                	addi	s0,sp,48
    80206164:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206166:	10452483          	lw	s1,260(a0)
    8020616a:	ffe4871b          	addiw	a4,s1,-2
    8020616e:	100007b7          	lui	a5,0x10000
    80206172:	17d5                	addi	a5,a5,-11 # ffffff5 <_entry-0x7020000b>
    80206174:	02e7e663          	bltu	a5,a4,802061a0 <etrunc+0x4c>
    80206178:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    8020617a:	0004891b          	sext.w	s2,s1
    8020617e:	8526                	mv	a0,s1
    80206180:	fffff097          	auipc	ra,0xfffff
    80206184:	eee080e7          	jalr	-274(ra) # 8020506e <read_fat>
    80206188:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    8020618c:	4581                	li	a1,0
    8020618e:	854a                	mv	a0,s2
    80206190:	fffff097          	auipc	ra,0xfffff
    80206194:	096080e7          	jalr	150(ra) # 80205226 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206198:	ffe4879b          	addiw	a5,s1,-2
    8020619c:	fcf9ffe3          	bgeu	s3,a5,8020617a <etrunc+0x26>
    entry->file_size = 0;
    802061a0:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    802061a4:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    802061a8:	4785                	li	a5,1
    802061aa:	10fa0aa3          	sb	a5,277(s4)
}
    802061ae:	70a2                	ld	ra,40(sp)
    802061b0:	7402                	ld	s0,32(sp)
    802061b2:	64e2                	ld	s1,24(sp)
    802061b4:	6942                	ld	s2,16(sp)
    802061b6:	69a2                	ld	s3,8(sp)
    802061b8:	6a02                	ld	s4,0(sp)
    802061ba:	6145                	addi	sp,sp,48
    802061bc:	8082                	ret

00000000802061be <elock>:
{
    802061be:	1141                	addi	sp,sp,-16
    802061c0:	e406                	sd	ra,8(sp)
    802061c2:	e022                	sd	s0,0(sp)
    802061c4:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    802061c6:	cd19                	beqz	a0,802061e4 <elock+0x26>
    802061c8:	11852783          	lw	a5,280(a0)
    802061cc:	00f05c63          	blez	a5,802061e4 <elock+0x26>
    acquiresleep(&entry->lock);
    802061d0:	13850513          	addi	a0,a0,312
    802061d4:	ffffd097          	auipc	ra,0xffffd
    802061d8:	47a080e7          	jalr	1146(ra) # 8020364e <acquiresleep>
}
    802061dc:	60a2                	ld	ra,8(sp)
    802061de:	6402                	ld	s0,0(sp)
    802061e0:	0141                	addi	sp,sp,16
    802061e2:	8082                	ret
        panic("elock");
    802061e4:	00004517          	auipc	a0,0x4
    802061e8:	adc50513          	addi	a0,a0,-1316 # 80209cc0 <digits+0x940>
    802061ec:	ffffa097          	auipc	ra,0xffffa
    802061f0:	f58080e7          	jalr	-168(ra) # 80200144 <panic>

00000000802061f4 <eunlock>:
{
    802061f4:	1101                	addi	sp,sp,-32
    802061f6:	ec06                	sd	ra,24(sp)
    802061f8:	e822                	sd	s0,16(sp)
    802061fa:	e426                	sd	s1,8(sp)
    802061fc:	e04a                	sd	s2,0(sp)
    802061fe:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    80206200:	c90d                	beqz	a0,80206232 <eunlock+0x3e>
    80206202:	84aa                	mv	s1,a0
    80206204:	13850913          	addi	s2,a0,312
    80206208:	854a                	mv	a0,s2
    8020620a:	ffffd097          	auipc	ra,0xffffd
    8020620e:	4de080e7          	jalr	1246(ra) # 802036e8 <holdingsleep>
    80206212:	c105                	beqz	a0,80206232 <eunlock+0x3e>
    80206214:	1184a783          	lw	a5,280(s1)
    80206218:	00f05d63          	blez	a5,80206232 <eunlock+0x3e>
    releasesleep(&entry->lock);
    8020621c:	854a                	mv	a0,s2
    8020621e:	ffffd097          	auipc	ra,0xffffd
    80206222:	486080e7          	jalr	1158(ra) # 802036a4 <releasesleep>
}
    80206226:	60e2                	ld	ra,24(sp)
    80206228:	6442                	ld	s0,16(sp)
    8020622a:	64a2                	ld	s1,8(sp)
    8020622c:	6902                	ld	s2,0(sp)
    8020622e:	6105                	addi	sp,sp,32
    80206230:	8082                	ret
        panic("eunlock");
    80206232:	00004517          	auipc	a0,0x4
    80206236:	a9650513          	addi	a0,a0,-1386 # 80209cc8 <digits+0x948>
    8020623a:	ffffa097          	auipc	ra,0xffffa
    8020623e:	f0a080e7          	jalr	-246(ra) # 80200144 <panic>

0000000080206242 <eput>:
{
    80206242:	1101                	addi	sp,sp,-32
    80206244:	ec06                	sd	ra,24(sp)
    80206246:	e822                	sd	s0,16(sp)
    80206248:	e426                	sd	s1,8(sp)
    8020624a:	e04a                	sd	s2,0(sp)
    8020624c:	1000                	addi	s0,sp,32
    8020624e:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    80206250:	00018517          	auipc	a0,0x18
    80206254:	36850513          	addi	a0,a0,872 # 8021e5b8 <ecache>
    80206258:	ffffa097          	auipc	ra,0xffffa
    8020625c:	46e080e7          	jalr	1134(ra) # 802006c6 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    80206260:	00018797          	auipc	a5,0x18
    80206264:	1f078793          	addi	a5,a5,496 # 8021e450 <root>
    80206268:	00f48a63          	beq	s1,a5,8020627c <eput+0x3a>
    8020626c:	11649783          	lh	a5,278(s1)
    80206270:	c791                	beqz	a5,8020627c <eput+0x3a>
    80206272:	1184a703          	lw	a4,280(s1)
    80206276:	4785                	li	a5,1
    80206278:	02f70563          	beq	a4,a5,802062a2 <eput+0x60>
    entry->ref--;
    8020627c:	1184a783          	lw	a5,280(s1)
    80206280:	37fd                	addiw	a5,a5,-1
    80206282:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    80206286:	00018517          	auipc	a0,0x18
    8020628a:	33250513          	addi	a0,a0,818 # 8021e5b8 <ecache>
    8020628e:	ffffa097          	auipc	ra,0xffffa
    80206292:	48c080e7          	jalr	1164(ra) # 8020071a <release>
}
    80206296:	60e2                	ld	ra,24(sp)
    80206298:	6442                	ld	s0,16(sp)
    8020629a:	64a2                	ld	s1,8(sp)
    8020629c:	6902                	ld	s2,0(sp)
    8020629e:	6105                	addi	sp,sp,32
    802062a0:	8082                	ret
        acquiresleep(&entry->lock);
    802062a2:	13848913          	addi	s2,s1,312
    802062a6:	854a                	mv	a0,s2
    802062a8:	ffffd097          	auipc	ra,0xffffd
    802062ac:	3a6080e7          	jalr	934(ra) # 8020364e <acquiresleep>
        entry->next->prev = entry->prev;
    802062b0:	1284b703          	ld	a4,296(s1)
    802062b4:	1304b783          	ld	a5,304(s1)
    802062b8:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    802062bc:	1284b703          	ld	a4,296(s1)
    802062c0:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    802062c4:	00018797          	auipc	a5,0x18
    802062c8:	16478793          	addi	a5,a5,356 # 8021e428 <fat>
    802062cc:	1507b703          	ld	a4,336(a5)
    802062d0:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    802062d4:	00018697          	auipc	a3,0x18
    802062d8:	17c68693          	addi	a3,a3,380 # 8021e450 <root>
    802062dc:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    802062e0:	12973823          	sd	s1,304(a4)
        root.next = entry;
    802062e4:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    802062e8:	00018517          	auipc	a0,0x18
    802062ec:	2d050513          	addi	a0,a0,720 # 8021e5b8 <ecache>
    802062f0:	ffffa097          	auipc	ra,0xffffa
    802062f4:	42a080e7          	jalr	1066(ra) # 8020071a <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    802062f8:	11649703          	lh	a4,278(s1)
    802062fc:	57fd                	li	a5,-1
    802062fe:	06f70863          	beq	a4,a5,8020636e <eput+0x12c>
            elock(entry->parent);
    80206302:	1204b503          	ld	a0,288(s1)
    80206306:	00000097          	auipc	ra,0x0
    8020630a:	eb8080e7          	jalr	-328(ra) # 802061be <elock>
            eupdate(entry);
    8020630e:	8526                	mv	a0,s1
    80206310:	00000097          	auipc	ra,0x0
    80206314:	c94080e7          	jalr	-876(ra) # 80205fa4 <eupdate>
            eunlock(entry->parent);
    80206318:	1204b503          	ld	a0,288(s1)
    8020631c:	00000097          	auipc	ra,0x0
    80206320:	ed8080e7          	jalr	-296(ra) # 802061f4 <eunlock>
        releasesleep(&entry->lock);
    80206324:	854a                	mv	a0,s2
    80206326:	ffffd097          	auipc	ra,0xffffd
    8020632a:	37e080e7          	jalr	894(ra) # 802036a4 <releasesleep>
        struct dirent *eparent = entry->parent;
    8020632e:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80206332:	00018517          	auipc	a0,0x18
    80206336:	28650513          	addi	a0,a0,646 # 8021e5b8 <ecache>
    8020633a:	ffffa097          	auipc	ra,0xffffa
    8020633e:	38c080e7          	jalr	908(ra) # 802006c6 <acquire>
        entry->ref--;
    80206342:	1184a783          	lw	a5,280(s1)
    80206346:	37fd                	addiw	a5,a5,-1
    80206348:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    8020634c:	00018517          	auipc	a0,0x18
    80206350:	26c50513          	addi	a0,a0,620 # 8021e5b8 <ecache>
    80206354:	ffffa097          	auipc	ra,0xffffa
    80206358:	3c6080e7          	jalr	966(ra) # 8020071a <release>
        if (entry->ref == 0) {
    8020635c:	1184a783          	lw	a5,280(s1)
    80206360:	fb9d                	bnez	a5,80206296 <eput+0x54>
            eput(eparent);
    80206362:	854a                	mv	a0,s2
    80206364:	00000097          	auipc	ra,0x0
    80206368:	ede080e7          	jalr	-290(ra) # 80206242 <eput>
    8020636c:	b72d                	j	80206296 <eput+0x54>
            etrunc(entry);
    8020636e:	8526                	mv	a0,s1
    80206370:	00000097          	auipc	ra,0x0
    80206374:	de4080e7          	jalr	-540(ra) # 80206154 <etrunc>
    80206378:	b775                	j	80206324 <eput+0xe2>

000000008020637a <estat>:
{
    8020637a:	1101                	addi	sp,sp,-32
    8020637c:	ec06                	sd	ra,24(sp)
    8020637e:	e822                	sd	s0,16(sp)
    80206380:	e426                	sd	s1,8(sp)
    80206382:	e04a                	sd	s2,0(sp)
    80206384:	1000                	addi	s0,sp,32
    80206386:	892a                	mv	s2,a0
    80206388:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    8020638a:	02000613          	li	a2,32
    8020638e:	85aa                	mv	a1,a0
    80206390:	8526                	mv	a0,s1
    80206392:	ffffa097          	auipc	ra,0xffffa
    80206396:	4e4080e7          	jalr	1252(ra) # 80200876 <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    8020639a:	10094783          	lbu	a5,256(s2)
    8020639e:	8bc1                	andi	a5,a5,16
    802063a0:	0017b793          	seqz	a5,a5
    802063a4:	0785                	addi	a5,a5,1
    802063a6:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    802063aa:	11494783          	lbu	a5,276(s2)
    802063ae:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    802063b0:	10896783          	lwu	a5,264(s2)
    802063b4:	f89c                	sd	a5,48(s1)
}
    802063b6:	60e2                	ld	ra,24(sp)
    802063b8:	6442                	ld	s0,16(sp)
    802063ba:	64a2                	ld	s1,8(sp)
    802063bc:	6902                	ld	s2,0(sp)
    802063be:	6105                	addi	sp,sp,32
    802063c0:	8082                	ret

00000000802063c2 <enext>:
 * @return  -1      meet the end of dir
 *          0       find empty slots
 *          1       find a file with all its entries
 */
int enext(struct dirent *dp, struct dirent *ep, uint off, int *count)
{
    802063c2:	7119                	addi	sp,sp,-128
    802063c4:	fc86                	sd	ra,120(sp)
    802063c6:	f8a2                	sd	s0,112(sp)
    802063c8:	f4a6                	sd	s1,104(sp)
    802063ca:	f0ca                	sd	s2,96(sp)
    802063cc:	ecce                	sd	s3,88(sp)
    802063ce:	e8d2                	sd	s4,80(sp)
    802063d0:	e4d6                	sd	s5,72(sp)
    802063d2:	e0da                	sd	s6,64(sp)
    802063d4:	fc5e                	sd	s7,56(sp)
    802063d6:	f862                	sd	s8,48(sp)
    802063d8:	f466                	sd	s9,40(sp)
    802063da:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    802063dc:	10054783          	lbu	a5,256(a0)
    802063e0:	8bc1                	andi	a5,a5,16
    802063e2:	cf95                	beqz	a5,8020641e <enext+0x5c>
    802063e4:	892a                	mv	s2,a0
    802063e6:	89ae                	mv	s3,a1
    802063e8:	84b2                	mv	s1,a2
    802063ea:	8ab6                	mv	s5,a3
        panic("enext not dir");
    if (ep->valid)
    802063ec:	11659783          	lh	a5,278(a1)
    802063f0:	ef9d                	bnez	a5,8020642e <enext+0x6c>
        panic("enext ep valid");
    if (off % 32)
    802063f2:	01f67793          	andi	a5,a2,31
    802063f6:	e7a1                	bnez	a5,8020643e <enext+0x7c>
        panic("enext not align");
    if (dp->valid != 1) { return -1; }
    802063f8:	11651703          	lh	a4,278(a0)
    802063fc:	4785                	li	a5,1
    802063fe:	557d                	li	a0,-1
    80206400:	04f70763          	beq	a4,a5,8020644e <enext+0x8c>
            read_entry_info(ep, &de);
            return 1;
        }
    }
    return -1;
}
    80206404:	70e6                	ld	ra,120(sp)
    80206406:	7446                	ld	s0,112(sp)
    80206408:	74a6                	ld	s1,104(sp)
    8020640a:	7906                	ld	s2,96(sp)
    8020640c:	69e6                	ld	s3,88(sp)
    8020640e:	6a46                	ld	s4,80(sp)
    80206410:	6aa6                	ld	s5,72(sp)
    80206412:	6b06                	ld	s6,64(sp)
    80206414:	7be2                	ld	s7,56(sp)
    80206416:	7c42                	ld	s8,48(sp)
    80206418:	7ca2                	ld	s9,40(sp)
    8020641a:	6109                	addi	sp,sp,128
    8020641c:	8082                	ret
        panic("enext not dir");
    8020641e:	00004517          	auipc	a0,0x4
    80206422:	8b250513          	addi	a0,a0,-1870 # 80209cd0 <digits+0x950>
    80206426:	ffffa097          	auipc	ra,0xffffa
    8020642a:	d1e080e7          	jalr	-738(ra) # 80200144 <panic>
        panic("enext ep valid");
    8020642e:	00004517          	auipc	a0,0x4
    80206432:	8b250513          	addi	a0,a0,-1870 # 80209ce0 <digits+0x960>
    80206436:	ffffa097          	auipc	ra,0xffffa
    8020643a:	d0e080e7          	jalr	-754(ra) # 80200144 <panic>
        panic("enext not align");
    8020643e:	00004517          	auipc	a0,0x4
    80206442:	8b250513          	addi	a0,a0,-1870 # 80209cf0 <digits+0x970>
    80206446:	ffffa097          	auipc	ra,0xffffa
    8020644a:	cfe080e7          	jalr	-770(ra) # 80200144 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    8020644e:	10000613          	li	a2,256
    80206452:	4581                	li	a1,0
    80206454:	854e                	mv	a0,s3
    80206456:	ffffa097          	auipc	ra,0xffffa
    8020645a:	30c080e7          	jalr	780(ra) # 80200762 <memset>
    int cnt = 0;
    8020645e:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206460:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80206462:	f8040a13          	addi	s4,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    80206466:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    8020646a:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    8020646c:	a03d                	j	8020649a <enext+0xd8>
            cnt++;
    8020646e:	2b05                	addiw	s6,s6,1
            continue;
    80206470:	a01d                	j	80206496 <enext+0xd4>
            *count = cnt;
    80206472:	016aa023          	sw	s6,0(s5)
            return 0;
    80206476:	4501                	li	a0,0
    80206478:	b771                	j	80206404 <enext+0x42>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    8020647a:	fff7079b          	addiw	a5,a4,-1
    8020647e:	0017951b          	slliw	a0,a5,0x1
    80206482:	9d3d                	addw	a0,a0,a5
    80206484:	0025151b          	slliw	a0,a0,0x2
    80206488:	9d3d                	addw	a0,a0,a5
    8020648a:	85d2                	mv	a1,s4
    8020648c:	954e                	add	a0,a0,s3
    8020648e:	fffff097          	auipc	ra,0xfffff
    80206492:	17a080e7          	jalr	378(ra) # 80205608 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206496:	0204849b          	addiw	s1,s1,32
    8020649a:	4601                	li	a2,0
    8020649c:	85a6                	mv	a1,s1
    8020649e:	854a                	mv	a0,s2
    802064a0:	fffff097          	auipc	ra,0xfffff
    802064a4:	e06080e7          	jalr	-506(ra) # 802052a6 <reloc_clus>
    802064a8:	f5750ee3          	beq	a0,s7,80206404 <enext+0x42>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    802064ac:	02000793          	li	a5,32
    802064b0:	0005071b          	sext.w	a4,a0
    802064b4:	86d2                	mv	a3,s4
    802064b6:	4601                	li	a2,0
    802064b8:	4581                	li	a1,0
    802064ba:	10c92503          	lw	a0,268(s2)
    802064be:	fffff097          	auipc	ra,0xfffff
    802064c2:	ef0080e7          	jalr	-272(ra) # 802053ae <rw_clus>
    802064c6:	2501                	sext.w	a0,a0
    802064c8:	02000793          	li	a5,32
    802064cc:	06f51c63          	bne	a0,a5,80206544 <enext+0x182>
    802064d0:	f8044783          	lbu	a5,-128(s0)
    802064d4:	cbb5                	beqz	a5,80206548 <enext+0x186>
        if (de.lne.order == EMPTY_ENTRY) {
    802064d6:	f9878ce3          	beq	a5,s8,8020646e <enext+0xac>
        } else if (cnt) {
    802064da:	f80b1ce3          	bnez	s6,80206472 <enext+0xb0>
        if (de.lne.attr == ATTR_LONG_NAME) {
    802064de:	f8b44703          	lbu	a4,-117(s0)
    802064e2:	01971d63          	bne	a4,s9,802064fc <enext+0x13a>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    802064e6:	0bf7f713          	andi	a4,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    802064ea:	0407f793          	andi	a5,a5,64
    802064ee:	d7d1                	beqz	a5,8020647a <enext+0xb8>
                *count = lcnt + 1;                              // plus the s-n-e;
    802064f0:	0017079b          	addiw	a5,a4,1
    802064f4:	00faa023          	sw	a5,0(s5)
                count = 0;
    802064f8:	4a81                	li	s5,0
    802064fa:	b741                	j	8020647a <enext+0xb8>
            if (count) {
    802064fc:	000a8c63          	beqz	s5,80206514 <enext+0x152>
                *count = 1;
    80206500:	4785                	li	a5,1
    80206502:	00faa023          	sw	a5,0(s5)
                read_entry_name(ep->filename, &de);
    80206506:	f8040593          	addi	a1,s0,-128
    8020650a:	854e                	mv	a0,s3
    8020650c:	fffff097          	auipc	ra,0xfffff
    80206510:	0fc080e7          	jalr	252(ra) # 80205608 <read_entry_name>
    entry->attribute = d->sne.attr;
    80206514:	f8b44783          	lbu	a5,-117(s0)
    80206518:	10f98023          	sb	a5,256(s3)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    8020651c:	f9445783          	lhu	a5,-108(s0)
    80206520:	0107979b          	slliw	a5,a5,0x10
    80206524:	f9a45703          	lhu	a4,-102(s0)
    80206528:	8fd9                	or	a5,a5,a4
    8020652a:	2781                	sext.w	a5,a5
    8020652c:	10f9a223          	sw	a5,260(s3)
    entry->file_size = d->sne.file_size;
    80206530:	f9c42703          	lw	a4,-100(s0)
    80206534:	10e9a423          	sw	a4,264(s3)
    entry->cur_clus = entry->first_clus;
    80206538:	10f9a623          	sw	a5,268(s3)
    entry->clus_cnt = 0;
    8020653c:	1009a823          	sw	zero,272(s3)
            return 1;
    80206540:	4505                	li	a0,1
}
    80206542:	b5c9                	j	80206404 <enext+0x42>
            return -1;
    80206544:	557d                	li	a0,-1
    80206546:	bd7d                	j	80206404 <enext+0x42>
    80206548:	557d                	li	a0,-1
    8020654a:	bd6d                	j	80206404 <enext+0x42>

000000008020654c <dirlookup>:
 * @param   dp          entry of a directory file
 * @param   filename    target filename
 * @param   poff        offset of proper empty entry slots from the beginning of the dir
 */
struct dirent *dirlookup(struct dirent *dp, char *filename, uint *poff)
{
    8020654c:	711d                	addi	sp,sp,-96
    8020654e:	ec86                	sd	ra,88(sp)
    80206550:	e8a2                	sd	s0,80(sp)
    80206552:	e4a6                	sd	s1,72(sp)
    80206554:	e0ca                	sd	s2,64(sp)
    80206556:	fc4e                	sd	s3,56(sp)
    80206558:	f852                	sd	s4,48(sp)
    8020655a:	f456                	sd	s5,40(sp)
    8020655c:	f05a                	sd	s6,32(sp)
    8020655e:	ec5e                	sd	s7,24(sp)
    80206560:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206562:	10054783          	lbu	a5,256(a0)
    80206566:	8bc1                	andi	a5,a5,16
    80206568:	cbb1                	beqz	a5,802065bc <dirlookup+0x70>
    8020656a:	84aa                	mv	s1,a0
    8020656c:	89ae                	mv	s3,a1
    8020656e:	8ab2                	mv	s5,a2
        panic("dirlookup not DIR");
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    80206570:	0ff00613          	li	a2,255
    80206574:	00003597          	auipc	a1,0x3
    80206578:	7a458593          	addi	a1,a1,1956 # 80209d18 <digits+0x998>
    8020657c:	854e                	mv	a0,s3
    8020657e:	ffffa097          	auipc	ra,0xffffa
    80206582:	2bc080e7          	jalr	700(ra) # 8020083a <strncmp>
    80206586:	c139                	beqz	a0,802065cc <dirlookup+0x80>
        return edup(dp);
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    80206588:	0ff00613          	li	a2,255
    8020658c:	00003597          	auipc	a1,0x3
    80206590:	79458593          	addi	a1,a1,1940 # 80209d20 <digits+0x9a0>
    80206594:	854e                	mv	a0,s3
    80206596:	ffffa097          	auipc	ra,0xffffa
    8020659a:	2a4080e7          	jalr	676(ra) # 8020083a <strncmp>
    8020659e:	e125                	bnez	a0,802065fe <dirlookup+0xb2>
        if (dp == &root) {
    802065a0:	00018797          	auipc	a5,0x18
    802065a4:	eb078793          	addi	a5,a5,-336 # 8021e450 <root>
    802065a8:	04f48463          	beq	s1,a5,802065f0 <dirlookup+0xa4>
            return edup(&root);
        }
        return edup(dp->parent);
    802065ac:	1204b503          	ld	a0,288(s1)
    802065b0:	00000097          	auipc	ra,0x0
    802065b4:	9b0080e7          	jalr	-1616(ra) # 80205f60 <edup>
    802065b8:	892a                	mv	s2,a0
    802065ba:	a839                	j	802065d8 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    802065bc:	00003517          	auipc	a0,0x3
    802065c0:	74450513          	addi	a0,a0,1860 # 80209d00 <digits+0x980>
    802065c4:	ffffa097          	auipc	ra,0xffffa
    802065c8:	b80080e7          	jalr	-1152(ra) # 80200144 <panic>
        return edup(dp);
    802065cc:	8526                	mv	a0,s1
    802065ce:	00000097          	auipc	ra,0x0
    802065d2:	992080e7          	jalr	-1646(ra) # 80205f60 <edup>
    802065d6:	892a                	mv	s2,a0
    if (poff) {
        *poff = off;
    }
    eput(ep);
    return NULL;
}
    802065d8:	854a                	mv	a0,s2
    802065da:	60e6                	ld	ra,88(sp)
    802065dc:	6446                	ld	s0,80(sp)
    802065de:	64a6                	ld	s1,72(sp)
    802065e0:	6906                	ld	s2,64(sp)
    802065e2:	79e2                	ld	s3,56(sp)
    802065e4:	7a42                	ld	s4,48(sp)
    802065e6:	7aa2                	ld	s5,40(sp)
    802065e8:	7b02                	ld	s6,32(sp)
    802065ea:	6be2                	ld	s7,24(sp)
    802065ec:	6125                	addi	sp,sp,96
    802065ee:	8082                	ret
            return edup(&root);
    802065f0:	853e                	mv	a0,a5
    802065f2:	00000097          	auipc	ra,0x0
    802065f6:	96e080e7          	jalr	-1682(ra) # 80205f60 <edup>
    802065fa:	892a                	mv	s2,a0
    802065fc:	bff1                	j	802065d8 <dirlookup+0x8c>
    if (dp->valid != 1) {
    802065fe:	11649703          	lh	a4,278(s1)
    80206602:	4785                	li	a5,1
        return NULL;
    80206604:	4901                	li	s2,0
    if (dp->valid != 1) {
    80206606:	fcf719e3          	bne	a4,a5,802065d8 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    8020660a:	85ce                	mv	a1,s3
    8020660c:	8526                	mv	a0,s1
    8020660e:	fffff097          	auipc	ra,0xfffff
    80206612:	eec080e7          	jalr	-276(ra) # 802054fa <eget>
    80206616:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    80206618:	11651703          	lh	a4,278(a0)
    8020661c:	4785                	li	a5,1
    8020661e:	faf70de3          	beq	a4,a5,802065d8 <dirlookup+0x8c>
    int len = strlen(filename);
    80206622:	854e                	mv	a0,s3
    80206624:	ffffa097          	auipc	ra,0xffffa
    80206628:	2c2080e7          	jalr	706(ra) # 802008e6 <strlen>
    int count = 0;
    8020662c:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    80206630:	4601                	li	a2,0
    80206632:	4581                	li	a1,0
    80206634:	8526                	mv	a0,s1
    80206636:	fffff097          	auipc	ra,0xfffff
    8020663a:	c70080e7          	jalr	-912(ra) # 802052a6 <reloc_clus>
    uint off = 0;
    8020663e:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    80206640:	fac40b93          	addi	s7,s0,-84
    80206644:	5b7d                	li	s6,-1
    80206646:	86de                	mv	a3,s7
    80206648:	8652                	mv	a2,s4
    8020664a:	85ca                	mv	a1,s2
    8020664c:	8526                	mv	a0,s1
    8020664e:	00000097          	auipc	ra,0x0
    80206652:	d74080e7          	jalr	-652(ra) # 802063c2 <enext>
    80206656:	03650f63          	beq	a0,s6,80206694 <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    8020665a:	0ff00613          	li	a2,255
    8020665e:	85ca                	mv	a1,s2
    80206660:	854e                	mv	a0,s3
    80206662:	ffffa097          	auipc	ra,0xffffa
    80206666:	1d8080e7          	jalr	472(ra) # 8020083a <strncmp>
    8020666a:	c901                	beqz	a0,8020667a <dirlookup+0x12e>
        off += count << 5;
    8020666c:	fac42783          	lw	a5,-84(s0)
    80206670:	0057979b          	slliw	a5,a5,0x5
    80206674:	01478a3b          	addw	s4,a5,s4
    80206678:	b7f9                	j	80206646 <dirlookup+0xfa>
            ep->parent = edup(dp);
    8020667a:	8526                	mv	a0,s1
    8020667c:	00000097          	auipc	ra,0x0
    80206680:	8e4080e7          	jalr	-1820(ra) # 80205f60 <edup>
    80206684:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    80206688:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    8020668c:	4785                	li	a5,1
    8020668e:	10f91b23          	sh	a5,278(s2)
            return ep;
    80206692:	b799                	j	802065d8 <dirlookup+0x8c>
    if (poff) {
    80206694:	000a8463          	beqz	s5,8020669c <dirlookup+0x150>
        *poff = off;
    80206698:	014aa023          	sw	s4,0(s5)
    eput(ep);
    8020669c:	854a                	mv	a0,s2
    8020669e:	00000097          	auipc	ra,0x0
    802066a2:	ba4080e7          	jalr	-1116(ra) # 80206242 <eput>
    return NULL;
    802066a6:	4901                	li	s2,0
    802066a8:	bf05                	j	802065d8 <dirlookup+0x8c>

00000000802066aa <ealloc>:
{
    802066aa:	715d                	addi	sp,sp,-80
    802066ac:	e486                	sd	ra,72(sp)
    802066ae:	e0a2                	sd	s0,64(sp)
    802066b0:	fc26                	sd	s1,56(sp)
    802066b2:	f84a                	sd	s2,48(sp)
    802066b4:	f44e                	sd	s3,40(sp)
    802066b6:	f052                	sd	s4,32(sp)
    802066b8:	ec56                	sd	s5,24(sp)
    802066ba:	0880                	addi	s0,sp,80
    802066bc:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    802066be:	10054783          	lbu	a5,256(a0)
    802066c2:	8bc1                	andi	a5,a5,16
    802066c4:	c7b1                	beqz	a5,80206710 <ealloc+0x66>
    802066c6:	852e                	mv	a0,a1
    802066c8:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    802066ca:	11691703          	lh	a4,278(s2)
    802066ce:	4785                	li	a5,1
        return NULL;
    802066d0:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    802066d2:	02f71563          	bne	a4,a5,802066fc <ealloc+0x52>
    802066d6:	fffff097          	auipc	ra,0xfffff
    802066da:	408080e7          	jalr	1032(ra) # 80205ade <formatname>
    802066de:	89aa                	mv	s3,a0
    802066e0:	10050663          	beqz	a0,802067ec <ealloc+0x142>
    uint off = 0;
    802066e4:	fa042e23          	sw	zero,-68(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    802066e8:	fbc40613          	addi	a2,s0,-68
    802066ec:	85aa                	mv	a1,a0
    802066ee:	854a                	mv	a0,s2
    802066f0:	00000097          	auipc	ra,0x0
    802066f4:	e5c080e7          	jalr	-420(ra) # 8020654c <dirlookup>
    802066f8:	84aa                	mv	s1,a0
    802066fa:	c11d                	beqz	a0,80206720 <ealloc+0x76>
}
    802066fc:	8526                	mv	a0,s1
    802066fe:	60a6                	ld	ra,72(sp)
    80206700:	6406                	ld	s0,64(sp)
    80206702:	74e2                	ld	s1,56(sp)
    80206704:	7942                	ld	s2,48(sp)
    80206706:	79a2                	ld	s3,40(sp)
    80206708:	7a02                	ld	s4,32(sp)
    8020670a:	6ae2                	ld	s5,24(sp)
    8020670c:	6161                	addi	sp,sp,80
    8020670e:	8082                	ret
        panic("ealloc not dir");
    80206710:	00003517          	auipc	a0,0x3
    80206714:	61850513          	addi	a0,a0,1560 # 80209d28 <digits+0x9a8>
    80206718:	ffffa097          	auipc	ra,0xffffa
    8020671c:	a2c080e7          	jalr	-1492(ra) # 80200144 <panic>
    ep = eget(dp, name);
    80206720:	85ce                	mv	a1,s3
    80206722:	854a                	mv	a0,s2
    80206724:	fffff097          	auipc	ra,0xfffff
    80206728:	dd6080e7          	jalr	-554(ra) # 802054fa <eget>
    8020672c:	84aa                	mv	s1,a0
    elock(ep);
    8020672e:	00000097          	auipc	ra,0x0
    80206732:	a90080e7          	jalr	-1392(ra) # 802061be <elock>
    ep->attribute = attr;
    80206736:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    8020673a:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    8020673e:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    80206742:	854a                	mv	a0,s2
    80206744:	00000097          	auipc	ra,0x0
    80206748:	81c080e7          	jalr	-2020(ra) # 80205f60 <edup>
    8020674c:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    80206750:	fbc42a83          	lw	s5,-68(s0)
    80206754:	1154ae23          	sw	s5,284(s1)
    ep->clus_cnt = 0;
    80206758:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    8020675c:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    80206760:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    80206764:	0ff00613          	li	a2,255
    80206768:	85ce                	mv	a1,s3
    8020676a:	8526                	mv	a0,s1
    8020676c:	ffffa097          	auipc	ra,0xffffa
    80206770:	10a080e7          	jalr	266(ra) # 80200876 <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    80206774:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    80206778:	47c1                	li	a5,16
    8020677a:	02fa0863          	beq	s4,a5,802067aa <ealloc+0x100>
        ep->attribute |= ATTR_ARCHIVE;
    8020677e:	1004c783          	lbu	a5,256(s1)
    80206782:	0207e793          	ori	a5,a5,32
    80206786:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    8020678a:	8656                	mv	a2,s5
    8020678c:	85a6                	mv	a1,s1
    8020678e:	854a                	mv	a0,s2
    80206790:	fffff097          	auipc	ra,0xfffff
    80206794:	406080e7          	jalr	1030(ra) # 80205b96 <emake>
    ep->valid = 1;
    80206798:	4785                	li	a5,1
    8020679a:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    8020679e:	8526                	mv	a0,s1
    802067a0:	00000097          	auipc	ra,0x0
    802067a4:	a54080e7          	jalr	-1452(ra) # 802061f4 <eunlock>
    return ep;
    802067a8:	bf91                	j	802066fc <ealloc+0x52>
        ep->attribute |= ATTR_DIRECTORY;
    802067aa:	1004c783          	lbu	a5,256(s1)
    802067ae:	0107e793          	ori	a5,a5,16
    802067b2:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    802067b6:	11494503          	lbu	a0,276(s2)
    802067ba:	fffff097          	auipc	ra,0xfffff
    802067be:	92a080e7          	jalr	-1750(ra) # 802050e4 <alloc_clus>
    802067c2:	2501                	sext.w	a0,a0
    802067c4:	10a4a223          	sw	a0,260(s1)
    802067c8:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    802067cc:	4601                	li	a2,0
    802067ce:	85a6                	mv	a1,s1
    802067d0:	8526                	mv	a0,s1
    802067d2:	fffff097          	auipc	ra,0xfffff
    802067d6:	3c4080e7          	jalr	964(ra) # 80205b96 <emake>
        emake(ep, dp, 32);
    802067da:	02000613          	li	a2,32
    802067de:	85ca                	mv	a1,s2
    802067e0:	8526                	mv	a0,s1
    802067e2:	fffff097          	auipc	ra,0xfffff
    802067e6:	3b4080e7          	jalr	948(ra) # 80205b96 <emake>
    802067ea:	b745                	j	8020678a <ealloc+0xe0>
        return NULL;
    802067ec:	84aa                	mv	s1,a0
    802067ee:	b739                	j	802066fc <ealloc+0x52>

00000000802067f0 <lookup_path>:
    return path;
}

// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    802067f0:	715d                	addi	sp,sp,-80
    802067f2:	e486                	sd	ra,72(sp)
    802067f4:	e0a2                	sd	s0,64(sp)
    802067f6:	fc26                	sd	s1,56(sp)
    802067f8:	f84a                	sd	s2,48(sp)
    802067fa:	f44e                	sd	s3,40(sp)
    802067fc:	f052                	sd	s4,32(sp)
    802067fe:	ec56                	sd	s5,24(sp)
    80206800:	e85a                	sd	s6,16(sp)
    80206802:	e45e                	sd	s7,8(sp)
    80206804:	e062                	sd	s8,0(sp)
    80206806:	0880                	addi	s0,sp,80
    80206808:	892a                	mv	s2,a0
    8020680a:	8b2e                	mv	s6,a1
    8020680c:	8ab2                	mv	s5,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    8020680e:	00054783          	lbu	a5,0(a0)
    80206812:	02f00713          	li	a4,47
    80206816:	02e78663          	beq	a5,a4,80206842 <lookup_path+0x52>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    8020681a:	4a01                	li	s4,0
    } else if (*path != '\0') {
    8020681c:	cba1                	beqz	a5,8020686c <lookup_path+0x7c>
        entry = edup(myproc()->cwd);
    8020681e:	ffffb097          	auipc	ra,0xffffb
    80206822:	21e080e7          	jalr	542(ra) # 80201a3c <myproc>
    80206826:	15853503          	ld	a0,344(a0)
    8020682a:	fffff097          	auipc	ra,0xfffff
    8020682e:	736080e7          	jalr	1846(ra) # 80205f60 <edup>
    80206832:	8a2a                	mv	s4,a0
    while (*path == '/') {
    80206834:	02f00993          	li	s3,47
    80206838:	0ff00b93          	li	s7,255
    8020683c:	0ff00c13          	li	s8,255
    80206840:	a0e5                	j	80206928 <lookup_path+0x138>
        entry = edup(&root);
    80206842:	00018517          	auipc	a0,0x18
    80206846:	c0e50513          	addi	a0,a0,-1010 # 8021e450 <root>
    8020684a:	fffff097          	auipc	ra,0xfffff
    8020684e:	716080e7          	jalr	1814(ra) # 80205f60 <edup>
    80206852:	8a2a                	mv	s4,a0
    80206854:	b7c5                	j	80206834 <lookup_path+0x44>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    80206856:	8552                	mv	a0,s4
    80206858:	00000097          	auipc	ra,0x0
    8020685c:	99c080e7          	jalr	-1636(ra) # 802061f4 <eunlock>
            eput(entry);
    80206860:	8552                	mv	a0,s4
    80206862:	00000097          	auipc	ra,0x0
    80206866:	9e0080e7          	jalr	-1568(ra) # 80206242 <eput>
            return NULL;
    8020686a:	4a01                	li	s4,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    8020686c:	8552                	mv	a0,s4
    8020686e:	60a6                	ld	ra,72(sp)
    80206870:	6406                	ld	s0,64(sp)
    80206872:	74e2                	ld	s1,56(sp)
    80206874:	7942                	ld	s2,48(sp)
    80206876:	79a2                	ld	s3,40(sp)
    80206878:	7a02                	ld	s4,32(sp)
    8020687a:	6ae2                	ld	s5,24(sp)
    8020687c:	6b42                	ld	s6,16(sp)
    8020687e:	6ba2                	ld	s7,8(sp)
    80206880:	6c02                	ld	s8,0(sp)
    80206882:	6161                	addi	sp,sp,80
    80206884:	8082                	ret
            eunlock(entry);
    80206886:	8552                	mv	a0,s4
    80206888:	00000097          	auipc	ra,0x0
    8020688c:	96c080e7          	jalr	-1684(ra) # 802061f4 <eunlock>
            return entry;
    80206890:	bff1                	j	8020686c <lookup_path+0x7c>
            eunlock(entry);
    80206892:	8552                	mv	a0,s4
    80206894:	00000097          	auipc	ra,0x0
    80206898:	960080e7          	jalr	-1696(ra) # 802061f4 <eunlock>
            eput(entry);
    8020689c:	8552                	mv	a0,s4
    8020689e:	00000097          	auipc	ra,0x0
    802068a2:	9a4080e7          	jalr	-1628(ra) # 80206242 <eput>
            return NULL;
    802068a6:	8a4a                	mv	s4,s2
    802068a8:	b7d1                	j	8020686c <lookup_path+0x7c>
    int len = path - s;
    802068aa:	412487b3          	sub	a5,s1,s2
    802068ae:	863e                	mv	a2,a5
    802068b0:	2781                	sext.w	a5,a5
    802068b2:	00fbd363          	bge	s7,a5,802068b8 <lookup_path+0xc8>
    802068b6:	8662                	mv	a2,s8
    802068b8:	0006079b          	sext.w	a5,a2
    name[len] = 0;
    802068bc:	97d6                	add	a5,a5,s5
    802068be:	00078023          	sb	zero,0(a5)
    memmove(name, s, len);
    802068c2:	2601                	sext.w	a2,a2
    802068c4:	85ca                	mv	a1,s2
    802068c6:	8556                	mv	a0,s5
    802068c8:	ffffa097          	auipc	ra,0xffffa
    802068cc:	ef6080e7          	jalr	-266(ra) # 802007be <memmove>
    while (*path == '/') {
    802068d0:	0004c783          	lbu	a5,0(s1)
    802068d4:	01379763          	bne	a5,s3,802068e2 <lookup_path+0xf2>
        path++;
    802068d8:	0485                	addi	s1,s1,1
    while (*path == '/') {
    802068da:	0004c783          	lbu	a5,0(s1)
    802068de:	ff378de3          	beq	a5,s3,802068d8 <lookup_path+0xe8>
        elock(entry);
    802068e2:	8552                	mv	a0,s4
    802068e4:	00000097          	auipc	ra,0x0
    802068e8:	8da080e7          	jalr	-1830(ra) # 802061be <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    802068ec:	100a4783          	lbu	a5,256(s4)
    802068f0:	8bc1                	andi	a5,a5,16
    802068f2:	d3b5                	beqz	a5,80206856 <lookup_path+0x66>
        if (parent && *path == '\0') {
    802068f4:	000b0563          	beqz	s6,802068fe <lookup_path+0x10e>
    802068f8:	0004c783          	lbu	a5,0(s1)
    802068fc:	d7c9                	beqz	a5,80206886 <lookup_path+0x96>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    802068fe:	4601                	li	a2,0
    80206900:	85d6                	mv	a1,s5
    80206902:	8552                	mv	a0,s4
    80206904:	00000097          	auipc	ra,0x0
    80206908:	c48080e7          	jalr	-952(ra) # 8020654c <dirlookup>
    8020690c:	892a                	mv	s2,a0
    8020690e:	d151                	beqz	a0,80206892 <lookup_path+0xa2>
        eunlock(entry);
    80206910:	8552                	mv	a0,s4
    80206912:	00000097          	auipc	ra,0x0
    80206916:	8e2080e7          	jalr	-1822(ra) # 802061f4 <eunlock>
        eput(entry);
    8020691a:	8552                	mv	a0,s4
    8020691c:	00000097          	auipc	ra,0x0
    80206920:	926080e7          	jalr	-1754(ra) # 80206242 <eput>
        entry = next;
    80206924:	8a4a                	mv	s4,s2
        eput(entry);
    80206926:	8926                	mv	s2,s1
    while (*path == '/') {
    80206928:	00094783          	lbu	a5,0(s2)
    8020692c:	03379363          	bne	a5,s3,80206952 <lookup_path+0x162>
        path++;
    80206930:	0905                	addi	s2,s2,1
    while (*path == '/') {
    80206932:	00094783          	lbu	a5,0(s2)
    80206936:	ff378de3          	beq	a5,s3,80206930 <lookup_path+0x140>
    if (*path == 0) { return NULL; }
    8020693a:	cf89                	beqz	a5,80206954 <lookup_path+0x164>
        path++;
    8020693c:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    8020693e:	f73786e3          	beq	a5,s3,802068aa <lookup_path+0xba>
        eput(entry);
    80206942:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    80206944:	d3bd                	beqz	a5,802068aa <lookup_path+0xba>
        path++;
    80206946:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    80206948:	0004c783          	lbu	a5,0(s1)
    8020694c:	ff379ce3          	bne	a5,s3,80206944 <lookup_path+0x154>
    80206950:	bfa9                	j	802068aa <lookup_path+0xba>
    if (*path == 0) { return NULL; }
    80206952:	fbe5                	bnez	a5,80206942 <lookup_path+0x152>
    if (parent) {
    80206954:	f00b0ce3          	beqz	s6,8020686c <lookup_path+0x7c>
        eput(entry);
    80206958:	8552                	mv	a0,s4
    8020695a:	00000097          	auipc	ra,0x0
    8020695e:	8e8080e7          	jalr	-1816(ra) # 80206242 <eput>
        return NULL;
    80206962:	4a01                	li	s4,0
    80206964:	b721                	j	8020686c <lookup_path+0x7c>

0000000080206966 <ename>:

struct dirent *ename(char *path)
{
    80206966:	716d                	addi	sp,sp,-272
    80206968:	e606                	sd	ra,264(sp)
    8020696a:	e222                	sd	s0,256(sp)
    8020696c:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    8020696e:	ef040613          	addi	a2,s0,-272
    80206972:	4581                	li	a1,0
    80206974:	00000097          	auipc	ra,0x0
    80206978:	e7c080e7          	jalr	-388(ra) # 802067f0 <lookup_path>
}
    8020697c:	60b2                	ld	ra,264(sp)
    8020697e:	6412                	ld	s0,256(sp)
    80206980:	6151                	addi	sp,sp,272
    80206982:	8082                	ret

0000000080206984 <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    80206984:	1141                	addi	sp,sp,-16
    80206986:	e406                	sd	ra,8(sp)
    80206988:	e022                	sd	s0,0(sp)
    8020698a:	0800                	addi	s0,sp,16
    8020698c:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    8020698e:	4585                	li	a1,1
    80206990:	00000097          	auipc	ra,0x0
    80206994:	e60080e7          	jalr	-416(ra) # 802067f0 <lookup_path>
}
    80206998:	60a2                	ld	ra,8(sp)
    8020699a:	6402                	ld	s0,0(sp)
    8020699c:	0141                	addi	sp,sp,16
    8020699e:	8082                	ret

00000000802069a0 <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    802069a0:	1141                	addi	sp,sp,-16
    802069a2:	e422                	sd	s0,8(sp)
    802069a4:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    802069a6:	00fc37b7          	lui	a5,0xfc3
    802069aa:	07ba                	slli	a5,a5,0xe
    802069ac:	4705                	li	a4,1
    802069ae:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    802069b0:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    802069b2:	6422                	ld	s0,8(sp)
    802069b4:	0141                	addi	sp,sp,16
    802069b6:	8082                	ret

00000000802069b8 <plicinithart>:

void
plicinithart(void)
{
    802069b8:	1141                	addi	sp,sp,-16
    802069ba:	e406                	sd	ra,8(sp)
    802069bc:	e022                	sd	s0,0(sp)
    802069be:	0800                	addi	s0,sp,16
  int hart = cpuid();
    802069c0:	ffffb097          	auipc	ra,0xffffb
    802069c4:	050080e7          	jalr	80(ra) # 80201a10 <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    802069c8:	0085171b          	slliw	a4,a0,0x8
    802069cc:	01f867b7          	lui	a5,0x1f86
    802069d0:	0785                	addi	a5,a5,1 # 1f86001 <_entry-0x7e279fff>
    802069d2:	07b6                	slli	a5,a5,0xd
    802069d4:	97ba                	add	a5,a5,a4
    802069d6:	40200713          	li	a4,1026
    802069da:	08e7a023          	sw	a4,128(a5)
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    802069de:	00d5151b          	slliw	a0,a0,0xd
    802069e2:	03f0c7b7          	lui	a5,0x3f0c
    802069e6:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    802069ea:	07b2                	slli	a5,a5,0xc
    802069ec:	97aa                	add	a5,a5,a0
    802069ee:	0007a023          	sw	zero,0(a5)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    802069f2:	60a2                	ld	ra,8(sp)
    802069f4:	6402                	ld	s0,0(sp)
    802069f6:	0141                	addi	sp,sp,16
    802069f8:	8082                	ret

00000000802069fa <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    802069fa:	1141                	addi	sp,sp,-16
    802069fc:	e406                	sd	ra,8(sp)
    802069fe:	e022                	sd	s0,0(sp)
    80206a00:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80206a02:	ffffb097          	auipc	ra,0xffffb
    80206a06:	00e080e7          	jalr	14(ra) # 80201a10 <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    80206a0a:	00d5151b          	slliw	a0,a0,0xd
    80206a0e:	03f0c7b7          	lui	a5,0x3f0c
    80206a12:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80206a16:	07b2                	slli	a5,a5,0xc
    80206a18:	97aa                	add	a5,a5,a0
  #endif
  return irq;
}
    80206a1a:	43c8                	lw	a0,4(a5)
    80206a1c:	60a2                	ld	ra,8(sp)
    80206a1e:	6402                	ld	s0,0(sp)
    80206a20:	0141                	addi	sp,sp,16
    80206a22:	8082                	ret

0000000080206a24 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80206a24:	1101                	addi	sp,sp,-32
    80206a26:	ec06                	sd	ra,24(sp)
    80206a28:	e822                	sd	s0,16(sp)
    80206a2a:	e426                	sd	s1,8(sp)
    80206a2c:	1000                	addi	s0,sp,32
    80206a2e:	84aa                	mv	s1,a0
  int hart = cpuid();
    80206a30:	ffffb097          	auipc	ra,0xffffb
    80206a34:	fe0080e7          	jalr	-32(ra) # 80201a10 <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80206a38:	00d5151b          	slliw	a0,a0,0xd
    80206a3c:	03f0c7b7          	lui	a5,0x3f0c
    80206a40:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80206a44:	07b2                	slli	a5,a5,0xc
    80206a46:	97aa                	add	a5,a5,a0
    80206a48:	c3c4                	sw	s1,4(a5)
  #endif
}
    80206a4a:	60e2                	ld	ra,24(sp)
    80206a4c:	6442                	ld	s0,16(sp)
    80206a4e:	64a2                	ld	s1,8(sp)
    80206a50:	6105                	addi	sp,sp,32
    80206a52:	8082                	ret

0000000080206a54 <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    80206a54:	715d                	addi	sp,sp,-80
    80206a56:	e486                	sd	ra,72(sp)
    80206a58:	e0a2                	sd	s0,64(sp)
    80206a5a:	fc26                	sd	s1,56(sp)
    80206a5c:	f84a                	sd	s2,48(sp)
    80206a5e:	f44e                	sd	s3,40(sp)
    80206a60:	f052                	sd	s4,32(sp)
    80206a62:	ec56                	sd	s5,24(sp)
    80206a64:	e85a                	sd	s6,16(sp)
    80206a66:	0880                	addi	s0,sp,80
    80206a68:	8a2a                	mv	s4,a0
    80206a6a:	84ae                	mv	s1,a1
    80206a6c:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    80206a6e:	0001c517          	auipc	a0,0x1c
    80206a72:	1b250513          	addi	a0,a0,434 # 80222c20 <cons>
    80206a76:	ffffa097          	auipc	ra,0xffffa
    80206a7a:	c50080e7          	jalr	-944(ra) # 802006c6 <acquire>
  for(i = 0; i < n; i++){
    80206a7e:	07305063          	blez	s3,80206ade <consolewrite+0x8a>
    80206a82:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    80206a84:	fbf40b13          	addi	s6,s0,-65
    80206a88:	5afd                	li	s5,-1
    80206a8a:	4685                	li	a3,1
    80206a8c:	8626                	mv	a2,s1
    80206a8e:	85d2                	mv	a1,s4
    80206a90:	855a                	mv	a0,s6
    80206a92:	ffffc097          	auipc	ra,0xffffc
    80206a96:	ada080e7          	jalr	-1318(ra) # 8020256c <either_copyin>
    80206a9a:	01550f63          	beq	a0,s5,80206ab8 <consolewrite+0x64>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    80206a9e:	fbf44503          	lbu	a0,-65(s0)
    80206aa2:	4581                	li	a1,0
    80206aa4:	4601                	li	a2,0
    80206aa6:	4681                	li	a3,0
    80206aa8:	4885                	li	a7,1
    80206aaa:	00000073          	ecall
  for(i = 0; i < n; i++){
    80206aae:	2905                	addiw	s2,s2,1
    80206ab0:	0485                	addi	s1,s1,1
    80206ab2:	fd299ce3          	bne	s3,s2,80206a8a <consolewrite+0x36>
    80206ab6:	894e                	mv	s2,s3
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    80206ab8:	0001c517          	auipc	a0,0x1c
    80206abc:	16850513          	addi	a0,a0,360 # 80222c20 <cons>
    80206ac0:	ffffa097          	auipc	ra,0xffffa
    80206ac4:	c5a080e7          	jalr	-934(ra) # 8020071a <release>

  return i;
}
    80206ac8:	854a                	mv	a0,s2
    80206aca:	60a6                	ld	ra,72(sp)
    80206acc:	6406                	ld	s0,64(sp)
    80206ace:	74e2                	ld	s1,56(sp)
    80206ad0:	7942                	ld	s2,48(sp)
    80206ad2:	79a2                	ld	s3,40(sp)
    80206ad4:	7a02                	ld	s4,32(sp)
    80206ad6:	6ae2                	ld	s5,24(sp)
    80206ad8:	6b42                	ld	s6,16(sp)
    80206ada:	6161                	addi	sp,sp,80
    80206adc:	8082                	ret
  for(i = 0; i < n; i++){
    80206ade:	4901                	li	s2,0
    80206ae0:	bfe1                	j	80206ab8 <consolewrite+0x64>

0000000080206ae2 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80206ae2:	7119                	addi	sp,sp,-128
    80206ae4:	fc86                	sd	ra,120(sp)
    80206ae6:	f8a2                	sd	s0,112(sp)
    80206ae8:	f4a6                	sd	s1,104(sp)
    80206aea:	f0ca                	sd	s2,96(sp)
    80206aec:	ecce                	sd	s3,88(sp)
    80206aee:	e8d2                	sd	s4,80(sp)
    80206af0:	e4d6                	sd	s5,72(sp)
    80206af2:	e0da                	sd	s6,64(sp)
    80206af4:	fc5e                	sd	s7,56(sp)
    80206af6:	f862                	sd	s8,48(sp)
    80206af8:	f466                	sd	s9,40(sp)
    80206afa:	f06a                	sd	s10,32(sp)
    80206afc:	ec6e                	sd	s11,24(sp)
    80206afe:	0100                	addi	s0,sp,128
    80206b00:	8aaa                	mv	s5,a0
    80206b02:	8a2e                	mv	s4,a1
    80206b04:	89b2                	mv	s3,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    80206b06:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    80206b0a:	0001c517          	auipc	a0,0x1c
    80206b0e:	11650513          	addi	a0,a0,278 # 80222c20 <cons>
    80206b12:	ffffa097          	auipc	ra,0xffffa
    80206b16:	bb4080e7          	jalr	-1100(ra) # 802006c6 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80206b1a:	0001c497          	auipc	s1,0x1c
    80206b1e:	10648493          	addi	s1,s1,262 # 80222c20 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    80206b22:	0001c917          	auipc	s2,0x1c
    80206b26:	19690913          	addi	s2,s2,406 # 80222cb8 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80206b2a:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80206b2c:	f8f40d13          	addi	s10,s0,-113
    80206b30:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    80206b32:	4da9                	li	s11,10
  while(n > 0){
    80206b34:	07305763          	blez	s3,80206ba2 <consoleread+0xc0>
    while(cons.r == cons.w){
    80206b38:	0984a783          	lw	a5,152(s1)
    80206b3c:	09c4a703          	lw	a4,156(s1)
    80206b40:	02f71463          	bne	a4,a5,80206b68 <consoleread+0x86>
      if(myproc()->killed){
    80206b44:	ffffb097          	auipc	ra,0xffffb
    80206b48:	ef8080e7          	jalr	-264(ra) # 80201a3c <myproc>
    80206b4c:	591c                	lw	a5,48(a0)
    80206b4e:	e7ad                	bnez	a5,80206bb8 <consoleread+0xd6>
      sleep(&cons.r, &cons.lock);
    80206b50:	85a6                	mv	a1,s1
    80206b52:	854a                	mv	a0,s2
    80206b54:	ffffb097          	auipc	ra,0xffffb
    80206b58:	78c080e7          	jalr	1932(ra) # 802022e0 <sleep>
    while(cons.r == cons.w){
    80206b5c:	0984a783          	lw	a5,152(s1)
    80206b60:	09c4a703          	lw	a4,156(s1)
    80206b64:	fef700e3          	beq	a4,a5,80206b44 <consoleread+0x62>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80206b68:	0017871b          	addiw	a4,a5,1
    80206b6c:	08e4ac23          	sw	a4,152(s1)
    80206b70:	07f7f713          	andi	a4,a5,127
    80206b74:	9726                	add	a4,a4,s1
    80206b76:	01874703          	lbu	a4,24(a4)
    80206b7a:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    80206b7e:	078b8563          	beq	s7,s8,80206be8 <consoleread+0x106>
    cbuf = c;
    80206b82:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80206b86:	4685                	li	a3,1
    80206b88:	866a                	mv	a2,s10
    80206b8a:	85d2                	mv	a1,s4
    80206b8c:	8556                	mv	a0,s5
    80206b8e:	ffffc097          	auipc	ra,0xffffc
    80206b92:	9a8080e7          	jalr	-1624(ra) # 80202536 <either_copyout>
    80206b96:	01950663          	beq	a0,s9,80206ba2 <consoleread+0xc0>
    dst++;
    80206b9a:	0a05                	addi	s4,s4,1
    --n;
    80206b9c:	39fd                	addiw	s3,s3,-1
    if(c == '\n'){
    80206b9e:	f9bb9be3          	bne	s7,s11,80206b34 <consoleread+0x52>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    80206ba2:	0001c517          	auipc	a0,0x1c
    80206ba6:	07e50513          	addi	a0,a0,126 # 80222c20 <cons>
    80206baa:	ffffa097          	auipc	ra,0xffffa
    80206bae:	b70080e7          	jalr	-1168(ra) # 8020071a <release>

  return target - n;
    80206bb2:	413b053b          	subw	a0,s6,s3
    80206bb6:	a811                	j	80206bca <consoleread+0xe8>
        release(&cons.lock);
    80206bb8:	0001c517          	auipc	a0,0x1c
    80206bbc:	06850513          	addi	a0,a0,104 # 80222c20 <cons>
    80206bc0:	ffffa097          	auipc	ra,0xffffa
    80206bc4:	b5a080e7          	jalr	-1190(ra) # 8020071a <release>
        return -1;
    80206bc8:	557d                	li	a0,-1
}
    80206bca:	70e6                	ld	ra,120(sp)
    80206bcc:	7446                	ld	s0,112(sp)
    80206bce:	74a6                	ld	s1,104(sp)
    80206bd0:	7906                	ld	s2,96(sp)
    80206bd2:	69e6                	ld	s3,88(sp)
    80206bd4:	6a46                	ld	s4,80(sp)
    80206bd6:	6aa6                	ld	s5,72(sp)
    80206bd8:	6b06                	ld	s6,64(sp)
    80206bda:	7be2                	ld	s7,56(sp)
    80206bdc:	7c42                	ld	s8,48(sp)
    80206bde:	7ca2                	ld	s9,40(sp)
    80206be0:	7d02                	ld	s10,32(sp)
    80206be2:	6de2                	ld	s11,24(sp)
    80206be4:	6109                	addi	sp,sp,128
    80206be6:	8082                	ret
      if(n < target){
    80206be8:	0009871b          	sext.w	a4,s3
    80206bec:	fb677be3          	bgeu	a4,s6,80206ba2 <consoleread+0xc0>
        cons.r--;
    80206bf0:	0001c717          	auipc	a4,0x1c
    80206bf4:	0cf72423          	sw	a5,200(a4) # 80222cb8 <cons+0x98>
    80206bf8:	b76d                	j	80206ba2 <consoleread+0xc0>

0000000080206bfa <consputc>:
void consputc(int c) {
    80206bfa:	1141                	addi	sp,sp,-16
    80206bfc:	e422                	sd	s0,8(sp)
    80206bfe:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    80206c00:	10000793          	li	a5,256
    80206c04:	00f50b63          	beq	a0,a5,80206c1a <consputc+0x20>
    80206c08:	4581                	li	a1,0
    80206c0a:	4601                	li	a2,0
    80206c0c:	4681                	li	a3,0
    80206c0e:	4885                	li	a7,1
    80206c10:	00000073          	ecall
}
    80206c14:	6422                	ld	s0,8(sp)
    80206c16:	0141                	addi	sp,sp,16
    80206c18:	8082                	ret
    80206c1a:	4521                	li	a0,8
    80206c1c:	4581                	li	a1,0
    80206c1e:	4601                	li	a2,0
    80206c20:	4681                	li	a3,0
    80206c22:	4885                	li	a7,1
    80206c24:	00000073          	ecall
    80206c28:	02000513          	li	a0,32
    80206c2c:	00000073          	ecall
    80206c30:	4521                	li	a0,8
    80206c32:	00000073          	ecall
}
    80206c36:	bff9                	j	80206c14 <consputc+0x1a>

0000000080206c38 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    80206c38:	1101                	addi	sp,sp,-32
    80206c3a:	ec06                	sd	ra,24(sp)
    80206c3c:	e822                	sd	s0,16(sp)
    80206c3e:	e426                	sd	s1,8(sp)
    80206c40:	e04a                	sd	s2,0(sp)
    80206c42:	1000                	addi	s0,sp,32
    80206c44:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    80206c46:	0001c517          	auipc	a0,0x1c
    80206c4a:	fda50513          	addi	a0,a0,-38 # 80222c20 <cons>
    80206c4e:	ffffa097          	auipc	ra,0xffffa
    80206c52:	a78080e7          	jalr	-1416(ra) # 802006c6 <acquire>

  switch(c){
    80206c56:	47d5                	li	a5,21
    80206c58:	0af48663          	beq	s1,a5,80206d04 <consoleintr+0xcc>
    80206c5c:	0297ca63          	blt	a5,s1,80206c90 <consoleintr+0x58>
    80206c60:	47a1                	li	a5,8
    80206c62:	0ef48763          	beq	s1,a5,80206d50 <consoleintr+0x118>
    80206c66:	47c1                	li	a5,16
    80206c68:	10f49a63          	bne	s1,a5,80206d7c <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    80206c6c:	ffffc097          	auipc	ra,0xffffc
    80206c70:	934080e7          	jalr	-1740(ra) # 802025a0 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    80206c74:	0001c517          	auipc	a0,0x1c
    80206c78:	fac50513          	addi	a0,a0,-84 # 80222c20 <cons>
    80206c7c:	ffffa097          	auipc	ra,0xffffa
    80206c80:	a9e080e7          	jalr	-1378(ra) # 8020071a <release>
}
    80206c84:	60e2                	ld	ra,24(sp)
    80206c86:	6442                	ld	s0,16(sp)
    80206c88:	64a2                	ld	s1,8(sp)
    80206c8a:	6902                	ld	s2,0(sp)
    80206c8c:	6105                	addi	sp,sp,32
    80206c8e:	8082                	ret
  switch(c){
    80206c90:	07f00793          	li	a5,127
    80206c94:	0af48e63          	beq	s1,a5,80206d50 <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80206c98:	0001c717          	auipc	a4,0x1c
    80206c9c:	f8870713          	addi	a4,a4,-120 # 80222c20 <cons>
    80206ca0:	0a072783          	lw	a5,160(a4)
    80206ca4:	09872703          	lw	a4,152(a4)
    80206ca8:	9f99                	subw	a5,a5,a4
    80206caa:	07f00713          	li	a4,127
    80206cae:	fcf763e3          	bltu	a4,a5,80206c74 <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    80206cb2:	47b5                	li	a5,13
    80206cb4:	0cf48763          	beq	s1,a5,80206d82 <consoleintr+0x14a>
      consputc(c);
    80206cb8:	8526                	mv	a0,s1
    80206cba:	00000097          	auipc	ra,0x0
    80206cbe:	f40080e7          	jalr	-192(ra) # 80206bfa <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80206cc2:	0001c797          	auipc	a5,0x1c
    80206cc6:	f5e78793          	addi	a5,a5,-162 # 80222c20 <cons>
    80206cca:	0a07a703          	lw	a4,160(a5)
    80206cce:	0017069b          	addiw	a3,a4,1
    80206cd2:	0006861b          	sext.w	a2,a3
    80206cd6:	0ad7a023          	sw	a3,160(a5)
    80206cda:	07f77713          	andi	a4,a4,127
    80206cde:	97ba                	add	a5,a5,a4
    80206ce0:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    80206ce4:	47a9                	li	a5,10
    80206ce6:	0cf48563          	beq	s1,a5,80206db0 <consoleintr+0x178>
    80206cea:	4791                	li	a5,4
    80206cec:	0cf48263          	beq	s1,a5,80206db0 <consoleintr+0x178>
    80206cf0:	0001c797          	auipc	a5,0x1c
    80206cf4:	fc87a783          	lw	a5,-56(a5) # 80222cb8 <cons+0x98>
    80206cf8:	0807879b          	addiw	a5,a5,128
    80206cfc:	f6f61ce3          	bne	a2,a5,80206c74 <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80206d00:	863e                	mv	a2,a5
    80206d02:	a07d                	j	80206db0 <consoleintr+0x178>
    while(cons.e != cons.w &&
    80206d04:	0001c717          	auipc	a4,0x1c
    80206d08:	f1c70713          	addi	a4,a4,-228 # 80222c20 <cons>
    80206d0c:	0a072783          	lw	a5,160(a4)
    80206d10:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80206d14:	0001c497          	auipc	s1,0x1c
    80206d18:	f0c48493          	addi	s1,s1,-244 # 80222c20 <cons>
    while(cons.e != cons.w &&
    80206d1c:	4929                	li	s2,10
    80206d1e:	f4f70be3          	beq	a4,a5,80206c74 <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80206d22:	37fd                	addiw	a5,a5,-1
    80206d24:	07f7f713          	andi	a4,a5,127
    80206d28:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    80206d2a:	01874703          	lbu	a4,24(a4)
    80206d2e:	f52703e3          	beq	a4,s2,80206c74 <consoleintr+0x3c>
      cons.e--;
    80206d32:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    80206d36:	10000513          	li	a0,256
    80206d3a:	00000097          	auipc	ra,0x0
    80206d3e:	ec0080e7          	jalr	-320(ra) # 80206bfa <consputc>
    while(cons.e != cons.w &&
    80206d42:	0a04a783          	lw	a5,160(s1)
    80206d46:	09c4a703          	lw	a4,156(s1)
    80206d4a:	fcf71ce3          	bne	a4,a5,80206d22 <consoleintr+0xea>
    80206d4e:	b71d                	j	80206c74 <consoleintr+0x3c>
    if(cons.e != cons.w){
    80206d50:	0001c717          	auipc	a4,0x1c
    80206d54:	ed070713          	addi	a4,a4,-304 # 80222c20 <cons>
    80206d58:	0a072783          	lw	a5,160(a4)
    80206d5c:	09c72703          	lw	a4,156(a4)
    80206d60:	f0f70ae3          	beq	a4,a5,80206c74 <consoleintr+0x3c>
      cons.e--;
    80206d64:	37fd                	addiw	a5,a5,-1
    80206d66:	0001c717          	auipc	a4,0x1c
    80206d6a:	f4f72d23          	sw	a5,-166(a4) # 80222cc0 <cons+0xa0>
      consputc(BACKSPACE);
    80206d6e:	10000513          	li	a0,256
    80206d72:	00000097          	auipc	ra,0x0
    80206d76:	e88080e7          	jalr	-376(ra) # 80206bfa <consputc>
    80206d7a:	bded                	j	80206c74 <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80206d7c:	ee048ce3          	beqz	s1,80206c74 <consoleintr+0x3c>
    80206d80:	bf21                	j	80206c98 <consoleintr+0x60>
      consputc(c);
    80206d82:	4529                	li	a0,10
    80206d84:	00000097          	auipc	ra,0x0
    80206d88:	e76080e7          	jalr	-394(ra) # 80206bfa <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80206d8c:	0001c797          	auipc	a5,0x1c
    80206d90:	e9478793          	addi	a5,a5,-364 # 80222c20 <cons>
    80206d94:	0a07a703          	lw	a4,160(a5)
    80206d98:	0017069b          	addiw	a3,a4,1
    80206d9c:	0006861b          	sext.w	a2,a3
    80206da0:	0ad7a023          	sw	a3,160(a5)
    80206da4:	07f77713          	andi	a4,a4,127
    80206da8:	97ba                	add	a5,a5,a4
    80206daa:	4729                	li	a4,10
    80206dac:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    80206db0:	0001c797          	auipc	a5,0x1c
    80206db4:	f0c7a623          	sw	a2,-244(a5) # 80222cbc <cons+0x9c>
        wakeup(&cons.r);
    80206db8:	0001c517          	auipc	a0,0x1c
    80206dbc:	f0050513          	addi	a0,a0,-256 # 80222cb8 <cons+0x98>
    80206dc0:	ffffb097          	auipc	ra,0xffffb
    80206dc4:	69c080e7          	jalr	1692(ra) # 8020245c <wakeup>
    80206dc8:	b575                	j	80206c74 <consoleintr+0x3c>

0000000080206dca <consoleinit>:

void
consoleinit(void)
{
    80206dca:	1101                	addi	sp,sp,-32
    80206dcc:	ec06                	sd	ra,24(sp)
    80206dce:	e822                	sd	s0,16(sp)
    80206dd0:	e426                	sd	s1,8(sp)
    80206dd2:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    80206dd4:	0001c497          	auipc	s1,0x1c
    80206dd8:	e4c48493          	addi	s1,s1,-436 # 80222c20 <cons>
    80206ddc:	00003597          	auipc	a1,0x3
    80206de0:	f5c58593          	addi	a1,a1,-164 # 80209d38 <digits+0x9b8>
    80206de4:	8526                	mv	a0,s1
    80206de6:	ffffa097          	auipc	ra,0xffffa
    80206dea:	89c080e7          	jalr	-1892(ra) # 80200682 <initlock>

  cons.e = cons.w = cons.r = 0;
    80206dee:	0804ac23          	sw	zero,152(s1)
    80206df2:	0804ae23          	sw	zero,156(s1)
    80206df6:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80206dfa:	00005797          	auipc	a5,0x5
    80206dfe:	c967b783          	ld	a5,-874(a5) # 8020ba90 <_GLOBAL_OFFSET_TABLE_+0x58>
    80206e02:	00000717          	auipc	a4,0x0
    80206e06:	ce070713          	addi	a4,a4,-800 # 80206ae2 <consoleread>
    80206e0a:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    80206e0c:	00000717          	auipc	a4,0x0
    80206e10:	c4870713          	addi	a4,a4,-952 # 80206a54 <consolewrite>
    80206e14:	ef98                	sd	a4,24(a5)
}
    80206e16:	60e2                	ld	ra,24(sp)
    80206e18:	6442                	ld	s0,16(sp)
    80206e1a:	64a2                	ld	s1,8(sp)
    80206e1c:	6105                	addi	sp,sp,32
    80206e1e:	8082                	ret

0000000080206e20 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    80206e20:	1141                	addi	sp,sp,-16
    80206e22:	e406                	sd	ra,8(sp)
    80206e24:	e022                	sd	s0,0(sp)
    80206e26:	0800                	addi	s0,sp,16
  if(i >= NUM)
    80206e28:	479d                	li	a5,7
    80206e2a:	04a7cb63          	blt	a5,a0,80206e80 <free_desc+0x60>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    80206e2e:	0001c717          	auipc	a4,0x1c
    80206e32:	1d270713          	addi	a4,a4,466 # 80223000 <disk>
    80206e36:	972a                	add	a4,a4,a0
    80206e38:	6789                	lui	a5,0x2
    80206e3a:	97ba                	add	a5,a5,a4
    80206e3c:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    80206e40:	eba1                	bnez	a5,80206e90 <free_desc+0x70>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    80206e42:	00451713          	slli	a4,a0,0x4
    80206e46:	0001e797          	auipc	a5,0x1e
    80206e4a:	1ba7b783          	ld	a5,442(a5) # 80225000 <disk+0x2000>
    80206e4e:	97ba                	add	a5,a5,a4
    80206e50:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    80206e54:	0001c717          	auipc	a4,0x1c
    80206e58:	1ac70713          	addi	a4,a4,428 # 80223000 <disk>
    80206e5c:	972a                	add	a4,a4,a0
    80206e5e:	6789                	lui	a5,0x2
    80206e60:	97ba                	add	a5,a5,a4
    80206e62:	4705                	li	a4,1
    80206e64:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    80206e68:	0001e517          	auipc	a0,0x1e
    80206e6c:	1b050513          	addi	a0,a0,432 # 80225018 <disk+0x2018>
    80206e70:	ffffb097          	auipc	ra,0xffffb
    80206e74:	5ec080e7          	jalr	1516(ra) # 8020245c <wakeup>
}
    80206e78:	60a2                	ld	ra,8(sp)
    80206e7a:	6402                	ld	s0,0(sp)
    80206e7c:	0141                	addi	sp,sp,16
    80206e7e:	8082                	ret
    panic("virtio_disk_intr 1");
    80206e80:	00003517          	auipc	a0,0x3
    80206e84:	ec050513          	addi	a0,a0,-320 # 80209d40 <digits+0x9c0>
    80206e88:	ffff9097          	auipc	ra,0xffff9
    80206e8c:	2bc080e7          	jalr	700(ra) # 80200144 <panic>
    panic("virtio_disk_intr 2");
    80206e90:	00003517          	auipc	a0,0x3
    80206e94:	ec850513          	addi	a0,a0,-312 # 80209d58 <digits+0x9d8>
    80206e98:	ffff9097          	auipc	ra,0xffff9
    80206e9c:	2ac080e7          	jalr	684(ra) # 80200144 <panic>

0000000080206ea0 <virtio_disk_init>:
{
    80206ea0:	1141                	addi	sp,sp,-16
    80206ea2:	e406                	sd	ra,8(sp)
    80206ea4:	e022                	sd	s0,0(sp)
    80206ea6:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    80206ea8:	00003597          	auipc	a1,0x3
    80206eac:	ec858593          	addi	a1,a1,-312 # 80209d70 <digits+0x9f0>
    80206eb0:	0001e517          	auipc	a0,0x1e
    80206eb4:	1f850513          	addi	a0,a0,504 # 802250a8 <disk+0x20a8>
    80206eb8:	ffff9097          	auipc	ra,0xffff9
    80206ebc:	7ca080e7          	jalr	1994(ra) # 80200682 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80206ec0:	03f107b7          	lui	a5,0x3f10
    80206ec4:	0785                	addi	a5,a5,1 # 3f10001 <_entry-0x7c2effff>
    80206ec6:	07b2                	slli	a5,a5,0xc
    80206ec8:	4398                	lw	a4,0(a5)
    80206eca:	2701                	sext.w	a4,a4
    80206ecc:	747277b7          	lui	a5,0x74727
    80206ed0:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    80206ed4:	12f71163          	bne	a4,a5,80206ff6 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80206ed8:	00003797          	auipc	a5,0x3
    80206edc:	f207b783          	ld	a5,-224(a5) # 80209df8 <digits+0xa78>
    80206ee0:	439c                	lw	a5,0(a5)
    80206ee2:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80206ee4:	4705                	li	a4,1
    80206ee6:	10e79863          	bne	a5,a4,80206ff6 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80206eea:	00003797          	auipc	a5,0x3
    80206eee:	f167b783          	ld	a5,-234(a5) # 80209e00 <digits+0xa80>
    80206ef2:	439c                	lw	a5,0(a5)
    80206ef4:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80206ef6:	4709                	li	a4,2
    80206ef8:	0ee79f63          	bne	a5,a4,80206ff6 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80206efc:	00003797          	auipc	a5,0x3
    80206f00:	f0c7b783          	ld	a5,-244(a5) # 80209e08 <digits+0xa88>
    80206f04:	4398                	lw	a4,0(a5)
    80206f06:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80206f08:	554d47b7          	lui	a5,0x554d4
    80206f0c:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    80206f10:	0ef71363          	bne	a4,a5,80206ff6 <virtio_disk_init+0x156>
  *R(VIRTIO_MMIO_STATUS) = status;
    80206f14:	00003797          	auipc	a5,0x3
    80206f18:	efc7b783          	ld	a5,-260(a5) # 80209e10 <digits+0xa90>
    80206f1c:	4705                	li	a4,1
    80206f1e:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80206f20:	470d                	li	a4,3
    80206f22:	c398                	sw	a4,0(a5)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80206f24:	00003717          	auipc	a4,0x3
    80206f28:	ef473703          	ld	a4,-268(a4) # 80209e18 <digits+0xa98>
    80206f2c:	4318                	lw	a4,0(a4)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80206f2e:	c7ffe6b7          	lui	a3,0xc7ffe
    80206f32:	75f68693          	addi	a3,a3,1887 # ffffffffc7ffe75f <ebss_clear+0xffffffff47dd875f>
    80206f36:	8f75                	and	a4,a4,a3
    80206f38:	00003697          	auipc	a3,0x3
    80206f3c:	ee86b683          	ld	a3,-280(a3) # 80209e20 <digits+0xaa0>
    80206f40:	c298                	sw	a4,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    80206f42:	472d                	li	a4,11
    80206f44:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80206f46:	473d                	li	a4,15
    80206f48:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80206f4a:	00003797          	auipc	a5,0x3
    80206f4e:	ede7b783          	ld	a5,-290(a5) # 80209e28 <digits+0xaa8>
    80206f52:	6705                	lui	a4,0x1
    80206f54:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80206f56:	00003797          	auipc	a5,0x3
    80206f5a:	eda7b783          	ld	a5,-294(a5) # 80209e30 <digits+0xab0>
    80206f5e:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80206f62:	00003797          	auipc	a5,0x3
    80206f66:	ed67b783          	ld	a5,-298(a5) # 80209e38 <digits+0xab8>
    80206f6a:	439c                	lw	a5,0(a5)
    80206f6c:	2781                	sext.w	a5,a5
  if(max == 0)
    80206f6e:	cfc1                	beqz	a5,80207006 <virtio_disk_init+0x166>
  if(max < NUM)
    80206f70:	471d                	li	a4,7
    80206f72:	0af77263          	bgeu	a4,a5,80207016 <virtio_disk_init+0x176>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80206f76:	00003797          	auipc	a5,0x3
    80206f7a:	eca7b783          	ld	a5,-310(a5) # 80209e40 <digits+0xac0>
    80206f7e:	4721                	li	a4,8
    80206f80:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80206f82:	6609                	lui	a2,0x2
    80206f84:	4581                	li	a1,0
    80206f86:	0001c517          	auipc	a0,0x1c
    80206f8a:	07a50513          	addi	a0,a0,122 # 80223000 <disk>
    80206f8e:	ffff9097          	auipc	ra,0xffff9
    80206f92:	7d4080e7          	jalr	2004(ra) # 80200762 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80206f96:	0001c717          	auipc	a4,0x1c
    80206f9a:	06a70713          	addi	a4,a4,106 # 80223000 <disk>
    80206f9e:	00c75793          	srli	a5,a4,0xc
    80206fa2:	2781                	sext.w	a5,a5
    80206fa4:	00003697          	auipc	a3,0x3
    80206fa8:	ea46b683          	ld	a3,-348(a3) # 80209e48 <digits+0xac8>
    80206fac:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    80206fae:	0001e797          	auipc	a5,0x1e
    80206fb2:	05278793          	addi	a5,a5,82 # 80225000 <disk+0x2000>
    80206fb6:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    80206fb8:	0001c717          	auipc	a4,0x1c
    80206fbc:	0c870713          	addi	a4,a4,200 # 80223080 <disk+0x80>
    80206fc0:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    80206fc2:	0001d717          	auipc	a4,0x1d
    80206fc6:	03e70713          	addi	a4,a4,62 # 80224000 <disk+0x1000>
    80206fca:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    80206fcc:	4705                	li	a4,1
    80206fce:	00e78c23          	sb	a4,24(a5)
    80206fd2:	00e78ca3          	sb	a4,25(a5)
    80206fd6:	00e78d23          	sb	a4,26(a5)
    80206fda:	00e78da3          	sb	a4,27(a5)
    80206fde:	00e78e23          	sb	a4,28(a5)
    80206fe2:	00e78ea3          	sb	a4,29(a5)
    80206fe6:	00e78f23          	sb	a4,30(a5)
    80206fea:	00e78fa3          	sb	a4,31(a5)
}
    80206fee:	60a2                	ld	ra,8(sp)
    80206ff0:	6402                	ld	s0,0(sp)
    80206ff2:	0141                	addi	sp,sp,16
    80206ff4:	8082                	ret
    panic("could not find virtio disk");
    80206ff6:	00003517          	auipc	a0,0x3
    80206ffa:	d8a50513          	addi	a0,a0,-630 # 80209d80 <digits+0xa00>
    80206ffe:	ffff9097          	auipc	ra,0xffff9
    80207002:	146080e7          	jalr	326(ra) # 80200144 <panic>
    panic("virtio disk has no queue 0");
    80207006:	00003517          	auipc	a0,0x3
    8020700a:	d9a50513          	addi	a0,a0,-614 # 80209da0 <digits+0xa20>
    8020700e:	ffff9097          	auipc	ra,0xffff9
    80207012:	136080e7          	jalr	310(ra) # 80200144 <panic>
    panic("virtio disk max queue too short");
    80207016:	00003517          	auipc	a0,0x3
    8020701a:	daa50513          	addi	a0,a0,-598 # 80209dc0 <digits+0xa40>
    8020701e:	ffff9097          	auipc	ra,0xffff9
    80207022:	126080e7          	jalr	294(ra) # 80200144 <panic>

0000000080207026 <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    80207026:	7175                	addi	sp,sp,-144
    80207028:	e506                	sd	ra,136(sp)
    8020702a:	e122                	sd	s0,128(sp)
    8020702c:	fca6                	sd	s1,120(sp)
    8020702e:	f8ca                	sd	s2,112(sp)
    80207030:	f4ce                	sd	s3,104(sp)
    80207032:	f0d2                	sd	s4,96(sp)
    80207034:	ecd6                	sd	s5,88(sp)
    80207036:	e8da                	sd	s6,80(sp)
    80207038:	e4de                	sd	s7,72(sp)
    8020703a:	e0e2                	sd	s8,64(sp)
    8020703c:	fc66                	sd	s9,56(sp)
    8020703e:	f86a                	sd	s10,48(sp)
    80207040:	f46e                	sd	s11,40(sp)
    80207042:	0900                	addi	s0,sp,144
    80207044:	8aaa                	mv	s5,a0
    80207046:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    80207048:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    8020704c:	0001e517          	auipc	a0,0x1e
    80207050:	05c50513          	addi	a0,a0,92 # 802250a8 <disk+0x20a8>
    80207054:	ffff9097          	auipc	ra,0xffff9
    80207058:	672080e7          	jalr	1650(ra) # 802006c6 <acquire>
  for(int i = 0; i < 3; i++){
    8020705c:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    8020705e:	44a1                	li	s1,8
      disk.free[i] = 0;
    80207060:	0001cc17          	auipc	s8,0x1c
    80207064:	fa0c0c13          	addi	s8,s8,-96 # 80223000 <disk>
    80207068:	6b89                	lui	s7,0x2
  for(int i = 0; i < 3; i++){
    8020706a:	4b0d                	li	s6,3
    8020706c:	a0ad                	j	802070d6 <virtio_disk_rw+0xb0>
      disk.free[i] = 0;
    8020706e:	00fc0733          	add	a4,s8,a5
    80207072:	975e                	add	a4,a4,s7
    80207074:	00070c23          	sb	zero,24(a4)
    idx[i] = alloc_desc();
    80207078:	c19c                	sw	a5,0(a1)
    if(idx[i] < 0){
    8020707a:	0207c563          	bltz	a5,802070a4 <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    8020707e:	2905                	addiw	s2,s2,1
    80207080:	0611                	addi	a2,a2,4 # 2004 <_entry-0x801fdffc>
    80207082:	19690e63          	beq	s2,s6,8020721e <virtio_disk_rw+0x1f8>
    idx[i] = alloc_desc();
    80207086:	85b2                	mv	a1,a2
  for(int i = 0; i < NUM; i++){
    80207088:	0001e717          	auipc	a4,0x1e
    8020708c:	f9070713          	addi	a4,a4,-112 # 80225018 <disk+0x2018>
    80207090:	87ce                	mv	a5,s3
    if(disk.free[i]){
    80207092:	00074683          	lbu	a3,0(a4)
    80207096:	fee1                	bnez	a3,8020706e <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    80207098:	2785                	addiw	a5,a5,1
    8020709a:	0705                	addi	a4,a4,1
    8020709c:	fe979be3          	bne	a5,s1,80207092 <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    802070a0:	57fd                	li	a5,-1
    802070a2:	c19c                	sw	a5,0(a1)
      for(int j = 0; j < i; j++)
    802070a4:	01205d63          	blez	s2,802070be <virtio_disk_rw+0x98>
    802070a8:	8dce                	mv	s11,s3
        free_desc(idx[j]);
    802070aa:	000a2503          	lw	a0,0(s4)
    802070ae:	00000097          	auipc	ra,0x0
    802070b2:	d72080e7          	jalr	-654(ra) # 80206e20 <free_desc>
      for(int j = 0; j < i; j++)
    802070b6:	2d85                	addiw	s11,s11,1
    802070b8:	0a11                	addi	s4,s4,4
    802070ba:	ff2d98e3          	bne	s11,s2,802070aa <virtio_disk_rw+0x84>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    802070be:	0001e597          	auipc	a1,0x1e
    802070c2:	fea58593          	addi	a1,a1,-22 # 802250a8 <disk+0x20a8>
    802070c6:	0001e517          	auipc	a0,0x1e
    802070ca:	f5250513          	addi	a0,a0,-174 # 80225018 <disk+0x2018>
    802070ce:	ffffb097          	auipc	ra,0xffffb
    802070d2:	212080e7          	jalr	530(ra) # 802022e0 <sleep>
  for(int i = 0; i < 3; i++){
    802070d6:	f8040a13          	addi	s4,s0,-128
{
    802070da:	8652                	mv	a2,s4
  for(int i = 0; i < 3; i++){
    802070dc:	894e                	mv	s2,s3
    802070de:	b765                	j	80207086 <virtio_disk_rw+0x60>
  disk.desc[idx[0]].next = idx[1];

  disk.desc[idx[1]].addr = (uint64) b->data;
  disk.desc[idx[1]].len = BSIZE;
  if(write)
    disk.desc[idx[1]].flags = 0; // device reads b->data
    802070e0:	0001e717          	auipc	a4,0x1e
    802070e4:	f2073703          	ld	a4,-224(a4) # 80225000 <disk+0x2000>
    802070e8:	973e                	add	a4,a4,a5
    802070ea:	00071623          	sh	zero,12(a4)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    802070ee:	0001c517          	auipc	a0,0x1c
    802070f2:	f1250513          	addi	a0,a0,-238 # 80223000 <disk>
    802070f6:	0001e717          	auipc	a4,0x1e
    802070fa:	f0a70713          	addi	a4,a4,-246 # 80225000 <disk+0x2000>
    802070fe:	6314                	ld	a3,0(a4)
    80207100:	96be                	add	a3,a3,a5
    80207102:	00c6d603          	lhu	a2,12(a3)
    80207106:	00166613          	ori	a2,a2,1
    8020710a:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    8020710e:	f8842683          	lw	a3,-120(s0)
    80207112:	6310                	ld	a2,0(a4)
    80207114:	97b2                	add	a5,a5,a2
    80207116:	00d79723          	sh	a3,14(a5)

  disk.info[idx[0]].status = 0;
    8020711a:	20048613          	addi	a2,s1,512
    8020711e:	0612                	slli	a2,a2,0x4
    80207120:	962a                	add	a2,a2,a0
    80207122:	02060823          	sb	zero,48(a2)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80207126:	00469793          	slli	a5,a3,0x4
    8020712a:	630c                	ld	a1,0(a4)
    8020712c:	95be                	add	a1,a1,a5
    8020712e:	6689                	lui	a3,0x2
    80207130:	03068693          	addi	a3,a3,48 # 2030 <_entry-0x801fdfd0>
    80207134:	96ca                	add	a3,a3,s2
    80207136:	96aa                	add	a3,a3,a0
    80207138:	e194                	sd	a3,0(a1)
  disk.desc[idx[2]].len = 1;
    8020713a:	6314                	ld	a3,0(a4)
    8020713c:	96be                	add	a3,a3,a5
    8020713e:	4585                	li	a1,1
    80207140:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80207142:	6314                	ld	a3,0(a4)
    80207144:	96be                	add	a3,a3,a5
    80207146:	4509                	li	a0,2
    80207148:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    8020714c:	6314                	ld	a3,0(a4)
    8020714e:	97b6                	add	a5,a5,a3
    80207150:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80207154:	00baa223          	sw	a1,4(s5)
  disk.info[idx[0]].b = b;
    80207158:	03563423          	sd	s5,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    8020715c:	6714                	ld	a3,8(a4)
    8020715e:	0026d783          	lhu	a5,2(a3)
    80207162:	8b9d                	andi	a5,a5,7
    80207164:	0789                	addi	a5,a5,2
    80207166:	0786                	slli	a5,a5,0x1
    80207168:	96be                	add	a3,a3,a5
    8020716a:	00969023          	sh	s1,0(a3)
  __sync_synchronize();
    8020716e:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    80207172:	6718                	ld	a4,8(a4)
    80207174:	00275783          	lhu	a5,2(a4)
    80207178:	2785                	addiw	a5,a5,1
    8020717a:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    8020717e:	00003797          	auipc	a5,0x3
    80207182:	cd27b783          	ld	a5,-814(a5) # 80209e50 <digits+0xad0>
    80207186:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    8020718a:	004aa783          	lw	a5,4(s5)
    8020718e:	02b79163          	bne	a5,a1,802071b0 <virtio_disk_rw+0x18a>
    sleep(b, &disk.vdisk_lock);
    80207192:	0001e917          	auipc	s2,0x1e
    80207196:	f1690913          	addi	s2,s2,-234 # 802250a8 <disk+0x20a8>
  while(b->disk == 1) {
    8020719a:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    8020719c:	85ca                	mv	a1,s2
    8020719e:	8556                	mv	a0,s5
    802071a0:	ffffb097          	auipc	ra,0xffffb
    802071a4:	140080e7          	jalr	320(ra) # 802022e0 <sleep>
  while(b->disk == 1) {
    802071a8:	004aa783          	lw	a5,4(s5)
    802071ac:	fe9788e3          	beq	a5,s1,8020719c <virtio_disk_rw+0x176>
  }

  disk.info[idx[0]].b = 0;
    802071b0:	f8042483          	lw	s1,-128(s0)
    802071b4:	20048713          	addi	a4,s1,512
    802071b8:	0712                	slli	a4,a4,0x4
    802071ba:	0001c797          	auipc	a5,0x1c
    802071be:	e4678793          	addi	a5,a5,-442 # 80223000 <disk>
    802071c2:	97ba                	add	a5,a5,a4
    802071c4:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    802071c8:	0001e917          	auipc	s2,0x1e
    802071cc:	e3890913          	addi	s2,s2,-456 # 80225000 <disk+0x2000>
    802071d0:	a019                	j	802071d6 <virtio_disk_rw+0x1b0>
      i = disk.desc[i].next;
    802071d2:	00e7d483          	lhu	s1,14(a5)
    free_desc(i);
    802071d6:	8526                	mv	a0,s1
    802071d8:	00000097          	auipc	ra,0x0
    802071dc:	c48080e7          	jalr	-952(ra) # 80206e20 <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    802071e0:	0492                	slli	s1,s1,0x4
    802071e2:	00093783          	ld	a5,0(s2)
    802071e6:	97a6                	add	a5,a5,s1
    802071e8:	00c7d703          	lhu	a4,12(a5)
    802071ec:	8b05                	andi	a4,a4,1
    802071ee:	f375                	bnez	a4,802071d2 <virtio_disk_rw+0x1ac>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    802071f0:	0001e517          	auipc	a0,0x1e
    802071f4:	eb850513          	addi	a0,a0,-328 # 802250a8 <disk+0x20a8>
    802071f8:	ffff9097          	auipc	ra,0xffff9
    802071fc:	522080e7          	jalr	1314(ra) # 8020071a <release>
}
    80207200:	60aa                	ld	ra,136(sp)
    80207202:	640a                	ld	s0,128(sp)
    80207204:	74e6                	ld	s1,120(sp)
    80207206:	7946                	ld	s2,112(sp)
    80207208:	79a6                	ld	s3,104(sp)
    8020720a:	7a06                	ld	s4,96(sp)
    8020720c:	6ae6                	ld	s5,88(sp)
    8020720e:	6b46                	ld	s6,80(sp)
    80207210:	6ba6                	ld	s7,72(sp)
    80207212:	6c06                	ld	s8,64(sp)
    80207214:	7ce2                	ld	s9,56(sp)
    80207216:	7d42                	ld	s10,48(sp)
    80207218:	7da2                	ld	s11,40(sp)
    8020721a:	6149                	addi	sp,sp,144
    8020721c:	8082                	ret
  if(write)
    8020721e:	019037b3          	snez	a5,s9
    80207222:	f6f42823          	sw	a5,-144(s0)
  buf0.reserved = 0;
    80207226:	f6042a23          	sw	zero,-140(s0)
  buf0.sector = sector;
    8020722a:	f7a43c23          	sd	s10,-136(s0)
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    8020722e:	ffffb097          	auipc	ra,0xffffb
    80207232:	80e080e7          	jalr	-2034(ra) # 80201a3c <myproc>
    80207236:	f8042483          	lw	s1,-128(s0)
    8020723a:	00449913          	slli	s2,s1,0x4
    8020723e:	0001e997          	auipc	s3,0x1e
    80207242:	dc298993          	addi	s3,s3,-574 # 80225000 <disk+0x2000>
    80207246:	0009ba03          	ld	s4,0(s3)
    8020724a:	9a4a                	add	s4,s4,s2
    8020724c:	f7040593          	addi	a1,s0,-144
    80207250:	6d28                	ld	a0,88(a0)
    80207252:	ffffa097          	auipc	ra,0xffffa
    80207256:	99e080e7          	jalr	-1634(ra) # 80200bf0 <kwalkaddr>
    8020725a:	00aa3023          	sd	a0,0(s4)
  disk.desc[idx[0]].len = sizeof(buf0);
    8020725e:	0009b783          	ld	a5,0(s3)
    80207262:	97ca                	add	a5,a5,s2
    80207264:	4741                	li	a4,16
    80207266:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80207268:	0009b783          	ld	a5,0(s3)
    8020726c:	97ca                	add	a5,a5,s2
    8020726e:	4705                	li	a4,1
    80207270:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80207274:	f8442783          	lw	a5,-124(s0)
    80207278:	0009b703          	ld	a4,0(s3)
    8020727c:	974a                	add	a4,a4,s2
    8020727e:	00f71723          	sh	a5,14(a4)
  disk.desc[idx[1]].addr = (uint64) b->data;
    80207282:	0792                	slli	a5,a5,0x4
    80207284:	0009b703          	ld	a4,0(s3)
    80207288:	973e                	add	a4,a4,a5
    8020728a:	058a8693          	addi	a3,s5,88
    8020728e:	e314                	sd	a3,0(a4)
  disk.desc[idx[1]].len = BSIZE;
    80207290:	0009b703          	ld	a4,0(s3)
    80207294:	973e                	add	a4,a4,a5
    80207296:	20000693          	li	a3,512
    8020729a:	c714                	sw	a3,8(a4)
  if(write)
    8020729c:	e40c92e3          	bnez	s9,802070e0 <virtio_disk_rw+0xba>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    802072a0:	0001e717          	auipc	a4,0x1e
    802072a4:	d6073703          	ld	a4,-672(a4) # 80225000 <disk+0x2000>
    802072a8:	973e                	add	a4,a4,a5
    802072aa:	4689                	li	a3,2
    802072ac:	00d71623          	sh	a3,12(a4)
    802072b0:	bd3d                	j	802070ee <virtio_disk_rw+0xc8>

00000000802072b2 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    802072b2:	1101                	addi	sp,sp,-32
    802072b4:	ec06                	sd	ra,24(sp)
    802072b6:	e822                	sd	s0,16(sp)
    802072b8:	e426                	sd	s1,8(sp)
    802072ba:	e04a                	sd	s2,0(sp)
    802072bc:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    802072be:	0001e517          	auipc	a0,0x1e
    802072c2:	dea50513          	addi	a0,a0,-534 # 802250a8 <disk+0x20a8>
    802072c6:	ffff9097          	auipc	ra,0xffff9
    802072ca:	400080e7          	jalr	1024(ra) # 802006c6 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    802072ce:	0001e717          	auipc	a4,0x1e
    802072d2:	d3270713          	addi	a4,a4,-718 # 80225000 <disk+0x2000>
    802072d6:	02075783          	lhu	a5,32(a4)
    802072da:	6b18                	ld	a4,16(a4)
    802072dc:	00275683          	lhu	a3,2(a4)
    802072e0:	8ebd                	xor	a3,a3,a5
    802072e2:	8a9d                	andi	a3,a3,7
    802072e4:	cab9                	beqz	a3,8020733a <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    802072e6:	0001c917          	auipc	s2,0x1c
    802072ea:	d1a90913          	addi	s2,s2,-742 # 80223000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    802072ee:	0001e497          	auipc	s1,0x1e
    802072f2:	d1248493          	addi	s1,s1,-750 # 80225000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    802072f6:	078e                	slli	a5,a5,0x3
    802072f8:	973e                	add	a4,a4,a5
    802072fa:	435c                	lw	a5,4(a4)
    if(disk.info[id].status != 0)
    802072fc:	20078713          	addi	a4,a5,512
    80207300:	0712                	slli	a4,a4,0x4
    80207302:	974a                	add	a4,a4,s2
    80207304:	03074703          	lbu	a4,48(a4)
    80207308:	e335                	bnez	a4,8020736c <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    8020730a:	20078793          	addi	a5,a5,512
    8020730e:	0792                	slli	a5,a5,0x4
    80207310:	97ca                	add	a5,a5,s2
    80207312:	7798                	ld	a4,40(a5)
    80207314:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    80207318:	7788                	ld	a0,40(a5)
    8020731a:	ffffb097          	auipc	ra,0xffffb
    8020731e:	142080e7          	jalr	322(ra) # 8020245c <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207322:	0204d783          	lhu	a5,32(s1)
    80207326:	2785                	addiw	a5,a5,1
    80207328:	8b9d                	andi	a5,a5,7
    8020732a:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    8020732e:	6898                	ld	a4,16(s1)
    80207330:	00275683          	lhu	a3,2(a4)
    80207334:	8a9d                	andi	a3,a3,7
    80207336:	fcf690e3          	bne	a3,a5,802072f6 <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8020733a:	00003797          	auipc	a5,0x3
    8020733e:	b1e7b783          	ld	a5,-1250(a5) # 80209e58 <digits+0xad8>
    80207342:	439c                	lw	a5,0(a5)
    80207344:	8b8d                	andi	a5,a5,3
    80207346:	00003717          	auipc	a4,0x3
    8020734a:	b1a73703          	ld	a4,-1254(a4) # 80209e60 <digits+0xae0>
    8020734e:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    80207350:	0001e517          	auipc	a0,0x1e
    80207354:	d5850513          	addi	a0,a0,-680 # 802250a8 <disk+0x20a8>
    80207358:	ffff9097          	auipc	ra,0xffff9
    8020735c:	3c2080e7          	jalr	962(ra) # 8020071a <release>
}
    80207360:	60e2                	ld	ra,24(sp)
    80207362:	6442                	ld	s0,16(sp)
    80207364:	64a2                	ld	s1,8(sp)
    80207366:	6902                	ld	s2,0(sp)
    80207368:	6105                	addi	sp,sp,32
    8020736a:	8082                	ret
      panic("virtio_disk_intr status");
    8020736c:	00003517          	auipc	a0,0x3
    80207370:	a7450513          	addi	a0,a0,-1420 # 80209de0 <digits+0xa60>
    80207374:	ffff9097          	auipc	ra,0xffff9
    80207378:	dd0080e7          	jalr	-560(ra) # 80200144 <panic>
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
