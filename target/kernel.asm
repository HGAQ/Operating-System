
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
    8020009a:	d54080e7          	jalr	-684(ra) # 80207dea <consputc>
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
    802000d0:	d1e080e7          	jalr	-738(ra) # 80207dea <consputc>
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
    80200224:	bca080e7          	jalr	-1078(ra) # 80207dea <consputc>
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
    802002b6:	b38080e7          	jalr	-1224(ra) # 80207dea <consputc>
  consputc('x');
    802002ba:	07800513          	li	a0,120
    802002be:	00008097          	auipc	ra,0x8
    802002c2:	b2c080e7          	jalr	-1236(ra) # 80207dea <consputc>
    802002c6:	84ea                	mv	s1,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c8:	03c95793          	srli	a5,s2,0x3c
    802002cc:	97da                	add	a5,a5,s6
    802002ce:	0007c503          	lbu	a0,0(a5)
    802002d2:	00008097          	auipc	ra,0x8
    802002d6:	b18080e7          	jalr	-1256(ra) # 80207dea <consputc>
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
    802002fc:	af2080e7          	jalr	-1294(ra) # 80207dea <consputc>
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
    8020031e:	ad0080e7          	jalr	-1328(ra) # 80207dea <consputc>
      break;
    80200322:	b719                	j	80200228 <printf+0x9a>
      consputc('%');
    80200324:	8556                	mv	a0,s5
    80200326:	00008097          	auipc	ra,0x8
    8020032a:	ac4080e7          	jalr	-1340(ra) # 80207dea <consputc>
      consputc(c);
    8020032e:	8526                	mv	a0,s1
    80200330:	00008097          	auipc	ra,0x8
    80200334:	aba080e7          	jalr	-1350(ra) # 80207dea <consputc>
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
    80200a1a:	192080e7          	jalr	402(ra) # 80207ba8 <plicinithart>
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
    80200a3a:	584080e7          	jalr	1412(ra) # 80207fba <consoleinit>
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
    80200a6a:	348080e7          	jalr	840(ra) # 80205dae <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200a6e:	00002097          	auipc	ra,0x2
    80200a72:	f96080e7          	jalr	-106(ra) # 80202a04 <trapinithart>
    procinit();
    80200a76:	00001097          	auipc	ra,0x1
    80200a7a:	f9e080e7          	jalr	-98(ra) # 80201a14 <procinit>
    plicinit();
    80200a7e:	00007097          	auipc	ra,0x7
    80200a82:	112080e7          	jalr	274(ra) # 80207b90 <plicinit>
    plicinithart();
    80200a86:	00007097          	auipc	ra,0x7
    80200a8a:	122080e7          	jalr	290(ra) # 80207ba8 <plicinithart>
    disk_init();
    80200a8e:	00005097          	auipc	ra,0x5
    80200a92:	3bc080e7          	jalr	956(ra) # 80205e4a <disk_init>
    binit();         // buffer cache
    80200a96:	00003097          	auipc	ra,0x3
    80200a9a:	fcc080e7          	jalr	-52(ra) # 80203a62 <binit>
    fileinit();      // file table
    80200a9e:	00003097          	auipc	ra,0x3
    80200aa2:	3d0080e7          	jalr	976(ra) # 80203e6e <fileinit>
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
    80201b30:	a96080e7          	jalr	-1386(ra) # 802065c2 <fat32_init>
    myproc()->cwd = ename("/");
    80201b34:	00000097          	auipc	ra,0x0
    80201b38:	f82080e7          	jalr	-126(ra) # 80201ab6 <myproc>
    80201b3c:	84aa                	mv	s1,a0
    80201b3e:	00009517          	auipc	a0,0x9
    80201b42:	af250513          	addi	a0,a0,-1294 # 8020a630 <digits+0x2b0>
    80201b46:	00006097          	auipc	ra,0x6
    80201b4a:	d9a080e7          	jalr	-614(ra) # 802078e0 <ename>
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
    80201f7c:	fb8080e7          	jalr	-72(ra) # 80203f30 <filedup>
    80201f80:	00a93023          	sd	a0,0(s2)
    80201f84:	b7e5                	j	80201f6c <fork+0xb0>
  np->cwd = edup(p->cwd);
    80201f86:	158ab503          	ld	a0,344(s5)
    80201f8a:	00005097          	auipc	ra,0x5
    80201f8e:	ea4080e7          	jalr	-348(ra) # 80206e2e <edup>
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
    8020227e:	d08080e7          	jalr	-760(ra) # 80203f82 <fileclose>
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
    8020229a:	e7a080e7          	jalr	-390(ra) # 80207110 <eput>
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
    802027fe:	736080e7          	jalr	1846(ra) # 80203f30 <filedup>
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
    80202818:	00004097          	auipc	ra,0x4
    8020281c:	616080e7          	jalr	1558(ra) # 80206e2e <edup>
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
    80202a34:	3a6080e7          	jalr	934(ra) # 80205dd6 <set_next_timeout>
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
    80202b14:	0da080e7          	jalr	218(ra) # 80207bea <plic_claim>
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
    80202b5a:	0be080e7          	jalr	190(ra) # 80207c14 <plic_complete>
		return 1;
    80202b5e:	4505                	li	a0,1
    80202b60:	bf71                	j	80202afc <devintr+0x1e>
				consoleintr(c);
    80202b62:	00005097          	auipc	ra,0x5
    80202b66:	2c6080e7          	jalr	710(ra) # 80207e28 <consoleintr>
    80202b6a:	b7ed                	j	80202b54 <devintr+0x76>
			disk_intr();
    80202b6c:	00003097          	auipc	ra,0x3
    80202b70:	32a080e7          	jalr	810(ra) # 80205e96 <disk_intr>
    80202b74:	b7c5                	j	80202b54 <devintr+0x76>
		timer_tick();
    80202b76:	00003097          	auipc	ra,0x3
    80202b7a:	286080e7          	jalr	646(ra) # 80205dfc <timer_tick>
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
    80202fe6:	b4e70713          	addi	a4,a4,-1202 # 8020ab30 <digits+0x7b0>
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
    80203346:	3f2080e7          	jalr	1010(ra) # 80204734 <exec>
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
    80203604:	54850513          	addi	a0,a0,1352 # 8020ab48 <digits+0x7c8>
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
    80203680:	50450513          	addi	a0,a0,1284 # 8020ab80 <digits+0x800>
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
    80203706:	4ae50513          	addi	a0,a0,1198 # 8020abb0 <digits+0x830>
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
    80203828:	f10080e7          	jalr	-240(ra) # 80204734 <exec>
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

0000000080203a2c <sys_poweroff>:


// Power off QEMU
uint64
sys_poweroff(void)
{
    80203a2c:	1141                	addi	sp,sp,-16
    80203a2e:	e406                	sd	ra,8(sp)
    80203a30:	e022                	sd	s0,0(sp)
    80203a32:	0800                	addi	s0,sp,16
  printf("Powering off...\n");
    80203a34:	00007517          	auipc	a0,0x7
    80203a38:	1ac50513          	addi	a0,a0,428 # 8020abe0 <digits+0x860>
    80203a3c:	ffffc097          	auipc	ra,0xffffc
    80203a40:	752080e7          	jalr	1874(ra) # 8020018e <printf>
	SBI_CALL_0(SBI_SHUTDOWN);
    80203a44:	4501                	li	a0,0
    80203a46:	4581                	li	a1,0
    80203a48:	4601                	li	a2,0
    80203a4a:	4681                	li	a3,0
    80203a4c:	48a1                	li	a7,8
    80203a4e:	00000073          	ecall
  sbi_shutdown();
  panic("sys_poweroff");
    80203a52:	00007517          	auipc	a0,0x7
    80203a56:	1a650513          	addi	a0,a0,422 # 8020abf8 <digits+0x878>
    80203a5a:	ffffc097          	auipc	ra,0xffffc
    80203a5e:	6ea080e7          	jalr	1770(ra) # 80200144 <panic>

0000000080203a62 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80203a62:	7139                	addi	sp,sp,-64
    80203a64:	fc06                	sd	ra,56(sp)
    80203a66:	f822                	sd	s0,48(sp)
    80203a68:	f426                	sd	s1,40(sp)
    80203a6a:	f04a                	sd	s2,32(sp)
    80203a6c:	ec4e                	sd	s3,24(sp)
    80203a6e:	e852                	sd	s4,16(sp)
    80203a70:	e456                	sd	s5,8(sp)
    80203a72:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80203a74:	00007597          	auipc	a1,0x7
    80203a78:	19458593          	addi	a1,a1,404 # 8020ac08 <digits+0x888>
    80203a7c:	0001b517          	auipc	a0,0x1b
    80203a80:	a4450513          	addi	a0,a0,-1468 # 8021e4c0 <bcache>
    80203a84:	ffffd097          	auipc	ra,0xffffd
    80203a88:	bfe080e7          	jalr	-1026(ra) # 80200682 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80203a8c:	0001f797          	auipc	a5,0x1f
    80203a90:	a3478793          	addi	a5,a5,-1484 # 802224c0 <bcache+0x4000>
    80203a94:	0001f717          	auipc	a4,0x1f
    80203a98:	09470713          	addi	a4,a4,148 # 80222b28 <bcache+0x4668>
    80203a9c:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    80203aa0:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203aa4:	0001b497          	auipc	s1,0x1b
    80203aa8:	a3448493          	addi	s1,s1,-1484 # 8021e4d8 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    80203aac:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    80203aae:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    80203ab0:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    80203ab2:	00007a97          	auipc	s5,0x7
    80203ab6:	15ea8a93          	addi	s5,s5,350 # 8020ac10 <digits+0x890>
    b->refcnt = 0;
    80203aba:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    80203abe:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    80203ac2:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    80203ac6:	6b893783          	ld	a5,1720(s2)
    80203aca:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    80203acc:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    80203ad0:	85d6                	mv	a1,s5
    80203ad2:	01048513          	addi	a0,s1,16
    80203ad6:	00000097          	auipc	ra,0x0
    80203ada:	26e080e7          	jalr	622(ra) # 80203d44 <initsleeplock>
    bcache.head.next->prev = b;
    80203ade:	6b893783          	ld	a5,1720(s2)
    80203ae2:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    80203ae4:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203ae8:	25848493          	addi	s1,s1,600
    80203aec:	fd3497e3          	bne	s1,s3,80203aba <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    80203af0:	70e2                	ld	ra,56(sp)
    80203af2:	7442                	ld	s0,48(sp)
    80203af4:	74a2                	ld	s1,40(sp)
    80203af6:	7902                	ld	s2,32(sp)
    80203af8:	69e2                	ld	s3,24(sp)
    80203afa:	6a42                	ld	s4,16(sp)
    80203afc:	6aa2                	ld	s5,8(sp)
    80203afe:	6121                	addi	sp,sp,64
    80203b00:	8082                	ret

0000000080203b02 <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    80203b02:	7179                	addi	sp,sp,-48
    80203b04:	f406                	sd	ra,40(sp)
    80203b06:	f022                	sd	s0,32(sp)
    80203b08:	ec26                	sd	s1,24(sp)
    80203b0a:	e84a                	sd	s2,16(sp)
    80203b0c:	e44e                	sd	s3,8(sp)
    80203b0e:	1800                	addi	s0,sp,48
    80203b10:	892a                	mv	s2,a0
    80203b12:	89ae                	mv	s3,a1
  acquire(&bcache.lock);
    80203b14:	0001b517          	auipc	a0,0x1b
    80203b18:	9ac50513          	addi	a0,a0,-1620 # 8021e4c0 <bcache>
    80203b1c:	ffffd097          	auipc	ra,0xffffd
    80203b20:	baa080e7          	jalr	-1110(ra) # 802006c6 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80203b24:	0001f497          	auipc	s1,0x1f
    80203b28:	0544b483          	ld	s1,84(s1) # 80222b78 <bcache+0x46b8>
    80203b2c:	0001f797          	auipc	a5,0x1f
    80203b30:	ffc78793          	addi	a5,a5,-4 # 80222b28 <bcache+0x4668>
    80203b34:	02f48f63          	beq	s1,a5,80203b72 <bread+0x70>
    80203b38:	873e                	mv	a4,a5
    80203b3a:	a021                	j	80203b42 <bread+0x40>
    80203b3c:	68a4                	ld	s1,80(s1)
    80203b3e:	02e48a63          	beq	s1,a4,80203b72 <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    80203b42:	449c                	lw	a5,8(s1)
    80203b44:	ff279ce3          	bne	a5,s2,80203b3c <bread+0x3a>
    80203b48:	44dc                	lw	a5,12(s1)
    80203b4a:	ff3799e3          	bne	a5,s3,80203b3c <bread+0x3a>
      b->refcnt++;
    80203b4e:	40bc                	lw	a5,64(s1)
    80203b50:	2785                	addiw	a5,a5,1
    80203b52:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203b54:	0001b517          	auipc	a0,0x1b
    80203b58:	96c50513          	addi	a0,a0,-1684 # 8021e4c0 <bcache>
    80203b5c:	ffffd097          	auipc	ra,0xffffd
    80203b60:	bbe080e7          	jalr	-1090(ra) # 8020071a <release>
      acquiresleep(&b->lock);
    80203b64:	01048513          	addi	a0,s1,16
    80203b68:	00000097          	auipc	ra,0x0
    80203b6c:	216080e7          	jalr	534(ra) # 80203d7e <acquiresleep>
      return b;
    80203b70:	a8b9                	j	80203bce <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203b72:	0001f497          	auipc	s1,0x1f
    80203b76:	ffe4b483          	ld	s1,-2(s1) # 80222b70 <bcache+0x46b0>
    80203b7a:	0001f797          	auipc	a5,0x1f
    80203b7e:	fae78793          	addi	a5,a5,-82 # 80222b28 <bcache+0x4668>
    80203b82:	00f48863          	beq	s1,a5,80203b92 <bread+0x90>
    80203b86:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    80203b88:	40bc                	lw	a5,64(s1)
    80203b8a:	cf81                	beqz	a5,80203ba2 <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203b8c:	64a4                	ld	s1,72(s1)
    80203b8e:	fee49de3          	bne	s1,a4,80203b88 <bread+0x86>
  panic("bget: no buffers");
    80203b92:	00007517          	auipc	a0,0x7
    80203b96:	08650513          	addi	a0,a0,134 # 8020ac18 <digits+0x898>
    80203b9a:	ffffc097          	auipc	ra,0xffffc
    80203b9e:	5aa080e7          	jalr	1450(ra) # 80200144 <panic>
      b->dev = dev;
    80203ba2:	0124a423          	sw	s2,8(s1)
      b->sectorno = sectorno;
    80203ba6:	0134a623          	sw	s3,12(s1)
      b->valid = 0;
    80203baa:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    80203bae:	4785                	li	a5,1
    80203bb0:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203bb2:	0001b517          	auipc	a0,0x1b
    80203bb6:	90e50513          	addi	a0,a0,-1778 # 8021e4c0 <bcache>
    80203bba:	ffffd097          	auipc	ra,0xffffd
    80203bbe:	b60080e7          	jalr	-1184(ra) # 8020071a <release>
      acquiresleep(&b->lock);
    80203bc2:	01048513          	addi	a0,s1,16
    80203bc6:	00000097          	auipc	ra,0x0
    80203bca:	1b8080e7          	jalr	440(ra) # 80203d7e <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    80203bce:	409c                	lw	a5,0(s1)
    80203bd0:	cb89                	beqz	a5,80203be2 <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    80203bd2:	8526                	mv	a0,s1
    80203bd4:	70a2                	ld	ra,40(sp)
    80203bd6:	7402                	ld	s0,32(sp)
    80203bd8:	64e2                	ld	s1,24(sp)
    80203bda:	6942                	ld	s2,16(sp)
    80203bdc:	69a2                	ld	s3,8(sp)
    80203bde:	6145                	addi	sp,sp,48
    80203be0:	8082                	ret
    disk_read(b);
    80203be2:	8526                	mv	a0,s1
    80203be4:	00002097          	auipc	ra,0x2
    80203be8:	27e080e7          	jalr	638(ra) # 80205e62 <disk_read>
    b->valid = 1;
    80203bec:	4785                	li	a5,1
    80203bee:	c09c                	sw	a5,0(s1)
  return b;
    80203bf0:	b7cd                	j	80203bd2 <bread+0xd0>

0000000080203bf2 <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    80203bf2:	1101                	addi	sp,sp,-32
    80203bf4:	ec06                	sd	ra,24(sp)
    80203bf6:	e822                	sd	s0,16(sp)
    80203bf8:	e426                	sd	s1,8(sp)
    80203bfa:	1000                	addi	s0,sp,32
    80203bfc:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203bfe:	0541                	addi	a0,a0,16
    80203c00:	00000097          	auipc	ra,0x0
    80203c04:	218080e7          	jalr	536(ra) # 80203e18 <holdingsleep>
    80203c08:	c919                	beqz	a0,80203c1e <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    80203c0a:	8526                	mv	a0,s1
    80203c0c:	00002097          	auipc	ra,0x2
    80203c10:	270080e7          	jalr	624(ra) # 80205e7c <disk_write>
}
    80203c14:	60e2                	ld	ra,24(sp)
    80203c16:	6442                	ld	s0,16(sp)
    80203c18:	64a2                	ld	s1,8(sp)
    80203c1a:	6105                	addi	sp,sp,32
    80203c1c:	8082                	ret
    panic("bwrite");
    80203c1e:	00007517          	auipc	a0,0x7
    80203c22:	01250513          	addi	a0,a0,18 # 8020ac30 <digits+0x8b0>
    80203c26:	ffffc097          	auipc	ra,0xffffc
    80203c2a:	51e080e7          	jalr	1310(ra) # 80200144 <panic>

0000000080203c2e <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80203c2e:	1101                	addi	sp,sp,-32
    80203c30:	ec06                	sd	ra,24(sp)
    80203c32:	e822                	sd	s0,16(sp)
    80203c34:	e426                	sd	s1,8(sp)
    80203c36:	e04a                	sd	s2,0(sp)
    80203c38:	1000                	addi	s0,sp,32
    80203c3a:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203c3c:	01050913          	addi	s2,a0,16
    80203c40:	854a                	mv	a0,s2
    80203c42:	00000097          	auipc	ra,0x0
    80203c46:	1d6080e7          	jalr	470(ra) # 80203e18 <holdingsleep>
    80203c4a:	c92d                	beqz	a0,80203cbc <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80203c4c:	854a                	mv	a0,s2
    80203c4e:	00000097          	auipc	ra,0x0
    80203c52:	186080e7          	jalr	390(ra) # 80203dd4 <releasesleep>

  acquire(&bcache.lock);
    80203c56:	0001b517          	auipc	a0,0x1b
    80203c5a:	86a50513          	addi	a0,a0,-1942 # 8021e4c0 <bcache>
    80203c5e:	ffffd097          	auipc	ra,0xffffd
    80203c62:	a68080e7          	jalr	-1432(ra) # 802006c6 <acquire>
  b->refcnt--;
    80203c66:	40bc                	lw	a5,64(s1)
    80203c68:	37fd                	addiw	a5,a5,-1
    80203c6a:	0007871b          	sext.w	a4,a5
    80203c6e:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80203c70:	eb05                	bnez	a4,80203ca0 <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80203c72:	68bc                	ld	a5,80(s1)
    80203c74:	64b8                	ld	a4,72(s1)
    80203c76:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203c78:	64bc                	ld	a5,72(s1)
    80203c7a:	68b8                	ld	a4,80(s1)
    80203c7c:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80203c7e:	0001f797          	auipc	a5,0x1f
    80203c82:	84278793          	addi	a5,a5,-1982 # 802224c0 <bcache+0x4000>
    80203c86:	6b87b703          	ld	a4,1720(a5)
    80203c8a:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    80203c8c:	0001f717          	auipc	a4,0x1f
    80203c90:	e9c70713          	addi	a4,a4,-356 # 80222b28 <bcache+0x4668>
    80203c94:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    80203c96:	6b87b703          	ld	a4,1720(a5)
    80203c9a:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    80203c9c:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    80203ca0:	0001b517          	auipc	a0,0x1b
    80203ca4:	82050513          	addi	a0,a0,-2016 # 8021e4c0 <bcache>
    80203ca8:	ffffd097          	auipc	ra,0xffffd
    80203cac:	a72080e7          	jalr	-1422(ra) # 8020071a <release>
}
    80203cb0:	60e2                	ld	ra,24(sp)
    80203cb2:	6442                	ld	s0,16(sp)
    80203cb4:	64a2                	ld	s1,8(sp)
    80203cb6:	6902                	ld	s2,0(sp)
    80203cb8:	6105                	addi	sp,sp,32
    80203cba:	8082                	ret
    panic("brelse");
    80203cbc:	00007517          	auipc	a0,0x7
    80203cc0:	f7c50513          	addi	a0,a0,-132 # 8020ac38 <digits+0x8b8>
    80203cc4:	ffffc097          	auipc	ra,0xffffc
    80203cc8:	480080e7          	jalr	1152(ra) # 80200144 <panic>

0000000080203ccc <bpin>:

void
bpin(struct buf *b) {
    80203ccc:	1101                	addi	sp,sp,-32
    80203cce:	ec06                	sd	ra,24(sp)
    80203cd0:	e822                	sd	s0,16(sp)
    80203cd2:	e426                	sd	s1,8(sp)
    80203cd4:	1000                	addi	s0,sp,32
    80203cd6:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203cd8:	0001a517          	auipc	a0,0x1a
    80203cdc:	7e850513          	addi	a0,a0,2024 # 8021e4c0 <bcache>
    80203ce0:	ffffd097          	auipc	ra,0xffffd
    80203ce4:	9e6080e7          	jalr	-1562(ra) # 802006c6 <acquire>
  b->refcnt++;
    80203ce8:	40bc                	lw	a5,64(s1)
    80203cea:	2785                	addiw	a5,a5,1
    80203cec:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203cee:	0001a517          	auipc	a0,0x1a
    80203cf2:	7d250513          	addi	a0,a0,2002 # 8021e4c0 <bcache>
    80203cf6:	ffffd097          	auipc	ra,0xffffd
    80203cfa:	a24080e7          	jalr	-1500(ra) # 8020071a <release>
}
    80203cfe:	60e2                	ld	ra,24(sp)
    80203d00:	6442                	ld	s0,16(sp)
    80203d02:	64a2                	ld	s1,8(sp)
    80203d04:	6105                	addi	sp,sp,32
    80203d06:	8082                	ret

0000000080203d08 <bunpin>:

void
bunpin(struct buf *b) {
    80203d08:	1101                	addi	sp,sp,-32
    80203d0a:	ec06                	sd	ra,24(sp)
    80203d0c:	e822                	sd	s0,16(sp)
    80203d0e:	e426                	sd	s1,8(sp)
    80203d10:	1000                	addi	s0,sp,32
    80203d12:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203d14:	0001a517          	auipc	a0,0x1a
    80203d18:	7ac50513          	addi	a0,a0,1964 # 8021e4c0 <bcache>
    80203d1c:	ffffd097          	auipc	ra,0xffffd
    80203d20:	9aa080e7          	jalr	-1622(ra) # 802006c6 <acquire>
  b->refcnt--;
    80203d24:	40bc                	lw	a5,64(s1)
    80203d26:	37fd                	addiw	a5,a5,-1
    80203d28:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203d2a:	0001a517          	auipc	a0,0x1a
    80203d2e:	79650513          	addi	a0,a0,1942 # 8021e4c0 <bcache>
    80203d32:	ffffd097          	auipc	ra,0xffffd
    80203d36:	9e8080e7          	jalr	-1560(ra) # 8020071a <release>
}
    80203d3a:	60e2                	ld	ra,24(sp)
    80203d3c:	6442                	ld	s0,16(sp)
    80203d3e:	64a2                	ld	s1,8(sp)
    80203d40:	6105                	addi	sp,sp,32
    80203d42:	8082                	ret

0000000080203d44 <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203d44:	1101                	addi	sp,sp,-32
    80203d46:	ec06                	sd	ra,24(sp)
    80203d48:	e822                	sd	s0,16(sp)
    80203d4a:	e426                	sd	s1,8(sp)
    80203d4c:	e04a                	sd	s2,0(sp)
    80203d4e:	1000                	addi	s0,sp,32
    80203d50:	84aa                	mv	s1,a0
    80203d52:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203d54:	00007597          	auipc	a1,0x7
    80203d58:	eec58593          	addi	a1,a1,-276 # 8020ac40 <digits+0x8c0>
    80203d5c:	0521                	addi	a0,a0,8
    80203d5e:	ffffd097          	auipc	ra,0xffffd
    80203d62:	924080e7          	jalr	-1756(ra) # 80200682 <initlock>
  lk->name = name;
    80203d66:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203d6a:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203d6e:	0204a423          	sw	zero,40(s1)
}
    80203d72:	60e2                	ld	ra,24(sp)
    80203d74:	6442                	ld	s0,16(sp)
    80203d76:	64a2                	ld	s1,8(sp)
    80203d78:	6902                	ld	s2,0(sp)
    80203d7a:	6105                	addi	sp,sp,32
    80203d7c:	8082                	ret

0000000080203d7e <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80203d7e:	1101                	addi	sp,sp,-32
    80203d80:	ec06                	sd	ra,24(sp)
    80203d82:	e822                	sd	s0,16(sp)
    80203d84:	e426                	sd	s1,8(sp)
    80203d86:	e04a                	sd	s2,0(sp)
    80203d88:	1000                	addi	s0,sp,32
    80203d8a:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203d8c:	00850913          	addi	s2,a0,8
    80203d90:	854a                	mv	a0,s2
    80203d92:	ffffd097          	auipc	ra,0xffffd
    80203d96:	934080e7          	jalr	-1740(ra) # 802006c6 <acquire>
  while (lk->locked) {
    80203d9a:	409c                	lw	a5,0(s1)
    80203d9c:	cb89                	beqz	a5,80203dae <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    80203d9e:	85ca                	mv	a1,s2
    80203da0:	8526                	mv	a0,s1
    80203da2:	ffffe097          	auipc	ra,0xffffe
    80203da6:	5d4080e7          	jalr	1492(ra) # 80202376 <sleep>
  while (lk->locked) {
    80203daa:	409c                	lw	a5,0(s1)
    80203dac:	fbed                	bnez	a5,80203d9e <acquiresleep+0x20>
  }
  lk->locked = 1;
    80203dae:	4785                	li	a5,1
    80203db0:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    80203db2:	ffffe097          	auipc	ra,0xffffe
    80203db6:	d04080e7          	jalr	-764(ra) # 80201ab6 <myproc>
    80203dba:	5d1c                	lw	a5,56(a0)
    80203dbc:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    80203dbe:	854a                	mv	a0,s2
    80203dc0:	ffffd097          	auipc	ra,0xffffd
    80203dc4:	95a080e7          	jalr	-1702(ra) # 8020071a <release>
}
    80203dc8:	60e2                	ld	ra,24(sp)
    80203dca:	6442                	ld	s0,16(sp)
    80203dcc:	64a2                	ld	s1,8(sp)
    80203dce:	6902                	ld	s2,0(sp)
    80203dd0:	6105                	addi	sp,sp,32
    80203dd2:	8082                	ret

0000000080203dd4 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80203dd4:	1101                	addi	sp,sp,-32
    80203dd6:	ec06                	sd	ra,24(sp)
    80203dd8:	e822                	sd	s0,16(sp)
    80203dda:	e426                	sd	s1,8(sp)
    80203ddc:	e04a                	sd	s2,0(sp)
    80203dde:	1000                	addi	s0,sp,32
    80203de0:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203de2:	00850913          	addi	s2,a0,8
    80203de6:	854a                	mv	a0,s2
    80203de8:	ffffd097          	auipc	ra,0xffffd
    80203dec:	8de080e7          	jalr	-1826(ra) # 802006c6 <acquire>
  lk->locked = 0;
    80203df0:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203df4:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203df8:	8526                	mv	a0,s1
    80203dfa:	ffffe097          	auipc	ra,0xffffe
    80203dfe:	6f8080e7          	jalr	1784(ra) # 802024f2 <wakeup>
  release(&lk->lk);
    80203e02:	854a                	mv	a0,s2
    80203e04:	ffffd097          	auipc	ra,0xffffd
    80203e08:	916080e7          	jalr	-1770(ra) # 8020071a <release>
}
    80203e0c:	60e2                	ld	ra,24(sp)
    80203e0e:	6442                	ld	s0,16(sp)
    80203e10:	64a2                	ld	s1,8(sp)
    80203e12:	6902                	ld	s2,0(sp)
    80203e14:	6105                	addi	sp,sp,32
    80203e16:	8082                	ret

0000000080203e18 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203e18:	7179                	addi	sp,sp,-48
    80203e1a:	f406                	sd	ra,40(sp)
    80203e1c:	f022                	sd	s0,32(sp)
    80203e1e:	ec26                	sd	s1,24(sp)
    80203e20:	e84a                	sd	s2,16(sp)
    80203e22:	e44e                	sd	s3,8(sp)
    80203e24:	1800                	addi	s0,sp,48
    80203e26:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203e28:	00850913          	addi	s2,a0,8
    80203e2c:	854a                	mv	a0,s2
    80203e2e:	ffffd097          	auipc	ra,0xffffd
    80203e32:	898080e7          	jalr	-1896(ra) # 802006c6 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203e36:	409c                	lw	a5,0(s1)
    80203e38:	ef99                	bnez	a5,80203e56 <holdingsleep+0x3e>
    80203e3a:	4481                	li	s1,0
  release(&lk->lk);
    80203e3c:	854a                	mv	a0,s2
    80203e3e:	ffffd097          	auipc	ra,0xffffd
    80203e42:	8dc080e7          	jalr	-1828(ra) # 8020071a <release>
  return r;
}
    80203e46:	8526                	mv	a0,s1
    80203e48:	70a2                	ld	ra,40(sp)
    80203e4a:	7402                	ld	s0,32(sp)
    80203e4c:	64e2                	ld	s1,24(sp)
    80203e4e:	6942                	ld	s2,16(sp)
    80203e50:	69a2                	ld	s3,8(sp)
    80203e52:	6145                	addi	sp,sp,48
    80203e54:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203e56:	0284a983          	lw	s3,40(s1)
    80203e5a:	ffffe097          	auipc	ra,0xffffe
    80203e5e:	c5c080e7          	jalr	-932(ra) # 80201ab6 <myproc>
    80203e62:	5d04                	lw	s1,56(a0)
    80203e64:	413484b3          	sub	s1,s1,s3
    80203e68:	0014b493          	seqz	s1,s1
    80203e6c:	bfc1                	j	80203e3c <holdingsleep+0x24>

0000000080203e6e <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203e6e:	1101                	addi	sp,sp,-32
    80203e70:	ec06                	sd	ra,24(sp)
    80203e72:	e822                	sd	s0,16(sp)
    80203e74:	e426                	sd	s1,8(sp)
    80203e76:	e04a                	sd	s2,0(sp)
    80203e78:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203e7a:	00007597          	auipc	a1,0x7
    80203e7e:	dd658593          	addi	a1,a1,-554 # 8020ac50 <digits+0x8d0>
    80203e82:	0001f517          	auipc	a0,0x1f
    80203e86:	f9e50513          	addi	a0,a0,-98 # 80222e20 <ftable>
    80203e8a:	ffffc097          	auipc	ra,0xffffc
    80203e8e:	7f8080e7          	jalr	2040(ra) # 80200682 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203e92:	0001f497          	auipc	s1,0x1f
    80203e96:	fa648493          	addi	s1,s1,-90 # 80222e38 <ftable+0x18>
    80203e9a:	00020917          	auipc	s2,0x20
    80203e9e:	f3e90913          	addi	s2,s2,-194 # 80223dd8 <tickslock>
    memset(f, 0, sizeof(struct file));
    80203ea2:	02800613          	li	a2,40
    80203ea6:	4581                	li	a1,0
    80203ea8:	8526                	mv	a0,s1
    80203eaa:	ffffd097          	auipc	ra,0xffffd
    80203eae:	8b8080e7          	jalr	-1864(ra) # 80200762 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203eb2:	02848493          	addi	s1,s1,40
    80203eb6:	ff2496e3          	bne	s1,s2,80203ea2 <fileinit+0x34>
  }
  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    80203eba:	60e2                	ld	ra,24(sp)
    80203ebc:	6442                	ld	s0,16(sp)
    80203ebe:	64a2                	ld	s1,8(sp)
    80203ec0:	6902                	ld	s2,0(sp)
    80203ec2:	6105                	addi	sp,sp,32
    80203ec4:	8082                	ret

0000000080203ec6 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80203ec6:	1101                	addi	sp,sp,-32
    80203ec8:	ec06                	sd	ra,24(sp)
    80203eca:	e822                	sd	s0,16(sp)
    80203ecc:	e426                	sd	s1,8(sp)
    80203ece:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80203ed0:	0001f517          	auipc	a0,0x1f
    80203ed4:	f5050513          	addi	a0,a0,-176 # 80222e20 <ftable>
    80203ed8:	ffffc097          	auipc	ra,0xffffc
    80203edc:	7ee080e7          	jalr	2030(ra) # 802006c6 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203ee0:	0001f497          	auipc	s1,0x1f
    80203ee4:	f5848493          	addi	s1,s1,-168 # 80222e38 <ftable+0x18>
    80203ee8:	00020717          	auipc	a4,0x20
    80203eec:	ef070713          	addi	a4,a4,-272 # 80223dd8 <tickslock>
    if(f->ref == 0){
    80203ef0:	40dc                	lw	a5,4(s1)
    80203ef2:	cf99                	beqz	a5,80203f10 <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203ef4:	02848493          	addi	s1,s1,40
    80203ef8:	fee49ce3          	bne	s1,a4,80203ef0 <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203efc:	0001f517          	auipc	a0,0x1f
    80203f00:	f2450513          	addi	a0,a0,-220 # 80222e20 <ftable>
    80203f04:	ffffd097          	auipc	ra,0xffffd
    80203f08:	816080e7          	jalr	-2026(ra) # 8020071a <release>
  return NULL;
    80203f0c:	4481                	li	s1,0
    80203f0e:	a819                	j	80203f24 <filealloc+0x5e>
      f->ref = 1;
    80203f10:	4785                	li	a5,1
    80203f12:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203f14:	0001f517          	auipc	a0,0x1f
    80203f18:	f0c50513          	addi	a0,a0,-244 # 80222e20 <ftable>
    80203f1c:	ffffc097          	auipc	ra,0xffffc
    80203f20:	7fe080e7          	jalr	2046(ra) # 8020071a <release>
}
    80203f24:	8526                	mv	a0,s1
    80203f26:	60e2                	ld	ra,24(sp)
    80203f28:	6442                	ld	s0,16(sp)
    80203f2a:	64a2                	ld	s1,8(sp)
    80203f2c:	6105                	addi	sp,sp,32
    80203f2e:	8082                	ret

0000000080203f30 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203f30:	1101                	addi	sp,sp,-32
    80203f32:	ec06                	sd	ra,24(sp)
    80203f34:	e822                	sd	s0,16(sp)
    80203f36:	e426                	sd	s1,8(sp)
    80203f38:	1000                	addi	s0,sp,32
    80203f3a:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203f3c:	0001f517          	auipc	a0,0x1f
    80203f40:	ee450513          	addi	a0,a0,-284 # 80222e20 <ftable>
    80203f44:	ffffc097          	auipc	ra,0xffffc
    80203f48:	782080e7          	jalr	1922(ra) # 802006c6 <acquire>
  if(f->ref < 1)
    80203f4c:	40dc                	lw	a5,4(s1)
    80203f4e:	02f05263          	blez	a5,80203f72 <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203f52:	2785                	addiw	a5,a5,1
    80203f54:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203f56:	0001f517          	auipc	a0,0x1f
    80203f5a:	eca50513          	addi	a0,a0,-310 # 80222e20 <ftable>
    80203f5e:	ffffc097          	auipc	ra,0xffffc
    80203f62:	7bc080e7          	jalr	1980(ra) # 8020071a <release>
  return f;
}
    80203f66:	8526                	mv	a0,s1
    80203f68:	60e2                	ld	ra,24(sp)
    80203f6a:	6442                	ld	s0,16(sp)
    80203f6c:	64a2                	ld	s1,8(sp)
    80203f6e:	6105                	addi	sp,sp,32
    80203f70:	8082                	ret
    panic("filedup");
    80203f72:	00007517          	auipc	a0,0x7
    80203f76:	ce650513          	addi	a0,a0,-794 # 8020ac58 <digits+0x8d8>
    80203f7a:	ffffc097          	auipc	ra,0xffffc
    80203f7e:	1ca080e7          	jalr	458(ra) # 80200144 <panic>

0000000080203f82 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80203f82:	7139                	addi	sp,sp,-64
    80203f84:	fc06                	sd	ra,56(sp)
    80203f86:	f822                	sd	s0,48(sp)
    80203f88:	f426                	sd	s1,40(sp)
    80203f8a:	f04a                	sd	s2,32(sp)
    80203f8c:	ec4e                	sd	s3,24(sp)
    80203f8e:	e852                	sd	s4,16(sp)
    80203f90:	e456                	sd	s5,8(sp)
    80203f92:	0080                	addi	s0,sp,64
    80203f94:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80203f96:	0001f517          	auipc	a0,0x1f
    80203f9a:	e8a50513          	addi	a0,a0,-374 # 80222e20 <ftable>
    80203f9e:	ffffc097          	auipc	ra,0xffffc
    80203fa2:	728080e7          	jalr	1832(ra) # 802006c6 <acquire>
  if(f->ref < 1)
    80203fa6:	40dc                	lw	a5,4(s1)
    80203fa8:	04f05863          	blez	a5,80203ff8 <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    80203fac:	37fd                	addiw	a5,a5,-1
    80203fae:	0007871b          	sext.w	a4,a5
    80203fb2:	c0dc                	sw	a5,4(s1)
    80203fb4:	04e04a63          	bgtz	a4,80204008 <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    80203fb8:	0004a903          	lw	s2,0(s1)
    80203fbc:	0094ca03          	lbu	s4,9(s1)
    80203fc0:	0104b983          	ld	s3,16(s1)
    80203fc4:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    80203fc8:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    80203fcc:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    80203fd0:	0001f517          	auipc	a0,0x1f
    80203fd4:	e5050513          	addi	a0,a0,-432 # 80222e20 <ftable>
    80203fd8:	ffffc097          	auipc	ra,0xffffc
    80203fdc:	742080e7          	jalr	1858(ra) # 8020071a <release>

  if(ff.type == FD_PIPE){
    80203fe0:	4785                	li	a5,1
    80203fe2:	04f90463          	beq	s2,a5,8020402a <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80203fe6:	4789                	li	a5,2
    80203fe8:	02f91863          	bne	s2,a5,80204018 <fileclose+0x96>
    eput(ff.ep);
    80203fec:	8556                	mv	a0,s5
    80203fee:	00003097          	auipc	ra,0x3
    80203ff2:	122080e7          	jalr	290(ra) # 80207110 <eput>
    80203ff6:	a00d                	j	80204018 <fileclose+0x96>
    panic("fileclose");
    80203ff8:	00007517          	auipc	a0,0x7
    80203ffc:	c6850513          	addi	a0,a0,-920 # 8020ac60 <digits+0x8e0>
    80204000:	ffffc097          	auipc	ra,0xffffc
    80204004:	144080e7          	jalr	324(ra) # 80200144 <panic>
    release(&ftable.lock);
    80204008:	0001f517          	auipc	a0,0x1f
    8020400c:	e1850513          	addi	a0,a0,-488 # 80222e20 <ftable>
    80204010:	ffffc097          	auipc	ra,0xffffc
    80204014:	70a080e7          	jalr	1802(ra) # 8020071a <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80204018:	70e2                	ld	ra,56(sp)
    8020401a:	7442                	ld	s0,48(sp)
    8020401c:	74a2                	ld	s1,40(sp)
    8020401e:	7902                	ld	s2,32(sp)
    80204020:	69e2                	ld	s3,24(sp)
    80204022:	6a42                	ld	s4,16(sp)
    80204024:	6aa2                	ld	s5,8(sp)
    80204026:	6121                	addi	sp,sp,64
    80204028:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    8020402a:	85d2                	mv	a1,s4
    8020402c:	854e                	mv	a0,s3
    8020402e:	00000097          	auipc	ra,0x0
    80204032:	4ac080e7          	jalr	1196(ra) # 802044da <pipeclose>
    80204036:	b7cd                	j	80204018 <fileclose+0x96>

0000000080204038 <filestat>:
filestat(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80204038:	4118                	lw	a4,0(a0)
    8020403a:	4789                	li	a5,2
    8020403c:	04f71e63          	bne	a4,a5,80204098 <filestat+0x60>
{
    80204040:	7159                	addi	sp,sp,-112
    80204042:	f486                	sd	ra,104(sp)
    80204044:	f0a2                	sd	s0,96(sp)
    80204046:	eca6                	sd	s1,88(sp)
    80204048:	e8ca                	sd	s2,80(sp)
    8020404a:	e4ce                	sd	s3,72(sp)
    8020404c:	1880                	addi	s0,sp,112
    8020404e:	84aa                	mv	s1,a0
    80204050:	892e                	mv	s2,a1
    elock(f->ep);
    80204052:	6d08                	ld	a0,24(a0)
    80204054:	00003097          	auipc	ra,0x3
    80204058:	038080e7          	jalr	56(ra) # 8020708c <elock>
    estat(f->ep, &st);
    8020405c:	f9840993          	addi	s3,s0,-104
    80204060:	85ce                	mv	a1,s3
    80204062:	6c88                	ld	a0,24(s1)
    80204064:	00003097          	auipc	ra,0x3
    80204068:	1e4080e7          	jalr	484(ra) # 80207248 <estat>
    eunlock(f->ep);
    8020406c:	6c88                	ld	a0,24(s1)
    8020406e:	00003097          	auipc	ra,0x3
    80204072:	054080e7          	jalr	84(ra) # 802070c2 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80204076:	03800613          	li	a2,56
    8020407a:	85ce                	mv	a1,s3
    8020407c:	854a                	mv	a0,s2
    8020407e:	ffffd097          	auipc	ra,0xffffd
    80204082:	2f4080e7          	jalr	756(ra) # 80201372 <copyout2>
    80204086:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    8020408a:	70a6                	ld	ra,104(sp)
    8020408c:	7406                	ld	s0,96(sp)
    8020408e:	64e6                	ld	s1,88(sp)
    80204090:	6946                	ld	s2,80(sp)
    80204092:	69a6                	ld	s3,72(sp)
    80204094:	6165                	addi	sp,sp,112
    80204096:	8082                	ret
  return -1;
    80204098:	557d                	li	a0,-1
}
    8020409a:	8082                	ret

000000008020409c <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    8020409c:	7179                	addi	sp,sp,-48
    8020409e:	f406                	sd	ra,40(sp)
    802040a0:	f022                	sd	s0,32(sp)
    802040a2:	ec26                	sd	s1,24(sp)
    802040a4:	e84a                	sd	s2,16(sp)
    802040a6:	e44e                	sd	s3,8(sp)
    802040a8:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    802040aa:	00854783          	lbu	a5,8(a0)
    802040ae:	c3d5                	beqz	a5,80204152 <fileread+0xb6>
    802040b0:	84aa                	mv	s1,a0
    802040b2:	89ae                	mv	s3,a1
    802040b4:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    802040b6:	411c                	lw	a5,0(a0)
    802040b8:	4709                	li	a4,2
    802040ba:	06e78263          	beq	a5,a4,8020411e <fileread+0x82>
    802040be:	470d                	li	a4,3
    802040c0:	02e78b63          	beq	a5,a4,802040f6 <fileread+0x5a>
    802040c4:	4705                	li	a4,1
    802040c6:	00e78a63          	beq	a5,a4,802040da <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    802040ca:	00007517          	auipc	a0,0x7
    802040ce:	ba650513          	addi	a0,a0,-1114 # 8020ac70 <digits+0x8f0>
    802040d2:	ffffc097          	auipc	ra,0xffffc
    802040d6:	072080e7          	jalr	114(ra) # 80200144 <panic>
        r = piperead(f->pipe, addr, n);
    802040da:	6908                	ld	a0,16(a0)
    802040dc:	00000097          	auipc	ra,0x0
    802040e0:	572080e7          	jalr	1394(ra) # 8020464e <piperead>
    802040e4:	892a                	mv	s2,a0
  }

  return r;
}
    802040e6:	854a                	mv	a0,s2
    802040e8:	70a2                	ld	ra,40(sp)
    802040ea:	7402                	ld	s0,32(sp)
    802040ec:	64e2                	ld	s1,24(sp)
    802040ee:	6942                	ld	s2,16(sp)
    802040f0:	69a2                	ld	s3,8(sp)
    802040f2:	6145                	addi	sp,sp,48
    802040f4:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    802040f6:	02451783          	lh	a5,36(a0)
    802040fa:	03079693          	slli	a3,a5,0x30
    802040fe:	92c1                	srli	a3,a3,0x30
    80204100:	4725                	li	a4,9
    80204102:	04d76a63          	bltu	a4,a3,80204156 <fileread+0xba>
    80204106:	0792                	slli	a5,a5,0x4
    80204108:	0001f717          	auipc	a4,0x1f
    8020410c:	c7870713          	addi	a4,a4,-904 # 80222d80 <devsw>
    80204110:	97ba                	add	a5,a5,a4
    80204112:	639c                	ld	a5,0(a5)
    80204114:	c3b9                	beqz	a5,8020415a <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80204116:	4505                	li	a0,1
    80204118:	9782                	jalr	a5
    8020411a:	892a                	mv	s2,a0
        break;
    8020411c:	b7e9                	j	802040e6 <fileread+0x4a>
        elock(f->ep);
    8020411e:	6d08                	ld	a0,24(a0)
    80204120:	00003097          	auipc	ra,0x3
    80204124:	f6c080e7          	jalr	-148(ra) # 8020708c <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80204128:	874a                	mv	a4,s2
    8020412a:	5094                	lw	a3,32(s1)
    8020412c:	864e                	mv	a2,s3
    8020412e:	4585                	li	a1,1
    80204130:	6c88                	ld	a0,24(s1)
    80204132:	00002097          	auipc	ra,0x2
    80204136:	656080e7          	jalr	1622(ra) # 80206788 <eread>
    8020413a:	892a                	mv	s2,a0
    8020413c:	00a05563          	blez	a0,80204146 <fileread+0xaa>
            f->off += r;
    80204140:	509c                	lw	a5,32(s1)
    80204142:	9fa9                	addw	a5,a5,a0
    80204144:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80204146:	6c88                	ld	a0,24(s1)
    80204148:	00003097          	auipc	ra,0x3
    8020414c:	f7a080e7          	jalr	-134(ra) # 802070c2 <eunlock>
        break;
    80204150:	bf59                	j	802040e6 <fileread+0x4a>
    return -1;
    80204152:	597d                	li	s2,-1
    80204154:	bf49                	j	802040e6 <fileread+0x4a>
          return -1;
    80204156:	597d                	li	s2,-1
    80204158:	b779                	j	802040e6 <fileread+0x4a>
    8020415a:	597d                	li	s2,-1
    8020415c:	b769                	j	802040e6 <fileread+0x4a>

000000008020415e <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    8020415e:	7179                	addi	sp,sp,-48
    80204160:	f406                	sd	ra,40(sp)
    80204162:	f022                	sd	s0,32(sp)
    80204164:	ec26                	sd	s1,24(sp)
    80204166:	e84a                	sd	s2,16(sp)
    80204168:	e44e                	sd	s3,8(sp)
    8020416a:	e052                	sd	s4,0(sp)
    8020416c:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    8020416e:	00954783          	lbu	a5,9(a0)
    80204172:	cbc5                	beqz	a5,80204222 <filewrite+0xc4>
    80204174:	84aa                	mv	s1,a0
    80204176:	892e                	mv	s2,a1
    80204178:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    8020417a:	411c                	lw	a5,0(a0)
    8020417c:	4705                	li	a4,1
    8020417e:	04e78963          	beq	a5,a4,802041d0 <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80204182:	470d                	li	a4,3
    80204184:	04e78d63          	beq	a5,a4,802041de <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80204188:	4709                	li	a4,2
    8020418a:	08e79463          	bne	a5,a4,80204212 <filewrite+0xb4>
    elock(f->ep);
    8020418e:	6d08                	ld	a0,24(a0)
    80204190:	00003097          	auipc	ra,0x3
    80204194:	efc080e7          	jalr	-260(ra) # 8020708c <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80204198:	00098a1b          	sext.w	s4,s3
    8020419c:	8752                	mv	a4,s4
    8020419e:	5094                	lw	a3,32(s1)
    802041a0:	864a                	mv	a2,s2
    802041a2:	4585                	li	a1,1
    802041a4:	6c88                	ld	a0,24(s1)
    802041a6:	00002097          	auipc	ra,0x2
    802041aa:	6da080e7          	jalr	1754(ra) # 80206880 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    802041ae:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    802041b0:	05350b63          	beq	a0,s3,80204206 <filewrite+0xa8>
    }
    eunlock(f->ep);
    802041b4:	6c88                	ld	a0,24(s1)
    802041b6:	00003097          	auipc	ra,0x3
    802041ba:	f0c080e7          	jalr	-244(ra) # 802070c2 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    802041be:	854a                	mv	a0,s2
    802041c0:	70a2                	ld	ra,40(sp)
    802041c2:	7402                	ld	s0,32(sp)
    802041c4:	64e2                	ld	s1,24(sp)
    802041c6:	6942                	ld	s2,16(sp)
    802041c8:	69a2                	ld	s3,8(sp)
    802041ca:	6a02                	ld	s4,0(sp)
    802041cc:	6145                	addi	sp,sp,48
    802041ce:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    802041d0:	6908                	ld	a0,16(a0)
    802041d2:	00000097          	auipc	ra,0x0
    802041d6:	378080e7          	jalr	888(ra) # 8020454a <pipewrite>
    802041da:	892a                	mv	s2,a0
    802041dc:	b7cd                	j	802041be <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    802041de:	02451783          	lh	a5,36(a0)
    802041e2:	03079693          	slli	a3,a5,0x30
    802041e6:	92c1                	srli	a3,a3,0x30
    802041e8:	4725                	li	a4,9
    802041ea:	02d76e63          	bltu	a4,a3,80204226 <filewrite+0xc8>
    802041ee:	0792                	slli	a5,a5,0x4
    802041f0:	0001f717          	auipc	a4,0x1f
    802041f4:	b9070713          	addi	a4,a4,-1136 # 80222d80 <devsw>
    802041f8:	97ba                	add	a5,a5,a4
    802041fa:	679c                	ld	a5,8(a5)
    802041fc:	c79d                	beqz	a5,8020422a <filewrite+0xcc>
    ret = devsw[f->major].write(1, addr, n);
    802041fe:	4505                	li	a0,1
    80204200:	9782                	jalr	a5
    80204202:	892a                	mv	s2,a0
    80204204:	bf6d                	j	802041be <filewrite+0x60>
      f->off += n;
    80204206:	509c                	lw	a5,32(s1)
    80204208:	014787bb          	addw	a5,a5,s4
    8020420c:	d09c                	sw	a5,32(s1)
      ret = n;
    8020420e:	894e                	mv	s2,s3
    80204210:	b755                	j	802041b4 <filewrite+0x56>
    panic("filewrite");
    80204212:	00007517          	auipc	a0,0x7
    80204216:	a6e50513          	addi	a0,a0,-1426 # 8020ac80 <digits+0x900>
    8020421a:	ffffc097          	auipc	ra,0xffffc
    8020421e:	f2a080e7          	jalr	-214(ra) # 80200144 <panic>
    return -1;
    80204222:	597d                	li	s2,-1
    80204224:	bf69                	j	802041be <filewrite+0x60>
      return -1;
    80204226:	597d                	li	s2,-1
    80204228:	bf59                	j	802041be <filewrite+0x60>
    8020422a:	597d                	li	s2,-1
    8020422c:	bf49                	j	802041be <filewrite+0x60>

000000008020422e <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    8020422e:	00854783          	lbu	a5,8(a0)
    80204232:	cfdd                	beqz	a5,802042f0 <dirnext+0xc2>
{
    80204234:	7141                	addi	sp,sp,-496
    80204236:	f786                	sd	ra,488(sp)
    80204238:	f3a2                	sd	s0,480(sp)
    8020423a:	efa6                	sd	s1,472(sp)
    8020423c:	ebca                	sd	s2,464(sp)
    8020423e:	e7ce                	sd	s3,456(sp)
    80204240:	e3d2                	sd	s4,448(sp)
    80204242:	ff56                	sd	s5,440(sp)
    80204244:	1b80                	addi	s0,sp,496
    80204246:	84aa                	mv	s1,a0
    80204248:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    8020424a:	6d18                	ld	a4,24(a0)
    8020424c:	10074783          	lbu	a5,256(a4)
    80204250:	8bc1                	andi	a5,a5,16
    return -1;
    80204252:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80204254:	eb91                	bnez	a5,80204268 <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
}
    80204256:	70be                	ld	ra,488(sp)
    80204258:	741e                	ld	s0,480(sp)
    8020425a:	64fe                	ld	s1,472(sp)
    8020425c:	695e                	ld	s2,464(sp)
    8020425e:	69be                	ld	s3,456(sp)
    80204260:	6a1e                	ld	s4,448(sp)
    80204262:	7afa                	ld	s5,440(sp)
    80204264:	617d                	addi	sp,sp,496
    80204266:	8082                	ret
  int count = 0;
    80204268:	e0042a23          	sw	zero,-492(s0)
  elock(f->ep);
    8020426c:	853a                	mv	a0,a4
    8020426e:	00003097          	auipc	ra,0x3
    80204272:	e1e080e7          	jalr	-482(ra) # 8020708c <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80204276:	e1440a13          	addi	s4,s0,-492
    8020427a:	e5040993          	addi	s3,s0,-432
    8020427e:	a801                	j	8020428e <dirnext+0x60>
    f->off += count * 32;
    80204280:	e1442783          	lw	a5,-492(s0)
    80204284:	0057979b          	slliw	a5,a5,0x5
    80204288:	5098                	lw	a4,32(s1)
    8020428a:	9fb9                	addw	a5,a5,a4
    8020428c:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    8020428e:	86d2                	mv	a3,s4
    80204290:	5090                	lw	a2,32(s1)
    80204292:	85ce                	mv	a1,s3
    80204294:	6c88                	ld	a0,24(s1)
    80204296:	00003097          	auipc	ra,0x3
    8020429a:	ffa080e7          	jalr	-6(ra) # 80207290 <enext>
    8020429e:	892a                	mv	s2,a0
    802042a0:	d165                	beqz	a0,80204280 <dirnext+0x52>
  eunlock(f->ep);
    802042a2:	6c88                	ld	a0,24(s1)
    802042a4:	00003097          	auipc	ra,0x3
    802042a8:	e1e080e7          	jalr	-482(ra) # 802070c2 <eunlock>
  if (ret == -1)
    802042ac:	57fd                	li	a5,-1
    return 0;
    802042ae:	4501                	li	a0,0
  if (ret == -1)
    802042b0:	faf903e3          	beq	s2,a5,80204256 <dirnext+0x28>
  f->off += count * 32;
    802042b4:	e1442783          	lw	a5,-492(s0)
    802042b8:	0057979b          	slliw	a5,a5,0x5
    802042bc:	5098                	lw	a4,32(s1)
    802042be:	9fb9                	addw	a5,a5,a4
    802042c0:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    802042c2:	e1840493          	addi	s1,s0,-488
    802042c6:	85a6                	mv	a1,s1
    802042c8:	e5040513          	addi	a0,s0,-432
    802042cc:	00003097          	auipc	ra,0x3
    802042d0:	f7c080e7          	jalr	-132(ra) # 80207248 <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    802042d4:	03800613          	li	a2,56
    802042d8:	85a6                	mv	a1,s1
    802042da:	8556                	mv	a0,s5
    802042dc:	ffffd097          	auipc	ra,0xffffd
    802042e0:	096080e7          	jalr	150(ra) # 80201372 <copyout2>
    return -1;
    802042e4:	fff54513          	not	a0,a0
    802042e8:	957d                	srai	a0,a0,0x3f
    802042ea:	8909                	andi	a0,a0,2
    802042ec:	157d                	addi	a0,a0,-1
    802042ee:	b7a5                	j	80204256 <dirnext+0x28>
    return -1;
    802042f0:	557d                	li	a0,-1
}
    802042f2:	8082                	ret

00000000802042f4 <dirnext_>:
//  eunlock(f->ep);
//  f->off += count * 32;
//  return ret_size - len;
//}

int dirnext_(struct file *f, uint64 buffer, int len){
    802042f4:	7165                	addi	sp,sp,-400
    802042f6:	e706                	sd	ra,392(sp)
    802042f8:	e322                	sd	s0,384(sp)
    802042fa:	fea6                	sd	s1,376(sp)
    802042fc:	faca                	sd	s2,368(sp)
    802042fe:	f6ce                	sd	s3,360(sp)
    80204300:	f2d2                	sd	s4,352(sp)
    80204302:	eed6                	sd	s5,344(sp)
    80204304:	eada                	sd	s6,336(sp)
    80204306:	e6de                	sd	s7,328(sp)
    80204308:	e2e2                	sd	s8,320(sp)
    8020430a:	fe66                	sd	s9,312(sp)
    8020430c:	fa6a                	sd	s10,304(sp)
    8020430e:	f66e                	sd	s11,296(sp)
    80204310:	0b00                	addi	s0,sp,400
  struct __dirent__ *buf = (struct __dirent__ *)buffer, de;

  struct dirent *ep = f->ep, *d;
    80204312:	01853903          	ld	s2,24(a0)
  if (ep == NULL)
    80204316:	0e090163          	beqz	s2,802043f8 <dirnext_+0x104>
    8020431a:	8aaa                	mv	s5,a0
    8020431c:	8c2e                	mv	s8,a1
    8020431e:	8bb2                	mv	s7,a2
    return -1;

  int i = 0, sum_s = 0;
  for (d = eroot(); d->next; d = d->next)
    80204320:	00003097          	auipc	ra,0x3
    80204324:	676080e7          	jalr	1654(ra) # 80207996 <eroot>
    80204328:	84aa                	mv	s1,a0
    8020432a:	12853783          	ld	a5,296(a0)
    8020432e:	c7f9                	beqz	a5,802043fc <dirnext_+0x108>
  int i = 0, sum_s = 0;
    80204330:	4981                	li	s3,0
    80204332:	4d81                	li	s11,0
  {
    if (d->parent == ep)
    {
      de.d_ino = (long)d->parent + d->off;
      de.d_off = d - d->next;
    80204334:	00007d17          	auipc	s10,0x7
    80204338:	95cd0d13          	addi	s10,s10,-1700 # 8020ac90 <digits+0x910>
      de.d_reclen = sizeof(de);
    8020433c:	11800b13          	li	s6,280
      de.d_type = f->type;
      safestrcpy(de.d_name, d->filename, sizeof(d->filename));
    80204340:	e8b40c93          	addi	s9,s0,-373

      if (sum_s + sizeof(de) > len)
        return sum_s;
      sum_s += sizeof(de);
      buf[i++] = de;
    80204344:	f9040a13          	addi	s4,s0,-112
    80204348:	a091                	j	8020438c <dirnext_+0x98>
      sum_s += sizeof(de);
    8020434a:	1189899b          	addiw	s3,s3,280
      buf[i++] = de;
    8020434e:	001d889b          	addiw	a7,s11,1 # 1001 <_entry-0x801fefff>
    80204352:	036d8733          	mul	a4,s11,s6
    80204356:	e7840793          	addi	a5,s0,-392
    8020435a:	9762                	add	a4,a4,s8
    8020435c:	0007b803          	ld	a6,0(a5)
    80204360:	6788                	ld	a0,8(a5)
    80204362:	6b8c                	ld	a1,16(a5)
    80204364:	6f90                	ld	a2,24(a5)
    80204366:	7394                	ld	a3,32(a5)
    80204368:	01073023          	sd	a6,0(a4)
    8020436c:	e708                	sd	a0,8(a4)
    8020436e:	eb0c                	sd	a1,16(a4)
    80204370:	ef10                	sd	a2,24(a4)
    80204372:	f314                	sd	a3,32(a4)
    80204374:	02878793          	addi	a5,a5,40
    80204378:	02870713          	addi	a4,a4,40
    8020437c:	ff4790e3          	bne	a5,s4,8020435c <dirnext_+0x68>
    80204380:	8dc6                	mv	s11,a7
  for (d = eroot(); d->next; d = d->next)
    80204382:	1284b483          	ld	s1,296(s1)
    80204386:	1284b783          	ld	a5,296(s1)
    8020438a:	c7b1                	beqz	a5,802043d6 <dirnext_+0xe2>
    if (d->parent == ep)
    8020438c:	1204b703          	ld	a4,288(s1)
    80204390:	ff2719e3          	bne	a4,s2,80204382 <dirnext_+0x8e>
      de.d_ino = (long)d->parent + d->off;
    80204394:	11c4e683          	lwu	a3,284(s1)
    80204398:	9736                	add	a4,a4,a3
    8020439a:	e6e43c23          	sd	a4,-392(s0)
      de.d_off = d - d->next;
    8020439e:	40f487b3          	sub	a5,s1,a5
    802043a2:	8791                	srai	a5,a5,0x4
    802043a4:	000d3703          	ld	a4,0(s10)
    802043a8:	02e787b3          	mul	a5,a5,a4
    802043ac:	e8f43023          	sd	a5,-384(s0)
      de.d_reclen = sizeof(de);
    802043b0:	e9641423          	sh	s6,-376(s0)
      de.d_type = f->type;
    802043b4:	000aa783          	lw	a5,0(s5)
    802043b8:	e8f40523          	sb	a5,-374(s0)
      safestrcpy(de.d_name, d->filename, sizeof(d->filename));
    802043bc:	10000613          	li	a2,256
    802043c0:	85a6                	mv	a1,s1
    802043c2:	8566                	mv	a0,s9
    802043c4:	ffffc097          	auipc	ra,0xffffc
    802043c8:	4f0080e7          	jalr	1264(ra) # 802008b4 <safestrcpy>
      if (sum_s + sizeof(de) > len)
    802043cc:	11898793          	addi	a5,s3,280
    802043d0:	f6fbfde3          	bgeu	s7,a5,8020434a <dirnext_+0x56>
    802043d4:	a011                	j	802043d8 <dirnext_+0xe4>
    }
  }
  return 0;
    802043d6:	4981                	li	s3,0
}
    802043d8:	854e                	mv	a0,s3
    802043da:	60ba                	ld	ra,392(sp)
    802043dc:	641a                	ld	s0,384(sp)
    802043de:	74f6                	ld	s1,376(sp)
    802043e0:	7956                	ld	s2,368(sp)
    802043e2:	79b6                	ld	s3,360(sp)
    802043e4:	7a16                	ld	s4,352(sp)
    802043e6:	6af6                	ld	s5,344(sp)
    802043e8:	6b56                	ld	s6,336(sp)
    802043ea:	6bb6                	ld	s7,328(sp)
    802043ec:	6c16                	ld	s8,320(sp)
    802043ee:	7cf2                	ld	s9,312(sp)
    802043f0:	7d52                	ld	s10,304(sp)
    802043f2:	7db2                	ld	s11,296(sp)
    802043f4:	6159                	addi	sp,sp,400
    802043f6:	8082                	ret
    return -1;
    802043f8:	59fd                	li	s3,-1
    802043fa:	bff9                	j	802043d8 <dirnext_+0xe4>
  return 0;
    802043fc:	4981                	li	s3,0
    802043fe:	bfe9                	j	802043d8 <dirnext_+0xe4>

0000000080204400 <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    80204400:	7179                	addi	sp,sp,-48
    80204402:	f406                	sd	ra,40(sp)
    80204404:	f022                	sd	s0,32(sp)
    80204406:	ec26                	sd	s1,24(sp)
    80204408:	e84a                	sd	s2,16(sp)
    8020440a:	e44e                	sd	s3,8(sp)
    8020440c:	e052                	sd	s4,0(sp)
    8020440e:	1800                	addi	s0,sp,48
    80204410:	84aa                	mv	s1,a0
    80204412:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    80204414:	0005b023          	sd	zero,0(a1)
    80204418:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    8020441c:	00000097          	auipc	ra,0x0
    80204420:	aaa080e7          	jalr	-1366(ra) # 80203ec6 <filealloc>
    80204424:	e088                	sd	a0,0(s1)
    80204426:	c551                	beqz	a0,802044b2 <pipealloc+0xb2>
    80204428:	00000097          	auipc	ra,0x0
    8020442c:	a9e080e7          	jalr	-1378(ra) # 80203ec6 <filealloc>
    80204430:	00aa3023          	sd	a0,0(s4)
    80204434:	c92d                	beqz	a0,802044a6 <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80204436:	ffffc097          	auipc	ra,0xffffc
    8020443a:	124080e7          	jalr	292(ra) # 8020055a <kalloc>
    8020443e:	892a                	mv	s2,a0
    80204440:	c125                	beqz	a0,802044a0 <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    80204442:	4985                	li	s3,1
    80204444:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80204448:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    8020444c:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    80204450:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80204454:	00006597          	auipc	a1,0x6
    80204458:	58458593          	addi	a1,a1,1412 # 8020a9d8 <digits+0x658>
    8020445c:	ffffc097          	auipc	ra,0xffffc
    80204460:	226080e7          	jalr	550(ra) # 80200682 <initlock>
  (*f0)->type = FD_PIPE;
    80204464:	609c                	ld	a5,0(s1)
    80204466:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    8020446a:	609c                	ld	a5,0(s1)
    8020446c:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    80204470:	609c                	ld	a5,0(s1)
    80204472:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80204476:	609c                	ld	a5,0(s1)
    80204478:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    8020447c:	000a3783          	ld	a5,0(s4)
    80204480:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    80204484:	000a3783          	ld	a5,0(s4)
    80204488:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    8020448c:	000a3783          	ld	a5,0(s4)
    80204490:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    80204494:	000a3783          	ld	a5,0(s4)
    80204498:	0127b823          	sd	s2,16(a5)
  return 0;
    8020449c:	4501                	li	a0,0
    8020449e:	a025                	j	802044c6 <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    802044a0:	6088                	ld	a0,0(s1)
    802044a2:	e501                	bnez	a0,802044aa <pipealloc+0xaa>
    802044a4:	a039                	j	802044b2 <pipealloc+0xb2>
    802044a6:	6088                	ld	a0,0(s1)
    802044a8:	c51d                	beqz	a0,802044d6 <pipealloc+0xd6>
    fileclose(*f0);
    802044aa:	00000097          	auipc	ra,0x0
    802044ae:	ad8080e7          	jalr	-1320(ra) # 80203f82 <fileclose>
  if(*f1)
    802044b2:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    802044b6:	557d                	li	a0,-1
  if(*f1)
    802044b8:	c799                	beqz	a5,802044c6 <pipealloc+0xc6>
    fileclose(*f1);
    802044ba:	853e                	mv	a0,a5
    802044bc:	00000097          	auipc	ra,0x0
    802044c0:	ac6080e7          	jalr	-1338(ra) # 80203f82 <fileclose>
  return -1;
    802044c4:	557d                	li	a0,-1
}
    802044c6:	70a2                	ld	ra,40(sp)
    802044c8:	7402                	ld	s0,32(sp)
    802044ca:	64e2                	ld	s1,24(sp)
    802044cc:	6942                	ld	s2,16(sp)
    802044ce:	69a2                	ld	s3,8(sp)
    802044d0:	6a02                	ld	s4,0(sp)
    802044d2:	6145                	addi	sp,sp,48
    802044d4:	8082                	ret
  return -1;
    802044d6:	557d                	li	a0,-1
    802044d8:	b7fd                	j	802044c6 <pipealloc+0xc6>

00000000802044da <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    802044da:	1101                	addi	sp,sp,-32
    802044dc:	ec06                	sd	ra,24(sp)
    802044de:	e822                	sd	s0,16(sp)
    802044e0:	e426                	sd	s1,8(sp)
    802044e2:	e04a                	sd	s2,0(sp)
    802044e4:	1000                	addi	s0,sp,32
    802044e6:	84aa                	mv	s1,a0
    802044e8:	892e                	mv	s2,a1
  acquire(&pi->lock);
    802044ea:	ffffc097          	auipc	ra,0xffffc
    802044ee:	1dc080e7          	jalr	476(ra) # 802006c6 <acquire>
  if(writable){
    802044f2:	02090d63          	beqz	s2,8020452c <pipeclose+0x52>
    pi->writeopen = 0;
    802044f6:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    802044fa:	21848513          	addi	a0,s1,536
    802044fe:	ffffe097          	auipc	ra,0xffffe
    80204502:	ff4080e7          	jalr	-12(ra) # 802024f2 <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80204506:	2204b783          	ld	a5,544(s1)
    8020450a:	eb95                	bnez	a5,8020453e <pipeclose+0x64>
    release(&pi->lock);
    8020450c:	8526                	mv	a0,s1
    8020450e:	ffffc097          	auipc	ra,0xffffc
    80204512:	20c080e7          	jalr	524(ra) # 8020071a <release>
    kfree((char*)pi);
    80204516:	8526                	mv	a0,s1
    80204518:	ffffc097          	auipc	ra,0xffffc
    8020451c:	f28080e7          	jalr	-216(ra) # 80200440 <kfree>
  } else
    release(&pi->lock);
}
    80204520:	60e2                	ld	ra,24(sp)
    80204522:	6442                	ld	s0,16(sp)
    80204524:	64a2                	ld	s1,8(sp)
    80204526:	6902                	ld	s2,0(sp)
    80204528:	6105                	addi	sp,sp,32
    8020452a:	8082                	ret
    pi->readopen = 0;
    8020452c:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    80204530:	21c48513          	addi	a0,s1,540
    80204534:	ffffe097          	auipc	ra,0xffffe
    80204538:	fbe080e7          	jalr	-66(ra) # 802024f2 <wakeup>
    8020453c:	b7e9                	j	80204506 <pipeclose+0x2c>
    release(&pi->lock);
    8020453e:	8526                	mv	a0,s1
    80204540:	ffffc097          	auipc	ra,0xffffc
    80204544:	1da080e7          	jalr	474(ra) # 8020071a <release>
}
    80204548:	bfe1                	j	80204520 <pipeclose+0x46>

000000008020454a <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    8020454a:	7159                	addi	sp,sp,-112
    8020454c:	f486                	sd	ra,104(sp)
    8020454e:	f0a2                	sd	s0,96(sp)
    80204550:	eca6                	sd	s1,88(sp)
    80204552:	e8ca                	sd	s2,80(sp)
    80204554:	e4ce                	sd	s3,72(sp)
    80204556:	e0d2                	sd	s4,64(sp)
    80204558:	fc56                	sd	s5,56(sp)
    8020455a:	f85a                	sd	s6,48(sp)
    8020455c:	f45e                	sd	s7,40(sp)
    8020455e:	f062                	sd	s8,32(sp)
    80204560:	ec66                	sd	s9,24(sp)
    80204562:	1880                	addi	s0,sp,112
    80204564:	84aa                	mv	s1,a0
    80204566:	8b2e                	mv	s6,a1
    80204568:	8ab2                	mv	s5,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    8020456a:	ffffd097          	auipc	ra,0xffffd
    8020456e:	54c080e7          	jalr	1356(ra) # 80201ab6 <myproc>
    80204572:	892a                	mv	s2,a0

  acquire(&pi->lock);
    80204574:	8526                	mv	a0,s1
    80204576:	ffffc097          	auipc	ra,0xffffc
    8020457a:	150080e7          	jalr	336(ra) # 802006c6 <acquire>
  for(i = 0; i < n; i++){
    8020457e:	09505763          	blez	s5,8020460c <pipewrite+0xc2>
    80204582:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    80204584:	21848a13          	addi	s4,s1,536
      sleep(&pi->nwrite, &pi->lock);
    80204588:	21c48993          	addi	s3,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    8020458c:	f9f40c93          	addi	s9,s0,-97
    80204590:	5c7d                	li	s8,-1
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80204592:	2184a783          	lw	a5,536(s1)
    80204596:	21c4a703          	lw	a4,540(s1)
    8020459a:	2007879b          	addiw	a5,a5,512
    8020459e:	02f71b63          	bne	a4,a5,802045d4 <pipewrite+0x8a>
      if(pi->readopen == 0 || pr->killed){
    802045a2:	2204a783          	lw	a5,544(s1)
    802045a6:	c3c1                	beqz	a5,80204626 <pipewrite+0xdc>
    802045a8:	03092783          	lw	a5,48(s2)
    802045ac:	efad                	bnez	a5,80204626 <pipewrite+0xdc>
      wakeup(&pi->nread);
    802045ae:	8552                	mv	a0,s4
    802045b0:	ffffe097          	auipc	ra,0xffffe
    802045b4:	f42080e7          	jalr	-190(ra) # 802024f2 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    802045b8:	85a6                	mv	a1,s1
    802045ba:	854e                	mv	a0,s3
    802045bc:	ffffe097          	auipc	ra,0xffffe
    802045c0:	dba080e7          	jalr	-582(ra) # 80202376 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    802045c4:	2184a783          	lw	a5,536(s1)
    802045c8:	21c4a703          	lw	a4,540(s1)
    802045cc:	2007879b          	addiw	a5,a5,512
    802045d0:	fcf709e3          	beq	a4,a5,802045a2 <pipewrite+0x58>
    if(copyin2(&ch, addr + i, 1) == -1)
    802045d4:	4605                	li	a2,1
    802045d6:	85da                	mv	a1,s6
    802045d8:	8566                	mv	a0,s9
    802045da:	ffffd097          	auipc	ra,0xffffd
    802045de:	eca080e7          	jalr	-310(ra) # 802014a4 <copyin2>
    802045e2:	03850663          	beq	a0,s8,8020460e <pipewrite+0xc4>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    802045e6:	21c4a783          	lw	a5,540(s1)
    802045ea:	0017871b          	addiw	a4,a5,1
    802045ee:	20e4ae23          	sw	a4,540(s1)
    802045f2:	1ff7f793          	andi	a5,a5,511
    802045f6:	97a6                	add	a5,a5,s1
    802045f8:	f9f44703          	lbu	a4,-97(s0)
    802045fc:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    80204600:	2b85                	addiw	s7,s7,1
    80204602:	0b05                	addi	s6,s6,1
    80204604:	f97a97e3          	bne	s5,s7,80204592 <pipewrite+0x48>
    80204608:	8bd6                	mv	s7,s5
    8020460a:	a011                	j	8020460e <pipewrite+0xc4>
    8020460c:	4b81                	li	s7,0
  }
  wakeup(&pi->nread);
    8020460e:	21848513          	addi	a0,s1,536
    80204612:	ffffe097          	auipc	ra,0xffffe
    80204616:	ee0080e7          	jalr	-288(ra) # 802024f2 <wakeup>
  release(&pi->lock);
    8020461a:	8526                	mv	a0,s1
    8020461c:	ffffc097          	auipc	ra,0xffffc
    80204620:	0fe080e7          	jalr	254(ra) # 8020071a <release>
  return i;
    80204624:	a039                	j	80204632 <pipewrite+0xe8>
        release(&pi->lock);
    80204626:	8526                	mv	a0,s1
    80204628:	ffffc097          	auipc	ra,0xffffc
    8020462c:	0f2080e7          	jalr	242(ra) # 8020071a <release>
        return -1;
    80204630:	5bfd                	li	s7,-1
}
    80204632:	855e                	mv	a0,s7
    80204634:	70a6                	ld	ra,104(sp)
    80204636:	7406                	ld	s0,96(sp)
    80204638:	64e6                	ld	s1,88(sp)
    8020463a:	6946                	ld	s2,80(sp)
    8020463c:	69a6                	ld	s3,72(sp)
    8020463e:	6a06                	ld	s4,64(sp)
    80204640:	7ae2                	ld	s5,56(sp)
    80204642:	7b42                	ld	s6,48(sp)
    80204644:	7ba2                	ld	s7,40(sp)
    80204646:	7c02                	ld	s8,32(sp)
    80204648:	6ce2                	ld	s9,24(sp)
    8020464a:	6165                	addi	sp,sp,112
    8020464c:	8082                	ret

000000008020464e <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    8020464e:	715d                	addi	sp,sp,-80
    80204650:	e486                	sd	ra,72(sp)
    80204652:	e0a2                	sd	s0,64(sp)
    80204654:	fc26                	sd	s1,56(sp)
    80204656:	f84a                	sd	s2,48(sp)
    80204658:	f44e                	sd	s3,40(sp)
    8020465a:	f052                	sd	s4,32(sp)
    8020465c:	ec56                	sd	s5,24(sp)
    8020465e:	e85a                	sd	s6,16(sp)
    80204660:	0880                	addi	s0,sp,80
    80204662:	84aa                	mv	s1,a0
    80204664:	892e                	mv	s2,a1
    80204666:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    80204668:	ffffd097          	auipc	ra,0xffffd
    8020466c:	44e080e7          	jalr	1102(ra) # 80201ab6 <myproc>
    80204670:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    80204672:	8526                	mv	a0,s1
    80204674:	ffffc097          	auipc	ra,0xffffc
    80204678:	052080e7          	jalr	82(ra) # 802006c6 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8020467c:	2184a703          	lw	a4,536(s1)
    80204680:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80204684:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204688:	02f71463          	bne	a4,a5,802046b0 <piperead+0x62>
    8020468c:	2244a783          	lw	a5,548(s1)
    80204690:	c385                	beqz	a5,802046b0 <piperead+0x62>
    if(pr->killed){
    80204692:	0309a783          	lw	a5,48(s3)
    80204696:	ebc1                	bnez	a5,80204726 <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80204698:	85a6                	mv	a1,s1
    8020469a:	8556                	mv	a0,s5
    8020469c:	ffffe097          	auipc	ra,0xffffe
    802046a0:	cda080e7          	jalr	-806(ra) # 80202376 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    802046a4:	2184a703          	lw	a4,536(s1)
    802046a8:	21c4a783          	lw	a5,540(s1)
    802046ac:	fef700e3          	beq	a4,a5,8020468c <piperead+0x3e>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802046b0:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    802046b2:	fbf40b13          	addi	s6,s0,-65
    802046b6:	5afd                	li	s5,-1
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802046b8:	05405163          	blez	s4,802046fa <piperead+0xac>
    if(pi->nread == pi->nwrite)
    802046bc:	2184a783          	lw	a5,536(s1)
    802046c0:	21c4a703          	lw	a4,540(s1)
    802046c4:	02f70b63          	beq	a4,a5,802046fa <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    802046c8:	0017871b          	addiw	a4,a5,1
    802046cc:	20e4ac23          	sw	a4,536(s1)
    802046d0:	1ff7f793          	andi	a5,a5,511
    802046d4:	97a6                	add	a5,a5,s1
    802046d6:	0187c783          	lbu	a5,24(a5)
    802046da:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    802046de:	4605                	li	a2,1
    802046e0:	85da                	mv	a1,s6
    802046e2:	854a                	mv	a0,s2
    802046e4:	ffffd097          	auipc	ra,0xffffd
    802046e8:	c8e080e7          	jalr	-882(ra) # 80201372 <copyout2>
    802046ec:	01550763          	beq	a0,s5,802046fa <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802046f0:	2985                	addiw	s3,s3,1
    802046f2:	0905                	addi	s2,s2,1
    802046f4:	fd3a14e3          	bne	s4,s3,802046bc <piperead+0x6e>
    802046f8:	89d2                	mv	s3,s4
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    802046fa:	21c48513          	addi	a0,s1,540
    802046fe:	ffffe097          	auipc	ra,0xffffe
    80204702:	df4080e7          	jalr	-524(ra) # 802024f2 <wakeup>
  release(&pi->lock);
    80204706:	8526                	mv	a0,s1
    80204708:	ffffc097          	auipc	ra,0xffffc
    8020470c:	012080e7          	jalr	18(ra) # 8020071a <release>
  return i;
}
    80204710:	854e                	mv	a0,s3
    80204712:	60a6                	ld	ra,72(sp)
    80204714:	6406                	ld	s0,64(sp)
    80204716:	74e2                	ld	s1,56(sp)
    80204718:	7942                	ld	s2,48(sp)
    8020471a:	79a2                	ld	s3,40(sp)
    8020471c:	7a02                	ld	s4,32(sp)
    8020471e:	6ae2                	ld	s5,24(sp)
    80204720:	6b42                	ld	s6,16(sp)
    80204722:	6161                	addi	sp,sp,80
    80204724:	8082                	ret
      release(&pi->lock);
    80204726:	8526                	mv	a0,s1
    80204728:	ffffc097          	auipc	ra,0xffffc
    8020472c:	ff2080e7          	jalr	-14(ra) # 8020071a <release>
      return -1;
    80204730:	59fd                	li	s3,-1
    80204732:	bff9                	j	80204710 <piperead+0xc2>

0000000080204734 <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    80204734:	dd010113          	addi	sp,sp,-560
    80204738:	22113423          	sd	ra,552(sp)
    8020473c:	22813023          	sd	s0,544(sp)
    80204740:	20913c23          	sd	s1,536(sp)
    80204744:	21213823          	sd	s2,528(sp)
    80204748:	21313423          	sd	s3,520(sp)
    8020474c:	21413023          	sd	s4,512(sp)
    80204750:	ffd6                	sd	s5,504(sp)
    80204752:	fbda                	sd	s6,496(sp)
    80204754:	f7de                	sd	s7,488(sp)
    80204756:	f3e2                	sd	s8,480(sp)
    80204758:	efe6                	sd	s9,472(sp)
    8020475a:	ebea                	sd	s10,464(sp)
    8020475c:	e7ee                	sd	s11,456(sp)
    8020475e:	1c00                	addi	s0,sp,560
    80204760:	892a                	mv	s2,a0
    80204762:	dca43c23          	sd	a0,-552(s0)
    80204766:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    8020476a:	ffffd097          	auipc	ra,0xffffd
    8020476e:	34c080e7          	jalr	844(ra) # 80201ab6 <myproc>
    80204772:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    80204774:	ffffc097          	auipc	ra,0xffffc
    80204778:	de6080e7          	jalr	-538(ra) # 8020055a <kalloc>
    8020477c:	2a050863          	beqz	a0,80204a2c <exec+0x2f8>
    80204780:	8b2a                	mv	s6,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    80204782:	6605                	lui	a2,0x1
    80204784:	6cac                	ld	a1,88(s1)
    80204786:	ffffc097          	auipc	ra,0xffffc
    8020478a:	038080e7          	jalr	56(ra) # 802007be <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    8020478e:	000b3023          	sd	zero,0(s6)
    80204792:	000b3423          	sd	zero,8(s6)
  }

  if((ep = ename(path)) == NULL) {
    80204796:	854a                	mv	a0,s2
    80204798:	00003097          	auipc	ra,0x3
    8020479c:	148080e7          	jalr	328(ra) # 802078e0 <ename>
    802047a0:	8a2a                	mv	s4,a0
    802047a2:	3a050e63          	beqz	a0,80204b5e <exec+0x42a>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    802047a6:	00003097          	auipc	ra,0x3
    802047aa:	8e6080e7          	jalr	-1818(ra) # 8020708c <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    802047ae:	04000713          	li	a4,64
    802047b2:	4681                	li	a3,0
    802047b4:	e4840613          	addi	a2,s0,-440
    802047b8:	4581                	li	a1,0
    802047ba:	8552                	mv	a0,s4
    802047bc:	00002097          	auipc	ra,0x2
    802047c0:	fcc080e7          	jalr	-52(ra) # 80206788 <eread>
    802047c4:	04000793          	li	a5,64
    802047c8:	00f51a63          	bne	a0,a5,802047dc <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    802047cc:	e4842703          	lw	a4,-440(s0)
    802047d0:	464c47b7          	lui	a5,0x464c4
    802047d4:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    802047d8:	00f70963          	beq	a4,a5,802047ea <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    802047dc:	4581                	li	a1,0
    802047de:	855a                	mv	a0,s6
    802047e0:	ffffd097          	auipc	ra,0xffffd
    802047e4:	ee4080e7          	jalr	-284(ra) # 802016c4 <kvmfree>
  if(ep){
    802047e8:	a4bd                	j	80204a56 <exec+0x322>
  if((pagetable = proc_pagetable(p)) == NULL)
    802047ea:	8526                	mv	a0,s1
    802047ec:	ffffd097          	auipc	ra,0xffffd
    802047f0:	3ae080e7          	jalr	942(ra) # 80201b9a <proc_pagetable>
    802047f4:	e0a43423          	sd	a0,-504(s0)
    802047f8:	d175                	beqz	a0,802047dc <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802047fa:	e6842783          	lw	a5,-408(s0)
    802047fe:	e8045703          	lhu	a4,-384(s0)
    80204802:	cb3d                	beqz	a4,80204878 <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80204804:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204806:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    8020480a:	e1040713          	addi	a4,s0,-496
    8020480e:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    80204812:	6a85                	lui	s5,0x1
    80204814:	fffa8713          	addi	a4,s5,-1 # fff <_entry-0x801ff001>
    80204818:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    8020481c:	6d85                	lui	s11,0x1
    8020481e:	7d7d                	lui	s10,0xfffff
    80204820:	a4c9                	j	80204ae2 <exec+0x3ae>
      panic("loadseg: address should exist");
    80204822:	00006517          	auipc	a0,0x6
    80204826:	47650513          	addi	a0,a0,1142 # 8020ac98 <digits+0x918>
    8020482a:	ffffc097          	auipc	ra,0xffffc
    8020482e:	91a080e7          	jalr	-1766(ra) # 80200144 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    80204832:	874a                	mv	a4,s2
    80204834:	009c86bb          	addw	a3,s9,s1
    80204838:	4581                	li	a1,0
    8020483a:	8552                	mv	a0,s4
    8020483c:	00002097          	auipc	ra,0x2
    80204840:	f4c080e7          	jalr	-180(ra) # 80206788 <eread>
    80204844:	2501                	sext.w	a0,a0
    80204846:	1ea91763          	bne	s2,a0,80204a34 <exec+0x300>
  for(i = 0; i < sz; i += PGSIZE){
    8020484a:	009d84bb          	addw	s1,s11,s1
    8020484e:	013d09bb          	addw	s3,s10,s3
    80204852:	2774f863          	bgeu	s1,s7,80204ac2 <exec+0x38e>
    pa = walkaddr(pagetable, va + i);
    80204856:	02049593          	slli	a1,s1,0x20
    8020485a:	9181                	srli	a1,a1,0x20
    8020485c:	95e2                	add	a1,a1,s8
    8020485e:	e0843503          	ld	a0,-504(s0)
    80204862:	ffffc097          	auipc	ra,0xffffc
    80204866:	34c080e7          	jalr	844(ra) # 80200bae <walkaddr>
    8020486a:	862a                	mv	a2,a0
    if(pa == NULL)
    8020486c:	d95d                	beqz	a0,80204822 <exec+0xee>
      n = PGSIZE;
    8020486e:	8956                	mv	s2,s5
    if(sz - i < PGSIZE)
    80204870:	fd59f1e3          	bgeu	s3,s5,80204832 <exec+0xfe>
      n = sz - i;
    80204874:	894e                	mv	s2,s3
    80204876:	bf75                	j	80204832 <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80204878:	4481                	li	s1,0
  eunlock(ep);
    8020487a:	8552                	mv	a0,s4
    8020487c:	00003097          	auipc	ra,0x3
    80204880:	846080e7          	jalr	-1978(ra) # 802070c2 <eunlock>
  eput(ep);
    80204884:	8552                	mv	a0,s4
    80204886:	00003097          	auipc	ra,0x3
    8020488a:	88a080e7          	jalr	-1910(ra) # 80207110 <eput>
  p = myproc();
    8020488e:	ffffd097          	auipc	ra,0xffffd
    80204892:	228080e7          	jalr	552(ra) # 80201ab6 <myproc>
    80204896:	8aaa                	mv	s5,a0
  uint64 oldsz = p->sz;
    80204898:	04853d03          	ld	s10,72(a0)
  sz = PGROUNDUP(sz);
    8020489c:	6785                	lui	a5,0x1
    8020489e:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    802048a0:	97a6                	add	a5,a5,s1
    802048a2:	777d                	lui	a4,0xfffff
    802048a4:	8ff9                	and	a5,a5,a4
    802048a6:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802048aa:	6689                	lui	a3,0x2
    802048ac:	96be                	add	a3,a3,a5
    802048ae:	863e                	mv	a2,a5
    802048b0:	85da                	mv	a1,s6
    802048b2:	e0843483          	ld	s1,-504(s0)
    802048b6:	8526                	mv	a0,s1
    802048b8:	ffffc097          	auipc	ra,0xffffc
    802048bc:	752080e7          	jalr	1874(ra) # 8020100a <uvmalloc>
    802048c0:	8caa                	mv	s9,a0
  ep = 0;
    802048c2:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802048c4:	16050863          	beqz	a0,80204a34 <exec+0x300>
  uvmclear(pagetable, sz-2*PGSIZE);
    802048c8:	75f9                	lui	a1,0xffffe
    802048ca:	95aa                	add	a1,a1,a0
    802048cc:	8526                	mv	a0,s1
    802048ce:	ffffd097          	auipc	ra,0xffffd
    802048d2:	9e6080e7          	jalr	-1562(ra) # 802012b4 <uvmclear>
  stackbase = sp - PGSIZE;
    802048d6:	7bfd                	lui	s7,0xfffff
    802048d8:	9be6                	add	s7,s7,s9
  for(argc = 0; argv[argc]; argc++) {
    802048da:	de843783          	ld	a5,-536(s0)
    802048de:	6388                	ld	a0,0(a5)
    802048e0:	c92d                	beqz	a0,80204952 <exec+0x21e>
    802048e2:	e8840993          	addi	s3,s0,-376
    802048e6:	f8840c13          	addi	s8,s0,-120
  sp = sz;
    802048ea:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    802048ec:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    802048ee:	ffffc097          	auipc	ra,0xffffc
    802048f2:	ff8080e7          	jalr	-8(ra) # 802008e6 <strlen>
    802048f6:	0015079b          	addiw	a5,a0,1
    802048fa:	40f907b3          	sub	a5,s2,a5
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    802048fe:	ff07f913          	andi	s2,a5,-16
    if(sp < stackbase)
    80204902:	1b796463          	bltu	s2,s7,80204aaa <exec+0x376>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80204906:	de843d83          	ld	s11,-536(s0)
    8020490a:	000dba03          	ld	s4,0(s11) # 1000 <_entry-0x801ff000>
    8020490e:	8552                	mv	a0,s4
    80204910:	ffffc097          	auipc	ra,0xffffc
    80204914:	fd6080e7          	jalr	-42(ra) # 802008e6 <strlen>
    80204918:	0015069b          	addiw	a3,a0,1
    8020491c:	8652                	mv	a2,s4
    8020491e:	85ca                	mv	a1,s2
    80204920:	e0843503          	ld	a0,-504(s0)
    80204924:	ffffd097          	auipc	ra,0xffffd
    80204928:	9c2080e7          	jalr	-1598(ra) # 802012e6 <copyout>
    8020492c:	18054363          	bltz	a0,80204ab2 <exec+0x37e>
    ustack[argc] = sp;
    80204930:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    80204934:	0485                	addi	s1,s1,1
    80204936:	008d8793          	addi	a5,s11,8
    8020493a:	def43423          	sd	a5,-536(s0)
    8020493e:	008db503          	ld	a0,8(s11)
    80204942:	c911                	beqz	a0,80204956 <exec+0x222>
    if(argc >= MAXARG)
    80204944:	09a1                	addi	s3,s3,8
    80204946:	fb3c14e3          	bne	s8,s3,802048ee <exec+0x1ba>
  sz = sz1;
    8020494a:	df943823          	sd	s9,-528(s0)
  ep = 0;
    8020494e:	4a01                	li	s4,0
    80204950:	a0d5                	j	80204a34 <exec+0x300>
  sp = sz;
    80204952:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    80204954:	4481                	li	s1,0
  ustack[argc] = 0;
    80204956:	00349793          	slli	a5,s1,0x3
    8020495a:	f9078793          	addi	a5,a5,-112
    8020495e:	97a2                	add	a5,a5,s0
    80204960:	ee07bc23          	sd	zero,-264(a5)
  sp -= (argc+1) * sizeof(uint64);
    80204964:	00148693          	addi	a3,s1,1
    80204968:	068e                	slli	a3,a3,0x3
    8020496a:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    8020496e:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    80204972:	01797663          	bgeu	s2,s7,8020497e <exec+0x24a>
  sz = sz1;
    80204976:	df943823          	sd	s9,-528(s0)
  ep = 0;
    8020497a:	4a01                	li	s4,0
    8020497c:	a865                	j	80204a34 <exec+0x300>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    8020497e:	e8840613          	addi	a2,s0,-376
    80204982:	85ca                	mv	a1,s2
    80204984:	e0843503          	ld	a0,-504(s0)
    80204988:	ffffd097          	auipc	ra,0xffffd
    8020498c:	95e080e7          	jalr	-1698(ra) # 802012e6 <copyout>
    80204990:	12054563          	bltz	a0,80204aba <exec+0x386>
  p->trapframe->a1 = sp;
    80204994:	060ab783          	ld	a5,96(s5)
    80204998:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    8020499c:	dd843783          	ld	a5,-552(s0)
    802049a0:	0007c703          	lbu	a4,0(a5)
    802049a4:	cf11                	beqz	a4,802049c0 <exec+0x28c>
    802049a6:	0785                	addi	a5,a5,1
    if(*s == '/')
    802049a8:	02f00693          	li	a3,47
    802049ac:	a039                	j	802049ba <exec+0x286>
      last = s+1;
    802049ae:	dcf43c23          	sd	a5,-552(s0)
  for(last=s=path; *s; s++)
    802049b2:	0785                	addi	a5,a5,1
    802049b4:	fff7c703          	lbu	a4,-1(a5)
    802049b8:	c701                	beqz	a4,802049c0 <exec+0x28c>
    if(*s == '/')
    802049ba:	fed71ce3          	bne	a4,a3,802049b2 <exec+0x27e>
    802049be:	bfc5                	j	802049ae <exec+0x27a>
  safestrcpy(p->name, last, sizeof(p->name));
    802049c0:	4641                	li	a2,16
    802049c2:	dd843583          	ld	a1,-552(s0)
    802049c6:	160a8513          	addi	a0,s5,352
    802049ca:	ffffc097          	auipc	ra,0xffffc
    802049ce:	eea080e7          	jalr	-278(ra) # 802008b4 <safestrcpy>
  oldpagetable = p->pagetable;
    802049d2:	050ab503          	ld	a0,80(s5)
  oldkpagetable = p->kpagetable;
    802049d6:	058ab983          	ld	s3,88(s5)
  p->pagetable = pagetable;
    802049da:	e0843783          	ld	a5,-504(s0)
    802049de:	04fab823          	sd	a5,80(s5)
  p->kpagetable = kpagetable;
    802049e2:	056abc23          	sd	s6,88(s5)
  p->sz = sz;
    802049e6:	059ab423          	sd	s9,72(s5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    802049ea:	060ab783          	ld	a5,96(s5)
    802049ee:	e6043703          	ld	a4,-416(s0)
    802049f2:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    802049f4:	060ab783          	ld	a5,96(s5)
    802049f8:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    802049fc:	85ea                	mv	a1,s10
    802049fe:	ffffd097          	auipc	ra,0xffffd
    80204a02:	238080e7          	jalr	568(ra) # 80201c36 <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    80204a06:	058ab783          	ld	a5,88(s5)
    80204a0a:	83b1                	srli	a5,a5,0xc
    80204a0c:	577d                	li	a4,-1
    80204a0e:	177e                	slli	a4,a4,0x3f
    80204a10:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80204a12:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80204a16:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    80204a1a:	4581                	li	a1,0
    80204a1c:	854e                	mv	a0,s3
    80204a1e:	ffffd097          	auipc	ra,0xffffd
    80204a22:	ca6080e7          	jalr	-858(ra) # 802016c4 <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80204a26:	0004851b          	sext.w	a0,s1
    80204a2a:	a089                	j	80204a6c <exec+0x338>
    return -1;
    80204a2c:	557d                	li	a0,-1
    80204a2e:	a83d                	j	80204a6c <exec+0x338>
    80204a30:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    80204a34:	df043583          	ld	a1,-528(s0)
    80204a38:	e0843503          	ld	a0,-504(s0)
    80204a3c:	ffffd097          	auipc	ra,0xffffd
    80204a40:	1fa080e7          	jalr	506(ra) # 80201c36 <proc_freepagetable>
    kvmfree(kpagetable, 0);
    80204a44:	4581                	li	a1,0
    80204a46:	855a                	mv	a0,s6
    80204a48:	ffffd097          	auipc	ra,0xffffd
    80204a4c:	c7c080e7          	jalr	-900(ra) # 802016c4 <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    80204a50:	557d                	li	a0,-1
  if(ep){
    80204a52:	000a0d63          	beqz	s4,80204a6c <exec+0x338>
    eunlock(ep);
    80204a56:	8552                	mv	a0,s4
    80204a58:	00002097          	auipc	ra,0x2
    80204a5c:	66a080e7          	jalr	1642(ra) # 802070c2 <eunlock>
    eput(ep);
    80204a60:	8552                	mv	a0,s4
    80204a62:	00002097          	auipc	ra,0x2
    80204a66:	6ae080e7          	jalr	1710(ra) # 80207110 <eput>
  return -1;
    80204a6a:	557d                	li	a0,-1
}
    80204a6c:	22813083          	ld	ra,552(sp)
    80204a70:	22013403          	ld	s0,544(sp)
    80204a74:	21813483          	ld	s1,536(sp)
    80204a78:	21013903          	ld	s2,528(sp)
    80204a7c:	20813983          	ld	s3,520(sp)
    80204a80:	20013a03          	ld	s4,512(sp)
    80204a84:	7afe                	ld	s5,504(sp)
    80204a86:	7b5e                	ld	s6,496(sp)
    80204a88:	7bbe                	ld	s7,488(sp)
    80204a8a:	7c1e                	ld	s8,480(sp)
    80204a8c:	6cfe                	ld	s9,472(sp)
    80204a8e:	6d5e                	ld	s10,464(sp)
    80204a90:	6dbe                	ld	s11,456(sp)
    80204a92:	23010113          	addi	sp,sp,560
    80204a96:	8082                	ret
    80204a98:	de943823          	sd	s1,-528(s0)
    80204a9c:	bf61                	j	80204a34 <exec+0x300>
    80204a9e:	de943823          	sd	s1,-528(s0)
    80204aa2:	bf49                	j	80204a34 <exec+0x300>
    80204aa4:	de943823          	sd	s1,-528(s0)
    80204aa8:	b771                	j	80204a34 <exec+0x300>
  sz = sz1;
    80204aaa:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204aae:	4a01                	li	s4,0
    80204ab0:	b751                	j	80204a34 <exec+0x300>
  sz = sz1;
    80204ab2:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204ab6:	4a01                	li	s4,0
    80204ab8:	bfb5                	j	80204a34 <exec+0x300>
  sz = sz1;
    80204aba:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204abe:	4a01                	li	s4,0
    80204ac0:	bf95                	j	80204a34 <exec+0x300>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204ac2:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204ac6:	e0043783          	ld	a5,-512(s0)
    80204aca:	0017869b          	addiw	a3,a5,1
    80204ace:	e0d43023          	sd	a3,-512(s0)
    80204ad2:	df843783          	ld	a5,-520(s0)
    80204ad6:	0387879b          	addiw	a5,a5,56
    80204ada:	e8045703          	lhu	a4,-384(s0)
    80204ade:	d8e6dee3          	bge	a3,a4,8020487a <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204ae2:	2781                	sext.w	a5,a5
    80204ae4:	def43c23          	sd	a5,-520(s0)
    80204ae8:	03800713          	li	a4,56
    80204aec:	86be                	mv	a3,a5
    80204aee:	de043603          	ld	a2,-544(s0)
    80204af2:	4581                	li	a1,0
    80204af4:	8552                	mv	a0,s4
    80204af6:	00002097          	auipc	ra,0x2
    80204afa:	c92080e7          	jalr	-878(ra) # 80206788 <eread>
    80204afe:	03800793          	li	a5,56
    80204b02:	f2f517e3          	bne	a0,a5,80204a30 <exec+0x2fc>
    if(ph.type != ELF_PROG_LOAD)
    80204b06:	e1042783          	lw	a5,-496(s0)
    80204b0a:	4705                	li	a4,1
    80204b0c:	fae79de3          	bne	a5,a4,80204ac6 <exec+0x392>
    if(ph.memsz < ph.filesz)
    80204b10:	e3843683          	ld	a3,-456(s0)
    80204b14:	e3043783          	ld	a5,-464(s0)
    80204b18:	f8f6e0e3          	bltu	a3,a5,80204a98 <exec+0x364>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80204b1c:	e2043783          	ld	a5,-480(s0)
    80204b20:	96be                	add	a3,a3,a5
    80204b22:	f6f6eee3          	bltu	a3,a5,80204a9e <exec+0x36a>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204b26:	8626                	mv	a2,s1
    80204b28:	85da                	mv	a1,s6
    80204b2a:	e0843503          	ld	a0,-504(s0)
    80204b2e:	ffffc097          	auipc	ra,0xffffc
    80204b32:	4dc080e7          	jalr	1244(ra) # 8020100a <uvmalloc>
    80204b36:	dea43823          	sd	a0,-528(s0)
    80204b3a:	d52d                	beqz	a0,80204aa4 <exec+0x370>
    if(ph.vaddr % PGSIZE != 0)
    80204b3c:	e2043c03          	ld	s8,-480(s0)
    80204b40:	dd043783          	ld	a5,-560(s0)
    80204b44:	00fc77b3          	and	a5,s8,a5
    80204b48:	ee0796e3          	bnez	a5,80204a34 <exec+0x300>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    80204b4c:	e1842c83          	lw	s9,-488(s0)
    80204b50:	e3042b83          	lw	s7,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204b54:	f60b87e3          	beqz	s7,80204ac2 <exec+0x38e>
    80204b58:	89de                	mv	s3,s7
    80204b5a:	4481                	li	s1,0
    80204b5c:	b9ed                	j	80204856 <exec+0x122>
    kvmfree(kpagetable, 0);
    80204b5e:	4581                	li	a1,0
    80204b60:	855a                	mv	a0,s6
    80204b62:	ffffd097          	auipc	ra,0xffffd
    80204b66:	b62080e7          	jalr	-1182(ra) # 802016c4 <kvmfree>
  return -1;
    80204b6a:	557d                	li	a0,-1
    80204b6c:	b701                	j	80204a6c <exec+0x338>

0000000080204b6e <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80204b6e:	7179                	addi	sp,sp,-48
    80204b70:	f406                	sd	ra,40(sp)
    80204b72:	f022                	sd	s0,32(sp)
    80204b74:	ec26                	sd	s1,24(sp)
    80204b76:	e84a                	sd	s2,16(sp)
    80204b78:	1800                	addi	s0,sp,48
    80204b7a:	892e                	mv	s2,a1
    80204b7c:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80204b7e:	fdc40593          	addi	a1,s0,-36
    80204b82:	ffffe097          	auipc	ra,0xffffe
    80204b86:	576080e7          	jalr	1398(ra) # 802030f8 <argint>
    80204b8a:	04054063          	bltz	a0,80204bca <argfd+0x5c>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    80204b8e:	fdc42703          	lw	a4,-36(s0)
    80204b92:	47bd                	li	a5,15
    80204b94:	02e7ed63          	bltu	a5,a4,80204bce <argfd+0x60>
    80204b98:	ffffd097          	auipc	ra,0xffffd
    80204b9c:	f1e080e7          	jalr	-226(ra) # 80201ab6 <myproc>
    80204ba0:	fdc42703          	lw	a4,-36(s0)
    80204ba4:	01a70793          	addi	a5,a4,26 # fffffffffffff01a <ebss_clear+0xffffffff7fdd201a>
    80204ba8:	078e                	slli	a5,a5,0x3
    80204baa:	953e                	add	a0,a0,a5
    80204bac:	651c                	ld	a5,8(a0)
    80204bae:	c395                	beqz	a5,80204bd2 <argfd+0x64>
    return -1;
  if(pfd)
    80204bb0:	00090463          	beqz	s2,80204bb8 <argfd+0x4a>
    *pfd = fd;
    80204bb4:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    80204bb8:	4501                	li	a0,0
  if(pf)
    80204bba:	c091                	beqz	s1,80204bbe <argfd+0x50>
    *pf = f;
    80204bbc:	e09c                	sd	a5,0(s1)
}
    80204bbe:	70a2                	ld	ra,40(sp)
    80204bc0:	7402                	ld	s0,32(sp)
    80204bc2:	64e2                	ld	s1,24(sp)
    80204bc4:	6942                	ld	s2,16(sp)
    80204bc6:	6145                	addi	sp,sp,48
    80204bc8:	8082                	ret
    return -1;
    80204bca:	557d                	li	a0,-1
    80204bcc:	bfcd                	j	80204bbe <argfd+0x50>
    return -1;
    80204bce:	557d                	li	a0,-1
    80204bd0:	b7fd                	j	80204bbe <argfd+0x50>
    80204bd2:	557d                	li	a0,-1
    80204bd4:	b7ed                	j	80204bbe <argfd+0x50>

0000000080204bd6 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80204bd6:	1101                	addi	sp,sp,-32
    80204bd8:	ec06                	sd	ra,24(sp)
    80204bda:	e822                	sd	s0,16(sp)
    80204bdc:	e426                	sd	s1,8(sp)
    80204bde:	1000                	addi	s0,sp,32
    80204be0:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    80204be2:	ffffd097          	auipc	ra,0xffffd
    80204be6:	ed4080e7          	jalr	-300(ra) # 80201ab6 <myproc>
    80204bea:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    80204bec:	0d850793          	addi	a5,a0,216
    80204bf0:	4501                	li	a0,0
    80204bf2:	46c1                	li	a3,16
    if(p->ofile[fd] == 0){
    80204bf4:	6398                	ld	a4,0(a5)
    80204bf6:	cb19                	beqz	a4,80204c0c <fdalloc+0x36>
  for(fd = 0; fd < NOFILE; fd++){
    80204bf8:	2505                	addiw	a0,a0,1
    80204bfa:	07a1                	addi	a5,a5,8
    80204bfc:	fed51ce3          	bne	a0,a3,80204bf4 <fdalloc+0x1e>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    80204c00:	557d                	li	a0,-1
}
    80204c02:	60e2                	ld	ra,24(sp)
    80204c04:	6442                	ld	s0,16(sp)
    80204c06:	64a2                	ld	s1,8(sp)
    80204c08:	6105                	addi	sp,sp,32
    80204c0a:	8082                	ret
      p->ofile[fd] = f;
    80204c0c:	01a50793          	addi	a5,a0,26
    80204c10:	078e                	slli	a5,a5,0x3
    80204c12:	963e                	add	a2,a2,a5
    80204c14:	e604                	sd	s1,8(a2)
      return fd;
    80204c16:	b7f5                	j	80204c02 <fdalloc+0x2c>

0000000080204c18 <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    80204c18:	7169                	addi	sp,sp,-304
    80204c1a:	f606                	sd	ra,296(sp)
    80204c1c:	f222                	sd	s0,288(sp)
    80204c1e:	ee26                	sd	s1,280(sp)
    80204c20:	ea4a                	sd	s2,272(sp)
    80204c22:	e64e                	sd	s3,264(sp)
    80204c24:	1a00                	addi	s0,sp,304
    80204c26:	892e                	mv	s2,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    80204c28:	ed040593          	addi	a1,s0,-304
    80204c2c:	00003097          	auipc	ra,0x3
    80204c30:	cf0080e7          	jalr	-784(ra) # 8020791c <enameparent>
    80204c34:	84aa                	mv	s1,a0
    80204c36:	c945                	beqz	a0,80204ce6 <create+0xce>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    80204c38:	00002097          	auipc	ra,0x2
    80204c3c:	454080e7          	jalr	1108(ra) # 8020708c <elock>
  if (type == T_DIR) {
    80204c40:	fff90613          	addi	a2,s2,-1
    80204c44:	00163613          	seqz	a2,a2
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204c48:	0046161b          	slliw	a2,a2,0x4
    80204c4c:	ed040593          	addi	a1,s0,-304
    80204c50:	8526                	mv	a0,s1
    80204c52:	00003097          	auipc	ra,0x3
    80204c56:	926080e7          	jalr	-1754(ra) # 80207578 <ealloc>
    80204c5a:	89aa                	mv	s3,a0
    80204c5c:	c529                	beqz	a0,80204ca6 <create+0x8e>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204c5e:	0009079b          	sext.w	a5,s2
    80204c62:	4705                	li	a4,1
    80204c64:	04e78c63          	beq	a5,a4,80204cbc <create+0xa4>
    80204c68:	2901                	sext.w	s2,s2
    80204c6a:	4789                	li	a5,2
    80204c6c:	00f91663          	bne	s2,a5,80204c78 <create+0x60>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    80204c70:	10054783          	lbu	a5,256(a0)
    80204c74:	8bc1                	andi	a5,a5,16
    80204c76:	e7b9                	bnez	a5,80204cc4 <create+0xac>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    80204c78:	8526                	mv	a0,s1
    80204c7a:	00002097          	auipc	ra,0x2
    80204c7e:	448080e7          	jalr	1096(ra) # 802070c2 <eunlock>
  eput(dp);
    80204c82:	8526                	mv	a0,s1
    80204c84:	00002097          	auipc	ra,0x2
    80204c88:	48c080e7          	jalr	1164(ra) # 80207110 <eput>

  elock(ep);
    80204c8c:	854e                	mv	a0,s3
    80204c8e:	00002097          	auipc	ra,0x2
    80204c92:	3fe080e7          	jalr	1022(ra) # 8020708c <elock>
  return ep;
}
    80204c96:	854e                	mv	a0,s3
    80204c98:	70b2                	ld	ra,296(sp)
    80204c9a:	7412                	ld	s0,288(sp)
    80204c9c:	64f2                	ld	s1,280(sp)
    80204c9e:	6952                	ld	s2,272(sp)
    80204ca0:	69b2                	ld	s3,264(sp)
    80204ca2:	6155                	addi	sp,sp,304
    80204ca4:	8082                	ret
    eunlock(dp);
    80204ca6:	8526                	mv	a0,s1
    80204ca8:	00002097          	auipc	ra,0x2
    80204cac:	41a080e7          	jalr	1050(ra) # 802070c2 <eunlock>
    eput(dp);
    80204cb0:	8526                	mv	a0,s1
    80204cb2:	00002097          	auipc	ra,0x2
    80204cb6:	45e080e7          	jalr	1118(ra) # 80207110 <eput>
    return NULL;
    80204cba:	bff1                	j	80204c96 <create+0x7e>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204cbc:	10054783          	lbu	a5,256(a0)
    80204cc0:	8bc1                	andi	a5,a5,16
    80204cc2:	fbdd                	bnez	a5,80204c78 <create+0x60>
    eunlock(dp);
    80204cc4:	8526                	mv	a0,s1
    80204cc6:	00002097          	auipc	ra,0x2
    80204cca:	3fc080e7          	jalr	1020(ra) # 802070c2 <eunlock>
    eput(ep);
    80204cce:	854e                	mv	a0,s3
    80204cd0:	00002097          	auipc	ra,0x2
    80204cd4:	440080e7          	jalr	1088(ra) # 80207110 <eput>
    eput(dp);
    80204cd8:	8526                	mv	a0,s1
    80204cda:	00002097          	auipc	ra,0x2
    80204cde:	436080e7          	jalr	1078(ra) # 80207110 <eput>
    return NULL;
    80204ce2:	4981                	li	s3,0
    80204ce4:	bf4d                	j	80204c96 <create+0x7e>
    return NULL;
    80204ce6:	89aa                	mv	s3,a0
    80204ce8:	b77d                	j	80204c96 <create+0x7e>

0000000080204cea <sys_dup>:
{
    80204cea:	7179                	addi	sp,sp,-48
    80204cec:	f406                	sd	ra,40(sp)
    80204cee:	f022                	sd	s0,32(sp)
    80204cf0:	ec26                	sd	s1,24(sp)
    80204cf2:	e84a                	sd	s2,16(sp)
    80204cf4:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    80204cf6:	fd840613          	addi	a2,s0,-40
    80204cfa:	4581                	li	a1,0
    80204cfc:	4501                	li	a0,0
    80204cfe:	00000097          	auipc	ra,0x0
    80204d02:	e70080e7          	jalr	-400(ra) # 80204b6e <argfd>
    return -1;
    80204d06:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    80204d08:	02054363          	bltz	a0,80204d2e <sys_dup+0x44>
  if((fd=fdalloc(f)) < 0)
    80204d0c:	fd843903          	ld	s2,-40(s0)
    80204d10:	854a                	mv	a0,s2
    80204d12:	00000097          	auipc	ra,0x0
    80204d16:	ec4080e7          	jalr	-316(ra) # 80204bd6 <fdalloc>
    80204d1a:	84aa                	mv	s1,a0
    return -1;
    80204d1c:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    80204d1e:	00054863          	bltz	a0,80204d2e <sys_dup+0x44>
  filedup(f);
    80204d22:	854a                	mv	a0,s2
    80204d24:	fffff097          	auipc	ra,0xfffff
    80204d28:	20c080e7          	jalr	524(ra) # 80203f30 <filedup>
  return fd;
    80204d2c:	87a6                	mv	a5,s1
}
    80204d2e:	853e                	mv	a0,a5
    80204d30:	70a2                	ld	ra,40(sp)
    80204d32:	7402                	ld	s0,32(sp)
    80204d34:	64e2                	ld	s1,24(sp)
    80204d36:	6942                	ld	s2,16(sp)
    80204d38:	6145                	addi	sp,sp,48
    80204d3a:	8082                	ret

0000000080204d3c <sys_read>:
{
    80204d3c:	7179                	addi	sp,sp,-48
    80204d3e:	f406                	sd	ra,40(sp)
    80204d40:	f022                	sd	s0,32(sp)
    80204d42:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d44:	fe840613          	addi	a2,s0,-24
    80204d48:	4581                	li	a1,0
    80204d4a:	4501                	li	a0,0
    80204d4c:	00000097          	auipc	ra,0x0
    80204d50:	e22080e7          	jalr	-478(ra) # 80204b6e <argfd>
    return -1;
    80204d54:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d56:	04054163          	bltz	a0,80204d98 <sys_read+0x5c>
    80204d5a:	fe440593          	addi	a1,s0,-28
    80204d5e:	4509                	li	a0,2
    80204d60:	ffffe097          	auipc	ra,0xffffe
    80204d64:	398080e7          	jalr	920(ra) # 802030f8 <argint>
    return -1;
    80204d68:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d6a:	02054763          	bltz	a0,80204d98 <sys_read+0x5c>
    80204d6e:	fd840593          	addi	a1,s0,-40
    80204d72:	4505                	li	a0,1
    80204d74:	ffffe097          	auipc	ra,0xffffe
    80204d78:	3e6080e7          	jalr	998(ra) # 8020315a <argaddr>
    return -1;
    80204d7c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d7e:	00054d63          	bltz	a0,80204d98 <sys_read+0x5c>
  return fileread(f, p, n);
    80204d82:	fe442603          	lw	a2,-28(s0)
    80204d86:	fd843583          	ld	a1,-40(s0)
    80204d8a:	fe843503          	ld	a0,-24(s0)
    80204d8e:	fffff097          	auipc	ra,0xfffff
    80204d92:	30e080e7          	jalr	782(ra) # 8020409c <fileread>
    80204d96:	87aa                	mv	a5,a0
}
    80204d98:	853e                	mv	a0,a5
    80204d9a:	70a2                	ld	ra,40(sp)
    80204d9c:	7402                	ld	s0,32(sp)
    80204d9e:	6145                	addi	sp,sp,48
    80204da0:	8082                	ret

0000000080204da2 <sys_write>:
{
    80204da2:	7179                	addi	sp,sp,-48
    80204da4:	f406                	sd	ra,40(sp)
    80204da6:	f022                	sd	s0,32(sp)
    80204da8:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204daa:	fe840613          	addi	a2,s0,-24
    80204dae:	4581                	li	a1,0
    80204db0:	4501                	li	a0,0
    80204db2:	00000097          	auipc	ra,0x0
    80204db6:	dbc080e7          	jalr	-580(ra) # 80204b6e <argfd>
    return -1;
    80204dba:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204dbc:	04054163          	bltz	a0,80204dfe <sys_write+0x5c>
    80204dc0:	fe440593          	addi	a1,s0,-28
    80204dc4:	4509                	li	a0,2
    80204dc6:	ffffe097          	auipc	ra,0xffffe
    80204dca:	332080e7          	jalr	818(ra) # 802030f8 <argint>
    return -1;
    80204dce:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204dd0:	02054763          	bltz	a0,80204dfe <sys_write+0x5c>
    80204dd4:	fd840593          	addi	a1,s0,-40
    80204dd8:	4505                	li	a0,1
    80204dda:	ffffe097          	auipc	ra,0xffffe
    80204dde:	380080e7          	jalr	896(ra) # 8020315a <argaddr>
    return -1;
    80204de2:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204de4:	00054d63          	bltz	a0,80204dfe <sys_write+0x5c>
  return filewrite(f, p, n);
    80204de8:	fe442603          	lw	a2,-28(s0)
    80204dec:	fd843583          	ld	a1,-40(s0)
    80204df0:	fe843503          	ld	a0,-24(s0)
    80204df4:	fffff097          	auipc	ra,0xfffff
    80204df8:	36a080e7          	jalr	874(ra) # 8020415e <filewrite>
    80204dfc:	87aa                	mv	a5,a0
}
    80204dfe:	853e                	mv	a0,a5
    80204e00:	70a2                	ld	ra,40(sp)
    80204e02:	7402                	ld	s0,32(sp)
    80204e04:	6145                	addi	sp,sp,48
    80204e06:	8082                	ret

0000000080204e08 <sys_close>:
{
    80204e08:	1101                	addi	sp,sp,-32
    80204e0a:	ec06                	sd	ra,24(sp)
    80204e0c:	e822                	sd	s0,16(sp)
    80204e0e:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204e10:	fe040613          	addi	a2,s0,-32
    80204e14:	fec40593          	addi	a1,s0,-20
    80204e18:	4501                	li	a0,0
    80204e1a:	00000097          	auipc	ra,0x0
    80204e1e:	d54080e7          	jalr	-684(ra) # 80204b6e <argfd>
    return -1;
    80204e22:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    80204e24:	02054463          	bltz	a0,80204e4c <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80204e28:	ffffd097          	auipc	ra,0xffffd
    80204e2c:	c8e080e7          	jalr	-882(ra) # 80201ab6 <myproc>
    80204e30:	fec42783          	lw	a5,-20(s0)
    80204e34:	07e9                	addi	a5,a5,26
    80204e36:	078e                	slli	a5,a5,0x3
    80204e38:	953e                	add	a0,a0,a5
    80204e3a:	00053423          	sd	zero,8(a0)
  fileclose(f);
    80204e3e:	fe043503          	ld	a0,-32(s0)
    80204e42:	fffff097          	auipc	ra,0xfffff
    80204e46:	140080e7          	jalr	320(ra) # 80203f82 <fileclose>
  return 0;
    80204e4a:	4781                	li	a5,0
}
    80204e4c:	853e                	mv	a0,a5
    80204e4e:	60e2                	ld	ra,24(sp)
    80204e50:	6442                	ld	s0,16(sp)
    80204e52:	6105                	addi	sp,sp,32
    80204e54:	8082                	ret

0000000080204e56 <sys_fstat>:
{
    80204e56:	1101                	addi	sp,sp,-32
    80204e58:	ec06                	sd	ra,24(sp)
    80204e5a:	e822                	sd	s0,16(sp)
    80204e5c:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204e5e:	fe840613          	addi	a2,s0,-24
    80204e62:	4581                	li	a1,0
    80204e64:	4501                	li	a0,0
    80204e66:	00000097          	auipc	ra,0x0
    80204e6a:	d08080e7          	jalr	-760(ra) # 80204b6e <argfd>
    return -1;
    80204e6e:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204e70:	02054563          	bltz	a0,80204e9a <sys_fstat+0x44>
    80204e74:	fe040593          	addi	a1,s0,-32
    80204e78:	4505                	li	a0,1
    80204e7a:	ffffe097          	auipc	ra,0xffffe
    80204e7e:	2e0080e7          	jalr	736(ra) # 8020315a <argaddr>
    return -1;
    80204e82:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204e84:	00054b63          	bltz	a0,80204e9a <sys_fstat+0x44>
  return filestat(f, st);
    80204e88:	fe043583          	ld	a1,-32(s0)
    80204e8c:	fe843503          	ld	a0,-24(s0)
    80204e90:	fffff097          	auipc	ra,0xfffff
    80204e94:	1a8080e7          	jalr	424(ra) # 80204038 <filestat>
    80204e98:	87aa                	mv	a5,a0
}
    80204e9a:	853e                	mv	a0,a5
    80204e9c:	60e2                	ld	ra,24(sp)
    80204e9e:	6442                	ld	s0,16(sp)
    80204ea0:	6105                	addi	sp,sp,32
    80204ea2:	8082                	ret

0000000080204ea4 <sys_open>:

uint64
sys_open(void)
{
    80204ea4:	7129                	addi	sp,sp,-320
    80204ea6:	fe06                	sd	ra,312(sp)
    80204ea8:	fa22                	sd	s0,304(sp)
    80204eaa:	f626                	sd	s1,296(sp)
    80204eac:	f24a                	sd	s2,288(sp)
    80204eae:	ee4e                	sd	s3,280(sp)
    80204eb0:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204eb2:	10400613          	li	a2,260
    80204eb6:	ec840593          	addi	a1,s0,-312
    80204eba:	4501                	li	a0,0
    80204ebc:	ffffe097          	auipc	ra,0xffffe
    80204ec0:	2c0080e7          	jalr	704(ra) # 8020317c <argstr>
    80204ec4:	87aa                	mv	a5,a0
    return -1;
    80204ec6:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204ec8:	0807ce63          	bltz	a5,80204f64 <sys_open+0xc0>
    80204ecc:	ec440593          	addi	a1,s0,-316
    80204ed0:	4505                	li	a0,1
    80204ed2:	ffffe097          	auipc	ra,0xffffe
    80204ed6:	226080e7          	jalr	550(ra) # 802030f8 <argint>
    80204eda:	0e054163          	bltz	a0,80204fbc <sys_open+0x118>

  if(omode & O_CREATE){
    80204ede:	ec442603          	lw	a2,-316(s0)
    80204ee2:	04067793          	andi	a5,a2,64
    80204ee6:	c7d1                	beqz	a5,80204f72 <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    80204ee8:	4589                	li	a1,2
    80204eea:	ec840513          	addi	a0,s0,-312
    80204eee:	00000097          	auipc	ra,0x0
    80204ef2:	d2a080e7          	jalr	-726(ra) # 80204c18 <create>
    80204ef6:	892a                	mv	s2,a0
    if(ep == NULL){
    80204ef8:	c561                	beqz	a0,80204fc0 <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204efa:	fffff097          	auipc	ra,0xfffff
    80204efe:	fcc080e7          	jalr	-52(ra) # 80203ec6 <filealloc>
    80204f02:	89aa                	mv	s3,a0
    80204f04:	c579                	beqz	a0,80204fd2 <sys_open+0x12e>
    80204f06:	00000097          	auipc	ra,0x0
    80204f0a:	cd0080e7          	jalr	-816(ra) # 80204bd6 <fdalloc>
    80204f0e:	84aa                	mv	s1,a0
    80204f10:	0a054c63          	bltz	a0,80204fc8 <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80204f14:	10094783          	lbu	a5,256(s2)
    80204f18:	8bc1                	andi	a5,a5,16
    80204f1a:	e791                	bnez	a5,80204f26 <sys_open+0x82>
    80204f1c:	ec442783          	lw	a5,-316(s0)
    80204f20:	4007f793          	andi	a5,a5,1024
    80204f24:	e7d1                	bnez	a5,80204fb0 <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    80204f26:	4789                	li	a5,2
    80204f28:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204f2c:	ec442783          	lw	a5,-316(s0)
    80204f30:	0047f693          	andi	a3,a5,4
    80204f34:	4701                	li	a4,0
    80204f36:	c299                	beqz	a3,80204f3c <sys_open+0x98>
    80204f38:	10892703          	lw	a4,264(s2)
    80204f3c:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204f40:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80204f44:	0017c713          	xori	a4,a5,1
    80204f48:	8b05                	andi	a4,a4,1
    80204f4a:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204f4e:	8b8d                	andi	a5,a5,3
    80204f50:	00f037b3          	snez	a5,a5
    80204f54:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80204f58:	854a                	mv	a0,s2
    80204f5a:	00002097          	auipc	ra,0x2
    80204f5e:	168080e7          	jalr	360(ra) # 802070c2 <eunlock>

  return fd;
    80204f62:	8526                	mv	a0,s1
}
    80204f64:	70f2                	ld	ra,312(sp)
    80204f66:	7452                	ld	s0,304(sp)
    80204f68:	74b2                	ld	s1,296(sp)
    80204f6a:	7912                	ld	s2,288(sp)
    80204f6c:	69f2                	ld	s3,280(sp)
    80204f6e:	6131                	addi	sp,sp,320
    80204f70:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204f72:	ec840513          	addi	a0,s0,-312
    80204f76:	00003097          	auipc	ra,0x3
    80204f7a:	96a080e7          	jalr	-1686(ra) # 802078e0 <ename>
    80204f7e:	892a                	mv	s2,a0
    80204f80:	c131                	beqz	a0,80204fc4 <sys_open+0x120>
    elock(ep);
    80204f82:	00002097          	auipc	ra,0x2
    80204f86:	10a080e7          	jalr	266(ra) # 8020708c <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80204f8a:	10094783          	lbu	a5,256(s2)
    80204f8e:	8bc1                	andi	a5,a5,16
    80204f90:	d7ad                	beqz	a5,80204efa <sys_open+0x56>
    80204f92:	ec442783          	lw	a5,-316(s0)
    80204f96:	d3b5                	beqz	a5,80204efa <sys_open+0x56>
      eunlock(ep);
    80204f98:	854a                	mv	a0,s2
    80204f9a:	00002097          	auipc	ra,0x2
    80204f9e:	128080e7          	jalr	296(ra) # 802070c2 <eunlock>
      eput(ep);
    80204fa2:	854a                	mv	a0,s2
    80204fa4:	00002097          	auipc	ra,0x2
    80204fa8:	16c080e7          	jalr	364(ra) # 80207110 <eput>
      return -1;
    80204fac:	557d                	li	a0,-1
    80204fae:	bf5d                	j	80204f64 <sys_open+0xc0>
    etrunc(ep);
    80204fb0:	854a                	mv	a0,s2
    80204fb2:	00002097          	auipc	ra,0x2
    80204fb6:	070080e7          	jalr	112(ra) # 80207022 <etrunc>
    80204fba:	b7b5                	j	80204f26 <sys_open+0x82>
    return -1;
    80204fbc:	557d                	li	a0,-1
    80204fbe:	b75d                	j	80204f64 <sys_open+0xc0>
      return -1;
    80204fc0:	557d                	li	a0,-1
    80204fc2:	b74d                	j	80204f64 <sys_open+0xc0>
      return -1;
    80204fc4:	557d                	li	a0,-1
    80204fc6:	bf79                	j	80204f64 <sys_open+0xc0>
      fileclose(f);
    80204fc8:	854e                	mv	a0,s3
    80204fca:	fffff097          	auipc	ra,0xfffff
    80204fce:	fb8080e7          	jalr	-72(ra) # 80203f82 <fileclose>
    eunlock(ep);
    80204fd2:	854a                	mv	a0,s2
    80204fd4:	00002097          	auipc	ra,0x2
    80204fd8:	0ee080e7          	jalr	238(ra) # 802070c2 <eunlock>
    eput(ep);
    80204fdc:	854a                	mv	a0,s2
    80204fde:	00002097          	auipc	ra,0x2
    80204fe2:	132080e7          	jalr	306(ra) # 80207110 <eput>
    return -1;
    80204fe6:	557d                	li	a0,-1
    80204fe8:	bfb5                	j	80204f64 <sys_open+0xc0>

0000000080204fea <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204fea:	7169                	addi	sp,sp,-304
    80204fec:	f606                	sd	ra,296(sp)
    80204fee:	f222                	sd	s0,288(sp)
    80204ff0:	ee26                	sd	s1,280(sp)
    80204ff2:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204ff4:	10400613          	li	a2,260
    80204ff8:	ed840593          	addi	a1,s0,-296
    80204ffc:	4501                	li	a0,0
    80204ffe:	ffffe097          	auipc	ra,0xffffe
    80205002:	17e080e7          	jalr	382(ra) # 8020317c <argstr>
    return -1;
    80205006:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80205008:	02054663          	bltz	a0,80205034 <sys_mkdir+0x4a>
    8020500c:	4601                	li	a2,0
    8020500e:	4585                	li	a1,1
    80205010:	ed840513          	addi	a0,s0,-296
    80205014:	00000097          	auipc	ra,0x0
    80205018:	c04080e7          	jalr	-1020(ra) # 80204c18 <create>
    8020501c:	84aa                	mv	s1,a0
    8020501e:	c10d                	beqz	a0,80205040 <sys_mkdir+0x56>
  }
  eunlock(ep);
    80205020:	00002097          	auipc	ra,0x2
    80205024:	0a2080e7          	jalr	162(ra) # 802070c2 <eunlock>
  eput(ep);
    80205028:	8526                	mv	a0,s1
    8020502a:	00002097          	auipc	ra,0x2
    8020502e:	0e6080e7          	jalr	230(ra) # 80207110 <eput>
  return 0;
    80205032:	4781                	li	a5,0
}
    80205034:	853e                	mv	a0,a5
    80205036:	70b2                	ld	ra,296(sp)
    80205038:	7412                	ld	s0,288(sp)
    8020503a:	64f2                	ld	s1,280(sp)
    8020503c:	6155                	addi	sp,sp,304
    8020503e:	8082                	ret
    return -1;
    80205040:	57fd                	li	a5,-1
    80205042:	bfcd                	j	80205034 <sys_mkdir+0x4a>

0000000080205044 <sys_chdir>:

uint64
sys_chdir(void)
{
    80205044:	7169                	addi	sp,sp,-304
    80205046:	f606                	sd	ra,296(sp)
    80205048:	f222                	sd	s0,288(sp)
    8020504a:	ee26                	sd	s1,280(sp)
    8020504c:	ea4a                	sd	s2,272(sp)
    8020504e:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *curr_proc = myproc();
    80205050:	ffffd097          	auipc	ra,0xffffd
    80205054:	a66080e7          	jalr	-1434(ra) # 80201ab6 <myproc>
    80205058:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    8020505a:	10400613          	li	a2,260
    8020505e:	ed840593          	addi	a1,s0,-296
    80205062:	4501                	li	a0,0
    80205064:	ffffe097          	auipc	ra,0xffffe
    80205068:	118080e7          	jalr	280(ra) # 8020317c <argstr>
    return -1;
    8020506c:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    8020506e:	04054b63          	bltz	a0,802050c4 <sys_chdir+0x80>
    80205072:	ed840513          	addi	a0,s0,-296
    80205076:	00003097          	auipc	ra,0x3
    8020507a:	86a080e7          	jalr	-1942(ra) # 802078e0 <ename>
    8020507e:	84aa                	mv	s1,a0
    80205080:	c52d                	beqz	a0,802050ea <sys_chdir+0xa6>
  }
  printf("Running: CHDIR ... path: %s\n",  path);
    80205082:	ed840593          	addi	a1,s0,-296
    80205086:	00006517          	auipc	a0,0x6
    8020508a:	c3250513          	addi	a0,a0,-974 # 8020acb8 <digits+0x938>
    8020508e:	ffffb097          	auipc	ra,0xffffb
    80205092:	100080e7          	jalr	256(ra) # 8020018e <printf>
  elock(ep);
    80205096:	8526                	mv	a0,s1
    80205098:	00002097          	auipc	ra,0x2
    8020509c:	ff4080e7          	jalr	-12(ra) # 8020708c <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    802050a0:	1004c783          	lbu	a5,256(s1)
    802050a4:	8bc1                	andi	a5,a5,16
    802050a6:	c795                	beqz	a5,802050d2 <sys_chdir+0x8e>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    802050a8:	8526                	mv	a0,s1
    802050aa:	00002097          	auipc	ra,0x2
    802050ae:	018080e7          	jalr	24(ra) # 802070c2 <eunlock>
  eput(curr_proc->cwd);
    802050b2:	15893503          	ld	a0,344(s2)
    802050b6:	00002097          	auipc	ra,0x2
    802050ba:	05a080e7          	jalr	90(ra) # 80207110 <eput>
  curr_proc->cwd = ep;
    802050be:	14993c23          	sd	s1,344(s2)
  return 0;
    802050c2:	4781                	li	a5,0
}
    802050c4:	853e                	mv	a0,a5
    802050c6:	70b2                	ld	ra,296(sp)
    802050c8:	7412                	ld	s0,288(sp)
    802050ca:	64f2                	ld	s1,280(sp)
    802050cc:	6952                	ld	s2,272(sp)
    802050ce:	6155                	addi	sp,sp,304
    802050d0:	8082                	ret
    eunlock(ep);
    802050d2:	8526                	mv	a0,s1
    802050d4:	00002097          	auipc	ra,0x2
    802050d8:	fee080e7          	jalr	-18(ra) # 802070c2 <eunlock>
    eput(ep);
    802050dc:	8526                	mv	a0,s1
    802050de:	00002097          	auipc	ra,0x2
    802050e2:	032080e7          	jalr	50(ra) # 80207110 <eput>
    return -1;
    802050e6:	57fd                	li	a5,-1
    802050e8:	bff1                	j	802050c4 <sys_chdir+0x80>
    return -1;
    802050ea:	57fd                	li	a5,-1
    802050ec:	bfe1                	j	802050c4 <sys_chdir+0x80>

00000000802050ee <sys_pipe>:

uint64
sys_pipe(void)
{
    802050ee:	7139                	addi	sp,sp,-64
    802050f0:	fc06                	sd	ra,56(sp)
    802050f2:	f822                	sd	s0,48(sp)
    802050f4:	f426                	sd	s1,40(sp)
    802050f6:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    802050f8:	ffffd097          	auipc	ra,0xffffd
    802050fc:	9be080e7          	jalr	-1602(ra) # 80201ab6 <myproc>
    80205100:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80205102:	fd840593          	addi	a1,s0,-40
    80205106:	4501                	li	a0,0
    80205108:	ffffe097          	auipc	ra,0xffffe
    8020510c:	052080e7          	jalr	82(ra) # 8020315a <argaddr>
    return -1;
    80205110:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80205112:	0c054e63          	bltz	a0,802051ee <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    80205116:	fc840593          	addi	a1,s0,-56
    8020511a:	fd040513          	addi	a0,s0,-48
    8020511e:	fffff097          	auipc	ra,0xfffff
    80205122:	2e2080e7          	jalr	738(ra) # 80204400 <pipealloc>
    return -1;
    80205126:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80205128:	0c054363          	bltz	a0,802051ee <sys_pipe+0x100>
  fd0 = -1;
    8020512c:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80205130:	fd043503          	ld	a0,-48(s0)
    80205134:	00000097          	auipc	ra,0x0
    80205138:	aa2080e7          	jalr	-1374(ra) # 80204bd6 <fdalloc>
    8020513c:	fca42223          	sw	a0,-60(s0)
    80205140:	08054a63          	bltz	a0,802051d4 <sys_pipe+0xe6>
    80205144:	fc843503          	ld	a0,-56(s0)
    80205148:	00000097          	auipc	ra,0x0
    8020514c:	a8e080e7          	jalr	-1394(ra) # 80204bd6 <fdalloc>
    80205150:	fca42023          	sw	a0,-64(s0)
    80205154:	06054763          	bltz	a0,802051c2 <sys_pipe+0xd4>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80205158:	4611                	li	a2,4
    8020515a:	fc440593          	addi	a1,s0,-60
    8020515e:	fd843503          	ld	a0,-40(s0)
    80205162:	ffffc097          	auipc	ra,0xffffc
    80205166:	210080e7          	jalr	528(ra) # 80201372 <copyout2>
    8020516a:	00054f63          	bltz	a0,80205188 <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    8020516e:	4611                	li	a2,4
    80205170:	fc040593          	addi	a1,s0,-64
    80205174:	fd843503          	ld	a0,-40(s0)
    80205178:	0511                	addi	a0,a0,4
    8020517a:	ffffc097          	auipc	ra,0xffffc
    8020517e:	1f8080e7          	jalr	504(ra) # 80201372 <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80205182:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80205184:	06055563          	bgez	a0,802051ee <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80205188:	fc442783          	lw	a5,-60(s0)
    8020518c:	07e9                	addi	a5,a5,26
    8020518e:	078e                	slli	a5,a5,0x3
    80205190:	97a6                	add	a5,a5,s1
    80205192:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80205196:	fc042783          	lw	a5,-64(s0)
    8020519a:	07e9                	addi	a5,a5,26
    8020519c:	078e                	slli	a5,a5,0x3
    8020519e:	00f48533          	add	a0,s1,a5
    802051a2:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    802051a6:	fd043503          	ld	a0,-48(s0)
    802051aa:	fffff097          	auipc	ra,0xfffff
    802051ae:	dd8080e7          	jalr	-552(ra) # 80203f82 <fileclose>
    fileclose(wf);
    802051b2:	fc843503          	ld	a0,-56(s0)
    802051b6:	fffff097          	auipc	ra,0xfffff
    802051ba:	dcc080e7          	jalr	-564(ra) # 80203f82 <fileclose>
    return -1;
    802051be:	57fd                	li	a5,-1
    802051c0:	a03d                	j	802051ee <sys_pipe+0x100>
    if(fd0 >= 0)
    802051c2:	fc442783          	lw	a5,-60(s0)
    802051c6:	0007c763          	bltz	a5,802051d4 <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    802051ca:	07e9                	addi	a5,a5,26
    802051cc:	078e                	slli	a5,a5,0x3
    802051ce:	97a6                	add	a5,a5,s1
    802051d0:	0007b423          	sd	zero,8(a5)
    fileclose(rf);
    802051d4:	fd043503          	ld	a0,-48(s0)
    802051d8:	fffff097          	auipc	ra,0xfffff
    802051dc:	daa080e7          	jalr	-598(ra) # 80203f82 <fileclose>
    fileclose(wf);
    802051e0:	fc843503          	ld	a0,-56(s0)
    802051e4:	fffff097          	auipc	ra,0xfffff
    802051e8:	d9e080e7          	jalr	-610(ra) # 80203f82 <fileclose>
    return -1;
    802051ec:	57fd                	li	a5,-1
}
    802051ee:	853e                	mv	a0,a5
    802051f0:	70e2                	ld	ra,56(sp)
    802051f2:	7442                	ld	s0,48(sp)
    802051f4:	74a2                	ld	s1,40(sp)
    802051f6:	6121                	addi	sp,sp,64
    802051f8:	8082                	ret

00000000802051fa <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    802051fa:	7179                	addi	sp,sp,-48
    802051fc:	f406                	sd	ra,40(sp)
    802051fe:	f022                	sd	s0,32(sp)
    80205200:	ec26                	sd	s1,24(sp)
    80205202:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    80205204:	fdc40593          	addi	a1,s0,-36
    80205208:	4501                	li	a0,0
    8020520a:	ffffe097          	auipc	ra,0xffffe
    8020520e:	eee080e7          	jalr	-274(ra) # 802030f8 <argint>
    80205212:	08054a63          	bltz	a0,802052a6 <sys_dev+0xac>
    80205216:	fd840593          	addi	a1,s0,-40
    8020521a:	4505                	li	a0,1
    8020521c:	ffffe097          	auipc	ra,0xffffe
    80205220:	edc080e7          	jalr	-292(ra) # 802030f8 <argint>
    80205224:	08054763          	bltz	a0,802052b2 <sys_dev+0xb8>
    80205228:	fd440593          	addi	a1,s0,-44
    8020522c:	4509                	li	a0,2
    8020522e:	ffffe097          	auipc	ra,0xffffe
    80205232:	eca080e7          	jalr	-310(ra) # 802030f8 <argint>
    80205236:	08054063          	bltz	a0,802052b6 <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    8020523a:	fdc42783          	lw	a5,-36(s0)
    8020523e:	0407f793          	andi	a5,a5,64
    80205242:	ebb1                	bnez	a5,80205296 <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    80205244:	fd842703          	lw	a4,-40(s0)
    80205248:	47a5                	li	a5,9
    return -1;
    8020524a:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    8020524c:	04e7ee63          	bltu	a5,a4,802052a8 <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80205250:	fffff097          	auipc	ra,0xfffff
    80205254:	c76080e7          	jalr	-906(ra) # 80203ec6 <filealloc>
    80205258:	84aa                	mv	s1,a0
    8020525a:	c125                	beqz	a0,802052ba <sys_dev+0xc0>
    8020525c:	00000097          	auipc	ra,0x0
    80205260:	97a080e7          	jalr	-1670(ra) # 80204bd6 <fdalloc>
    80205264:	04054d63          	bltz	a0,802052be <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80205268:	478d                	li	a5,3
    8020526a:	c09c                	sw	a5,0(s1)
  f->off = 0;
    8020526c:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80205270:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80205274:	fd842783          	lw	a5,-40(s0)
    80205278:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    8020527c:	fdc42783          	lw	a5,-36(s0)
    80205280:	0017c713          	xori	a4,a5,1
    80205284:	8b05                	andi	a4,a4,1
    80205286:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    8020528a:	8b8d                	andi	a5,a5,3
    8020528c:	00f037b3          	snez	a5,a5
    80205290:	00f484a3          	sb	a5,9(s1)

  return fd;
    80205294:	a811                	j	802052a8 <sys_dev+0xae>
    panic("dev file on FAT");
    80205296:	00006517          	auipc	a0,0x6
    8020529a:	a4250513          	addi	a0,a0,-1470 # 8020acd8 <digits+0x958>
    8020529e:	ffffb097          	auipc	ra,0xffffb
    802052a2:	ea6080e7          	jalr	-346(ra) # 80200144 <panic>
    return -1;
    802052a6:	557d                	li	a0,-1
}
    802052a8:	70a2                	ld	ra,40(sp)
    802052aa:	7402                	ld	s0,32(sp)
    802052ac:	64e2                	ld	s1,24(sp)
    802052ae:	6145                	addi	sp,sp,48
    802052b0:	8082                	ret
    return -1;
    802052b2:	557d                	li	a0,-1
    802052b4:	bfd5                	j	802052a8 <sys_dev+0xae>
    802052b6:	557d                	li	a0,-1
    802052b8:	bfc5                	j	802052a8 <sys_dev+0xae>
    return -1;
    802052ba:	557d                	li	a0,-1
    802052bc:	b7f5                	j	802052a8 <sys_dev+0xae>
      fileclose(f);
    802052be:	8526                	mv	a0,s1
    802052c0:	fffff097          	auipc	ra,0xfffff
    802052c4:	cc2080e7          	jalr	-830(ra) # 80203f82 <fileclose>
    return -1;
    802052c8:	557d                	li	a0,-1
    802052ca:	bff9                	j	802052a8 <sys_dev+0xae>

00000000802052cc <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    802052cc:	1101                	addi	sp,sp,-32
    802052ce:	ec06                	sd	ra,24(sp)
    802052d0:	e822                	sd	s0,16(sp)
    802052d2:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    802052d4:	fe840613          	addi	a2,s0,-24
    802052d8:	4581                	li	a1,0
    802052da:	4501                	li	a0,0
    802052dc:	00000097          	auipc	ra,0x0
    802052e0:	892080e7          	jalr	-1902(ra) # 80204b6e <argfd>
    return -1;
    802052e4:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    802052e6:	02054563          	bltz	a0,80205310 <sys_readdir+0x44>
    802052ea:	fe040593          	addi	a1,s0,-32
    802052ee:	4505                	li	a0,1
    802052f0:	ffffe097          	auipc	ra,0xffffe
    802052f4:	e6a080e7          	jalr	-406(ra) # 8020315a <argaddr>
    return -1;
    802052f8:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    802052fa:	00054b63          	bltz	a0,80205310 <sys_readdir+0x44>
  return dirnext(f, p);
    802052fe:	fe043583          	ld	a1,-32(s0)
    80205302:	fe843503          	ld	a0,-24(s0)
    80205306:	fffff097          	auipc	ra,0xfffff
    8020530a:	f28080e7          	jalr	-216(ra) # 8020422e <dirnext>
    8020530e:	87aa                	mv	a5,a0
}
    80205310:	853e                	mv	a0,a5
    80205312:	60e2                	ld	ra,24(sp)
    80205314:	6442                	ld	s0,16(sp)
    80205316:	6105                	addi	sp,sp,32
    80205318:	8082                	ret

000000008020531a <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    8020531a:	714d                	addi	sp,sp,-336
    8020531c:	e686                	sd	ra,328(sp)
    8020531e:	e2a2                	sd	s0,320(sp)
    80205320:	fe26                	sd	s1,312(sp)
    80205322:	fa4a                	sd	s2,304(sp)
    80205324:	f64e                	sd	s3,296(sp)
    80205326:	f252                	sd	s4,288(sp)
    80205328:	ee56                	sd	s5,280(sp)
    8020532a:	0a80                	addi	s0,sp,336
 uint64 addr;
  if (argaddr(0, &addr) < 0)
    8020532c:	fb840593          	addi	a1,s0,-72
    80205330:	4501                	li	a0,0
    80205332:	ffffe097          	auipc	ra,0xffffe
    80205336:	e28080e7          	jalr	-472(ra) # 8020315a <argaddr>
    return -1;
    8020533a:	54fd                	li	s1,-1
  if (argaddr(0, &addr) < 0)
    8020533c:	08054763          	bltz	a0,802053ca <sys_getcwd+0xb0>

  struct dirent *de = myproc()->cwd;
    80205340:	ffffc097          	auipc	ra,0xffffc
    80205344:	776080e7          	jalr	1910(ra) # 80201ab6 <myproc>
    80205348:	15853483          	ld	s1,344(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    8020534c:	1204b783          	ld	a5,288(s1)
    80205350:	c7bd                	beqz	a5,802053be <sys_getcwd+0xa4>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80205352:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    80205356:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    8020535a:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    8020535e:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80205362:	8526                	mv	a0,s1
    80205364:	ffffb097          	auipc	ra,0xffffb
    80205368:	582080e7          	jalr	1410(ra) # 802008e6 <strlen>
    8020536c:	862a                	mv	a2,a0
      s -= len;
    8020536e:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    80205372:	052a7b63          	bgeu	s4,s2,802053c8 <sys_getcwd+0xae>
      strncpy(s, de->filename, len);
    80205376:	85a6                	mv	a1,s1
    80205378:	854a                	mv	a0,s2
    8020537a:	ffffb097          	auipc	ra,0xffffb
    8020537e:	4fc080e7          	jalr	1276(ra) # 80200876 <strncpy>
      *--s = '/';
    80205382:	fff90993          	addi	s3,s2,-1
    80205386:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    8020538a:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    8020538e:	1204b783          	ld	a5,288(s1)
    80205392:	fbe1                	bnez	a5,80205362 <sys_getcwd+0x48>
    }
  }
  if(addr==0){
    80205394:	fb843483          	ld	s1,-72(s0)
    80205398:	c88d                	beqz	s1,802053ca <sys_getcwd+0xb0>
    return 0;
  }
  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    8020539a:	854e                	mv	a0,s3
    8020539c:	ffffb097          	auipc	ra,0xffffb
    802053a0:	54a080e7          	jalr	1354(ra) # 802008e6 <strlen>
    802053a4:	0015061b          	addiw	a2,a0,1
    802053a8:	85ce                	mv	a1,s3
    802053aa:	8526                	mv	a0,s1
    802053ac:	ffffc097          	auipc	ra,0xffffc
    802053b0:	fc6080e7          	jalr	-58(ra) # 80201372 <copyout2>
    802053b4:	02054563          	bltz	a0,802053de <sys_getcwd+0xc4>
    return -1;
  return addr;
    802053b8:	fb843483          	ld	s1,-72(s0)
    802053bc:	a039                	j	802053ca <sys_getcwd+0xb0>
    s = "/";
    802053be:	00005997          	auipc	s3,0x5
    802053c2:	27298993          	addi	s3,s3,626 # 8020a630 <digits+0x2b0>
    802053c6:	b7f9                	j	80205394 <sys_getcwd+0x7a>
        return -1;
    802053c8:	54fd                	li	s1,-1
}
    802053ca:	8526                	mv	a0,s1
    802053cc:	60b6                	ld	ra,328(sp)
    802053ce:	6416                	ld	s0,320(sp)
    802053d0:	74f2                	ld	s1,312(sp)
    802053d2:	7952                	ld	s2,304(sp)
    802053d4:	79b2                	ld	s3,296(sp)
    802053d6:	7a12                	ld	s4,288(sp)
    802053d8:	6af2                	ld	s5,280(sp)
    802053da:	6171                	addi	sp,sp,336
    802053dc:	8082                	ret
    return -1;
    802053de:	54fd                	li	s1,-1
    802053e0:	b7ed                	j	802053ca <sys_getcwd+0xb0>

00000000802053e2 <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    802053e2:	d6010113          	addi	sp,sp,-672
    802053e6:	28113c23          	sd	ra,664(sp)
    802053ea:	28813823          	sd	s0,656(sp)
    802053ee:	28913423          	sd	s1,648(sp)
    802053f2:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    802053f4:	10400613          	li	a2,260
    802053f8:	ed840593          	addi	a1,s0,-296
    802053fc:	4501                	li	a0,0
    802053fe:	ffffe097          	auipc	ra,0xffffe
    80205402:	d7e080e7          	jalr	-642(ra) # 8020317c <argstr>
    80205406:	0ea05a63          	blez	a0,802054fa <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    8020540a:	157d                	addi	a0,a0,-1
    8020540c:	ed840713          	addi	a4,s0,-296
    80205410:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    80205414:	02f00693          	li	a3,47
    80205418:	863a                	mv	a2,a4
    8020541a:	00e7e963          	bltu	a5,a4,8020542c <sys_remove+0x4a>
    8020541e:	0007c703          	lbu	a4,0(a5)
    80205422:	08d71a63          	bne	a4,a3,802054b6 <sys_remove+0xd4>
    s--;
    80205426:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    80205428:	fec7fbe3          	bgeu	a5,a2,8020541e <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    8020542c:	ed840513          	addi	a0,s0,-296
    80205430:	00002097          	auipc	ra,0x2
    80205434:	4b0080e7          	jalr	1200(ra) # 802078e0 <ename>
    80205438:	84aa                	mv	s1,a0
    8020543a:	c561                	beqz	a0,80205502 <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    8020543c:	00002097          	auipc	ra,0x2
    80205440:	c50080e7          	jalr	-944(ra) # 8020708c <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80205444:	1004c783          	lbu	a5,256(s1)
    80205448:	8bc1                	andi	a5,a5,16
    8020544a:	c38d                	beqz	a5,8020546c <sys_remove+0x8a>
  ep.valid = 0;
    8020544c:	e6041f23          	sh	zero,-386(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80205450:	d6440693          	addi	a3,s0,-668
    80205454:	04000613          	li	a2,64
    80205458:	d6840593          	addi	a1,s0,-664
    8020545c:	8526                	mv	a0,s1
    8020545e:	00002097          	auipc	ra,0x2
    80205462:	e32080e7          	jalr	-462(ra) # 80207290 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80205466:	57fd                	li	a5,-1
    80205468:	06f51d63          	bne	a0,a5,802054e2 <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    8020546c:	1204b503          	ld	a0,288(s1)
    80205470:	00002097          	auipc	ra,0x2
    80205474:	c1c080e7          	jalr	-996(ra) # 8020708c <elock>
  eremove(ep);
    80205478:	8526                	mv	a0,s1
    8020547a:	00002097          	auipc	ra,0x2
    8020547e:	ade080e7          	jalr	-1314(ra) # 80206f58 <eremove>
  eunlock(ep->parent);
    80205482:	1204b503          	ld	a0,288(s1)
    80205486:	00002097          	auipc	ra,0x2
    8020548a:	c3c080e7          	jalr	-964(ra) # 802070c2 <eunlock>
  eunlock(ep);
    8020548e:	8526                	mv	a0,s1
    80205490:	00002097          	auipc	ra,0x2
    80205494:	c32080e7          	jalr	-974(ra) # 802070c2 <eunlock>
  eput(ep);
    80205498:	8526                	mv	a0,s1
    8020549a:	00002097          	auipc	ra,0x2
    8020549e:	c76080e7          	jalr	-906(ra) # 80207110 <eput>

  return 0;
    802054a2:	4501                	li	a0,0
}
    802054a4:	29813083          	ld	ra,664(sp)
    802054a8:	29013403          	ld	s0,656(sp)
    802054ac:	28813483          	ld	s1,648(sp)
    802054b0:	2a010113          	addi	sp,sp,672
    802054b4:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    802054b6:	ed840713          	addi	a4,s0,-296
    802054ba:	f6e7e9e3          	bltu	a5,a4,8020542c <sys_remove+0x4a>
    802054be:	0007c683          	lbu	a3,0(a5)
    802054c2:	02e00713          	li	a4,46
    802054c6:	f6e693e3          	bne	a3,a4,8020542c <sys_remove+0x4a>
    802054ca:	ed840713          	addi	a4,s0,-296
    802054ce:	02e78863          	beq	a5,a4,802054fe <sys_remove+0x11c>
    802054d2:	fff7c703          	lbu	a4,-1(a5)
    802054d6:	02f00793          	li	a5,47
    802054da:	f4f719e3          	bne	a4,a5,8020542c <sys_remove+0x4a>
    return -1;
    802054de:	557d                	li	a0,-1
    802054e0:	b7d1                	j	802054a4 <sys_remove+0xc2>
      eunlock(ep);
    802054e2:	8526                	mv	a0,s1
    802054e4:	00002097          	auipc	ra,0x2
    802054e8:	bde080e7          	jalr	-1058(ra) # 802070c2 <eunlock>
      eput(ep);
    802054ec:	8526                	mv	a0,s1
    802054ee:	00002097          	auipc	ra,0x2
    802054f2:	c22080e7          	jalr	-990(ra) # 80207110 <eput>
      return -1;
    802054f6:	557d                	li	a0,-1
    802054f8:	b775                	j	802054a4 <sys_remove+0xc2>
    return -1;
    802054fa:	557d                	li	a0,-1
    802054fc:	b765                	j	802054a4 <sys_remove+0xc2>
    return -1;
    802054fe:	557d                	li	a0,-1
    80205500:	b755                	j	802054a4 <sys_remove+0xc2>
    return -1;
    80205502:	557d                	li	a0,-1
    80205504:	b745                	j	802054a4 <sys_remove+0xc2>

0000000080205506 <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    80205506:	c4010113          	addi	sp,sp,-960
    8020550a:	3a113c23          	sd	ra,952(sp)
    8020550e:	3a813823          	sd	s0,944(sp)
    80205512:	3a913423          	sd	s1,936(sp)
    80205516:	3b213023          	sd	s2,928(sp)
    8020551a:	39313c23          	sd	s3,920(sp)
    8020551e:	39413823          	sd	s4,912(sp)
    80205522:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205524:	10400613          	li	a2,260
    80205528:	ec840593          	addi	a1,s0,-312
    8020552c:	4501                	li	a0,0
    8020552e:	ffffe097          	auipc	ra,0xffffe
    80205532:	c4e080e7          	jalr	-946(ra) # 8020317c <argstr>
      return -1;
    80205536:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205538:	0c054d63          	bltz	a0,80205612 <sys_rename+0x10c>
    8020553c:	10400613          	li	a2,260
    80205540:	dc040593          	addi	a1,s0,-576
    80205544:	4505                	li	a0,1
    80205546:	ffffe097          	auipc	ra,0xffffe
    8020554a:	c36080e7          	jalr	-970(ra) # 8020317c <argstr>
      return -1;
    8020554e:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205550:	0c054163          	bltz	a0,80205612 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    80205554:	ec840513          	addi	a0,s0,-312
    80205558:	00002097          	auipc	ra,0x2
    8020555c:	388080e7          	jalr	904(ra) # 802078e0 <ename>
    80205560:	84aa                	mv	s1,a0
    80205562:	1c050963          	beqz	a0,80205734 <sys_rename+0x22e>
    80205566:	ec840593          	addi	a1,s0,-312
    8020556a:	dc040513          	addi	a0,s0,-576
    8020556e:	00002097          	auipc	ra,0x2
    80205572:	3ae080e7          	jalr	942(ra) # 8020791c <enameparent>
    80205576:	892a                	mv	s2,a0
    80205578:	cd35                	beqz	a0,802055f4 <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    8020557a:	ec840513          	addi	a0,s0,-312
    8020557e:	00001097          	auipc	ra,0x1
    80205582:	42e080e7          	jalr	1070(ra) # 802069ac <formatname>
    80205586:	89aa                	mv	s3,a0
    80205588:	c535                	beqz	a0,802055f4 <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    8020558a:	07248563          	beq	s1,s2,802055f4 <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    8020558e:	87ca                	mv	a5,s2
    80205590:	1207b783          	ld	a5,288(a5)
    80205594:	c781                	beqz	a5,8020559c <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    80205596:	fef49de3          	bne	s1,a5,80205590 <sys_rename+0x8a>
    8020559a:	a8a9                	j	802055f4 <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    8020559c:	8526                	mv	a0,s1
    8020559e:	00002097          	auipc	ra,0x2
    802055a2:	aee080e7          	jalr	-1298(ra) # 8020708c <elock>
  srclock = 1;
  elock(pdst);
    802055a6:	854a                	mv	a0,s2
    802055a8:	00002097          	auipc	ra,0x2
    802055ac:	ae4080e7          	jalr	-1308(ra) # 8020708c <elock>
  dst = dirlookup(pdst, name, &off);
    802055b0:	dbc40613          	addi	a2,s0,-580
    802055b4:	85ce                	mv	a1,s3
    802055b6:	854a                	mv	a0,s2
    802055b8:	00002097          	auipc	ra,0x2
    802055bc:	e62080e7          	jalr	-414(ra) # 8020741a <dirlookup>
    802055c0:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    802055c2:	cd45                	beqz	a0,8020567a <sys_rename+0x174>
    eunlock(pdst);
    802055c4:	854a                	mv	a0,s2
    802055c6:	00002097          	auipc	ra,0x2
    802055ca:	afc080e7          	jalr	-1284(ra) # 802070c2 <eunlock>
    if (src == dst) {
    802055ce:	01448963          	beq	s1,s4,802055e0 <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    802055d2:	1004c783          	lbu	a5,256(s1)
    802055d6:	100a4703          	lbu	a4,256(s4)
    802055da:	8ff9                	and	a5,a5,a4
    802055dc:	8bc1                	andi	a5,a5,16
    802055de:	ebb1                	bnez	a5,80205632 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    802055e0:	8526                	mv	a0,s1
    802055e2:	00002097          	auipc	ra,0x2
    802055e6:	ae0080e7          	jalr	-1312(ra) # 802070c2 <eunlock>
  if (dst)
    eput(dst);
    802055ea:	8552                	mv	a0,s4
    802055ec:	00002097          	auipc	ra,0x2
    802055f0:	b24080e7          	jalr	-1244(ra) # 80207110 <eput>
  if (pdst)
    802055f4:	00090763          	beqz	s2,80205602 <sys_rename+0xfc>
    eput(pdst);
    802055f8:	854a                	mv	a0,s2
    802055fa:	00002097          	auipc	ra,0x2
    802055fe:	b16080e7          	jalr	-1258(ra) # 80207110 <eput>
  if (src)
    eput(src);
  return -1;
    80205602:	57fd                	li	a5,-1
  if (src)
    80205604:	c499                	beqz	s1,80205612 <sys_rename+0x10c>
    eput(src);
    80205606:	8526                	mv	a0,s1
    80205608:	00002097          	auipc	ra,0x2
    8020560c:	b08080e7          	jalr	-1272(ra) # 80207110 <eput>
  return -1;
    80205610:	57fd                	li	a5,-1
}
    80205612:	853e                	mv	a0,a5
    80205614:	3b813083          	ld	ra,952(sp)
    80205618:	3b013403          	ld	s0,944(sp)
    8020561c:	3a813483          	ld	s1,936(sp)
    80205620:	3a013903          	ld	s2,928(sp)
    80205624:	39813983          	ld	s3,920(sp)
    80205628:	39013a03          	ld	s4,912(sp)
    8020562c:	3c010113          	addi	sp,sp,960
    80205630:	8082                	ret
      elock(dst);
    80205632:	8552                	mv	a0,s4
    80205634:	00002097          	auipc	ra,0x2
    80205638:	a58080e7          	jalr	-1448(ra) # 8020708c <elock>
  ep.valid = 0;
    8020563c:	d4041f23          	sh	zero,-674(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80205640:	c4440693          	addi	a3,s0,-956
    80205644:	04000613          	li	a2,64
    80205648:	c4840593          	addi	a1,s0,-952
    8020564c:	8552                	mv	a0,s4
    8020564e:	00002097          	auipc	ra,0x2
    80205652:	c42080e7          	jalr	-958(ra) # 80207290 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    80205656:	57fd                	li	a5,-1
    80205658:	0cf51863          	bne	a0,a5,80205728 <sys_rename+0x222>
      elock(pdst);
    8020565c:	854a                	mv	a0,s2
    8020565e:	00002097          	auipc	ra,0x2
    80205662:	a2e080e7          	jalr	-1490(ra) # 8020708c <elock>
    eremove(dst);
    80205666:	8552                	mv	a0,s4
    80205668:	00002097          	auipc	ra,0x2
    8020566c:	8f0080e7          	jalr	-1808(ra) # 80206f58 <eremove>
    eunlock(dst);
    80205670:	8552                	mv	a0,s4
    80205672:	00002097          	auipc	ra,0x2
    80205676:	a50080e7          	jalr	-1456(ra) # 802070c2 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    8020567a:	0ff00613          	li	a2,255
    8020567e:	85ce                	mv	a1,s3
    80205680:	8526                	mv	a0,s1
    80205682:	ffffb097          	auipc	ra,0xffffb
    80205686:	13c080e7          	jalr	316(ra) # 802007be <memmove>
  emake(pdst, src, off);
    8020568a:	dbc42603          	lw	a2,-580(s0)
    8020568e:	85a6                	mv	a1,s1
    80205690:	854a                	mv	a0,s2
    80205692:	00001097          	auipc	ra,0x1
    80205696:	3d2080e7          	jalr	978(ra) # 80206a64 <emake>
  if (src->parent != pdst) {
    8020569a:	1204b783          	ld	a5,288(s1)
    8020569e:	01278d63          	beq	a5,s2,802056b8 <sys_rename+0x1b2>
    eunlock(pdst);
    802056a2:	854a                	mv	a0,s2
    802056a4:	00002097          	auipc	ra,0x2
    802056a8:	a1e080e7          	jalr	-1506(ra) # 802070c2 <eunlock>
    elock(src->parent);
    802056ac:	1204b503          	ld	a0,288(s1)
    802056b0:	00002097          	auipc	ra,0x2
    802056b4:	9dc080e7          	jalr	-1572(ra) # 8020708c <elock>
  eremove(src);
    802056b8:	8526                	mv	a0,s1
    802056ba:	00002097          	auipc	ra,0x2
    802056be:	89e080e7          	jalr	-1890(ra) # 80206f58 <eremove>
  eunlock(src->parent);
    802056c2:	1204b503          	ld	a0,288(s1)
    802056c6:	00002097          	auipc	ra,0x2
    802056ca:	9fc080e7          	jalr	-1540(ra) # 802070c2 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    802056ce:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    802056d2:	854a                	mv	a0,s2
    802056d4:	00001097          	auipc	ra,0x1
    802056d8:	75a080e7          	jalr	1882(ra) # 80206e2e <edup>
    802056dc:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    802056e0:	dbc42783          	lw	a5,-580(s0)
    802056e4:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    802056e8:	4785                	li	a5,1
    802056ea:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    802056ee:	8526                	mv	a0,s1
    802056f0:	00002097          	auipc	ra,0x2
    802056f4:	9d2080e7          	jalr	-1582(ra) # 802070c2 <eunlock>
  eput(psrc);
    802056f8:	854e                	mv	a0,s3
    802056fa:	00002097          	auipc	ra,0x2
    802056fe:	a16080e7          	jalr	-1514(ra) # 80207110 <eput>
  if (dst) {
    80205702:	000a0763          	beqz	s4,80205710 <sys_rename+0x20a>
    eput(dst);
    80205706:	8552                	mv	a0,s4
    80205708:	00002097          	auipc	ra,0x2
    8020570c:	a08080e7          	jalr	-1528(ra) # 80207110 <eput>
  eput(pdst);
    80205710:	854a                	mv	a0,s2
    80205712:	00002097          	auipc	ra,0x2
    80205716:	9fe080e7          	jalr	-1538(ra) # 80207110 <eput>
  eput(src);
    8020571a:	8526                	mv	a0,s1
    8020571c:	00002097          	auipc	ra,0x2
    80205720:	9f4080e7          	jalr	-1548(ra) # 80207110 <eput>
  return 0;
    80205724:	4781                	li	a5,0
    80205726:	b5f5                	j	80205612 <sys_rename+0x10c>
        eunlock(dst);
    80205728:	8552                	mv	a0,s4
    8020572a:	00002097          	auipc	ra,0x2
    8020572e:	998080e7          	jalr	-1640(ra) # 802070c2 <eunlock>
        goto fail;
    80205732:	b57d                	j	802055e0 <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    80205734:	892a                	mv	s2,a0
  if (dst)
    80205736:	bd7d                	j	802055f4 <sys_rename+0xee>

0000000080205738 <sys_mkdirat>:
////////////////////////////////////////////////////////////////////////////


uint64
sys_mkdirat(void)
{
    80205738:	7169                	addi	sp,sp,-304
    8020573a:	f606                	sd	ra,296(sp)
    8020573c:	f222                	sd	s0,288(sp)
    8020573e:	ee26                	sd	s1,280(sp)
    80205740:	ea4a                	sd	s2,272(sp)
    80205742:	1a00                	addi	s0,sp,304

  char path[MAXPATH];
  int dirfd, mode;
  struct dirent *ep;

  if (argint(0, &dirfd) < 0 || argstr(1, path, MAXPATH) < 0 || argint(2, &mode) < 0) {
    80205744:	ed440593          	addi	a1,s0,-300
    80205748:	4501                	li	a0,0
    8020574a:	ffffe097          	auipc	ra,0xffffe
    8020574e:	9ae080e7          	jalr	-1618(ra) # 802030f8 <argint>
    return -1;
    80205752:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, MAXPATH) < 0 || argint(2, &mode) < 0) {
    80205754:	06054b63          	bltz	a0,802057ca <sys_mkdirat+0x92>
    80205758:	10400613          	li	a2,260
    8020575c:	ed840593          	addi	a1,s0,-296
    80205760:	4505                	li	a0,1
    80205762:	ffffe097          	auipc	ra,0xffffe
    80205766:	a1a080e7          	jalr	-1510(ra) # 8020317c <argstr>
    return -1;
    8020576a:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, MAXPATH) < 0 || argint(2, &mode) < 0) {
    8020576c:	04054f63          	bltz	a0,802057ca <sys_mkdirat+0x92>
    80205770:	ed040593          	addi	a1,s0,-304
    80205774:	4509                	li	a0,2
    80205776:	ffffe097          	auipc	ra,0xffffe
    8020577a:	982080e7          	jalr	-1662(ra) # 802030f8 <argint>
    return -1;
    8020577e:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, MAXPATH) < 0 || argint(2, &mode) < 0) {
    80205780:	04054563          	bltz	a0,802057ca <sys_mkdirat+0x92>
  }
  
  ep = create(path, T_DIR, mode);
    80205784:	ed042603          	lw	a2,-304(s0)
    80205788:	4585                	li	a1,1
    8020578a:	ed840913          	addi	s2,s0,-296
    8020578e:	854a                	mv	a0,s2
    80205790:	fffff097          	auipc	ra,0xfffff
    80205794:	488080e7          	jalr	1160(ra) # 80204c18 <create>
    80205798:	84aa                	mv	s1,a0
  printf("Running: MKDIRAT ... dirfd: %d ... mode: 0x%x... path: %s\n", dirfd, mode, path);
    8020579a:	86ca                	mv	a3,s2
    8020579c:	ed042603          	lw	a2,-304(s0)
    802057a0:	ed442583          	lw	a1,-300(s0)
    802057a4:	00005517          	auipc	a0,0x5
    802057a8:	54450513          	addi	a0,a0,1348 # 8020ace8 <digits+0x968>
    802057ac:	ffffb097          	auipc	ra,0xffffb
    802057b0:	9e2080e7          	jalr	-1566(ra) # 8020018e <printf>

  eunlock(ep);
    802057b4:	8526                	mv	a0,s1
    802057b6:	00002097          	auipc	ra,0x2
    802057ba:	90c080e7          	jalr	-1780(ra) # 802070c2 <eunlock>
  eput(ep);
    802057be:	8526                	mv	a0,s1
    802057c0:	00002097          	auipc	ra,0x2
    802057c4:	950080e7          	jalr	-1712(ra) # 80207110 <eput>
  return 0;
    802057c8:	4781                	li	a5,0
}
    802057ca:	853e                	mv	a0,a5
    802057cc:	70b2                	ld	ra,296(sp)
    802057ce:	7412                	ld	s0,288(sp)
    802057d0:	64f2                	ld	s1,280(sp)
    802057d2:	6952                	ld	s2,272(sp)
    802057d4:	6155                	addi	sp,sp,304
    802057d6:	8082                	ret

00000000802057d8 <sys_openat>:


uint64
sys_openat(void)
{
    802057d8:	714d                	addi	sp,sp,-336
    802057da:	e686                	sd	ra,328(sp)
    802057dc:	e2a2                	sd	s0,320(sp)
    802057de:	fe26                	sd	s1,312(sp)
    802057e0:	fa4a                	sd	s2,304(sp)
    802057e2:	f64e                	sd	s3,296(sp)
    802057e4:	0a80                	addi	s0,sp,336
  struct file *f;
  struct file *curr_f;
  struct dirent *ep;
  struct dirent *dest_ep;

  if(argint(0, &curr_fd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &omode) < 0 ||argint(3, &mode)<0){
    802057e6:	ec440593          	addi	a1,s0,-316
    802057ea:	4501                	li	a0,0
    802057ec:	ffffe097          	auipc	ra,0xffffe
    802057f0:	90c080e7          	jalr	-1780(ra) # 802030f8 <argint>
    802057f4:	0a054a63          	bltz	a0,802058a8 <sys_openat+0xd0>
    802057f8:	10400613          	li	a2,260
    802057fc:	ec840593          	addi	a1,s0,-312
    80205800:	4505                	li	a0,1
    80205802:	ffffe097          	auipc	ra,0xffffe
    80205806:	97a080e7          	jalr	-1670(ra) # 8020317c <argstr>
    8020580a:	08054f63          	bltz	a0,802058a8 <sys_openat+0xd0>
    8020580e:	ec040593          	addi	a1,s0,-320
    80205812:	4509                	li	a0,2
    80205814:	ffffe097          	auipc	ra,0xffffe
    80205818:	8e4080e7          	jalr	-1820(ra) # 802030f8 <argint>
    8020581c:	08054663          	bltz	a0,802058a8 <sys_openat+0xd0>
    80205820:	ebc40593          	addi	a1,s0,-324
    80205824:	450d                	li	a0,3
    80205826:	ffffe097          	auipc	ra,0xffffe
    8020582a:	8d2080e7          	jalr	-1838(ra) # 802030f8 <argint>
    8020582e:	06054d63          	bltz	a0,802058a8 <sys_openat+0xd0>
    printf("ERROR!!: OPENAT ... filefd: %d ... mode: 0x%x ... omode: 0x%x... path: %s", curr_fd, mode, omode, path);
    return -1;
  }
  printf("Running: OPENAT ... filefd: %d ... mode: 0x%x ... omode: 0x%x... path: %s", curr_fd, mode, omode, path);
    80205832:	ec840713          	addi	a4,s0,-312
    80205836:	ec042683          	lw	a3,-320(s0)
    8020583a:	ebc42603          	lw	a2,-324(s0)
    8020583e:	ec442583          	lw	a1,-316(s0)
    80205842:	00005517          	auipc	a0,0x5
    80205846:	53650513          	addi	a0,a0,1334 # 8020ad78 <digits+0x9f8>
    8020584a:	ffffb097          	auipc	ra,0xffffb
    8020584e:	944080e7          	jalr	-1724(ra) # 8020018e <printf>
  relative = 1;
  if(path[0] != '/' && curr_fd != AT_FDCWD){/*绝对路径，忽略fd*/
    80205852:	ec844703          	lbu	a4,-312(s0)
    80205856:	02f00793          	li	a5,47
    8020585a:	00f70863          	beq	a4,a5,8020586a <sys_openat+0x92>
    8020585e:	ec442703          	lw	a4,-316(s0)
    80205862:	f9c00793          	li	a5,-100
    80205866:	06f71963          	bne	a4,a5,802058d8 <sys_openat+0x100>
    curr_f = myproc()->ofile[curr_fd];
    if(curr_f == 0) return -1;
    dest_ep = curr_f->ep;
  }
  else{
    printf("...isrelative\n");
    8020586a:	00005517          	auipc	a0,0x5
    8020586e:	56e50513          	addi	a0,a0,1390 # 8020add8 <digits+0xa58>
    80205872:	ffffb097          	auipc	ra,0xffffb
    80205876:	91c080e7          	jalr	-1764(ra) # 8020018e <printf>
    relative = 1;
    dest_ep = 0;
  }
  /*open*/
  if(omode & O_CREATE){
    8020587a:	ec042603          	lw	a2,-320(s0)
    8020587e:	04067793          	andi	a5,a2,64
    80205882:	e3f5                	bnez	a5,80205966 <sys_openat+0x18e>
        printf("ERROR_ename_env!!!!\n");
        return -1;
      }
    }
    else{
      if((ep = ename(path)) == NULL){
    80205884:	ec840513          	addi	a0,s0,-312
    80205888:	00002097          	auipc	ra,0x2
    8020588c:	058080e7          	jalr	88(ra) # 802078e0 <ename>
    80205890:	892a                	mv	s2,a0
    80205892:	e549                	bnez	a0,8020591c <sys_openat+0x144>
          printf("ERROR_ename!!!!\n");
    80205894:	00005517          	auipc	a0,0x5
    80205898:	56c50513          	addi	a0,a0,1388 # 8020ae00 <digits+0xa80>
    8020589c:	ffffb097          	auipc	ra,0xffffb
    802058a0:	8f2080e7          	jalr	-1806(ra) # 8020018e <printf>
          return -1;
    802058a4:	557d                	li	a0,-1
    802058a6:	a015                	j	802058ca <sys_openat+0xf2>
    printf("ERROR!!: OPENAT ... filefd: %d ... mode: 0x%x ... omode: 0x%x... path: %s", curr_fd, mode, omode, path);
    802058a8:	ec840713          	addi	a4,s0,-312
    802058ac:	ec042683          	lw	a3,-320(s0)
    802058b0:	ebc42603          	lw	a2,-324(s0)
    802058b4:	ec442583          	lw	a1,-316(s0)
    802058b8:	00005517          	auipc	a0,0x5
    802058bc:	47050513          	addi	a0,a0,1136 # 8020ad28 <digits+0x9a8>
    802058c0:	ffffb097          	auipc	ra,0xffffb
    802058c4:	8ce080e7          	jalr	-1842(ra) # 8020018e <printf>
    return -1;
    802058c8:	557d                	li	a0,-1
  f->ep = ep;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  eunlock(ep);
  return fd;
}
    802058ca:	60b6                	ld	ra,328(sp)
    802058cc:	6416                	ld	s0,320(sp)
    802058ce:	74f2                	ld	s1,312(sp)
    802058d0:	7952                	ld	s2,304(sp)
    802058d2:	79b2                	ld	s3,296(sp)
    802058d4:	6171                	addi	sp,sp,336
    802058d6:	8082                	ret
    printf("...isabsolute\n");
    802058d8:	00005517          	auipc	a0,0x5
    802058dc:	4f050513          	addi	a0,a0,1264 # 8020adc8 <digits+0xa48>
    802058e0:	ffffb097          	auipc	ra,0xffffb
    802058e4:	8ae080e7          	jalr	-1874(ra) # 8020018e <printf>
    curr_f = myproc()->ofile[curr_fd];
    802058e8:	ffffc097          	auipc	ra,0xffffc
    802058ec:	1ce080e7          	jalr	462(ra) # 80201ab6 <myproc>
    802058f0:	ec442783          	lw	a5,-316(s0)
    802058f4:	07e9                	addi	a5,a5,26
    802058f6:	078e                	slli	a5,a5,0x3
    802058f8:	953e                	add	a0,a0,a5
    802058fa:	651c                	ld	a5,8(a0)
    if(curr_f == 0) return -1;
    802058fc:	10078463          	beqz	a5,80205a04 <sys_openat+0x22c>
    dest_ep = curr_f->ep;
    80205900:	6f88                	ld	a0,24(a5)
  if(omode & O_CREATE){
    80205902:	ec042603          	lw	a2,-320(s0)
    80205906:	04067793          	andi	a5,a2,64
    8020590a:	efb1                	bnez	a5,80205966 <sys_openat+0x18e>
      if((ep = ename_env(dest_ep, path))== NULL){
    8020590c:	ec840593          	addi	a1,s0,-312
    80205910:	00002097          	auipc	ra,0x2
    80205914:	fee080e7          	jalr	-18(ra) # 802078fe <ename_env>
    80205918:	892a                	mv	s2,a0
    8020591a:	c569                	beqz	a0,802059e4 <sys_openat+0x20c>
    elock(ep);
    8020591c:	854a                	mv	a0,s2
    8020591e:	00001097          	auipc	ra,0x1
    80205922:	76e080e7          	jalr	1902(ra) # 8020708c <elock>
    if((ep->attribute & ATTR_DIRECTORY) && (omode != O_RDONLY && omode != O_DIRECTORY)){
    80205926:	10094583          	lbu	a1,256(s2)
    8020592a:	0105f793          	andi	a5,a1,16
    8020592e:	c7a9                	beqz	a5,80205978 <sys_openat+0x1a0>
    80205930:	ec042783          	lw	a5,-320(s0)
    80205934:	ffe00737          	lui	a4,0xffe00
    80205938:	177d                	addi	a4,a4,-1 # ffffffffffdfffff <ebss_clear+0xffffffff7fbd2fff>
    8020593a:	8ff9                	and	a5,a5,a4
    8020593c:	cf95                	beqz	a5,80205978 <sys_openat+0x1a0>
      printf("ERROR_attribute = 0x%x & ATTR_DIRECTORY", ep->attribute);
    8020593e:	00005517          	auipc	a0,0x5
    80205942:	4da50513          	addi	a0,a0,1242 # 8020ae18 <digits+0xa98>
    80205946:	ffffb097          	auipc	ra,0xffffb
    8020594a:	848080e7          	jalr	-1976(ra) # 8020018e <printf>
      eunlock(ep);
    8020594e:	854a                	mv	a0,s2
    80205950:	00001097          	auipc	ra,0x1
    80205954:	772080e7          	jalr	1906(ra) # 802070c2 <eunlock>
      eput(ep);
    80205958:	854a                	mv	a0,s2
    8020595a:	00001097          	auipc	ra,0x1
    8020595e:	7b6080e7          	jalr	1974(ra) # 80207110 <eput>
      return -1;
    80205962:	557d                	li	a0,-1
    80205964:	b79d                	j	802058ca <sys_openat+0xf2>
    ep = create(path, T_FILE, omode);
    80205966:	4589                	li	a1,2
    80205968:	ec840513          	addi	a0,s0,-312
    8020596c:	fffff097          	auipc	ra,0xfffff
    80205970:	2ac080e7          	jalr	684(ra) # 80204c18 <create>
    80205974:	892a                	mv	s2,a0
    if(ep == NULL){
    80205976:	c949                	beqz	a0,80205a08 <sys_openat+0x230>
  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80205978:	ffffe097          	auipc	ra,0xffffe
    8020597c:	54e080e7          	jalr	1358(ra) # 80203ec6 <filealloc>
    80205980:	89aa                	mv	s3,a0
    80205982:	c951                	beqz	a0,80205a16 <sys_openat+0x23e>
    80205984:	fffff097          	auipc	ra,0xfffff
    80205988:	252080e7          	jalr	594(ra) # 80204bd6 <fdalloc>
    8020598c:	84aa                	mv	s1,a0
    8020598e:	06054f63          	bltz	a0,80205a0c <sys_openat+0x234>
  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80205992:	10094783          	lbu	a5,256(s2)
    80205996:	8bc1                	andi	a5,a5,16
    80205998:	e791                	bnez	a5,802059a4 <sys_openat+0x1cc>
    8020599a:	ec042783          	lw	a5,-320(s0)
    8020599e:	4007f793          	andi	a5,a5,1024
    802059a2:	ebb9                	bnez	a5,802059f8 <sys_openat+0x220>
  f->type = FD_ENTRY;
    802059a4:	4789                	li	a5,2
    802059a6:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    802059aa:	ec042783          	lw	a5,-320(s0)
    802059ae:	0047f693          	andi	a3,a5,4
    802059b2:	4701                	li	a4,0
    802059b4:	c299                	beqz	a3,802059ba <sys_openat+0x1e2>
    802059b6:	10892703          	lw	a4,264(s2)
    802059ba:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    802059be:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    802059c2:	0017c713          	xori	a4,a5,1
    802059c6:	8b05                	andi	a4,a4,1
    802059c8:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    802059cc:	8b8d                	andi	a5,a5,3
    802059ce:	00f037b3          	snez	a5,a5
    802059d2:	00f984a3          	sb	a5,9(s3)
  eunlock(ep);
    802059d6:	854a                	mv	a0,s2
    802059d8:	00001097          	auipc	ra,0x1
    802059dc:	6ea080e7          	jalr	1770(ra) # 802070c2 <eunlock>
  return fd;
    802059e0:	8526                	mv	a0,s1
    802059e2:	b5e5                	j	802058ca <sys_openat+0xf2>
        printf("ERROR_ename_env!!!!\n");
    802059e4:	00005517          	auipc	a0,0x5
    802059e8:	40450513          	addi	a0,a0,1028 # 8020ade8 <digits+0xa68>
    802059ec:	ffffa097          	auipc	ra,0xffffa
    802059f0:	7a2080e7          	jalr	1954(ra) # 8020018e <printf>
        return -1;
    802059f4:	557d                	li	a0,-1
    802059f6:	bdd1                	j	802058ca <sys_openat+0xf2>
    etrunc(ep);
    802059f8:	854a                	mv	a0,s2
    802059fa:	00001097          	auipc	ra,0x1
    802059fe:	628080e7          	jalr	1576(ra) # 80207022 <etrunc>
    80205a02:	b74d                	j	802059a4 <sys_openat+0x1cc>
    if(curr_f == 0) return -1;
    80205a04:	557d                	li	a0,-1
    80205a06:	b5d1                	j	802058ca <sys_openat+0xf2>
      return -1;
    80205a08:	557d                	li	a0,-1
    80205a0a:	b5c1                	j	802058ca <sys_openat+0xf2>
      fileclose(f);
    80205a0c:	854e                	mv	a0,s3
    80205a0e:	ffffe097          	auipc	ra,0xffffe
    80205a12:	574080e7          	jalr	1396(ra) # 80203f82 <fileclose>
    eunlock(ep);
    80205a16:	854a                	mv	a0,s2
    80205a18:	00001097          	auipc	ra,0x1
    80205a1c:	6aa080e7          	jalr	1706(ra) # 802070c2 <eunlock>
    eput(ep);
    80205a20:	854a                	mv	a0,s2
    80205a22:	00001097          	auipc	ra,0x1
    80205a26:	6ee080e7          	jalr	1774(ra) # 80207110 <eput>
    return -1;
    80205a2a:	557d                	li	a0,-1
    80205a2c:	bd79                	j	802058ca <sys_openat+0xf2>

0000000080205a2e <sys_dup3>:


uint64
sys_dup3(void)
{
    80205a2e:	7179                	addi	sp,sp,-48
    80205a30:	f406                	sd	ra,40(sp)
    80205a32:	f022                	sd	s0,32(sp)
    80205a34:	ec26                	sd	s1,24(sp)
    80205a36:	1800                	addi	s0,sp,48
  struct file *f;
  int newfd;
  
  if(argfd(0, 0, &f) < 0) 
    80205a38:	fd840613          	addi	a2,s0,-40
    80205a3c:	4581                	li	a1,0
    80205a3e:	4501                	li	a0,0
    80205a40:	fffff097          	auipc	ra,0xfffff
    80205a44:	12e080e7          	jalr	302(ra) # 80204b6e <argfd>
    return -1;
    80205a48:	577d                	li	a4,-1
  if(argfd(0, 0, &f) < 0) 
    80205a4a:	06054963          	bltz	a0,80205abc <sys_dup3+0x8e>
  if(argint(1, &newfd) < 0 || newfd < 0)
    80205a4e:	fd440593          	addi	a1,s0,-44
    80205a52:	4505                	li	a0,1
    80205a54:	ffffd097          	auipc	ra,0xffffd
    80205a58:	6a4080e7          	jalr	1700(ra) # 802030f8 <argint>
    80205a5c:	fd442783          	lw	a5,-44(s0)
    80205a60:	8fc9                	or	a5,a5,a0
    80205a62:	2781                	sext.w	a5,a5
    return -1;
    80205a64:	577d                	li	a4,-1
  if(argint(1, &newfd) < 0 || newfd < 0)
    80205a66:	0407cb63          	bltz	a5,80205abc <sys_dup3+0x8e>
  if(myproc()->ofile[newfd] != f) 
    80205a6a:	ffffc097          	auipc	ra,0xffffc
    80205a6e:	04c080e7          	jalr	76(ra) # 80201ab6 <myproc>
    80205a72:	fd843483          	ld	s1,-40(s0)
    80205a76:	fd442783          	lw	a5,-44(s0)
    80205a7a:	07e9                	addi	a5,a5,26
    80205a7c:	078e                	slli	a5,a5,0x3
    80205a7e:	953e                	add	a0,a0,a5
    80205a80:	651c                	ld	a5,8(a0)
    80205a82:	02978163          	beq	a5,s1,80205aa4 <sys_dup3+0x76>
  {
    myproc()->ofile[newfd] = f;
    80205a86:	ffffc097          	auipc	ra,0xffffc
    80205a8a:	030080e7          	jalr	48(ra) # 80201ab6 <myproc>
    80205a8e:	fd442783          	lw	a5,-44(s0)
    80205a92:	07e9                	addi	a5,a5,26
    80205a94:	078e                	slli	a5,a5,0x3
    80205a96:	953e                	add	a0,a0,a5
    80205a98:	e504                	sd	s1,8(a0)
    filedup(f);
    80205a9a:	8526                	mv	a0,s1
    80205a9c:	ffffe097          	auipc	ra,0xffffe
    80205aa0:	494080e7          	jalr	1172(ra) # 80203f30 <filedup>
  }
  printf("Running: DUP3 ... newfd: %d \n", newfd);
    80205aa4:	fd442583          	lw	a1,-44(s0)
    80205aa8:	00005517          	auipc	a0,0x5
    80205aac:	39850513          	addi	a0,a0,920 # 8020ae40 <digits+0xac0>
    80205ab0:	ffffa097          	auipc	ra,0xffffa
    80205ab4:	6de080e7          	jalr	1758(ra) # 8020018e <printf>
  return newfd;
    80205ab8:	fd442703          	lw	a4,-44(s0)
}
    80205abc:	853a                	mv	a0,a4
    80205abe:	70a2                	ld	ra,40(sp)
    80205ac0:	7402                	ld	s0,32(sp)
    80205ac2:	64e2                	ld	s1,24(sp)
    80205ac4:	6145                	addi	sp,sp,48
    80205ac6:	8082                	ret

0000000080205ac8 <sys_getdents64>:

uint64
sys_getdents64(void){
    80205ac8:	7179                	addi	sp,sp,-48
    80205aca:	f406                	sd	ra,40(sp)
    80205acc:	f022                	sd	s0,32(sp)
    80205ace:	1800                	addi	s0,sp,48
  struct file *f;
  uint64 buf;
  int len, fd;
  if (argfd(0, &fd, &f) < 0 || argaddr(1, &buf) < 0 || argint(2, &len) < 0)
    80205ad0:	fe840613          	addi	a2,s0,-24
    80205ad4:	fd840593          	addi	a1,s0,-40
    80205ad8:	4501                	li	a0,0
    80205ada:	fffff097          	auipc	ra,0xfffff
    80205ade:	094080e7          	jalr	148(ra) # 80204b6e <argfd>
    return -1;
    80205ae2:	57fd                	li	a5,-1
  if (argfd(0, &fd, &f) < 0 || argaddr(1, &buf) < 0 || argint(2, &len) < 0)
    80205ae4:	04054f63          	bltz	a0,80205b42 <sys_getdents64+0x7a>
    80205ae8:	fe040593          	addi	a1,s0,-32
    80205aec:	4505                	li	a0,1
    80205aee:	ffffd097          	auipc	ra,0xffffd
    80205af2:	66c080e7          	jalr	1644(ra) # 8020315a <argaddr>
    return -1;
    80205af6:	57fd                	li	a5,-1
  if (argfd(0, &fd, &f) < 0 || argaddr(1, &buf) < 0 || argint(2, &len) < 0)
    80205af8:	04054563          	bltz	a0,80205b42 <sys_getdents64+0x7a>
    80205afc:	fdc40593          	addi	a1,s0,-36
    80205b00:	4509                	li	a0,2
    80205b02:	ffffd097          	auipc	ra,0xffffd
    80205b06:	5f6080e7          	jalr	1526(ra) # 802030f8 <argint>
    return -1;
    80205b0a:	57fd                	li	a5,-1
  if (argfd(0, &fd, &f) < 0 || argaddr(1, &buf) < 0 || argint(2, &len) < 0)
    80205b0c:	02054b63          	bltz	a0,80205b42 <sys_getdents64+0x7a>
  printf("Running: getdent ... filefd: %d ... buf: 0x%x ... len: %d\n", fd, buf, len);
    80205b10:	fdc42683          	lw	a3,-36(s0)
    80205b14:	fe043603          	ld	a2,-32(s0)
    80205b18:	fd842583          	lw	a1,-40(s0)
    80205b1c:	00005517          	auipc	a0,0x5
    80205b20:	34450513          	addi	a0,a0,836 # 8020ae60 <digits+0xae0>
    80205b24:	ffffa097          	auipc	ra,0xffffa
    80205b28:	66a080e7          	jalr	1642(ra) # 8020018e <printf>
  return dirnext_(f,buf,len);
    80205b2c:	fdc42603          	lw	a2,-36(s0)
    80205b30:	fe043583          	ld	a1,-32(s0)
    80205b34:	fe843503          	ld	a0,-24(s0)
    80205b38:	ffffe097          	auipc	ra,0xffffe
    80205b3c:	7bc080e7          	jalr	1980(ra) # 802042f4 <dirnext_>
    80205b40:	87aa                	mv	a5,a0
}
    80205b42:	853e                	mv	a0,a5
    80205b44:	70a2                	ld	ra,40(sp)
    80205b46:	7402                	ld	s0,32(sp)
    80205b48:	6145                	addi	sp,sp,48
    80205b4a:	8082                	ret

0000000080205b4c <sys_mmap>:

uint64
sys_mmap(void){
    80205b4c:	1141                	addi	sp,sp,-16
    80205b4e:	e422                	sd	s0,8(sp)
    80205b50:	0800                	addi	s0,sp,16
    a += PGSIZE;
    pa += PGSIZE;
    mapped_len += PGSIZE;
  }
  return start;
}
    80205b52:	4501                	li	a0,0
    80205b54:	6422                	ld	s0,8(sp)
    80205b56:	0141                	addi	sp,sp,16
    80205b58:	8082                	ret

0000000080205b5a <sys_munmap>:


uint64
sys_munmap(void)
{
    80205b5a:	1141                	addi	sp,sp,-16
    80205b5c:	e422                	sd	s0,8(sp)
    80205b5e:	0800                	addi	s0,sp,16
  if (argaddr(0, &start) < 0 || argaddr(1, &len) < 0)
    return -1;
  struct proc *p = myproc();
  vmunmap(p->pagetable, start, len, 0);
  return 0;
}
    80205b60:	4501                	li	a0,0
    80205b62:	6422                	ld	s0,8(sp)
    80205b64:	0141                	addi	sp,sp,16
    80205b66:	8082                	ret

0000000080205b68 <sys_pipe2>:


uint64
sys_pipe2(void)
{
    80205b68:	715d                	addi	sp,sp,-80
    80205b6a:	e486                	sd	ra,72(sp)
    80205b6c:	e0a2                	sd	s0,64(sp)
    80205b6e:	fc26                	sd	s1,56(sp)
    80205b70:	f84a                	sd	s2,48(sp)
    80205b72:	f44e                	sd	s3,40(sp)
    80205b74:	0880                	addi	s0,sp,80
  uint64 fdarray; // user pointer to array of two integers
  int fd0 = -1, fd1;
  struct proc *p = myproc();
    80205b76:	ffffc097          	auipc	ra,0xffffc
    80205b7a:	f40080e7          	jalr	-192(ra) # 80201ab6 <myproc>
    80205b7e:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80205b80:	fc840593          	addi	a1,s0,-56
    80205b84:	4501                	li	a0,0
    80205b86:	ffffd097          	auipc	ra,0xffffd
    80205b8a:	5d4080e7          	jalr	1492(ra) # 8020315a <argaddr>
    return -1;
    80205b8e:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80205b90:	06054563          	bltz	a0,80205bfa <sys_pipe2+0x92>

  int *fd = (int *)fdarray;
    80205b94:	fc843903          	ld	s2,-56(s0)
  struct file *rf = p->ofile[fd[0]], *wf = p->ofile[fd[1]];
    80205b98:	00092783          	lw	a5,0(s2)
    80205b9c:	07e9                	addi	a5,a5,26
    80205b9e:	078e                	slli	a5,a5,0x3
    80205ba0:	97a6                	add	a5,a5,s1
    80205ba2:	679c                	ld	a5,8(a5)
    80205ba4:	fcf43023          	sd	a5,-64(s0)
    80205ba8:	00492783          	lw	a5,4(s2)
    80205bac:	07e9                	addi	a5,a5,26
    80205bae:	078e                	slli	a5,a5,0x3
    80205bb0:	97a6                	add	a5,a5,s1
    80205bb2:	679c                	ld	a5,8(a5)
    80205bb4:	faf43c23          	sd	a5,-72(s0)

  if(pipealloc(&rf, &wf) < 0)
    80205bb8:	fb840593          	addi	a1,s0,-72
    80205bbc:	fc040513          	addi	a0,s0,-64
    80205bc0:	fffff097          	auipc	ra,0xfffff
    80205bc4:	840080e7          	jalr	-1984(ra) # 80204400 <pipealloc>
    return -1;
    80205bc8:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80205bca:	02054863          	bltz	a0,80205bfa <sys_pipe2+0x92>
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80205bce:	fc043503          	ld	a0,-64(s0)
    80205bd2:	fffff097          	auipc	ra,0xfffff
    80205bd6:	004080e7          	jalr	4(ra) # 80204bd6 <fdalloc>
    80205bda:	89aa                	mv	s3,a0
    80205bdc:	02054c63          	bltz	a0,80205c14 <sys_pipe2+0xac>
    80205be0:	fb843503          	ld	a0,-72(s0)
    80205be4:	fffff097          	auipc	ra,0xfffff
    80205be8:	ff2080e7          	jalr	-14(ra) # 80204bd6 <fdalloc>
    80205bec:	00054f63          	bltz	a0,80205c0a <sys_pipe2+0xa2>
    fileclose(rf);
    fileclose(wf);
    return -1;
  }

  fd[0] = fd0;
    80205bf0:	01392023          	sw	s3,0(s2)
  fd[1] = fd1;
    80205bf4:	00a92223          	sw	a0,4(s2)

  return 0;
    80205bf8:	4781                	li	a5,0
}
    80205bfa:	853e                	mv	a0,a5
    80205bfc:	60a6                	ld	ra,72(sp)
    80205bfe:	6406                	ld	s0,64(sp)
    80205c00:	74e2                	ld	s1,56(sp)
    80205c02:	7942                	ld	s2,48(sp)
    80205c04:	79a2                	ld	s3,40(sp)
    80205c06:	6161                	addi	sp,sp,80
    80205c08:	8082                	ret
      p->ofile[fd0] = 0;
    80205c0a:	09e9                	addi	s3,s3,26
    80205c0c:	098e                	slli	s3,s3,0x3
    80205c0e:	94ce                	add	s1,s1,s3
    80205c10:	0004b423          	sd	zero,8(s1)
    fileclose(rf);
    80205c14:	fc043503          	ld	a0,-64(s0)
    80205c18:	ffffe097          	auipc	ra,0xffffe
    80205c1c:	36a080e7          	jalr	874(ra) # 80203f82 <fileclose>
    fileclose(wf);
    80205c20:	fb843503          	ld	a0,-72(s0)
    80205c24:	ffffe097          	auipc	ra,0xffffe
    80205c28:	35e080e7          	jalr	862(ra) # 80203f82 <fileclose>
    return -1;
    80205c2c:	57fd                	li	a5,-1
    80205c2e:	b7f1                	j	80205bfa <sys_pipe2+0x92>

0000000080205c30 <sys_mount>:



uint64
sys_mount(void)
{
    80205c30:	cc010113          	addi	sp,sp,-832
    80205c34:	32113c23          	sd	ra,824(sp)
    80205c38:	32813823          	sd	s0,816(sp)
    80205c3c:	32913423          	sd	s1,808(sp)
    80205c40:	0680                	addi	s0,sp,832
  char special[FAT32_MAX_PATH], dir[FAT32_MAX_PATH], fstype[FAT32_MAX_FILENAME];
  uint64 flags, data;

  if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0 || 
    80205c42:	10400613          	li	a2,260
    80205c46:	ed840593          	addi	a1,s0,-296
    80205c4a:	4501                	li	a0,0
    80205c4c:	ffffd097          	auipc	ra,0xffffd
    80205c50:	530080e7          	jalr	1328(ra) # 8020317c <argstr>
      argstr(2, fstype, FAT32_MAX_FILENAME) < 0 || argaddr(3, &flags) < 0 || argaddr(4, &data) < 0)
    return -1;
    80205c54:	57fd                	li	a5,-1
  if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0 || 
    80205c56:	0a054663          	bltz	a0,80205d02 <sys_mount+0xd2>
    80205c5a:	10400613          	li	a2,260
    80205c5e:	dd040593          	addi	a1,s0,-560
    80205c62:	4505                	li	a0,1
    80205c64:	ffffd097          	auipc	ra,0xffffd
    80205c68:	518080e7          	jalr	1304(ra) # 8020317c <argstr>
    return -1;
    80205c6c:	57fd                	li	a5,-1
  if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0 || 
    80205c6e:	08054a63          	bltz	a0,80205d02 <sys_mount+0xd2>
      argstr(2, fstype, FAT32_MAX_FILENAME) < 0 || argaddr(3, &flags) < 0 || argaddr(4, &data) < 0)
    80205c72:	0ff00613          	li	a2,255
    80205c76:	cd040593          	addi	a1,s0,-816
    80205c7a:	4509                	li	a0,2
    80205c7c:	ffffd097          	auipc	ra,0xffffd
    80205c80:	500080e7          	jalr	1280(ra) # 8020317c <argstr>
    return -1;
    80205c84:	57fd                	li	a5,-1
  if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0 || 
    80205c86:	06054e63          	bltz	a0,80205d02 <sys_mount+0xd2>
      argstr(2, fstype, FAT32_MAX_FILENAME) < 0 || argaddr(3, &flags) < 0 || argaddr(4, &data) < 0)
    80205c8a:	cc840593          	addi	a1,s0,-824
    80205c8e:	450d                	li	a0,3
    80205c90:	ffffd097          	auipc	ra,0xffffd
    80205c94:	4ca080e7          	jalr	1226(ra) # 8020315a <argaddr>
    return -1;
    80205c98:	57fd                	li	a5,-1
      argstr(2, fstype, FAT32_MAX_FILENAME) < 0 || argaddr(3, &flags) < 0 || argaddr(4, &data) < 0)
    80205c9a:	06054463          	bltz	a0,80205d02 <sys_mount+0xd2>
    80205c9e:	cc040593          	addi	a1,s0,-832
    80205ca2:	4511                	li	a0,4
    80205ca4:	ffffd097          	auipc	ra,0xffffd
    80205ca8:	4b6080e7          	jalr	1206(ra) # 8020315a <argaddr>
    return -1;
    80205cac:	57fd                	li	a5,-1
      argstr(2, fstype, FAT32_MAX_FILENAME) < 0 || argaddr(3, &flags) < 0 || argaddr(4, &data) < 0)
    80205cae:	04054a63          	bltz	a0,80205d02 <sys_mount+0xd2>
  struct dirent *dev = NULL, *mnt;
  if((mnt = ename(dir)) == NULL)
    80205cb2:	dd040513          	addi	a0,s0,-560
    80205cb6:	00002097          	auipc	ra,0x2
    80205cba:	c2a080e7          	jalr	-982(ra) # 802078e0 <ename>
    80205cbe:	84aa                	mv	s1,a0
    80205cc0:	c939                	beqz	a0,80205d16 <sys_mount+0xe6>
    return -1;

  if(strncmp("vfat", fstype, 5) != 0 && strncmp("fat32", fstype, 6) != 0)
    80205cc2:	4615                	li	a2,5
    80205cc4:	cd040593          	addi	a1,s0,-816
    80205cc8:	00005517          	auipc	a0,0x5
    80205ccc:	1d850513          	addi	a0,a0,472 # 8020aea0 <digits+0xb20>
    80205cd0:	ffffb097          	auipc	ra,0xffffb
    80205cd4:	b6a080e7          	jalr	-1174(ra) # 8020083a <strncmp>
    80205cd8:	cd11                	beqz	a0,80205cf4 <sys_mount+0xc4>
    80205cda:	4619                	li	a2,6
    80205cdc:	cd040593          	addi	a1,s0,-816
    80205ce0:	00005517          	auipc	a0,0x5
    80205ce4:	1c850513          	addi	a0,a0,456 # 8020aea8 <digits+0xb28>
    80205ce8:	ffffb097          	auipc	ra,0xffffb
    80205cec:	b52080e7          	jalr	-1198(ra) # 8020083a <strncmp>
    return -1;
    80205cf0:	57fd                	li	a5,-1
  if(strncmp("vfat", fstype, 5) != 0 && strncmp("fat32", fstype, 6) != 0)
    80205cf2:	e901                	bnez	a0,80205d02 <sys_mount+0xd2>
  return mount(dev,mnt);
    80205cf4:	85a6                	mv	a1,s1
    80205cf6:	4501                	li	a0,0
    80205cf8:	00002097          	auipc	ra,0x2
    80205cfc:	cb2080e7          	jalr	-846(ra) # 802079aa <mount>
    80205d00:	87aa                	mv	a5,a0
}
    80205d02:	853e                	mv	a0,a5
    80205d04:	33813083          	ld	ra,824(sp)
    80205d08:	33013403          	ld	s0,816(sp)
    80205d0c:	32813483          	ld	s1,808(sp)
    80205d10:	34010113          	addi	sp,sp,832
    80205d14:	8082                	ret
    return -1;
    80205d16:	57fd                	li	a5,-1
    80205d18:	b7ed                	j	80205d02 <sys_mount+0xd2>
    80205d1a:	0000                	unimp
    80205d1c:	0000                	unimp
	...

0000000080205d20 <kernelvec>:
    80205d20:	7111                	addi	sp,sp,-256
    80205d22:	e006                	sd	ra,0(sp)
    80205d24:	e40a                	sd	sp,8(sp)
    80205d26:	e80e                	sd	gp,16(sp)
    80205d28:	ec12                	sd	tp,24(sp)
    80205d2a:	f016                	sd	t0,32(sp)
    80205d2c:	f41a                	sd	t1,40(sp)
    80205d2e:	f81e                	sd	t2,48(sp)
    80205d30:	fc22                	sd	s0,56(sp)
    80205d32:	e0a6                	sd	s1,64(sp)
    80205d34:	e4aa                	sd	a0,72(sp)
    80205d36:	e8ae                	sd	a1,80(sp)
    80205d38:	ecb2                	sd	a2,88(sp)
    80205d3a:	f0b6                	sd	a3,96(sp)
    80205d3c:	f4ba                	sd	a4,104(sp)
    80205d3e:	f8be                	sd	a5,112(sp)
    80205d40:	fcc2                	sd	a6,120(sp)
    80205d42:	e146                	sd	a7,128(sp)
    80205d44:	e54a                	sd	s2,136(sp)
    80205d46:	e94e                	sd	s3,144(sp)
    80205d48:	ed52                	sd	s4,152(sp)
    80205d4a:	f156                	sd	s5,160(sp)
    80205d4c:	f55a                	sd	s6,168(sp)
    80205d4e:	f95e                	sd	s7,176(sp)
    80205d50:	fd62                	sd	s8,184(sp)
    80205d52:	e1e6                	sd	s9,192(sp)
    80205d54:	e5ea                	sd	s10,200(sp)
    80205d56:	e9ee                	sd	s11,208(sp)
    80205d58:	edf2                	sd	t3,216(sp)
    80205d5a:	f1f6                	sd	t4,224(sp)
    80205d5c:	f5fa                	sd	t5,232(sp)
    80205d5e:	f9fe                	sd	t6,240(sp)
    80205d60:	f1bfc0ef          	jal	ra,80202c7a <kerneltrap>
    80205d64:	6082                	ld	ra,0(sp)
    80205d66:	6122                	ld	sp,8(sp)
    80205d68:	61c2                	ld	gp,16(sp)
    80205d6a:	7282                	ld	t0,32(sp)
    80205d6c:	7322                	ld	t1,40(sp)
    80205d6e:	73c2                	ld	t2,48(sp)
    80205d70:	7462                	ld	s0,56(sp)
    80205d72:	6486                	ld	s1,64(sp)
    80205d74:	6526                	ld	a0,72(sp)
    80205d76:	65c6                	ld	a1,80(sp)
    80205d78:	6666                	ld	a2,88(sp)
    80205d7a:	7686                	ld	a3,96(sp)
    80205d7c:	7726                	ld	a4,104(sp)
    80205d7e:	77c6                	ld	a5,112(sp)
    80205d80:	7866                	ld	a6,120(sp)
    80205d82:	688a                	ld	a7,128(sp)
    80205d84:	692a                	ld	s2,136(sp)
    80205d86:	69ca                	ld	s3,144(sp)
    80205d88:	6a6a                	ld	s4,152(sp)
    80205d8a:	7a8a                	ld	s5,160(sp)
    80205d8c:	7b2a                	ld	s6,168(sp)
    80205d8e:	7bca                	ld	s7,176(sp)
    80205d90:	7c6a                	ld	s8,184(sp)
    80205d92:	6c8e                	ld	s9,192(sp)
    80205d94:	6d2e                	ld	s10,200(sp)
    80205d96:	6dce                	ld	s11,208(sp)
    80205d98:	6e6e                	ld	t3,216(sp)
    80205d9a:	7e8e                	ld	t4,224(sp)
    80205d9c:	7f2e                	ld	t5,232(sp)
    80205d9e:	7fce                	ld	t6,240(sp)
    80205da0:	6111                	addi	sp,sp,256
    80205da2:	10200073          	sret
	...

0000000080205dae <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    80205dae:	1141                	addi	sp,sp,-16
    80205db0:	e406                	sd	ra,8(sp)
    80205db2:	e022                	sd	s0,0(sp)
    80205db4:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80205db6:	00005597          	auipc	a1,0x5
    80205dba:	0fa58593          	addi	a1,a1,250 # 8020aeb0 <digits+0xb30>
    80205dbe:	0001e517          	auipc	a0,0x1e
    80205dc2:	01a50513          	addi	a0,a0,26 # 80223dd8 <tickslock>
    80205dc6:	ffffb097          	auipc	ra,0xffffb
    80205dca:	8bc080e7          	jalr	-1860(ra) # 80200682 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    80205dce:	60a2                	ld	ra,8(sp)
    80205dd0:	6402                	ld	s0,0(sp)
    80205dd2:	0141                	addi	sp,sp,16
    80205dd4:	8082                	ret

0000000080205dd6 <set_next_timeout>:

void
set_next_timeout() {
    80205dd6:	1141                	addi	sp,sp,-16
    80205dd8:	e422                	sd	s0,8(sp)
    80205dda:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    80205ddc:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80205de0:	001dc7b7          	lui	a5,0x1dc
    80205de4:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    80205de8:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    80205dea:	4581                	li	a1,0
    80205dec:	4601                	li	a2,0
    80205dee:	4681                	li	a3,0
    80205df0:	4881                	li	a7,0
    80205df2:	00000073          	ecall
}
    80205df6:	6422                	ld	s0,8(sp)
    80205df8:	0141                	addi	sp,sp,16
    80205dfa:	8082                	ret

0000000080205dfc <timer_tick>:

void timer_tick() {
    80205dfc:	1101                	addi	sp,sp,-32
    80205dfe:	ec06                	sd	ra,24(sp)
    80205e00:	e822                	sd	s0,16(sp)
    80205e02:	e426                	sd	s1,8(sp)
    80205e04:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80205e06:	0001e497          	auipc	s1,0x1e
    80205e0a:	fd248493          	addi	s1,s1,-46 # 80223dd8 <tickslock>
    80205e0e:	8526                	mv	a0,s1
    80205e10:	ffffb097          	auipc	ra,0xffffb
    80205e14:	8b6080e7          	jalr	-1866(ra) # 802006c6 <acquire>
    ticks++;
    80205e18:	4c9c                	lw	a5,24(s1)
    80205e1a:	2785                	addiw	a5,a5,1
    80205e1c:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    80205e1e:	0001e517          	auipc	a0,0x1e
    80205e22:	fd250513          	addi	a0,a0,-46 # 80223df0 <ticks>
    80205e26:	ffffc097          	auipc	ra,0xffffc
    80205e2a:	6cc080e7          	jalr	1740(ra) # 802024f2 <wakeup>
    release(&tickslock);
    80205e2e:	8526                	mv	a0,s1
    80205e30:	ffffb097          	auipc	ra,0xffffb
    80205e34:	8ea080e7          	jalr	-1814(ra) # 8020071a <release>
    set_next_timeout();
    80205e38:	00000097          	auipc	ra,0x0
    80205e3c:	f9e080e7          	jalr	-98(ra) # 80205dd6 <set_next_timeout>
}
    80205e40:	60e2                	ld	ra,24(sp)
    80205e42:	6442                	ld	s0,16(sp)
    80205e44:	64a2                	ld	s1,8(sp)
    80205e46:	6105                	addi	sp,sp,32
    80205e48:	8082                	ret

0000000080205e4a <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    80205e4a:	1141                	addi	sp,sp,-16
    80205e4c:	e406                	sd	ra,8(sp)
    80205e4e:	e022                	sd	s0,0(sp)
    80205e50:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    80205e52:	00002097          	auipc	ra,0x2
    80205e56:	23e080e7          	jalr	574(ra) # 80208090 <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    80205e5a:	60a2                	ld	ra,8(sp)
    80205e5c:	6402                	ld	s0,0(sp)
    80205e5e:	0141                	addi	sp,sp,16
    80205e60:	8082                	ret

0000000080205e62 <disk_read>:

void disk_read(struct buf *b)
{
    80205e62:	1141                	addi	sp,sp,-16
    80205e64:	e406                	sd	ra,8(sp)
    80205e66:	e022                	sd	s0,0(sp)
    80205e68:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    80205e6a:	4581                	li	a1,0
    80205e6c:	00002097          	auipc	ra,0x2
    80205e70:	3aa080e7          	jalr	938(ra) # 80208216 <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    80205e74:	60a2                	ld	ra,8(sp)
    80205e76:	6402                	ld	s0,0(sp)
    80205e78:	0141                	addi	sp,sp,16
    80205e7a:	8082                	ret

0000000080205e7c <disk_write>:

void disk_write(struct buf *b)
{
    80205e7c:	1141                	addi	sp,sp,-16
    80205e7e:	e406                	sd	ra,8(sp)
    80205e80:	e022                	sd	s0,0(sp)
    80205e82:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    80205e84:	4585                	li	a1,1
    80205e86:	00002097          	auipc	ra,0x2
    80205e8a:	390080e7          	jalr	912(ra) # 80208216 <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    80205e8e:	60a2                	ld	ra,8(sp)
    80205e90:	6402                	ld	s0,0(sp)
    80205e92:	0141                	addi	sp,sp,16
    80205e94:	8082                	ret

0000000080205e96 <disk_intr>:

void disk_intr(void)
{
    80205e96:	1141                	addi	sp,sp,-16
    80205e98:	e406                	sd	ra,8(sp)
    80205e9a:	e022                	sd	s0,0(sp)
    80205e9c:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    80205e9e:	00002097          	auipc	ra,0x2
    80205ea2:	604080e7          	jalr	1540(ra) # 802084a2 <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    80205ea6:	60a2                	ld	ra,8(sp)
    80205ea8:	6402                	ld	s0,0(sp)
    80205eaa:	0141                	addi	sp,sp,16
    80205eac:	8082                	ret

0000000080205eae <skipelem>:
    eput(ep);
    return NULL;
}

static char *skipelem(char *path, char *name)
{
    80205eae:	1101                	addi	sp,sp,-32
    80205eb0:	ec06                	sd	ra,24(sp)
    80205eb2:	e822                	sd	s0,16(sp)
    80205eb4:	e426                	sd	s1,8(sp)
    80205eb6:	1000                	addi	s0,sp,32
    80205eb8:	87aa                	mv	a5,a0
    80205eba:	852e                	mv	a0,a1
    while (*path == '/') {
    80205ebc:	0007c703          	lbu	a4,0(a5)
    80205ec0:	02f00693          	li	a3,47
    80205ec4:	00d71763          	bne	a4,a3,80205ed2 <skipelem+0x24>
        path++;
    80205ec8:	0785                	addi	a5,a5,1
    while (*path == '/') {
    80205eca:	0007c703          	lbu	a4,0(a5)
    80205ece:	fed70de3          	beq	a4,a3,80205ec8 <skipelem+0x1a>
    }
    if (*path == 0) { return NULL; }
    80205ed2:	4481                	li	s1,0
    80205ed4:	cf31                	beqz	a4,80205f30 <skipelem+0x82>
    char *s = path;
    while (*path != '/' && *path != 0) {
    80205ed6:	0007c703          	lbu	a4,0(a5)
    80205eda:	84be                	mv	s1,a5
    80205edc:	02f00693          	li	a3,47
    80205ee0:	c711                	beqz	a4,80205eec <skipelem+0x3e>
        path++;
    80205ee2:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    80205ee4:	0004c703          	lbu	a4,0(s1)
    80205ee8:	fed71ce3          	bne	a4,a3,80205ee0 <skipelem+0x32>
    }
    int len = path - s;
    80205eec:	40f48733          	sub	a4,s1,a5
    80205ef0:	863a                	mv	a2,a4
    80205ef2:	2701                	sext.w	a4,a4
    80205ef4:	0ff00693          	li	a3,255
    80205ef8:	00e6d463          	bge	a3,a4,80205f00 <skipelem+0x52>
    80205efc:	0ff00613          	li	a2,255
    80205f00:	0006071b          	sext.w	a4,a2
    if (len > FAT32_MAX_FILENAME) {
        len = FAT32_MAX_FILENAME;
    }
    name[len] = 0;
    80205f04:	972a                	add	a4,a4,a0
    80205f06:	00070023          	sb	zero,0(a4)
    memmove(name, s, len);
    80205f0a:	2601                	sext.w	a2,a2
    80205f0c:	85be                	mv	a1,a5
    80205f0e:	ffffb097          	auipc	ra,0xffffb
    80205f12:	8b0080e7          	jalr	-1872(ra) # 802007be <memmove>
    while (*path == '/') {
    80205f16:	0004c703          	lbu	a4,0(s1)
    80205f1a:	02f00793          	li	a5,47
    80205f1e:	00f71963          	bne	a4,a5,80205f30 <skipelem+0x82>
    80205f22:	02f00713          	li	a4,47
        path++;
    80205f26:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80205f28:	0004c783          	lbu	a5,0(s1)
    80205f2c:	fee78de3          	beq	a5,a4,80205f26 <skipelem+0x78>
    }
    return path;
}
    80205f30:	8526                	mv	a0,s1
    80205f32:	60e2                	ld	ra,24(sp)
    80205f34:	6442                	ld	s0,16(sp)
    80205f36:	64a2                	ld	s1,8(sp)
    80205f38:	6105                	addi	sp,sp,32
    80205f3a:	8082                	ret

0000000080205f3c <read_fat>:
{
    80205f3c:	1101                	addi	sp,sp,-32
    80205f3e:	ec06                	sd	ra,24(sp)
    80205f40:	e822                	sd	s0,16(sp)
    80205f42:	e426                	sd	s1,8(sp)
    80205f44:	e04a                	sd	s2,0(sp)
    80205f46:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    80205f48:	100007b7          	lui	a5,0x10000
    80205f4c:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
        return cluster;
    80205f4e:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80205f50:	00a7ea63          	bltu	a5,a0,80205f64 <read_fat+0x28>
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205f54:	0001e797          	auipc	a5,0x1e
    80205f58:	eac7a783          	lw	a5,-340(a5) # 80223e00 <fat+0x8>
    80205f5c:	2785                	addiw	a5,a5,1
        return 0;
    80205f5e:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205f60:	00a7f963          	bgeu	a5,a0,80205f72 <read_fat+0x36>
}
    80205f64:	8526                	mv	a0,s1
    80205f66:	60e2                	ld	ra,24(sp)
    80205f68:	6442                	ld	s0,16(sp)
    80205f6a:	64a2                	ld	s1,8(sp)
    80205f6c:	6902                	ld	s2,0(sp)
    80205f6e:	6105                	addi	sp,sp,32
    80205f70:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205f72:	0025149b          	slliw	s1,a0,0x2
    80205f76:	0001e917          	auipc	s2,0x1e
    80205f7a:	e8290913          	addi	s2,s2,-382 # 80223df8 <fat>
    80205f7e:	01095783          	lhu	a5,16(s2)
    80205f82:	02f4d7bb          	divuw	a5,s1,a5
    80205f86:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    80205f8a:	9dbd                	addw	a1,a1,a5
    80205f8c:	4501                	li	a0,0
    80205f8e:	ffffe097          	auipc	ra,0xffffe
    80205f92:	b74080e7          	jalr	-1164(ra) # 80203b02 <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205f96:	01095783          	lhu	a5,16(s2)
    80205f9a:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    80205f9e:	1482                	slli	s1,s1,0x20
    80205fa0:	9081                	srli	s1,s1,0x20
    80205fa2:	009507b3          	add	a5,a0,s1
    80205fa6:	4fa4                	lw	s1,88(a5)
    brelse(b);
    80205fa8:	ffffe097          	auipc	ra,0xffffe
    80205fac:	c86080e7          	jalr	-890(ra) # 80203c2e <brelse>
    return next_clus;
    80205fb0:	bf55                	j	80205f64 <read_fat+0x28>

0000000080205fb2 <alloc_clus>:
{
    80205fb2:	711d                	addi	sp,sp,-96
    80205fb4:	ec86                	sd	ra,88(sp)
    80205fb6:	e8a2                	sd	s0,80(sp)
    80205fb8:	e4a6                	sd	s1,72(sp)
    80205fba:	e0ca                	sd	s2,64(sp)
    80205fbc:	fc4e                	sd	s3,56(sp)
    80205fbe:	f852                	sd	s4,48(sp)
    80205fc0:	f456                	sd	s5,40(sp)
    80205fc2:	f05a                	sd	s6,32(sp)
    80205fc4:	ec5e                	sd	s7,24(sp)
    80205fc6:	e862                	sd	s8,16(sp)
    80205fc8:	e466                	sd	s9,8(sp)
    80205fca:	1080                	addi	s0,sp,96
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    80205fcc:	0001e797          	auipc	a5,0x1e
    80205fd0:	e2c78793          	addi	a5,a5,-468 # 80223df8 <fat>
    80205fd4:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    80205fd8:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205fdc:	539c                	lw	a5,32(a5)
    80205fde:	10078363          	beqz	a5,802060e4 <alloc_clus+0x132>
    80205fe2:	0029591b          	srliw	s2,s2,0x2
    80205fe6:	0009099b          	sext.w	s3,s2
    80205fea:	4b01                	li	s6,0
        b = bread(dev, sec);
    80205fec:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205ff0:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205ff2:	0001ec97          	auipc	s9,0x1e
    80205ff6:	e06c8c93          	addi	s9,s9,-506 # 80223df8 <fat>
    80205ffa:	a0c9                	j	802060bc <alloc_clus+0x10a>
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    80205ffc:	100007b7          	lui	a5,0x10000
    80206000:	17fd                	addi	a5,a5,-1 # fffffff <_entry-0x70200001>
    80206002:	c29c                	sw	a5,0(a3)
                bwrite(b);
    80206004:	8552                	mv	a0,s4
    80206006:	ffffe097          	auipc	ra,0xffffe
    8020600a:	bec080e7          	jalr	-1044(ra) # 80203bf2 <bwrite>
                brelse(b);
    8020600e:	8552                	mv	a0,s4
    80206010:	ffffe097          	auipc	ra,0xffffe
    80206014:	c1e080e7          	jalr	-994(ra) # 80203c2e <brelse>
                uint32 clus = i * ent_per_sec + j;
    80206018:	0369093b          	mulw	s2,s2,s6
    8020601c:	0099093b          	addw	s2,s2,s1
    80206020:	00090a9b          	sext.w	s5,s2
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80206024:	0001e717          	auipc	a4,0x1e
    80206028:	dd470713          	addi	a4,a4,-556 # 80223df8 <fat>
    8020602c:	01274783          	lbu	a5,18(a4)
    80206030:	ffe9099b          	addiw	s3,s2,-2
    80206034:	02f989bb          	mulw	s3,s3,a5
    80206038:	4318                	lw	a4,0(a4)
    8020603a:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    8020603e:	c7b1                	beqz	a5,8020608a <alloc_clus+0xd8>
    80206040:	4901                	li	s2,0
    80206042:	0001ea17          	auipc	s4,0x1e
    80206046:	db6a0a13          	addi	s4,s4,-586 # 80223df8 <fat>
        b = bread(0, sec++);
    8020604a:	013905bb          	addw	a1,s2,s3
    8020604e:	4501                	li	a0,0
    80206050:	ffffe097          	auipc	ra,0xffffe
    80206054:	ab2080e7          	jalr	-1358(ra) # 80203b02 <bread>
    80206058:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    8020605a:	20000613          	li	a2,512
    8020605e:	4581                	li	a1,0
    80206060:	05850513          	addi	a0,a0,88
    80206064:	ffffa097          	auipc	ra,0xffffa
    80206068:	6fe080e7          	jalr	1790(ra) # 80200762 <memset>
        bwrite(b);
    8020606c:	8526                	mv	a0,s1
    8020606e:	ffffe097          	auipc	ra,0xffffe
    80206072:	b84080e7          	jalr	-1148(ra) # 80203bf2 <bwrite>
        brelse(b);
    80206076:	8526                	mv	a0,s1
    80206078:	ffffe097          	auipc	ra,0xffffe
    8020607c:	bb6080e7          	jalr	-1098(ra) # 80203c2e <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80206080:	2905                	addiw	s2,s2,1
    80206082:	012a4783          	lbu	a5,18(s4)
    80206086:	fcf942e3          	blt	s2,a5,8020604a <alloc_clus+0x98>
}
    8020608a:	8556                	mv	a0,s5
    8020608c:	60e6                	ld	ra,88(sp)
    8020608e:	6446                	ld	s0,80(sp)
    80206090:	64a6                	ld	s1,72(sp)
    80206092:	6906                	ld	s2,64(sp)
    80206094:	79e2                	ld	s3,56(sp)
    80206096:	7a42                	ld	s4,48(sp)
    80206098:	7aa2                	ld	s5,40(sp)
    8020609a:	7b02                	ld	s6,32(sp)
    8020609c:	6be2                	ld	s7,24(sp)
    8020609e:	6c42                	ld	s8,16(sp)
    802060a0:	6ca2                	ld	s9,8(sp)
    802060a2:	6125                	addi	sp,sp,96
    802060a4:	8082                	ret
        brelse(b);
    802060a6:	8552                	mv	a0,s4
    802060a8:	ffffe097          	auipc	ra,0xffffe
    802060ac:	b86080e7          	jalr	-1146(ra) # 80203c2e <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802060b0:	2b05                	addiw	s6,s6,1
    802060b2:	2b85                	addiw	s7,s7,1 # fffffffffffff001 <ebss_clear+0xffffffff7fdd2001>
    802060b4:	020ca783          	lw	a5,32(s9)
    802060b8:	02fb7663          	bgeu	s6,a5,802060e4 <alloc_clus+0x132>
        b = bread(dev, sec);
    802060bc:	85de                	mv	a1,s7
    802060be:	8556                	mv	a0,s5
    802060c0:	ffffe097          	auipc	ra,0xffffe
    802060c4:	a42080e7          	jalr	-1470(ra) # 80203b02 <bread>
    802060c8:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802060ca:	fc098ee3          	beqz	s3,802060a6 <alloc_clus+0xf4>
    802060ce:	05850793          	addi	a5,a0,88
    802060d2:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    802060d4:	86be                	mv	a3,a5
    802060d6:	4398                	lw	a4,0(a5)
    802060d8:	d315                	beqz	a4,80205ffc <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802060da:	2485                	addiw	s1,s1,1
    802060dc:	0791                	addi	a5,a5,4
    802060de:	fe999be3          	bne	s3,s1,802060d4 <alloc_clus+0x122>
    802060e2:	b7d1                	j	802060a6 <alloc_clus+0xf4>
    panic("no clusters");
    802060e4:	00005517          	auipc	a0,0x5
    802060e8:	dd450513          	addi	a0,a0,-556 # 8020aeb8 <digits+0xb38>
    802060ec:	ffffa097          	auipc	ra,0xffffa
    802060f0:	058080e7          	jalr	88(ra) # 80200144 <panic>

00000000802060f4 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    802060f4:	0001e797          	auipc	a5,0x1e
    802060f8:	d0c7a783          	lw	a5,-756(a5) # 80223e00 <fat+0x8>
    802060fc:	2785                	addiw	a5,a5,1
    802060fe:	06a7e963          	bltu	a5,a0,80206170 <write_fat+0x7c>
{
    80206102:	7179                	addi	sp,sp,-48
    80206104:	f406                	sd	ra,40(sp)
    80206106:	f022                	sd	s0,32(sp)
    80206108:	ec26                	sd	s1,24(sp)
    8020610a:	e84a                	sd	s2,16(sp)
    8020610c:	e44e                	sd	s3,8(sp)
    8020610e:	e052                	sd	s4,0(sp)
    80206110:	1800                	addi	s0,sp,48
    80206112:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80206114:	0025149b          	slliw	s1,a0,0x2
    80206118:	0001ea17          	auipc	s4,0x1e
    8020611c:	ce0a0a13          	addi	s4,s4,-800 # 80223df8 <fat>
    80206120:	010a5783          	lhu	a5,16(s4)
    80206124:	02f4d7bb          	divuw	a5,s1,a5
    80206128:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    8020612c:	9dbd                	addw	a1,a1,a5
    8020612e:	4501                	li	a0,0
    80206130:	ffffe097          	auipc	ra,0xffffe
    80206134:	9d2080e7          	jalr	-1582(ra) # 80203b02 <bread>
    80206138:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    8020613a:	010a5783          	lhu	a5,16(s4)
    8020613e:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80206142:	1482                	slli	s1,s1,0x20
    80206144:	9081                	srli	s1,s1,0x20
    80206146:	94aa                	add	s1,s1,a0
    80206148:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    8020614c:	ffffe097          	auipc	ra,0xffffe
    80206150:	aa6080e7          	jalr	-1370(ra) # 80203bf2 <bwrite>
    brelse(b);
    80206154:	854a                	mv	a0,s2
    80206156:	ffffe097          	auipc	ra,0xffffe
    8020615a:	ad8080e7          	jalr	-1320(ra) # 80203c2e <brelse>
    return 0;
    8020615e:	4501                	li	a0,0
}
    80206160:	70a2                	ld	ra,40(sp)
    80206162:	7402                	ld	s0,32(sp)
    80206164:	64e2                	ld	s1,24(sp)
    80206166:	6942                	ld	s2,16(sp)
    80206168:	69a2                	ld	s3,8(sp)
    8020616a:	6a02                	ld	s4,0(sp)
    8020616c:	6145                	addi	sp,sp,48
    8020616e:	8082                	ret
        return -1;
    80206170:	557d                	li	a0,-1
}
    80206172:	8082                	ret

0000000080206174 <reloc_clus>:
{
    80206174:	715d                	addi	sp,sp,-80
    80206176:	e486                	sd	ra,72(sp)
    80206178:	e0a2                	sd	s0,64(sp)
    8020617a:	fc26                	sd	s1,56(sp)
    8020617c:	f84a                	sd	s2,48(sp)
    8020617e:	f44e                	sd	s3,40(sp)
    80206180:	f052                	sd	s4,32(sp)
    80206182:	ec56                	sd	s5,24(sp)
    80206184:	e85a                	sd	s6,16(sp)
    80206186:	e45e                	sd	s7,8(sp)
    80206188:	0880                	addi	s0,sp,80
    8020618a:	84aa                	mv	s1,a0
    8020618c:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    8020618e:	0001eb97          	auipc	s7,0x1e
    80206192:	c76bab83          	lw	s7,-906(s7) # 80223e04 <fat+0xc>
    80206196:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    8020619a:	11052703          	lw	a4,272(a0)
    8020619e:	07377563          	bgeu	a4,s3,80206208 <reloc_clus+0x94>
    802061a2:	8b32                	mv	s6,a2
        if (clus >= FAT32_EOC) {
    802061a4:	10000ab7          	lui	s5,0x10000
    802061a8:	1add                	addi	s5,s5,-9 # ffffff7 <_entry-0x70200009>
    802061aa:	a81d                	j	802061e0 <reloc_clus+0x6c>
                clus = alloc_clus(entry->dev);
    802061ac:	1144c503          	lbu	a0,276(s1)
    802061b0:	00000097          	auipc	ra,0x0
    802061b4:	e02080e7          	jalr	-510(ra) # 80205fb2 <alloc_clus>
    802061b8:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    802061bc:	85ca                	mv	a1,s2
    802061be:	10c4a503          	lw	a0,268(s1)
    802061c2:	00000097          	auipc	ra,0x0
    802061c6:	f32080e7          	jalr	-206(ra) # 802060f4 <write_fat>
        entry->cur_clus = clus;
    802061ca:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    802061ce:	1104a783          	lw	a5,272(s1)
    802061d2:	2785                	addiw	a5,a5,1
    802061d4:	0007871b          	sext.w	a4,a5
    802061d8:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    802061dc:	03377663          	bgeu	a4,s3,80206208 <reloc_clus+0x94>
        int clus = read_fat(entry->cur_clus);
    802061e0:	10c4a503          	lw	a0,268(s1)
    802061e4:	00000097          	auipc	ra,0x0
    802061e8:	d58080e7          	jalr	-680(ra) # 80205f3c <read_fat>
    802061ec:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    802061f0:	fd2adde3          	bge	s5,s2,802061ca <reloc_clus+0x56>
            if (alloc) {
    802061f4:	fa0b1ce3          	bnez	s6,802061ac <reloc_clus+0x38>
                entry->cur_clus = entry->first_clus;
    802061f8:	1044a783          	lw	a5,260(s1)
    802061fc:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    80206200:	1004a823          	sw	zero,272(s1)
                return -1;
    80206204:	557d                	li	a0,-1
    80206206:	a881                	j	80206256 <reloc_clus+0xe2>
    if (clus_num < entry->clus_cnt) {
    80206208:	04e9f163          	bgeu	s3,a4,8020624a <reloc_clus+0xd6>
        entry->cur_clus = entry->first_clus;
    8020620c:	1044a783          	lw	a5,260(s1)
    80206210:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    80206214:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    80206218:	037a6963          	bltu	s4,s7,8020624a <reloc_clus+0xd6>
            if (entry->cur_clus >= FAT32_EOC) {
    8020621c:	10000937          	lui	s2,0x10000
    80206220:	195d                	addi	s2,s2,-9 # ffffff7 <_entry-0x70200009>
            entry->cur_clus = read_fat(entry->cur_clus);
    80206222:	10c4a503          	lw	a0,268(s1)
    80206226:	00000097          	auipc	ra,0x0
    8020622a:	d16080e7          	jalr	-746(ra) # 80205f3c <read_fat>
    8020622e:	2501                	sext.w	a0,a0
    80206230:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    80206234:	02a96c63          	bltu	s2,a0,8020626c <reloc_clus+0xf8>
            entry->clus_cnt++;
    80206238:	1104a783          	lw	a5,272(s1)
    8020623c:	2785                	addiw	a5,a5,1
    8020623e:	0007871b          	sext.w	a4,a5
    80206242:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80206246:	fd376ee3          	bltu	a4,s3,80206222 <reloc_clus+0xae>
    return off % fat.byts_per_clus;
    8020624a:	0001e797          	auipc	a5,0x1e
    8020624e:	bba7a783          	lw	a5,-1094(a5) # 80223e04 <fat+0xc>
    80206252:	02fa753b          	remuw	a0,s4,a5
}
    80206256:	60a6                	ld	ra,72(sp)
    80206258:	6406                	ld	s0,64(sp)
    8020625a:	74e2                	ld	s1,56(sp)
    8020625c:	7942                	ld	s2,48(sp)
    8020625e:	79a2                	ld	s3,40(sp)
    80206260:	7a02                	ld	s4,32(sp)
    80206262:	6ae2                	ld	s5,24(sp)
    80206264:	6b42                	ld	s6,16(sp)
    80206266:	6ba2                	ld	s7,8(sp)
    80206268:	6161                	addi	sp,sp,80
    8020626a:	8082                	ret
                panic("reloc_clus");
    8020626c:	00005517          	auipc	a0,0x5
    80206270:	c5c50513          	addi	a0,a0,-932 # 8020aec8 <digits+0xb48>
    80206274:	ffffa097          	auipc	ra,0xffffa
    80206278:	ed0080e7          	jalr	-304(ra) # 80200144 <panic>

000000008020627c <rw_clus>:
{
    8020627c:	7119                	addi	sp,sp,-128
    8020627e:	fc86                	sd	ra,120(sp)
    80206280:	f8a2                	sd	s0,112(sp)
    80206282:	f4a6                	sd	s1,104(sp)
    80206284:	f0ca                	sd	s2,96(sp)
    80206286:	ecce                	sd	s3,88(sp)
    80206288:	e8d2                	sd	s4,80(sp)
    8020628a:	e4d6                	sd	s5,72(sp)
    8020628c:	e0da                	sd	s6,64(sp)
    8020628e:	fc5e                	sd	s7,56(sp)
    80206290:	f862                	sd	s8,48(sp)
    80206292:	f466                	sd	s9,40(sp)
    80206294:	f06a                	sd	s10,32(sp)
    80206296:	ec6e                	sd	s11,24(sp)
    80206298:	0100                	addi	s0,sp,128
    8020629a:	f8c43423          	sd	a2,-120(s0)
    8020629e:	8b36                	mv	s6,a3
    802062a0:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    802062a2:	00f706bb          	addw	a3,a4,a5
    802062a6:	0001e797          	auipc	a5,0x1e
    802062aa:	b5e7a783          	lw	a5,-1186(a5) # 80223e04 <fat+0xc>
    802062ae:	02d7ef63          	bltu	a5,a3,802062ec <rw_clus+0x70>
    802062b2:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    802062b4:	0001e797          	auipc	a5,0x1e
    802062b8:	b4478793          	addi	a5,a5,-1212 # 80223df8 <fat>
    802062bc:	0107d683          	lhu	a3,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    802062c0:	ffe5099b          	addiw	s3,a0,-2
    802062c4:	0127c603          	lbu	a2,18(a5)
    802062c8:	02c989bb          	mulw	s3,s3,a2
    802062cc:	439c                	lw	a5,0(a5)
    802062ce:	00f989bb          	addw	s3,s3,a5
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    802062d2:	02d757bb          	divuw	a5,a4,a3
    802062d6:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    802062da:	02d77abb          	remuw	s5,a4,a3
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802062de:	0e0c0363          	beqz	s8,802063c4 <rw_clus+0x148>
    802062e2:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    802062e4:	20000d93          	li	s11,512
        if (bad == -1) {
    802062e8:	5d7d                	li	s10,-1
    802062ea:	a095                	j	8020634e <rw_clus+0xd2>
        panic("offset out of range");
    802062ec:	00005517          	auipc	a0,0x5
    802062f0:	bec50513          	addi	a0,a0,-1044 # 8020aed8 <digits+0xb58>
    802062f4:	ffffa097          	auipc	ra,0xffffa
    802062f8:	e50080e7          	jalr	-432(ra) # 80200144 <panic>
                bwrite(bp);
    802062fc:	854a                	mv	a0,s2
    802062fe:	ffffe097          	auipc	ra,0xffffe
    80206302:	8f4080e7          	jalr	-1804(ra) # 80203bf2 <bwrite>
        brelse(bp);
    80206306:	854a                	mv	a0,s2
    80206308:	ffffe097          	auipc	ra,0xffffe
    8020630c:	926080e7          	jalr	-1754(ra) # 80203c2e <brelse>
        if (bad == -1) {
    80206310:	a02d                	j	8020633a <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    80206312:	05890613          	addi	a2,s2,88
    80206316:	1682                	slli	a3,a3,0x20
    80206318:	9281                	srli	a3,a3,0x20
    8020631a:	963a                	add	a2,a2,a4
    8020631c:	85da                	mv	a1,s6
    8020631e:	f8843503          	ld	a0,-120(s0)
    80206322:	ffffc097          	auipc	ra,0xffffc
    80206326:	2aa080e7          	jalr	682(ra) # 802025cc <either_copyout>
    8020632a:	8baa                	mv	s7,a0
        brelse(bp);
    8020632c:	854a                	mv	a0,s2
    8020632e:	ffffe097          	auipc	ra,0xffffe
    80206332:	900080e7          	jalr	-1792(ra) # 80203c2e <brelse>
        if (bad == -1) {
    80206336:	07ab8763          	beq	s7,s10,802063a4 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    8020633a:	01448a3b          	addw	s4,s1,s4
    8020633e:	01548abb          	addw	s5,s1,s5
    80206342:	1482                	slli	s1,s1,0x20
    80206344:	9081                	srli	s1,s1,0x20
    80206346:	9b26                	add	s6,s6,s1
    80206348:	2985                	addiw	s3,s3,1
    8020634a:	058a7d63          	bgeu	s4,s8,802063a4 <rw_clus+0x128>
        bp = bread(0, sec);
    8020634e:	85ce                	mv	a1,s3
    80206350:	4501                	li	a0,0
    80206352:	ffffd097          	auipc	ra,0xffffd
    80206356:	7b0080e7          	jalr	1968(ra) # 80203b02 <bread>
    8020635a:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    8020635c:	1ffaf713          	andi	a4,s5,511
        if (n - tot < m) {
    80206360:	414c07bb          	subw	a5,s8,s4
        m = BSIZE - off % BSIZE;
    80206364:	40ed863b          	subw	a2,s11,a4
    80206368:	86be                	mv	a3,a5
    8020636a:	2781                	sext.w	a5,a5
    8020636c:	0006059b          	sext.w	a1,a2
    80206370:	00f5f363          	bgeu	a1,a5,80206376 <rw_clus+0xfa>
    80206374:	86b2                	mv	a3,a2
    80206376:	0006849b          	sext.w	s1,a3
        if (write) {
    8020637a:	f80c8ce3          	beqz	s9,80206312 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    8020637e:	05890513          	addi	a0,s2,88
    80206382:	1682                	slli	a3,a3,0x20
    80206384:	9281                	srli	a3,a3,0x20
    80206386:	865a                	mv	a2,s6
    80206388:	f8843583          	ld	a1,-120(s0)
    8020638c:	953a                	add	a0,a0,a4
    8020638e:	ffffc097          	auipc	ra,0xffffc
    80206392:	274080e7          	jalr	628(ra) # 80202602 <either_copyin>
    80206396:	f7a513e3          	bne	a0,s10,802062fc <rw_clus+0x80>
        brelse(bp);
    8020639a:	854a                	mv	a0,s2
    8020639c:	ffffe097          	auipc	ra,0xffffe
    802063a0:	892080e7          	jalr	-1902(ra) # 80203c2e <brelse>
}
    802063a4:	8552                	mv	a0,s4
    802063a6:	70e6                	ld	ra,120(sp)
    802063a8:	7446                	ld	s0,112(sp)
    802063aa:	74a6                	ld	s1,104(sp)
    802063ac:	7906                	ld	s2,96(sp)
    802063ae:	69e6                	ld	s3,88(sp)
    802063b0:	6a46                	ld	s4,80(sp)
    802063b2:	6aa6                	ld	s5,72(sp)
    802063b4:	6b06                	ld	s6,64(sp)
    802063b6:	7be2                	ld	s7,56(sp)
    802063b8:	7c42                	ld	s8,48(sp)
    802063ba:	7ca2                	ld	s9,40(sp)
    802063bc:	7d02                	ld	s10,32(sp)
    802063be:	6de2                	ld	s11,24(sp)
    802063c0:	6109                	addi	sp,sp,128
    802063c2:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802063c4:	8a62                	mv	s4,s8
    802063c6:	bff9                	j	802063a4 <rw_clus+0x128>

00000000802063c8 <eget>:
{
    802063c8:	7139                	addi	sp,sp,-64
    802063ca:	fc06                	sd	ra,56(sp)
    802063cc:	f822                	sd	s0,48(sp)
    802063ce:	f426                	sd	s1,40(sp)
    802063d0:	f04a                	sd	s2,32(sp)
    802063d2:	ec4e                	sd	s3,24(sp)
    802063d4:	e852                	sd	s4,16(sp)
    802063d6:	e456                	sd	s5,8(sp)
    802063d8:	0080                	addi	s0,sp,64
    802063da:	8a2a                	mv	s4,a0
    802063dc:	8aae                	mv	s5,a1
    acquire(&ecache.lock);
    802063de:	0001e517          	auipc	a0,0x1e
    802063e2:	bb250513          	addi	a0,a0,-1102 # 80223f90 <ecache>
    802063e6:	ffffa097          	auipc	ra,0xffffa
    802063ea:	2e0080e7          	jalr	736(ra) # 802006c6 <acquire>
    if (name) {
    802063ee:	060a8b63          	beqz	s5,80206464 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802063f2:	0001e497          	auipc	s1,0x1e
    802063f6:	b564b483          	ld	s1,-1194(s1) # 80223f48 <root+0x128>
    802063fa:	0001e797          	auipc	a5,0x1e
    802063fe:	a2678793          	addi	a5,a5,-1498 # 80223e20 <root>
    80206402:	06f48163          	beq	s1,a5,80206464 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80206406:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80206408:	89be                	mv	s3,a5
    8020640a:	a029                	j	80206414 <eget+0x4c>
    8020640c:	1284b483          	ld	s1,296(s1)
    80206410:	05348a63          	beq	s1,s3,80206464 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80206414:	11649783          	lh	a5,278(s1)
    80206418:	ff279ae3          	bne	a5,s2,8020640c <eget+0x44>
    8020641c:	1204b783          	ld	a5,288(s1)
    80206420:	ff4796e3          	bne	a5,s4,8020640c <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    80206424:	0ff00613          	li	a2,255
    80206428:	85d6                	mv	a1,s5
    8020642a:	8526                	mv	a0,s1
    8020642c:	ffffa097          	auipc	ra,0xffffa
    80206430:	40e080e7          	jalr	1038(ra) # 8020083a <strncmp>
    80206434:	fd61                	bnez	a0,8020640c <eget+0x44>
                if (ep->ref++ == 0) {
    80206436:	1184a783          	lw	a5,280(s1)
    8020643a:	0017871b          	addiw	a4,a5,1
    8020643e:	10e4ac23          	sw	a4,280(s1)
    80206442:	eb81                	bnez	a5,80206452 <eget+0x8a>
                    ep->parent->ref++;
    80206444:	1204b703          	ld	a4,288(s1)
    80206448:	11872783          	lw	a5,280(a4)
    8020644c:	2785                	addiw	a5,a5,1
    8020644e:	10f72c23          	sw	a5,280(a4)
                release(&ecache.lock);
    80206452:	0001e517          	auipc	a0,0x1e
    80206456:	b3e50513          	addi	a0,a0,-1218 # 80223f90 <ecache>
    8020645a:	ffffa097          	auipc	ra,0xffffa
    8020645e:	2c0080e7          	jalr	704(ra) # 8020071a <release>
                return ep;
    80206462:	a085                	j	802064c2 <eget+0xfa>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206464:	0001e497          	auipc	s1,0x1e
    80206468:	aec4b483          	ld	s1,-1300(s1) # 80223f50 <root+0x130>
    8020646c:	0001e797          	auipc	a5,0x1e
    80206470:	9b478793          	addi	a5,a5,-1612 # 80223e20 <root>
    80206474:	00f48a63          	beq	s1,a5,80206488 <eget+0xc0>
    80206478:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    8020647a:	1184a783          	lw	a5,280(s1)
    8020647e:	cf89                	beqz	a5,80206498 <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206480:	1304b483          	ld	s1,304(s1)
    80206484:	fee49be3          	bne	s1,a4,8020647a <eget+0xb2>
    panic("eget: insufficient ecache");
    80206488:	00005517          	auipc	a0,0x5
    8020648c:	a6850513          	addi	a0,a0,-1432 # 8020aef0 <digits+0xb70>
    80206490:	ffffa097          	auipc	ra,0xffffa
    80206494:	cb4080e7          	jalr	-844(ra) # 80200144 <panic>
            ep->ref = 1;
    80206498:	4785                	li	a5,1
    8020649a:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    8020649e:	114a4783          	lbu	a5,276(s4)
    802064a2:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    802064a6:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    802064aa:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    802064ae:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    802064b2:	0001e517          	auipc	a0,0x1e
    802064b6:	ade50513          	addi	a0,a0,-1314 # 80223f90 <ecache>
    802064ba:	ffffa097          	auipc	ra,0xffffa
    802064be:	260080e7          	jalr	608(ra) # 8020071a <release>
}
    802064c2:	8526                	mv	a0,s1
    802064c4:	70e2                	ld	ra,56(sp)
    802064c6:	7442                	ld	s0,48(sp)
    802064c8:	74a2                	ld	s1,40(sp)
    802064ca:	7902                	ld	s2,32(sp)
    802064cc:	69e2                	ld	s3,24(sp)
    802064ce:	6a42                	ld	s4,16(sp)
    802064d0:	6aa2                	ld	s5,8(sp)
    802064d2:	6121                	addi	sp,sp,64
    802064d4:	8082                	ret

00000000802064d6 <read_entry_name>:
{
    802064d6:	7139                	addi	sp,sp,-64
    802064d8:	fc06                	sd	ra,56(sp)
    802064da:	f822                	sd	s0,48(sp)
    802064dc:	f426                	sd	s1,40(sp)
    802064de:	f04a                	sd	s2,32(sp)
    802064e0:	ec4e                	sd	s3,24(sp)
    802064e2:	0080                	addi	s0,sp,64
    802064e4:	84aa                	mv	s1,a0
    802064e6:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    802064e8:	00b5c703          	lbu	a4,11(a1)
    802064ec:	47bd                	li	a5,15
    802064ee:	08f70563          	beq	a4,a5,80206578 <read_entry_name+0xa2>
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    802064f2:	4635                	li	a2,13
    802064f4:	4581                	li	a1,0
    802064f6:	ffffa097          	auipc	ra,0xffffa
    802064fa:	26c080e7          	jalr	620(ra) # 80200762 <memset>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802064fe:	00094703          	lbu	a4,0(s2)
    80206502:	02000793          	li	a5,32
    80206506:	0af70c63          	beq	a4,a5,802065be <read_entry_name+0xe8>
    8020650a:	4785                	li	a5,1
    8020650c:	02000613          	li	a2,32
    80206510:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80206512:	00f486b3          	add	a3,s1,a5
    80206516:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020651a:	0007869b          	sext.w	a3,a5
    8020651e:	00f90733          	add	a4,s2,a5
    80206522:	00074703          	lbu	a4,0(a4)
    80206526:	00c70563          	beq	a4,a2,80206530 <read_entry_name+0x5a>
    8020652a:	0785                	addi	a5,a5,1
    8020652c:	feb793e3          	bne	a5,a1,80206512 <read_entry_name+0x3c>
        if (d->sne.name[8] != ' ') {
    80206530:	00894703          	lbu	a4,8(s2)
    80206534:	02000793          	li	a5,32
    80206538:	00f70963          	beq	a4,a5,8020654a <read_entry_name+0x74>
            buffer[i++] = '.';
    8020653c:	00d487b3          	add	a5,s1,a3
    80206540:	02e00713          	li	a4,46
    80206544:	00e78023          	sb	a4,0(a5)
    80206548:	2685                	addiw	a3,a3,1
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    8020654a:	00890793          	addi	a5,s2,8
    8020654e:	94b6                	add	s1,s1,a3
    80206550:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    80206552:	02000693          	li	a3,32
    80206556:	0007c703          	lbu	a4,0(a5)
    8020655a:	00d70863          	beq	a4,a3,8020656a <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    8020655e:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80206562:	0785                	addi	a5,a5,1
    80206564:	0485                	addi	s1,s1,1
    80206566:	ff2798e3          	bne	a5,s2,80206556 <read_entry_name+0x80>
}
    8020656a:	70e2                	ld	ra,56(sp)
    8020656c:	7442                	ld	s0,48(sp)
    8020656e:	74a2                	ld	s1,40(sp)
    80206570:	7902                	ld	s2,32(sp)
    80206572:	69e2                	ld	s3,24(sp)
    80206574:	6121                	addi	sp,sp,64
    80206576:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    80206578:	4629                	li	a2,10
    8020657a:	0585                	addi	a1,a1,1
    8020657c:	fc040993          	addi	s3,s0,-64
    80206580:	854e                	mv	a0,s3
    80206582:	ffffa097          	auipc	ra,0xffffa
    80206586:	23c080e7          	jalr	572(ra) # 802007be <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    8020658a:	4615                	li	a2,5
    8020658c:	85ce                	mv	a1,s3
    8020658e:	8526                	mv	a0,s1
    80206590:	ffffa097          	auipc	ra,0xffffa
    80206594:	3b2080e7          	jalr	946(ra) # 80200942 <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    80206598:	4619                	li	a2,6
    8020659a:	00e90593          	addi	a1,s2,14
    8020659e:	00548513          	addi	a0,s1,5
    802065a2:	ffffa097          	auipc	ra,0xffffa
    802065a6:	3a0080e7          	jalr	928(ra) # 80200942 <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    802065aa:	4609                	li	a2,2
    802065ac:	01c90593          	addi	a1,s2,28
    802065b0:	00b48513          	addi	a0,s1,11
    802065b4:	ffffa097          	auipc	ra,0xffffa
    802065b8:	38e080e7          	jalr	910(ra) # 80200942 <snstr>
    802065bc:	b77d                	j	8020656a <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802065be:	4681                	li	a3,0
    802065c0:	bf85                	j	80206530 <read_entry_name+0x5a>

00000000802065c2 <fat32_init>:
{
    802065c2:	7139                	addi	sp,sp,-64
    802065c4:	fc06                	sd	ra,56(sp)
    802065c6:	f822                	sd	s0,48(sp)
    802065c8:	f426                	sd	s1,40(sp)
    802065ca:	f04a                	sd	s2,32(sp)
    802065cc:	ec4e                	sd	s3,24(sp)
    802065ce:	e852                	sd	s4,16(sp)
    802065d0:	e456                	sd	s5,8(sp)
    802065d2:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    802065d4:	4581                	li	a1,0
    802065d6:	4501                	li	a0,0
    802065d8:	ffffd097          	auipc	ra,0xffffd
    802065dc:	52a080e7          	jalr	1322(ra) # 80203b02 <bread>
    802065e0:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    802065e2:	4615                	li	a2,5
    802065e4:	00005597          	auipc	a1,0x5
    802065e8:	92c58593          	addi	a1,a1,-1748 # 8020af10 <digits+0xb90>
    802065ec:	0aa50513          	addi	a0,a0,170
    802065f0:	ffffa097          	auipc	ra,0xffffa
    802065f4:	24a080e7          	jalr	586(ra) # 8020083a <strncmp>
    802065f8:	16051863          	bnez	a0,80206768 <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    802065fc:	0001d497          	auipc	s1,0x1d
    80206600:	7fc48493          	addi	s1,s1,2044 # 80223df8 <fat>
    80206604:	4609                	li	a2,2
    80206606:	06390593          	addi	a1,s2,99
    8020660a:	0001d517          	auipc	a0,0x1d
    8020660e:	7fe50513          	addi	a0,a0,2046 # 80223e08 <fat+0x10>
    80206612:	ffffa097          	auipc	ra,0xffffa
    80206616:	1ac080e7          	jalr	428(ra) # 802007be <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    8020661a:	06594683          	lbu	a3,101(s2)
    8020661e:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80206622:	06695603          	lhu	a2,102(s2)
    80206626:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    8020662a:	06894703          	lbu	a4,104(s2)
    8020662e:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80206632:	07492783          	lw	a5,116(s2)
    80206636:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    80206638:	07892783          	lw	a5,120(s2)
    8020663c:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    8020663e:	07c92583          	lw	a1,124(s2)
    80206642:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80206644:	08492503          	lw	a0,132(s2)
    80206648:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    8020664a:	02b7073b          	mulw	a4,a4,a1
    8020664e:	9f31                	addw	a4,a4,a2
    80206650:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80206652:	9f99                	subw	a5,a5,a4
    80206654:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80206656:	02d7d7bb          	divuw	a5,a5,a3
    8020665a:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    8020665c:	0104d783          	lhu	a5,16(s1)
    80206660:	02d787bb          	mulw	a5,a5,a3
    80206664:	c4dc                	sw	a5,12(s1)
    brelse(b);
    80206666:	854a                	mv	a0,s2
    80206668:	ffffd097          	auipc	ra,0xffffd
    8020666c:	5c6080e7          	jalr	1478(ra) # 80203c2e <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    80206670:	0104d703          	lhu	a4,16(s1)
    80206674:	20000793          	li	a5,512
    80206678:	10f71063          	bne	a4,a5,80206778 <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    8020667c:	00005597          	auipc	a1,0x5
    80206680:	8cc58593          	addi	a1,a1,-1844 # 8020af48 <digits+0xbc8>
    80206684:	0001e517          	auipc	a0,0x1e
    80206688:	90c50513          	addi	a0,a0,-1780 # 80223f90 <ecache>
    8020668c:	ffffa097          	auipc	ra,0xffffa
    80206690:	ff6080e7          	jalr	-10(ra) # 80200682 <initlock>
    memset(&root, 0, sizeof(root));
    80206694:	0001d497          	auipc	s1,0x1d
    80206698:	76448493          	addi	s1,s1,1892 # 80223df8 <fat>
    8020669c:	0001d917          	auipc	s2,0x1d
    802066a0:	78490913          	addi	s2,s2,1924 # 80223e20 <root>
    802066a4:	17000613          	li	a2,368
    802066a8:	4581                	li	a1,0
    802066aa:	854a                	mv	a0,s2
    802066ac:	ffffa097          	auipc	ra,0xffffa
    802066b0:	0b6080e7          	jalr	182(ra) # 80200762 <memset>
    initsleeplock(&root.lock, "entry");
    802066b4:	00005597          	auipc	a1,0x5
    802066b8:	89c58593          	addi	a1,a1,-1892 # 8020af50 <digits+0xbd0>
    802066bc:	0001e517          	auipc	a0,0x1e
    802066c0:	89c50513          	addi	a0,a0,-1892 # 80223f58 <root+0x138>
    802066c4:	ffffd097          	auipc	ra,0xffffd
    802066c8:	680080e7          	jalr	1664(ra) # 80203d44 <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    802066cc:	47d1                	li	a5,20
    802066ce:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    802066d2:	50dc                	lw	a5,36(s1)
    802066d4:	12f4aa23          	sw	a5,308(s1)
    802066d8:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    802066dc:	4785                	li	a5,1
    802066de:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    802066e2:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    802066e6:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802066ea:	0001e497          	auipc	s1,0x1e
    802066ee:	8be48493          	addi	s1,s1,-1858 # 80223fa8 <ecache+0x18>
        de->next = root.next;
    802066f2:	0001d917          	auipc	s2,0x1d
    802066f6:	70690913          	addi	s2,s2,1798 # 80223df8 <fat>
        de->prev = &root;
    802066fa:	0001da97          	auipc	s5,0x1d
    802066fe:	726a8a93          	addi	s5,s5,1830 # 80223e20 <root>
        initsleeplock(&de->lock, "entry");
    80206702:	00005a17          	auipc	s4,0x5
    80206706:	84ea0a13          	addi	s4,s4,-1970 # 8020af50 <digits+0xbd0>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020670a:	00022997          	auipc	s3,0x22
    8020670e:	07e98993          	addi	s3,s3,126 # 80228788 <idx>
        de->dev = 0;
    80206712:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80206716:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    8020671a:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    8020671e:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    80206722:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80206726:	15093783          	ld	a5,336(s2)
    8020672a:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    8020672e:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    80206732:	85d2                	mv	a1,s4
    80206734:	13848513          	addi	a0,s1,312
    80206738:	ffffd097          	auipc	ra,0xffffd
    8020673c:	60c080e7          	jalr	1548(ra) # 80203d44 <initsleeplock>
        root.next->prev = de;
    80206740:	15093783          	ld	a5,336(s2)
    80206744:	1297b823          	sd	s1,304(a5)
        root.next = de;
    80206748:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020674c:	17048493          	addi	s1,s1,368
    80206750:	fd3491e3          	bne	s1,s3,80206712 <fat32_init+0x150>
}
    80206754:	4501                	li	a0,0
    80206756:	70e2                	ld	ra,56(sp)
    80206758:	7442                	ld	s0,48(sp)
    8020675a:	74a2                	ld	s1,40(sp)
    8020675c:	7902                	ld	s2,32(sp)
    8020675e:	69e2                	ld	s3,24(sp)
    80206760:	6a42                	ld	s4,16(sp)
    80206762:	6aa2                	ld	s5,8(sp)
    80206764:	6121                	addi	sp,sp,64
    80206766:	8082                	ret
        panic("not FAT32 volume");
    80206768:	00004517          	auipc	a0,0x4
    8020676c:	7b050513          	addi	a0,a0,1968 # 8020af18 <digits+0xb98>
    80206770:	ffffa097          	auipc	ra,0xffffa
    80206774:	9d4080e7          	jalr	-1580(ra) # 80200144 <panic>
        panic("byts_per_sec != BSIZE");
    80206778:	00004517          	auipc	a0,0x4
    8020677c:	7b850513          	addi	a0,a0,1976 # 8020af30 <digits+0xbb0>
    80206780:	ffffa097          	auipc	ra,0xffffa
    80206784:	9c4080e7          	jalr	-1596(ra) # 80200144 <panic>

0000000080206788 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206788:	10852783          	lw	a5,264(a0)
    8020678c:	0ed7e863          	bltu	a5,a3,8020687c <eread+0xf4>
{
    80206790:	711d                	addi	sp,sp,-96
    80206792:	ec86                	sd	ra,88(sp)
    80206794:	e8a2                	sd	s0,80(sp)
    80206796:	e4a6                	sd	s1,72(sp)
    80206798:	e0ca                	sd	s2,64(sp)
    8020679a:	fc4e                	sd	s3,56(sp)
    8020679c:	f852                	sd	s4,48(sp)
    8020679e:	f456                	sd	s5,40(sp)
    802067a0:	f05a                	sd	s6,32(sp)
    802067a2:	ec5e                	sd	s7,24(sp)
    802067a4:	e862                	sd	s8,16(sp)
    802067a6:	e466                	sd	s9,8(sp)
    802067a8:	e06a                	sd	s10,0(sp)
    802067aa:	1080                	addi	s0,sp,96
    802067ac:	8a2a                	mv	s4,a0
    802067ae:	8bae                	mv	s7,a1
    802067b0:	8ab2                	mv	s5,a2
    802067b2:	8936                	mv	s2,a3
    802067b4:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802067b6:	9eb9                	addw	a3,a3,a4
        return 0;
    802067b8:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802067ba:	0b26e163          	bltu	a3,s2,8020685c <eread+0xd4>
    802067be:	100a4703          	lbu	a4,256(s4)
    802067c2:	8b41                	andi	a4,a4,16
    802067c4:	ef41                	bnez	a4,8020685c <eread+0xd4>
    if (off + n > entry->file_size) {
    802067c6:	00d7f463          	bgeu	a5,a3,802067ce <eread+0x46>
        n = entry->file_size - off;
    802067ca:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802067ce:	10ca2703          	lw	a4,268(s4)
    802067d2:	100007b7          	lui	a5,0x10000
    802067d6:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
    802067d8:	06e7ef63          	bltu	a5,a4,80206856 <eread+0xce>
    802067dc:	080b0e63          	beqz	s6,80206878 <eread+0xf0>
    802067e0:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802067e2:	0001dc97          	auipc	s9,0x1d
    802067e6:	616c8c93          	addi	s9,s9,1558 # 80223df8 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802067ea:	8c3e                	mv	s8,a5
    802067ec:	a82d                	j	80206826 <eread+0x9e>
    802067ee:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    802067f2:	87ea                	mv	a5,s10
    802067f4:	86d6                	mv	a3,s5
    802067f6:	865e                	mv	a2,s7
    802067f8:	4581                	li	a1,0
    802067fa:	10ca2503          	lw	a0,268(s4)
    802067fe:	00000097          	auipc	ra,0x0
    80206802:	a7e080e7          	jalr	-1410(ra) # 8020627c <rw_clus>
    80206806:	2501                	sext.w	a0,a0
    80206808:	04ad1863          	bne	s10,a0,80206858 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020680c:	013489bb          	addw	s3,s1,s3
    80206810:	0124893b          	addw	s2,s1,s2
    80206814:	1482                	slli	s1,s1,0x20
    80206816:	9081                	srli	s1,s1,0x20
    80206818:	9aa6                	add	s5,s5,s1
    8020681a:	10ca2783          	lw	a5,268(s4)
    8020681e:	02fc6d63          	bltu	s8,a5,80206858 <eread+0xd0>
    80206822:	0369fb63          	bgeu	s3,s6,80206858 <eread+0xd0>
        reloc_clus(entry, off, 0);
    80206826:	4601                	li	a2,0
    80206828:	85ca                	mv	a1,s2
    8020682a:	8552                	mv	a0,s4
    8020682c:	00000097          	auipc	ra,0x0
    80206830:	948080e7          	jalr	-1720(ra) # 80206174 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206834:	00cca683          	lw	a3,12(s9)
    80206838:	02d9763b          	remuw	a2,s2,a3
    8020683c:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    80206840:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206844:	9e91                	subw	a3,a3,a2
    80206846:	84be                	mv	s1,a5
    80206848:	2781                	sext.w	a5,a5
    8020684a:	0006861b          	sext.w	a2,a3
    8020684e:	faf670e3          	bgeu	a2,a5,802067ee <eread+0x66>
    80206852:	84b6                	mv	s1,a3
    80206854:	bf69                	j	802067ee <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206856:	4981                	li	s3,0
    return tot;
    80206858:	0009851b          	sext.w	a0,s3
}
    8020685c:	60e6                	ld	ra,88(sp)
    8020685e:	6446                	ld	s0,80(sp)
    80206860:	64a6                	ld	s1,72(sp)
    80206862:	6906                	ld	s2,64(sp)
    80206864:	79e2                	ld	s3,56(sp)
    80206866:	7a42                	ld	s4,48(sp)
    80206868:	7aa2                	ld	s5,40(sp)
    8020686a:	7b02                	ld	s6,32(sp)
    8020686c:	6be2                	ld	s7,24(sp)
    8020686e:	6c42                	ld	s8,16(sp)
    80206870:	6ca2                	ld	s9,8(sp)
    80206872:	6d02                	ld	s10,0(sp)
    80206874:	6125                	addi	sp,sp,96
    80206876:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206878:	89da                	mv	s3,s6
    8020687a:	bff9                	j	80206858 <eread+0xd0>
        return 0;
    8020687c:	4501                	li	a0,0
}
    8020687e:	8082                	ret

0000000080206880 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206880:	10852783          	lw	a5,264(a0)
    80206884:	0ed7e463          	bltu	a5,a3,8020696c <ewrite+0xec>
{
    80206888:	711d                	addi	sp,sp,-96
    8020688a:	ec86                	sd	ra,88(sp)
    8020688c:	e8a2                	sd	s0,80(sp)
    8020688e:	e4a6                	sd	s1,72(sp)
    80206890:	e0ca                	sd	s2,64(sp)
    80206892:	fc4e                	sd	s3,56(sp)
    80206894:	f852                	sd	s4,48(sp)
    80206896:	f456                	sd	s5,40(sp)
    80206898:	f05a                	sd	s6,32(sp)
    8020689a:	ec5e                	sd	s7,24(sp)
    8020689c:	e862                	sd	s8,16(sp)
    8020689e:	e466                	sd	s9,8(sp)
    802068a0:	1080                	addi	s0,sp,96
    802068a2:	8aaa                	mv	s5,a0
    802068a4:	8bae                	mv	s7,a1
    802068a6:	8a32                	mv	s4,a2
    802068a8:	8936                	mv	s2,a3
    802068aa:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    802068ac:	00e687bb          	addw	a5,a3,a4
    802068b0:	0cd7e063          	bltu	a5,a3,80206970 <ewrite+0xf0>
    802068b4:	02069793          	slli	a5,a3,0x20
    802068b8:	9381                	srli	a5,a5,0x20
    802068ba:	1702                	slli	a4,a4,0x20
    802068bc:	9301                	srli	a4,a4,0x20
    802068be:	97ba                	add	a5,a5,a4
    802068c0:	577d                	li	a4,-1
    802068c2:	9301                	srli	a4,a4,0x20
    802068c4:	0af76863          	bltu	a4,a5,80206974 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    802068c8:	10054783          	lbu	a5,256(a0)
    802068cc:	8b85                	andi	a5,a5,1
    802068ce:	e7cd                	bnez	a5,80206978 <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    802068d0:	10452783          	lw	a5,260(a0)
    802068d4:	cb89                	beqz	a5,802068e6 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    802068d6:	080b0963          	beqz	s6,80206968 <ewrite+0xe8>
    802068da:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802068dc:	0001dc17          	auipc	s8,0x1d
    802068e0:	51cc0c13          	addi	s8,s8,1308 # 80223df8 <fat>
    802068e4:	a891                	j	80206938 <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    802068e6:	11454503          	lbu	a0,276(a0)
    802068ea:	fffff097          	auipc	ra,0xfffff
    802068ee:	6c8080e7          	jalr	1736(ra) # 80205fb2 <alloc_clus>
    802068f2:	2501                	sext.w	a0,a0
    802068f4:	10aaa223          	sw	a0,260(s5)
    802068f8:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    802068fc:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    80206900:	4785                	li	a5,1
    80206902:	10fa8aa3          	sb	a5,277(s5)
    80206906:	bfc1                	j	802068d6 <ewrite+0x56>
    80206908:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    8020690c:	87e6                	mv	a5,s9
    8020690e:	86d2                	mv	a3,s4
    80206910:	865e                	mv	a2,s7
    80206912:	4585                	li	a1,1
    80206914:	10caa503          	lw	a0,268(s5)
    80206918:	00000097          	auipc	ra,0x0
    8020691c:	964080e7          	jalr	-1692(ra) # 8020627c <rw_clus>
    80206920:	2501                	sext.w	a0,a0
    80206922:	04ac9d63          	bne	s9,a0,8020697c <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206926:	013489bb          	addw	s3,s1,s3
    8020692a:	0124893b          	addw	s2,s1,s2
    8020692e:	1482                	slli	s1,s1,0x20
    80206930:	9081                	srli	s1,s1,0x20
    80206932:	9a26                	add	s4,s4,s1
    80206934:	0569f463          	bgeu	s3,s6,8020697c <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    80206938:	4605                	li	a2,1
    8020693a:	85ca                	mv	a1,s2
    8020693c:	8556                	mv	a0,s5
    8020693e:	00000097          	auipc	ra,0x0
    80206942:	836080e7          	jalr	-1994(ra) # 80206174 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206946:	00cc2683          	lw	a3,12(s8)
    8020694a:	02d9763b          	remuw	a2,s2,a3
    8020694e:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    80206952:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206956:	9e91                	subw	a3,a3,a2
    80206958:	84be                	mv	s1,a5
    8020695a:	2781                	sext.w	a5,a5
    8020695c:	0006861b          	sext.w	a2,a3
    80206960:	faf674e3          	bgeu	a2,a5,80206908 <ewrite+0x88>
    80206964:	84b6                	mv	s1,a3
    80206966:	b74d                	j	80206908 <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206968:	89da                	mv	s3,s6
    8020696a:	a015                	j	8020698e <ewrite+0x10e>
        return -1;
    8020696c:	557d                	li	a0,-1
}
    8020696e:	8082                	ret
        return -1;
    80206970:	557d                	li	a0,-1
    80206972:	a005                	j	80206992 <ewrite+0x112>
    80206974:	557d                	li	a0,-1
    80206976:	a831                	j	80206992 <ewrite+0x112>
    80206978:	557d                	li	a0,-1
    8020697a:	a821                	j	80206992 <ewrite+0x112>
        if(off > entry->file_size) {
    8020697c:	108aa783          	lw	a5,264(s5)
    80206980:	0127f763          	bgeu	a5,s2,8020698e <ewrite+0x10e>
            entry->file_size = off;
    80206984:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80206988:	4785                	li	a5,1
    8020698a:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    8020698e:	0009851b          	sext.w	a0,s3
}
    80206992:	60e6                	ld	ra,88(sp)
    80206994:	6446                	ld	s0,80(sp)
    80206996:	64a6                	ld	s1,72(sp)
    80206998:	6906                	ld	s2,64(sp)
    8020699a:	79e2                	ld	s3,56(sp)
    8020699c:	7a42                	ld	s4,48(sp)
    8020699e:	7aa2                	ld	s5,40(sp)
    802069a0:	7b02                	ld	s6,32(sp)
    802069a2:	6be2                	ld	s7,24(sp)
    802069a4:	6c42                	ld	s8,16(sp)
    802069a6:	6ca2                	ld	s9,8(sp)
    802069a8:	6125                	addi	sp,sp,96
    802069aa:	8082                	ret

00000000802069ac <formatname>:
{
    802069ac:	7179                	addi	sp,sp,-48
    802069ae:	f406                	sd	ra,40(sp)
    802069b0:	f022                	sd	s0,32(sp)
    802069b2:	ec26                	sd	s1,24(sp)
    802069b4:	e84a                	sd	s2,16(sp)
    802069b6:	e44e                	sd	s3,8(sp)
    802069b8:	e052                	sd	s4,0(sp)
    802069ba:	1800                	addi	s0,sp,48
    802069bc:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    802069be:	02000793          	li	a5,32
    802069c2:	02e00713          	li	a4,46
    802069c6:	a011                	j	802069ca <formatname+0x1e>
    802069c8:	0485                	addi	s1,s1,1
    802069ca:	0004c583          	lbu	a1,0(s1)
    802069ce:	fef58de3          	beq	a1,a5,802069c8 <formatname+0x1c>
    802069d2:	fee58be3          	beq	a1,a4,802069c8 <formatname+0x1c>
    for (p = name; *p; p++) {
    802069d6:	c1b9                	beqz	a1,80206a1c <formatname+0x70>
    802069d8:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    802069da:	49fd                	li	s3,31
    802069dc:	00007a17          	auipc	s4,0x7
    802069e0:	2c4a0a13          	addi	s4,s4,708 # 8020dca0 <illegal.1>
    802069e4:	02b9fe63          	bgeu	s3,a1,80206a20 <formatname+0x74>
    802069e8:	8552                	mv	a0,s4
    802069ea:	ffffa097          	auipc	ra,0xffffa
    802069ee:	fd6080e7          	jalr	-42(ra) # 802009c0 <strchr>
    802069f2:	e121                	bnez	a0,80206a32 <formatname+0x86>
    for (p = name; *p; p++) {
    802069f4:	0905                	addi	s2,s2,1
    802069f6:	00094583          	lbu	a1,0(s2)
    802069fa:	f5ed                	bnez	a1,802069e4 <formatname+0x38>
        if (*p != ' ') {
    802069fc:	02000693          	li	a3,32
    80206a00:	874a                	mv	a4,s2
    while (p-- > name) {
    80206a02:	0124fb63          	bgeu	s1,s2,80206a18 <formatname+0x6c>
        if (*p != ' ') {
    80206a06:	197d                	addi	s2,s2,-1
    80206a08:	00094783          	lbu	a5,0(s2)
    80206a0c:	fed78ae3          	beq	a5,a3,80206a00 <formatname+0x54>
            p[1] = '\0';
    80206a10:	00070023          	sb	zero,0(a4)
            break;
    80206a14:	8526                	mv	a0,s1
    80206a16:	a031                	j	80206a22 <formatname+0x76>
    80206a18:	8526                	mv	a0,s1
    80206a1a:	a021                	j	80206a22 <formatname+0x76>
    for (p = name; *p; p++) {
    80206a1c:	8526                	mv	a0,s1
    80206a1e:	a011                	j	80206a22 <formatname+0x76>
            return 0;
    80206a20:	4501                	li	a0,0
}
    80206a22:	70a2                	ld	ra,40(sp)
    80206a24:	7402                	ld	s0,32(sp)
    80206a26:	64e2                	ld	s1,24(sp)
    80206a28:	6942                	ld	s2,16(sp)
    80206a2a:	69a2                	ld	s3,8(sp)
    80206a2c:	6a02                	ld	s4,0(sp)
    80206a2e:	6145                	addi	sp,sp,48
    80206a30:	8082                	ret
            return 0;
    80206a32:	4501                	li	a0,0
    80206a34:	b7fd                	j	80206a22 <formatname+0x76>

0000000080206a36 <cal_checksum>:
{
    80206a36:	1141                	addi	sp,sp,-16
    80206a38:	e422                	sd	s0,8(sp)
    80206a3a:	0800                	addi	s0,sp,16
    80206a3c:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80206a3e:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    80206a42:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    80206a44:	0075171b          	slliw	a4,a0,0x7
    80206a48:	0785                	addi	a5,a5,1
    80206a4a:	0015551b          	srliw	a0,a0,0x1
    80206a4e:	fff7c683          	lbu	a3,-1(a5)
    80206a52:	9d35                	addw	a0,a0,a3
    80206a54:	953a                	add	a0,a0,a4
    80206a56:	0ff57513          	zext.b	a0,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80206a5a:	fef615e3          	bne	a2,a5,80206a44 <cal_checksum+0xe>
}
    80206a5e:	6422                	ld	s0,8(sp)
    80206a60:	0141                	addi	sp,sp,16
    80206a62:	8082                	ret

0000000080206a64 <emake>:
{
    80206a64:	7131                	addi	sp,sp,-192
    80206a66:	fd06                	sd	ra,184(sp)
    80206a68:	f922                	sd	s0,176(sp)
    80206a6a:	f526                	sd	s1,168(sp)
    80206a6c:	f14a                	sd	s2,160(sp)
    80206a6e:	ed4e                	sd	s3,152(sp)
    80206a70:	e952                	sd	s4,144(sp)
    80206a72:	e556                	sd	s5,136(sp)
    80206a74:	e15a                	sd	s6,128(sp)
    80206a76:	fcde                	sd	s7,120(sp)
    80206a78:	f8e2                	sd	s8,112(sp)
    80206a7a:	f4e6                	sd	s9,104(sp)
    80206a7c:	f0ea                	sd	s10,96(sp)
    80206a7e:	ecee                	sd	s11,88(sp)
    80206a80:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206a82:	10054783          	lbu	a5,256(a0)
    80206a86:	8bc1                	andi	a5,a5,16
    80206a88:	c3d5                	beqz	a5,80206b2c <emake+0xc8>
    80206a8a:	8b2a                	mv	s6,a0
    80206a8c:	8d2e                	mv	s10,a1
    80206a8e:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    80206a90:	01f67793          	andi	a5,a2,31
    80206a94:	e7c5                	bnez	a5,80206b3c <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80206a96:	02000613          	li	a2,32
    80206a9a:	4581                	li	a1,0
    80206a9c:	f7040513          	addi	a0,s0,-144
    80206aa0:	ffffa097          	auipc	ra,0xffffa
    80206aa4:	cc2080e7          	jalr	-830(ra) # 80200762 <memset>
    if (off <= 32) {
    80206aa8:	02000793          	li	a5,32
    80206aac:	0b97ec63          	bltu	a5,s9,80206b64 <emake+0x100>
        if (off == 0) {
    80206ab0:	080c9e63          	bnez	s9,80206b4c <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80206ab4:	462d                	li	a2,11
    80206ab6:	00004597          	auipc	a1,0x4
    80206aba:	4ca58593          	addi	a1,a1,1226 # 8020af80 <digits+0xc00>
    80206abe:	f7040513          	addi	a0,s0,-144
    80206ac2:	ffffa097          	auipc	ra,0xffffa
    80206ac6:	db4080e7          	jalr	-588(ra) # 80200876 <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    80206aca:	47c1                	li	a5,16
    80206acc:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80206ad0:	104d2783          	lw	a5,260(s10) # fffffffffffff104 <ebss_clear+0xffffffff7fdd2104>
    80206ad4:	0107d71b          	srliw	a4,a5,0x10
    80206ad8:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    80206adc:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    80206ae0:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206ae4:	4605                	li	a2,1
    80206ae6:	85e6                	mv	a1,s9
    80206ae8:	855a                	mv	a0,s6
    80206aea:	fffff097          	auipc	ra,0xfffff
    80206aee:	68a080e7          	jalr	1674(ra) # 80206174 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206af2:	02000793          	li	a5,32
    80206af6:	0005071b          	sext.w	a4,a0
    80206afa:	f7040693          	addi	a3,s0,-144
    80206afe:	4601                	li	a2,0
    80206b00:	4585                	li	a1,1
    80206b02:	10cb2503          	lw	a0,268(s6)
    80206b06:	fffff097          	auipc	ra,0xfffff
    80206b0a:	776080e7          	jalr	1910(ra) # 8020627c <rw_clus>
}
    80206b0e:	70ea                	ld	ra,184(sp)
    80206b10:	744a                	ld	s0,176(sp)
    80206b12:	74aa                	ld	s1,168(sp)
    80206b14:	790a                	ld	s2,160(sp)
    80206b16:	69ea                	ld	s3,152(sp)
    80206b18:	6a4a                	ld	s4,144(sp)
    80206b1a:	6aaa                	ld	s5,136(sp)
    80206b1c:	6b0a                	ld	s6,128(sp)
    80206b1e:	7be6                	ld	s7,120(sp)
    80206b20:	7c46                	ld	s8,112(sp)
    80206b22:	7ca6                	ld	s9,104(sp)
    80206b24:	7d06                	ld	s10,96(sp)
    80206b26:	6de6                	ld	s11,88(sp)
    80206b28:	6129                	addi	sp,sp,192
    80206b2a:	8082                	ret
        panic("emake: not dir");
    80206b2c:	00004517          	auipc	a0,0x4
    80206b30:	42c50513          	addi	a0,a0,1068 # 8020af58 <digits+0xbd8>
    80206b34:	ffff9097          	auipc	ra,0xffff9
    80206b38:	610080e7          	jalr	1552(ra) # 80200144 <panic>
        panic("emake: not aligned");
    80206b3c:	00004517          	auipc	a0,0x4
    80206b40:	42c50513          	addi	a0,a0,1068 # 8020af68 <digits+0xbe8>
    80206b44:	ffff9097          	auipc	ra,0xffff9
    80206b48:	600080e7          	jalr	1536(ra) # 80200144 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    80206b4c:	462d                	li	a2,11
    80206b4e:	00004597          	auipc	a1,0x4
    80206b52:	44258593          	addi	a1,a1,1090 # 8020af90 <digits+0xc10>
    80206b56:	f7040513          	addi	a0,s0,-144
    80206b5a:	ffffa097          	auipc	ra,0xffffa
    80206b5e:	d1c080e7          	jalr	-740(ra) # 80200876 <strncpy>
    80206b62:	b7a5                	j	80206aca <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    80206b64:	896a                	mv	s2,s10
    80206b66:	856a                	mv	a0,s10
    80206b68:	ffffa097          	auipc	ra,0xffffa
    80206b6c:	d7e080e7          	jalr	-642(ra) # 802008e6 <strlen>
    80206b70:	f4a43423          	sd	a0,-184(s0)
    80206b74:	00c5071b          	addiw	a4,a0,12
    80206b78:	47b5                	li	a5,13
    80206b7a:	02f747bb          	divw	a5,a4,a5
    80206b7e:	f4f42c23          	sw	a5,-168(s0)
    80206b82:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    80206b86:	4631                	li	a2,12
    80206b88:	4581                	li	a1,0
    80206b8a:	f6040513          	addi	a0,s0,-160
    80206b8e:	ffffa097          	auipc	ra,0xffffa
    80206b92:	bd4080e7          	jalr	-1068(ra) # 80200762 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206b96:	856a                	mv	a0,s10
    80206b98:	ffffa097          	auipc	ra,0xffffa
    80206b9c:	d4e080e7          	jalr	-690(ra) # 802008e6 <strlen>
    80206ba0:	fff5079b          	addiw	a5,a0,-1
    80206ba4:	0207cf63          	bltz	a5,80206be2 <emake+0x17e>
    80206ba8:	97ea                	add	a5,a5,s10
    80206baa:	ffed0693          	addi	a3,s10,-2
    80206bae:	96aa                	add	a3,a3,a0
    80206bb0:	fff5071b          	addiw	a4,a0,-1
    80206bb4:	1702                	slli	a4,a4,0x20
    80206bb6:	9301                	srli	a4,a4,0x20
    80206bb8:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    80206bba:	02e00613          	li	a2,46
    80206bbe:	89be                	mv	s3,a5
    80206bc0:	0007c703          	lbu	a4,0(a5)
    80206bc4:	00c70663          	beq	a4,a2,80206bd0 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206bc8:	17fd                	addi	a5,a5,-1
    80206bca:	fed79ae3          	bne	a5,a3,80206bbe <emake+0x15a>
    char c, *p = name;
    80206bce:	89ea                	mv	s3,s10
        shortname[i++] = c;
    80206bd0:	4481                	li	s1,0
        if (i == 8 && p) {
    80206bd2:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206bd4:	4ba9                	li	s7,10
        if (c >= 'a' && c <= 'z') {
    80206bd6:	4c65                	li	s8,25
                memset(shortname + i, ' ', 8 - i);
    80206bd8:	f6040793          	addi	a5,s0,-160
    80206bdc:	f4f43823          	sd	a5,-176(s0)
    80206be0:	a8d9                	j	80206cb6 <emake+0x252>
    char c, *p = name;
    80206be2:	89ea                	mv	s3,s10
    80206be4:	b7f5                	j	80206bd0 <emake+0x16c>
        if (i == 8 && p) {
    80206be6:	22098b63          	beqz	s3,80206e1c <emake+0x3b8>
            if (p + 1 < name) { break; }            // no '.'
    80206bea:	0985                	addi	s3,s3,1
    80206bec:	0949fc63          	bgeu	s3,s4,80206c84 <emake+0x220>
    80206bf0:	f6040793          	addi	a5,s0,-160
    80206bf4:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    80206bf6:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    80206bfa:	4729                	li	a4,10
        shortname[i++] = ' ';
    80206bfc:	2485                	addiw	s1,s1,1
    80206bfe:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    80206c02:	0785                	addi	a5,a5,1
    80206c04:	fe975ce3          	bge	a4,s1,80206bfc <emake+0x198>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    80206c08:	f6040513          	addi	a0,s0,-160
    80206c0c:	00000097          	auipc	ra,0x0
    80206c10:	e2a080e7          	jalr	-470(ra) # 80206a36 <cal_checksum>
    80206c14:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    80206c18:	47bd                	li	a5,15
    80206c1a:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    80206c1e:	f4843783          	ld	a5,-184(s0)
    80206c22:	14f05c63          	blez	a5,80206d7a <emake+0x316>
    80206c26:	f5842783          	lw	a5,-168(s0)
    80206c2a:	37fd                	addiw	a5,a5,-1
    80206c2c:	f4f42223          	sw	a5,-188(s0)
    80206c30:	00179b9b          	slliw	s7,a5,0x1
    80206c34:	00fb8bbb          	addw	s7,s7,a5
    80206c38:	002b9b9b          	slliw	s7,s7,0x2
    80206c3c:	00fb8bbb          	addw	s7,s7,a5
    80206c40:	9bea                	add	s7,s7,s10
    80206c42:	8aee                	mv	s5,s11
    80206c44:	8c66                	mv	s8,s9
            int end = 0;
    80206c46:	4981                	li	s3,0
            uint8 *w = (uint8 *)de.lne.name1;
    80206c48:	f7140793          	addi	a5,s0,-143
    80206c4c:	f4f43823          	sd	a5,-176(s0)
    80206c50:	0ff00913          	li	s2,255
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206c54:	f7e40793          	addi	a5,s0,-130
    80206c58:	f4f43c23          	sd	a5,-168(s0)
                switch (j) {
    80206c5c:	44ad                	li	s1,11
    80206c5e:	f8c40a13          	addi	s4,s0,-116
    80206c62:	a0c5                	j	80206d42 <emake+0x2de>
            if (name > p) {                    // last '.'
    80206c64:	0549f663          	bgeu	s3,s4,80206cb0 <emake+0x24c>
                memset(shortname + i, ' ', 8 - i);
    80206c68:	47a1                	li	a5,8
    80206c6a:	4097863b          	subw	a2,a5,s1
    80206c6e:	02000593          	li	a1,32
    80206c72:	f5043783          	ld	a5,-176(s0)
    80206c76:	00978533          	add	a0,a5,s1
    80206c7a:	ffffa097          	auipc	ra,0xffffa
    80206c7e:	ae8080e7          	jalr	-1304(ra) # 80200762 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206c82:	89d2                	mv	s3,s4
        shortname[i++] = c;
    80206c84:	8a4e                	mv	s4,s3
    80206c86:	84d6                	mv	s1,s5
    80206c88:	4981                	li	s3,0
    80206c8a:	a02d                	j	80206cb4 <emake+0x250>
            if (strchr(illegal, c) != NULL) {
    80206c8c:	85ca                	mv	a1,s2
    80206c8e:	00007517          	auipc	a0,0x7
    80206c92:	02250513          	addi	a0,a0,34 # 8020dcb0 <illegal.0>
    80206c96:	ffffa097          	auipc	ra,0xffffa
    80206c9a:	d2a080e7          	jalr	-726(ra) # 802009c0 <strchr>
    80206c9e:	c119                	beqz	a0,80206ca4 <emake+0x240>
                c = '_';
    80206ca0:	05f00913          	li	s2,95
        shortname[i++] = c;
    80206ca4:	f9048793          	addi	a5,s1,-112
    80206ca8:	97a2                	add	a5,a5,s0
    80206caa:	fd278823          	sb	s2,-48(a5)
    80206cae:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206cb0:	f49bcce3          	blt	s7,s1,80206c08 <emake+0x1a4>
        shortname[i++] = c;
    80206cb4:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206cb6:	00190a13          	addi	s4,s2,1
    80206cba:	00094903          	lbu	s2,0(s2)
    80206cbe:	02090663          	beqz	s2,80206cea <emake+0x286>
        if (i == 8 && p) {
    80206cc2:	f35482e3          	beq	s1,s5,80206be6 <emake+0x182>
        if (c == ' ') { continue; }
    80206cc6:	02000793          	li	a5,32
    80206cca:	fef903e3          	beq	s2,a5,80206cb0 <emake+0x24c>
        if (c == '.') {
    80206cce:	02e00793          	li	a5,46
    80206cd2:	f8f909e3          	beq	s2,a5,80206c64 <emake+0x200>
        if (c >= 'a' && c <= 'z') {
    80206cd6:	f9f9079b          	addiw	a5,s2,-97
    80206cda:	0ff7f793          	zext.b	a5,a5
    80206cde:	fafc67e3          	bltu	s8,a5,80206c8c <emake+0x228>
            c += 'A' - 'a';
    80206ce2:	3901                	addiw	s2,s2,-32
    80206ce4:	0ff97913          	zext.b	s2,s2
    80206ce8:	bf75                	j	80206ca4 <emake+0x240>
    while (i < CHAR_SHORT_NAME) {
    80206cea:	47a9                	li	a5,10
    80206cec:	f097d2e3          	bge	a5,s1,80206bf0 <emake+0x18c>
    80206cf0:	bf21                	j	80206c08 <emake+0x1a4>
                de.lne.order |= LAST_LONG_ENTRY;
    80206cf2:	0407e793          	ori	a5,a5,64
    80206cf6:	f6f40823          	sb	a5,-144(s0)
    80206cfa:	a891                	j	80206d4e <emake+0x2ea>
                    if ((*w++ = *p++) == 0) {
    80206cfc:	00084603          	lbu	a2,0(a6)
                        end = 1;
    80206d00:	00163513          	seqz	a0,a2
                    *w++ = 0;
    80206d04:	00278893          	addi	a7,a5,2
                    if ((*w++ = *p++) == 0) {
    80206d08:	0805                	addi	a6,a6,1
                    *w++ = 0;
    80206d0a:	85ce                	mv	a1,s3
    80206d0c:	a8d5                	j	80206e00 <emake+0x39c>
            uint off2 = reloc_clus(dp, off, 1);
    80206d0e:	4605                	li	a2,1
    80206d10:	85e2                	mv	a1,s8
    80206d12:	855a                	mv	a0,s6
    80206d14:	fffff097          	auipc	ra,0xfffff
    80206d18:	460080e7          	jalr	1120(ra) # 80206174 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80206d1c:	02000793          	li	a5,32
    80206d20:	0005071b          	sext.w	a4,a0
    80206d24:	f7040693          	addi	a3,s0,-144
    80206d28:	864e                	mv	a2,s3
    80206d2a:	4585                	li	a1,1
    80206d2c:	10cb2503          	lw	a0,268(s6)
    80206d30:	fffff097          	auipc	ra,0xfffff
    80206d34:	54c080e7          	jalr	1356(ra) # 8020627c <rw_clus>
            off += sizeof(de);
    80206d38:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    80206d3c:	1bcd                	addi	s7,s7,-13
    80206d3e:	03505163          	blez	s5,80206d60 <emake+0x2fc>
            if ((de.lne.order = i) == entcnt) {
    80206d42:	0ffaf793          	zext.b	a5,s5
    80206d46:	fafd86e3          	beq	s11,a5,80206cf2 <emake+0x28e>
    80206d4a:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    80206d4e:	3afd                	addiw	s5,s5,-1
    80206d50:	885e                	mv	a6,s7
    80206d52:	4709                	li	a4,2
            int end = 0;
    80206d54:	854e                	mv	a0,s3
            uint8 *w = (uint8 *)de.lne.name1;
    80206d56:	f5043783          	ld	a5,-176(s0)
                switch (j) {
    80206d5a:	4315                	li	t1,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206d5c:	4e35                	li	t3,13
    80206d5e:	a851                	j	80206df2 <emake+0x38e>
    80206d60:	020c8c9b          	addiw	s9,s9,32
            off += sizeof(de);
    80206d64:	4781                	li	a5,0
    80206d66:	f4843703          	ld	a4,-184(s0)
    80206d6a:	00e05663          	blez	a4,80206d76 <emake+0x312>
    80206d6e:	f4442783          	lw	a5,-188(s0)
    80206d72:	0057979b          	slliw	a5,a5,0x5
    80206d76:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    80206d7a:	02000613          	li	a2,32
    80206d7e:	4581                	li	a1,0
    80206d80:	f7040493          	addi	s1,s0,-144
    80206d84:	8526                	mv	a0,s1
    80206d86:	ffffa097          	auipc	ra,0xffffa
    80206d8a:	9dc080e7          	jalr	-1572(ra) # 80200762 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    80206d8e:	462d                	li	a2,11
    80206d90:	f6040593          	addi	a1,s0,-160
    80206d94:	8526                	mv	a0,s1
    80206d96:	ffffa097          	auipc	ra,0xffffa
    80206d9a:	ae0080e7          	jalr	-1312(ra) # 80200876 <strncpy>
        de.sne.attr = ep->attribute;
    80206d9e:	100d4783          	lbu	a5,256(s10)
    80206da2:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    80206da6:	104d2783          	lw	a5,260(s10)
    80206daa:	0107d71b          	srliw	a4,a5,0x10
    80206dae:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    80206db2:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    80206db6:	108d2783          	lw	a5,264(s10)
    80206dba:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206dbe:	4605                	li	a2,1
    80206dc0:	85e6                	mv	a1,s9
    80206dc2:	855a                	mv	a0,s6
    80206dc4:	fffff097          	auipc	ra,0xfffff
    80206dc8:	3b0080e7          	jalr	944(ra) # 80206174 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206dcc:	02000793          	li	a5,32
    80206dd0:	0005071b          	sext.w	a4,a0
    80206dd4:	86a6                	mv	a3,s1
    80206dd6:	4601                	li	a2,0
    80206dd8:	4585                	li	a1,1
    80206dda:	10cb2503          	lw	a0,268(s6)
    80206dde:	fffff097          	auipc	ra,0xfffff
    80206de2:	49e080e7          	jalr	1182(ra) # 8020627c <rw_clus>
}
    80206de6:	b325                	j	80206b0e <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206de8:	f5843783          	ld	a5,-168(s0)
    80206dec:	a011                	j	80206df0 <emake+0x38c>
                switch (j) {
    80206dee:	87d2                	mv	a5,s4
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206df0:	2705                	addiw	a4,a4,1
    80206df2:	fff7069b          	addiw	a3,a4,-1
                if (end) {
    80206df6:	d119                	beqz	a0,80206cfc <emake+0x298>
                    *w++ = 0xff;
    80206df8:	00278893          	addi	a7,a5,2
    80206dfc:	864a                	mv	a2,s2
    80206dfe:	85ca                	mv	a1,s2
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206e00:	00c78023          	sb	a2,0(a5)
                    *w++ = 0xff;
    80206e04:	00b780a3          	sb	a1,1(a5)
                switch (j) {
    80206e08:	fe6680e3          	beq	a3,t1,80206de8 <emake+0x384>
    80206e0c:	fe9681e3          	beq	a3,s1,80206dee <emake+0x38a>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206e10:	0007079b          	sext.w	a5,a4
    80206e14:	eefe4de3          	blt	t3,a5,80206d0e <emake+0x2aa>
    80206e18:	87c6                	mv	a5,a7
    80206e1a:	bfd9                	j	80206df0 <emake+0x38c>
        if (c == ' ') { continue; }
    80206e1c:	02000793          	li	a5,32
    80206e20:	e8f90ae3          	beq	s2,a5,80206cb4 <emake+0x250>
        if (c == '.') {
    80206e24:	02e00793          	li	a5,46
    80206e28:	eaf917e3          	bne	s2,a5,80206cd6 <emake+0x272>
    80206e2c:	bd35                	j	80206c68 <emake+0x204>

0000000080206e2e <edup>:
{
    80206e2e:	1101                	addi	sp,sp,-32
    80206e30:	ec06                	sd	ra,24(sp)
    80206e32:	e822                	sd	s0,16(sp)
    80206e34:	e426                	sd	s1,8(sp)
    80206e36:	1000                	addi	s0,sp,32
    80206e38:	84aa                	mv	s1,a0
    if (entry != 0) {
    80206e3a:	c515                	beqz	a0,80206e66 <edup+0x38>
        acquire(&ecache.lock);
    80206e3c:	0001d517          	auipc	a0,0x1d
    80206e40:	15450513          	addi	a0,a0,340 # 80223f90 <ecache>
    80206e44:	ffffa097          	auipc	ra,0xffffa
    80206e48:	882080e7          	jalr	-1918(ra) # 802006c6 <acquire>
        entry->ref++;
    80206e4c:	1184a783          	lw	a5,280(s1)
    80206e50:	2785                	addiw	a5,a5,1
    80206e52:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206e56:	0001d517          	auipc	a0,0x1d
    80206e5a:	13a50513          	addi	a0,a0,314 # 80223f90 <ecache>
    80206e5e:	ffffa097          	auipc	ra,0xffffa
    80206e62:	8bc080e7          	jalr	-1860(ra) # 8020071a <release>
}
    80206e66:	8526                	mv	a0,s1
    80206e68:	60e2                	ld	ra,24(sp)
    80206e6a:	6442                	ld	s0,16(sp)
    80206e6c:	64a2                	ld	s1,8(sp)
    80206e6e:	6105                	addi	sp,sp,32
    80206e70:	8082                	ret

0000000080206e72 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    80206e72:	11554783          	lbu	a5,277(a0)
    80206e76:	c3e5                	beqz	a5,80206f56 <eupdate+0xe4>
{
    80206e78:	711d                	addi	sp,sp,-96
    80206e7a:	ec86                	sd	ra,88(sp)
    80206e7c:	e8a2                	sd	s0,80(sp)
    80206e7e:	e4a6                	sd	s1,72(sp)
    80206e80:	e0ca                	sd	s2,64(sp)
    80206e82:	fc4e                	sd	s3,56(sp)
    80206e84:	1080                	addi	s0,sp,96
    80206e86:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    80206e88:	11651703          	lh	a4,278(a0)
    80206e8c:	4785                	li	a5,1
    80206e8e:	00f70963          	beq	a4,a5,80206ea0 <eupdate+0x2e>
}
    80206e92:	60e6                	ld	ra,88(sp)
    80206e94:	6446                	ld	s0,80(sp)
    80206e96:	64a6                	ld	s1,72(sp)
    80206e98:	6906                	ld	s2,64(sp)
    80206e9a:	79e2                	ld	s3,56(sp)
    80206e9c:	6125                	addi	sp,sp,96
    80206e9e:	8082                	ret
    uint entcnt = 0;
    80206ea0:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    80206ea4:	4601                	li	a2,0
    80206ea6:	11c52583          	lw	a1,284(a0)
    80206eaa:	12053503          	ld	a0,288(a0)
    80206eae:	fffff097          	auipc	ra,0xfffff
    80206eb2:	2c6080e7          	jalr	710(ra) # 80206174 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    80206eb6:	1204b803          	ld	a6,288(s1)
    80206eba:	4785                	li	a5,1
    80206ebc:	0005071b          	sext.w	a4,a0
    80206ec0:	fcc40693          	addi	a3,s0,-52
    80206ec4:	4601                	li	a2,0
    80206ec6:	4581                	li	a1,0
    80206ec8:	10c82503          	lw	a0,268(a6)
    80206ecc:	fffff097          	auipc	ra,0xfffff
    80206ed0:	3b0080e7          	jalr	944(ra) # 8020627c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206ed4:	fcc42583          	lw	a1,-52(s0)
    80206ed8:	fbf5f593          	andi	a1,a1,-65
    80206edc:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    80206ee0:	0055959b          	slliw	a1,a1,0x5
    80206ee4:	11c4a783          	lw	a5,284(s1)
    80206ee8:	4601                	li	a2,0
    80206eea:	9dbd                	addw	a1,a1,a5
    80206eec:	1204b503          	ld	a0,288(s1)
    80206ef0:	fffff097          	auipc	ra,0xfffff
    80206ef4:	284080e7          	jalr	644(ra) # 80206174 <reloc_clus>
    80206ef8:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    80206efc:	1204b503          	ld	a0,288(s1)
    80206f00:	02000793          	li	a5,32
    80206f04:	874e                	mv	a4,s3
    80206f06:	fa840913          	addi	s2,s0,-88
    80206f0a:	86ca                	mv	a3,s2
    80206f0c:	4601                	li	a2,0
    80206f0e:	4581                	li	a1,0
    80206f10:	10c52503          	lw	a0,268(a0)
    80206f14:	fffff097          	auipc	ra,0xfffff
    80206f18:	368080e7          	jalr	872(ra) # 8020627c <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    80206f1c:	1044a783          	lw	a5,260(s1)
    80206f20:	0107d71b          	srliw	a4,a5,0x10
    80206f24:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    80206f28:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    80206f2c:	1084a783          	lw	a5,264(s1)
    80206f30:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206f34:	1204b503          	ld	a0,288(s1)
    80206f38:	02000793          	li	a5,32
    80206f3c:	874e                	mv	a4,s3
    80206f3e:	86ca                	mv	a3,s2
    80206f40:	4601                	li	a2,0
    80206f42:	4585                	li	a1,1
    80206f44:	10c52503          	lw	a0,268(a0)
    80206f48:	fffff097          	auipc	ra,0xfffff
    80206f4c:	334080e7          	jalr	820(ra) # 8020627c <rw_clus>
    entry->dirty = 0;
    80206f50:	10048aa3          	sb	zero,277(s1)
    80206f54:	bf3d                	j	80206e92 <eupdate+0x20>
    80206f56:	8082                	ret

0000000080206f58 <eremove>:
    if (entry->valid != 1) { return; }
    80206f58:	11651703          	lh	a4,278(a0)
    80206f5c:	4785                	li	a5,1
    80206f5e:	00f70363          	beq	a4,a5,80206f64 <eremove+0xc>
    80206f62:	8082                	ret
{
    80206f64:	715d                	addi	sp,sp,-80
    80206f66:	e486                	sd	ra,72(sp)
    80206f68:	e0a2                	sd	s0,64(sp)
    80206f6a:	fc26                	sd	s1,56(sp)
    80206f6c:	f84a                	sd	s2,48(sp)
    80206f6e:	f44e                	sd	s3,40(sp)
    80206f70:	f052                	sd	s4,32(sp)
    80206f72:	ec56                	sd	s5,24(sp)
    80206f74:	0880                	addi	s0,sp,80
    80206f76:	89aa                	mv	s3,a0
    uint entcnt = 0;
    80206f78:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    80206f7c:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    80206f80:	4601                	li	a2,0
    80206f82:	85d2                	mv	a1,s4
    80206f84:	12053503          	ld	a0,288(a0)
    80206f88:	fffff097          	auipc	ra,0xfffff
    80206f8c:	1ec080e7          	jalr	492(ra) # 80206174 <reloc_clus>
    80206f90:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    80206f94:	1209b503          	ld	a0,288(s3)
    80206f98:	4785                	li	a5,1
    80206f9a:	8726                	mv	a4,s1
    80206f9c:	fbc40693          	addi	a3,s0,-68
    80206fa0:	4601                	li	a2,0
    80206fa2:	4581                	li	a1,0
    80206fa4:	10c52503          	lw	a0,268(a0)
    80206fa8:	fffff097          	auipc	ra,0xfffff
    80206fac:	2d4080e7          	jalr	724(ra) # 8020627c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206fb0:	fbc42783          	lw	a5,-68(s0)
    80206fb4:	fbf7f793          	andi	a5,a5,-65
    80206fb8:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    80206fbc:	5795                	li	a5,-27
    80206fbe:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    80206fc2:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    80206fc4:	fbb40a93          	addi	s5,s0,-69
    80206fc8:	1209b503          	ld	a0,288(s3)
    80206fcc:	4785                	li	a5,1
    80206fce:	8726                	mv	a4,s1
    80206fd0:	86d6                	mv	a3,s5
    80206fd2:	4601                	li	a2,0
    80206fd4:	4585                	li	a1,1
    80206fd6:	10c52503          	lw	a0,268(a0)
    80206fda:	fffff097          	auipc	ra,0xfffff
    80206fde:	2a2080e7          	jalr	674(ra) # 8020627c <rw_clus>
        off += 32;
    80206fe2:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    80206fe6:	4601                	li	a2,0
    80206fe8:	85d2                	mv	a1,s4
    80206fea:	1209b503          	ld	a0,288(s3)
    80206fee:	fffff097          	auipc	ra,0xfffff
    80206ff2:	186080e7          	jalr	390(ra) # 80206174 <reloc_clus>
    80206ff6:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    80206ffa:	0019079b          	addiw	a5,s2,1
    80206ffe:	0007891b          	sext.w	s2,a5
    80207002:	fbc42703          	lw	a4,-68(s0)
    80207006:	fd2771e3          	bgeu	a4,s2,80206fc8 <eremove+0x70>
    entry->valid = -1;
    8020700a:	57fd                	li	a5,-1
    8020700c:	10f99b23          	sh	a5,278(s3)
}
    80207010:	60a6                	ld	ra,72(sp)
    80207012:	6406                	ld	s0,64(sp)
    80207014:	74e2                	ld	s1,56(sp)
    80207016:	7942                	ld	s2,48(sp)
    80207018:	79a2                	ld	s3,40(sp)
    8020701a:	7a02                	ld	s4,32(sp)
    8020701c:	6ae2                	ld	s5,24(sp)
    8020701e:	6161                	addi	sp,sp,80
    80207020:	8082                	ret

0000000080207022 <etrunc>:
{
    80207022:	7179                	addi	sp,sp,-48
    80207024:	f406                	sd	ra,40(sp)
    80207026:	f022                	sd	s0,32(sp)
    80207028:	ec26                	sd	s1,24(sp)
    8020702a:	e84a                	sd	s2,16(sp)
    8020702c:	e44e                	sd	s3,8(sp)
    8020702e:	e052                	sd	s4,0(sp)
    80207030:	1800                	addi	s0,sp,48
    80207032:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80207034:	10452483          	lw	s1,260(a0)
    80207038:	ffe4871b          	addiw	a4,s1,-2
    8020703c:	100007b7          	lui	a5,0x10000
    80207040:	17d5                	addi	a5,a5,-11 # ffffff5 <_entry-0x7020000b>
    80207042:	02e7e663          	bltu	a5,a4,8020706e <etrunc+0x4c>
    80207046:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    80207048:	0004891b          	sext.w	s2,s1
    8020704c:	8526                	mv	a0,s1
    8020704e:	fffff097          	auipc	ra,0xfffff
    80207052:	eee080e7          	jalr	-274(ra) # 80205f3c <read_fat>
    80207056:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    8020705a:	4581                	li	a1,0
    8020705c:	854a                	mv	a0,s2
    8020705e:	fffff097          	auipc	ra,0xfffff
    80207062:	096080e7          	jalr	150(ra) # 802060f4 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80207066:	ffe4879b          	addiw	a5,s1,-2
    8020706a:	fcf9ffe3          	bgeu	s3,a5,80207048 <etrunc+0x26>
    entry->file_size = 0;
    8020706e:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    80207072:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    80207076:	4785                	li	a5,1
    80207078:	10fa0aa3          	sb	a5,277(s4)
}
    8020707c:	70a2                	ld	ra,40(sp)
    8020707e:	7402                	ld	s0,32(sp)
    80207080:	64e2                	ld	s1,24(sp)
    80207082:	6942                	ld	s2,16(sp)
    80207084:	69a2                	ld	s3,8(sp)
    80207086:	6a02                	ld	s4,0(sp)
    80207088:	6145                	addi	sp,sp,48
    8020708a:	8082                	ret

000000008020708c <elock>:
{
    8020708c:	1141                	addi	sp,sp,-16
    8020708e:	e406                	sd	ra,8(sp)
    80207090:	e022                	sd	s0,0(sp)
    80207092:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    80207094:	cd19                	beqz	a0,802070b2 <elock+0x26>
    80207096:	11852783          	lw	a5,280(a0)
    8020709a:	00f05c63          	blez	a5,802070b2 <elock+0x26>
    acquiresleep(&entry->lock);
    8020709e:	13850513          	addi	a0,a0,312
    802070a2:	ffffd097          	auipc	ra,0xffffd
    802070a6:	cdc080e7          	jalr	-804(ra) # 80203d7e <acquiresleep>
}
    802070aa:	60a2                	ld	ra,8(sp)
    802070ac:	6402                	ld	s0,0(sp)
    802070ae:	0141                	addi	sp,sp,16
    802070b0:	8082                	ret
        panic("elock");
    802070b2:	00004517          	auipc	a0,0x4
    802070b6:	eee50513          	addi	a0,a0,-274 # 8020afa0 <digits+0xc20>
    802070ba:	ffff9097          	auipc	ra,0xffff9
    802070be:	08a080e7          	jalr	138(ra) # 80200144 <panic>

00000000802070c2 <eunlock>:
{
    802070c2:	1101                	addi	sp,sp,-32
    802070c4:	ec06                	sd	ra,24(sp)
    802070c6:	e822                	sd	s0,16(sp)
    802070c8:	e426                	sd	s1,8(sp)
    802070ca:	e04a                	sd	s2,0(sp)
    802070cc:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    802070ce:	c90d                	beqz	a0,80207100 <eunlock+0x3e>
    802070d0:	84aa                	mv	s1,a0
    802070d2:	13850913          	addi	s2,a0,312
    802070d6:	854a                	mv	a0,s2
    802070d8:	ffffd097          	auipc	ra,0xffffd
    802070dc:	d40080e7          	jalr	-704(ra) # 80203e18 <holdingsleep>
    802070e0:	c105                	beqz	a0,80207100 <eunlock+0x3e>
    802070e2:	1184a783          	lw	a5,280(s1)
    802070e6:	00f05d63          	blez	a5,80207100 <eunlock+0x3e>
    releasesleep(&entry->lock);
    802070ea:	854a                	mv	a0,s2
    802070ec:	ffffd097          	auipc	ra,0xffffd
    802070f0:	ce8080e7          	jalr	-792(ra) # 80203dd4 <releasesleep>
}
    802070f4:	60e2                	ld	ra,24(sp)
    802070f6:	6442                	ld	s0,16(sp)
    802070f8:	64a2                	ld	s1,8(sp)
    802070fa:	6902                	ld	s2,0(sp)
    802070fc:	6105                	addi	sp,sp,32
    802070fe:	8082                	ret
        panic("eunlock");
    80207100:	00004517          	auipc	a0,0x4
    80207104:	ea850513          	addi	a0,a0,-344 # 8020afa8 <digits+0xc28>
    80207108:	ffff9097          	auipc	ra,0xffff9
    8020710c:	03c080e7          	jalr	60(ra) # 80200144 <panic>

0000000080207110 <eput>:
{
    80207110:	1101                	addi	sp,sp,-32
    80207112:	ec06                	sd	ra,24(sp)
    80207114:	e822                	sd	s0,16(sp)
    80207116:	e426                	sd	s1,8(sp)
    80207118:	e04a                	sd	s2,0(sp)
    8020711a:	1000                	addi	s0,sp,32
    8020711c:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    8020711e:	0001d517          	auipc	a0,0x1d
    80207122:	e7250513          	addi	a0,a0,-398 # 80223f90 <ecache>
    80207126:	ffff9097          	auipc	ra,0xffff9
    8020712a:	5a0080e7          	jalr	1440(ra) # 802006c6 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    8020712e:	0001d797          	auipc	a5,0x1d
    80207132:	cf278793          	addi	a5,a5,-782 # 80223e20 <root>
    80207136:	00f48a63          	beq	s1,a5,8020714a <eput+0x3a>
    8020713a:	11649783          	lh	a5,278(s1)
    8020713e:	c791                	beqz	a5,8020714a <eput+0x3a>
    80207140:	1184a703          	lw	a4,280(s1)
    80207144:	4785                	li	a5,1
    80207146:	02f70563          	beq	a4,a5,80207170 <eput+0x60>
    entry->ref--;
    8020714a:	1184a783          	lw	a5,280(s1)
    8020714e:	37fd                	addiw	a5,a5,-1
    80207150:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    80207154:	0001d517          	auipc	a0,0x1d
    80207158:	e3c50513          	addi	a0,a0,-452 # 80223f90 <ecache>
    8020715c:	ffff9097          	auipc	ra,0xffff9
    80207160:	5be080e7          	jalr	1470(ra) # 8020071a <release>
}
    80207164:	60e2                	ld	ra,24(sp)
    80207166:	6442                	ld	s0,16(sp)
    80207168:	64a2                	ld	s1,8(sp)
    8020716a:	6902                	ld	s2,0(sp)
    8020716c:	6105                	addi	sp,sp,32
    8020716e:	8082                	ret
        acquiresleep(&entry->lock);
    80207170:	13848913          	addi	s2,s1,312
    80207174:	854a                	mv	a0,s2
    80207176:	ffffd097          	auipc	ra,0xffffd
    8020717a:	c08080e7          	jalr	-1016(ra) # 80203d7e <acquiresleep>
        entry->next->prev = entry->prev;
    8020717e:	1284b703          	ld	a4,296(s1)
    80207182:	1304b783          	ld	a5,304(s1)
    80207186:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    8020718a:	1284b703          	ld	a4,296(s1)
    8020718e:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    80207192:	0001d797          	auipc	a5,0x1d
    80207196:	c6678793          	addi	a5,a5,-922 # 80223df8 <fat>
    8020719a:	1507b703          	ld	a4,336(a5)
    8020719e:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    802071a2:	0001d697          	auipc	a3,0x1d
    802071a6:	c7e68693          	addi	a3,a3,-898 # 80223e20 <root>
    802071aa:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    802071ae:	12973823          	sd	s1,304(a4)
        root.next = entry;
    802071b2:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    802071b6:	0001d517          	auipc	a0,0x1d
    802071ba:	dda50513          	addi	a0,a0,-550 # 80223f90 <ecache>
    802071be:	ffff9097          	auipc	ra,0xffff9
    802071c2:	55c080e7          	jalr	1372(ra) # 8020071a <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    802071c6:	11649703          	lh	a4,278(s1)
    802071ca:	57fd                	li	a5,-1
    802071cc:	06f70863          	beq	a4,a5,8020723c <eput+0x12c>
            elock(entry->parent);
    802071d0:	1204b503          	ld	a0,288(s1)
    802071d4:	00000097          	auipc	ra,0x0
    802071d8:	eb8080e7          	jalr	-328(ra) # 8020708c <elock>
            eupdate(entry);
    802071dc:	8526                	mv	a0,s1
    802071de:	00000097          	auipc	ra,0x0
    802071e2:	c94080e7          	jalr	-876(ra) # 80206e72 <eupdate>
            eunlock(entry->parent);
    802071e6:	1204b503          	ld	a0,288(s1)
    802071ea:	00000097          	auipc	ra,0x0
    802071ee:	ed8080e7          	jalr	-296(ra) # 802070c2 <eunlock>
        releasesleep(&entry->lock);
    802071f2:	854a                	mv	a0,s2
    802071f4:	ffffd097          	auipc	ra,0xffffd
    802071f8:	be0080e7          	jalr	-1056(ra) # 80203dd4 <releasesleep>
        struct dirent *eparent = entry->parent;
    802071fc:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80207200:	0001d517          	auipc	a0,0x1d
    80207204:	d9050513          	addi	a0,a0,-624 # 80223f90 <ecache>
    80207208:	ffff9097          	auipc	ra,0xffff9
    8020720c:	4be080e7          	jalr	1214(ra) # 802006c6 <acquire>
        entry->ref--;
    80207210:	1184a783          	lw	a5,280(s1)
    80207214:	37fd                	addiw	a5,a5,-1
    80207216:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    8020721a:	0001d517          	auipc	a0,0x1d
    8020721e:	d7650513          	addi	a0,a0,-650 # 80223f90 <ecache>
    80207222:	ffff9097          	auipc	ra,0xffff9
    80207226:	4f8080e7          	jalr	1272(ra) # 8020071a <release>
        if (entry->ref == 0) {
    8020722a:	1184a783          	lw	a5,280(s1)
    8020722e:	fb9d                	bnez	a5,80207164 <eput+0x54>
            eput(eparent);
    80207230:	854a                	mv	a0,s2
    80207232:	00000097          	auipc	ra,0x0
    80207236:	ede080e7          	jalr	-290(ra) # 80207110 <eput>
    8020723a:	b72d                	j	80207164 <eput+0x54>
            etrunc(entry);
    8020723c:	8526                	mv	a0,s1
    8020723e:	00000097          	auipc	ra,0x0
    80207242:	de4080e7          	jalr	-540(ra) # 80207022 <etrunc>
    80207246:	b775                	j	802071f2 <eput+0xe2>

0000000080207248 <estat>:
{
    80207248:	1101                	addi	sp,sp,-32
    8020724a:	ec06                	sd	ra,24(sp)
    8020724c:	e822                	sd	s0,16(sp)
    8020724e:	e426                	sd	s1,8(sp)
    80207250:	e04a                	sd	s2,0(sp)
    80207252:	1000                	addi	s0,sp,32
    80207254:	892a                	mv	s2,a0
    80207256:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    80207258:	02000613          	li	a2,32
    8020725c:	85aa                	mv	a1,a0
    8020725e:	8526                	mv	a0,s1
    80207260:	ffff9097          	auipc	ra,0xffff9
    80207264:	616080e7          	jalr	1558(ra) # 80200876 <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    80207268:	10094783          	lbu	a5,256(s2)
    8020726c:	8bc1                	andi	a5,a5,16
    8020726e:	0017b793          	seqz	a5,a5
    80207272:	0785                	addi	a5,a5,1
    80207274:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    80207278:	11494783          	lbu	a5,276(s2)
    8020727c:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    8020727e:	10896783          	lwu	a5,264(s2)
    80207282:	f89c                	sd	a5,48(s1)
}
    80207284:	60e2                	ld	ra,24(sp)
    80207286:	6442                	ld	s0,16(sp)
    80207288:	64a2                	ld	s1,8(sp)
    8020728a:	6902                	ld	s2,0(sp)
    8020728c:	6105                	addi	sp,sp,32
    8020728e:	8082                	ret

0000000080207290 <enext>:
{
    80207290:	7119                	addi	sp,sp,-128
    80207292:	fc86                	sd	ra,120(sp)
    80207294:	f8a2                	sd	s0,112(sp)
    80207296:	f4a6                	sd	s1,104(sp)
    80207298:	f0ca                	sd	s2,96(sp)
    8020729a:	ecce                	sd	s3,88(sp)
    8020729c:	e8d2                	sd	s4,80(sp)
    8020729e:	e4d6                	sd	s5,72(sp)
    802072a0:	e0da                	sd	s6,64(sp)
    802072a2:	fc5e                	sd	s7,56(sp)
    802072a4:	f862                	sd	s8,48(sp)
    802072a6:	f466                	sd	s9,40(sp)
    802072a8:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    802072aa:	10054783          	lbu	a5,256(a0)
    802072ae:	8bc1                	andi	a5,a5,16
    802072b0:	cf95                	beqz	a5,802072ec <enext+0x5c>
    802072b2:	892a                	mv	s2,a0
    802072b4:	89ae                	mv	s3,a1
    802072b6:	84b2                	mv	s1,a2
    802072b8:	8ab6                	mv	s5,a3
    if (ep->valid)
    802072ba:	11659783          	lh	a5,278(a1)
    802072be:	ef9d                	bnez	a5,802072fc <enext+0x6c>
    if (off % 32)
    802072c0:	01f67793          	andi	a5,a2,31
    802072c4:	e7a1                	bnez	a5,8020730c <enext+0x7c>
    if (dp->valid != 1) { return -1; }
    802072c6:	11651703          	lh	a4,278(a0)
    802072ca:	4785                	li	a5,1
    802072cc:	557d                	li	a0,-1
    802072ce:	04f70763          	beq	a4,a5,8020731c <enext+0x8c>
}
    802072d2:	70e6                	ld	ra,120(sp)
    802072d4:	7446                	ld	s0,112(sp)
    802072d6:	74a6                	ld	s1,104(sp)
    802072d8:	7906                	ld	s2,96(sp)
    802072da:	69e6                	ld	s3,88(sp)
    802072dc:	6a46                	ld	s4,80(sp)
    802072de:	6aa6                	ld	s5,72(sp)
    802072e0:	6b06                	ld	s6,64(sp)
    802072e2:	7be2                	ld	s7,56(sp)
    802072e4:	7c42                	ld	s8,48(sp)
    802072e6:	7ca2                	ld	s9,40(sp)
    802072e8:	6109                	addi	sp,sp,128
    802072ea:	8082                	ret
        panic("enext not dir");
    802072ec:	00004517          	auipc	a0,0x4
    802072f0:	cc450513          	addi	a0,a0,-828 # 8020afb0 <digits+0xc30>
    802072f4:	ffff9097          	auipc	ra,0xffff9
    802072f8:	e50080e7          	jalr	-432(ra) # 80200144 <panic>
        panic("enext ep valid");
    802072fc:	00004517          	auipc	a0,0x4
    80207300:	cc450513          	addi	a0,a0,-828 # 8020afc0 <digits+0xc40>
    80207304:	ffff9097          	auipc	ra,0xffff9
    80207308:	e40080e7          	jalr	-448(ra) # 80200144 <panic>
        panic("enext not align");
    8020730c:	00004517          	auipc	a0,0x4
    80207310:	cc450513          	addi	a0,a0,-828 # 8020afd0 <digits+0xc50>
    80207314:	ffff9097          	auipc	ra,0xffff9
    80207318:	e30080e7          	jalr	-464(ra) # 80200144 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    8020731c:	10000613          	li	a2,256
    80207320:	4581                	li	a1,0
    80207322:	854e                	mv	a0,s3
    80207324:	ffff9097          	auipc	ra,0xffff9
    80207328:	43e080e7          	jalr	1086(ra) # 80200762 <memset>
    int cnt = 0;
    8020732c:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    8020732e:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80207330:	f8040a13          	addi	s4,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    80207334:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    80207338:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    8020733a:	a03d                	j	80207368 <enext+0xd8>
            cnt++;
    8020733c:	2b05                	addiw	s6,s6,1
            continue;
    8020733e:	a01d                	j	80207364 <enext+0xd4>
            *count = cnt;
    80207340:	016aa023          	sw	s6,0(s5)
            return 0;
    80207344:	4501                	li	a0,0
    80207346:	b771                	j	802072d2 <enext+0x42>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    80207348:	fff7079b          	addiw	a5,a4,-1
    8020734c:	0017951b          	slliw	a0,a5,0x1
    80207350:	9d3d                	addw	a0,a0,a5
    80207352:	0025151b          	slliw	a0,a0,0x2
    80207356:	9d3d                	addw	a0,a0,a5
    80207358:	85d2                	mv	a1,s4
    8020735a:	954e                	add	a0,a0,s3
    8020735c:	fffff097          	auipc	ra,0xfffff
    80207360:	17a080e7          	jalr	378(ra) # 802064d6 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80207364:	0204849b          	addiw	s1,s1,32
    80207368:	4601                	li	a2,0
    8020736a:	85a6                	mv	a1,s1
    8020736c:	854a                	mv	a0,s2
    8020736e:	fffff097          	auipc	ra,0xfffff
    80207372:	e06080e7          	jalr	-506(ra) # 80206174 <reloc_clus>
    80207376:	f5750ee3          	beq	a0,s7,802072d2 <enext+0x42>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    8020737a:	02000793          	li	a5,32
    8020737e:	0005071b          	sext.w	a4,a0
    80207382:	86d2                	mv	a3,s4
    80207384:	4601                	li	a2,0
    80207386:	4581                	li	a1,0
    80207388:	10c92503          	lw	a0,268(s2)
    8020738c:	fffff097          	auipc	ra,0xfffff
    80207390:	ef0080e7          	jalr	-272(ra) # 8020627c <rw_clus>
    80207394:	2501                	sext.w	a0,a0
    80207396:	02000793          	li	a5,32
    8020739a:	06f51c63          	bne	a0,a5,80207412 <enext+0x182>
    8020739e:	f8044783          	lbu	a5,-128(s0)
    802073a2:	cbb5                	beqz	a5,80207416 <enext+0x186>
        if (de.lne.order == EMPTY_ENTRY) {
    802073a4:	f9878ce3          	beq	a5,s8,8020733c <enext+0xac>
        } else if (cnt) {
    802073a8:	f80b1ce3          	bnez	s6,80207340 <enext+0xb0>
        if (de.lne.attr == ATTR_LONG_NAME) {
    802073ac:	f8b44703          	lbu	a4,-117(s0)
    802073b0:	01971d63          	bne	a4,s9,802073ca <enext+0x13a>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    802073b4:	0bf7f713          	andi	a4,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    802073b8:	0407f793          	andi	a5,a5,64
    802073bc:	d7d1                	beqz	a5,80207348 <enext+0xb8>
                *count = lcnt + 1;                              // plus the s-n-e;
    802073be:	0017079b          	addiw	a5,a4,1
    802073c2:	00faa023          	sw	a5,0(s5)
                count = 0;
    802073c6:	4a81                	li	s5,0
    802073c8:	b741                	j	80207348 <enext+0xb8>
            if (count) {
    802073ca:	000a8c63          	beqz	s5,802073e2 <enext+0x152>
                *count = 1;
    802073ce:	4785                	li	a5,1
    802073d0:	00faa023          	sw	a5,0(s5)
                read_entry_name(ep->filename, &de);
    802073d4:	f8040593          	addi	a1,s0,-128
    802073d8:	854e                	mv	a0,s3
    802073da:	fffff097          	auipc	ra,0xfffff
    802073de:	0fc080e7          	jalr	252(ra) # 802064d6 <read_entry_name>
    entry->attribute = d->sne.attr;
    802073e2:	f8b44783          	lbu	a5,-117(s0)
    802073e6:	10f98023          	sb	a5,256(s3)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    802073ea:	f9445783          	lhu	a5,-108(s0)
    802073ee:	0107979b          	slliw	a5,a5,0x10
    802073f2:	f9a45703          	lhu	a4,-102(s0)
    802073f6:	8fd9                	or	a5,a5,a4
    802073f8:	2781                	sext.w	a5,a5
    802073fa:	10f9a223          	sw	a5,260(s3)
    entry->file_size = d->sne.file_size;
    802073fe:	f9c42703          	lw	a4,-100(s0)
    80207402:	10e9a423          	sw	a4,264(s3)
    entry->cur_clus = entry->first_clus;
    80207406:	10f9a623          	sw	a5,268(s3)
    entry->clus_cnt = 0;
    8020740a:	1009a823          	sw	zero,272(s3)
            return 1;
    8020740e:	4505                	li	a0,1
}
    80207410:	b5c9                	j	802072d2 <enext+0x42>
            return -1;
    80207412:	557d                	li	a0,-1
    80207414:	bd7d                	j	802072d2 <enext+0x42>
    80207416:	557d                	li	a0,-1
    80207418:	bd6d                	j	802072d2 <enext+0x42>

000000008020741a <dirlookup>:
{
    8020741a:	711d                	addi	sp,sp,-96
    8020741c:	ec86                	sd	ra,88(sp)
    8020741e:	e8a2                	sd	s0,80(sp)
    80207420:	e4a6                	sd	s1,72(sp)
    80207422:	e0ca                	sd	s2,64(sp)
    80207424:	fc4e                	sd	s3,56(sp)
    80207426:	f852                	sd	s4,48(sp)
    80207428:	f456                	sd	s5,40(sp)
    8020742a:	f05a                	sd	s6,32(sp)
    8020742c:	ec5e                	sd	s7,24(sp)
    8020742e:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    80207430:	10054783          	lbu	a5,256(a0)
    80207434:	8bc1                	andi	a5,a5,16
    80207436:	cbb1                	beqz	a5,8020748a <dirlookup+0x70>
    80207438:	84aa                	mv	s1,a0
    8020743a:	89ae                	mv	s3,a1
    8020743c:	8ab2                	mv	s5,a2
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    8020743e:	0ff00613          	li	a2,255
    80207442:	00004597          	auipc	a1,0x4
    80207446:	bb658593          	addi	a1,a1,-1098 # 8020aff8 <digits+0xc78>
    8020744a:	854e                	mv	a0,s3
    8020744c:	ffff9097          	auipc	ra,0xffff9
    80207450:	3ee080e7          	jalr	1006(ra) # 8020083a <strncmp>
    80207454:	c139                	beqz	a0,8020749a <dirlookup+0x80>
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    80207456:	0ff00613          	li	a2,255
    8020745a:	00004597          	auipc	a1,0x4
    8020745e:	ba658593          	addi	a1,a1,-1114 # 8020b000 <digits+0xc80>
    80207462:	854e                	mv	a0,s3
    80207464:	ffff9097          	auipc	ra,0xffff9
    80207468:	3d6080e7          	jalr	982(ra) # 8020083a <strncmp>
    8020746c:	e125                	bnez	a0,802074cc <dirlookup+0xb2>
        if (dp == &root) {
    8020746e:	0001d797          	auipc	a5,0x1d
    80207472:	9b278793          	addi	a5,a5,-1614 # 80223e20 <root>
    80207476:	04f48463          	beq	s1,a5,802074be <dirlookup+0xa4>
        return edup(dp->parent);
    8020747a:	1204b503          	ld	a0,288(s1)
    8020747e:	00000097          	auipc	ra,0x0
    80207482:	9b0080e7          	jalr	-1616(ra) # 80206e2e <edup>
    80207486:	892a                	mv	s2,a0
    80207488:	a839                	j	802074a6 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    8020748a:	00004517          	auipc	a0,0x4
    8020748e:	b5650513          	addi	a0,a0,-1194 # 8020afe0 <digits+0xc60>
    80207492:	ffff9097          	auipc	ra,0xffff9
    80207496:	cb2080e7          	jalr	-846(ra) # 80200144 <panic>
        return edup(dp);
    8020749a:	8526                	mv	a0,s1
    8020749c:	00000097          	auipc	ra,0x0
    802074a0:	992080e7          	jalr	-1646(ra) # 80206e2e <edup>
    802074a4:	892a                	mv	s2,a0
}
    802074a6:	854a                	mv	a0,s2
    802074a8:	60e6                	ld	ra,88(sp)
    802074aa:	6446                	ld	s0,80(sp)
    802074ac:	64a6                	ld	s1,72(sp)
    802074ae:	6906                	ld	s2,64(sp)
    802074b0:	79e2                	ld	s3,56(sp)
    802074b2:	7a42                	ld	s4,48(sp)
    802074b4:	7aa2                	ld	s5,40(sp)
    802074b6:	7b02                	ld	s6,32(sp)
    802074b8:	6be2                	ld	s7,24(sp)
    802074ba:	6125                	addi	sp,sp,96
    802074bc:	8082                	ret
            return edup(&root);
    802074be:	853e                	mv	a0,a5
    802074c0:	00000097          	auipc	ra,0x0
    802074c4:	96e080e7          	jalr	-1682(ra) # 80206e2e <edup>
    802074c8:	892a                	mv	s2,a0
    802074ca:	bff1                	j	802074a6 <dirlookup+0x8c>
    if (dp->valid != 1) {
    802074cc:	11649703          	lh	a4,278(s1)
    802074d0:	4785                	li	a5,1
        return NULL;
    802074d2:	4901                	li	s2,0
    if (dp->valid != 1) {
    802074d4:	fcf719e3          	bne	a4,a5,802074a6 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    802074d8:	85ce                	mv	a1,s3
    802074da:	8526                	mv	a0,s1
    802074dc:	fffff097          	auipc	ra,0xfffff
    802074e0:	eec080e7          	jalr	-276(ra) # 802063c8 <eget>
    802074e4:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    802074e6:	11651703          	lh	a4,278(a0)
    802074ea:	4785                	li	a5,1
    802074ec:	faf70de3          	beq	a4,a5,802074a6 <dirlookup+0x8c>
    int len = strlen(filename);
    802074f0:	854e                	mv	a0,s3
    802074f2:	ffff9097          	auipc	ra,0xffff9
    802074f6:	3f4080e7          	jalr	1012(ra) # 802008e6 <strlen>
    int count = 0;
    802074fa:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    802074fe:	4601                	li	a2,0
    80207500:	4581                	li	a1,0
    80207502:	8526                	mv	a0,s1
    80207504:	fffff097          	auipc	ra,0xfffff
    80207508:	c70080e7          	jalr	-912(ra) # 80206174 <reloc_clus>
    uint off = 0;
    8020750c:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    8020750e:	fac40b93          	addi	s7,s0,-84
    80207512:	5b7d                	li	s6,-1
    80207514:	86de                	mv	a3,s7
    80207516:	8652                	mv	a2,s4
    80207518:	85ca                	mv	a1,s2
    8020751a:	8526                	mv	a0,s1
    8020751c:	00000097          	auipc	ra,0x0
    80207520:	d74080e7          	jalr	-652(ra) # 80207290 <enext>
    80207524:	03650f63          	beq	a0,s6,80207562 <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    80207528:	0ff00613          	li	a2,255
    8020752c:	85ca                	mv	a1,s2
    8020752e:	854e                	mv	a0,s3
    80207530:	ffff9097          	auipc	ra,0xffff9
    80207534:	30a080e7          	jalr	778(ra) # 8020083a <strncmp>
    80207538:	c901                	beqz	a0,80207548 <dirlookup+0x12e>
        off += count << 5;
    8020753a:	fac42783          	lw	a5,-84(s0)
    8020753e:	0057979b          	slliw	a5,a5,0x5
    80207542:	01478a3b          	addw	s4,a5,s4
    80207546:	b7f9                	j	80207514 <dirlookup+0xfa>
            ep->parent = edup(dp);
    80207548:	8526                	mv	a0,s1
    8020754a:	00000097          	auipc	ra,0x0
    8020754e:	8e4080e7          	jalr	-1820(ra) # 80206e2e <edup>
    80207552:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    80207556:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    8020755a:	4785                	li	a5,1
    8020755c:	10f91b23          	sh	a5,278(s2)
            return ep;
    80207560:	b799                	j	802074a6 <dirlookup+0x8c>
    if (poff) {
    80207562:	000a8463          	beqz	s5,8020756a <dirlookup+0x150>
        *poff = off;
    80207566:	014aa023          	sw	s4,0(s5)
    eput(ep);
    8020756a:	854a                	mv	a0,s2
    8020756c:	00000097          	auipc	ra,0x0
    80207570:	ba4080e7          	jalr	-1116(ra) # 80207110 <eput>
    return NULL;
    80207574:	4901                	li	s2,0
    80207576:	bf05                	j	802074a6 <dirlookup+0x8c>

0000000080207578 <ealloc>:
{
    80207578:	715d                	addi	sp,sp,-80
    8020757a:	e486                	sd	ra,72(sp)
    8020757c:	e0a2                	sd	s0,64(sp)
    8020757e:	fc26                	sd	s1,56(sp)
    80207580:	f84a                	sd	s2,48(sp)
    80207582:	f44e                	sd	s3,40(sp)
    80207584:	f052                	sd	s4,32(sp)
    80207586:	ec56                	sd	s5,24(sp)
    80207588:	0880                	addi	s0,sp,80
    8020758a:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    8020758c:	10054783          	lbu	a5,256(a0)
    80207590:	8bc1                	andi	a5,a5,16
    80207592:	c7b1                	beqz	a5,802075de <ealloc+0x66>
    80207594:	852e                	mv	a0,a1
    80207596:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80207598:	11691703          	lh	a4,278(s2)
    8020759c:	4785                	li	a5,1
        return NULL;
    8020759e:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    802075a0:	02f71563          	bne	a4,a5,802075ca <ealloc+0x52>
    802075a4:	fffff097          	auipc	ra,0xfffff
    802075a8:	408080e7          	jalr	1032(ra) # 802069ac <formatname>
    802075ac:	89aa                	mv	s3,a0
    802075ae:	10050663          	beqz	a0,802076ba <ealloc+0x142>
    uint off = 0;
    802075b2:	fa042e23          	sw	zero,-68(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    802075b6:	fbc40613          	addi	a2,s0,-68
    802075ba:	85aa                	mv	a1,a0
    802075bc:	854a                	mv	a0,s2
    802075be:	00000097          	auipc	ra,0x0
    802075c2:	e5c080e7          	jalr	-420(ra) # 8020741a <dirlookup>
    802075c6:	84aa                	mv	s1,a0
    802075c8:	c11d                	beqz	a0,802075ee <ealloc+0x76>
}
    802075ca:	8526                	mv	a0,s1
    802075cc:	60a6                	ld	ra,72(sp)
    802075ce:	6406                	ld	s0,64(sp)
    802075d0:	74e2                	ld	s1,56(sp)
    802075d2:	7942                	ld	s2,48(sp)
    802075d4:	79a2                	ld	s3,40(sp)
    802075d6:	7a02                	ld	s4,32(sp)
    802075d8:	6ae2                	ld	s5,24(sp)
    802075da:	6161                	addi	sp,sp,80
    802075dc:	8082                	ret
        panic("ealloc not dir");
    802075de:	00004517          	auipc	a0,0x4
    802075e2:	a2a50513          	addi	a0,a0,-1494 # 8020b008 <digits+0xc88>
    802075e6:	ffff9097          	auipc	ra,0xffff9
    802075ea:	b5e080e7          	jalr	-1186(ra) # 80200144 <panic>
    ep = eget(dp, name);
    802075ee:	85ce                	mv	a1,s3
    802075f0:	854a                	mv	a0,s2
    802075f2:	fffff097          	auipc	ra,0xfffff
    802075f6:	dd6080e7          	jalr	-554(ra) # 802063c8 <eget>
    802075fa:	84aa                	mv	s1,a0
    elock(ep);
    802075fc:	00000097          	auipc	ra,0x0
    80207600:	a90080e7          	jalr	-1392(ra) # 8020708c <elock>
    ep->attribute = attr;
    80207604:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    80207608:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    8020760c:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    80207610:	854a                	mv	a0,s2
    80207612:	00000097          	auipc	ra,0x0
    80207616:	81c080e7          	jalr	-2020(ra) # 80206e2e <edup>
    8020761a:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    8020761e:	fbc42a83          	lw	s5,-68(s0)
    80207622:	1154ae23          	sw	s5,284(s1)
    ep->clus_cnt = 0;
    80207626:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    8020762a:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    8020762e:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    80207632:	0ff00613          	li	a2,255
    80207636:	85ce                	mv	a1,s3
    80207638:	8526                	mv	a0,s1
    8020763a:	ffff9097          	auipc	ra,0xffff9
    8020763e:	23c080e7          	jalr	572(ra) # 80200876 <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    80207642:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    80207646:	47c1                	li	a5,16
    80207648:	02fa0863          	beq	s4,a5,80207678 <ealloc+0x100>
        ep->attribute |= ATTR_ARCHIVE;
    8020764c:	1004c783          	lbu	a5,256(s1)
    80207650:	0207e793          	ori	a5,a5,32
    80207654:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    80207658:	8656                	mv	a2,s5
    8020765a:	85a6                	mv	a1,s1
    8020765c:	854a                	mv	a0,s2
    8020765e:	fffff097          	auipc	ra,0xfffff
    80207662:	406080e7          	jalr	1030(ra) # 80206a64 <emake>
    ep->valid = 1;
    80207666:	4785                	li	a5,1
    80207668:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    8020766c:	8526                	mv	a0,s1
    8020766e:	00000097          	auipc	ra,0x0
    80207672:	a54080e7          	jalr	-1452(ra) # 802070c2 <eunlock>
    return ep;
    80207676:	bf91                	j	802075ca <ealloc+0x52>
        ep->attribute |= ATTR_DIRECTORY;
    80207678:	1004c783          	lbu	a5,256(s1)
    8020767c:	0107e793          	ori	a5,a5,16
    80207680:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    80207684:	11494503          	lbu	a0,276(s2)
    80207688:	fffff097          	auipc	ra,0xfffff
    8020768c:	92a080e7          	jalr	-1750(ra) # 80205fb2 <alloc_clus>
    80207690:	2501                	sext.w	a0,a0
    80207692:	10a4a223          	sw	a0,260(s1)
    80207696:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    8020769a:	4601                	li	a2,0
    8020769c:	85a6                	mv	a1,s1
    8020769e:	8526                	mv	a0,s1
    802076a0:	fffff097          	auipc	ra,0xfffff
    802076a4:	3c4080e7          	jalr	964(ra) # 80206a64 <emake>
        emake(ep, dp, 32);
    802076a8:	02000613          	li	a2,32
    802076ac:	85ca                	mv	a1,s2
    802076ae:	8526                	mv	a0,s1
    802076b0:	fffff097          	auipc	ra,0xfffff
    802076b4:	3b4080e7          	jalr	948(ra) # 80206a64 <emake>
    802076b8:	b745                	j	80207658 <ealloc+0xe0>
        return NULL;
    802076ba:	84aa                	mv	s1,a0
    802076bc:	b739                	j	802075ca <ealloc+0x52>

00000000802076be <lookup_path>:
}


// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    802076be:	7139                	addi	sp,sp,-64
    802076c0:	fc06                	sd	ra,56(sp)
    802076c2:	f822                	sd	s0,48(sp)
    802076c4:	f426                	sd	s1,40(sp)
    802076c6:	f04a                	sd	s2,32(sp)
    802076c8:	ec4e                	sd	s3,24(sp)
    802076ca:	e852                	sd	s4,16(sp)
    802076cc:	e456                	sd	s5,8(sp)
    802076ce:	0080                	addi	s0,sp,64
    802076d0:	892a                	mv	s2,a0
    802076d2:	8aae                	mv	s5,a1
    802076d4:	8a32                	mv	s4,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    802076d6:	00054783          	lbu	a5,0(a0)
    802076da:	02f00713          	li	a4,47
    802076de:	00e78f63          	beq	a5,a4,802076fc <lookup_path+0x3e>
        entry = edup(&root);
    } else if (*path != '\0') {
    802076e2:	c79d                	beqz	a5,80207710 <lookup_path+0x52>
        entry = edup(myproc()->cwd);
    802076e4:	ffffa097          	auipc	ra,0xffffa
    802076e8:	3d2080e7          	jalr	978(ra) # 80201ab6 <myproc>
    802076ec:	15853503          	ld	a0,344(a0)
    802076f0:	fffff097          	auipc	ra,0xfffff
    802076f4:	73e080e7          	jalr	1854(ra) # 80206e2e <edup>
    802076f8:	84aa                	mv	s1,a0
    802076fa:	a071                	j	80207786 <lookup_path+0xc8>
        entry = edup(&root);
    802076fc:	0001c517          	auipc	a0,0x1c
    80207700:	72450513          	addi	a0,a0,1828 # 80223e20 <root>
    80207704:	fffff097          	auipc	ra,0xfffff
    80207708:	72a080e7          	jalr	1834(ra) # 80206e2e <edup>
    8020770c:	84aa                	mv	s1,a0
    8020770e:	a8a5                	j	80207786 <lookup_path+0xc8>
    } else {
        printf("ERROR:LOOKUP_PATH:    NAME?\n");
    80207710:	00004517          	auipc	a0,0x4
    80207714:	90850513          	addi	a0,a0,-1784 # 8020b018 <digits+0xc98>
    80207718:	ffff9097          	auipc	ra,0xffff9
    8020771c:	a76080e7          	jalr	-1418(ra) # 8020018e <printf>
        return NULL;
    80207720:	4481                	li	s1,0
    80207722:	a025                	j	8020774a <lookup_path+0x8c>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    80207724:	8526                	mv	a0,s1
    80207726:	00000097          	auipc	ra,0x0
    8020772a:	99c080e7          	jalr	-1636(ra) # 802070c2 <eunlock>
            eput(entry);
    8020772e:	8526                	mv	a0,s1
    80207730:	00000097          	auipc	ra,0x0
    80207734:	9e0080e7          	jalr	-1568(ra) # 80207110 <eput>
            printf("ERROR:LOOKUP_PATH:    attribute\n");
    80207738:	00004517          	auipc	a0,0x4
    8020773c:	90050513          	addi	a0,a0,-1792 # 8020b038 <digits+0xcb8>
    80207740:	ffff9097          	auipc	ra,0xffff9
    80207744:	a4e080e7          	jalr	-1458(ra) # 8020018e <printf>
            return NULL;
    80207748:	4481                	li	s1,0
        printf("ERROR:LOOKUP_PATH:    Parent\n");
        eput(entry);
        return NULL;
    }
    return entry;
}
    8020774a:	8526                	mv	a0,s1
    8020774c:	70e2                	ld	ra,56(sp)
    8020774e:	7442                	ld	s0,48(sp)
    80207750:	74a2                	ld	s1,40(sp)
    80207752:	7902                	ld	s2,32(sp)
    80207754:	69e2                	ld	s3,24(sp)
    80207756:	6a42                	ld	s4,16(sp)
    80207758:	6aa2                	ld	s5,8(sp)
    8020775a:	6121                	addi	sp,sp,64
    8020775c:	8082                	ret
        if ((next = dirlookup(entry, name, 0)) == 0) {///////////???????????
    8020775e:	4601                	li	a2,0
    80207760:	85d2                	mv	a1,s4
    80207762:	8526                	mv	a0,s1
    80207764:	00000097          	auipc	ra,0x0
    80207768:	cb6080e7          	jalr	-842(ra) # 8020741a <dirlookup>
    8020776c:	89aa                	mv	s3,a0
    8020776e:	c921                	beqz	a0,802077be <lookup_path+0x100>
        eunlock(entry);
    80207770:	8526                	mv	a0,s1
    80207772:	00000097          	auipc	ra,0x0
    80207776:	950080e7          	jalr	-1712(ra) # 802070c2 <eunlock>
        eput(entry);
    8020777a:	8526                	mv	a0,s1
    8020777c:	00000097          	auipc	ra,0x0
    80207780:	994080e7          	jalr	-1644(ra) # 80207110 <eput>
        entry = next;
    80207784:	84ce                	mv	s1,s3
    while ((path = skipelem(path, name)) != 0) {
    80207786:	85d2                	mv	a1,s4
    80207788:	854a                	mv	a0,s2
    8020778a:	ffffe097          	auipc	ra,0xffffe
    8020778e:	724080e7          	jalr	1828(ra) # 80205eae <skipelem>
    80207792:	892a                	mv	s2,a0
    80207794:	c929                	beqz	a0,802077e6 <lookup_path+0x128>
        elock(entry);
    80207796:	8526                	mv	a0,s1
    80207798:	00000097          	auipc	ra,0x0
    8020779c:	8f4080e7          	jalr	-1804(ra) # 8020708c <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    802077a0:	1004c783          	lbu	a5,256(s1)
    802077a4:	8bc1                	andi	a5,a5,16
    802077a6:	dfbd                	beqz	a5,80207724 <lookup_path+0x66>
        if (parent && *path == '\0') {
    802077a8:	fa0a8be3          	beqz	s5,8020775e <lookup_path+0xa0>
    802077ac:	00094783          	lbu	a5,0(s2)
    802077b0:	f7dd                	bnez	a5,8020775e <lookup_path+0xa0>
            eunlock(entry);
    802077b2:	8526                	mv	a0,s1
    802077b4:	00000097          	auipc	ra,0x0
    802077b8:	90e080e7          	jalr	-1778(ra) # 802070c2 <eunlock>
            return entry;
    802077bc:	b779                	j	8020774a <lookup_path+0x8c>
            eunlock(entry);
    802077be:	8526                	mv	a0,s1
    802077c0:	00000097          	auipc	ra,0x0
    802077c4:	902080e7          	jalr	-1790(ra) # 802070c2 <eunlock>
            eput(entry);
    802077c8:	8526                	mv	a0,s1
    802077ca:	00000097          	auipc	ra,0x0
    802077ce:	946080e7          	jalr	-1722(ra) # 80207110 <eput>
            printf("ERROR:LOOKUP_PATH:    next=0\n");
    802077d2:	00004517          	auipc	a0,0x4
    802077d6:	88e50513          	addi	a0,a0,-1906 # 8020b060 <digits+0xce0>
    802077da:	ffff9097          	auipc	ra,0xffff9
    802077de:	9b4080e7          	jalr	-1612(ra) # 8020018e <printf>
            return NULL;
    802077e2:	84ce                	mv	s1,s3
    802077e4:	b79d                	j	8020774a <lookup_path+0x8c>
    if (parent) {
    802077e6:	f60a82e3          	beqz	s5,8020774a <lookup_path+0x8c>
        printf("ERROR:LOOKUP_PATH:    Parent\n");
    802077ea:	00004517          	auipc	a0,0x4
    802077ee:	89650513          	addi	a0,a0,-1898 # 8020b080 <digits+0xd00>
    802077f2:	ffff9097          	auipc	ra,0xffff9
    802077f6:	99c080e7          	jalr	-1636(ra) # 8020018e <printf>
        eput(entry);
    802077fa:	8526                	mv	a0,s1
    802077fc:	00000097          	auipc	ra,0x0
    80207800:	914080e7          	jalr	-1772(ra) # 80207110 <eput>
        return NULL;
    80207804:	84ca                	mv	s1,s2
    80207806:	b791                	j	8020774a <lookup_path+0x8c>

0000000080207808 <abs_lookup_path>:
{
    80207808:	7139                	addi	sp,sp,-64
    8020780a:	fc06                	sd	ra,56(sp)
    8020780c:	f822                	sd	s0,48(sp)
    8020780e:	f426                	sd	s1,40(sp)
    80207810:	f04a                	sd	s2,32(sp)
    80207812:	ec4e                	sd	s3,24(sp)
    80207814:	e852                	sd	s4,16(sp)
    80207816:	e456                	sd	s5,8(sp)
    80207818:	0080                	addi	s0,sp,64
    8020781a:	892e                	mv	s2,a1
    8020781c:	8ab2                	mv	s5,a2
    8020781e:	8a36                	mv	s4,a3
    entry = edup(env);
    80207820:	fffff097          	auipc	ra,0xfffff
    80207824:	60e080e7          	jalr	1550(ra) # 80206e2e <edup>
    80207828:	84aa                	mv	s1,a0
    while ((path = skipelem(path, name)) != 0) {
    8020782a:	a891                	j	8020787e <abs_lookup_path+0x76>
            eunlock(entry);
    8020782c:	8526                	mv	a0,s1
    8020782e:	00000097          	auipc	ra,0x0
    80207832:	894080e7          	jalr	-1900(ra) # 802070c2 <eunlock>
            eput(entry);
    80207836:	8526                	mv	a0,s1
    80207838:	00000097          	auipc	ra,0x0
    8020783c:	8d8080e7          	jalr	-1832(ra) # 80207110 <eput>
            return NULL;
    80207840:	4481                	li	s1,0
}
    80207842:	8526                	mv	a0,s1
    80207844:	70e2                	ld	ra,56(sp)
    80207846:	7442                	ld	s0,48(sp)
    80207848:	74a2                	ld	s1,40(sp)
    8020784a:	7902                	ld	s2,32(sp)
    8020784c:	69e2                	ld	s3,24(sp)
    8020784e:	6a42                	ld	s4,16(sp)
    80207850:	6aa2                	ld	s5,8(sp)
    80207852:	6121                	addi	sp,sp,64
    80207854:	8082                	ret
        if ((next = dirlookup(entry, name, 0)) == 0) {
    80207856:	4601                	li	a2,0
    80207858:	85d2                	mv	a1,s4
    8020785a:	8526                	mv	a0,s1
    8020785c:	00000097          	auipc	ra,0x0
    80207860:	bbe080e7          	jalr	-1090(ra) # 8020741a <dirlookup>
    80207864:	89aa                	mv	s3,a0
    80207866:	c921                	beqz	a0,802078b6 <abs_lookup_path+0xae>
        eunlock(entry);
    80207868:	8526                	mv	a0,s1
    8020786a:	00000097          	auipc	ra,0x0
    8020786e:	858080e7          	jalr	-1960(ra) # 802070c2 <eunlock>
        eput(entry);
    80207872:	8526                	mv	a0,s1
    80207874:	00000097          	auipc	ra,0x0
    80207878:	89c080e7          	jalr	-1892(ra) # 80207110 <eput>
        entry = next;
    8020787c:	84ce                	mv	s1,s3
    while ((path = skipelem(path, name)) != 0) {
    8020787e:	85d2                	mv	a1,s4
    80207880:	854a                	mv	a0,s2
    80207882:	ffffe097          	auipc	ra,0xffffe
    80207886:	62c080e7          	jalr	1580(ra) # 80205eae <skipelem>
    8020788a:	892a                	mv	s2,a0
    8020788c:	c129                	beqz	a0,802078ce <abs_lookup_path+0xc6>
        elock(entry);
    8020788e:	8526                	mv	a0,s1
    80207890:	fffff097          	auipc	ra,0xfffff
    80207894:	7fc080e7          	jalr	2044(ra) # 8020708c <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    80207898:	1004c783          	lbu	a5,256(s1)
    8020789c:	8bc1                	andi	a5,a5,16
    8020789e:	d7d9                	beqz	a5,8020782c <abs_lookup_path+0x24>
        if (parent && *path == '\0') {
    802078a0:	fa0a8be3          	beqz	s5,80207856 <abs_lookup_path+0x4e>
    802078a4:	00094783          	lbu	a5,0(s2)
    802078a8:	f7dd                	bnez	a5,80207856 <abs_lookup_path+0x4e>
            eunlock(entry);
    802078aa:	8526                	mv	a0,s1
    802078ac:	00000097          	auipc	ra,0x0
    802078b0:	816080e7          	jalr	-2026(ra) # 802070c2 <eunlock>
            return entry;
    802078b4:	b779                	j	80207842 <abs_lookup_path+0x3a>
            eunlock(entry);
    802078b6:	8526                	mv	a0,s1
    802078b8:	00000097          	auipc	ra,0x0
    802078bc:	80a080e7          	jalr	-2038(ra) # 802070c2 <eunlock>
            eput(entry);
    802078c0:	8526                	mv	a0,s1
    802078c2:	00000097          	auipc	ra,0x0
    802078c6:	84e080e7          	jalr	-1970(ra) # 80207110 <eput>
            return NULL;
    802078ca:	84ce                	mv	s1,s3
    802078cc:	bf9d                	j	80207842 <abs_lookup_path+0x3a>
    if (parent) {
    802078ce:	f60a8ae3          	beqz	s5,80207842 <abs_lookup_path+0x3a>
        eput(entry);
    802078d2:	8526                	mv	a0,s1
    802078d4:	00000097          	auipc	ra,0x0
    802078d8:	83c080e7          	jalr	-1988(ra) # 80207110 <eput>
        return NULL;
    802078dc:	84ca                	mv	s1,s2
    802078de:	b795                	j	80207842 <abs_lookup_path+0x3a>

00000000802078e0 <ename>:

struct dirent *ename(char *path)
{
    802078e0:	716d                	addi	sp,sp,-272
    802078e2:	e606                	sd	ra,264(sp)
    802078e4:	e222                	sd	s0,256(sp)
    802078e6:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    802078e8:	ef040613          	addi	a2,s0,-272
    802078ec:	4581                	li	a1,0
    802078ee:	00000097          	auipc	ra,0x0
    802078f2:	dd0080e7          	jalr	-560(ra) # 802076be <lookup_path>
}
    802078f6:	60b2                	ld	ra,264(sp)
    802078f8:	6412                	ld	s0,256(sp)
    802078fa:	6151                	addi	sp,sp,272
    802078fc:	8082                	ret

00000000802078fe <ename_env>:
struct dirent *ename_env(struct dirent* env,char* path)
{
    802078fe:	716d                	addi	sp,sp,-272
    80207900:	e606                	sd	ra,264(sp)
    80207902:	e222                	sd	s0,256(sp)
    80207904:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return abs_lookup_path(env, path, 0, name); 
    80207906:	ef040693          	addi	a3,s0,-272
    8020790a:	4601                	li	a2,0
    8020790c:	00000097          	auipc	ra,0x0
    80207910:	efc080e7          	jalr	-260(ra) # 80207808 <abs_lookup_path>
}
    80207914:	60b2                	ld	ra,264(sp)
    80207916:	6412                	ld	s0,256(sp)
    80207918:	6151                	addi	sp,sp,272
    8020791a:	8082                	ret

000000008020791c <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    8020791c:	1141                	addi	sp,sp,-16
    8020791e:	e406                	sd	ra,8(sp)
    80207920:	e022                	sd	s0,0(sp)
    80207922:	0800                	addi	s0,sp,16
    80207924:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    80207926:	4585                	li	a1,1
    80207928:	00000097          	auipc	ra,0x0
    8020792c:	d96080e7          	jalr	-618(ra) # 802076be <lookup_path>
}
    80207930:	60a2                	ld	ra,8(sp)
    80207932:	6402                	ld	s0,0(sp)
    80207934:	0141                	addi	sp,sp,16
    80207936:	8082                	ret

0000000080207938 <enameparent_env>:

struct dirent *enameparent_env(struct dirent* env, char* path, char* name)
{
    80207938:	1141                	addi	sp,sp,-16
    8020793a:	e406                	sd	ra,8(sp)
    8020793c:	e022                	sd	s0,0(sp)
    8020793e:	0800                	addi	s0,sp,16
    80207940:	86b2                	mv	a3,a2
    return abs_lookup_path(env, path, 1, name);
    80207942:	4605                	li	a2,1
    80207944:	00000097          	auipc	ra,0x0
    80207948:	ec4080e7          	jalr	-316(ra) # 80207808 <abs_lookup_path>
}
    8020794c:	60a2                	ld	ra,8(sp)
    8020794e:	6402                	ld	s0,0(sp)
    80207950:	0141                	addi	sp,sp,16
    80207952:	8082                	ret

0000000080207954 <paddr>:


uint64 paddr(struct dirent *ep)
{
    80207954:	1141                	addi	sp,sp,-16
    80207956:	e422                	sd	s0,8(sp)
    80207958:	0800                	addi	s0,sp,16
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    8020795a:	0001c697          	auipc	a3,0x1c
    8020795e:	49e68693          	addi	a3,a3,1182 # 80223df8 <fat>
    80207962:	0126c603          	lbu	a2,18(a3)
    uint32 lba = first_sec_of_clus(ep->first_clus);
    uint32 byts_per_clus = fat.bpb.byts_per_sec * fat.bpb.sec_per_clus;
    80207966:	0106d703          	lhu	a4,16(a3)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    8020796a:	10452783          	lw	a5,260(a0)
    8020796e:	37f9                	addiw	a5,a5,-2
    80207970:	02c787bb          	mulw	a5,a5,a2
    80207974:	4294                	lw	a3,0(a3)
    80207976:	9fb5                	addw	a5,a5,a3
    return lba * fat.bpb.byts_per_sec + ep->off % byts_per_clus;
    80207978:	02e787bb          	mulw	a5,a5,a4
    uint32 byts_per_clus = fat.bpb.byts_per_sec * fat.bpb.sec_per_clus;
    8020797c:	02c7073b          	mulw	a4,a4,a2
    return lba * fat.bpb.byts_per_sec + ep->off % byts_per_clus;
    80207980:	11c52683          	lw	a3,284(a0)
    80207984:	02e6f73b          	remuw	a4,a3,a4
    80207988:	00e7853b          	addw	a0,a5,a4
}
    8020798c:	1502                	slli	a0,a0,0x20
    8020798e:	9101                	srli	a0,a0,0x20
    80207990:	6422                	ld	s0,8(sp)
    80207992:	0141                	addi	sp,sp,16
    80207994:	8082                	ret

0000000080207996 <eroot>:
struct dirent *eroot()
{
    80207996:	1141                	addi	sp,sp,-16
    80207998:	e422                	sd	s0,8(sp)
    8020799a:	0800                	addi	s0,sp,16
    return &root;
}
    8020799c:	0001c517          	auipc	a0,0x1c
    802079a0:	48450513          	addi	a0,a0,1156 # 80223e20 <root>
    802079a4:	6422                	ld	s0,8(sp)
    802079a6:	0141                	addi	sp,sp,16
    802079a8:	8082                	ret

00000000802079aa <mount>:

uint64 mount(struct dirent *dev, struct dirent *mnt){
    802079aa:	7139                	addi	sp,sp,-64
    802079ac:	fc06                	sd	ra,56(sp)
    802079ae:	f822                	sd	s0,48(sp)
    802079b0:	f426                	sd	s1,40(sp)
    802079b2:	f04a                	sd	s2,32(sp)
    802079b4:	ec4e                	sd	s3,24(sp)
    802079b6:	e852                	sd	s4,16(sp)
    802079b8:	e456                	sd	s5,8(sp)
    802079ba:	0080                	addi	s0,sp,64
    802079bc:	89ae                	mv	s3,a1
    int idx = 0;
    while (devs[idx].vaild != 0){
    802079be:	00021497          	auipc	s1,0x21
    802079c2:	dfa4a483          	lw	s1,-518(s1) # 802287b8 <devs+0x28>
    802079c6:	c48d                	beqz	s1,802079f0 <mount+0x46>
    int idx = 0;
    802079c8:	4481                	li	s1,0
    while (devs[idx].vaild != 0){
    802079ca:	00021697          	auipc	a3,0x21
    802079ce:	dc668693          	addi	a3,a3,-570 # 80228790 <devs>
    802079d2:	1a800713          	li	a4,424
          idx++;
    802079d6:	2485                	addiw	s1,s1,1
          idx = idx % 8;
    802079d8:	41f4d79b          	sraiw	a5,s1,0x1f
    802079dc:	01d7d79b          	srliw	a5,a5,0x1d
    802079e0:	9cbd                	addw	s1,s1,a5
    802079e2:	889d                	andi	s1,s1,7
    802079e4:	9c9d                	subw	s1,s1,a5
    while (devs[idx].vaild != 0){
    802079e6:	02e487b3          	mul	a5,s1,a4
    802079ea:	97b6                	add	a5,a5,a3
    802079ec:	579c                	lw	a5,40(a5)
    802079ee:	f7e5                	bnez	a5,802079d6 <mount+0x2c>
      }
    struct buf *b = bread(dev->dev, 0);
    802079f0:	4581                	li	a1,0
    802079f2:	11454503          	lbu	a0,276(a0)
    802079f6:	ffffc097          	auipc	ra,0xffffc
    802079fa:	10c080e7          	jalr	268(ra) # 80203b02 <bread>
    802079fe:	8a2a                	mv	s4,a0
    if (strncmp((char const *)(b->data + 82), "FAT32", 5))
    80207a00:	4615                	li	a2,5
    80207a02:	00003597          	auipc	a1,0x3
    80207a06:	50e58593          	addi	a1,a1,1294 # 8020af10 <digits+0xb90>
    80207a0a:	0aa50513          	addi	a0,a0,170
    80207a0e:	ffff9097          	auipc	ra,0xffff9
    80207a12:	e2c080e7          	jalr	-468(ra) # 8020083a <strncmp>
    80207a16:	14051d63          	bnez	a0,80207b70 <mount+0x1c6>
        panic("not FAT32 volume");
    memmove(&devs[idx].bpb.byts_per_sec, b->data + 11, 2); // avoid misaligned load on k210
    80207a1a:	1a800a93          	li	s5,424
    80207a1e:	03548ab3          	mul	s5,s1,s5
    80207a22:	010a8513          	addi	a0,s5,16
    80207a26:	00021917          	auipc	s2,0x21
    80207a2a:	d6a90913          	addi	s2,s2,-662 # 80228790 <devs>
    80207a2e:	4609                	li	a2,2
    80207a30:	063a0593          	addi	a1,s4,99
    80207a34:	954a                	add	a0,a0,s2
    80207a36:	ffff9097          	auipc	ra,0xffff9
    80207a3a:	d88080e7          	jalr	-632(ra) # 802007be <memmove>
    devs[idx].bpb.sec_per_clus = *(b->data + 13);
    80207a3e:	065a4783          	lbu	a5,101(s4)
    80207a42:	9956                	add	s2,s2,s5
    80207a44:	00f90923          	sb	a5,18(s2)
    devs[idx].bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80207a48:	066a5783          	lhu	a5,102(s4)
    80207a4c:	00f91a23          	sh	a5,20(s2)
    devs[idx].bpb.fat_cnt = *(b->data + 16);
    80207a50:	068a4783          	lbu	a5,104(s4)
    80207a54:	00f90b23          	sb	a5,22(s2)
    devs[idx].bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80207a58:	074a2783          	lw	a5,116(s4)
    80207a5c:	00f92c23          	sw	a5,24(s2)
    devs[idx].bpb.tot_sec = *(uint32 *)(b->data + 32);
    80207a60:	078a2783          	lw	a5,120(s4)
    80207a64:	00f92e23          	sw	a5,28(s2)
    devs[idx].bpb.fat_sz = *(uint32 *)(b->data + 36);
    80207a68:	07ca2783          	lw	a5,124(s4)
    80207a6c:	02f92023          	sw	a5,32(s2)
    devs[idx].bpb.root_clus = *(uint32 *)(b->data + 44);
    80207a70:	084a2783          	lw	a5,132(s4)
    80207a74:	02f92223          	sw	a5,36(s2)
    devs[idx].first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    80207a78:	0001c797          	auipc	a5,0x1c
    80207a7c:	38078793          	addi	a5,a5,896 # 80223df8 <fat>
    80207a80:	0167c703          	lbu	a4,22(a5)
    80207a84:	5394                	lw	a3,32(a5)
    80207a86:	02d7073b          	mulw	a4,a4,a3
    80207a8a:	0147d683          	lhu	a3,20(a5)
    80207a8e:	9f35                	addw	a4,a4,a3
    80207a90:	00e92023          	sw	a4,0(s2)
    devs[idx].data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80207a94:	4fd8                	lw	a4,28(a5)
    80207a96:	4394                	lw	a3,0(a5)
    80207a98:	9f15                	subw	a4,a4,a3
    80207a9a:	00e92223          	sw	a4,4(s2)
    devs[idx].data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80207a9e:	0127c683          	lbu	a3,18(a5)
    80207aa2:	43d8                	lw	a4,4(a5)
    80207aa4:	02d7573b          	divuw	a4,a4,a3
    80207aa8:	00e92423          	sw	a4,8(s2)
    devs[idx].byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    80207aac:	0107d783          	lhu	a5,16(a5)
    80207ab0:	02d787bb          	mulw	a5,a5,a3
    80207ab4:	00f92623          	sw	a5,12(s2)
    brelse(b);
    80207ab8:	8552                	mv	a0,s4
    80207aba:	ffffc097          	auipc	ra,0xffffc
    80207abe:	174080e7          	jalr	372(ra) # 80203c2e <brelse>
    if (BSIZE != devs[idx].bpb.byts_per_sec)
    80207ac2:	01095703          	lhu	a4,16(s2)
    80207ac6:	20000793          	li	a5,512
    80207aca:	0af71b63          	bne	a4,a5,80207b80 <mount+0x1d6>
        panic("byts_per_sec != BSIZE");
    initlock(&ecache.lock, "ecache");
    80207ace:	00003597          	auipc	a1,0x3
    80207ad2:	47a58593          	addi	a1,a1,1146 # 8020af48 <digits+0xbc8>
    80207ad6:	0001c517          	auipc	a0,0x1c
    80207ada:	4ba50513          	addi	a0,a0,1210 # 80223f90 <ecache>
    80207ade:	ffff9097          	auipc	ra,0xffff9
    80207ae2:	ba4080e7          	jalr	-1116(ra) # 80200682 <initlock>
    memset(&devs[idx].root, 0, sizeof(devs[idx].root));
    80207ae6:	030a8a93          	addi	s5,s5,48
    80207aea:	00021917          	auipc	s2,0x21
    80207aee:	ca690913          	addi	s2,s2,-858 # 80228790 <devs>
    80207af2:	9aca                	add	s5,s5,s2
    80207af4:	17000613          	li	a2,368
    80207af8:	4581                	li	a1,0
    80207afa:	8556                	mv	a0,s5
    80207afc:	ffff9097          	auipc	ra,0xffff9
    80207b00:	c66080e7          	jalr	-922(ra) # 80200762 <memset>
    initsleeplock(&root.lock, "entry");
    80207b04:	00003597          	auipc	a1,0x3
    80207b08:	44c58593          	addi	a1,a1,1100 # 8020af50 <digits+0xbd0>
    80207b0c:	0001c517          	auipc	a0,0x1c
    80207b10:	44c50513          	addi	a0,a0,1100 # 80223f58 <root+0x138>
    80207b14:	ffffc097          	auipc	ra,0xffffc
    80207b18:	230080e7          	jalr	560(ra) # 80203d44 <initsleeplock>
    devs[idx].root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    80207b1c:	1a800793          	li	a5,424
    80207b20:	02f487b3          	mul	a5,s1,a5
    80207b24:	97ca                	add	a5,a5,s2
    80207b26:	4751                	li	a4,20
    80207b28:	12e78823          	sb	a4,304(a5)
    devs[idx].root.first_clus = devs[idx].root.cur_clus = devs[idx].bpb.root_clus;
    80207b2c:	53d8                	lw	a4,36(a5)
    80207b2e:	12e7ae23          	sw	a4,316(a5)
    80207b32:	12e7aa23          	sw	a4,308(a5)
    devs[idx].root.valid = 1;
    80207b36:	4705                	li	a4,1
    80207b38:	14e79323          	sh	a4,326(a5)
    devs[idx].root.prev = &devs[idx].root;
    80207b3c:	1757b023          	sd	s5,352(a5)
    devs[idx].root.next = &devs[idx].root;
    80207b40:	1557bc23          	sd	s5,344(a5)
    devs[idx].root.filename[0] = '/';
    80207b44:	02f00693          	li	a3,47
    80207b48:	02d78823          	sb	a3,48(a5)
    devs[idx].root.filename[1] = '\0';
    80207b4c:	020788a3          	sb	zero,49(a5)
    devs[idx].mount_mode = 1;
    80207b50:	1ae78023          	sb	a4,416(a5)
    mnt->mount_flag = 1;
    80207b54:	16e98423          	sb	a4,360(s3)
    mnt->dev = idx;
    80207b58:	10998a23          	sb	s1,276(s3)
    return 0;
}
    80207b5c:	4501                	li	a0,0
    80207b5e:	70e2                	ld	ra,56(sp)
    80207b60:	7442                	ld	s0,48(sp)
    80207b62:	74a2                	ld	s1,40(sp)
    80207b64:	7902                	ld	s2,32(sp)
    80207b66:	69e2                	ld	s3,24(sp)
    80207b68:	6a42                	ld	s4,16(sp)
    80207b6a:	6aa2                	ld	s5,8(sp)
    80207b6c:	6121                	addi	sp,sp,64
    80207b6e:	8082                	ret
        panic("not FAT32 volume");
    80207b70:	00003517          	auipc	a0,0x3
    80207b74:	3a850513          	addi	a0,a0,936 # 8020af18 <digits+0xb98>
    80207b78:	ffff8097          	auipc	ra,0xffff8
    80207b7c:	5cc080e7          	jalr	1484(ra) # 80200144 <panic>
        panic("byts_per_sec != BSIZE");
    80207b80:	00003517          	auipc	a0,0x3
    80207b84:	3b050513          	addi	a0,a0,944 # 8020af30 <digits+0xbb0>
    80207b88:	ffff8097          	auipc	ra,0xffff8
    80207b8c:	5bc080e7          	jalr	1468(ra) # 80200144 <panic>

0000000080207b90 <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    80207b90:	1141                	addi	sp,sp,-16
    80207b92:	e422                	sd	s0,8(sp)
    80207b94:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    80207b96:	00fc37b7          	lui	a5,0xfc3
    80207b9a:	07ba                	slli	a5,a5,0xe
    80207b9c:	4705                	li	a4,1
    80207b9e:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    80207ba0:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    80207ba2:	6422                	ld	s0,8(sp)
    80207ba4:	0141                	addi	sp,sp,16
    80207ba6:	8082                	ret

0000000080207ba8 <plicinithart>:

void
plicinithart(void)
{
    80207ba8:	1141                	addi	sp,sp,-16
    80207baa:	e406                	sd	ra,8(sp)
    80207bac:	e022                	sd	s0,0(sp)
    80207bae:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207bb0:	ffffa097          	auipc	ra,0xffffa
    80207bb4:	eda080e7          	jalr	-294(ra) # 80201a8a <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    80207bb8:	0085171b          	slliw	a4,a0,0x8
    80207bbc:	01f867b7          	lui	a5,0x1f86
    80207bc0:	0785                	addi	a5,a5,1 # 1f86001 <_entry-0x7e279fff>
    80207bc2:	07b6                	slli	a5,a5,0xd
    80207bc4:	97ba                	add	a5,a5,a4
    80207bc6:	40200713          	li	a4,1026
    80207bca:	08e7a023          	sw	a4,128(a5)
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80207bce:	00d5151b          	slliw	a0,a0,0xd
    80207bd2:	03f0c7b7          	lui	a5,0x3f0c
    80207bd6:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207bda:	07b2                	slli	a5,a5,0xc
    80207bdc:	97aa                	add	a5,a5,a0
    80207bde:	0007a023          	sw	zero,0(a5)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    80207be2:	60a2                	ld	ra,8(sp)
    80207be4:	6402                	ld	s0,0(sp)
    80207be6:	0141                	addi	sp,sp,16
    80207be8:	8082                	ret

0000000080207bea <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80207bea:	1141                	addi	sp,sp,-16
    80207bec:	e406                	sd	ra,8(sp)
    80207bee:	e022                	sd	s0,0(sp)
    80207bf0:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207bf2:	ffffa097          	auipc	ra,0xffffa
    80207bf6:	e98080e7          	jalr	-360(ra) # 80201a8a <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    80207bfa:	00d5151b          	slliw	a0,a0,0xd
    80207bfe:	03f0c7b7          	lui	a5,0x3f0c
    80207c02:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207c06:	07b2                	slli	a5,a5,0xc
    80207c08:	97aa                	add	a5,a5,a0
  #endif
  return irq;
}
    80207c0a:	43c8                	lw	a0,4(a5)
    80207c0c:	60a2                	ld	ra,8(sp)
    80207c0e:	6402                	ld	s0,0(sp)
    80207c10:	0141                	addi	sp,sp,16
    80207c12:	8082                	ret

0000000080207c14 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80207c14:	1101                	addi	sp,sp,-32
    80207c16:	ec06                	sd	ra,24(sp)
    80207c18:	e822                	sd	s0,16(sp)
    80207c1a:	e426                	sd	s1,8(sp)
    80207c1c:	1000                	addi	s0,sp,32
    80207c1e:	84aa                	mv	s1,a0
  int hart = cpuid();
    80207c20:	ffffa097          	auipc	ra,0xffffa
    80207c24:	e6a080e7          	jalr	-406(ra) # 80201a8a <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80207c28:	00d5151b          	slliw	a0,a0,0xd
    80207c2c:	03f0c7b7          	lui	a5,0x3f0c
    80207c30:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207c34:	07b2                	slli	a5,a5,0xc
    80207c36:	97aa                	add	a5,a5,a0
    80207c38:	c3c4                	sw	s1,4(a5)
  #endif
}
    80207c3a:	60e2                	ld	ra,24(sp)
    80207c3c:	6442                	ld	s0,16(sp)
    80207c3e:	64a2                	ld	s1,8(sp)
    80207c40:	6105                	addi	sp,sp,32
    80207c42:	8082                	ret

0000000080207c44 <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    80207c44:	715d                	addi	sp,sp,-80
    80207c46:	e486                	sd	ra,72(sp)
    80207c48:	e0a2                	sd	s0,64(sp)
    80207c4a:	fc26                	sd	s1,56(sp)
    80207c4c:	f84a                	sd	s2,48(sp)
    80207c4e:	f44e                	sd	s3,40(sp)
    80207c50:	f052                	sd	s4,32(sp)
    80207c52:	ec56                	sd	s5,24(sp)
    80207c54:	e85a                	sd	s6,16(sp)
    80207c56:	0880                	addi	s0,sp,80
    80207c58:	8a2a                	mv	s4,a0
    80207c5a:	84ae                	mv	s1,a1
    80207c5c:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    80207c5e:	00022517          	auipc	a0,0x22
    80207c62:	87250513          	addi	a0,a0,-1934 # 802294d0 <cons>
    80207c66:	ffff9097          	auipc	ra,0xffff9
    80207c6a:	a60080e7          	jalr	-1440(ra) # 802006c6 <acquire>
  for(i = 0; i < n; i++){
    80207c6e:	07305063          	blez	s3,80207cce <consolewrite+0x8a>
    80207c72:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    80207c74:	fbf40b13          	addi	s6,s0,-65
    80207c78:	5afd                	li	s5,-1
    80207c7a:	4685                	li	a3,1
    80207c7c:	8626                	mv	a2,s1
    80207c7e:	85d2                	mv	a1,s4
    80207c80:	855a                	mv	a0,s6
    80207c82:	ffffb097          	auipc	ra,0xffffb
    80207c86:	980080e7          	jalr	-1664(ra) # 80202602 <either_copyin>
    80207c8a:	01550f63          	beq	a0,s5,80207ca8 <consolewrite+0x64>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    80207c8e:	fbf44503          	lbu	a0,-65(s0)
    80207c92:	4581                	li	a1,0
    80207c94:	4601                	li	a2,0
    80207c96:	4681                	li	a3,0
    80207c98:	4885                	li	a7,1
    80207c9a:	00000073          	ecall
  for(i = 0; i < n; i++){
    80207c9e:	2905                	addiw	s2,s2,1
    80207ca0:	0485                	addi	s1,s1,1
    80207ca2:	fd299ce3          	bne	s3,s2,80207c7a <consolewrite+0x36>
    80207ca6:	894e                	mv	s2,s3
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    80207ca8:	00022517          	auipc	a0,0x22
    80207cac:	82850513          	addi	a0,a0,-2008 # 802294d0 <cons>
    80207cb0:	ffff9097          	auipc	ra,0xffff9
    80207cb4:	a6a080e7          	jalr	-1430(ra) # 8020071a <release>

  return i;
}
    80207cb8:	854a                	mv	a0,s2
    80207cba:	60a6                	ld	ra,72(sp)
    80207cbc:	6406                	ld	s0,64(sp)
    80207cbe:	74e2                	ld	s1,56(sp)
    80207cc0:	7942                	ld	s2,48(sp)
    80207cc2:	79a2                	ld	s3,40(sp)
    80207cc4:	7a02                	ld	s4,32(sp)
    80207cc6:	6ae2                	ld	s5,24(sp)
    80207cc8:	6b42                	ld	s6,16(sp)
    80207cca:	6161                	addi	sp,sp,80
    80207ccc:	8082                	ret
  for(i = 0; i < n; i++){
    80207cce:	4901                	li	s2,0
    80207cd0:	bfe1                	j	80207ca8 <consolewrite+0x64>

0000000080207cd2 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80207cd2:	7119                	addi	sp,sp,-128
    80207cd4:	fc86                	sd	ra,120(sp)
    80207cd6:	f8a2                	sd	s0,112(sp)
    80207cd8:	f4a6                	sd	s1,104(sp)
    80207cda:	f0ca                	sd	s2,96(sp)
    80207cdc:	ecce                	sd	s3,88(sp)
    80207cde:	e8d2                	sd	s4,80(sp)
    80207ce0:	e4d6                	sd	s5,72(sp)
    80207ce2:	e0da                	sd	s6,64(sp)
    80207ce4:	fc5e                	sd	s7,56(sp)
    80207ce6:	f862                	sd	s8,48(sp)
    80207ce8:	f466                	sd	s9,40(sp)
    80207cea:	f06a                	sd	s10,32(sp)
    80207cec:	ec6e                	sd	s11,24(sp)
    80207cee:	0100                	addi	s0,sp,128
    80207cf0:	8aaa                	mv	s5,a0
    80207cf2:	8a2e                	mv	s4,a1
    80207cf4:	89b2                	mv	s3,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    80207cf6:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    80207cfa:	00021517          	auipc	a0,0x21
    80207cfe:	7d650513          	addi	a0,a0,2006 # 802294d0 <cons>
    80207d02:	ffff9097          	auipc	ra,0xffff9
    80207d06:	9c4080e7          	jalr	-1596(ra) # 802006c6 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80207d0a:	00021497          	auipc	s1,0x21
    80207d0e:	7c648493          	addi	s1,s1,1990 # 802294d0 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    80207d12:	00022917          	auipc	s2,0x22
    80207d16:	85690913          	addi	s2,s2,-1962 # 80229568 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80207d1a:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207d1c:	f8f40d13          	addi	s10,s0,-113
    80207d20:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    80207d22:	4da9                	li	s11,10
  while(n > 0){
    80207d24:	07305763          	blez	s3,80207d92 <consoleread+0xc0>
    while(cons.r == cons.w){
    80207d28:	0984a783          	lw	a5,152(s1)
    80207d2c:	09c4a703          	lw	a4,156(s1)
    80207d30:	02f71463          	bne	a4,a5,80207d58 <consoleread+0x86>
      if(myproc()->killed){
    80207d34:	ffffa097          	auipc	ra,0xffffa
    80207d38:	d82080e7          	jalr	-638(ra) # 80201ab6 <myproc>
    80207d3c:	591c                	lw	a5,48(a0)
    80207d3e:	e7ad                	bnez	a5,80207da8 <consoleread+0xd6>
      sleep(&cons.r, &cons.lock);
    80207d40:	85a6                	mv	a1,s1
    80207d42:	854a                	mv	a0,s2
    80207d44:	ffffa097          	auipc	ra,0xffffa
    80207d48:	632080e7          	jalr	1586(ra) # 80202376 <sleep>
    while(cons.r == cons.w){
    80207d4c:	0984a783          	lw	a5,152(s1)
    80207d50:	09c4a703          	lw	a4,156(s1)
    80207d54:	fef700e3          	beq	a4,a5,80207d34 <consoleread+0x62>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80207d58:	0017871b          	addiw	a4,a5,1
    80207d5c:	08e4ac23          	sw	a4,152(s1)
    80207d60:	07f7f713          	andi	a4,a5,127
    80207d64:	9726                	add	a4,a4,s1
    80207d66:	01874703          	lbu	a4,24(a4)
    80207d6a:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    80207d6e:	078b8563          	beq	s7,s8,80207dd8 <consoleread+0x106>
    cbuf = c;
    80207d72:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207d76:	4685                	li	a3,1
    80207d78:	866a                	mv	a2,s10
    80207d7a:	85d2                	mv	a1,s4
    80207d7c:	8556                	mv	a0,s5
    80207d7e:	ffffb097          	auipc	ra,0xffffb
    80207d82:	84e080e7          	jalr	-1970(ra) # 802025cc <either_copyout>
    80207d86:	01950663          	beq	a0,s9,80207d92 <consoleread+0xc0>
    dst++;
    80207d8a:	0a05                	addi	s4,s4,1
    --n;
    80207d8c:	39fd                	addiw	s3,s3,-1
    if(c == '\n'){
    80207d8e:	f9bb9be3          	bne	s7,s11,80207d24 <consoleread+0x52>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    80207d92:	00021517          	auipc	a0,0x21
    80207d96:	73e50513          	addi	a0,a0,1854 # 802294d0 <cons>
    80207d9a:	ffff9097          	auipc	ra,0xffff9
    80207d9e:	980080e7          	jalr	-1664(ra) # 8020071a <release>

  return target - n;
    80207da2:	413b053b          	subw	a0,s6,s3
    80207da6:	a811                	j	80207dba <consoleread+0xe8>
        release(&cons.lock);
    80207da8:	00021517          	auipc	a0,0x21
    80207dac:	72850513          	addi	a0,a0,1832 # 802294d0 <cons>
    80207db0:	ffff9097          	auipc	ra,0xffff9
    80207db4:	96a080e7          	jalr	-1686(ra) # 8020071a <release>
        return -1;
    80207db8:	557d                	li	a0,-1
}
    80207dba:	70e6                	ld	ra,120(sp)
    80207dbc:	7446                	ld	s0,112(sp)
    80207dbe:	74a6                	ld	s1,104(sp)
    80207dc0:	7906                	ld	s2,96(sp)
    80207dc2:	69e6                	ld	s3,88(sp)
    80207dc4:	6a46                	ld	s4,80(sp)
    80207dc6:	6aa6                	ld	s5,72(sp)
    80207dc8:	6b06                	ld	s6,64(sp)
    80207dca:	7be2                	ld	s7,56(sp)
    80207dcc:	7c42                	ld	s8,48(sp)
    80207dce:	7ca2                	ld	s9,40(sp)
    80207dd0:	7d02                	ld	s10,32(sp)
    80207dd2:	6de2                	ld	s11,24(sp)
    80207dd4:	6109                	addi	sp,sp,128
    80207dd6:	8082                	ret
      if(n < target){
    80207dd8:	0009871b          	sext.w	a4,s3
    80207ddc:	fb677be3          	bgeu	a4,s6,80207d92 <consoleread+0xc0>
        cons.r--;
    80207de0:	00021717          	auipc	a4,0x21
    80207de4:	78f72423          	sw	a5,1928(a4) # 80229568 <cons+0x98>
    80207de8:	b76d                	j	80207d92 <consoleread+0xc0>

0000000080207dea <consputc>:
void consputc(int c) {
    80207dea:	1141                	addi	sp,sp,-16
    80207dec:	e422                	sd	s0,8(sp)
    80207dee:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    80207df0:	10000793          	li	a5,256
    80207df4:	00f50b63          	beq	a0,a5,80207e0a <consputc+0x20>
    80207df8:	4581                	li	a1,0
    80207dfa:	4601                	li	a2,0
    80207dfc:	4681                	li	a3,0
    80207dfe:	4885                	li	a7,1
    80207e00:	00000073          	ecall
}
    80207e04:	6422                	ld	s0,8(sp)
    80207e06:	0141                	addi	sp,sp,16
    80207e08:	8082                	ret
    80207e0a:	4521                	li	a0,8
    80207e0c:	4581                	li	a1,0
    80207e0e:	4601                	li	a2,0
    80207e10:	4681                	li	a3,0
    80207e12:	4885                	li	a7,1
    80207e14:	00000073          	ecall
    80207e18:	02000513          	li	a0,32
    80207e1c:	00000073          	ecall
    80207e20:	4521                	li	a0,8
    80207e22:	00000073          	ecall
}
    80207e26:	bff9                	j	80207e04 <consputc+0x1a>

0000000080207e28 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    80207e28:	1101                	addi	sp,sp,-32
    80207e2a:	ec06                	sd	ra,24(sp)
    80207e2c:	e822                	sd	s0,16(sp)
    80207e2e:	e426                	sd	s1,8(sp)
    80207e30:	e04a                	sd	s2,0(sp)
    80207e32:	1000                	addi	s0,sp,32
    80207e34:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    80207e36:	00021517          	auipc	a0,0x21
    80207e3a:	69a50513          	addi	a0,a0,1690 # 802294d0 <cons>
    80207e3e:	ffff9097          	auipc	ra,0xffff9
    80207e42:	888080e7          	jalr	-1912(ra) # 802006c6 <acquire>

  switch(c){
    80207e46:	47d5                	li	a5,21
    80207e48:	0af48663          	beq	s1,a5,80207ef4 <consoleintr+0xcc>
    80207e4c:	0297ca63          	blt	a5,s1,80207e80 <consoleintr+0x58>
    80207e50:	47a1                	li	a5,8
    80207e52:	0ef48763          	beq	s1,a5,80207f40 <consoleintr+0x118>
    80207e56:	47c1                	li	a5,16
    80207e58:	10f49a63          	bne	s1,a5,80207f6c <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    80207e5c:	ffffa097          	auipc	ra,0xffffa
    80207e60:	7da080e7          	jalr	2010(ra) # 80202636 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    80207e64:	00021517          	auipc	a0,0x21
    80207e68:	66c50513          	addi	a0,a0,1644 # 802294d0 <cons>
    80207e6c:	ffff9097          	auipc	ra,0xffff9
    80207e70:	8ae080e7          	jalr	-1874(ra) # 8020071a <release>
}
    80207e74:	60e2                	ld	ra,24(sp)
    80207e76:	6442                	ld	s0,16(sp)
    80207e78:	64a2                	ld	s1,8(sp)
    80207e7a:	6902                	ld	s2,0(sp)
    80207e7c:	6105                	addi	sp,sp,32
    80207e7e:	8082                	ret
  switch(c){
    80207e80:	07f00793          	li	a5,127
    80207e84:	0af48e63          	beq	s1,a5,80207f40 <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207e88:	00021717          	auipc	a4,0x21
    80207e8c:	64870713          	addi	a4,a4,1608 # 802294d0 <cons>
    80207e90:	0a072783          	lw	a5,160(a4)
    80207e94:	09872703          	lw	a4,152(a4)
    80207e98:	9f99                	subw	a5,a5,a4
    80207e9a:	07f00713          	li	a4,127
    80207e9e:	fcf763e3          	bltu	a4,a5,80207e64 <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    80207ea2:	47b5                	li	a5,13
    80207ea4:	0cf48763          	beq	s1,a5,80207f72 <consoleintr+0x14a>
      consputc(c);
    80207ea8:	8526                	mv	a0,s1
    80207eaa:	00000097          	auipc	ra,0x0
    80207eae:	f40080e7          	jalr	-192(ra) # 80207dea <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207eb2:	00021797          	auipc	a5,0x21
    80207eb6:	61e78793          	addi	a5,a5,1566 # 802294d0 <cons>
    80207eba:	0a07a703          	lw	a4,160(a5)
    80207ebe:	0017069b          	addiw	a3,a4,1
    80207ec2:	0006861b          	sext.w	a2,a3
    80207ec6:	0ad7a023          	sw	a3,160(a5)
    80207eca:	07f77713          	andi	a4,a4,127
    80207ece:	97ba                	add	a5,a5,a4
    80207ed0:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    80207ed4:	47a9                	li	a5,10
    80207ed6:	0cf48563          	beq	s1,a5,80207fa0 <consoleintr+0x178>
    80207eda:	4791                	li	a5,4
    80207edc:	0cf48263          	beq	s1,a5,80207fa0 <consoleintr+0x178>
    80207ee0:	00021797          	auipc	a5,0x21
    80207ee4:	6887a783          	lw	a5,1672(a5) # 80229568 <cons+0x98>
    80207ee8:	0807879b          	addiw	a5,a5,128
    80207eec:	f6f61ce3          	bne	a2,a5,80207e64 <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207ef0:	863e                	mv	a2,a5
    80207ef2:	a07d                	j	80207fa0 <consoleintr+0x178>
    while(cons.e != cons.w &&
    80207ef4:	00021717          	auipc	a4,0x21
    80207ef8:	5dc70713          	addi	a4,a4,1500 # 802294d0 <cons>
    80207efc:	0a072783          	lw	a5,160(a4)
    80207f00:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80207f04:	00021497          	auipc	s1,0x21
    80207f08:	5cc48493          	addi	s1,s1,1484 # 802294d0 <cons>
    while(cons.e != cons.w &&
    80207f0c:	4929                	li	s2,10
    80207f0e:	f4f70be3          	beq	a4,a5,80207e64 <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80207f12:	37fd                	addiw	a5,a5,-1
    80207f14:	07f7f713          	andi	a4,a5,127
    80207f18:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    80207f1a:	01874703          	lbu	a4,24(a4)
    80207f1e:	f52703e3          	beq	a4,s2,80207e64 <consoleintr+0x3c>
      cons.e--;
    80207f22:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    80207f26:	10000513          	li	a0,256
    80207f2a:	00000097          	auipc	ra,0x0
    80207f2e:	ec0080e7          	jalr	-320(ra) # 80207dea <consputc>
    while(cons.e != cons.w &&
    80207f32:	0a04a783          	lw	a5,160(s1)
    80207f36:	09c4a703          	lw	a4,156(s1)
    80207f3a:	fcf71ce3          	bne	a4,a5,80207f12 <consoleintr+0xea>
    80207f3e:	b71d                	j	80207e64 <consoleintr+0x3c>
    if(cons.e != cons.w){
    80207f40:	00021717          	auipc	a4,0x21
    80207f44:	59070713          	addi	a4,a4,1424 # 802294d0 <cons>
    80207f48:	0a072783          	lw	a5,160(a4)
    80207f4c:	09c72703          	lw	a4,156(a4)
    80207f50:	f0f70ae3          	beq	a4,a5,80207e64 <consoleintr+0x3c>
      cons.e--;
    80207f54:	37fd                	addiw	a5,a5,-1
    80207f56:	00021717          	auipc	a4,0x21
    80207f5a:	60f72d23          	sw	a5,1562(a4) # 80229570 <cons+0xa0>
      consputc(BACKSPACE);
    80207f5e:	10000513          	li	a0,256
    80207f62:	00000097          	auipc	ra,0x0
    80207f66:	e88080e7          	jalr	-376(ra) # 80207dea <consputc>
    80207f6a:	bded                	j	80207e64 <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207f6c:	ee048ce3          	beqz	s1,80207e64 <consoleintr+0x3c>
    80207f70:	bf21                	j	80207e88 <consoleintr+0x60>
      consputc(c);
    80207f72:	4529                	li	a0,10
    80207f74:	00000097          	auipc	ra,0x0
    80207f78:	e76080e7          	jalr	-394(ra) # 80207dea <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207f7c:	00021797          	auipc	a5,0x21
    80207f80:	55478793          	addi	a5,a5,1364 # 802294d0 <cons>
    80207f84:	0a07a703          	lw	a4,160(a5)
    80207f88:	0017069b          	addiw	a3,a4,1
    80207f8c:	0006861b          	sext.w	a2,a3
    80207f90:	0ad7a023          	sw	a3,160(a5)
    80207f94:	07f77713          	andi	a4,a4,127
    80207f98:	97ba                	add	a5,a5,a4
    80207f9a:	4729                	li	a4,10
    80207f9c:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    80207fa0:	00021797          	auipc	a5,0x21
    80207fa4:	5cc7a623          	sw	a2,1484(a5) # 8022956c <cons+0x9c>
        wakeup(&cons.r);
    80207fa8:	00021517          	auipc	a0,0x21
    80207fac:	5c050513          	addi	a0,a0,1472 # 80229568 <cons+0x98>
    80207fb0:	ffffa097          	auipc	ra,0xffffa
    80207fb4:	542080e7          	jalr	1346(ra) # 802024f2 <wakeup>
    80207fb8:	b575                	j	80207e64 <consoleintr+0x3c>

0000000080207fba <consoleinit>:

void
consoleinit(void)
{
    80207fba:	1101                	addi	sp,sp,-32
    80207fbc:	ec06                	sd	ra,24(sp)
    80207fbe:	e822                	sd	s0,16(sp)
    80207fc0:	e426                	sd	s1,8(sp)
    80207fc2:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    80207fc4:	00021497          	auipc	s1,0x21
    80207fc8:	50c48493          	addi	s1,s1,1292 # 802294d0 <cons>
    80207fcc:	00003597          	auipc	a1,0x3
    80207fd0:	0d458593          	addi	a1,a1,212 # 8020b0a0 <digits+0xd20>
    80207fd4:	8526                	mv	a0,s1
    80207fd6:	ffff8097          	auipc	ra,0xffff8
    80207fda:	6ac080e7          	jalr	1708(ra) # 80200682 <initlock>

  cons.e = cons.w = cons.r = 0;
    80207fde:	0804ac23          	sw	zero,152(s1)
    80207fe2:	0804ae23          	sw	zero,156(s1)
    80207fe6:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80207fea:	00006797          	auipc	a5,0x6
    80207fee:	d267b783          	ld	a5,-730(a5) # 8020dd10 <_GLOBAL_OFFSET_TABLE_+0x58>
    80207ff2:	00000717          	auipc	a4,0x0
    80207ff6:	ce070713          	addi	a4,a4,-800 # 80207cd2 <consoleread>
    80207ffa:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    80207ffc:	00000717          	auipc	a4,0x0
    80208000:	c4870713          	addi	a4,a4,-952 # 80207c44 <consolewrite>
    80208004:	ef98                	sd	a4,24(a5)
}
    80208006:	60e2                	ld	ra,24(sp)
    80208008:	6442                	ld	s0,16(sp)
    8020800a:	64a2                	ld	s1,8(sp)
    8020800c:	6105                	addi	sp,sp,32
    8020800e:	8082                	ret

0000000080208010 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    80208010:	1141                	addi	sp,sp,-16
    80208012:	e406                	sd	ra,8(sp)
    80208014:	e022                	sd	s0,0(sp)
    80208016:	0800                	addi	s0,sp,16
  if(i >= NUM)
    80208018:	479d                	li	a5,7
    8020801a:	04a7cb63          	blt	a5,a0,80208070 <free_desc+0x60>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    8020801e:	00022717          	auipc	a4,0x22
    80208022:	fe270713          	addi	a4,a4,-30 # 8022a000 <disk>
    80208026:	972a                	add	a4,a4,a0
    80208028:	6789                	lui	a5,0x2
    8020802a:	97ba                	add	a5,a5,a4
    8020802c:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    80208030:	eba1                	bnez	a5,80208080 <free_desc+0x70>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    80208032:	00451713          	slli	a4,a0,0x4
    80208036:	00024797          	auipc	a5,0x24
    8020803a:	fca7b783          	ld	a5,-54(a5) # 8022c000 <disk+0x2000>
    8020803e:	97ba                	add	a5,a5,a4
    80208040:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    80208044:	00022717          	auipc	a4,0x22
    80208048:	fbc70713          	addi	a4,a4,-68 # 8022a000 <disk>
    8020804c:	972a                	add	a4,a4,a0
    8020804e:	6789                	lui	a5,0x2
    80208050:	97ba                	add	a5,a5,a4
    80208052:	4705                	li	a4,1
    80208054:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    80208058:	00024517          	auipc	a0,0x24
    8020805c:	fc050513          	addi	a0,a0,-64 # 8022c018 <disk+0x2018>
    80208060:	ffffa097          	auipc	ra,0xffffa
    80208064:	492080e7          	jalr	1170(ra) # 802024f2 <wakeup>
}
    80208068:	60a2                	ld	ra,8(sp)
    8020806a:	6402                	ld	s0,0(sp)
    8020806c:	0141                	addi	sp,sp,16
    8020806e:	8082                	ret
    panic("virtio_disk_intr 1");
    80208070:	00003517          	auipc	a0,0x3
    80208074:	03850513          	addi	a0,a0,56 # 8020b0a8 <digits+0xd28>
    80208078:	ffff8097          	auipc	ra,0xffff8
    8020807c:	0cc080e7          	jalr	204(ra) # 80200144 <panic>
    panic("virtio_disk_intr 2");
    80208080:	00003517          	auipc	a0,0x3
    80208084:	04050513          	addi	a0,a0,64 # 8020b0c0 <digits+0xd40>
    80208088:	ffff8097          	auipc	ra,0xffff8
    8020808c:	0bc080e7          	jalr	188(ra) # 80200144 <panic>

0000000080208090 <virtio_disk_init>:
{
    80208090:	1141                	addi	sp,sp,-16
    80208092:	e406                	sd	ra,8(sp)
    80208094:	e022                	sd	s0,0(sp)
    80208096:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    80208098:	00003597          	auipc	a1,0x3
    8020809c:	04058593          	addi	a1,a1,64 # 8020b0d8 <digits+0xd58>
    802080a0:	00024517          	auipc	a0,0x24
    802080a4:	00850513          	addi	a0,a0,8 # 8022c0a8 <disk+0x20a8>
    802080a8:	ffff8097          	auipc	ra,0xffff8
    802080ac:	5da080e7          	jalr	1498(ra) # 80200682 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    802080b0:	03f107b7          	lui	a5,0x3f10
    802080b4:	0785                	addi	a5,a5,1 # 3f10001 <_entry-0x7c2effff>
    802080b6:	07b2                	slli	a5,a5,0xc
    802080b8:	4398                	lw	a4,0(a5)
    802080ba:	2701                	sext.w	a4,a4
    802080bc:	747277b7          	lui	a5,0x74727
    802080c0:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    802080c4:	12f71163          	bne	a4,a5,802081e6 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    802080c8:	00003797          	auipc	a5,0x3
    802080cc:	0987b783          	ld	a5,152(a5) # 8020b160 <digits+0xde0>
    802080d0:	439c                	lw	a5,0(a5)
    802080d2:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    802080d4:	4705                	li	a4,1
    802080d6:	10e79863          	bne	a5,a4,802081e6 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    802080da:	00003797          	auipc	a5,0x3
    802080de:	08e7b783          	ld	a5,142(a5) # 8020b168 <digits+0xde8>
    802080e2:	439c                	lw	a5,0(a5)
    802080e4:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    802080e6:	4709                	li	a4,2
    802080e8:	0ee79f63          	bne	a5,a4,802081e6 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    802080ec:	00003797          	auipc	a5,0x3
    802080f0:	0847b783          	ld	a5,132(a5) # 8020b170 <digits+0xdf0>
    802080f4:	4398                	lw	a4,0(a5)
    802080f6:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    802080f8:	554d47b7          	lui	a5,0x554d4
    802080fc:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    80208100:	0ef71363          	bne	a4,a5,802081e6 <virtio_disk_init+0x156>
  *R(VIRTIO_MMIO_STATUS) = status;
    80208104:	00003797          	auipc	a5,0x3
    80208108:	0747b783          	ld	a5,116(a5) # 8020b178 <digits+0xdf8>
    8020810c:	4705                	li	a4,1
    8020810e:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80208110:	470d                	li	a4,3
    80208112:	c398                	sw	a4,0(a5)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80208114:	00003717          	auipc	a4,0x3
    80208118:	06c73703          	ld	a4,108(a4) # 8020b180 <digits+0xe00>
    8020811c:	4318                	lw	a4,0(a4)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    8020811e:	c7ffe6b7          	lui	a3,0xc7ffe
    80208122:	75f68693          	addi	a3,a3,1887 # ffffffffc7ffe75f <ebss_clear+0xffffffff47dd175f>
    80208126:	8f75                	and	a4,a4,a3
    80208128:	00003697          	auipc	a3,0x3
    8020812c:	0606b683          	ld	a3,96(a3) # 8020b188 <digits+0xe08>
    80208130:	c298                	sw	a4,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    80208132:	472d                	li	a4,11
    80208134:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80208136:	473d                	li	a4,15
    80208138:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    8020813a:	00003797          	auipc	a5,0x3
    8020813e:	0567b783          	ld	a5,86(a5) # 8020b190 <digits+0xe10>
    80208142:	6705                	lui	a4,0x1
    80208144:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80208146:	00003797          	auipc	a5,0x3
    8020814a:	0527b783          	ld	a5,82(a5) # 8020b198 <digits+0xe18>
    8020814e:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80208152:	00003797          	auipc	a5,0x3
    80208156:	04e7b783          	ld	a5,78(a5) # 8020b1a0 <digits+0xe20>
    8020815a:	439c                	lw	a5,0(a5)
    8020815c:	2781                	sext.w	a5,a5
  if(max == 0)
    8020815e:	cfc1                	beqz	a5,802081f6 <virtio_disk_init+0x166>
  if(max < NUM)
    80208160:	471d                	li	a4,7
    80208162:	0af77263          	bgeu	a4,a5,80208206 <virtio_disk_init+0x176>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80208166:	00003797          	auipc	a5,0x3
    8020816a:	0427b783          	ld	a5,66(a5) # 8020b1a8 <digits+0xe28>
    8020816e:	4721                	li	a4,8
    80208170:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80208172:	6609                	lui	a2,0x2
    80208174:	4581                	li	a1,0
    80208176:	00022517          	auipc	a0,0x22
    8020817a:	e8a50513          	addi	a0,a0,-374 # 8022a000 <disk>
    8020817e:	ffff8097          	auipc	ra,0xffff8
    80208182:	5e4080e7          	jalr	1508(ra) # 80200762 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80208186:	00022717          	auipc	a4,0x22
    8020818a:	e7a70713          	addi	a4,a4,-390 # 8022a000 <disk>
    8020818e:	00c75793          	srli	a5,a4,0xc
    80208192:	2781                	sext.w	a5,a5
    80208194:	00003697          	auipc	a3,0x3
    80208198:	01c6b683          	ld	a3,28(a3) # 8020b1b0 <digits+0xe30>
    8020819c:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    8020819e:	00024797          	auipc	a5,0x24
    802081a2:	e6278793          	addi	a5,a5,-414 # 8022c000 <disk+0x2000>
    802081a6:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    802081a8:	00022717          	auipc	a4,0x22
    802081ac:	ed870713          	addi	a4,a4,-296 # 8022a080 <disk+0x80>
    802081b0:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    802081b2:	00023717          	auipc	a4,0x23
    802081b6:	e4e70713          	addi	a4,a4,-434 # 8022b000 <disk+0x1000>
    802081ba:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    802081bc:	4705                	li	a4,1
    802081be:	00e78c23          	sb	a4,24(a5)
    802081c2:	00e78ca3          	sb	a4,25(a5)
    802081c6:	00e78d23          	sb	a4,26(a5)
    802081ca:	00e78da3          	sb	a4,27(a5)
    802081ce:	00e78e23          	sb	a4,28(a5)
    802081d2:	00e78ea3          	sb	a4,29(a5)
    802081d6:	00e78f23          	sb	a4,30(a5)
    802081da:	00e78fa3          	sb	a4,31(a5)
}
    802081de:	60a2                	ld	ra,8(sp)
    802081e0:	6402                	ld	s0,0(sp)
    802081e2:	0141                	addi	sp,sp,16
    802081e4:	8082                	ret
    panic("could not find virtio disk");
    802081e6:	00003517          	auipc	a0,0x3
    802081ea:	f0250513          	addi	a0,a0,-254 # 8020b0e8 <digits+0xd68>
    802081ee:	ffff8097          	auipc	ra,0xffff8
    802081f2:	f56080e7          	jalr	-170(ra) # 80200144 <panic>
    panic("virtio disk has no queue 0");
    802081f6:	00003517          	auipc	a0,0x3
    802081fa:	f1250513          	addi	a0,a0,-238 # 8020b108 <digits+0xd88>
    802081fe:	ffff8097          	auipc	ra,0xffff8
    80208202:	f46080e7          	jalr	-186(ra) # 80200144 <panic>
    panic("virtio disk max queue too short");
    80208206:	00003517          	auipc	a0,0x3
    8020820a:	f2250513          	addi	a0,a0,-222 # 8020b128 <digits+0xda8>
    8020820e:	ffff8097          	auipc	ra,0xffff8
    80208212:	f36080e7          	jalr	-202(ra) # 80200144 <panic>

0000000080208216 <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    80208216:	7175                	addi	sp,sp,-144
    80208218:	e506                	sd	ra,136(sp)
    8020821a:	e122                	sd	s0,128(sp)
    8020821c:	fca6                	sd	s1,120(sp)
    8020821e:	f8ca                	sd	s2,112(sp)
    80208220:	f4ce                	sd	s3,104(sp)
    80208222:	f0d2                	sd	s4,96(sp)
    80208224:	ecd6                	sd	s5,88(sp)
    80208226:	e8da                	sd	s6,80(sp)
    80208228:	e4de                	sd	s7,72(sp)
    8020822a:	e0e2                	sd	s8,64(sp)
    8020822c:	fc66                	sd	s9,56(sp)
    8020822e:	f86a                	sd	s10,48(sp)
    80208230:	f46e                	sd	s11,40(sp)
    80208232:	0900                	addi	s0,sp,144
    80208234:	8aaa                	mv	s5,a0
    80208236:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    80208238:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    8020823c:	00024517          	auipc	a0,0x24
    80208240:	e6c50513          	addi	a0,a0,-404 # 8022c0a8 <disk+0x20a8>
    80208244:	ffff8097          	auipc	ra,0xffff8
    80208248:	482080e7          	jalr	1154(ra) # 802006c6 <acquire>
  for(int i = 0; i < 3; i++){
    8020824c:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    8020824e:	44a1                	li	s1,8
      disk.free[i] = 0;
    80208250:	00022c17          	auipc	s8,0x22
    80208254:	db0c0c13          	addi	s8,s8,-592 # 8022a000 <disk>
    80208258:	6b89                	lui	s7,0x2
  for(int i = 0; i < 3; i++){
    8020825a:	4b0d                	li	s6,3
    8020825c:	a0ad                	j	802082c6 <virtio_disk_rw+0xb0>
      disk.free[i] = 0;
    8020825e:	00fc0733          	add	a4,s8,a5
    80208262:	975e                	add	a4,a4,s7
    80208264:	00070c23          	sb	zero,24(a4)
    idx[i] = alloc_desc();
    80208268:	c19c                	sw	a5,0(a1)
    if(idx[i] < 0){
    8020826a:	0207c563          	bltz	a5,80208294 <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    8020826e:	2905                	addiw	s2,s2,1
    80208270:	0611                	addi	a2,a2,4 # 2004 <_entry-0x801fdffc>
    80208272:	19690e63          	beq	s2,s6,8020840e <virtio_disk_rw+0x1f8>
    idx[i] = alloc_desc();
    80208276:	85b2                	mv	a1,a2
  for(int i = 0; i < NUM; i++){
    80208278:	00024717          	auipc	a4,0x24
    8020827c:	da070713          	addi	a4,a4,-608 # 8022c018 <disk+0x2018>
    80208280:	87ce                	mv	a5,s3
    if(disk.free[i]){
    80208282:	00074683          	lbu	a3,0(a4)
    80208286:	fee1                	bnez	a3,8020825e <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    80208288:	2785                	addiw	a5,a5,1
    8020828a:	0705                	addi	a4,a4,1
    8020828c:	fe979be3          	bne	a5,s1,80208282 <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    80208290:	57fd                	li	a5,-1
    80208292:	c19c                	sw	a5,0(a1)
      for(int j = 0; j < i; j++)
    80208294:	01205d63          	blez	s2,802082ae <virtio_disk_rw+0x98>
    80208298:	8dce                	mv	s11,s3
        free_desc(idx[j]);
    8020829a:	000a2503          	lw	a0,0(s4)
    8020829e:	00000097          	auipc	ra,0x0
    802082a2:	d72080e7          	jalr	-654(ra) # 80208010 <free_desc>
      for(int j = 0; j < i; j++)
    802082a6:	2d85                	addiw	s11,s11,1
    802082a8:	0a11                	addi	s4,s4,4
    802082aa:	ff2d98e3          	bne	s11,s2,8020829a <virtio_disk_rw+0x84>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    802082ae:	00024597          	auipc	a1,0x24
    802082b2:	dfa58593          	addi	a1,a1,-518 # 8022c0a8 <disk+0x20a8>
    802082b6:	00024517          	auipc	a0,0x24
    802082ba:	d6250513          	addi	a0,a0,-670 # 8022c018 <disk+0x2018>
    802082be:	ffffa097          	auipc	ra,0xffffa
    802082c2:	0b8080e7          	jalr	184(ra) # 80202376 <sleep>
  for(int i = 0; i < 3; i++){
    802082c6:	f8040a13          	addi	s4,s0,-128
{
    802082ca:	8652                	mv	a2,s4
  for(int i = 0; i < 3; i++){
    802082cc:	894e                	mv	s2,s3
    802082ce:	b765                	j	80208276 <virtio_disk_rw+0x60>
  disk.desc[idx[0]].next = idx[1];

  disk.desc[idx[1]].addr = (uint64) b->data;
  disk.desc[idx[1]].len = BSIZE;
  if(write)
    disk.desc[idx[1]].flags = 0; // device reads b->data
    802082d0:	00024717          	auipc	a4,0x24
    802082d4:	d3073703          	ld	a4,-720(a4) # 8022c000 <disk+0x2000>
    802082d8:	973e                	add	a4,a4,a5
    802082da:	00071623          	sh	zero,12(a4)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    802082de:	00022517          	auipc	a0,0x22
    802082e2:	d2250513          	addi	a0,a0,-734 # 8022a000 <disk>
    802082e6:	00024717          	auipc	a4,0x24
    802082ea:	d1a70713          	addi	a4,a4,-742 # 8022c000 <disk+0x2000>
    802082ee:	6314                	ld	a3,0(a4)
    802082f0:	96be                	add	a3,a3,a5
    802082f2:	00c6d603          	lhu	a2,12(a3)
    802082f6:	00166613          	ori	a2,a2,1
    802082fa:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    802082fe:	f8842683          	lw	a3,-120(s0)
    80208302:	6310                	ld	a2,0(a4)
    80208304:	97b2                	add	a5,a5,a2
    80208306:	00d79723          	sh	a3,14(a5)

  disk.info[idx[0]].status = 0;
    8020830a:	20048613          	addi	a2,s1,512
    8020830e:	0612                	slli	a2,a2,0x4
    80208310:	962a                	add	a2,a2,a0
    80208312:	02060823          	sb	zero,48(a2)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80208316:	00469793          	slli	a5,a3,0x4
    8020831a:	630c                	ld	a1,0(a4)
    8020831c:	95be                	add	a1,a1,a5
    8020831e:	6689                	lui	a3,0x2
    80208320:	03068693          	addi	a3,a3,48 # 2030 <_entry-0x801fdfd0>
    80208324:	96ca                	add	a3,a3,s2
    80208326:	96aa                	add	a3,a3,a0
    80208328:	e194                	sd	a3,0(a1)
  disk.desc[idx[2]].len = 1;
    8020832a:	6314                	ld	a3,0(a4)
    8020832c:	96be                	add	a3,a3,a5
    8020832e:	4585                	li	a1,1
    80208330:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80208332:	6314                	ld	a3,0(a4)
    80208334:	96be                	add	a3,a3,a5
    80208336:	4509                	li	a0,2
    80208338:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    8020833c:	6314                	ld	a3,0(a4)
    8020833e:	97b6                	add	a5,a5,a3
    80208340:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80208344:	00baa223          	sw	a1,4(s5)
  disk.info[idx[0]].b = b;
    80208348:	03563423          	sd	s5,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    8020834c:	6714                	ld	a3,8(a4)
    8020834e:	0026d783          	lhu	a5,2(a3)
    80208352:	8b9d                	andi	a5,a5,7
    80208354:	0789                	addi	a5,a5,2
    80208356:	0786                	slli	a5,a5,0x1
    80208358:	96be                	add	a3,a3,a5
    8020835a:	00969023          	sh	s1,0(a3)
  __sync_synchronize();
    8020835e:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    80208362:	6718                	ld	a4,8(a4)
    80208364:	00275783          	lhu	a5,2(a4)
    80208368:	2785                	addiw	a5,a5,1
    8020836a:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    8020836e:	00003797          	auipc	a5,0x3
    80208372:	e4a7b783          	ld	a5,-438(a5) # 8020b1b8 <digits+0xe38>
    80208376:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    8020837a:	004aa783          	lw	a5,4(s5)
    8020837e:	02b79163          	bne	a5,a1,802083a0 <virtio_disk_rw+0x18a>
    sleep(b, &disk.vdisk_lock);
    80208382:	00024917          	auipc	s2,0x24
    80208386:	d2690913          	addi	s2,s2,-730 # 8022c0a8 <disk+0x20a8>
  while(b->disk == 1) {
    8020838a:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    8020838c:	85ca                	mv	a1,s2
    8020838e:	8556                	mv	a0,s5
    80208390:	ffffa097          	auipc	ra,0xffffa
    80208394:	fe6080e7          	jalr	-26(ra) # 80202376 <sleep>
  while(b->disk == 1) {
    80208398:	004aa783          	lw	a5,4(s5)
    8020839c:	fe9788e3          	beq	a5,s1,8020838c <virtio_disk_rw+0x176>
  }

  disk.info[idx[0]].b = 0;
    802083a0:	f8042483          	lw	s1,-128(s0)
    802083a4:	20048713          	addi	a4,s1,512
    802083a8:	0712                	slli	a4,a4,0x4
    802083aa:	00022797          	auipc	a5,0x22
    802083ae:	c5678793          	addi	a5,a5,-938 # 8022a000 <disk>
    802083b2:	97ba                	add	a5,a5,a4
    802083b4:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    802083b8:	00024917          	auipc	s2,0x24
    802083bc:	c4890913          	addi	s2,s2,-952 # 8022c000 <disk+0x2000>
    802083c0:	a019                	j	802083c6 <virtio_disk_rw+0x1b0>
      i = disk.desc[i].next;
    802083c2:	00e7d483          	lhu	s1,14(a5)
    free_desc(i);
    802083c6:	8526                	mv	a0,s1
    802083c8:	00000097          	auipc	ra,0x0
    802083cc:	c48080e7          	jalr	-952(ra) # 80208010 <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    802083d0:	0492                	slli	s1,s1,0x4
    802083d2:	00093783          	ld	a5,0(s2)
    802083d6:	97a6                	add	a5,a5,s1
    802083d8:	00c7d703          	lhu	a4,12(a5)
    802083dc:	8b05                	andi	a4,a4,1
    802083de:	f375                	bnez	a4,802083c2 <virtio_disk_rw+0x1ac>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    802083e0:	00024517          	auipc	a0,0x24
    802083e4:	cc850513          	addi	a0,a0,-824 # 8022c0a8 <disk+0x20a8>
    802083e8:	ffff8097          	auipc	ra,0xffff8
    802083ec:	332080e7          	jalr	818(ra) # 8020071a <release>
}
    802083f0:	60aa                	ld	ra,136(sp)
    802083f2:	640a                	ld	s0,128(sp)
    802083f4:	74e6                	ld	s1,120(sp)
    802083f6:	7946                	ld	s2,112(sp)
    802083f8:	79a6                	ld	s3,104(sp)
    802083fa:	7a06                	ld	s4,96(sp)
    802083fc:	6ae6                	ld	s5,88(sp)
    802083fe:	6b46                	ld	s6,80(sp)
    80208400:	6ba6                	ld	s7,72(sp)
    80208402:	6c06                	ld	s8,64(sp)
    80208404:	7ce2                	ld	s9,56(sp)
    80208406:	7d42                	ld	s10,48(sp)
    80208408:	7da2                	ld	s11,40(sp)
    8020840a:	6149                	addi	sp,sp,144
    8020840c:	8082                	ret
  if(write)
    8020840e:	019037b3          	snez	a5,s9
    80208412:	f6f42823          	sw	a5,-144(s0)
  buf0.reserved = 0;
    80208416:	f6042a23          	sw	zero,-140(s0)
  buf0.sector = sector;
    8020841a:	f7a43c23          	sd	s10,-136(s0)
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    8020841e:	ffff9097          	auipc	ra,0xffff9
    80208422:	698080e7          	jalr	1688(ra) # 80201ab6 <myproc>
    80208426:	f8042483          	lw	s1,-128(s0)
    8020842a:	00449913          	slli	s2,s1,0x4
    8020842e:	00024997          	auipc	s3,0x24
    80208432:	bd298993          	addi	s3,s3,-1070 # 8022c000 <disk+0x2000>
    80208436:	0009ba03          	ld	s4,0(s3)
    8020843a:	9a4a                	add	s4,s4,s2
    8020843c:	f7040593          	addi	a1,s0,-144
    80208440:	6d28                	ld	a0,88(a0)
    80208442:	ffff8097          	auipc	ra,0xffff8
    80208446:	7ae080e7          	jalr	1966(ra) # 80200bf0 <kwalkaddr>
    8020844a:	00aa3023          	sd	a0,0(s4)
  disk.desc[idx[0]].len = sizeof(buf0);
    8020844e:	0009b783          	ld	a5,0(s3)
    80208452:	97ca                	add	a5,a5,s2
    80208454:	4741                	li	a4,16
    80208456:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80208458:	0009b783          	ld	a5,0(s3)
    8020845c:	97ca                	add	a5,a5,s2
    8020845e:	4705                	li	a4,1
    80208460:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80208464:	f8442783          	lw	a5,-124(s0)
    80208468:	0009b703          	ld	a4,0(s3)
    8020846c:	974a                	add	a4,a4,s2
    8020846e:	00f71723          	sh	a5,14(a4)
  disk.desc[idx[1]].addr = (uint64) b->data;
    80208472:	0792                	slli	a5,a5,0x4
    80208474:	0009b703          	ld	a4,0(s3)
    80208478:	973e                	add	a4,a4,a5
    8020847a:	058a8693          	addi	a3,s5,88
    8020847e:	e314                	sd	a3,0(a4)
  disk.desc[idx[1]].len = BSIZE;
    80208480:	0009b703          	ld	a4,0(s3)
    80208484:	973e                	add	a4,a4,a5
    80208486:	20000693          	li	a3,512
    8020848a:	c714                	sw	a3,8(a4)
  if(write)
    8020848c:	e40c92e3          	bnez	s9,802082d0 <virtio_disk_rw+0xba>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80208490:	00024717          	auipc	a4,0x24
    80208494:	b7073703          	ld	a4,-1168(a4) # 8022c000 <disk+0x2000>
    80208498:	973e                	add	a4,a4,a5
    8020849a:	4689                	li	a3,2
    8020849c:	00d71623          	sh	a3,12(a4)
    802084a0:	bd3d                	j	802082de <virtio_disk_rw+0xc8>

00000000802084a2 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    802084a2:	1101                	addi	sp,sp,-32
    802084a4:	ec06                	sd	ra,24(sp)
    802084a6:	e822                	sd	s0,16(sp)
    802084a8:	e426                	sd	s1,8(sp)
    802084aa:	e04a                	sd	s2,0(sp)
    802084ac:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    802084ae:	00024517          	auipc	a0,0x24
    802084b2:	bfa50513          	addi	a0,a0,-1030 # 8022c0a8 <disk+0x20a8>
    802084b6:	ffff8097          	auipc	ra,0xffff8
    802084ba:	210080e7          	jalr	528(ra) # 802006c6 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    802084be:	00024717          	auipc	a4,0x24
    802084c2:	b4270713          	addi	a4,a4,-1214 # 8022c000 <disk+0x2000>
    802084c6:	02075783          	lhu	a5,32(a4)
    802084ca:	6b18                	ld	a4,16(a4)
    802084cc:	00275683          	lhu	a3,2(a4)
    802084d0:	8ebd                	xor	a3,a3,a5
    802084d2:	8a9d                	andi	a3,a3,7
    802084d4:	cab9                	beqz	a3,8020852a <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    802084d6:	00022917          	auipc	s2,0x22
    802084da:	b2a90913          	addi	s2,s2,-1238 # 8022a000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    802084de:	00024497          	auipc	s1,0x24
    802084e2:	b2248493          	addi	s1,s1,-1246 # 8022c000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    802084e6:	078e                	slli	a5,a5,0x3
    802084e8:	973e                	add	a4,a4,a5
    802084ea:	435c                	lw	a5,4(a4)
    if(disk.info[id].status != 0)
    802084ec:	20078713          	addi	a4,a5,512
    802084f0:	0712                	slli	a4,a4,0x4
    802084f2:	974a                	add	a4,a4,s2
    802084f4:	03074703          	lbu	a4,48(a4)
    802084f8:	e335                	bnez	a4,8020855c <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    802084fa:	20078793          	addi	a5,a5,512
    802084fe:	0792                	slli	a5,a5,0x4
    80208500:	97ca                	add	a5,a5,s2
    80208502:	7798                	ld	a4,40(a5)
    80208504:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    80208508:	7788                	ld	a0,40(a5)
    8020850a:	ffffa097          	auipc	ra,0xffffa
    8020850e:	fe8080e7          	jalr	-24(ra) # 802024f2 <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    80208512:	0204d783          	lhu	a5,32(s1)
    80208516:	2785                	addiw	a5,a5,1
    80208518:	8b9d                	andi	a5,a5,7
    8020851a:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    8020851e:	6898                	ld	a4,16(s1)
    80208520:	00275683          	lhu	a3,2(a4)
    80208524:	8a9d                	andi	a3,a3,7
    80208526:	fcf690e3          	bne	a3,a5,802084e6 <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8020852a:	00003797          	auipc	a5,0x3
    8020852e:	c967b783          	ld	a5,-874(a5) # 8020b1c0 <digits+0xe40>
    80208532:	439c                	lw	a5,0(a5)
    80208534:	8b8d                	andi	a5,a5,3
    80208536:	00003717          	auipc	a4,0x3
    8020853a:	c9273703          	ld	a4,-878(a4) # 8020b1c8 <digits+0xe48>
    8020853e:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    80208540:	00024517          	auipc	a0,0x24
    80208544:	b6850513          	addi	a0,a0,-1176 # 8022c0a8 <disk+0x20a8>
    80208548:	ffff8097          	auipc	ra,0xffff8
    8020854c:	1d2080e7          	jalr	466(ra) # 8020071a <release>
}
    80208550:	60e2                	ld	ra,24(sp)
    80208552:	6442                	ld	s0,16(sp)
    80208554:	64a2                	ld	s1,8(sp)
    80208556:	6902                	ld	s2,0(sp)
    80208558:	6105                	addi	sp,sp,32
    8020855a:	8082                	ret
      panic("virtio_disk_intr status");
    8020855c:	00003517          	auipc	a0,0x3
    80208560:	bec50513          	addi	a0,a0,-1044 # 8020b148 <digits+0xdc8>
    80208564:	ffff8097          	auipc	ra,0xffff8
    80208568:	be0080e7          	jalr	-1056(ra) # 80200144 <panic>
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
