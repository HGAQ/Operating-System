
target/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0000e117          	auipc	sp,0xe
    8020000a:	d0213103          	ld	sp,-766(sp) # 8020dd08 <_GLOBAL_OFFSET_TABLE_+0x50>
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
    80200036:	0000a617          	auipc	a2,0xa
    8020003a:	34a60613          	addi	a2,a2,842 # 8020a380 <digits>
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
    80200096:	00008097          	auipc	ra,0x8
    8020009a:	fc8080e7          	jalr	-56(ra) # 8020805e <consputc>
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
    802000cc:	00008097          	auipc	ra,0x8
    802000d0:	f92080e7          	jalr	-110(ra) # 8020805e <consputc>
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
    80200102:	0000a517          	auipc	a0,0xa
    80200106:	efe50513          	addi	a0,a0,-258 # 8020a000 <etext>
    8020010a:	00000097          	auipc	ra,0x0
    8020010e:	084080e7          	jalr	132(ra) # 8020018e <printf>
  while (fp < bottom) {
    80200112:	0324f263          	bgeu	s1,s2,80200136 <backtrace+0x52>
    uint64 ra = *(fp - 1);
    printf("%p\n", ra - 4);
    80200116:	0000a997          	auipc	s3,0xa
    8020011a:	4d298993          	addi	s3,s3,1234 # 8020a5e8 <digits+0x268>
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
    80200150:	0000a517          	auipc	a0,0xa
    80200154:	ec050513          	addi	a0,a0,-320 # 8020a010 <etext+0x10>
    80200158:	00000097          	auipc	ra,0x0
    8020015c:	036080e7          	jalr	54(ra) # 8020018e <printf>
  printf(s);
    80200160:	8526                	mv	a0,s1
    80200162:	00000097          	auipc	ra,0x0
    80200166:	02c080e7          	jalr	44(ra) # 8020018e <printf>
  printf("\n");
    8020016a:	0000a517          	auipc	a0,0xa
    8020016e:	f6e50513          	addi	a0,a0,-146 # 8020a0d8 <etext+0xd8>
    80200172:	00000097          	auipc	ra,0x0
    80200176:	01c080e7          	jalr	28(ra) # 8020018e <printf>
  backtrace();
    8020017a:	00000097          	auipc	ra,0x0
    8020017e:	f6a080e7          	jalr	-150(ra) # 802000e4 <backtrace>
  panicked = 1; // freeze uart output from other CPUs
    80200182:	4785                	li	a5,1
    80200184:	00016717          	auipc	a4,0x16
    80200188:	e6f72e23          	sw	a5,-388(a4) # 80216000 <panicked>
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
    802001c0:	00016d97          	auipc	s11,0x16
    802001c4:	e60dad83          	lw	s11,-416(s11) # 80216020 <pr+0x18>
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
    802001ec:	0000ab17          	auipc	s6,0xa
    802001f0:	194b0b13          	addi	s6,s6,404 # 8020a380 <digits>
    switch(c){
    802001f4:	07300c93          	li	s9,115
    802001f8:	06400c13          	li	s8,100
    802001fc:	a82d                	j	80200236 <printf+0xa8>
    acquire(&pr.lock);
    802001fe:	00016517          	auipc	a0,0x16
    80200202:	e0a50513          	addi	a0,a0,-502 # 80216008 <pr>
    80200206:	00000097          	auipc	ra,0x0
    8020020a:	4c0080e7          	jalr	1216(ra) # 802006c6 <acquire>
    8020020e:	bf7d                	j	802001cc <printf+0x3e>
    panic("null fmt");
    80200210:	0000a517          	auipc	a0,0xa
    80200214:	e1050513          	addi	a0,a0,-496 # 8020a020 <etext+0x20>
    80200218:	00000097          	auipc	ra,0x0
    8020021c:	f2c080e7          	jalr	-212(ra) # 80200144 <panic>
      consputc(c);
    80200220:	00008097          	auipc	ra,0x8
    80200224:	e3e080e7          	jalr	-450(ra) # 8020805e <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80200228:	2985                	addiw	s3,s3,1
    8020022a:	013a07b3          	add	a5,s4,s3
    8020022e:	0007c503          	lbu	a0,0(a5) # fffffffffffff000 <ebss_clear+0xffffffff7fdd2000>
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
    802002b2:	00008097          	auipc	ra,0x8
    802002b6:	dac080e7          	jalr	-596(ra) # 8020805e <consputc>
  consputc('x');
    802002ba:	07800513          	li	a0,120
    802002be:	00008097          	auipc	ra,0x8
    802002c2:	da0080e7          	jalr	-608(ra) # 8020805e <consputc>
    802002c6:	84ea                	mv	s1,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c8:	03c95793          	srli	a5,s2,0x3c
    802002cc:	97da                	add	a5,a5,s6
    802002ce:	0007c503          	lbu	a0,0(a5)
    802002d2:	00008097          	auipc	ra,0x8
    802002d6:	d8c080e7          	jalr	-628(ra) # 8020805e <consputc>
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
    802002f8:	00008097          	auipc	ra,0x8
    802002fc:	d66080e7          	jalr	-666(ra) # 8020805e <consputc>
      for(; *s; s++)
    80200300:	0485                	addi	s1,s1,1
    80200302:	0004c503          	lbu	a0,0(s1)
    80200306:	f96d                	bnez	a0,802002f8 <printf+0x16a>
    80200308:	b705                	j	80200228 <printf+0x9a>
        s = "(null)";
    8020030a:	0000a497          	auipc	s1,0xa
    8020030e:	d0e48493          	addi	s1,s1,-754 # 8020a018 <etext+0x18>
      for(; *s; s++)
    80200312:	02800513          	li	a0,40
    80200316:	b7cd                	j	802002f8 <printf+0x16a>
      consputc('%');
    80200318:	8556                	mv	a0,s5
    8020031a:	00008097          	auipc	ra,0x8
    8020031e:	d44080e7          	jalr	-700(ra) # 8020805e <consputc>
      break;
    80200322:	b719                	j	80200228 <printf+0x9a>
      consputc('%');
    80200324:	8556                	mv	a0,s5
    80200326:	00008097          	auipc	ra,0x8
    8020032a:	d38080e7          	jalr	-712(ra) # 8020805e <consputc>
      consputc(c);
    8020032e:	8526                	mv	a0,s1
    80200330:	00008097          	auipc	ra,0x8
    80200334:	d2e080e7          	jalr	-722(ra) # 8020805e <consputc>
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
    8020035c:	00016517          	auipc	a0,0x16
    80200360:	cac50513          	addi	a0,a0,-852 # 80216008 <pr>
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
    80200376:	0000a597          	auipc	a1,0xa
    8020037a:	cba58593          	addi	a1,a1,-838 # 8020a030 <etext+0x30>
    8020037e:	00016517          	auipc	a0,0x16
    80200382:	c8a50513          	addi	a0,a0,-886 # 80216008 <pr>
    80200386:	00000097          	auipc	ra,0x0
    8020038a:	2fc080e7          	jalr	764(ra) # 80200682 <initlock>
  pr.locking = 1;   // changed, used to be 1
    8020038e:	4785                	li	a5,1
    80200390:	00016717          	auipc	a4,0x16
    80200394:	c8f72823          	sw	a5,-880(a4) # 80216020 <pr+0x18>
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
    802003a8:	0000a517          	auipc	a0,0xa
    802003ac:	c9050513          	addi	a0,a0,-880 # 8020a038 <etext+0x38>
    802003b0:	00000097          	auipc	ra,0x0
    802003b4:	dde080e7          	jalr	-546(ra) # 8020018e <printf>
    printf(" ( OO ).        _(OO  )_                        .(  OO)    _(  OO)  ( '.( OO )_ \n");
    802003b8:	0000a517          	auipc	a0,0xa
    802003bc:	cd050513          	addi	a0,a0,-816 # 8020a088 <etext+0x88>
    802003c0:	00000097          	auipc	ra,0x0
    802003c4:	dce080e7          	jalr	-562(ra) # 8020018e <printf>
    printf("(_/.  \\_)-. ,--(_/   ,. \\  ,--.                (_)---\\_)  (,------.  ,--.   ,--.) ,--. ,--.  \n");
    802003c8:	0000a517          	auipc	a0,0xa
    802003cc:	d1850513          	addi	a0,a0,-744 # 8020a0e0 <etext+0xe0>
    802003d0:	00000097          	auipc	ra,0x0
    802003d4:	dbe080e7          	jalr	-578(ra) # 8020018e <printf>
    printf(" \\  `.'  /  \\   \\   /(__/ /  .'       .-')     '  .-.  '   |  .---'  |   `.'   |  |  | |  |   \n");
    802003d8:	0000a517          	auipc	a0,0xa
    802003dc:	d6850513          	addi	a0,a0,-664 # 8020a140 <etext+0x140>
    802003e0:	00000097          	auipc	ra,0x0
    802003e4:	dae080e7          	jalr	-594(ra) # 8020018e <printf>
    printf("  \\     /\\   \\   \\ /   / .  / -.    _(  OO)   ,|  | |  |   |  |      |         |  |  | | .-')\n");
    802003e8:	0000a517          	auipc	a0,0xa
    802003ec:	db850513          	addi	a0,a0,-584 # 8020a1a0 <etext+0x1a0>
    802003f0:	00000097          	auipc	ra,0x0
    802003f4:	d9e080e7          	jalr	-610(ra) # 8020018e <printf>
    printf("   \\   \\ |    \\   '   /, | .-.  '  (,------. (_|  | |  |  (|  '--.   |  |'.'|  |  |  |_|( OO )\n");
    802003f8:	0000a517          	auipc	a0,0xa
    802003fc:	e0850513          	addi	a0,a0,-504 # 8020a200 <etext+0x200>
    80200400:	00000097          	auipc	ra,0x0
    80200404:	d8e080e7          	jalr	-626(ra) # 8020018e <printf>
    printf("  .'    \\_)    \\     /__)' \\  |  |  '------'   |  | |  |   |  .--'   |  |   |  |  |  | | `-' /\n");
    80200408:	0000a517          	auipc	a0,0xa
    8020040c:	e5850513          	addi	a0,a0,-424 # 8020a260 <etext+0x260>
    80200410:	00000097          	auipc	ra,0x0
    80200414:	d7e080e7          	jalr	-642(ra) # 8020018e <printf>
    printf(" /  .'.  \\      \\   /    \\  `'  /              '  '-'  '-. |  `---.  |  |   |  | ('  '-'(_.-'\n");
    80200418:	0000a517          	auipc	a0,0xa
    8020041c:	ea850513          	addi	a0,a0,-344 # 8020a2c0 <etext+0x2c0>
    80200420:	00000097          	auipc	ra,0x0
    80200424:	d6e080e7          	jalr	-658(ra) # 8020018e <printf>
    printf("'--'   '--'      `-'      `----'                `-----'--' `------'  `--'   `--'   `-----'\n");
    80200428:	0000a517          	auipc	a0,0xa
    8020042c:	ef850513          	addi	a0,a0,-264 # 8020a320 <etext+0x320>
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
    80200454:	0000e797          	auipc	a5,0xe
    80200458:	88c7b783          	ld	a5,-1908(a5) # 8020dce0 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80200476:	00016917          	auipc	s2,0x16
    8020047a:	bb290913          	addi	s2,s2,-1102 # 80216028 <kmem>
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
    802004b2:	0000a517          	auipc	a0,0xa
    802004b6:	ee650513          	addi	a0,a0,-282 # 8020a398 <digits+0x18>
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
    80200518:	00016497          	auipc	s1,0x16
    8020051c:	b1048493          	addi	s1,s1,-1264 # 80216028 <kmem>
    80200520:	0000a597          	auipc	a1,0xa
    80200524:	e8058593          	addi	a1,a1,-384 # 8020a3a0 <digits+0x20>
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
    80200540:	0000d517          	auipc	a0,0xd
    80200544:	7a053503          	ld	a0,1952(a0) # 8020dce0 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80200564:	00016497          	auipc	s1,0x16
    80200568:	ac448493          	addi	s1,s1,-1340 # 80216028 <kmem>
    8020056c:	8526                	mv	a0,s1
    8020056e:	00000097          	auipc	ra,0x0
    80200572:	158080e7          	jalr	344(ra) # 802006c6 <acquire>
  r = kmem.freelist;
    80200576:	6c84                	ld	s1,24(s1)
  if(r) {
    80200578:	c89d                	beqz	s1,802005ae <kalloc+0x54>
    kmem.freelist = r->next;
    8020057a:	609c                	ld	a5,0(s1)
    8020057c:	00016517          	auipc	a0,0x16
    80200580:	aac50513          	addi	a0,a0,-1364 # 80216028 <kmem>
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
    802005ae:	00016517          	auipc	a0,0x16
    802005b2:	a7a50513          	addi	a0,a0,-1414 # 80216028 <kmem>
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
    802005c6:	00016517          	auipc	a0,0x16
    802005ca:	a8253503          	ld	a0,-1406(a0) # 80216048 <kmem+0x20>
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
    802005f2:	4ac080e7          	jalr	1196(ra) # 80201a9a <mycpu>
    802005f6:	5d3c                	lw	a5,120(a0)
    802005f8:	cf89                	beqz	a5,80200612 <push_off+0x3c>
    mycpu()->intena = old;
  mycpu()->noff += 1;
    802005fa:	00001097          	auipc	ra,0x1
    802005fe:	4a0080e7          	jalr	1184(ra) # 80201a9a <mycpu>
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
    80200616:	488080e7          	jalr	1160(ra) # 80201a9a <mycpu>
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
    8020062e:	470080e7          	jalr	1136(ra) # 80201a9a <mycpu>
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
    80200662:	0000a517          	auipc	a0,0xa
    80200666:	d4650513          	addi	a0,a0,-698 # 8020a3a8 <digits+0x28>
    8020066a:	00000097          	auipc	ra,0x0
    8020066e:	ada080e7          	jalr	-1318(ra) # 80200144 <panic>
    panic("pop_off");
    80200672:	0000a517          	auipc	a0,0xa
    80200676:	d4e50513          	addi	a0,a0,-690 # 8020a3c0 <digits+0x40>
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
    802006b0:	3ee080e7          	jalr	1006(ra) # 80201a9a <mycpu>
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
    802006fa:	3a4080e7          	jalr	932(ra) # 80201a9a <mycpu>
    802006fe:	e888                	sd	a0,16(s1)
}
    80200700:	60e2                	ld	ra,24(sp)
    80200702:	6442                	ld	s0,16(sp)
    80200704:	64a2                	ld	s1,8(sp)
    80200706:	6105                	addi	sp,sp,32
    80200708:	8082                	ret
    panic("acquire");
    8020070a:	0000a517          	auipc	a0,0xa
    8020070e:	cbe50513          	addi	a0,a0,-834 # 8020a3c8 <digits+0x48>
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
    80200752:	0000a517          	auipc	a0,0xa
    80200756:	c7e50513          	addi	a0,a0,-898 # 8020a3d0 <digits+0x50>
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
    80200812:	177d                	addi	a4,a4,-1 # ffffffffffffefff <ebss_clear+0xffffffff7fdd1fff>
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
    802009f2:	00015717          	auipc	a4,0x15
    802009f6:	65e70713          	addi	a4,a4,1630 # 80216050 <started>
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
    80200a12:	ff6080e7          	jalr	-10(ra) # 80202a04 <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a16:	00007097          	auipc	ra,0x7
    80200a1a:	406080e7          	jalr	1030(ra) # 80207e1c <plicinithart>
    printf("hart 1 init done\n");
    80200a1e:	0000a517          	auipc	a0,0xa
    80200a22:	9d250513          	addi	a0,a0,-1582 # 8020a3f0 <digits+0x70>
    80200a26:	fffff097          	auipc	ra,0xfffff
    80200a2a:	768080e7          	jalr	1896(ra) # 8020018e <printf>
  }
  scheduler();
    80200a2e:	00001097          	auipc	ra,0x1
    80200a32:	60c080e7          	jalr	1548(ra) # 8020203a <scheduler>
    consoleinit();
    80200a36:	00007097          	auipc	ra,0x7
    80200a3a:	7f8080e7          	jalr	2040(ra) # 8020822e <consoleinit>
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
    80200a6a:	578080e7          	jalr	1400(ra) # 80205fde <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200a6e:	00002097          	auipc	ra,0x2
    80200a72:	f96080e7          	jalr	-106(ra) # 80202a04 <trapinithart>
    procinit();
    80200a76:	00001097          	auipc	ra,0x1
    80200a7a:	f9e080e7          	jalr	-98(ra) # 80201a14 <procinit>
    plicinit();
    80200a7e:	00007097          	auipc	ra,0x7
    80200a82:	386080e7          	jalr	902(ra) # 80207e04 <plicinit>
    plicinithart();
    80200a86:	00007097          	auipc	ra,0x7
    80200a8a:	396080e7          	jalr	918(ra) # 80207e1c <plicinithart>
    disk_init();
    80200a8e:	00005097          	auipc	ra,0x5
    80200a92:	5ec080e7          	jalr	1516(ra) # 8020607a <disk_init>
    binit();         // buffer cache
    80200a96:	00003097          	auipc	ra,0x3
    80200a9a:	fe6080e7          	jalr	-26(ra) # 80203a7c <binit>
    fileinit();      // file table
    80200a9e:	00003097          	auipc	ra,0x3
    80200aa2:	3ea080e7          	jalr	1002(ra) # 80203e88 <fileinit>
    userinit();      // first user process
    80200aa6:	00001097          	auipc	ra,0x1
    80200aaa:	31e080e7          	jalr	798(ra) # 80201dc4 <userinit>
    printf("hart 0 init done\n");
    80200aae:	0000a517          	auipc	a0,0xa
    80200ab2:	92a50513          	addi	a0,a0,-1750 # 8020a3d8 <digits+0x58>
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
    80200ada:	00015717          	auipc	a4,0x15
    80200ade:	56f72b23          	sw	a5,1398(a4) # 80216050 <started>
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
    80200aea:	00015797          	auipc	a5,0x15
    80200aee:	56e7b783          	ld	a5,1390(a5) # 80216058 <kernel_pagetable>
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
    80200b2e:	0000a517          	auipc	a0,0xa
    80200b32:	8da50513          	addi	a0,a0,-1830 # 8020a408 <digits+0x88>
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
    80200b68:	3a5d                	addiw	s4,s4,-9 # ffffffffffffeff7 <ebss_clear+0xffffffff7fdd1ff7>
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
    80200c26:	00009517          	auipc	a0,0x9
    80200c2a:	7ea50513          	addi	a0,a0,2026 # 8020a410 <digits+0x90>
    80200c2e:	fffff097          	auipc	ra,0xfffff
    80200c32:	516080e7          	jalr	1302(ra) # 80200144 <panic>
    panic("kvmpa");
    80200c36:	00009517          	auipc	a0,0x9
    80200c3a:	7da50513          	addi	a0,a0,2010 # 8020a410 <digits+0x90>
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
    80200c50:	00015517          	auipc	a0,0x15
    80200c54:	40853503          	ld	a0,1032(a0) # 80216058 <kernel_pagetable>
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
    80200cca:	00009517          	auipc	a0,0x9
    80200cce:	74e50513          	addi	a0,a0,1870 # 8020a418 <digits+0x98>
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
    80200d04:	00015517          	auipc	a0,0x15
    80200d08:	35453503          	ld	a0,852(a0) # 80216058 <kernel_pagetable>
    80200d0c:	00000097          	auipc	ra,0x0
    80200d10:	f5c080e7          	jalr	-164(ra) # 80200c68 <mappages>
    80200d14:	e509                	bnez	a0,80200d1e <kvmmap+0x28>
}
    80200d16:	60a2                	ld	ra,8(sp)
    80200d18:	6402                	ld	s0,0(sp)
    80200d1a:	0141                	addi	sp,sp,16
    80200d1c:	8082                	ret
    panic("kvmmap");
    80200d1e:	00009517          	auipc	a0,0x9
    80200d22:	70250513          	addi	a0,a0,1794 # 8020a420 <digits+0xa0>
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
    80200d40:	00015717          	auipc	a4,0x15
    80200d44:	30a73c23          	sd	a0,792(a4) # 80216058 <kernel_pagetable>
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
    80200dc4:	0000d497          	auipc	s1,0xd
    80200dc8:	f144b483          	ld	s1,-236(s1) # 8020dcd8 <_GLOBAL_OFFSET_TABLE_+0x20>
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
    80200e00:	0000d597          	auipc	a1,0xd
    80200e04:	ec05b583          	ld	a1,-320(a1) # 8020dcc0 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80200e68:	00009517          	auipc	a0,0x9
    80200e6c:	5c050513          	addi	a0,a0,1472 # 8020a428 <digits+0xa8>
    80200e70:	fffff097          	auipc	ra,0xfffff
    80200e74:	2d4080e7          	jalr	724(ra) # 80200144 <panic>
      panic("vmunmap: walk");
    80200e78:	00009517          	auipc	a0,0x9
    80200e7c:	5c850513          	addi	a0,a0,1480 # 8020a440 <digits+0xc0>
    80200e80:	fffff097          	auipc	ra,0xfffff
    80200e84:	2c4080e7          	jalr	708(ra) # 80200144 <panic>
      panic("vmunmap: not mapped");
    80200e88:	00009517          	auipc	a0,0x9
    80200e8c:	5c850513          	addi	a0,a0,1480 # 8020a450 <digits+0xd0>
    80200e90:	fffff097          	auipc	ra,0xfffff
    80200e94:	2b4080e7          	jalr	692(ra) # 80200144 <panic>
      panic("vmunmap: not a leaf");
    80200e98:	00009517          	auipc	a0,0x9
    80200e9c:	5d050513          	addi	a0,a0,1488 # 8020a468 <digits+0xe8>
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
    80200f8e:	00009517          	auipc	a0,0x9
    80200f92:	4f250513          	addi	a0,a0,1266 # 8020a480 <digits+0x100>
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
    80201142:	00009517          	auipc	a0,0x9
    80201146:	35e50513          	addi	a0,a0,862 # 8020a4a0 <digits+0x120>
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
    80201242:	00009517          	auipc	a0,0x9
    80201246:	26e50513          	addi	a0,a0,622 # 8020a4b0 <digits+0x130>
    8020124a:	fffff097          	auipc	ra,0xfffff
    8020124e:	efa080e7          	jalr	-262(ra) # 80200144 <panic>
      panic("uvmcopy: page not present");
    80201252:	00009517          	auipc	a0,0x9
    80201256:	27e50513          	addi	a0,a0,638 # 8020a4d0 <digits+0x150>
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
    802012d6:	00009517          	auipc	a0,0x9
    802012da:	21a50513          	addi	a0,a0,538 # 8020a4f0 <digits+0x170>
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
    8020138a:	730080e7          	jalr	1840(ra) # 80201ab6 <myproc>
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
    802013dc:	6de080e7          	jalr	1758(ra) # 80201ab6 <myproc>
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
    802014bc:	5fe080e7          	jalr	1534(ra) # 80201ab6 <myproc>
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
    8020157c:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <ebss_clear+0xffffffff7fdd2000>
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
    802015be:	4fc080e7          	jalr	1276(ra) # 80201ab6 <myproc>
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
    80201736:	00015597          	auipc	a1,0x15
    8020173a:	9225b583          	ld	a1,-1758(a1) # 80216058 <kernel_pagetable>
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
    802017aa:	00009517          	auipc	a0,0x9
    802017ae:	d5650513          	addi	a0,a0,-682 # 8020a500 <digits+0x180>
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
    802017c0:	00009d17          	auipc	s10,0x9
    802017c4:	d68d0d13          	addi	s10,s10,-664 # 8020a528 <digits+0x1a8>

          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
            if (*pte3 & PTE_V)
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    802017c8:	00009a17          	auipc	s4,0x9
    802017cc:	d78a0a13          	addi	s4,s4,-648 # 8020a540 <digits+0x1c0>
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
    802017fa:	0aa1                	addi	s5,s5,8 # fffffffffffff008 <ebss_clear+0xffffffff7fdd2008>
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
    8020183a:	0ba1                	addi	s7,s7,8 # fffffffffffff008 <ebss_clear+0xffffffff7fdd2008>
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
    8020185e:	00009517          	auipc	a0,0x9
    80201862:	cb250513          	addi	a0,a0,-846 # 8020a510 <digits+0x190>
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
}
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

00000000802018a2 <vpte>:




int vpte(pagetable_t pagetable, uint64 a)
{
    802018a2:	1141                	addi	sp,sp,-16
    802018a4:	e406                	sd	ra,8(sp)
    802018a6:	e022                	sd	s0,0(sp)
    802018a8:	0800                	addi	s0,sp,16
  pte_t *pte;
  if((pte = walk(pagetable, a, 1)) == NULL)
    802018aa:	4605                	li	a2,1
    802018ac:	fffff097          	auipc	ra,0xfffff
    802018b0:	25c080e7          	jalr	604(ra) # 80200b08 <walk>
    802018b4:	c909                	beqz	a0,802018c6 <vpte+0x24>
    return -1;
  if(*pte & PTE_V)
    802018b6:	6108                	ld	a0,0(a0)
    802018b8:	8905                	andi	a0,a0,1
    802018ba:	40a00533          	neg	a0,a0
    return -1;
  return 0;
}
    802018be:	60a2                	ld	ra,8(sp)
    802018c0:	6402                	ld	s0,0(sp)
    802018c2:	0141                	addi	sp,sp,16
    802018c4:	8082                	ret
    return -1;
    802018c6:	557d                	li	a0,-1
    802018c8:	bfdd                	j	802018be <vpte+0x1c>

00000000802018ca <wakeup1>:

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
    802018ca:	1101                	addi	sp,sp,-32
    802018cc:	ec06                	sd	ra,24(sp)
    802018ce:	e822                	sd	s0,16(sp)
    802018d0:	e426                	sd	s1,8(sp)
    802018d2:	1000                	addi	s0,sp,32
    802018d4:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    802018d6:	fffff097          	auipc	ra,0xfffff
    802018da:	dc2080e7          	jalr	-574(ra) # 80200698 <holding>
    802018de:	c909                	beqz	a0,802018f0 <wakeup1+0x26>
    panic("wakeup1");
  if(p->chan == p && p->state == SLEEPING) {
    802018e0:	749c                	ld	a5,40(s1)
    802018e2:	00978f63          	beq	a5,s1,80201900 <wakeup1+0x36>
    p->state = RUNNABLE;
  }
}
    802018e6:	60e2                	ld	ra,24(sp)
    802018e8:	6442                	ld	s0,16(sp)
    802018ea:	64a2                	ld	s1,8(sp)
    802018ec:	6105                	addi	sp,sp,32
    802018ee:	8082                	ret
    panic("wakeup1");
    802018f0:	00009517          	auipc	a0,0x9
    802018f4:	c7050513          	addi	a0,a0,-912 # 8020a560 <digits+0x1e0>
    802018f8:	fffff097          	auipc	ra,0xfffff
    802018fc:	84c080e7          	jalr	-1972(ra) # 80200144 <panic>
  if(p->chan == p && p->state == SLEEPING) {
    80201900:	4c98                	lw	a4,24(s1)
    80201902:	4785                	li	a5,1
    80201904:	fef711e3          	bne	a4,a5,802018e6 <wakeup1+0x1c>
    p->state = RUNNABLE;
    80201908:	4789                	li	a5,2
    8020190a:	cc9c                	sw	a5,24(s1)
}
    8020190c:	bfe9                	j	802018e6 <wakeup1+0x1c>

000000008020190e <reg_info>:
void reg_info(void) {
    8020190e:	1141                	addi	sp,sp,-16
    80201910:	e406                	sd	ra,8(sp)
    80201912:	e022                	sd	s0,0(sp)
    80201914:	0800                	addi	s0,sp,16
  printf("register info: {\n");
    80201916:	00009517          	auipc	a0,0x9
    8020191a:	c5250513          	addi	a0,a0,-942 # 8020a568 <digits+0x1e8>
    8020191e:	fffff097          	auipc	ra,0xfffff
    80201922:	870080e7          	jalr	-1936(ra) # 8020018e <printf>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80201926:	100025f3          	csrr	a1,sstatus
  printf("sstatus: %p\n", r_sstatus());
    8020192a:	00009517          	auipc	a0,0x9
    8020192e:	c5650513          	addi	a0,a0,-938 # 8020a580 <digits+0x200>
    80201932:	fffff097          	auipc	ra,0xfffff
    80201936:	85c080e7          	jalr	-1956(ra) # 8020018e <printf>
  asm volatile("csrr %0, sip" : "=r" (x) );
    8020193a:	144025f3          	csrr	a1,sip
  printf("sip: %p\n", r_sip());
    8020193e:	00009517          	auipc	a0,0x9
    80201942:	c5250513          	addi	a0,a0,-942 # 8020a590 <digits+0x210>
    80201946:	fffff097          	auipc	ra,0xfffff
    8020194a:	848080e7          	jalr	-1976(ra) # 8020018e <printf>
  asm volatile("csrr %0, sie" : "=r" (x) );
    8020194e:	104025f3          	csrr	a1,sie
  printf("sie: %p\n", r_sie());
    80201952:	00009517          	auipc	a0,0x9
    80201956:	c4e50513          	addi	a0,a0,-946 # 8020a5a0 <digits+0x220>
    8020195a:	fffff097          	auipc	ra,0xfffff
    8020195e:	834080e7          	jalr	-1996(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80201962:	141025f3          	csrr	a1,sepc
  printf("sepc: %p\n", r_sepc());
    80201966:	00009517          	auipc	a0,0x9
    8020196a:	c4a50513          	addi	a0,a0,-950 # 8020a5b0 <digits+0x230>
    8020196e:	fffff097          	auipc	ra,0xfffff
    80201972:	820080e7          	jalr	-2016(ra) # 8020018e <printf>
  asm volatile("csrr %0, stvec" : "=r" (x) );
    80201976:	105025f3          	csrr	a1,stvec
  printf("stvec: %p\n", r_stvec());
    8020197a:	00009517          	auipc	a0,0x9
    8020197e:	c4650513          	addi	a0,a0,-954 # 8020a5c0 <digits+0x240>
    80201982:	fffff097          	auipc	ra,0xfffff
    80201986:	80c080e7          	jalr	-2036(ra) # 8020018e <printf>
  asm volatile("csrr %0, satp" : "=r" (x) );
    8020198a:	180025f3          	csrr	a1,satp
  printf("satp: %p\n", r_satp());
    8020198e:	00009517          	auipc	a0,0x9
    80201992:	c4250513          	addi	a0,a0,-958 # 8020a5d0 <digits+0x250>
    80201996:	ffffe097          	auipc	ra,0xffffe
    8020199a:	7f8080e7          	jalr	2040(ra) # 8020018e <printf>
  asm volatile("csrr %0, scause" : "=r" (x) );
    8020199e:	142025f3          	csrr	a1,scause
  printf("scause: %p\n", r_scause());
    802019a2:	00009517          	auipc	a0,0x9
    802019a6:	c3e50513          	addi	a0,a0,-962 # 8020a5e0 <digits+0x260>
    802019aa:	ffffe097          	auipc	ra,0xffffe
    802019ae:	7e4080e7          	jalr	2020(ra) # 8020018e <printf>
  asm volatile("csrr %0, stval" : "=r" (x) );
    802019b2:	143025f3          	csrr	a1,stval
  printf("stval: %p\n", r_stval());
    802019b6:	00009517          	auipc	a0,0x9
    802019ba:	c3a50513          	addi	a0,a0,-966 # 8020a5f0 <digits+0x270>
    802019be:	ffffe097          	auipc	ra,0xffffe
    802019c2:	7d0080e7          	jalr	2000(ra) # 8020018e <printf>
  asm volatile("mv %0, sp" : "=r" (x) );
    802019c6:	858a                	mv	a1,sp
  printf("sp: %p\n", r_sp());
    802019c8:	00009517          	auipc	a0,0x9
    802019cc:	c3850513          	addi	a0,a0,-968 # 8020a600 <digits+0x280>
    802019d0:	ffffe097          	auipc	ra,0xffffe
    802019d4:	7be080e7          	jalr	1982(ra) # 8020018e <printf>
  asm volatile("mv %0, tp" : "=r" (x) );
    802019d8:	8592                	mv	a1,tp
  printf("tp: %p\n", r_tp());
    802019da:	00009517          	auipc	a0,0x9
    802019de:	c2e50513          	addi	a0,a0,-978 # 8020a608 <digits+0x288>
    802019e2:	ffffe097          	auipc	ra,0xffffe
    802019e6:	7ac080e7          	jalr	1964(ra) # 8020018e <printf>
  asm volatile("mv %0, ra" : "=r" (x) );
    802019ea:	8586                	mv	a1,ra
  printf("ra: %p\n", r_ra());
    802019ec:	00009517          	auipc	a0,0x9
    802019f0:	c2450513          	addi	a0,a0,-988 # 8020a610 <digits+0x290>
    802019f4:	ffffe097          	auipc	ra,0xffffe
    802019f8:	79a080e7          	jalr	1946(ra) # 8020018e <printf>
  printf("}\n");
    802019fc:	00009517          	auipc	a0,0x9
    80201a00:	c1c50513          	addi	a0,a0,-996 # 8020a618 <digits+0x298>
    80201a04:	ffffe097          	auipc	ra,0xffffe
    80201a08:	78a080e7          	jalr	1930(ra) # 8020018e <printf>
}
    80201a0c:	60a2                	ld	ra,8(sp)
    80201a0e:	6402                	ld	s0,0(sp)
    80201a10:	0141                	addi	sp,sp,16
    80201a12:	8082                	ret

0000000080201a14 <procinit>:
{
    80201a14:	7179                	addi	sp,sp,-48
    80201a16:	f406                	sd	ra,40(sp)
    80201a18:	f022                	sd	s0,32(sp)
    80201a1a:	ec26                	sd	s1,24(sp)
    80201a1c:	e84a                	sd	s2,16(sp)
    80201a1e:	e44e                	sd	s3,8(sp)
    80201a20:	1800                	addi	s0,sp,48
  initlock(&pid_lock, "nextpid");
    80201a22:	00009597          	auipc	a1,0x9
    80201a26:	bfe58593          	addi	a1,a1,-1026 # 8020a620 <digits+0x2a0>
    80201a2a:	00014517          	auipc	a0,0x14
    80201a2e:	63650513          	addi	a0,a0,1590 # 80216060 <pid_lock>
    80201a32:	fffff097          	auipc	ra,0xfffff
    80201a36:	c50080e7          	jalr	-944(ra) # 80200682 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a3a:	00014497          	auipc	s1,0x14
    80201a3e:	74648493          	addi	s1,s1,1862 # 80216180 <proc>
      initlock(&p->lock, "proc");
    80201a42:	00009997          	auipc	s3,0x9
    80201a46:	be698993          	addi	s3,s3,-1050 # 8020a628 <digits+0x2a8>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a4a:	0001d917          	auipc	s2,0x1d
    80201a4e:	a7690913          	addi	s2,s2,-1418 # 8021e4c0 <bcache>
      initlock(&p->lock, "proc");
    80201a52:	85ce                	mv	a1,s3
    80201a54:	8526                	mv	a0,s1
    80201a56:	fffff097          	auipc	ra,0xfffff
    80201a5a:	c2c080e7          	jalr	-980(ra) # 80200682 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a5e:	2a048493          	addi	s1,s1,672
    80201a62:	ff2498e3          	bne	s1,s2,80201a52 <procinit+0x3e>
  memset(cpus, 0, sizeof(cpus));
    80201a66:	10000613          	li	a2,256
    80201a6a:	4581                	li	a1,0
    80201a6c:	00014517          	auipc	a0,0x14
    80201a70:	60c50513          	addi	a0,a0,1548 # 80216078 <cpus>
    80201a74:	fffff097          	auipc	ra,0xfffff
    80201a78:	cee080e7          	jalr	-786(ra) # 80200762 <memset>
}
    80201a7c:	70a2                	ld	ra,40(sp)
    80201a7e:	7402                	ld	s0,32(sp)
    80201a80:	64e2                	ld	s1,24(sp)
    80201a82:	6942                	ld	s2,16(sp)
    80201a84:	69a2                	ld	s3,8(sp)
    80201a86:	6145                	addi	sp,sp,48
    80201a88:	8082                	ret

0000000080201a8a <cpuid>:
{
    80201a8a:	1141                	addi	sp,sp,-16
    80201a8c:	e422                	sd	s0,8(sp)
    80201a8e:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r" (x) );
    80201a90:	8512                	mv	a0,tp
}
    80201a92:	2501                	sext.w	a0,a0
    80201a94:	6422                	ld	s0,8(sp)
    80201a96:	0141                	addi	sp,sp,16
    80201a98:	8082                	ret

0000000080201a9a <mycpu>:
mycpu(void) {
    80201a9a:	1141                	addi	sp,sp,-16
    80201a9c:	e422                	sd	s0,8(sp)
    80201a9e:	0800                	addi	s0,sp,16
    80201aa0:	8792                	mv	a5,tp
  struct cpu *c = &cpus[id];
    80201aa2:	2781                	sext.w	a5,a5
    80201aa4:	079e                	slli	a5,a5,0x7
}
    80201aa6:	00014517          	auipc	a0,0x14
    80201aaa:	5d250513          	addi	a0,a0,1490 # 80216078 <cpus>
    80201aae:	953e                	add	a0,a0,a5
    80201ab0:	6422                	ld	s0,8(sp)
    80201ab2:	0141                	addi	sp,sp,16
    80201ab4:	8082                	ret

0000000080201ab6 <myproc>:
myproc(void) {
    80201ab6:	1101                	addi	sp,sp,-32
    80201ab8:	ec06                	sd	ra,24(sp)
    80201aba:	e822                	sd	s0,16(sp)
    80201abc:	e426                	sd	s1,8(sp)
    80201abe:	1000                	addi	s0,sp,32
  push_off();
    80201ac0:	fffff097          	auipc	ra,0xfffff
    80201ac4:	b16080e7          	jalr	-1258(ra) # 802005d6 <push_off>
    80201ac8:	8792                	mv	a5,tp
  struct proc *p = c->proc;
    80201aca:	2781                	sext.w	a5,a5
    80201acc:	079e                	slli	a5,a5,0x7
    80201ace:	00014717          	auipc	a4,0x14
    80201ad2:	59270713          	addi	a4,a4,1426 # 80216060 <pid_lock>
    80201ad6:	97ba                	add	a5,a5,a4
    80201ad8:	6f84                	ld	s1,24(a5)
  pop_off();
    80201ada:	fffff097          	auipc	ra,0xfffff
    80201ade:	b48080e7          	jalr	-1208(ra) # 80200622 <pop_off>
}
    80201ae2:	8526                	mv	a0,s1
    80201ae4:	60e2                	ld	ra,24(sp)
    80201ae6:	6442                	ld	s0,16(sp)
    80201ae8:	64a2                	ld	s1,8(sp)
    80201aea:	6105                	addi	sp,sp,32
    80201aec:	8082                	ret

0000000080201aee <forkret>:
{
    80201aee:	1101                	addi	sp,sp,-32
    80201af0:	ec06                	sd	ra,24(sp)
    80201af2:	e822                	sd	s0,16(sp)
    80201af4:	e426                	sd	s1,8(sp)
    80201af6:	1000                	addi	s0,sp,32
  release(&myproc()->lock);
    80201af8:	00000097          	auipc	ra,0x0
    80201afc:	fbe080e7          	jalr	-66(ra) # 80201ab6 <myproc>
    80201b00:	fffff097          	auipc	ra,0xfffff
    80201b04:	c1a080e7          	jalr	-998(ra) # 8020071a <release>
  if (first) {
    80201b08:	0000a797          	auipc	a5,0xa
    80201b0c:	4f87a783          	lw	a5,1272(a5) # 8020c000 <first.1>
    80201b10:	eb91                	bnez	a5,80201b24 <forkret+0x36>
  usertrapret();
    80201b12:	00001097          	auipc	ra,0x1
    80201b16:	f2e080e7          	jalr	-210(ra) # 80202a40 <usertrapret>
}
    80201b1a:	60e2                	ld	ra,24(sp)
    80201b1c:	6442                	ld	s0,16(sp)
    80201b1e:	64a2                	ld	s1,8(sp)
    80201b20:	6105                	addi	sp,sp,32
    80201b22:	8082                	ret
    first = 0;
    80201b24:	0000a797          	auipc	a5,0xa
    80201b28:	4c07ae23          	sw	zero,1244(a5) # 8020c000 <first.1>
    fat32_init();
    80201b2c:	00005097          	auipc	ra,0x5
    80201b30:	cc6080e7          	jalr	-826(ra) # 802067f2 <fat32_init>
    myproc()->cwd = ename("/");
    80201b34:	00000097          	auipc	ra,0x0
    80201b38:	f82080e7          	jalr	-126(ra) # 80201ab6 <myproc>
    80201b3c:	84aa                	mv	s1,a0
    80201b3e:	00009517          	auipc	a0,0x9
    80201b42:	af250513          	addi	a0,a0,-1294 # 8020a630 <digits+0x2b0>
    80201b46:	00006097          	auipc	ra,0x6
    80201b4a:	fca080e7          	jalr	-54(ra) # 80207b10 <ename>
    80201b4e:	14a4bc23          	sd	a0,344(s1)
    80201b52:	b7c1                	j	80201b12 <forkret+0x24>

0000000080201b54 <allocpid>:
allocpid() {
    80201b54:	1101                	addi	sp,sp,-32
    80201b56:	ec06                	sd	ra,24(sp)
    80201b58:	e822                	sd	s0,16(sp)
    80201b5a:	e426                	sd	s1,8(sp)
    80201b5c:	e04a                	sd	s2,0(sp)
    80201b5e:	1000                	addi	s0,sp,32
  acquire(&pid_lock);
    80201b60:	00014917          	auipc	s2,0x14
    80201b64:	50090913          	addi	s2,s2,1280 # 80216060 <pid_lock>
    80201b68:	854a                	mv	a0,s2
    80201b6a:	fffff097          	auipc	ra,0xfffff
    80201b6e:	b5c080e7          	jalr	-1188(ra) # 802006c6 <acquire>
  pid = nextpid;
    80201b72:	0000a797          	auipc	a5,0xa
    80201b76:	48e78793          	addi	a5,a5,1166 # 8020c000 <first.1>
    80201b7a:	43c4                	lw	s1,4(a5)
  nextpid = nextpid + 1;
    80201b7c:	0014871b          	addiw	a4,s1,1
    80201b80:	c3d8                	sw	a4,4(a5)
  release(&pid_lock);
    80201b82:	854a                	mv	a0,s2
    80201b84:	fffff097          	auipc	ra,0xfffff
    80201b88:	b96080e7          	jalr	-1130(ra) # 8020071a <release>
}
    80201b8c:	8526                	mv	a0,s1
    80201b8e:	60e2                	ld	ra,24(sp)
    80201b90:	6442                	ld	s0,16(sp)
    80201b92:	64a2                	ld	s1,8(sp)
    80201b94:	6902                	ld	s2,0(sp)
    80201b96:	6105                	addi	sp,sp,32
    80201b98:	8082                	ret

0000000080201b9a <proc_pagetable>:
{
    80201b9a:	1101                	addi	sp,sp,-32
    80201b9c:	ec06                	sd	ra,24(sp)
    80201b9e:	e822                	sd	s0,16(sp)
    80201ba0:	e426                	sd	s1,8(sp)
    80201ba2:	e04a                	sd	s2,0(sp)
    80201ba4:	1000                	addi	s0,sp,32
    80201ba6:	892a                	mv	s2,a0
  pagetable = uvmcreate();
    80201ba8:	fffff097          	auipc	ra,0xfffff
    80201bac:	33e080e7          	jalr	830(ra) # 80200ee6 <uvmcreate>
    80201bb0:	84aa                	mv	s1,a0
  if(pagetable == 0)
    80201bb2:	c121                	beqz	a0,80201bf2 <proc_pagetable+0x58>
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80201bb4:	4729                	li	a4,10
    80201bb6:	0000c697          	auipc	a3,0xc
    80201bba:	10a6b683          	ld	a3,266(a3) # 8020dcc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201bbe:	6605                	lui	a2,0x1
    80201bc0:	040005b7          	lui	a1,0x4000
    80201bc4:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201bc6:	05b2                	slli	a1,a1,0xc
    80201bc8:	fffff097          	auipc	ra,0xfffff
    80201bcc:	0a0080e7          	jalr	160(ra) # 80200c68 <mappages>
    80201bd0:	02054863          	bltz	a0,80201c00 <proc_pagetable+0x66>
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80201bd4:	4719                	li	a4,6
    80201bd6:	06093683          	ld	a3,96(s2)
    80201bda:	6605                	lui	a2,0x1
    80201bdc:	020005b7          	lui	a1,0x2000
    80201be0:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    80201be2:	05b6                	slli	a1,a1,0xd
    80201be4:	8526                	mv	a0,s1
    80201be6:	fffff097          	auipc	ra,0xfffff
    80201bea:	082080e7          	jalr	130(ra) # 80200c68 <mappages>
    80201bee:	02054163          	bltz	a0,80201c10 <proc_pagetable+0x76>
}
    80201bf2:	8526                	mv	a0,s1
    80201bf4:	60e2                	ld	ra,24(sp)
    80201bf6:	6442                	ld	s0,16(sp)
    80201bf8:	64a2                	ld	s1,8(sp)
    80201bfa:	6902                	ld	s2,0(sp)
    80201bfc:	6105                	addi	sp,sp,32
    80201bfe:	8082                	ret
    uvmfree(pagetable, 0);
    80201c00:	4581                	li	a1,0
    80201c02:	8526                	mv	a0,s1
    80201c04:	fffff097          	auipc	ra,0xfffff
    80201c08:	568080e7          	jalr	1384(ra) # 8020116c <uvmfree>
    return NULL;
    80201c0c:	4481                	li	s1,0
    80201c0e:	b7d5                	j	80201bf2 <proc_pagetable+0x58>
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201c10:	4681                	li	a3,0
    80201c12:	4605                	li	a2,1
    80201c14:	040005b7          	lui	a1,0x4000
    80201c18:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201c1a:	05b2                	slli	a1,a1,0xc
    80201c1c:	8526                	mv	a0,s1
    80201c1e:	fffff097          	auipc	ra,0xfffff
    80201c22:	204080e7          	jalr	516(ra) # 80200e22 <vmunmap>
    uvmfree(pagetable, 0);
    80201c26:	4581                	li	a1,0
    80201c28:	8526                	mv	a0,s1
    80201c2a:	fffff097          	auipc	ra,0xfffff
    80201c2e:	542080e7          	jalr	1346(ra) # 8020116c <uvmfree>
    return NULL;
    80201c32:	4481                	li	s1,0
    80201c34:	bf7d                	j	80201bf2 <proc_pagetable+0x58>

0000000080201c36 <proc_freepagetable>:
{
    80201c36:	1101                	addi	sp,sp,-32
    80201c38:	ec06                	sd	ra,24(sp)
    80201c3a:	e822                	sd	s0,16(sp)
    80201c3c:	e426                	sd	s1,8(sp)
    80201c3e:	e04a                	sd	s2,0(sp)
    80201c40:	1000                	addi	s0,sp,32
    80201c42:	84aa                	mv	s1,a0
    80201c44:	892e                	mv	s2,a1
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201c46:	4681                	li	a3,0
    80201c48:	4605                	li	a2,1
    80201c4a:	040005b7          	lui	a1,0x4000
    80201c4e:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201c50:	05b2                	slli	a1,a1,0xc
    80201c52:	fffff097          	auipc	ra,0xfffff
    80201c56:	1d0080e7          	jalr	464(ra) # 80200e22 <vmunmap>
  vmunmap(pagetable, TRAPFRAME, 1, 0);
    80201c5a:	4681                	li	a3,0
    80201c5c:	4605                	li	a2,1
    80201c5e:	020005b7          	lui	a1,0x2000
    80201c62:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    80201c64:	05b6                	slli	a1,a1,0xd
    80201c66:	8526                	mv	a0,s1
    80201c68:	fffff097          	auipc	ra,0xfffff
    80201c6c:	1ba080e7          	jalr	442(ra) # 80200e22 <vmunmap>
  uvmfree(pagetable, sz);
    80201c70:	85ca                	mv	a1,s2
    80201c72:	8526                	mv	a0,s1
    80201c74:	fffff097          	auipc	ra,0xfffff
    80201c78:	4f8080e7          	jalr	1272(ra) # 8020116c <uvmfree>
}
    80201c7c:	60e2                	ld	ra,24(sp)
    80201c7e:	6442                	ld	s0,16(sp)
    80201c80:	64a2                	ld	s1,8(sp)
    80201c82:	6902                	ld	s2,0(sp)
    80201c84:	6105                	addi	sp,sp,32
    80201c86:	8082                	ret

0000000080201c88 <freeproc>:
{
    80201c88:	1101                	addi	sp,sp,-32
    80201c8a:	ec06                	sd	ra,24(sp)
    80201c8c:	e822                	sd	s0,16(sp)
    80201c8e:	e426                	sd	s1,8(sp)
    80201c90:	1000                	addi	s0,sp,32
    80201c92:	84aa                	mv	s1,a0
  if(p->trapframe)
    80201c94:	7128                	ld	a0,96(a0)
    80201c96:	c509                	beqz	a0,80201ca0 <freeproc+0x18>
    kfree((void*)p->trapframe);
    80201c98:	ffffe097          	auipc	ra,0xffffe
    80201c9c:	7a8080e7          	jalr	1960(ra) # 80200440 <kfree>
  p->trapframe = 0;
    80201ca0:	0604b023          	sd	zero,96(s1)
  if (p->kpagetable) {
    80201ca4:	6ca8                	ld	a0,88(s1)
    80201ca6:	c511                	beqz	a0,80201cb2 <freeproc+0x2a>
    kvmfree(p->kpagetable, 1);
    80201ca8:	4585                	li	a1,1
    80201caa:	00000097          	auipc	ra,0x0
    80201cae:	a1a080e7          	jalr	-1510(ra) # 802016c4 <kvmfree>
  p->kpagetable = 0;
    80201cb2:	0404bc23          	sd	zero,88(s1)
  if(p->pagetable)
    80201cb6:	68a8                	ld	a0,80(s1)
    80201cb8:	c511                	beqz	a0,80201cc4 <freeproc+0x3c>
    proc_freepagetable(p->pagetable, p->sz);
    80201cba:	64ac                	ld	a1,72(s1)
    80201cbc:	00000097          	auipc	ra,0x0
    80201cc0:	f7a080e7          	jalr	-134(ra) # 80201c36 <proc_freepagetable>
  p->pagetable = 0;
    80201cc4:	0404b823          	sd	zero,80(s1)
  p->sz = 0;
    80201cc8:	0404b423          	sd	zero,72(s1)
  p->pid = 0;
    80201ccc:	0204ac23          	sw	zero,56(s1)
  p->parent = 0;
    80201cd0:	0204b023          	sd	zero,32(s1)
  p->name[0] = 0;
    80201cd4:	16048023          	sb	zero,352(s1)
  p->chan = 0;
    80201cd8:	0204b423          	sd	zero,40(s1)
  p->killed = 0;
    80201cdc:	0204a823          	sw	zero,48(s1)
  p->xstate = 0;
    80201ce0:	0204aa23          	sw	zero,52(s1)
  p->state = UNUSED;
    80201ce4:	0004ac23          	sw	zero,24(s1)
}
    80201ce8:	60e2                	ld	ra,24(sp)
    80201cea:	6442                	ld	s0,16(sp)
    80201cec:	64a2                	ld	s1,8(sp)
    80201cee:	6105                	addi	sp,sp,32
    80201cf0:	8082                	ret

0000000080201cf2 <allocproc>:
{
    80201cf2:	1101                	addi	sp,sp,-32
    80201cf4:	ec06                	sd	ra,24(sp)
    80201cf6:	e822                	sd	s0,16(sp)
    80201cf8:	e426                	sd	s1,8(sp)
    80201cfa:	e04a                	sd	s2,0(sp)
    80201cfc:	1000                	addi	s0,sp,32
  for(p = proc; p < &proc[NPROC]; p++) {
    80201cfe:	00014497          	auipc	s1,0x14
    80201d02:	48248493          	addi	s1,s1,1154 # 80216180 <proc>
    80201d06:	0001c917          	auipc	s2,0x1c
    80201d0a:	7ba90913          	addi	s2,s2,1978 # 8021e4c0 <bcache>
    acquire(&p->lock);
    80201d0e:	8526                	mv	a0,s1
    80201d10:	fffff097          	auipc	ra,0xfffff
    80201d14:	9b6080e7          	jalr	-1610(ra) # 802006c6 <acquire>
    if(p->state == UNUSED) {
    80201d18:	4c9c                	lw	a5,24(s1)
    80201d1a:	cf81                	beqz	a5,80201d32 <allocproc+0x40>
      release(&p->lock);
    80201d1c:	8526                	mv	a0,s1
    80201d1e:	fffff097          	auipc	ra,0xfffff
    80201d22:	9fc080e7          	jalr	-1540(ra) # 8020071a <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201d26:	2a048493          	addi	s1,s1,672
    80201d2a:	ff2492e3          	bne	s1,s2,80201d0e <allocproc+0x1c>
  return NULL;
    80201d2e:	4481                	li	s1,0
    80201d30:	a085                	j	80201d90 <allocproc+0x9e>
  p->pid = allocpid();
    80201d32:	00000097          	auipc	ra,0x0
    80201d36:	e22080e7          	jalr	-478(ra) # 80201b54 <allocpid>
    80201d3a:	dc88                	sw	a0,56(s1)
  if((p->trapframe = (struct trapframe *)kalloc()) == NULL){
    80201d3c:	fffff097          	auipc	ra,0xfffff
    80201d40:	81e080e7          	jalr	-2018(ra) # 8020055a <kalloc>
    80201d44:	892a                	mv	s2,a0
    80201d46:	f0a8                	sd	a0,96(s1)
    80201d48:	c939                	beqz	a0,80201d9e <allocproc+0xac>
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201d4a:	8526                	mv	a0,s1
    80201d4c:	00000097          	auipc	ra,0x0
    80201d50:	e4e080e7          	jalr	-434(ra) # 80201b9a <proc_pagetable>
    80201d54:	e8a8                	sd	a0,80(s1)
    80201d56:	c939                	beqz	a0,80201dac <allocproc+0xba>
      (p->kpagetable = proc_kpagetable()) == NULL) {
    80201d58:	00000097          	auipc	ra,0x0
    80201d5c:	9c6080e7          	jalr	-1594(ra) # 8020171e <proc_kpagetable>
    80201d60:	eca8                	sd	a0,88(s1)
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201d62:	c529                	beqz	a0,80201dac <allocproc+0xba>
  p->kstack = VKSTACK;
    80201d64:	0fb00793          	li	a5,251
    80201d68:	07fa                	slli	a5,a5,0x1e
    80201d6a:	e0bc                	sd	a5,64(s1)
  memset(&p->context, 0, sizeof(p->context));
    80201d6c:	07000613          	li	a2,112
    80201d70:	4581                	li	a1,0
    80201d72:	06848513          	addi	a0,s1,104
    80201d76:	fffff097          	auipc	ra,0xfffff
    80201d7a:	9ec080e7          	jalr	-1556(ra) # 80200762 <memset>
  p->context.ra = (uint64)forkret;
    80201d7e:	00000797          	auipc	a5,0x0
    80201d82:	d7078793          	addi	a5,a5,-656 # 80201aee <forkret>
    80201d86:	f4bc                	sd	a5,104(s1)
  p->context.sp = p->kstack + PGSIZE;
    80201d88:	60bc                	ld	a5,64(s1)
    80201d8a:	6705                	lui	a4,0x1
    80201d8c:	97ba                	add	a5,a5,a4
    80201d8e:	f8bc                	sd	a5,112(s1)
}
    80201d90:	8526                	mv	a0,s1
    80201d92:	60e2                	ld	ra,24(sp)
    80201d94:	6442                	ld	s0,16(sp)
    80201d96:	64a2                	ld	s1,8(sp)
    80201d98:	6902                	ld	s2,0(sp)
    80201d9a:	6105                	addi	sp,sp,32
    80201d9c:	8082                	ret
    release(&p->lock);
    80201d9e:	8526                	mv	a0,s1
    80201da0:	fffff097          	auipc	ra,0xfffff
    80201da4:	97a080e7          	jalr	-1670(ra) # 8020071a <release>
    return NULL;
    80201da8:	84ca                	mv	s1,s2
    80201daa:	b7dd                	j	80201d90 <allocproc+0x9e>
    freeproc(p);
    80201dac:	8526                	mv	a0,s1
    80201dae:	00000097          	auipc	ra,0x0
    80201db2:	eda080e7          	jalr	-294(ra) # 80201c88 <freeproc>
    release(&p->lock);
    80201db6:	8526                	mv	a0,s1
    80201db8:	fffff097          	auipc	ra,0xfffff
    80201dbc:	962080e7          	jalr	-1694(ra) # 8020071a <release>
    return NULL;
    80201dc0:	4481                	li	s1,0
    80201dc2:	b7f9                	j	80201d90 <allocproc+0x9e>

0000000080201dc4 <userinit>:
{
    80201dc4:	1101                	addi	sp,sp,-32
    80201dc6:	ec06                	sd	ra,24(sp)
    80201dc8:	e822                	sd	s0,16(sp)
    80201dca:	e426                	sd	s1,8(sp)
    80201dcc:	e04a                	sd	s2,0(sp)
    80201dce:	1000                	addi	s0,sp,32
  p = allocproc();
    80201dd0:	00000097          	auipc	ra,0x0
    80201dd4:	f22080e7          	jalr	-222(ra) # 80201cf2 <allocproc>
    80201dd8:	84aa                	mv	s1,a0
  initproc = p;
    80201dda:	00014797          	auipc	a5,0x14
    80201dde:	38a7bf23          	sd	a0,926(a5) # 80216178 <initproc>
  uvminit(p->pagetable , p->kpagetable, initcode, sizeof(initcode));
    80201de2:	6905                	lui	s2,0x1
    80201de4:	c2090693          	addi	a3,s2,-992 # c20 <_entry-0x801ff3e0>
    80201de8:	0000a617          	auipc	a2,0xa
    80201dec:	22060613          	addi	a2,a2,544 # 8020c008 <initcode>
    80201df0:	6d2c                	ld	a1,88(a0)
    80201df2:	6928                	ld	a0,80(a0)
    80201df4:	fffff097          	auipc	ra,0xfffff
    80201df8:	120080e7          	jalr	288(ra) # 80200f14 <uvminit>
  p->sz = PGSIZE;
    80201dfc:	0524b423          	sd	s2,72(s1)
  p->trapframe->epc = 0x0;      // user program counter
    80201e00:	70bc                	ld	a5,96(s1)
    80201e02:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80201e06:	70bc                	ld	a5,96(s1)
    80201e08:	0327b823          	sd	s2,48(a5)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80201e0c:	4641                	li	a2,16
    80201e0e:	00009597          	auipc	a1,0x9
    80201e12:	82a58593          	addi	a1,a1,-2006 # 8020a638 <digits+0x2b8>
    80201e16:	16048513          	addi	a0,s1,352
    80201e1a:	fffff097          	auipc	ra,0xfffff
    80201e1e:	a9a080e7          	jalr	-1382(ra) # 802008b4 <safestrcpy>
  p->state = RUNNABLE;
    80201e22:	4789                	li	a5,2
    80201e24:	cc9c                	sw	a5,24(s1)
  p->tmask = 0;
    80201e26:	1604a823          	sw	zero,368(s1)
  release(&p->lock);
    80201e2a:	8526                	mv	a0,s1
    80201e2c:	fffff097          	auipc	ra,0xfffff
    80201e30:	8ee080e7          	jalr	-1810(ra) # 8020071a <release>
}
    80201e34:	60e2                	ld	ra,24(sp)
    80201e36:	6442                	ld	s0,16(sp)
    80201e38:	64a2                	ld	s1,8(sp)
    80201e3a:	6902                	ld	s2,0(sp)
    80201e3c:	6105                	addi	sp,sp,32
    80201e3e:	8082                	ret

0000000080201e40 <growproc>:
{
    80201e40:	1101                	addi	sp,sp,-32
    80201e42:	ec06                	sd	ra,24(sp)
    80201e44:	e822                	sd	s0,16(sp)
    80201e46:	e426                	sd	s1,8(sp)
    80201e48:	e04a                	sd	s2,0(sp)
    80201e4a:	1000                	addi	s0,sp,32
    80201e4c:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80201e4e:	00000097          	auipc	ra,0x0
    80201e52:	c68080e7          	jalr	-920(ra) # 80201ab6 <myproc>
    80201e56:	892a                	mv	s2,a0
  sz = p->sz;
    80201e58:	6530                	ld	a2,72(a0)
    80201e5a:	0006079b          	sext.w	a5,a2
  if(n > 0){
    80201e5e:	00904f63          	bgtz	s1,80201e7c <growproc+0x3c>
  } else if(n < 0){
    80201e62:	0204ce63          	bltz	s1,80201e9e <growproc+0x5e>
  p->sz = sz;
    80201e66:	1782                	slli	a5,a5,0x20
    80201e68:	9381                	srli	a5,a5,0x20
    80201e6a:	04f93423          	sd	a5,72(s2)
  return 0;
    80201e6e:	4501                	li	a0,0
}
    80201e70:	60e2                	ld	ra,24(sp)
    80201e72:	6442                	ld	s0,16(sp)
    80201e74:	64a2                	ld	s1,8(sp)
    80201e76:	6902                	ld	s2,0(sp)
    80201e78:	6105                	addi	sp,sp,32
    80201e7a:	8082                	ret
    if((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0) {
    80201e7c:	00f486bb          	addw	a3,s1,a5
    80201e80:	1682                	slli	a3,a3,0x20
    80201e82:	9281                	srli	a3,a3,0x20
    80201e84:	1602                	slli	a2,a2,0x20
    80201e86:	9201                	srli	a2,a2,0x20
    80201e88:	6d2c                	ld	a1,88(a0)
    80201e8a:	6928                	ld	a0,80(a0)
    80201e8c:	fffff097          	auipc	ra,0xfffff
    80201e90:	17e080e7          	jalr	382(ra) # 8020100a <uvmalloc>
    80201e94:	0005079b          	sext.w	a5,a0
    80201e98:	f7f9                	bnez	a5,80201e66 <growproc+0x26>
      return -1;
    80201e9a:	557d                	li	a0,-1
    80201e9c:	bfd1                	j	80201e70 <growproc+0x30>
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
    80201e9e:	00f486bb          	addw	a3,s1,a5
    80201ea2:	1682                	slli	a3,a3,0x20
    80201ea4:	9281                	srli	a3,a3,0x20
    80201ea6:	1602                	slli	a2,a2,0x20
    80201ea8:	9201                	srli	a2,a2,0x20
    80201eaa:	6d2c                	ld	a1,88(a0)
    80201eac:	6928                	ld	a0,80(a0)
    80201eae:	fffff097          	auipc	ra,0xfffff
    80201eb2:	0f0080e7          	jalr	240(ra) # 80200f9e <uvmdealloc>
    80201eb6:	0005079b          	sext.w	a5,a0
    80201eba:	b775                	j	80201e66 <growproc+0x26>

0000000080201ebc <fork>:
{
    80201ebc:	7139                	addi	sp,sp,-64
    80201ebe:	fc06                	sd	ra,56(sp)
    80201ec0:	f822                	sd	s0,48(sp)
    80201ec2:	f426                	sd	s1,40(sp)
    80201ec4:	f04a                	sd	s2,32(sp)
    80201ec6:	ec4e                	sd	s3,24(sp)
    80201ec8:	e852                	sd	s4,16(sp)
    80201eca:	e456                	sd	s5,8(sp)
    80201ecc:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    80201ece:	00000097          	auipc	ra,0x0
    80201ed2:	be8080e7          	jalr	-1048(ra) # 80201ab6 <myproc>
    80201ed6:	8aaa                	mv	s5,a0
  if((np = allocproc()) == NULL){
    80201ed8:	00000097          	auipc	ra,0x0
    80201edc:	e1a080e7          	jalr	-486(ra) # 80201cf2 <allocproc>
    80201ee0:	c965                	beqz	a0,80201fd0 <fork+0x114>
    80201ee2:	8a2a                	mv	s4,a0
  if(uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0){
    80201ee4:	048ab683          	ld	a3,72(s5)
    80201ee8:	6d30                	ld	a2,88(a0)
    80201eea:	692c                	ld	a1,80(a0)
    80201eec:	050ab503          	ld	a0,80(s5)
    80201ef0:	fffff097          	auipc	ra,0xfffff
    80201ef4:	2b6080e7          	jalr	694(ra) # 802011a6 <uvmcopy>
    80201ef8:	04054e63          	bltz	a0,80201f54 <fork+0x98>
  np->sz = p->sz;
    80201efc:	048ab783          	ld	a5,72(s5)
    80201f00:	04fa3423          	sd	a5,72(s4)
  np->parent = p;
    80201f04:	035a3023          	sd	s5,32(s4)
  np->tmask = p->tmask;
    80201f08:	170aa783          	lw	a5,368(s5)
    80201f0c:	16fa2823          	sw	a5,368(s4)
  *(np->trapframe) = *(p->trapframe);
    80201f10:	060ab683          	ld	a3,96(s5)
    80201f14:	87b6                	mv	a5,a3
    80201f16:	060a3703          	ld	a4,96(s4)
    80201f1a:	12068693          	addi	a3,a3,288
    80201f1e:	0007b803          	ld	a6,0(a5)
    80201f22:	6788                	ld	a0,8(a5)
    80201f24:	6b8c                	ld	a1,16(a5)
    80201f26:	6f90                	ld	a2,24(a5)
    80201f28:	01073023          	sd	a6,0(a4) # 1000 <_entry-0x801ff000>
    80201f2c:	e708                	sd	a0,8(a4)
    80201f2e:	eb0c                	sd	a1,16(a4)
    80201f30:	ef10                	sd	a2,24(a4)
    80201f32:	02078793          	addi	a5,a5,32
    80201f36:	02070713          	addi	a4,a4,32
    80201f3a:	fed792e3          	bne	a5,a3,80201f1e <fork+0x62>
  np->trapframe->a0 = 0;
    80201f3e:	060a3783          	ld	a5,96(s4)
    80201f42:	0607b823          	sd	zero,112(a5)
  for(i = 0; i < NOFILE; i++)
    80201f46:	0d8a8493          	addi	s1,s5,216
    80201f4a:	0d8a0913          	addi	s2,s4,216
    80201f4e:	158a8993          	addi	s3,s5,344
    80201f52:	a00d                	j	80201f74 <fork+0xb8>
    freeproc(np);
    80201f54:	8552                	mv	a0,s4
    80201f56:	00000097          	auipc	ra,0x0
    80201f5a:	d32080e7          	jalr	-718(ra) # 80201c88 <freeproc>
    release(&np->lock);
    80201f5e:	8552                	mv	a0,s4
    80201f60:	ffffe097          	auipc	ra,0xffffe
    80201f64:	7ba080e7          	jalr	1978(ra) # 8020071a <release>
    return -1;
    80201f68:	54fd                	li	s1,-1
    80201f6a:	a889                	j	80201fbc <fork+0x100>
  for(i = 0; i < NOFILE; i++)
    80201f6c:	04a1                	addi	s1,s1,8
    80201f6e:	0921                	addi	s2,s2,8
    80201f70:	01348b63          	beq	s1,s3,80201f86 <fork+0xca>
    if(p->ofile[i])
    80201f74:	6088                	ld	a0,0(s1)
    80201f76:	d97d                	beqz	a0,80201f6c <fork+0xb0>
      np->ofile[i] = filedup(p->ofile[i]);
    80201f78:	00002097          	auipc	ra,0x2
    80201f7c:	fd2080e7          	jalr	-46(ra) # 80203f4a <filedup>
    80201f80:	00a93023          	sd	a0,0(s2)
    80201f84:	b7e5                	j	80201f6c <fork+0xb0>
  np->cwd = edup(p->cwd);
    80201f86:	158ab503          	ld	a0,344(s5)
    80201f8a:	00005097          	auipc	ra,0x5
    80201f8e:	0d4080e7          	jalr	212(ra) # 8020705e <edup>
    80201f92:	14aa3c23          	sd	a0,344(s4)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80201f96:	4641                	li	a2,16
    80201f98:	160a8593          	addi	a1,s5,352
    80201f9c:	160a0513          	addi	a0,s4,352
    80201fa0:	fffff097          	auipc	ra,0xfffff
    80201fa4:	914080e7          	jalr	-1772(ra) # 802008b4 <safestrcpy>
  pid = np->pid;
    80201fa8:	038a2483          	lw	s1,56(s4)
  np->state = RUNNABLE;
    80201fac:	4789                	li	a5,2
    80201fae:	00fa2c23          	sw	a5,24(s4)
  release(&np->lock);
    80201fb2:	8552                	mv	a0,s4
    80201fb4:	ffffe097          	auipc	ra,0xffffe
    80201fb8:	766080e7          	jalr	1894(ra) # 8020071a <release>
}
    80201fbc:	8526                	mv	a0,s1
    80201fbe:	70e2                	ld	ra,56(sp)
    80201fc0:	7442                	ld	s0,48(sp)
    80201fc2:	74a2                	ld	s1,40(sp)
    80201fc4:	7902                	ld	s2,32(sp)
    80201fc6:	69e2                	ld	s3,24(sp)
    80201fc8:	6a42                	ld	s4,16(sp)
    80201fca:	6aa2                	ld	s5,8(sp)
    80201fcc:	6121                	addi	sp,sp,64
    80201fce:	8082                	ret
    return -1;
    80201fd0:	54fd                	li	s1,-1
    80201fd2:	b7ed                	j	80201fbc <fork+0x100>

0000000080201fd4 <reparent>:
{
    80201fd4:	7179                	addi	sp,sp,-48
    80201fd6:	f406                	sd	ra,40(sp)
    80201fd8:	f022                	sd	s0,32(sp)
    80201fda:	ec26                	sd	s1,24(sp)
    80201fdc:	e84a                	sd	s2,16(sp)
    80201fde:	e44e                	sd	s3,8(sp)
    80201fe0:	e052                	sd	s4,0(sp)
    80201fe2:	1800                	addi	s0,sp,48
    80201fe4:	892a                	mv	s2,a0
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80201fe6:	00014497          	auipc	s1,0x14
    80201fea:	19a48493          	addi	s1,s1,410 # 80216180 <proc>
      pp->parent = initproc;
    80201fee:	00014a17          	auipc	s4,0x14
    80201ff2:	072a0a13          	addi	s4,s4,114 # 80216060 <pid_lock>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80201ff6:	0001c997          	auipc	s3,0x1c
    80201ffa:	4ca98993          	addi	s3,s3,1226 # 8021e4c0 <bcache>
    80201ffe:	a029                	j	80202008 <reparent+0x34>
    80202000:	2a048493          	addi	s1,s1,672
    80202004:	03348363          	beq	s1,s3,8020202a <reparent+0x56>
    if(pp->parent == p){
    80202008:	709c                	ld	a5,32(s1)
    8020200a:	ff279be3          	bne	a5,s2,80202000 <reparent+0x2c>
      acquire(&pp->lock);
    8020200e:	8526                	mv	a0,s1
    80202010:	ffffe097          	auipc	ra,0xffffe
    80202014:	6b6080e7          	jalr	1718(ra) # 802006c6 <acquire>
      pp->parent = initproc;
    80202018:	118a3783          	ld	a5,280(s4)
    8020201c:	f09c                	sd	a5,32(s1)
      release(&pp->lock);
    8020201e:	8526                	mv	a0,s1
    80202020:	ffffe097          	auipc	ra,0xffffe
    80202024:	6fa080e7          	jalr	1786(ra) # 8020071a <release>
    80202028:	bfe1                	j	80202000 <reparent+0x2c>
}
    8020202a:	70a2                	ld	ra,40(sp)
    8020202c:	7402                	ld	s0,32(sp)
    8020202e:	64e2                	ld	s1,24(sp)
    80202030:	6942                	ld	s2,16(sp)
    80202032:	69a2                	ld	s3,8(sp)
    80202034:	6a02                	ld	s4,0(sp)
    80202036:	6145                	addi	sp,sp,48
    80202038:	8082                	ret

000000008020203a <scheduler>:
{
    8020203a:	715d                	addi	sp,sp,-80
    8020203c:	e486                	sd	ra,72(sp)
    8020203e:	e0a2                	sd	s0,64(sp)
    80202040:	fc26                	sd	s1,56(sp)
    80202042:	f84a                	sd	s2,48(sp)
    80202044:	f44e                	sd	s3,40(sp)
    80202046:	f052                	sd	s4,32(sp)
    80202048:	ec56                	sd	s5,24(sp)
    8020204a:	e85a                	sd	s6,16(sp)
    8020204c:	e45e                	sd	s7,8(sp)
    8020204e:	e062                	sd	s8,0(sp)
    80202050:	0880                	addi	s0,sp,80
    80202052:	8792                	mv	a5,tp
  int id = r_tp();
    80202054:	2781                	sext.w	a5,a5
  c->proc = 0;
    80202056:	00779b13          	slli	s6,a5,0x7
    8020205a:	00014717          	auipc	a4,0x14
    8020205e:	00670713          	addi	a4,a4,6 # 80216060 <pid_lock>
    80202062:	975a                	add	a4,a4,s6
    80202064:	00073c23          	sd	zero,24(a4)
        swtch(&c->context, &p->context);
    80202068:	00014717          	auipc	a4,0x14
    8020206c:	01870713          	addi	a4,a4,24 # 80216080 <cpus+0x8>
    80202070:	9b3a                	add	s6,s6,a4
        c->proc = p;
    80202072:	079e                	slli	a5,a5,0x7
    80202074:	00014a97          	auipc	s5,0x14
    80202078:	feca8a93          	addi	s5,s5,-20 # 80216060 <pid_lock>
    8020207c:	9abe                	add	s5,s5,a5
        w_satp(MAKE_SATP(p->kpagetable));
    8020207e:	5a7d                	li	s4,-1
    80202080:	1a7e                	slli	s4,s4,0x3f
        w_satp(MAKE_SATP(kernel_pagetable));
    80202082:	0000cb97          	auipc	s7,0xc
    80202086:	c7ebbb83          	ld	s7,-898(s7) # 8020dd00 <_GLOBAL_OFFSET_TABLE_+0x48>
    8020208a:	a8a5                	j	80202102 <scheduler+0xc8>
      release(&p->lock);
    8020208c:	8526                	mv	a0,s1
    8020208e:	ffffe097          	auipc	ra,0xffffe
    80202092:	68c080e7          	jalr	1676(ra) # 8020071a <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    80202096:	2a048493          	addi	s1,s1,672
    8020209a:	05248a63          	beq	s1,s2,802020ee <scheduler+0xb4>
      acquire(&p->lock);
    8020209e:	8526                	mv	a0,s1
    802020a0:	ffffe097          	auipc	ra,0xffffe
    802020a4:	626080e7          	jalr	1574(ra) # 802006c6 <acquire>
      if(p->state == RUNNABLE) {
    802020a8:	4c9c                	lw	a5,24(s1)
    802020aa:	ff3791e3          	bne	a5,s3,8020208c <scheduler+0x52>
        p->state = RUNNING;
    802020ae:	478d                	li	a5,3
    802020b0:	cc9c                	sw	a5,24(s1)
        c->proc = p;
    802020b2:	009abc23          	sd	s1,24(s5)
        w_satp(MAKE_SATP(p->kpagetable));
    802020b6:	6cbc                	ld	a5,88(s1)
    802020b8:	83b1                	srli	a5,a5,0xc
    802020ba:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    802020be:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    802020c2:	12000073          	sfence.vma
        swtch(&c->context, &p->context);
    802020c6:	06848593          	addi	a1,s1,104
    802020ca:	855a                	mv	a0,s6
    802020cc:	00001097          	auipc	ra,0x1
    802020d0:	8ce080e7          	jalr	-1842(ra) # 8020299a <swtch>
        w_satp(MAKE_SATP(kernel_pagetable));
    802020d4:	000bb783          	ld	a5,0(s7)
    802020d8:	83b1                	srli	a5,a5,0xc
    802020da:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    802020de:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    802020e2:	12000073          	sfence.vma
        c->proc = 0;
    802020e6:	000abc23          	sd	zero,24(s5)
        found = 1;
    802020ea:	4c05                	li	s8,1
    802020ec:	b745                	j	8020208c <scheduler+0x52>
    if(found == 0) {
    802020ee:	000c1a63          	bnez	s8,80202102 <scheduler+0xc8>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802020f2:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802020f6:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802020fa:	10079073          	csrw	sstatus,a5
      asm volatile("wfi");
    802020fe:	10500073          	wfi
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202102:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202106:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020210a:	10079073          	csrw	sstatus,a5
    int found = 0;
    8020210e:	4c01                	li	s8,0
    for(p = proc; p < &proc[NPROC]; p++) {
    80202110:	00014497          	auipc	s1,0x14
    80202114:	07048493          	addi	s1,s1,112 # 80216180 <proc>
      if(p->state == RUNNABLE) {
    80202118:	4989                	li	s3,2
    for(p = proc; p < &proc[NPROC]; p++) {
    8020211a:	0001c917          	auipc	s2,0x1c
    8020211e:	3a690913          	addi	s2,s2,934 # 8021e4c0 <bcache>
    80202122:	bfb5                	j	8020209e <scheduler+0x64>

0000000080202124 <sched>:
{
    80202124:	7179                	addi	sp,sp,-48
    80202126:	f406                	sd	ra,40(sp)
    80202128:	f022                	sd	s0,32(sp)
    8020212a:	ec26                	sd	s1,24(sp)
    8020212c:	e84a                	sd	s2,16(sp)
    8020212e:	e44e                	sd	s3,8(sp)
    80202130:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202132:	00000097          	auipc	ra,0x0
    80202136:	984080e7          	jalr	-1660(ra) # 80201ab6 <myproc>
    8020213a:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    8020213c:	ffffe097          	auipc	ra,0xffffe
    80202140:	55c080e7          	jalr	1372(ra) # 80200698 <holding>
    80202144:	c949                	beqz	a0,802021d6 <sched+0xb2>
  asm volatile("mv %0, tp" : "=r" (x) );
    80202146:	8792                	mv	a5,tp
  if(mycpu()->noff != 1)
    80202148:	2781                	sext.w	a5,a5
    8020214a:	079e                	slli	a5,a5,0x7
    8020214c:	00014717          	auipc	a4,0x14
    80202150:	f1470713          	addi	a4,a4,-236 # 80216060 <pid_lock>
    80202154:	97ba                	add	a5,a5,a4
    80202156:	0907a703          	lw	a4,144(a5)
    8020215a:	4785                	li	a5,1
    8020215c:	08f71563          	bne	a4,a5,802021e6 <sched+0xc2>
  if(p->state == RUNNING)
    80202160:	4c98                	lw	a4,24(s1)
    80202162:	478d                	li	a5,3
    80202164:	08f70963          	beq	a4,a5,802021f6 <sched+0xd2>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202168:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    8020216c:	8b89                	andi	a5,a5,2
  if(intr_get())
    8020216e:	efc1                	bnez	a5,80202206 <sched+0xe2>
  asm volatile("rdtime %0" : "=r" (x) );
    80202170:	c0102773          	rdtime	a4
  p->proc_tms.stime += r_time() - p->kernel_timestamp; // Proc stopped
    80202174:	2784b783          	ld	a5,632(s1)
    80202178:	2984b683          	ld	a3,664(s1)
    8020217c:	8f95                	sub	a5,a5,a3
    8020217e:	97ba                	add	a5,a5,a4
    80202180:	26f4bc23          	sd	a5,632(s1)
  asm volatile("mv %0, tp" : "=r" (x) );
    80202184:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    80202186:	00014917          	auipc	s2,0x14
    8020218a:	eda90913          	addi	s2,s2,-294 # 80216060 <pid_lock>
    8020218e:	2781                	sext.w	a5,a5
    80202190:	079e                	slli	a5,a5,0x7
    80202192:	97ca                	add	a5,a5,s2
    80202194:	0947a983          	lw	s3,148(a5)
    80202198:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    8020219a:	2781                	sext.w	a5,a5
    8020219c:	079e                	slli	a5,a5,0x7
    8020219e:	00014597          	auipc	a1,0x14
    802021a2:	ee258593          	addi	a1,a1,-286 # 80216080 <cpus+0x8>
    802021a6:	95be                	add	a1,a1,a5
    802021a8:	06848513          	addi	a0,s1,104
    802021ac:	00000097          	auipc	ra,0x0
    802021b0:	7ee080e7          	jalr	2030(ra) # 8020299a <swtch>
    802021b4:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    802021b6:	2781                	sext.w	a5,a5
    802021b8:	079e                	slli	a5,a5,0x7
    802021ba:	993e                	add	s2,s2,a5
    802021bc:	09392a23          	sw	s3,148(s2)
  asm volatile("rdtime %0" : "=r" (x) );
    802021c0:	c01027f3          	rdtime	a5
  p->kernel_timestamp = r_time(); // Proc continued
    802021c4:	28f4bc23          	sd	a5,664(s1)
}
    802021c8:	70a2                	ld	ra,40(sp)
    802021ca:	7402                	ld	s0,32(sp)
    802021cc:	64e2                	ld	s1,24(sp)
    802021ce:	6942                	ld	s2,16(sp)
    802021d0:	69a2                	ld	s3,8(sp)
    802021d2:	6145                	addi	sp,sp,48
    802021d4:	8082                	ret
    panic("sched p->lock");
    802021d6:	00008517          	auipc	a0,0x8
    802021da:	47250513          	addi	a0,a0,1138 # 8020a648 <digits+0x2c8>
    802021de:	ffffe097          	auipc	ra,0xffffe
    802021e2:	f66080e7          	jalr	-154(ra) # 80200144 <panic>
    panic("sched locks");
    802021e6:	00008517          	auipc	a0,0x8
    802021ea:	47250513          	addi	a0,a0,1138 # 8020a658 <digits+0x2d8>
    802021ee:	ffffe097          	auipc	ra,0xffffe
    802021f2:	f56080e7          	jalr	-170(ra) # 80200144 <panic>
    panic("sched running");
    802021f6:	00008517          	auipc	a0,0x8
    802021fa:	47250513          	addi	a0,a0,1138 # 8020a668 <digits+0x2e8>
    802021fe:	ffffe097          	auipc	ra,0xffffe
    80202202:	f46080e7          	jalr	-186(ra) # 80200144 <panic>
    panic("sched interruptible");
    80202206:	00008517          	auipc	a0,0x8
    8020220a:	47250513          	addi	a0,a0,1138 # 8020a678 <digits+0x2f8>
    8020220e:	ffffe097          	auipc	ra,0xffffe
    80202212:	f36080e7          	jalr	-202(ra) # 80200144 <panic>

0000000080202216 <exit>:
{
    80202216:	7179                	addi	sp,sp,-48
    80202218:	f406                	sd	ra,40(sp)
    8020221a:	f022                	sd	s0,32(sp)
    8020221c:	ec26                	sd	s1,24(sp)
    8020221e:	e84a                	sd	s2,16(sp)
    80202220:	e44e                	sd	s3,8(sp)
    80202222:	e052                	sd	s4,0(sp)
    80202224:	1800                	addi	s0,sp,48
    80202226:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    80202228:	00000097          	auipc	ra,0x0
    8020222c:	88e080e7          	jalr	-1906(ra) # 80201ab6 <myproc>
    80202230:	89aa                	mv	s3,a0
  if (status == -1 && p == initproc){
    80202232:	57fd                	li	a5,-1
    80202234:	00fa0d63          	beq	s4,a5,8020224e <exit+0x38>
  if(p == initproc)
    80202238:	00014797          	auipc	a5,0x14
    8020223c:	f407b783          	ld	a5,-192(a5) # 80216178 <initproc>
    80202240:	03378563          	beq	a5,s3,8020226a <exit+0x54>
  for(int fd = 0; fd < NOFILE; fd++){
    80202244:	0d898493          	addi	s1,s3,216
    80202248:	15898913          	addi	s2,s3,344
    8020224c:	a081                	j	8020228c <exit+0x76>
  if (status == -1 && p == initproc){
    8020224e:	00014797          	auipc	a5,0x14
    80202252:	f2a7b783          	ld	a5,-214(a5) # 80216178 <initproc>
    80202256:	fea797e3          	bne	a5,a0,80202244 <exit+0x2e>
	SBI_CALL_0(SBI_SHUTDOWN);
    8020225a:	4501                	li	a0,0
    8020225c:	4581                	li	a1,0
    8020225e:	4601                	li	a2,0
    80202260:	4681                	li	a3,0
    80202262:	48a1                	li	a7,8
    80202264:	00000073          	ecall
}
    80202268:	bfc1                	j	80202238 <exit+0x22>
    panic("initexiting");
    8020226a:	00008517          	auipc	a0,0x8
    8020226e:	42650513          	addi	a0,a0,1062 # 8020a690 <digits+0x310>
    80202272:	ffffe097          	auipc	ra,0xffffe
    80202276:	ed2080e7          	jalr	-302(ra) # 80200144 <panic>
      fileclose(f);
    8020227a:	00002097          	auipc	ra,0x2
    8020227e:	d22080e7          	jalr	-734(ra) # 80203f9c <fileclose>
      p->ofile[fd] = 0;
    80202282:	0004b023          	sd	zero,0(s1)
  for(int fd = 0; fd < NOFILE; fd++){
    80202286:	04a1                	addi	s1,s1,8
    80202288:	01248563          	beq	s1,s2,80202292 <exit+0x7c>
    if(p->ofile[fd]){
    8020228c:	6088                	ld	a0,0(s1)
    8020228e:	f575                	bnez	a0,8020227a <exit+0x64>
    80202290:	bfdd                	j	80202286 <exit+0x70>
  eput(p->cwd);
    80202292:	1589b503          	ld	a0,344(s3)
    80202296:	00005097          	auipc	ra,0x5
    8020229a:	0aa080e7          	jalr	170(ra) # 80207340 <eput>
  p->cwd = 0;
    8020229e:	1409bc23          	sd	zero,344(s3)
  acquire(&initproc->lock);
    802022a2:	00014497          	auipc	s1,0x14
    802022a6:	dbe48493          	addi	s1,s1,-578 # 80216060 <pid_lock>
    802022aa:	1184b503          	ld	a0,280(s1)
    802022ae:	ffffe097          	auipc	ra,0xffffe
    802022b2:	418080e7          	jalr	1048(ra) # 802006c6 <acquire>
  wakeup1(initproc);
    802022b6:	1184b503          	ld	a0,280(s1)
    802022ba:	fffff097          	auipc	ra,0xfffff
    802022be:	610080e7          	jalr	1552(ra) # 802018ca <wakeup1>
  release(&initproc->lock);
    802022c2:	1184b503          	ld	a0,280(s1)
    802022c6:	ffffe097          	auipc	ra,0xffffe
    802022ca:	454080e7          	jalr	1108(ra) # 8020071a <release>
  acquire(&p->lock);
    802022ce:	854e                	mv	a0,s3
    802022d0:	ffffe097          	auipc	ra,0xffffe
    802022d4:	3f6080e7          	jalr	1014(ra) # 802006c6 <acquire>
  struct proc *original_parent = p->parent;
    802022d8:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    802022dc:	854e                	mv	a0,s3
    802022de:	ffffe097          	auipc	ra,0xffffe
    802022e2:	43c080e7          	jalr	1084(ra) # 8020071a <release>
  acquire(&original_parent->lock);
    802022e6:	8526                	mv	a0,s1
    802022e8:	ffffe097          	auipc	ra,0xffffe
    802022ec:	3de080e7          	jalr	990(ra) # 802006c6 <acquire>
  acquire(&p->lock);
    802022f0:	854e                	mv	a0,s3
    802022f2:	ffffe097          	auipc	ra,0xffffe
    802022f6:	3d4080e7          	jalr	980(ra) # 802006c6 <acquire>
  reparent(p);
    802022fa:	854e                	mv	a0,s3
    802022fc:	00000097          	auipc	ra,0x0
    80202300:	cd8080e7          	jalr	-808(ra) # 80201fd4 <reparent>
  wakeup1(original_parent);
    80202304:	8526                	mv	a0,s1
    80202306:	fffff097          	auipc	ra,0xfffff
    8020230a:	5c4080e7          	jalr	1476(ra) # 802018ca <wakeup1>
  p->xstate = status;
    8020230e:	0349aa23          	sw	s4,52(s3)
  p->state = ZOMBIE;
    80202312:	4791                	li	a5,4
    80202314:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    80202318:	8526                	mv	a0,s1
    8020231a:	ffffe097          	auipc	ra,0xffffe
    8020231e:	400080e7          	jalr	1024(ra) # 8020071a <release>
  sched();
    80202322:	00000097          	auipc	ra,0x0
    80202326:	e02080e7          	jalr	-510(ra) # 80202124 <sched>
  panic("zombie exit");
    8020232a:	00008517          	auipc	a0,0x8
    8020232e:	37650513          	addi	a0,a0,886 # 8020a6a0 <digits+0x320>
    80202332:	ffffe097          	auipc	ra,0xffffe
    80202336:	e12080e7          	jalr	-494(ra) # 80200144 <panic>

000000008020233a <yield>:
{
    8020233a:	1101                	addi	sp,sp,-32
    8020233c:	ec06                	sd	ra,24(sp)
    8020233e:	e822                	sd	s0,16(sp)
    80202340:	e426                	sd	s1,8(sp)
    80202342:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    80202344:	fffff097          	auipc	ra,0xfffff
    80202348:	772080e7          	jalr	1906(ra) # 80201ab6 <myproc>
    8020234c:	84aa                	mv	s1,a0
  acquire(&p->lock);
    8020234e:	ffffe097          	auipc	ra,0xffffe
    80202352:	378080e7          	jalr	888(ra) # 802006c6 <acquire>
  p->state = RUNNABLE;
    80202356:	4789                	li	a5,2
    80202358:	cc9c                	sw	a5,24(s1)
  sched();
    8020235a:	00000097          	auipc	ra,0x0
    8020235e:	dca080e7          	jalr	-566(ra) # 80202124 <sched>
  release(&p->lock);
    80202362:	8526                	mv	a0,s1
    80202364:	ffffe097          	auipc	ra,0xffffe
    80202368:	3b6080e7          	jalr	950(ra) # 8020071a <release>
}
    8020236c:	60e2                	ld	ra,24(sp)
    8020236e:	6442                	ld	s0,16(sp)
    80202370:	64a2                	ld	s1,8(sp)
    80202372:	6105                	addi	sp,sp,32
    80202374:	8082                	ret

0000000080202376 <sleep>:
{
    80202376:	7179                	addi	sp,sp,-48
    80202378:	f406                	sd	ra,40(sp)
    8020237a:	f022                	sd	s0,32(sp)
    8020237c:	ec26                	sd	s1,24(sp)
    8020237e:	e84a                	sd	s2,16(sp)
    80202380:	e44e                	sd	s3,8(sp)
    80202382:	1800                	addi	s0,sp,48
    80202384:	89aa                	mv	s3,a0
    80202386:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202388:	fffff097          	auipc	ra,0xfffff
    8020238c:	72e080e7          	jalr	1838(ra) # 80201ab6 <myproc>
    80202390:	84aa                	mv	s1,a0
  if(lk != &p->lock){  //DOC: sleeplock0
    80202392:	05250663          	beq	a0,s2,802023de <sleep+0x68>
    acquire(&p->lock);  //DOC: sleeplock1
    80202396:	ffffe097          	auipc	ra,0xffffe
    8020239a:	330080e7          	jalr	816(ra) # 802006c6 <acquire>
    release(lk);
    8020239e:	854a                	mv	a0,s2
    802023a0:	ffffe097          	auipc	ra,0xffffe
    802023a4:	37a080e7          	jalr	890(ra) # 8020071a <release>
  p->chan = chan;
    802023a8:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    802023ac:	4785                	li	a5,1
    802023ae:	cc9c                	sw	a5,24(s1)
  sched();
    802023b0:	00000097          	auipc	ra,0x0
    802023b4:	d74080e7          	jalr	-652(ra) # 80202124 <sched>
  p->chan = 0;
    802023b8:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    802023bc:	8526                	mv	a0,s1
    802023be:	ffffe097          	auipc	ra,0xffffe
    802023c2:	35c080e7          	jalr	860(ra) # 8020071a <release>
    acquire(lk);
    802023c6:	854a                	mv	a0,s2
    802023c8:	ffffe097          	auipc	ra,0xffffe
    802023cc:	2fe080e7          	jalr	766(ra) # 802006c6 <acquire>
}
    802023d0:	70a2                	ld	ra,40(sp)
    802023d2:	7402                	ld	s0,32(sp)
    802023d4:	64e2                	ld	s1,24(sp)
    802023d6:	6942                	ld	s2,16(sp)
    802023d8:	69a2                	ld	s3,8(sp)
    802023da:	6145                	addi	sp,sp,48
    802023dc:	8082                	ret
  p->chan = chan;
    802023de:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    802023e2:	4785                	li	a5,1
    802023e4:	cd1c                	sw	a5,24(a0)
  sched();
    802023e6:	00000097          	auipc	ra,0x0
    802023ea:	d3e080e7          	jalr	-706(ra) # 80202124 <sched>
  p->chan = 0;
    802023ee:	0204b423          	sd	zero,40(s1)
  if(lk != &p->lock){
    802023f2:	bff9                	j	802023d0 <sleep+0x5a>

00000000802023f4 <wait>:
{
    802023f4:	715d                	addi	sp,sp,-80
    802023f6:	e486                	sd	ra,72(sp)
    802023f8:	e0a2                	sd	s0,64(sp)
    802023fa:	fc26                	sd	s1,56(sp)
    802023fc:	f84a                	sd	s2,48(sp)
    802023fe:	f44e                	sd	s3,40(sp)
    80202400:	f052                	sd	s4,32(sp)
    80202402:	ec56                	sd	s5,24(sp)
    80202404:	e85a                	sd	s6,16(sp)
    80202406:	e45e                	sd	s7,8(sp)
    80202408:	0880                	addi	s0,sp,80
    8020240a:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
    8020240c:	fffff097          	auipc	ra,0xfffff
    80202410:	6aa080e7          	jalr	1706(ra) # 80201ab6 <myproc>
    80202414:	892a                	mv	s2,a0
  acquire(&p->lock);
    80202416:	ffffe097          	auipc	ra,0xffffe
    8020241a:	2b0080e7          	jalr	688(ra) # 802006c6 <acquire>
    havekids = 0;
    8020241e:	4b81                	li	s7,0
        if(np->state == ZOMBIE){
    80202420:	4a11                	li	s4,4
        havekids = 1;
    80202422:	4a85                	li	s5,1
    for(np = proc; np < &proc[NPROC]; np++){
    80202424:	0001c997          	auipc	s3,0x1c
    80202428:	09c98993          	addi	s3,s3,156 # 8021e4c0 <bcache>
    havekids = 0;
    8020242c:	875e                	mv	a4,s7
    for(np = proc; np < &proc[NPROC]; np++){
    8020242e:	00014497          	auipc	s1,0x14
    80202432:	d5248493          	addi	s1,s1,-686 # 80216180 <proc>
    80202436:	a8b9                	j	80202494 <wait+0xa0>
          pid = np->pid;
    80202438:	0384a983          	lw	s3,56(s1)
          if(addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0) {
    8020243c:	000b0c63          	beqz	s6,80202454 <wait+0x60>
    80202440:	4611                	li	a2,4
    80202442:	03448593          	addi	a1,s1,52
    80202446:	855a                	mv	a0,s6
    80202448:	fffff097          	auipc	ra,0xfffff
    8020244c:	f2a080e7          	jalr	-214(ra) # 80201372 <copyout2>
    80202450:	02054263          	bltz	a0,80202474 <wait+0x80>
          freeproc(np);
    80202454:	8526                	mv	a0,s1
    80202456:	00000097          	auipc	ra,0x0
    8020245a:	832080e7          	jalr	-1998(ra) # 80201c88 <freeproc>
          release(&np->lock);
    8020245e:	8526                	mv	a0,s1
    80202460:	ffffe097          	auipc	ra,0xffffe
    80202464:	2ba080e7          	jalr	698(ra) # 8020071a <release>
          release(&p->lock);
    80202468:	854a                	mv	a0,s2
    8020246a:	ffffe097          	auipc	ra,0xffffe
    8020246e:	2b0080e7          	jalr	688(ra) # 8020071a <release>
          return pid;
    80202472:	a8a9                	j	802024cc <wait+0xd8>
            release(&np->lock);
    80202474:	8526                	mv	a0,s1
    80202476:	ffffe097          	auipc	ra,0xffffe
    8020247a:	2a4080e7          	jalr	676(ra) # 8020071a <release>
            release(&p->lock);
    8020247e:	854a                	mv	a0,s2
    80202480:	ffffe097          	auipc	ra,0xffffe
    80202484:	29a080e7          	jalr	666(ra) # 8020071a <release>
            return -1;
    80202488:	59fd                	li	s3,-1
    8020248a:	a089                	j	802024cc <wait+0xd8>
    for(np = proc; np < &proc[NPROC]; np++){
    8020248c:	2a048493          	addi	s1,s1,672
    80202490:	03348463          	beq	s1,s3,802024b8 <wait+0xc4>
      if(np->parent == p){
    80202494:	709c                	ld	a5,32(s1)
    80202496:	ff279be3          	bne	a5,s2,8020248c <wait+0x98>
        acquire(&np->lock);
    8020249a:	8526                	mv	a0,s1
    8020249c:	ffffe097          	auipc	ra,0xffffe
    802024a0:	22a080e7          	jalr	554(ra) # 802006c6 <acquire>
        if(np->state == ZOMBIE){
    802024a4:	4c9c                	lw	a5,24(s1)
    802024a6:	f94789e3          	beq	a5,s4,80202438 <wait+0x44>
        release(&np->lock);
    802024aa:	8526                	mv	a0,s1
    802024ac:	ffffe097          	auipc	ra,0xffffe
    802024b0:	26e080e7          	jalr	622(ra) # 8020071a <release>
        havekids = 1;
    802024b4:	8756                	mv	a4,s5
    802024b6:	bfd9                	j	8020248c <wait+0x98>
    if(!havekids || p->killed){
    802024b8:	c701                	beqz	a4,802024c0 <wait+0xcc>
    802024ba:	03092783          	lw	a5,48(s2)
    802024be:	c39d                	beqz	a5,802024e4 <wait+0xf0>
      release(&p->lock);
    802024c0:	854a                	mv	a0,s2
    802024c2:	ffffe097          	auipc	ra,0xffffe
    802024c6:	258080e7          	jalr	600(ra) # 8020071a <release>
      return -1;
    802024ca:	59fd                	li	s3,-1
}
    802024cc:	854e                	mv	a0,s3
    802024ce:	60a6                	ld	ra,72(sp)
    802024d0:	6406                	ld	s0,64(sp)
    802024d2:	74e2                	ld	s1,56(sp)
    802024d4:	7942                	ld	s2,48(sp)
    802024d6:	79a2                	ld	s3,40(sp)
    802024d8:	7a02                	ld	s4,32(sp)
    802024da:	6ae2                	ld	s5,24(sp)
    802024dc:	6b42                	ld	s6,16(sp)
    802024de:	6ba2                	ld	s7,8(sp)
    802024e0:	6161                	addi	sp,sp,80
    802024e2:	8082                	ret
    sleep(p, &p->lock);  //DOC: wait-sleep
    802024e4:	85ca                	mv	a1,s2
    802024e6:	854a                	mv	a0,s2
    802024e8:	00000097          	auipc	ra,0x0
    802024ec:	e8e080e7          	jalr	-370(ra) # 80202376 <sleep>
    havekids = 0;
    802024f0:	bf35                	j	8020242c <wait+0x38>

00000000802024f2 <wakeup>:
{
    802024f2:	7139                	addi	sp,sp,-64
    802024f4:	fc06                	sd	ra,56(sp)
    802024f6:	f822                	sd	s0,48(sp)
    802024f8:	f426                	sd	s1,40(sp)
    802024fa:	f04a                	sd	s2,32(sp)
    802024fc:	ec4e                	sd	s3,24(sp)
    802024fe:	e852                	sd	s4,16(sp)
    80202500:	e456                	sd	s5,8(sp)
    80202502:	0080                	addi	s0,sp,64
    80202504:	8a2a                	mv	s4,a0
  for(p = proc; p < &proc[NPROC]; p++) {
    80202506:	00014497          	auipc	s1,0x14
    8020250a:	c7a48493          	addi	s1,s1,-902 # 80216180 <proc>
    if(p->state == SLEEPING && p->chan == chan) {
    8020250e:	4985                	li	s3,1
      p->state = RUNNABLE;
    80202510:	4a89                	li	s5,2
  for(p = proc; p < &proc[NPROC]; p++) {
    80202512:	0001c917          	auipc	s2,0x1c
    80202516:	fae90913          	addi	s2,s2,-82 # 8021e4c0 <bcache>
    8020251a:	a811                	j	8020252e <wakeup+0x3c>
    release(&p->lock);
    8020251c:	8526                	mv	a0,s1
    8020251e:	ffffe097          	auipc	ra,0xffffe
    80202522:	1fc080e7          	jalr	508(ra) # 8020071a <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80202526:	2a048493          	addi	s1,s1,672
    8020252a:	03248063          	beq	s1,s2,8020254a <wakeup+0x58>
    acquire(&p->lock);
    8020252e:	8526                	mv	a0,s1
    80202530:	ffffe097          	auipc	ra,0xffffe
    80202534:	196080e7          	jalr	406(ra) # 802006c6 <acquire>
    if(p->state == SLEEPING && p->chan == chan) {
    80202538:	4c9c                	lw	a5,24(s1)
    8020253a:	ff3791e3          	bne	a5,s3,8020251c <wakeup+0x2a>
    8020253e:	749c                	ld	a5,40(s1)
    80202540:	fd479ee3          	bne	a5,s4,8020251c <wakeup+0x2a>
      p->state = RUNNABLE;
    80202544:	0154ac23          	sw	s5,24(s1)
    80202548:	bfd1                	j	8020251c <wakeup+0x2a>
}
    8020254a:	70e2                	ld	ra,56(sp)
    8020254c:	7442                	ld	s0,48(sp)
    8020254e:	74a2                	ld	s1,40(sp)
    80202550:	7902                	ld	s2,32(sp)
    80202552:	69e2                	ld	s3,24(sp)
    80202554:	6a42                	ld	s4,16(sp)
    80202556:	6aa2                	ld	s5,8(sp)
    80202558:	6121                	addi	sp,sp,64
    8020255a:	8082                	ret

000000008020255c <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    8020255c:	7179                	addi	sp,sp,-48
    8020255e:	f406                	sd	ra,40(sp)
    80202560:	f022                	sd	s0,32(sp)
    80202562:	ec26                	sd	s1,24(sp)
    80202564:	e84a                	sd	s2,16(sp)
    80202566:	e44e                	sd	s3,8(sp)
    80202568:	1800                	addi	s0,sp,48
    8020256a:	892a                	mv	s2,a0
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    8020256c:	00014497          	auipc	s1,0x14
    80202570:	c1448493          	addi	s1,s1,-1004 # 80216180 <proc>
    80202574:	0001c997          	auipc	s3,0x1c
    80202578:	f4c98993          	addi	s3,s3,-180 # 8021e4c0 <bcache>
    acquire(&p->lock);
    8020257c:	8526                	mv	a0,s1
    8020257e:	ffffe097          	auipc	ra,0xffffe
    80202582:	148080e7          	jalr	328(ra) # 802006c6 <acquire>
    if(p->pid == pid){
    80202586:	5c9c                	lw	a5,56(s1)
    80202588:	01278d63          	beq	a5,s2,802025a2 <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    8020258c:	8526                	mv	a0,s1
    8020258e:	ffffe097          	auipc	ra,0xffffe
    80202592:	18c080e7          	jalr	396(ra) # 8020071a <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80202596:	2a048493          	addi	s1,s1,672
    8020259a:	ff3491e3          	bne	s1,s3,8020257c <kill+0x20>
  }
  return -1;
    8020259e:	557d                	li	a0,-1
    802025a0:	a821                	j	802025b8 <kill+0x5c>
      p->killed = 1;
    802025a2:	4785                	li	a5,1
    802025a4:	d89c                	sw	a5,48(s1)
      if(p->state == SLEEPING){
    802025a6:	4c98                	lw	a4,24(s1)
    802025a8:	00f70f63          	beq	a4,a5,802025c6 <kill+0x6a>
      release(&p->lock);
    802025ac:	8526                	mv	a0,s1
    802025ae:	ffffe097          	auipc	ra,0xffffe
    802025b2:	16c080e7          	jalr	364(ra) # 8020071a <release>
      return 0;
    802025b6:	4501                	li	a0,0
}
    802025b8:	70a2                	ld	ra,40(sp)
    802025ba:	7402                	ld	s0,32(sp)
    802025bc:	64e2                	ld	s1,24(sp)
    802025be:	6942                	ld	s2,16(sp)
    802025c0:	69a2                	ld	s3,8(sp)
    802025c2:	6145                	addi	sp,sp,48
    802025c4:	8082                	ret
        p->state = RUNNABLE;
    802025c6:	4789                	li	a5,2
    802025c8:	cc9c                	sw	a5,24(s1)
    802025ca:	b7cd                	j	802025ac <kill+0x50>

00000000802025cc <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    802025cc:	1101                	addi	sp,sp,-32
    802025ce:	ec06                	sd	ra,24(sp)
    802025d0:	e822                	sd	s0,16(sp)
    802025d2:	e426                	sd	s1,8(sp)
    802025d4:	1000                	addi	s0,sp,32
    802025d6:	84aa                	mv	s1,a0
    802025d8:	852e                	mv	a0,a1
    802025da:	85b2                	mv	a1,a2
    802025dc:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_dst){
    802025de:	c891                	beqz	s1,802025f2 <either_copyout+0x26>
    // return copyout(p->pagetable, dst, src, len);
    return copyout2(dst, src, len);
    802025e0:	fffff097          	auipc	ra,0xfffff
    802025e4:	d92080e7          	jalr	-622(ra) # 80201372 <copyout2>
  } else {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    802025e8:	60e2                	ld	ra,24(sp)
    802025ea:	6442                	ld	s0,16(sp)
    802025ec:	64a2                	ld	s1,8(sp)
    802025ee:	6105                	addi	sp,sp,32
    802025f0:	8082                	ret
    memmove((char *)dst, src, len);
    802025f2:	0006861b          	sext.w	a2,a3
    802025f6:	ffffe097          	auipc	ra,0xffffe
    802025fa:	1c8080e7          	jalr	456(ra) # 802007be <memmove>
    return 0;
    802025fe:	8526                	mv	a0,s1
    80202600:	b7e5                	j	802025e8 <either_copyout+0x1c>

0000000080202602 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80202602:	1101                	addi	sp,sp,-32
    80202604:	ec06                	sd	ra,24(sp)
    80202606:	e822                	sd	s0,16(sp)
    80202608:	e426                	sd	s1,8(sp)
    8020260a:	1000                	addi	s0,sp,32
    8020260c:	84ae                	mv	s1,a1
    8020260e:	85b2                	mv	a1,a2
    80202610:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_src){
    80202612:	c891                	beqz	s1,80202626 <either_copyin+0x24>
    // return copyin(p->pagetable, dst, src, len);
    return copyin2(dst, src, len);
    80202614:	fffff097          	auipc	ra,0xfffff
    80202618:	e90080e7          	jalr	-368(ra) # 802014a4 <copyin2>
  } else {
    memmove(dst, (char*)src, len);
    return 0;
  }
}
    8020261c:	60e2                	ld	ra,24(sp)
    8020261e:	6442                	ld	s0,16(sp)
    80202620:	64a2                	ld	s1,8(sp)
    80202622:	6105                	addi	sp,sp,32
    80202624:	8082                	ret
    memmove(dst, (char*)src, len);
    80202626:	0006861b          	sext.w	a2,a3
    8020262a:	ffffe097          	auipc	ra,0xffffe
    8020262e:	194080e7          	jalr	404(ra) # 802007be <memmove>
    return 0;
    80202632:	8526                	mv	a0,s1
    80202634:	b7e5                	j	8020261c <either_copyin+0x1a>

0000000080202636 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80202636:	715d                	addi	sp,sp,-80
    80202638:	e486                	sd	ra,72(sp)
    8020263a:	e0a2                	sd	s0,64(sp)
    8020263c:	fc26                	sd	s1,56(sp)
    8020263e:	f84a                	sd	s2,48(sp)
    80202640:	f44e                	sd	s3,40(sp)
    80202642:	f052                	sd	s4,32(sp)
    80202644:	ec56                	sd	s5,24(sp)
    80202646:	e85a                	sd	s6,16(sp)
    80202648:	e45e                	sd	s7,8(sp)
    8020264a:	0880                	addi	s0,sp,80
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    8020264c:	00008517          	auipc	a0,0x8
    80202650:	06c50513          	addi	a0,a0,108 # 8020a6b8 <digits+0x338>
    80202654:	ffffe097          	auipc	ra,0xffffe
    80202658:	b3a080e7          	jalr	-1222(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    8020265c:	00014497          	auipc	s1,0x14
    80202660:	c8448493          	addi	s1,s1,-892 # 802162e0 <proc+0x160>
    80202664:	0001c917          	auipc	s2,0x1c
    80202668:	fbc90913          	addi	s2,s2,-68 # 8021e620 <bcache+0x160>
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    8020266c:	4b11                	li	s6,4
      state = states[p->state];
    else
      state = "???";
    8020266e:	00008997          	auipc	s3,0x8
    80202672:	04298993          	addi	s3,s3,66 # 8020a6b0 <digits+0x330>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    80202676:	00008a97          	auipc	s5,0x8
    8020267a:	05aa8a93          	addi	s5,s5,90 # 8020a6d0 <digits+0x350>
    printf("\n");
    8020267e:	00008a17          	auipc	s4,0x8
    80202682:	a5aa0a13          	addi	s4,s4,-1446 # 8020a0d8 <etext+0xd8>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80202686:	0000ab97          	auipc	s7,0xa
    8020268a:	5a2b8b93          	addi	s7,s7,1442 # 8020cc28 <states.0>
    8020268e:	a01d                	j	802026b4 <procdump+0x7e>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    80202690:	ee86b703          	ld	a4,-280(a3)
    80202694:	ed86a583          	lw	a1,-296(a3)
    80202698:	8556                	mv	a0,s5
    8020269a:	ffffe097          	auipc	ra,0xffffe
    8020269e:	af4080e7          	jalr	-1292(ra) # 8020018e <printf>
    printf("\n");
    802026a2:	8552                	mv	a0,s4
    802026a4:	ffffe097          	auipc	ra,0xffffe
    802026a8:	aea080e7          	jalr	-1302(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    802026ac:	2a048493          	addi	s1,s1,672
    802026b0:	03248263          	beq	s1,s2,802026d4 <procdump+0x9e>
    if(p->state == UNUSED)
    802026b4:	86a6                	mv	a3,s1
    802026b6:	eb84a783          	lw	a5,-328(s1)
    802026ba:	dbed                	beqz	a5,802026ac <procdump+0x76>
      state = "???";
    802026bc:	864e                	mv	a2,s3
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802026be:	fcfb69e3          	bltu	s6,a5,80202690 <procdump+0x5a>
    802026c2:	02079713          	slli	a4,a5,0x20
    802026c6:	01d75793          	srli	a5,a4,0x1d
    802026ca:	97de                	add	a5,a5,s7
    802026cc:	6390                	ld	a2,0(a5)
    802026ce:	f269                	bnez	a2,80202690 <procdump+0x5a>
      state = "???";
    802026d0:	864e                	mv	a2,s3
    802026d2:	bf7d                	j	80202690 <procdump+0x5a>
  }
}
    802026d4:	60a6                	ld	ra,72(sp)
    802026d6:	6406                	ld	s0,64(sp)
    802026d8:	74e2                	ld	s1,56(sp)
    802026da:	7942                	ld	s2,48(sp)
    802026dc:	79a2                	ld	s3,40(sp)
    802026de:	7a02                	ld	s4,32(sp)
    802026e0:	6ae2                	ld	s5,24(sp)
    802026e2:	6b42                	ld	s6,16(sp)
    802026e4:	6ba2                	ld	s7,8(sp)
    802026e6:	6161                	addi	sp,sp,80
    802026e8:	8082                	ret

00000000802026ea <procnum>:

uint64
procnum(void)
{
    802026ea:	1141                	addi	sp,sp,-16
    802026ec:	e422                	sd	s0,8(sp)
    802026ee:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++) {
    802026f0:	00014797          	auipc	a5,0x14
    802026f4:	a9078793          	addi	a5,a5,-1392 # 80216180 <proc>
  int num = 0;
    802026f8:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++) {
    802026fa:	0001c697          	auipc	a3,0x1c
    802026fe:	dc668693          	addi	a3,a3,-570 # 8021e4c0 <bcache>
    80202702:	a029                	j	8020270c <procnum+0x22>
    80202704:	2a078793          	addi	a5,a5,672
    80202708:	00d78663          	beq	a5,a3,80202714 <procnum+0x2a>
    if (p->state != UNUSED) {
    8020270c:	4f98                	lw	a4,24(a5)
    8020270e:	db7d                	beqz	a4,80202704 <procnum+0x1a>
      num++;
    80202710:	2505                	addiw	a0,a0,1
    80202712:	bfcd                	j	80202704 <procnum+0x1a>
    }
  }

  return num;
}
    80202714:	6422                	ld	s0,8(sp)
    80202716:	0141                	addi	sp,sp,16
    80202718:	8082                	ret

000000008020271a <clone>:

/////////////////////////////////////


int clone(uint64 flag, uint64 stack) {
    8020271a:	7139                	addi	sp,sp,-64
    8020271c:	fc06                	sd	ra,56(sp)
    8020271e:	f822                	sd	s0,48(sp)
    80202720:	f426                	sd	s1,40(sp)
    80202722:	f04a                	sd	s2,32(sp)
    80202724:	ec4e                	sd	s3,24(sp)
    80202726:	e852                	sd	s4,16(sp)
    80202728:	e456                	sd	s5,8(sp)
    8020272a:	0080                	addi	s0,sp,64
    8020272c:	84ae                	mv	s1,a1
	int i, pid;
  struct proc *parent;
  struct proc *child = myproc();
    8020272e:	fffff097          	auipc	ra,0xfffff
    80202732:	388080e7          	jalr	904(ra) # 80201ab6 <myproc>
    80202736:	8aaa                	mv	s5,a0

  // Allocate process.
  if((parent = allocproc()) == NULL){
    80202738:	fffff097          	auipc	ra,0xfffff
    8020273c:	5ba080e7          	jalr	1466(ra) # 80201cf2 <allocproc>
    80202740:	cd3d                	beqz	a0,802027be <clone+0xa4>
    80202742:	89aa                	mv	s3,a0
    printf("?\n");
    return -1;
  }
  
  // Copy user memory from parent to child.
  if(uvmcopy(child->pagetable, parent->pagetable, parent->kpagetable, child->sz) < 0){
    80202744:	048ab683          	ld	a3,72(s5)
    80202748:	6d30                	ld	a2,88(a0)
    8020274a:	692c                	ld	a1,80(a0)
    8020274c:	050ab503          	ld	a0,80(s5)
    80202750:	fffff097          	auipc	ra,0xfffff
    80202754:	a56080e7          	jalr	-1450(ra) # 802011a6 <uvmcopy>
    80202758:	06054d63          	bltz	a0,802027d2 <clone+0xb8>
    printf("?\n");
    freeproc(parent);
    release(&parent->lock);
    return -1;
  }
  parent->sz = child->sz;
    8020275c:	048ab783          	ld	a5,72(s5)
    80202760:	04f9b423          	sd	a5,72(s3)

  parent->parent = child;
    80202764:	0359b023          	sd	s5,32(s3)

  // copy tracing mask from parent.
  parent->tmask = child->tmask;
    80202768:	170aa783          	lw	a5,368(s5)
    8020276c:	16f9a823          	sw	a5,368(s3)

  // copy saved user registers.
  *(parent->trapframe) = *(child->trapframe);
    80202770:	060ab683          	ld	a3,96(s5)
    80202774:	87b6                	mv	a5,a3
    80202776:	0609b703          	ld	a4,96(s3)
    8020277a:	12068693          	addi	a3,a3,288
    8020277e:	0007b883          	ld	a7,0(a5)
    80202782:	0087b803          	ld	a6,8(a5)
    80202786:	6b88                	ld	a0,16(a5)
    80202788:	6f90                	ld	a2,24(a5)
    8020278a:	01173023          	sd	a7,0(a4)
    8020278e:	01073423          	sd	a6,8(a4)
    80202792:	eb08                	sd	a0,16(a4)
    80202794:	ef10                	sd	a2,24(a4)
    80202796:	02078793          	addi	a5,a5,32
    8020279a:	02070713          	addi	a4,a4,32
    8020279e:	fed790e3          	bne	a5,a3,8020277e <clone+0x64>

  // Cause fork to return 0 in the child.
  parent->trapframe->a0 = 0;
    802027a2:	0609b783          	ld	a5,96(s3)
    802027a6:	0607b823          	sd	zero,112(a5)
  parent->trapframe->sp = stack;
    802027aa:	0609b783          	ld	a5,96(s3)
    802027ae:	fb84                	sd	s1,48(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    802027b0:	0d8a8493          	addi	s1,s5,216
    802027b4:	0d898913          	addi	s2,s3,216
    802027b8:	158a8a13          	addi	s4,s5,344
    802027bc:	a889                	j	8020280e <clone+0xf4>
    printf("?\n");
    802027be:	00008517          	auipc	a0,0x8
    802027c2:	f2250513          	addi	a0,a0,-222 # 8020a6e0 <digits+0x360>
    802027c6:	ffffe097          	auipc	ra,0xffffe
    802027ca:	9c8080e7          	jalr	-1592(ra) # 8020018e <printf>
    return -1;
    802027ce:	54fd                	li	s1,-1
    802027d0:	a8ad                	j	8020284a <clone+0x130>
    printf("?\n");
    802027d2:	00008517          	auipc	a0,0x8
    802027d6:	f0e50513          	addi	a0,a0,-242 # 8020a6e0 <digits+0x360>
    802027da:	ffffe097          	auipc	ra,0xffffe
    802027de:	9b4080e7          	jalr	-1612(ra) # 8020018e <printf>
    freeproc(parent);
    802027e2:	854e                	mv	a0,s3
    802027e4:	fffff097          	auipc	ra,0xfffff
    802027e8:	4a4080e7          	jalr	1188(ra) # 80201c88 <freeproc>
    release(&parent->lock);
    802027ec:	854e                	mv	a0,s3
    802027ee:	ffffe097          	auipc	ra,0xffffe
    802027f2:	f2c080e7          	jalr	-212(ra) # 8020071a <release>
    return -1;
    802027f6:	54fd                	li	s1,-1
    802027f8:	a889                	j	8020284a <clone+0x130>
    if(child->ofile[i])
      parent->ofile[i] = filedup(child->ofile[i]);
    802027fa:	00001097          	auipc	ra,0x1
    802027fe:	750080e7          	jalr	1872(ra) # 80203f4a <filedup>
    80202802:	00a93023          	sd	a0,0(s2)
  for(i = 0; i < NOFILE; i++)
    80202806:	04a1                	addi	s1,s1,8
    80202808:	0921                	addi	s2,s2,8
    8020280a:	01448563          	beq	s1,s4,80202814 <clone+0xfa>
    if(child->ofile[i])
    8020280e:	6088                	ld	a0,0(s1)
    80202810:	f56d                	bnez	a0,802027fa <clone+0xe0>
    80202812:	bfd5                	j	80202806 <clone+0xec>
  parent->cwd = edup(child->cwd);
    80202814:	158ab503          	ld	a0,344(s5)
    80202818:	00005097          	auipc	ra,0x5
    8020281c:	846080e7          	jalr	-1978(ra) # 8020705e <edup>
    80202820:	14a9bc23          	sd	a0,344(s3)

  safestrcpy(parent->name, child->name, sizeof(child->name));
    80202824:	4641                	li	a2,16
    80202826:	160a8593          	addi	a1,s5,352
    8020282a:	16098513          	addi	a0,s3,352
    8020282e:	ffffe097          	auipc	ra,0xffffe
    80202832:	086080e7          	jalr	134(ra) # 802008b4 <safestrcpy>

  pid = parent->pid;
    80202836:	0389a483          	lw	s1,56(s3)

  parent->state = RUNNABLE;
    8020283a:	4789                	li	a5,2
    8020283c:	00f9ac23          	sw	a5,24(s3)

  release(&parent->lock);
    80202840:	854e                	mv	a0,s3
    80202842:	ffffe097          	auipc	ra,0xffffe
    80202846:	ed8080e7          	jalr	-296(ra) # 8020071a <release>

  return pid;
}
    8020284a:	8526                	mv	a0,s1
    8020284c:	70e2                	ld	ra,56(sp)
    8020284e:	7442                	ld	s0,48(sp)
    80202850:	74a2                	ld	s1,40(sp)
    80202852:	7902                	ld	s2,32(sp)
    80202854:	69e2                	ld	s3,24(sp)
    80202856:	6a42                	ld	s4,16(sp)
    80202858:	6aa2                	ld	s5,8(sp)
    8020285a:	6121                	addi	sp,sp,64
    8020285c:	8082                	ret

000000008020285e <waitpid>:

int
waitpid(int pid_to_wait, uint64 status, int options)
{
    8020285e:	7159                	addi	sp,sp,-112
    80202860:	f486                	sd	ra,104(sp)
    80202862:	f0a2                	sd	s0,96(sp)
    80202864:	eca6                	sd	s1,88(sp)
    80202866:	e8ca                	sd	s2,80(sp)
    80202868:	e4ce                	sd	s3,72(sp)
    8020286a:	e0d2                	sd	s4,64(sp)
    8020286c:	fc56                	sd	s5,56(sp)
    8020286e:	f85a                	sd	s6,48(sp)
    80202870:	f45e                	sd	s7,40(sp)
    80202872:	f062                	sd	s8,32(sp)
    80202874:	ec66                	sd	s9,24(sp)
    80202876:	e86a                	sd	s10,16(sp)
    80202878:	e46e                	sd	s11,8(sp)
    8020287a:	1880                	addi	s0,sp,112
    8020287c:	8a2a                	mv	s4,a0
    8020287e:	8cae                	mv	s9,a1
    80202880:	8d32                	mv	s10,a2
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();
    80202882:	fffff097          	auipc	ra,0xfffff
    80202886:	234080e7          	jalr	564(ra) # 80201ab6 <myproc>
    8020288a:	892a                	mv	s2,a0
  
  // printf("[waitpid] pid_to_wait: %d\n", pid_to_wait);
  acquire(&p->lock);
    8020288c:	ffffe097          	auipc	ra,0xffffe
    80202890:	e3a080e7          	jalr	-454(ra) # 802006c6 <acquire>

  while(1){
    havekids = 0;
    80202894:	4d81                	li	s11,0
    for (np = proc; np < &proc[NPROC]; np++) {
      if(np->parent == p){
        if(pid_to_wait == -1) {}
    80202896:	5afd                	li	s5,-1
        }
        else
          return -1;
        acquire(&np->lock);
        havekids = 1;
        if(np->state == ZOMBIE) {
    80202898:	4b91                	li	s7,4
        havekids = 1;
    8020289a:	4c05                	li	s8,1
    for (np = proc; np < &proc[NPROC]; np++) {
    8020289c:	0001c997          	auipc	s3,0x1c
    802028a0:	c2498993          	addi	s3,s3,-988 # 8021e4c0 <bcache>
    havekids = 0;
    802028a4:	8b6e                	mv	s6,s11
    for (np = proc; np < &proc[NPROC]; np++) {
    802028a6:	00014497          	auipc	s1,0x14
    802028aa:	8da48493          	addi	s1,s1,-1830 # 80216180 <proc>
    802028ae:	a01d                	j	802028d4 <waitpid+0x76>
        acquire(&np->lock);
    802028b0:	8526                	mv	a0,s1
    802028b2:	ffffe097          	auipc	ra,0xffffe
    802028b6:	e14080e7          	jalr	-492(ra) # 802006c6 <acquire>
        if(np->state == ZOMBIE) {
    802028ba:	4c9c                	lw	a5,24(s1)
    802028bc:	03778763          	beq	a5,s7,802028ea <waitpid+0x8c>
          freeproc(np);
          release(&np->lock);
          release(&p->lock);
          return pid;
        }
        release(&np->lock);
    802028c0:	8526                	mv	a0,s1
    802028c2:	ffffe097          	auipc	ra,0xffffe
    802028c6:	e58080e7          	jalr	-424(ra) # 8020071a <release>
        havekids = 1;
    802028ca:	8b62                	mv	s6,s8
    for (np = proc; np < &proc[NPROC]; np++) {
    802028cc:	2a048493          	addi	s1,s1,672
    802028d0:	07348863          	beq	s1,s3,80202940 <waitpid+0xe2>
      if(np->parent == p){
    802028d4:	709c                	ld	a5,32(s1)
    802028d6:	ff279be3          	bne	a5,s2,802028cc <waitpid+0x6e>
        if(pid_to_wait == -1) {}
    802028da:	fd5a0be3          	beq	s4,s5,802028b0 <waitpid+0x52>
        else if(pid_to_wait > 0) {
    802028de:	0b405c63          	blez	s4,80202996 <waitpid+0x138>
          if(np->pid != pid_to_wait)
    802028e2:	5c9c                	lw	a5,56(s1)
    802028e4:	fd4786e3          	beq	a5,s4,802028b0 <waitpid+0x52>
    802028e8:	b7d5                	j	802028cc <waitpid+0x6e>
          pid = np->pid;
    802028ea:	0384ab03          	lw	s6,56(s1)
          if (status != 0 && copyout2(status + 1, (char *)&np->xstate, sizeof(np->xstate)) < 0){
    802028ee:	000c8d63          	beqz	s9,80202908 <waitpid+0xaa>
    802028f2:	4611                	li	a2,4
    802028f4:	03448593          	addi	a1,s1,52
    802028f8:	001c8513          	addi	a0,s9,1 # 1001 <_entry-0x801fefff>
    802028fc:	fffff097          	auipc	ra,0xfffff
    80202900:	a76080e7          	jalr	-1418(ra) # 80201372 <copyout2>
    80202904:	02054263          	bltz	a0,80202928 <waitpid+0xca>
          freeproc(np);
    80202908:	8526                	mv	a0,s1
    8020290a:	fffff097          	auipc	ra,0xfffff
    8020290e:	37e080e7          	jalr	894(ra) # 80201c88 <freeproc>
          release(&np->lock);
    80202912:	8526                	mv	a0,s1
    80202914:	ffffe097          	auipc	ra,0xffffe
    80202918:	e06080e7          	jalr	-506(ra) # 8020071a <release>
          release(&p->lock);
    8020291c:	854a                	mv	a0,s2
    8020291e:	ffffe097          	auipc	ra,0xffffe
    80202922:	dfc080e7          	jalr	-516(ra) # 8020071a <release>
          return pid;
    80202926:	a089                	j	80202968 <waitpid+0x10a>
            release(&np->lock);
    80202928:	8526                	mv	a0,s1
    8020292a:	ffffe097          	auipc	ra,0xffffe
    8020292e:	df0080e7          	jalr	-528(ra) # 8020071a <release>
            release(&p->lock);
    80202932:	854a                	mv	a0,s2
    80202934:	ffffe097          	auipc	ra,0xffffe
    80202938:	de6080e7          	jalr	-538(ra) # 8020071a <release>
            return -1;
    8020293c:	5b7d                	li	s6,-1
    8020293e:	a02d                	j	80202968 <waitpid+0x10a>
      }
    }

    if (!havekids && options == WNOHANG){
    80202940:	000b1b63          	bnez	s6,80202956 <waitpid+0xf8>
    80202944:	4785                	li	a5,1
    80202946:	00fd1b63          	bne	s10,a5,8020295c <waitpid+0xfe>
      release(&p->lock);
    8020294a:	854a                	mv	a0,s2
    8020294c:	ffffe097          	auipc	ra,0xffffe
    80202950:	dce080e7          	jalr	-562(ra) # 8020071a <release>
      return 0;
    80202954:	a811                	j	80202968 <waitpid+0x10a>
    }

    if (!havekids || p->killed){
    80202956:	03092783          	lw	a5,48(s2)
    8020295a:	c79d                	beqz	a5,80202988 <waitpid+0x12a>
      release(&p->lock);
    8020295c:	854a                	mv	a0,s2
    8020295e:	ffffe097          	auipc	ra,0xffffe
    80202962:	dbc080e7          	jalr	-580(ra) # 8020071a <release>
      return -1;
    80202966:	5b7d                	li	s6,-1
    }

    // Wait for a child to exit.
    sleep(p, &p->lock); // DOC: wait-sleep
  }
}
    80202968:	855a                	mv	a0,s6
    8020296a:	70a6                	ld	ra,104(sp)
    8020296c:	7406                	ld	s0,96(sp)
    8020296e:	64e6                	ld	s1,88(sp)
    80202970:	6946                	ld	s2,80(sp)
    80202972:	69a6                	ld	s3,72(sp)
    80202974:	6a06                	ld	s4,64(sp)
    80202976:	7ae2                	ld	s5,56(sp)
    80202978:	7b42                	ld	s6,48(sp)
    8020297a:	7ba2                	ld	s7,40(sp)
    8020297c:	7c02                	ld	s8,32(sp)
    8020297e:	6ce2                	ld	s9,24(sp)
    80202980:	6d42                	ld	s10,16(sp)
    80202982:	6da2                	ld	s11,8(sp)
    80202984:	6165                	addi	sp,sp,112
    80202986:	8082                	ret
    sleep(p, &p->lock); // DOC: wait-sleep
    80202988:	85ca                	mv	a1,s2
    8020298a:	854a                	mv	a0,s2
    8020298c:	00000097          	auipc	ra,0x0
    80202990:	9ea080e7          	jalr	-1558(ra) # 80202376 <sleep>
    havekids = 0;
    80202994:	bf01                	j	802028a4 <waitpid+0x46>
          return -1;
    80202996:	5b7d                	li	s6,-1
    80202998:	bfc1                	j	80202968 <waitpid+0x10a>

000000008020299a <swtch>:
    8020299a:	00153023          	sd	ra,0(a0)
    8020299e:	00253423          	sd	sp,8(a0)
    802029a2:	e900                	sd	s0,16(a0)
    802029a4:	ed04                	sd	s1,24(a0)
    802029a6:	03253023          	sd	s2,32(a0)
    802029aa:	03353423          	sd	s3,40(a0)
    802029ae:	03453823          	sd	s4,48(a0)
    802029b2:	03553c23          	sd	s5,56(a0)
    802029b6:	05653023          	sd	s6,64(a0)
    802029ba:	05753423          	sd	s7,72(a0)
    802029be:	05853823          	sd	s8,80(a0)
    802029c2:	05953c23          	sd	s9,88(a0)
    802029c6:	07a53023          	sd	s10,96(a0)
    802029ca:	07b53423          	sd	s11,104(a0)
    802029ce:	0005b083          	ld	ra,0(a1)
    802029d2:	0085b103          	ld	sp,8(a1)
    802029d6:	6980                	ld	s0,16(a1)
    802029d8:	6d84                	ld	s1,24(a1)
    802029da:	0205b903          	ld	s2,32(a1)
    802029de:	0285b983          	ld	s3,40(a1)
    802029e2:	0305ba03          	ld	s4,48(a1)
    802029e6:	0385ba83          	ld	s5,56(a1)
    802029ea:	0405bb03          	ld	s6,64(a1)
    802029ee:	0485bb83          	ld	s7,72(a1)
    802029f2:	0505bc03          	ld	s8,80(a1)
    802029f6:	0585bc83          	ld	s9,88(a1)
    802029fa:	0605bd03          	ld	s10,96(a1)
    802029fe:	0685bd83          	ld	s11,104(a1)
    80202a02:	8082                	ret

0000000080202a04 <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80202a04:	1141                	addi	sp,sp,-16
    80202a06:	e406                	sd	ra,8(sp)
    80202a08:	e022                	sd	s0,0(sp)
    80202a0a:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202a0c:	0000b797          	auipc	a5,0xb
    80202a10:	2c47b783          	ld	a5,708(a5) # 8020dcd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80202a14:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a18:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202a1c:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a20:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    80202a24:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    80202a28:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    80202a2c:	10479073          	csrw	sie,a5
  set_next_timeout();
    80202a30:	00003097          	auipc	ra,0x3
    80202a34:	5d6080e7          	jalr	1494(ra) # 80206006 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
  #endif
}
    80202a38:	60a2                	ld	ra,8(sp)
    80202a3a:	6402                	ld	s0,0(sp)
    80202a3c:	0141                	addi	sp,sp,16
    80202a3e:	8082                	ret

0000000080202a40 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80202a40:	1141                	addi	sp,sp,-16
    80202a42:	e406                	sd	ra,8(sp)
    80202a44:	e022                	sd	s0,0(sp)
    80202a46:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    80202a48:	fffff097          	auipc	ra,0xfffff
    80202a4c:	06e080e7          	jalr	110(ra) # 80201ab6 <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a50:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80202a54:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a56:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80202a5a:	0000b697          	auipc	a3,0xb
    80202a5e:	2666b683          	ld	a3,614(a3) # 8020dcc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80202a62:	0000b717          	auipc	a4,0xb
    80202a66:	28e73703          	ld	a4,654(a4) # 8020dcf0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80202a6a:	8f15                	sub	a4,a4,a3
    80202a6c:	040007b7          	lui	a5,0x4000
    80202a70:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c200001>
    80202a72:	07b2                	slli	a5,a5,0xc
    80202a74:	973e                	add	a4,a4,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202a76:	10571073          	csrw	stvec,a4

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80202a7a:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    80202a7c:	18002673          	csrr	a2,satp
    80202a80:	e310                	sd	a2,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80202a82:	7130                	ld	a2,96(a0)
    80202a84:	6138                	ld	a4,64(a0)
    80202a86:	6585                	lui	a1,0x1
    80202a88:	972e                	add	a4,a4,a1
    80202a8a:	e618                	sd	a4,8(a2)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80202a8c:	7138                	ld	a4,96(a0)
    80202a8e:	00000617          	auipc	a2,0x0
    80202a92:	0f460613          	addi	a2,a2,244 # 80202b82 <usertrap>
    80202a96:	eb10                	sd	a2,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80202a98:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    80202a9a:	8612                	mv	a2,tp
    80202a9c:	f310                	sd	a2,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a9e:	10002773          	csrr	a4,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80202aa2:	eff77713          	andi	a4,a4,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80202aa6:	02076713          	ori	a4,a4,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202aaa:	10071073          	csrw	sstatus,a4
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80202aae:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202ab0:	6f18                	ld	a4,24(a4)
    80202ab2:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    80202ab6:	692c                	ld	a1,80(a0)
    80202ab8:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    80202aba:	0000b717          	auipc	a4,0xb
    80202abe:	20e73703          	ld	a4,526(a4) # 8020dcc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80202ac2:	8f15                	sub	a4,a4,a3
    80202ac4:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80202ac6:	577d                	li	a4,-1
    80202ac8:	177e                	slli	a4,a4,0x3f
    80202aca:	8dd9                	or	a1,a1,a4
    80202acc:	02000537          	lui	a0,0x2000
    80202ad0:	157d                	addi	a0,a0,-1 # 1ffffff <_entry-0x7e200001>
    80202ad2:	0536                	slli	a0,a0,0xd
    80202ad4:	9782                	jalr	a5
}
    80202ad6:	60a2                	ld	ra,8(sp)
    80202ad8:	6402                	ld	s0,0(sp)
    80202ada:	0141                	addi	sp,sp,16
    80202adc:	8082                	ret

0000000080202ade <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    80202ade:	1101                	addi	sp,sp,-32
    80202ae0:	ec06                	sd	ra,24(sp)
    80202ae2:	e822                	sd	s0,16(sp)
    80202ae4:	e426                	sd	s1,8(sp)
    80202ae6:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202ae8:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202aec:	00074d63          	bltz	a4,80202b06 <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    80202af0:	57fd                	li	a5,-1
    80202af2:	17fe                	slli	a5,a5,0x3f
    80202af4:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    80202af6:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    80202af8:	06f70f63          	beq	a4,a5,80202b76 <devintr+0x98>
}
    80202afc:	60e2                	ld	ra,24(sp)
    80202afe:	6442                	ld	s0,16(sp)
    80202b00:	64a2                	ld	s1,8(sp)
    80202b02:	6105                	addi	sp,sp,32
    80202b04:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202b06:	0ff77793          	zext.b	a5,a4
    80202b0a:	46a5                	li	a3,9
    80202b0c:	fed792e3          	bne	a5,a3,80202af0 <devintr+0x12>
		int irq = plic_claim();
    80202b10:	00005097          	auipc	ra,0x5
    80202b14:	34e080e7          	jalr	846(ra) # 80207e5e <plic_claim>
    80202b18:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    80202b1a:	47a9                	li	a5,10
    80202b1c:	02f50163          	beq	a0,a5,80202b3e <devintr+0x60>
		else if (DISK_IRQ == irq) {
    80202b20:	4785                	li	a5,1
    80202b22:	04f50563          	beq	a0,a5,80202b6c <devintr+0x8e>
		return 1;
    80202b26:	4505                	li	a0,1
		else if (irq) {
    80202b28:	d8f1                	beqz	s1,80202afc <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    80202b2a:	85a6                	mv	a1,s1
    80202b2c:	00008517          	auipc	a0,0x8
    80202b30:	be450513          	addi	a0,a0,-1052 # 8020a710 <digits+0x390>
    80202b34:	ffffd097          	auipc	ra,0xffffd
    80202b38:	65a080e7          	jalr	1626(ra) # 8020018e <printf>
    80202b3c:	a821                	j	80202b54 <devintr+0x76>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    80202b3e:	4501                	li	a0,0
    80202b40:	4581                	li	a1,0
    80202b42:	4601                	li	a2,0
    80202b44:	4681                	li	a3,0
    80202b46:	4889                	li	a7,2
    80202b48:	00000073          	ecall
    80202b4c:	2501                	sext.w	a0,a0
			if (-1 != c) {
    80202b4e:	57fd                	li	a5,-1
    80202b50:	00f51963          	bne	a0,a5,80202b62 <devintr+0x84>
		if (irq) { plic_complete(irq);}
    80202b54:	8526                	mv	a0,s1
    80202b56:	00005097          	auipc	ra,0x5
    80202b5a:	332080e7          	jalr	818(ra) # 80207e88 <plic_complete>
		return 1;
    80202b5e:	4505                	li	a0,1
    80202b60:	bf71                	j	80202afc <devintr+0x1e>
				consoleintr(c);
    80202b62:	00005097          	auipc	ra,0x5
    80202b66:	53a080e7          	jalr	1338(ra) # 8020809c <consoleintr>
    80202b6a:	b7ed                	j	80202b54 <devintr+0x76>
			disk_intr();
    80202b6c:	00003097          	auipc	ra,0x3
    80202b70:	55a080e7          	jalr	1370(ra) # 802060c6 <disk_intr>
    80202b74:	b7c5                	j	80202b54 <devintr+0x76>
		timer_tick();
    80202b76:	00003097          	auipc	ra,0x3
    80202b7a:	4b6080e7          	jalr	1206(ra) # 8020602c <timer_tick>
		return 2;
    80202b7e:	4509                	li	a0,2
    80202b80:	bfb5                	j	80202afc <devintr+0x1e>

0000000080202b82 <usertrap>:
{
    80202b82:	1101                	addi	sp,sp,-32
    80202b84:	ec06                	sd	ra,24(sp)
    80202b86:	e822                	sd	s0,16(sp)
    80202b88:	e426                	sd	s1,8(sp)
    80202b8a:	e04a                	sd	s2,0(sp)
    80202b8c:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202b8e:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    80202b92:	1007f793          	andi	a5,a5,256
    80202b96:	e3ad                	bnez	a5,80202bf8 <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202b98:	0000b797          	auipc	a5,0xb
    80202b9c:	1387b783          	ld	a5,312(a5) # 8020dcd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80202ba0:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    80202ba4:	fffff097          	auipc	ra,0xfffff
    80202ba8:	f12080e7          	jalr	-238(ra) # 80201ab6 <myproc>
    80202bac:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    80202bae:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202bb0:	14102773          	csrr	a4,sepc
    80202bb4:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202bb6:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    80202bba:	47a1                	li	a5,8
    80202bbc:	04f71c63          	bne	a4,a5,80202c14 <usertrap+0x92>
    if(p->killed)
    80202bc0:	591c                	lw	a5,48(a0)
    80202bc2:	e3b9                	bnez	a5,80202c08 <usertrap+0x86>
    p->trapframe->epc += 4;
    80202bc4:	70b8                	ld	a4,96(s1)
    80202bc6:	6f1c                	ld	a5,24(a4)
    80202bc8:	0791                	addi	a5,a5,4
    80202bca:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202bcc:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202bd0:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202bd4:	10079073          	csrw	sstatus,a5
    syscall();
    80202bd8:	00000097          	auipc	ra,0x0
    80202bdc:	5d4080e7          	jalr	1492(ra) # 802031ac <syscall>
  if(p->killed)
    80202be0:	589c                	lw	a5,48(s1)
    80202be2:	ebd1                	bnez	a5,80202c76 <usertrap+0xf4>
  usertrapret();
    80202be4:	00000097          	auipc	ra,0x0
    80202be8:	e5c080e7          	jalr	-420(ra) # 80202a40 <usertrapret>
}
    80202bec:	60e2                	ld	ra,24(sp)
    80202bee:	6442                	ld	s0,16(sp)
    80202bf0:	64a2                	ld	s1,8(sp)
    80202bf2:	6902                	ld	s2,0(sp)
    80202bf4:	6105                	addi	sp,sp,32
    80202bf6:	8082                	ret
    panic("usertrap: not from user mode");
    80202bf8:	00008517          	auipc	a0,0x8
    80202bfc:	b3850513          	addi	a0,a0,-1224 # 8020a730 <digits+0x3b0>
    80202c00:	ffffd097          	auipc	ra,0xffffd
    80202c04:	544080e7          	jalr	1348(ra) # 80200144 <panic>
      exit(-1);
    80202c08:	557d                	li	a0,-1
    80202c0a:	fffff097          	auipc	ra,0xfffff
    80202c0e:	60c080e7          	jalr	1548(ra) # 80202216 <exit>
    80202c12:	bf4d                	j	80202bc4 <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    80202c14:	00000097          	auipc	ra,0x0
    80202c18:	eca080e7          	jalr	-310(ra) # 80202ade <devintr>
    80202c1c:	892a                	mv	s2,a0
    80202c1e:	c501                	beqz	a0,80202c26 <usertrap+0xa4>
  if(p->killed)
    80202c20:	589c                	lw	a5,48(s1)
    80202c22:	c3b1                	beqz	a5,80202c66 <usertrap+0xe4>
    80202c24:	a825                	j	80202c5c <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202c26:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    80202c2a:	16048693          	addi	a3,s1,352
    80202c2e:	5c90                	lw	a2,56(s1)
    80202c30:	00008517          	auipc	a0,0x8
    80202c34:	b2050513          	addi	a0,a0,-1248 # 8020a750 <digits+0x3d0>
    80202c38:	ffffd097          	auipc	ra,0xffffd
    80202c3c:	556080e7          	jalr	1366(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202c40:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202c44:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202c48:	00008517          	auipc	a0,0x8
    80202c4c:	b3850513          	addi	a0,a0,-1224 # 8020a780 <digits+0x400>
    80202c50:	ffffd097          	auipc	ra,0xffffd
    80202c54:	53e080e7          	jalr	1342(ra) # 8020018e <printf>
    p->killed = 1;
    80202c58:	4785                	li	a5,1
    80202c5a:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202c5c:	557d                	li	a0,-1
    80202c5e:	fffff097          	auipc	ra,0xfffff
    80202c62:	5b8080e7          	jalr	1464(ra) # 80202216 <exit>
  if(which_dev == 2)
    80202c66:	4789                	li	a5,2
    80202c68:	f6f91ee3          	bne	s2,a5,80202be4 <usertrap+0x62>
    yield();
    80202c6c:	fffff097          	auipc	ra,0xfffff
    80202c70:	6ce080e7          	jalr	1742(ra) # 8020233a <yield>
    80202c74:	bf85                	j	80202be4 <usertrap+0x62>
  int which_dev = 0;
    80202c76:	4901                	li	s2,0
    80202c78:	b7d5                	j	80202c5c <usertrap+0xda>

0000000080202c7a <kerneltrap>:
kerneltrap() {
    80202c7a:	7179                	addi	sp,sp,-48
    80202c7c:	f406                	sd	ra,40(sp)
    80202c7e:	f022                	sd	s0,32(sp)
    80202c80:	ec26                	sd	s1,24(sp)
    80202c82:	e84a                	sd	s2,16(sp)
    80202c84:	e44e                	sd	s3,8(sp)
    80202c86:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202c88:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202c8c:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202c90:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202c94:	1004f793          	andi	a5,s1,256
    80202c98:	cb85                	beqz	a5,80202cc8 <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202c9a:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202c9e:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202ca0:	ef85                	bnez	a5,80202cd8 <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202ca2:	00000097          	auipc	ra,0x0
    80202ca6:	e3c080e7          	jalr	-452(ra) # 80202ade <devintr>
    80202caa:	cd1d                	beqz	a0,80202ce8 <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202cac:	4789                	li	a5,2
    80202cae:	08f50b63          	beq	a0,a5,80202d44 <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202cb2:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202cb6:	10049073          	csrw	sstatus,s1
}
    80202cba:	70a2                	ld	ra,40(sp)
    80202cbc:	7402                	ld	s0,32(sp)
    80202cbe:	64e2                	ld	s1,24(sp)
    80202cc0:	6942                	ld	s2,16(sp)
    80202cc2:	69a2                	ld	s3,8(sp)
    80202cc4:	6145                	addi	sp,sp,48
    80202cc6:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202cc8:	00008517          	auipc	a0,0x8
    80202ccc:	ad850513          	addi	a0,a0,-1320 # 8020a7a0 <digits+0x420>
    80202cd0:	ffffd097          	auipc	ra,0xffffd
    80202cd4:	474080e7          	jalr	1140(ra) # 80200144 <panic>
    panic("kerneltrap: interrupts enabled");
    80202cd8:	00008517          	auipc	a0,0x8
    80202cdc:	af050513          	addi	a0,a0,-1296 # 8020a7c8 <digits+0x448>
    80202ce0:	ffffd097          	auipc	ra,0xffffd
    80202ce4:	464080e7          	jalr	1124(ra) # 80200144 <panic>
    printf("\nscause %p\n", scause);
    80202ce8:	85ce                	mv	a1,s3
    80202cea:	00008517          	auipc	a0,0x8
    80202cee:	afe50513          	addi	a0,a0,-1282 # 8020a7e8 <digits+0x468>
    80202cf2:	ffffd097          	auipc	ra,0xffffd
    80202cf6:	49c080e7          	jalr	1180(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202cfa:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202cfe:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202d02:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202d04:	00008517          	auipc	a0,0x8
    80202d08:	af450513          	addi	a0,a0,-1292 # 8020a7f8 <digits+0x478>
    80202d0c:	ffffd097          	auipc	ra,0xffffd
    80202d10:	482080e7          	jalr	1154(ra) # 8020018e <printf>
    struct proc *p = myproc();
    80202d14:	fffff097          	auipc	ra,0xfffff
    80202d18:	da2080e7          	jalr	-606(ra) # 80201ab6 <myproc>
    if (p != 0) {
    80202d1c:	cd01                	beqz	a0,80202d34 <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202d1e:	16050613          	addi	a2,a0,352
    80202d22:	5d0c                	lw	a1,56(a0)
    80202d24:	00008517          	auipc	a0,0x8
    80202d28:	af450513          	addi	a0,a0,-1292 # 8020a818 <digits+0x498>
    80202d2c:	ffffd097          	auipc	ra,0xffffd
    80202d30:	462080e7          	jalr	1122(ra) # 8020018e <printf>
    panic("kerneltrap");
    80202d34:	00008517          	auipc	a0,0x8
    80202d38:	afc50513          	addi	a0,a0,-1284 # 8020a830 <digits+0x4b0>
    80202d3c:	ffffd097          	auipc	ra,0xffffd
    80202d40:	408080e7          	jalr	1032(ra) # 80200144 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202d44:	fffff097          	auipc	ra,0xfffff
    80202d48:	d72080e7          	jalr	-654(ra) # 80201ab6 <myproc>
    80202d4c:	d13d                	beqz	a0,80202cb2 <kerneltrap+0x38>
    80202d4e:	fffff097          	auipc	ra,0xfffff
    80202d52:	d68080e7          	jalr	-664(ra) # 80201ab6 <myproc>
    80202d56:	4d18                	lw	a4,24(a0)
    80202d58:	478d                	li	a5,3
    80202d5a:	f4f71ce3          	bne	a4,a5,80202cb2 <kerneltrap+0x38>
    yield();
    80202d5e:	fffff097          	auipc	ra,0xfffff
    80202d62:	5dc080e7          	jalr	1500(ra) # 8020233a <yield>
    80202d66:	b7b1                	j	80202cb2 <kerneltrap+0x38>

0000000080202d68 <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202d68:	1101                	addi	sp,sp,-32
    80202d6a:	ec06                	sd	ra,24(sp)
    80202d6c:	e822                	sd	s0,16(sp)
    80202d6e:	e426                	sd	s1,8(sp)
    80202d70:	1000                	addi	s0,sp,32
    80202d72:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202d74:	792c                	ld	a1,112(a0)
    80202d76:	00008517          	auipc	a0,0x8
    80202d7a:	aca50513          	addi	a0,a0,-1334 # 8020a840 <digits+0x4c0>
    80202d7e:	ffffd097          	auipc	ra,0xffffd
    80202d82:	410080e7          	jalr	1040(ra) # 8020018e <printf>
  printf("a1: %p\t", tf->a1);
    80202d86:	7cac                	ld	a1,120(s1)
    80202d88:	00008517          	auipc	a0,0x8
    80202d8c:	ac050513          	addi	a0,a0,-1344 # 8020a848 <digits+0x4c8>
    80202d90:	ffffd097          	auipc	ra,0xffffd
    80202d94:	3fe080e7          	jalr	1022(ra) # 8020018e <printf>
  printf("a2: %p\t", tf->a2);
    80202d98:	60cc                	ld	a1,128(s1)
    80202d9a:	00008517          	auipc	a0,0x8
    80202d9e:	ab650513          	addi	a0,a0,-1354 # 8020a850 <digits+0x4d0>
    80202da2:	ffffd097          	auipc	ra,0xffffd
    80202da6:	3ec080e7          	jalr	1004(ra) # 8020018e <printf>
  printf("a3: %p\n", tf->a3);
    80202daa:	64cc                	ld	a1,136(s1)
    80202dac:	00008517          	auipc	a0,0x8
    80202db0:	aac50513          	addi	a0,a0,-1364 # 8020a858 <digits+0x4d8>
    80202db4:	ffffd097          	auipc	ra,0xffffd
    80202db8:	3da080e7          	jalr	986(ra) # 8020018e <printf>
  printf("a4: %p\t", tf->a4);
    80202dbc:	68cc                	ld	a1,144(s1)
    80202dbe:	00008517          	auipc	a0,0x8
    80202dc2:	aa250513          	addi	a0,a0,-1374 # 8020a860 <digits+0x4e0>
    80202dc6:	ffffd097          	auipc	ra,0xffffd
    80202dca:	3c8080e7          	jalr	968(ra) # 8020018e <printf>
  printf("a5: %p\t", tf->a5);
    80202dce:	6ccc                	ld	a1,152(s1)
    80202dd0:	00008517          	auipc	a0,0x8
    80202dd4:	a9850513          	addi	a0,a0,-1384 # 8020a868 <digits+0x4e8>
    80202dd8:	ffffd097          	auipc	ra,0xffffd
    80202ddc:	3b6080e7          	jalr	950(ra) # 8020018e <printf>
  printf("a6: %p\t", tf->a6);
    80202de0:	70cc                	ld	a1,160(s1)
    80202de2:	00008517          	auipc	a0,0x8
    80202de6:	a8e50513          	addi	a0,a0,-1394 # 8020a870 <digits+0x4f0>
    80202dea:	ffffd097          	auipc	ra,0xffffd
    80202dee:	3a4080e7          	jalr	932(ra) # 8020018e <printf>
  printf("a7: %p\n", tf->a7);
    80202df2:	74cc                	ld	a1,168(s1)
    80202df4:	00008517          	auipc	a0,0x8
    80202df8:	a8450513          	addi	a0,a0,-1404 # 8020a878 <digits+0x4f8>
    80202dfc:	ffffd097          	auipc	ra,0xffffd
    80202e00:	392080e7          	jalr	914(ra) # 8020018e <printf>
  printf("t0: %p\t", tf->t0);
    80202e04:	64ac                	ld	a1,72(s1)
    80202e06:	00008517          	auipc	a0,0x8
    80202e0a:	a7a50513          	addi	a0,a0,-1414 # 8020a880 <digits+0x500>
    80202e0e:	ffffd097          	auipc	ra,0xffffd
    80202e12:	380080e7          	jalr	896(ra) # 8020018e <printf>
  printf("t1: %p\t", tf->t1);
    80202e16:	68ac                	ld	a1,80(s1)
    80202e18:	00008517          	auipc	a0,0x8
    80202e1c:	a7050513          	addi	a0,a0,-1424 # 8020a888 <digits+0x508>
    80202e20:	ffffd097          	auipc	ra,0xffffd
    80202e24:	36e080e7          	jalr	878(ra) # 8020018e <printf>
  printf("t2: %p\t", tf->t2);
    80202e28:	6cac                	ld	a1,88(s1)
    80202e2a:	00008517          	auipc	a0,0x8
    80202e2e:	a6650513          	addi	a0,a0,-1434 # 8020a890 <digits+0x510>
    80202e32:	ffffd097          	auipc	ra,0xffffd
    80202e36:	35c080e7          	jalr	860(ra) # 8020018e <printf>
  printf("t3: %p\n", tf->t3);
    80202e3a:	1004b583          	ld	a1,256(s1)
    80202e3e:	00008517          	auipc	a0,0x8
    80202e42:	a5a50513          	addi	a0,a0,-1446 # 8020a898 <digits+0x518>
    80202e46:	ffffd097          	auipc	ra,0xffffd
    80202e4a:	348080e7          	jalr	840(ra) # 8020018e <printf>
  printf("t4: %p\t", tf->t4);
    80202e4e:	1084b583          	ld	a1,264(s1)
    80202e52:	00008517          	auipc	a0,0x8
    80202e56:	a4e50513          	addi	a0,a0,-1458 # 8020a8a0 <digits+0x520>
    80202e5a:	ffffd097          	auipc	ra,0xffffd
    80202e5e:	334080e7          	jalr	820(ra) # 8020018e <printf>
  printf("t5: %p\t", tf->t5);
    80202e62:	1104b583          	ld	a1,272(s1)
    80202e66:	00008517          	auipc	a0,0x8
    80202e6a:	a4250513          	addi	a0,a0,-1470 # 8020a8a8 <digits+0x528>
    80202e6e:	ffffd097          	auipc	ra,0xffffd
    80202e72:	320080e7          	jalr	800(ra) # 8020018e <printf>
  printf("t6: %p\t", tf->t6);
    80202e76:	1184b583          	ld	a1,280(s1)
    80202e7a:	00008517          	auipc	a0,0x8
    80202e7e:	a3650513          	addi	a0,a0,-1482 # 8020a8b0 <digits+0x530>
    80202e82:	ffffd097          	auipc	ra,0xffffd
    80202e86:	30c080e7          	jalr	780(ra) # 8020018e <printf>
  printf("s0: %p\n", tf->s0);
    80202e8a:	70ac                	ld	a1,96(s1)
    80202e8c:	00008517          	auipc	a0,0x8
    80202e90:	a2c50513          	addi	a0,a0,-1492 # 8020a8b8 <digits+0x538>
    80202e94:	ffffd097          	auipc	ra,0xffffd
    80202e98:	2fa080e7          	jalr	762(ra) # 8020018e <printf>
  printf("s1: %p\t", tf->s1);
    80202e9c:	74ac                	ld	a1,104(s1)
    80202e9e:	00008517          	auipc	a0,0x8
    80202ea2:	a2250513          	addi	a0,a0,-1502 # 8020a8c0 <digits+0x540>
    80202ea6:	ffffd097          	auipc	ra,0xffffd
    80202eaa:	2e8080e7          	jalr	744(ra) # 8020018e <printf>
  printf("s2: %p\t", tf->s2);
    80202eae:	78cc                	ld	a1,176(s1)
    80202eb0:	00008517          	auipc	a0,0x8
    80202eb4:	a1850513          	addi	a0,a0,-1512 # 8020a8c8 <digits+0x548>
    80202eb8:	ffffd097          	auipc	ra,0xffffd
    80202ebc:	2d6080e7          	jalr	726(ra) # 8020018e <printf>
  printf("s3: %p\t", tf->s3);
    80202ec0:	7ccc                	ld	a1,184(s1)
    80202ec2:	00008517          	auipc	a0,0x8
    80202ec6:	a0e50513          	addi	a0,a0,-1522 # 8020a8d0 <digits+0x550>
    80202eca:	ffffd097          	auipc	ra,0xffffd
    80202ece:	2c4080e7          	jalr	708(ra) # 8020018e <printf>
  printf("s4: %p\n", tf->s4);
    80202ed2:	60ec                	ld	a1,192(s1)
    80202ed4:	00008517          	auipc	a0,0x8
    80202ed8:	a0450513          	addi	a0,a0,-1532 # 8020a8d8 <digits+0x558>
    80202edc:	ffffd097          	auipc	ra,0xffffd
    80202ee0:	2b2080e7          	jalr	690(ra) # 8020018e <printf>
  printf("s5: %p\t", tf->s5);
    80202ee4:	64ec                	ld	a1,200(s1)
    80202ee6:	00008517          	auipc	a0,0x8
    80202eea:	9fa50513          	addi	a0,a0,-1542 # 8020a8e0 <digits+0x560>
    80202eee:	ffffd097          	auipc	ra,0xffffd
    80202ef2:	2a0080e7          	jalr	672(ra) # 8020018e <printf>
  printf("s6: %p\t", tf->s6);
    80202ef6:	68ec                	ld	a1,208(s1)
    80202ef8:	00008517          	auipc	a0,0x8
    80202efc:	9f050513          	addi	a0,a0,-1552 # 8020a8e8 <digits+0x568>
    80202f00:	ffffd097          	auipc	ra,0xffffd
    80202f04:	28e080e7          	jalr	654(ra) # 8020018e <printf>
  printf("s7: %p\t", tf->s7);
    80202f08:	6cec                	ld	a1,216(s1)
    80202f0a:	00008517          	auipc	a0,0x8
    80202f0e:	9e650513          	addi	a0,a0,-1562 # 8020a8f0 <digits+0x570>
    80202f12:	ffffd097          	auipc	ra,0xffffd
    80202f16:	27c080e7          	jalr	636(ra) # 8020018e <printf>
  printf("s8: %p\n", tf->s8);
    80202f1a:	70ec                	ld	a1,224(s1)
    80202f1c:	00008517          	auipc	a0,0x8
    80202f20:	9dc50513          	addi	a0,a0,-1572 # 8020a8f8 <digits+0x578>
    80202f24:	ffffd097          	auipc	ra,0xffffd
    80202f28:	26a080e7          	jalr	618(ra) # 8020018e <printf>
  printf("s9: %p\t", tf->s9);
    80202f2c:	74ec                	ld	a1,232(s1)
    80202f2e:	00008517          	auipc	a0,0x8
    80202f32:	9d250513          	addi	a0,a0,-1582 # 8020a900 <digits+0x580>
    80202f36:	ffffd097          	auipc	ra,0xffffd
    80202f3a:	258080e7          	jalr	600(ra) # 8020018e <printf>
  printf("s10: %p\t", tf->s10);
    80202f3e:	78ec                	ld	a1,240(s1)
    80202f40:	00008517          	auipc	a0,0x8
    80202f44:	9c850513          	addi	a0,a0,-1592 # 8020a908 <digits+0x588>
    80202f48:	ffffd097          	auipc	ra,0xffffd
    80202f4c:	246080e7          	jalr	582(ra) # 8020018e <printf>
  printf("s11: %p\t", tf->s11);
    80202f50:	7cec                	ld	a1,248(s1)
    80202f52:	00008517          	auipc	a0,0x8
    80202f56:	9c650513          	addi	a0,a0,-1594 # 8020a918 <digits+0x598>
    80202f5a:	ffffd097          	auipc	ra,0xffffd
    80202f5e:	234080e7          	jalr	564(ra) # 8020018e <printf>
  printf("ra: %p\n", tf->ra);
    80202f62:	748c                	ld	a1,40(s1)
    80202f64:	00007517          	auipc	a0,0x7
    80202f68:	6ac50513          	addi	a0,a0,1708 # 8020a610 <digits+0x290>
    80202f6c:	ffffd097          	auipc	ra,0xffffd
    80202f70:	222080e7          	jalr	546(ra) # 8020018e <printf>
  printf("sp: %p\t", tf->sp);
    80202f74:	788c                	ld	a1,48(s1)
    80202f76:	00008517          	auipc	a0,0x8
    80202f7a:	9b250513          	addi	a0,a0,-1614 # 8020a928 <digits+0x5a8>
    80202f7e:	ffffd097          	auipc	ra,0xffffd
    80202f82:	210080e7          	jalr	528(ra) # 8020018e <printf>
  printf("gp: %p\t", tf->gp);
    80202f86:	7c8c                	ld	a1,56(s1)
    80202f88:	00008517          	auipc	a0,0x8
    80202f8c:	9a850513          	addi	a0,a0,-1624 # 8020a930 <digits+0x5b0>
    80202f90:	ffffd097          	auipc	ra,0xffffd
    80202f94:	1fe080e7          	jalr	510(ra) # 8020018e <printf>
  printf("tp: %p\t", tf->tp);
    80202f98:	60ac                	ld	a1,64(s1)
    80202f9a:	00008517          	auipc	a0,0x8
    80202f9e:	99e50513          	addi	a0,a0,-1634 # 8020a938 <digits+0x5b8>
    80202fa2:	ffffd097          	auipc	ra,0xffffd
    80202fa6:	1ec080e7          	jalr	492(ra) # 8020018e <printf>
  printf("epc: %p\n", tf->epc);
    80202faa:	6c8c                	ld	a1,24(s1)
    80202fac:	00008517          	auipc	a0,0x8
    80202fb0:	99450513          	addi	a0,a0,-1644 # 8020a940 <digits+0x5c0>
    80202fb4:	ffffd097          	auipc	ra,0xffffd
    80202fb8:	1da080e7          	jalr	474(ra) # 8020018e <printf>
}
    80202fbc:	60e2                	ld	ra,24(sp)
    80202fbe:	6442                	ld	s0,16(sp)
    80202fc0:	64a2                	ld	s1,8(sp)
    80202fc2:	6105                	addi	sp,sp,32
    80202fc4:	8082                	ret

0000000080202fc6 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202fc6:	1101                	addi	sp,sp,-32
    80202fc8:	ec06                	sd	ra,24(sp)
    80202fca:	e822                	sd	s0,16(sp)
    80202fcc:	e426                	sd	s1,8(sp)
    80202fce:	1000                	addi	s0,sp,32
    80202fd0:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202fd2:	fffff097          	auipc	ra,0xfffff
    80202fd6:	ae4080e7          	jalr	-1308(ra) # 80201ab6 <myproc>
  switch (n) {
    80202fda:	4795                	li	a5,5
    80202fdc:	0497e163          	bltu	a5,s1,8020301e <argraw+0x58>
    80202fe0:	048a                	slli	s1,s1,0x2
    80202fe2:	00008717          	auipc	a4,0x8
    80202fe6:	b7670713          	addi	a4,a4,-1162 # 8020ab58 <digits+0x7d8>
    80202fea:	94ba                	add	s1,s1,a4
    80202fec:	409c                	lw	a5,0(s1)
    80202fee:	97ba                	add	a5,a5,a4
    80202ff0:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202ff2:	713c                	ld	a5,96(a0)
    80202ff4:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202ff6:	60e2                	ld	ra,24(sp)
    80202ff8:	6442                	ld	s0,16(sp)
    80202ffa:	64a2                	ld	s1,8(sp)
    80202ffc:	6105                	addi	sp,sp,32
    80202ffe:	8082                	ret
    return p->trapframe->a1;
    80203000:	713c                	ld	a5,96(a0)
    80203002:	7fa8                	ld	a0,120(a5)
    80203004:	bfcd                	j	80202ff6 <argraw+0x30>
    return p->trapframe->a2;
    80203006:	713c                	ld	a5,96(a0)
    80203008:	63c8                	ld	a0,128(a5)
    8020300a:	b7f5                	j	80202ff6 <argraw+0x30>
    return p->trapframe->a3;
    8020300c:	713c                	ld	a5,96(a0)
    8020300e:	67c8                	ld	a0,136(a5)
    80203010:	b7dd                	j	80202ff6 <argraw+0x30>
    return p->trapframe->a4;
    80203012:	713c                	ld	a5,96(a0)
    80203014:	6bc8                	ld	a0,144(a5)
    80203016:	b7c5                	j	80202ff6 <argraw+0x30>
    return p->trapframe->a5;
    80203018:	713c                	ld	a5,96(a0)
    8020301a:	6fc8                	ld	a0,152(a5)
    8020301c:	bfe9                	j	80202ff6 <argraw+0x30>
  panic("argraw");
    8020301e:	00008517          	auipc	a0,0x8
    80203022:	93250513          	addi	a0,a0,-1742 # 8020a950 <digits+0x5d0>
    80203026:	ffffd097          	auipc	ra,0xffffd
    8020302a:	11e080e7          	jalr	286(ra) # 80200144 <panic>

000000008020302e <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    8020302e:	7179                	addi	sp,sp,-48
    80203030:	f406                	sd	ra,40(sp)
    80203032:	f022                	sd	s0,32(sp)
    80203034:	ec26                	sd	s1,24(sp)
    80203036:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80203038:	4501                	li	a0,0
    8020303a:	00000097          	auipc	ra,0x0
    8020303e:	f8c080e7          	jalr	-116(ra) # 80202fc6 <argraw>
    80203042:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80203044:	ffffd097          	auipc	ra,0xffffd
    80203048:	57c080e7          	jalr	1404(ra) # 802005c0 <freemem_amount>
    8020304c:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80203050:	fffff097          	auipc	ra,0xfffff
    80203054:	69a080e7          	jalr	1690(ra) # 802026ea <procnum>
    80203058:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    8020305c:	4641                	li	a2,16
    8020305e:	fd040593          	addi	a1,s0,-48
    80203062:	8526                	mv	a0,s1
    80203064:	ffffe097          	auipc	ra,0xffffe
    80203068:	30e080e7          	jalr	782(ra) # 80201372 <copyout2>
    return -1;
  }

  return 0;
}
    8020306c:	957d                	srai	a0,a0,0x3f
    8020306e:	70a2                	ld	ra,40(sp)
    80203070:	7402                	ld	s0,32(sp)
    80203072:	64e2                	ld	s1,24(sp)
    80203074:	6145                	addi	sp,sp,48
    80203076:	8082                	ret

0000000080203078 <fetchaddr>:
{
    80203078:	1101                	addi	sp,sp,-32
    8020307a:	ec06                	sd	ra,24(sp)
    8020307c:	e822                	sd	s0,16(sp)
    8020307e:	e426                	sd	s1,8(sp)
    80203080:	e04a                	sd	s2,0(sp)
    80203082:	1000                	addi	s0,sp,32
    80203084:	84aa                	mv	s1,a0
    80203086:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80203088:	fffff097          	auipc	ra,0xfffff
    8020308c:	a2e080e7          	jalr	-1490(ra) # 80201ab6 <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80203090:	653c                	ld	a5,72(a0)
    80203092:	02f4f763          	bgeu	s1,a5,802030c0 <fetchaddr+0x48>
    80203096:	00848713          	addi	a4,s1,8
    8020309a:	02e7e563          	bltu	a5,a4,802030c4 <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    8020309e:	4621                	li	a2,8
    802030a0:	85a6                	mv	a1,s1
    802030a2:	854a                	mv	a0,s2
    802030a4:	ffffe097          	auipc	ra,0xffffe
    802030a8:	400080e7          	jalr	1024(ra) # 802014a4 <copyin2>
    802030ac:	00a03533          	snez	a0,a0
    802030b0:	40a00533          	neg	a0,a0
}
    802030b4:	60e2                	ld	ra,24(sp)
    802030b6:	6442                	ld	s0,16(sp)
    802030b8:	64a2                	ld	s1,8(sp)
    802030ba:	6902                	ld	s2,0(sp)
    802030bc:	6105                	addi	sp,sp,32
    802030be:	8082                	ret
    return -1;
    802030c0:	557d                	li	a0,-1
    802030c2:	bfcd                	j	802030b4 <fetchaddr+0x3c>
    802030c4:	557d                	li	a0,-1
    802030c6:	b7fd                	j	802030b4 <fetchaddr+0x3c>

00000000802030c8 <fetchstr>:
{
    802030c8:	1101                	addi	sp,sp,-32
    802030ca:	ec06                	sd	ra,24(sp)
    802030cc:	e822                	sd	s0,16(sp)
    802030ce:	e426                	sd	s1,8(sp)
    802030d0:	1000                	addi	s0,sp,32
    802030d2:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    802030d4:	85aa                	mv	a1,a0
    802030d6:	8526                	mv	a0,s1
    802030d8:	ffffe097          	auipc	ra,0xffffe
    802030dc:	4ce080e7          	jalr	1230(ra) # 802015a6 <copyinstr2>
  if(err < 0)
    802030e0:	00054763          	bltz	a0,802030ee <fetchstr+0x26>
  return strlen(buf);
    802030e4:	8526                	mv	a0,s1
    802030e6:	ffffe097          	auipc	ra,0xffffe
    802030ea:	800080e7          	jalr	-2048(ra) # 802008e6 <strlen>
}
    802030ee:	60e2                	ld	ra,24(sp)
    802030f0:	6442                	ld	s0,16(sp)
    802030f2:	64a2                	ld	s1,8(sp)
    802030f4:	6105                	addi	sp,sp,32
    802030f6:	8082                	ret

00000000802030f8 <argint>:
{
    802030f8:	1101                	addi	sp,sp,-32
    802030fa:	ec06                	sd	ra,24(sp)
    802030fc:	e822                	sd	s0,16(sp)
    802030fe:	e426                	sd	s1,8(sp)
    80203100:	1000                	addi	s0,sp,32
    80203102:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80203104:	00000097          	auipc	ra,0x0
    80203108:	ec2080e7          	jalr	-318(ra) # 80202fc6 <argraw>
    8020310c:	c088                	sw	a0,0(s1)
}
    8020310e:	4501                	li	a0,0
    80203110:	60e2                	ld	ra,24(sp)
    80203112:	6442                	ld	s0,16(sp)
    80203114:	64a2                	ld	s1,8(sp)
    80203116:	6105                	addi	sp,sp,32
    80203118:	8082                	ret

000000008020311a <sys_test_proc>:
sys_test_proc(void) {
    8020311a:	1101                	addi	sp,sp,-32
    8020311c:	ec06                	sd	ra,24(sp)
    8020311e:	e822                	sd	s0,16(sp)
    80203120:	1000                	addi	s0,sp,32
    argint(0, &n);
    80203122:	fec40593          	addi	a1,s0,-20
    80203126:	4501                	li	a0,0
    80203128:	00000097          	auipc	ra,0x0
    8020312c:	fd0080e7          	jalr	-48(ra) # 802030f8 <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    80203130:	fffff097          	auipc	ra,0xfffff
    80203134:	986080e7          	jalr	-1658(ra) # 80201ab6 <myproc>
    80203138:	8612                	mv	a2,tp
    8020313a:	fec42683          	lw	a3,-20(s0)
    8020313e:	5d0c                	lw	a1,56(a0)
    80203140:	00008517          	auipc	a0,0x8
    80203144:	81850513          	addi	a0,a0,-2024 # 8020a958 <digits+0x5d8>
    80203148:	ffffd097          	auipc	ra,0xffffd
    8020314c:	046080e7          	jalr	70(ra) # 8020018e <printf>
}
    80203150:	4501                	li	a0,0
    80203152:	60e2                	ld	ra,24(sp)
    80203154:	6442                	ld	s0,16(sp)
    80203156:	6105                	addi	sp,sp,32
    80203158:	8082                	ret

000000008020315a <argaddr>:
{
    8020315a:	1101                	addi	sp,sp,-32
    8020315c:	ec06                	sd	ra,24(sp)
    8020315e:	e822                	sd	s0,16(sp)
    80203160:	e426                	sd	s1,8(sp)
    80203162:	1000                	addi	s0,sp,32
    80203164:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80203166:	00000097          	auipc	ra,0x0
    8020316a:	e60080e7          	jalr	-416(ra) # 80202fc6 <argraw>
    8020316e:	e088                	sd	a0,0(s1)
}
    80203170:	4501                	li	a0,0
    80203172:	60e2                	ld	ra,24(sp)
    80203174:	6442                	ld	s0,16(sp)
    80203176:	64a2                	ld	s1,8(sp)
    80203178:	6105                	addi	sp,sp,32
    8020317a:	8082                	ret

000000008020317c <argstr>:
{
    8020317c:	1101                	addi	sp,sp,-32
    8020317e:	ec06                	sd	ra,24(sp)
    80203180:	e822                	sd	s0,16(sp)
    80203182:	e426                	sd	s1,8(sp)
    80203184:	e04a                	sd	s2,0(sp)
    80203186:	1000                	addi	s0,sp,32
    80203188:	84ae                	mv	s1,a1
    8020318a:	8932                	mv	s2,a2
  *ip = argraw(n);
    8020318c:	00000097          	auipc	ra,0x0
    80203190:	e3a080e7          	jalr	-454(ra) # 80202fc6 <argraw>
  return fetchstr(addr, buf, max);
    80203194:	864a                	mv	a2,s2
    80203196:	85a6                	mv	a1,s1
    80203198:	00000097          	auipc	ra,0x0
    8020319c:	f30080e7          	jalr	-208(ra) # 802030c8 <fetchstr>
}
    802031a0:	60e2                	ld	ra,24(sp)
    802031a2:	6442                	ld	s0,16(sp)
    802031a4:	64a2                	ld	s1,8(sp)
    802031a6:	6902                	ld	s2,0(sp)
    802031a8:	6105                	addi	sp,sp,32
    802031aa:	8082                	ret

00000000802031ac <syscall>:
{
    802031ac:	7179                	addi	sp,sp,-48
    802031ae:	f406                	sd	ra,40(sp)
    802031b0:	f022                	sd	s0,32(sp)
    802031b2:	ec26                	sd	s1,24(sp)
    802031b4:	e84a                	sd	s2,16(sp)
    802031b6:	e44e                	sd	s3,8(sp)
    802031b8:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    802031ba:	fffff097          	auipc	ra,0xfffff
    802031be:	8fc080e7          	jalr	-1796(ra) # 80201ab6 <myproc>
    802031c2:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    802031c4:	06053903          	ld	s2,96(a0)
    802031c8:	0a893783          	ld	a5,168(s2)
    802031cc:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    802031d0:	37fd                	addiw	a5,a5,-1
    802031d2:	10300713          	li	a4,259
    802031d6:	04f76763          	bltu	a4,a5,80203224 <syscall+0x78>
    802031da:	00399713          	slli	a4,s3,0x3
    802031de:	0000a797          	auipc	a5,0xa
    802031e2:	a7278793          	addi	a5,a5,-1422 # 8020cc50 <syscalls>
    802031e6:	97ba                	add	a5,a5,a4
    802031e8:	639c                	ld	a5,0(a5)
    802031ea:	cf8d                	beqz	a5,80203224 <syscall+0x78>
    p->trapframe->a0 = syscalls[num]();
    802031ec:	9782                	jalr	a5
    802031ee:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    802031f2:	1704a783          	lw	a5,368(s1)
    802031f6:	4137d7bb          	sraw	a5,a5,s3
    802031fa:	8b85                	andi	a5,a5,1
    802031fc:	c3b9                	beqz	a5,80203242 <syscall+0x96>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    802031fe:	70b8                	ld	a4,96(s1)
    80203200:	098e                	slli	s3,s3,0x3
    80203202:	0000a797          	auipc	a5,0xa
    80203206:	27678793          	addi	a5,a5,630 # 8020d478 <sysnames>
    8020320a:	97ce                	add	a5,a5,s3
    8020320c:	7b34                	ld	a3,112(a4)
    8020320e:	6390                	ld	a2,0(a5)
    80203210:	5c8c                	lw	a1,56(s1)
    80203212:	00007517          	auipc	a0,0x7
    80203216:	77650513          	addi	a0,a0,1910 # 8020a988 <digits+0x608>
    8020321a:	ffffd097          	auipc	ra,0xffffd
    8020321e:	f74080e7          	jalr	-140(ra) # 8020018e <printf>
    80203222:	a005                	j	80203242 <syscall+0x96>
    printf("pid %d %s: unknown sys call %d\n",
    80203224:	86ce                	mv	a3,s3
    80203226:	16048613          	addi	a2,s1,352
    8020322a:	5c8c                	lw	a1,56(s1)
    8020322c:	00007517          	auipc	a0,0x7
    80203230:	77450513          	addi	a0,a0,1908 # 8020a9a0 <digits+0x620>
    80203234:	ffffd097          	auipc	ra,0xffffd
    80203238:	f5a080e7          	jalr	-166(ra) # 8020018e <printf>
    p->trapframe->a0 = -1;
    8020323c:	70bc                	ld	a5,96(s1)
    8020323e:	577d                	li	a4,-1
    80203240:	fbb8                	sd	a4,112(a5)
}
    80203242:	70a2                	ld	ra,40(sp)
    80203244:	7402                	ld	s0,32(sp)
    80203246:	64e2                	ld	s1,24(sp)
    80203248:	6942                	ld	s2,16(sp)
    8020324a:	69a2                	ld	s3,8(sp)
    8020324c:	6145                	addi	sp,sp,48
    8020324e:	8082                	ret

0000000080203250 <sys_exec>:

extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    80203250:	d9010113          	addi	sp,sp,-624
    80203254:	26113423          	sd	ra,616(sp)
    80203258:	26813023          	sd	s0,608(sp)
    8020325c:	24913c23          	sd	s1,600(sp)
    80203260:	25213823          	sd	s2,592(sp)
    80203264:	25313423          	sd	s3,584(sp)
    80203268:	25413023          	sd	s4,576(sp)
    8020326c:	23513c23          	sd	s5,568(sp)
    80203270:	23613823          	sd	s6,560(sp)
    80203274:	23713423          	sd	s7,552(sp)
    80203278:	1c80                	addi	s0,sp,624
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020327a:	10400613          	li	a2,260
    8020327e:	ea840593          	addi	a1,s0,-344
    80203282:	4501                	li	a0,0
    80203284:	00000097          	auipc	ra,0x0
    80203288:	ef8080e7          	jalr	-264(ra) # 8020317c <argstr>
    return -1;
    8020328c:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020328e:	0c054c63          	bltz	a0,80203366 <sys_exec+0x116>
    80203292:	da040593          	addi	a1,s0,-608
    80203296:	4505                	li	a0,1
    80203298:	00000097          	auipc	ra,0x0
    8020329c:	ec2080e7          	jalr	-318(ra) # 8020315a <argaddr>
    802032a0:	0c054363          	bltz	a0,80203366 <sys_exec+0x116>
  }
  memset(argv, 0, sizeof(argv));
    802032a4:	da840a13          	addi	s4,s0,-600
    802032a8:	10000613          	li	a2,256
    802032ac:	4581                	li	a1,0
    802032ae:	8552                	mv	a0,s4
    802032b0:	ffffd097          	auipc	ra,0xffffd
    802032b4:	4b2080e7          	jalr	1202(ra) # 80200762 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    802032b8:	84d2                	mv	s1,s4
  memset(argv, 0, sizeof(argv));
    802032ba:	89d2                	mv	s3,s4
    802032bc:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802032be:	d9840a93          	addi	s5,s0,-616
    if(i >= NELEM(argv)){
    802032c2:	02000b13          	li	s6,32
    802032c6:	00090b9b          	sext.w	s7,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802032ca:	00391513          	slli	a0,s2,0x3
    802032ce:	85d6                	mv	a1,s5
    802032d0:	da043783          	ld	a5,-608(s0)
    802032d4:	953e                	add	a0,a0,a5
    802032d6:	00000097          	auipc	ra,0x0
    802032da:	da2080e7          	jalr	-606(ra) # 80203078 <fetchaddr>
    802032de:	02054a63          	bltz	a0,80203312 <sys_exec+0xc2>
      goto bad;
    }
    if(uarg == 0){
    802032e2:	d9843783          	ld	a5,-616(s0)
    802032e6:	c3b9                	beqz	a5,8020332c <sys_exec+0xdc>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    802032e8:	ffffd097          	auipc	ra,0xffffd
    802032ec:	272080e7          	jalr	626(ra) # 8020055a <kalloc>
    802032f0:	85aa                	mv	a1,a0
    802032f2:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    802032f6:	cd11                	beqz	a0,80203312 <sys_exec+0xc2>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    802032f8:	6605                	lui	a2,0x1
    802032fa:	d9843503          	ld	a0,-616(s0)
    802032fe:	00000097          	auipc	ra,0x0
    80203302:	dca080e7          	jalr	-566(ra) # 802030c8 <fetchstr>
    80203306:	00054663          	bltz	a0,80203312 <sys_exec+0xc2>
    if(i >= NELEM(argv)){
    8020330a:	0905                	addi	s2,s2,1
    8020330c:	09a1                	addi	s3,s3,8
    8020330e:	fb691ce3          	bne	s2,s6,802032c6 <sys_exec+0x76>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203312:	100a0a13          	addi	s4,s4,256
    80203316:	6088                	ld	a0,0(s1)
    80203318:	c531                	beqz	a0,80203364 <sys_exec+0x114>
    kfree(argv[i]);
    8020331a:	ffffd097          	auipc	ra,0xffffd
    8020331e:	126080e7          	jalr	294(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203322:	04a1                	addi	s1,s1,8
    80203324:	ff4499e3          	bne	s1,s4,80203316 <sys_exec+0xc6>
  return -1;
    80203328:	597d                	li	s2,-1
    8020332a:	a835                	j	80203366 <sys_exec+0x116>
      argv[i] = 0;
    8020332c:	0b8e                	slli	s7,s7,0x3
    8020332e:	fb0b8793          	addi	a5,s7,-80
    80203332:	00878bb3          	add	s7,a5,s0
    80203336:	de0bbc23          	sd	zero,-520(s7)
  int ret = exec(path, argv);
    8020333a:	da840593          	addi	a1,s0,-600
    8020333e:	ea840513          	addi	a0,s0,-344
    80203342:	00001097          	auipc	ra,0x1
    80203346:	40c080e7          	jalr	1036(ra) # 8020474e <exec>
    8020334a:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020334c:	100a0a13          	addi	s4,s4,256
    80203350:	6088                	ld	a0,0(s1)
    80203352:	c911                	beqz	a0,80203366 <sys_exec+0x116>
    kfree(argv[i]);
    80203354:	ffffd097          	auipc	ra,0xffffd
    80203358:	0ec080e7          	jalr	236(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020335c:	04a1                	addi	s1,s1,8
    8020335e:	ff4499e3          	bne	s1,s4,80203350 <sys_exec+0x100>
    80203362:	a011                	j	80203366 <sys_exec+0x116>
  return -1;
    80203364:	597d                	li	s2,-1
}
    80203366:	854a                	mv	a0,s2
    80203368:	26813083          	ld	ra,616(sp)
    8020336c:	26013403          	ld	s0,608(sp)
    80203370:	25813483          	ld	s1,600(sp)
    80203374:	25013903          	ld	s2,592(sp)
    80203378:	24813983          	ld	s3,584(sp)
    8020337c:	24013a03          	ld	s4,576(sp)
    80203380:	23813a83          	ld	s5,568(sp)
    80203384:	23013b03          	ld	s6,560(sp)
    80203388:	22813b83          	ld	s7,552(sp)
    8020338c:	27010113          	addi	sp,sp,624
    80203390:	8082                	ret

0000000080203392 <sys_exit>:

uint64
sys_exit(void)
{
    80203392:	1101                	addi	sp,sp,-32
    80203394:	ec06                	sd	ra,24(sp)
    80203396:	e822                	sd	s0,16(sp)
    80203398:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    8020339a:	fec40593          	addi	a1,s0,-20
    8020339e:	4501                	li	a0,0
    802033a0:	00000097          	auipc	ra,0x0
    802033a4:	d58080e7          	jalr	-680(ra) # 802030f8 <argint>
    return -1;
    802033a8:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802033aa:	00054963          	bltz	a0,802033bc <sys_exit+0x2a>
  exit(n);
    802033ae:	fec42503          	lw	a0,-20(s0)
    802033b2:	fffff097          	auipc	ra,0xfffff
    802033b6:	e64080e7          	jalr	-412(ra) # 80202216 <exit>
  return 0;  // not reached
    802033ba:	4781                	li	a5,0
}
    802033bc:	853e                	mv	a0,a5
    802033be:	60e2                	ld	ra,24(sp)
    802033c0:	6442                	ld	s0,16(sp)
    802033c2:	6105                	addi	sp,sp,32
    802033c4:	8082                	ret

00000000802033c6 <sys_getpid>:

uint64
sys_getpid(void)
{
    802033c6:	1141                	addi	sp,sp,-16
    802033c8:	e406                	sd	ra,8(sp)
    802033ca:	e022                	sd	s0,0(sp)
    802033cc:	0800                	addi	s0,sp,16
  return myproc()->pid;
    802033ce:	ffffe097          	auipc	ra,0xffffe
    802033d2:	6e8080e7          	jalr	1768(ra) # 80201ab6 <myproc>
}
    802033d6:	5d08                	lw	a0,56(a0)
    802033d8:	60a2                	ld	ra,8(sp)
    802033da:	6402                	ld	s0,0(sp)
    802033dc:	0141                	addi	sp,sp,16
    802033de:	8082                	ret

00000000802033e0 <sys_fork>:

uint64
sys_fork(void)
{
    802033e0:	1141                	addi	sp,sp,-16
    802033e2:	e406                	sd	ra,8(sp)
    802033e4:	e022                	sd	s0,0(sp)
    802033e6:	0800                	addi	s0,sp,16
  return fork();
    802033e8:	fffff097          	auipc	ra,0xfffff
    802033ec:	ad4080e7          	jalr	-1324(ra) # 80201ebc <fork>
}
    802033f0:	60a2                	ld	ra,8(sp)
    802033f2:	6402                	ld	s0,0(sp)
    802033f4:	0141                	addi	sp,sp,16
    802033f6:	8082                	ret

00000000802033f8 <sys_wait>:

uint64
sys_wait(void)
{
    802033f8:	1101                	addi	sp,sp,-32
    802033fa:	ec06                	sd	ra,24(sp)
    802033fc:	e822                	sd	s0,16(sp)
    802033fe:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    80203400:	fe840593          	addi	a1,s0,-24
    80203404:	4501                	li	a0,0
    80203406:	00000097          	auipc	ra,0x0
    8020340a:	d54080e7          	jalr	-684(ra) # 8020315a <argaddr>
    8020340e:	87aa                	mv	a5,a0
    return -1;
    80203410:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    80203412:	0007c863          	bltz	a5,80203422 <sys_wait+0x2a>
  return wait(p);
    80203416:	fe843503          	ld	a0,-24(s0)
    8020341a:	fffff097          	auipc	ra,0xfffff
    8020341e:	fda080e7          	jalr	-38(ra) # 802023f4 <wait>
}
    80203422:	60e2                	ld	ra,24(sp)
    80203424:	6442                	ld	s0,16(sp)
    80203426:	6105                	addi	sp,sp,32
    80203428:	8082                	ret

000000008020342a <sys_sbrk>:

uint64
sys_sbrk(void)
{
    8020342a:	7179                	addi	sp,sp,-48
    8020342c:	f406                	sd	ra,40(sp)
    8020342e:	f022                	sd	s0,32(sp)
    80203430:	ec26                	sd	s1,24(sp)
    80203432:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    80203434:	fdc40593          	addi	a1,s0,-36
    80203438:	4501                	li	a0,0
    8020343a:	00000097          	auipc	ra,0x0
    8020343e:	cbe080e7          	jalr	-834(ra) # 802030f8 <argint>
    80203442:	87aa                	mv	a5,a0
    return -1;
    80203444:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    80203446:	0207c063          	bltz	a5,80203466 <sys_sbrk+0x3c>
  addr = myproc()->sz;
    8020344a:	ffffe097          	auipc	ra,0xffffe
    8020344e:	66c080e7          	jalr	1644(ra) # 80201ab6 <myproc>
    80203452:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    80203454:	fdc42503          	lw	a0,-36(s0)
    80203458:	fffff097          	auipc	ra,0xfffff
    8020345c:	9e8080e7          	jalr	-1560(ra) # 80201e40 <growproc>
    80203460:	00054863          	bltz	a0,80203470 <sys_sbrk+0x46>
    return -1;
  return addr;
    80203464:	8526                	mv	a0,s1
}
    80203466:	70a2                	ld	ra,40(sp)
    80203468:	7402                	ld	s0,32(sp)
    8020346a:	64e2                	ld	s1,24(sp)
    8020346c:	6145                	addi	sp,sp,48
    8020346e:	8082                	ret
    return -1;
    80203470:	557d                	li	a0,-1
    80203472:	bfd5                	j	80203466 <sys_sbrk+0x3c>

0000000080203474 <sys_sleep>:

uint64
sys_sleep(void)
{
    80203474:	7139                	addi	sp,sp,-64
    80203476:	fc06                	sd	ra,56(sp)
    80203478:	f822                	sd	s0,48(sp)
    8020347a:	f426                	sd	s1,40(sp)
    8020347c:	f04a                	sd	s2,32(sp)
    8020347e:	ec4e                	sd	s3,24(sp)
    80203480:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    80203482:	fcc40593          	addi	a1,s0,-52
    80203486:	4501                	li	a0,0
    80203488:	00000097          	auipc	ra,0x0
    8020348c:	c70080e7          	jalr	-912(ra) # 802030f8 <argint>
    return -1;
    80203490:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80203492:	06054763          	bltz	a0,80203500 <sys_sleep+0x8c>
  acquire(&tickslock);
    80203496:	0000b517          	auipc	a0,0xb
    8020349a:	85253503          	ld	a0,-1966(a0) # 8020dce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    8020349e:	ffffd097          	auipc	ra,0xffffd
    802034a2:	228080e7          	jalr	552(ra) # 802006c6 <acquire>
  ticks0 = ticks;
    802034a6:	0000b797          	auipc	a5,0xb
    802034aa:	8527b783          	ld	a5,-1966(a5) # 8020dcf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    802034ae:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    802034b2:	fcc42783          	lw	a5,-52(s0)
    802034b6:	cf85                	beqz	a5,802034ee <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    802034b8:	0000b997          	auipc	s3,0xb
    802034bc:	8309b983          	ld	s3,-2000(s3) # 8020dce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    802034c0:	0000b497          	auipc	s1,0xb
    802034c4:	8384b483          	ld	s1,-1992(s1) # 8020dcf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    if(myproc()->killed){
    802034c8:	ffffe097          	auipc	ra,0xffffe
    802034cc:	5ee080e7          	jalr	1518(ra) # 80201ab6 <myproc>
    802034d0:	591c                	lw	a5,48(a0)
    802034d2:	ef9d                	bnez	a5,80203510 <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    802034d4:	85ce                	mv	a1,s3
    802034d6:	8526                	mv	a0,s1
    802034d8:	fffff097          	auipc	ra,0xfffff
    802034dc:	e9e080e7          	jalr	-354(ra) # 80202376 <sleep>
  while(ticks - ticks0 < n){
    802034e0:	409c                	lw	a5,0(s1)
    802034e2:	412787bb          	subw	a5,a5,s2
    802034e6:	fcc42703          	lw	a4,-52(s0)
    802034ea:	fce7efe3          	bltu	a5,a4,802034c8 <sys_sleep+0x54>
  }
  release(&tickslock);
    802034ee:	0000a517          	auipc	a0,0xa
    802034f2:	7fa53503          	ld	a0,2042(a0) # 8020dce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    802034f6:	ffffd097          	auipc	ra,0xffffd
    802034fa:	224080e7          	jalr	548(ra) # 8020071a <release>
  return 0;
    802034fe:	4781                	li	a5,0
}
    80203500:	853e                	mv	a0,a5
    80203502:	70e2                	ld	ra,56(sp)
    80203504:	7442                	ld	s0,48(sp)
    80203506:	74a2                	ld	s1,40(sp)
    80203508:	7902                	ld	s2,32(sp)
    8020350a:	69e2                	ld	s3,24(sp)
    8020350c:	6121                	addi	sp,sp,64
    8020350e:	8082                	ret
      release(&tickslock);
    80203510:	0000a517          	auipc	a0,0xa
    80203514:	7d853503          	ld	a0,2008(a0) # 8020dce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203518:	ffffd097          	auipc	ra,0xffffd
    8020351c:	202080e7          	jalr	514(ra) # 8020071a <release>
      return -1;
    80203520:	57fd                	li	a5,-1
    80203522:	bff9                	j	80203500 <sys_sleep+0x8c>

0000000080203524 <sys_kill>:

uint64
sys_kill(void)
{
    80203524:	1101                	addi	sp,sp,-32
    80203526:	ec06                	sd	ra,24(sp)
    80203528:	e822                	sd	s0,16(sp)
    8020352a:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    8020352c:	fec40593          	addi	a1,s0,-20
    80203530:	4501                	li	a0,0
    80203532:	00000097          	auipc	ra,0x0
    80203536:	bc6080e7          	jalr	-1082(ra) # 802030f8 <argint>
    8020353a:	87aa                	mv	a5,a0
    return -1;
    8020353c:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    8020353e:	0007c863          	bltz	a5,8020354e <sys_kill+0x2a>
  return kill(pid);
    80203542:	fec42503          	lw	a0,-20(s0)
    80203546:	fffff097          	auipc	ra,0xfffff
    8020354a:	016080e7          	jalr	22(ra) # 8020255c <kill>
}
    8020354e:	60e2                	ld	ra,24(sp)
    80203550:	6442                	ld	s0,16(sp)
    80203552:	6105                	addi	sp,sp,32
    80203554:	8082                	ret

0000000080203556 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80203556:	1101                	addi	sp,sp,-32
    80203558:	ec06                	sd	ra,24(sp)
    8020355a:	e822                	sd	s0,16(sp)
    8020355c:	e426                	sd	s1,8(sp)
    8020355e:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80203560:	0000a517          	auipc	a0,0xa
    80203564:	78853503          	ld	a0,1928(a0) # 8020dce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203568:	ffffd097          	auipc	ra,0xffffd
    8020356c:	15e080e7          	jalr	350(ra) # 802006c6 <acquire>
  xticks = ticks;
    80203570:	0000a797          	auipc	a5,0xa
    80203574:	7887b783          	ld	a5,1928(a5) # 8020dcf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80203578:	4384                	lw	s1,0(a5)
  release(&tickslock);
    8020357a:	0000a517          	auipc	a0,0xa
    8020357e:	76e53503          	ld	a0,1902(a0) # 8020dce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203582:	ffffd097          	auipc	ra,0xffffd
    80203586:	198080e7          	jalr	408(ra) # 8020071a <release>
  return xticks;
}
    8020358a:	02049513          	slli	a0,s1,0x20
    8020358e:	9101                	srli	a0,a0,0x20
    80203590:	60e2                	ld	ra,24(sp)
    80203592:	6442                	ld	s0,16(sp)
    80203594:	64a2                	ld	s1,8(sp)
    80203596:	6105                	addi	sp,sp,32
    80203598:	8082                	ret

000000008020359a <sys_trace>:

uint64
sys_trace(void)
{
    8020359a:	1101                	addi	sp,sp,-32
    8020359c:	ec06                	sd	ra,24(sp)
    8020359e:	e822                	sd	s0,16(sp)
    802035a0:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    802035a2:	fec40593          	addi	a1,s0,-20
    802035a6:	4501                	li	a0,0
    802035a8:	00000097          	auipc	ra,0x0
    802035ac:	b50080e7          	jalr	-1200(ra) # 802030f8 <argint>
    return -1;
    802035b0:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    802035b2:	00054b63          	bltz	a0,802035c8 <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    802035b6:	ffffe097          	auipc	ra,0xffffe
    802035ba:	500080e7          	jalr	1280(ra) # 80201ab6 <myproc>
    802035be:	fec42783          	lw	a5,-20(s0)
    802035c2:	16f52823          	sw	a5,368(a0)
  return 0;
    802035c6:	4781                	li	a5,0
}
    802035c8:	853e                	mv	a0,a5
    802035ca:	60e2                	ld	ra,24(sp)
    802035cc:	6442                	ld	s0,16(sp)
    802035ce:	6105                	addi	sp,sp,32
    802035d0:	8082                	ret

00000000802035d2 <sys_brk>:
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////


uint64
sys_brk(void){
    802035d2:	7179                	addi	sp,sp,-48
    802035d4:	f406                	sd	ra,40(sp)
    802035d6:	f022                	sd	s0,32(sp)
    802035d8:	ec26                	sd	s1,24(sp)
    802035da:	1800                	addi	s0,sp,48
  uint64 curr_addr;
  uint64 next_addr;
  if(argaddr(0, &next_addr) < 0)
    802035dc:	fd840593          	addi	a1,s0,-40
    802035e0:	4501                	li	a0,0
    802035e2:	00000097          	auipc	ra,0x0
    802035e6:	b78080e7          	jalr	-1160(ra) # 8020315a <argaddr>
    return -1;
    802035ea:	54fd                	li	s1,-1
  if(argaddr(0, &next_addr) < 0)
    802035ec:	02054863          	bltz	a0,8020361c <sys_brk+0x4a>
  curr_addr = myproc()->sz; // Size of process memory
    802035f0:	ffffe097          	auipc	ra,0xffffe
    802035f4:	4c6080e7          	jalr	1222(ra) # 80201ab6 <myproc>
    802035f8:	6524                	ld	s1,72(a0)
  printf("Running: BRK ... curr_addr: %d ... next_addr: %d\n", curr_addr, next_addr);
    802035fa:	fd843603          	ld	a2,-40(s0)
    802035fe:	85a6                	mv	a1,s1
    80203600:	00007517          	auipc	a0,0x7
    80203604:	57050513          	addi	a0,a0,1392 # 8020ab70 <digits+0x7f0>
    80203608:	ffffd097          	auipc	ra,0xffffd
    8020360c:	b86080e7          	jalr	-1146(ra) # 8020018e <printf>
  if (next_addr == 0)
    80203610:	fd843503          	ld	a0,-40(s0)
    80203614:	c501                	beqz	a0,8020361c <sys_brk+0x4a>
  {
    return curr_addr;
  }
  if (next_addr >= curr_addr)
    80203616:	00957963          	bgeu	a0,s1,80203628 <sys_brk+0x56>
  {
    if(growproc(next_addr - curr_addr) < 0)
      return -1;
    else return myproc()->sz;
  }
  return 0;
    8020361a:	4481                	li	s1,0
}
    8020361c:	8526                	mv	a0,s1
    8020361e:	70a2                	ld	ra,40(sp)
    80203620:	7402                	ld	s0,32(sp)
    80203622:	64e2                	ld	s1,24(sp)
    80203624:	6145                	addi	sp,sp,48
    80203626:	8082                	ret
    if(growproc(next_addr - curr_addr) < 0)
    80203628:	9d05                	subw	a0,a0,s1
    8020362a:	fffff097          	auipc	ra,0xfffff
    8020362e:	816080e7          	jalr	-2026(ra) # 80201e40 <growproc>
      return -1;
    80203632:	54fd                	li	s1,-1
    if(growproc(next_addr - curr_addr) < 0)
    80203634:	fe0544e3          	bltz	a0,8020361c <sys_brk+0x4a>
    else return myproc()->sz;
    80203638:	ffffe097          	auipc	ra,0xffffe
    8020363c:	47e080e7          	jalr	1150(ra) # 80201ab6 <myproc>
    80203640:	6524                	ld	s1,72(a0)
    80203642:	bfe9                	j	8020361c <sys_brk+0x4a>

0000000080203644 <sys_clone>:


uint64
sys_clone(void){
    80203644:	1101                	addi	sp,sp,-32
    80203646:	ec06                	sd	ra,24(sp)
    80203648:	e822                	sd	s0,16(sp)
    8020364a:	1000                	addi	s0,sp,32
  uint64 flag, stack;
	if (argaddr(0, &flag) < 0) 
    8020364c:	fe840593          	addi	a1,s0,-24
    80203650:	4501                	li	a0,0
    80203652:	00000097          	auipc	ra,0x0
    80203656:	b08080e7          	jalr	-1272(ra) # 8020315a <argaddr>
		return -1;
    8020365a:	57fd                	li	a5,-1
	if (argaddr(0, &flag) < 0) 
    8020365c:	04054263          	bltz	a0,802036a0 <sys_clone+0x5c>
	if (argaddr(1, &stack) < 0) 
    80203660:	fe040593          	addi	a1,s0,-32
    80203664:	4505                	li	a0,1
    80203666:	00000097          	auipc	ra,0x0
    8020366a:	af4080e7          	jalr	-1292(ra) # 8020315a <argaddr>
		return -1;
    8020366e:	57fd                	li	a5,-1
	if (argaddr(1, &stack) < 0) 
    80203670:	02054863          	bltz	a0,802036a0 <sys_clone+0x5c>
  printf("Running: CLONE ... flag: %ld ... stack: %ld\n", flag, stack);
    80203674:	fe043603          	ld	a2,-32(s0)
    80203678:	fe843583          	ld	a1,-24(s0)
    8020367c:	00007517          	auipc	a0,0x7
    80203680:	52c50513          	addi	a0,a0,1324 # 8020aba8 <digits+0x828>
    80203684:	ffffd097          	auipc	ra,0xffffd
    80203688:	b0a080e7          	jalr	-1270(ra) # 8020018e <printf>
  if (stack != 0)
    8020368c:	fe043583          	ld	a1,-32(s0)
    80203690:	cd89                	beqz	a1,802036aa <sys_clone+0x66>
	  return clone(flag, stack);
    80203692:	fe843503          	ld	a0,-24(s0)
    80203696:	fffff097          	auipc	ra,0xfffff
    8020369a:	084080e7          	jalr	132(ra) # 8020271a <clone>
    8020369e:	87aa                	mv	a5,a0
  else
    return fork();
}
    802036a0:	853e                	mv	a0,a5
    802036a2:	60e2                	ld	ra,24(sp)
    802036a4:	6442                	ld	s0,16(sp)
    802036a6:	6105                	addi	sp,sp,32
    802036a8:	8082                	ret
    return fork();
    802036aa:	fffff097          	auipc	ra,0xfffff
    802036ae:	812080e7          	jalr	-2030(ra) # 80201ebc <fork>
    802036b2:	87aa                	mv	a5,a0
    802036b4:	b7f5                	j	802036a0 <sys_clone+0x5c>

00000000802036b6 <sys_wait4>:

uint64
sys_wait4(void)
{
    802036b6:	1101                	addi	sp,sp,-32
    802036b8:	ec06                	sd	ra,24(sp)
    802036ba:	e822                	sd	s0,16(sp)
    802036bc:	1000                	addi	s0,sp,32
  uint64 status;
  int pid, options;
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    802036be:	fe840593          	addi	a1,s0,-24
    802036c2:	4505                	li	a0,1
    802036c4:	00000097          	auipc	ra,0x0
    802036c8:	a96080e7          	jalr	-1386(ra) # 8020315a <argaddr>
    return -1;}
    802036cc:	57fd                	li	a5,-1
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    802036ce:	04054d63          	bltz	a0,80203728 <sys_wait4+0x72>
    802036d2:	fe440593          	addi	a1,s0,-28
    802036d6:	4501                	li	a0,0
    802036d8:	00000097          	auipc	ra,0x0
    802036dc:	a20080e7          	jalr	-1504(ra) # 802030f8 <argint>
    return -1;}
    802036e0:	57fd                	li	a5,-1
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    802036e2:	04054363          	bltz	a0,80203728 <sys_wait4+0x72>
    802036e6:	fe040593          	addi	a1,s0,-32
    802036ea:	4509                	li	a0,2
    802036ec:	00000097          	auipc	ra,0x0
    802036f0:	a0c080e7          	jalr	-1524(ra) # 802030f8 <argint>
    return -1;}
    802036f4:	57fd                	li	a5,-1
  if(argaddr(1, &status) < 0 || argint(0, &pid) < 0 || argint(2, &options) < 0){
    802036f6:	02054963          	bltz	a0,80203728 <sys_wait4+0x72>
  printf("Running: WAIT4 ... pid: %ld ... options: %ld\n", pid, options);
    802036fa:	fe042603          	lw	a2,-32(s0)
    802036fe:	fe442583          	lw	a1,-28(s0)
    80203702:	00007517          	auipc	a0,0x7
    80203706:	4d650513          	addi	a0,a0,1238 # 8020abd8 <digits+0x858>
    8020370a:	ffffd097          	auipc	ra,0xffffd
    8020370e:	a84080e7          	jalr	-1404(ra) # 8020018e <printf>
  return waitpid(pid, status, options);
    80203712:	fe042603          	lw	a2,-32(s0)
    80203716:	fe843583          	ld	a1,-24(s0)
    8020371a:	fe442503          	lw	a0,-28(s0)
    8020371e:	fffff097          	auipc	ra,0xfffff
    80203722:	140080e7          	jalr	320(ra) # 8020285e <waitpid>
    80203726:	87aa                	mv	a5,a0
}
    80203728:	853e                	mv	a0,a5
    8020372a:	60e2                	ld	ra,24(sp)
    8020372c:	6442                	ld	s0,16(sp)
    8020372e:	6105                	addi	sp,sp,32
    80203730:	8082                	ret

0000000080203732 <sys_execve>:

uint64
sys_execve(void)
{
    80203732:	d9010113          	addi	sp,sp,-624
    80203736:	26113423          	sd	ra,616(sp)
    8020373a:	26813023          	sd	s0,608(sp)
    8020373e:	24913c23          	sd	s1,600(sp)
    80203742:	25213823          	sd	s2,592(sp)
    80203746:	25313423          	sd	s3,584(sp)
    8020374a:	25413023          	sd	s4,576(sp)
    8020374e:	23513c23          	sd	s5,568(sp)
    80203752:	23613823          	sd	s6,560(sp)
    80203756:	23713423          	sd	s7,552(sp)
    8020375a:	1c80                	addi	s0,sp,624
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020375c:	10400613          	li	a2,260
    80203760:	ea840593          	addi	a1,s0,-344
    80203764:	4501                	li	a0,0
    80203766:	00000097          	auipc	ra,0x0
    8020376a:	a16080e7          	jalr	-1514(ra) # 8020317c <argstr>
    return -1;
    8020376e:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203770:	0c054c63          	bltz	a0,80203848 <sys_execve+0x116>
    80203774:	da040593          	addi	a1,s0,-608
    80203778:	4505                	li	a0,1
    8020377a:	00000097          	auipc	ra,0x0
    8020377e:	9e0080e7          	jalr	-1568(ra) # 8020315a <argaddr>
    80203782:	0c054363          	bltz	a0,80203848 <sys_execve+0x116>
  }
  memset(argv, 0, sizeof(argv));
    80203786:	da840a13          	addi	s4,s0,-600
    8020378a:	10000613          	li	a2,256
    8020378e:	4581                	li	a1,0
    80203790:	8552                	mv	a0,s4
    80203792:	ffffd097          	auipc	ra,0xffffd
    80203796:	fd0080e7          	jalr	-48(ra) # 80200762 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    8020379a:	84d2                	mv	s1,s4
  memset(argv, 0, sizeof(argv));
    8020379c:	89d2                	mv	s3,s4
    8020379e:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802037a0:	d9840a93          	addi	s5,s0,-616
    if(i >= NELEM(argv)){
    802037a4:	02000b13          	li	s6,32
    802037a8:	00090b9b          	sext.w	s7,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802037ac:	00391513          	slli	a0,s2,0x3
    802037b0:	85d6                	mv	a1,s5
    802037b2:	da043783          	ld	a5,-608(s0)
    802037b6:	953e                	add	a0,a0,a5
    802037b8:	00000097          	auipc	ra,0x0
    802037bc:	8c0080e7          	jalr	-1856(ra) # 80203078 <fetchaddr>
    802037c0:	02054a63          	bltz	a0,802037f4 <sys_execve+0xc2>
      goto bad;
    }
    if(uarg == 0){
    802037c4:	d9843783          	ld	a5,-616(s0)
    802037c8:	c3b9                	beqz	a5,8020380e <sys_execve+0xdc>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    802037ca:	ffffd097          	auipc	ra,0xffffd
    802037ce:	d90080e7          	jalr	-624(ra) # 8020055a <kalloc>
    802037d2:	85aa                	mv	a1,a0
    802037d4:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    802037d8:	cd11                	beqz	a0,802037f4 <sys_execve+0xc2>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    802037da:	6605                	lui	a2,0x1
    802037dc:	d9843503          	ld	a0,-616(s0)
    802037e0:	00000097          	auipc	ra,0x0
    802037e4:	8e8080e7          	jalr	-1816(ra) # 802030c8 <fetchstr>
    802037e8:	00054663          	bltz	a0,802037f4 <sys_execve+0xc2>
    if(i >= NELEM(argv)){
    802037ec:	0905                	addi	s2,s2,1
    802037ee:	09a1                	addi	s3,s3,8
    802037f0:	fb691ce3          	bne	s2,s6,802037a8 <sys_execve+0x76>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802037f4:	100a0a13          	addi	s4,s4,256
    802037f8:	6088                	ld	a0,0(s1)
    802037fa:	c531                	beqz	a0,80203846 <sys_execve+0x114>
    kfree(argv[i]);
    802037fc:	ffffd097          	auipc	ra,0xffffd
    80203800:	c44080e7          	jalr	-956(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203804:	04a1                	addi	s1,s1,8
    80203806:	ff4499e3          	bne	s1,s4,802037f8 <sys_execve+0xc6>
  return -1;
    8020380a:	597d                	li	s2,-1
    8020380c:	a835                	j	80203848 <sys_execve+0x116>
      argv[i] = 0;
    8020380e:	0b8e                	slli	s7,s7,0x3
    80203810:	fb0b8793          	addi	a5,s7,-80
    80203814:	00878bb3          	add	s7,a5,s0
    80203818:	de0bbc23          	sd	zero,-520(s7)
  int ret = exec(path, argv);
    8020381c:	da840593          	addi	a1,s0,-600
    80203820:	ea840513          	addi	a0,s0,-344
    80203824:	00001097          	auipc	ra,0x1
    80203828:	f2a080e7          	jalr	-214(ra) # 8020474e <exec>
    8020382c:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020382e:	100a0a13          	addi	s4,s4,256
    80203832:	6088                	ld	a0,0(s1)
    80203834:	c911                	beqz	a0,80203848 <sys_execve+0x116>
    kfree(argv[i]);
    80203836:	ffffd097          	auipc	ra,0xffffd
    8020383a:	c0a080e7          	jalr	-1014(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020383e:	04a1                	addi	s1,s1,8
    80203840:	ff4499e3          	bne	s1,s4,80203832 <sys_execve+0x100>
    80203844:	a011                	j	80203848 <sys_execve+0x116>
  return -1;
    80203846:	597d                	li	s2,-1
}
    80203848:	854a                	mv	a0,s2
    8020384a:	26813083          	ld	ra,616(sp)
    8020384e:	26013403          	ld	s0,608(sp)
    80203852:	25813483          	ld	s1,600(sp)
    80203856:	25013903          	ld	s2,592(sp)
    8020385a:	24813983          	ld	s3,584(sp)
    8020385e:	24013a03          	ld	s4,576(sp)
    80203862:	23813a83          	ld	s5,568(sp)
    80203866:	23013b03          	ld	s6,560(sp)
    8020386a:	22813b83          	ld	s7,552(sp)
    8020386e:	27010113          	addi	sp,sp,624
    80203872:	8082                	ret

0000000080203874 <sys_getppid>:

uint64
sys_getppid(void)
{
    80203874:	1141                	addi	sp,sp,-16
    80203876:	e406                	sd	ra,8(sp)
    80203878:	e022                	sd	s0,0(sp)
    8020387a:	0800                	addi	s0,sp,16
  return myproc()->parent->pid;
    8020387c:	ffffe097          	auipc	ra,0xffffe
    80203880:	23a080e7          	jalr	570(ra) # 80201ab6 <myproc>
    80203884:	711c                	ld	a5,32(a0)
}
    80203886:	5f88                	lw	a0,56(a5)
    80203888:	60a2                	ld	ra,8(sp)
    8020388a:	6402                	ld	s0,0(sp)
    8020388c:	0141                	addi	sp,sp,16
    8020388e:	8082                	ret

0000000080203890 <sys_gettimeofday>:

uint64
sys_gettimeofday(void){
    80203890:	7179                	addi	sp,sp,-48
    80203892:	f406                	sd	ra,40(sp)
    80203894:	f022                	sd	s0,32(sp)
    80203896:	1800                	addi	s0,sp,48
  asm volatile("rdtime %0" : "=r" (x) );
    80203898:	c0102773          	rdtime	a4
  TimeVal tval;
	uint64 tmp_ticks = r_time();
	tval.sec = tmp_ticks / CLK_FREQ * 10;
    8020389c:	025317b7          	lui	a5,0x2531
    802038a0:	7c078793          	addi	a5,a5,1984 # 25317c0 <_entry-0x7dcce840>
    802038a4:	02f75733          	divu	a4,a4,a5
    802038a8:	00271793          	slli	a5,a4,0x2
    802038ac:	97ba                	add	a5,a5,a4
    802038ae:	0786                	slli	a5,a5,0x1
    802038b0:	fef43023          	sd	a5,-32(s0)
  uint64 ptval;
  if (argaddr(0, &ptval) < 0) {
    802038b4:	fd840593          	addi	a1,s0,-40
    802038b8:	4501                	li	a0,0
    802038ba:	00000097          	auipc	ra,0x0
    802038be:	8a0080e7          	jalr	-1888(ra) # 8020315a <argaddr>
    802038c2:	02054263          	bltz	a0,802038e6 <sys_gettimeofday+0x56>
		return -1;
	}
	if (ptval && copyout2(ptval, (char*)&tval, sizeof(tval)) < 0) {
    802038c6:	fd843503          	ld	a0,-40(s0)
    802038ca:	e509                	bnez	a0,802038d4 <sys_gettimeofday+0x44>
		return -1;
	}
	return 0;
}
    802038cc:	70a2                	ld	ra,40(sp)
    802038ce:	7402                	ld	s0,32(sp)
    802038d0:	6145                	addi	sp,sp,48
    802038d2:	8082                	ret
	if (ptval && copyout2(ptval, (char*)&tval, sizeof(tval)) < 0) {
    802038d4:	4641                	li	a2,16
    802038d6:	fe040593          	addi	a1,s0,-32
    802038da:	ffffe097          	auipc	ra,0xffffe
    802038de:	a98080e7          	jalr	-1384(ra) # 80201372 <copyout2>
    802038e2:	957d                	srai	a0,a0,0x3f
    802038e4:	b7e5                	j	802038cc <sys_gettimeofday+0x3c>
		return -1;
    802038e6:	557d                	li	a0,-1
    802038e8:	b7d5                	j	802038cc <sys_gettimeofday+0x3c>

00000000802038ea <sys_nanosleep>:

uint64
sys_nanosleep(void){
    802038ea:	715d                	addi	sp,sp,-80
    802038ec:	e486                	sd	ra,72(sp)
    802038ee:	e0a2                	sd	s0,64(sp)
    802038f0:	fc26                	sd	s1,56(sp)
    802038f2:	f84a                	sd	s2,48(sp)
    802038f4:	f44e                	sd	s3,40(sp)
    802038f6:	f052                	sd	s4,32(sp)
    802038f8:	0880                	addi	s0,sp,80
  int n;
  uint64 req_, rem_, ticks0;
  if (argaddr(0, &req_) < 0 || argaddr(1, &rem_) < 0)
    802038fa:	fc840593          	addi	a1,s0,-56
    802038fe:	4501                	li	a0,0
    80203900:	00000097          	auipc	ra,0x0
    80203904:	85a080e7          	jalr	-1958(ra) # 8020315a <argaddr>
    return -1;
    80203908:	57fd                	li	a5,-1
  if (argaddr(0, &req_) < 0 || argaddr(1, &rem_) < 0)
    8020390a:	0a054e63          	bltz	a0,802039c6 <sys_nanosleep+0xdc>
    8020390e:	fc040593          	addi	a1,s0,-64
    80203912:	4505                	li	a0,1
    80203914:	00000097          	auipc	ra,0x0
    80203918:	846080e7          	jalr	-1978(ra) # 8020315a <argaddr>
    return -1;
    8020391c:	57fd                	li	a5,-1
  if (argaddr(0, &req_) < 0 || argaddr(1, &rem_) < 0)
    8020391e:	0a054463          	bltz	a0,802039c6 <sys_nanosleep+0xdc>

	struct proc *p = myproc();
    80203922:	ffffe097          	auipc	ra,0xffffe
    80203926:	194080e7          	jalr	404(ra) # 80201ab6 <myproc>
    8020392a:	89aa                	mv	s3,a0
  uint64 sec, usec;
	if (copyin2((char*)&sec, req_, sizeof(sec)) < 0) 
    8020392c:	4621                	li	a2,8
    8020392e:	fc843583          	ld	a1,-56(s0)
    80203932:	fb840513          	addi	a0,s0,-72
    80203936:	ffffe097          	auipc	ra,0xffffe
    8020393a:	b6e080e7          	jalr	-1170(ra) # 802014a4 <copyin2>
		return -1;
    8020393e:	57fd                	li	a5,-1
	if (copyin2((char*)&sec, req_, sizeof(sec)) < 0) 
    80203940:	08054363          	bltz	a0,802039c6 <sys_nanosleep+0xdc>
	if (copyin2((char*)&usec, rem_, sizeof(usec)) < 0) 
    80203944:	4621                	li	a2,8
    80203946:	fc043583          	ld	a1,-64(s0)
    8020394a:	fb040513          	addi	a0,s0,-80
    8020394e:	ffffe097          	auipc	ra,0xffffe
    80203952:	b56080e7          	jalr	-1194(ra) # 802014a4 <copyin2>
		return -1;
    80203956:	57fd                	li	a5,-1
	if (copyin2((char*)&usec, rem_, sizeof(usec)) < 0) 
    80203958:	06054763          	bltz	a0,802039c6 <sys_nanosleep+0xdc>
	n = sec * 20 + usec / 50000000;
    8020395c:	fb843783          	ld	a5,-72(s0)
    80203960:	0027949b          	slliw	s1,a5,0x2
    80203964:	9cbd                	addw	s1,s1,a5
    80203966:	0024949b          	slliw	s1,s1,0x2
    8020396a:	fb043783          	ld	a5,-80(s0)
    8020396e:	02faf737          	lui	a4,0x2faf
    80203972:	08070713          	addi	a4,a4,128 # 2faf080 <_entry-0x7d250f80>
    80203976:	02e7d7b3          	divu	a5,a5,a4
    8020397a:	9cbd                	addw	s1,s1,a5

  acquire(&p->lock);
    8020397c:	854e                	mv	a0,s3
    8020397e:	ffffd097          	auipc	ra,0xffffd
    80203982:	d48080e7          	jalr	-696(ra) # 802006c6 <acquire>
  ticks0 = ticks;
    80203986:	0000a797          	auipc	a5,0xa
    8020398a:	3727b783          	ld	a5,882(a5) # 8020dcf8 <_GLOBAL_OFFSET_TABLE_+0x40>
    8020398e:	0007ea03          	lwu	s4,0(a5)
  while(ticks - ticks0 < n){
    80203992:	c485                	beqz	s1,802039ba <sys_nanosleep+0xd0>
    if(myproc()->killed){
      return -1;
    }
    sleep(&ticks, &p->lock);
    80203994:	893e                	mv	s2,a5
    if(myproc()->killed){
    80203996:	ffffe097          	auipc	ra,0xffffe
    8020399a:	120080e7          	jalr	288(ra) # 80201ab6 <myproc>
    8020399e:	591c                	lw	a5,48(a0)
    802039a0:	ef85                	bnez	a5,802039d8 <sys_nanosleep+0xee>
    sleep(&ticks, &p->lock);
    802039a2:	85ce                	mv	a1,s3
    802039a4:	854a                	mv	a0,s2
    802039a6:	fffff097          	auipc	ra,0xfffff
    802039aa:	9d0080e7          	jalr	-1584(ra) # 80202376 <sleep>
  while(ticks - ticks0 < n){
    802039ae:	00096783          	lwu	a5,0(s2)
    802039b2:	414787b3          	sub	a5,a5,s4
    802039b6:	fe97e0e3          	bltu	a5,s1,80203996 <sys_nanosleep+0xac>
  }
  release(&p->lock);
    802039ba:	854e                	mv	a0,s3
    802039bc:	ffffd097          	auipc	ra,0xffffd
    802039c0:	d5e080e7          	jalr	-674(ra) # 8020071a <release>
  return 0;
    802039c4:	4781                	li	a5,0
}
    802039c6:	853e                	mv	a0,a5
    802039c8:	60a6                	ld	ra,72(sp)
    802039ca:	6406                	ld	s0,64(sp)
    802039cc:	74e2                	ld	s1,56(sp)
    802039ce:	7942                	ld	s2,48(sp)
    802039d0:	79a2                	ld	s3,40(sp)
    802039d2:	7a02                	ld	s4,32(sp)
    802039d4:	6161                	addi	sp,sp,80
    802039d6:	8082                	ret
      return -1;
    802039d8:	57fd                	li	a5,-1
    802039da:	b7f5                	j	802039c6 <sys_nanosleep+0xdc>

00000000802039dc <sys_times>:


uint64
sys_times(void)
{
    802039dc:	1101                	addi	sp,sp,-32
    802039de:	ec06                	sd	ra,24(sp)
    802039e0:	e822                	sd	s0,16(sp)
    802039e2:	1000                	addi	s0,sp,32
  uint64 tms;
  argaddr(0, &tms);
    802039e4:	fe840593          	addi	a1,s0,-24
    802039e8:	4501                	li	a0,0
    802039ea:	fffff097          	auipc	ra,0xfffff
    802039ee:	770080e7          	jalr	1904(ra) # 8020315a <argaddr>
  struct proc *p = myproc();
    802039f2:	ffffe097          	auipc	ra,0xffffe
    802039f6:	0c4080e7          	jalr	196(ra) # 80201ab6 <myproc>
    802039fa:	85aa                	mv	a1,a0
  if (tms) {
    802039fc:	fe843783          	ld	a5,-24(s0)
    if(copyout2(tms, (char*)&p->proc_tms, sizeof(p->proc_tms)) == -1)
      return -1;
  }
  else
    return -1;
    80203a00:	557d                	li	a0,-1
  if (tms) {
    80203a02:	cf99                	beqz	a5,80203a20 <sys_times+0x44>
    if(copyout2(tms, (char*)&p->proc_tms, sizeof(p->proc_tms)) == -1)
    80203a04:	02000613          	li	a2,32
    80203a08:	27058593          	addi	a1,a1,624 # 1270 <_entry-0x801fed90>
    80203a0c:	853e                	mv	a0,a5
    80203a0e:	ffffe097          	auipc	ra,0xffffe
    80203a12:	964080e7          	jalr	-1692(ra) # 80201372 <copyout2>
    80203a16:	57fd                	li	a5,-1
    80203a18:	00f50863          	beq	a0,a5,80203a28 <sys_times+0x4c>
    80203a1c:	c0102573          	rdtime	a0
  return r_time();
}
    80203a20:	60e2                	ld	ra,24(sp)
    80203a22:	6442                	ld	s0,16(sp)
    80203a24:	6105                	addi	sp,sp,32
    80203a26:	8082                	ret
      return -1;
    80203a28:	557d                	li	a0,-1
    80203a2a:	bfdd                	j	80203a20 <sys_times+0x44>

0000000080203a2c <sys_sched_yield>:

uint64
sys_sched_yield(void)
{
    80203a2c:	1141                	addi	sp,sp,-16
    80203a2e:	e406                	sd	ra,8(sp)
    80203a30:	e022                	sd	s0,0(sp)
    80203a32:	0800                	addi	s0,sp,16
  yield();
    80203a34:	fffff097          	auipc	ra,0xfffff
    80203a38:	906080e7          	jalr	-1786(ra) # 8020233a <yield>
  return 0;
}
    80203a3c:	4501                	li	a0,0
    80203a3e:	60a2                	ld	ra,8(sp)
    80203a40:	6402                	ld	s0,0(sp)
    80203a42:	0141                	addi	sp,sp,16
    80203a44:	8082                	ret

0000000080203a46 <sys_poweroff>:


// Power off QEMU
uint64
sys_poweroff(void)
{
    80203a46:	1141                	addi	sp,sp,-16
    80203a48:	e406                	sd	ra,8(sp)
    80203a4a:	e022                	sd	s0,0(sp)
    80203a4c:	0800                	addi	s0,sp,16
  printf("Powering off...\n");
    80203a4e:	00007517          	auipc	a0,0x7
    80203a52:	1ba50513          	addi	a0,a0,442 # 8020ac08 <digits+0x888>
    80203a56:	ffffc097          	auipc	ra,0xffffc
    80203a5a:	738080e7          	jalr	1848(ra) # 8020018e <printf>
	SBI_CALL_0(SBI_SHUTDOWN);
    80203a5e:	4501                	li	a0,0
    80203a60:	4581                	li	a1,0
    80203a62:	4601                	li	a2,0
    80203a64:	4681                	li	a3,0
    80203a66:	48a1                	li	a7,8
    80203a68:	00000073          	ecall
  sbi_shutdown();
  panic("sys_poweroff");
    80203a6c:	00007517          	auipc	a0,0x7
    80203a70:	1b450513          	addi	a0,a0,436 # 8020ac20 <digits+0x8a0>
    80203a74:	ffffc097          	auipc	ra,0xffffc
    80203a78:	6d0080e7          	jalr	1744(ra) # 80200144 <panic>

0000000080203a7c <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80203a7c:	7139                	addi	sp,sp,-64
    80203a7e:	fc06                	sd	ra,56(sp)
    80203a80:	f822                	sd	s0,48(sp)
    80203a82:	f426                	sd	s1,40(sp)
    80203a84:	f04a                	sd	s2,32(sp)
    80203a86:	ec4e                	sd	s3,24(sp)
    80203a88:	e852                	sd	s4,16(sp)
    80203a8a:	e456                	sd	s5,8(sp)
    80203a8c:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80203a8e:	00007597          	auipc	a1,0x7
    80203a92:	1a258593          	addi	a1,a1,418 # 8020ac30 <digits+0x8b0>
    80203a96:	0001b517          	auipc	a0,0x1b
    80203a9a:	a2a50513          	addi	a0,a0,-1494 # 8021e4c0 <bcache>
    80203a9e:	ffffd097          	auipc	ra,0xffffd
    80203aa2:	be4080e7          	jalr	-1052(ra) # 80200682 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80203aa6:	0001f797          	auipc	a5,0x1f
    80203aaa:	a1a78793          	addi	a5,a5,-1510 # 802224c0 <bcache+0x4000>
    80203aae:	0001f717          	auipc	a4,0x1f
    80203ab2:	07a70713          	addi	a4,a4,122 # 80222b28 <bcache+0x4668>
    80203ab6:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    80203aba:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203abe:	0001b497          	auipc	s1,0x1b
    80203ac2:	a1a48493          	addi	s1,s1,-1510 # 8021e4d8 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    80203ac6:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    80203ac8:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    80203aca:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    80203acc:	00007a97          	auipc	s5,0x7
    80203ad0:	16ca8a93          	addi	s5,s5,364 # 8020ac38 <digits+0x8b8>
    b->refcnt = 0;
    80203ad4:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    80203ad8:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    80203adc:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    80203ae0:	6b893783          	ld	a5,1720(s2)
    80203ae4:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    80203ae6:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    80203aea:	85d6                	mv	a1,s5
    80203aec:	01048513          	addi	a0,s1,16
    80203af0:	00000097          	auipc	ra,0x0
    80203af4:	26e080e7          	jalr	622(ra) # 80203d5e <initsleeplock>
    bcache.head.next->prev = b;
    80203af8:	6b893783          	ld	a5,1720(s2)
    80203afc:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    80203afe:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203b02:	25848493          	addi	s1,s1,600
    80203b06:	fd3497e3          	bne	s1,s3,80203ad4 <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    80203b0a:	70e2                	ld	ra,56(sp)
    80203b0c:	7442                	ld	s0,48(sp)
    80203b0e:	74a2                	ld	s1,40(sp)
    80203b10:	7902                	ld	s2,32(sp)
    80203b12:	69e2                	ld	s3,24(sp)
    80203b14:	6a42                	ld	s4,16(sp)
    80203b16:	6aa2                	ld	s5,8(sp)
    80203b18:	6121                	addi	sp,sp,64
    80203b1a:	8082                	ret

0000000080203b1c <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    80203b1c:	7179                	addi	sp,sp,-48
    80203b1e:	f406                	sd	ra,40(sp)
    80203b20:	f022                	sd	s0,32(sp)
    80203b22:	ec26                	sd	s1,24(sp)
    80203b24:	e84a                	sd	s2,16(sp)
    80203b26:	e44e                	sd	s3,8(sp)
    80203b28:	1800                	addi	s0,sp,48
    80203b2a:	892a                	mv	s2,a0
    80203b2c:	89ae                	mv	s3,a1
  acquire(&bcache.lock);
    80203b2e:	0001b517          	auipc	a0,0x1b
    80203b32:	99250513          	addi	a0,a0,-1646 # 8021e4c0 <bcache>
    80203b36:	ffffd097          	auipc	ra,0xffffd
    80203b3a:	b90080e7          	jalr	-1136(ra) # 802006c6 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80203b3e:	0001f497          	auipc	s1,0x1f
    80203b42:	03a4b483          	ld	s1,58(s1) # 80222b78 <bcache+0x46b8>
    80203b46:	0001f797          	auipc	a5,0x1f
    80203b4a:	fe278793          	addi	a5,a5,-30 # 80222b28 <bcache+0x4668>
    80203b4e:	02f48f63          	beq	s1,a5,80203b8c <bread+0x70>
    80203b52:	873e                	mv	a4,a5
    80203b54:	a021                	j	80203b5c <bread+0x40>
    80203b56:	68a4                	ld	s1,80(s1)
    80203b58:	02e48a63          	beq	s1,a4,80203b8c <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    80203b5c:	449c                	lw	a5,8(s1)
    80203b5e:	ff279ce3          	bne	a5,s2,80203b56 <bread+0x3a>
    80203b62:	44dc                	lw	a5,12(s1)
    80203b64:	ff3799e3          	bne	a5,s3,80203b56 <bread+0x3a>
      b->refcnt++;
    80203b68:	40bc                	lw	a5,64(s1)
    80203b6a:	2785                	addiw	a5,a5,1
    80203b6c:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203b6e:	0001b517          	auipc	a0,0x1b
    80203b72:	95250513          	addi	a0,a0,-1710 # 8021e4c0 <bcache>
    80203b76:	ffffd097          	auipc	ra,0xffffd
    80203b7a:	ba4080e7          	jalr	-1116(ra) # 8020071a <release>
      acquiresleep(&b->lock);
    80203b7e:	01048513          	addi	a0,s1,16
    80203b82:	00000097          	auipc	ra,0x0
    80203b86:	216080e7          	jalr	534(ra) # 80203d98 <acquiresleep>
      return b;
    80203b8a:	a8b9                	j	80203be8 <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203b8c:	0001f497          	auipc	s1,0x1f
    80203b90:	fe44b483          	ld	s1,-28(s1) # 80222b70 <bcache+0x46b0>
    80203b94:	0001f797          	auipc	a5,0x1f
    80203b98:	f9478793          	addi	a5,a5,-108 # 80222b28 <bcache+0x4668>
    80203b9c:	00f48863          	beq	s1,a5,80203bac <bread+0x90>
    80203ba0:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    80203ba2:	40bc                	lw	a5,64(s1)
    80203ba4:	cf81                	beqz	a5,80203bbc <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203ba6:	64a4                	ld	s1,72(s1)
    80203ba8:	fee49de3          	bne	s1,a4,80203ba2 <bread+0x86>
  panic("bget: no buffers");
    80203bac:	00007517          	auipc	a0,0x7
    80203bb0:	09450513          	addi	a0,a0,148 # 8020ac40 <digits+0x8c0>
    80203bb4:	ffffc097          	auipc	ra,0xffffc
    80203bb8:	590080e7          	jalr	1424(ra) # 80200144 <panic>
      b->dev = dev;
    80203bbc:	0124a423          	sw	s2,8(s1)
      b->sectorno = sectorno;
    80203bc0:	0134a623          	sw	s3,12(s1)
      b->valid = 0;
    80203bc4:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    80203bc8:	4785                	li	a5,1
    80203bca:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203bcc:	0001b517          	auipc	a0,0x1b
    80203bd0:	8f450513          	addi	a0,a0,-1804 # 8021e4c0 <bcache>
    80203bd4:	ffffd097          	auipc	ra,0xffffd
    80203bd8:	b46080e7          	jalr	-1210(ra) # 8020071a <release>
      acquiresleep(&b->lock);
    80203bdc:	01048513          	addi	a0,s1,16
    80203be0:	00000097          	auipc	ra,0x0
    80203be4:	1b8080e7          	jalr	440(ra) # 80203d98 <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    80203be8:	409c                	lw	a5,0(s1)
    80203bea:	cb89                	beqz	a5,80203bfc <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    80203bec:	8526                	mv	a0,s1
    80203bee:	70a2                	ld	ra,40(sp)
    80203bf0:	7402                	ld	s0,32(sp)
    80203bf2:	64e2                	ld	s1,24(sp)
    80203bf4:	6942                	ld	s2,16(sp)
    80203bf6:	69a2                	ld	s3,8(sp)
    80203bf8:	6145                	addi	sp,sp,48
    80203bfa:	8082                	ret
    disk_read(b);
    80203bfc:	8526                	mv	a0,s1
    80203bfe:	00002097          	auipc	ra,0x2
    80203c02:	494080e7          	jalr	1172(ra) # 80206092 <disk_read>
    b->valid = 1;
    80203c06:	4785                	li	a5,1
    80203c08:	c09c                	sw	a5,0(s1)
  return b;
    80203c0a:	b7cd                	j	80203bec <bread+0xd0>

0000000080203c0c <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    80203c0c:	1101                	addi	sp,sp,-32
    80203c0e:	ec06                	sd	ra,24(sp)
    80203c10:	e822                	sd	s0,16(sp)
    80203c12:	e426                	sd	s1,8(sp)
    80203c14:	1000                	addi	s0,sp,32
    80203c16:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203c18:	0541                	addi	a0,a0,16
    80203c1a:	00000097          	auipc	ra,0x0
    80203c1e:	218080e7          	jalr	536(ra) # 80203e32 <holdingsleep>
    80203c22:	c919                	beqz	a0,80203c38 <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    80203c24:	8526                	mv	a0,s1
    80203c26:	00002097          	auipc	ra,0x2
    80203c2a:	486080e7          	jalr	1158(ra) # 802060ac <disk_write>
}
    80203c2e:	60e2                	ld	ra,24(sp)
    80203c30:	6442                	ld	s0,16(sp)
    80203c32:	64a2                	ld	s1,8(sp)
    80203c34:	6105                	addi	sp,sp,32
    80203c36:	8082                	ret
    panic("bwrite");
    80203c38:	00007517          	auipc	a0,0x7
    80203c3c:	02050513          	addi	a0,a0,32 # 8020ac58 <digits+0x8d8>
    80203c40:	ffffc097          	auipc	ra,0xffffc
    80203c44:	504080e7          	jalr	1284(ra) # 80200144 <panic>

0000000080203c48 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80203c48:	1101                	addi	sp,sp,-32
    80203c4a:	ec06                	sd	ra,24(sp)
    80203c4c:	e822                	sd	s0,16(sp)
    80203c4e:	e426                	sd	s1,8(sp)
    80203c50:	e04a                	sd	s2,0(sp)
    80203c52:	1000                	addi	s0,sp,32
    80203c54:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203c56:	01050913          	addi	s2,a0,16
    80203c5a:	854a                	mv	a0,s2
    80203c5c:	00000097          	auipc	ra,0x0
    80203c60:	1d6080e7          	jalr	470(ra) # 80203e32 <holdingsleep>
    80203c64:	c92d                	beqz	a0,80203cd6 <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80203c66:	854a                	mv	a0,s2
    80203c68:	00000097          	auipc	ra,0x0
    80203c6c:	186080e7          	jalr	390(ra) # 80203dee <releasesleep>

  acquire(&bcache.lock);
    80203c70:	0001b517          	auipc	a0,0x1b
    80203c74:	85050513          	addi	a0,a0,-1968 # 8021e4c0 <bcache>
    80203c78:	ffffd097          	auipc	ra,0xffffd
    80203c7c:	a4e080e7          	jalr	-1458(ra) # 802006c6 <acquire>
  b->refcnt--;
    80203c80:	40bc                	lw	a5,64(s1)
    80203c82:	37fd                	addiw	a5,a5,-1
    80203c84:	0007871b          	sext.w	a4,a5
    80203c88:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80203c8a:	eb05                	bnez	a4,80203cba <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80203c8c:	68bc                	ld	a5,80(s1)
    80203c8e:	64b8                	ld	a4,72(s1)
    80203c90:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203c92:	64bc                	ld	a5,72(s1)
    80203c94:	68b8                	ld	a4,80(s1)
    80203c96:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80203c98:	0001f797          	auipc	a5,0x1f
    80203c9c:	82878793          	addi	a5,a5,-2008 # 802224c0 <bcache+0x4000>
    80203ca0:	6b87b703          	ld	a4,1720(a5)
    80203ca4:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    80203ca6:	0001f717          	auipc	a4,0x1f
    80203caa:	e8270713          	addi	a4,a4,-382 # 80222b28 <bcache+0x4668>
    80203cae:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    80203cb0:	6b87b703          	ld	a4,1720(a5)
    80203cb4:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    80203cb6:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    80203cba:	0001b517          	auipc	a0,0x1b
    80203cbe:	80650513          	addi	a0,a0,-2042 # 8021e4c0 <bcache>
    80203cc2:	ffffd097          	auipc	ra,0xffffd
    80203cc6:	a58080e7          	jalr	-1448(ra) # 8020071a <release>
}
    80203cca:	60e2                	ld	ra,24(sp)
    80203ccc:	6442                	ld	s0,16(sp)
    80203cce:	64a2                	ld	s1,8(sp)
    80203cd0:	6902                	ld	s2,0(sp)
    80203cd2:	6105                	addi	sp,sp,32
    80203cd4:	8082                	ret
    panic("brelse");
    80203cd6:	00007517          	auipc	a0,0x7
    80203cda:	f8a50513          	addi	a0,a0,-118 # 8020ac60 <digits+0x8e0>
    80203cde:	ffffc097          	auipc	ra,0xffffc
    80203ce2:	466080e7          	jalr	1126(ra) # 80200144 <panic>

0000000080203ce6 <bpin>:

void
bpin(struct buf *b) {
    80203ce6:	1101                	addi	sp,sp,-32
    80203ce8:	ec06                	sd	ra,24(sp)
    80203cea:	e822                	sd	s0,16(sp)
    80203cec:	e426                	sd	s1,8(sp)
    80203cee:	1000                	addi	s0,sp,32
    80203cf0:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203cf2:	0001a517          	auipc	a0,0x1a
    80203cf6:	7ce50513          	addi	a0,a0,1998 # 8021e4c0 <bcache>
    80203cfa:	ffffd097          	auipc	ra,0xffffd
    80203cfe:	9cc080e7          	jalr	-1588(ra) # 802006c6 <acquire>
  b->refcnt++;
    80203d02:	40bc                	lw	a5,64(s1)
    80203d04:	2785                	addiw	a5,a5,1
    80203d06:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203d08:	0001a517          	auipc	a0,0x1a
    80203d0c:	7b850513          	addi	a0,a0,1976 # 8021e4c0 <bcache>
    80203d10:	ffffd097          	auipc	ra,0xffffd
    80203d14:	a0a080e7          	jalr	-1526(ra) # 8020071a <release>
}
    80203d18:	60e2                	ld	ra,24(sp)
    80203d1a:	6442                	ld	s0,16(sp)
    80203d1c:	64a2                	ld	s1,8(sp)
    80203d1e:	6105                	addi	sp,sp,32
    80203d20:	8082                	ret

0000000080203d22 <bunpin>:

void
bunpin(struct buf *b) {
    80203d22:	1101                	addi	sp,sp,-32
    80203d24:	ec06                	sd	ra,24(sp)
    80203d26:	e822                	sd	s0,16(sp)
    80203d28:	e426                	sd	s1,8(sp)
    80203d2a:	1000                	addi	s0,sp,32
    80203d2c:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203d2e:	0001a517          	auipc	a0,0x1a
    80203d32:	79250513          	addi	a0,a0,1938 # 8021e4c0 <bcache>
    80203d36:	ffffd097          	auipc	ra,0xffffd
    80203d3a:	990080e7          	jalr	-1648(ra) # 802006c6 <acquire>
  b->refcnt--;
    80203d3e:	40bc                	lw	a5,64(s1)
    80203d40:	37fd                	addiw	a5,a5,-1
    80203d42:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203d44:	0001a517          	auipc	a0,0x1a
    80203d48:	77c50513          	addi	a0,a0,1916 # 8021e4c0 <bcache>
    80203d4c:	ffffd097          	auipc	ra,0xffffd
    80203d50:	9ce080e7          	jalr	-1586(ra) # 8020071a <release>
}
    80203d54:	60e2                	ld	ra,24(sp)
    80203d56:	6442                	ld	s0,16(sp)
    80203d58:	64a2                	ld	s1,8(sp)
    80203d5a:	6105                	addi	sp,sp,32
    80203d5c:	8082                	ret

0000000080203d5e <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203d5e:	1101                	addi	sp,sp,-32
    80203d60:	ec06                	sd	ra,24(sp)
    80203d62:	e822                	sd	s0,16(sp)
    80203d64:	e426                	sd	s1,8(sp)
    80203d66:	e04a                	sd	s2,0(sp)
    80203d68:	1000                	addi	s0,sp,32
    80203d6a:	84aa                	mv	s1,a0
    80203d6c:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203d6e:	00007597          	auipc	a1,0x7
    80203d72:	efa58593          	addi	a1,a1,-262 # 8020ac68 <digits+0x8e8>
    80203d76:	0521                	addi	a0,a0,8
    80203d78:	ffffd097          	auipc	ra,0xffffd
    80203d7c:	90a080e7          	jalr	-1782(ra) # 80200682 <initlock>
  lk->name = name;
    80203d80:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203d84:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203d88:	0204a423          	sw	zero,40(s1)
}
    80203d8c:	60e2                	ld	ra,24(sp)
    80203d8e:	6442                	ld	s0,16(sp)
    80203d90:	64a2                	ld	s1,8(sp)
    80203d92:	6902                	ld	s2,0(sp)
    80203d94:	6105                	addi	sp,sp,32
    80203d96:	8082                	ret

0000000080203d98 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80203d98:	1101                	addi	sp,sp,-32
    80203d9a:	ec06                	sd	ra,24(sp)
    80203d9c:	e822                	sd	s0,16(sp)
    80203d9e:	e426                	sd	s1,8(sp)
    80203da0:	e04a                	sd	s2,0(sp)
    80203da2:	1000                	addi	s0,sp,32
    80203da4:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203da6:	00850913          	addi	s2,a0,8
    80203daa:	854a                	mv	a0,s2
    80203dac:	ffffd097          	auipc	ra,0xffffd
    80203db0:	91a080e7          	jalr	-1766(ra) # 802006c6 <acquire>
  while (lk->locked) {
    80203db4:	409c                	lw	a5,0(s1)
    80203db6:	cb89                	beqz	a5,80203dc8 <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    80203db8:	85ca                	mv	a1,s2
    80203dba:	8526                	mv	a0,s1
    80203dbc:	ffffe097          	auipc	ra,0xffffe
    80203dc0:	5ba080e7          	jalr	1466(ra) # 80202376 <sleep>
  while (lk->locked) {
    80203dc4:	409c                	lw	a5,0(s1)
    80203dc6:	fbed                	bnez	a5,80203db8 <acquiresleep+0x20>
  }
  lk->locked = 1;
    80203dc8:	4785                	li	a5,1
    80203dca:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    80203dcc:	ffffe097          	auipc	ra,0xffffe
    80203dd0:	cea080e7          	jalr	-790(ra) # 80201ab6 <myproc>
    80203dd4:	5d1c                	lw	a5,56(a0)
    80203dd6:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    80203dd8:	854a                	mv	a0,s2
    80203dda:	ffffd097          	auipc	ra,0xffffd
    80203dde:	940080e7          	jalr	-1728(ra) # 8020071a <release>
}
    80203de2:	60e2                	ld	ra,24(sp)
    80203de4:	6442                	ld	s0,16(sp)
    80203de6:	64a2                	ld	s1,8(sp)
    80203de8:	6902                	ld	s2,0(sp)
    80203dea:	6105                	addi	sp,sp,32
    80203dec:	8082                	ret

0000000080203dee <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80203dee:	1101                	addi	sp,sp,-32
    80203df0:	ec06                	sd	ra,24(sp)
    80203df2:	e822                	sd	s0,16(sp)
    80203df4:	e426                	sd	s1,8(sp)
    80203df6:	e04a                	sd	s2,0(sp)
    80203df8:	1000                	addi	s0,sp,32
    80203dfa:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203dfc:	00850913          	addi	s2,a0,8
    80203e00:	854a                	mv	a0,s2
    80203e02:	ffffd097          	auipc	ra,0xffffd
    80203e06:	8c4080e7          	jalr	-1852(ra) # 802006c6 <acquire>
  lk->locked = 0;
    80203e0a:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203e0e:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203e12:	8526                	mv	a0,s1
    80203e14:	ffffe097          	auipc	ra,0xffffe
    80203e18:	6de080e7          	jalr	1758(ra) # 802024f2 <wakeup>
  release(&lk->lk);
    80203e1c:	854a                	mv	a0,s2
    80203e1e:	ffffd097          	auipc	ra,0xffffd
    80203e22:	8fc080e7          	jalr	-1796(ra) # 8020071a <release>
}
    80203e26:	60e2                	ld	ra,24(sp)
    80203e28:	6442                	ld	s0,16(sp)
    80203e2a:	64a2                	ld	s1,8(sp)
    80203e2c:	6902                	ld	s2,0(sp)
    80203e2e:	6105                	addi	sp,sp,32
    80203e30:	8082                	ret

0000000080203e32 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203e32:	7179                	addi	sp,sp,-48
    80203e34:	f406                	sd	ra,40(sp)
    80203e36:	f022                	sd	s0,32(sp)
    80203e38:	ec26                	sd	s1,24(sp)
    80203e3a:	e84a                	sd	s2,16(sp)
    80203e3c:	e44e                	sd	s3,8(sp)
    80203e3e:	1800                	addi	s0,sp,48
    80203e40:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203e42:	00850913          	addi	s2,a0,8
    80203e46:	854a                	mv	a0,s2
    80203e48:	ffffd097          	auipc	ra,0xffffd
    80203e4c:	87e080e7          	jalr	-1922(ra) # 802006c6 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203e50:	409c                	lw	a5,0(s1)
    80203e52:	ef99                	bnez	a5,80203e70 <holdingsleep+0x3e>
    80203e54:	4481                	li	s1,0
  release(&lk->lk);
    80203e56:	854a                	mv	a0,s2
    80203e58:	ffffd097          	auipc	ra,0xffffd
    80203e5c:	8c2080e7          	jalr	-1854(ra) # 8020071a <release>
  return r;
}
    80203e60:	8526                	mv	a0,s1
    80203e62:	70a2                	ld	ra,40(sp)
    80203e64:	7402                	ld	s0,32(sp)
    80203e66:	64e2                	ld	s1,24(sp)
    80203e68:	6942                	ld	s2,16(sp)
    80203e6a:	69a2                	ld	s3,8(sp)
    80203e6c:	6145                	addi	sp,sp,48
    80203e6e:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203e70:	0284a983          	lw	s3,40(s1)
    80203e74:	ffffe097          	auipc	ra,0xffffe
    80203e78:	c42080e7          	jalr	-958(ra) # 80201ab6 <myproc>
    80203e7c:	5d04                	lw	s1,56(a0)
    80203e7e:	413484b3          	sub	s1,s1,s3
    80203e82:	0014b493          	seqz	s1,s1
    80203e86:	bfc1                	j	80203e56 <holdingsleep+0x24>

0000000080203e88 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203e88:	1101                	addi	sp,sp,-32
    80203e8a:	ec06                	sd	ra,24(sp)
    80203e8c:	e822                	sd	s0,16(sp)
    80203e8e:	e426                	sd	s1,8(sp)
    80203e90:	e04a                	sd	s2,0(sp)
    80203e92:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203e94:	00007597          	auipc	a1,0x7
    80203e98:	de458593          	addi	a1,a1,-540 # 8020ac78 <digits+0x8f8>
    80203e9c:	0001f517          	auipc	a0,0x1f
    80203ea0:	f8450513          	addi	a0,a0,-124 # 80222e20 <ftable>
    80203ea4:	ffffc097          	auipc	ra,0xffffc
    80203ea8:	7de080e7          	jalr	2014(ra) # 80200682 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203eac:	0001f497          	auipc	s1,0x1f
    80203eb0:	f8c48493          	addi	s1,s1,-116 # 80222e38 <ftable+0x18>
    80203eb4:	00020917          	auipc	s2,0x20
    80203eb8:	f2490913          	addi	s2,s2,-220 # 80223dd8 <tickslock>
    memset(f, 0, sizeof(struct file));
    80203ebc:	02800613          	li	a2,40
    80203ec0:	4581                	li	a1,0
    80203ec2:	8526                	mv	a0,s1
    80203ec4:	ffffd097          	auipc	ra,0xffffd
    80203ec8:	89e080e7          	jalr	-1890(ra) # 80200762 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203ecc:	02848493          	addi	s1,s1,40
    80203ed0:	ff2496e3          	bne	s1,s2,80203ebc <fileinit+0x34>
  }
  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    80203ed4:	60e2                	ld	ra,24(sp)
    80203ed6:	6442                	ld	s0,16(sp)
    80203ed8:	64a2                	ld	s1,8(sp)
    80203eda:	6902                	ld	s2,0(sp)
    80203edc:	6105                	addi	sp,sp,32
    80203ede:	8082                	ret

0000000080203ee0 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80203ee0:	1101                	addi	sp,sp,-32
    80203ee2:	ec06                	sd	ra,24(sp)
    80203ee4:	e822                	sd	s0,16(sp)
    80203ee6:	e426                	sd	s1,8(sp)
    80203ee8:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80203eea:	0001f517          	auipc	a0,0x1f
    80203eee:	f3650513          	addi	a0,a0,-202 # 80222e20 <ftable>
    80203ef2:	ffffc097          	auipc	ra,0xffffc
    80203ef6:	7d4080e7          	jalr	2004(ra) # 802006c6 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203efa:	0001f497          	auipc	s1,0x1f
    80203efe:	f3e48493          	addi	s1,s1,-194 # 80222e38 <ftable+0x18>
    80203f02:	00020717          	auipc	a4,0x20
    80203f06:	ed670713          	addi	a4,a4,-298 # 80223dd8 <tickslock>
    if(f->ref == 0){
    80203f0a:	40dc                	lw	a5,4(s1)
    80203f0c:	cf99                	beqz	a5,80203f2a <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203f0e:	02848493          	addi	s1,s1,40
    80203f12:	fee49ce3          	bne	s1,a4,80203f0a <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203f16:	0001f517          	auipc	a0,0x1f
    80203f1a:	f0a50513          	addi	a0,a0,-246 # 80222e20 <ftable>
    80203f1e:	ffffc097          	auipc	ra,0xffffc
    80203f22:	7fc080e7          	jalr	2044(ra) # 8020071a <release>
  return NULL;
    80203f26:	4481                	li	s1,0
    80203f28:	a819                	j	80203f3e <filealloc+0x5e>
      f->ref = 1;
    80203f2a:	4785                	li	a5,1
    80203f2c:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203f2e:	0001f517          	auipc	a0,0x1f
    80203f32:	ef250513          	addi	a0,a0,-270 # 80222e20 <ftable>
    80203f36:	ffffc097          	auipc	ra,0xffffc
    80203f3a:	7e4080e7          	jalr	2020(ra) # 8020071a <release>
}
    80203f3e:	8526                	mv	a0,s1
    80203f40:	60e2                	ld	ra,24(sp)
    80203f42:	6442                	ld	s0,16(sp)
    80203f44:	64a2                	ld	s1,8(sp)
    80203f46:	6105                	addi	sp,sp,32
    80203f48:	8082                	ret

0000000080203f4a <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203f4a:	1101                	addi	sp,sp,-32
    80203f4c:	ec06                	sd	ra,24(sp)
    80203f4e:	e822                	sd	s0,16(sp)
    80203f50:	e426                	sd	s1,8(sp)
    80203f52:	1000                	addi	s0,sp,32
    80203f54:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203f56:	0001f517          	auipc	a0,0x1f
    80203f5a:	eca50513          	addi	a0,a0,-310 # 80222e20 <ftable>
    80203f5e:	ffffc097          	auipc	ra,0xffffc
    80203f62:	768080e7          	jalr	1896(ra) # 802006c6 <acquire>
  if(f->ref < 1)
    80203f66:	40dc                	lw	a5,4(s1)
    80203f68:	02f05263          	blez	a5,80203f8c <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203f6c:	2785                	addiw	a5,a5,1
    80203f6e:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203f70:	0001f517          	auipc	a0,0x1f
    80203f74:	eb050513          	addi	a0,a0,-336 # 80222e20 <ftable>
    80203f78:	ffffc097          	auipc	ra,0xffffc
    80203f7c:	7a2080e7          	jalr	1954(ra) # 8020071a <release>
  return f;
}
    80203f80:	8526                	mv	a0,s1
    80203f82:	60e2                	ld	ra,24(sp)
    80203f84:	6442                	ld	s0,16(sp)
    80203f86:	64a2                	ld	s1,8(sp)
    80203f88:	6105                	addi	sp,sp,32
    80203f8a:	8082                	ret
    panic("filedup");
    80203f8c:	00007517          	auipc	a0,0x7
    80203f90:	cf450513          	addi	a0,a0,-780 # 8020ac80 <digits+0x900>
    80203f94:	ffffc097          	auipc	ra,0xffffc
    80203f98:	1b0080e7          	jalr	432(ra) # 80200144 <panic>

0000000080203f9c <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80203f9c:	7139                	addi	sp,sp,-64
    80203f9e:	fc06                	sd	ra,56(sp)
    80203fa0:	f822                	sd	s0,48(sp)
    80203fa2:	f426                	sd	s1,40(sp)
    80203fa4:	f04a                	sd	s2,32(sp)
    80203fa6:	ec4e                	sd	s3,24(sp)
    80203fa8:	e852                	sd	s4,16(sp)
    80203faa:	e456                	sd	s5,8(sp)
    80203fac:	0080                	addi	s0,sp,64
    80203fae:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80203fb0:	0001f517          	auipc	a0,0x1f
    80203fb4:	e7050513          	addi	a0,a0,-400 # 80222e20 <ftable>
    80203fb8:	ffffc097          	auipc	ra,0xffffc
    80203fbc:	70e080e7          	jalr	1806(ra) # 802006c6 <acquire>
  if(f->ref < 1)
    80203fc0:	40dc                	lw	a5,4(s1)
    80203fc2:	04f05863          	blez	a5,80204012 <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    80203fc6:	37fd                	addiw	a5,a5,-1
    80203fc8:	0007871b          	sext.w	a4,a5
    80203fcc:	c0dc                	sw	a5,4(s1)
    80203fce:	04e04a63          	bgtz	a4,80204022 <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    80203fd2:	0004a903          	lw	s2,0(s1)
    80203fd6:	0094ca03          	lbu	s4,9(s1)
    80203fda:	0104b983          	ld	s3,16(s1)
    80203fde:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    80203fe2:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    80203fe6:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    80203fea:	0001f517          	auipc	a0,0x1f
    80203fee:	e3650513          	addi	a0,a0,-458 # 80222e20 <ftable>
    80203ff2:	ffffc097          	auipc	ra,0xffffc
    80203ff6:	728080e7          	jalr	1832(ra) # 8020071a <release>

  if(ff.type == FD_PIPE){
    80203ffa:	4785                	li	a5,1
    80203ffc:	04f90463          	beq	s2,a5,80204044 <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80204000:	4789                	li	a5,2
    80204002:	02f91863          	bne	s2,a5,80204032 <fileclose+0x96>
    eput(ff.ep);
    80204006:	8556                	mv	a0,s5
    80204008:	00003097          	auipc	ra,0x3
    8020400c:	338080e7          	jalr	824(ra) # 80207340 <eput>
    80204010:	a00d                	j	80204032 <fileclose+0x96>
    panic("fileclose");
    80204012:	00007517          	auipc	a0,0x7
    80204016:	c7650513          	addi	a0,a0,-906 # 8020ac88 <digits+0x908>
    8020401a:	ffffc097          	auipc	ra,0xffffc
    8020401e:	12a080e7          	jalr	298(ra) # 80200144 <panic>
    release(&ftable.lock);
    80204022:	0001f517          	auipc	a0,0x1f
    80204026:	dfe50513          	addi	a0,a0,-514 # 80222e20 <ftable>
    8020402a:	ffffc097          	auipc	ra,0xffffc
    8020402e:	6f0080e7          	jalr	1776(ra) # 8020071a <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80204032:	70e2                	ld	ra,56(sp)
    80204034:	7442                	ld	s0,48(sp)
    80204036:	74a2                	ld	s1,40(sp)
    80204038:	7902                	ld	s2,32(sp)
    8020403a:	69e2                	ld	s3,24(sp)
    8020403c:	6a42                	ld	s4,16(sp)
    8020403e:	6aa2                	ld	s5,8(sp)
    80204040:	6121                	addi	sp,sp,64
    80204042:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80204044:	85d2                	mv	a1,s4
    80204046:	854e                	mv	a0,s3
    80204048:	00000097          	auipc	ra,0x0
    8020404c:	4ac080e7          	jalr	1196(ra) # 802044f4 <pipeclose>
    80204050:	b7cd                	j	80204032 <fileclose+0x96>

0000000080204052 <filestat>:
filestat(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80204052:	4118                	lw	a4,0(a0)
    80204054:	4789                	li	a5,2
    80204056:	04f71e63          	bne	a4,a5,802040b2 <filestat+0x60>
{
    8020405a:	7159                	addi	sp,sp,-112
    8020405c:	f486                	sd	ra,104(sp)
    8020405e:	f0a2                	sd	s0,96(sp)
    80204060:	eca6                	sd	s1,88(sp)
    80204062:	e8ca                	sd	s2,80(sp)
    80204064:	e4ce                	sd	s3,72(sp)
    80204066:	1880                	addi	s0,sp,112
    80204068:	84aa                	mv	s1,a0
    8020406a:	892e                	mv	s2,a1
    elock(f->ep);
    8020406c:	6d08                	ld	a0,24(a0)
    8020406e:	00003097          	auipc	ra,0x3
    80204072:	24e080e7          	jalr	590(ra) # 802072bc <elock>
    estat(f->ep, &st);
    80204076:	f9840993          	addi	s3,s0,-104
    8020407a:	85ce                	mv	a1,s3
    8020407c:	6c88                	ld	a0,24(s1)
    8020407e:	00003097          	auipc	ra,0x3
    80204082:	3fa080e7          	jalr	1018(ra) # 80207478 <estat>
    eunlock(f->ep);
    80204086:	6c88                	ld	a0,24(s1)
    80204088:	00003097          	auipc	ra,0x3
    8020408c:	26a080e7          	jalr	618(ra) # 802072f2 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80204090:	03800613          	li	a2,56
    80204094:	85ce                	mv	a1,s3
    80204096:	854a                	mv	a0,s2
    80204098:	ffffd097          	auipc	ra,0xffffd
    8020409c:	2da080e7          	jalr	730(ra) # 80201372 <copyout2>
    802040a0:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    802040a4:	70a6                	ld	ra,104(sp)
    802040a6:	7406                	ld	s0,96(sp)
    802040a8:	64e6                	ld	s1,88(sp)
    802040aa:	6946                	ld	s2,80(sp)
    802040ac:	69a6                	ld	s3,72(sp)
    802040ae:	6165                	addi	sp,sp,112
    802040b0:	8082                	ret
  return -1;
    802040b2:	557d                	li	a0,-1
}
    802040b4:	8082                	ret

00000000802040b6 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    802040b6:	7179                	addi	sp,sp,-48
    802040b8:	f406                	sd	ra,40(sp)
    802040ba:	f022                	sd	s0,32(sp)
    802040bc:	ec26                	sd	s1,24(sp)
    802040be:	e84a                	sd	s2,16(sp)
    802040c0:	e44e                	sd	s3,8(sp)
    802040c2:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    802040c4:	00854783          	lbu	a5,8(a0)
    802040c8:	c3d5                	beqz	a5,8020416c <fileread+0xb6>
    802040ca:	84aa                	mv	s1,a0
    802040cc:	89ae                	mv	s3,a1
    802040ce:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    802040d0:	411c                	lw	a5,0(a0)
    802040d2:	4709                	li	a4,2
    802040d4:	06e78263          	beq	a5,a4,80204138 <fileread+0x82>
    802040d8:	470d                	li	a4,3
    802040da:	02e78b63          	beq	a5,a4,80204110 <fileread+0x5a>
    802040de:	4705                	li	a4,1
    802040e0:	00e78a63          	beq	a5,a4,802040f4 <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    802040e4:	00007517          	auipc	a0,0x7
    802040e8:	bb450513          	addi	a0,a0,-1100 # 8020ac98 <digits+0x918>
    802040ec:	ffffc097          	auipc	ra,0xffffc
    802040f0:	058080e7          	jalr	88(ra) # 80200144 <panic>
        r = piperead(f->pipe, addr, n);
    802040f4:	6908                	ld	a0,16(a0)
    802040f6:	00000097          	auipc	ra,0x0
    802040fa:	572080e7          	jalr	1394(ra) # 80204668 <piperead>
    802040fe:	892a                	mv	s2,a0
  }

  return r;
}
    80204100:	854a                	mv	a0,s2
    80204102:	70a2                	ld	ra,40(sp)
    80204104:	7402                	ld	s0,32(sp)
    80204106:	64e2                	ld	s1,24(sp)
    80204108:	6942                	ld	s2,16(sp)
    8020410a:	69a2                	ld	s3,8(sp)
    8020410c:	6145                	addi	sp,sp,48
    8020410e:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80204110:	02451783          	lh	a5,36(a0)
    80204114:	03079693          	slli	a3,a5,0x30
    80204118:	92c1                	srli	a3,a3,0x30
    8020411a:	4725                	li	a4,9
    8020411c:	04d76a63          	bltu	a4,a3,80204170 <fileread+0xba>
    80204120:	0792                	slli	a5,a5,0x4
    80204122:	0001f717          	auipc	a4,0x1f
    80204126:	c5e70713          	addi	a4,a4,-930 # 80222d80 <devsw>
    8020412a:	97ba                	add	a5,a5,a4
    8020412c:	639c                	ld	a5,0(a5)
    8020412e:	c3b9                	beqz	a5,80204174 <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80204130:	4505                	li	a0,1
    80204132:	9782                	jalr	a5
    80204134:	892a                	mv	s2,a0
        break;
    80204136:	b7e9                	j	80204100 <fileread+0x4a>
        elock(f->ep);
    80204138:	6d08                	ld	a0,24(a0)
    8020413a:	00003097          	auipc	ra,0x3
    8020413e:	182080e7          	jalr	386(ra) # 802072bc <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80204142:	874a                	mv	a4,s2
    80204144:	5094                	lw	a3,32(s1)
    80204146:	864e                	mv	a2,s3
    80204148:	4585                	li	a1,1
    8020414a:	6c88                	ld	a0,24(s1)
    8020414c:	00003097          	auipc	ra,0x3
    80204150:	86c080e7          	jalr	-1940(ra) # 802069b8 <eread>
    80204154:	892a                	mv	s2,a0
    80204156:	00a05563          	blez	a0,80204160 <fileread+0xaa>
            f->off += r;
    8020415a:	509c                	lw	a5,32(s1)
    8020415c:	9fa9                	addw	a5,a5,a0
    8020415e:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80204160:	6c88                	ld	a0,24(s1)
    80204162:	00003097          	auipc	ra,0x3
    80204166:	190080e7          	jalr	400(ra) # 802072f2 <eunlock>
        break;
    8020416a:	bf59                	j	80204100 <fileread+0x4a>
    return -1;
    8020416c:	597d                	li	s2,-1
    8020416e:	bf49                	j	80204100 <fileread+0x4a>
          return -1;
    80204170:	597d                	li	s2,-1
    80204172:	b779                	j	80204100 <fileread+0x4a>
    80204174:	597d                	li	s2,-1
    80204176:	b769                	j	80204100 <fileread+0x4a>

0000000080204178 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80204178:	7179                	addi	sp,sp,-48
    8020417a:	f406                	sd	ra,40(sp)
    8020417c:	f022                	sd	s0,32(sp)
    8020417e:	ec26                	sd	s1,24(sp)
    80204180:	e84a                	sd	s2,16(sp)
    80204182:	e44e                	sd	s3,8(sp)
    80204184:	e052                	sd	s4,0(sp)
    80204186:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80204188:	00954783          	lbu	a5,9(a0)
    8020418c:	cbc5                	beqz	a5,8020423c <filewrite+0xc4>
    8020418e:	84aa                	mv	s1,a0
    80204190:	892e                	mv	s2,a1
    80204192:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80204194:	411c                	lw	a5,0(a0)
    80204196:	4705                	li	a4,1
    80204198:	04e78963          	beq	a5,a4,802041ea <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    8020419c:	470d                	li	a4,3
    8020419e:	04e78d63          	beq	a5,a4,802041f8 <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    802041a2:	4709                	li	a4,2
    802041a4:	08e79463          	bne	a5,a4,8020422c <filewrite+0xb4>
    elock(f->ep);
    802041a8:	6d08                	ld	a0,24(a0)
    802041aa:	00003097          	auipc	ra,0x3
    802041ae:	112080e7          	jalr	274(ra) # 802072bc <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    802041b2:	00098a1b          	sext.w	s4,s3
    802041b6:	8752                	mv	a4,s4
    802041b8:	5094                	lw	a3,32(s1)
    802041ba:	864a                	mv	a2,s2
    802041bc:	4585                	li	a1,1
    802041be:	6c88                	ld	a0,24(s1)
    802041c0:	00003097          	auipc	ra,0x3
    802041c4:	8f0080e7          	jalr	-1808(ra) # 80206ab0 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    802041c8:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    802041ca:	05350b63          	beq	a0,s3,80204220 <filewrite+0xa8>
    }
    eunlock(f->ep);
    802041ce:	6c88                	ld	a0,24(s1)
    802041d0:	00003097          	auipc	ra,0x3
    802041d4:	122080e7          	jalr	290(ra) # 802072f2 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    802041d8:	854a                	mv	a0,s2
    802041da:	70a2                	ld	ra,40(sp)
    802041dc:	7402                	ld	s0,32(sp)
    802041de:	64e2                	ld	s1,24(sp)
    802041e0:	6942                	ld	s2,16(sp)
    802041e2:	69a2                	ld	s3,8(sp)
    802041e4:	6a02                	ld	s4,0(sp)
    802041e6:	6145                	addi	sp,sp,48
    802041e8:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    802041ea:	6908                	ld	a0,16(a0)
    802041ec:	00000097          	auipc	ra,0x0
    802041f0:	378080e7          	jalr	888(ra) # 80204564 <pipewrite>
    802041f4:	892a                	mv	s2,a0
    802041f6:	b7cd                	j	802041d8 <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    802041f8:	02451783          	lh	a5,36(a0)
    802041fc:	03079693          	slli	a3,a5,0x30
    80204200:	92c1                	srli	a3,a3,0x30
    80204202:	4725                	li	a4,9
    80204204:	02d76e63          	bltu	a4,a3,80204240 <filewrite+0xc8>
    80204208:	0792                	slli	a5,a5,0x4
    8020420a:	0001f717          	auipc	a4,0x1f
    8020420e:	b7670713          	addi	a4,a4,-1162 # 80222d80 <devsw>
    80204212:	97ba                	add	a5,a5,a4
    80204214:	679c                	ld	a5,8(a5)
    80204216:	c79d                	beqz	a5,80204244 <filewrite+0xcc>
    ret = devsw[f->major].write(1, addr, n);
    80204218:	4505                	li	a0,1
    8020421a:	9782                	jalr	a5
    8020421c:	892a                	mv	s2,a0
    8020421e:	bf6d                	j	802041d8 <filewrite+0x60>
      f->off += n;
    80204220:	509c                	lw	a5,32(s1)
    80204222:	014787bb          	addw	a5,a5,s4
    80204226:	d09c                	sw	a5,32(s1)
      ret = n;
    80204228:	894e                	mv	s2,s3
    8020422a:	b755                	j	802041ce <filewrite+0x56>
    panic("filewrite");
    8020422c:	00007517          	auipc	a0,0x7
    80204230:	a7c50513          	addi	a0,a0,-1412 # 8020aca8 <digits+0x928>
    80204234:	ffffc097          	auipc	ra,0xffffc
    80204238:	f10080e7          	jalr	-240(ra) # 80200144 <panic>
    return -1;
    8020423c:	597d                	li	s2,-1
    8020423e:	bf69                	j	802041d8 <filewrite+0x60>
      return -1;
    80204240:	597d                	li	s2,-1
    80204242:	bf59                	j	802041d8 <filewrite+0x60>
    80204244:	597d                	li	s2,-1
    80204246:	bf49                	j	802041d8 <filewrite+0x60>

0000000080204248 <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80204248:	00854783          	lbu	a5,8(a0)
    8020424c:	cfdd                	beqz	a5,8020430a <dirnext+0xc2>
{
    8020424e:	7141                	addi	sp,sp,-496
    80204250:	f786                	sd	ra,488(sp)
    80204252:	f3a2                	sd	s0,480(sp)
    80204254:	efa6                	sd	s1,472(sp)
    80204256:	ebca                	sd	s2,464(sp)
    80204258:	e7ce                	sd	s3,456(sp)
    8020425a:	e3d2                	sd	s4,448(sp)
    8020425c:	ff56                	sd	s5,440(sp)
    8020425e:	1b80                	addi	s0,sp,496
    80204260:	84aa                	mv	s1,a0
    80204262:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80204264:	6d18                	ld	a4,24(a0)
    80204266:	10074783          	lbu	a5,256(a4)
    8020426a:	8bc1                	andi	a5,a5,16
    return -1;
    8020426c:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    8020426e:	eb91                	bnez	a5,80204282 <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
}
    80204270:	70be                	ld	ra,488(sp)
    80204272:	741e                	ld	s0,480(sp)
    80204274:	64fe                	ld	s1,472(sp)
    80204276:	695e                	ld	s2,464(sp)
    80204278:	69be                	ld	s3,456(sp)
    8020427a:	6a1e                	ld	s4,448(sp)
    8020427c:	7afa                	ld	s5,440(sp)
    8020427e:	617d                	addi	sp,sp,496
    80204280:	8082                	ret
  int count = 0;
    80204282:	e0042a23          	sw	zero,-492(s0)
  elock(f->ep);
    80204286:	853a                	mv	a0,a4
    80204288:	00003097          	auipc	ra,0x3
    8020428c:	034080e7          	jalr	52(ra) # 802072bc <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80204290:	e1440a13          	addi	s4,s0,-492
    80204294:	e5040993          	addi	s3,s0,-432
    80204298:	a801                	j	802042a8 <dirnext+0x60>
    f->off += count * 32;
    8020429a:	e1442783          	lw	a5,-492(s0)
    8020429e:	0057979b          	slliw	a5,a5,0x5
    802042a2:	5098                	lw	a4,32(s1)
    802042a4:	9fb9                	addw	a5,a5,a4
    802042a6:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    802042a8:	86d2                	mv	a3,s4
    802042aa:	5090                	lw	a2,32(s1)
    802042ac:	85ce                	mv	a1,s3
    802042ae:	6c88                	ld	a0,24(s1)
    802042b0:	00003097          	auipc	ra,0x3
    802042b4:	210080e7          	jalr	528(ra) # 802074c0 <enext>
    802042b8:	892a                	mv	s2,a0
    802042ba:	d165                	beqz	a0,8020429a <dirnext+0x52>
  eunlock(f->ep);
    802042bc:	6c88                	ld	a0,24(s1)
    802042be:	00003097          	auipc	ra,0x3
    802042c2:	034080e7          	jalr	52(ra) # 802072f2 <eunlock>
  if (ret == -1)
    802042c6:	57fd                	li	a5,-1
    return 0;
    802042c8:	4501                	li	a0,0
  if (ret == -1)
    802042ca:	faf903e3          	beq	s2,a5,80204270 <dirnext+0x28>
  f->off += count * 32;
    802042ce:	e1442783          	lw	a5,-492(s0)
    802042d2:	0057979b          	slliw	a5,a5,0x5
    802042d6:	5098                	lw	a4,32(s1)
    802042d8:	9fb9                	addw	a5,a5,a4
    802042da:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    802042dc:	e1840493          	addi	s1,s0,-488
    802042e0:	85a6                	mv	a1,s1
    802042e2:	e5040513          	addi	a0,s0,-432
    802042e6:	00003097          	auipc	ra,0x3
    802042ea:	192080e7          	jalr	402(ra) # 80207478 <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    802042ee:	03800613          	li	a2,56
    802042f2:	85a6                	mv	a1,s1
    802042f4:	8556                	mv	a0,s5
    802042f6:	ffffd097          	auipc	ra,0xffffd
    802042fa:	07c080e7          	jalr	124(ra) # 80201372 <copyout2>
    return -1;
    802042fe:	fff54513          	not	a0,a0
    80204302:	957d                	srai	a0,a0,0x3f
    80204304:	8909                	andi	a0,a0,2
    80204306:	157d                	addi	a0,a0,-1
    80204308:	b7a5                	j	80204270 <dirnext+0x28>
    return -1;
    8020430a:	557d                	li	a0,-1
}
    8020430c:	8082                	ret

000000008020430e <dirnext_>:
//  eunlock(f->ep);
//  f->off += count * 32;
//  return ret_size - len;
//}

int dirnext_(struct file *f, uint64 buffer, int len){
    8020430e:	7165                	addi	sp,sp,-400
    80204310:	e706                	sd	ra,392(sp)
    80204312:	e322                	sd	s0,384(sp)
    80204314:	fea6                	sd	s1,376(sp)
    80204316:	faca                	sd	s2,368(sp)
    80204318:	f6ce                	sd	s3,360(sp)
    8020431a:	f2d2                	sd	s4,352(sp)
    8020431c:	eed6                	sd	s5,344(sp)
    8020431e:	eada                	sd	s6,336(sp)
    80204320:	e6de                	sd	s7,328(sp)
    80204322:	e2e2                	sd	s8,320(sp)
    80204324:	fe66                	sd	s9,312(sp)
    80204326:	fa6a                	sd	s10,304(sp)
    80204328:	f66e                	sd	s11,296(sp)
    8020432a:	0b00                	addi	s0,sp,400
  struct __dirent__ *buf = (struct __dirent__ *)buffer, de;

  struct dirent *ep = f->ep, *d;
    8020432c:	01853903          	ld	s2,24(a0)
  if (ep == NULL)
    80204330:	0e090163          	beqz	s2,80204412 <dirnext_+0x104>
    80204334:	8aaa                	mv	s5,a0
    80204336:	8c2e                	mv	s8,a1
    80204338:	8bb2                	mv	s7,a2
    return -1;

  int i = 0, sum_s = 0;
  for (d = eroot(); d->next; d = d->next)
    8020433a:	00004097          	auipc	ra,0x4
    8020433e:	88c080e7          	jalr	-1908(ra) # 80207bc6 <eroot>
    80204342:	84aa                	mv	s1,a0
    80204344:	12853783          	ld	a5,296(a0)
    80204348:	c7f9                	beqz	a5,80204416 <dirnext_+0x108>
  int i = 0, sum_s = 0;
    8020434a:	4981                	li	s3,0
    8020434c:	4d81                	li	s11,0
  {
    if (d->parent == ep)
    {
      de.d_ino = (long)d->parent + d->off;
      de.d_off = d - d->next;
    8020434e:	00007d17          	auipc	s10,0x7
    80204352:	96ad0d13          	addi	s10,s10,-1686 # 8020acb8 <digits+0x938>
      de.d_reclen = sizeof(de);
    80204356:	11800b13          	li	s6,280
      de.d_type = f->type;
      safestrcpy(de.d_name, d->filename, sizeof(d->filename));
    8020435a:	e8b40c93          	addi	s9,s0,-373

      if (sum_s + sizeof(de) > len)
        return sum_s;
      sum_s += sizeof(de);
      buf[i++] = de;
    8020435e:	f9040a13          	addi	s4,s0,-112
    80204362:	a091                	j	802043a6 <dirnext_+0x98>
      sum_s += sizeof(de);
    80204364:	1189899b          	addiw	s3,s3,280
      buf[i++] = de;
    80204368:	001d889b          	addiw	a7,s11,1 # 1001 <_entry-0x801fefff>
    8020436c:	036d8733          	mul	a4,s11,s6
    80204370:	e7840793          	addi	a5,s0,-392
    80204374:	9762                	add	a4,a4,s8
    80204376:	0007b803          	ld	a6,0(a5)
    8020437a:	6788                	ld	a0,8(a5)
    8020437c:	6b8c                	ld	a1,16(a5)
    8020437e:	6f90                	ld	a2,24(a5)
    80204380:	7394                	ld	a3,32(a5)
    80204382:	01073023          	sd	a6,0(a4)
    80204386:	e708                	sd	a0,8(a4)
    80204388:	eb0c                	sd	a1,16(a4)
    8020438a:	ef10                	sd	a2,24(a4)
    8020438c:	f314                	sd	a3,32(a4)
    8020438e:	02878793          	addi	a5,a5,40
    80204392:	02870713          	addi	a4,a4,40
    80204396:	ff4790e3          	bne	a5,s4,80204376 <dirnext_+0x68>
    8020439a:	8dc6                	mv	s11,a7
  for (d = eroot(); d->next; d = d->next)
    8020439c:	1284b483          	ld	s1,296(s1)
    802043a0:	1284b783          	ld	a5,296(s1)
    802043a4:	c7b1                	beqz	a5,802043f0 <dirnext_+0xe2>
    if (d->parent == ep)
    802043a6:	1204b703          	ld	a4,288(s1)
    802043aa:	ff2719e3          	bne	a4,s2,8020439c <dirnext_+0x8e>
      de.d_ino = (long)d->parent + d->off;
    802043ae:	11c4e683          	lwu	a3,284(s1)
    802043b2:	9736                	add	a4,a4,a3
    802043b4:	e6e43c23          	sd	a4,-392(s0)
      de.d_off = d - d->next;
    802043b8:	40f487b3          	sub	a5,s1,a5
    802043bc:	8791                	srai	a5,a5,0x4
    802043be:	000d3703          	ld	a4,0(s10)
    802043c2:	02e787b3          	mul	a5,a5,a4
    802043c6:	e8f43023          	sd	a5,-384(s0)
      de.d_reclen = sizeof(de);
    802043ca:	e9641423          	sh	s6,-376(s0)
      de.d_type = f->type;
    802043ce:	000aa783          	lw	a5,0(s5)
    802043d2:	e8f40523          	sb	a5,-374(s0)
      safestrcpy(de.d_name, d->filename, sizeof(d->filename));
    802043d6:	10000613          	li	a2,256
    802043da:	85a6                	mv	a1,s1
    802043dc:	8566                	mv	a0,s9
    802043de:	ffffc097          	auipc	ra,0xffffc
    802043e2:	4d6080e7          	jalr	1238(ra) # 802008b4 <safestrcpy>
      if (sum_s + sizeof(de) > len)
    802043e6:	11898793          	addi	a5,s3,280
    802043ea:	f6fbfde3          	bgeu	s7,a5,80204364 <dirnext_+0x56>
    802043ee:	a011                	j	802043f2 <dirnext_+0xe4>
    }
  }
  return 0;
    802043f0:	4981                	li	s3,0
}
    802043f2:	854e                	mv	a0,s3
    802043f4:	60ba                	ld	ra,392(sp)
    802043f6:	641a                	ld	s0,384(sp)
    802043f8:	74f6                	ld	s1,376(sp)
    802043fa:	7956                	ld	s2,368(sp)
    802043fc:	79b6                	ld	s3,360(sp)
    802043fe:	7a16                	ld	s4,352(sp)
    80204400:	6af6                	ld	s5,344(sp)
    80204402:	6b56                	ld	s6,336(sp)
    80204404:	6bb6                	ld	s7,328(sp)
    80204406:	6c16                	ld	s8,320(sp)
    80204408:	7cf2                	ld	s9,312(sp)
    8020440a:	7d52                	ld	s10,304(sp)
    8020440c:	7db2                	ld	s11,296(sp)
    8020440e:	6159                	addi	sp,sp,400
    80204410:	8082                	ret
    return -1;
    80204412:	59fd                	li	s3,-1
    80204414:	bff9                	j	802043f2 <dirnext_+0xe4>
  return 0;
    80204416:	4981                	li	s3,0
    80204418:	bfe9                	j	802043f2 <dirnext_+0xe4>

000000008020441a <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    8020441a:	7179                	addi	sp,sp,-48
    8020441c:	f406                	sd	ra,40(sp)
    8020441e:	f022                	sd	s0,32(sp)
    80204420:	ec26                	sd	s1,24(sp)
    80204422:	e84a                	sd	s2,16(sp)
    80204424:	e44e                	sd	s3,8(sp)
    80204426:	e052                	sd	s4,0(sp)
    80204428:	1800                	addi	s0,sp,48
    8020442a:	84aa                	mv	s1,a0
    8020442c:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    8020442e:	0005b023          	sd	zero,0(a1)
    80204432:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    80204436:	00000097          	auipc	ra,0x0
    8020443a:	aaa080e7          	jalr	-1366(ra) # 80203ee0 <filealloc>
    8020443e:	e088                	sd	a0,0(s1)
    80204440:	c551                	beqz	a0,802044cc <pipealloc+0xb2>
    80204442:	00000097          	auipc	ra,0x0
    80204446:	a9e080e7          	jalr	-1378(ra) # 80203ee0 <filealloc>
    8020444a:	00aa3023          	sd	a0,0(s4)
    8020444e:	c92d                	beqz	a0,802044c0 <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80204450:	ffffc097          	auipc	ra,0xffffc
    80204454:	10a080e7          	jalr	266(ra) # 8020055a <kalloc>
    80204458:	892a                	mv	s2,a0
    8020445a:	c125                	beqz	a0,802044ba <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    8020445c:	4985                	li	s3,1
    8020445e:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80204462:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    80204466:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    8020446a:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    8020446e:	00006597          	auipc	a1,0x6
    80204472:	56a58593          	addi	a1,a1,1386 # 8020a9d8 <digits+0x658>
    80204476:	ffffc097          	auipc	ra,0xffffc
    8020447a:	20c080e7          	jalr	524(ra) # 80200682 <initlock>
  (*f0)->type = FD_PIPE;
    8020447e:	609c                	ld	a5,0(s1)
    80204480:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    80204484:	609c                	ld	a5,0(s1)
    80204486:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    8020448a:	609c                	ld	a5,0(s1)
    8020448c:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80204490:	609c                	ld	a5,0(s1)
    80204492:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    80204496:	000a3783          	ld	a5,0(s4)
    8020449a:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    8020449e:	000a3783          	ld	a5,0(s4)
    802044a2:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    802044a6:	000a3783          	ld	a5,0(s4)
    802044aa:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    802044ae:	000a3783          	ld	a5,0(s4)
    802044b2:	0127b823          	sd	s2,16(a5)
  return 0;
    802044b6:	4501                	li	a0,0
    802044b8:	a025                	j	802044e0 <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    802044ba:	6088                	ld	a0,0(s1)
    802044bc:	e501                	bnez	a0,802044c4 <pipealloc+0xaa>
    802044be:	a039                	j	802044cc <pipealloc+0xb2>
    802044c0:	6088                	ld	a0,0(s1)
    802044c2:	c51d                	beqz	a0,802044f0 <pipealloc+0xd6>
    fileclose(*f0);
    802044c4:	00000097          	auipc	ra,0x0
    802044c8:	ad8080e7          	jalr	-1320(ra) # 80203f9c <fileclose>
  if(*f1)
    802044cc:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    802044d0:	557d                	li	a0,-1
  if(*f1)
    802044d2:	c799                	beqz	a5,802044e0 <pipealloc+0xc6>
    fileclose(*f1);
    802044d4:	853e                	mv	a0,a5
    802044d6:	00000097          	auipc	ra,0x0
    802044da:	ac6080e7          	jalr	-1338(ra) # 80203f9c <fileclose>
  return -1;
    802044de:	557d                	li	a0,-1
}
    802044e0:	70a2                	ld	ra,40(sp)
    802044e2:	7402                	ld	s0,32(sp)
    802044e4:	64e2                	ld	s1,24(sp)
    802044e6:	6942                	ld	s2,16(sp)
    802044e8:	69a2                	ld	s3,8(sp)
    802044ea:	6a02                	ld	s4,0(sp)
    802044ec:	6145                	addi	sp,sp,48
    802044ee:	8082                	ret
  return -1;
    802044f0:	557d                	li	a0,-1
    802044f2:	b7fd                	j	802044e0 <pipealloc+0xc6>

00000000802044f4 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    802044f4:	1101                	addi	sp,sp,-32
    802044f6:	ec06                	sd	ra,24(sp)
    802044f8:	e822                	sd	s0,16(sp)
    802044fa:	e426                	sd	s1,8(sp)
    802044fc:	e04a                	sd	s2,0(sp)
    802044fe:	1000                	addi	s0,sp,32
    80204500:	84aa                	mv	s1,a0
    80204502:	892e                	mv	s2,a1
  acquire(&pi->lock);
    80204504:	ffffc097          	auipc	ra,0xffffc
    80204508:	1c2080e7          	jalr	450(ra) # 802006c6 <acquire>
  if(writable){
    8020450c:	02090d63          	beqz	s2,80204546 <pipeclose+0x52>
    pi->writeopen = 0;
    80204510:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    80204514:	21848513          	addi	a0,s1,536
    80204518:	ffffe097          	auipc	ra,0xffffe
    8020451c:	fda080e7          	jalr	-38(ra) # 802024f2 <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80204520:	2204b783          	ld	a5,544(s1)
    80204524:	eb95                	bnez	a5,80204558 <pipeclose+0x64>
    release(&pi->lock);
    80204526:	8526                	mv	a0,s1
    80204528:	ffffc097          	auipc	ra,0xffffc
    8020452c:	1f2080e7          	jalr	498(ra) # 8020071a <release>
    kfree((char*)pi);
    80204530:	8526                	mv	a0,s1
    80204532:	ffffc097          	auipc	ra,0xffffc
    80204536:	f0e080e7          	jalr	-242(ra) # 80200440 <kfree>
  } else
    release(&pi->lock);
}
    8020453a:	60e2                	ld	ra,24(sp)
    8020453c:	6442                	ld	s0,16(sp)
    8020453e:	64a2                	ld	s1,8(sp)
    80204540:	6902                	ld	s2,0(sp)
    80204542:	6105                	addi	sp,sp,32
    80204544:	8082                	ret
    pi->readopen = 0;
    80204546:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    8020454a:	21c48513          	addi	a0,s1,540
    8020454e:	ffffe097          	auipc	ra,0xffffe
    80204552:	fa4080e7          	jalr	-92(ra) # 802024f2 <wakeup>
    80204556:	b7e9                	j	80204520 <pipeclose+0x2c>
    release(&pi->lock);
    80204558:	8526                	mv	a0,s1
    8020455a:	ffffc097          	auipc	ra,0xffffc
    8020455e:	1c0080e7          	jalr	448(ra) # 8020071a <release>
}
    80204562:	bfe1                	j	8020453a <pipeclose+0x46>

0000000080204564 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80204564:	7159                	addi	sp,sp,-112
    80204566:	f486                	sd	ra,104(sp)
    80204568:	f0a2                	sd	s0,96(sp)
    8020456a:	eca6                	sd	s1,88(sp)
    8020456c:	e8ca                	sd	s2,80(sp)
    8020456e:	e4ce                	sd	s3,72(sp)
    80204570:	e0d2                	sd	s4,64(sp)
    80204572:	fc56                	sd	s5,56(sp)
    80204574:	f85a                	sd	s6,48(sp)
    80204576:	f45e                	sd	s7,40(sp)
    80204578:	f062                	sd	s8,32(sp)
    8020457a:	ec66                	sd	s9,24(sp)
    8020457c:	1880                	addi	s0,sp,112
    8020457e:	84aa                	mv	s1,a0
    80204580:	8b2e                	mv	s6,a1
    80204582:	8ab2                	mv	s5,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    80204584:	ffffd097          	auipc	ra,0xffffd
    80204588:	532080e7          	jalr	1330(ra) # 80201ab6 <myproc>
    8020458c:	892a                	mv	s2,a0

  acquire(&pi->lock);
    8020458e:	8526                	mv	a0,s1
    80204590:	ffffc097          	auipc	ra,0xffffc
    80204594:	136080e7          	jalr	310(ra) # 802006c6 <acquire>
  for(i = 0; i < n; i++){
    80204598:	09505763          	blez	s5,80204626 <pipewrite+0xc2>
    8020459c:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    8020459e:	21848a13          	addi	s4,s1,536
      sleep(&pi->nwrite, &pi->lock);
    802045a2:	21c48993          	addi	s3,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    802045a6:	f9f40c93          	addi	s9,s0,-97
    802045aa:	5c7d                	li	s8,-1
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    802045ac:	2184a783          	lw	a5,536(s1)
    802045b0:	21c4a703          	lw	a4,540(s1)
    802045b4:	2007879b          	addiw	a5,a5,512
    802045b8:	02f71b63          	bne	a4,a5,802045ee <pipewrite+0x8a>
      if(pi->readopen == 0 || pr->killed){
    802045bc:	2204a783          	lw	a5,544(s1)
    802045c0:	c3c1                	beqz	a5,80204640 <pipewrite+0xdc>
    802045c2:	03092783          	lw	a5,48(s2)
    802045c6:	efad                	bnez	a5,80204640 <pipewrite+0xdc>
      wakeup(&pi->nread);
    802045c8:	8552                	mv	a0,s4
    802045ca:	ffffe097          	auipc	ra,0xffffe
    802045ce:	f28080e7          	jalr	-216(ra) # 802024f2 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    802045d2:	85a6                	mv	a1,s1
    802045d4:	854e                	mv	a0,s3
    802045d6:	ffffe097          	auipc	ra,0xffffe
    802045da:	da0080e7          	jalr	-608(ra) # 80202376 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    802045de:	2184a783          	lw	a5,536(s1)
    802045e2:	21c4a703          	lw	a4,540(s1)
    802045e6:	2007879b          	addiw	a5,a5,512
    802045ea:	fcf709e3          	beq	a4,a5,802045bc <pipewrite+0x58>
    if(copyin2(&ch, addr + i, 1) == -1)
    802045ee:	4605                	li	a2,1
    802045f0:	85da                	mv	a1,s6
    802045f2:	8566                	mv	a0,s9
    802045f4:	ffffd097          	auipc	ra,0xffffd
    802045f8:	eb0080e7          	jalr	-336(ra) # 802014a4 <copyin2>
    802045fc:	03850663          	beq	a0,s8,80204628 <pipewrite+0xc4>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80204600:	21c4a783          	lw	a5,540(s1)
    80204604:	0017871b          	addiw	a4,a5,1
    80204608:	20e4ae23          	sw	a4,540(s1)
    8020460c:	1ff7f793          	andi	a5,a5,511
    80204610:	97a6                	add	a5,a5,s1
    80204612:	f9f44703          	lbu	a4,-97(s0)
    80204616:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    8020461a:	2b85                	addiw	s7,s7,1
    8020461c:	0b05                	addi	s6,s6,1
    8020461e:	f97a97e3          	bne	s5,s7,802045ac <pipewrite+0x48>
    80204622:	8bd6                	mv	s7,s5
    80204624:	a011                	j	80204628 <pipewrite+0xc4>
    80204626:	4b81                	li	s7,0
  }
  wakeup(&pi->nread);
    80204628:	21848513          	addi	a0,s1,536
    8020462c:	ffffe097          	auipc	ra,0xffffe
    80204630:	ec6080e7          	jalr	-314(ra) # 802024f2 <wakeup>
  release(&pi->lock);
    80204634:	8526                	mv	a0,s1
    80204636:	ffffc097          	auipc	ra,0xffffc
    8020463a:	0e4080e7          	jalr	228(ra) # 8020071a <release>
  return i;
    8020463e:	a039                	j	8020464c <pipewrite+0xe8>
        release(&pi->lock);
    80204640:	8526                	mv	a0,s1
    80204642:	ffffc097          	auipc	ra,0xffffc
    80204646:	0d8080e7          	jalr	216(ra) # 8020071a <release>
        return -1;
    8020464a:	5bfd                	li	s7,-1
}
    8020464c:	855e                	mv	a0,s7
    8020464e:	70a6                	ld	ra,104(sp)
    80204650:	7406                	ld	s0,96(sp)
    80204652:	64e6                	ld	s1,88(sp)
    80204654:	6946                	ld	s2,80(sp)
    80204656:	69a6                	ld	s3,72(sp)
    80204658:	6a06                	ld	s4,64(sp)
    8020465a:	7ae2                	ld	s5,56(sp)
    8020465c:	7b42                	ld	s6,48(sp)
    8020465e:	7ba2                	ld	s7,40(sp)
    80204660:	7c02                	ld	s8,32(sp)
    80204662:	6ce2                	ld	s9,24(sp)
    80204664:	6165                	addi	sp,sp,112
    80204666:	8082                	ret

0000000080204668 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80204668:	715d                	addi	sp,sp,-80
    8020466a:	e486                	sd	ra,72(sp)
    8020466c:	e0a2                	sd	s0,64(sp)
    8020466e:	fc26                	sd	s1,56(sp)
    80204670:	f84a                	sd	s2,48(sp)
    80204672:	f44e                	sd	s3,40(sp)
    80204674:	f052                	sd	s4,32(sp)
    80204676:	ec56                	sd	s5,24(sp)
    80204678:	e85a                	sd	s6,16(sp)
    8020467a:	0880                	addi	s0,sp,80
    8020467c:	84aa                	mv	s1,a0
    8020467e:	892e                	mv	s2,a1
    80204680:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    80204682:	ffffd097          	auipc	ra,0xffffd
    80204686:	434080e7          	jalr	1076(ra) # 80201ab6 <myproc>
    8020468a:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    8020468c:	8526                	mv	a0,s1
    8020468e:	ffffc097          	auipc	ra,0xffffc
    80204692:	038080e7          	jalr	56(ra) # 802006c6 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204696:	2184a703          	lw	a4,536(s1)
    8020469a:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8020469e:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    802046a2:	02f71463          	bne	a4,a5,802046ca <piperead+0x62>
    802046a6:	2244a783          	lw	a5,548(s1)
    802046aa:	c385                	beqz	a5,802046ca <piperead+0x62>
    if(pr->killed){
    802046ac:	0309a783          	lw	a5,48(s3)
    802046b0:	ebc1                	bnez	a5,80204740 <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    802046b2:	85a6                	mv	a1,s1
    802046b4:	8556                	mv	a0,s5
    802046b6:	ffffe097          	auipc	ra,0xffffe
    802046ba:	cc0080e7          	jalr	-832(ra) # 80202376 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    802046be:	2184a703          	lw	a4,536(s1)
    802046c2:	21c4a783          	lw	a5,540(s1)
    802046c6:	fef700e3          	beq	a4,a5,802046a6 <piperead+0x3e>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802046ca:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    802046cc:	fbf40b13          	addi	s6,s0,-65
    802046d0:	5afd                	li	s5,-1
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802046d2:	05405163          	blez	s4,80204714 <piperead+0xac>
    if(pi->nread == pi->nwrite)
    802046d6:	2184a783          	lw	a5,536(s1)
    802046da:	21c4a703          	lw	a4,540(s1)
    802046de:	02f70b63          	beq	a4,a5,80204714 <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    802046e2:	0017871b          	addiw	a4,a5,1
    802046e6:	20e4ac23          	sw	a4,536(s1)
    802046ea:	1ff7f793          	andi	a5,a5,511
    802046ee:	97a6                	add	a5,a5,s1
    802046f0:	0187c783          	lbu	a5,24(a5)
    802046f4:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    802046f8:	4605                	li	a2,1
    802046fa:	85da                	mv	a1,s6
    802046fc:	854a                	mv	a0,s2
    802046fe:	ffffd097          	auipc	ra,0xffffd
    80204702:	c74080e7          	jalr	-908(ra) # 80201372 <copyout2>
    80204706:	01550763          	beq	a0,s5,80204714 <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8020470a:	2985                	addiw	s3,s3,1
    8020470c:	0905                	addi	s2,s2,1
    8020470e:	fd3a14e3          	bne	s4,s3,802046d6 <piperead+0x6e>
    80204712:	89d2                	mv	s3,s4
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    80204714:	21c48513          	addi	a0,s1,540
    80204718:	ffffe097          	auipc	ra,0xffffe
    8020471c:	dda080e7          	jalr	-550(ra) # 802024f2 <wakeup>
  release(&pi->lock);
    80204720:	8526                	mv	a0,s1
    80204722:	ffffc097          	auipc	ra,0xffffc
    80204726:	ff8080e7          	jalr	-8(ra) # 8020071a <release>
  return i;
}
    8020472a:	854e                	mv	a0,s3
    8020472c:	60a6                	ld	ra,72(sp)
    8020472e:	6406                	ld	s0,64(sp)
    80204730:	74e2                	ld	s1,56(sp)
    80204732:	7942                	ld	s2,48(sp)
    80204734:	79a2                	ld	s3,40(sp)
    80204736:	7a02                	ld	s4,32(sp)
    80204738:	6ae2                	ld	s5,24(sp)
    8020473a:	6b42                	ld	s6,16(sp)
    8020473c:	6161                	addi	sp,sp,80
    8020473e:	8082                	ret
      release(&pi->lock);
    80204740:	8526                	mv	a0,s1
    80204742:	ffffc097          	auipc	ra,0xffffc
    80204746:	fd8080e7          	jalr	-40(ra) # 8020071a <release>
      return -1;
    8020474a:	59fd                	li	s3,-1
    8020474c:	bff9                	j	8020472a <piperead+0xc2>

000000008020474e <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    8020474e:	dd010113          	addi	sp,sp,-560
    80204752:	22113423          	sd	ra,552(sp)
    80204756:	22813023          	sd	s0,544(sp)
    8020475a:	20913c23          	sd	s1,536(sp)
    8020475e:	21213823          	sd	s2,528(sp)
    80204762:	21313423          	sd	s3,520(sp)
    80204766:	21413023          	sd	s4,512(sp)
    8020476a:	ffd6                	sd	s5,504(sp)
    8020476c:	fbda                	sd	s6,496(sp)
    8020476e:	f7de                	sd	s7,488(sp)
    80204770:	f3e2                	sd	s8,480(sp)
    80204772:	efe6                	sd	s9,472(sp)
    80204774:	ebea                	sd	s10,464(sp)
    80204776:	e7ee                	sd	s11,456(sp)
    80204778:	1c00                	addi	s0,sp,560
    8020477a:	892a                	mv	s2,a0
    8020477c:	dca43c23          	sd	a0,-552(s0)
    80204780:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    80204784:	ffffd097          	auipc	ra,0xffffd
    80204788:	332080e7          	jalr	818(ra) # 80201ab6 <myproc>
    8020478c:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    8020478e:	ffffc097          	auipc	ra,0xffffc
    80204792:	dcc080e7          	jalr	-564(ra) # 8020055a <kalloc>
    80204796:	2a050863          	beqz	a0,80204a46 <exec+0x2f8>
    8020479a:	8b2a                	mv	s6,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    8020479c:	6605                	lui	a2,0x1
    8020479e:	6cac                	ld	a1,88(s1)
    802047a0:	ffffc097          	auipc	ra,0xffffc
    802047a4:	01e080e7          	jalr	30(ra) # 802007be <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    802047a8:	000b3023          	sd	zero,0(s6)
    802047ac:	000b3423          	sd	zero,8(s6)
  }

  if((ep = ename(path)) == NULL) {
    802047b0:	854a                	mv	a0,s2
    802047b2:	00003097          	auipc	ra,0x3
    802047b6:	35e080e7          	jalr	862(ra) # 80207b10 <ename>
    802047ba:	8a2a                	mv	s4,a0
    802047bc:	3a050e63          	beqz	a0,80204b78 <exec+0x42a>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    802047c0:	00003097          	auipc	ra,0x3
    802047c4:	afc080e7          	jalr	-1284(ra) # 802072bc <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    802047c8:	04000713          	li	a4,64
    802047cc:	4681                	li	a3,0
    802047ce:	e4840613          	addi	a2,s0,-440
    802047d2:	4581                	li	a1,0
    802047d4:	8552                	mv	a0,s4
    802047d6:	00002097          	auipc	ra,0x2
    802047da:	1e2080e7          	jalr	482(ra) # 802069b8 <eread>
    802047de:	04000793          	li	a5,64
    802047e2:	00f51a63          	bne	a0,a5,802047f6 <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    802047e6:	e4842703          	lw	a4,-440(s0)
    802047ea:	464c47b7          	lui	a5,0x464c4
    802047ee:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    802047f2:	00f70963          	beq	a4,a5,80204804 <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    802047f6:	4581                	li	a1,0
    802047f8:	855a                	mv	a0,s6
    802047fa:	ffffd097          	auipc	ra,0xffffd
    802047fe:	eca080e7          	jalr	-310(ra) # 802016c4 <kvmfree>
  if(ep){
    80204802:	a4bd                	j	80204a70 <exec+0x322>
  if((pagetable = proc_pagetable(p)) == NULL)
    80204804:	8526                	mv	a0,s1
    80204806:	ffffd097          	auipc	ra,0xffffd
    8020480a:	394080e7          	jalr	916(ra) # 80201b9a <proc_pagetable>
    8020480e:	e0a43423          	sd	a0,-504(s0)
    80204812:	d175                	beqz	a0,802047f6 <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204814:	e6842783          	lw	a5,-408(s0)
    80204818:	e8045703          	lhu	a4,-384(s0)
    8020481c:	cb3d                	beqz	a4,80204892 <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    8020481e:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204820:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204824:	e1040713          	addi	a4,s0,-496
    80204828:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    8020482c:	6a85                	lui	s5,0x1
    8020482e:	fffa8713          	addi	a4,s5,-1 # fff <_entry-0x801ff001>
    80204832:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204836:	6d85                	lui	s11,0x1
    80204838:	7d7d                	lui	s10,0xfffff
    8020483a:	a4c9                	j	80204afc <exec+0x3ae>
      panic("loadseg: address should exist");
    8020483c:	00006517          	auipc	a0,0x6
    80204840:	48450513          	addi	a0,a0,1156 # 8020acc0 <digits+0x940>
    80204844:	ffffc097          	auipc	ra,0xffffc
    80204848:	900080e7          	jalr	-1792(ra) # 80200144 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    8020484c:	874a                	mv	a4,s2
    8020484e:	009c86bb          	addw	a3,s9,s1
    80204852:	4581                	li	a1,0
    80204854:	8552                	mv	a0,s4
    80204856:	00002097          	auipc	ra,0x2
    8020485a:	162080e7          	jalr	354(ra) # 802069b8 <eread>
    8020485e:	2501                	sext.w	a0,a0
    80204860:	1ea91763          	bne	s2,a0,80204a4e <exec+0x300>
  for(i = 0; i < sz; i += PGSIZE){
    80204864:	009d84bb          	addw	s1,s11,s1
    80204868:	013d09bb          	addw	s3,s10,s3
    8020486c:	2774f863          	bgeu	s1,s7,80204adc <exec+0x38e>
    pa = walkaddr(pagetable, va + i);
    80204870:	02049593          	slli	a1,s1,0x20
    80204874:	9181                	srli	a1,a1,0x20
    80204876:	95e2                	add	a1,a1,s8
    80204878:	e0843503          	ld	a0,-504(s0)
    8020487c:	ffffc097          	auipc	ra,0xffffc
    80204880:	332080e7          	jalr	818(ra) # 80200bae <walkaddr>
    80204884:	862a                	mv	a2,a0
    if(pa == NULL)
    80204886:	d95d                	beqz	a0,8020483c <exec+0xee>
      n = PGSIZE;
    80204888:	8956                	mv	s2,s5
    if(sz - i < PGSIZE)
    8020488a:	fd59f1e3          	bgeu	s3,s5,8020484c <exec+0xfe>
      n = sz - i;
    8020488e:	894e                	mv	s2,s3
    80204890:	bf75                	j	8020484c <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80204892:	4481                	li	s1,0
  eunlock(ep);
    80204894:	8552                	mv	a0,s4
    80204896:	00003097          	auipc	ra,0x3
    8020489a:	a5c080e7          	jalr	-1444(ra) # 802072f2 <eunlock>
  eput(ep);
    8020489e:	8552                	mv	a0,s4
    802048a0:	00003097          	auipc	ra,0x3
    802048a4:	aa0080e7          	jalr	-1376(ra) # 80207340 <eput>
  p = myproc();
    802048a8:	ffffd097          	auipc	ra,0xffffd
    802048ac:	20e080e7          	jalr	526(ra) # 80201ab6 <myproc>
    802048b0:	8aaa                	mv	s5,a0
  uint64 oldsz = p->sz;
    802048b2:	04853d03          	ld	s10,72(a0)
  sz = PGROUNDUP(sz);
    802048b6:	6785                	lui	a5,0x1
    802048b8:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    802048ba:	97a6                	add	a5,a5,s1
    802048bc:	777d                	lui	a4,0xfffff
    802048be:	8ff9                	and	a5,a5,a4
    802048c0:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802048c4:	6689                	lui	a3,0x2
    802048c6:	96be                	add	a3,a3,a5
    802048c8:	863e                	mv	a2,a5
    802048ca:	85da                	mv	a1,s6
    802048cc:	e0843483          	ld	s1,-504(s0)
    802048d0:	8526                	mv	a0,s1
    802048d2:	ffffc097          	auipc	ra,0xffffc
    802048d6:	738080e7          	jalr	1848(ra) # 8020100a <uvmalloc>
    802048da:	8caa                	mv	s9,a0
  ep = 0;
    802048dc:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802048de:	16050863          	beqz	a0,80204a4e <exec+0x300>
  uvmclear(pagetable, sz-2*PGSIZE);
    802048e2:	75f9                	lui	a1,0xffffe
    802048e4:	95aa                	add	a1,a1,a0
    802048e6:	8526                	mv	a0,s1
    802048e8:	ffffd097          	auipc	ra,0xffffd
    802048ec:	9cc080e7          	jalr	-1588(ra) # 802012b4 <uvmclear>
  stackbase = sp - PGSIZE;
    802048f0:	7bfd                	lui	s7,0xfffff
    802048f2:	9be6                	add	s7,s7,s9
  for(argc = 0; argv[argc]; argc++) {
    802048f4:	de843783          	ld	a5,-536(s0)
    802048f8:	6388                	ld	a0,0(a5)
    802048fa:	c92d                	beqz	a0,8020496c <exec+0x21e>
    802048fc:	e8840993          	addi	s3,s0,-376
    80204900:	f8840c13          	addi	s8,s0,-120
  sp = sz;
    80204904:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    80204906:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    80204908:	ffffc097          	auipc	ra,0xffffc
    8020490c:	fde080e7          	jalr	-34(ra) # 802008e6 <strlen>
    80204910:	0015079b          	addiw	a5,a0,1
    80204914:	40f907b3          	sub	a5,s2,a5
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80204918:	ff07f913          	andi	s2,a5,-16
    if(sp < stackbase)
    8020491c:	1b796463          	bltu	s2,s7,80204ac4 <exec+0x376>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80204920:	de843d83          	ld	s11,-536(s0)
    80204924:	000dba03          	ld	s4,0(s11) # 1000 <_entry-0x801ff000>
    80204928:	8552                	mv	a0,s4
    8020492a:	ffffc097          	auipc	ra,0xffffc
    8020492e:	fbc080e7          	jalr	-68(ra) # 802008e6 <strlen>
    80204932:	0015069b          	addiw	a3,a0,1
    80204936:	8652                	mv	a2,s4
    80204938:	85ca                	mv	a1,s2
    8020493a:	e0843503          	ld	a0,-504(s0)
    8020493e:	ffffd097          	auipc	ra,0xffffd
    80204942:	9a8080e7          	jalr	-1624(ra) # 802012e6 <copyout>
    80204946:	18054363          	bltz	a0,80204acc <exec+0x37e>
    ustack[argc] = sp;
    8020494a:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    8020494e:	0485                	addi	s1,s1,1
    80204950:	008d8793          	addi	a5,s11,8
    80204954:	def43423          	sd	a5,-536(s0)
    80204958:	008db503          	ld	a0,8(s11)
    8020495c:	c911                	beqz	a0,80204970 <exec+0x222>
    if(argc >= MAXARG)
    8020495e:	09a1                	addi	s3,s3,8
    80204960:	fb3c14e3          	bne	s8,s3,80204908 <exec+0x1ba>
  sz = sz1;
    80204964:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204968:	4a01                	li	s4,0
    8020496a:	a0d5                	j	80204a4e <exec+0x300>
  sp = sz;
    8020496c:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    8020496e:	4481                	li	s1,0
  ustack[argc] = 0;
    80204970:	00349793          	slli	a5,s1,0x3
    80204974:	f9078793          	addi	a5,a5,-112
    80204978:	97a2                	add	a5,a5,s0
    8020497a:	ee07bc23          	sd	zero,-264(a5)
  sp -= (argc+1) * sizeof(uint64);
    8020497e:	00148693          	addi	a3,s1,1
    80204982:	068e                	slli	a3,a3,0x3
    80204984:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    80204988:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    8020498c:	01797663          	bgeu	s2,s7,80204998 <exec+0x24a>
  sz = sz1;
    80204990:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204994:	4a01                	li	s4,0
    80204996:	a865                	j	80204a4e <exec+0x300>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80204998:	e8840613          	addi	a2,s0,-376
    8020499c:	85ca                	mv	a1,s2
    8020499e:	e0843503          	ld	a0,-504(s0)
    802049a2:	ffffd097          	auipc	ra,0xffffd
    802049a6:	944080e7          	jalr	-1724(ra) # 802012e6 <copyout>
    802049aa:	12054563          	bltz	a0,80204ad4 <exec+0x386>
  p->trapframe->a1 = sp;
    802049ae:	060ab783          	ld	a5,96(s5)
    802049b2:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    802049b6:	dd843783          	ld	a5,-552(s0)
    802049ba:	0007c703          	lbu	a4,0(a5)
    802049be:	cf11                	beqz	a4,802049da <exec+0x28c>
    802049c0:	0785                	addi	a5,a5,1
    if(*s == '/')
    802049c2:	02f00693          	li	a3,47
    802049c6:	a039                	j	802049d4 <exec+0x286>
      last = s+1;
    802049c8:	dcf43c23          	sd	a5,-552(s0)
  for(last=s=path; *s; s++)
    802049cc:	0785                	addi	a5,a5,1
    802049ce:	fff7c703          	lbu	a4,-1(a5)
    802049d2:	c701                	beqz	a4,802049da <exec+0x28c>
    if(*s == '/')
    802049d4:	fed71ce3          	bne	a4,a3,802049cc <exec+0x27e>
    802049d8:	bfc5                	j	802049c8 <exec+0x27a>
  safestrcpy(p->name, last, sizeof(p->name));
    802049da:	4641                	li	a2,16
    802049dc:	dd843583          	ld	a1,-552(s0)
    802049e0:	160a8513          	addi	a0,s5,352
    802049e4:	ffffc097          	auipc	ra,0xffffc
    802049e8:	ed0080e7          	jalr	-304(ra) # 802008b4 <safestrcpy>
  oldpagetable = p->pagetable;
    802049ec:	050ab503          	ld	a0,80(s5)
  oldkpagetable = p->kpagetable;
    802049f0:	058ab983          	ld	s3,88(s5)
  p->pagetable = pagetable;
    802049f4:	e0843783          	ld	a5,-504(s0)
    802049f8:	04fab823          	sd	a5,80(s5)
  p->kpagetable = kpagetable;
    802049fc:	056abc23          	sd	s6,88(s5)
  p->sz = sz;
    80204a00:	059ab423          	sd	s9,72(s5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80204a04:	060ab783          	ld	a5,96(s5)
    80204a08:	e6043703          	ld	a4,-416(s0)
    80204a0c:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80204a0e:	060ab783          	ld	a5,96(s5)
    80204a12:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80204a16:	85ea                	mv	a1,s10
    80204a18:	ffffd097          	auipc	ra,0xffffd
    80204a1c:	21e080e7          	jalr	542(ra) # 80201c36 <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    80204a20:	058ab783          	ld	a5,88(s5)
    80204a24:	83b1                	srli	a5,a5,0xc
    80204a26:	577d                	li	a4,-1
    80204a28:	177e                	slli	a4,a4,0x3f
    80204a2a:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80204a2c:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80204a30:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    80204a34:	4581                	li	a1,0
    80204a36:	854e                	mv	a0,s3
    80204a38:	ffffd097          	auipc	ra,0xffffd
    80204a3c:	c8c080e7          	jalr	-884(ra) # 802016c4 <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80204a40:	0004851b          	sext.w	a0,s1
    80204a44:	a089                	j	80204a86 <exec+0x338>
    return -1;
    80204a46:	557d                	li	a0,-1
    80204a48:	a83d                	j	80204a86 <exec+0x338>
    80204a4a:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    80204a4e:	df043583          	ld	a1,-528(s0)
    80204a52:	e0843503          	ld	a0,-504(s0)
    80204a56:	ffffd097          	auipc	ra,0xffffd
    80204a5a:	1e0080e7          	jalr	480(ra) # 80201c36 <proc_freepagetable>
    kvmfree(kpagetable, 0);
    80204a5e:	4581                	li	a1,0
    80204a60:	855a                	mv	a0,s6
    80204a62:	ffffd097          	auipc	ra,0xffffd
    80204a66:	c62080e7          	jalr	-926(ra) # 802016c4 <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    80204a6a:	557d                	li	a0,-1
  if(ep){
    80204a6c:	000a0d63          	beqz	s4,80204a86 <exec+0x338>
    eunlock(ep);
    80204a70:	8552                	mv	a0,s4
    80204a72:	00003097          	auipc	ra,0x3
    80204a76:	880080e7          	jalr	-1920(ra) # 802072f2 <eunlock>
    eput(ep);
    80204a7a:	8552                	mv	a0,s4
    80204a7c:	00003097          	auipc	ra,0x3
    80204a80:	8c4080e7          	jalr	-1852(ra) # 80207340 <eput>
  return -1;
    80204a84:	557d                	li	a0,-1
}
    80204a86:	22813083          	ld	ra,552(sp)
    80204a8a:	22013403          	ld	s0,544(sp)
    80204a8e:	21813483          	ld	s1,536(sp)
    80204a92:	21013903          	ld	s2,528(sp)
    80204a96:	20813983          	ld	s3,520(sp)
    80204a9a:	20013a03          	ld	s4,512(sp)
    80204a9e:	7afe                	ld	s5,504(sp)
    80204aa0:	7b5e                	ld	s6,496(sp)
    80204aa2:	7bbe                	ld	s7,488(sp)
    80204aa4:	7c1e                	ld	s8,480(sp)
    80204aa6:	6cfe                	ld	s9,472(sp)
    80204aa8:	6d5e                	ld	s10,464(sp)
    80204aaa:	6dbe                	ld	s11,456(sp)
    80204aac:	23010113          	addi	sp,sp,560
    80204ab0:	8082                	ret
    80204ab2:	de943823          	sd	s1,-528(s0)
    80204ab6:	bf61                	j	80204a4e <exec+0x300>
    80204ab8:	de943823          	sd	s1,-528(s0)
    80204abc:	bf49                	j	80204a4e <exec+0x300>
    80204abe:	de943823          	sd	s1,-528(s0)
    80204ac2:	b771                	j	80204a4e <exec+0x300>
  sz = sz1;
    80204ac4:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204ac8:	4a01                	li	s4,0
    80204aca:	b751                	j	80204a4e <exec+0x300>
  sz = sz1;
    80204acc:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204ad0:	4a01                	li	s4,0
    80204ad2:	bfb5                	j	80204a4e <exec+0x300>
  sz = sz1;
    80204ad4:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204ad8:	4a01                	li	s4,0
    80204ada:	bf95                	j	80204a4e <exec+0x300>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204adc:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204ae0:	e0043783          	ld	a5,-512(s0)
    80204ae4:	0017869b          	addiw	a3,a5,1
    80204ae8:	e0d43023          	sd	a3,-512(s0)
    80204aec:	df843783          	ld	a5,-520(s0)
    80204af0:	0387879b          	addiw	a5,a5,56
    80204af4:	e8045703          	lhu	a4,-384(s0)
    80204af8:	d8e6dee3          	bge	a3,a4,80204894 <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204afc:	2781                	sext.w	a5,a5
    80204afe:	def43c23          	sd	a5,-520(s0)
    80204b02:	03800713          	li	a4,56
    80204b06:	86be                	mv	a3,a5
    80204b08:	de043603          	ld	a2,-544(s0)
    80204b0c:	4581                	li	a1,0
    80204b0e:	8552                	mv	a0,s4
    80204b10:	00002097          	auipc	ra,0x2
    80204b14:	ea8080e7          	jalr	-344(ra) # 802069b8 <eread>
    80204b18:	03800793          	li	a5,56
    80204b1c:	f2f517e3          	bne	a0,a5,80204a4a <exec+0x2fc>
    if(ph.type != ELF_PROG_LOAD)
    80204b20:	e1042783          	lw	a5,-496(s0)
    80204b24:	4705                	li	a4,1
    80204b26:	fae79de3          	bne	a5,a4,80204ae0 <exec+0x392>
    if(ph.memsz < ph.filesz)
    80204b2a:	e3843683          	ld	a3,-456(s0)
    80204b2e:	e3043783          	ld	a5,-464(s0)
    80204b32:	f8f6e0e3          	bltu	a3,a5,80204ab2 <exec+0x364>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80204b36:	e2043783          	ld	a5,-480(s0)
    80204b3a:	96be                	add	a3,a3,a5
    80204b3c:	f6f6eee3          	bltu	a3,a5,80204ab8 <exec+0x36a>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204b40:	8626                	mv	a2,s1
    80204b42:	85da                	mv	a1,s6
    80204b44:	e0843503          	ld	a0,-504(s0)
    80204b48:	ffffc097          	auipc	ra,0xffffc
    80204b4c:	4c2080e7          	jalr	1218(ra) # 8020100a <uvmalloc>
    80204b50:	dea43823          	sd	a0,-528(s0)
    80204b54:	d52d                	beqz	a0,80204abe <exec+0x370>
    if(ph.vaddr % PGSIZE != 0)
    80204b56:	e2043c03          	ld	s8,-480(s0)
    80204b5a:	dd043783          	ld	a5,-560(s0)
    80204b5e:	00fc77b3          	and	a5,s8,a5
    80204b62:	ee0796e3          	bnez	a5,80204a4e <exec+0x300>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    80204b66:	e1842c83          	lw	s9,-488(s0)
    80204b6a:	e3042b83          	lw	s7,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204b6e:	f60b87e3          	beqz	s7,80204adc <exec+0x38e>
    80204b72:	89de                	mv	s3,s7
    80204b74:	4481                	li	s1,0
    80204b76:	b9ed                	j	80204870 <exec+0x122>
    kvmfree(kpagetable, 0);
    80204b78:	4581                	li	a1,0
    80204b7a:	855a                	mv	a0,s6
    80204b7c:	ffffd097          	auipc	ra,0xffffd
    80204b80:	b48080e7          	jalr	-1208(ra) # 802016c4 <kvmfree>
  return -1;
    80204b84:	557d                	li	a0,-1
    80204b86:	b701                	j	80204a86 <exec+0x338>

0000000080204b88 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80204b88:	7179                	addi	sp,sp,-48
    80204b8a:	f406                	sd	ra,40(sp)
    80204b8c:	f022                	sd	s0,32(sp)
    80204b8e:	ec26                	sd	s1,24(sp)
    80204b90:	e84a                	sd	s2,16(sp)
    80204b92:	1800                	addi	s0,sp,48
    80204b94:	892e                	mv	s2,a1
    80204b96:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80204b98:	fdc40593          	addi	a1,s0,-36
    80204b9c:	ffffe097          	auipc	ra,0xffffe
    80204ba0:	55c080e7          	jalr	1372(ra) # 802030f8 <argint>
    80204ba4:	04054063          	bltz	a0,80204be4 <argfd+0x5c>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    80204ba8:	fdc42703          	lw	a4,-36(s0)
    80204bac:	47bd                	li	a5,15
    80204bae:	02e7ed63          	bltu	a5,a4,80204be8 <argfd+0x60>
    80204bb2:	ffffd097          	auipc	ra,0xffffd
    80204bb6:	f04080e7          	jalr	-252(ra) # 80201ab6 <myproc>
    80204bba:	fdc42703          	lw	a4,-36(s0)
    80204bbe:	01a70793          	addi	a5,a4,26 # fffffffffffff01a <ebss_clear+0xffffffff7fdd201a>
    80204bc2:	078e                	slli	a5,a5,0x3
    80204bc4:	953e                	add	a0,a0,a5
    80204bc6:	651c                	ld	a5,8(a0)
    80204bc8:	c395                	beqz	a5,80204bec <argfd+0x64>
    return -1;
  if(pfd)
    80204bca:	00090463          	beqz	s2,80204bd2 <argfd+0x4a>
    *pfd = fd;
    80204bce:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    80204bd2:	4501                	li	a0,0
  if(pf)
    80204bd4:	c091                	beqz	s1,80204bd8 <argfd+0x50>
    *pf = f;
    80204bd6:	e09c                	sd	a5,0(s1)
}
    80204bd8:	70a2                	ld	ra,40(sp)
    80204bda:	7402                	ld	s0,32(sp)
    80204bdc:	64e2                	ld	s1,24(sp)
    80204bde:	6942                	ld	s2,16(sp)
    80204be0:	6145                	addi	sp,sp,48
    80204be2:	8082                	ret
    return -1;
    80204be4:	557d                	li	a0,-1
    80204be6:	bfcd                	j	80204bd8 <argfd+0x50>
    return -1;
    80204be8:	557d                	li	a0,-1
    80204bea:	b7fd                	j	80204bd8 <argfd+0x50>
    80204bec:	557d                	li	a0,-1
    80204bee:	b7ed                	j	80204bd8 <argfd+0x50>

0000000080204bf0 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80204bf0:	1101                	addi	sp,sp,-32
    80204bf2:	ec06                	sd	ra,24(sp)
    80204bf4:	e822                	sd	s0,16(sp)
    80204bf6:	e426                	sd	s1,8(sp)
    80204bf8:	1000                	addi	s0,sp,32
    80204bfa:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    80204bfc:	ffffd097          	auipc	ra,0xffffd
    80204c00:	eba080e7          	jalr	-326(ra) # 80201ab6 <myproc>
    80204c04:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    80204c06:	0d850793          	addi	a5,a0,216
    80204c0a:	4501                	li	a0,0
    80204c0c:	46c1                	li	a3,16
    if(p->ofile[fd] == 0){
    80204c0e:	6398                	ld	a4,0(a5)
    80204c10:	cb19                	beqz	a4,80204c26 <fdalloc+0x36>
  for(fd = 0; fd < NOFILE; fd++){
    80204c12:	2505                	addiw	a0,a0,1
    80204c14:	07a1                	addi	a5,a5,8
    80204c16:	fed51ce3          	bne	a0,a3,80204c0e <fdalloc+0x1e>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    80204c1a:	557d                	li	a0,-1
}
    80204c1c:	60e2                	ld	ra,24(sp)
    80204c1e:	6442                	ld	s0,16(sp)
    80204c20:	64a2                	ld	s1,8(sp)
    80204c22:	6105                	addi	sp,sp,32
    80204c24:	8082                	ret
      p->ofile[fd] = f;
    80204c26:	01a50793          	addi	a5,a0,26
    80204c2a:	078e                	slli	a5,a5,0x3
    80204c2c:	963e                	add	a2,a2,a5
    80204c2e:	e604                	sd	s1,8(a2)
      return fd;
    80204c30:	b7f5                	j	80204c1c <fdalloc+0x2c>

0000000080204c32 <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    80204c32:	7169                	addi	sp,sp,-304
    80204c34:	f606                	sd	ra,296(sp)
    80204c36:	f222                	sd	s0,288(sp)
    80204c38:	ee26                	sd	s1,280(sp)
    80204c3a:	ea4a                	sd	s2,272(sp)
    80204c3c:	e64e                	sd	s3,264(sp)
    80204c3e:	1a00                	addi	s0,sp,304
    80204c40:	892e                	mv	s2,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    80204c42:	ed040593          	addi	a1,s0,-304
    80204c46:	00003097          	auipc	ra,0x3
    80204c4a:	f06080e7          	jalr	-250(ra) # 80207b4c <enameparent>
    80204c4e:	84aa                	mv	s1,a0
    80204c50:	c945                	beqz	a0,80204d00 <create+0xce>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    80204c52:	00002097          	auipc	ra,0x2
    80204c56:	66a080e7          	jalr	1642(ra) # 802072bc <elock>
  if (type == T_DIR) {
    80204c5a:	fff90613          	addi	a2,s2,-1
    80204c5e:	00163613          	seqz	a2,a2
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204c62:	0046161b          	slliw	a2,a2,0x4
    80204c66:	ed040593          	addi	a1,s0,-304
    80204c6a:	8526                	mv	a0,s1
    80204c6c:	00003097          	auipc	ra,0x3
    80204c70:	b3c080e7          	jalr	-1220(ra) # 802077a8 <ealloc>
    80204c74:	89aa                	mv	s3,a0
    80204c76:	c529                	beqz	a0,80204cc0 <create+0x8e>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204c78:	0009079b          	sext.w	a5,s2
    80204c7c:	4705                	li	a4,1
    80204c7e:	04e78c63          	beq	a5,a4,80204cd6 <create+0xa4>
    80204c82:	2901                	sext.w	s2,s2
    80204c84:	4789                	li	a5,2
    80204c86:	00f91663          	bne	s2,a5,80204c92 <create+0x60>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    80204c8a:	10054783          	lbu	a5,256(a0)
    80204c8e:	8bc1                	andi	a5,a5,16
    80204c90:	e7b9                	bnez	a5,80204cde <create+0xac>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    80204c92:	8526                	mv	a0,s1
    80204c94:	00002097          	auipc	ra,0x2
    80204c98:	65e080e7          	jalr	1630(ra) # 802072f2 <eunlock>
  eput(dp);
    80204c9c:	8526                	mv	a0,s1
    80204c9e:	00002097          	auipc	ra,0x2
    80204ca2:	6a2080e7          	jalr	1698(ra) # 80207340 <eput>

  elock(ep);
    80204ca6:	854e                	mv	a0,s3
    80204ca8:	00002097          	auipc	ra,0x2
    80204cac:	614080e7          	jalr	1556(ra) # 802072bc <elock>
  return ep;
}
    80204cb0:	854e                	mv	a0,s3
    80204cb2:	70b2                	ld	ra,296(sp)
    80204cb4:	7412                	ld	s0,288(sp)
    80204cb6:	64f2                	ld	s1,280(sp)
    80204cb8:	6952                	ld	s2,272(sp)
    80204cba:	69b2                	ld	s3,264(sp)
    80204cbc:	6155                	addi	sp,sp,304
    80204cbe:	8082                	ret
    eunlock(dp);
    80204cc0:	8526                	mv	a0,s1
    80204cc2:	00002097          	auipc	ra,0x2
    80204cc6:	630080e7          	jalr	1584(ra) # 802072f2 <eunlock>
    eput(dp);
    80204cca:	8526                	mv	a0,s1
    80204ccc:	00002097          	auipc	ra,0x2
    80204cd0:	674080e7          	jalr	1652(ra) # 80207340 <eput>
    return NULL;
    80204cd4:	bff1                	j	80204cb0 <create+0x7e>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204cd6:	10054783          	lbu	a5,256(a0)
    80204cda:	8bc1                	andi	a5,a5,16
    80204cdc:	fbdd                	bnez	a5,80204c92 <create+0x60>
    eunlock(dp);
    80204cde:	8526                	mv	a0,s1
    80204ce0:	00002097          	auipc	ra,0x2
    80204ce4:	612080e7          	jalr	1554(ra) # 802072f2 <eunlock>
    eput(ep);
    80204ce8:	854e                	mv	a0,s3
    80204cea:	00002097          	auipc	ra,0x2
    80204cee:	656080e7          	jalr	1622(ra) # 80207340 <eput>
    eput(dp);
    80204cf2:	8526                	mv	a0,s1
    80204cf4:	00002097          	auipc	ra,0x2
    80204cf8:	64c080e7          	jalr	1612(ra) # 80207340 <eput>
    return NULL;
    80204cfc:	4981                	li	s3,0
    80204cfe:	bf4d                	j	80204cb0 <create+0x7e>
    return NULL;
    80204d00:	89aa                	mv	s3,a0
    80204d02:	b77d                	j	80204cb0 <create+0x7e>

0000000080204d04 <isdirempty>:
}

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct dirent *dp)
{
    80204d04:	7165                	addi	sp,sp,-400
    80204d06:	e706                	sd	ra,392(sp)
    80204d08:	e322                	sd	s0,384(sp)
    80204d0a:	0b00                	addi	s0,sp,400
  struct dirent ep;
  int count;
  int ret;
  ep.valid = 0;
    80204d0c:	f8041b23          	sh	zero,-106(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204d10:	e7c40693          	addi	a3,s0,-388
    80204d14:	04000613          	li	a2,64
    80204d18:	e8040593          	addi	a1,s0,-384
    80204d1c:	00002097          	auipc	ra,0x2
    80204d20:	7a4080e7          	jalr	1956(ra) # 802074c0 <enext>
  return ret == -1;
    80204d24:	0505                	addi	a0,a0,1
}
    80204d26:	00153513          	seqz	a0,a0
    80204d2a:	60ba                	ld	ra,392(sp)
    80204d2c:	641a                	ld	s0,384(sp)
    80204d2e:	6159                	addi	sp,sp,400
    80204d30:	8082                	ret

0000000080204d32 <sys_dup>:
{
    80204d32:	7179                	addi	sp,sp,-48
    80204d34:	f406                	sd	ra,40(sp)
    80204d36:	f022                	sd	s0,32(sp)
    80204d38:	ec26                	sd	s1,24(sp)
    80204d3a:	e84a                	sd	s2,16(sp)
    80204d3c:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    80204d3e:	fd840613          	addi	a2,s0,-40
    80204d42:	4581                	li	a1,0
    80204d44:	4501                	li	a0,0
    80204d46:	00000097          	auipc	ra,0x0
    80204d4a:	e42080e7          	jalr	-446(ra) # 80204b88 <argfd>
    return -1;
    80204d4e:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    80204d50:	02054363          	bltz	a0,80204d76 <sys_dup+0x44>
  if((fd=fdalloc(f)) < 0)
    80204d54:	fd843903          	ld	s2,-40(s0)
    80204d58:	854a                	mv	a0,s2
    80204d5a:	00000097          	auipc	ra,0x0
    80204d5e:	e96080e7          	jalr	-362(ra) # 80204bf0 <fdalloc>
    80204d62:	84aa                	mv	s1,a0
    return -1;
    80204d64:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    80204d66:	00054863          	bltz	a0,80204d76 <sys_dup+0x44>
  filedup(f);
    80204d6a:	854a                	mv	a0,s2
    80204d6c:	fffff097          	auipc	ra,0xfffff
    80204d70:	1de080e7          	jalr	478(ra) # 80203f4a <filedup>
  return fd;
    80204d74:	87a6                	mv	a5,s1
}
    80204d76:	853e                	mv	a0,a5
    80204d78:	70a2                	ld	ra,40(sp)
    80204d7a:	7402                	ld	s0,32(sp)
    80204d7c:	64e2                	ld	s1,24(sp)
    80204d7e:	6942                	ld	s2,16(sp)
    80204d80:	6145                	addi	sp,sp,48
    80204d82:	8082                	ret

0000000080204d84 <sys_read>:
{
    80204d84:	7179                	addi	sp,sp,-48
    80204d86:	f406                	sd	ra,40(sp)
    80204d88:	f022                	sd	s0,32(sp)
    80204d8a:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d8c:	fe840613          	addi	a2,s0,-24
    80204d90:	4581                	li	a1,0
    80204d92:	4501                	li	a0,0
    80204d94:	00000097          	auipc	ra,0x0
    80204d98:	df4080e7          	jalr	-524(ra) # 80204b88 <argfd>
    return -1;
    80204d9c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d9e:	04054163          	bltz	a0,80204de0 <sys_read+0x5c>
    80204da2:	fe440593          	addi	a1,s0,-28
    80204da6:	4509                	li	a0,2
    80204da8:	ffffe097          	auipc	ra,0xffffe
    80204dac:	350080e7          	jalr	848(ra) # 802030f8 <argint>
    return -1;
    80204db0:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204db2:	02054763          	bltz	a0,80204de0 <sys_read+0x5c>
    80204db6:	fd840593          	addi	a1,s0,-40
    80204dba:	4505                	li	a0,1
    80204dbc:	ffffe097          	auipc	ra,0xffffe
    80204dc0:	39e080e7          	jalr	926(ra) # 8020315a <argaddr>
    return -1;
    80204dc4:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204dc6:	00054d63          	bltz	a0,80204de0 <sys_read+0x5c>
  return fileread(f, p, n);
    80204dca:	fe442603          	lw	a2,-28(s0)
    80204dce:	fd843583          	ld	a1,-40(s0)
    80204dd2:	fe843503          	ld	a0,-24(s0)
    80204dd6:	fffff097          	auipc	ra,0xfffff
    80204dda:	2e0080e7          	jalr	736(ra) # 802040b6 <fileread>
    80204dde:	87aa                	mv	a5,a0
}
    80204de0:	853e                	mv	a0,a5
    80204de2:	70a2                	ld	ra,40(sp)
    80204de4:	7402                	ld	s0,32(sp)
    80204de6:	6145                	addi	sp,sp,48
    80204de8:	8082                	ret

0000000080204dea <sys_write>:
{
    80204dea:	7179                	addi	sp,sp,-48
    80204dec:	f406                	sd	ra,40(sp)
    80204dee:	f022                	sd	s0,32(sp)
    80204df0:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204df2:	fe840613          	addi	a2,s0,-24
    80204df6:	4581                	li	a1,0
    80204df8:	4501                	li	a0,0
    80204dfa:	00000097          	auipc	ra,0x0
    80204dfe:	d8e080e7          	jalr	-626(ra) # 80204b88 <argfd>
    return -1;
    80204e02:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204e04:	04054163          	bltz	a0,80204e46 <sys_write+0x5c>
    80204e08:	fe440593          	addi	a1,s0,-28
    80204e0c:	4509                	li	a0,2
    80204e0e:	ffffe097          	auipc	ra,0xffffe
    80204e12:	2ea080e7          	jalr	746(ra) # 802030f8 <argint>
    return -1;
    80204e16:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204e18:	02054763          	bltz	a0,80204e46 <sys_write+0x5c>
    80204e1c:	fd840593          	addi	a1,s0,-40
    80204e20:	4505                	li	a0,1
    80204e22:	ffffe097          	auipc	ra,0xffffe
    80204e26:	338080e7          	jalr	824(ra) # 8020315a <argaddr>
    return -1;
    80204e2a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204e2c:	00054d63          	bltz	a0,80204e46 <sys_write+0x5c>
  return filewrite(f, p, n);
    80204e30:	fe442603          	lw	a2,-28(s0)
    80204e34:	fd843583          	ld	a1,-40(s0)
    80204e38:	fe843503          	ld	a0,-24(s0)
    80204e3c:	fffff097          	auipc	ra,0xfffff
    80204e40:	33c080e7          	jalr	828(ra) # 80204178 <filewrite>
    80204e44:	87aa                	mv	a5,a0
}
    80204e46:	853e                	mv	a0,a5
    80204e48:	70a2                	ld	ra,40(sp)
    80204e4a:	7402                	ld	s0,32(sp)
    80204e4c:	6145                	addi	sp,sp,48
    80204e4e:	8082                	ret

0000000080204e50 <sys_close>:
{
    80204e50:	1101                	addi	sp,sp,-32
    80204e52:	ec06                	sd	ra,24(sp)
    80204e54:	e822                	sd	s0,16(sp)
    80204e56:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204e58:	fe040613          	addi	a2,s0,-32
    80204e5c:	fec40593          	addi	a1,s0,-20
    80204e60:	4501                	li	a0,0
    80204e62:	00000097          	auipc	ra,0x0
    80204e66:	d26080e7          	jalr	-730(ra) # 80204b88 <argfd>
    return -1;
    80204e6a:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    80204e6c:	02054463          	bltz	a0,80204e94 <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80204e70:	ffffd097          	auipc	ra,0xffffd
    80204e74:	c46080e7          	jalr	-954(ra) # 80201ab6 <myproc>
    80204e78:	fec42783          	lw	a5,-20(s0)
    80204e7c:	07e9                	addi	a5,a5,26
    80204e7e:	078e                	slli	a5,a5,0x3
    80204e80:	953e                	add	a0,a0,a5
    80204e82:	00053423          	sd	zero,8(a0)
  fileclose(f);
    80204e86:	fe043503          	ld	a0,-32(s0)
    80204e8a:	fffff097          	auipc	ra,0xfffff
    80204e8e:	112080e7          	jalr	274(ra) # 80203f9c <fileclose>
  return 0;
    80204e92:	4781                	li	a5,0
}
    80204e94:	853e                	mv	a0,a5
    80204e96:	60e2                	ld	ra,24(sp)
    80204e98:	6442                	ld	s0,16(sp)
    80204e9a:	6105                	addi	sp,sp,32
    80204e9c:	8082                	ret

0000000080204e9e <sys_fstat>:
{
    80204e9e:	1101                	addi	sp,sp,-32
    80204ea0:	ec06                	sd	ra,24(sp)
    80204ea2:	e822                	sd	s0,16(sp)
    80204ea4:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204ea6:	fe840613          	addi	a2,s0,-24
    80204eaa:	4581                	li	a1,0
    80204eac:	4501                	li	a0,0
    80204eae:	00000097          	auipc	ra,0x0
    80204eb2:	cda080e7          	jalr	-806(ra) # 80204b88 <argfd>
    return -1;
    80204eb6:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204eb8:	02054563          	bltz	a0,80204ee2 <sys_fstat+0x44>
    80204ebc:	fe040593          	addi	a1,s0,-32
    80204ec0:	4505                	li	a0,1
    80204ec2:	ffffe097          	auipc	ra,0xffffe
    80204ec6:	298080e7          	jalr	664(ra) # 8020315a <argaddr>
    return -1;
    80204eca:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204ecc:	00054b63          	bltz	a0,80204ee2 <sys_fstat+0x44>
  return filestat(f, st);
    80204ed0:	fe043583          	ld	a1,-32(s0)
    80204ed4:	fe843503          	ld	a0,-24(s0)
    80204ed8:	fffff097          	auipc	ra,0xfffff
    80204edc:	17a080e7          	jalr	378(ra) # 80204052 <filestat>
    80204ee0:	87aa                	mv	a5,a0
}
    80204ee2:	853e                	mv	a0,a5
    80204ee4:	60e2                	ld	ra,24(sp)
    80204ee6:	6442                	ld	s0,16(sp)
    80204ee8:	6105                	addi	sp,sp,32
    80204eea:	8082                	ret

0000000080204eec <sys_open>:
{
    80204eec:	7129                	addi	sp,sp,-320
    80204eee:	fe06                	sd	ra,312(sp)
    80204ef0:	fa22                	sd	s0,304(sp)
    80204ef2:	f626                	sd	s1,296(sp)
    80204ef4:	f24a                	sd	s2,288(sp)
    80204ef6:	ee4e                	sd	s3,280(sp)
    80204ef8:	0280                	addi	s0,sp,320
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204efa:	10400613          	li	a2,260
    80204efe:	ec840593          	addi	a1,s0,-312
    80204f02:	4501                	li	a0,0
    80204f04:	ffffe097          	auipc	ra,0xffffe
    80204f08:	278080e7          	jalr	632(ra) # 8020317c <argstr>
    80204f0c:	87aa                	mv	a5,a0
    return -1;
    80204f0e:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204f10:	0807ce63          	bltz	a5,80204fac <sys_open+0xc0>
    80204f14:	ec440593          	addi	a1,s0,-316
    80204f18:	4505                	li	a0,1
    80204f1a:	ffffe097          	auipc	ra,0xffffe
    80204f1e:	1de080e7          	jalr	478(ra) # 802030f8 <argint>
    80204f22:	0e054163          	bltz	a0,80205004 <sys_open+0x118>
  if(omode & O_CREATE){
    80204f26:	ec442603          	lw	a2,-316(s0)
    80204f2a:	04067793          	andi	a5,a2,64
    80204f2e:	c7d1                	beqz	a5,80204fba <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    80204f30:	4589                	li	a1,2
    80204f32:	ec840513          	addi	a0,s0,-312
    80204f36:	00000097          	auipc	ra,0x0
    80204f3a:	cfc080e7          	jalr	-772(ra) # 80204c32 <create>
    80204f3e:	892a                	mv	s2,a0
    if(ep == NULL){
    80204f40:	c561                	beqz	a0,80205008 <sys_open+0x11c>
  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204f42:	fffff097          	auipc	ra,0xfffff
    80204f46:	f9e080e7          	jalr	-98(ra) # 80203ee0 <filealloc>
    80204f4a:	89aa                	mv	s3,a0
    80204f4c:	c579                	beqz	a0,8020501a <sys_open+0x12e>
    80204f4e:	00000097          	auipc	ra,0x0
    80204f52:	ca2080e7          	jalr	-862(ra) # 80204bf0 <fdalloc>
    80204f56:	84aa                	mv	s1,a0
    80204f58:	0a054c63          	bltz	a0,80205010 <sys_open+0x124>
  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80204f5c:	10094783          	lbu	a5,256(s2)
    80204f60:	8bc1                	andi	a5,a5,16
    80204f62:	e791                	bnez	a5,80204f6e <sys_open+0x82>
    80204f64:	ec442783          	lw	a5,-316(s0)
    80204f68:	4007f793          	andi	a5,a5,1024
    80204f6c:	e7d1                	bnez	a5,80204ff8 <sys_open+0x10c>
  f->type = FD_ENTRY;
    80204f6e:	4789                	li	a5,2
    80204f70:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204f74:	ec442783          	lw	a5,-316(s0)
    80204f78:	0047f693          	andi	a3,a5,4
    80204f7c:	4701                	li	a4,0
    80204f7e:	c299                	beqz	a3,80204f84 <sys_open+0x98>
    80204f80:	10892703          	lw	a4,264(s2)
    80204f84:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204f88:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80204f8c:	0017c713          	xori	a4,a5,1
    80204f90:	8b05                	andi	a4,a4,1
    80204f92:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204f96:	8b8d                	andi	a5,a5,3
    80204f98:	00f037b3          	snez	a5,a5
    80204f9c:	00f984a3          	sb	a5,9(s3)
  eunlock(ep);
    80204fa0:	854a                	mv	a0,s2
    80204fa2:	00002097          	auipc	ra,0x2
    80204fa6:	350080e7          	jalr	848(ra) # 802072f2 <eunlock>
  return fd;
    80204faa:	8526                	mv	a0,s1
}
    80204fac:	70f2                	ld	ra,312(sp)
    80204fae:	7452                	ld	s0,304(sp)
    80204fb0:	74b2                	ld	s1,296(sp)
    80204fb2:	7912                	ld	s2,288(sp)
    80204fb4:	69f2                	ld	s3,280(sp)
    80204fb6:	6131                	addi	sp,sp,320
    80204fb8:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204fba:	ec840513          	addi	a0,s0,-312
    80204fbe:	00003097          	auipc	ra,0x3
    80204fc2:	b52080e7          	jalr	-1198(ra) # 80207b10 <ename>
    80204fc6:	892a                	mv	s2,a0
    80204fc8:	c131                	beqz	a0,8020500c <sys_open+0x120>
    elock(ep);
    80204fca:	00002097          	auipc	ra,0x2
    80204fce:	2f2080e7          	jalr	754(ra) # 802072bc <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80204fd2:	10094783          	lbu	a5,256(s2)
    80204fd6:	8bc1                	andi	a5,a5,16
    80204fd8:	d7ad                	beqz	a5,80204f42 <sys_open+0x56>
    80204fda:	ec442783          	lw	a5,-316(s0)
    80204fde:	d3b5                	beqz	a5,80204f42 <sys_open+0x56>
      eunlock(ep);
    80204fe0:	854a                	mv	a0,s2
    80204fe2:	00002097          	auipc	ra,0x2
    80204fe6:	310080e7          	jalr	784(ra) # 802072f2 <eunlock>
      eput(ep);
    80204fea:	854a                	mv	a0,s2
    80204fec:	00002097          	auipc	ra,0x2
    80204ff0:	354080e7          	jalr	852(ra) # 80207340 <eput>
      return -1;
    80204ff4:	557d                	li	a0,-1
    80204ff6:	bf5d                	j	80204fac <sys_open+0xc0>
    etrunc(ep);
    80204ff8:	854a                	mv	a0,s2
    80204ffa:	00002097          	auipc	ra,0x2
    80204ffe:	258080e7          	jalr	600(ra) # 80207252 <etrunc>
    80205002:	b7b5                	j	80204f6e <sys_open+0x82>
    return -1;
    80205004:	557d                	li	a0,-1
    80205006:	b75d                	j	80204fac <sys_open+0xc0>
      return -1;
    80205008:	557d                	li	a0,-1
    8020500a:	b74d                	j	80204fac <sys_open+0xc0>
      return -1;
    8020500c:	557d                	li	a0,-1
    8020500e:	bf79                	j	80204fac <sys_open+0xc0>
      fileclose(f);
    80205010:	854e                	mv	a0,s3
    80205012:	fffff097          	auipc	ra,0xfffff
    80205016:	f8a080e7          	jalr	-118(ra) # 80203f9c <fileclose>
    eunlock(ep);
    8020501a:	854a                	mv	a0,s2
    8020501c:	00002097          	auipc	ra,0x2
    80205020:	2d6080e7          	jalr	726(ra) # 802072f2 <eunlock>
    eput(ep);
    80205024:	854a                	mv	a0,s2
    80205026:	00002097          	auipc	ra,0x2
    8020502a:	31a080e7          	jalr	794(ra) # 80207340 <eput>
    return -1;
    8020502e:	557d                	li	a0,-1
    80205030:	bfb5                	j	80204fac <sys_open+0xc0>

0000000080205032 <sys_mkdir>:
{
    80205032:	7169                	addi	sp,sp,-304
    80205034:	f606                	sd	ra,296(sp)
    80205036:	f222                	sd	s0,288(sp)
    80205038:	ee26                	sd	s1,280(sp)
    8020503a:	1a00                	addi	s0,sp,304
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    8020503c:	10400613          	li	a2,260
    80205040:	ed840593          	addi	a1,s0,-296
    80205044:	4501                	li	a0,0
    80205046:	ffffe097          	auipc	ra,0xffffe
    8020504a:	136080e7          	jalr	310(ra) # 8020317c <argstr>
    return -1;
    8020504e:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80205050:	02054663          	bltz	a0,8020507c <sys_mkdir+0x4a>
    80205054:	4601                	li	a2,0
    80205056:	4585                	li	a1,1
    80205058:	ed840513          	addi	a0,s0,-296
    8020505c:	00000097          	auipc	ra,0x0
    80205060:	bd6080e7          	jalr	-1066(ra) # 80204c32 <create>
    80205064:	84aa                	mv	s1,a0
    80205066:	c10d                	beqz	a0,80205088 <sys_mkdir+0x56>
  eunlock(ep);
    80205068:	00002097          	auipc	ra,0x2
    8020506c:	28a080e7          	jalr	650(ra) # 802072f2 <eunlock>
  eput(ep);
    80205070:	8526                	mv	a0,s1
    80205072:	00002097          	auipc	ra,0x2
    80205076:	2ce080e7          	jalr	718(ra) # 80207340 <eput>
  return 0;
    8020507a:	4781                	li	a5,0
}
    8020507c:	853e                	mv	a0,a5
    8020507e:	70b2                	ld	ra,296(sp)
    80205080:	7412                	ld	s0,288(sp)
    80205082:	64f2                	ld	s1,280(sp)
    80205084:	6155                	addi	sp,sp,304
    80205086:	8082                	ret
    return -1;
    80205088:	57fd                	li	a5,-1
    8020508a:	bfcd                	j	8020507c <sys_mkdir+0x4a>

000000008020508c <sys_chdir>:
{
    8020508c:	7169                	addi	sp,sp,-304
    8020508e:	f606                	sd	ra,296(sp)
    80205090:	f222                	sd	s0,288(sp)
    80205092:	ee26                	sd	s1,280(sp)
    80205094:	ea4a                	sd	s2,272(sp)
    80205096:	1a00                	addi	s0,sp,304
  struct proc *curr_proc = myproc();
    80205098:	ffffd097          	auipc	ra,0xffffd
    8020509c:	a1e080e7          	jalr	-1506(ra) # 80201ab6 <myproc>
    802050a0:	892a                	mv	s2,a0
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    802050a2:	10400613          	li	a2,260
    802050a6:	ed840593          	addi	a1,s0,-296
    802050aa:	4501                	li	a0,0
    802050ac:	ffffe097          	auipc	ra,0xffffe
    802050b0:	0d0080e7          	jalr	208(ra) # 8020317c <argstr>
    return -1;
    802050b4:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    802050b6:	04054b63          	bltz	a0,8020510c <sys_chdir+0x80>
    802050ba:	ed840513          	addi	a0,s0,-296
    802050be:	00003097          	auipc	ra,0x3
    802050c2:	a52080e7          	jalr	-1454(ra) # 80207b10 <ename>
    802050c6:	84aa                	mv	s1,a0
    802050c8:	c52d                	beqz	a0,80205132 <sys_chdir+0xa6>
  printf("Running: CHDIR ... path: %s\n",  path);
    802050ca:	ed840593          	addi	a1,s0,-296
    802050ce:	00006517          	auipc	a0,0x6
    802050d2:	c1250513          	addi	a0,a0,-1006 # 8020ace0 <digits+0x960>
    802050d6:	ffffb097          	auipc	ra,0xffffb
    802050da:	0b8080e7          	jalr	184(ra) # 8020018e <printf>
  elock(ep);
    802050de:	8526                	mv	a0,s1
    802050e0:	00002097          	auipc	ra,0x2
    802050e4:	1dc080e7          	jalr	476(ra) # 802072bc <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    802050e8:	1004c783          	lbu	a5,256(s1)
    802050ec:	8bc1                	andi	a5,a5,16
    802050ee:	c795                	beqz	a5,8020511a <sys_chdir+0x8e>
  eunlock(ep);
    802050f0:	8526                	mv	a0,s1
    802050f2:	00002097          	auipc	ra,0x2
    802050f6:	200080e7          	jalr	512(ra) # 802072f2 <eunlock>
  eput(curr_proc->cwd);
    802050fa:	15893503          	ld	a0,344(s2)
    802050fe:	00002097          	auipc	ra,0x2
    80205102:	242080e7          	jalr	578(ra) # 80207340 <eput>
  curr_proc->cwd = ep;
    80205106:	14993c23          	sd	s1,344(s2)
  return 0;
    8020510a:	4781                	li	a5,0
}
    8020510c:	853e                	mv	a0,a5
    8020510e:	70b2                	ld	ra,296(sp)
    80205110:	7412                	ld	s0,288(sp)
    80205112:	64f2                	ld	s1,280(sp)
    80205114:	6952                	ld	s2,272(sp)
    80205116:	6155                	addi	sp,sp,304
    80205118:	8082                	ret
    eunlock(ep);
    8020511a:	8526                	mv	a0,s1
    8020511c:	00002097          	auipc	ra,0x2
    80205120:	1d6080e7          	jalr	470(ra) # 802072f2 <eunlock>
    eput(ep);
    80205124:	8526                	mv	a0,s1
    80205126:	00002097          	auipc	ra,0x2
    8020512a:	21a080e7          	jalr	538(ra) # 80207340 <eput>
    return -1;
    8020512e:	57fd                	li	a5,-1
    80205130:	bff1                	j	8020510c <sys_chdir+0x80>
    return -1;
    80205132:	57fd                	li	a5,-1
    80205134:	bfe1                	j	8020510c <sys_chdir+0x80>

0000000080205136 <sys_pipe>:
{
    80205136:	7139                	addi	sp,sp,-64
    80205138:	fc06                	sd	ra,56(sp)
    8020513a:	f822                	sd	s0,48(sp)
    8020513c:	f426                	sd	s1,40(sp)
    8020513e:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    80205140:	ffffd097          	auipc	ra,0xffffd
    80205144:	976080e7          	jalr	-1674(ra) # 80201ab6 <myproc>
    80205148:	84aa                	mv	s1,a0
  if(argaddr(0, &fdarray) < 0)
    8020514a:	fd840593          	addi	a1,s0,-40
    8020514e:	4501                	li	a0,0
    80205150:	ffffe097          	auipc	ra,0xffffe
    80205154:	00a080e7          	jalr	10(ra) # 8020315a <argaddr>
    return -1;
    80205158:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    8020515a:	0c054e63          	bltz	a0,80205236 <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    8020515e:	fc840593          	addi	a1,s0,-56
    80205162:	fd040513          	addi	a0,s0,-48
    80205166:	fffff097          	auipc	ra,0xfffff
    8020516a:	2b4080e7          	jalr	692(ra) # 8020441a <pipealloc>
    return -1;
    8020516e:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80205170:	0c054363          	bltz	a0,80205236 <sys_pipe+0x100>
  fd0 = -1;
    80205174:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80205178:	fd043503          	ld	a0,-48(s0)
    8020517c:	00000097          	auipc	ra,0x0
    80205180:	a74080e7          	jalr	-1420(ra) # 80204bf0 <fdalloc>
    80205184:	fca42223          	sw	a0,-60(s0)
    80205188:	08054a63          	bltz	a0,8020521c <sys_pipe+0xe6>
    8020518c:	fc843503          	ld	a0,-56(s0)
    80205190:	00000097          	auipc	ra,0x0
    80205194:	a60080e7          	jalr	-1440(ra) # 80204bf0 <fdalloc>
    80205198:	fca42023          	sw	a0,-64(s0)
    8020519c:	06054763          	bltz	a0,8020520a <sys_pipe+0xd4>
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    802051a0:	4611                	li	a2,4
    802051a2:	fc440593          	addi	a1,s0,-60
    802051a6:	fd843503          	ld	a0,-40(s0)
    802051aa:	ffffc097          	auipc	ra,0xffffc
    802051ae:	1c8080e7          	jalr	456(ra) # 80201372 <copyout2>
    802051b2:	00054f63          	bltz	a0,802051d0 <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    802051b6:	4611                	li	a2,4
    802051b8:	fc040593          	addi	a1,s0,-64
    802051bc:	fd843503          	ld	a0,-40(s0)
    802051c0:	0511                	addi	a0,a0,4
    802051c2:	ffffc097          	auipc	ra,0xffffc
    802051c6:	1b0080e7          	jalr	432(ra) # 80201372 <copyout2>
  return 0;
    802051ca:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    802051cc:	06055563          	bgez	a0,80205236 <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    802051d0:	fc442783          	lw	a5,-60(s0)
    802051d4:	07e9                	addi	a5,a5,26
    802051d6:	078e                	slli	a5,a5,0x3
    802051d8:	97a6                	add	a5,a5,s1
    802051da:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    802051de:	fc042783          	lw	a5,-64(s0)
    802051e2:	07e9                	addi	a5,a5,26
    802051e4:	078e                	slli	a5,a5,0x3
    802051e6:	00f48533          	add	a0,s1,a5
    802051ea:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    802051ee:	fd043503          	ld	a0,-48(s0)
    802051f2:	fffff097          	auipc	ra,0xfffff
    802051f6:	daa080e7          	jalr	-598(ra) # 80203f9c <fileclose>
    fileclose(wf);
    802051fa:	fc843503          	ld	a0,-56(s0)
    802051fe:	fffff097          	auipc	ra,0xfffff
    80205202:	d9e080e7          	jalr	-610(ra) # 80203f9c <fileclose>
    return -1;
    80205206:	57fd                	li	a5,-1
    80205208:	a03d                	j	80205236 <sys_pipe+0x100>
    if(fd0 >= 0)
    8020520a:	fc442783          	lw	a5,-60(s0)
    8020520e:	0007c763          	bltz	a5,8020521c <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    80205212:	07e9                	addi	a5,a5,26
    80205214:	078e                	slli	a5,a5,0x3
    80205216:	97a6                	add	a5,a5,s1
    80205218:	0007b423          	sd	zero,8(a5)
    fileclose(rf);
    8020521c:	fd043503          	ld	a0,-48(s0)
    80205220:	fffff097          	auipc	ra,0xfffff
    80205224:	d7c080e7          	jalr	-644(ra) # 80203f9c <fileclose>
    fileclose(wf);
    80205228:	fc843503          	ld	a0,-56(s0)
    8020522c:	fffff097          	auipc	ra,0xfffff
    80205230:	d70080e7          	jalr	-656(ra) # 80203f9c <fileclose>
    return -1;
    80205234:	57fd                	li	a5,-1
}
    80205236:	853e                	mv	a0,a5
    80205238:	70e2                	ld	ra,56(sp)
    8020523a:	7442                	ld	s0,48(sp)
    8020523c:	74a2                	ld	s1,40(sp)
    8020523e:	6121                	addi	sp,sp,64
    80205240:	8082                	ret

0000000080205242 <sys_dev>:
{
    80205242:	7179                	addi	sp,sp,-48
    80205244:	f406                	sd	ra,40(sp)
    80205246:	f022                	sd	s0,32(sp)
    80205248:	ec26                	sd	s1,24(sp)
    8020524a:	1800                	addi	s0,sp,48
  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    8020524c:	fdc40593          	addi	a1,s0,-36
    80205250:	4501                	li	a0,0
    80205252:	ffffe097          	auipc	ra,0xffffe
    80205256:	ea6080e7          	jalr	-346(ra) # 802030f8 <argint>
    8020525a:	08054a63          	bltz	a0,802052ee <sys_dev+0xac>
    8020525e:	fd840593          	addi	a1,s0,-40
    80205262:	4505                	li	a0,1
    80205264:	ffffe097          	auipc	ra,0xffffe
    80205268:	e94080e7          	jalr	-364(ra) # 802030f8 <argint>
    8020526c:	08054763          	bltz	a0,802052fa <sys_dev+0xb8>
    80205270:	fd440593          	addi	a1,s0,-44
    80205274:	4509                	li	a0,2
    80205276:	ffffe097          	auipc	ra,0xffffe
    8020527a:	e82080e7          	jalr	-382(ra) # 802030f8 <argint>
    8020527e:	08054063          	bltz	a0,802052fe <sys_dev+0xbc>
  if(omode & O_CREATE){
    80205282:	fdc42783          	lw	a5,-36(s0)
    80205286:	0407f793          	andi	a5,a5,64
    8020528a:	ebb1                	bnez	a5,802052de <sys_dev+0x9c>
  if(major < 0 || major >= NDEV)
    8020528c:	fd842703          	lw	a4,-40(s0)
    80205290:	47a5                	li	a5,9
    return -1;
    80205292:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    80205294:	04e7ee63          	bltu	a5,a4,802052f0 <sys_dev+0xae>
  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80205298:	fffff097          	auipc	ra,0xfffff
    8020529c:	c48080e7          	jalr	-952(ra) # 80203ee0 <filealloc>
    802052a0:	84aa                	mv	s1,a0
    802052a2:	c125                	beqz	a0,80205302 <sys_dev+0xc0>
    802052a4:	00000097          	auipc	ra,0x0
    802052a8:	94c080e7          	jalr	-1716(ra) # 80204bf0 <fdalloc>
    802052ac:	04054d63          	bltz	a0,80205306 <sys_dev+0xc4>
  f->type = FD_DEVICE;
    802052b0:	478d                	li	a5,3
    802052b2:	c09c                	sw	a5,0(s1)
  f->off = 0;
    802052b4:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    802052b8:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    802052bc:	fd842783          	lw	a5,-40(s0)
    802052c0:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    802052c4:	fdc42783          	lw	a5,-36(s0)
    802052c8:	0017c713          	xori	a4,a5,1
    802052cc:	8b05                	andi	a4,a4,1
    802052ce:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    802052d2:	8b8d                	andi	a5,a5,3
    802052d4:	00f037b3          	snez	a5,a5
    802052d8:	00f484a3          	sb	a5,9(s1)
  return fd;
    802052dc:	a811                	j	802052f0 <sys_dev+0xae>
    panic("dev file on FAT");
    802052de:	00006517          	auipc	a0,0x6
    802052e2:	a2250513          	addi	a0,a0,-1502 # 8020ad00 <digits+0x980>
    802052e6:	ffffb097          	auipc	ra,0xffffb
    802052ea:	e5e080e7          	jalr	-418(ra) # 80200144 <panic>
    return -1;
    802052ee:	557d                	li	a0,-1
}
    802052f0:	70a2                	ld	ra,40(sp)
    802052f2:	7402                	ld	s0,32(sp)
    802052f4:	64e2                	ld	s1,24(sp)
    802052f6:	6145                	addi	sp,sp,48
    802052f8:	8082                	ret
    return -1;
    802052fa:	557d                	li	a0,-1
    802052fc:	bfd5                	j	802052f0 <sys_dev+0xae>
    802052fe:	557d                	li	a0,-1
    80205300:	bfc5                	j	802052f0 <sys_dev+0xae>
    return -1;
    80205302:	557d                	li	a0,-1
    80205304:	b7f5                	j	802052f0 <sys_dev+0xae>
      fileclose(f);
    80205306:	8526                	mv	a0,s1
    80205308:	fffff097          	auipc	ra,0xfffff
    8020530c:	c94080e7          	jalr	-876(ra) # 80203f9c <fileclose>
    return -1;
    80205310:	557d                	li	a0,-1
    80205312:	bff9                	j	802052f0 <sys_dev+0xae>

0000000080205314 <sys_readdir>:
{
    80205314:	1101                	addi	sp,sp,-32
    80205316:	ec06                	sd	ra,24(sp)
    80205318:	e822                	sd	s0,16(sp)
    8020531a:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    8020531c:	fe840613          	addi	a2,s0,-24
    80205320:	4581                	li	a1,0
    80205322:	4501                	li	a0,0
    80205324:	00000097          	auipc	ra,0x0
    80205328:	864080e7          	jalr	-1948(ra) # 80204b88 <argfd>
    return -1;
    8020532c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    8020532e:	02054563          	bltz	a0,80205358 <sys_readdir+0x44>
    80205332:	fe040593          	addi	a1,s0,-32
    80205336:	4505                	li	a0,1
    80205338:	ffffe097          	auipc	ra,0xffffe
    8020533c:	e22080e7          	jalr	-478(ra) # 8020315a <argaddr>
    return -1;
    80205340:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80205342:	00054b63          	bltz	a0,80205358 <sys_readdir+0x44>
  return dirnext(f, p);
    80205346:	fe043583          	ld	a1,-32(s0)
    8020534a:	fe843503          	ld	a0,-24(s0)
    8020534e:	fffff097          	auipc	ra,0xfffff
    80205352:	efa080e7          	jalr	-262(ra) # 80204248 <dirnext>
    80205356:	87aa                	mv	a5,a0
}
    80205358:	853e                	mv	a0,a5
    8020535a:	60e2                	ld	ra,24(sp)
    8020535c:	6442                	ld	s0,16(sp)
    8020535e:	6105                	addi	sp,sp,32
    80205360:	8082                	ret

0000000080205362 <sys_getcwd>:
{
    80205362:	714d                	addi	sp,sp,-336
    80205364:	e686                	sd	ra,328(sp)
    80205366:	e2a2                	sd	s0,320(sp)
    80205368:	fe26                	sd	s1,312(sp)
    8020536a:	fa4a                	sd	s2,304(sp)
    8020536c:	f64e                	sd	s3,296(sp)
    8020536e:	f252                	sd	s4,288(sp)
    80205370:	ee56                	sd	s5,280(sp)
    80205372:	0a80                	addi	s0,sp,336
  if (argaddr(0, &addr) < 0)
    80205374:	fb840593          	addi	a1,s0,-72
    80205378:	4501                	li	a0,0
    8020537a:	ffffe097          	auipc	ra,0xffffe
    8020537e:	de0080e7          	jalr	-544(ra) # 8020315a <argaddr>
    return -1;
    80205382:	54fd                	li	s1,-1
  if (argaddr(0, &addr) < 0)
    80205384:	08054763          	bltz	a0,80205412 <sys_getcwd+0xb0>
  struct dirent *de = myproc()->cwd;
    80205388:	ffffc097          	auipc	ra,0xffffc
    8020538c:	72e080e7          	jalr	1838(ra) # 80201ab6 <myproc>
    80205390:	15853483          	ld	s1,344(a0)
  if (de->parent == NULL) {
    80205394:	1204b783          	ld	a5,288(s1)
    80205398:	c7bd                	beqz	a5,80205406 <sys_getcwd+0xa4>
    *s = '\0';
    8020539a:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    8020539e:	fb340993          	addi	s3,s0,-77
      if (s <= path)          // can't reach root "/"
    802053a2:	eb040a13          	addi	s4,s0,-336
      *--s = '/';
    802053a6:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    802053aa:	8526                	mv	a0,s1
    802053ac:	ffffb097          	auipc	ra,0xffffb
    802053b0:	53a080e7          	jalr	1338(ra) # 802008e6 <strlen>
    802053b4:	862a                	mv	a2,a0
      s -= len;
    802053b6:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    802053ba:	052a7b63          	bgeu	s4,s2,80205410 <sys_getcwd+0xae>
      strncpy(s, de->filename, len);
    802053be:	85a6                	mv	a1,s1
    802053c0:	854a                	mv	a0,s2
    802053c2:	ffffb097          	auipc	ra,0xffffb
    802053c6:	4b4080e7          	jalr	1204(ra) # 80200876 <strncpy>
      *--s = '/';
    802053ca:	fff90993          	addi	s3,s2,-1
    802053ce:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    802053d2:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    802053d6:	1204b783          	ld	a5,288(s1)
    802053da:	fbe1                	bnez	a5,802053aa <sys_getcwd+0x48>
  if(addr==0){
    802053dc:	fb843483          	ld	s1,-72(s0)
    802053e0:	c88d                	beqz	s1,80205412 <sys_getcwd+0xb0>
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    802053e2:	854e                	mv	a0,s3
    802053e4:	ffffb097          	auipc	ra,0xffffb
    802053e8:	502080e7          	jalr	1282(ra) # 802008e6 <strlen>
    802053ec:	0015061b          	addiw	a2,a0,1
    802053f0:	85ce                	mv	a1,s3
    802053f2:	8526                	mv	a0,s1
    802053f4:	ffffc097          	auipc	ra,0xffffc
    802053f8:	f7e080e7          	jalr	-130(ra) # 80201372 <copyout2>
    802053fc:	02054563          	bltz	a0,80205426 <sys_getcwd+0xc4>
  return addr;
    80205400:	fb843483          	ld	s1,-72(s0)
    80205404:	a039                	j	80205412 <sys_getcwd+0xb0>
    s = "/";
    80205406:	00005997          	auipc	s3,0x5
    8020540a:	22a98993          	addi	s3,s3,554 # 8020a630 <digits+0x2b0>
    8020540e:	b7f9                	j	802053dc <sys_getcwd+0x7a>
        return -1;
    80205410:	54fd                	li	s1,-1
}
    80205412:	8526                	mv	a0,s1
    80205414:	60b6                	ld	ra,328(sp)
    80205416:	6416                	ld	s0,320(sp)
    80205418:	74f2                	ld	s1,312(sp)
    8020541a:	7952                	ld	s2,304(sp)
    8020541c:	79b2                	ld	s3,296(sp)
    8020541e:	7a12                	ld	s4,288(sp)
    80205420:	6af2                	ld	s5,280(sp)
    80205422:	6171                	addi	sp,sp,336
    80205424:	8082                	ret
    return -1;
    80205426:	54fd                	li	s1,-1
    80205428:	b7ed                	j	80205412 <sys_getcwd+0xb0>

000000008020542a <sys_remove>:

uint64
sys_remove(void)
{
    8020542a:	7169                	addi	sp,sp,-304
    8020542c:	f606                	sd	ra,296(sp)
    8020542e:	f222                	sd	s0,288(sp)
    80205430:	ee26                	sd	s1,280(sp)
    80205432:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    80205434:	10400613          	li	a2,260
    80205438:	ed840593          	addi	a1,s0,-296
    8020543c:	4501                	li	a0,0
    8020543e:	ffffe097          	auipc	ra,0xffffe
    80205442:	d3e080e7          	jalr	-706(ra) # 8020317c <argstr>
    80205446:	0ca05c63          	blez	a0,8020551e <sys_remove+0xf4>
    return -1;

  char *s = path + len - 1;
    8020544a:	157d                	addi	a0,a0,-1
    8020544c:	ed840713          	addi	a4,s0,-296
    80205450:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    80205454:	02f00693          	li	a3,47
    80205458:	863a                	mv	a2,a4
    8020545a:	00e7e963          	bltu	a5,a4,8020546c <sys_remove+0x42>
    8020545e:	0007c703          	lbu	a4,0(a5)
    80205462:	06d71c63          	bne	a4,a3,802054da <sys_remove+0xb0>
    s--;
    80205466:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    80205468:	fec7fbe3          	bgeu	a5,a2,8020545e <sys_remove+0x34>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    8020546c:	ed840513          	addi	a0,s0,-296
    80205470:	00002097          	auipc	ra,0x2
    80205474:	6a0080e7          	jalr	1696(ra) # 80207b10 <ename>
    80205478:	84aa                	mv	s1,a0
    8020547a:	c555                	beqz	a0,80205526 <sys_remove+0xfc>
    return -1;
  }
  elock(ep);
    8020547c:	00002097          	auipc	ra,0x2
    80205480:	e40080e7          	jalr	-448(ra) # 802072bc <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80205484:	1004c783          	lbu	a5,256(s1)
    80205488:	8bc1                	andi	a5,a5,16
    8020548a:	c799                	beqz	a5,80205498 <sys_remove+0x6e>
    8020548c:	8526                	mv	a0,s1
    8020548e:	00000097          	auipc	ra,0x0
    80205492:	876080e7          	jalr	-1930(ra) # 80204d04 <isdirempty>
    80205496:	c925                	beqz	a0,80205506 <sys_remove+0xdc>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    80205498:	1204b503          	ld	a0,288(s1)
    8020549c:	00002097          	auipc	ra,0x2
    802054a0:	e20080e7          	jalr	-480(ra) # 802072bc <elock>
  eremove(ep);
    802054a4:	8526                	mv	a0,s1
    802054a6:	00002097          	auipc	ra,0x2
    802054aa:	ce2080e7          	jalr	-798(ra) # 80207188 <eremove>
  eunlock(ep->parent);
    802054ae:	1204b503          	ld	a0,288(s1)
    802054b2:	00002097          	auipc	ra,0x2
    802054b6:	e40080e7          	jalr	-448(ra) # 802072f2 <eunlock>
  eunlock(ep);
    802054ba:	8526                	mv	a0,s1
    802054bc:	00002097          	auipc	ra,0x2
    802054c0:	e36080e7          	jalr	-458(ra) # 802072f2 <eunlock>
  eput(ep);
    802054c4:	8526                	mv	a0,s1
    802054c6:	00002097          	auipc	ra,0x2
    802054ca:	e7a080e7          	jalr	-390(ra) # 80207340 <eput>

  return 0;
    802054ce:	4501                	li	a0,0
}
    802054d0:	70b2                	ld	ra,296(sp)
    802054d2:	7412                	ld	s0,288(sp)
    802054d4:	64f2                	ld	s1,280(sp)
    802054d6:	6155                	addi	sp,sp,304
    802054d8:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    802054da:	ed840713          	addi	a4,s0,-296
    802054de:	f8e7e7e3          	bltu	a5,a4,8020546c <sys_remove+0x42>
    802054e2:	0007c683          	lbu	a3,0(a5)
    802054e6:	02e00713          	li	a4,46
    802054ea:	f8e691e3          	bne	a3,a4,8020546c <sys_remove+0x42>
    802054ee:	ed840713          	addi	a4,s0,-296
    802054f2:	02e78863          	beq	a5,a4,80205522 <sys_remove+0xf8>
    802054f6:	fff7c703          	lbu	a4,-1(a5)
    802054fa:	02f00793          	li	a5,47
    802054fe:	f6f717e3          	bne	a4,a5,8020546c <sys_remove+0x42>
    return -1;
    80205502:	557d                	li	a0,-1
    80205504:	b7f1                	j	802054d0 <sys_remove+0xa6>
      eunlock(ep);
    80205506:	8526                	mv	a0,s1
    80205508:	00002097          	auipc	ra,0x2
    8020550c:	dea080e7          	jalr	-534(ra) # 802072f2 <eunlock>
      eput(ep);
    80205510:	8526                	mv	a0,s1
    80205512:	00002097          	auipc	ra,0x2
    80205516:	e2e080e7          	jalr	-466(ra) # 80207340 <eput>
      return -1;
    8020551a:	557d                	li	a0,-1
    8020551c:	bf55                	j	802054d0 <sys_remove+0xa6>
    return -1;
    8020551e:	557d                	li	a0,-1
    80205520:	bf45                	j	802054d0 <sys_remove+0xa6>
    return -1;
    80205522:	557d                	li	a0,-1
    80205524:	b775                	j	802054d0 <sys_remove+0xa6>
    return -1;
    80205526:	557d                	li	a0,-1
    80205528:	b765                	j	802054d0 <sys_remove+0xa6>

000000008020552a <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    8020552a:	db010113          	addi	sp,sp,-592
    8020552e:	24113423          	sd	ra,584(sp)
    80205532:	24813023          	sd	s0,576(sp)
    80205536:	22913c23          	sd	s1,568(sp)
    8020553a:	23213823          	sd	s2,560(sp)
    8020553e:	23313423          	sd	s3,552(sp)
    80205542:	23413023          	sd	s4,544(sp)
    80205546:	0c80                	addi	s0,sp,592
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205548:	10400613          	li	a2,260
    8020554c:	ec840593          	addi	a1,s0,-312
    80205550:	4501                	li	a0,0
    80205552:	ffffe097          	auipc	ra,0xffffe
    80205556:	c2a080e7          	jalr	-982(ra) # 8020317c <argstr>
      return -1;
    8020555a:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    8020555c:	0c054d63          	bltz	a0,80205636 <sys_rename+0x10c>
    80205560:	10400613          	li	a2,260
    80205564:	dc040593          	addi	a1,s0,-576
    80205568:	4505                	li	a0,1
    8020556a:	ffffe097          	auipc	ra,0xffffe
    8020556e:	c12080e7          	jalr	-1006(ra) # 8020317c <argstr>
      return -1;
    80205572:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205574:	0c054163          	bltz	a0,80205636 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    80205578:	ec840513          	addi	a0,s0,-312
    8020557c:	00002097          	auipc	ra,0x2
    80205580:	594080e7          	jalr	1428(ra) # 80207b10 <ename>
    80205584:	84aa                	mv	s1,a0
    80205586:	1a050f63          	beqz	a0,80205744 <sys_rename+0x21a>
    8020558a:	ec840593          	addi	a1,s0,-312
    8020558e:	dc040513          	addi	a0,s0,-576
    80205592:	00002097          	auipc	ra,0x2
    80205596:	5ba080e7          	jalr	1466(ra) # 80207b4c <enameparent>
    8020559a:	892a                	mv	s2,a0
    8020559c:	cd35                	beqz	a0,80205618 <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    8020559e:	ec840513          	addi	a0,s0,-312
    802055a2:	00001097          	auipc	ra,0x1
    802055a6:	63a080e7          	jalr	1594(ra) # 80206bdc <formatname>
    802055aa:	89aa                	mv	s3,a0
    802055ac:	c535                	beqz	a0,80205618 <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    802055ae:	07248563          	beq	s1,s2,80205618 <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    802055b2:	87ca                	mv	a5,s2
    802055b4:	1207b783          	ld	a5,288(a5)
    802055b8:	c781                	beqz	a5,802055c0 <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    802055ba:	fef49de3          	bne	s1,a5,802055b4 <sys_rename+0x8a>
    802055be:	a8a9                	j	80205618 <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    802055c0:	8526                	mv	a0,s1
    802055c2:	00002097          	auipc	ra,0x2
    802055c6:	cfa080e7          	jalr	-774(ra) # 802072bc <elock>
  srclock = 1;
  elock(pdst);
    802055ca:	854a                	mv	a0,s2
    802055cc:	00002097          	auipc	ra,0x2
    802055d0:	cf0080e7          	jalr	-784(ra) # 802072bc <elock>
  dst = dirlookup(pdst, name, &off);
    802055d4:	dbc40613          	addi	a2,s0,-580
    802055d8:	85ce                	mv	a1,s3
    802055da:	854a                	mv	a0,s2
    802055dc:	00002097          	auipc	ra,0x2
    802055e0:	06e080e7          	jalr	110(ra) # 8020764a <dirlookup>
    802055e4:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    802055e6:	c155                	beqz	a0,8020568a <sys_rename+0x160>
    eunlock(pdst);
    802055e8:	854a                	mv	a0,s2
    802055ea:	00002097          	auipc	ra,0x2
    802055ee:	d08080e7          	jalr	-760(ra) # 802072f2 <eunlock>
    if (src == dst) {
    802055f2:	01448963          	beq	s1,s4,80205604 <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    802055f6:	1004c783          	lbu	a5,256(s1)
    802055fa:	100a4703          	lbu	a4,256(s4)
    802055fe:	8ff9                	and	a5,a5,a4
    80205600:	8bc1                	andi	a5,a5,16
    80205602:	ebb1                	bnez	a5,80205656 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    80205604:	8526                	mv	a0,s1
    80205606:	00002097          	auipc	ra,0x2
    8020560a:	cec080e7          	jalr	-788(ra) # 802072f2 <eunlock>
  if (dst)
    eput(dst);
    8020560e:	8552                	mv	a0,s4
    80205610:	00002097          	auipc	ra,0x2
    80205614:	d30080e7          	jalr	-720(ra) # 80207340 <eput>
  if (pdst)
    80205618:	00090763          	beqz	s2,80205626 <sys_rename+0xfc>
    eput(pdst);
    8020561c:	854a                	mv	a0,s2
    8020561e:	00002097          	auipc	ra,0x2
    80205622:	d22080e7          	jalr	-734(ra) # 80207340 <eput>
  if (src)
    eput(src);
  return -1;
    80205626:	57fd                	li	a5,-1
  if (src)
    80205628:	c499                	beqz	s1,80205636 <sys_rename+0x10c>
    eput(src);
    8020562a:	8526                	mv	a0,s1
    8020562c:	00002097          	auipc	ra,0x2
    80205630:	d14080e7          	jalr	-748(ra) # 80207340 <eput>
  return -1;
    80205634:	57fd                	li	a5,-1
}
    80205636:	853e                	mv	a0,a5
    80205638:	24813083          	ld	ra,584(sp)
    8020563c:	24013403          	ld	s0,576(sp)
    80205640:	23813483          	ld	s1,568(sp)
    80205644:	23013903          	ld	s2,560(sp)
    80205648:	22813983          	ld	s3,552(sp)
    8020564c:	22013a03          	ld	s4,544(sp)
    80205650:	25010113          	addi	sp,sp,592
    80205654:	8082                	ret
      elock(dst);
    80205656:	8552                	mv	a0,s4
    80205658:	00002097          	auipc	ra,0x2
    8020565c:	c64080e7          	jalr	-924(ra) # 802072bc <elock>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    80205660:	8552                	mv	a0,s4
    80205662:	fffff097          	auipc	ra,0xfffff
    80205666:	6a2080e7          	jalr	1698(ra) # 80204d04 <isdirempty>
    8020566a:	c579                	beqz	a0,80205738 <sys_rename+0x20e>
      elock(pdst);
    8020566c:	854a                	mv	a0,s2
    8020566e:	00002097          	auipc	ra,0x2
    80205672:	c4e080e7          	jalr	-946(ra) # 802072bc <elock>
    eremove(dst);
    80205676:	8552                	mv	a0,s4
    80205678:	00002097          	auipc	ra,0x2
    8020567c:	b10080e7          	jalr	-1264(ra) # 80207188 <eremove>
    eunlock(dst);
    80205680:	8552                	mv	a0,s4
    80205682:	00002097          	auipc	ra,0x2
    80205686:	c70080e7          	jalr	-912(ra) # 802072f2 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    8020568a:	0ff00613          	li	a2,255
    8020568e:	85ce                	mv	a1,s3
    80205690:	8526                	mv	a0,s1
    80205692:	ffffb097          	auipc	ra,0xffffb
    80205696:	12c080e7          	jalr	300(ra) # 802007be <memmove>
  emake(pdst, src, off);
    8020569a:	dbc42603          	lw	a2,-580(s0)
    8020569e:	85a6                	mv	a1,s1
    802056a0:	854a                	mv	a0,s2
    802056a2:	00001097          	auipc	ra,0x1
    802056a6:	5f2080e7          	jalr	1522(ra) # 80206c94 <emake>
  if (src->parent != pdst) {
    802056aa:	1204b783          	ld	a5,288(s1)
    802056ae:	01278d63          	beq	a5,s2,802056c8 <sys_rename+0x19e>
    eunlock(pdst);
    802056b2:	854a                	mv	a0,s2
    802056b4:	00002097          	auipc	ra,0x2
    802056b8:	c3e080e7          	jalr	-962(ra) # 802072f2 <eunlock>
    elock(src->parent);
    802056bc:	1204b503          	ld	a0,288(s1)
    802056c0:	00002097          	auipc	ra,0x2
    802056c4:	bfc080e7          	jalr	-1028(ra) # 802072bc <elock>
  eremove(src);
    802056c8:	8526                	mv	a0,s1
    802056ca:	00002097          	auipc	ra,0x2
    802056ce:	abe080e7          	jalr	-1346(ra) # 80207188 <eremove>
  eunlock(src->parent);
    802056d2:	1204b503          	ld	a0,288(s1)
    802056d6:	00002097          	auipc	ra,0x2
    802056da:	c1c080e7          	jalr	-996(ra) # 802072f2 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    802056de:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    802056e2:	854a                	mv	a0,s2
    802056e4:	00002097          	auipc	ra,0x2
    802056e8:	97a080e7          	jalr	-1670(ra) # 8020705e <edup>
    802056ec:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    802056f0:	dbc42783          	lw	a5,-580(s0)
    802056f4:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    802056f8:	4785                	li	a5,1
    802056fa:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    802056fe:	8526                	mv	a0,s1
    80205700:	00002097          	auipc	ra,0x2
    80205704:	bf2080e7          	jalr	-1038(ra) # 802072f2 <eunlock>
  eput(psrc);
    80205708:	854e                	mv	a0,s3
    8020570a:	00002097          	auipc	ra,0x2
    8020570e:	c36080e7          	jalr	-970(ra) # 80207340 <eput>
  if (dst) {
    80205712:	000a0763          	beqz	s4,80205720 <sys_rename+0x1f6>
    eput(dst);
    80205716:	8552                	mv	a0,s4
    80205718:	00002097          	auipc	ra,0x2
    8020571c:	c28080e7          	jalr	-984(ra) # 80207340 <eput>
  eput(pdst);
    80205720:	854a                	mv	a0,s2
    80205722:	00002097          	auipc	ra,0x2
    80205726:	c1e080e7          	jalr	-994(ra) # 80207340 <eput>
  eput(src);
    8020572a:	8526                	mv	a0,s1
    8020572c:	00002097          	auipc	ra,0x2
    80205730:	c14080e7          	jalr	-1004(ra) # 80207340 <eput>
  return 0;
    80205734:	4781                	li	a5,0
    80205736:	b701                	j	80205636 <sys_rename+0x10c>
        eunlock(dst);
    80205738:	8552                	mv	a0,s4
    8020573a:	00002097          	auipc	ra,0x2
    8020573e:	bb8080e7          	jalr	-1096(ra) # 802072f2 <eunlock>
        goto fail;
    80205742:	b5c9                	j	80205604 <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    80205744:	892a                	mv	s2,a0
  if (dst)
    80205746:	bdc9                	j	80205618 <sys_rename+0xee>

0000000080205748 <sys_mkdirat>:
////////////////////////////////////////////////////////////////////////////


uint64
sys_mkdirat(void)
{
    80205748:	7169                	addi	sp,sp,-304
    8020574a:	f606                	sd	ra,296(sp)
    8020574c:	f222                	sd	s0,288(sp)
    8020574e:	ee26                	sd	s1,280(sp)
    80205750:	ea4a                	sd	s2,272(sp)
    80205752:	1a00                	addi	s0,sp,304

  char path[MAXPATH];
  int dirfd, mode;
  struct dirent *ep;

  if (argint(0, &dirfd) < 0 || argstr(1, path, MAXPATH) < 0 || argint(2, &mode) < 0) {
    80205754:	ed440593          	addi	a1,s0,-300
    80205758:	4501                	li	a0,0
    8020575a:	ffffe097          	auipc	ra,0xffffe
    8020575e:	99e080e7          	jalr	-1634(ra) # 802030f8 <argint>
    return -1;
    80205762:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, MAXPATH) < 0 || argint(2, &mode) < 0) {
    80205764:	06054b63          	bltz	a0,802057da <sys_mkdirat+0x92>
    80205768:	10400613          	li	a2,260
    8020576c:	ed840593          	addi	a1,s0,-296
    80205770:	4505                	li	a0,1
    80205772:	ffffe097          	auipc	ra,0xffffe
    80205776:	a0a080e7          	jalr	-1526(ra) # 8020317c <argstr>
    return -1;
    8020577a:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, MAXPATH) < 0 || argint(2, &mode) < 0) {
    8020577c:	04054f63          	bltz	a0,802057da <sys_mkdirat+0x92>
    80205780:	ed040593          	addi	a1,s0,-304
    80205784:	4509                	li	a0,2
    80205786:	ffffe097          	auipc	ra,0xffffe
    8020578a:	972080e7          	jalr	-1678(ra) # 802030f8 <argint>
    return -1;
    8020578e:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, MAXPATH) < 0 || argint(2, &mode) < 0) {
    80205790:	04054563          	bltz	a0,802057da <sys_mkdirat+0x92>
  }
  
  ep = create(path, T_DIR, mode);
    80205794:	ed042603          	lw	a2,-304(s0)
    80205798:	4585                	li	a1,1
    8020579a:	ed840913          	addi	s2,s0,-296
    8020579e:	854a                	mv	a0,s2
    802057a0:	fffff097          	auipc	ra,0xfffff
    802057a4:	492080e7          	jalr	1170(ra) # 80204c32 <create>
    802057a8:	84aa                	mv	s1,a0
  printf("Running: MKDIRAT ... dirfd: %d ... mode: 0x%x... path: %s\n", dirfd, mode, path);
    802057aa:	86ca                	mv	a3,s2
    802057ac:	ed042603          	lw	a2,-304(s0)
    802057b0:	ed442583          	lw	a1,-300(s0)
    802057b4:	00005517          	auipc	a0,0x5
    802057b8:	55c50513          	addi	a0,a0,1372 # 8020ad10 <digits+0x990>
    802057bc:	ffffb097          	auipc	ra,0xffffb
    802057c0:	9d2080e7          	jalr	-1582(ra) # 8020018e <printf>

  eunlock(ep);
    802057c4:	8526                	mv	a0,s1
    802057c6:	00002097          	auipc	ra,0x2
    802057ca:	b2c080e7          	jalr	-1236(ra) # 802072f2 <eunlock>
  eput(ep);
    802057ce:	8526                	mv	a0,s1
    802057d0:	00002097          	auipc	ra,0x2
    802057d4:	b70080e7          	jalr	-1168(ra) # 80207340 <eput>
  return 0;
    802057d8:	4781                	li	a5,0
}
    802057da:	853e                	mv	a0,a5
    802057dc:	70b2                	ld	ra,296(sp)
    802057de:	7412                	ld	s0,288(sp)
    802057e0:	64f2                	ld	s1,280(sp)
    802057e2:	6952                	ld	s2,272(sp)
    802057e4:	6155                	addi	sp,sp,304
    802057e6:	8082                	ret

00000000802057e8 <sys_openat>:


uint64
sys_openat(void)
{
    802057e8:	714d                	addi	sp,sp,-336
    802057ea:	e686                	sd	ra,328(sp)
    802057ec:	e2a2                	sd	s0,320(sp)
    802057ee:	fe26                	sd	s1,312(sp)
    802057f0:	fa4a                	sd	s2,304(sp)
    802057f2:	f64e                	sd	s3,296(sp)
    802057f4:	0a80                	addi	s0,sp,336
  struct file *f;
  struct file *curr_f;
  struct dirent *ep;
  struct dirent *dest_ep;

  if(argint(0, &curr_fd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &omode) < 0 ||argint(3, &mode)<0){
    802057f6:	ec440593          	addi	a1,s0,-316
    802057fa:	4501                	li	a0,0
    802057fc:	ffffe097          	auipc	ra,0xffffe
    80205800:	8fc080e7          	jalr	-1796(ra) # 802030f8 <argint>
    80205804:	0a054a63          	bltz	a0,802058b8 <sys_openat+0xd0>
    80205808:	10400613          	li	a2,260
    8020580c:	ec840593          	addi	a1,s0,-312
    80205810:	4505                	li	a0,1
    80205812:	ffffe097          	auipc	ra,0xffffe
    80205816:	96a080e7          	jalr	-1686(ra) # 8020317c <argstr>
    8020581a:	08054f63          	bltz	a0,802058b8 <sys_openat+0xd0>
    8020581e:	ec040593          	addi	a1,s0,-320
    80205822:	4509                	li	a0,2
    80205824:	ffffe097          	auipc	ra,0xffffe
    80205828:	8d4080e7          	jalr	-1836(ra) # 802030f8 <argint>
    8020582c:	08054663          	bltz	a0,802058b8 <sys_openat+0xd0>
    80205830:	ebc40593          	addi	a1,s0,-324
    80205834:	450d                	li	a0,3
    80205836:	ffffe097          	auipc	ra,0xffffe
    8020583a:	8c2080e7          	jalr	-1854(ra) # 802030f8 <argint>
    8020583e:	06054d63          	bltz	a0,802058b8 <sys_openat+0xd0>
    printf("ERROR!!: OPENAT ... filefd: %d ... mode: 0x%x ... omode: 0x%x... path: %s", curr_fd, mode, omode, path);
    return -1;
  }
  printf("Running: OPENAT ... filefd: %d ... mode: 0x%x ... omode: 0x%x... path: %s", curr_fd, mode, omode, path);
    80205842:	ec840713          	addi	a4,s0,-312
    80205846:	ec042683          	lw	a3,-320(s0)
    8020584a:	ebc42603          	lw	a2,-324(s0)
    8020584e:	ec442583          	lw	a1,-316(s0)
    80205852:	00005517          	auipc	a0,0x5
    80205856:	54e50513          	addi	a0,a0,1358 # 8020ada0 <digits+0xa20>
    8020585a:	ffffb097          	auipc	ra,0xffffb
    8020585e:	934080e7          	jalr	-1740(ra) # 8020018e <printf>
  relative = 1;
  if(path[0] != '/' && curr_fd != AT_FDCWD){/*绝对路径，忽略fd*/
    80205862:	ec844703          	lbu	a4,-312(s0)
    80205866:	02f00793          	li	a5,47
    8020586a:	00f70863          	beq	a4,a5,8020587a <sys_openat+0x92>
    8020586e:	ec442703          	lw	a4,-316(s0)
    80205872:	f9c00793          	li	a5,-100
    80205876:	06f71963          	bne	a4,a5,802058e8 <sys_openat+0x100>
    curr_f = myproc()->ofile[curr_fd];
    if(curr_f == 0) return -1;
    dest_ep = curr_f->ep;
  }
  else{
    printf("...isrelative\n");
    8020587a:	00005517          	auipc	a0,0x5
    8020587e:	58650513          	addi	a0,a0,1414 # 8020ae00 <digits+0xa80>
    80205882:	ffffb097          	auipc	ra,0xffffb
    80205886:	90c080e7          	jalr	-1780(ra) # 8020018e <printf>
    relative = 1;
    dest_ep = 0;
  }
  /*open*/
  if(omode & O_CREATE){
    8020588a:	ec042603          	lw	a2,-320(s0)
    8020588e:	04067793          	andi	a5,a2,64
    80205892:	e3f5                	bnez	a5,80205976 <sys_openat+0x18e>
        printf("ERROR_ename_env!!!!\n");
        return -1;
      }
    }
    else{
      if((ep = ename(path)) == NULL){
    80205894:	ec840513          	addi	a0,s0,-312
    80205898:	00002097          	auipc	ra,0x2
    8020589c:	278080e7          	jalr	632(ra) # 80207b10 <ename>
    802058a0:	892a                	mv	s2,a0
    802058a2:	e549                	bnez	a0,8020592c <sys_openat+0x144>
          printf("ERROR_ename!!!!\n");
    802058a4:	00005517          	auipc	a0,0x5
    802058a8:	58450513          	addi	a0,a0,1412 # 8020ae28 <digits+0xaa8>
    802058ac:	ffffb097          	auipc	ra,0xffffb
    802058b0:	8e2080e7          	jalr	-1822(ra) # 8020018e <printf>
          return -1;
    802058b4:	557d                	li	a0,-1
    802058b6:	a015                	j	802058da <sys_openat+0xf2>
    printf("ERROR!!: OPENAT ... filefd: %d ... mode: 0x%x ... omode: 0x%x... path: %s", curr_fd, mode, omode, path);
    802058b8:	ec840713          	addi	a4,s0,-312
    802058bc:	ec042683          	lw	a3,-320(s0)
    802058c0:	ebc42603          	lw	a2,-324(s0)
    802058c4:	ec442583          	lw	a1,-316(s0)
    802058c8:	00005517          	auipc	a0,0x5
    802058cc:	48850513          	addi	a0,a0,1160 # 8020ad50 <digits+0x9d0>
    802058d0:	ffffb097          	auipc	ra,0xffffb
    802058d4:	8be080e7          	jalr	-1858(ra) # 8020018e <printf>
    return -1;
    802058d8:	557d                	li	a0,-1
  f->ep = ep;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  eunlock(ep);
  return fd;
}
    802058da:	60b6                	ld	ra,328(sp)
    802058dc:	6416                	ld	s0,320(sp)
    802058de:	74f2                	ld	s1,312(sp)
    802058e0:	7952                	ld	s2,304(sp)
    802058e2:	79b2                	ld	s3,296(sp)
    802058e4:	6171                	addi	sp,sp,336
    802058e6:	8082                	ret
    printf("...isabsolute\n");
    802058e8:	00005517          	auipc	a0,0x5
    802058ec:	50850513          	addi	a0,a0,1288 # 8020adf0 <digits+0xa70>
    802058f0:	ffffb097          	auipc	ra,0xffffb
    802058f4:	89e080e7          	jalr	-1890(ra) # 8020018e <printf>
    curr_f = myproc()->ofile[curr_fd];
    802058f8:	ffffc097          	auipc	ra,0xffffc
    802058fc:	1be080e7          	jalr	446(ra) # 80201ab6 <myproc>
    80205900:	ec442783          	lw	a5,-316(s0)
    80205904:	07e9                	addi	a5,a5,26
    80205906:	078e                	slli	a5,a5,0x3
    80205908:	953e                	add	a0,a0,a5
    8020590a:	651c                	ld	a5,8(a0)
    if(curr_f == 0) return -1;
    8020590c:	10078463          	beqz	a5,80205a14 <sys_openat+0x22c>
    dest_ep = curr_f->ep;
    80205910:	6f88                	ld	a0,24(a5)
  if(omode & O_CREATE){
    80205912:	ec042603          	lw	a2,-320(s0)
    80205916:	04067793          	andi	a5,a2,64
    8020591a:	efb1                	bnez	a5,80205976 <sys_openat+0x18e>
      if((ep = ename_env(dest_ep, path))== NULL){
    8020591c:	ec840593          	addi	a1,s0,-312
    80205920:	00002097          	auipc	ra,0x2
    80205924:	20e080e7          	jalr	526(ra) # 80207b2e <ename_env>
    80205928:	892a                	mv	s2,a0
    8020592a:	c569                	beqz	a0,802059f4 <sys_openat+0x20c>
    elock(ep);
    8020592c:	854a                	mv	a0,s2
    8020592e:	00002097          	auipc	ra,0x2
    80205932:	98e080e7          	jalr	-1650(ra) # 802072bc <elock>
    if((ep->attribute & ATTR_DIRECTORY) && (omode != O_RDONLY && omode != O_DIRECTORY)){
    80205936:	10094583          	lbu	a1,256(s2)
    8020593a:	0105f793          	andi	a5,a1,16
    8020593e:	c7a9                	beqz	a5,80205988 <sys_openat+0x1a0>
    80205940:	ec042783          	lw	a5,-320(s0)
    80205944:	ffe00737          	lui	a4,0xffe00
    80205948:	177d                	addi	a4,a4,-1 # ffffffffffdfffff <ebss_clear+0xffffffff7fbd2fff>
    8020594a:	8ff9                	and	a5,a5,a4
    8020594c:	cf95                	beqz	a5,80205988 <sys_openat+0x1a0>
      printf("ERROR_attribute = 0x%x & ATTR_DIRECTORY", ep->attribute);
    8020594e:	00005517          	auipc	a0,0x5
    80205952:	4f250513          	addi	a0,a0,1266 # 8020ae40 <digits+0xac0>
    80205956:	ffffb097          	auipc	ra,0xffffb
    8020595a:	838080e7          	jalr	-1992(ra) # 8020018e <printf>
      eunlock(ep);
    8020595e:	854a                	mv	a0,s2
    80205960:	00002097          	auipc	ra,0x2
    80205964:	992080e7          	jalr	-1646(ra) # 802072f2 <eunlock>
      eput(ep);
    80205968:	854a                	mv	a0,s2
    8020596a:	00002097          	auipc	ra,0x2
    8020596e:	9d6080e7          	jalr	-1578(ra) # 80207340 <eput>
      return -1;
    80205972:	557d                	li	a0,-1
    80205974:	b79d                	j	802058da <sys_openat+0xf2>
    ep = create(path, T_FILE, omode);
    80205976:	4589                	li	a1,2
    80205978:	ec840513          	addi	a0,s0,-312
    8020597c:	fffff097          	auipc	ra,0xfffff
    80205980:	2b6080e7          	jalr	694(ra) # 80204c32 <create>
    80205984:	892a                	mv	s2,a0
    if(ep == NULL){
    80205986:	c949                	beqz	a0,80205a18 <sys_openat+0x230>
  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80205988:	ffffe097          	auipc	ra,0xffffe
    8020598c:	558080e7          	jalr	1368(ra) # 80203ee0 <filealloc>
    80205990:	89aa                	mv	s3,a0
    80205992:	c951                	beqz	a0,80205a26 <sys_openat+0x23e>
    80205994:	fffff097          	auipc	ra,0xfffff
    80205998:	25c080e7          	jalr	604(ra) # 80204bf0 <fdalloc>
    8020599c:	84aa                	mv	s1,a0
    8020599e:	06054f63          	bltz	a0,80205a1c <sys_openat+0x234>
  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    802059a2:	10094783          	lbu	a5,256(s2)
    802059a6:	8bc1                	andi	a5,a5,16
    802059a8:	e791                	bnez	a5,802059b4 <sys_openat+0x1cc>
    802059aa:	ec042783          	lw	a5,-320(s0)
    802059ae:	4007f793          	andi	a5,a5,1024
    802059b2:	ebb9                	bnez	a5,80205a08 <sys_openat+0x220>
  f->type = FD_ENTRY;
    802059b4:	4789                	li	a5,2
    802059b6:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    802059ba:	ec042783          	lw	a5,-320(s0)
    802059be:	0047f693          	andi	a3,a5,4
    802059c2:	4701                	li	a4,0
    802059c4:	c299                	beqz	a3,802059ca <sys_openat+0x1e2>
    802059c6:	10892703          	lw	a4,264(s2)
    802059ca:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    802059ce:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    802059d2:	0017c713          	xori	a4,a5,1
    802059d6:	8b05                	andi	a4,a4,1
    802059d8:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    802059dc:	8b8d                	andi	a5,a5,3
    802059de:	00f037b3          	snez	a5,a5
    802059e2:	00f984a3          	sb	a5,9(s3)
  eunlock(ep);
    802059e6:	854a                	mv	a0,s2
    802059e8:	00002097          	auipc	ra,0x2
    802059ec:	90a080e7          	jalr	-1782(ra) # 802072f2 <eunlock>
  return fd;
    802059f0:	8526                	mv	a0,s1
    802059f2:	b5e5                	j	802058da <sys_openat+0xf2>
        printf("ERROR_ename_env!!!!\n");
    802059f4:	00005517          	auipc	a0,0x5
    802059f8:	41c50513          	addi	a0,a0,1052 # 8020ae10 <digits+0xa90>
    802059fc:	ffffa097          	auipc	ra,0xffffa
    80205a00:	792080e7          	jalr	1938(ra) # 8020018e <printf>
        return -1;
    80205a04:	557d                	li	a0,-1
    80205a06:	bdd1                	j	802058da <sys_openat+0xf2>
    etrunc(ep);
    80205a08:	854a                	mv	a0,s2
    80205a0a:	00002097          	auipc	ra,0x2
    80205a0e:	848080e7          	jalr	-1976(ra) # 80207252 <etrunc>
    80205a12:	b74d                	j	802059b4 <sys_openat+0x1cc>
    if(curr_f == 0) return -1;
    80205a14:	557d                	li	a0,-1
    80205a16:	b5d1                	j	802058da <sys_openat+0xf2>
      return -1;
    80205a18:	557d                	li	a0,-1
    80205a1a:	b5c1                	j	802058da <sys_openat+0xf2>
      fileclose(f);
    80205a1c:	854e                	mv	a0,s3
    80205a1e:	ffffe097          	auipc	ra,0xffffe
    80205a22:	57e080e7          	jalr	1406(ra) # 80203f9c <fileclose>
    eunlock(ep);
    80205a26:	854a                	mv	a0,s2
    80205a28:	00002097          	auipc	ra,0x2
    80205a2c:	8ca080e7          	jalr	-1846(ra) # 802072f2 <eunlock>
    eput(ep);
    80205a30:	854a                	mv	a0,s2
    80205a32:	00002097          	auipc	ra,0x2
    80205a36:	90e080e7          	jalr	-1778(ra) # 80207340 <eput>
    return -1;
    80205a3a:	557d                	li	a0,-1
    80205a3c:	bd79                	j	802058da <sys_openat+0xf2>

0000000080205a3e <sys_dup3>:


uint64
sys_dup3(void)
{
    80205a3e:	7179                	addi	sp,sp,-48
    80205a40:	f406                	sd	ra,40(sp)
    80205a42:	f022                	sd	s0,32(sp)
    80205a44:	ec26                	sd	s1,24(sp)
    80205a46:	1800                	addi	s0,sp,48
  struct file *f;
  int newfd;
  
  if(argfd(0, 0, &f) < 0) 
    80205a48:	fd840613          	addi	a2,s0,-40
    80205a4c:	4581                	li	a1,0
    80205a4e:	4501                	li	a0,0
    80205a50:	fffff097          	auipc	ra,0xfffff
    80205a54:	138080e7          	jalr	312(ra) # 80204b88 <argfd>
    return -1;
    80205a58:	577d                	li	a4,-1
  if(argfd(0, 0, &f) < 0) 
    80205a5a:	06054963          	bltz	a0,80205acc <sys_dup3+0x8e>
  if(argint(1, &newfd) < 0 || newfd < 0)
    80205a5e:	fd440593          	addi	a1,s0,-44
    80205a62:	4505                	li	a0,1
    80205a64:	ffffd097          	auipc	ra,0xffffd
    80205a68:	694080e7          	jalr	1684(ra) # 802030f8 <argint>
    80205a6c:	fd442783          	lw	a5,-44(s0)
    80205a70:	8fc9                	or	a5,a5,a0
    80205a72:	2781                	sext.w	a5,a5
    return -1;
    80205a74:	577d                	li	a4,-1
  if(argint(1, &newfd) < 0 || newfd < 0)
    80205a76:	0407cb63          	bltz	a5,80205acc <sys_dup3+0x8e>
  if(myproc()->ofile[newfd] != f) 
    80205a7a:	ffffc097          	auipc	ra,0xffffc
    80205a7e:	03c080e7          	jalr	60(ra) # 80201ab6 <myproc>
    80205a82:	fd843483          	ld	s1,-40(s0)
    80205a86:	fd442783          	lw	a5,-44(s0)
    80205a8a:	07e9                	addi	a5,a5,26
    80205a8c:	078e                	slli	a5,a5,0x3
    80205a8e:	953e                	add	a0,a0,a5
    80205a90:	651c                	ld	a5,8(a0)
    80205a92:	02978163          	beq	a5,s1,80205ab4 <sys_dup3+0x76>
  {
    myproc()->ofile[newfd] = f;
    80205a96:	ffffc097          	auipc	ra,0xffffc
    80205a9a:	020080e7          	jalr	32(ra) # 80201ab6 <myproc>
    80205a9e:	fd442783          	lw	a5,-44(s0)
    80205aa2:	07e9                	addi	a5,a5,26
    80205aa4:	078e                	slli	a5,a5,0x3
    80205aa6:	953e                	add	a0,a0,a5
    80205aa8:	e504                	sd	s1,8(a0)
    filedup(f);
    80205aaa:	8526                	mv	a0,s1
    80205aac:	ffffe097          	auipc	ra,0xffffe
    80205ab0:	49e080e7          	jalr	1182(ra) # 80203f4a <filedup>
  }
  printf("Running: DUP3 ... newfd: %d \n", newfd);
    80205ab4:	fd442583          	lw	a1,-44(s0)
    80205ab8:	00005517          	auipc	a0,0x5
    80205abc:	3b050513          	addi	a0,a0,944 # 8020ae68 <digits+0xae8>
    80205ac0:	ffffa097          	auipc	ra,0xffffa
    80205ac4:	6ce080e7          	jalr	1742(ra) # 8020018e <printf>
  return newfd;
    80205ac8:	fd442703          	lw	a4,-44(s0)
}
    80205acc:	853a                	mv	a0,a4
    80205ace:	70a2                	ld	ra,40(sp)
    80205ad0:	7402                	ld	s0,32(sp)
    80205ad2:	64e2                	ld	s1,24(sp)
    80205ad4:	6145                	addi	sp,sp,48
    80205ad6:	8082                	ret

0000000080205ad8 <sys_getdents64>:

uint64
sys_getdents64(void){
    80205ad8:	7179                	addi	sp,sp,-48
    80205ada:	f406                	sd	ra,40(sp)
    80205adc:	f022                	sd	s0,32(sp)
    80205ade:	1800                	addi	s0,sp,48
  struct file *f;
  uint64 buf;
  int len, fd;
  if (argfd(0, &fd, &f) < 0 || argaddr(1, &buf) < 0 || argint(2, &len) < 0)
    80205ae0:	fe840613          	addi	a2,s0,-24
    80205ae4:	fd840593          	addi	a1,s0,-40
    80205ae8:	4501                	li	a0,0
    80205aea:	fffff097          	auipc	ra,0xfffff
    80205aee:	09e080e7          	jalr	158(ra) # 80204b88 <argfd>
    return -1;
    80205af2:	57fd                	li	a5,-1
  if (argfd(0, &fd, &f) < 0 || argaddr(1, &buf) < 0 || argint(2, &len) < 0)
    80205af4:	04054f63          	bltz	a0,80205b52 <sys_getdents64+0x7a>
    80205af8:	fe040593          	addi	a1,s0,-32
    80205afc:	4505                	li	a0,1
    80205afe:	ffffd097          	auipc	ra,0xffffd
    80205b02:	65c080e7          	jalr	1628(ra) # 8020315a <argaddr>
    return -1;
    80205b06:	57fd                	li	a5,-1
  if (argfd(0, &fd, &f) < 0 || argaddr(1, &buf) < 0 || argint(2, &len) < 0)
    80205b08:	04054563          	bltz	a0,80205b52 <sys_getdents64+0x7a>
    80205b0c:	fdc40593          	addi	a1,s0,-36
    80205b10:	4509                	li	a0,2
    80205b12:	ffffd097          	auipc	ra,0xffffd
    80205b16:	5e6080e7          	jalr	1510(ra) # 802030f8 <argint>
    return -1;
    80205b1a:	57fd                	li	a5,-1
  if (argfd(0, &fd, &f) < 0 || argaddr(1, &buf) < 0 || argint(2, &len) < 0)
    80205b1c:	02054b63          	bltz	a0,80205b52 <sys_getdents64+0x7a>
  printf("Running: getdent ... filefd: %d ... buf: 0x%x ... len: %d\n", fd, buf, len);
    80205b20:	fdc42683          	lw	a3,-36(s0)
    80205b24:	fe043603          	ld	a2,-32(s0)
    80205b28:	fd842583          	lw	a1,-40(s0)
    80205b2c:	00005517          	auipc	a0,0x5
    80205b30:	35c50513          	addi	a0,a0,860 # 8020ae88 <digits+0xb08>
    80205b34:	ffffa097          	auipc	ra,0xffffa
    80205b38:	65a080e7          	jalr	1626(ra) # 8020018e <printf>
  return dirnext_(f,buf,len);
    80205b3c:	fdc42603          	lw	a2,-36(s0)
    80205b40:	fe043583          	ld	a1,-32(s0)
    80205b44:	fe843503          	ld	a0,-24(s0)
    80205b48:	ffffe097          	auipc	ra,0xffffe
    80205b4c:	7c6080e7          	jalr	1990(ra) # 8020430e <dirnext_>
    80205b50:	87aa                	mv	a5,a0
}
    80205b52:	853e                	mv	a0,a5
    80205b54:	70a2                	ld	ra,40(sp)
    80205b56:	7402                	ld	s0,32(sp)
    80205b58:	6145                	addi	sp,sp,48
    80205b5a:	8082                	ret

0000000080205b5c <sys_mmap>:

uint64
sys_mmap(void){
    80205b5c:	1141                	addi	sp,sp,-16
    80205b5e:	e422                	sd	s0,8(sp)
    80205b60:	0800                	addi	s0,sp,16
    a += PGSIZE;
    pa += PGSIZE;
    mapped_len += PGSIZE;
  }
  return start;
}
    80205b62:	4501                	li	a0,0
    80205b64:	6422                	ld	s0,8(sp)
    80205b66:	0141                	addi	sp,sp,16
    80205b68:	8082                	ret

0000000080205b6a <sys_munmap>:


uint64
sys_munmap(void)
{
    80205b6a:	1141                	addi	sp,sp,-16
    80205b6c:	e422                	sd	s0,8(sp)
    80205b6e:	0800                	addi	s0,sp,16
  if (argaddr(0, &start) < 0 || argaddr(1, &len) < 0)
    return -1;
  struct proc *p = myproc();
  vmunmap(p->pagetable, start, len, 0);
  return 0;
}
    80205b70:	4501                	li	a0,0
    80205b72:	6422                	ld	s0,8(sp)
    80205b74:	0141                	addi	sp,sp,16
    80205b76:	8082                	ret

0000000080205b78 <sys_pipe2>:


uint64
sys_pipe2(void)
{
    80205b78:	715d                	addi	sp,sp,-80
    80205b7a:	e486                	sd	ra,72(sp)
    80205b7c:	e0a2                	sd	s0,64(sp)
    80205b7e:	fc26                	sd	s1,56(sp)
    80205b80:	f84a                	sd	s2,48(sp)
    80205b82:	f44e                	sd	s3,40(sp)
    80205b84:	0880                	addi	s0,sp,80
  uint64 fdarray; // user pointer to array of two integers
  int fd0 = -1, fd1;
  struct proc *p = myproc();
    80205b86:	ffffc097          	auipc	ra,0xffffc
    80205b8a:	f30080e7          	jalr	-208(ra) # 80201ab6 <myproc>
    80205b8e:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80205b90:	fc840593          	addi	a1,s0,-56
    80205b94:	4501                	li	a0,0
    80205b96:	ffffd097          	auipc	ra,0xffffd
    80205b9a:	5c4080e7          	jalr	1476(ra) # 8020315a <argaddr>
    return -1;
    80205b9e:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80205ba0:	06054563          	bltz	a0,80205c0a <sys_pipe2+0x92>

  int *fd = (int *)fdarray;
    80205ba4:	fc843903          	ld	s2,-56(s0)
  struct file *rf = p->ofile[fd[0]], *wf = p->ofile[fd[1]];
    80205ba8:	00092783          	lw	a5,0(s2)
    80205bac:	07e9                	addi	a5,a5,26
    80205bae:	078e                	slli	a5,a5,0x3
    80205bb0:	97a6                	add	a5,a5,s1
    80205bb2:	679c                	ld	a5,8(a5)
    80205bb4:	fcf43023          	sd	a5,-64(s0)
    80205bb8:	00492783          	lw	a5,4(s2)
    80205bbc:	07e9                	addi	a5,a5,26
    80205bbe:	078e                	slli	a5,a5,0x3
    80205bc0:	97a6                	add	a5,a5,s1
    80205bc2:	679c                	ld	a5,8(a5)
    80205bc4:	faf43c23          	sd	a5,-72(s0)

  if(pipealloc(&rf, &wf) < 0)
    80205bc8:	fb840593          	addi	a1,s0,-72
    80205bcc:	fc040513          	addi	a0,s0,-64
    80205bd0:	fffff097          	auipc	ra,0xfffff
    80205bd4:	84a080e7          	jalr	-1974(ra) # 8020441a <pipealloc>
    return -1;
    80205bd8:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80205bda:	02054863          	bltz	a0,80205c0a <sys_pipe2+0x92>
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80205bde:	fc043503          	ld	a0,-64(s0)
    80205be2:	fffff097          	auipc	ra,0xfffff
    80205be6:	00e080e7          	jalr	14(ra) # 80204bf0 <fdalloc>
    80205bea:	89aa                	mv	s3,a0
    80205bec:	02054c63          	bltz	a0,80205c24 <sys_pipe2+0xac>
    80205bf0:	fb843503          	ld	a0,-72(s0)
    80205bf4:	fffff097          	auipc	ra,0xfffff
    80205bf8:	ffc080e7          	jalr	-4(ra) # 80204bf0 <fdalloc>
    80205bfc:	00054f63          	bltz	a0,80205c1a <sys_pipe2+0xa2>
    fileclose(rf);
    fileclose(wf);
    return -1;
  }

  fd[0] = fd0;
    80205c00:	01392023          	sw	s3,0(s2)
  fd[1] = fd1;
    80205c04:	00a92223          	sw	a0,4(s2)

  return 0;
    80205c08:	4781                	li	a5,0
}
    80205c0a:	853e                	mv	a0,a5
    80205c0c:	60a6                	ld	ra,72(sp)
    80205c0e:	6406                	ld	s0,64(sp)
    80205c10:	74e2                	ld	s1,56(sp)
    80205c12:	7942                	ld	s2,48(sp)
    80205c14:	79a2                	ld	s3,40(sp)
    80205c16:	6161                	addi	sp,sp,80
    80205c18:	8082                	ret
      p->ofile[fd0] = 0;
    80205c1a:	09e9                	addi	s3,s3,26
    80205c1c:	098e                	slli	s3,s3,0x3
    80205c1e:	94ce                	add	s1,s1,s3
    80205c20:	0004b423          	sd	zero,8(s1)
    fileclose(rf);
    80205c24:	fc043503          	ld	a0,-64(s0)
    80205c28:	ffffe097          	auipc	ra,0xffffe
    80205c2c:	374080e7          	jalr	884(ra) # 80203f9c <fileclose>
    fileclose(wf);
    80205c30:	fb843503          	ld	a0,-72(s0)
    80205c34:	ffffe097          	auipc	ra,0xffffe
    80205c38:	368080e7          	jalr	872(ra) # 80203f9c <fileclose>
    return -1;
    80205c3c:	57fd                	li	a5,-1
    80205c3e:	b7f1                	j	80205c0a <sys_pipe2+0x92>

0000000080205c40 <sys_mount>:



uint64
sys_mount(void)
{
    80205c40:	cc010113          	addi	sp,sp,-832
    80205c44:	32113c23          	sd	ra,824(sp)
    80205c48:	32813823          	sd	s0,816(sp)
    80205c4c:	32913423          	sd	s1,808(sp)
    80205c50:	0680                	addi	s0,sp,832
  char special[FAT32_MAX_PATH], dir[FAT32_MAX_PATH], fstype[FAT32_MAX_FILENAME];
  uint64 flags, data;

  if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0 || 
    80205c52:	10400613          	li	a2,260
    80205c56:	ed840593          	addi	a1,s0,-296
    80205c5a:	4501                	li	a0,0
    80205c5c:	ffffd097          	auipc	ra,0xffffd
    80205c60:	520080e7          	jalr	1312(ra) # 8020317c <argstr>
      argstr(2, fstype, FAT32_MAX_FILENAME) < 0 || argaddr(3, &flags) < 0 || argaddr(4, &data) < 0)
    return -1;
    80205c64:	57fd                	li	a5,-1
  if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0 || 
    80205c66:	0a054663          	bltz	a0,80205d12 <sys_mount+0xd2>
    80205c6a:	10400613          	li	a2,260
    80205c6e:	dd040593          	addi	a1,s0,-560
    80205c72:	4505                	li	a0,1
    80205c74:	ffffd097          	auipc	ra,0xffffd
    80205c78:	508080e7          	jalr	1288(ra) # 8020317c <argstr>
    return -1;
    80205c7c:	57fd                	li	a5,-1
  if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0 || 
    80205c7e:	08054a63          	bltz	a0,80205d12 <sys_mount+0xd2>
      argstr(2, fstype, FAT32_MAX_FILENAME) < 0 || argaddr(3, &flags) < 0 || argaddr(4, &data) < 0)
    80205c82:	0ff00613          	li	a2,255
    80205c86:	cd040593          	addi	a1,s0,-816
    80205c8a:	4509                	li	a0,2
    80205c8c:	ffffd097          	auipc	ra,0xffffd
    80205c90:	4f0080e7          	jalr	1264(ra) # 8020317c <argstr>
    return -1;
    80205c94:	57fd                	li	a5,-1
  if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0 || 
    80205c96:	06054e63          	bltz	a0,80205d12 <sys_mount+0xd2>
      argstr(2, fstype, FAT32_MAX_FILENAME) < 0 || argaddr(3, &flags) < 0 || argaddr(4, &data) < 0)
    80205c9a:	cc840593          	addi	a1,s0,-824
    80205c9e:	450d                	li	a0,3
    80205ca0:	ffffd097          	auipc	ra,0xffffd
    80205ca4:	4ba080e7          	jalr	1210(ra) # 8020315a <argaddr>
    return -1;
    80205ca8:	57fd                	li	a5,-1
      argstr(2, fstype, FAT32_MAX_FILENAME) < 0 || argaddr(3, &flags) < 0 || argaddr(4, &data) < 0)
    80205caa:	06054463          	bltz	a0,80205d12 <sys_mount+0xd2>
    80205cae:	cc040593          	addi	a1,s0,-832
    80205cb2:	4511                	li	a0,4
    80205cb4:	ffffd097          	auipc	ra,0xffffd
    80205cb8:	4a6080e7          	jalr	1190(ra) # 8020315a <argaddr>
    return -1;
    80205cbc:	57fd                	li	a5,-1
      argstr(2, fstype, FAT32_MAX_FILENAME) < 0 || argaddr(3, &flags) < 0 || argaddr(4, &data) < 0)
    80205cbe:	04054a63          	bltz	a0,80205d12 <sys_mount+0xd2>
  struct dirent *dev = NULL, *mnt;
  if((mnt = ename(dir)) == NULL)
    80205cc2:	dd040513          	addi	a0,s0,-560
    80205cc6:	00002097          	auipc	ra,0x2
    80205cca:	e4a080e7          	jalr	-438(ra) # 80207b10 <ename>
    80205cce:	84aa                	mv	s1,a0
    80205cd0:	c939                	beqz	a0,80205d26 <sys_mount+0xe6>
    return -1;

  if(strncmp("vfat", fstype, 5) != 0 && strncmp("fat32", fstype, 6) != 0)
    80205cd2:	4615                	li	a2,5
    80205cd4:	cd040593          	addi	a1,s0,-816
    80205cd8:	00005517          	auipc	a0,0x5
    80205cdc:	1f050513          	addi	a0,a0,496 # 8020aec8 <digits+0xb48>
    80205ce0:	ffffb097          	auipc	ra,0xffffb
    80205ce4:	b5a080e7          	jalr	-1190(ra) # 8020083a <strncmp>
    80205ce8:	cd11                	beqz	a0,80205d04 <sys_mount+0xc4>
    80205cea:	4619                	li	a2,6
    80205cec:	cd040593          	addi	a1,s0,-816
    80205cf0:	00005517          	auipc	a0,0x5
    80205cf4:	1e050513          	addi	a0,a0,480 # 8020aed0 <digits+0xb50>
    80205cf8:	ffffb097          	auipc	ra,0xffffb
    80205cfc:	b42080e7          	jalr	-1214(ra) # 8020083a <strncmp>
    return -1;
    80205d00:	57fd                	li	a5,-1
  if(strncmp("vfat", fstype, 5) != 0 && strncmp("fat32", fstype, 6) != 0)
    80205d02:	e901                	bnez	a0,80205d12 <sys_mount+0xd2>
  return mount(dev,mnt);
    80205d04:	85a6                	mv	a1,s1
    80205d06:	4501                	li	a0,0
    80205d08:	00002097          	auipc	ra,0x2
    80205d0c:	ed2080e7          	jalr	-302(ra) # 80207bda <mount>
    80205d10:	87aa                	mv	a5,a0
}
    80205d12:	853e                	mv	a0,a5
    80205d14:	33813083          	ld	ra,824(sp)
    80205d18:	33013403          	ld	s0,816(sp)
    80205d1c:	32813483          	ld	s1,808(sp)
    80205d20:	34010113          	addi	sp,sp,832
    80205d24:	8082                	ret
    return -1;
    80205d26:	57fd                	li	a5,-1
    80205d28:	b7ed                	j	80205d12 <sys_mount+0xd2>

0000000080205d2a <sys_umount2>:

uint64
sys_umount2(void)
{
    80205d2a:	712d                	addi	sp,sp,-288
    80205d2c:	ee06                	sd	ra,280(sp)
    80205d2e:	ea22                	sd	s0,272(sp)
    80205d30:	1200                	addi	s0,sp,288
  char mount_path[FAT32_MAX_PATH];
  int flags;
  struct dirent *mnt;

  if (argstr(0, mount_path, FAT32_MAX_PATH) < 0 || argint(1, &flags) < 0)
    80205d32:	10400613          	li	a2,260
    80205d36:	ee840593          	addi	a1,s0,-280
    80205d3a:	4501                	li	a0,0
    80205d3c:	ffffd097          	auipc	ra,0xffffd
    80205d40:	440080e7          	jalr	1088(ra) # 8020317c <argstr>
    return -1;
    80205d44:	57fd                	li	a5,-1
  if (argstr(0, mount_path, FAT32_MAX_PATH) < 0 || argint(1, &flags) < 0)
    80205d46:	02054863          	bltz	a0,80205d76 <sys_umount2+0x4c>
    80205d4a:	ee440593          	addi	a1,s0,-284
    80205d4e:	4505                	li	a0,1
    80205d50:	ffffd097          	auipc	ra,0xffffd
    80205d54:	3a8080e7          	jalr	936(ra) # 802030f8 <argint>
    return -1;
    80205d58:	57fd                	li	a5,-1
  if (argstr(0, mount_path, FAT32_MAX_PATH) < 0 || argint(1, &flags) < 0)
    80205d5a:	00054e63          	bltz	a0,80205d76 <sys_umount2+0x4c>

  if ((mnt = ename(mount_path)) == NULL)
    80205d5e:	ee840513          	addi	a0,s0,-280
    80205d62:	00002097          	auipc	ra,0x2
    80205d66:	dae080e7          	jalr	-594(ra) # 80207b10 <ename>
    80205d6a:	c919                	beqz	a0,80205d80 <sys_umount2+0x56>
    return -1;

  return umount2(mnt);
    80205d6c:	00002097          	auipc	ra,0x2
    80205d70:	054080e7          	jalr	84(ra) # 80207dc0 <umount2>
    80205d74:	87aa                	mv	a5,a0
}
    80205d76:	853e                	mv	a0,a5
    80205d78:	60f2                	ld	ra,280(sp)
    80205d7a:	6452                	ld	s0,272(sp)
    80205d7c:	6115                	addi	sp,sp,288
    80205d7e:	8082                	ret
    return -1;
    80205d80:	57fd                	li	a5,-1
    80205d82:	bfd5                	j	80205d76 <sys_umount2+0x4c>

0000000080205d84 <sys_uname>:

uint64
sys_uname(void)
{
    80205d84:	7179                	addi	sp,sp,-48
    80205d86:	f406                	sd	ra,40(sp)
    80205d88:	f022                	sd	s0,32(sp)
    80205d8a:	ec26                	sd	s1,24(sp)
    80205d8c:	1800                	addi	s0,sp,48
  uint64 addr;
  if(argaddr(0, &addr) < 0){
    80205d8e:	fd840593          	addi	a1,s0,-40
    80205d92:	4501                	li	a0,0
    80205d94:	ffffd097          	auipc	ra,0xffffd
    80205d98:	3c6080e7          	jalr	966(ra) # 8020315a <argaddr>
    return -1;
    80205d9c:	57fd                	li	a5,-1
  if(argaddr(0, &addr) < 0){
    80205d9e:	0a054663          	bltz	a0,80205e4a <sys_uname+0xc6>
  }

  struct utsname* uts = (struct utsname*)addr;
    80205da2:	fd843483          	ld	s1,-40(s0)

  if (copyout2((uint64)uts->sysname, (void*)SYSNAME, sizeof(SYSNAME)) < 0) 
    80205da6:	4615                	li	a2,5
    80205da8:	00005597          	auipc	a1,0x5
    80205dac:	13058593          	addi	a1,a1,304 # 8020aed8 <SYSNAME>
    80205db0:	8526                	mv	a0,s1
    80205db2:	ffffb097          	auipc	ra,0xffffb
    80205db6:	5c0080e7          	jalr	1472(ra) # 80201372 <copyout2>
    return -1;
    80205dba:	57fd                	li	a5,-1
  if (copyout2((uint64)uts->sysname, (void*)SYSNAME, sizeof(SYSNAME)) < 0) 
    80205dbc:	08054763          	bltz	a0,80205e4a <sys_uname+0xc6>
	if (copyout2((uint64)uts->nodename, (void*)NODENAME, sizeof(NODENAME)) < 0) 
    80205dc0:	4615                	li	a2,5
    80205dc2:	00005597          	auipc	a1,0x5
    80205dc6:	11e58593          	addi	a1,a1,286 # 8020aee0 <NODENAME>
    80205dca:	04148513          	addi	a0,s1,65
    80205dce:	ffffb097          	auipc	ra,0xffffb
    80205dd2:	5a4080e7          	jalr	1444(ra) # 80201372 <copyout2>
    return -1;
    80205dd6:	57fd                	li	a5,-1
	if (copyout2((uint64)uts->nodename, (void*)NODENAME, sizeof(NODENAME)) < 0) 
    80205dd8:	06054963          	bltz	a0,80205e4a <sys_uname+0xc6>
	if (copyout2((uint64)uts->release, (void*)RELEASE, sizeof(RELEASE)) < 0)
    80205ddc:	4615                	li	a2,5
    80205dde:	00005597          	auipc	a1,0x5
    80205de2:	10a58593          	addi	a1,a1,266 # 8020aee8 <RELEASE>
    80205de6:	08248513          	addi	a0,s1,130
    80205dea:	ffffb097          	auipc	ra,0xffffb
    80205dee:	588080e7          	jalr	1416(ra) # 80201372 <copyout2>
    return -1;
    80205df2:	57fd                	li	a5,-1
	if (copyout2((uint64)uts->release, (void*)RELEASE, sizeof(RELEASE)) < 0)
    80205df4:	04054b63          	bltz	a0,80205e4a <sys_uname+0xc6>
	if (copyout2((uint64)uts->version, (void*)VERSION, sizeof(VERSION)) < 0) 
    80205df8:	4615                	li	a2,5
    80205dfa:	00005597          	auipc	a1,0x5
    80205dfe:	0f658593          	addi	a1,a1,246 # 8020aef0 <VERSION>
    80205e02:	0c348513          	addi	a0,s1,195
    80205e06:	ffffb097          	auipc	ra,0xffffb
    80205e0a:	56c080e7          	jalr	1388(ra) # 80201372 <copyout2>
		return -1;
    80205e0e:	57fd                	li	a5,-1
	if (copyout2((uint64)uts->version, (void*)VERSION, sizeof(VERSION)) < 0) 
    80205e10:	02054d63          	bltz	a0,80205e4a <sys_uname+0xc6>
	if (copyout2((uint64)uts->machine, (void*)MACHINE, sizeof(MACHINE)) < 0) 
    80205e14:	4615                	li	a2,5
    80205e16:	00005597          	auipc	a1,0x5
    80205e1a:	0e258593          	addi	a1,a1,226 # 8020aef8 <MACHINE>
    80205e1e:	10448513          	addi	a0,s1,260
    80205e22:	ffffb097          	auipc	ra,0xffffb
    80205e26:	550080e7          	jalr	1360(ra) # 80201372 <copyout2>
		return -1;
    80205e2a:	57fd                	li	a5,-1
	if (copyout2((uint64)uts->machine, (void*)MACHINE, sizeof(MACHINE)) < 0) 
    80205e2c:	00054f63          	bltz	a0,80205e4a <sys_uname+0xc6>
	if (copyout2((uint64)uts->domainname, (void*)DOMAINNAME, sizeof(DOMAINNAME)) < 0) 
    80205e30:	4615                	li	a2,5
    80205e32:	00005597          	auipc	a1,0x5
    80205e36:	0ce58593          	addi	a1,a1,206 # 8020af00 <DOMAINNAME>
    80205e3a:	14548513          	addi	a0,s1,325
    80205e3e:	ffffb097          	auipc	ra,0xffffb
    80205e42:	534080e7          	jalr	1332(ra) # 80201372 <copyout2>
    80205e46:	43f55793          	srai	a5,a0,0x3f
		return -1;

  return 0;
}
    80205e4a:	853e                	mv	a0,a5
    80205e4c:	70a2                	ld	ra,40(sp)
    80205e4e:	7402                	ld	s0,32(sp)
    80205e50:	64e2                	ld	s1,24(sp)
    80205e52:	6145                	addi	sp,sp,48
    80205e54:	8082                	ret

0000000080205e56 <sys_unlinkat>:

uint64 sys_unlinkat(struct dirent *mnt)
{
    80205e56:	7169                	addi	sp,sp,-304
    80205e58:	f606                	sd	ra,296(sp)
    80205e5a:	f222                	sd	s0,288(sp)
    80205e5c:	ee26                	sd	s1,280(sp)
    80205e5e:	1a00                	addi	s0,sp,304
    char path[MAXPATH];
    int dirfd, flags;
    struct dirent *ep;  
    if (argint(0, &dirfd) < 0) 
    80205e60:	ed440593          	addi	a1,s0,-300
    80205e64:	4501                	li	a0,0
    80205e66:	ffffd097          	auipc	ra,0xffffd
    80205e6a:	292080e7          	jalr	658(ra) # 802030f8 <argint>
      return -1;
    80205e6e:	57fd                	li	a5,-1
    if (argint(0, &dirfd) < 0) 
    80205e70:	0c054263          	bltz	a0,80205f34 <sys_unlinkat+0xde>
    if (argstr(1, path, MAXPATH) < 0 || argint(2, &flags) < 0)
    80205e74:	10400613          	li	a2,260
    80205e78:	ed840593          	addi	a1,s0,-296
    80205e7c:	4505                	li	a0,1
    80205e7e:	ffffd097          	auipc	ra,0xffffd
    80205e82:	2fe080e7          	jalr	766(ra) # 8020317c <argstr>
      return -1;
    80205e86:	57fd                	li	a5,-1
    if (argstr(1, path, MAXPATH) < 0 || argint(2, &flags) < 0)
    80205e88:	0a054663          	bltz	a0,80205f34 <sys_unlinkat+0xde>
    80205e8c:	ed040593          	addi	a1,s0,-304
    80205e90:	4509                	li	a0,2
    80205e92:	ffffd097          	auipc	ra,0xffffd
    80205e96:	266080e7          	jalr	614(ra) # 802030f8 <argint>
      return -1;
    80205e9a:	57fd                	li	a5,-1
    if (argstr(1, path, MAXPATH) < 0 || argint(2, &flags) < 0)
    80205e9c:	08054c63          	bltz	a0,80205f34 <sys_unlinkat+0xde>
    if((ep = ename(path)) == NULL)
    80205ea0:	ed840513          	addi	a0,s0,-296
    80205ea4:	00002097          	auipc	ra,0x2
    80205ea8:	c6c080e7          	jalr	-916(ra) # 80207b10 <ename>
    80205eac:	84aa                	mv	s1,a0
    80205eae:	cd59                	beqz	a0,80205f4c <sys_unlinkat+0xf6>
      return -1;    
    int isdir = ((ep->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE) == T_FILE ? 0 : 1;
    if (isdir && flags != AT_REMOVEDIR) {
    80205eb0:	10054783          	lbu	a5,256(a0)
    80205eb4:	8bc1                	andi	a5,a5,16
    80205eb6:	c7a9                	beqz	a5,80205f00 <sys_unlinkat+0xaa>
    80205eb8:	ed042703          	lw	a4,-304(s0)
    80205ebc:	20000793          	li	a5,512
    80205ec0:	02f71a63          	bne	a4,a5,80205ef4 <sys_unlinkat+0x9e>
      return -1;
    } else if (!isdir && flags == AT_REMOVEDIR) {
      eput(ep);
      return -1;
    }
    elock(ep);
    80205ec4:	00001097          	auipc	ra,0x1
    80205ec8:	3f8080e7          	jalr	1016(ra) # 802072bc <elock>
    if (isdir && isdirempty(ep) != 1) {
    80205ecc:	8526                	mv	a0,s1
    80205ece:	fffff097          	auipc	ra,0xfffff
    80205ed2:	e36080e7          	jalr	-458(ra) # 80204d04 <isdirempty>
    80205ed6:	4785                	li	a5,1
    80205ed8:	02f50e63          	beq	a0,a5,80205f14 <sys_unlinkat+0xbe>
      eunlock(ep);
    80205edc:	8526                	mv	a0,s1
    80205ede:	00001097          	auipc	ra,0x1
    80205ee2:	414080e7          	jalr	1044(ra) # 802072f2 <eunlock>
      eput(ep);
    80205ee6:	8526                	mv	a0,s1
    80205ee8:	00001097          	auipc	ra,0x1
    80205eec:	458080e7          	jalr	1112(ra) # 80207340 <eput>
      return -1;
    80205ef0:	57fd                	li	a5,-1
    80205ef2:	a089                	j	80205f34 <sys_unlinkat+0xde>
      eput(ep);
    80205ef4:	00001097          	auipc	ra,0x1
    80205ef8:	44c080e7          	jalr	1100(ra) # 80207340 <eput>
      return -1;
    80205efc:	57fd                	li	a5,-1
    80205efe:	a81d                	j	80205f34 <sys_unlinkat+0xde>
    } else if (!isdir && flags == AT_REMOVEDIR) {
    80205f00:	ed042703          	lw	a4,-304(s0)
    80205f04:	20000793          	li	a5,512
    80205f08:	02f70c63          	beq	a4,a5,80205f40 <sys_unlinkat+0xea>
    elock(ep);
    80205f0c:	00001097          	auipc	ra,0x1
    80205f10:	3b0080e7          	jalr	944(ra) # 802072bc <elock>
    }
    eremove(ep); // dirty!  
    80205f14:	8526                	mv	a0,s1
    80205f16:	00001097          	auipc	ra,0x1
    80205f1a:	272080e7          	jalr	626(ra) # 80207188 <eremove>
    eunlock(ep);
    80205f1e:	8526                	mv	a0,s1
    80205f20:	00001097          	auipc	ra,0x1
    80205f24:	3d2080e7          	jalr	978(ra) # 802072f2 <eunlock>
    eput(ep);
    80205f28:	8526                	mv	a0,s1
    80205f2a:	00001097          	auipc	ra,0x1
    80205f2e:	416080e7          	jalr	1046(ra) # 80207340 <eput>
    return 0;
    80205f32:	4781                	li	a5,0
}
    80205f34:	853e                	mv	a0,a5
    80205f36:	70b2                	ld	ra,296(sp)
    80205f38:	7412                	ld	s0,288(sp)
    80205f3a:	64f2                	ld	s1,280(sp)
    80205f3c:	6155                	addi	sp,sp,304
    80205f3e:	8082                	ret
      eput(ep);
    80205f40:	00001097          	auipc	ra,0x1
    80205f44:	400080e7          	jalr	1024(ra) # 80207340 <eput>
      return -1;
    80205f48:	57fd                	li	a5,-1
    80205f4a:	b7ed                	j	80205f34 <sys_unlinkat+0xde>
      return -1;    
    80205f4c:	57fd                	li	a5,-1
    80205f4e:	b7dd                	j	80205f34 <sys_unlinkat+0xde>

0000000080205f50 <kernelvec>:
    80205f50:	7111                	addi	sp,sp,-256
    80205f52:	e006                	sd	ra,0(sp)
    80205f54:	e40a                	sd	sp,8(sp)
    80205f56:	e80e                	sd	gp,16(sp)
    80205f58:	ec12                	sd	tp,24(sp)
    80205f5a:	f016                	sd	t0,32(sp)
    80205f5c:	f41a                	sd	t1,40(sp)
    80205f5e:	f81e                	sd	t2,48(sp)
    80205f60:	fc22                	sd	s0,56(sp)
    80205f62:	e0a6                	sd	s1,64(sp)
    80205f64:	e4aa                	sd	a0,72(sp)
    80205f66:	e8ae                	sd	a1,80(sp)
    80205f68:	ecb2                	sd	a2,88(sp)
    80205f6a:	f0b6                	sd	a3,96(sp)
    80205f6c:	f4ba                	sd	a4,104(sp)
    80205f6e:	f8be                	sd	a5,112(sp)
    80205f70:	fcc2                	sd	a6,120(sp)
    80205f72:	e146                	sd	a7,128(sp)
    80205f74:	e54a                	sd	s2,136(sp)
    80205f76:	e94e                	sd	s3,144(sp)
    80205f78:	ed52                	sd	s4,152(sp)
    80205f7a:	f156                	sd	s5,160(sp)
    80205f7c:	f55a                	sd	s6,168(sp)
    80205f7e:	f95e                	sd	s7,176(sp)
    80205f80:	fd62                	sd	s8,184(sp)
    80205f82:	e1e6                	sd	s9,192(sp)
    80205f84:	e5ea                	sd	s10,200(sp)
    80205f86:	e9ee                	sd	s11,208(sp)
    80205f88:	edf2                	sd	t3,216(sp)
    80205f8a:	f1f6                	sd	t4,224(sp)
    80205f8c:	f5fa                	sd	t5,232(sp)
    80205f8e:	f9fe                	sd	t6,240(sp)
    80205f90:	cebfc0ef          	jal	ra,80202c7a <kerneltrap>
    80205f94:	6082                	ld	ra,0(sp)
    80205f96:	6122                	ld	sp,8(sp)
    80205f98:	61c2                	ld	gp,16(sp)
    80205f9a:	7282                	ld	t0,32(sp)
    80205f9c:	7322                	ld	t1,40(sp)
    80205f9e:	73c2                	ld	t2,48(sp)
    80205fa0:	7462                	ld	s0,56(sp)
    80205fa2:	6486                	ld	s1,64(sp)
    80205fa4:	6526                	ld	a0,72(sp)
    80205fa6:	65c6                	ld	a1,80(sp)
    80205fa8:	6666                	ld	a2,88(sp)
    80205faa:	7686                	ld	a3,96(sp)
    80205fac:	7726                	ld	a4,104(sp)
    80205fae:	77c6                	ld	a5,112(sp)
    80205fb0:	7866                	ld	a6,120(sp)
    80205fb2:	688a                	ld	a7,128(sp)
    80205fb4:	692a                	ld	s2,136(sp)
    80205fb6:	69ca                	ld	s3,144(sp)
    80205fb8:	6a6a                	ld	s4,152(sp)
    80205fba:	7a8a                	ld	s5,160(sp)
    80205fbc:	7b2a                	ld	s6,168(sp)
    80205fbe:	7bca                	ld	s7,176(sp)
    80205fc0:	7c6a                	ld	s8,184(sp)
    80205fc2:	6c8e                	ld	s9,192(sp)
    80205fc4:	6d2e                	ld	s10,200(sp)
    80205fc6:	6dce                	ld	s11,208(sp)
    80205fc8:	6e6e                	ld	t3,216(sp)
    80205fca:	7e8e                	ld	t4,224(sp)
    80205fcc:	7f2e                	ld	t5,232(sp)
    80205fce:	7fce                	ld	t6,240(sp)
    80205fd0:	6111                	addi	sp,sp,256
    80205fd2:	10200073          	sret
	...

0000000080205fde <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    80205fde:	1141                	addi	sp,sp,-16
    80205fe0:	e406                	sd	ra,8(sp)
    80205fe2:	e022                	sd	s0,0(sp)
    80205fe4:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80205fe6:	00005597          	auipc	a1,0x5
    80205fea:	f2258593          	addi	a1,a1,-222 # 8020af08 <DOMAINNAME+0x8>
    80205fee:	0001e517          	auipc	a0,0x1e
    80205ff2:	dea50513          	addi	a0,a0,-534 # 80223dd8 <tickslock>
    80205ff6:	ffffa097          	auipc	ra,0xffffa
    80205ffa:	68c080e7          	jalr	1676(ra) # 80200682 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    80205ffe:	60a2                	ld	ra,8(sp)
    80206000:	6402                	ld	s0,0(sp)
    80206002:	0141                	addi	sp,sp,16
    80206004:	8082                	ret

0000000080206006 <set_next_timeout>:

void
set_next_timeout() {
    80206006:	1141                	addi	sp,sp,-16
    80206008:	e422                	sd	s0,8(sp)
    8020600a:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    8020600c:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80206010:	001dc7b7          	lui	a5,0x1dc
    80206014:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    80206018:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    8020601a:	4581                	li	a1,0
    8020601c:	4601                	li	a2,0
    8020601e:	4681                	li	a3,0
    80206020:	4881                	li	a7,0
    80206022:	00000073          	ecall
}
    80206026:	6422                	ld	s0,8(sp)
    80206028:	0141                	addi	sp,sp,16
    8020602a:	8082                	ret

000000008020602c <timer_tick>:

void timer_tick() {
    8020602c:	1101                	addi	sp,sp,-32
    8020602e:	ec06                	sd	ra,24(sp)
    80206030:	e822                	sd	s0,16(sp)
    80206032:	e426                	sd	s1,8(sp)
    80206034:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80206036:	0001e497          	auipc	s1,0x1e
    8020603a:	da248493          	addi	s1,s1,-606 # 80223dd8 <tickslock>
    8020603e:	8526                	mv	a0,s1
    80206040:	ffffa097          	auipc	ra,0xffffa
    80206044:	686080e7          	jalr	1670(ra) # 802006c6 <acquire>
    ticks++;
    80206048:	4c9c                	lw	a5,24(s1)
    8020604a:	2785                	addiw	a5,a5,1
    8020604c:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    8020604e:	0001e517          	auipc	a0,0x1e
    80206052:	da250513          	addi	a0,a0,-606 # 80223df0 <ticks>
    80206056:	ffffc097          	auipc	ra,0xffffc
    8020605a:	49c080e7          	jalr	1180(ra) # 802024f2 <wakeup>
    release(&tickslock);
    8020605e:	8526                	mv	a0,s1
    80206060:	ffffa097          	auipc	ra,0xffffa
    80206064:	6ba080e7          	jalr	1722(ra) # 8020071a <release>
    set_next_timeout();
    80206068:	00000097          	auipc	ra,0x0
    8020606c:	f9e080e7          	jalr	-98(ra) # 80206006 <set_next_timeout>
}
    80206070:	60e2                	ld	ra,24(sp)
    80206072:	6442                	ld	s0,16(sp)
    80206074:	64a2                	ld	s1,8(sp)
    80206076:	6105                	addi	sp,sp,32
    80206078:	8082                	ret

000000008020607a <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    8020607a:	1141                	addi	sp,sp,-16
    8020607c:	e406                	sd	ra,8(sp)
    8020607e:	e022                	sd	s0,0(sp)
    80206080:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    80206082:	00002097          	auipc	ra,0x2
    80206086:	282080e7          	jalr	642(ra) # 80208304 <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    8020608a:	60a2                	ld	ra,8(sp)
    8020608c:	6402                	ld	s0,0(sp)
    8020608e:	0141                	addi	sp,sp,16
    80206090:	8082                	ret

0000000080206092 <disk_read>:

void disk_read(struct buf *b)
{
    80206092:	1141                	addi	sp,sp,-16
    80206094:	e406                	sd	ra,8(sp)
    80206096:	e022                	sd	s0,0(sp)
    80206098:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    8020609a:	4581                	li	a1,0
    8020609c:	00002097          	auipc	ra,0x2
    802060a0:	3ee080e7          	jalr	1006(ra) # 8020848a <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    802060a4:	60a2                	ld	ra,8(sp)
    802060a6:	6402                	ld	s0,0(sp)
    802060a8:	0141                	addi	sp,sp,16
    802060aa:	8082                	ret

00000000802060ac <disk_write>:

void disk_write(struct buf *b)
{
    802060ac:	1141                	addi	sp,sp,-16
    802060ae:	e406                	sd	ra,8(sp)
    802060b0:	e022                	sd	s0,0(sp)
    802060b2:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    802060b4:	4585                	li	a1,1
    802060b6:	00002097          	auipc	ra,0x2
    802060ba:	3d4080e7          	jalr	980(ra) # 8020848a <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    802060be:	60a2                	ld	ra,8(sp)
    802060c0:	6402                	ld	s0,0(sp)
    802060c2:	0141                	addi	sp,sp,16
    802060c4:	8082                	ret

00000000802060c6 <disk_intr>:

void disk_intr(void)
{
    802060c6:	1141                	addi	sp,sp,-16
    802060c8:	e406                	sd	ra,8(sp)
    802060ca:	e022                	sd	s0,0(sp)
    802060cc:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    802060ce:	00002097          	auipc	ra,0x2
    802060d2:	648080e7          	jalr	1608(ra) # 80208716 <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    802060d6:	60a2                	ld	ra,8(sp)
    802060d8:	6402                	ld	s0,0(sp)
    802060da:	0141                	addi	sp,sp,16
    802060dc:	8082                	ret

00000000802060de <skipelem>:
    eput(ep);
    return NULL;
}

static char *skipelem(char *path, char *name)
{
    802060de:	1101                	addi	sp,sp,-32
    802060e0:	ec06                	sd	ra,24(sp)
    802060e2:	e822                	sd	s0,16(sp)
    802060e4:	e426                	sd	s1,8(sp)
    802060e6:	1000                	addi	s0,sp,32
    802060e8:	87aa                	mv	a5,a0
    802060ea:	852e                	mv	a0,a1
    while (*path == '/') {
    802060ec:	0007c703          	lbu	a4,0(a5)
    802060f0:	02f00693          	li	a3,47
    802060f4:	00d71763          	bne	a4,a3,80206102 <skipelem+0x24>
        path++;
    802060f8:	0785                	addi	a5,a5,1
    while (*path == '/') {
    802060fa:	0007c703          	lbu	a4,0(a5)
    802060fe:	fed70de3          	beq	a4,a3,802060f8 <skipelem+0x1a>
    }
    if (*path == 0) { return NULL; }
    80206102:	4481                	li	s1,0
    80206104:	cf31                	beqz	a4,80206160 <skipelem+0x82>
    char *s = path;
    while (*path != '/' && *path != 0) {
    80206106:	0007c703          	lbu	a4,0(a5)
    8020610a:	84be                	mv	s1,a5
    8020610c:	02f00693          	li	a3,47
    80206110:	c711                	beqz	a4,8020611c <skipelem+0x3e>
        path++;
    80206112:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    80206114:	0004c703          	lbu	a4,0(s1)
    80206118:	fed71ce3          	bne	a4,a3,80206110 <skipelem+0x32>
    }
    int len = path - s;
    8020611c:	40f48733          	sub	a4,s1,a5
    80206120:	863a                	mv	a2,a4
    80206122:	2701                	sext.w	a4,a4
    80206124:	0ff00693          	li	a3,255
    80206128:	00e6d463          	bge	a3,a4,80206130 <skipelem+0x52>
    8020612c:	0ff00613          	li	a2,255
    80206130:	0006071b          	sext.w	a4,a2
    if (len > FAT32_MAX_FILENAME) {
        len = FAT32_MAX_FILENAME;
    }
    name[len] = 0;
    80206134:	972a                	add	a4,a4,a0
    80206136:	00070023          	sb	zero,0(a4)
    memmove(name, s, len);
    8020613a:	2601                	sext.w	a2,a2
    8020613c:	85be                	mv	a1,a5
    8020613e:	ffffa097          	auipc	ra,0xffffa
    80206142:	680080e7          	jalr	1664(ra) # 802007be <memmove>
    while (*path == '/') {
    80206146:	0004c703          	lbu	a4,0(s1)
    8020614a:	02f00793          	li	a5,47
    8020614e:	00f71963          	bne	a4,a5,80206160 <skipelem+0x82>
    80206152:	02f00713          	li	a4,47
        path++;
    80206156:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80206158:	0004c783          	lbu	a5,0(s1)
    8020615c:	fee78de3          	beq	a5,a4,80206156 <skipelem+0x78>
    }
    return path;
}
    80206160:	8526                	mv	a0,s1
    80206162:	60e2                	ld	ra,24(sp)
    80206164:	6442                	ld	s0,16(sp)
    80206166:	64a2                	ld	s1,8(sp)
    80206168:	6105                	addi	sp,sp,32
    8020616a:	8082                	ret

000000008020616c <read_fat>:
{
    8020616c:	1101                	addi	sp,sp,-32
    8020616e:	ec06                	sd	ra,24(sp)
    80206170:	e822                	sd	s0,16(sp)
    80206172:	e426                	sd	s1,8(sp)
    80206174:	e04a                	sd	s2,0(sp)
    80206176:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    80206178:	100007b7          	lui	a5,0x10000
    8020617c:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
        return cluster;
    8020617e:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80206180:	00a7ea63          	bltu	a5,a0,80206194 <read_fat+0x28>
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80206184:	0001e797          	auipc	a5,0x1e
    80206188:	c7c7a783          	lw	a5,-900(a5) # 80223e00 <fat+0x8>
    8020618c:	2785                	addiw	a5,a5,1
        return 0;
    8020618e:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80206190:	00a7f963          	bgeu	a5,a0,802061a2 <read_fat+0x36>
}
    80206194:	8526                	mv	a0,s1
    80206196:	60e2                	ld	ra,24(sp)
    80206198:	6442                	ld	s0,16(sp)
    8020619a:	64a2                	ld	s1,8(sp)
    8020619c:	6902                	ld	s2,0(sp)
    8020619e:	6105                	addi	sp,sp,32
    802061a0:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    802061a2:	0025149b          	slliw	s1,a0,0x2
    802061a6:	0001e917          	auipc	s2,0x1e
    802061aa:	c5290913          	addi	s2,s2,-942 # 80223df8 <fat>
    802061ae:	01095783          	lhu	a5,16(s2)
    802061b2:	02f4d7bb          	divuw	a5,s1,a5
    802061b6:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    802061ba:	9dbd                	addw	a1,a1,a5
    802061bc:	4501                	li	a0,0
    802061be:	ffffe097          	auipc	ra,0xffffe
    802061c2:	95e080e7          	jalr	-1698(ra) # 80203b1c <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    802061c6:	01095783          	lhu	a5,16(s2)
    802061ca:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    802061ce:	1482                	slli	s1,s1,0x20
    802061d0:	9081                	srli	s1,s1,0x20
    802061d2:	009507b3          	add	a5,a0,s1
    802061d6:	4fa4                	lw	s1,88(a5)
    brelse(b);
    802061d8:	ffffe097          	auipc	ra,0xffffe
    802061dc:	a70080e7          	jalr	-1424(ra) # 80203c48 <brelse>
    return next_clus;
    802061e0:	bf55                	j	80206194 <read_fat+0x28>

00000000802061e2 <alloc_clus>:
{
    802061e2:	711d                	addi	sp,sp,-96
    802061e4:	ec86                	sd	ra,88(sp)
    802061e6:	e8a2                	sd	s0,80(sp)
    802061e8:	e4a6                	sd	s1,72(sp)
    802061ea:	e0ca                	sd	s2,64(sp)
    802061ec:	fc4e                	sd	s3,56(sp)
    802061ee:	f852                	sd	s4,48(sp)
    802061f0:	f456                	sd	s5,40(sp)
    802061f2:	f05a                	sd	s6,32(sp)
    802061f4:	ec5e                	sd	s7,24(sp)
    802061f6:	e862                	sd	s8,16(sp)
    802061f8:	e466                	sd	s9,8(sp)
    802061fa:	1080                	addi	s0,sp,96
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    802061fc:	0001e797          	auipc	a5,0x1e
    80206200:	bfc78793          	addi	a5,a5,-1028 # 80223df8 <fat>
    80206204:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    80206208:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    8020620c:	539c                	lw	a5,32(a5)
    8020620e:	10078363          	beqz	a5,80206314 <alloc_clus+0x132>
    80206212:	0029591b          	srliw	s2,s2,0x2
    80206216:	0009099b          	sext.w	s3,s2
    8020621a:	4b01                	li	s6,0
        b = bread(dev, sec);
    8020621c:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80206220:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80206222:	0001ec97          	auipc	s9,0x1e
    80206226:	bd6c8c93          	addi	s9,s9,-1066 # 80223df8 <fat>
    8020622a:	a0c9                	j	802062ec <alloc_clus+0x10a>
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    8020622c:	100007b7          	lui	a5,0x10000
    80206230:	17fd                	addi	a5,a5,-1 # fffffff <_entry-0x70200001>
    80206232:	c29c                	sw	a5,0(a3)
                bwrite(b);
    80206234:	8552                	mv	a0,s4
    80206236:	ffffe097          	auipc	ra,0xffffe
    8020623a:	9d6080e7          	jalr	-1578(ra) # 80203c0c <bwrite>
                brelse(b);
    8020623e:	8552                	mv	a0,s4
    80206240:	ffffe097          	auipc	ra,0xffffe
    80206244:	a08080e7          	jalr	-1528(ra) # 80203c48 <brelse>
                uint32 clus = i * ent_per_sec + j;
    80206248:	0369093b          	mulw	s2,s2,s6
    8020624c:	0099093b          	addw	s2,s2,s1
    80206250:	00090a9b          	sext.w	s5,s2
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80206254:	0001e717          	auipc	a4,0x1e
    80206258:	ba470713          	addi	a4,a4,-1116 # 80223df8 <fat>
    8020625c:	01274783          	lbu	a5,18(a4)
    80206260:	ffe9099b          	addiw	s3,s2,-2
    80206264:	02f989bb          	mulw	s3,s3,a5
    80206268:	4318                	lw	a4,0(a4)
    8020626a:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    8020626e:	c7b1                	beqz	a5,802062ba <alloc_clus+0xd8>
    80206270:	4901                	li	s2,0
    80206272:	0001ea17          	auipc	s4,0x1e
    80206276:	b86a0a13          	addi	s4,s4,-1146 # 80223df8 <fat>
        b = bread(0, sec++);
    8020627a:	013905bb          	addw	a1,s2,s3
    8020627e:	4501                	li	a0,0
    80206280:	ffffe097          	auipc	ra,0xffffe
    80206284:	89c080e7          	jalr	-1892(ra) # 80203b1c <bread>
    80206288:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    8020628a:	20000613          	li	a2,512
    8020628e:	4581                	li	a1,0
    80206290:	05850513          	addi	a0,a0,88
    80206294:	ffffa097          	auipc	ra,0xffffa
    80206298:	4ce080e7          	jalr	1230(ra) # 80200762 <memset>
        bwrite(b);
    8020629c:	8526                	mv	a0,s1
    8020629e:	ffffe097          	auipc	ra,0xffffe
    802062a2:	96e080e7          	jalr	-1682(ra) # 80203c0c <bwrite>
        brelse(b);
    802062a6:	8526                	mv	a0,s1
    802062a8:	ffffe097          	auipc	ra,0xffffe
    802062ac:	9a0080e7          	jalr	-1632(ra) # 80203c48 <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    802062b0:	2905                	addiw	s2,s2,1
    802062b2:	012a4783          	lbu	a5,18(s4)
    802062b6:	fcf942e3          	blt	s2,a5,8020627a <alloc_clus+0x98>
}
    802062ba:	8556                	mv	a0,s5
    802062bc:	60e6                	ld	ra,88(sp)
    802062be:	6446                	ld	s0,80(sp)
    802062c0:	64a6                	ld	s1,72(sp)
    802062c2:	6906                	ld	s2,64(sp)
    802062c4:	79e2                	ld	s3,56(sp)
    802062c6:	7a42                	ld	s4,48(sp)
    802062c8:	7aa2                	ld	s5,40(sp)
    802062ca:	7b02                	ld	s6,32(sp)
    802062cc:	6be2                	ld	s7,24(sp)
    802062ce:	6c42                	ld	s8,16(sp)
    802062d0:	6ca2                	ld	s9,8(sp)
    802062d2:	6125                	addi	sp,sp,96
    802062d4:	8082                	ret
        brelse(b);
    802062d6:	8552                	mv	a0,s4
    802062d8:	ffffe097          	auipc	ra,0xffffe
    802062dc:	970080e7          	jalr	-1680(ra) # 80203c48 <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802062e0:	2b05                	addiw	s6,s6,1
    802062e2:	2b85                	addiw	s7,s7,1 # fffffffffffff001 <ebss_clear+0xffffffff7fdd2001>
    802062e4:	020ca783          	lw	a5,32(s9)
    802062e8:	02fb7663          	bgeu	s6,a5,80206314 <alloc_clus+0x132>
        b = bread(dev, sec);
    802062ec:	85de                	mv	a1,s7
    802062ee:	8556                	mv	a0,s5
    802062f0:	ffffe097          	auipc	ra,0xffffe
    802062f4:	82c080e7          	jalr	-2004(ra) # 80203b1c <bread>
    802062f8:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802062fa:	fc098ee3          	beqz	s3,802062d6 <alloc_clus+0xf4>
    802062fe:	05850793          	addi	a5,a0,88
    80206302:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    80206304:	86be                	mv	a3,a5
    80206306:	4398                	lw	a4,0(a5)
    80206308:	d315                	beqz	a4,8020622c <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    8020630a:	2485                	addiw	s1,s1,1
    8020630c:	0791                	addi	a5,a5,4
    8020630e:	fe999be3          	bne	s3,s1,80206304 <alloc_clus+0x122>
    80206312:	b7d1                	j	802062d6 <alloc_clus+0xf4>
    panic("no clusters");
    80206314:	00005517          	auipc	a0,0x5
    80206318:	bfc50513          	addi	a0,a0,-1028 # 8020af10 <DOMAINNAME+0x10>
    8020631c:	ffffa097          	auipc	ra,0xffffa
    80206320:	e28080e7          	jalr	-472(ra) # 80200144 <panic>

0000000080206324 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    80206324:	0001e797          	auipc	a5,0x1e
    80206328:	adc7a783          	lw	a5,-1316(a5) # 80223e00 <fat+0x8>
    8020632c:	2785                	addiw	a5,a5,1
    8020632e:	06a7e963          	bltu	a5,a0,802063a0 <write_fat+0x7c>
{
    80206332:	7179                	addi	sp,sp,-48
    80206334:	f406                	sd	ra,40(sp)
    80206336:	f022                	sd	s0,32(sp)
    80206338:	ec26                	sd	s1,24(sp)
    8020633a:	e84a                	sd	s2,16(sp)
    8020633c:	e44e                	sd	s3,8(sp)
    8020633e:	e052                	sd	s4,0(sp)
    80206340:	1800                	addi	s0,sp,48
    80206342:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80206344:	0025149b          	slliw	s1,a0,0x2
    80206348:	0001ea17          	auipc	s4,0x1e
    8020634c:	ab0a0a13          	addi	s4,s4,-1360 # 80223df8 <fat>
    80206350:	010a5783          	lhu	a5,16(s4)
    80206354:	02f4d7bb          	divuw	a5,s1,a5
    80206358:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    8020635c:	9dbd                	addw	a1,a1,a5
    8020635e:	4501                	li	a0,0
    80206360:	ffffd097          	auipc	ra,0xffffd
    80206364:	7bc080e7          	jalr	1980(ra) # 80203b1c <bread>
    80206368:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    8020636a:	010a5783          	lhu	a5,16(s4)
    8020636e:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80206372:	1482                	slli	s1,s1,0x20
    80206374:	9081                	srli	s1,s1,0x20
    80206376:	94aa                	add	s1,s1,a0
    80206378:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    8020637c:	ffffe097          	auipc	ra,0xffffe
    80206380:	890080e7          	jalr	-1904(ra) # 80203c0c <bwrite>
    brelse(b);
    80206384:	854a                	mv	a0,s2
    80206386:	ffffe097          	auipc	ra,0xffffe
    8020638a:	8c2080e7          	jalr	-1854(ra) # 80203c48 <brelse>
    return 0;
    8020638e:	4501                	li	a0,0
}
    80206390:	70a2                	ld	ra,40(sp)
    80206392:	7402                	ld	s0,32(sp)
    80206394:	64e2                	ld	s1,24(sp)
    80206396:	6942                	ld	s2,16(sp)
    80206398:	69a2                	ld	s3,8(sp)
    8020639a:	6a02                	ld	s4,0(sp)
    8020639c:	6145                	addi	sp,sp,48
    8020639e:	8082                	ret
        return -1;
    802063a0:	557d                	li	a0,-1
}
    802063a2:	8082                	ret

00000000802063a4 <reloc_clus>:
{
    802063a4:	715d                	addi	sp,sp,-80
    802063a6:	e486                	sd	ra,72(sp)
    802063a8:	e0a2                	sd	s0,64(sp)
    802063aa:	fc26                	sd	s1,56(sp)
    802063ac:	f84a                	sd	s2,48(sp)
    802063ae:	f44e                	sd	s3,40(sp)
    802063b0:	f052                	sd	s4,32(sp)
    802063b2:	ec56                	sd	s5,24(sp)
    802063b4:	e85a                	sd	s6,16(sp)
    802063b6:	e45e                	sd	s7,8(sp)
    802063b8:	0880                	addi	s0,sp,80
    802063ba:	84aa                	mv	s1,a0
    802063bc:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    802063be:	0001eb97          	auipc	s7,0x1e
    802063c2:	a46bab83          	lw	s7,-1466(s7) # 80223e04 <fat+0xc>
    802063c6:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    802063ca:	11052703          	lw	a4,272(a0)
    802063ce:	07377563          	bgeu	a4,s3,80206438 <reloc_clus+0x94>
    802063d2:	8b32                	mv	s6,a2
        if (clus >= FAT32_EOC) {
    802063d4:	10000ab7          	lui	s5,0x10000
    802063d8:	1add                	addi	s5,s5,-9 # ffffff7 <_entry-0x70200009>
    802063da:	a81d                	j	80206410 <reloc_clus+0x6c>
                clus = alloc_clus(entry->dev);
    802063dc:	1144c503          	lbu	a0,276(s1)
    802063e0:	00000097          	auipc	ra,0x0
    802063e4:	e02080e7          	jalr	-510(ra) # 802061e2 <alloc_clus>
    802063e8:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    802063ec:	85ca                	mv	a1,s2
    802063ee:	10c4a503          	lw	a0,268(s1)
    802063f2:	00000097          	auipc	ra,0x0
    802063f6:	f32080e7          	jalr	-206(ra) # 80206324 <write_fat>
        entry->cur_clus = clus;
    802063fa:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    802063fe:	1104a783          	lw	a5,272(s1)
    80206402:	2785                	addiw	a5,a5,1
    80206404:	0007871b          	sext.w	a4,a5
    80206408:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    8020640c:	03377663          	bgeu	a4,s3,80206438 <reloc_clus+0x94>
        int clus = read_fat(entry->cur_clus);
    80206410:	10c4a503          	lw	a0,268(s1)
    80206414:	00000097          	auipc	ra,0x0
    80206418:	d58080e7          	jalr	-680(ra) # 8020616c <read_fat>
    8020641c:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    80206420:	fd2adde3          	bge	s5,s2,802063fa <reloc_clus+0x56>
            if (alloc) {
    80206424:	fa0b1ce3          	bnez	s6,802063dc <reloc_clus+0x38>
                entry->cur_clus = entry->first_clus;
    80206428:	1044a783          	lw	a5,260(s1)
    8020642c:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    80206430:	1004a823          	sw	zero,272(s1)
                return -1;
    80206434:	557d                	li	a0,-1
    80206436:	a881                	j	80206486 <reloc_clus+0xe2>
    if (clus_num < entry->clus_cnt) {
    80206438:	04e9f163          	bgeu	s3,a4,8020647a <reloc_clus+0xd6>
        entry->cur_clus = entry->first_clus;
    8020643c:	1044a783          	lw	a5,260(s1)
    80206440:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    80206444:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    80206448:	037a6963          	bltu	s4,s7,8020647a <reloc_clus+0xd6>
            if (entry->cur_clus >= FAT32_EOC) {
    8020644c:	10000937          	lui	s2,0x10000
    80206450:	195d                	addi	s2,s2,-9 # ffffff7 <_entry-0x70200009>
            entry->cur_clus = read_fat(entry->cur_clus);
    80206452:	10c4a503          	lw	a0,268(s1)
    80206456:	00000097          	auipc	ra,0x0
    8020645a:	d16080e7          	jalr	-746(ra) # 8020616c <read_fat>
    8020645e:	2501                	sext.w	a0,a0
    80206460:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    80206464:	02a96c63          	bltu	s2,a0,8020649c <reloc_clus+0xf8>
            entry->clus_cnt++;
    80206468:	1104a783          	lw	a5,272(s1)
    8020646c:	2785                	addiw	a5,a5,1
    8020646e:	0007871b          	sext.w	a4,a5
    80206472:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80206476:	fd376ee3          	bltu	a4,s3,80206452 <reloc_clus+0xae>
    return off % fat.byts_per_clus;
    8020647a:	0001e797          	auipc	a5,0x1e
    8020647e:	98a7a783          	lw	a5,-1654(a5) # 80223e04 <fat+0xc>
    80206482:	02fa753b          	remuw	a0,s4,a5
}
    80206486:	60a6                	ld	ra,72(sp)
    80206488:	6406                	ld	s0,64(sp)
    8020648a:	74e2                	ld	s1,56(sp)
    8020648c:	7942                	ld	s2,48(sp)
    8020648e:	79a2                	ld	s3,40(sp)
    80206490:	7a02                	ld	s4,32(sp)
    80206492:	6ae2                	ld	s5,24(sp)
    80206494:	6b42                	ld	s6,16(sp)
    80206496:	6ba2                	ld	s7,8(sp)
    80206498:	6161                	addi	sp,sp,80
    8020649a:	8082                	ret
                panic("reloc_clus");
    8020649c:	00005517          	auipc	a0,0x5
    802064a0:	a8450513          	addi	a0,a0,-1404 # 8020af20 <DOMAINNAME+0x20>
    802064a4:	ffffa097          	auipc	ra,0xffffa
    802064a8:	ca0080e7          	jalr	-864(ra) # 80200144 <panic>

00000000802064ac <rw_clus>:
{
    802064ac:	7119                	addi	sp,sp,-128
    802064ae:	fc86                	sd	ra,120(sp)
    802064b0:	f8a2                	sd	s0,112(sp)
    802064b2:	f4a6                	sd	s1,104(sp)
    802064b4:	f0ca                	sd	s2,96(sp)
    802064b6:	ecce                	sd	s3,88(sp)
    802064b8:	e8d2                	sd	s4,80(sp)
    802064ba:	e4d6                	sd	s5,72(sp)
    802064bc:	e0da                	sd	s6,64(sp)
    802064be:	fc5e                	sd	s7,56(sp)
    802064c0:	f862                	sd	s8,48(sp)
    802064c2:	f466                	sd	s9,40(sp)
    802064c4:	f06a                	sd	s10,32(sp)
    802064c6:	ec6e                	sd	s11,24(sp)
    802064c8:	0100                	addi	s0,sp,128
    802064ca:	f8c43423          	sd	a2,-120(s0)
    802064ce:	8b36                	mv	s6,a3
    802064d0:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    802064d2:	00f706bb          	addw	a3,a4,a5
    802064d6:	0001e797          	auipc	a5,0x1e
    802064da:	92e7a783          	lw	a5,-1746(a5) # 80223e04 <fat+0xc>
    802064de:	02d7ef63          	bltu	a5,a3,8020651c <rw_clus+0x70>
    802064e2:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    802064e4:	0001e797          	auipc	a5,0x1e
    802064e8:	91478793          	addi	a5,a5,-1772 # 80223df8 <fat>
    802064ec:	0107d683          	lhu	a3,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    802064f0:	ffe5099b          	addiw	s3,a0,-2
    802064f4:	0127c603          	lbu	a2,18(a5)
    802064f8:	02c989bb          	mulw	s3,s3,a2
    802064fc:	439c                	lw	a5,0(a5)
    802064fe:	00f989bb          	addw	s3,s3,a5
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80206502:	02d757bb          	divuw	a5,a4,a3
    80206506:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    8020650a:	02d77abb          	remuw	s5,a4,a3
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    8020650e:	0e0c0363          	beqz	s8,802065f4 <rw_clus+0x148>
    80206512:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    80206514:	20000d93          	li	s11,512
        if (bad == -1) {
    80206518:	5d7d                	li	s10,-1
    8020651a:	a095                	j	8020657e <rw_clus+0xd2>
        panic("offset out of range");
    8020651c:	00005517          	auipc	a0,0x5
    80206520:	a1450513          	addi	a0,a0,-1516 # 8020af30 <DOMAINNAME+0x30>
    80206524:	ffffa097          	auipc	ra,0xffffa
    80206528:	c20080e7          	jalr	-992(ra) # 80200144 <panic>
                bwrite(bp);
    8020652c:	854a                	mv	a0,s2
    8020652e:	ffffd097          	auipc	ra,0xffffd
    80206532:	6de080e7          	jalr	1758(ra) # 80203c0c <bwrite>
        brelse(bp);
    80206536:	854a                	mv	a0,s2
    80206538:	ffffd097          	auipc	ra,0xffffd
    8020653c:	710080e7          	jalr	1808(ra) # 80203c48 <brelse>
        if (bad == -1) {
    80206540:	a02d                	j	8020656a <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    80206542:	05890613          	addi	a2,s2,88
    80206546:	1682                	slli	a3,a3,0x20
    80206548:	9281                	srli	a3,a3,0x20
    8020654a:	963a                	add	a2,a2,a4
    8020654c:	85da                	mv	a1,s6
    8020654e:	f8843503          	ld	a0,-120(s0)
    80206552:	ffffc097          	auipc	ra,0xffffc
    80206556:	07a080e7          	jalr	122(ra) # 802025cc <either_copyout>
    8020655a:	8baa                	mv	s7,a0
        brelse(bp);
    8020655c:	854a                	mv	a0,s2
    8020655e:	ffffd097          	auipc	ra,0xffffd
    80206562:	6ea080e7          	jalr	1770(ra) # 80203c48 <brelse>
        if (bad == -1) {
    80206566:	07ab8763          	beq	s7,s10,802065d4 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    8020656a:	01448a3b          	addw	s4,s1,s4
    8020656e:	01548abb          	addw	s5,s1,s5
    80206572:	1482                	slli	s1,s1,0x20
    80206574:	9081                	srli	s1,s1,0x20
    80206576:	9b26                	add	s6,s6,s1
    80206578:	2985                	addiw	s3,s3,1
    8020657a:	058a7d63          	bgeu	s4,s8,802065d4 <rw_clus+0x128>
        bp = bread(0, sec);
    8020657e:	85ce                	mv	a1,s3
    80206580:	4501                	li	a0,0
    80206582:	ffffd097          	auipc	ra,0xffffd
    80206586:	59a080e7          	jalr	1434(ra) # 80203b1c <bread>
    8020658a:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    8020658c:	1ffaf713          	andi	a4,s5,511
        if (n - tot < m) {
    80206590:	414c07bb          	subw	a5,s8,s4
        m = BSIZE - off % BSIZE;
    80206594:	40ed863b          	subw	a2,s11,a4
    80206598:	86be                	mv	a3,a5
    8020659a:	2781                	sext.w	a5,a5
    8020659c:	0006059b          	sext.w	a1,a2
    802065a0:	00f5f363          	bgeu	a1,a5,802065a6 <rw_clus+0xfa>
    802065a4:	86b2                	mv	a3,a2
    802065a6:	0006849b          	sext.w	s1,a3
        if (write) {
    802065aa:	f80c8ce3          	beqz	s9,80206542 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    802065ae:	05890513          	addi	a0,s2,88
    802065b2:	1682                	slli	a3,a3,0x20
    802065b4:	9281                	srli	a3,a3,0x20
    802065b6:	865a                	mv	a2,s6
    802065b8:	f8843583          	ld	a1,-120(s0)
    802065bc:	953a                	add	a0,a0,a4
    802065be:	ffffc097          	auipc	ra,0xffffc
    802065c2:	044080e7          	jalr	68(ra) # 80202602 <either_copyin>
    802065c6:	f7a513e3          	bne	a0,s10,8020652c <rw_clus+0x80>
        brelse(bp);
    802065ca:	854a                	mv	a0,s2
    802065cc:	ffffd097          	auipc	ra,0xffffd
    802065d0:	67c080e7          	jalr	1660(ra) # 80203c48 <brelse>
}
    802065d4:	8552                	mv	a0,s4
    802065d6:	70e6                	ld	ra,120(sp)
    802065d8:	7446                	ld	s0,112(sp)
    802065da:	74a6                	ld	s1,104(sp)
    802065dc:	7906                	ld	s2,96(sp)
    802065de:	69e6                	ld	s3,88(sp)
    802065e0:	6a46                	ld	s4,80(sp)
    802065e2:	6aa6                	ld	s5,72(sp)
    802065e4:	6b06                	ld	s6,64(sp)
    802065e6:	7be2                	ld	s7,56(sp)
    802065e8:	7c42                	ld	s8,48(sp)
    802065ea:	7ca2                	ld	s9,40(sp)
    802065ec:	7d02                	ld	s10,32(sp)
    802065ee:	6de2                	ld	s11,24(sp)
    802065f0:	6109                	addi	sp,sp,128
    802065f2:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802065f4:	8a62                	mv	s4,s8
    802065f6:	bff9                	j	802065d4 <rw_clus+0x128>

00000000802065f8 <eget>:
{
    802065f8:	7139                	addi	sp,sp,-64
    802065fa:	fc06                	sd	ra,56(sp)
    802065fc:	f822                	sd	s0,48(sp)
    802065fe:	f426                	sd	s1,40(sp)
    80206600:	f04a                	sd	s2,32(sp)
    80206602:	ec4e                	sd	s3,24(sp)
    80206604:	e852                	sd	s4,16(sp)
    80206606:	e456                	sd	s5,8(sp)
    80206608:	0080                	addi	s0,sp,64
    8020660a:	8a2a                	mv	s4,a0
    8020660c:	8aae                	mv	s5,a1
    acquire(&ecache.lock);
    8020660e:	0001e517          	auipc	a0,0x1e
    80206612:	98250513          	addi	a0,a0,-1662 # 80223f90 <ecache>
    80206616:	ffffa097          	auipc	ra,0xffffa
    8020661a:	0b0080e7          	jalr	176(ra) # 802006c6 <acquire>
    if (name) {
    8020661e:	060a8b63          	beqz	s5,80206694 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80206622:	0001e497          	auipc	s1,0x1e
    80206626:	9264b483          	ld	s1,-1754(s1) # 80223f48 <root+0x128>
    8020662a:	0001d797          	auipc	a5,0x1d
    8020662e:	7f678793          	addi	a5,a5,2038 # 80223e20 <root>
    80206632:	06f48163          	beq	s1,a5,80206694 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80206636:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80206638:	89be                	mv	s3,a5
    8020663a:	a029                	j	80206644 <eget+0x4c>
    8020663c:	1284b483          	ld	s1,296(s1)
    80206640:	05348a63          	beq	s1,s3,80206694 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80206644:	11649783          	lh	a5,278(s1)
    80206648:	ff279ae3          	bne	a5,s2,8020663c <eget+0x44>
    8020664c:	1204b783          	ld	a5,288(s1)
    80206650:	ff4796e3          	bne	a5,s4,8020663c <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    80206654:	0ff00613          	li	a2,255
    80206658:	85d6                	mv	a1,s5
    8020665a:	8526                	mv	a0,s1
    8020665c:	ffffa097          	auipc	ra,0xffffa
    80206660:	1de080e7          	jalr	478(ra) # 8020083a <strncmp>
    80206664:	fd61                	bnez	a0,8020663c <eget+0x44>
                if (ep->ref++ == 0) {
    80206666:	1184a783          	lw	a5,280(s1)
    8020666a:	0017871b          	addiw	a4,a5,1
    8020666e:	10e4ac23          	sw	a4,280(s1)
    80206672:	eb81                	bnez	a5,80206682 <eget+0x8a>
                    ep->parent->ref++;
    80206674:	1204b703          	ld	a4,288(s1)
    80206678:	11872783          	lw	a5,280(a4)
    8020667c:	2785                	addiw	a5,a5,1
    8020667e:	10f72c23          	sw	a5,280(a4)
                release(&ecache.lock);
    80206682:	0001e517          	auipc	a0,0x1e
    80206686:	90e50513          	addi	a0,a0,-1778 # 80223f90 <ecache>
    8020668a:	ffffa097          	auipc	ra,0xffffa
    8020668e:	090080e7          	jalr	144(ra) # 8020071a <release>
                return ep;
    80206692:	a085                	j	802066f2 <eget+0xfa>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206694:	0001e497          	auipc	s1,0x1e
    80206698:	8bc4b483          	ld	s1,-1860(s1) # 80223f50 <root+0x130>
    8020669c:	0001d797          	auipc	a5,0x1d
    802066a0:	78478793          	addi	a5,a5,1924 # 80223e20 <root>
    802066a4:	00f48a63          	beq	s1,a5,802066b8 <eget+0xc0>
    802066a8:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    802066aa:	1184a783          	lw	a5,280(s1)
    802066ae:	cf89                	beqz	a5,802066c8 <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    802066b0:	1304b483          	ld	s1,304(s1)
    802066b4:	fee49be3          	bne	s1,a4,802066aa <eget+0xb2>
    panic("eget: insufficient ecache");
    802066b8:	00005517          	auipc	a0,0x5
    802066bc:	89050513          	addi	a0,a0,-1904 # 8020af48 <DOMAINNAME+0x48>
    802066c0:	ffffa097          	auipc	ra,0xffffa
    802066c4:	a84080e7          	jalr	-1404(ra) # 80200144 <panic>
            ep->ref = 1;
    802066c8:	4785                	li	a5,1
    802066ca:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    802066ce:	114a4783          	lbu	a5,276(s4)
    802066d2:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    802066d6:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    802066da:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    802066de:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    802066e2:	0001e517          	auipc	a0,0x1e
    802066e6:	8ae50513          	addi	a0,a0,-1874 # 80223f90 <ecache>
    802066ea:	ffffa097          	auipc	ra,0xffffa
    802066ee:	030080e7          	jalr	48(ra) # 8020071a <release>
}
    802066f2:	8526                	mv	a0,s1
    802066f4:	70e2                	ld	ra,56(sp)
    802066f6:	7442                	ld	s0,48(sp)
    802066f8:	74a2                	ld	s1,40(sp)
    802066fa:	7902                	ld	s2,32(sp)
    802066fc:	69e2                	ld	s3,24(sp)
    802066fe:	6a42                	ld	s4,16(sp)
    80206700:	6aa2                	ld	s5,8(sp)
    80206702:	6121                	addi	sp,sp,64
    80206704:	8082                	ret

0000000080206706 <read_entry_name>:
{
    80206706:	7139                	addi	sp,sp,-64
    80206708:	fc06                	sd	ra,56(sp)
    8020670a:	f822                	sd	s0,48(sp)
    8020670c:	f426                	sd	s1,40(sp)
    8020670e:	f04a                	sd	s2,32(sp)
    80206710:	ec4e                	sd	s3,24(sp)
    80206712:	0080                	addi	s0,sp,64
    80206714:	84aa                	mv	s1,a0
    80206716:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    80206718:	00b5c703          	lbu	a4,11(a1)
    8020671c:	47bd                	li	a5,15
    8020671e:	08f70563          	beq	a4,a5,802067a8 <read_entry_name+0xa2>
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    80206722:	4635                	li	a2,13
    80206724:	4581                	li	a1,0
    80206726:	ffffa097          	auipc	ra,0xffffa
    8020672a:	03c080e7          	jalr	60(ra) # 80200762 <memset>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020672e:	00094703          	lbu	a4,0(s2)
    80206732:	02000793          	li	a5,32
    80206736:	0af70c63          	beq	a4,a5,802067ee <read_entry_name+0xe8>
    8020673a:	4785                	li	a5,1
    8020673c:	02000613          	li	a2,32
    80206740:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80206742:	00f486b3          	add	a3,s1,a5
    80206746:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020674a:	0007869b          	sext.w	a3,a5
    8020674e:	00f90733          	add	a4,s2,a5
    80206752:	00074703          	lbu	a4,0(a4)
    80206756:	00c70563          	beq	a4,a2,80206760 <read_entry_name+0x5a>
    8020675a:	0785                	addi	a5,a5,1
    8020675c:	feb793e3          	bne	a5,a1,80206742 <read_entry_name+0x3c>
        if (d->sne.name[8] != ' ') {
    80206760:	00894703          	lbu	a4,8(s2)
    80206764:	02000793          	li	a5,32
    80206768:	00f70963          	beq	a4,a5,8020677a <read_entry_name+0x74>
            buffer[i++] = '.';
    8020676c:	00d487b3          	add	a5,s1,a3
    80206770:	02e00713          	li	a4,46
    80206774:	00e78023          	sb	a4,0(a5)
    80206778:	2685                	addiw	a3,a3,1
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    8020677a:	00890793          	addi	a5,s2,8
    8020677e:	94b6                	add	s1,s1,a3
    80206780:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    80206782:	02000693          	li	a3,32
    80206786:	0007c703          	lbu	a4,0(a5)
    8020678a:	00d70863          	beq	a4,a3,8020679a <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    8020678e:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80206792:	0785                	addi	a5,a5,1
    80206794:	0485                	addi	s1,s1,1
    80206796:	ff2798e3          	bne	a5,s2,80206786 <read_entry_name+0x80>
}
    8020679a:	70e2                	ld	ra,56(sp)
    8020679c:	7442                	ld	s0,48(sp)
    8020679e:	74a2                	ld	s1,40(sp)
    802067a0:	7902                	ld	s2,32(sp)
    802067a2:	69e2                	ld	s3,24(sp)
    802067a4:	6121                	addi	sp,sp,64
    802067a6:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    802067a8:	4629                	li	a2,10
    802067aa:	0585                	addi	a1,a1,1
    802067ac:	fc040993          	addi	s3,s0,-64
    802067b0:	854e                	mv	a0,s3
    802067b2:	ffffa097          	auipc	ra,0xffffa
    802067b6:	00c080e7          	jalr	12(ra) # 802007be <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    802067ba:	4615                	li	a2,5
    802067bc:	85ce                	mv	a1,s3
    802067be:	8526                	mv	a0,s1
    802067c0:	ffffa097          	auipc	ra,0xffffa
    802067c4:	182080e7          	jalr	386(ra) # 80200942 <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    802067c8:	4619                	li	a2,6
    802067ca:	00e90593          	addi	a1,s2,14
    802067ce:	00548513          	addi	a0,s1,5
    802067d2:	ffffa097          	auipc	ra,0xffffa
    802067d6:	170080e7          	jalr	368(ra) # 80200942 <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    802067da:	4609                	li	a2,2
    802067dc:	01c90593          	addi	a1,s2,28
    802067e0:	00b48513          	addi	a0,s1,11
    802067e4:	ffffa097          	auipc	ra,0xffffa
    802067e8:	15e080e7          	jalr	350(ra) # 80200942 <snstr>
    802067ec:	b77d                	j	8020679a <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802067ee:	4681                	li	a3,0
    802067f0:	bf85                	j	80206760 <read_entry_name+0x5a>

00000000802067f2 <fat32_init>:
{
    802067f2:	7139                	addi	sp,sp,-64
    802067f4:	fc06                	sd	ra,56(sp)
    802067f6:	f822                	sd	s0,48(sp)
    802067f8:	f426                	sd	s1,40(sp)
    802067fa:	f04a                	sd	s2,32(sp)
    802067fc:	ec4e                	sd	s3,24(sp)
    802067fe:	e852                	sd	s4,16(sp)
    80206800:	e456                	sd	s5,8(sp)
    80206802:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    80206804:	4581                	li	a1,0
    80206806:	4501                	li	a0,0
    80206808:	ffffd097          	auipc	ra,0xffffd
    8020680c:	314080e7          	jalr	788(ra) # 80203b1c <bread>
    80206810:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    80206812:	4615                	li	a2,5
    80206814:	00004597          	auipc	a1,0x4
    80206818:	75458593          	addi	a1,a1,1876 # 8020af68 <DOMAINNAME+0x68>
    8020681c:	0aa50513          	addi	a0,a0,170
    80206820:	ffffa097          	auipc	ra,0xffffa
    80206824:	01a080e7          	jalr	26(ra) # 8020083a <strncmp>
    80206828:	16051863          	bnez	a0,80206998 <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    8020682c:	0001d497          	auipc	s1,0x1d
    80206830:	5cc48493          	addi	s1,s1,1484 # 80223df8 <fat>
    80206834:	4609                	li	a2,2
    80206836:	06390593          	addi	a1,s2,99
    8020683a:	0001d517          	auipc	a0,0x1d
    8020683e:	5ce50513          	addi	a0,a0,1486 # 80223e08 <fat+0x10>
    80206842:	ffffa097          	auipc	ra,0xffffa
    80206846:	f7c080e7          	jalr	-132(ra) # 802007be <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    8020684a:	06594683          	lbu	a3,101(s2)
    8020684e:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80206852:	06695603          	lhu	a2,102(s2)
    80206856:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    8020685a:	06894703          	lbu	a4,104(s2)
    8020685e:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80206862:	07492783          	lw	a5,116(s2)
    80206866:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    80206868:	07892783          	lw	a5,120(s2)
    8020686c:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    8020686e:	07c92583          	lw	a1,124(s2)
    80206872:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80206874:	08492503          	lw	a0,132(s2)
    80206878:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    8020687a:	02b7073b          	mulw	a4,a4,a1
    8020687e:	9f31                	addw	a4,a4,a2
    80206880:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80206882:	9f99                	subw	a5,a5,a4
    80206884:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80206886:	02d7d7bb          	divuw	a5,a5,a3
    8020688a:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    8020688c:	0104d783          	lhu	a5,16(s1)
    80206890:	02d787bb          	mulw	a5,a5,a3
    80206894:	c4dc                	sw	a5,12(s1)
    brelse(b);
    80206896:	854a                	mv	a0,s2
    80206898:	ffffd097          	auipc	ra,0xffffd
    8020689c:	3b0080e7          	jalr	944(ra) # 80203c48 <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    802068a0:	0104d703          	lhu	a4,16(s1)
    802068a4:	20000793          	li	a5,512
    802068a8:	10f71063          	bne	a4,a5,802069a8 <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    802068ac:	00004597          	auipc	a1,0x4
    802068b0:	6f458593          	addi	a1,a1,1780 # 8020afa0 <DOMAINNAME+0xa0>
    802068b4:	0001d517          	auipc	a0,0x1d
    802068b8:	6dc50513          	addi	a0,a0,1756 # 80223f90 <ecache>
    802068bc:	ffffa097          	auipc	ra,0xffffa
    802068c0:	dc6080e7          	jalr	-570(ra) # 80200682 <initlock>
    memset(&root, 0, sizeof(root));
    802068c4:	0001d497          	auipc	s1,0x1d
    802068c8:	53448493          	addi	s1,s1,1332 # 80223df8 <fat>
    802068cc:	0001d917          	auipc	s2,0x1d
    802068d0:	55490913          	addi	s2,s2,1364 # 80223e20 <root>
    802068d4:	17000613          	li	a2,368
    802068d8:	4581                	li	a1,0
    802068da:	854a                	mv	a0,s2
    802068dc:	ffffa097          	auipc	ra,0xffffa
    802068e0:	e86080e7          	jalr	-378(ra) # 80200762 <memset>
    initsleeplock(&root.lock, "entry");
    802068e4:	00004597          	auipc	a1,0x4
    802068e8:	6c458593          	addi	a1,a1,1732 # 8020afa8 <DOMAINNAME+0xa8>
    802068ec:	0001d517          	auipc	a0,0x1d
    802068f0:	66c50513          	addi	a0,a0,1644 # 80223f58 <root+0x138>
    802068f4:	ffffd097          	auipc	ra,0xffffd
    802068f8:	46a080e7          	jalr	1130(ra) # 80203d5e <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    802068fc:	47d1                	li	a5,20
    802068fe:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    80206902:	50dc                	lw	a5,36(s1)
    80206904:	12f4aa23          	sw	a5,308(s1)
    80206908:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    8020690c:	4785                	li	a5,1
    8020690e:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    80206912:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    80206916:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020691a:	0001d497          	auipc	s1,0x1d
    8020691e:	68e48493          	addi	s1,s1,1678 # 80223fa8 <ecache+0x18>
        de->next = root.next;
    80206922:	0001d917          	auipc	s2,0x1d
    80206926:	4d690913          	addi	s2,s2,1238 # 80223df8 <fat>
        de->prev = &root;
    8020692a:	0001da97          	auipc	s5,0x1d
    8020692e:	4f6a8a93          	addi	s5,s5,1270 # 80223e20 <root>
        initsleeplock(&de->lock, "entry");
    80206932:	00004a17          	auipc	s4,0x4
    80206936:	676a0a13          	addi	s4,s4,1654 # 8020afa8 <DOMAINNAME+0xa8>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020693a:	00022997          	auipc	s3,0x22
    8020693e:	e4e98993          	addi	s3,s3,-434 # 80228788 <idx>
        de->dev = 0;
    80206942:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80206946:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    8020694a:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    8020694e:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    80206952:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80206956:	15093783          	ld	a5,336(s2)
    8020695a:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    8020695e:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    80206962:	85d2                	mv	a1,s4
    80206964:	13848513          	addi	a0,s1,312
    80206968:	ffffd097          	auipc	ra,0xffffd
    8020696c:	3f6080e7          	jalr	1014(ra) # 80203d5e <initsleeplock>
        root.next->prev = de;
    80206970:	15093783          	ld	a5,336(s2)
    80206974:	1297b823          	sd	s1,304(a5)
        root.next = de;
    80206978:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020697c:	17048493          	addi	s1,s1,368
    80206980:	fd3491e3          	bne	s1,s3,80206942 <fat32_init+0x150>
}
    80206984:	4501                	li	a0,0
    80206986:	70e2                	ld	ra,56(sp)
    80206988:	7442                	ld	s0,48(sp)
    8020698a:	74a2                	ld	s1,40(sp)
    8020698c:	7902                	ld	s2,32(sp)
    8020698e:	69e2                	ld	s3,24(sp)
    80206990:	6a42                	ld	s4,16(sp)
    80206992:	6aa2                	ld	s5,8(sp)
    80206994:	6121                	addi	sp,sp,64
    80206996:	8082                	ret
        panic("not FAT32 volume");
    80206998:	00004517          	auipc	a0,0x4
    8020699c:	5d850513          	addi	a0,a0,1496 # 8020af70 <DOMAINNAME+0x70>
    802069a0:	ffff9097          	auipc	ra,0xffff9
    802069a4:	7a4080e7          	jalr	1956(ra) # 80200144 <panic>
        panic("byts_per_sec != BSIZE");
    802069a8:	00004517          	auipc	a0,0x4
    802069ac:	5e050513          	addi	a0,a0,1504 # 8020af88 <DOMAINNAME+0x88>
    802069b0:	ffff9097          	auipc	ra,0xffff9
    802069b4:	794080e7          	jalr	1940(ra) # 80200144 <panic>

00000000802069b8 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802069b8:	10852783          	lw	a5,264(a0)
    802069bc:	0ed7e863          	bltu	a5,a3,80206aac <eread+0xf4>
{
    802069c0:	711d                	addi	sp,sp,-96
    802069c2:	ec86                	sd	ra,88(sp)
    802069c4:	e8a2                	sd	s0,80(sp)
    802069c6:	e4a6                	sd	s1,72(sp)
    802069c8:	e0ca                	sd	s2,64(sp)
    802069ca:	fc4e                	sd	s3,56(sp)
    802069cc:	f852                	sd	s4,48(sp)
    802069ce:	f456                	sd	s5,40(sp)
    802069d0:	f05a                	sd	s6,32(sp)
    802069d2:	ec5e                	sd	s7,24(sp)
    802069d4:	e862                	sd	s8,16(sp)
    802069d6:	e466                	sd	s9,8(sp)
    802069d8:	e06a                	sd	s10,0(sp)
    802069da:	1080                	addi	s0,sp,96
    802069dc:	8a2a                	mv	s4,a0
    802069de:	8bae                	mv	s7,a1
    802069e0:	8ab2                	mv	s5,a2
    802069e2:	8936                	mv	s2,a3
    802069e4:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802069e6:	9eb9                	addw	a3,a3,a4
        return 0;
    802069e8:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802069ea:	0b26e163          	bltu	a3,s2,80206a8c <eread+0xd4>
    802069ee:	100a4703          	lbu	a4,256(s4)
    802069f2:	8b41                	andi	a4,a4,16
    802069f4:	ef41                	bnez	a4,80206a8c <eread+0xd4>
    if (off + n > entry->file_size) {
    802069f6:	00d7f463          	bgeu	a5,a3,802069fe <eread+0x46>
        n = entry->file_size - off;
    802069fa:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802069fe:	10ca2703          	lw	a4,268(s4)
    80206a02:	100007b7          	lui	a5,0x10000
    80206a06:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
    80206a08:	06e7ef63          	bltu	a5,a4,80206a86 <eread+0xce>
    80206a0c:	080b0e63          	beqz	s6,80206aa8 <eread+0xf0>
    80206a10:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206a12:	0001dc97          	auipc	s9,0x1d
    80206a16:	3e6c8c93          	addi	s9,s9,998 # 80223df8 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206a1a:	8c3e                	mv	s8,a5
    80206a1c:	a82d                	j	80206a56 <eread+0x9e>
    80206a1e:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    80206a22:	87ea                	mv	a5,s10
    80206a24:	86d6                	mv	a3,s5
    80206a26:	865e                	mv	a2,s7
    80206a28:	4581                	li	a1,0
    80206a2a:	10ca2503          	lw	a0,268(s4)
    80206a2e:	00000097          	auipc	ra,0x0
    80206a32:	a7e080e7          	jalr	-1410(ra) # 802064ac <rw_clus>
    80206a36:	2501                	sext.w	a0,a0
    80206a38:	04ad1863          	bne	s10,a0,80206a88 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206a3c:	013489bb          	addw	s3,s1,s3
    80206a40:	0124893b          	addw	s2,s1,s2
    80206a44:	1482                	slli	s1,s1,0x20
    80206a46:	9081                	srli	s1,s1,0x20
    80206a48:	9aa6                	add	s5,s5,s1
    80206a4a:	10ca2783          	lw	a5,268(s4)
    80206a4e:	02fc6d63          	bltu	s8,a5,80206a88 <eread+0xd0>
    80206a52:	0369fb63          	bgeu	s3,s6,80206a88 <eread+0xd0>
        reloc_clus(entry, off, 0);
    80206a56:	4601                	li	a2,0
    80206a58:	85ca                	mv	a1,s2
    80206a5a:	8552                	mv	a0,s4
    80206a5c:	00000097          	auipc	ra,0x0
    80206a60:	948080e7          	jalr	-1720(ra) # 802063a4 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206a64:	00cca683          	lw	a3,12(s9)
    80206a68:	02d9763b          	remuw	a2,s2,a3
    80206a6c:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    80206a70:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206a74:	9e91                	subw	a3,a3,a2
    80206a76:	84be                	mv	s1,a5
    80206a78:	2781                	sext.w	a5,a5
    80206a7a:	0006861b          	sext.w	a2,a3
    80206a7e:	faf670e3          	bgeu	a2,a5,80206a1e <eread+0x66>
    80206a82:	84b6                	mv	s1,a3
    80206a84:	bf69                	j	80206a1e <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206a86:	4981                	li	s3,0
    return tot;
    80206a88:	0009851b          	sext.w	a0,s3
}
    80206a8c:	60e6                	ld	ra,88(sp)
    80206a8e:	6446                	ld	s0,80(sp)
    80206a90:	64a6                	ld	s1,72(sp)
    80206a92:	6906                	ld	s2,64(sp)
    80206a94:	79e2                	ld	s3,56(sp)
    80206a96:	7a42                	ld	s4,48(sp)
    80206a98:	7aa2                	ld	s5,40(sp)
    80206a9a:	7b02                	ld	s6,32(sp)
    80206a9c:	6be2                	ld	s7,24(sp)
    80206a9e:	6c42                	ld	s8,16(sp)
    80206aa0:	6ca2                	ld	s9,8(sp)
    80206aa2:	6d02                	ld	s10,0(sp)
    80206aa4:	6125                	addi	sp,sp,96
    80206aa6:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206aa8:	89da                	mv	s3,s6
    80206aaa:	bff9                	j	80206a88 <eread+0xd0>
        return 0;
    80206aac:	4501                	li	a0,0
}
    80206aae:	8082                	ret

0000000080206ab0 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206ab0:	10852783          	lw	a5,264(a0)
    80206ab4:	0ed7e463          	bltu	a5,a3,80206b9c <ewrite+0xec>
{
    80206ab8:	711d                	addi	sp,sp,-96
    80206aba:	ec86                	sd	ra,88(sp)
    80206abc:	e8a2                	sd	s0,80(sp)
    80206abe:	e4a6                	sd	s1,72(sp)
    80206ac0:	e0ca                	sd	s2,64(sp)
    80206ac2:	fc4e                	sd	s3,56(sp)
    80206ac4:	f852                	sd	s4,48(sp)
    80206ac6:	f456                	sd	s5,40(sp)
    80206ac8:	f05a                	sd	s6,32(sp)
    80206aca:	ec5e                	sd	s7,24(sp)
    80206acc:	e862                	sd	s8,16(sp)
    80206ace:	e466                	sd	s9,8(sp)
    80206ad0:	1080                	addi	s0,sp,96
    80206ad2:	8aaa                	mv	s5,a0
    80206ad4:	8bae                	mv	s7,a1
    80206ad6:	8a32                	mv	s4,a2
    80206ad8:	8936                	mv	s2,a3
    80206ada:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206adc:	00e687bb          	addw	a5,a3,a4
    80206ae0:	0cd7e063          	bltu	a5,a3,80206ba0 <ewrite+0xf0>
    80206ae4:	02069793          	slli	a5,a3,0x20
    80206ae8:	9381                	srli	a5,a5,0x20
    80206aea:	1702                	slli	a4,a4,0x20
    80206aec:	9301                	srli	a4,a4,0x20
    80206aee:	97ba                	add	a5,a5,a4
    80206af0:	577d                	li	a4,-1
    80206af2:	9301                	srli	a4,a4,0x20
    80206af4:	0af76863          	bltu	a4,a5,80206ba4 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    80206af8:	10054783          	lbu	a5,256(a0)
    80206afc:	8b85                	andi	a5,a5,1
    80206afe:	e7cd                	bnez	a5,80206ba8 <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    80206b00:	10452783          	lw	a5,260(a0)
    80206b04:	cb89                	beqz	a5,80206b16 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206b06:	080b0963          	beqz	s6,80206b98 <ewrite+0xe8>
    80206b0a:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206b0c:	0001dc17          	auipc	s8,0x1d
    80206b10:	2ecc0c13          	addi	s8,s8,748 # 80223df8 <fat>
    80206b14:	a891                	j	80206b68 <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    80206b16:	11454503          	lbu	a0,276(a0)
    80206b1a:	fffff097          	auipc	ra,0xfffff
    80206b1e:	6c8080e7          	jalr	1736(ra) # 802061e2 <alloc_clus>
    80206b22:	2501                	sext.w	a0,a0
    80206b24:	10aaa223          	sw	a0,260(s5)
    80206b28:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    80206b2c:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    80206b30:	4785                	li	a5,1
    80206b32:	10fa8aa3          	sb	a5,277(s5)
    80206b36:	bfc1                	j	80206b06 <ewrite+0x56>
    80206b38:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    80206b3c:	87e6                	mv	a5,s9
    80206b3e:	86d2                	mv	a3,s4
    80206b40:	865e                	mv	a2,s7
    80206b42:	4585                	li	a1,1
    80206b44:	10caa503          	lw	a0,268(s5)
    80206b48:	00000097          	auipc	ra,0x0
    80206b4c:	964080e7          	jalr	-1692(ra) # 802064ac <rw_clus>
    80206b50:	2501                	sext.w	a0,a0
    80206b52:	04ac9d63          	bne	s9,a0,80206bac <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206b56:	013489bb          	addw	s3,s1,s3
    80206b5a:	0124893b          	addw	s2,s1,s2
    80206b5e:	1482                	slli	s1,s1,0x20
    80206b60:	9081                	srli	s1,s1,0x20
    80206b62:	9a26                	add	s4,s4,s1
    80206b64:	0569f463          	bgeu	s3,s6,80206bac <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    80206b68:	4605                	li	a2,1
    80206b6a:	85ca                	mv	a1,s2
    80206b6c:	8556                	mv	a0,s5
    80206b6e:	00000097          	auipc	ra,0x0
    80206b72:	836080e7          	jalr	-1994(ra) # 802063a4 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206b76:	00cc2683          	lw	a3,12(s8)
    80206b7a:	02d9763b          	remuw	a2,s2,a3
    80206b7e:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    80206b82:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206b86:	9e91                	subw	a3,a3,a2
    80206b88:	84be                	mv	s1,a5
    80206b8a:	2781                	sext.w	a5,a5
    80206b8c:	0006861b          	sext.w	a2,a3
    80206b90:	faf674e3          	bgeu	a2,a5,80206b38 <ewrite+0x88>
    80206b94:	84b6                	mv	s1,a3
    80206b96:	b74d                	j	80206b38 <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206b98:	89da                	mv	s3,s6
    80206b9a:	a015                	j	80206bbe <ewrite+0x10e>
        return -1;
    80206b9c:	557d                	li	a0,-1
}
    80206b9e:	8082                	ret
        return -1;
    80206ba0:	557d                	li	a0,-1
    80206ba2:	a005                	j	80206bc2 <ewrite+0x112>
    80206ba4:	557d                	li	a0,-1
    80206ba6:	a831                	j	80206bc2 <ewrite+0x112>
    80206ba8:	557d                	li	a0,-1
    80206baa:	a821                	j	80206bc2 <ewrite+0x112>
        if(off > entry->file_size) {
    80206bac:	108aa783          	lw	a5,264(s5)
    80206bb0:	0127f763          	bgeu	a5,s2,80206bbe <ewrite+0x10e>
            entry->file_size = off;
    80206bb4:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80206bb8:	4785                	li	a5,1
    80206bba:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    80206bbe:	0009851b          	sext.w	a0,s3
}
    80206bc2:	60e6                	ld	ra,88(sp)
    80206bc4:	6446                	ld	s0,80(sp)
    80206bc6:	64a6                	ld	s1,72(sp)
    80206bc8:	6906                	ld	s2,64(sp)
    80206bca:	79e2                	ld	s3,56(sp)
    80206bcc:	7a42                	ld	s4,48(sp)
    80206bce:	7aa2                	ld	s5,40(sp)
    80206bd0:	7b02                	ld	s6,32(sp)
    80206bd2:	6be2                	ld	s7,24(sp)
    80206bd4:	6c42                	ld	s8,16(sp)
    80206bd6:	6ca2                	ld	s9,8(sp)
    80206bd8:	6125                	addi	sp,sp,96
    80206bda:	8082                	ret

0000000080206bdc <formatname>:
{
    80206bdc:	7179                	addi	sp,sp,-48
    80206bde:	f406                	sd	ra,40(sp)
    80206be0:	f022                	sd	s0,32(sp)
    80206be2:	ec26                	sd	s1,24(sp)
    80206be4:	e84a                	sd	s2,16(sp)
    80206be6:	e44e                	sd	s3,8(sp)
    80206be8:	e052                	sd	s4,0(sp)
    80206bea:	1800                	addi	s0,sp,48
    80206bec:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    80206bee:	02000793          	li	a5,32
    80206bf2:	02e00713          	li	a4,46
    80206bf6:	a011                	j	80206bfa <formatname+0x1e>
    80206bf8:	0485                	addi	s1,s1,1
    80206bfa:	0004c583          	lbu	a1,0(s1)
    80206bfe:	fef58de3          	beq	a1,a5,80206bf8 <formatname+0x1c>
    80206c02:	fee58be3          	beq	a1,a4,80206bf8 <formatname+0x1c>
    for (p = name; *p; p++) {
    80206c06:	c1b9                	beqz	a1,80206c4c <formatname+0x70>
    80206c08:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    80206c0a:	49fd                	li	s3,31
    80206c0c:	00007a17          	auipc	s4,0x7
    80206c10:	094a0a13          	addi	s4,s4,148 # 8020dca0 <illegal.1>
    80206c14:	02b9fe63          	bgeu	s3,a1,80206c50 <formatname+0x74>
    80206c18:	8552                	mv	a0,s4
    80206c1a:	ffffa097          	auipc	ra,0xffffa
    80206c1e:	da6080e7          	jalr	-602(ra) # 802009c0 <strchr>
    80206c22:	e121                	bnez	a0,80206c62 <formatname+0x86>
    for (p = name; *p; p++) {
    80206c24:	0905                	addi	s2,s2,1
    80206c26:	00094583          	lbu	a1,0(s2)
    80206c2a:	f5ed                	bnez	a1,80206c14 <formatname+0x38>
        if (*p != ' ') {
    80206c2c:	02000693          	li	a3,32
    80206c30:	874a                	mv	a4,s2
    while (p-- > name) {
    80206c32:	0124fb63          	bgeu	s1,s2,80206c48 <formatname+0x6c>
        if (*p != ' ') {
    80206c36:	197d                	addi	s2,s2,-1
    80206c38:	00094783          	lbu	a5,0(s2)
    80206c3c:	fed78ae3          	beq	a5,a3,80206c30 <formatname+0x54>
            p[1] = '\0';
    80206c40:	00070023          	sb	zero,0(a4)
            break;
    80206c44:	8526                	mv	a0,s1
    80206c46:	a031                	j	80206c52 <formatname+0x76>
    80206c48:	8526                	mv	a0,s1
    80206c4a:	a021                	j	80206c52 <formatname+0x76>
    for (p = name; *p; p++) {
    80206c4c:	8526                	mv	a0,s1
    80206c4e:	a011                	j	80206c52 <formatname+0x76>
            return 0;
    80206c50:	4501                	li	a0,0
}
    80206c52:	70a2                	ld	ra,40(sp)
    80206c54:	7402                	ld	s0,32(sp)
    80206c56:	64e2                	ld	s1,24(sp)
    80206c58:	6942                	ld	s2,16(sp)
    80206c5a:	69a2                	ld	s3,8(sp)
    80206c5c:	6a02                	ld	s4,0(sp)
    80206c5e:	6145                	addi	sp,sp,48
    80206c60:	8082                	ret
            return 0;
    80206c62:	4501                	li	a0,0
    80206c64:	b7fd                	j	80206c52 <formatname+0x76>

0000000080206c66 <cal_checksum>:
{
    80206c66:	1141                	addi	sp,sp,-16
    80206c68:	e422                	sd	s0,8(sp)
    80206c6a:	0800                	addi	s0,sp,16
    80206c6c:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80206c6e:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    80206c72:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    80206c74:	0075171b          	slliw	a4,a0,0x7
    80206c78:	0785                	addi	a5,a5,1
    80206c7a:	0015551b          	srliw	a0,a0,0x1
    80206c7e:	fff7c683          	lbu	a3,-1(a5)
    80206c82:	9d35                	addw	a0,a0,a3
    80206c84:	953a                	add	a0,a0,a4
    80206c86:	0ff57513          	zext.b	a0,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80206c8a:	fef615e3          	bne	a2,a5,80206c74 <cal_checksum+0xe>
}
    80206c8e:	6422                	ld	s0,8(sp)
    80206c90:	0141                	addi	sp,sp,16
    80206c92:	8082                	ret

0000000080206c94 <emake>:
{
    80206c94:	7131                	addi	sp,sp,-192
    80206c96:	fd06                	sd	ra,184(sp)
    80206c98:	f922                	sd	s0,176(sp)
    80206c9a:	f526                	sd	s1,168(sp)
    80206c9c:	f14a                	sd	s2,160(sp)
    80206c9e:	ed4e                	sd	s3,152(sp)
    80206ca0:	e952                	sd	s4,144(sp)
    80206ca2:	e556                	sd	s5,136(sp)
    80206ca4:	e15a                	sd	s6,128(sp)
    80206ca6:	fcde                	sd	s7,120(sp)
    80206ca8:	f8e2                	sd	s8,112(sp)
    80206caa:	f4e6                	sd	s9,104(sp)
    80206cac:	f0ea                	sd	s10,96(sp)
    80206cae:	ecee                	sd	s11,88(sp)
    80206cb0:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206cb2:	10054783          	lbu	a5,256(a0)
    80206cb6:	8bc1                	andi	a5,a5,16
    80206cb8:	c3d5                	beqz	a5,80206d5c <emake+0xc8>
    80206cba:	8b2a                	mv	s6,a0
    80206cbc:	8d2e                	mv	s10,a1
    80206cbe:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    80206cc0:	01f67793          	andi	a5,a2,31
    80206cc4:	e7c5                	bnez	a5,80206d6c <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80206cc6:	02000613          	li	a2,32
    80206cca:	4581                	li	a1,0
    80206ccc:	f7040513          	addi	a0,s0,-144
    80206cd0:	ffffa097          	auipc	ra,0xffffa
    80206cd4:	a92080e7          	jalr	-1390(ra) # 80200762 <memset>
    if (off <= 32) {
    80206cd8:	02000793          	li	a5,32
    80206cdc:	0b97ec63          	bltu	a5,s9,80206d94 <emake+0x100>
        if (off == 0) {
    80206ce0:	080c9e63          	bnez	s9,80206d7c <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80206ce4:	462d                	li	a2,11
    80206ce6:	00004597          	auipc	a1,0x4
    80206cea:	2f258593          	addi	a1,a1,754 # 8020afd8 <DOMAINNAME+0xd8>
    80206cee:	f7040513          	addi	a0,s0,-144
    80206cf2:	ffffa097          	auipc	ra,0xffffa
    80206cf6:	b84080e7          	jalr	-1148(ra) # 80200876 <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    80206cfa:	47c1                	li	a5,16
    80206cfc:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80206d00:	104d2783          	lw	a5,260(s10) # fffffffffffff104 <ebss_clear+0xffffffff7fdd2104>
    80206d04:	0107d71b          	srliw	a4,a5,0x10
    80206d08:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    80206d0c:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    80206d10:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206d14:	4605                	li	a2,1
    80206d16:	85e6                	mv	a1,s9
    80206d18:	855a                	mv	a0,s6
    80206d1a:	fffff097          	auipc	ra,0xfffff
    80206d1e:	68a080e7          	jalr	1674(ra) # 802063a4 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206d22:	02000793          	li	a5,32
    80206d26:	0005071b          	sext.w	a4,a0
    80206d2a:	f7040693          	addi	a3,s0,-144
    80206d2e:	4601                	li	a2,0
    80206d30:	4585                	li	a1,1
    80206d32:	10cb2503          	lw	a0,268(s6)
    80206d36:	fffff097          	auipc	ra,0xfffff
    80206d3a:	776080e7          	jalr	1910(ra) # 802064ac <rw_clus>
}
    80206d3e:	70ea                	ld	ra,184(sp)
    80206d40:	744a                	ld	s0,176(sp)
    80206d42:	74aa                	ld	s1,168(sp)
    80206d44:	790a                	ld	s2,160(sp)
    80206d46:	69ea                	ld	s3,152(sp)
    80206d48:	6a4a                	ld	s4,144(sp)
    80206d4a:	6aaa                	ld	s5,136(sp)
    80206d4c:	6b0a                	ld	s6,128(sp)
    80206d4e:	7be6                	ld	s7,120(sp)
    80206d50:	7c46                	ld	s8,112(sp)
    80206d52:	7ca6                	ld	s9,104(sp)
    80206d54:	7d06                	ld	s10,96(sp)
    80206d56:	6de6                	ld	s11,88(sp)
    80206d58:	6129                	addi	sp,sp,192
    80206d5a:	8082                	ret
        panic("emake: not dir");
    80206d5c:	00004517          	auipc	a0,0x4
    80206d60:	25450513          	addi	a0,a0,596 # 8020afb0 <DOMAINNAME+0xb0>
    80206d64:	ffff9097          	auipc	ra,0xffff9
    80206d68:	3e0080e7          	jalr	992(ra) # 80200144 <panic>
        panic("emake: not aligned");
    80206d6c:	00004517          	auipc	a0,0x4
    80206d70:	25450513          	addi	a0,a0,596 # 8020afc0 <DOMAINNAME+0xc0>
    80206d74:	ffff9097          	auipc	ra,0xffff9
    80206d78:	3d0080e7          	jalr	976(ra) # 80200144 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    80206d7c:	462d                	li	a2,11
    80206d7e:	00004597          	auipc	a1,0x4
    80206d82:	26a58593          	addi	a1,a1,618 # 8020afe8 <DOMAINNAME+0xe8>
    80206d86:	f7040513          	addi	a0,s0,-144
    80206d8a:	ffffa097          	auipc	ra,0xffffa
    80206d8e:	aec080e7          	jalr	-1300(ra) # 80200876 <strncpy>
    80206d92:	b7a5                	j	80206cfa <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    80206d94:	896a                	mv	s2,s10
    80206d96:	856a                	mv	a0,s10
    80206d98:	ffffa097          	auipc	ra,0xffffa
    80206d9c:	b4e080e7          	jalr	-1202(ra) # 802008e6 <strlen>
    80206da0:	f4a43423          	sd	a0,-184(s0)
    80206da4:	00c5071b          	addiw	a4,a0,12
    80206da8:	47b5                	li	a5,13
    80206daa:	02f747bb          	divw	a5,a4,a5
    80206dae:	f4f42c23          	sw	a5,-168(s0)
    80206db2:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    80206db6:	4631                	li	a2,12
    80206db8:	4581                	li	a1,0
    80206dba:	f6040513          	addi	a0,s0,-160
    80206dbe:	ffffa097          	auipc	ra,0xffffa
    80206dc2:	9a4080e7          	jalr	-1628(ra) # 80200762 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206dc6:	856a                	mv	a0,s10
    80206dc8:	ffffa097          	auipc	ra,0xffffa
    80206dcc:	b1e080e7          	jalr	-1250(ra) # 802008e6 <strlen>
    80206dd0:	fff5079b          	addiw	a5,a0,-1
    80206dd4:	0207cf63          	bltz	a5,80206e12 <emake+0x17e>
    80206dd8:	97ea                	add	a5,a5,s10
    80206dda:	ffed0693          	addi	a3,s10,-2
    80206dde:	96aa                	add	a3,a3,a0
    80206de0:	fff5071b          	addiw	a4,a0,-1
    80206de4:	1702                	slli	a4,a4,0x20
    80206de6:	9301                	srli	a4,a4,0x20
    80206de8:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    80206dea:	02e00613          	li	a2,46
    80206dee:	89be                	mv	s3,a5
    80206df0:	0007c703          	lbu	a4,0(a5)
    80206df4:	00c70663          	beq	a4,a2,80206e00 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206df8:	17fd                	addi	a5,a5,-1
    80206dfa:	fed79ae3          	bne	a5,a3,80206dee <emake+0x15a>
    char c, *p = name;
    80206dfe:	89ea                	mv	s3,s10
        shortname[i++] = c;
    80206e00:	4481                	li	s1,0
        if (i == 8 && p) {
    80206e02:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206e04:	4ba9                	li	s7,10
        if (c >= 'a' && c <= 'z') {
    80206e06:	4c65                	li	s8,25
                memset(shortname + i, ' ', 8 - i);
    80206e08:	f6040793          	addi	a5,s0,-160
    80206e0c:	f4f43823          	sd	a5,-176(s0)
    80206e10:	a8d9                	j	80206ee6 <emake+0x252>
    char c, *p = name;
    80206e12:	89ea                	mv	s3,s10
    80206e14:	b7f5                	j	80206e00 <emake+0x16c>
        if (i == 8 && p) {
    80206e16:	22098b63          	beqz	s3,8020704c <emake+0x3b8>
            if (p + 1 < name) { break; }            // no '.'
    80206e1a:	0985                	addi	s3,s3,1
    80206e1c:	0949fc63          	bgeu	s3,s4,80206eb4 <emake+0x220>
    80206e20:	f6040793          	addi	a5,s0,-160
    80206e24:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    80206e26:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    80206e2a:	4729                	li	a4,10
        shortname[i++] = ' ';
    80206e2c:	2485                	addiw	s1,s1,1
    80206e2e:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    80206e32:	0785                	addi	a5,a5,1
    80206e34:	fe975ce3          	bge	a4,s1,80206e2c <emake+0x198>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    80206e38:	f6040513          	addi	a0,s0,-160
    80206e3c:	00000097          	auipc	ra,0x0
    80206e40:	e2a080e7          	jalr	-470(ra) # 80206c66 <cal_checksum>
    80206e44:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    80206e48:	47bd                	li	a5,15
    80206e4a:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    80206e4e:	f4843783          	ld	a5,-184(s0)
    80206e52:	14f05c63          	blez	a5,80206faa <emake+0x316>
    80206e56:	f5842783          	lw	a5,-168(s0)
    80206e5a:	37fd                	addiw	a5,a5,-1
    80206e5c:	f4f42223          	sw	a5,-188(s0)
    80206e60:	00179b9b          	slliw	s7,a5,0x1
    80206e64:	00fb8bbb          	addw	s7,s7,a5
    80206e68:	002b9b9b          	slliw	s7,s7,0x2
    80206e6c:	00fb8bbb          	addw	s7,s7,a5
    80206e70:	9bea                	add	s7,s7,s10
    80206e72:	8aee                	mv	s5,s11
    80206e74:	8c66                	mv	s8,s9
            int end = 0;
    80206e76:	4981                	li	s3,0
            uint8 *w = (uint8 *)de.lne.name1;
    80206e78:	f7140793          	addi	a5,s0,-143
    80206e7c:	f4f43823          	sd	a5,-176(s0)
    80206e80:	0ff00913          	li	s2,255
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206e84:	f7e40793          	addi	a5,s0,-130
    80206e88:	f4f43c23          	sd	a5,-168(s0)
                switch (j) {
    80206e8c:	44ad                	li	s1,11
    80206e8e:	f8c40a13          	addi	s4,s0,-116
    80206e92:	a0c5                	j	80206f72 <emake+0x2de>
            if (name > p) {                    // last '.'
    80206e94:	0549f663          	bgeu	s3,s4,80206ee0 <emake+0x24c>
                memset(shortname + i, ' ', 8 - i);
    80206e98:	47a1                	li	a5,8
    80206e9a:	4097863b          	subw	a2,a5,s1
    80206e9e:	02000593          	li	a1,32
    80206ea2:	f5043783          	ld	a5,-176(s0)
    80206ea6:	00978533          	add	a0,a5,s1
    80206eaa:	ffffa097          	auipc	ra,0xffffa
    80206eae:	8b8080e7          	jalr	-1864(ra) # 80200762 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206eb2:	89d2                	mv	s3,s4
        shortname[i++] = c;
    80206eb4:	8a4e                	mv	s4,s3
    80206eb6:	84d6                	mv	s1,s5
    80206eb8:	4981                	li	s3,0
    80206eba:	a02d                	j	80206ee4 <emake+0x250>
            if (strchr(illegal, c) != NULL) {
    80206ebc:	85ca                	mv	a1,s2
    80206ebe:	00007517          	auipc	a0,0x7
    80206ec2:	df250513          	addi	a0,a0,-526 # 8020dcb0 <illegal.0>
    80206ec6:	ffffa097          	auipc	ra,0xffffa
    80206eca:	afa080e7          	jalr	-1286(ra) # 802009c0 <strchr>
    80206ece:	c119                	beqz	a0,80206ed4 <emake+0x240>
                c = '_';
    80206ed0:	05f00913          	li	s2,95
        shortname[i++] = c;
    80206ed4:	f9048793          	addi	a5,s1,-112
    80206ed8:	97a2                	add	a5,a5,s0
    80206eda:	fd278823          	sb	s2,-48(a5)
    80206ede:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206ee0:	f49bcce3          	blt	s7,s1,80206e38 <emake+0x1a4>
        shortname[i++] = c;
    80206ee4:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206ee6:	00190a13          	addi	s4,s2,1
    80206eea:	00094903          	lbu	s2,0(s2)
    80206eee:	02090663          	beqz	s2,80206f1a <emake+0x286>
        if (i == 8 && p) {
    80206ef2:	f35482e3          	beq	s1,s5,80206e16 <emake+0x182>
        if (c == ' ') { continue; }
    80206ef6:	02000793          	li	a5,32
    80206efa:	fef903e3          	beq	s2,a5,80206ee0 <emake+0x24c>
        if (c == '.') {
    80206efe:	02e00793          	li	a5,46
    80206f02:	f8f909e3          	beq	s2,a5,80206e94 <emake+0x200>
        if (c >= 'a' && c <= 'z') {
    80206f06:	f9f9079b          	addiw	a5,s2,-97
    80206f0a:	0ff7f793          	zext.b	a5,a5
    80206f0e:	fafc67e3          	bltu	s8,a5,80206ebc <emake+0x228>
            c += 'A' - 'a';
    80206f12:	3901                	addiw	s2,s2,-32
    80206f14:	0ff97913          	zext.b	s2,s2
    80206f18:	bf75                	j	80206ed4 <emake+0x240>
    while (i < CHAR_SHORT_NAME) {
    80206f1a:	47a9                	li	a5,10
    80206f1c:	f097d2e3          	bge	a5,s1,80206e20 <emake+0x18c>
    80206f20:	bf21                	j	80206e38 <emake+0x1a4>
                de.lne.order |= LAST_LONG_ENTRY;
    80206f22:	0407e793          	ori	a5,a5,64
    80206f26:	f6f40823          	sb	a5,-144(s0)
    80206f2a:	a891                	j	80206f7e <emake+0x2ea>
                    if ((*w++ = *p++) == 0) {
    80206f2c:	00084603          	lbu	a2,0(a6)
                        end = 1;
    80206f30:	00163513          	seqz	a0,a2
                    *w++ = 0;
    80206f34:	00278893          	addi	a7,a5,2
                    if ((*w++ = *p++) == 0) {
    80206f38:	0805                	addi	a6,a6,1
                    *w++ = 0;
    80206f3a:	85ce                	mv	a1,s3
    80206f3c:	a8d5                	j	80207030 <emake+0x39c>
            uint off2 = reloc_clus(dp, off, 1);
    80206f3e:	4605                	li	a2,1
    80206f40:	85e2                	mv	a1,s8
    80206f42:	855a                	mv	a0,s6
    80206f44:	fffff097          	auipc	ra,0xfffff
    80206f48:	460080e7          	jalr	1120(ra) # 802063a4 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80206f4c:	02000793          	li	a5,32
    80206f50:	0005071b          	sext.w	a4,a0
    80206f54:	f7040693          	addi	a3,s0,-144
    80206f58:	864e                	mv	a2,s3
    80206f5a:	4585                	li	a1,1
    80206f5c:	10cb2503          	lw	a0,268(s6)
    80206f60:	fffff097          	auipc	ra,0xfffff
    80206f64:	54c080e7          	jalr	1356(ra) # 802064ac <rw_clus>
            off += sizeof(de);
    80206f68:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    80206f6c:	1bcd                	addi	s7,s7,-13
    80206f6e:	03505163          	blez	s5,80206f90 <emake+0x2fc>
            if ((de.lne.order = i) == entcnt) {
    80206f72:	0ffaf793          	zext.b	a5,s5
    80206f76:	fafd86e3          	beq	s11,a5,80206f22 <emake+0x28e>
    80206f7a:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    80206f7e:	3afd                	addiw	s5,s5,-1
    80206f80:	885e                	mv	a6,s7
    80206f82:	4709                	li	a4,2
            int end = 0;
    80206f84:	854e                	mv	a0,s3
            uint8 *w = (uint8 *)de.lne.name1;
    80206f86:	f5043783          	ld	a5,-176(s0)
                switch (j) {
    80206f8a:	4315                	li	t1,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206f8c:	4e35                	li	t3,13
    80206f8e:	a851                	j	80207022 <emake+0x38e>
    80206f90:	020c8c9b          	addiw	s9,s9,32
            off += sizeof(de);
    80206f94:	4781                	li	a5,0
    80206f96:	f4843703          	ld	a4,-184(s0)
    80206f9a:	00e05663          	blez	a4,80206fa6 <emake+0x312>
    80206f9e:	f4442783          	lw	a5,-188(s0)
    80206fa2:	0057979b          	slliw	a5,a5,0x5
    80206fa6:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    80206faa:	02000613          	li	a2,32
    80206fae:	4581                	li	a1,0
    80206fb0:	f7040493          	addi	s1,s0,-144
    80206fb4:	8526                	mv	a0,s1
    80206fb6:	ffff9097          	auipc	ra,0xffff9
    80206fba:	7ac080e7          	jalr	1964(ra) # 80200762 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    80206fbe:	462d                	li	a2,11
    80206fc0:	f6040593          	addi	a1,s0,-160
    80206fc4:	8526                	mv	a0,s1
    80206fc6:	ffffa097          	auipc	ra,0xffffa
    80206fca:	8b0080e7          	jalr	-1872(ra) # 80200876 <strncpy>
        de.sne.attr = ep->attribute;
    80206fce:	100d4783          	lbu	a5,256(s10)
    80206fd2:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    80206fd6:	104d2783          	lw	a5,260(s10)
    80206fda:	0107d71b          	srliw	a4,a5,0x10
    80206fde:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    80206fe2:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    80206fe6:	108d2783          	lw	a5,264(s10)
    80206fea:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206fee:	4605                	li	a2,1
    80206ff0:	85e6                	mv	a1,s9
    80206ff2:	855a                	mv	a0,s6
    80206ff4:	fffff097          	auipc	ra,0xfffff
    80206ff8:	3b0080e7          	jalr	944(ra) # 802063a4 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206ffc:	02000793          	li	a5,32
    80207000:	0005071b          	sext.w	a4,a0
    80207004:	86a6                	mv	a3,s1
    80207006:	4601                	li	a2,0
    80207008:	4585                	li	a1,1
    8020700a:	10cb2503          	lw	a0,268(s6)
    8020700e:	fffff097          	auipc	ra,0xfffff
    80207012:	49e080e7          	jalr	1182(ra) # 802064ac <rw_clus>
}
    80207016:	b325                	j	80206d3e <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80207018:	f5843783          	ld	a5,-168(s0)
    8020701c:	a011                	j	80207020 <emake+0x38c>
                switch (j) {
    8020701e:	87d2                	mv	a5,s4
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80207020:	2705                	addiw	a4,a4,1
    80207022:	fff7069b          	addiw	a3,a4,-1
                if (end) {
    80207026:	d119                	beqz	a0,80206f2c <emake+0x298>
                    *w++ = 0xff;
    80207028:	00278893          	addi	a7,a5,2
    8020702c:	864a                	mv	a2,s2
    8020702e:	85ca                	mv	a1,s2
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80207030:	00c78023          	sb	a2,0(a5)
                    *w++ = 0xff;
    80207034:	00b780a3          	sb	a1,1(a5)
                switch (j) {
    80207038:	fe6680e3          	beq	a3,t1,80207018 <emake+0x384>
    8020703c:	fe9681e3          	beq	a3,s1,8020701e <emake+0x38a>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80207040:	0007079b          	sext.w	a5,a4
    80207044:	eefe4de3          	blt	t3,a5,80206f3e <emake+0x2aa>
    80207048:	87c6                	mv	a5,a7
    8020704a:	bfd9                	j	80207020 <emake+0x38c>
        if (c == ' ') { continue; }
    8020704c:	02000793          	li	a5,32
    80207050:	e8f90ae3          	beq	s2,a5,80206ee4 <emake+0x250>
        if (c == '.') {
    80207054:	02e00793          	li	a5,46
    80207058:	eaf917e3          	bne	s2,a5,80206f06 <emake+0x272>
    8020705c:	bd35                	j	80206e98 <emake+0x204>

000000008020705e <edup>:
{
    8020705e:	1101                	addi	sp,sp,-32
    80207060:	ec06                	sd	ra,24(sp)
    80207062:	e822                	sd	s0,16(sp)
    80207064:	e426                	sd	s1,8(sp)
    80207066:	1000                	addi	s0,sp,32
    80207068:	84aa                	mv	s1,a0
    if (entry != 0) {
    8020706a:	c515                	beqz	a0,80207096 <edup+0x38>
        acquire(&ecache.lock);
    8020706c:	0001d517          	auipc	a0,0x1d
    80207070:	f2450513          	addi	a0,a0,-220 # 80223f90 <ecache>
    80207074:	ffff9097          	auipc	ra,0xffff9
    80207078:	652080e7          	jalr	1618(ra) # 802006c6 <acquire>
        entry->ref++;
    8020707c:	1184a783          	lw	a5,280(s1)
    80207080:	2785                	addiw	a5,a5,1
    80207082:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80207086:	0001d517          	auipc	a0,0x1d
    8020708a:	f0a50513          	addi	a0,a0,-246 # 80223f90 <ecache>
    8020708e:	ffff9097          	auipc	ra,0xffff9
    80207092:	68c080e7          	jalr	1676(ra) # 8020071a <release>
}
    80207096:	8526                	mv	a0,s1
    80207098:	60e2                	ld	ra,24(sp)
    8020709a:	6442                	ld	s0,16(sp)
    8020709c:	64a2                	ld	s1,8(sp)
    8020709e:	6105                	addi	sp,sp,32
    802070a0:	8082                	ret

00000000802070a2 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    802070a2:	11554783          	lbu	a5,277(a0)
    802070a6:	c3e5                	beqz	a5,80207186 <eupdate+0xe4>
{
    802070a8:	711d                	addi	sp,sp,-96
    802070aa:	ec86                	sd	ra,88(sp)
    802070ac:	e8a2                	sd	s0,80(sp)
    802070ae:	e4a6                	sd	s1,72(sp)
    802070b0:	e0ca                	sd	s2,64(sp)
    802070b2:	fc4e                	sd	s3,56(sp)
    802070b4:	1080                	addi	s0,sp,96
    802070b6:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    802070b8:	11651703          	lh	a4,278(a0)
    802070bc:	4785                	li	a5,1
    802070be:	00f70963          	beq	a4,a5,802070d0 <eupdate+0x2e>
}
    802070c2:	60e6                	ld	ra,88(sp)
    802070c4:	6446                	ld	s0,80(sp)
    802070c6:	64a6                	ld	s1,72(sp)
    802070c8:	6906                	ld	s2,64(sp)
    802070ca:	79e2                	ld	s3,56(sp)
    802070cc:	6125                	addi	sp,sp,96
    802070ce:	8082                	ret
    uint entcnt = 0;
    802070d0:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    802070d4:	4601                	li	a2,0
    802070d6:	11c52583          	lw	a1,284(a0)
    802070da:	12053503          	ld	a0,288(a0)
    802070de:	fffff097          	auipc	ra,0xfffff
    802070e2:	2c6080e7          	jalr	710(ra) # 802063a4 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    802070e6:	1204b803          	ld	a6,288(s1)
    802070ea:	4785                	li	a5,1
    802070ec:	0005071b          	sext.w	a4,a0
    802070f0:	fcc40693          	addi	a3,s0,-52
    802070f4:	4601                	li	a2,0
    802070f6:	4581                	li	a1,0
    802070f8:	10c82503          	lw	a0,268(a6)
    802070fc:	fffff097          	auipc	ra,0xfffff
    80207100:	3b0080e7          	jalr	944(ra) # 802064ac <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80207104:	fcc42583          	lw	a1,-52(s0)
    80207108:	fbf5f593          	andi	a1,a1,-65
    8020710c:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    80207110:	0055959b          	slliw	a1,a1,0x5
    80207114:	11c4a783          	lw	a5,284(s1)
    80207118:	4601                	li	a2,0
    8020711a:	9dbd                	addw	a1,a1,a5
    8020711c:	1204b503          	ld	a0,288(s1)
    80207120:	fffff097          	auipc	ra,0xfffff
    80207124:	284080e7          	jalr	644(ra) # 802063a4 <reloc_clus>
    80207128:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    8020712c:	1204b503          	ld	a0,288(s1)
    80207130:	02000793          	li	a5,32
    80207134:	874e                	mv	a4,s3
    80207136:	fa840913          	addi	s2,s0,-88
    8020713a:	86ca                	mv	a3,s2
    8020713c:	4601                	li	a2,0
    8020713e:	4581                	li	a1,0
    80207140:	10c52503          	lw	a0,268(a0)
    80207144:	fffff097          	auipc	ra,0xfffff
    80207148:	368080e7          	jalr	872(ra) # 802064ac <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    8020714c:	1044a783          	lw	a5,260(s1)
    80207150:	0107d71b          	srliw	a4,a5,0x10
    80207154:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    80207158:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    8020715c:	1084a783          	lw	a5,264(s1)
    80207160:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80207164:	1204b503          	ld	a0,288(s1)
    80207168:	02000793          	li	a5,32
    8020716c:	874e                	mv	a4,s3
    8020716e:	86ca                	mv	a3,s2
    80207170:	4601                	li	a2,0
    80207172:	4585                	li	a1,1
    80207174:	10c52503          	lw	a0,268(a0)
    80207178:	fffff097          	auipc	ra,0xfffff
    8020717c:	334080e7          	jalr	820(ra) # 802064ac <rw_clus>
    entry->dirty = 0;
    80207180:	10048aa3          	sb	zero,277(s1)
    80207184:	bf3d                	j	802070c2 <eupdate+0x20>
    80207186:	8082                	ret

0000000080207188 <eremove>:
    if (entry->valid != 1) { return; }
    80207188:	11651703          	lh	a4,278(a0)
    8020718c:	4785                	li	a5,1
    8020718e:	00f70363          	beq	a4,a5,80207194 <eremove+0xc>
    80207192:	8082                	ret
{
    80207194:	715d                	addi	sp,sp,-80
    80207196:	e486                	sd	ra,72(sp)
    80207198:	e0a2                	sd	s0,64(sp)
    8020719a:	fc26                	sd	s1,56(sp)
    8020719c:	f84a                	sd	s2,48(sp)
    8020719e:	f44e                	sd	s3,40(sp)
    802071a0:	f052                	sd	s4,32(sp)
    802071a2:	ec56                	sd	s5,24(sp)
    802071a4:	0880                	addi	s0,sp,80
    802071a6:	89aa                	mv	s3,a0
    uint entcnt = 0;
    802071a8:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    802071ac:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    802071b0:	4601                	li	a2,0
    802071b2:	85d2                	mv	a1,s4
    802071b4:	12053503          	ld	a0,288(a0)
    802071b8:	fffff097          	auipc	ra,0xfffff
    802071bc:	1ec080e7          	jalr	492(ra) # 802063a4 <reloc_clus>
    802071c0:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    802071c4:	1209b503          	ld	a0,288(s3)
    802071c8:	4785                	li	a5,1
    802071ca:	8726                	mv	a4,s1
    802071cc:	fbc40693          	addi	a3,s0,-68
    802071d0:	4601                	li	a2,0
    802071d2:	4581                	li	a1,0
    802071d4:	10c52503          	lw	a0,268(a0)
    802071d8:	fffff097          	auipc	ra,0xfffff
    802071dc:	2d4080e7          	jalr	724(ra) # 802064ac <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    802071e0:	fbc42783          	lw	a5,-68(s0)
    802071e4:	fbf7f793          	andi	a5,a5,-65
    802071e8:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    802071ec:	5795                	li	a5,-27
    802071ee:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    802071f2:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    802071f4:	fbb40a93          	addi	s5,s0,-69
    802071f8:	1209b503          	ld	a0,288(s3)
    802071fc:	4785                	li	a5,1
    802071fe:	8726                	mv	a4,s1
    80207200:	86d6                	mv	a3,s5
    80207202:	4601                	li	a2,0
    80207204:	4585                	li	a1,1
    80207206:	10c52503          	lw	a0,268(a0)
    8020720a:	fffff097          	auipc	ra,0xfffff
    8020720e:	2a2080e7          	jalr	674(ra) # 802064ac <rw_clus>
        off += 32;
    80207212:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    80207216:	4601                	li	a2,0
    80207218:	85d2                	mv	a1,s4
    8020721a:	1209b503          	ld	a0,288(s3)
    8020721e:	fffff097          	auipc	ra,0xfffff
    80207222:	186080e7          	jalr	390(ra) # 802063a4 <reloc_clus>
    80207226:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    8020722a:	0019079b          	addiw	a5,s2,1
    8020722e:	0007891b          	sext.w	s2,a5
    80207232:	fbc42703          	lw	a4,-68(s0)
    80207236:	fd2771e3          	bgeu	a4,s2,802071f8 <eremove+0x70>
    entry->valid = -1;
    8020723a:	57fd                	li	a5,-1
    8020723c:	10f99b23          	sh	a5,278(s3)
}
    80207240:	60a6                	ld	ra,72(sp)
    80207242:	6406                	ld	s0,64(sp)
    80207244:	74e2                	ld	s1,56(sp)
    80207246:	7942                	ld	s2,48(sp)
    80207248:	79a2                	ld	s3,40(sp)
    8020724a:	7a02                	ld	s4,32(sp)
    8020724c:	6ae2                	ld	s5,24(sp)
    8020724e:	6161                	addi	sp,sp,80
    80207250:	8082                	ret

0000000080207252 <etrunc>:
{
    80207252:	7179                	addi	sp,sp,-48
    80207254:	f406                	sd	ra,40(sp)
    80207256:	f022                	sd	s0,32(sp)
    80207258:	ec26                	sd	s1,24(sp)
    8020725a:	e84a                	sd	s2,16(sp)
    8020725c:	e44e                	sd	s3,8(sp)
    8020725e:	e052                	sd	s4,0(sp)
    80207260:	1800                	addi	s0,sp,48
    80207262:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80207264:	10452483          	lw	s1,260(a0)
    80207268:	ffe4871b          	addiw	a4,s1,-2
    8020726c:	100007b7          	lui	a5,0x10000
    80207270:	17d5                	addi	a5,a5,-11 # ffffff5 <_entry-0x7020000b>
    80207272:	02e7e663          	bltu	a5,a4,8020729e <etrunc+0x4c>
    80207276:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    80207278:	0004891b          	sext.w	s2,s1
    8020727c:	8526                	mv	a0,s1
    8020727e:	fffff097          	auipc	ra,0xfffff
    80207282:	eee080e7          	jalr	-274(ra) # 8020616c <read_fat>
    80207286:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    8020728a:	4581                	li	a1,0
    8020728c:	854a                	mv	a0,s2
    8020728e:	fffff097          	auipc	ra,0xfffff
    80207292:	096080e7          	jalr	150(ra) # 80206324 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80207296:	ffe4879b          	addiw	a5,s1,-2
    8020729a:	fcf9ffe3          	bgeu	s3,a5,80207278 <etrunc+0x26>
    entry->file_size = 0;
    8020729e:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    802072a2:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    802072a6:	4785                	li	a5,1
    802072a8:	10fa0aa3          	sb	a5,277(s4)
}
    802072ac:	70a2                	ld	ra,40(sp)
    802072ae:	7402                	ld	s0,32(sp)
    802072b0:	64e2                	ld	s1,24(sp)
    802072b2:	6942                	ld	s2,16(sp)
    802072b4:	69a2                	ld	s3,8(sp)
    802072b6:	6a02                	ld	s4,0(sp)
    802072b8:	6145                	addi	sp,sp,48
    802072ba:	8082                	ret

00000000802072bc <elock>:
{
    802072bc:	1141                	addi	sp,sp,-16
    802072be:	e406                	sd	ra,8(sp)
    802072c0:	e022                	sd	s0,0(sp)
    802072c2:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    802072c4:	cd19                	beqz	a0,802072e2 <elock+0x26>
    802072c6:	11852783          	lw	a5,280(a0)
    802072ca:	00f05c63          	blez	a5,802072e2 <elock+0x26>
    acquiresleep(&entry->lock);
    802072ce:	13850513          	addi	a0,a0,312
    802072d2:	ffffd097          	auipc	ra,0xffffd
    802072d6:	ac6080e7          	jalr	-1338(ra) # 80203d98 <acquiresleep>
}
    802072da:	60a2                	ld	ra,8(sp)
    802072dc:	6402                	ld	s0,0(sp)
    802072de:	0141                	addi	sp,sp,16
    802072e0:	8082                	ret
        panic("elock");
    802072e2:	00004517          	auipc	a0,0x4
    802072e6:	d1650513          	addi	a0,a0,-746 # 8020aff8 <DOMAINNAME+0xf8>
    802072ea:	ffff9097          	auipc	ra,0xffff9
    802072ee:	e5a080e7          	jalr	-422(ra) # 80200144 <panic>

00000000802072f2 <eunlock>:
{
    802072f2:	1101                	addi	sp,sp,-32
    802072f4:	ec06                	sd	ra,24(sp)
    802072f6:	e822                	sd	s0,16(sp)
    802072f8:	e426                	sd	s1,8(sp)
    802072fa:	e04a                	sd	s2,0(sp)
    802072fc:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    802072fe:	c90d                	beqz	a0,80207330 <eunlock+0x3e>
    80207300:	84aa                	mv	s1,a0
    80207302:	13850913          	addi	s2,a0,312
    80207306:	854a                	mv	a0,s2
    80207308:	ffffd097          	auipc	ra,0xffffd
    8020730c:	b2a080e7          	jalr	-1238(ra) # 80203e32 <holdingsleep>
    80207310:	c105                	beqz	a0,80207330 <eunlock+0x3e>
    80207312:	1184a783          	lw	a5,280(s1)
    80207316:	00f05d63          	blez	a5,80207330 <eunlock+0x3e>
    releasesleep(&entry->lock);
    8020731a:	854a                	mv	a0,s2
    8020731c:	ffffd097          	auipc	ra,0xffffd
    80207320:	ad2080e7          	jalr	-1326(ra) # 80203dee <releasesleep>
}
    80207324:	60e2                	ld	ra,24(sp)
    80207326:	6442                	ld	s0,16(sp)
    80207328:	64a2                	ld	s1,8(sp)
    8020732a:	6902                	ld	s2,0(sp)
    8020732c:	6105                	addi	sp,sp,32
    8020732e:	8082                	ret
        panic("eunlock");
    80207330:	00004517          	auipc	a0,0x4
    80207334:	cd050513          	addi	a0,a0,-816 # 8020b000 <DOMAINNAME+0x100>
    80207338:	ffff9097          	auipc	ra,0xffff9
    8020733c:	e0c080e7          	jalr	-500(ra) # 80200144 <panic>

0000000080207340 <eput>:
{
    80207340:	1101                	addi	sp,sp,-32
    80207342:	ec06                	sd	ra,24(sp)
    80207344:	e822                	sd	s0,16(sp)
    80207346:	e426                	sd	s1,8(sp)
    80207348:	e04a                	sd	s2,0(sp)
    8020734a:	1000                	addi	s0,sp,32
    8020734c:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    8020734e:	0001d517          	auipc	a0,0x1d
    80207352:	c4250513          	addi	a0,a0,-958 # 80223f90 <ecache>
    80207356:	ffff9097          	auipc	ra,0xffff9
    8020735a:	370080e7          	jalr	880(ra) # 802006c6 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    8020735e:	0001d797          	auipc	a5,0x1d
    80207362:	ac278793          	addi	a5,a5,-1342 # 80223e20 <root>
    80207366:	00f48a63          	beq	s1,a5,8020737a <eput+0x3a>
    8020736a:	11649783          	lh	a5,278(s1)
    8020736e:	c791                	beqz	a5,8020737a <eput+0x3a>
    80207370:	1184a703          	lw	a4,280(s1)
    80207374:	4785                	li	a5,1
    80207376:	02f70563          	beq	a4,a5,802073a0 <eput+0x60>
    entry->ref--;
    8020737a:	1184a783          	lw	a5,280(s1)
    8020737e:	37fd                	addiw	a5,a5,-1
    80207380:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    80207384:	0001d517          	auipc	a0,0x1d
    80207388:	c0c50513          	addi	a0,a0,-1012 # 80223f90 <ecache>
    8020738c:	ffff9097          	auipc	ra,0xffff9
    80207390:	38e080e7          	jalr	910(ra) # 8020071a <release>
}
    80207394:	60e2                	ld	ra,24(sp)
    80207396:	6442                	ld	s0,16(sp)
    80207398:	64a2                	ld	s1,8(sp)
    8020739a:	6902                	ld	s2,0(sp)
    8020739c:	6105                	addi	sp,sp,32
    8020739e:	8082                	ret
        acquiresleep(&entry->lock);
    802073a0:	13848913          	addi	s2,s1,312
    802073a4:	854a                	mv	a0,s2
    802073a6:	ffffd097          	auipc	ra,0xffffd
    802073aa:	9f2080e7          	jalr	-1550(ra) # 80203d98 <acquiresleep>
        entry->next->prev = entry->prev;
    802073ae:	1284b703          	ld	a4,296(s1)
    802073b2:	1304b783          	ld	a5,304(s1)
    802073b6:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    802073ba:	1284b703          	ld	a4,296(s1)
    802073be:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    802073c2:	0001d797          	auipc	a5,0x1d
    802073c6:	a3678793          	addi	a5,a5,-1482 # 80223df8 <fat>
    802073ca:	1507b703          	ld	a4,336(a5)
    802073ce:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    802073d2:	0001d697          	auipc	a3,0x1d
    802073d6:	a4e68693          	addi	a3,a3,-1458 # 80223e20 <root>
    802073da:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    802073de:	12973823          	sd	s1,304(a4)
        root.next = entry;
    802073e2:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    802073e6:	0001d517          	auipc	a0,0x1d
    802073ea:	baa50513          	addi	a0,a0,-1110 # 80223f90 <ecache>
    802073ee:	ffff9097          	auipc	ra,0xffff9
    802073f2:	32c080e7          	jalr	812(ra) # 8020071a <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    802073f6:	11649703          	lh	a4,278(s1)
    802073fa:	57fd                	li	a5,-1
    802073fc:	06f70863          	beq	a4,a5,8020746c <eput+0x12c>
            elock(entry->parent);
    80207400:	1204b503          	ld	a0,288(s1)
    80207404:	00000097          	auipc	ra,0x0
    80207408:	eb8080e7          	jalr	-328(ra) # 802072bc <elock>
            eupdate(entry);
    8020740c:	8526                	mv	a0,s1
    8020740e:	00000097          	auipc	ra,0x0
    80207412:	c94080e7          	jalr	-876(ra) # 802070a2 <eupdate>
            eunlock(entry->parent);
    80207416:	1204b503          	ld	a0,288(s1)
    8020741a:	00000097          	auipc	ra,0x0
    8020741e:	ed8080e7          	jalr	-296(ra) # 802072f2 <eunlock>
        releasesleep(&entry->lock);
    80207422:	854a                	mv	a0,s2
    80207424:	ffffd097          	auipc	ra,0xffffd
    80207428:	9ca080e7          	jalr	-1590(ra) # 80203dee <releasesleep>
        struct dirent *eparent = entry->parent;
    8020742c:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80207430:	0001d517          	auipc	a0,0x1d
    80207434:	b6050513          	addi	a0,a0,-1184 # 80223f90 <ecache>
    80207438:	ffff9097          	auipc	ra,0xffff9
    8020743c:	28e080e7          	jalr	654(ra) # 802006c6 <acquire>
        entry->ref--;
    80207440:	1184a783          	lw	a5,280(s1)
    80207444:	37fd                	addiw	a5,a5,-1
    80207446:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    8020744a:	0001d517          	auipc	a0,0x1d
    8020744e:	b4650513          	addi	a0,a0,-1210 # 80223f90 <ecache>
    80207452:	ffff9097          	auipc	ra,0xffff9
    80207456:	2c8080e7          	jalr	712(ra) # 8020071a <release>
        if (entry->ref == 0) {
    8020745a:	1184a783          	lw	a5,280(s1)
    8020745e:	fb9d                	bnez	a5,80207394 <eput+0x54>
            eput(eparent);
    80207460:	854a                	mv	a0,s2
    80207462:	00000097          	auipc	ra,0x0
    80207466:	ede080e7          	jalr	-290(ra) # 80207340 <eput>
    8020746a:	b72d                	j	80207394 <eput+0x54>
            etrunc(entry);
    8020746c:	8526                	mv	a0,s1
    8020746e:	00000097          	auipc	ra,0x0
    80207472:	de4080e7          	jalr	-540(ra) # 80207252 <etrunc>
    80207476:	b775                	j	80207422 <eput+0xe2>

0000000080207478 <estat>:
{
    80207478:	1101                	addi	sp,sp,-32
    8020747a:	ec06                	sd	ra,24(sp)
    8020747c:	e822                	sd	s0,16(sp)
    8020747e:	e426                	sd	s1,8(sp)
    80207480:	e04a                	sd	s2,0(sp)
    80207482:	1000                	addi	s0,sp,32
    80207484:	892a                	mv	s2,a0
    80207486:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    80207488:	02000613          	li	a2,32
    8020748c:	85aa                	mv	a1,a0
    8020748e:	8526                	mv	a0,s1
    80207490:	ffff9097          	auipc	ra,0xffff9
    80207494:	3e6080e7          	jalr	998(ra) # 80200876 <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    80207498:	10094783          	lbu	a5,256(s2)
    8020749c:	8bc1                	andi	a5,a5,16
    8020749e:	0017b793          	seqz	a5,a5
    802074a2:	0785                	addi	a5,a5,1
    802074a4:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    802074a8:	11494783          	lbu	a5,276(s2)
    802074ac:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    802074ae:	10896783          	lwu	a5,264(s2)
    802074b2:	f89c                	sd	a5,48(s1)
}
    802074b4:	60e2                	ld	ra,24(sp)
    802074b6:	6442                	ld	s0,16(sp)
    802074b8:	64a2                	ld	s1,8(sp)
    802074ba:	6902                	ld	s2,0(sp)
    802074bc:	6105                	addi	sp,sp,32
    802074be:	8082                	ret

00000000802074c0 <enext>:
{
    802074c0:	7119                	addi	sp,sp,-128
    802074c2:	fc86                	sd	ra,120(sp)
    802074c4:	f8a2                	sd	s0,112(sp)
    802074c6:	f4a6                	sd	s1,104(sp)
    802074c8:	f0ca                	sd	s2,96(sp)
    802074ca:	ecce                	sd	s3,88(sp)
    802074cc:	e8d2                	sd	s4,80(sp)
    802074ce:	e4d6                	sd	s5,72(sp)
    802074d0:	e0da                	sd	s6,64(sp)
    802074d2:	fc5e                	sd	s7,56(sp)
    802074d4:	f862                	sd	s8,48(sp)
    802074d6:	f466                	sd	s9,40(sp)
    802074d8:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    802074da:	10054783          	lbu	a5,256(a0)
    802074de:	8bc1                	andi	a5,a5,16
    802074e0:	cf95                	beqz	a5,8020751c <enext+0x5c>
    802074e2:	892a                	mv	s2,a0
    802074e4:	89ae                	mv	s3,a1
    802074e6:	84b2                	mv	s1,a2
    802074e8:	8ab6                	mv	s5,a3
    if (ep->valid)
    802074ea:	11659783          	lh	a5,278(a1)
    802074ee:	ef9d                	bnez	a5,8020752c <enext+0x6c>
    if (off % 32)
    802074f0:	01f67793          	andi	a5,a2,31
    802074f4:	e7a1                	bnez	a5,8020753c <enext+0x7c>
    if (dp->valid != 1) { return -1; }
    802074f6:	11651703          	lh	a4,278(a0)
    802074fa:	4785                	li	a5,1
    802074fc:	557d                	li	a0,-1
    802074fe:	04f70763          	beq	a4,a5,8020754c <enext+0x8c>
}
    80207502:	70e6                	ld	ra,120(sp)
    80207504:	7446                	ld	s0,112(sp)
    80207506:	74a6                	ld	s1,104(sp)
    80207508:	7906                	ld	s2,96(sp)
    8020750a:	69e6                	ld	s3,88(sp)
    8020750c:	6a46                	ld	s4,80(sp)
    8020750e:	6aa6                	ld	s5,72(sp)
    80207510:	6b06                	ld	s6,64(sp)
    80207512:	7be2                	ld	s7,56(sp)
    80207514:	7c42                	ld	s8,48(sp)
    80207516:	7ca2                	ld	s9,40(sp)
    80207518:	6109                	addi	sp,sp,128
    8020751a:	8082                	ret
        panic("enext not dir");
    8020751c:	00004517          	auipc	a0,0x4
    80207520:	aec50513          	addi	a0,a0,-1300 # 8020b008 <DOMAINNAME+0x108>
    80207524:	ffff9097          	auipc	ra,0xffff9
    80207528:	c20080e7          	jalr	-992(ra) # 80200144 <panic>
        panic("enext ep valid");
    8020752c:	00004517          	auipc	a0,0x4
    80207530:	aec50513          	addi	a0,a0,-1300 # 8020b018 <DOMAINNAME+0x118>
    80207534:	ffff9097          	auipc	ra,0xffff9
    80207538:	c10080e7          	jalr	-1008(ra) # 80200144 <panic>
        panic("enext not align");
    8020753c:	00004517          	auipc	a0,0x4
    80207540:	aec50513          	addi	a0,a0,-1300 # 8020b028 <DOMAINNAME+0x128>
    80207544:	ffff9097          	auipc	ra,0xffff9
    80207548:	c00080e7          	jalr	-1024(ra) # 80200144 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    8020754c:	10000613          	li	a2,256
    80207550:	4581                	li	a1,0
    80207552:	854e                	mv	a0,s3
    80207554:	ffff9097          	auipc	ra,0xffff9
    80207558:	20e080e7          	jalr	526(ra) # 80200762 <memset>
    int cnt = 0;
    8020755c:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    8020755e:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80207560:	f8040a13          	addi	s4,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    80207564:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    80207568:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    8020756a:	a03d                	j	80207598 <enext+0xd8>
            cnt++;
    8020756c:	2b05                	addiw	s6,s6,1
            continue;
    8020756e:	a01d                	j	80207594 <enext+0xd4>
            *count = cnt;
    80207570:	016aa023          	sw	s6,0(s5)
            return 0;
    80207574:	4501                	li	a0,0
    80207576:	b771                	j	80207502 <enext+0x42>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    80207578:	fff7079b          	addiw	a5,a4,-1
    8020757c:	0017951b          	slliw	a0,a5,0x1
    80207580:	9d3d                	addw	a0,a0,a5
    80207582:	0025151b          	slliw	a0,a0,0x2
    80207586:	9d3d                	addw	a0,a0,a5
    80207588:	85d2                	mv	a1,s4
    8020758a:	954e                	add	a0,a0,s3
    8020758c:	fffff097          	auipc	ra,0xfffff
    80207590:	17a080e7          	jalr	378(ra) # 80206706 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80207594:	0204849b          	addiw	s1,s1,32
    80207598:	4601                	li	a2,0
    8020759a:	85a6                	mv	a1,s1
    8020759c:	854a                	mv	a0,s2
    8020759e:	fffff097          	auipc	ra,0xfffff
    802075a2:	e06080e7          	jalr	-506(ra) # 802063a4 <reloc_clus>
    802075a6:	f5750ee3          	beq	a0,s7,80207502 <enext+0x42>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    802075aa:	02000793          	li	a5,32
    802075ae:	0005071b          	sext.w	a4,a0
    802075b2:	86d2                	mv	a3,s4
    802075b4:	4601                	li	a2,0
    802075b6:	4581                	li	a1,0
    802075b8:	10c92503          	lw	a0,268(s2)
    802075bc:	fffff097          	auipc	ra,0xfffff
    802075c0:	ef0080e7          	jalr	-272(ra) # 802064ac <rw_clus>
    802075c4:	2501                	sext.w	a0,a0
    802075c6:	02000793          	li	a5,32
    802075ca:	06f51c63          	bne	a0,a5,80207642 <enext+0x182>
    802075ce:	f8044783          	lbu	a5,-128(s0)
    802075d2:	cbb5                	beqz	a5,80207646 <enext+0x186>
        if (de.lne.order == EMPTY_ENTRY) {
    802075d4:	f9878ce3          	beq	a5,s8,8020756c <enext+0xac>
        } else if (cnt) {
    802075d8:	f80b1ce3          	bnez	s6,80207570 <enext+0xb0>
        if (de.lne.attr == ATTR_LONG_NAME) {
    802075dc:	f8b44703          	lbu	a4,-117(s0)
    802075e0:	01971d63          	bne	a4,s9,802075fa <enext+0x13a>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    802075e4:	0bf7f713          	andi	a4,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    802075e8:	0407f793          	andi	a5,a5,64
    802075ec:	d7d1                	beqz	a5,80207578 <enext+0xb8>
                *count = lcnt + 1;                              // plus the s-n-e;
    802075ee:	0017079b          	addiw	a5,a4,1
    802075f2:	00faa023          	sw	a5,0(s5)
                count = 0;
    802075f6:	4a81                	li	s5,0
    802075f8:	b741                	j	80207578 <enext+0xb8>
            if (count) {
    802075fa:	000a8c63          	beqz	s5,80207612 <enext+0x152>
                *count = 1;
    802075fe:	4785                	li	a5,1
    80207600:	00faa023          	sw	a5,0(s5)
                read_entry_name(ep->filename, &de);
    80207604:	f8040593          	addi	a1,s0,-128
    80207608:	854e                	mv	a0,s3
    8020760a:	fffff097          	auipc	ra,0xfffff
    8020760e:	0fc080e7          	jalr	252(ra) # 80206706 <read_entry_name>
    entry->attribute = d->sne.attr;
    80207612:	f8b44783          	lbu	a5,-117(s0)
    80207616:	10f98023          	sb	a5,256(s3)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    8020761a:	f9445783          	lhu	a5,-108(s0)
    8020761e:	0107979b          	slliw	a5,a5,0x10
    80207622:	f9a45703          	lhu	a4,-102(s0)
    80207626:	8fd9                	or	a5,a5,a4
    80207628:	2781                	sext.w	a5,a5
    8020762a:	10f9a223          	sw	a5,260(s3)
    entry->file_size = d->sne.file_size;
    8020762e:	f9c42703          	lw	a4,-100(s0)
    80207632:	10e9a423          	sw	a4,264(s3)
    entry->cur_clus = entry->first_clus;
    80207636:	10f9a623          	sw	a5,268(s3)
    entry->clus_cnt = 0;
    8020763a:	1009a823          	sw	zero,272(s3)
            return 1;
    8020763e:	4505                	li	a0,1
}
    80207640:	b5c9                	j	80207502 <enext+0x42>
            return -1;
    80207642:	557d                	li	a0,-1
    80207644:	bd7d                	j	80207502 <enext+0x42>
    80207646:	557d                	li	a0,-1
    80207648:	bd6d                	j	80207502 <enext+0x42>

000000008020764a <dirlookup>:
{
    8020764a:	711d                	addi	sp,sp,-96
    8020764c:	ec86                	sd	ra,88(sp)
    8020764e:	e8a2                	sd	s0,80(sp)
    80207650:	e4a6                	sd	s1,72(sp)
    80207652:	e0ca                	sd	s2,64(sp)
    80207654:	fc4e                	sd	s3,56(sp)
    80207656:	f852                	sd	s4,48(sp)
    80207658:	f456                	sd	s5,40(sp)
    8020765a:	f05a                	sd	s6,32(sp)
    8020765c:	ec5e                	sd	s7,24(sp)
    8020765e:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    80207660:	10054783          	lbu	a5,256(a0)
    80207664:	8bc1                	andi	a5,a5,16
    80207666:	cbb1                	beqz	a5,802076ba <dirlookup+0x70>
    80207668:	84aa                	mv	s1,a0
    8020766a:	89ae                	mv	s3,a1
    8020766c:	8ab2                	mv	s5,a2
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    8020766e:	0ff00613          	li	a2,255
    80207672:	00004597          	auipc	a1,0x4
    80207676:	9de58593          	addi	a1,a1,-1570 # 8020b050 <DOMAINNAME+0x150>
    8020767a:	854e                	mv	a0,s3
    8020767c:	ffff9097          	auipc	ra,0xffff9
    80207680:	1be080e7          	jalr	446(ra) # 8020083a <strncmp>
    80207684:	c139                	beqz	a0,802076ca <dirlookup+0x80>
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    80207686:	0ff00613          	li	a2,255
    8020768a:	00004597          	auipc	a1,0x4
    8020768e:	9ce58593          	addi	a1,a1,-1586 # 8020b058 <DOMAINNAME+0x158>
    80207692:	854e                	mv	a0,s3
    80207694:	ffff9097          	auipc	ra,0xffff9
    80207698:	1a6080e7          	jalr	422(ra) # 8020083a <strncmp>
    8020769c:	e125                	bnez	a0,802076fc <dirlookup+0xb2>
        if (dp == &root) {
    8020769e:	0001c797          	auipc	a5,0x1c
    802076a2:	78278793          	addi	a5,a5,1922 # 80223e20 <root>
    802076a6:	04f48463          	beq	s1,a5,802076ee <dirlookup+0xa4>
        return edup(dp->parent);
    802076aa:	1204b503          	ld	a0,288(s1)
    802076ae:	00000097          	auipc	ra,0x0
    802076b2:	9b0080e7          	jalr	-1616(ra) # 8020705e <edup>
    802076b6:	892a                	mv	s2,a0
    802076b8:	a839                	j	802076d6 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    802076ba:	00004517          	auipc	a0,0x4
    802076be:	97e50513          	addi	a0,a0,-1666 # 8020b038 <DOMAINNAME+0x138>
    802076c2:	ffff9097          	auipc	ra,0xffff9
    802076c6:	a82080e7          	jalr	-1406(ra) # 80200144 <panic>
        return edup(dp);
    802076ca:	8526                	mv	a0,s1
    802076cc:	00000097          	auipc	ra,0x0
    802076d0:	992080e7          	jalr	-1646(ra) # 8020705e <edup>
    802076d4:	892a                	mv	s2,a0
}
    802076d6:	854a                	mv	a0,s2
    802076d8:	60e6                	ld	ra,88(sp)
    802076da:	6446                	ld	s0,80(sp)
    802076dc:	64a6                	ld	s1,72(sp)
    802076de:	6906                	ld	s2,64(sp)
    802076e0:	79e2                	ld	s3,56(sp)
    802076e2:	7a42                	ld	s4,48(sp)
    802076e4:	7aa2                	ld	s5,40(sp)
    802076e6:	7b02                	ld	s6,32(sp)
    802076e8:	6be2                	ld	s7,24(sp)
    802076ea:	6125                	addi	sp,sp,96
    802076ec:	8082                	ret
            return edup(&root);
    802076ee:	853e                	mv	a0,a5
    802076f0:	00000097          	auipc	ra,0x0
    802076f4:	96e080e7          	jalr	-1682(ra) # 8020705e <edup>
    802076f8:	892a                	mv	s2,a0
    802076fa:	bff1                	j	802076d6 <dirlookup+0x8c>
    if (dp->valid != 1) {
    802076fc:	11649703          	lh	a4,278(s1)
    80207700:	4785                	li	a5,1
        return NULL;
    80207702:	4901                	li	s2,0
    if (dp->valid != 1) {
    80207704:	fcf719e3          	bne	a4,a5,802076d6 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    80207708:	85ce                	mv	a1,s3
    8020770a:	8526                	mv	a0,s1
    8020770c:	fffff097          	auipc	ra,0xfffff
    80207710:	eec080e7          	jalr	-276(ra) # 802065f8 <eget>
    80207714:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    80207716:	11651703          	lh	a4,278(a0)
    8020771a:	4785                	li	a5,1
    8020771c:	faf70de3          	beq	a4,a5,802076d6 <dirlookup+0x8c>
    int len = strlen(filename);
    80207720:	854e                	mv	a0,s3
    80207722:	ffff9097          	auipc	ra,0xffff9
    80207726:	1c4080e7          	jalr	452(ra) # 802008e6 <strlen>
    int count = 0;
    8020772a:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    8020772e:	4601                	li	a2,0
    80207730:	4581                	li	a1,0
    80207732:	8526                	mv	a0,s1
    80207734:	fffff097          	auipc	ra,0xfffff
    80207738:	c70080e7          	jalr	-912(ra) # 802063a4 <reloc_clus>
    uint off = 0;
    8020773c:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    8020773e:	fac40b93          	addi	s7,s0,-84
    80207742:	5b7d                	li	s6,-1
    80207744:	86de                	mv	a3,s7
    80207746:	8652                	mv	a2,s4
    80207748:	85ca                	mv	a1,s2
    8020774a:	8526                	mv	a0,s1
    8020774c:	00000097          	auipc	ra,0x0
    80207750:	d74080e7          	jalr	-652(ra) # 802074c0 <enext>
    80207754:	03650f63          	beq	a0,s6,80207792 <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    80207758:	0ff00613          	li	a2,255
    8020775c:	85ca                	mv	a1,s2
    8020775e:	854e                	mv	a0,s3
    80207760:	ffff9097          	auipc	ra,0xffff9
    80207764:	0da080e7          	jalr	218(ra) # 8020083a <strncmp>
    80207768:	c901                	beqz	a0,80207778 <dirlookup+0x12e>
        off += count << 5;
    8020776a:	fac42783          	lw	a5,-84(s0)
    8020776e:	0057979b          	slliw	a5,a5,0x5
    80207772:	01478a3b          	addw	s4,a5,s4
    80207776:	b7f9                	j	80207744 <dirlookup+0xfa>
            ep->parent = edup(dp);
    80207778:	8526                	mv	a0,s1
    8020777a:	00000097          	auipc	ra,0x0
    8020777e:	8e4080e7          	jalr	-1820(ra) # 8020705e <edup>
    80207782:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    80207786:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    8020778a:	4785                	li	a5,1
    8020778c:	10f91b23          	sh	a5,278(s2)
            return ep;
    80207790:	b799                	j	802076d6 <dirlookup+0x8c>
    if (poff) {
    80207792:	000a8463          	beqz	s5,8020779a <dirlookup+0x150>
        *poff = off;
    80207796:	014aa023          	sw	s4,0(s5)
    eput(ep);
    8020779a:	854a                	mv	a0,s2
    8020779c:	00000097          	auipc	ra,0x0
    802077a0:	ba4080e7          	jalr	-1116(ra) # 80207340 <eput>
    return NULL;
    802077a4:	4901                	li	s2,0
    802077a6:	bf05                	j	802076d6 <dirlookup+0x8c>

00000000802077a8 <ealloc>:
{
    802077a8:	715d                	addi	sp,sp,-80
    802077aa:	e486                	sd	ra,72(sp)
    802077ac:	e0a2                	sd	s0,64(sp)
    802077ae:	fc26                	sd	s1,56(sp)
    802077b0:	f84a                	sd	s2,48(sp)
    802077b2:	f44e                	sd	s3,40(sp)
    802077b4:	f052                	sd	s4,32(sp)
    802077b6:	ec56                	sd	s5,24(sp)
    802077b8:	0880                	addi	s0,sp,80
    802077ba:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    802077bc:	10054783          	lbu	a5,256(a0)
    802077c0:	8bc1                	andi	a5,a5,16
    802077c2:	c7b1                	beqz	a5,8020780e <ealloc+0x66>
    802077c4:	852e                	mv	a0,a1
    802077c6:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    802077c8:	11691703          	lh	a4,278(s2)
    802077cc:	4785                	li	a5,1
        return NULL;
    802077ce:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    802077d0:	02f71563          	bne	a4,a5,802077fa <ealloc+0x52>
    802077d4:	fffff097          	auipc	ra,0xfffff
    802077d8:	408080e7          	jalr	1032(ra) # 80206bdc <formatname>
    802077dc:	89aa                	mv	s3,a0
    802077de:	10050663          	beqz	a0,802078ea <ealloc+0x142>
    uint off = 0;
    802077e2:	fa042e23          	sw	zero,-68(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    802077e6:	fbc40613          	addi	a2,s0,-68
    802077ea:	85aa                	mv	a1,a0
    802077ec:	854a                	mv	a0,s2
    802077ee:	00000097          	auipc	ra,0x0
    802077f2:	e5c080e7          	jalr	-420(ra) # 8020764a <dirlookup>
    802077f6:	84aa                	mv	s1,a0
    802077f8:	c11d                	beqz	a0,8020781e <ealloc+0x76>
}
    802077fa:	8526                	mv	a0,s1
    802077fc:	60a6                	ld	ra,72(sp)
    802077fe:	6406                	ld	s0,64(sp)
    80207800:	74e2                	ld	s1,56(sp)
    80207802:	7942                	ld	s2,48(sp)
    80207804:	79a2                	ld	s3,40(sp)
    80207806:	7a02                	ld	s4,32(sp)
    80207808:	6ae2                	ld	s5,24(sp)
    8020780a:	6161                	addi	sp,sp,80
    8020780c:	8082                	ret
        panic("ealloc not dir");
    8020780e:	00004517          	auipc	a0,0x4
    80207812:	85250513          	addi	a0,a0,-1966 # 8020b060 <DOMAINNAME+0x160>
    80207816:	ffff9097          	auipc	ra,0xffff9
    8020781a:	92e080e7          	jalr	-1746(ra) # 80200144 <panic>
    ep = eget(dp, name);
    8020781e:	85ce                	mv	a1,s3
    80207820:	854a                	mv	a0,s2
    80207822:	fffff097          	auipc	ra,0xfffff
    80207826:	dd6080e7          	jalr	-554(ra) # 802065f8 <eget>
    8020782a:	84aa                	mv	s1,a0
    elock(ep);
    8020782c:	00000097          	auipc	ra,0x0
    80207830:	a90080e7          	jalr	-1392(ra) # 802072bc <elock>
    ep->attribute = attr;
    80207834:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    80207838:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    8020783c:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    80207840:	854a                	mv	a0,s2
    80207842:	00000097          	auipc	ra,0x0
    80207846:	81c080e7          	jalr	-2020(ra) # 8020705e <edup>
    8020784a:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    8020784e:	fbc42a83          	lw	s5,-68(s0)
    80207852:	1154ae23          	sw	s5,284(s1)
    ep->clus_cnt = 0;
    80207856:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    8020785a:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    8020785e:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    80207862:	0ff00613          	li	a2,255
    80207866:	85ce                	mv	a1,s3
    80207868:	8526                	mv	a0,s1
    8020786a:	ffff9097          	auipc	ra,0xffff9
    8020786e:	00c080e7          	jalr	12(ra) # 80200876 <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    80207872:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    80207876:	47c1                	li	a5,16
    80207878:	02fa0863          	beq	s4,a5,802078a8 <ealloc+0x100>
        ep->attribute |= ATTR_ARCHIVE;
    8020787c:	1004c783          	lbu	a5,256(s1)
    80207880:	0207e793          	ori	a5,a5,32
    80207884:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    80207888:	8656                	mv	a2,s5
    8020788a:	85a6                	mv	a1,s1
    8020788c:	854a                	mv	a0,s2
    8020788e:	fffff097          	auipc	ra,0xfffff
    80207892:	406080e7          	jalr	1030(ra) # 80206c94 <emake>
    ep->valid = 1;
    80207896:	4785                	li	a5,1
    80207898:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    8020789c:	8526                	mv	a0,s1
    8020789e:	00000097          	auipc	ra,0x0
    802078a2:	a54080e7          	jalr	-1452(ra) # 802072f2 <eunlock>
    return ep;
    802078a6:	bf91                	j	802077fa <ealloc+0x52>
        ep->attribute |= ATTR_DIRECTORY;
    802078a8:	1004c783          	lbu	a5,256(s1)
    802078ac:	0107e793          	ori	a5,a5,16
    802078b0:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    802078b4:	11494503          	lbu	a0,276(s2)
    802078b8:	fffff097          	auipc	ra,0xfffff
    802078bc:	92a080e7          	jalr	-1750(ra) # 802061e2 <alloc_clus>
    802078c0:	2501                	sext.w	a0,a0
    802078c2:	10a4a223          	sw	a0,260(s1)
    802078c6:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    802078ca:	4601                	li	a2,0
    802078cc:	85a6                	mv	a1,s1
    802078ce:	8526                	mv	a0,s1
    802078d0:	fffff097          	auipc	ra,0xfffff
    802078d4:	3c4080e7          	jalr	964(ra) # 80206c94 <emake>
        emake(ep, dp, 32);
    802078d8:	02000613          	li	a2,32
    802078dc:	85ca                	mv	a1,s2
    802078de:	8526                	mv	a0,s1
    802078e0:	fffff097          	auipc	ra,0xfffff
    802078e4:	3b4080e7          	jalr	948(ra) # 80206c94 <emake>
    802078e8:	b745                	j	80207888 <ealloc+0xe0>
        return NULL;
    802078ea:	84aa                	mv	s1,a0
    802078ec:	b739                	j	802077fa <ealloc+0x52>

00000000802078ee <lookup_path>:
}


// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    802078ee:	7139                	addi	sp,sp,-64
    802078f0:	fc06                	sd	ra,56(sp)
    802078f2:	f822                	sd	s0,48(sp)
    802078f4:	f426                	sd	s1,40(sp)
    802078f6:	f04a                	sd	s2,32(sp)
    802078f8:	ec4e                	sd	s3,24(sp)
    802078fa:	e852                	sd	s4,16(sp)
    802078fc:	e456                	sd	s5,8(sp)
    802078fe:	0080                	addi	s0,sp,64
    80207900:	892a                	mv	s2,a0
    80207902:	8aae                	mv	s5,a1
    80207904:	8a32                	mv	s4,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    80207906:	00054783          	lbu	a5,0(a0)
    8020790a:	02f00713          	li	a4,47
    8020790e:	00e78f63          	beq	a5,a4,8020792c <lookup_path+0x3e>
        entry = edup(&root);
    } else if (*path != '\0') {
    80207912:	c79d                	beqz	a5,80207940 <lookup_path+0x52>
        entry = edup(myproc()->cwd);
    80207914:	ffffa097          	auipc	ra,0xffffa
    80207918:	1a2080e7          	jalr	418(ra) # 80201ab6 <myproc>
    8020791c:	15853503          	ld	a0,344(a0)
    80207920:	fffff097          	auipc	ra,0xfffff
    80207924:	73e080e7          	jalr	1854(ra) # 8020705e <edup>
    80207928:	84aa                	mv	s1,a0
    8020792a:	a071                	j	802079b6 <lookup_path+0xc8>
        entry = edup(&root);
    8020792c:	0001c517          	auipc	a0,0x1c
    80207930:	4f450513          	addi	a0,a0,1268 # 80223e20 <root>
    80207934:	fffff097          	auipc	ra,0xfffff
    80207938:	72a080e7          	jalr	1834(ra) # 8020705e <edup>
    8020793c:	84aa                	mv	s1,a0
    8020793e:	a8a5                	j	802079b6 <lookup_path+0xc8>
    } else {
        printf("ERROR:LOOKUP_PATH:    NAME?\n");
    80207940:	00003517          	auipc	a0,0x3
    80207944:	73050513          	addi	a0,a0,1840 # 8020b070 <DOMAINNAME+0x170>
    80207948:	ffff9097          	auipc	ra,0xffff9
    8020794c:	846080e7          	jalr	-1978(ra) # 8020018e <printf>
        return NULL;
    80207950:	4481                	li	s1,0
    80207952:	a025                	j	8020797a <lookup_path+0x8c>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    80207954:	8526                	mv	a0,s1
    80207956:	00000097          	auipc	ra,0x0
    8020795a:	99c080e7          	jalr	-1636(ra) # 802072f2 <eunlock>
            eput(entry);
    8020795e:	8526                	mv	a0,s1
    80207960:	00000097          	auipc	ra,0x0
    80207964:	9e0080e7          	jalr	-1568(ra) # 80207340 <eput>
            printf("ERROR:LOOKUP_PATH:    attribute\n");
    80207968:	00003517          	auipc	a0,0x3
    8020796c:	72850513          	addi	a0,a0,1832 # 8020b090 <DOMAINNAME+0x190>
    80207970:	ffff9097          	auipc	ra,0xffff9
    80207974:	81e080e7          	jalr	-2018(ra) # 8020018e <printf>
            return NULL;
    80207978:	4481                	li	s1,0
        printf("ERROR:LOOKUP_PATH:    Parent\n");
        eput(entry);
        return NULL;
    }
    return entry;
}
    8020797a:	8526                	mv	a0,s1
    8020797c:	70e2                	ld	ra,56(sp)
    8020797e:	7442                	ld	s0,48(sp)
    80207980:	74a2                	ld	s1,40(sp)
    80207982:	7902                	ld	s2,32(sp)
    80207984:	69e2                	ld	s3,24(sp)
    80207986:	6a42                	ld	s4,16(sp)
    80207988:	6aa2                	ld	s5,8(sp)
    8020798a:	6121                	addi	sp,sp,64
    8020798c:	8082                	ret
        if ((next = dirlookup(entry, name, 0)) == 0) {///////////???????????
    8020798e:	4601                	li	a2,0
    80207990:	85d2                	mv	a1,s4
    80207992:	8526                	mv	a0,s1
    80207994:	00000097          	auipc	ra,0x0
    80207998:	cb6080e7          	jalr	-842(ra) # 8020764a <dirlookup>
    8020799c:	89aa                	mv	s3,a0
    8020799e:	c921                	beqz	a0,802079ee <lookup_path+0x100>
        eunlock(entry);
    802079a0:	8526                	mv	a0,s1
    802079a2:	00000097          	auipc	ra,0x0
    802079a6:	950080e7          	jalr	-1712(ra) # 802072f2 <eunlock>
        eput(entry);
    802079aa:	8526                	mv	a0,s1
    802079ac:	00000097          	auipc	ra,0x0
    802079b0:	994080e7          	jalr	-1644(ra) # 80207340 <eput>
        entry = next;
    802079b4:	84ce                	mv	s1,s3
    while ((path = skipelem(path, name)) != 0) {
    802079b6:	85d2                	mv	a1,s4
    802079b8:	854a                	mv	a0,s2
    802079ba:	ffffe097          	auipc	ra,0xffffe
    802079be:	724080e7          	jalr	1828(ra) # 802060de <skipelem>
    802079c2:	892a                	mv	s2,a0
    802079c4:	c929                	beqz	a0,80207a16 <lookup_path+0x128>
        elock(entry);
    802079c6:	8526                	mv	a0,s1
    802079c8:	00000097          	auipc	ra,0x0
    802079cc:	8f4080e7          	jalr	-1804(ra) # 802072bc <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    802079d0:	1004c783          	lbu	a5,256(s1)
    802079d4:	8bc1                	andi	a5,a5,16
    802079d6:	dfbd                	beqz	a5,80207954 <lookup_path+0x66>
        if (parent && *path == '\0') {
    802079d8:	fa0a8be3          	beqz	s5,8020798e <lookup_path+0xa0>
    802079dc:	00094783          	lbu	a5,0(s2)
    802079e0:	f7dd                	bnez	a5,8020798e <lookup_path+0xa0>
            eunlock(entry);
    802079e2:	8526                	mv	a0,s1
    802079e4:	00000097          	auipc	ra,0x0
    802079e8:	90e080e7          	jalr	-1778(ra) # 802072f2 <eunlock>
            return entry;
    802079ec:	b779                	j	8020797a <lookup_path+0x8c>
            eunlock(entry);
    802079ee:	8526                	mv	a0,s1
    802079f0:	00000097          	auipc	ra,0x0
    802079f4:	902080e7          	jalr	-1790(ra) # 802072f2 <eunlock>
            eput(entry);
    802079f8:	8526                	mv	a0,s1
    802079fa:	00000097          	auipc	ra,0x0
    802079fe:	946080e7          	jalr	-1722(ra) # 80207340 <eput>
            printf("ERROR:LOOKUP_PATH:    next=0\n");
    80207a02:	00003517          	auipc	a0,0x3
    80207a06:	6b650513          	addi	a0,a0,1718 # 8020b0b8 <DOMAINNAME+0x1b8>
    80207a0a:	ffff8097          	auipc	ra,0xffff8
    80207a0e:	784080e7          	jalr	1924(ra) # 8020018e <printf>
            return NULL;
    80207a12:	84ce                	mv	s1,s3
    80207a14:	b79d                	j	8020797a <lookup_path+0x8c>
    if (parent) {
    80207a16:	f60a82e3          	beqz	s5,8020797a <lookup_path+0x8c>
        printf("ERROR:LOOKUP_PATH:    Parent\n");
    80207a1a:	00003517          	auipc	a0,0x3
    80207a1e:	6be50513          	addi	a0,a0,1726 # 8020b0d8 <DOMAINNAME+0x1d8>
    80207a22:	ffff8097          	auipc	ra,0xffff8
    80207a26:	76c080e7          	jalr	1900(ra) # 8020018e <printf>
        eput(entry);
    80207a2a:	8526                	mv	a0,s1
    80207a2c:	00000097          	auipc	ra,0x0
    80207a30:	914080e7          	jalr	-1772(ra) # 80207340 <eput>
        return NULL;
    80207a34:	84ca                	mv	s1,s2
    80207a36:	b791                	j	8020797a <lookup_path+0x8c>

0000000080207a38 <abs_lookup_path>:
{
    80207a38:	7139                	addi	sp,sp,-64
    80207a3a:	fc06                	sd	ra,56(sp)
    80207a3c:	f822                	sd	s0,48(sp)
    80207a3e:	f426                	sd	s1,40(sp)
    80207a40:	f04a                	sd	s2,32(sp)
    80207a42:	ec4e                	sd	s3,24(sp)
    80207a44:	e852                	sd	s4,16(sp)
    80207a46:	e456                	sd	s5,8(sp)
    80207a48:	0080                	addi	s0,sp,64
    80207a4a:	892e                	mv	s2,a1
    80207a4c:	8ab2                	mv	s5,a2
    80207a4e:	8a36                	mv	s4,a3
    entry = edup(env);
    80207a50:	fffff097          	auipc	ra,0xfffff
    80207a54:	60e080e7          	jalr	1550(ra) # 8020705e <edup>
    80207a58:	84aa                	mv	s1,a0
    while ((path = skipelem(path, name)) != 0) {
    80207a5a:	a891                	j	80207aae <abs_lookup_path+0x76>
            eunlock(entry);
    80207a5c:	8526                	mv	a0,s1
    80207a5e:	00000097          	auipc	ra,0x0
    80207a62:	894080e7          	jalr	-1900(ra) # 802072f2 <eunlock>
            eput(entry);
    80207a66:	8526                	mv	a0,s1
    80207a68:	00000097          	auipc	ra,0x0
    80207a6c:	8d8080e7          	jalr	-1832(ra) # 80207340 <eput>
            return NULL;
    80207a70:	4481                	li	s1,0
}
    80207a72:	8526                	mv	a0,s1
    80207a74:	70e2                	ld	ra,56(sp)
    80207a76:	7442                	ld	s0,48(sp)
    80207a78:	74a2                	ld	s1,40(sp)
    80207a7a:	7902                	ld	s2,32(sp)
    80207a7c:	69e2                	ld	s3,24(sp)
    80207a7e:	6a42                	ld	s4,16(sp)
    80207a80:	6aa2                	ld	s5,8(sp)
    80207a82:	6121                	addi	sp,sp,64
    80207a84:	8082                	ret
        if ((next = dirlookup(entry, name, 0)) == 0) {
    80207a86:	4601                	li	a2,0
    80207a88:	85d2                	mv	a1,s4
    80207a8a:	8526                	mv	a0,s1
    80207a8c:	00000097          	auipc	ra,0x0
    80207a90:	bbe080e7          	jalr	-1090(ra) # 8020764a <dirlookup>
    80207a94:	89aa                	mv	s3,a0
    80207a96:	c921                	beqz	a0,80207ae6 <abs_lookup_path+0xae>
        eunlock(entry);
    80207a98:	8526                	mv	a0,s1
    80207a9a:	00000097          	auipc	ra,0x0
    80207a9e:	858080e7          	jalr	-1960(ra) # 802072f2 <eunlock>
        eput(entry);
    80207aa2:	8526                	mv	a0,s1
    80207aa4:	00000097          	auipc	ra,0x0
    80207aa8:	89c080e7          	jalr	-1892(ra) # 80207340 <eput>
        entry = next;
    80207aac:	84ce                	mv	s1,s3
    while ((path = skipelem(path, name)) != 0) {
    80207aae:	85d2                	mv	a1,s4
    80207ab0:	854a                	mv	a0,s2
    80207ab2:	ffffe097          	auipc	ra,0xffffe
    80207ab6:	62c080e7          	jalr	1580(ra) # 802060de <skipelem>
    80207aba:	892a                	mv	s2,a0
    80207abc:	c129                	beqz	a0,80207afe <abs_lookup_path+0xc6>
        elock(entry);
    80207abe:	8526                	mv	a0,s1
    80207ac0:	fffff097          	auipc	ra,0xfffff
    80207ac4:	7fc080e7          	jalr	2044(ra) # 802072bc <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    80207ac8:	1004c783          	lbu	a5,256(s1)
    80207acc:	8bc1                	andi	a5,a5,16
    80207ace:	d7d9                	beqz	a5,80207a5c <abs_lookup_path+0x24>
        if (parent && *path == '\0') {
    80207ad0:	fa0a8be3          	beqz	s5,80207a86 <abs_lookup_path+0x4e>
    80207ad4:	00094783          	lbu	a5,0(s2)
    80207ad8:	f7dd                	bnez	a5,80207a86 <abs_lookup_path+0x4e>
            eunlock(entry);
    80207ada:	8526                	mv	a0,s1
    80207adc:	00000097          	auipc	ra,0x0
    80207ae0:	816080e7          	jalr	-2026(ra) # 802072f2 <eunlock>
            return entry;
    80207ae4:	b779                	j	80207a72 <abs_lookup_path+0x3a>
            eunlock(entry);
    80207ae6:	8526                	mv	a0,s1
    80207ae8:	00000097          	auipc	ra,0x0
    80207aec:	80a080e7          	jalr	-2038(ra) # 802072f2 <eunlock>
            eput(entry);
    80207af0:	8526                	mv	a0,s1
    80207af2:	00000097          	auipc	ra,0x0
    80207af6:	84e080e7          	jalr	-1970(ra) # 80207340 <eput>
            return NULL;
    80207afa:	84ce                	mv	s1,s3
    80207afc:	bf9d                	j	80207a72 <abs_lookup_path+0x3a>
    if (parent) {
    80207afe:	f60a8ae3          	beqz	s5,80207a72 <abs_lookup_path+0x3a>
        eput(entry);
    80207b02:	8526                	mv	a0,s1
    80207b04:	00000097          	auipc	ra,0x0
    80207b08:	83c080e7          	jalr	-1988(ra) # 80207340 <eput>
        return NULL;
    80207b0c:	84ca                	mv	s1,s2
    80207b0e:	b795                	j	80207a72 <abs_lookup_path+0x3a>

0000000080207b10 <ename>:

struct dirent *ename(char *path)
{
    80207b10:	716d                	addi	sp,sp,-272
    80207b12:	e606                	sd	ra,264(sp)
    80207b14:	e222                	sd	s0,256(sp)
    80207b16:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    80207b18:	ef040613          	addi	a2,s0,-272
    80207b1c:	4581                	li	a1,0
    80207b1e:	00000097          	auipc	ra,0x0
    80207b22:	dd0080e7          	jalr	-560(ra) # 802078ee <lookup_path>
}
    80207b26:	60b2                	ld	ra,264(sp)
    80207b28:	6412                	ld	s0,256(sp)
    80207b2a:	6151                	addi	sp,sp,272
    80207b2c:	8082                	ret

0000000080207b2e <ename_env>:

struct dirent *ename_env(struct dirent* env,char* path)
{
    80207b2e:	716d                	addi	sp,sp,-272
    80207b30:	e606                	sd	ra,264(sp)
    80207b32:	e222                	sd	s0,256(sp)
    80207b34:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return abs_lookup_path(env, path, 0, name); 
    80207b36:	ef040693          	addi	a3,s0,-272
    80207b3a:	4601                	li	a2,0
    80207b3c:	00000097          	auipc	ra,0x0
    80207b40:	efc080e7          	jalr	-260(ra) # 80207a38 <abs_lookup_path>
}
    80207b44:	60b2                	ld	ra,264(sp)
    80207b46:	6412                	ld	s0,256(sp)
    80207b48:	6151                	addi	sp,sp,272
    80207b4a:	8082                	ret

0000000080207b4c <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    80207b4c:	1141                	addi	sp,sp,-16
    80207b4e:	e406                	sd	ra,8(sp)
    80207b50:	e022                	sd	s0,0(sp)
    80207b52:	0800                	addi	s0,sp,16
    80207b54:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    80207b56:	4585                	li	a1,1
    80207b58:	00000097          	auipc	ra,0x0
    80207b5c:	d96080e7          	jalr	-618(ra) # 802078ee <lookup_path>
}
    80207b60:	60a2                	ld	ra,8(sp)
    80207b62:	6402                	ld	s0,0(sp)
    80207b64:	0141                	addi	sp,sp,16
    80207b66:	8082                	ret

0000000080207b68 <enameparent_env>:

struct dirent *enameparent_env(struct dirent* env, char* path, char* name)
{
    80207b68:	1141                	addi	sp,sp,-16
    80207b6a:	e406                	sd	ra,8(sp)
    80207b6c:	e022                	sd	s0,0(sp)
    80207b6e:	0800                	addi	s0,sp,16
    80207b70:	86b2                	mv	a3,a2
    return abs_lookup_path(env, path, 1, name);
    80207b72:	4605                	li	a2,1
    80207b74:	00000097          	auipc	ra,0x0
    80207b78:	ec4080e7          	jalr	-316(ra) # 80207a38 <abs_lookup_path>
}
    80207b7c:	60a2                	ld	ra,8(sp)
    80207b7e:	6402                	ld	s0,0(sp)
    80207b80:	0141                	addi	sp,sp,16
    80207b82:	8082                	ret

0000000080207b84 <paddr>:


uint64 paddr(struct dirent *ep)
{
    80207b84:	1141                	addi	sp,sp,-16
    80207b86:	e422                	sd	s0,8(sp)
    80207b88:	0800                	addi	s0,sp,16
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80207b8a:	0001c697          	auipc	a3,0x1c
    80207b8e:	26e68693          	addi	a3,a3,622 # 80223df8 <fat>
    80207b92:	0126c603          	lbu	a2,18(a3)
    uint32 lba = first_sec_of_clus(ep->first_clus);
    uint32 byts_per_clus = fat.bpb.byts_per_sec * fat.bpb.sec_per_clus;
    80207b96:	0106d703          	lhu	a4,16(a3)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80207b9a:	10452783          	lw	a5,260(a0)
    80207b9e:	37f9                	addiw	a5,a5,-2
    80207ba0:	02c787bb          	mulw	a5,a5,a2
    80207ba4:	4294                	lw	a3,0(a3)
    80207ba6:	9fb5                	addw	a5,a5,a3
    return lba * fat.bpb.byts_per_sec + ep->off % byts_per_clus;
    80207ba8:	02e787bb          	mulw	a5,a5,a4
    uint32 byts_per_clus = fat.bpb.byts_per_sec * fat.bpb.sec_per_clus;
    80207bac:	02c7073b          	mulw	a4,a4,a2
    return lba * fat.bpb.byts_per_sec + ep->off % byts_per_clus;
    80207bb0:	11c52683          	lw	a3,284(a0)
    80207bb4:	02e6f73b          	remuw	a4,a3,a4
    80207bb8:	00e7853b          	addw	a0,a5,a4
}
    80207bbc:	1502                	slli	a0,a0,0x20
    80207bbe:	9101                	srli	a0,a0,0x20
    80207bc0:	6422                	ld	s0,8(sp)
    80207bc2:	0141                	addi	sp,sp,16
    80207bc4:	8082                	ret

0000000080207bc6 <eroot>:
struct dirent *eroot()
{
    80207bc6:	1141                	addi	sp,sp,-16
    80207bc8:	e422                	sd	s0,8(sp)
    80207bca:	0800                	addi	s0,sp,16
    return &root;
}
    80207bcc:	0001c517          	auipc	a0,0x1c
    80207bd0:	25450513          	addi	a0,a0,596 # 80223e20 <root>
    80207bd4:	6422                	ld	s0,8(sp)
    80207bd6:	0141                	addi	sp,sp,16
    80207bd8:	8082                	ret

0000000080207bda <mount>:

uint64 mount(struct dirent *dev, struct dirent *mnt){
    80207bda:	7139                	addi	sp,sp,-64
    80207bdc:	fc06                	sd	ra,56(sp)
    80207bde:	f822                	sd	s0,48(sp)
    80207be0:	f426                	sd	s1,40(sp)
    80207be2:	f04a                	sd	s2,32(sp)
    80207be4:	ec4e                	sd	s3,24(sp)
    80207be6:	e852                	sd	s4,16(sp)
    80207be8:	e456                	sd	s5,8(sp)
    80207bea:	0080                	addi	s0,sp,64
    80207bec:	89ae                	mv	s3,a1
    int idx = 0;
    while (devs[idx].vaild != 0){
    80207bee:	00021497          	auipc	s1,0x21
    80207bf2:	bca4a483          	lw	s1,-1078(s1) # 802287b8 <devs+0x28>
    80207bf6:	c48d                	beqz	s1,80207c20 <mount+0x46>
    int idx = 0;
    80207bf8:	4481                	li	s1,0
    while (devs[idx].vaild != 0){
    80207bfa:	00021697          	auipc	a3,0x21
    80207bfe:	b9668693          	addi	a3,a3,-1130 # 80228790 <devs>
    80207c02:	1a800713          	li	a4,424
          idx++;
    80207c06:	2485                	addiw	s1,s1,1
          idx = idx % 8;
    80207c08:	41f4d79b          	sraiw	a5,s1,0x1f
    80207c0c:	01d7d79b          	srliw	a5,a5,0x1d
    80207c10:	9cbd                	addw	s1,s1,a5
    80207c12:	889d                	andi	s1,s1,7
    80207c14:	9c9d                	subw	s1,s1,a5
    while (devs[idx].vaild != 0){
    80207c16:	02e487b3          	mul	a5,s1,a4
    80207c1a:	97b6                	add	a5,a5,a3
    80207c1c:	579c                	lw	a5,40(a5)
    80207c1e:	f7e5                	bnez	a5,80207c06 <mount+0x2c>
      }
    struct buf *b = bread(dev->dev, 0);
    80207c20:	4581                	li	a1,0
    80207c22:	11454503          	lbu	a0,276(a0)
    80207c26:	ffffc097          	auipc	ra,0xffffc
    80207c2a:	ef6080e7          	jalr	-266(ra) # 80203b1c <bread>
    80207c2e:	8a2a                	mv	s4,a0
    if (strncmp((char const *)(b->data + 82), "FAT32", 5))
    80207c30:	4615                	li	a2,5
    80207c32:	00003597          	auipc	a1,0x3
    80207c36:	33658593          	addi	a1,a1,822 # 8020af68 <DOMAINNAME+0x68>
    80207c3a:	0aa50513          	addi	a0,a0,170
    80207c3e:	ffff9097          	auipc	ra,0xffff9
    80207c42:	bfc080e7          	jalr	-1028(ra) # 8020083a <strncmp>
    80207c46:	14051d63          	bnez	a0,80207da0 <mount+0x1c6>
        panic("not FAT32 volume");
    memmove(&devs[idx].bpb.byts_per_sec, b->data + 11, 2); // avoid misaligned load on k210
    80207c4a:	1a800a93          	li	s5,424
    80207c4e:	03548ab3          	mul	s5,s1,s5
    80207c52:	010a8513          	addi	a0,s5,16
    80207c56:	00021917          	auipc	s2,0x21
    80207c5a:	b3a90913          	addi	s2,s2,-1222 # 80228790 <devs>
    80207c5e:	4609                	li	a2,2
    80207c60:	063a0593          	addi	a1,s4,99
    80207c64:	954a                	add	a0,a0,s2
    80207c66:	ffff9097          	auipc	ra,0xffff9
    80207c6a:	b58080e7          	jalr	-1192(ra) # 802007be <memmove>
    devs[idx].bpb.sec_per_clus = *(b->data + 13);
    80207c6e:	065a4783          	lbu	a5,101(s4)
    80207c72:	9956                	add	s2,s2,s5
    80207c74:	00f90923          	sb	a5,18(s2)
    devs[idx].bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80207c78:	066a5783          	lhu	a5,102(s4)
    80207c7c:	00f91a23          	sh	a5,20(s2)
    devs[idx].bpb.fat_cnt = *(b->data + 16);
    80207c80:	068a4783          	lbu	a5,104(s4)
    80207c84:	00f90b23          	sb	a5,22(s2)
    devs[idx].bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80207c88:	074a2783          	lw	a5,116(s4)
    80207c8c:	00f92c23          	sw	a5,24(s2)
    devs[idx].bpb.tot_sec = *(uint32 *)(b->data + 32);
    80207c90:	078a2783          	lw	a5,120(s4)
    80207c94:	00f92e23          	sw	a5,28(s2)
    devs[idx].bpb.fat_sz = *(uint32 *)(b->data + 36);
    80207c98:	07ca2783          	lw	a5,124(s4)
    80207c9c:	02f92023          	sw	a5,32(s2)
    devs[idx].bpb.root_clus = *(uint32 *)(b->data + 44);
    80207ca0:	084a2783          	lw	a5,132(s4)
    80207ca4:	02f92223          	sw	a5,36(s2)
    devs[idx].first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    80207ca8:	0001c797          	auipc	a5,0x1c
    80207cac:	15078793          	addi	a5,a5,336 # 80223df8 <fat>
    80207cb0:	0167c703          	lbu	a4,22(a5)
    80207cb4:	5394                	lw	a3,32(a5)
    80207cb6:	02d7073b          	mulw	a4,a4,a3
    80207cba:	0147d683          	lhu	a3,20(a5)
    80207cbe:	9f35                	addw	a4,a4,a3
    80207cc0:	00e92023          	sw	a4,0(s2)
    devs[idx].data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80207cc4:	4fd8                	lw	a4,28(a5)
    80207cc6:	4394                	lw	a3,0(a5)
    80207cc8:	9f15                	subw	a4,a4,a3
    80207cca:	00e92223          	sw	a4,4(s2)
    devs[idx].data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80207cce:	0127c683          	lbu	a3,18(a5)
    80207cd2:	43d8                	lw	a4,4(a5)
    80207cd4:	02d7573b          	divuw	a4,a4,a3
    80207cd8:	00e92423          	sw	a4,8(s2)
    devs[idx].byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    80207cdc:	0107d783          	lhu	a5,16(a5)
    80207ce0:	02d787bb          	mulw	a5,a5,a3
    80207ce4:	00f92623          	sw	a5,12(s2)
    brelse(b);
    80207ce8:	8552                	mv	a0,s4
    80207cea:	ffffc097          	auipc	ra,0xffffc
    80207cee:	f5e080e7          	jalr	-162(ra) # 80203c48 <brelse>
    if (BSIZE != devs[idx].bpb.byts_per_sec)
    80207cf2:	01095703          	lhu	a4,16(s2)
    80207cf6:	20000793          	li	a5,512
    80207cfa:	0af71b63          	bne	a4,a5,80207db0 <mount+0x1d6>
        panic("byts_per_sec != BSIZE");
    initlock(&ecache.lock, "ecache");
    80207cfe:	00003597          	auipc	a1,0x3
    80207d02:	2a258593          	addi	a1,a1,674 # 8020afa0 <DOMAINNAME+0xa0>
    80207d06:	0001c517          	auipc	a0,0x1c
    80207d0a:	28a50513          	addi	a0,a0,650 # 80223f90 <ecache>
    80207d0e:	ffff9097          	auipc	ra,0xffff9
    80207d12:	974080e7          	jalr	-1676(ra) # 80200682 <initlock>
    memset(&devs[idx].root, 0, sizeof(devs[idx].root));
    80207d16:	030a8a93          	addi	s5,s5,48
    80207d1a:	00021917          	auipc	s2,0x21
    80207d1e:	a7690913          	addi	s2,s2,-1418 # 80228790 <devs>
    80207d22:	9aca                	add	s5,s5,s2
    80207d24:	17000613          	li	a2,368
    80207d28:	4581                	li	a1,0
    80207d2a:	8556                	mv	a0,s5
    80207d2c:	ffff9097          	auipc	ra,0xffff9
    80207d30:	a36080e7          	jalr	-1482(ra) # 80200762 <memset>
    initsleeplock(&root.lock, "entry");
    80207d34:	00003597          	auipc	a1,0x3
    80207d38:	27458593          	addi	a1,a1,628 # 8020afa8 <DOMAINNAME+0xa8>
    80207d3c:	0001c517          	auipc	a0,0x1c
    80207d40:	21c50513          	addi	a0,a0,540 # 80223f58 <root+0x138>
    80207d44:	ffffc097          	auipc	ra,0xffffc
    80207d48:	01a080e7          	jalr	26(ra) # 80203d5e <initsleeplock>
    devs[idx].root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    80207d4c:	1a800793          	li	a5,424
    80207d50:	02f487b3          	mul	a5,s1,a5
    80207d54:	97ca                	add	a5,a5,s2
    80207d56:	4751                	li	a4,20
    80207d58:	12e78823          	sb	a4,304(a5)
    devs[idx].root.first_clus = devs[idx].root.cur_clus = devs[idx].bpb.root_clus;
    80207d5c:	53d8                	lw	a4,36(a5)
    80207d5e:	12e7ae23          	sw	a4,316(a5)
    80207d62:	12e7aa23          	sw	a4,308(a5)
    devs[idx].root.valid = 1;
    80207d66:	4705                	li	a4,1
    80207d68:	14e79323          	sh	a4,326(a5)
    devs[idx].root.prev = &devs[idx].root;
    80207d6c:	1757b023          	sd	s5,352(a5)
    devs[idx].root.next = &devs[idx].root;
    80207d70:	1557bc23          	sd	s5,344(a5)
    devs[idx].root.filename[0] = '/';
    80207d74:	02f00693          	li	a3,47
    80207d78:	02d78823          	sb	a3,48(a5)
    devs[idx].root.filename[1] = '\0';
    80207d7c:	020788a3          	sb	zero,49(a5)
    devs[idx].mount_mode = 1;
    80207d80:	1ae78023          	sb	a4,416(a5)
    mnt->mount_flag = 1;
    80207d84:	16e98423          	sb	a4,360(s3)
    mnt->dev = idx;
    80207d88:	10998a23          	sb	s1,276(s3)
    return 0;
}
    80207d8c:	4501                	li	a0,0
    80207d8e:	70e2                	ld	ra,56(sp)
    80207d90:	7442                	ld	s0,48(sp)
    80207d92:	74a2                	ld	s1,40(sp)
    80207d94:	7902                	ld	s2,32(sp)
    80207d96:	69e2                	ld	s3,24(sp)
    80207d98:	6a42                	ld	s4,16(sp)
    80207d9a:	6aa2                	ld	s5,8(sp)
    80207d9c:	6121                	addi	sp,sp,64
    80207d9e:	8082                	ret
        panic("not FAT32 volume");
    80207da0:	00003517          	auipc	a0,0x3
    80207da4:	1d050513          	addi	a0,a0,464 # 8020af70 <DOMAINNAME+0x70>
    80207da8:	ffff8097          	auipc	ra,0xffff8
    80207dac:	39c080e7          	jalr	924(ra) # 80200144 <panic>
        panic("byts_per_sec != BSIZE");
    80207db0:	00003517          	auipc	a0,0x3
    80207db4:	1d850513          	addi	a0,a0,472 # 8020af88 <DOMAINNAME+0x88>
    80207db8:	ffff8097          	auipc	ra,0xffff8
    80207dbc:	38c080e7          	jalr	908(ra) # 80200144 <panic>

0000000080207dc0 <umount2>:
int umount2(struct dirent *mnt)
{
    80207dc0:	1101                	addi	sp,sp,-32
    80207dc2:	ec06                	sd	ra,24(sp)
    80207dc4:	e822                	sd	s0,16(sp)
    80207dc6:	e426                	sd	s1,8(sp)
    80207dc8:	1000                	addi	s0,sp,32
    80207dca:	84aa                	mv	s1,a0
    mnt->mount_flag = 0;
    80207dcc:	16050423          	sb	zero,360(a0)
    memset(&devs[mnt->dev], 0, sizeof(devs[mnt->dev]));
    80207dd0:	11454783          	lbu	a5,276(a0)
    80207dd4:	1a800713          	li	a4,424
    80207dd8:	02e787b3          	mul	a5,a5,a4
    80207ddc:	1a800613          	li	a2,424
    80207de0:	4581                	li	a1,0
    80207de2:	00021517          	auipc	a0,0x21
    80207de6:	9ae50513          	addi	a0,a0,-1618 # 80228790 <devs>
    80207dea:	953e                	add	a0,a0,a5
    80207dec:	ffff9097          	auipc	ra,0xffff9
    80207df0:	976080e7          	jalr	-1674(ra) # 80200762 <memset>
    mnt->dev = 0;
    80207df4:	10048a23          	sb	zero,276(s1)
    return 0;
}
    80207df8:	4501                	li	a0,0
    80207dfa:	60e2                	ld	ra,24(sp)
    80207dfc:	6442                	ld	s0,16(sp)
    80207dfe:	64a2                	ld	s1,8(sp)
    80207e00:	6105                	addi	sp,sp,32
    80207e02:	8082                	ret

0000000080207e04 <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    80207e04:	1141                	addi	sp,sp,-16
    80207e06:	e422                	sd	s0,8(sp)
    80207e08:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    80207e0a:	00fc37b7          	lui	a5,0xfc3
    80207e0e:	07ba                	slli	a5,a5,0xe
    80207e10:	4705                	li	a4,1
    80207e12:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    80207e14:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    80207e16:	6422                	ld	s0,8(sp)
    80207e18:	0141                	addi	sp,sp,16
    80207e1a:	8082                	ret

0000000080207e1c <plicinithart>:

void
plicinithart(void)
{
    80207e1c:	1141                	addi	sp,sp,-16
    80207e1e:	e406                	sd	ra,8(sp)
    80207e20:	e022                	sd	s0,0(sp)
    80207e22:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207e24:	ffffa097          	auipc	ra,0xffffa
    80207e28:	c66080e7          	jalr	-922(ra) # 80201a8a <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    80207e2c:	0085171b          	slliw	a4,a0,0x8
    80207e30:	01f867b7          	lui	a5,0x1f86
    80207e34:	0785                	addi	a5,a5,1 # 1f86001 <_entry-0x7e279fff>
    80207e36:	07b6                	slli	a5,a5,0xd
    80207e38:	97ba                	add	a5,a5,a4
    80207e3a:	40200713          	li	a4,1026
    80207e3e:	08e7a023          	sw	a4,128(a5)
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80207e42:	00d5151b          	slliw	a0,a0,0xd
    80207e46:	03f0c7b7          	lui	a5,0x3f0c
    80207e4a:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207e4e:	07b2                	slli	a5,a5,0xc
    80207e50:	97aa                	add	a5,a5,a0
    80207e52:	0007a023          	sw	zero,0(a5)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    80207e56:	60a2                	ld	ra,8(sp)
    80207e58:	6402                	ld	s0,0(sp)
    80207e5a:	0141                	addi	sp,sp,16
    80207e5c:	8082                	ret

0000000080207e5e <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80207e5e:	1141                	addi	sp,sp,-16
    80207e60:	e406                	sd	ra,8(sp)
    80207e62:	e022                	sd	s0,0(sp)
    80207e64:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207e66:	ffffa097          	auipc	ra,0xffffa
    80207e6a:	c24080e7          	jalr	-988(ra) # 80201a8a <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    80207e6e:	00d5151b          	slliw	a0,a0,0xd
    80207e72:	03f0c7b7          	lui	a5,0x3f0c
    80207e76:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207e7a:	07b2                	slli	a5,a5,0xc
    80207e7c:	97aa                	add	a5,a5,a0
  #endif
  return irq;
}
    80207e7e:	43c8                	lw	a0,4(a5)
    80207e80:	60a2                	ld	ra,8(sp)
    80207e82:	6402                	ld	s0,0(sp)
    80207e84:	0141                	addi	sp,sp,16
    80207e86:	8082                	ret

0000000080207e88 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80207e88:	1101                	addi	sp,sp,-32
    80207e8a:	ec06                	sd	ra,24(sp)
    80207e8c:	e822                	sd	s0,16(sp)
    80207e8e:	e426                	sd	s1,8(sp)
    80207e90:	1000                	addi	s0,sp,32
    80207e92:	84aa                	mv	s1,a0
  int hart = cpuid();
    80207e94:	ffffa097          	auipc	ra,0xffffa
    80207e98:	bf6080e7          	jalr	-1034(ra) # 80201a8a <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80207e9c:	00d5151b          	slliw	a0,a0,0xd
    80207ea0:	03f0c7b7          	lui	a5,0x3f0c
    80207ea4:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207ea8:	07b2                	slli	a5,a5,0xc
    80207eaa:	97aa                	add	a5,a5,a0
    80207eac:	c3c4                	sw	s1,4(a5)
  #endif
}
    80207eae:	60e2                	ld	ra,24(sp)
    80207eb0:	6442                	ld	s0,16(sp)
    80207eb2:	64a2                	ld	s1,8(sp)
    80207eb4:	6105                	addi	sp,sp,32
    80207eb6:	8082                	ret

0000000080207eb8 <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    80207eb8:	715d                	addi	sp,sp,-80
    80207eba:	e486                	sd	ra,72(sp)
    80207ebc:	e0a2                	sd	s0,64(sp)
    80207ebe:	fc26                	sd	s1,56(sp)
    80207ec0:	f84a                	sd	s2,48(sp)
    80207ec2:	f44e                	sd	s3,40(sp)
    80207ec4:	f052                	sd	s4,32(sp)
    80207ec6:	ec56                	sd	s5,24(sp)
    80207ec8:	e85a                	sd	s6,16(sp)
    80207eca:	0880                	addi	s0,sp,80
    80207ecc:	8a2a                	mv	s4,a0
    80207ece:	84ae                	mv	s1,a1
    80207ed0:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    80207ed2:	00021517          	auipc	a0,0x21
    80207ed6:	5fe50513          	addi	a0,a0,1534 # 802294d0 <cons>
    80207eda:	ffff8097          	auipc	ra,0xffff8
    80207ede:	7ec080e7          	jalr	2028(ra) # 802006c6 <acquire>
  for(i = 0; i < n; i++){
    80207ee2:	07305063          	blez	s3,80207f42 <consolewrite+0x8a>
    80207ee6:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    80207ee8:	fbf40b13          	addi	s6,s0,-65
    80207eec:	5afd                	li	s5,-1
    80207eee:	4685                	li	a3,1
    80207ef0:	8626                	mv	a2,s1
    80207ef2:	85d2                	mv	a1,s4
    80207ef4:	855a                	mv	a0,s6
    80207ef6:	ffffa097          	auipc	ra,0xffffa
    80207efa:	70c080e7          	jalr	1804(ra) # 80202602 <either_copyin>
    80207efe:	01550f63          	beq	a0,s5,80207f1c <consolewrite+0x64>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    80207f02:	fbf44503          	lbu	a0,-65(s0)
    80207f06:	4581                	li	a1,0
    80207f08:	4601                	li	a2,0
    80207f0a:	4681                	li	a3,0
    80207f0c:	4885                	li	a7,1
    80207f0e:	00000073          	ecall
  for(i = 0; i < n; i++){
    80207f12:	2905                	addiw	s2,s2,1
    80207f14:	0485                	addi	s1,s1,1
    80207f16:	fd299ce3          	bne	s3,s2,80207eee <consolewrite+0x36>
    80207f1a:	894e                	mv	s2,s3
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    80207f1c:	00021517          	auipc	a0,0x21
    80207f20:	5b450513          	addi	a0,a0,1460 # 802294d0 <cons>
    80207f24:	ffff8097          	auipc	ra,0xffff8
    80207f28:	7f6080e7          	jalr	2038(ra) # 8020071a <release>

  return i;
}
    80207f2c:	854a                	mv	a0,s2
    80207f2e:	60a6                	ld	ra,72(sp)
    80207f30:	6406                	ld	s0,64(sp)
    80207f32:	74e2                	ld	s1,56(sp)
    80207f34:	7942                	ld	s2,48(sp)
    80207f36:	79a2                	ld	s3,40(sp)
    80207f38:	7a02                	ld	s4,32(sp)
    80207f3a:	6ae2                	ld	s5,24(sp)
    80207f3c:	6b42                	ld	s6,16(sp)
    80207f3e:	6161                	addi	sp,sp,80
    80207f40:	8082                	ret
  for(i = 0; i < n; i++){
    80207f42:	4901                	li	s2,0
    80207f44:	bfe1                	j	80207f1c <consolewrite+0x64>

0000000080207f46 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80207f46:	7119                	addi	sp,sp,-128
    80207f48:	fc86                	sd	ra,120(sp)
    80207f4a:	f8a2                	sd	s0,112(sp)
    80207f4c:	f4a6                	sd	s1,104(sp)
    80207f4e:	f0ca                	sd	s2,96(sp)
    80207f50:	ecce                	sd	s3,88(sp)
    80207f52:	e8d2                	sd	s4,80(sp)
    80207f54:	e4d6                	sd	s5,72(sp)
    80207f56:	e0da                	sd	s6,64(sp)
    80207f58:	fc5e                	sd	s7,56(sp)
    80207f5a:	f862                	sd	s8,48(sp)
    80207f5c:	f466                	sd	s9,40(sp)
    80207f5e:	f06a                	sd	s10,32(sp)
    80207f60:	ec6e                	sd	s11,24(sp)
    80207f62:	0100                	addi	s0,sp,128
    80207f64:	8aaa                	mv	s5,a0
    80207f66:	8a2e                	mv	s4,a1
    80207f68:	89b2                	mv	s3,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    80207f6a:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    80207f6e:	00021517          	auipc	a0,0x21
    80207f72:	56250513          	addi	a0,a0,1378 # 802294d0 <cons>
    80207f76:	ffff8097          	auipc	ra,0xffff8
    80207f7a:	750080e7          	jalr	1872(ra) # 802006c6 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80207f7e:	00021497          	auipc	s1,0x21
    80207f82:	55248493          	addi	s1,s1,1362 # 802294d0 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    80207f86:	00021917          	auipc	s2,0x21
    80207f8a:	5e290913          	addi	s2,s2,1506 # 80229568 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80207f8e:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207f90:	f8f40d13          	addi	s10,s0,-113
    80207f94:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    80207f96:	4da9                	li	s11,10
  while(n > 0){
    80207f98:	07305763          	blez	s3,80208006 <consoleread+0xc0>
    while(cons.r == cons.w){
    80207f9c:	0984a783          	lw	a5,152(s1)
    80207fa0:	09c4a703          	lw	a4,156(s1)
    80207fa4:	02f71463          	bne	a4,a5,80207fcc <consoleread+0x86>
      if(myproc()->killed){
    80207fa8:	ffffa097          	auipc	ra,0xffffa
    80207fac:	b0e080e7          	jalr	-1266(ra) # 80201ab6 <myproc>
    80207fb0:	591c                	lw	a5,48(a0)
    80207fb2:	e7ad                	bnez	a5,8020801c <consoleread+0xd6>
      sleep(&cons.r, &cons.lock);
    80207fb4:	85a6                	mv	a1,s1
    80207fb6:	854a                	mv	a0,s2
    80207fb8:	ffffa097          	auipc	ra,0xffffa
    80207fbc:	3be080e7          	jalr	958(ra) # 80202376 <sleep>
    while(cons.r == cons.w){
    80207fc0:	0984a783          	lw	a5,152(s1)
    80207fc4:	09c4a703          	lw	a4,156(s1)
    80207fc8:	fef700e3          	beq	a4,a5,80207fa8 <consoleread+0x62>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80207fcc:	0017871b          	addiw	a4,a5,1
    80207fd0:	08e4ac23          	sw	a4,152(s1)
    80207fd4:	07f7f713          	andi	a4,a5,127
    80207fd8:	9726                	add	a4,a4,s1
    80207fda:	01874703          	lbu	a4,24(a4)
    80207fde:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    80207fe2:	078b8563          	beq	s7,s8,8020804c <consoleread+0x106>
    cbuf = c;
    80207fe6:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207fea:	4685                	li	a3,1
    80207fec:	866a                	mv	a2,s10
    80207fee:	85d2                	mv	a1,s4
    80207ff0:	8556                	mv	a0,s5
    80207ff2:	ffffa097          	auipc	ra,0xffffa
    80207ff6:	5da080e7          	jalr	1498(ra) # 802025cc <either_copyout>
    80207ffa:	01950663          	beq	a0,s9,80208006 <consoleread+0xc0>
    dst++;
    80207ffe:	0a05                	addi	s4,s4,1
    --n;
    80208000:	39fd                	addiw	s3,s3,-1
    if(c == '\n'){
    80208002:	f9bb9be3          	bne	s7,s11,80207f98 <consoleread+0x52>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    80208006:	00021517          	auipc	a0,0x21
    8020800a:	4ca50513          	addi	a0,a0,1226 # 802294d0 <cons>
    8020800e:	ffff8097          	auipc	ra,0xffff8
    80208012:	70c080e7          	jalr	1804(ra) # 8020071a <release>

  return target - n;
    80208016:	413b053b          	subw	a0,s6,s3
    8020801a:	a811                	j	8020802e <consoleread+0xe8>
        release(&cons.lock);
    8020801c:	00021517          	auipc	a0,0x21
    80208020:	4b450513          	addi	a0,a0,1204 # 802294d0 <cons>
    80208024:	ffff8097          	auipc	ra,0xffff8
    80208028:	6f6080e7          	jalr	1782(ra) # 8020071a <release>
        return -1;
    8020802c:	557d                	li	a0,-1
}
    8020802e:	70e6                	ld	ra,120(sp)
    80208030:	7446                	ld	s0,112(sp)
    80208032:	74a6                	ld	s1,104(sp)
    80208034:	7906                	ld	s2,96(sp)
    80208036:	69e6                	ld	s3,88(sp)
    80208038:	6a46                	ld	s4,80(sp)
    8020803a:	6aa6                	ld	s5,72(sp)
    8020803c:	6b06                	ld	s6,64(sp)
    8020803e:	7be2                	ld	s7,56(sp)
    80208040:	7c42                	ld	s8,48(sp)
    80208042:	7ca2                	ld	s9,40(sp)
    80208044:	7d02                	ld	s10,32(sp)
    80208046:	6de2                	ld	s11,24(sp)
    80208048:	6109                	addi	sp,sp,128
    8020804a:	8082                	ret
      if(n < target){
    8020804c:	0009871b          	sext.w	a4,s3
    80208050:	fb677be3          	bgeu	a4,s6,80208006 <consoleread+0xc0>
        cons.r--;
    80208054:	00021717          	auipc	a4,0x21
    80208058:	50f72a23          	sw	a5,1300(a4) # 80229568 <cons+0x98>
    8020805c:	b76d                	j	80208006 <consoleread+0xc0>

000000008020805e <consputc>:
void consputc(int c) {
    8020805e:	1141                	addi	sp,sp,-16
    80208060:	e422                	sd	s0,8(sp)
    80208062:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    80208064:	10000793          	li	a5,256
    80208068:	00f50b63          	beq	a0,a5,8020807e <consputc+0x20>
    8020806c:	4581                	li	a1,0
    8020806e:	4601                	li	a2,0
    80208070:	4681                	li	a3,0
    80208072:	4885                	li	a7,1
    80208074:	00000073          	ecall
}
    80208078:	6422                	ld	s0,8(sp)
    8020807a:	0141                	addi	sp,sp,16
    8020807c:	8082                	ret
    8020807e:	4521                	li	a0,8
    80208080:	4581                	li	a1,0
    80208082:	4601                	li	a2,0
    80208084:	4681                	li	a3,0
    80208086:	4885                	li	a7,1
    80208088:	00000073          	ecall
    8020808c:	02000513          	li	a0,32
    80208090:	00000073          	ecall
    80208094:	4521                	li	a0,8
    80208096:	00000073          	ecall
}
    8020809a:	bff9                	j	80208078 <consputc+0x1a>

000000008020809c <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    8020809c:	1101                	addi	sp,sp,-32
    8020809e:	ec06                	sd	ra,24(sp)
    802080a0:	e822                	sd	s0,16(sp)
    802080a2:	e426                	sd	s1,8(sp)
    802080a4:	e04a                	sd	s2,0(sp)
    802080a6:	1000                	addi	s0,sp,32
    802080a8:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    802080aa:	00021517          	auipc	a0,0x21
    802080ae:	42650513          	addi	a0,a0,1062 # 802294d0 <cons>
    802080b2:	ffff8097          	auipc	ra,0xffff8
    802080b6:	614080e7          	jalr	1556(ra) # 802006c6 <acquire>

  switch(c){
    802080ba:	47d5                	li	a5,21
    802080bc:	0af48663          	beq	s1,a5,80208168 <consoleintr+0xcc>
    802080c0:	0297ca63          	blt	a5,s1,802080f4 <consoleintr+0x58>
    802080c4:	47a1                	li	a5,8
    802080c6:	0ef48763          	beq	s1,a5,802081b4 <consoleintr+0x118>
    802080ca:	47c1                	li	a5,16
    802080cc:	10f49a63          	bne	s1,a5,802081e0 <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    802080d0:	ffffa097          	auipc	ra,0xffffa
    802080d4:	566080e7          	jalr	1382(ra) # 80202636 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    802080d8:	00021517          	auipc	a0,0x21
    802080dc:	3f850513          	addi	a0,a0,1016 # 802294d0 <cons>
    802080e0:	ffff8097          	auipc	ra,0xffff8
    802080e4:	63a080e7          	jalr	1594(ra) # 8020071a <release>
}
    802080e8:	60e2                	ld	ra,24(sp)
    802080ea:	6442                	ld	s0,16(sp)
    802080ec:	64a2                	ld	s1,8(sp)
    802080ee:	6902                	ld	s2,0(sp)
    802080f0:	6105                	addi	sp,sp,32
    802080f2:	8082                	ret
  switch(c){
    802080f4:	07f00793          	li	a5,127
    802080f8:	0af48e63          	beq	s1,a5,802081b4 <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    802080fc:	00021717          	auipc	a4,0x21
    80208100:	3d470713          	addi	a4,a4,980 # 802294d0 <cons>
    80208104:	0a072783          	lw	a5,160(a4)
    80208108:	09872703          	lw	a4,152(a4)
    8020810c:	9f99                	subw	a5,a5,a4
    8020810e:	07f00713          	li	a4,127
    80208112:	fcf763e3          	bltu	a4,a5,802080d8 <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    80208116:	47b5                	li	a5,13
    80208118:	0cf48763          	beq	s1,a5,802081e6 <consoleintr+0x14a>
      consputc(c);
    8020811c:	8526                	mv	a0,s1
    8020811e:	00000097          	auipc	ra,0x0
    80208122:	f40080e7          	jalr	-192(ra) # 8020805e <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80208126:	00021797          	auipc	a5,0x21
    8020812a:	3aa78793          	addi	a5,a5,938 # 802294d0 <cons>
    8020812e:	0a07a703          	lw	a4,160(a5)
    80208132:	0017069b          	addiw	a3,a4,1
    80208136:	0006861b          	sext.w	a2,a3
    8020813a:	0ad7a023          	sw	a3,160(a5)
    8020813e:	07f77713          	andi	a4,a4,127
    80208142:	97ba                	add	a5,a5,a4
    80208144:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    80208148:	47a9                	li	a5,10
    8020814a:	0cf48563          	beq	s1,a5,80208214 <consoleintr+0x178>
    8020814e:	4791                	li	a5,4
    80208150:	0cf48263          	beq	s1,a5,80208214 <consoleintr+0x178>
    80208154:	00021797          	auipc	a5,0x21
    80208158:	4147a783          	lw	a5,1044(a5) # 80229568 <cons+0x98>
    8020815c:	0807879b          	addiw	a5,a5,128
    80208160:	f6f61ce3          	bne	a2,a5,802080d8 <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80208164:	863e                	mv	a2,a5
    80208166:	a07d                	j	80208214 <consoleintr+0x178>
    while(cons.e != cons.w &&
    80208168:	00021717          	auipc	a4,0x21
    8020816c:	36870713          	addi	a4,a4,872 # 802294d0 <cons>
    80208170:	0a072783          	lw	a5,160(a4)
    80208174:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80208178:	00021497          	auipc	s1,0x21
    8020817c:	35848493          	addi	s1,s1,856 # 802294d0 <cons>
    while(cons.e != cons.w &&
    80208180:	4929                	li	s2,10
    80208182:	f4f70be3          	beq	a4,a5,802080d8 <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80208186:	37fd                	addiw	a5,a5,-1
    80208188:	07f7f713          	andi	a4,a5,127
    8020818c:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    8020818e:	01874703          	lbu	a4,24(a4)
    80208192:	f52703e3          	beq	a4,s2,802080d8 <consoleintr+0x3c>
      cons.e--;
    80208196:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    8020819a:	10000513          	li	a0,256
    8020819e:	00000097          	auipc	ra,0x0
    802081a2:	ec0080e7          	jalr	-320(ra) # 8020805e <consputc>
    while(cons.e != cons.w &&
    802081a6:	0a04a783          	lw	a5,160(s1)
    802081aa:	09c4a703          	lw	a4,156(s1)
    802081ae:	fcf71ce3          	bne	a4,a5,80208186 <consoleintr+0xea>
    802081b2:	b71d                	j	802080d8 <consoleintr+0x3c>
    if(cons.e != cons.w){
    802081b4:	00021717          	auipc	a4,0x21
    802081b8:	31c70713          	addi	a4,a4,796 # 802294d0 <cons>
    802081bc:	0a072783          	lw	a5,160(a4)
    802081c0:	09c72703          	lw	a4,156(a4)
    802081c4:	f0f70ae3          	beq	a4,a5,802080d8 <consoleintr+0x3c>
      cons.e--;
    802081c8:	37fd                	addiw	a5,a5,-1
    802081ca:	00021717          	auipc	a4,0x21
    802081ce:	3af72323          	sw	a5,934(a4) # 80229570 <cons+0xa0>
      consputc(BACKSPACE);
    802081d2:	10000513          	li	a0,256
    802081d6:	00000097          	auipc	ra,0x0
    802081da:	e88080e7          	jalr	-376(ra) # 8020805e <consputc>
    802081de:	bded                	j	802080d8 <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    802081e0:	ee048ce3          	beqz	s1,802080d8 <consoleintr+0x3c>
    802081e4:	bf21                	j	802080fc <consoleintr+0x60>
      consputc(c);
    802081e6:	4529                	li	a0,10
    802081e8:	00000097          	auipc	ra,0x0
    802081ec:	e76080e7          	jalr	-394(ra) # 8020805e <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802081f0:	00021797          	auipc	a5,0x21
    802081f4:	2e078793          	addi	a5,a5,736 # 802294d0 <cons>
    802081f8:	0a07a703          	lw	a4,160(a5)
    802081fc:	0017069b          	addiw	a3,a4,1
    80208200:	0006861b          	sext.w	a2,a3
    80208204:	0ad7a023          	sw	a3,160(a5)
    80208208:	07f77713          	andi	a4,a4,127
    8020820c:	97ba                	add	a5,a5,a4
    8020820e:	4729                	li	a4,10
    80208210:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    80208214:	00021797          	auipc	a5,0x21
    80208218:	34c7ac23          	sw	a2,856(a5) # 8022956c <cons+0x9c>
        wakeup(&cons.r);
    8020821c:	00021517          	auipc	a0,0x21
    80208220:	34c50513          	addi	a0,a0,844 # 80229568 <cons+0x98>
    80208224:	ffffa097          	auipc	ra,0xffffa
    80208228:	2ce080e7          	jalr	718(ra) # 802024f2 <wakeup>
    8020822c:	b575                	j	802080d8 <consoleintr+0x3c>

000000008020822e <consoleinit>:

void
consoleinit(void)
{
    8020822e:	1101                	addi	sp,sp,-32
    80208230:	ec06                	sd	ra,24(sp)
    80208232:	e822                	sd	s0,16(sp)
    80208234:	e426                	sd	s1,8(sp)
    80208236:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    80208238:	00021497          	auipc	s1,0x21
    8020823c:	29848493          	addi	s1,s1,664 # 802294d0 <cons>
    80208240:	00003597          	auipc	a1,0x3
    80208244:	eb858593          	addi	a1,a1,-328 # 8020b0f8 <DOMAINNAME+0x1f8>
    80208248:	8526                	mv	a0,s1
    8020824a:	ffff8097          	auipc	ra,0xffff8
    8020824e:	438080e7          	jalr	1080(ra) # 80200682 <initlock>

  cons.e = cons.w = cons.r = 0;
    80208252:	0804ac23          	sw	zero,152(s1)
    80208256:	0804ae23          	sw	zero,156(s1)
    8020825a:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    8020825e:	00006797          	auipc	a5,0x6
    80208262:	ab27b783          	ld	a5,-1358(a5) # 8020dd10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80208266:	00000717          	auipc	a4,0x0
    8020826a:	ce070713          	addi	a4,a4,-800 # 80207f46 <consoleread>
    8020826e:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    80208270:	00000717          	auipc	a4,0x0
    80208274:	c4870713          	addi	a4,a4,-952 # 80207eb8 <consolewrite>
    80208278:	ef98                	sd	a4,24(a5)
}
    8020827a:	60e2                	ld	ra,24(sp)
    8020827c:	6442                	ld	s0,16(sp)
    8020827e:	64a2                	ld	s1,8(sp)
    80208280:	6105                	addi	sp,sp,32
    80208282:	8082                	ret

0000000080208284 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    80208284:	1141                	addi	sp,sp,-16
    80208286:	e406                	sd	ra,8(sp)
    80208288:	e022                	sd	s0,0(sp)
    8020828a:	0800                	addi	s0,sp,16
  if(i >= NUM)
    8020828c:	479d                	li	a5,7
    8020828e:	04a7cb63          	blt	a5,a0,802082e4 <free_desc+0x60>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    80208292:	00022717          	auipc	a4,0x22
    80208296:	d6e70713          	addi	a4,a4,-658 # 8022a000 <disk>
    8020829a:	972a                	add	a4,a4,a0
    8020829c:	6789                	lui	a5,0x2
    8020829e:	97ba                	add	a5,a5,a4
    802082a0:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    802082a4:	eba1                	bnez	a5,802082f4 <free_desc+0x70>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    802082a6:	00451713          	slli	a4,a0,0x4
    802082aa:	00024797          	auipc	a5,0x24
    802082ae:	d567b783          	ld	a5,-682(a5) # 8022c000 <disk+0x2000>
    802082b2:	97ba                	add	a5,a5,a4
    802082b4:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    802082b8:	00022717          	auipc	a4,0x22
    802082bc:	d4870713          	addi	a4,a4,-696 # 8022a000 <disk>
    802082c0:	972a                	add	a4,a4,a0
    802082c2:	6789                	lui	a5,0x2
    802082c4:	97ba                	add	a5,a5,a4
    802082c6:	4705                	li	a4,1
    802082c8:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    802082cc:	00024517          	auipc	a0,0x24
    802082d0:	d4c50513          	addi	a0,a0,-692 # 8022c018 <disk+0x2018>
    802082d4:	ffffa097          	auipc	ra,0xffffa
    802082d8:	21e080e7          	jalr	542(ra) # 802024f2 <wakeup>
}
    802082dc:	60a2                	ld	ra,8(sp)
    802082de:	6402                	ld	s0,0(sp)
    802082e0:	0141                	addi	sp,sp,16
    802082e2:	8082                	ret
    panic("virtio_disk_intr 1");
    802082e4:	00003517          	auipc	a0,0x3
    802082e8:	e1c50513          	addi	a0,a0,-484 # 8020b100 <DOMAINNAME+0x200>
    802082ec:	ffff8097          	auipc	ra,0xffff8
    802082f0:	e58080e7          	jalr	-424(ra) # 80200144 <panic>
    panic("virtio_disk_intr 2");
    802082f4:	00003517          	auipc	a0,0x3
    802082f8:	e2450513          	addi	a0,a0,-476 # 8020b118 <DOMAINNAME+0x218>
    802082fc:	ffff8097          	auipc	ra,0xffff8
    80208300:	e48080e7          	jalr	-440(ra) # 80200144 <panic>

0000000080208304 <virtio_disk_init>:
{
    80208304:	1141                	addi	sp,sp,-16
    80208306:	e406                	sd	ra,8(sp)
    80208308:	e022                	sd	s0,0(sp)
    8020830a:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    8020830c:	00003597          	auipc	a1,0x3
    80208310:	e2458593          	addi	a1,a1,-476 # 8020b130 <DOMAINNAME+0x230>
    80208314:	00024517          	auipc	a0,0x24
    80208318:	d9450513          	addi	a0,a0,-620 # 8022c0a8 <disk+0x20a8>
    8020831c:	ffff8097          	auipc	ra,0xffff8
    80208320:	366080e7          	jalr	870(ra) # 80200682 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80208324:	03f107b7          	lui	a5,0x3f10
    80208328:	0785                	addi	a5,a5,1 # 3f10001 <_entry-0x7c2effff>
    8020832a:	07b2                	slli	a5,a5,0xc
    8020832c:	4398                	lw	a4,0(a5)
    8020832e:	2701                	sext.w	a4,a4
    80208330:	747277b7          	lui	a5,0x74727
    80208334:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    80208338:	12f71163          	bne	a4,a5,8020845a <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    8020833c:	00003797          	auipc	a5,0x3
    80208340:	e7c7b783          	ld	a5,-388(a5) # 8020b1b8 <DOMAINNAME+0x2b8>
    80208344:	439c                	lw	a5,0(a5)
    80208346:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80208348:	4705                	li	a4,1
    8020834a:	10e79863          	bne	a5,a4,8020845a <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    8020834e:	00003797          	auipc	a5,0x3
    80208352:	e727b783          	ld	a5,-398(a5) # 8020b1c0 <DOMAINNAME+0x2c0>
    80208356:	439c                	lw	a5,0(a5)
    80208358:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    8020835a:	4709                	li	a4,2
    8020835c:	0ee79f63          	bne	a5,a4,8020845a <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80208360:	00003797          	auipc	a5,0x3
    80208364:	e687b783          	ld	a5,-408(a5) # 8020b1c8 <DOMAINNAME+0x2c8>
    80208368:	4398                	lw	a4,0(a5)
    8020836a:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    8020836c:	554d47b7          	lui	a5,0x554d4
    80208370:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    80208374:	0ef71363          	bne	a4,a5,8020845a <virtio_disk_init+0x156>
  *R(VIRTIO_MMIO_STATUS) = status;
    80208378:	00003797          	auipc	a5,0x3
    8020837c:	e587b783          	ld	a5,-424(a5) # 8020b1d0 <DOMAINNAME+0x2d0>
    80208380:	4705                	li	a4,1
    80208382:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80208384:	470d                	li	a4,3
    80208386:	c398                	sw	a4,0(a5)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80208388:	00003717          	auipc	a4,0x3
    8020838c:	e5073703          	ld	a4,-432(a4) # 8020b1d8 <DOMAINNAME+0x2d8>
    80208390:	4318                	lw	a4,0(a4)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80208392:	c7ffe6b7          	lui	a3,0xc7ffe
    80208396:	75f68693          	addi	a3,a3,1887 # ffffffffc7ffe75f <ebss_clear+0xffffffff47dd175f>
    8020839a:	8f75                	and	a4,a4,a3
    8020839c:	00003697          	auipc	a3,0x3
    802083a0:	e446b683          	ld	a3,-444(a3) # 8020b1e0 <DOMAINNAME+0x2e0>
    802083a4:	c298                	sw	a4,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    802083a6:	472d                	li	a4,11
    802083a8:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    802083aa:	473d                	li	a4,15
    802083ac:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    802083ae:	00003797          	auipc	a5,0x3
    802083b2:	e3a7b783          	ld	a5,-454(a5) # 8020b1e8 <DOMAINNAME+0x2e8>
    802083b6:	6705                	lui	a4,0x1
    802083b8:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    802083ba:	00003797          	auipc	a5,0x3
    802083be:	e367b783          	ld	a5,-458(a5) # 8020b1f0 <DOMAINNAME+0x2f0>
    802083c2:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    802083c6:	00003797          	auipc	a5,0x3
    802083ca:	e327b783          	ld	a5,-462(a5) # 8020b1f8 <DOMAINNAME+0x2f8>
    802083ce:	439c                	lw	a5,0(a5)
    802083d0:	2781                	sext.w	a5,a5
  if(max == 0)
    802083d2:	cfc1                	beqz	a5,8020846a <virtio_disk_init+0x166>
  if(max < NUM)
    802083d4:	471d                	li	a4,7
    802083d6:	0af77263          	bgeu	a4,a5,8020847a <virtio_disk_init+0x176>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    802083da:	00003797          	auipc	a5,0x3
    802083de:	e267b783          	ld	a5,-474(a5) # 8020b200 <DOMAINNAME+0x300>
    802083e2:	4721                	li	a4,8
    802083e4:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    802083e6:	6609                	lui	a2,0x2
    802083e8:	4581                	li	a1,0
    802083ea:	00022517          	auipc	a0,0x22
    802083ee:	c1650513          	addi	a0,a0,-1002 # 8022a000 <disk>
    802083f2:	ffff8097          	auipc	ra,0xffff8
    802083f6:	370080e7          	jalr	880(ra) # 80200762 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    802083fa:	00022717          	auipc	a4,0x22
    802083fe:	c0670713          	addi	a4,a4,-1018 # 8022a000 <disk>
    80208402:	00c75793          	srli	a5,a4,0xc
    80208406:	2781                	sext.w	a5,a5
    80208408:	00003697          	auipc	a3,0x3
    8020840c:	e006b683          	ld	a3,-512(a3) # 8020b208 <DOMAINNAME+0x308>
    80208410:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    80208412:	00024797          	auipc	a5,0x24
    80208416:	bee78793          	addi	a5,a5,-1042 # 8022c000 <disk+0x2000>
    8020841a:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    8020841c:	00022717          	auipc	a4,0x22
    80208420:	c6470713          	addi	a4,a4,-924 # 8022a080 <disk+0x80>
    80208424:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    80208426:	00023717          	auipc	a4,0x23
    8020842a:	bda70713          	addi	a4,a4,-1062 # 8022b000 <disk+0x1000>
    8020842e:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    80208430:	4705                	li	a4,1
    80208432:	00e78c23          	sb	a4,24(a5)
    80208436:	00e78ca3          	sb	a4,25(a5)
    8020843a:	00e78d23          	sb	a4,26(a5)
    8020843e:	00e78da3          	sb	a4,27(a5)
    80208442:	00e78e23          	sb	a4,28(a5)
    80208446:	00e78ea3          	sb	a4,29(a5)
    8020844a:	00e78f23          	sb	a4,30(a5)
    8020844e:	00e78fa3          	sb	a4,31(a5)
}
    80208452:	60a2                	ld	ra,8(sp)
    80208454:	6402                	ld	s0,0(sp)
    80208456:	0141                	addi	sp,sp,16
    80208458:	8082                	ret
    panic("could not find virtio disk");
    8020845a:	00003517          	auipc	a0,0x3
    8020845e:	ce650513          	addi	a0,a0,-794 # 8020b140 <DOMAINNAME+0x240>
    80208462:	ffff8097          	auipc	ra,0xffff8
    80208466:	ce2080e7          	jalr	-798(ra) # 80200144 <panic>
    panic("virtio disk has no queue 0");
    8020846a:	00003517          	auipc	a0,0x3
    8020846e:	cf650513          	addi	a0,a0,-778 # 8020b160 <DOMAINNAME+0x260>
    80208472:	ffff8097          	auipc	ra,0xffff8
    80208476:	cd2080e7          	jalr	-814(ra) # 80200144 <panic>
    panic("virtio disk max queue too short");
    8020847a:	00003517          	auipc	a0,0x3
    8020847e:	d0650513          	addi	a0,a0,-762 # 8020b180 <DOMAINNAME+0x280>
    80208482:	ffff8097          	auipc	ra,0xffff8
    80208486:	cc2080e7          	jalr	-830(ra) # 80200144 <panic>

000000008020848a <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    8020848a:	7175                	addi	sp,sp,-144
    8020848c:	e506                	sd	ra,136(sp)
    8020848e:	e122                	sd	s0,128(sp)
    80208490:	fca6                	sd	s1,120(sp)
    80208492:	f8ca                	sd	s2,112(sp)
    80208494:	f4ce                	sd	s3,104(sp)
    80208496:	f0d2                	sd	s4,96(sp)
    80208498:	ecd6                	sd	s5,88(sp)
    8020849a:	e8da                	sd	s6,80(sp)
    8020849c:	e4de                	sd	s7,72(sp)
    8020849e:	e0e2                	sd	s8,64(sp)
    802084a0:	fc66                	sd	s9,56(sp)
    802084a2:	f86a                	sd	s10,48(sp)
    802084a4:	f46e                	sd	s11,40(sp)
    802084a6:	0900                	addi	s0,sp,144
    802084a8:	8aaa                	mv	s5,a0
    802084aa:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    802084ac:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    802084b0:	00024517          	auipc	a0,0x24
    802084b4:	bf850513          	addi	a0,a0,-1032 # 8022c0a8 <disk+0x20a8>
    802084b8:	ffff8097          	auipc	ra,0xffff8
    802084bc:	20e080e7          	jalr	526(ra) # 802006c6 <acquire>
  for(int i = 0; i < 3; i++){
    802084c0:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    802084c2:	44a1                	li	s1,8
      disk.free[i] = 0;
    802084c4:	00022c17          	auipc	s8,0x22
    802084c8:	b3cc0c13          	addi	s8,s8,-1220 # 8022a000 <disk>
    802084cc:	6b89                	lui	s7,0x2
  for(int i = 0; i < 3; i++){
    802084ce:	4b0d                	li	s6,3
    802084d0:	a0ad                	j	8020853a <virtio_disk_rw+0xb0>
      disk.free[i] = 0;
    802084d2:	00fc0733          	add	a4,s8,a5
    802084d6:	975e                	add	a4,a4,s7
    802084d8:	00070c23          	sb	zero,24(a4)
    idx[i] = alloc_desc();
    802084dc:	c19c                	sw	a5,0(a1)
    if(idx[i] < 0){
    802084de:	0207c563          	bltz	a5,80208508 <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    802084e2:	2905                	addiw	s2,s2,1
    802084e4:	0611                	addi	a2,a2,4 # 2004 <_entry-0x801fdffc>
    802084e6:	19690e63          	beq	s2,s6,80208682 <virtio_disk_rw+0x1f8>
    idx[i] = alloc_desc();
    802084ea:	85b2                	mv	a1,a2
  for(int i = 0; i < NUM; i++){
    802084ec:	00024717          	auipc	a4,0x24
    802084f0:	b2c70713          	addi	a4,a4,-1236 # 8022c018 <disk+0x2018>
    802084f4:	87ce                	mv	a5,s3
    if(disk.free[i]){
    802084f6:	00074683          	lbu	a3,0(a4)
    802084fa:	fee1                	bnez	a3,802084d2 <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    802084fc:	2785                	addiw	a5,a5,1
    802084fe:	0705                	addi	a4,a4,1
    80208500:	fe979be3          	bne	a5,s1,802084f6 <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    80208504:	57fd                	li	a5,-1
    80208506:	c19c                	sw	a5,0(a1)
      for(int j = 0; j < i; j++)
    80208508:	01205d63          	blez	s2,80208522 <virtio_disk_rw+0x98>
    8020850c:	8dce                	mv	s11,s3
        free_desc(idx[j]);
    8020850e:	000a2503          	lw	a0,0(s4)
    80208512:	00000097          	auipc	ra,0x0
    80208516:	d72080e7          	jalr	-654(ra) # 80208284 <free_desc>
      for(int j = 0; j < i; j++)
    8020851a:	2d85                	addiw	s11,s11,1
    8020851c:	0a11                	addi	s4,s4,4
    8020851e:	ff2d98e3          	bne	s11,s2,8020850e <virtio_disk_rw+0x84>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80208522:	00024597          	auipc	a1,0x24
    80208526:	b8658593          	addi	a1,a1,-1146 # 8022c0a8 <disk+0x20a8>
    8020852a:	00024517          	auipc	a0,0x24
    8020852e:	aee50513          	addi	a0,a0,-1298 # 8022c018 <disk+0x2018>
    80208532:	ffffa097          	auipc	ra,0xffffa
    80208536:	e44080e7          	jalr	-444(ra) # 80202376 <sleep>
  for(int i = 0; i < 3; i++){
    8020853a:	f8040a13          	addi	s4,s0,-128
{
    8020853e:	8652                	mv	a2,s4
  for(int i = 0; i < 3; i++){
    80208540:	894e                	mv	s2,s3
    80208542:	b765                	j	802084ea <virtio_disk_rw+0x60>
  disk.desc[idx[0]].next = idx[1];

  disk.desc[idx[1]].addr = (uint64) b->data;
  disk.desc[idx[1]].len = BSIZE;
  if(write)
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80208544:	00024717          	auipc	a4,0x24
    80208548:	abc73703          	ld	a4,-1348(a4) # 8022c000 <disk+0x2000>
    8020854c:	973e                	add	a4,a4,a5
    8020854e:	00071623          	sh	zero,12(a4)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80208552:	00022517          	auipc	a0,0x22
    80208556:	aae50513          	addi	a0,a0,-1362 # 8022a000 <disk>
    8020855a:	00024717          	auipc	a4,0x24
    8020855e:	aa670713          	addi	a4,a4,-1370 # 8022c000 <disk+0x2000>
    80208562:	6314                	ld	a3,0(a4)
    80208564:	96be                	add	a3,a3,a5
    80208566:	00c6d603          	lhu	a2,12(a3)
    8020856a:	00166613          	ori	a2,a2,1
    8020856e:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    80208572:	f8842683          	lw	a3,-120(s0)
    80208576:	6310                	ld	a2,0(a4)
    80208578:	97b2                	add	a5,a5,a2
    8020857a:	00d79723          	sh	a3,14(a5)

  disk.info[idx[0]].status = 0;
    8020857e:	20048613          	addi	a2,s1,512
    80208582:	0612                	slli	a2,a2,0x4
    80208584:	962a                	add	a2,a2,a0
    80208586:	02060823          	sb	zero,48(a2)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    8020858a:	00469793          	slli	a5,a3,0x4
    8020858e:	630c                	ld	a1,0(a4)
    80208590:	95be                	add	a1,a1,a5
    80208592:	6689                	lui	a3,0x2
    80208594:	03068693          	addi	a3,a3,48 # 2030 <_entry-0x801fdfd0>
    80208598:	96ca                	add	a3,a3,s2
    8020859a:	96aa                	add	a3,a3,a0
    8020859c:	e194                	sd	a3,0(a1)
  disk.desc[idx[2]].len = 1;
    8020859e:	6314                	ld	a3,0(a4)
    802085a0:	96be                	add	a3,a3,a5
    802085a2:	4585                	li	a1,1
    802085a4:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    802085a6:	6314                	ld	a3,0(a4)
    802085a8:	96be                	add	a3,a3,a5
    802085aa:	4509                	li	a0,2
    802085ac:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    802085b0:	6314                	ld	a3,0(a4)
    802085b2:	97b6                	add	a5,a5,a3
    802085b4:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    802085b8:	00baa223          	sw	a1,4(s5)
  disk.info[idx[0]].b = b;
    802085bc:	03563423          	sd	s5,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    802085c0:	6714                	ld	a3,8(a4)
    802085c2:	0026d783          	lhu	a5,2(a3)
    802085c6:	8b9d                	andi	a5,a5,7
    802085c8:	0789                	addi	a5,a5,2
    802085ca:	0786                	slli	a5,a5,0x1
    802085cc:	96be                	add	a3,a3,a5
    802085ce:	00969023          	sh	s1,0(a3)
  __sync_synchronize();
    802085d2:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    802085d6:	6718                	ld	a4,8(a4)
    802085d8:	00275783          	lhu	a5,2(a4)
    802085dc:	2785                	addiw	a5,a5,1
    802085de:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    802085e2:	00003797          	auipc	a5,0x3
    802085e6:	c2e7b783          	ld	a5,-978(a5) # 8020b210 <DOMAINNAME+0x310>
    802085ea:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    802085ee:	004aa783          	lw	a5,4(s5)
    802085f2:	02b79163          	bne	a5,a1,80208614 <virtio_disk_rw+0x18a>
    sleep(b, &disk.vdisk_lock);
    802085f6:	00024917          	auipc	s2,0x24
    802085fa:	ab290913          	addi	s2,s2,-1358 # 8022c0a8 <disk+0x20a8>
  while(b->disk == 1) {
    802085fe:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    80208600:	85ca                	mv	a1,s2
    80208602:	8556                	mv	a0,s5
    80208604:	ffffa097          	auipc	ra,0xffffa
    80208608:	d72080e7          	jalr	-654(ra) # 80202376 <sleep>
  while(b->disk == 1) {
    8020860c:	004aa783          	lw	a5,4(s5)
    80208610:	fe9788e3          	beq	a5,s1,80208600 <virtio_disk_rw+0x176>
  }

  disk.info[idx[0]].b = 0;
    80208614:	f8042483          	lw	s1,-128(s0)
    80208618:	20048713          	addi	a4,s1,512
    8020861c:	0712                	slli	a4,a4,0x4
    8020861e:	00022797          	auipc	a5,0x22
    80208622:	9e278793          	addi	a5,a5,-1566 # 8022a000 <disk>
    80208626:	97ba                	add	a5,a5,a4
    80208628:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    8020862c:	00024917          	auipc	s2,0x24
    80208630:	9d490913          	addi	s2,s2,-1580 # 8022c000 <disk+0x2000>
    80208634:	a019                	j	8020863a <virtio_disk_rw+0x1b0>
      i = disk.desc[i].next;
    80208636:	00e7d483          	lhu	s1,14(a5)
    free_desc(i);
    8020863a:	8526                	mv	a0,s1
    8020863c:	00000097          	auipc	ra,0x0
    80208640:	c48080e7          	jalr	-952(ra) # 80208284 <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80208644:	0492                	slli	s1,s1,0x4
    80208646:	00093783          	ld	a5,0(s2)
    8020864a:	97a6                	add	a5,a5,s1
    8020864c:	00c7d703          	lhu	a4,12(a5)
    80208650:	8b05                	andi	a4,a4,1
    80208652:	f375                	bnez	a4,80208636 <virtio_disk_rw+0x1ac>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    80208654:	00024517          	auipc	a0,0x24
    80208658:	a5450513          	addi	a0,a0,-1452 # 8022c0a8 <disk+0x20a8>
    8020865c:	ffff8097          	auipc	ra,0xffff8
    80208660:	0be080e7          	jalr	190(ra) # 8020071a <release>
}
    80208664:	60aa                	ld	ra,136(sp)
    80208666:	640a                	ld	s0,128(sp)
    80208668:	74e6                	ld	s1,120(sp)
    8020866a:	7946                	ld	s2,112(sp)
    8020866c:	79a6                	ld	s3,104(sp)
    8020866e:	7a06                	ld	s4,96(sp)
    80208670:	6ae6                	ld	s5,88(sp)
    80208672:	6b46                	ld	s6,80(sp)
    80208674:	6ba6                	ld	s7,72(sp)
    80208676:	6c06                	ld	s8,64(sp)
    80208678:	7ce2                	ld	s9,56(sp)
    8020867a:	7d42                	ld	s10,48(sp)
    8020867c:	7da2                	ld	s11,40(sp)
    8020867e:	6149                	addi	sp,sp,144
    80208680:	8082                	ret
  if(write)
    80208682:	019037b3          	snez	a5,s9
    80208686:	f6f42823          	sw	a5,-144(s0)
  buf0.reserved = 0;
    8020868a:	f6042a23          	sw	zero,-140(s0)
  buf0.sector = sector;
    8020868e:	f7a43c23          	sd	s10,-136(s0)
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    80208692:	ffff9097          	auipc	ra,0xffff9
    80208696:	424080e7          	jalr	1060(ra) # 80201ab6 <myproc>
    8020869a:	f8042483          	lw	s1,-128(s0)
    8020869e:	00449913          	slli	s2,s1,0x4
    802086a2:	00024997          	auipc	s3,0x24
    802086a6:	95e98993          	addi	s3,s3,-1698 # 8022c000 <disk+0x2000>
    802086aa:	0009ba03          	ld	s4,0(s3)
    802086ae:	9a4a                	add	s4,s4,s2
    802086b0:	f7040593          	addi	a1,s0,-144
    802086b4:	6d28                	ld	a0,88(a0)
    802086b6:	ffff8097          	auipc	ra,0xffff8
    802086ba:	53a080e7          	jalr	1338(ra) # 80200bf0 <kwalkaddr>
    802086be:	00aa3023          	sd	a0,0(s4)
  disk.desc[idx[0]].len = sizeof(buf0);
    802086c2:	0009b783          	ld	a5,0(s3)
    802086c6:	97ca                	add	a5,a5,s2
    802086c8:	4741                	li	a4,16
    802086ca:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    802086cc:	0009b783          	ld	a5,0(s3)
    802086d0:	97ca                	add	a5,a5,s2
    802086d2:	4705                	li	a4,1
    802086d4:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    802086d8:	f8442783          	lw	a5,-124(s0)
    802086dc:	0009b703          	ld	a4,0(s3)
    802086e0:	974a                	add	a4,a4,s2
    802086e2:	00f71723          	sh	a5,14(a4)
  disk.desc[idx[1]].addr = (uint64) b->data;
    802086e6:	0792                	slli	a5,a5,0x4
    802086e8:	0009b703          	ld	a4,0(s3)
    802086ec:	973e                	add	a4,a4,a5
    802086ee:	058a8693          	addi	a3,s5,88
    802086f2:	e314                	sd	a3,0(a4)
  disk.desc[idx[1]].len = BSIZE;
    802086f4:	0009b703          	ld	a4,0(s3)
    802086f8:	973e                	add	a4,a4,a5
    802086fa:	20000693          	li	a3,512
    802086fe:	c714                	sw	a3,8(a4)
  if(write)
    80208700:	e40c92e3          	bnez	s9,80208544 <virtio_disk_rw+0xba>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80208704:	00024717          	auipc	a4,0x24
    80208708:	8fc73703          	ld	a4,-1796(a4) # 8022c000 <disk+0x2000>
    8020870c:	973e                	add	a4,a4,a5
    8020870e:	4689                	li	a3,2
    80208710:	00d71623          	sh	a3,12(a4)
    80208714:	bd3d                	j	80208552 <virtio_disk_rw+0xc8>

0000000080208716 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80208716:	1101                	addi	sp,sp,-32
    80208718:	ec06                	sd	ra,24(sp)
    8020871a:	e822                	sd	s0,16(sp)
    8020871c:	e426                	sd	s1,8(sp)
    8020871e:	e04a                	sd	s2,0(sp)
    80208720:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    80208722:	00024517          	auipc	a0,0x24
    80208726:	98650513          	addi	a0,a0,-1658 # 8022c0a8 <disk+0x20a8>
    8020872a:	ffff8097          	auipc	ra,0xffff8
    8020872e:	f9c080e7          	jalr	-100(ra) # 802006c6 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80208732:	00024717          	auipc	a4,0x24
    80208736:	8ce70713          	addi	a4,a4,-1842 # 8022c000 <disk+0x2000>
    8020873a:	02075783          	lhu	a5,32(a4)
    8020873e:	6b18                	ld	a4,16(a4)
    80208740:	00275683          	lhu	a3,2(a4)
    80208744:	8ebd                	xor	a3,a3,a5
    80208746:	8a9d                	andi	a3,a3,7
    80208748:	cab9                	beqz	a3,8020879e <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    8020874a:	00022917          	auipc	s2,0x22
    8020874e:	8b690913          	addi	s2,s2,-1866 # 8022a000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    80208752:	00024497          	auipc	s1,0x24
    80208756:	8ae48493          	addi	s1,s1,-1874 # 8022c000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    8020875a:	078e                	slli	a5,a5,0x3
    8020875c:	973e                	add	a4,a4,a5
    8020875e:	435c                	lw	a5,4(a4)
    if(disk.info[id].status != 0)
    80208760:	20078713          	addi	a4,a5,512
    80208764:	0712                	slli	a4,a4,0x4
    80208766:	974a                	add	a4,a4,s2
    80208768:	03074703          	lbu	a4,48(a4)
    8020876c:	e335                	bnez	a4,802087d0 <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    8020876e:	20078793          	addi	a5,a5,512
    80208772:	0792                	slli	a5,a5,0x4
    80208774:	97ca                	add	a5,a5,s2
    80208776:	7798                	ld	a4,40(a5)
    80208778:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    8020877c:	7788                	ld	a0,40(a5)
    8020877e:	ffffa097          	auipc	ra,0xffffa
    80208782:	d74080e7          	jalr	-652(ra) # 802024f2 <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    80208786:	0204d783          	lhu	a5,32(s1)
    8020878a:	2785                	addiw	a5,a5,1
    8020878c:	8b9d                	andi	a5,a5,7
    8020878e:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80208792:	6898                	ld	a4,16(s1)
    80208794:	00275683          	lhu	a3,2(a4)
    80208798:	8a9d                	andi	a3,a3,7
    8020879a:	fcf690e3          	bne	a3,a5,8020875a <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8020879e:	00003797          	auipc	a5,0x3
    802087a2:	a7a7b783          	ld	a5,-1414(a5) # 8020b218 <DOMAINNAME+0x318>
    802087a6:	439c                	lw	a5,0(a5)
    802087a8:	8b8d                	andi	a5,a5,3
    802087aa:	00003717          	auipc	a4,0x3
    802087ae:	a7673703          	ld	a4,-1418(a4) # 8020b220 <DOMAINNAME+0x320>
    802087b2:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    802087b4:	00024517          	auipc	a0,0x24
    802087b8:	8f450513          	addi	a0,a0,-1804 # 8022c0a8 <disk+0x20a8>
    802087bc:	ffff8097          	auipc	ra,0xffff8
    802087c0:	f5e080e7          	jalr	-162(ra) # 8020071a <release>
}
    802087c4:	60e2                	ld	ra,24(sp)
    802087c6:	6442                	ld	s0,16(sp)
    802087c8:	64a2                	ld	s1,8(sp)
    802087ca:	6902                	ld	s2,0(sp)
    802087cc:	6105                	addi	sp,sp,32
    802087ce:	8082                	ret
      panic("virtio_disk_intr status");
    802087d0:	00003517          	auipc	a0,0x3
    802087d4:	9d050513          	addi	a0,a0,-1584 # 8020b1a0 <DOMAINNAME+0x2a0>
    802087d8:	ffff8097          	auipc	ra,0xffff8
    802087dc:	96c080e7          	jalr	-1684(ra) # 80200144 <panic>
	...

0000000080209000 <_trampoline>:
    80209000:	14051573          	csrrw	a0,sscratch,a0
    80209004:	02153423          	sd	ra,40(a0)
    80209008:	02253823          	sd	sp,48(a0)
    8020900c:	02353c23          	sd	gp,56(a0)
    80209010:	04453023          	sd	tp,64(a0)
    80209014:	04553423          	sd	t0,72(a0)
    80209018:	04653823          	sd	t1,80(a0)
    8020901c:	04753c23          	sd	t2,88(a0)
    80209020:	f120                	sd	s0,96(a0)
    80209022:	f524                	sd	s1,104(a0)
    80209024:	fd2c                	sd	a1,120(a0)
    80209026:	e150                	sd	a2,128(a0)
    80209028:	e554                	sd	a3,136(a0)
    8020902a:	e958                	sd	a4,144(a0)
    8020902c:	ed5c                	sd	a5,152(a0)
    8020902e:	0b053023          	sd	a6,160(a0)
    80209032:	0b153423          	sd	a7,168(a0)
    80209036:	0b253823          	sd	s2,176(a0)
    8020903a:	0b353c23          	sd	s3,184(a0)
    8020903e:	0d453023          	sd	s4,192(a0)
    80209042:	0d553423          	sd	s5,200(a0)
    80209046:	0d653823          	sd	s6,208(a0)
    8020904a:	0d753c23          	sd	s7,216(a0)
    8020904e:	0f853023          	sd	s8,224(a0)
    80209052:	0f953423          	sd	s9,232(a0)
    80209056:	0fa53823          	sd	s10,240(a0)
    8020905a:	0fb53c23          	sd	s11,248(a0)
    8020905e:	11c53023          	sd	t3,256(a0)
    80209062:	11d53423          	sd	t4,264(a0)
    80209066:	11e53823          	sd	t5,272(a0)
    8020906a:	11f53c23          	sd	t6,280(a0)
    8020906e:	140022f3          	csrr	t0,sscratch
    80209072:	06553823          	sd	t0,112(a0)
    80209076:	00853103          	ld	sp,8(a0)
    8020907a:	02053203          	ld	tp,32(a0)
    8020907e:	01053283          	ld	t0,16(a0)
    80209082:	00053303          	ld	t1,0(a0)
    80209086:	18031073          	csrw	satp,t1
    8020908a:	12000073          	sfence.vma
    8020908e:	8282                	jr	t0

0000000080209090 <userret>:
    80209090:	18059073          	csrw	satp,a1
    80209094:	12000073          	sfence.vma
    80209098:	07053283          	ld	t0,112(a0)
    8020909c:	14029073          	csrw	sscratch,t0
    802090a0:	02853083          	ld	ra,40(a0)
    802090a4:	03053103          	ld	sp,48(a0)
    802090a8:	03853183          	ld	gp,56(a0)
    802090ac:	04053203          	ld	tp,64(a0)
    802090b0:	04853283          	ld	t0,72(a0)
    802090b4:	05053303          	ld	t1,80(a0)
    802090b8:	05853383          	ld	t2,88(a0)
    802090bc:	7120                	ld	s0,96(a0)
    802090be:	7524                	ld	s1,104(a0)
    802090c0:	7d2c                	ld	a1,120(a0)
    802090c2:	6150                	ld	a2,128(a0)
    802090c4:	6554                	ld	a3,136(a0)
    802090c6:	6958                	ld	a4,144(a0)
    802090c8:	6d5c                	ld	a5,152(a0)
    802090ca:	0a053803          	ld	a6,160(a0)
    802090ce:	0a853883          	ld	a7,168(a0)
    802090d2:	0b053903          	ld	s2,176(a0)
    802090d6:	0b853983          	ld	s3,184(a0)
    802090da:	0c053a03          	ld	s4,192(a0)
    802090de:	0c853a83          	ld	s5,200(a0)
    802090e2:	0d053b03          	ld	s6,208(a0)
    802090e6:	0d853b83          	ld	s7,216(a0)
    802090ea:	0e053c03          	ld	s8,224(a0)
    802090ee:	0e853c83          	ld	s9,232(a0)
    802090f2:	0f053d03          	ld	s10,240(a0)
    802090f6:	0f853d83          	ld	s11,248(a0)
    802090fa:	10053e03          	ld	t3,256(a0)
    802090fe:	10853e83          	ld	t4,264(a0)
    80209102:	11053f03          	ld	t5,272(a0)
    80209106:	11853f83          	ld	t6,280(a0)
    8020910a:	14051573          	csrrw	a0,sscratch,a0
    8020910e:	10200073          	sret
	...
