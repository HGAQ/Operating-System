
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
    8020009a:	c34080e7          	jalr	-972(ra) # 80206cca <consputc>
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
    802000d0:	bfe080e7          	jalr	-1026(ra) # 80206cca <consputc>
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
    80200224:	aaa080e7          	jalr	-1366(ra) # 80206cca <consputc>
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
    802002b6:	a18080e7          	jalr	-1512(ra) # 80206cca <consputc>
  consputc('x');
    802002ba:	07800513          	li	a0,120
    802002be:	00007097          	auipc	ra,0x7
    802002c2:	a0c080e7          	jalr	-1524(ra) # 80206cca <consputc>
    802002c6:	84ea                	mv	s1,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c8:	03c95793          	srli	a5,s2,0x3c
    802002cc:	97da                	add	a5,a5,s6
    802002ce:	0007c503          	lbu	a0,0(a5)
    802002d2:	00007097          	auipc	ra,0x7
    802002d6:	9f8080e7          	jalr	-1544(ra) # 80206cca <consputc>
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
    802002fc:	9d2080e7          	jalr	-1582(ra) # 80206cca <consputc>
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
    8020031e:	9b0080e7          	jalr	-1616(ra) # 80206cca <consputc>
      break;
    80200322:	b719                	j	80200228 <printf+0x9a>
      consputc('%');
    80200324:	8556                	mv	a0,s5
    80200326:	00007097          	auipc	ra,0x7
    8020032a:	9a4080e7          	jalr	-1628(ra) # 80206cca <consputc>
      consputc(c);
    8020032e:	8526                	mv	a0,s1
    80200330:	00007097          	auipc	ra,0x7
    80200334:	99a080e7          	jalr	-1638(ra) # 80206cca <consputc>
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
    80200a1a:	072080e7          	jalr	114(ra) # 80206a88 <plicinithart>
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
    80200a3a:	464080e7          	jalr	1124(ra) # 80206e9a <consoleinit>
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
    80200a6a:	5d8080e7          	jalr	1496(ra) # 8020503e <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200a6e:	00002097          	auipc	ra,0x2
    80200a72:	c80080e7          	jalr	-896(ra) # 802026ee <trapinithart>
    procinit();
    80200a76:	00001097          	auipc	ra,0x1
    80200a7a:	f24080e7          	jalr	-220(ra) # 8020199a <procinit>
    plicinit();
    80200a7e:	00006097          	auipc	ra,0x6
    80200a82:	ff2080e7          	jalr	-14(ra) # 80206a70 <plicinit>
    plicinithart();
    80200a86:	00006097          	auipc	ra,0x6
    80200a8a:	002080e7          	jalr	2(ra) # 80206a88 <plicinithart>
    disk_init();
    80200a8e:	00004097          	auipc	ra,0x4
    80200a92:	64c080e7          	jalr	1612(ra) # 802050da <disk_init>
    binit();         // buffer cache
    80200a96:	00003097          	auipc	ra,0x3
    80200a9a:	8ce080e7          	jalr	-1842(ra) # 80203364 <binit>
    fileinit();      // file table
    80200a9e:	00003097          	auipc	ra,0x3
    80200aa2:	cd2080e7          	jalr	-814(ra) # 80203770 <fileinit>
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
    80201ab6:	d12080e7          	jalr	-750(ra) # 802057c4 <fat32_init>
    myproc()->cwd = ename("/");
    80201aba:	00000097          	auipc	ra,0x0
    80201abe:	f82080e7          	jalr	-126(ra) # 80201a3c <myproc>
    80201ac2:	84aa                	mv	s1,a0
    80201ac4:	00008517          	auipc	a0,0x8
    80201ac8:	b6c50513          	addi	a0,a0,-1172 # 80209630 <digits+0x2b0>
    80201acc:	00005097          	auipc	ra,0x5
    80201ad0:	f6a080e7          	jalr	-150(ra) # 80206a36 <ename>
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
    80201f02:	934080e7          	jalr	-1740(ra) # 80203832 <filedup>
    80201f06:	00a93023          	sd	a0,0(s2)
    80201f0a:	b7e5                	j	80201ef2 <fork+0xb0>
  np->cwd = edup(p->cwd);
    80201f0c:	158ab503          	ld	a0,344(s5)
    80201f10:	00004097          	auipc	ra,0x4
    80201f14:	120080e7          	jalr	288(ra) # 80206030 <edup>
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
    802021e8:	6a0080e7          	jalr	1696(ra) # 80203884 <fileclose>
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
    80202204:	112080e7          	jalr	274(ra) # 80206312 <eput>
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
    8020271e:	94c080e7          	jalr	-1716(ra) # 80205066 <set_next_timeout>
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
    802027fe:	2d0080e7          	jalr	720(ra) # 80206aca <plic_claim>
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
    80202844:	2b4080e7          	jalr	692(ra) # 80206af4 <plic_complete>
		return 1;
    80202848:	4505                	li	a0,1
    8020284a:	bf71                	j	802027e6 <devintr+0x1e>
				consoleintr(c);
    8020284c:	00004097          	auipc	ra,0x4
    80202850:	4bc080e7          	jalr	1212(ra) # 80206d08 <consoleintr>
    80202854:	b7ed                	j	8020283e <devintr+0x76>
			disk_intr();
    80202856:	00003097          	auipc	ra,0x3
    8020285a:	8d0080e7          	jalr	-1840(ra) # 80205126 <disk_intr>
    8020285e:	b7c5                	j	8020283e <devintr+0x76>
		timer_tick();
    80202860:	00003097          	auipc	ra,0x3
    80202864:	82c080e7          	jalr	-2004(ra) # 8020508c <timer_tick>
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
    80203030:	efe080e7          	jalr	-258(ra) # 80203f2a <exec>
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
    802032bc:	7179                	addi	sp,sp,-48
    802032be:	f406                	sd	ra,40(sp)
    802032c0:	f022                	sd	s0,32(sp)
    802032c2:	ec26                	sd	s1,24(sp)
    802032c4:	1800                	addi	s0,sp,48
  uint64 curr_addr;
  uint64 next_addr;
  if(argaddr(0, &next_addr) < 0)
    802032c6:	fd840593          	addi	a1,s0,-40
    802032ca:	4501                	li	a0,0
    802032cc:	00000097          	auipc	ra,0x0
    802032d0:	b78080e7          	jalr	-1160(ra) # 80202e44 <argaddr>
    return -1;
    802032d4:	54fd                	li	s1,-1
  if(argaddr(0, &next_addr) < 0)
    802032d6:	02054863          	bltz	a0,80203306 <sys_brk+0x4a>
  curr_addr = myproc()->sz; // Size of process memory
    802032da:	ffffe097          	auipc	ra,0xffffe
    802032de:	762080e7          	jalr	1890(ra) # 80201a3c <myproc>
    802032e2:	6524                	ld	s1,72(a0)
  printf("Running: BRK ... curr_addr: %d ... next_addr: %d\n", curr_addr, next_addr);
    802032e4:	fd843603          	ld	a2,-40(s0)
    802032e8:	85a6                	mv	a1,s1
    802032ea:	00006517          	auipc	a0,0x6
    802032ee:	7d650513          	addi	a0,a0,2006 # 80209ac0 <digits+0x740>
    802032f2:	ffffd097          	auipc	ra,0xffffd
    802032f6:	e9c080e7          	jalr	-356(ra) # 8020018e <printf>
  if (next_addr == 0)
    802032fa:	fd843503          	ld	a0,-40(s0)
    802032fe:	c501                	beqz	a0,80203306 <sys_brk+0x4a>
  {
    return curr_addr;
  }
  if (next_addr >= curr_addr)
    80203300:	00957963          	bgeu	a0,s1,80203312 <sys_brk+0x56>
  {
    if(growproc(next_addr - curr_addr) < 0)
      return -1;
    else return myproc()->sz;
  }
  return 0;
    80203304:	4481                	li	s1,0
}
    80203306:	8526                	mv	a0,s1
    80203308:	70a2                	ld	ra,40(sp)
    8020330a:	7402                	ld	s0,32(sp)
    8020330c:	64e2                	ld	s1,24(sp)
    8020330e:	6145                	addi	sp,sp,48
    80203310:	8082                	ret
    if(growproc(next_addr - curr_addr) < 0)
    80203312:	9d05                	subw	a0,a0,s1
    80203314:	fffff097          	auipc	ra,0xfffff
    80203318:	ab2080e7          	jalr	-1358(ra) # 80201dc6 <growproc>
      return -1;
    8020331c:	54fd                	li	s1,-1
    if(growproc(next_addr - curr_addr) < 0)
    8020331e:	fe0544e3          	bltz	a0,80203306 <sys_brk+0x4a>
    else return myproc()->sz;
    80203322:	ffffe097          	auipc	ra,0xffffe
    80203326:	71a080e7          	jalr	1818(ra) # 80201a3c <myproc>
    8020332a:	6524                	ld	s1,72(a0)
    8020332c:	bfe9                	j	80203306 <sys_brk+0x4a>

000000008020332e <sys_poweroff>:

// Power off QEMU
uint64
sys_poweroff(void)
{
    8020332e:	1141                	addi	sp,sp,-16
    80203330:	e406                	sd	ra,8(sp)
    80203332:	e022                	sd	s0,0(sp)
    80203334:	0800                	addi	s0,sp,16
  printf("Powering off...\n");
    80203336:	00006517          	auipc	a0,0x6
    8020333a:	7c250513          	addi	a0,a0,1986 # 80209af8 <digits+0x778>
    8020333e:	ffffd097          	auipc	ra,0xffffd
    80203342:	e50080e7          	jalr	-432(ra) # 8020018e <printf>
	SBI_CALL_0(SBI_SHUTDOWN);
    80203346:	4501                	li	a0,0
    80203348:	4581                	li	a1,0
    8020334a:	4601                	li	a2,0
    8020334c:	4681                	li	a3,0
    8020334e:	48a1                	li	a7,8
    80203350:	00000073          	ecall
  sbi_shutdown();
  panic("sys_poweroff");
    80203354:	00006517          	auipc	a0,0x6
    80203358:	7bc50513          	addi	a0,a0,1980 # 80209b10 <digits+0x790>
    8020335c:	ffffd097          	auipc	ra,0xffffd
    80203360:	de8080e7          	jalr	-536(ra) # 80200144 <panic>

0000000080203364 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80203364:	7139                	addi	sp,sp,-64
    80203366:	fc06                	sd	ra,56(sp)
    80203368:	f822                	sd	s0,48(sp)
    8020336a:	f426                	sd	s1,40(sp)
    8020336c:	f04a                	sd	s2,32(sp)
    8020336e:	ec4e                	sd	s3,24(sp)
    80203370:	e852                	sd	s4,16(sp)
    80203372:	e456                	sd	s5,8(sp)
    80203374:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80203376:	00006597          	auipc	a1,0x6
    8020337a:	7aa58593          	addi	a1,a1,1962 # 80209b20 <digits+0x7a0>
    8020337e:	00015517          	auipc	a0,0x15
    80203382:	77250513          	addi	a0,a0,1906 # 80218af0 <bcache>
    80203386:	ffffd097          	auipc	ra,0xffffd
    8020338a:	2fc080e7          	jalr	764(ra) # 80200682 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    8020338e:	00019797          	auipc	a5,0x19
    80203392:	76278793          	addi	a5,a5,1890 # 8021caf0 <bcache+0x4000>
    80203396:	0001a717          	auipc	a4,0x1a
    8020339a:	dc270713          	addi	a4,a4,-574 # 8021d158 <bcache+0x4668>
    8020339e:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    802033a2:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    802033a6:	00015497          	auipc	s1,0x15
    802033aa:	76248493          	addi	s1,s1,1890 # 80218b08 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    802033ae:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    802033b0:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    802033b2:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    802033b4:	00006a97          	auipc	s5,0x6
    802033b8:	774a8a93          	addi	s5,s5,1908 # 80209b28 <digits+0x7a8>
    b->refcnt = 0;
    802033bc:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    802033c0:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    802033c4:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    802033c8:	6b893783          	ld	a5,1720(s2)
    802033cc:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    802033ce:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    802033d2:	85d6                	mv	a1,s5
    802033d4:	01048513          	addi	a0,s1,16
    802033d8:	00000097          	auipc	ra,0x0
    802033dc:	26e080e7          	jalr	622(ra) # 80203646 <initsleeplock>
    bcache.head.next->prev = b;
    802033e0:	6b893783          	ld	a5,1720(s2)
    802033e4:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    802033e6:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    802033ea:	25848493          	addi	s1,s1,600
    802033ee:	fd3497e3          	bne	s1,s3,802033bc <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    802033f2:	70e2                	ld	ra,56(sp)
    802033f4:	7442                	ld	s0,48(sp)
    802033f6:	74a2                	ld	s1,40(sp)
    802033f8:	7902                	ld	s2,32(sp)
    802033fa:	69e2                	ld	s3,24(sp)
    802033fc:	6a42                	ld	s4,16(sp)
    802033fe:	6aa2                	ld	s5,8(sp)
    80203400:	6121                	addi	sp,sp,64
    80203402:	8082                	ret

0000000080203404 <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    80203404:	7179                	addi	sp,sp,-48
    80203406:	f406                	sd	ra,40(sp)
    80203408:	f022                	sd	s0,32(sp)
    8020340a:	ec26                	sd	s1,24(sp)
    8020340c:	e84a                	sd	s2,16(sp)
    8020340e:	e44e                	sd	s3,8(sp)
    80203410:	1800                	addi	s0,sp,48
    80203412:	892a                	mv	s2,a0
    80203414:	89ae                	mv	s3,a1
  acquire(&bcache.lock);
    80203416:	00015517          	auipc	a0,0x15
    8020341a:	6da50513          	addi	a0,a0,1754 # 80218af0 <bcache>
    8020341e:	ffffd097          	auipc	ra,0xffffd
    80203422:	2a8080e7          	jalr	680(ra) # 802006c6 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80203426:	0001a497          	auipc	s1,0x1a
    8020342a:	d824b483          	ld	s1,-638(s1) # 8021d1a8 <bcache+0x46b8>
    8020342e:	0001a797          	auipc	a5,0x1a
    80203432:	d2a78793          	addi	a5,a5,-726 # 8021d158 <bcache+0x4668>
    80203436:	02f48f63          	beq	s1,a5,80203474 <bread+0x70>
    8020343a:	873e                	mv	a4,a5
    8020343c:	a021                	j	80203444 <bread+0x40>
    8020343e:	68a4                	ld	s1,80(s1)
    80203440:	02e48a63          	beq	s1,a4,80203474 <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    80203444:	449c                	lw	a5,8(s1)
    80203446:	ff279ce3          	bne	a5,s2,8020343e <bread+0x3a>
    8020344a:	44dc                	lw	a5,12(s1)
    8020344c:	ff3799e3          	bne	a5,s3,8020343e <bread+0x3a>
      b->refcnt++;
    80203450:	40bc                	lw	a5,64(s1)
    80203452:	2785                	addiw	a5,a5,1
    80203454:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203456:	00015517          	auipc	a0,0x15
    8020345a:	69a50513          	addi	a0,a0,1690 # 80218af0 <bcache>
    8020345e:	ffffd097          	auipc	ra,0xffffd
    80203462:	2bc080e7          	jalr	700(ra) # 8020071a <release>
      acquiresleep(&b->lock);
    80203466:	01048513          	addi	a0,s1,16
    8020346a:	00000097          	auipc	ra,0x0
    8020346e:	216080e7          	jalr	534(ra) # 80203680 <acquiresleep>
      return b;
    80203472:	a8b9                	j	802034d0 <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203474:	0001a497          	auipc	s1,0x1a
    80203478:	d2c4b483          	ld	s1,-724(s1) # 8021d1a0 <bcache+0x46b0>
    8020347c:	0001a797          	auipc	a5,0x1a
    80203480:	cdc78793          	addi	a5,a5,-804 # 8021d158 <bcache+0x4668>
    80203484:	00f48863          	beq	s1,a5,80203494 <bread+0x90>
    80203488:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    8020348a:	40bc                	lw	a5,64(s1)
    8020348c:	cf81                	beqz	a5,802034a4 <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8020348e:	64a4                	ld	s1,72(s1)
    80203490:	fee49de3          	bne	s1,a4,8020348a <bread+0x86>
  panic("bget: no buffers");
    80203494:	00006517          	auipc	a0,0x6
    80203498:	69c50513          	addi	a0,a0,1692 # 80209b30 <digits+0x7b0>
    8020349c:	ffffd097          	auipc	ra,0xffffd
    802034a0:	ca8080e7          	jalr	-856(ra) # 80200144 <panic>
      b->dev = dev;
    802034a4:	0124a423          	sw	s2,8(s1)
      b->sectorno = sectorno;
    802034a8:	0134a623          	sw	s3,12(s1)
      b->valid = 0;
    802034ac:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    802034b0:	4785                	li	a5,1
    802034b2:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    802034b4:	00015517          	auipc	a0,0x15
    802034b8:	63c50513          	addi	a0,a0,1596 # 80218af0 <bcache>
    802034bc:	ffffd097          	auipc	ra,0xffffd
    802034c0:	25e080e7          	jalr	606(ra) # 8020071a <release>
      acquiresleep(&b->lock);
    802034c4:	01048513          	addi	a0,s1,16
    802034c8:	00000097          	auipc	ra,0x0
    802034cc:	1b8080e7          	jalr	440(ra) # 80203680 <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    802034d0:	409c                	lw	a5,0(s1)
    802034d2:	cb89                	beqz	a5,802034e4 <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    802034d4:	8526                	mv	a0,s1
    802034d6:	70a2                	ld	ra,40(sp)
    802034d8:	7402                	ld	s0,32(sp)
    802034da:	64e2                	ld	s1,24(sp)
    802034dc:	6942                	ld	s2,16(sp)
    802034de:	69a2                	ld	s3,8(sp)
    802034e0:	6145                	addi	sp,sp,48
    802034e2:	8082                	ret
    disk_read(b);
    802034e4:	8526                	mv	a0,s1
    802034e6:	00002097          	auipc	ra,0x2
    802034ea:	c0c080e7          	jalr	-1012(ra) # 802050f2 <disk_read>
    b->valid = 1;
    802034ee:	4785                	li	a5,1
    802034f0:	c09c                	sw	a5,0(s1)
  return b;
    802034f2:	b7cd                	j	802034d4 <bread+0xd0>

00000000802034f4 <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    802034f4:	1101                	addi	sp,sp,-32
    802034f6:	ec06                	sd	ra,24(sp)
    802034f8:	e822                	sd	s0,16(sp)
    802034fa:	e426                	sd	s1,8(sp)
    802034fc:	1000                	addi	s0,sp,32
    802034fe:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203500:	0541                	addi	a0,a0,16
    80203502:	00000097          	auipc	ra,0x0
    80203506:	218080e7          	jalr	536(ra) # 8020371a <holdingsleep>
    8020350a:	c919                	beqz	a0,80203520 <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    8020350c:	8526                	mv	a0,s1
    8020350e:	00002097          	auipc	ra,0x2
    80203512:	bfe080e7          	jalr	-1026(ra) # 8020510c <disk_write>
}
    80203516:	60e2                	ld	ra,24(sp)
    80203518:	6442                	ld	s0,16(sp)
    8020351a:	64a2                	ld	s1,8(sp)
    8020351c:	6105                	addi	sp,sp,32
    8020351e:	8082                	ret
    panic("bwrite");
    80203520:	00006517          	auipc	a0,0x6
    80203524:	62850513          	addi	a0,a0,1576 # 80209b48 <digits+0x7c8>
    80203528:	ffffd097          	auipc	ra,0xffffd
    8020352c:	c1c080e7          	jalr	-996(ra) # 80200144 <panic>

0000000080203530 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80203530:	1101                	addi	sp,sp,-32
    80203532:	ec06                	sd	ra,24(sp)
    80203534:	e822                	sd	s0,16(sp)
    80203536:	e426                	sd	s1,8(sp)
    80203538:	e04a                	sd	s2,0(sp)
    8020353a:	1000                	addi	s0,sp,32
    8020353c:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    8020353e:	01050913          	addi	s2,a0,16
    80203542:	854a                	mv	a0,s2
    80203544:	00000097          	auipc	ra,0x0
    80203548:	1d6080e7          	jalr	470(ra) # 8020371a <holdingsleep>
    8020354c:	c92d                	beqz	a0,802035be <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    8020354e:	854a                	mv	a0,s2
    80203550:	00000097          	auipc	ra,0x0
    80203554:	186080e7          	jalr	390(ra) # 802036d6 <releasesleep>

  acquire(&bcache.lock);
    80203558:	00015517          	auipc	a0,0x15
    8020355c:	59850513          	addi	a0,a0,1432 # 80218af0 <bcache>
    80203560:	ffffd097          	auipc	ra,0xffffd
    80203564:	166080e7          	jalr	358(ra) # 802006c6 <acquire>
  b->refcnt--;
    80203568:	40bc                	lw	a5,64(s1)
    8020356a:	37fd                	addiw	a5,a5,-1
    8020356c:	0007871b          	sext.w	a4,a5
    80203570:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80203572:	eb05                	bnez	a4,802035a2 <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80203574:	68bc                	ld	a5,80(s1)
    80203576:	64b8                	ld	a4,72(s1)
    80203578:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    8020357a:	64bc                	ld	a5,72(s1)
    8020357c:	68b8                	ld	a4,80(s1)
    8020357e:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80203580:	00019797          	auipc	a5,0x19
    80203584:	57078793          	addi	a5,a5,1392 # 8021caf0 <bcache+0x4000>
    80203588:	6b87b703          	ld	a4,1720(a5)
    8020358c:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    8020358e:	0001a717          	auipc	a4,0x1a
    80203592:	bca70713          	addi	a4,a4,-1078 # 8021d158 <bcache+0x4668>
    80203596:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    80203598:	6b87b703          	ld	a4,1720(a5)
    8020359c:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    8020359e:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    802035a2:	00015517          	auipc	a0,0x15
    802035a6:	54e50513          	addi	a0,a0,1358 # 80218af0 <bcache>
    802035aa:	ffffd097          	auipc	ra,0xffffd
    802035ae:	170080e7          	jalr	368(ra) # 8020071a <release>
}
    802035b2:	60e2                	ld	ra,24(sp)
    802035b4:	6442                	ld	s0,16(sp)
    802035b6:	64a2                	ld	s1,8(sp)
    802035b8:	6902                	ld	s2,0(sp)
    802035ba:	6105                	addi	sp,sp,32
    802035bc:	8082                	ret
    panic("brelse");
    802035be:	00006517          	auipc	a0,0x6
    802035c2:	59250513          	addi	a0,a0,1426 # 80209b50 <digits+0x7d0>
    802035c6:	ffffd097          	auipc	ra,0xffffd
    802035ca:	b7e080e7          	jalr	-1154(ra) # 80200144 <panic>

00000000802035ce <bpin>:

void
bpin(struct buf *b) {
    802035ce:	1101                	addi	sp,sp,-32
    802035d0:	ec06                	sd	ra,24(sp)
    802035d2:	e822                	sd	s0,16(sp)
    802035d4:	e426                	sd	s1,8(sp)
    802035d6:	1000                	addi	s0,sp,32
    802035d8:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    802035da:	00015517          	auipc	a0,0x15
    802035de:	51650513          	addi	a0,a0,1302 # 80218af0 <bcache>
    802035e2:	ffffd097          	auipc	ra,0xffffd
    802035e6:	0e4080e7          	jalr	228(ra) # 802006c6 <acquire>
  b->refcnt++;
    802035ea:	40bc                	lw	a5,64(s1)
    802035ec:	2785                	addiw	a5,a5,1
    802035ee:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    802035f0:	00015517          	auipc	a0,0x15
    802035f4:	50050513          	addi	a0,a0,1280 # 80218af0 <bcache>
    802035f8:	ffffd097          	auipc	ra,0xffffd
    802035fc:	122080e7          	jalr	290(ra) # 8020071a <release>
}
    80203600:	60e2                	ld	ra,24(sp)
    80203602:	6442                	ld	s0,16(sp)
    80203604:	64a2                	ld	s1,8(sp)
    80203606:	6105                	addi	sp,sp,32
    80203608:	8082                	ret

000000008020360a <bunpin>:

void
bunpin(struct buf *b) {
    8020360a:	1101                	addi	sp,sp,-32
    8020360c:	ec06                	sd	ra,24(sp)
    8020360e:	e822                	sd	s0,16(sp)
    80203610:	e426                	sd	s1,8(sp)
    80203612:	1000                	addi	s0,sp,32
    80203614:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203616:	00015517          	auipc	a0,0x15
    8020361a:	4da50513          	addi	a0,a0,1242 # 80218af0 <bcache>
    8020361e:	ffffd097          	auipc	ra,0xffffd
    80203622:	0a8080e7          	jalr	168(ra) # 802006c6 <acquire>
  b->refcnt--;
    80203626:	40bc                	lw	a5,64(s1)
    80203628:	37fd                	addiw	a5,a5,-1
    8020362a:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    8020362c:	00015517          	auipc	a0,0x15
    80203630:	4c450513          	addi	a0,a0,1220 # 80218af0 <bcache>
    80203634:	ffffd097          	auipc	ra,0xffffd
    80203638:	0e6080e7          	jalr	230(ra) # 8020071a <release>
}
    8020363c:	60e2                	ld	ra,24(sp)
    8020363e:	6442                	ld	s0,16(sp)
    80203640:	64a2                	ld	s1,8(sp)
    80203642:	6105                	addi	sp,sp,32
    80203644:	8082                	ret

0000000080203646 <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203646:	1101                	addi	sp,sp,-32
    80203648:	ec06                	sd	ra,24(sp)
    8020364a:	e822                	sd	s0,16(sp)
    8020364c:	e426                	sd	s1,8(sp)
    8020364e:	e04a                	sd	s2,0(sp)
    80203650:	1000                	addi	s0,sp,32
    80203652:	84aa                	mv	s1,a0
    80203654:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203656:	00006597          	auipc	a1,0x6
    8020365a:	50258593          	addi	a1,a1,1282 # 80209b58 <digits+0x7d8>
    8020365e:	0521                	addi	a0,a0,8
    80203660:	ffffd097          	auipc	ra,0xffffd
    80203664:	022080e7          	jalr	34(ra) # 80200682 <initlock>
  lk->name = name;
    80203668:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    8020366c:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203670:	0204a423          	sw	zero,40(s1)
}
    80203674:	60e2                	ld	ra,24(sp)
    80203676:	6442                	ld	s0,16(sp)
    80203678:	64a2                	ld	s1,8(sp)
    8020367a:	6902                	ld	s2,0(sp)
    8020367c:	6105                	addi	sp,sp,32
    8020367e:	8082                	ret

0000000080203680 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80203680:	1101                	addi	sp,sp,-32
    80203682:	ec06                	sd	ra,24(sp)
    80203684:	e822                	sd	s0,16(sp)
    80203686:	e426                	sd	s1,8(sp)
    80203688:	e04a                	sd	s2,0(sp)
    8020368a:	1000                	addi	s0,sp,32
    8020368c:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    8020368e:	00850913          	addi	s2,a0,8
    80203692:	854a                	mv	a0,s2
    80203694:	ffffd097          	auipc	ra,0xffffd
    80203698:	032080e7          	jalr	50(ra) # 802006c6 <acquire>
  while (lk->locked) {
    8020369c:	409c                	lw	a5,0(s1)
    8020369e:	cb89                	beqz	a5,802036b0 <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    802036a0:	85ca                	mv	a1,s2
    802036a2:	8526                	mv	a0,s1
    802036a4:	fffff097          	auipc	ra,0xfffff
    802036a8:	c3c080e7          	jalr	-964(ra) # 802022e0 <sleep>
  while (lk->locked) {
    802036ac:	409c                	lw	a5,0(s1)
    802036ae:	fbed                	bnez	a5,802036a0 <acquiresleep+0x20>
  }
  lk->locked = 1;
    802036b0:	4785                	li	a5,1
    802036b2:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    802036b4:	ffffe097          	auipc	ra,0xffffe
    802036b8:	388080e7          	jalr	904(ra) # 80201a3c <myproc>
    802036bc:	5d1c                	lw	a5,56(a0)
    802036be:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    802036c0:	854a                	mv	a0,s2
    802036c2:	ffffd097          	auipc	ra,0xffffd
    802036c6:	058080e7          	jalr	88(ra) # 8020071a <release>
}
    802036ca:	60e2                	ld	ra,24(sp)
    802036cc:	6442                	ld	s0,16(sp)
    802036ce:	64a2                	ld	s1,8(sp)
    802036d0:	6902                	ld	s2,0(sp)
    802036d2:	6105                	addi	sp,sp,32
    802036d4:	8082                	ret

00000000802036d6 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    802036d6:	1101                	addi	sp,sp,-32
    802036d8:	ec06                	sd	ra,24(sp)
    802036da:	e822                	sd	s0,16(sp)
    802036dc:	e426                	sd	s1,8(sp)
    802036de:	e04a                	sd	s2,0(sp)
    802036e0:	1000                	addi	s0,sp,32
    802036e2:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    802036e4:	00850913          	addi	s2,a0,8
    802036e8:	854a                	mv	a0,s2
    802036ea:	ffffd097          	auipc	ra,0xffffd
    802036ee:	fdc080e7          	jalr	-36(ra) # 802006c6 <acquire>
  lk->locked = 0;
    802036f2:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    802036f6:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    802036fa:	8526                	mv	a0,s1
    802036fc:	fffff097          	auipc	ra,0xfffff
    80203700:	d60080e7          	jalr	-672(ra) # 8020245c <wakeup>
  release(&lk->lk);
    80203704:	854a                	mv	a0,s2
    80203706:	ffffd097          	auipc	ra,0xffffd
    8020370a:	014080e7          	jalr	20(ra) # 8020071a <release>
}
    8020370e:	60e2                	ld	ra,24(sp)
    80203710:	6442                	ld	s0,16(sp)
    80203712:	64a2                	ld	s1,8(sp)
    80203714:	6902                	ld	s2,0(sp)
    80203716:	6105                	addi	sp,sp,32
    80203718:	8082                	ret

000000008020371a <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    8020371a:	7179                	addi	sp,sp,-48
    8020371c:	f406                	sd	ra,40(sp)
    8020371e:	f022                	sd	s0,32(sp)
    80203720:	ec26                	sd	s1,24(sp)
    80203722:	e84a                	sd	s2,16(sp)
    80203724:	e44e                	sd	s3,8(sp)
    80203726:	1800                	addi	s0,sp,48
    80203728:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    8020372a:	00850913          	addi	s2,a0,8
    8020372e:	854a                	mv	a0,s2
    80203730:	ffffd097          	auipc	ra,0xffffd
    80203734:	f96080e7          	jalr	-106(ra) # 802006c6 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203738:	409c                	lw	a5,0(s1)
    8020373a:	ef99                	bnez	a5,80203758 <holdingsleep+0x3e>
    8020373c:	4481                	li	s1,0
  release(&lk->lk);
    8020373e:	854a                	mv	a0,s2
    80203740:	ffffd097          	auipc	ra,0xffffd
    80203744:	fda080e7          	jalr	-38(ra) # 8020071a <release>
  return r;
}
    80203748:	8526                	mv	a0,s1
    8020374a:	70a2                	ld	ra,40(sp)
    8020374c:	7402                	ld	s0,32(sp)
    8020374e:	64e2                	ld	s1,24(sp)
    80203750:	6942                	ld	s2,16(sp)
    80203752:	69a2                	ld	s3,8(sp)
    80203754:	6145                	addi	sp,sp,48
    80203756:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203758:	0284a983          	lw	s3,40(s1)
    8020375c:	ffffe097          	auipc	ra,0xffffe
    80203760:	2e0080e7          	jalr	736(ra) # 80201a3c <myproc>
    80203764:	5d04                	lw	s1,56(a0)
    80203766:	413484b3          	sub	s1,s1,s3
    8020376a:	0014b493          	seqz	s1,s1
    8020376e:	bfc1                	j	8020373e <holdingsleep+0x24>

0000000080203770 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203770:	1101                	addi	sp,sp,-32
    80203772:	ec06                	sd	ra,24(sp)
    80203774:	e822                	sd	s0,16(sp)
    80203776:	e426                	sd	s1,8(sp)
    80203778:	e04a                	sd	s2,0(sp)
    8020377a:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    8020377c:	00006597          	auipc	a1,0x6
    80203780:	3ec58593          	addi	a1,a1,1004 # 80209b68 <digits+0x7e8>
    80203784:	0001a517          	auipc	a0,0x1a
    80203788:	ccc50513          	addi	a0,a0,-820 # 8021d450 <ftable>
    8020378c:	ffffd097          	auipc	ra,0xffffd
    80203790:	ef6080e7          	jalr	-266(ra) # 80200682 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203794:	0001a497          	auipc	s1,0x1a
    80203798:	cd448493          	addi	s1,s1,-812 # 8021d468 <ftable+0x18>
    8020379c:	0001b917          	auipc	s2,0x1b
    802037a0:	c6c90913          	addi	s2,s2,-916 # 8021e408 <tickslock>
    memset(f, 0, sizeof(struct file));
    802037a4:	02800613          	li	a2,40
    802037a8:	4581                	li	a1,0
    802037aa:	8526                	mv	a0,s1
    802037ac:	ffffd097          	auipc	ra,0xffffd
    802037b0:	fb6080e7          	jalr	-74(ra) # 80200762 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    802037b4:	02848493          	addi	s1,s1,40
    802037b8:	ff2496e3          	bne	s1,s2,802037a4 <fileinit+0x34>
  }
  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    802037bc:	60e2                	ld	ra,24(sp)
    802037be:	6442                	ld	s0,16(sp)
    802037c0:	64a2                	ld	s1,8(sp)
    802037c2:	6902                	ld	s2,0(sp)
    802037c4:	6105                	addi	sp,sp,32
    802037c6:	8082                	ret

00000000802037c8 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    802037c8:	1101                	addi	sp,sp,-32
    802037ca:	ec06                	sd	ra,24(sp)
    802037cc:	e822                	sd	s0,16(sp)
    802037ce:	e426                	sd	s1,8(sp)
    802037d0:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    802037d2:	0001a517          	auipc	a0,0x1a
    802037d6:	c7e50513          	addi	a0,a0,-898 # 8021d450 <ftable>
    802037da:	ffffd097          	auipc	ra,0xffffd
    802037de:	eec080e7          	jalr	-276(ra) # 802006c6 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    802037e2:	0001a497          	auipc	s1,0x1a
    802037e6:	c8648493          	addi	s1,s1,-890 # 8021d468 <ftable+0x18>
    802037ea:	0001b717          	auipc	a4,0x1b
    802037ee:	c1e70713          	addi	a4,a4,-994 # 8021e408 <tickslock>
    if(f->ref == 0){
    802037f2:	40dc                	lw	a5,4(s1)
    802037f4:	cf99                	beqz	a5,80203812 <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    802037f6:	02848493          	addi	s1,s1,40
    802037fa:	fee49ce3          	bne	s1,a4,802037f2 <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    802037fe:	0001a517          	auipc	a0,0x1a
    80203802:	c5250513          	addi	a0,a0,-942 # 8021d450 <ftable>
    80203806:	ffffd097          	auipc	ra,0xffffd
    8020380a:	f14080e7          	jalr	-236(ra) # 8020071a <release>
  return NULL;
    8020380e:	4481                	li	s1,0
    80203810:	a819                	j	80203826 <filealloc+0x5e>
      f->ref = 1;
    80203812:	4785                	li	a5,1
    80203814:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203816:	0001a517          	auipc	a0,0x1a
    8020381a:	c3a50513          	addi	a0,a0,-966 # 8021d450 <ftable>
    8020381e:	ffffd097          	auipc	ra,0xffffd
    80203822:	efc080e7          	jalr	-260(ra) # 8020071a <release>
}
    80203826:	8526                	mv	a0,s1
    80203828:	60e2                	ld	ra,24(sp)
    8020382a:	6442                	ld	s0,16(sp)
    8020382c:	64a2                	ld	s1,8(sp)
    8020382e:	6105                	addi	sp,sp,32
    80203830:	8082                	ret

0000000080203832 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203832:	1101                	addi	sp,sp,-32
    80203834:	ec06                	sd	ra,24(sp)
    80203836:	e822                	sd	s0,16(sp)
    80203838:	e426                	sd	s1,8(sp)
    8020383a:	1000                	addi	s0,sp,32
    8020383c:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    8020383e:	0001a517          	auipc	a0,0x1a
    80203842:	c1250513          	addi	a0,a0,-1006 # 8021d450 <ftable>
    80203846:	ffffd097          	auipc	ra,0xffffd
    8020384a:	e80080e7          	jalr	-384(ra) # 802006c6 <acquire>
  if(f->ref < 1)
    8020384e:	40dc                	lw	a5,4(s1)
    80203850:	02f05263          	blez	a5,80203874 <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203854:	2785                	addiw	a5,a5,1
    80203856:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203858:	0001a517          	auipc	a0,0x1a
    8020385c:	bf850513          	addi	a0,a0,-1032 # 8021d450 <ftable>
    80203860:	ffffd097          	auipc	ra,0xffffd
    80203864:	eba080e7          	jalr	-326(ra) # 8020071a <release>
  return f;
}
    80203868:	8526                	mv	a0,s1
    8020386a:	60e2                	ld	ra,24(sp)
    8020386c:	6442                	ld	s0,16(sp)
    8020386e:	64a2                	ld	s1,8(sp)
    80203870:	6105                	addi	sp,sp,32
    80203872:	8082                	ret
    panic("filedup");
    80203874:	00006517          	auipc	a0,0x6
    80203878:	2fc50513          	addi	a0,a0,764 # 80209b70 <digits+0x7f0>
    8020387c:	ffffd097          	auipc	ra,0xffffd
    80203880:	8c8080e7          	jalr	-1848(ra) # 80200144 <panic>

0000000080203884 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80203884:	7139                	addi	sp,sp,-64
    80203886:	fc06                	sd	ra,56(sp)
    80203888:	f822                	sd	s0,48(sp)
    8020388a:	f426                	sd	s1,40(sp)
    8020388c:	f04a                	sd	s2,32(sp)
    8020388e:	ec4e                	sd	s3,24(sp)
    80203890:	e852                	sd	s4,16(sp)
    80203892:	e456                	sd	s5,8(sp)
    80203894:	0080                	addi	s0,sp,64
    80203896:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80203898:	0001a517          	auipc	a0,0x1a
    8020389c:	bb850513          	addi	a0,a0,-1096 # 8021d450 <ftable>
    802038a0:	ffffd097          	auipc	ra,0xffffd
    802038a4:	e26080e7          	jalr	-474(ra) # 802006c6 <acquire>
  if(f->ref < 1)
    802038a8:	40dc                	lw	a5,4(s1)
    802038aa:	04f05863          	blez	a5,802038fa <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    802038ae:	37fd                	addiw	a5,a5,-1
    802038b0:	0007871b          	sext.w	a4,a5
    802038b4:	c0dc                	sw	a5,4(s1)
    802038b6:	04e04a63          	bgtz	a4,8020390a <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    802038ba:	0004a903          	lw	s2,0(s1)
    802038be:	0094ca03          	lbu	s4,9(s1)
    802038c2:	0104b983          	ld	s3,16(s1)
    802038c6:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    802038ca:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    802038ce:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    802038d2:	0001a517          	auipc	a0,0x1a
    802038d6:	b7e50513          	addi	a0,a0,-1154 # 8021d450 <ftable>
    802038da:	ffffd097          	auipc	ra,0xffffd
    802038de:	e40080e7          	jalr	-448(ra) # 8020071a <release>

  if(ff.type == FD_PIPE){
    802038e2:	4785                	li	a5,1
    802038e4:	04f90463          	beq	s2,a5,8020392c <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    802038e8:	4789                	li	a5,2
    802038ea:	02f91863          	bne	s2,a5,8020391a <fileclose+0x96>
    eput(ff.ep);
    802038ee:	8556                	mv	a0,s5
    802038f0:	00003097          	auipc	ra,0x3
    802038f4:	a22080e7          	jalr	-1502(ra) # 80206312 <eput>
    802038f8:	a00d                	j	8020391a <fileclose+0x96>
    panic("fileclose");
    802038fa:	00006517          	auipc	a0,0x6
    802038fe:	27e50513          	addi	a0,a0,638 # 80209b78 <digits+0x7f8>
    80203902:	ffffd097          	auipc	ra,0xffffd
    80203906:	842080e7          	jalr	-1982(ra) # 80200144 <panic>
    release(&ftable.lock);
    8020390a:	0001a517          	auipc	a0,0x1a
    8020390e:	b4650513          	addi	a0,a0,-1210 # 8021d450 <ftable>
    80203912:	ffffd097          	auipc	ra,0xffffd
    80203916:	e08080e7          	jalr	-504(ra) # 8020071a <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    8020391a:	70e2                	ld	ra,56(sp)
    8020391c:	7442                	ld	s0,48(sp)
    8020391e:	74a2                	ld	s1,40(sp)
    80203920:	7902                	ld	s2,32(sp)
    80203922:	69e2                	ld	s3,24(sp)
    80203924:	6a42                	ld	s4,16(sp)
    80203926:	6aa2                	ld	s5,8(sp)
    80203928:	6121                	addi	sp,sp,64
    8020392a:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    8020392c:	85d2                	mv	a1,s4
    8020392e:	854e                	mv	a0,s3
    80203930:	00000097          	auipc	ra,0x0
    80203934:	3a0080e7          	jalr	928(ra) # 80203cd0 <pipeclose>
    80203938:	b7cd                	j	8020391a <fileclose+0x96>

000000008020393a <filestat>:
filestat(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();
  struct stat st;
  
  if(f->type == FD_ENTRY){
    8020393a:	4118                	lw	a4,0(a0)
    8020393c:	4789                	li	a5,2
    8020393e:	04f71e63          	bne	a4,a5,8020399a <filestat+0x60>
{
    80203942:	7159                	addi	sp,sp,-112
    80203944:	f486                	sd	ra,104(sp)
    80203946:	f0a2                	sd	s0,96(sp)
    80203948:	eca6                	sd	s1,88(sp)
    8020394a:	e8ca                	sd	s2,80(sp)
    8020394c:	e4ce                	sd	s3,72(sp)
    8020394e:	1880                	addi	s0,sp,112
    80203950:	84aa                	mv	s1,a0
    80203952:	892e                	mv	s2,a1
    elock(f->ep);
    80203954:	6d08                	ld	a0,24(a0)
    80203956:	00003097          	auipc	ra,0x3
    8020395a:	938080e7          	jalr	-1736(ra) # 8020628e <elock>
    estat(f->ep, &st);
    8020395e:	f9840993          	addi	s3,s0,-104
    80203962:	85ce                	mv	a1,s3
    80203964:	6c88                	ld	a0,24(s1)
    80203966:	00003097          	auipc	ra,0x3
    8020396a:	ae4080e7          	jalr	-1308(ra) # 8020644a <estat>
    eunlock(f->ep);
    8020396e:	6c88                	ld	a0,24(s1)
    80203970:	00003097          	auipc	ra,0x3
    80203974:	954080e7          	jalr	-1708(ra) # 802062c4 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203978:	03800613          	li	a2,56
    8020397c:	85ce                	mv	a1,s3
    8020397e:	854a                	mv	a0,s2
    80203980:	ffffe097          	auipc	ra,0xffffe
    80203984:	9f2080e7          	jalr	-1550(ra) # 80201372 <copyout2>
    80203988:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    8020398c:	70a6                	ld	ra,104(sp)
    8020398e:	7406                	ld	s0,96(sp)
    80203990:	64e6                	ld	s1,88(sp)
    80203992:	6946                	ld	s2,80(sp)
    80203994:	69a6                	ld	s3,72(sp)
    80203996:	6165                	addi	sp,sp,112
    80203998:	8082                	ret
  return -1;
    8020399a:	557d                	li	a0,-1
}
    8020399c:	8082                	ret

000000008020399e <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    8020399e:	7179                	addi	sp,sp,-48
    802039a0:	f406                	sd	ra,40(sp)
    802039a2:	f022                	sd	s0,32(sp)
    802039a4:	ec26                	sd	s1,24(sp)
    802039a6:	e84a                	sd	s2,16(sp)
    802039a8:	e44e                	sd	s3,8(sp)
    802039aa:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    802039ac:	00854783          	lbu	a5,8(a0)
    802039b0:	c3d5                	beqz	a5,80203a54 <fileread+0xb6>
    802039b2:	84aa                	mv	s1,a0
    802039b4:	89ae                	mv	s3,a1
    802039b6:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    802039b8:	411c                	lw	a5,0(a0)
    802039ba:	4709                	li	a4,2
    802039bc:	06e78263          	beq	a5,a4,80203a20 <fileread+0x82>
    802039c0:	470d                	li	a4,3
    802039c2:	02e78b63          	beq	a5,a4,802039f8 <fileread+0x5a>
    802039c6:	4705                	li	a4,1
    802039c8:	00e78a63          	beq	a5,a4,802039dc <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    802039cc:	00006517          	auipc	a0,0x6
    802039d0:	1bc50513          	addi	a0,a0,444 # 80209b88 <digits+0x808>
    802039d4:	ffffc097          	auipc	ra,0xffffc
    802039d8:	770080e7          	jalr	1904(ra) # 80200144 <panic>
        r = piperead(f->pipe, addr, n);
    802039dc:	6908                	ld	a0,16(a0)
    802039de:	00000097          	auipc	ra,0x0
    802039e2:	466080e7          	jalr	1126(ra) # 80203e44 <piperead>
    802039e6:	892a                	mv	s2,a0
  }

  return r;
}
    802039e8:	854a                	mv	a0,s2
    802039ea:	70a2                	ld	ra,40(sp)
    802039ec:	7402                	ld	s0,32(sp)
    802039ee:	64e2                	ld	s1,24(sp)
    802039f0:	6942                	ld	s2,16(sp)
    802039f2:	69a2                	ld	s3,8(sp)
    802039f4:	6145                	addi	sp,sp,48
    802039f6:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    802039f8:	02451783          	lh	a5,36(a0)
    802039fc:	03079693          	slli	a3,a5,0x30
    80203a00:	92c1                	srli	a3,a3,0x30
    80203a02:	4725                	li	a4,9
    80203a04:	04d76a63          	bltu	a4,a3,80203a58 <fileread+0xba>
    80203a08:	0792                	slli	a5,a5,0x4
    80203a0a:	0001a717          	auipc	a4,0x1a
    80203a0e:	9a670713          	addi	a4,a4,-1626 # 8021d3b0 <devsw>
    80203a12:	97ba                	add	a5,a5,a4
    80203a14:	639c                	ld	a5,0(a5)
    80203a16:	c3b9                	beqz	a5,80203a5c <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80203a18:	4505                	li	a0,1
    80203a1a:	9782                	jalr	a5
    80203a1c:	892a                	mv	s2,a0
        break;
    80203a1e:	b7e9                	j	802039e8 <fileread+0x4a>
        elock(f->ep);
    80203a20:	6d08                	ld	a0,24(a0)
    80203a22:	00003097          	auipc	ra,0x3
    80203a26:	86c080e7          	jalr	-1940(ra) # 8020628e <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80203a2a:	874a                	mv	a4,s2
    80203a2c:	5094                	lw	a3,32(s1)
    80203a2e:	864e                	mv	a2,s3
    80203a30:	4585                	li	a1,1
    80203a32:	6c88                	ld	a0,24(s1)
    80203a34:	00002097          	auipc	ra,0x2
    80203a38:	f56080e7          	jalr	-170(ra) # 8020598a <eread>
    80203a3c:	892a                	mv	s2,a0
    80203a3e:	00a05563          	blez	a0,80203a48 <fileread+0xaa>
            f->off += r;
    80203a42:	509c                	lw	a5,32(s1)
    80203a44:	9fa9                	addw	a5,a5,a0
    80203a46:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80203a48:	6c88                	ld	a0,24(s1)
    80203a4a:	00003097          	auipc	ra,0x3
    80203a4e:	87a080e7          	jalr	-1926(ra) # 802062c4 <eunlock>
        break;
    80203a52:	bf59                	j	802039e8 <fileread+0x4a>
    return -1;
    80203a54:	597d                	li	s2,-1
    80203a56:	bf49                	j	802039e8 <fileread+0x4a>
          return -1;
    80203a58:	597d                	li	s2,-1
    80203a5a:	b779                	j	802039e8 <fileread+0x4a>
    80203a5c:	597d                	li	s2,-1
    80203a5e:	b769                	j	802039e8 <fileread+0x4a>

0000000080203a60 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80203a60:	7179                	addi	sp,sp,-48
    80203a62:	f406                	sd	ra,40(sp)
    80203a64:	f022                	sd	s0,32(sp)
    80203a66:	ec26                	sd	s1,24(sp)
    80203a68:	e84a                	sd	s2,16(sp)
    80203a6a:	e44e                	sd	s3,8(sp)
    80203a6c:	e052                	sd	s4,0(sp)
    80203a6e:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80203a70:	00954783          	lbu	a5,9(a0)
    80203a74:	cbc5                	beqz	a5,80203b24 <filewrite+0xc4>
    80203a76:	84aa                	mv	s1,a0
    80203a78:	892e                	mv	s2,a1
    80203a7a:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80203a7c:	411c                	lw	a5,0(a0)
    80203a7e:	4705                	li	a4,1
    80203a80:	04e78963          	beq	a5,a4,80203ad2 <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80203a84:	470d                	li	a4,3
    80203a86:	04e78d63          	beq	a5,a4,80203ae0 <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80203a8a:	4709                	li	a4,2
    80203a8c:	08e79463          	bne	a5,a4,80203b14 <filewrite+0xb4>
    elock(f->ep);
    80203a90:	6d08                	ld	a0,24(a0)
    80203a92:	00002097          	auipc	ra,0x2
    80203a96:	7fc080e7          	jalr	2044(ra) # 8020628e <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203a9a:	00098a1b          	sext.w	s4,s3
    80203a9e:	8752                	mv	a4,s4
    80203aa0:	5094                	lw	a3,32(s1)
    80203aa2:	864a                	mv	a2,s2
    80203aa4:	4585                	li	a1,1
    80203aa6:	6c88                	ld	a0,24(s1)
    80203aa8:	00002097          	auipc	ra,0x2
    80203aac:	fda080e7          	jalr	-38(ra) # 80205a82 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80203ab0:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203ab2:	05350b63          	beq	a0,s3,80203b08 <filewrite+0xa8>
    }
    eunlock(f->ep);
    80203ab6:	6c88                	ld	a0,24(s1)
    80203ab8:	00003097          	auipc	ra,0x3
    80203abc:	80c080e7          	jalr	-2036(ra) # 802062c4 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80203ac0:	854a                	mv	a0,s2
    80203ac2:	70a2                	ld	ra,40(sp)
    80203ac4:	7402                	ld	s0,32(sp)
    80203ac6:	64e2                	ld	s1,24(sp)
    80203ac8:	6942                	ld	s2,16(sp)
    80203aca:	69a2                	ld	s3,8(sp)
    80203acc:	6a02                	ld	s4,0(sp)
    80203ace:	6145                	addi	sp,sp,48
    80203ad0:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    80203ad2:	6908                	ld	a0,16(a0)
    80203ad4:	00000097          	auipc	ra,0x0
    80203ad8:	26c080e7          	jalr	620(ra) # 80203d40 <pipewrite>
    80203adc:	892a                	mv	s2,a0
    80203ade:	b7cd                	j	80203ac0 <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80203ae0:	02451783          	lh	a5,36(a0)
    80203ae4:	03079693          	slli	a3,a5,0x30
    80203ae8:	92c1                	srli	a3,a3,0x30
    80203aea:	4725                	li	a4,9
    80203aec:	02d76e63          	bltu	a4,a3,80203b28 <filewrite+0xc8>
    80203af0:	0792                	slli	a5,a5,0x4
    80203af2:	0001a717          	auipc	a4,0x1a
    80203af6:	8be70713          	addi	a4,a4,-1858 # 8021d3b0 <devsw>
    80203afa:	97ba                	add	a5,a5,a4
    80203afc:	679c                	ld	a5,8(a5)
    80203afe:	c79d                	beqz	a5,80203b2c <filewrite+0xcc>
    ret = devsw[f->major].write(1, addr, n);
    80203b00:	4505                	li	a0,1
    80203b02:	9782                	jalr	a5
    80203b04:	892a                	mv	s2,a0
    80203b06:	bf6d                	j	80203ac0 <filewrite+0x60>
      f->off += n;
    80203b08:	509c                	lw	a5,32(s1)
    80203b0a:	014787bb          	addw	a5,a5,s4
    80203b0e:	d09c                	sw	a5,32(s1)
      ret = n;
    80203b10:	894e                	mv	s2,s3
    80203b12:	b755                	j	80203ab6 <filewrite+0x56>
    panic("filewrite");
    80203b14:	00006517          	auipc	a0,0x6
    80203b18:	08450513          	addi	a0,a0,132 # 80209b98 <digits+0x818>
    80203b1c:	ffffc097          	auipc	ra,0xffffc
    80203b20:	628080e7          	jalr	1576(ra) # 80200144 <panic>
    return -1;
    80203b24:	597d                	li	s2,-1
    80203b26:	bf69                	j	80203ac0 <filewrite+0x60>
      return -1;
    80203b28:	597d                	li	s2,-1
    80203b2a:	bf59                	j	80203ac0 <filewrite+0x60>
    80203b2c:	597d                	li	s2,-1
    80203b2e:	bf49                	j	80203ac0 <filewrite+0x60>

0000000080203b30 <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203b30:	00854783          	lbu	a5,8(a0)
    80203b34:	cfdd                	beqz	a5,80203bf2 <dirnext+0xc2>
{
    80203b36:	7141                	addi	sp,sp,-496
    80203b38:	f786                	sd	ra,488(sp)
    80203b3a:	f3a2                	sd	s0,480(sp)
    80203b3c:	efa6                	sd	s1,472(sp)
    80203b3e:	ebca                	sd	s2,464(sp)
    80203b40:	e7ce                	sd	s3,456(sp)
    80203b42:	e3d2                	sd	s4,448(sp)
    80203b44:	ff56                	sd	s5,440(sp)
    80203b46:	1b80                	addi	s0,sp,496
    80203b48:	84aa                	mv	s1,a0
    80203b4a:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203b4c:	6d18                	ld	a4,24(a0)
    80203b4e:	10074783          	lbu	a5,256(a4)
    80203b52:	8bc1                	andi	a5,a5,16
    return -1;
    80203b54:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203b56:	eb91                	bnez	a5,80203b6a <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
    80203b58:	70be                	ld	ra,488(sp)
    80203b5a:	741e                	ld	s0,480(sp)
    80203b5c:	64fe                	ld	s1,472(sp)
    80203b5e:	695e                	ld	s2,464(sp)
    80203b60:	69be                	ld	s3,456(sp)
    80203b62:	6a1e                	ld	s4,448(sp)
    80203b64:	7afa                	ld	s5,440(sp)
    80203b66:	617d                	addi	sp,sp,496
    80203b68:	8082                	ret
  int count = 0;
    80203b6a:	e0042e23          	sw	zero,-484(s0)
  elock(f->ep);
    80203b6e:	853a                	mv	a0,a4
    80203b70:	00002097          	auipc	ra,0x2
    80203b74:	71e080e7          	jalr	1822(ra) # 8020628e <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203b78:	e1c40a13          	addi	s4,s0,-484
    80203b7c:	e5840993          	addi	s3,s0,-424
    80203b80:	a801                	j	80203b90 <dirnext+0x60>
    f->off += count * 32;
    80203b82:	e1c42783          	lw	a5,-484(s0)
    80203b86:	0057979b          	slliw	a5,a5,0x5
    80203b8a:	5098                	lw	a4,32(s1)
    80203b8c:	9fb9                	addw	a5,a5,a4
    80203b8e:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203b90:	86d2                	mv	a3,s4
    80203b92:	5090                	lw	a2,32(s1)
    80203b94:	85ce                	mv	a1,s3
    80203b96:	6c88                	ld	a0,24(s1)
    80203b98:	00003097          	auipc	ra,0x3
    80203b9c:	8fa080e7          	jalr	-1798(ra) # 80206492 <enext>
    80203ba0:	892a                	mv	s2,a0
    80203ba2:	d165                	beqz	a0,80203b82 <dirnext+0x52>
  eunlock(f->ep);
    80203ba4:	6c88                	ld	a0,24(s1)
    80203ba6:	00002097          	auipc	ra,0x2
    80203baa:	71e080e7          	jalr	1822(ra) # 802062c4 <eunlock>
  if (ret == -1)
    80203bae:	57fd                	li	a5,-1
    return 0;
    80203bb0:	4501                	li	a0,0
  if (ret == -1)
    80203bb2:	faf903e3          	beq	s2,a5,80203b58 <dirnext+0x28>
  f->off += count * 32;
    80203bb6:	e1c42783          	lw	a5,-484(s0)
    80203bba:	0057979b          	slliw	a5,a5,0x5
    80203bbe:	5098                	lw	a4,32(s1)
    80203bc0:	9fb9                	addw	a5,a5,a4
    80203bc2:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    80203bc4:	e2040493          	addi	s1,s0,-480
    80203bc8:	85a6                	mv	a1,s1
    80203bca:	e5840513          	addi	a0,s0,-424
    80203bce:	00003097          	auipc	ra,0x3
    80203bd2:	87c080e7          	jalr	-1924(ra) # 8020644a <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203bd6:	03800613          	li	a2,56
    80203bda:	85a6                	mv	a1,s1
    80203bdc:	8556                	mv	a0,s5
    80203bde:	ffffd097          	auipc	ra,0xffffd
    80203be2:	794080e7          	jalr	1940(ra) # 80201372 <copyout2>
    return -1;
    80203be6:	fff54513          	not	a0,a0
    80203bea:	957d                	srai	a0,a0,0x3f
    80203bec:	8909                	andi	a0,a0,2
    80203bee:	157d                	addi	a0,a0,-1
    80203bf0:	b7a5                	j	80203b58 <dirnext+0x28>
    return -1;
    80203bf2:	557d                	li	a0,-1
    80203bf4:	8082                	ret

0000000080203bf6 <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    80203bf6:	7179                	addi	sp,sp,-48
    80203bf8:	f406                	sd	ra,40(sp)
    80203bfa:	f022                	sd	s0,32(sp)
    80203bfc:	ec26                	sd	s1,24(sp)
    80203bfe:	e84a                	sd	s2,16(sp)
    80203c00:	e44e                	sd	s3,8(sp)
    80203c02:	e052                	sd	s4,0(sp)
    80203c04:	1800                	addi	s0,sp,48
    80203c06:	84aa                	mv	s1,a0
    80203c08:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    80203c0a:	0005b023          	sd	zero,0(a1)
    80203c0e:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    80203c12:	00000097          	auipc	ra,0x0
    80203c16:	bb6080e7          	jalr	-1098(ra) # 802037c8 <filealloc>
    80203c1a:	e088                	sd	a0,0(s1)
    80203c1c:	c551                	beqz	a0,80203ca8 <pipealloc+0xb2>
    80203c1e:	00000097          	auipc	ra,0x0
    80203c22:	baa080e7          	jalr	-1110(ra) # 802037c8 <filealloc>
    80203c26:	00aa3023          	sd	a0,0(s4)
    80203c2a:	c92d                	beqz	a0,80203c9c <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80203c2c:	ffffd097          	auipc	ra,0xffffd
    80203c30:	92e080e7          	jalr	-1746(ra) # 8020055a <kalloc>
    80203c34:	892a                	mv	s2,a0
    80203c36:	c125                	beqz	a0,80203c96 <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    80203c38:	4985                	li	s3,1
    80203c3a:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80203c3e:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    80203c42:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    80203c46:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80203c4a:	00006597          	auipc	a1,0x6
    80203c4e:	d8658593          	addi	a1,a1,-634 # 802099d0 <digits+0x650>
    80203c52:	ffffd097          	auipc	ra,0xffffd
    80203c56:	a30080e7          	jalr	-1488(ra) # 80200682 <initlock>
  (*f0)->type = FD_PIPE;
    80203c5a:	609c                	ld	a5,0(s1)
    80203c5c:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    80203c60:	609c                	ld	a5,0(s1)
    80203c62:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    80203c66:	609c                	ld	a5,0(s1)
    80203c68:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80203c6c:	609c                	ld	a5,0(s1)
    80203c6e:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    80203c72:	000a3783          	ld	a5,0(s4)
    80203c76:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    80203c7a:	000a3783          	ld	a5,0(s4)
    80203c7e:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80203c82:	000a3783          	ld	a5,0(s4)
    80203c86:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    80203c8a:	000a3783          	ld	a5,0(s4)
    80203c8e:	0127b823          	sd	s2,16(a5)
  return 0;
    80203c92:	4501                	li	a0,0
    80203c94:	a025                	j	80203cbc <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    80203c96:	6088                	ld	a0,0(s1)
    80203c98:	e501                	bnez	a0,80203ca0 <pipealloc+0xaa>
    80203c9a:	a039                	j	80203ca8 <pipealloc+0xb2>
    80203c9c:	6088                	ld	a0,0(s1)
    80203c9e:	c51d                	beqz	a0,80203ccc <pipealloc+0xd6>
    fileclose(*f0);
    80203ca0:	00000097          	auipc	ra,0x0
    80203ca4:	be4080e7          	jalr	-1052(ra) # 80203884 <fileclose>
  if(*f1)
    80203ca8:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    80203cac:	557d                	li	a0,-1
  if(*f1)
    80203cae:	c799                	beqz	a5,80203cbc <pipealloc+0xc6>
    fileclose(*f1);
    80203cb0:	853e                	mv	a0,a5
    80203cb2:	00000097          	auipc	ra,0x0
    80203cb6:	bd2080e7          	jalr	-1070(ra) # 80203884 <fileclose>
  return -1;
    80203cba:	557d                	li	a0,-1
}
    80203cbc:	70a2                	ld	ra,40(sp)
    80203cbe:	7402                	ld	s0,32(sp)
    80203cc0:	64e2                	ld	s1,24(sp)
    80203cc2:	6942                	ld	s2,16(sp)
    80203cc4:	69a2                	ld	s3,8(sp)
    80203cc6:	6a02                	ld	s4,0(sp)
    80203cc8:	6145                	addi	sp,sp,48
    80203cca:	8082                	ret
  return -1;
    80203ccc:	557d                	li	a0,-1
    80203cce:	b7fd                	j	80203cbc <pipealloc+0xc6>

0000000080203cd0 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80203cd0:	1101                	addi	sp,sp,-32
    80203cd2:	ec06                	sd	ra,24(sp)
    80203cd4:	e822                	sd	s0,16(sp)
    80203cd6:	e426                	sd	s1,8(sp)
    80203cd8:	e04a                	sd	s2,0(sp)
    80203cda:	1000                	addi	s0,sp,32
    80203cdc:	84aa                	mv	s1,a0
    80203cde:	892e                	mv	s2,a1
  acquire(&pi->lock);
    80203ce0:	ffffd097          	auipc	ra,0xffffd
    80203ce4:	9e6080e7          	jalr	-1562(ra) # 802006c6 <acquire>
  if(writable){
    80203ce8:	02090d63          	beqz	s2,80203d22 <pipeclose+0x52>
    pi->writeopen = 0;
    80203cec:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    80203cf0:	21848513          	addi	a0,s1,536
    80203cf4:	ffffe097          	auipc	ra,0xffffe
    80203cf8:	768080e7          	jalr	1896(ra) # 8020245c <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80203cfc:	2204b783          	ld	a5,544(s1)
    80203d00:	eb95                	bnez	a5,80203d34 <pipeclose+0x64>
    release(&pi->lock);
    80203d02:	8526                	mv	a0,s1
    80203d04:	ffffd097          	auipc	ra,0xffffd
    80203d08:	a16080e7          	jalr	-1514(ra) # 8020071a <release>
    kfree((char*)pi);
    80203d0c:	8526                	mv	a0,s1
    80203d0e:	ffffc097          	auipc	ra,0xffffc
    80203d12:	732080e7          	jalr	1842(ra) # 80200440 <kfree>
  } else
    release(&pi->lock);
}
    80203d16:	60e2                	ld	ra,24(sp)
    80203d18:	6442                	ld	s0,16(sp)
    80203d1a:	64a2                	ld	s1,8(sp)
    80203d1c:	6902                	ld	s2,0(sp)
    80203d1e:	6105                	addi	sp,sp,32
    80203d20:	8082                	ret
    pi->readopen = 0;
    80203d22:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    80203d26:	21c48513          	addi	a0,s1,540
    80203d2a:	ffffe097          	auipc	ra,0xffffe
    80203d2e:	732080e7          	jalr	1842(ra) # 8020245c <wakeup>
    80203d32:	b7e9                	j	80203cfc <pipeclose+0x2c>
    release(&pi->lock);
    80203d34:	8526                	mv	a0,s1
    80203d36:	ffffd097          	auipc	ra,0xffffd
    80203d3a:	9e4080e7          	jalr	-1564(ra) # 8020071a <release>
}
    80203d3e:	bfe1                	j	80203d16 <pipeclose+0x46>

0000000080203d40 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80203d40:	7159                	addi	sp,sp,-112
    80203d42:	f486                	sd	ra,104(sp)
    80203d44:	f0a2                	sd	s0,96(sp)
    80203d46:	eca6                	sd	s1,88(sp)
    80203d48:	e8ca                	sd	s2,80(sp)
    80203d4a:	e4ce                	sd	s3,72(sp)
    80203d4c:	e0d2                	sd	s4,64(sp)
    80203d4e:	fc56                	sd	s5,56(sp)
    80203d50:	f85a                	sd	s6,48(sp)
    80203d52:	f45e                	sd	s7,40(sp)
    80203d54:	f062                	sd	s8,32(sp)
    80203d56:	ec66                	sd	s9,24(sp)
    80203d58:	1880                	addi	s0,sp,112
    80203d5a:	84aa                	mv	s1,a0
    80203d5c:	8b2e                	mv	s6,a1
    80203d5e:	8ab2                	mv	s5,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    80203d60:	ffffe097          	auipc	ra,0xffffe
    80203d64:	cdc080e7          	jalr	-804(ra) # 80201a3c <myproc>
    80203d68:	892a                	mv	s2,a0

  acquire(&pi->lock);
    80203d6a:	8526                	mv	a0,s1
    80203d6c:	ffffd097          	auipc	ra,0xffffd
    80203d70:	95a080e7          	jalr	-1702(ra) # 802006c6 <acquire>
  for(i = 0; i < n; i++){
    80203d74:	09505763          	blez	s5,80203e02 <pipewrite+0xc2>
    80203d78:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    80203d7a:	21848a13          	addi	s4,s1,536
      sleep(&pi->nwrite, &pi->lock);
    80203d7e:	21c48993          	addi	s3,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    80203d82:	f9f40c93          	addi	s9,s0,-97
    80203d86:	5c7d                	li	s8,-1
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80203d88:	2184a783          	lw	a5,536(s1)
    80203d8c:	21c4a703          	lw	a4,540(s1)
    80203d90:	2007879b          	addiw	a5,a5,512
    80203d94:	02f71b63          	bne	a4,a5,80203dca <pipewrite+0x8a>
      if(pi->readopen == 0 || pr->killed){
    80203d98:	2204a783          	lw	a5,544(s1)
    80203d9c:	c3c1                	beqz	a5,80203e1c <pipewrite+0xdc>
    80203d9e:	03092783          	lw	a5,48(s2)
    80203da2:	efad                	bnez	a5,80203e1c <pipewrite+0xdc>
      wakeup(&pi->nread);
    80203da4:	8552                	mv	a0,s4
    80203da6:	ffffe097          	auipc	ra,0xffffe
    80203daa:	6b6080e7          	jalr	1718(ra) # 8020245c <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80203dae:	85a6                	mv	a1,s1
    80203db0:	854e                	mv	a0,s3
    80203db2:	ffffe097          	auipc	ra,0xffffe
    80203db6:	52e080e7          	jalr	1326(ra) # 802022e0 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80203dba:	2184a783          	lw	a5,536(s1)
    80203dbe:	21c4a703          	lw	a4,540(s1)
    80203dc2:	2007879b          	addiw	a5,a5,512
    80203dc6:	fcf709e3          	beq	a4,a5,80203d98 <pipewrite+0x58>
    if(copyin2(&ch, addr + i, 1) == -1)
    80203dca:	4605                	li	a2,1
    80203dcc:	85da                	mv	a1,s6
    80203dce:	8566                	mv	a0,s9
    80203dd0:	ffffd097          	auipc	ra,0xffffd
    80203dd4:	682080e7          	jalr	1666(ra) # 80201452 <copyin2>
    80203dd8:	03850663          	beq	a0,s8,80203e04 <pipewrite+0xc4>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80203ddc:	21c4a783          	lw	a5,540(s1)
    80203de0:	0017871b          	addiw	a4,a5,1
    80203de4:	20e4ae23          	sw	a4,540(s1)
    80203de8:	1ff7f793          	andi	a5,a5,511
    80203dec:	97a6                	add	a5,a5,s1
    80203dee:	f9f44703          	lbu	a4,-97(s0)
    80203df2:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    80203df6:	2b85                	addiw	s7,s7,1
    80203df8:	0b05                	addi	s6,s6,1
    80203dfa:	f97a97e3          	bne	s5,s7,80203d88 <pipewrite+0x48>
    80203dfe:	8bd6                	mv	s7,s5
    80203e00:	a011                	j	80203e04 <pipewrite+0xc4>
    80203e02:	4b81                	li	s7,0
  }
  wakeup(&pi->nread);
    80203e04:	21848513          	addi	a0,s1,536
    80203e08:	ffffe097          	auipc	ra,0xffffe
    80203e0c:	654080e7          	jalr	1620(ra) # 8020245c <wakeup>
  release(&pi->lock);
    80203e10:	8526                	mv	a0,s1
    80203e12:	ffffd097          	auipc	ra,0xffffd
    80203e16:	908080e7          	jalr	-1784(ra) # 8020071a <release>
  return i;
    80203e1a:	a039                	j	80203e28 <pipewrite+0xe8>
        release(&pi->lock);
    80203e1c:	8526                	mv	a0,s1
    80203e1e:	ffffd097          	auipc	ra,0xffffd
    80203e22:	8fc080e7          	jalr	-1796(ra) # 8020071a <release>
        return -1;
    80203e26:	5bfd                	li	s7,-1
}
    80203e28:	855e                	mv	a0,s7
    80203e2a:	70a6                	ld	ra,104(sp)
    80203e2c:	7406                	ld	s0,96(sp)
    80203e2e:	64e6                	ld	s1,88(sp)
    80203e30:	6946                	ld	s2,80(sp)
    80203e32:	69a6                	ld	s3,72(sp)
    80203e34:	6a06                	ld	s4,64(sp)
    80203e36:	7ae2                	ld	s5,56(sp)
    80203e38:	7b42                	ld	s6,48(sp)
    80203e3a:	7ba2                	ld	s7,40(sp)
    80203e3c:	7c02                	ld	s8,32(sp)
    80203e3e:	6ce2                	ld	s9,24(sp)
    80203e40:	6165                	addi	sp,sp,112
    80203e42:	8082                	ret

0000000080203e44 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80203e44:	715d                	addi	sp,sp,-80
    80203e46:	e486                	sd	ra,72(sp)
    80203e48:	e0a2                	sd	s0,64(sp)
    80203e4a:	fc26                	sd	s1,56(sp)
    80203e4c:	f84a                	sd	s2,48(sp)
    80203e4e:	f44e                	sd	s3,40(sp)
    80203e50:	f052                	sd	s4,32(sp)
    80203e52:	ec56                	sd	s5,24(sp)
    80203e54:	e85a                	sd	s6,16(sp)
    80203e56:	0880                	addi	s0,sp,80
    80203e58:	84aa                	mv	s1,a0
    80203e5a:	892e                	mv	s2,a1
    80203e5c:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    80203e5e:	ffffe097          	auipc	ra,0xffffe
    80203e62:	bde080e7          	jalr	-1058(ra) # 80201a3c <myproc>
    80203e66:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    80203e68:	8526                	mv	a0,s1
    80203e6a:	ffffd097          	auipc	ra,0xffffd
    80203e6e:	85c080e7          	jalr	-1956(ra) # 802006c6 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203e72:	2184a703          	lw	a4,536(s1)
    80203e76:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80203e7a:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203e7e:	02f71463          	bne	a4,a5,80203ea6 <piperead+0x62>
    80203e82:	2244a783          	lw	a5,548(s1)
    80203e86:	c385                	beqz	a5,80203ea6 <piperead+0x62>
    if(pr->killed){
    80203e88:	0309a783          	lw	a5,48(s3)
    80203e8c:	ebc1                	bnez	a5,80203f1c <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80203e8e:	85a6                	mv	a1,s1
    80203e90:	8556                	mv	a0,s5
    80203e92:	ffffe097          	auipc	ra,0xffffe
    80203e96:	44e080e7          	jalr	1102(ra) # 802022e0 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203e9a:	2184a703          	lw	a4,536(s1)
    80203e9e:	21c4a783          	lw	a5,540(s1)
    80203ea2:	fef700e3          	beq	a4,a5,80203e82 <piperead+0x3e>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80203ea6:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    80203ea8:	fbf40b13          	addi	s6,s0,-65
    80203eac:	5afd                	li	s5,-1
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80203eae:	05405163          	blez	s4,80203ef0 <piperead+0xac>
    if(pi->nread == pi->nwrite)
    80203eb2:	2184a783          	lw	a5,536(s1)
    80203eb6:	21c4a703          	lw	a4,540(s1)
    80203eba:	02f70b63          	beq	a4,a5,80203ef0 <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    80203ebe:	0017871b          	addiw	a4,a5,1
    80203ec2:	20e4ac23          	sw	a4,536(s1)
    80203ec6:	1ff7f793          	andi	a5,a5,511
    80203eca:	97a6                	add	a5,a5,s1
    80203ecc:	0187c783          	lbu	a5,24(a5)
    80203ed0:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    80203ed4:	4605                	li	a2,1
    80203ed6:	85da                	mv	a1,s6
    80203ed8:	854a                	mv	a0,s2
    80203eda:	ffffd097          	auipc	ra,0xffffd
    80203ede:	498080e7          	jalr	1176(ra) # 80201372 <copyout2>
    80203ee2:	01550763          	beq	a0,s5,80203ef0 <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80203ee6:	2985                	addiw	s3,s3,1
    80203ee8:	0905                	addi	s2,s2,1
    80203eea:	fd3a14e3          	bne	s4,s3,80203eb2 <piperead+0x6e>
    80203eee:	89d2                	mv	s3,s4
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    80203ef0:	21c48513          	addi	a0,s1,540
    80203ef4:	ffffe097          	auipc	ra,0xffffe
    80203ef8:	568080e7          	jalr	1384(ra) # 8020245c <wakeup>
  release(&pi->lock);
    80203efc:	8526                	mv	a0,s1
    80203efe:	ffffd097          	auipc	ra,0xffffd
    80203f02:	81c080e7          	jalr	-2020(ra) # 8020071a <release>
  return i;
}
    80203f06:	854e                	mv	a0,s3
    80203f08:	60a6                	ld	ra,72(sp)
    80203f0a:	6406                	ld	s0,64(sp)
    80203f0c:	74e2                	ld	s1,56(sp)
    80203f0e:	7942                	ld	s2,48(sp)
    80203f10:	79a2                	ld	s3,40(sp)
    80203f12:	7a02                	ld	s4,32(sp)
    80203f14:	6ae2                	ld	s5,24(sp)
    80203f16:	6b42                	ld	s6,16(sp)
    80203f18:	6161                	addi	sp,sp,80
    80203f1a:	8082                	ret
      release(&pi->lock);
    80203f1c:	8526                	mv	a0,s1
    80203f1e:	ffffc097          	auipc	ra,0xffffc
    80203f22:	7fc080e7          	jalr	2044(ra) # 8020071a <release>
      return -1;
    80203f26:	59fd                	li	s3,-1
    80203f28:	bff9                	j	80203f06 <piperead+0xc2>

0000000080203f2a <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    80203f2a:	dd010113          	addi	sp,sp,-560
    80203f2e:	22113423          	sd	ra,552(sp)
    80203f32:	22813023          	sd	s0,544(sp)
    80203f36:	20913c23          	sd	s1,536(sp)
    80203f3a:	21213823          	sd	s2,528(sp)
    80203f3e:	21313423          	sd	s3,520(sp)
    80203f42:	21413023          	sd	s4,512(sp)
    80203f46:	ffd6                	sd	s5,504(sp)
    80203f48:	fbda                	sd	s6,496(sp)
    80203f4a:	f7de                	sd	s7,488(sp)
    80203f4c:	f3e2                	sd	s8,480(sp)
    80203f4e:	efe6                	sd	s9,472(sp)
    80203f50:	ebea                	sd	s10,464(sp)
    80203f52:	e7ee                	sd	s11,456(sp)
    80203f54:	1c00                	addi	s0,sp,560
    80203f56:	892a                	mv	s2,a0
    80203f58:	dca43c23          	sd	a0,-552(s0)
    80203f5c:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    80203f60:	ffffe097          	auipc	ra,0xffffe
    80203f64:	adc080e7          	jalr	-1316(ra) # 80201a3c <myproc>
    80203f68:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    80203f6a:	ffffc097          	auipc	ra,0xffffc
    80203f6e:	5f0080e7          	jalr	1520(ra) # 8020055a <kalloc>
    80203f72:	2a050863          	beqz	a0,80204222 <exec+0x2f8>
    80203f76:	8b2a                	mv	s6,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    80203f78:	6605                	lui	a2,0x1
    80203f7a:	6cac                	ld	a1,88(s1)
    80203f7c:	ffffd097          	auipc	ra,0xffffd
    80203f80:	842080e7          	jalr	-1982(ra) # 802007be <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    80203f84:	000b3023          	sd	zero,0(s6)
    80203f88:	000b3423          	sd	zero,8(s6)
  }

  if((ep = ename(path)) == NULL) {
    80203f8c:	854a                	mv	a0,s2
    80203f8e:	00003097          	auipc	ra,0x3
    80203f92:	aa8080e7          	jalr	-1368(ra) # 80206a36 <ename>
    80203f96:	8a2a                	mv	s4,a0
    80203f98:	3a050e63          	beqz	a0,80204354 <exec+0x42a>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    80203f9c:	00002097          	auipc	ra,0x2
    80203fa0:	2f2080e7          	jalr	754(ra) # 8020628e <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    80203fa4:	04000713          	li	a4,64
    80203fa8:	4681                	li	a3,0
    80203faa:	e4840613          	addi	a2,s0,-440
    80203fae:	4581                	li	a1,0
    80203fb0:	8552                	mv	a0,s4
    80203fb2:	00002097          	auipc	ra,0x2
    80203fb6:	9d8080e7          	jalr	-1576(ra) # 8020598a <eread>
    80203fba:	04000793          	li	a5,64
    80203fbe:	00f51a63          	bne	a0,a5,80203fd2 <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80203fc2:	e4842703          	lw	a4,-440(s0)
    80203fc6:	464c47b7          	lui	a5,0x464c4
    80203fca:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    80203fce:	00f70963          	beq	a4,a5,80203fe0 <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    80203fd2:	4581                	li	a1,0
    80203fd4:	855a                	mv	a0,s6
    80203fd6:	ffffd097          	auipc	ra,0xffffd
    80203fda:	69c080e7          	jalr	1692(ra) # 80201672 <kvmfree>
  if(ep){
    80203fde:	a4bd                	j	8020424c <exec+0x322>
  if((pagetable = proc_pagetable(p)) == NULL)
    80203fe0:	8526                	mv	a0,s1
    80203fe2:	ffffe097          	auipc	ra,0xffffe
    80203fe6:	b3e080e7          	jalr	-1218(ra) # 80201b20 <proc_pagetable>
    80203fea:	e0a43423          	sd	a0,-504(s0)
    80203fee:	d175                	beqz	a0,80203fd2 <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80203ff0:	e6842783          	lw	a5,-408(s0)
    80203ff4:	e8045703          	lhu	a4,-384(s0)
    80203ff8:	cb3d                	beqz	a4,8020406e <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80203ffa:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80203ffc:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204000:	e1040713          	addi	a4,s0,-496
    80204004:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    80204008:	6a85                	lui	s5,0x1
    8020400a:	fffa8713          	addi	a4,s5,-1 # fff <_entry-0x801ff001>
    8020400e:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204012:	6d85                	lui	s11,0x1
    80204014:	7d7d                	lui	s10,0xfffff
    80204016:	a4c9                	j	802042d8 <exec+0x3ae>
      panic("loadseg: address should exist");
    80204018:	00006517          	auipc	a0,0x6
    8020401c:	b9050513          	addi	a0,a0,-1136 # 80209ba8 <digits+0x828>
    80204020:	ffffc097          	auipc	ra,0xffffc
    80204024:	124080e7          	jalr	292(ra) # 80200144 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    80204028:	874a                	mv	a4,s2
    8020402a:	009c86bb          	addw	a3,s9,s1
    8020402e:	4581                	li	a1,0
    80204030:	8552                	mv	a0,s4
    80204032:	00002097          	auipc	ra,0x2
    80204036:	958080e7          	jalr	-1704(ra) # 8020598a <eread>
    8020403a:	2501                	sext.w	a0,a0
    8020403c:	1ea91763          	bne	s2,a0,8020422a <exec+0x300>
  for(i = 0; i < sz; i += PGSIZE){
    80204040:	009d84bb          	addw	s1,s11,s1
    80204044:	013d09bb          	addw	s3,s10,s3
    80204048:	2774f863          	bgeu	s1,s7,802042b8 <exec+0x38e>
    pa = walkaddr(pagetable, va + i);
    8020404c:	02049593          	slli	a1,s1,0x20
    80204050:	9181                	srli	a1,a1,0x20
    80204052:	95e2                	add	a1,a1,s8
    80204054:	e0843503          	ld	a0,-504(s0)
    80204058:	ffffd097          	auipc	ra,0xffffd
    8020405c:	b56080e7          	jalr	-1194(ra) # 80200bae <walkaddr>
    80204060:	862a                	mv	a2,a0
    if(pa == NULL)
    80204062:	d95d                	beqz	a0,80204018 <exec+0xee>
      n = PGSIZE;
    80204064:	8956                	mv	s2,s5
    if(sz - i < PGSIZE)
    80204066:	fd59f1e3          	bgeu	s3,s5,80204028 <exec+0xfe>
      n = sz - i;
    8020406a:	894e                	mv	s2,s3
    8020406c:	bf75                	j	80204028 <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    8020406e:	4481                	li	s1,0
  eunlock(ep);
    80204070:	8552                	mv	a0,s4
    80204072:	00002097          	auipc	ra,0x2
    80204076:	252080e7          	jalr	594(ra) # 802062c4 <eunlock>
  eput(ep);
    8020407a:	8552                	mv	a0,s4
    8020407c:	00002097          	auipc	ra,0x2
    80204080:	296080e7          	jalr	662(ra) # 80206312 <eput>
  p = myproc();
    80204084:	ffffe097          	auipc	ra,0xffffe
    80204088:	9b8080e7          	jalr	-1608(ra) # 80201a3c <myproc>
    8020408c:	8aaa                	mv	s5,a0
  uint64 oldsz = p->sz;
    8020408e:	04853d03          	ld	s10,72(a0)
  sz = PGROUNDUP(sz);
    80204092:	6785                	lui	a5,0x1
    80204094:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    80204096:	97a6                	add	a5,a5,s1
    80204098:	777d                	lui	a4,0xfffff
    8020409a:	8ff9                	and	a5,a5,a4
    8020409c:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802040a0:	6689                	lui	a3,0x2
    802040a2:	96be                	add	a3,a3,a5
    802040a4:	863e                	mv	a2,a5
    802040a6:	85da                	mv	a1,s6
    802040a8:	e0843483          	ld	s1,-504(s0)
    802040ac:	8526                	mv	a0,s1
    802040ae:	ffffd097          	auipc	ra,0xffffd
    802040b2:	f5c080e7          	jalr	-164(ra) # 8020100a <uvmalloc>
    802040b6:	8caa                	mv	s9,a0
  ep = 0;
    802040b8:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802040ba:	16050863          	beqz	a0,8020422a <exec+0x300>
  uvmclear(pagetable, sz-2*PGSIZE);
    802040be:	75f9                	lui	a1,0xffffe
    802040c0:	95aa                	add	a1,a1,a0
    802040c2:	8526                	mv	a0,s1
    802040c4:	ffffd097          	auipc	ra,0xffffd
    802040c8:	1f0080e7          	jalr	496(ra) # 802012b4 <uvmclear>
  stackbase = sp - PGSIZE;
    802040cc:	7bfd                	lui	s7,0xfffff
    802040ce:	9be6                	add	s7,s7,s9
  for(argc = 0; argv[argc]; argc++) {
    802040d0:	de843783          	ld	a5,-536(s0)
    802040d4:	6388                	ld	a0,0(a5)
    802040d6:	c92d                	beqz	a0,80204148 <exec+0x21e>
    802040d8:	e8840993          	addi	s3,s0,-376
    802040dc:	f8840c13          	addi	s8,s0,-120
  sp = sz;
    802040e0:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    802040e2:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    802040e4:	ffffd097          	auipc	ra,0xffffd
    802040e8:	802080e7          	jalr	-2046(ra) # 802008e6 <strlen>
    802040ec:	0015079b          	addiw	a5,a0,1
    802040f0:	40f907b3          	sub	a5,s2,a5
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    802040f4:	ff07f913          	andi	s2,a5,-16
    if(sp < stackbase)
    802040f8:	1b796463          	bltu	s2,s7,802042a0 <exec+0x376>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    802040fc:	de843d83          	ld	s11,-536(s0)
    80204100:	000dba03          	ld	s4,0(s11) # 1000 <_entry-0x801ff000>
    80204104:	8552                	mv	a0,s4
    80204106:	ffffc097          	auipc	ra,0xffffc
    8020410a:	7e0080e7          	jalr	2016(ra) # 802008e6 <strlen>
    8020410e:	0015069b          	addiw	a3,a0,1
    80204112:	8652                	mv	a2,s4
    80204114:	85ca                	mv	a1,s2
    80204116:	e0843503          	ld	a0,-504(s0)
    8020411a:	ffffd097          	auipc	ra,0xffffd
    8020411e:	1cc080e7          	jalr	460(ra) # 802012e6 <copyout>
    80204122:	18054363          	bltz	a0,802042a8 <exec+0x37e>
    ustack[argc] = sp;
    80204126:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    8020412a:	0485                	addi	s1,s1,1
    8020412c:	008d8793          	addi	a5,s11,8
    80204130:	def43423          	sd	a5,-536(s0)
    80204134:	008db503          	ld	a0,8(s11)
    80204138:	c911                	beqz	a0,8020414c <exec+0x222>
    if(argc >= MAXARG)
    8020413a:	09a1                	addi	s3,s3,8
    8020413c:	fb3c14e3          	bne	s8,s3,802040e4 <exec+0x1ba>
  sz = sz1;
    80204140:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204144:	4a01                	li	s4,0
    80204146:	a0d5                	j	8020422a <exec+0x300>
  sp = sz;
    80204148:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    8020414a:	4481                	li	s1,0
  ustack[argc] = 0;
    8020414c:	00349793          	slli	a5,s1,0x3
    80204150:	f9078793          	addi	a5,a5,-112
    80204154:	97a2                	add	a5,a5,s0
    80204156:	ee07bc23          	sd	zero,-264(a5)
  sp -= (argc+1) * sizeof(uint64);
    8020415a:	00148693          	addi	a3,s1,1
    8020415e:	068e                	slli	a3,a3,0x3
    80204160:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    80204164:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    80204168:	01797663          	bgeu	s2,s7,80204174 <exec+0x24a>
  sz = sz1;
    8020416c:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204170:	4a01                	li	s4,0
    80204172:	a865                	j	8020422a <exec+0x300>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80204174:	e8840613          	addi	a2,s0,-376
    80204178:	85ca                	mv	a1,s2
    8020417a:	e0843503          	ld	a0,-504(s0)
    8020417e:	ffffd097          	auipc	ra,0xffffd
    80204182:	168080e7          	jalr	360(ra) # 802012e6 <copyout>
    80204186:	12054563          	bltz	a0,802042b0 <exec+0x386>
  p->trapframe->a1 = sp;
    8020418a:	060ab783          	ld	a5,96(s5)
    8020418e:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    80204192:	dd843783          	ld	a5,-552(s0)
    80204196:	0007c703          	lbu	a4,0(a5)
    8020419a:	cf11                	beqz	a4,802041b6 <exec+0x28c>
    8020419c:	0785                	addi	a5,a5,1
    if(*s == '/')
    8020419e:	02f00693          	li	a3,47
    802041a2:	a039                	j	802041b0 <exec+0x286>
      last = s+1;
    802041a4:	dcf43c23          	sd	a5,-552(s0)
  for(last=s=path; *s; s++)
    802041a8:	0785                	addi	a5,a5,1
    802041aa:	fff7c703          	lbu	a4,-1(a5)
    802041ae:	c701                	beqz	a4,802041b6 <exec+0x28c>
    if(*s == '/')
    802041b0:	fed71ce3          	bne	a4,a3,802041a8 <exec+0x27e>
    802041b4:	bfc5                	j	802041a4 <exec+0x27a>
  safestrcpy(p->name, last, sizeof(p->name));
    802041b6:	4641                	li	a2,16
    802041b8:	dd843583          	ld	a1,-552(s0)
    802041bc:	160a8513          	addi	a0,s5,352
    802041c0:	ffffc097          	auipc	ra,0xffffc
    802041c4:	6f4080e7          	jalr	1780(ra) # 802008b4 <safestrcpy>
  oldpagetable = p->pagetable;
    802041c8:	050ab503          	ld	a0,80(s5)
  oldkpagetable = p->kpagetable;
    802041cc:	058ab983          	ld	s3,88(s5)
  p->pagetable = pagetable;
    802041d0:	e0843783          	ld	a5,-504(s0)
    802041d4:	04fab823          	sd	a5,80(s5)
  p->kpagetable = kpagetable;
    802041d8:	056abc23          	sd	s6,88(s5)
  p->sz = sz;
    802041dc:	059ab423          	sd	s9,72(s5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    802041e0:	060ab783          	ld	a5,96(s5)
    802041e4:	e6043703          	ld	a4,-416(s0)
    802041e8:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    802041ea:	060ab783          	ld	a5,96(s5)
    802041ee:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    802041f2:	85ea                	mv	a1,s10
    802041f4:	ffffe097          	auipc	ra,0xffffe
    802041f8:	9c8080e7          	jalr	-1592(ra) # 80201bbc <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    802041fc:	058ab783          	ld	a5,88(s5)
    80204200:	83b1                	srli	a5,a5,0xc
    80204202:	577d                	li	a4,-1
    80204204:	177e                	slli	a4,a4,0x3f
    80204206:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80204208:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    8020420c:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    80204210:	4581                	li	a1,0
    80204212:	854e                	mv	a0,s3
    80204214:	ffffd097          	auipc	ra,0xffffd
    80204218:	45e080e7          	jalr	1118(ra) # 80201672 <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    8020421c:	0004851b          	sext.w	a0,s1
    80204220:	a089                	j	80204262 <exec+0x338>
    return -1;
    80204222:	557d                	li	a0,-1
    80204224:	a83d                	j	80204262 <exec+0x338>
    80204226:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    8020422a:	df043583          	ld	a1,-528(s0)
    8020422e:	e0843503          	ld	a0,-504(s0)
    80204232:	ffffe097          	auipc	ra,0xffffe
    80204236:	98a080e7          	jalr	-1654(ra) # 80201bbc <proc_freepagetable>
    kvmfree(kpagetable, 0);
    8020423a:	4581                	li	a1,0
    8020423c:	855a                	mv	a0,s6
    8020423e:	ffffd097          	auipc	ra,0xffffd
    80204242:	434080e7          	jalr	1076(ra) # 80201672 <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    80204246:	557d                	li	a0,-1
  if(ep){
    80204248:	000a0d63          	beqz	s4,80204262 <exec+0x338>
    eunlock(ep);
    8020424c:	8552                	mv	a0,s4
    8020424e:	00002097          	auipc	ra,0x2
    80204252:	076080e7          	jalr	118(ra) # 802062c4 <eunlock>
    eput(ep);
    80204256:	8552                	mv	a0,s4
    80204258:	00002097          	auipc	ra,0x2
    8020425c:	0ba080e7          	jalr	186(ra) # 80206312 <eput>
  return -1;
    80204260:	557d                	li	a0,-1
}
    80204262:	22813083          	ld	ra,552(sp)
    80204266:	22013403          	ld	s0,544(sp)
    8020426a:	21813483          	ld	s1,536(sp)
    8020426e:	21013903          	ld	s2,528(sp)
    80204272:	20813983          	ld	s3,520(sp)
    80204276:	20013a03          	ld	s4,512(sp)
    8020427a:	7afe                	ld	s5,504(sp)
    8020427c:	7b5e                	ld	s6,496(sp)
    8020427e:	7bbe                	ld	s7,488(sp)
    80204280:	7c1e                	ld	s8,480(sp)
    80204282:	6cfe                	ld	s9,472(sp)
    80204284:	6d5e                	ld	s10,464(sp)
    80204286:	6dbe                	ld	s11,456(sp)
    80204288:	23010113          	addi	sp,sp,560
    8020428c:	8082                	ret
    8020428e:	de943823          	sd	s1,-528(s0)
    80204292:	bf61                	j	8020422a <exec+0x300>
    80204294:	de943823          	sd	s1,-528(s0)
    80204298:	bf49                	j	8020422a <exec+0x300>
    8020429a:	de943823          	sd	s1,-528(s0)
    8020429e:	b771                	j	8020422a <exec+0x300>
  sz = sz1;
    802042a0:	df943823          	sd	s9,-528(s0)
  ep = 0;
    802042a4:	4a01                	li	s4,0
    802042a6:	b751                	j	8020422a <exec+0x300>
  sz = sz1;
    802042a8:	df943823          	sd	s9,-528(s0)
  ep = 0;
    802042ac:	4a01                	li	s4,0
    802042ae:	bfb5                	j	8020422a <exec+0x300>
  sz = sz1;
    802042b0:	df943823          	sd	s9,-528(s0)
  ep = 0;
    802042b4:	4a01                	li	s4,0
    802042b6:	bf95                	j	8020422a <exec+0x300>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    802042b8:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802042bc:	e0043783          	ld	a5,-512(s0)
    802042c0:	0017869b          	addiw	a3,a5,1
    802042c4:	e0d43023          	sd	a3,-512(s0)
    802042c8:	df843783          	ld	a5,-520(s0)
    802042cc:	0387879b          	addiw	a5,a5,56
    802042d0:	e8045703          	lhu	a4,-384(s0)
    802042d4:	d8e6dee3          	bge	a3,a4,80204070 <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    802042d8:	2781                	sext.w	a5,a5
    802042da:	def43c23          	sd	a5,-520(s0)
    802042de:	03800713          	li	a4,56
    802042e2:	86be                	mv	a3,a5
    802042e4:	de043603          	ld	a2,-544(s0)
    802042e8:	4581                	li	a1,0
    802042ea:	8552                	mv	a0,s4
    802042ec:	00001097          	auipc	ra,0x1
    802042f0:	69e080e7          	jalr	1694(ra) # 8020598a <eread>
    802042f4:	03800793          	li	a5,56
    802042f8:	f2f517e3          	bne	a0,a5,80204226 <exec+0x2fc>
    if(ph.type != ELF_PROG_LOAD)
    802042fc:	e1042783          	lw	a5,-496(s0)
    80204300:	4705                	li	a4,1
    80204302:	fae79de3          	bne	a5,a4,802042bc <exec+0x392>
    if(ph.memsz < ph.filesz)
    80204306:	e3843683          	ld	a3,-456(s0)
    8020430a:	e3043783          	ld	a5,-464(s0)
    8020430e:	f8f6e0e3          	bltu	a3,a5,8020428e <exec+0x364>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80204312:	e2043783          	ld	a5,-480(s0)
    80204316:	96be                	add	a3,a3,a5
    80204318:	f6f6eee3          	bltu	a3,a5,80204294 <exec+0x36a>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    8020431c:	8626                	mv	a2,s1
    8020431e:	85da                	mv	a1,s6
    80204320:	e0843503          	ld	a0,-504(s0)
    80204324:	ffffd097          	auipc	ra,0xffffd
    80204328:	ce6080e7          	jalr	-794(ra) # 8020100a <uvmalloc>
    8020432c:	dea43823          	sd	a0,-528(s0)
    80204330:	d52d                	beqz	a0,8020429a <exec+0x370>
    if(ph.vaddr % PGSIZE != 0)
    80204332:	e2043c03          	ld	s8,-480(s0)
    80204336:	dd043783          	ld	a5,-560(s0)
    8020433a:	00fc77b3          	and	a5,s8,a5
    8020433e:	ee0796e3          	bnez	a5,8020422a <exec+0x300>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    80204342:	e1842c83          	lw	s9,-488(s0)
    80204346:	e3042b83          	lw	s7,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    8020434a:	f60b87e3          	beqz	s7,802042b8 <exec+0x38e>
    8020434e:	89de                	mv	s3,s7
    80204350:	4481                	li	s1,0
    80204352:	b9ed                	j	8020404c <exec+0x122>
    kvmfree(kpagetable, 0);
    80204354:	4581                	li	a1,0
    80204356:	855a                	mv	a0,s6
    80204358:	ffffd097          	auipc	ra,0xffffd
    8020435c:	31a080e7          	jalr	794(ra) # 80201672 <kvmfree>
  return -1;
    80204360:	557d                	li	a0,-1
    80204362:	b701                	j	80204262 <exec+0x338>

0000000080204364 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80204364:	7179                	addi	sp,sp,-48
    80204366:	f406                	sd	ra,40(sp)
    80204368:	f022                	sd	s0,32(sp)
    8020436a:	ec26                	sd	s1,24(sp)
    8020436c:	e84a                	sd	s2,16(sp)
    8020436e:	1800                	addi	s0,sp,48
    80204370:	892e                	mv	s2,a1
    80204372:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80204374:	fdc40593          	addi	a1,s0,-36
    80204378:	fffff097          	auipc	ra,0xfffff
    8020437c:	a6a080e7          	jalr	-1430(ra) # 80202de2 <argint>
    80204380:	04054063          	bltz	a0,802043c0 <argfd+0x5c>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    80204384:	fdc42703          	lw	a4,-36(s0)
    80204388:	47bd                	li	a5,15
    8020438a:	02e7ed63          	bltu	a5,a4,802043c4 <argfd+0x60>
    8020438e:	ffffd097          	auipc	ra,0xffffd
    80204392:	6ae080e7          	jalr	1710(ra) # 80201a3c <myproc>
    80204396:	fdc42703          	lw	a4,-36(s0)
    8020439a:	01a70793          	addi	a5,a4,26 # fffffffffffff01a <ebss_clear+0xffffffff7fdd901a>
    8020439e:	078e                	slli	a5,a5,0x3
    802043a0:	953e                	add	a0,a0,a5
    802043a2:	651c                	ld	a5,8(a0)
    802043a4:	c395                	beqz	a5,802043c8 <argfd+0x64>
    return -1;
  if(pfd)
    802043a6:	00090463          	beqz	s2,802043ae <argfd+0x4a>
    *pfd = fd;
    802043aa:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    802043ae:	4501                	li	a0,0
  if(pf)
    802043b0:	c091                	beqz	s1,802043b4 <argfd+0x50>
    *pf = f;
    802043b2:	e09c                	sd	a5,0(s1)
}
    802043b4:	70a2                	ld	ra,40(sp)
    802043b6:	7402                	ld	s0,32(sp)
    802043b8:	64e2                	ld	s1,24(sp)
    802043ba:	6942                	ld	s2,16(sp)
    802043bc:	6145                	addi	sp,sp,48
    802043be:	8082                	ret
    return -1;
    802043c0:	557d                	li	a0,-1
    802043c2:	bfcd                	j	802043b4 <argfd+0x50>
    return -1;
    802043c4:	557d                	li	a0,-1
    802043c6:	b7fd                	j	802043b4 <argfd+0x50>
    802043c8:	557d                	li	a0,-1
    802043ca:	b7ed                	j	802043b4 <argfd+0x50>

00000000802043cc <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    802043cc:	1101                	addi	sp,sp,-32
    802043ce:	ec06                	sd	ra,24(sp)
    802043d0:	e822                	sd	s0,16(sp)
    802043d2:	e426                	sd	s1,8(sp)
    802043d4:	1000                	addi	s0,sp,32
    802043d6:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    802043d8:	ffffd097          	auipc	ra,0xffffd
    802043dc:	664080e7          	jalr	1636(ra) # 80201a3c <myproc>
    802043e0:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    802043e2:	0d850793          	addi	a5,a0,216
    802043e6:	4501                	li	a0,0
    802043e8:	46c1                	li	a3,16
    if(p->ofile[fd] == 0){
    802043ea:	6398                	ld	a4,0(a5)
    802043ec:	cb19                	beqz	a4,80204402 <fdalloc+0x36>
  for(fd = 0; fd < NOFILE; fd++){
    802043ee:	2505                	addiw	a0,a0,1
    802043f0:	07a1                	addi	a5,a5,8
    802043f2:	fed51ce3          	bne	a0,a3,802043ea <fdalloc+0x1e>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    802043f6:	557d                	li	a0,-1
}
    802043f8:	60e2                	ld	ra,24(sp)
    802043fa:	6442                	ld	s0,16(sp)
    802043fc:	64a2                	ld	s1,8(sp)
    802043fe:	6105                	addi	sp,sp,32
    80204400:	8082                	ret
      p->ofile[fd] = f;
    80204402:	01a50793          	addi	a5,a0,26
    80204406:	078e                	slli	a5,a5,0x3
    80204408:	963e                	add	a2,a2,a5
    8020440a:	e604                	sd	s1,8(a2)
      return fd;
    8020440c:	b7f5                	j	802043f8 <fdalloc+0x2c>

000000008020440e <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    8020440e:	7169                	addi	sp,sp,-304
    80204410:	f606                	sd	ra,296(sp)
    80204412:	f222                	sd	s0,288(sp)
    80204414:	ee26                	sd	s1,280(sp)
    80204416:	ea4a                	sd	s2,272(sp)
    80204418:	e64e                	sd	s3,264(sp)
    8020441a:	1a00                	addi	s0,sp,304
    8020441c:	892e                	mv	s2,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    8020441e:	ed040593          	addi	a1,s0,-304
    80204422:	00002097          	auipc	ra,0x2
    80204426:	632080e7          	jalr	1586(ra) # 80206a54 <enameparent>
    8020442a:	84aa                	mv	s1,a0
    8020442c:	c945                	beqz	a0,802044dc <create+0xce>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    8020442e:	00002097          	auipc	ra,0x2
    80204432:	e60080e7          	jalr	-416(ra) # 8020628e <elock>
  if (type == T_DIR) {
    80204436:	fff90613          	addi	a2,s2,-1
    8020443a:	00163613          	seqz	a2,a2
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    8020443e:	0046161b          	slliw	a2,a2,0x4
    80204442:	ed040593          	addi	a1,s0,-304
    80204446:	8526                	mv	a0,s1
    80204448:	00002097          	auipc	ra,0x2
    8020444c:	332080e7          	jalr	818(ra) # 8020677a <ealloc>
    80204450:	89aa                	mv	s3,a0
    80204452:	c529                	beqz	a0,8020449c <create+0x8e>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204454:	0009079b          	sext.w	a5,s2
    80204458:	4705                	li	a4,1
    8020445a:	04e78c63          	beq	a5,a4,802044b2 <create+0xa4>
    8020445e:	2901                	sext.w	s2,s2
    80204460:	4789                	li	a5,2
    80204462:	00f91663          	bne	s2,a5,8020446e <create+0x60>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    80204466:	10054783          	lbu	a5,256(a0)
    8020446a:	8bc1                	andi	a5,a5,16
    8020446c:	e7b9                	bnez	a5,802044ba <create+0xac>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    8020446e:	8526                	mv	a0,s1
    80204470:	00002097          	auipc	ra,0x2
    80204474:	e54080e7          	jalr	-428(ra) # 802062c4 <eunlock>
  eput(dp);
    80204478:	8526                	mv	a0,s1
    8020447a:	00002097          	auipc	ra,0x2
    8020447e:	e98080e7          	jalr	-360(ra) # 80206312 <eput>

  elock(ep);
    80204482:	854e                	mv	a0,s3
    80204484:	00002097          	auipc	ra,0x2
    80204488:	e0a080e7          	jalr	-502(ra) # 8020628e <elock>
  return ep;
}
    8020448c:	854e                	mv	a0,s3
    8020448e:	70b2                	ld	ra,296(sp)
    80204490:	7412                	ld	s0,288(sp)
    80204492:	64f2                	ld	s1,280(sp)
    80204494:	6952                	ld	s2,272(sp)
    80204496:	69b2                	ld	s3,264(sp)
    80204498:	6155                	addi	sp,sp,304
    8020449a:	8082                	ret
    eunlock(dp);
    8020449c:	8526                	mv	a0,s1
    8020449e:	00002097          	auipc	ra,0x2
    802044a2:	e26080e7          	jalr	-474(ra) # 802062c4 <eunlock>
    eput(dp);
    802044a6:	8526                	mv	a0,s1
    802044a8:	00002097          	auipc	ra,0x2
    802044ac:	e6a080e7          	jalr	-406(ra) # 80206312 <eput>
    return NULL;
    802044b0:	bff1                	j	8020448c <create+0x7e>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    802044b2:	10054783          	lbu	a5,256(a0)
    802044b6:	8bc1                	andi	a5,a5,16
    802044b8:	fbdd                	bnez	a5,8020446e <create+0x60>
    eunlock(dp);
    802044ba:	8526                	mv	a0,s1
    802044bc:	00002097          	auipc	ra,0x2
    802044c0:	e08080e7          	jalr	-504(ra) # 802062c4 <eunlock>
    eput(ep);
    802044c4:	854e                	mv	a0,s3
    802044c6:	00002097          	auipc	ra,0x2
    802044ca:	e4c080e7          	jalr	-436(ra) # 80206312 <eput>
    eput(dp);
    802044ce:	8526                	mv	a0,s1
    802044d0:	00002097          	auipc	ra,0x2
    802044d4:	e42080e7          	jalr	-446(ra) # 80206312 <eput>
    return NULL;
    802044d8:	4981                	li	s3,0
    802044da:	bf4d                	j	8020448c <create+0x7e>
    return NULL;
    802044dc:	89aa                	mv	s3,a0
    802044de:	b77d                	j	8020448c <create+0x7e>

00000000802044e0 <sys_dup>:
{
    802044e0:	7179                	addi	sp,sp,-48
    802044e2:	f406                	sd	ra,40(sp)
    802044e4:	f022                	sd	s0,32(sp)
    802044e6:	ec26                	sd	s1,24(sp)
    802044e8:	e84a                	sd	s2,16(sp)
    802044ea:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    802044ec:	fd840613          	addi	a2,s0,-40
    802044f0:	4581                	li	a1,0
    802044f2:	4501                	li	a0,0
    802044f4:	00000097          	auipc	ra,0x0
    802044f8:	e70080e7          	jalr	-400(ra) # 80204364 <argfd>
    return -1;
    802044fc:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    802044fe:	02054363          	bltz	a0,80204524 <sys_dup+0x44>
  if((fd=fdalloc(f)) < 0)
    80204502:	fd843903          	ld	s2,-40(s0)
    80204506:	854a                	mv	a0,s2
    80204508:	00000097          	auipc	ra,0x0
    8020450c:	ec4080e7          	jalr	-316(ra) # 802043cc <fdalloc>
    80204510:	84aa                	mv	s1,a0
    return -1;
    80204512:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    80204514:	00054863          	bltz	a0,80204524 <sys_dup+0x44>
  filedup(f);
    80204518:	854a                	mv	a0,s2
    8020451a:	fffff097          	auipc	ra,0xfffff
    8020451e:	318080e7          	jalr	792(ra) # 80203832 <filedup>
  return fd;
    80204522:	87a6                	mv	a5,s1
}
    80204524:	853e                	mv	a0,a5
    80204526:	70a2                	ld	ra,40(sp)
    80204528:	7402                	ld	s0,32(sp)
    8020452a:	64e2                	ld	s1,24(sp)
    8020452c:	6942                	ld	s2,16(sp)
    8020452e:	6145                	addi	sp,sp,48
    80204530:	8082                	ret

0000000080204532 <sys_read>:
{
    80204532:	7179                	addi	sp,sp,-48
    80204534:	f406                	sd	ra,40(sp)
    80204536:	f022                	sd	s0,32(sp)
    80204538:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020453a:	fe840613          	addi	a2,s0,-24
    8020453e:	4581                	li	a1,0
    80204540:	4501                	li	a0,0
    80204542:	00000097          	auipc	ra,0x0
    80204546:	e22080e7          	jalr	-478(ra) # 80204364 <argfd>
    return -1;
    8020454a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020454c:	04054163          	bltz	a0,8020458e <sys_read+0x5c>
    80204550:	fe440593          	addi	a1,s0,-28
    80204554:	4509                	li	a0,2
    80204556:	fffff097          	auipc	ra,0xfffff
    8020455a:	88c080e7          	jalr	-1908(ra) # 80202de2 <argint>
    return -1;
    8020455e:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204560:	02054763          	bltz	a0,8020458e <sys_read+0x5c>
    80204564:	fd840593          	addi	a1,s0,-40
    80204568:	4505                	li	a0,1
    8020456a:	fffff097          	auipc	ra,0xfffff
    8020456e:	8da080e7          	jalr	-1830(ra) # 80202e44 <argaddr>
    return -1;
    80204572:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204574:	00054d63          	bltz	a0,8020458e <sys_read+0x5c>
  return fileread(f, p, n);
    80204578:	fe442603          	lw	a2,-28(s0)
    8020457c:	fd843583          	ld	a1,-40(s0)
    80204580:	fe843503          	ld	a0,-24(s0)
    80204584:	fffff097          	auipc	ra,0xfffff
    80204588:	41a080e7          	jalr	1050(ra) # 8020399e <fileread>
    8020458c:	87aa                	mv	a5,a0
}
    8020458e:	853e                	mv	a0,a5
    80204590:	70a2                	ld	ra,40(sp)
    80204592:	7402                	ld	s0,32(sp)
    80204594:	6145                	addi	sp,sp,48
    80204596:	8082                	ret

0000000080204598 <sys_write>:
{
    80204598:	7179                	addi	sp,sp,-48
    8020459a:	f406                	sd	ra,40(sp)
    8020459c:	f022                	sd	s0,32(sp)
    8020459e:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802045a0:	fe840613          	addi	a2,s0,-24
    802045a4:	4581                	li	a1,0
    802045a6:	4501                	li	a0,0
    802045a8:	00000097          	auipc	ra,0x0
    802045ac:	dbc080e7          	jalr	-580(ra) # 80204364 <argfd>
    return -1;
    802045b0:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802045b2:	04054163          	bltz	a0,802045f4 <sys_write+0x5c>
    802045b6:	fe440593          	addi	a1,s0,-28
    802045ba:	4509                	li	a0,2
    802045bc:	fffff097          	auipc	ra,0xfffff
    802045c0:	826080e7          	jalr	-2010(ra) # 80202de2 <argint>
    return -1;
    802045c4:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802045c6:	02054763          	bltz	a0,802045f4 <sys_write+0x5c>
    802045ca:	fd840593          	addi	a1,s0,-40
    802045ce:	4505                	li	a0,1
    802045d0:	fffff097          	auipc	ra,0xfffff
    802045d4:	874080e7          	jalr	-1932(ra) # 80202e44 <argaddr>
    return -1;
    802045d8:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802045da:	00054d63          	bltz	a0,802045f4 <sys_write+0x5c>
  return filewrite(f, p, n);
    802045de:	fe442603          	lw	a2,-28(s0)
    802045e2:	fd843583          	ld	a1,-40(s0)
    802045e6:	fe843503          	ld	a0,-24(s0)
    802045ea:	fffff097          	auipc	ra,0xfffff
    802045ee:	476080e7          	jalr	1142(ra) # 80203a60 <filewrite>
    802045f2:	87aa                	mv	a5,a0
}
    802045f4:	853e                	mv	a0,a5
    802045f6:	70a2                	ld	ra,40(sp)
    802045f8:	7402                	ld	s0,32(sp)
    802045fa:	6145                	addi	sp,sp,48
    802045fc:	8082                	ret

00000000802045fe <sys_close>:
{
    802045fe:	1101                	addi	sp,sp,-32
    80204600:	ec06                	sd	ra,24(sp)
    80204602:	e822                	sd	s0,16(sp)
    80204604:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204606:	fe040613          	addi	a2,s0,-32
    8020460a:	fec40593          	addi	a1,s0,-20
    8020460e:	4501                	li	a0,0
    80204610:	00000097          	auipc	ra,0x0
    80204614:	d54080e7          	jalr	-684(ra) # 80204364 <argfd>
    return -1;
    80204618:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    8020461a:	02054463          	bltz	a0,80204642 <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    8020461e:	ffffd097          	auipc	ra,0xffffd
    80204622:	41e080e7          	jalr	1054(ra) # 80201a3c <myproc>
    80204626:	fec42783          	lw	a5,-20(s0)
    8020462a:	07e9                	addi	a5,a5,26
    8020462c:	078e                	slli	a5,a5,0x3
    8020462e:	953e                	add	a0,a0,a5
    80204630:	00053423          	sd	zero,8(a0)
  fileclose(f);
    80204634:	fe043503          	ld	a0,-32(s0)
    80204638:	fffff097          	auipc	ra,0xfffff
    8020463c:	24c080e7          	jalr	588(ra) # 80203884 <fileclose>
  return 0;
    80204640:	4781                	li	a5,0
}
    80204642:	853e                	mv	a0,a5
    80204644:	60e2                	ld	ra,24(sp)
    80204646:	6442                	ld	s0,16(sp)
    80204648:	6105                	addi	sp,sp,32
    8020464a:	8082                	ret

000000008020464c <sys_fstat>:
{
    8020464c:	1101                	addi	sp,sp,-32
    8020464e:	ec06                	sd	ra,24(sp)
    80204650:	e822                	sd	s0,16(sp)
    80204652:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204654:	fe840613          	addi	a2,s0,-24
    80204658:	4581                	li	a1,0
    8020465a:	4501                	li	a0,0
    8020465c:	00000097          	auipc	ra,0x0
    80204660:	d08080e7          	jalr	-760(ra) # 80204364 <argfd>
    return -1;
    80204664:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204666:	02054563          	bltz	a0,80204690 <sys_fstat+0x44>
    8020466a:	fe040593          	addi	a1,s0,-32
    8020466e:	4505                	li	a0,1
    80204670:	ffffe097          	auipc	ra,0xffffe
    80204674:	7d4080e7          	jalr	2004(ra) # 80202e44 <argaddr>
    return -1;
    80204678:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    8020467a:	00054b63          	bltz	a0,80204690 <sys_fstat+0x44>
  return filestat(f, st);
    8020467e:	fe043583          	ld	a1,-32(s0)
    80204682:	fe843503          	ld	a0,-24(s0)
    80204686:	fffff097          	auipc	ra,0xfffff
    8020468a:	2b4080e7          	jalr	692(ra) # 8020393a <filestat>
    8020468e:	87aa                	mv	a5,a0
}
    80204690:	853e                	mv	a0,a5
    80204692:	60e2                	ld	ra,24(sp)
    80204694:	6442                	ld	s0,16(sp)
    80204696:	6105                	addi	sp,sp,32
    80204698:	8082                	ret

000000008020469a <sys_open>:

uint64
sys_open(void)
{
    8020469a:	7129                	addi	sp,sp,-320
    8020469c:	fe06                	sd	ra,312(sp)
    8020469e:	fa22                	sd	s0,304(sp)
    802046a0:	f626                	sd	s1,296(sp)
    802046a2:	f24a                	sd	s2,288(sp)
    802046a4:	ee4e                	sd	s3,280(sp)
    802046a6:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    802046a8:	10400613          	li	a2,260
    802046ac:	ec840593          	addi	a1,s0,-312
    802046b0:	4501                	li	a0,0
    802046b2:	ffffe097          	auipc	ra,0xffffe
    802046b6:	7b4080e7          	jalr	1972(ra) # 80202e66 <argstr>
    802046ba:	87aa                	mv	a5,a0
    return -1;
    802046bc:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    802046be:	0807ce63          	bltz	a5,8020475a <sys_open+0xc0>
    802046c2:	ec440593          	addi	a1,s0,-316
    802046c6:	4505                	li	a0,1
    802046c8:	ffffe097          	auipc	ra,0xffffe
    802046cc:	71a080e7          	jalr	1818(ra) # 80202de2 <argint>
    802046d0:	0e054163          	bltz	a0,802047b2 <sys_open+0x118>

  if(omode & O_CREATE){
    802046d4:	ec442603          	lw	a2,-316(s0)
    802046d8:	04067793          	andi	a5,a2,64
    802046dc:	c7d1                	beqz	a5,80204768 <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    802046de:	4589                	li	a1,2
    802046e0:	ec840513          	addi	a0,s0,-312
    802046e4:	00000097          	auipc	ra,0x0
    802046e8:	d2a080e7          	jalr	-726(ra) # 8020440e <create>
    802046ec:	892a                	mv	s2,a0
    if(ep == NULL){
    802046ee:	c561                	beqz	a0,802047b6 <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    802046f0:	fffff097          	auipc	ra,0xfffff
    802046f4:	0d8080e7          	jalr	216(ra) # 802037c8 <filealloc>
    802046f8:	89aa                	mv	s3,a0
    802046fa:	c579                	beqz	a0,802047c8 <sys_open+0x12e>
    802046fc:	00000097          	auipc	ra,0x0
    80204700:	cd0080e7          	jalr	-816(ra) # 802043cc <fdalloc>
    80204704:	84aa                	mv	s1,a0
    80204706:	0a054c63          	bltz	a0,802047be <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    8020470a:	10094783          	lbu	a5,256(s2)
    8020470e:	8bc1                	andi	a5,a5,16
    80204710:	e791                	bnez	a5,8020471c <sys_open+0x82>
    80204712:	ec442783          	lw	a5,-316(s0)
    80204716:	4007f793          	andi	a5,a5,1024
    8020471a:	e7d1                	bnez	a5,802047a6 <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    8020471c:	4789                	li	a5,2
    8020471e:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204722:	ec442783          	lw	a5,-316(s0)
    80204726:	0047f693          	andi	a3,a5,4
    8020472a:	4701                	li	a4,0
    8020472c:	c299                	beqz	a3,80204732 <sys_open+0x98>
    8020472e:	10892703          	lw	a4,264(s2)
    80204732:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204736:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    8020473a:	0017c713          	xori	a4,a5,1
    8020473e:	8b05                	andi	a4,a4,1
    80204740:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204744:	8b8d                	andi	a5,a5,3
    80204746:	00f037b3          	snez	a5,a5
    8020474a:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    8020474e:	854a                	mv	a0,s2
    80204750:	00002097          	auipc	ra,0x2
    80204754:	b74080e7          	jalr	-1164(ra) # 802062c4 <eunlock>

  return fd;
    80204758:	8526                	mv	a0,s1
}
    8020475a:	70f2                	ld	ra,312(sp)
    8020475c:	7452                	ld	s0,304(sp)
    8020475e:	74b2                	ld	s1,296(sp)
    80204760:	7912                	ld	s2,288(sp)
    80204762:	69f2                	ld	s3,280(sp)
    80204764:	6131                	addi	sp,sp,320
    80204766:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204768:	ec840513          	addi	a0,s0,-312
    8020476c:	00002097          	auipc	ra,0x2
    80204770:	2ca080e7          	jalr	714(ra) # 80206a36 <ename>
    80204774:	892a                	mv	s2,a0
    80204776:	c131                	beqz	a0,802047ba <sys_open+0x120>
    elock(ep);
    80204778:	00002097          	auipc	ra,0x2
    8020477c:	b16080e7          	jalr	-1258(ra) # 8020628e <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80204780:	10094783          	lbu	a5,256(s2)
    80204784:	8bc1                	andi	a5,a5,16
    80204786:	d7ad                	beqz	a5,802046f0 <sys_open+0x56>
    80204788:	ec442783          	lw	a5,-316(s0)
    8020478c:	d3b5                	beqz	a5,802046f0 <sys_open+0x56>
      eunlock(ep);
    8020478e:	854a                	mv	a0,s2
    80204790:	00002097          	auipc	ra,0x2
    80204794:	b34080e7          	jalr	-1228(ra) # 802062c4 <eunlock>
      eput(ep);
    80204798:	854a                	mv	a0,s2
    8020479a:	00002097          	auipc	ra,0x2
    8020479e:	b78080e7          	jalr	-1160(ra) # 80206312 <eput>
      return -1;
    802047a2:	557d                	li	a0,-1
    802047a4:	bf5d                	j	8020475a <sys_open+0xc0>
    etrunc(ep);
    802047a6:	854a                	mv	a0,s2
    802047a8:	00002097          	auipc	ra,0x2
    802047ac:	a7c080e7          	jalr	-1412(ra) # 80206224 <etrunc>
    802047b0:	b7b5                	j	8020471c <sys_open+0x82>
    return -1;
    802047b2:	557d                	li	a0,-1
    802047b4:	b75d                	j	8020475a <sys_open+0xc0>
      return -1;
    802047b6:	557d                	li	a0,-1
    802047b8:	b74d                	j	8020475a <sys_open+0xc0>
      return -1;
    802047ba:	557d                	li	a0,-1
    802047bc:	bf79                	j	8020475a <sys_open+0xc0>
      fileclose(f);
    802047be:	854e                	mv	a0,s3
    802047c0:	fffff097          	auipc	ra,0xfffff
    802047c4:	0c4080e7          	jalr	196(ra) # 80203884 <fileclose>
    eunlock(ep);
    802047c8:	854a                	mv	a0,s2
    802047ca:	00002097          	auipc	ra,0x2
    802047ce:	afa080e7          	jalr	-1286(ra) # 802062c4 <eunlock>
    eput(ep);
    802047d2:	854a                	mv	a0,s2
    802047d4:	00002097          	auipc	ra,0x2
    802047d8:	b3e080e7          	jalr	-1218(ra) # 80206312 <eput>
    return -1;
    802047dc:	557d                	li	a0,-1
    802047de:	bfb5                	j	8020475a <sys_open+0xc0>

00000000802047e0 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    802047e0:	7169                	addi	sp,sp,-304
    802047e2:	f606                	sd	ra,296(sp)
    802047e4:	f222                	sd	s0,288(sp)
    802047e6:	ee26                	sd	s1,280(sp)
    802047e8:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    802047ea:	10400613          	li	a2,260
    802047ee:	ed840593          	addi	a1,s0,-296
    802047f2:	4501                	li	a0,0
    802047f4:	ffffe097          	auipc	ra,0xffffe
    802047f8:	672080e7          	jalr	1650(ra) # 80202e66 <argstr>
    return -1;
    802047fc:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    802047fe:	02054663          	bltz	a0,8020482a <sys_mkdir+0x4a>
    80204802:	4601                	li	a2,0
    80204804:	4585                	li	a1,1
    80204806:	ed840513          	addi	a0,s0,-296
    8020480a:	00000097          	auipc	ra,0x0
    8020480e:	c04080e7          	jalr	-1020(ra) # 8020440e <create>
    80204812:	84aa                	mv	s1,a0
    80204814:	c10d                	beqz	a0,80204836 <sys_mkdir+0x56>
  }
  eunlock(ep);
    80204816:	00002097          	auipc	ra,0x2
    8020481a:	aae080e7          	jalr	-1362(ra) # 802062c4 <eunlock>
  eput(ep);
    8020481e:	8526                	mv	a0,s1
    80204820:	00002097          	auipc	ra,0x2
    80204824:	af2080e7          	jalr	-1294(ra) # 80206312 <eput>
  return 0;
    80204828:	4781                	li	a5,0
}
    8020482a:	853e                	mv	a0,a5
    8020482c:	70b2                	ld	ra,296(sp)
    8020482e:	7412                	ld	s0,288(sp)
    80204830:	64f2                	ld	s1,280(sp)
    80204832:	6155                	addi	sp,sp,304
    80204834:	8082                	ret
    return -1;
    80204836:	57fd                	li	a5,-1
    80204838:	bfcd                	j	8020482a <sys_mkdir+0x4a>

000000008020483a <sys_chdir>:

uint64
sys_chdir(void)
{
    8020483a:	7169                	addi	sp,sp,-304
    8020483c:	f606                	sd	ra,296(sp)
    8020483e:	f222                	sd	s0,288(sp)
    80204840:	ee26                	sd	s1,280(sp)
    80204842:	ea4a                	sd	s2,272(sp)
    80204844:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
    80204846:	ffffd097          	auipc	ra,0xffffd
    8020484a:	1f6080e7          	jalr	502(ra) # 80201a3c <myproc>
    8020484e:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204850:	10400613          	li	a2,260
    80204854:	ed840593          	addi	a1,s0,-296
    80204858:	4501                	li	a0,0
    8020485a:	ffffe097          	auipc	ra,0xffffe
    8020485e:	60c080e7          	jalr	1548(ra) # 80202e66 <argstr>
    return -1;
    80204862:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204864:	04054063          	bltz	a0,802048a4 <sys_chdir+0x6a>
    80204868:	ed840513          	addi	a0,s0,-296
    8020486c:	00002097          	auipc	ra,0x2
    80204870:	1ca080e7          	jalr	458(ra) # 80206a36 <ename>
    80204874:	84aa                	mv	s1,a0
    80204876:	c931                	beqz	a0,802048ca <sys_chdir+0x90>
  }
  elock(ep);
    80204878:	00002097          	auipc	ra,0x2
    8020487c:	a16080e7          	jalr	-1514(ra) # 8020628e <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    80204880:	1004c783          	lbu	a5,256(s1)
    80204884:	8bc1                	andi	a5,a5,16
    80204886:	c795                	beqz	a5,802048b2 <sys_chdir+0x78>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    80204888:	8526                	mv	a0,s1
    8020488a:	00002097          	auipc	ra,0x2
    8020488e:	a3a080e7          	jalr	-1478(ra) # 802062c4 <eunlock>
  eput(p->cwd);
    80204892:	15893503          	ld	a0,344(s2)
    80204896:	00002097          	auipc	ra,0x2
    8020489a:	a7c080e7          	jalr	-1412(ra) # 80206312 <eput>
  p->cwd = ep;
    8020489e:	14993c23          	sd	s1,344(s2)
  return 0;
    802048a2:	4781                	li	a5,0
}
    802048a4:	853e                	mv	a0,a5
    802048a6:	70b2                	ld	ra,296(sp)
    802048a8:	7412                	ld	s0,288(sp)
    802048aa:	64f2                	ld	s1,280(sp)
    802048ac:	6952                	ld	s2,272(sp)
    802048ae:	6155                	addi	sp,sp,304
    802048b0:	8082                	ret
    eunlock(ep);
    802048b2:	8526                	mv	a0,s1
    802048b4:	00002097          	auipc	ra,0x2
    802048b8:	a10080e7          	jalr	-1520(ra) # 802062c4 <eunlock>
    eput(ep);
    802048bc:	8526                	mv	a0,s1
    802048be:	00002097          	auipc	ra,0x2
    802048c2:	a54080e7          	jalr	-1452(ra) # 80206312 <eput>
    return -1;
    802048c6:	57fd                	li	a5,-1
    802048c8:	bff1                	j	802048a4 <sys_chdir+0x6a>
    return -1;
    802048ca:	57fd                	li	a5,-1
    802048cc:	bfe1                	j	802048a4 <sys_chdir+0x6a>

00000000802048ce <sys_pipe>:

uint64
sys_pipe(void)
{
    802048ce:	7139                	addi	sp,sp,-64
    802048d0:	fc06                	sd	ra,56(sp)
    802048d2:	f822                	sd	s0,48(sp)
    802048d4:	f426                	sd	s1,40(sp)
    802048d6:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    802048d8:	ffffd097          	auipc	ra,0xffffd
    802048dc:	164080e7          	jalr	356(ra) # 80201a3c <myproc>
    802048e0:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    802048e2:	fd840593          	addi	a1,s0,-40
    802048e6:	4501                	li	a0,0
    802048e8:	ffffe097          	auipc	ra,0xffffe
    802048ec:	55c080e7          	jalr	1372(ra) # 80202e44 <argaddr>
    return -1;
    802048f0:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    802048f2:	0c054e63          	bltz	a0,802049ce <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    802048f6:	fc840593          	addi	a1,s0,-56
    802048fa:	fd040513          	addi	a0,s0,-48
    802048fe:	fffff097          	auipc	ra,0xfffff
    80204902:	2f8080e7          	jalr	760(ra) # 80203bf6 <pipealloc>
    return -1;
    80204906:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80204908:	0c054363          	bltz	a0,802049ce <sys_pipe+0x100>
  fd0 = -1;
    8020490c:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80204910:	fd043503          	ld	a0,-48(s0)
    80204914:	00000097          	auipc	ra,0x0
    80204918:	ab8080e7          	jalr	-1352(ra) # 802043cc <fdalloc>
    8020491c:	fca42223          	sw	a0,-60(s0)
    80204920:	08054a63          	bltz	a0,802049b4 <sys_pipe+0xe6>
    80204924:	fc843503          	ld	a0,-56(s0)
    80204928:	00000097          	auipc	ra,0x0
    8020492c:	aa4080e7          	jalr	-1372(ra) # 802043cc <fdalloc>
    80204930:	fca42023          	sw	a0,-64(s0)
    80204934:	06054763          	bltz	a0,802049a2 <sys_pipe+0xd4>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204938:	4611                	li	a2,4
    8020493a:	fc440593          	addi	a1,s0,-60
    8020493e:	fd843503          	ld	a0,-40(s0)
    80204942:	ffffd097          	auipc	ra,0xffffd
    80204946:	a30080e7          	jalr	-1488(ra) # 80201372 <copyout2>
    8020494a:	00054f63          	bltz	a0,80204968 <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    8020494e:	4611                	li	a2,4
    80204950:	fc040593          	addi	a1,s0,-64
    80204954:	fd843503          	ld	a0,-40(s0)
    80204958:	0511                	addi	a0,a0,4
    8020495a:	ffffd097          	auipc	ra,0xffffd
    8020495e:	a18080e7          	jalr	-1512(ra) # 80201372 <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80204962:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204964:	06055563          	bgez	a0,802049ce <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80204968:	fc442783          	lw	a5,-60(s0)
    8020496c:	07e9                	addi	a5,a5,26
    8020496e:	078e                	slli	a5,a5,0x3
    80204970:	97a6                	add	a5,a5,s1
    80204972:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80204976:	fc042783          	lw	a5,-64(s0)
    8020497a:	07e9                	addi	a5,a5,26
    8020497c:	078e                	slli	a5,a5,0x3
    8020497e:	00f48533          	add	a0,s1,a5
    80204982:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204986:	fd043503          	ld	a0,-48(s0)
    8020498a:	fffff097          	auipc	ra,0xfffff
    8020498e:	efa080e7          	jalr	-262(ra) # 80203884 <fileclose>
    fileclose(wf);
    80204992:	fc843503          	ld	a0,-56(s0)
    80204996:	fffff097          	auipc	ra,0xfffff
    8020499a:	eee080e7          	jalr	-274(ra) # 80203884 <fileclose>
    return -1;
    8020499e:	57fd                	li	a5,-1
    802049a0:	a03d                	j	802049ce <sys_pipe+0x100>
    if(fd0 >= 0)
    802049a2:	fc442783          	lw	a5,-60(s0)
    802049a6:	0007c763          	bltz	a5,802049b4 <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    802049aa:	07e9                	addi	a5,a5,26
    802049ac:	078e                	slli	a5,a5,0x3
    802049ae:	97a6                	add	a5,a5,s1
    802049b0:	0007b423          	sd	zero,8(a5)
    fileclose(rf);
    802049b4:	fd043503          	ld	a0,-48(s0)
    802049b8:	fffff097          	auipc	ra,0xfffff
    802049bc:	ecc080e7          	jalr	-308(ra) # 80203884 <fileclose>
    fileclose(wf);
    802049c0:	fc843503          	ld	a0,-56(s0)
    802049c4:	fffff097          	auipc	ra,0xfffff
    802049c8:	ec0080e7          	jalr	-320(ra) # 80203884 <fileclose>
    return -1;
    802049cc:	57fd                	li	a5,-1
}
    802049ce:	853e                	mv	a0,a5
    802049d0:	70e2                	ld	ra,56(sp)
    802049d2:	7442                	ld	s0,48(sp)
    802049d4:	74a2                	ld	s1,40(sp)
    802049d6:	6121                	addi	sp,sp,64
    802049d8:	8082                	ret

00000000802049da <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    802049da:	7179                	addi	sp,sp,-48
    802049dc:	f406                	sd	ra,40(sp)
    802049de:	f022                	sd	s0,32(sp)
    802049e0:	ec26                	sd	s1,24(sp)
    802049e2:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    802049e4:	fdc40593          	addi	a1,s0,-36
    802049e8:	4501                	li	a0,0
    802049ea:	ffffe097          	auipc	ra,0xffffe
    802049ee:	3f8080e7          	jalr	1016(ra) # 80202de2 <argint>
    802049f2:	08054a63          	bltz	a0,80204a86 <sys_dev+0xac>
    802049f6:	fd840593          	addi	a1,s0,-40
    802049fa:	4505                	li	a0,1
    802049fc:	ffffe097          	auipc	ra,0xffffe
    80204a00:	3e6080e7          	jalr	998(ra) # 80202de2 <argint>
    80204a04:	08054763          	bltz	a0,80204a92 <sys_dev+0xb8>
    80204a08:	fd440593          	addi	a1,s0,-44
    80204a0c:	4509                	li	a0,2
    80204a0e:	ffffe097          	auipc	ra,0xffffe
    80204a12:	3d4080e7          	jalr	980(ra) # 80202de2 <argint>
    80204a16:	08054063          	bltz	a0,80204a96 <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    80204a1a:	fdc42783          	lw	a5,-36(s0)
    80204a1e:	0407f793          	andi	a5,a5,64
    80204a22:	ebb1                	bnez	a5,80204a76 <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    80204a24:	fd842703          	lw	a4,-40(s0)
    80204a28:	47a5                	li	a5,9
    return -1;
    80204a2a:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    80204a2c:	04e7ee63          	bltu	a5,a4,80204a88 <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204a30:	fffff097          	auipc	ra,0xfffff
    80204a34:	d98080e7          	jalr	-616(ra) # 802037c8 <filealloc>
    80204a38:	84aa                	mv	s1,a0
    80204a3a:	c125                	beqz	a0,80204a9a <sys_dev+0xc0>
    80204a3c:	00000097          	auipc	ra,0x0
    80204a40:	990080e7          	jalr	-1648(ra) # 802043cc <fdalloc>
    80204a44:	04054d63          	bltz	a0,80204a9e <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80204a48:	478d                	li	a5,3
    80204a4a:	c09c                	sw	a5,0(s1)
  f->off = 0;
    80204a4c:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80204a50:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80204a54:	fd842783          	lw	a5,-40(s0)
    80204a58:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    80204a5c:	fdc42783          	lw	a5,-36(s0)
    80204a60:	0017c713          	xori	a4,a5,1
    80204a64:	8b05                	andi	a4,a4,1
    80204a66:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204a6a:	8b8d                	andi	a5,a5,3
    80204a6c:	00f037b3          	snez	a5,a5
    80204a70:	00f484a3          	sb	a5,9(s1)

  return fd;
    80204a74:	a811                	j	80204a88 <sys_dev+0xae>
    panic("dev file on FAT");
    80204a76:	00005517          	auipc	a0,0x5
    80204a7a:	15250513          	addi	a0,a0,338 # 80209bc8 <digits+0x848>
    80204a7e:	ffffb097          	auipc	ra,0xffffb
    80204a82:	6c6080e7          	jalr	1734(ra) # 80200144 <panic>
    return -1;
    80204a86:	557d                	li	a0,-1
}
    80204a88:	70a2                	ld	ra,40(sp)
    80204a8a:	7402                	ld	s0,32(sp)
    80204a8c:	64e2                	ld	s1,24(sp)
    80204a8e:	6145                	addi	sp,sp,48
    80204a90:	8082                	ret
    return -1;
    80204a92:	557d                	li	a0,-1
    80204a94:	bfd5                	j	80204a88 <sys_dev+0xae>
    80204a96:	557d                	li	a0,-1
    80204a98:	bfc5                	j	80204a88 <sys_dev+0xae>
    return -1;
    80204a9a:	557d                	li	a0,-1
    80204a9c:	b7f5                	j	80204a88 <sys_dev+0xae>
      fileclose(f);
    80204a9e:	8526                	mv	a0,s1
    80204aa0:	fffff097          	auipc	ra,0xfffff
    80204aa4:	de4080e7          	jalr	-540(ra) # 80203884 <fileclose>
    return -1;
    80204aa8:	557d                	li	a0,-1
    80204aaa:	bff9                	j	80204a88 <sys_dev+0xae>

0000000080204aac <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80204aac:	1101                	addi	sp,sp,-32
    80204aae:	ec06                	sd	ra,24(sp)
    80204ab0:	e822                	sd	s0,16(sp)
    80204ab2:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204ab4:	fe840613          	addi	a2,s0,-24
    80204ab8:	4581                	li	a1,0
    80204aba:	4501                	li	a0,0
    80204abc:	00000097          	auipc	ra,0x0
    80204ac0:	8a8080e7          	jalr	-1880(ra) # 80204364 <argfd>
    return -1;
    80204ac4:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204ac6:	02054563          	bltz	a0,80204af0 <sys_readdir+0x44>
    80204aca:	fe040593          	addi	a1,s0,-32
    80204ace:	4505                	li	a0,1
    80204ad0:	ffffe097          	auipc	ra,0xffffe
    80204ad4:	374080e7          	jalr	884(ra) # 80202e44 <argaddr>
    return -1;
    80204ad8:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204ada:	00054b63          	bltz	a0,80204af0 <sys_readdir+0x44>
  return dirnext(f, p);
    80204ade:	fe043583          	ld	a1,-32(s0)
    80204ae2:	fe843503          	ld	a0,-24(s0)
    80204ae6:	fffff097          	auipc	ra,0xfffff
    80204aea:	04a080e7          	jalr	74(ra) # 80203b30 <dirnext>
    80204aee:	87aa                	mv	a5,a0
}
    80204af0:	853e                	mv	a0,a5
    80204af2:	60e2                	ld	ra,24(sp)
    80204af4:	6442                	ld	s0,16(sp)
    80204af6:	6105                	addi	sp,sp,32
    80204af8:	8082                	ret

0000000080204afa <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    80204afa:	714d                	addi	sp,sp,-336
    80204afc:	e686                	sd	ra,328(sp)
    80204afe:	e2a2                	sd	s0,320(sp)
    80204b00:	fe26                	sd	s1,312(sp)
    80204b02:	fa4a                	sd	s2,304(sp)
    80204b04:	f64e                	sd	s3,296(sp)
    80204b06:	f252                	sd	s4,288(sp)
    80204b08:	ee56                	sd	s5,280(sp)
    80204b0a:	0a80                	addi	s0,sp,336
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    80204b0c:	fb840593          	addi	a1,s0,-72
    80204b10:	4501                	li	a0,0
    80204b12:	ffffe097          	auipc	ra,0xffffe
    80204b16:	332080e7          	jalr	818(ra) # 80202e44 <argaddr>
    80204b1a:	87aa                	mv	a5,a0
    return -1;
    80204b1c:	557d                	li	a0,-1
  if (argaddr(0, &addr) < 0)
    80204b1e:	0607cc63          	bltz	a5,80204b96 <sys_getcwd+0x9c>

  struct dirent *de = myproc()->cwd;
    80204b22:	ffffd097          	auipc	ra,0xffffd
    80204b26:	f1a080e7          	jalr	-230(ra) # 80201a3c <myproc>
    80204b2a:	15853483          	ld	s1,344(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    80204b2e:	1204b783          	ld	a5,288(s1)
    80204b32:	cbbd                	beqz	a5,80204ba8 <sys_getcwd+0xae>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80204b34:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    80204b38:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    80204b3c:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80204b40:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80204b44:	8526                	mv	a0,s1
    80204b46:	ffffc097          	auipc	ra,0xffffc
    80204b4a:	da0080e7          	jalr	-608(ra) # 802008e6 <strlen>
    80204b4e:	862a                	mv	a2,a0
      s -= len;
    80204b50:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    80204b54:	052a7f63          	bgeu	s4,s2,80204bb2 <sys_getcwd+0xb8>
      strncpy(s, de->filename, len);
    80204b58:	85a6                	mv	a1,s1
    80204b5a:	854a                	mv	a0,s2
    80204b5c:	ffffc097          	auipc	ra,0xffffc
    80204b60:	d1a080e7          	jalr	-742(ra) # 80200876 <strncpy>
      *--s = '/';
    80204b64:	fff90993          	addi	s3,s2,-1
    80204b68:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80204b6c:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80204b70:	1204b783          	ld	a5,288(s1)
    80204b74:	fbe1                	bnez	a5,80204b44 <sys_getcwd+0x4a>
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    80204b76:	fb843483          	ld	s1,-72(s0)
    80204b7a:	854e                	mv	a0,s3
    80204b7c:	ffffc097          	auipc	ra,0xffffc
    80204b80:	d6a080e7          	jalr	-662(ra) # 802008e6 <strlen>
    80204b84:	0015061b          	addiw	a2,a0,1
    80204b88:	85ce                	mv	a1,s3
    80204b8a:	8526                	mv	a0,s1
    80204b8c:	ffffc097          	auipc	ra,0xffffc
    80204b90:	7e6080e7          	jalr	2022(ra) # 80201372 <copyout2>
    80204b94:	957d                	srai	a0,a0,0x3f
    return -1;
  
  return 0;

}
    80204b96:	60b6                	ld	ra,328(sp)
    80204b98:	6416                	ld	s0,320(sp)
    80204b9a:	74f2                	ld	s1,312(sp)
    80204b9c:	7952                	ld	s2,304(sp)
    80204b9e:	79b2                	ld	s3,296(sp)
    80204ba0:	7a12                	ld	s4,288(sp)
    80204ba2:	6af2                	ld	s5,280(sp)
    80204ba4:	6171                	addi	sp,sp,336
    80204ba6:	8082                	ret
    s = "/";
    80204ba8:	00005997          	auipc	s3,0x5
    80204bac:	a8898993          	addi	s3,s3,-1400 # 80209630 <digits+0x2b0>
    80204bb0:	b7d9                	j	80204b76 <sys_getcwd+0x7c>
        return -1;
    80204bb2:	557d                	li	a0,-1
    80204bb4:	b7cd                	j	80204b96 <sys_getcwd+0x9c>

0000000080204bb6 <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    80204bb6:	d6010113          	addi	sp,sp,-672
    80204bba:	28113c23          	sd	ra,664(sp)
    80204bbe:	28813823          	sd	s0,656(sp)
    80204bc2:	28913423          	sd	s1,648(sp)
    80204bc6:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    80204bc8:	10400613          	li	a2,260
    80204bcc:	ed840593          	addi	a1,s0,-296
    80204bd0:	4501                	li	a0,0
    80204bd2:	ffffe097          	auipc	ra,0xffffe
    80204bd6:	294080e7          	jalr	660(ra) # 80202e66 <argstr>
    80204bda:	0ea05a63          	blez	a0,80204cce <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    80204bde:	157d                	addi	a0,a0,-1
    80204be0:	ed840713          	addi	a4,s0,-296
    80204be4:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    80204be8:	02f00693          	li	a3,47
    80204bec:	863a                	mv	a2,a4
    80204bee:	00e7e963          	bltu	a5,a4,80204c00 <sys_remove+0x4a>
    80204bf2:	0007c703          	lbu	a4,0(a5)
    80204bf6:	08d71a63          	bne	a4,a3,80204c8a <sys_remove+0xd4>
    s--;
    80204bfa:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    80204bfc:	fec7fbe3          	bgeu	a5,a2,80204bf2 <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    80204c00:	ed840513          	addi	a0,s0,-296
    80204c04:	00002097          	auipc	ra,0x2
    80204c08:	e32080e7          	jalr	-462(ra) # 80206a36 <ename>
    80204c0c:	84aa                	mv	s1,a0
    80204c0e:	c561                	beqz	a0,80204cd6 <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    80204c10:	00001097          	auipc	ra,0x1
    80204c14:	67e080e7          	jalr	1662(ra) # 8020628e <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204c18:	1004c783          	lbu	a5,256(s1)
    80204c1c:	8bc1                	andi	a5,a5,16
    80204c1e:	c38d                	beqz	a5,80204c40 <sys_remove+0x8a>
  ep.valid = 0;
    80204c20:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204c24:	d6c40693          	addi	a3,s0,-660
    80204c28:	04000613          	li	a2,64
    80204c2c:	d7040593          	addi	a1,s0,-656
    80204c30:	8526                	mv	a0,s1
    80204c32:	00002097          	auipc	ra,0x2
    80204c36:	860080e7          	jalr	-1952(ra) # 80206492 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204c3a:	57fd                	li	a5,-1
    80204c3c:	06f51d63          	bne	a0,a5,80204cb6 <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    80204c40:	1204b503          	ld	a0,288(s1)
    80204c44:	00001097          	auipc	ra,0x1
    80204c48:	64a080e7          	jalr	1610(ra) # 8020628e <elock>
  eremove(ep);
    80204c4c:	8526                	mv	a0,s1
    80204c4e:	00001097          	auipc	ra,0x1
    80204c52:	50c080e7          	jalr	1292(ra) # 8020615a <eremove>
  eunlock(ep->parent);
    80204c56:	1204b503          	ld	a0,288(s1)
    80204c5a:	00001097          	auipc	ra,0x1
    80204c5e:	66a080e7          	jalr	1642(ra) # 802062c4 <eunlock>
  eunlock(ep);
    80204c62:	8526                	mv	a0,s1
    80204c64:	00001097          	auipc	ra,0x1
    80204c68:	660080e7          	jalr	1632(ra) # 802062c4 <eunlock>
  eput(ep);
    80204c6c:	8526                	mv	a0,s1
    80204c6e:	00001097          	auipc	ra,0x1
    80204c72:	6a4080e7          	jalr	1700(ra) # 80206312 <eput>

  return 0;
    80204c76:	4501                	li	a0,0
}
    80204c78:	29813083          	ld	ra,664(sp)
    80204c7c:	29013403          	ld	s0,656(sp)
    80204c80:	28813483          	ld	s1,648(sp)
    80204c84:	2a010113          	addi	sp,sp,672
    80204c88:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    80204c8a:	ed840713          	addi	a4,s0,-296
    80204c8e:	f6e7e9e3          	bltu	a5,a4,80204c00 <sys_remove+0x4a>
    80204c92:	0007c683          	lbu	a3,0(a5)
    80204c96:	02e00713          	li	a4,46
    80204c9a:	f6e693e3          	bne	a3,a4,80204c00 <sys_remove+0x4a>
    80204c9e:	ed840713          	addi	a4,s0,-296
    80204ca2:	02e78863          	beq	a5,a4,80204cd2 <sys_remove+0x11c>
    80204ca6:	fff7c703          	lbu	a4,-1(a5)
    80204caa:	02f00793          	li	a5,47
    80204cae:	f4f719e3          	bne	a4,a5,80204c00 <sys_remove+0x4a>
    return -1;
    80204cb2:	557d                	li	a0,-1
    80204cb4:	b7d1                	j	80204c78 <sys_remove+0xc2>
      eunlock(ep);
    80204cb6:	8526                	mv	a0,s1
    80204cb8:	00001097          	auipc	ra,0x1
    80204cbc:	60c080e7          	jalr	1548(ra) # 802062c4 <eunlock>
      eput(ep);
    80204cc0:	8526                	mv	a0,s1
    80204cc2:	00001097          	auipc	ra,0x1
    80204cc6:	650080e7          	jalr	1616(ra) # 80206312 <eput>
      return -1;
    80204cca:	557d                	li	a0,-1
    80204ccc:	b775                	j	80204c78 <sys_remove+0xc2>
    return -1;
    80204cce:	557d                	li	a0,-1
    80204cd0:	b765                	j	80204c78 <sys_remove+0xc2>
    return -1;
    80204cd2:	557d                	li	a0,-1
    80204cd4:	b755                	j	80204c78 <sys_remove+0xc2>
    return -1;
    80204cd6:	557d                	li	a0,-1
    80204cd8:	b745                	j	80204c78 <sys_remove+0xc2>

0000000080204cda <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    80204cda:	c4010113          	addi	sp,sp,-960
    80204cde:	3a113c23          	sd	ra,952(sp)
    80204ce2:	3a813823          	sd	s0,944(sp)
    80204ce6:	3a913423          	sd	s1,936(sp)
    80204cea:	3b213023          	sd	s2,928(sp)
    80204cee:	39313c23          	sd	s3,920(sp)
    80204cf2:	39413823          	sd	s4,912(sp)
    80204cf6:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204cf8:	10400613          	li	a2,260
    80204cfc:	ec840593          	addi	a1,s0,-312
    80204d00:	4501                	li	a0,0
    80204d02:	ffffe097          	auipc	ra,0xffffe
    80204d06:	164080e7          	jalr	356(ra) # 80202e66 <argstr>
      return -1;
    80204d0a:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204d0c:	0c054d63          	bltz	a0,80204de6 <sys_rename+0x10c>
    80204d10:	10400613          	li	a2,260
    80204d14:	dc040593          	addi	a1,s0,-576
    80204d18:	4505                	li	a0,1
    80204d1a:	ffffe097          	auipc	ra,0xffffe
    80204d1e:	14c080e7          	jalr	332(ra) # 80202e66 <argstr>
      return -1;
    80204d22:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204d24:	0c054163          	bltz	a0,80204de6 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    80204d28:	ec840513          	addi	a0,s0,-312
    80204d2c:	00002097          	auipc	ra,0x2
    80204d30:	d0a080e7          	jalr	-758(ra) # 80206a36 <ename>
    80204d34:	84aa                	mv	s1,a0
    80204d36:	1c050963          	beqz	a0,80204f08 <sys_rename+0x22e>
    80204d3a:	ec840593          	addi	a1,s0,-312
    80204d3e:	dc040513          	addi	a0,s0,-576
    80204d42:	00002097          	auipc	ra,0x2
    80204d46:	d12080e7          	jalr	-750(ra) # 80206a54 <enameparent>
    80204d4a:	892a                	mv	s2,a0
    80204d4c:	cd35                	beqz	a0,80204dc8 <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    80204d4e:	ec840513          	addi	a0,s0,-312
    80204d52:	00001097          	auipc	ra,0x1
    80204d56:	e5c080e7          	jalr	-420(ra) # 80205bae <formatname>
    80204d5a:	89aa                	mv	s3,a0
    80204d5c:	c535                	beqz	a0,80204dc8 <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    80204d5e:	07248563          	beq	s1,s2,80204dc8 <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    80204d62:	87ca                	mv	a5,s2
    80204d64:	1207b783          	ld	a5,288(a5)
    80204d68:	c781                	beqz	a5,80204d70 <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    80204d6a:	fef49de3          	bne	s1,a5,80204d64 <sys_rename+0x8a>
    80204d6e:	a8a9                	j	80204dc8 <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    80204d70:	8526                	mv	a0,s1
    80204d72:	00001097          	auipc	ra,0x1
    80204d76:	51c080e7          	jalr	1308(ra) # 8020628e <elock>
  srclock = 1;
  elock(pdst);
    80204d7a:	854a                	mv	a0,s2
    80204d7c:	00001097          	auipc	ra,0x1
    80204d80:	512080e7          	jalr	1298(ra) # 8020628e <elock>
  dst = dirlookup(pdst, name, &off);
    80204d84:	dbc40613          	addi	a2,s0,-580
    80204d88:	85ce                	mv	a1,s3
    80204d8a:	854a                	mv	a0,s2
    80204d8c:	00002097          	auipc	ra,0x2
    80204d90:	890080e7          	jalr	-1904(ra) # 8020661c <dirlookup>
    80204d94:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    80204d96:	cd45                	beqz	a0,80204e4e <sys_rename+0x174>
    eunlock(pdst);
    80204d98:	854a                	mv	a0,s2
    80204d9a:	00001097          	auipc	ra,0x1
    80204d9e:	52a080e7          	jalr	1322(ra) # 802062c4 <eunlock>
    if (src == dst) {
    80204da2:	01448963          	beq	s1,s4,80204db4 <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    80204da6:	1004c783          	lbu	a5,256(s1)
    80204daa:	100a4703          	lbu	a4,256(s4)
    80204dae:	8ff9                	and	a5,a5,a4
    80204db0:	8bc1                	andi	a5,a5,16
    80204db2:	ebb1                	bnez	a5,80204e06 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    80204db4:	8526                	mv	a0,s1
    80204db6:	00001097          	auipc	ra,0x1
    80204dba:	50e080e7          	jalr	1294(ra) # 802062c4 <eunlock>
  if (dst)
    eput(dst);
    80204dbe:	8552                	mv	a0,s4
    80204dc0:	00001097          	auipc	ra,0x1
    80204dc4:	552080e7          	jalr	1362(ra) # 80206312 <eput>
  if (pdst)
    80204dc8:	00090763          	beqz	s2,80204dd6 <sys_rename+0xfc>
    eput(pdst);
    80204dcc:	854a                	mv	a0,s2
    80204dce:	00001097          	auipc	ra,0x1
    80204dd2:	544080e7          	jalr	1348(ra) # 80206312 <eput>
  if (src)
    eput(src);
  return -1;
    80204dd6:	57fd                	li	a5,-1
  if (src)
    80204dd8:	c499                	beqz	s1,80204de6 <sys_rename+0x10c>
    eput(src);
    80204dda:	8526                	mv	a0,s1
    80204ddc:	00001097          	auipc	ra,0x1
    80204de0:	536080e7          	jalr	1334(ra) # 80206312 <eput>
  return -1;
    80204de4:	57fd                	li	a5,-1
}
    80204de6:	853e                	mv	a0,a5
    80204de8:	3b813083          	ld	ra,952(sp)
    80204dec:	3b013403          	ld	s0,944(sp)
    80204df0:	3a813483          	ld	s1,936(sp)
    80204df4:	3a013903          	ld	s2,928(sp)
    80204df8:	39813983          	ld	s3,920(sp)
    80204dfc:	39013a03          	ld	s4,912(sp)
    80204e00:	3c010113          	addi	sp,sp,960
    80204e04:	8082                	ret
      elock(dst);
    80204e06:	8552                	mv	a0,s4
    80204e08:	00001097          	auipc	ra,0x1
    80204e0c:	486080e7          	jalr	1158(ra) # 8020628e <elock>
  ep.valid = 0;
    80204e10:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204e14:	c4c40693          	addi	a3,s0,-948
    80204e18:	04000613          	li	a2,64
    80204e1c:	c5040593          	addi	a1,s0,-944
    80204e20:	8552                	mv	a0,s4
    80204e22:	00001097          	auipc	ra,0x1
    80204e26:	670080e7          	jalr	1648(ra) # 80206492 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    80204e2a:	57fd                	li	a5,-1
    80204e2c:	0cf51863          	bne	a0,a5,80204efc <sys_rename+0x222>
      elock(pdst);
    80204e30:	854a                	mv	a0,s2
    80204e32:	00001097          	auipc	ra,0x1
    80204e36:	45c080e7          	jalr	1116(ra) # 8020628e <elock>
    eremove(dst);
    80204e3a:	8552                	mv	a0,s4
    80204e3c:	00001097          	auipc	ra,0x1
    80204e40:	31e080e7          	jalr	798(ra) # 8020615a <eremove>
    eunlock(dst);
    80204e44:	8552                	mv	a0,s4
    80204e46:	00001097          	auipc	ra,0x1
    80204e4a:	47e080e7          	jalr	1150(ra) # 802062c4 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    80204e4e:	0ff00613          	li	a2,255
    80204e52:	85ce                	mv	a1,s3
    80204e54:	8526                	mv	a0,s1
    80204e56:	ffffc097          	auipc	ra,0xffffc
    80204e5a:	968080e7          	jalr	-1688(ra) # 802007be <memmove>
  emake(pdst, src, off);
    80204e5e:	dbc42603          	lw	a2,-580(s0)
    80204e62:	85a6                	mv	a1,s1
    80204e64:	854a                	mv	a0,s2
    80204e66:	00001097          	auipc	ra,0x1
    80204e6a:	e00080e7          	jalr	-512(ra) # 80205c66 <emake>
  if (src->parent != pdst) {
    80204e6e:	1204b783          	ld	a5,288(s1)
    80204e72:	01278d63          	beq	a5,s2,80204e8c <sys_rename+0x1b2>
    eunlock(pdst);
    80204e76:	854a                	mv	a0,s2
    80204e78:	00001097          	auipc	ra,0x1
    80204e7c:	44c080e7          	jalr	1100(ra) # 802062c4 <eunlock>
    elock(src->parent);
    80204e80:	1204b503          	ld	a0,288(s1)
    80204e84:	00001097          	auipc	ra,0x1
    80204e88:	40a080e7          	jalr	1034(ra) # 8020628e <elock>
  eremove(src);
    80204e8c:	8526                	mv	a0,s1
    80204e8e:	00001097          	auipc	ra,0x1
    80204e92:	2cc080e7          	jalr	716(ra) # 8020615a <eremove>
  eunlock(src->parent);
    80204e96:	1204b503          	ld	a0,288(s1)
    80204e9a:	00001097          	auipc	ra,0x1
    80204e9e:	42a080e7          	jalr	1066(ra) # 802062c4 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    80204ea2:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    80204ea6:	854a                	mv	a0,s2
    80204ea8:	00001097          	auipc	ra,0x1
    80204eac:	188080e7          	jalr	392(ra) # 80206030 <edup>
    80204eb0:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    80204eb4:	dbc42783          	lw	a5,-580(s0)
    80204eb8:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    80204ebc:	4785                	li	a5,1
    80204ebe:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    80204ec2:	8526                	mv	a0,s1
    80204ec4:	00001097          	auipc	ra,0x1
    80204ec8:	400080e7          	jalr	1024(ra) # 802062c4 <eunlock>
  eput(psrc);
    80204ecc:	854e                	mv	a0,s3
    80204ece:	00001097          	auipc	ra,0x1
    80204ed2:	444080e7          	jalr	1092(ra) # 80206312 <eput>
  if (dst) {
    80204ed6:	000a0763          	beqz	s4,80204ee4 <sys_rename+0x20a>
    eput(dst);
    80204eda:	8552                	mv	a0,s4
    80204edc:	00001097          	auipc	ra,0x1
    80204ee0:	436080e7          	jalr	1078(ra) # 80206312 <eput>
  eput(pdst);
    80204ee4:	854a                	mv	a0,s2
    80204ee6:	00001097          	auipc	ra,0x1
    80204eea:	42c080e7          	jalr	1068(ra) # 80206312 <eput>
  eput(src);
    80204eee:	8526                	mv	a0,s1
    80204ef0:	00001097          	auipc	ra,0x1
    80204ef4:	422080e7          	jalr	1058(ra) # 80206312 <eput>
  return 0;
    80204ef8:	4781                	li	a5,0
    80204efa:	b5f5                	j	80204de6 <sys_rename+0x10c>
        eunlock(dst);
    80204efc:	8552                	mv	a0,s4
    80204efe:	00001097          	auipc	ra,0x1
    80204f02:	3c6080e7          	jalr	966(ra) # 802062c4 <eunlock>
        goto fail;
    80204f06:	b57d                	j	80204db4 <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    80204f08:	892a                	mv	s2,a0
  if (dst)
    80204f0a:	bd7d                	j	80204dc8 <sys_rename+0xee>

0000000080204f0c <sys_mkdirat>:
////////////////////////////////////////////////////////////////////////////


uint64
sys_mkdirat(void)
{
    80204f0c:	7169                	addi	sp,sp,-304
    80204f0e:	f606                	sd	ra,296(sp)
    80204f10:	f222                	sd	s0,288(sp)
    80204f12:	ee26                	sd	s1,280(sp)
    80204f14:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  int dirfd, mode;
  struct dirent *ep;
  if (argint(0, &dirfd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &mode) < 0) {
    80204f16:	ed440593          	addi	a1,s0,-300
    80204f1a:	4501                	li	a0,0
    80204f1c:	ffffe097          	auipc	ra,0xffffe
    80204f20:	ec6080e7          	jalr	-314(ra) # 80202de2 <argint>
    return -1;
    80204f24:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &mode) < 0) {
    80204f26:	06054a63          	bltz	a0,80204f9a <sys_mkdirat+0x8e>
    80204f2a:	10400613          	li	a2,260
    80204f2e:	ed840593          	addi	a1,s0,-296
    80204f32:	4505                	li	a0,1
    80204f34:	ffffe097          	auipc	ra,0xffffe
    80204f38:	f32080e7          	jalr	-206(ra) # 80202e66 <argstr>
    return -1;
    80204f3c:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &mode) < 0) {
    80204f3e:	04054e63          	bltz	a0,80204f9a <sys_mkdirat+0x8e>
    80204f42:	ed040593          	addi	a1,s0,-304
    80204f46:	4509                	li	a0,2
    80204f48:	ffffe097          	auipc	ra,0xffffe
    80204f4c:	e9a080e7          	jalr	-358(ra) # 80202de2 <argint>
    return -1;
    80204f50:	57fd                	li	a5,-1
  if (argint(0, &dirfd) < 0 || argstr(1, path, FAT32_MAX_PATH) < 0 || argint(2, &mode) < 0) {
    80204f52:	04054463          	bltz	a0,80204f9a <sys_mkdirat+0x8e>
  }
  printf("Running: BRK ... dirfd: %d ... mode: 0x%x... path: %s\n", dirfd, mode, path);
    80204f56:	ed840493          	addi	s1,s0,-296
    80204f5a:	86a6                	mv	a3,s1
    80204f5c:	ed042603          	lw	a2,-304(s0)
    80204f60:	ed442583          	lw	a1,-300(s0)
    80204f64:	00005517          	auipc	a0,0x5
    80204f68:	c7450513          	addi	a0,a0,-908 # 80209bd8 <digits+0x858>
    80204f6c:	ffffb097          	auipc	ra,0xffffb
    80204f70:	222080e7          	jalr	546(ra) # 8020018e <printf>
  ep = create(path, T_DIR, mode);
    80204f74:	ed042603          	lw	a2,-304(s0)
    80204f78:	4585                	li	a1,1
    80204f7a:	8526                	mv	a0,s1
    80204f7c:	fffff097          	auipc	ra,0xfffff
    80204f80:	492080e7          	jalr	1170(ra) # 8020440e <create>
    80204f84:	84aa                	mv	s1,a0
  eunlock(ep);
    80204f86:	00001097          	auipc	ra,0x1
    80204f8a:	33e080e7          	jalr	830(ra) # 802062c4 <eunlock>
  eput(ep);
    80204f8e:	8526                	mv	a0,s1
    80204f90:	00001097          	auipc	ra,0x1
    80204f94:	382080e7          	jalr	898(ra) # 80206312 <eput>
  return 0;
    80204f98:	4781                	li	a5,0
}
    80204f9a:	853e                	mv	a0,a5
    80204f9c:	70b2                	ld	ra,296(sp)
    80204f9e:	7412                	ld	s0,288(sp)
    80204fa0:	64f2                	ld	s1,280(sp)
    80204fa2:	6155                	addi	sp,sp,304
    80204fa4:	8082                	ret
	...

0000000080204fb0 <kernelvec>:
    80204fb0:	7111                	addi	sp,sp,-256
    80204fb2:	e006                	sd	ra,0(sp)
    80204fb4:	e40a                	sd	sp,8(sp)
    80204fb6:	e80e                	sd	gp,16(sp)
    80204fb8:	ec12                	sd	tp,24(sp)
    80204fba:	f016                	sd	t0,32(sp)
    80204fbc:	f41a                	sd	t1,40(sp)
    80204fbe:	f81e                	sd	t2,48(sp)
    80204fc0:	fc22                	sd	s0,56(sp)
    80204fc2:	e0a6                	sd	s1,64(sp)
    80204fc4:	e4aa                	sd	a0,72(sp)
    80204fc6:	e8ae                	sd	a1,80(sp)
    80204fc8:	ecb2                	sd	a2,88(sp)
    80204fca:	f0b6                	sd	a3,96(sp)
    80204fcc:	f4ba                	sd	a4,104(sp)
    80204fce:	f8be                	sd	a5,112(sp)
    80204fd0:	fcc2                	sd	a6,120(sp)
    80204fd2:	e146                	sd	a7,128(sp)
    80204fd4:	e54a                	sd	s2,136(sp)
    80204fd6:	e94e                	sd	s3,144(sp)
    80204fd8:	ed52                	sd	s4,152(sp)
    80204fda:	f156                	sd	s5,160(sp)
    80204fdc:	f55a                	sd	s6,168(sp)
    80204fde:	f95e                	sd	s7,176(sp)
    80204fe0:	fd62                	sd	s8,184(sp)
    80204fe2:	e1e6                	sd	s9,192(sp)
    80204fe4:	e5ea                	sd	s10,200(sp)
    80204fe6:	e9ee                	sd	s11,208(sp)
    80204fe8:	edf2                	sd	t3,216(sp)
    80204fea:	f1f6                	sd	t4,224(sp)
    80204fec:	f5fa                	sd	t5,232(sp)
    80204fee:	f9fe                	sd	t6,240(sp)
    80204ff0:	975fd0ef          	jal	ra,80202964 <kerneltrap>
    80204ff4:	6082                	ld	ra,0(sp)
    80204ff6:	6122                	ld	sp,8(sp)
    80204ff8:	61c2                	ld	gp,16(sp)
    80204ffa:	7282                	ld	t0,32(sp)
    80204ffc:	7322                	ld	t1,40(sp)
    80204ffe:	73c2                	ld	t2,48(sp)
    80205000:	7462                	ld	s0,56(sp)
    80205002:	6486                	ld	s1,64(sp)
    80205004:	6526                	ld	a0,72(sp)
    80205006:	65c6                	ld	a1,80(sp)
    80205008:	6666                	ld	a2,88(sp)
    8020500a:	7686                	ld	a3,96(sp)
    8020500c:	7726                	ld	a4,104(sp)
    8020500e:	77c6                	ld	a5,112(sp)
    80205010:	7866                	ld	a6,120(sp)
    80205012:	688a                	ld	a7,128(sp)
    80205014:	692a                	ld	s2,136(sp)
    80205016:	69ca                	ld	s3,144(sp)
    80205018:	6a6a                	ld	s4,152(sp)
    8020501a:	7a8a                	ld	s5,160(sp)
    8020501c:	7b2a                	ld	s6,168(sp)
    8020501e:	7bca                	ld	s7,176(sp)
    80205020:	7c6a                	ld	s8,184(sp)
    80205022:	6c8e                	ld	s9,192(sp)
    80205024:	6d2e                	ld	s10,200(sp)
    80205026:	6dce                	ld	s11,208(sp)
    80205028:	6e6e                	ld	t3,216(sp)
    8020502a:	7e8e                	ld	t4,224(sp)
    8020502c:	7f2e                	ld	t5,232(sp)
    8020502e:	7fce                	ld	t6,240(sp)
    80205030:	6111                	addi	sp,sp,256
    80205032:	10200073          	sret
	...

000000008020503e <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    8020503e:	1141                	addi	sp,sp,-16
    80205040:	e406                	sd	ra,8(sp)
    80205042:	e022                	sd	s0,0(sp)
    80205044:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80205046:	00005597          	auipc	a1,0x5
    8020504a:	bca58593          	addi	a1,a1,-1078 # 80209c10 <digits+0x890>
    8020504e:	00019517          	auipc	a0,0x19
    80205052:	3ba50513          	addi	a0,a0,954 # 8021e408 <tickslock>
    80205056:	ffffb097          	auipc	ra,0xffffb
    8020505a:	62c080e7          	jalr	1580(ra) # 80200682 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    8020505e:	60a2                	ld	ra,8(sp)
    80205060:	6402                	ld	s0,0(sp)
    80205062:	0141                	addi	sp,sp,16
    80205064:	8082                	ret

0000000080205066 <set_next_timeout>:

void
set_next_timeout() {
    80205066:	1141                	addi	sp,sp,-16
    80205068:	e422                	sd	s0,8(sp)
    8020506a:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    8020506c:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80205070:	001dc7b7          	lui	a5,0x1dc
    80205074:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    80205078:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    8020507a:	4581                	li	a1,0
    8020507c:	4601                	li	a2,0
    8020507e:	4681                	li	a3,0
    80205080:	4881                	li	a7,0
    80205082:	00000073          	ecall
}
    80205086:	6422                	ld	s0,8(sp)
    80205088:	0141                	addi	sp,sp,16
    8020508a:	8082                	ret

000000008020508c <timer_tick>:

void timer_tick() {
    8020508c:	1101                	addi	sp,sp,-32
    8020508e:	ec06                	sd	ra,24(sp)
    80205090:	e822                	sd	s0,16(sp)
    80205092:	e426                	sd	s1,8(sp)
    80205094:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80205096:	00019497          	auipc	s1,0x19
    8020509a:	37248493          	addi	s1,s1,882 # 8021e408 <tickslock>
    8020509e:	8526                	mv	a0,s1
    802050a0:	ffffb097          	auipc	ra,0xffffb
    802050a4:	626080e7          	jalr	1574(ra) # 802006c6 <acquire>
    ticks++;
    802050a8:	4c9c                	lw	a5,24(s1)
    802050aa:	2785                	addiw	a5,a5,1
    802050ac:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    802050ae:	00019517          	auipc	a0,0x19
    802050b2:	37250513          	addi	a0,a0,882 # 8021e420 <ticks>
    802050b6:	ffffd097          	auipc	ra,0xffffd
    802050ba:	3a6080e7          	jalr	934(ra) # 8020245c <wakeup>
    release(&tickslock);
    802050be:	8526                	mv	a0,s1
    802050c0:	ffffb097          	auipc	ra,0xffffb
    802050c4:	65a080e7          	jalr	1626(ra) # 8020071a <release>
    set_next_timeout();
    802050c8:	00000097          	auipc	ra,0x0
    802050cc:	f9e080e7          	jalr	-98(ra) # 80205066 <set_next_timeout>
}
    802050d0:	60e2                	ld	ra,24(sp)
    802050d2:	6442                	ld	s0,16(sp)
    802050d4:	64a2                	ld	s1,8(sp)
    802050d6:	6105                	addi	sp,sp,32
    802050d8:	8082                	ret

00000000802050da <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    802050da:	1141                	addi	sp,sp,-16
    802050dc:	e406                	sd	ra,8(sp)
    802050de:	e022                	sd	s0,0(sp)
    802050e0:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    802050e2:	00002097          	auipc	ra,0x2
    802050e6:	e8e080e7          	jalr	-370(ra) # 80206f70 <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    802050ea:	60a2                	ld	ra,8(sp)
    802050ec:	6402                	ld	s0,0(sp)
    802050ee:	0141                	addi	sp,sp,16
    802050f0:	8082                	ret

00000000802050f2 <disk_read>:

void disk_read(struct buf *b)
{
    802050f2:	1141                	addi	sp,sp,-16
    802050f4:	e406                	sd	ra,8(sp)
    802050f6:	e022                	sd	s0,0(sp)
    802050f8:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    802050fa:	4581                	li	a1,0
    802050fc:	00002097          	auipc	ra,0x2
    80205100:	ffa080e7          	jalr	-6(ra) # 802070f6 <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    80205104:	60a2                	ld	ra,8(sp)
    80205106:	6402                	ld	s0,0(sp)
    80205108:	0141                	addi	sp,sp,16
    8020510a:	8082                	ret

000000008020510c <disk_write>:

void disk_write(struct buf *b)
{
    8020510c:	1141                	addi	sp,sp,-16
    8020510e:	e406                	sd	ra,8(sp)
    80205110:	e022                	sd	s0,0(sp)
    80205112:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    80205114:	4585                	li	a1,1
    80205116:	00002097          	auipc	ra,0x2
    8020511a:	fe0080e7          	jalr	-32(ra) # 802070f6 <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    8020511e:	60a2                	ld	ra,8(sp)
    80205120:	6402                	ld	s0,0(sp)
    80205122:	0141                	addi	sp,sp,16
    80205124:	8082                	ret

0000000080205126 <disk_intr>:

void disk_intr(void)
{
    80205126:	1141                	addi	sp,sp,-16
    80205128:	e406                	sd	ra,8(sp)
    8020512a:	e022                	sd	s0,0(sp)
    8020512c:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    8020512e:	00002097          	auipc	ra,0x2
    80205132:	254080e7          	jalr	596(ra) # 80207382 <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    80205136:	60a2                	ld	ra,8(sp)
    80205138:	6402                	ld	s0,0(sp)
    8020513a:	0141                	addi	sp,sp,16
    8020513c:	8082                	ret

000000008020513e <read_fat>:
/**
 * Read the FAT table content corresponded to the given cluster number.
 * @param   cluster     the number of cluster which you want to read its content in FAT table
 */
static uint32 read_fat(uint32 cluster)
{
    8020513e:	1101                	addi	sp,sp,-32
    80205140:	ec06                	sd	ra,24(sp)
    80205142:	e822                	sd	s0,16(sp)
    80205144:	e426                	sd	s1,8(sp)
    80205146:	e04a                	sd	s2,0(sp)
    80205148:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    8020514a:	100007b7          	lui	a5,0x10000
    8020514e:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
        return cluster;
    80205150:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80205152:	00a7ea63          	bltu	a5,a0,80205166 <read_fat+0x28>
    }
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205156:	00019797          	auipc	a5,0x19
    8020515a:	2da7a783          	lw	a5,730(a5) # 8021e430 <fat+0x8>
    8020515e:	2785                	addiw	a5,a5,1
        return 0;
    80205160:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205162:	00a7f963          	bgeu	a5,a0,80205174 <read_fat+0x36>
    // here should be a cache layer for FAT table, but not implemented yet.
    struct buf *b = bread(0, fat_sec);
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    brelse(b);
    return next_clus;
}
    80205166:	8526                	mv	a0,s1
    80205168:	60e2                	ld	ra,24(sp)
    8020516a:	6442                	ld	s0,16(sp)
    8020516c:	64a2                	ld	s1,8(sp)
    8020516e:	6902                	ld	s2,0(sp)
    80205170:	6105                	addi	sp,sp,32
    80205172:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205174:	0025149b          	slliw	s1,a0,0x2
    80205178:	00019917          	auipc	s2,0x19
    8020517c:	2b090913          	addi	s2,s2,688 # 8021e428 <fat>
    80205180:	01095783          	lhu	a5,16(s2)
    80205184:	02f4d7bb          	divuw	a5,s1,a5
    80205188:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    8020518c:	9dbd                	addw	a1,a1,a5
    8020518e:	4501                	li	a0,0
    80205190:	ffffe097          	auipc	ra,0xffffe
    80205194:	274080e7          	jalr	628(ra) # 80203404 <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205198:	01095783          	lhu	a5,16(s2)
    8020519c:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    802051a0:	1482                	slli	s1,s1,0x20
    802051a2:	9081                	srli	s1,s1,0x20
    802051a4:	009507b3          	add	a5,a0,s1
    802051a8:	4fa4                	lw	s1,88(a5)
    brelse(b);
    802051aa:	ffffe097          	auipc	ra,0xffffe
    802051ae:	386080e7          	jalr	902(ra) # 80203530 <brelse>
    return next_clus;
    802051b2:	bf55                	j	80205166 <read_fat+0x28>

00000000802051b4 <alloc_clus>:
        brelse(b);
    }
}

static uint32 alloc_clus(uint8 dev)
{
    802051b4:	711d                	addi	sp,sp,-96
    802051b6:	ec86                	sd	ra,88(sp)
    802051b8:	e8a2                	sd	s0,80(sp)
    802051ba:	e4a6                	sd	s1,72(sp)
    802051bc:	e0ca                	sd	s2,64(sp)
    802051be:	fc4e                	sd	s3,56(sp)
    802051c0:	f852                	sd	s4,48(sp)
    802051c2:	f456                	sd	s5,40(sp)
    802051c4:	f05a                	sd	s6,32(sp)
    802051c6:	ec5e                	sd	s7,24(sp)
    802051c8:	e862                	sd	s8,16(sp)
    802051ca:	e466                	sd	s9,8(sp)
    802051cc:	1080                	addi	s0,sp,96
    // should we keep a free cluster list? instead of searching fat every time.
    struct buf *b;
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    802051ce:	00019797          	auipc	a5,0x19
    802051d2:	25a78793          	addi	a5,a5,602 # 8021e428 <fat>
    802051d6:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    802051da:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802051de:	539c                	lw	a5,32(a5)
    802051e0:	10078363          	beqz	a5,802052e6 <alloc_clus+0x132>
    802051e4:	0029591b          	srliw	s2,s2,0x2
    802051e8:	0009099b          	sext.w	s3,s2
    802051ec:	4b01                	li	s6,0
        b = bread(dev, sec);
    802051ee:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802051f2:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802051f4:	00019c97          	auipc	s9,0x19
    802051f8:	234c8c93          	addi	s9,s9,564 # 8021e428 <fat>
    802051fc:	a0c9                	j	802052be <alloc_clus+0x10a>
            if (((uint32 *)(b->data))[j] == 0) {
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    802051fe:	100007b7          	lui	a5,0x10000
    80205202:	17fd                	addi	a5,a5,-1 # fffffff <_entry-0x70200001>
    80205204:	c29c                	sw	a5,0(a3)
                bwrite(b);
    80205206:	8552                	mv	a0,s4
    80205208:	ffffe097          	auipc	ra,0xffffe
    8020520c:	2ec080e7          	jalr	748(ra) # 802034f4 <bwrite>
                brelse(b);
    80205210:	8552                	mv	a0,s4
    80205212:	ffffe097          	auipc	ra,0xffffe
    80205216:	31e080e7          	jalr	798(ra) # 80203530 <brelse>
                uint32 clus = i * ent_per_sec + j;
    8020521a:	0369093b          	mulw	s2,s2,s6
    8020521e:	0099093b          	addw	s2,s2,s1
    80205222:	00090a9b          	sext.w	s5,s2
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205226:	00019717          	auipc	a4,0x19
    8020522a:	20270713          	addi	a4,a4,514 # 8021e428 <fat>
    8020522e:	01274783          	lbu	a5,18(a4)
    80205232:	ffe9099b          	addiw	s3,s2,-2
    80205236:	02f989bb          	mulw	s3,s3,a5
    8020523a:	4318                	lw	a4,0(a4)
    8020523c:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205240:	c7b1                	beqz	a5,8020528c <alloc_clus+0xd8>
    80205242:	4901                	li	s2,0
    80205244:	00019a17          	auipc	s4,0x19
    80205248:	1e4a0a13          	addi	s4,s4,484 # 8021e428 <fat>
        b = bread(0, sec++);
    8020524c:	013905bb          	addw	a1,s2,s3
    80205250:	4501                	li	a0,0
    80205252:	ffffe097          	auipc	ra,0xffffe
    80205256:	1b2080e7          	jalr	434(ra) # 80203404 <bread>
    8020525a:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    8020525c:	20000613          	li	a2,512
    80205260:	4581                	li	a1,0
    80205262:	05850513          	addi	a0,a0,88
    80205266:	ffffb097          	auipc	ra,0xffffb
    8020526a:	4fc080e7          	jalr	1276(ra) # 80200762 <memset>
        bwrite(b);
    8020526e:	8526                	mv	a0,s1
    80205270:	ffffe097          	auipc	ra,0xffffe
    80205274:	284080e7          	jalr	644(ra) # 802034f4 <bwrite>
        brelse(b);
    80205278:	8526                	mv	a0,s1
    8020527a:	ffffe097          	auipc	ra,0xffffe
    8020527e:	2b6080e7          	jalr	694(ra) # 80203530 <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205282:	2905                	addiw	s2,s2,1
    80205284:	012a4783          	lbu	a5,18(s4)
    80205288:	fcf942e3          	blt	s2,a5,8020524c <alloc_clus+0x98>
            }
        }
        brelse(b);
    }
    panic("no clusters");
}
    8020528c:	8556                	mv	a0,s5
    8020528e:	60e6                	ld	ra,88(sp)
    80205290:	6446                	ld	s0,80(sp)
    80205292:	64a6                	ld	s1,72(sp)
    80205294:	6906                	ld	s2,64(sp)
    80205296:	79e2                	ld	s3,56(sp)
    80205298:	7a42                	ld	s4,48(sp)
    8020529a:	7aa2                	ld	s5,40(sp)
    8020529c:	7b02                	ld	s6,32(sp)
    8020529e:	6be2                	ld	s7,24(sp)
    802052a0:	6c42                	ld	s8,16(sp)
    802052a2:	6ca2                	ld	s9,8(sp)
    802052a4:	6125                	addi	sp,sp,96
    802052a6:	8082                	ret
        brelse(b);
    802052a8:	8552                	mv	a0,s4
    802052aa:	ffffe097          	auipc	ra,0xffffe
    802052ae:	286080e7          	jalr	646(ra) # 80203530 <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802052b2:	2b05                	addiw	s6,s6,1
    802052b4:	2b85                	addiw	s7,s7,1 # fffffffffffff001 <ebss_clear+0xffffffff7fdd9001>
    802052b6:	020ca783          	lw	a5,32(s9)
    802052ba:	02fb7663          	bgeu	s6,a5,802052e6 <alloc_clus+0x132>
        b = bread(dev, sec);
    802052be:	85de                	mv	a1,s7
    802052c0:	8556                	mv	a0,s5
    802052c2:	ffffe097          	auipc	ra,0xffffe
    802052c6:	142080e7          	jalr	322(ra) # 80203404 <bread>
    802052ca:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802052cc:	fc098ee3          	beqz	s3,802052a8 <alloc_clus+0xf4>
    802052d0:	05850793          	addi	a5,a0,88
    802052d4:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    802052d6:	86be                	mv	a3,a5
    802052d8:	4398                	lw	a4,0(a5)
    802052da:	d315                	beqz	a4,802051fe <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802052dc:	2485                	addiw	s1,s1,1
    802052de:	0791                	addi	a5,a5,4
    802052e0:	fe999be3          	bne	s3,s1,802052d6 <alloc_clus+0x122>
    802052e4:	b7d1                	j	802052a8 <alloc_clus+0xf4>
    panic("no clusters");
    802052e6:	00005517          	auipc	a0,0x5
    802052ea:	93250513          	addi	a0,a0,-1742 # 80209c18 <digits+0x898>
    802052ee:	ffffb097          	auipc	ra,0xffffb
    802052f2:	e56080e7          	jalr	-426(ra) # 80200144 <panic>

00000000802052f6 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    802052f6:	00019797          	auipc	a5,0x19
    802052fa:	13a7a783          	lw	a5,314(a5) # 8021e430 <fat+0x8>
    802052fe:	2785                	addiw	a5,a5,1
    80205300:	06a7e963          	bltu	a5,a0,80205372 <write_fat+0x7c>
{
    80205304:	7179                	addi	sp,sp,-48
    80205306:	f406                	sd	ra,40(sp)
    80205308:	f022                	sd	s0,32(sp)
    8020530a:	ec26                	sd	s1,24(sp)
    8020530c:	e84a                	sd	s2,16(sp)
    8020530e:	e44e                	sd	s3,8(sp)
    80205310:	e052                	sd	s4,0(sp)
    80205312:	1800                	addi	s0,sp,48
    80205314:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205316:	0025149b          	slliw	s1,a0,0x2
    8020531a:	00019a17          	auipc	s4,0x19
    8020531e:	10ea0a13          	addi	s4,s4,270 # 8021e428 <fat>
    80205322:	010a5783          	lhu	a5,16(s4)
    80205326:	02f4d7bb          	divuw	a5,s1,a5
    8020532a:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    8020532e:	9dbd                	addw	a1,a1,a5
    80205330:	4501                	li	a0,0
    80205332:	ffffe097          	auipc	ra,0xffffe
    80205336:	0d2080e7          	jalr	210(ra) # 80203404 <bread>
    8020533a:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    8020533c:	010a5783          	lhu	a5,16(s4)
    80205340:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80205344:	1482                	slli	s1,s1,0x20
    80205346:	9081                	srli	s1,s1,0x20
    80205348:	94aa                	add	s1,s1,a0
    8020534a:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    8020534e:	ffffe097          	auipc	ra,0xffffe
    80205352:	1a6080e7          	jalr	422(ra) # 802034f4 <bwrite>
    brelse(b);
    80205356:	854a                	mv	a0,s2
    80205358:	ffffe097          	auipc	ra,0xffffe
    8020535c:	1d8080e7          	jalr	472(ra) # 80203530 <brelse>
    return 0;
    80205360:	4501                	li	a0,0
}
    80205362:	70a2                	ld	ra,40(sp)
    80205364:	7402                	ld	s0,32(sp)
    80205366:	64e2                	ld	s1,24(sp)
    80205368:	6942                	ld	s2,16(sp)
    8020536a:	69a2                	ld	s3,8(sp)
    8020536c:	6a02                	ld	s4,0(sp)
    8020536e:	6145                	addi	sp,sp,48
    80205370:	8082                	ret
        return -1;
    80205372:	557d                	li	a0,-1
}
    80205374:	8082                	ret

0000000080205376 <reloc_clus>:
 * @param   off         the offset from the beginning of the relative file
 * @param   alloc       whether alloc new cluster when meeting end of FAT chains
 * @return              the offset from the new cur_clus
 */
static int reloc_clus(struct dirent *entry, uint off, int alloc)
{
    80205376:	715d                	addi	sp,sp,-80
    80205378:	e486                	sd	ra,72(sp)
    8020537a:	e0a2                	sd	s0,64(sp)
    8020537c:	fc26                	sd	s1,56(sp)
    8020537e:	f84a                	sd	s2,48(sp)
    80205380:	f44e                	sd	s3,40(sp)
    80205382:	f052                	sd	s4,32(sp)
    80205384:	ec56                	sd	s5,24(sp)
    80205386:	e85a                	sd	s6,16(sp)
    80205388:	e45e                	sd	s7,8(sp)
    8020538a:	0880                	addi	s0,sp,80
    8020538c:	84aa                	mv	s1,a0
    8020538e:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    80205390:	00019b97          	auipc	s7,0x19
    80205394:	0a4bab83          	lw	s7,164(s7) # 8021e434 <fat+0xc>
    80205398:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    8020539c:	11052703          	lw	a4,272(a0)
    802053a0:	07377563          	bgeu	a4,s3,8020540a <reloc_clus+0x94>
    802053a4:	8b32                	mv	s6,a2
        int clus = read_fat(entry->cur_clus);
        if (clus >= FAT32_EOC) {
    802053a6:	10000ab7          	lui	s5,0x10000
    802053aa:	1add                	addi	s5,s5,-9 # ffffff7 <_entry-0x70200009>
    802053ac:	a81d                	j	802053e2 <reloc_clus+0x6c>
            if (alloc) {
                clus = alloc_clus(entry->dev);
    802053ae:	1144c503          	lbu	a0,276(s1)
    802053b2:	00000097          	auipc	ra,0x0
    802053b6:	e02080e7          	jalr	-510(ra) # 802051b4 <alloc_clus>
    802053ba:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    802053be:	85ca                	mv	a1,s2
    802053c0:	10c4a503          	lw	a0,268(s1)
    802053c4:	00000097          	auipc	ra,0x0
    802053c8:	f32080e7          	jalr	-206(ra) # 802052f6 <write_fat>
                entry->cur_clus = entry->first_clus;
                entry->clus_cnt = 0;
                return -1;
            }
        }
        entry->cur_clus = clus;
    802053cc:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    802053d0:	1104a783          	lw	a5,272(s1)
    802053d4:	2785                	addiw	a5,a5,1
    802053d6:	0007871b          	sext.w	a4,a5
    802053da:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    802053de:	03377663          	bgeu	a4,s3,8020540a <reloc_clus+0x94>
        int clus = read_fat(entry->cur_clus);
    802053e2:	10c4a503          	lw	a0,268(s1)
    802053e6:	00000097          	auipc	ra,0x0
    802053ea:	d58080e7          	jalr	-680(ra) # 8020513e <read_fat>
    802053ee:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    802053f2:	fd2adde3          	bge	s5,s2,802053cc <reloc_clus+0x56>
            if (alloc) {
    802053f6:	fa0b1ce3          	bnez	s6,802053ae <reloc_clus+0x38>
                entry->cur_clus = entry->first_clus;
    802053fa:	1044a783          	lw	a5,260(s1)
    802053fe:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    80205402:	1004a823          	sw	zero,272(s1)
                return -1;
    80205406:	557d                	li	a0,-1
    80205408:	a881                	j	80205458 <reloc_clus+0xe2>
    }
    if (clus_num < entry->clus_cnt) {
    8020540a:	04e9f163          	bgeu	s3,a4,8020544c <reloc_clus+0xd6>
        entry->cur_clus = entry->first_clus;
    8020540e:	1044a783          	lw	a5,260(s1)
    80205412:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    80205416:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    8020541a:	037a6963          	bltu	s4,s7,8020544c <reloc_clus+0xd6>
            entry->cur_clus = read_fat(entry->cur_clus);
            if (entry->cur_clus >= FAT32_EOC) {
    8020541e:	10000937          	lui	s2,0x10000
    80205422:	195d                	addi	s2,s2,-9 # ffffff7 <_entry-0x70200009>
            entry->cur_clus = read_fat(entry->cur_clus);
    80205424:	10c4a503          	lw	a0,268(s1)
    80205428:	00000097          	auipc	ra,0x0
    8020542c:	d16080e7          	jalr	-746(ra) # 8020513e <read_fat>
    80205430:	2501                	sext.w	a0,a0
    80205432:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    80205436:	02a96c63          	bltu	s2,a0,8020546e <reloc_clus+0xf8>
                panic("reloc_clus");
            }
            entry->clus_cnt++;
    8020543a:	1104a783          	lw	a5,272(s1)
    8020543e:	2785                	addiw	a5,a5,1
    80205440:	0007871b          	sext.w	a4,a5
    80205444:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205448:	fd376ee3          	bltu	a4,s3,80205424 <reloc_clus+0xae>
        }
    }
    return off % fat.byts_per_clus;
    8020544c:	00019797          	auipc	a5,0x19
    80205450:	fe87a783          	lw	a5,-24(a5) # 8021e434 <fat+0xc>
    80205454:	02fa753b          	remuw	a0,s4,a5
}
    80205458:	60a6                	ld	ra,72(sp)
    8020545a:	6406                	ld	s0,64(sp)
    8020545c:	74e2                	ld	s1,56(sp)
    8020545e:	7942                	ld	s2,48(sp)
    80205460:	79a2                	ld	s3,40(sp)
    80205462:	7a02                	ld	s4,32(sp)
    80205464:	6ae2                	ld	s5,24(sp)
    80205466:	6b42                	ld	s6,16(sp)
    80205468:	6ba2                	ld	s7,8(sp)
    8020546a:	6161                	addi	sp,sp,80
    8020546c:	8082                	ret
                panic("reloc_clus");
    8020546e:	00004517          	auipc	a0,0x4
    80205472:	7ba50513          	addi	a0,a0,1978 # 80209c28 <digits+0x8a8>
    80205476:	ffffb097          	auipc	ra,0xffffb
    8020547a:	cce080e7          	jalr	-818(ra) # 80200144 <panic>

000000008020547e <rw_clus>:
{
    8020547e:	7119                	addi	sp,sp,-128
    80205480:	fc86                	sd	ra,120(sp)
    80205482:	f8a2                	sd	s0,112(sp)
    80205484:	f4a6                	sd	s1,104(sp)
    80205486:	f0ca                	sd	s2,96(sp)
    80205488:	ecce                	sd	s3,88(sp)
    8020548a:	e8d2                	sd	s4,80(sp)
    8020548c:	e4d6                	sd	s5,72(sp)
    8020548e:	e0da                	sd	s6,64(sp)
    80205490:	fc5e                	sd	s7,56(sp)
    80205492:	f862                	sd	s8,48(sp)
    80205494:	f466                	sd	s9,40(sp)
    80205496:	f06a                	sd	s10,32(sp)
    80205498:	ec6e                	sd	s11,24(sp)
    8020549a:	0100                	addi	s0,sp,128
    8020549c:	f8c43423          	sd	a2,-120(s0)
    802054a0:	8b36                	mv	s6,a3
    802054a2:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    802054a4:	00f706bb          	addw	a3,a4,a5
    802054a8:	00019797          	auipc	a5,0x19
    802054ac:	f8c7a783          	lw	a5,-116(a5) # 8021e434 <fat+0xc>
    802054b0:	02d7ef63          	bltu	a5,a3,802054ee <rw_clus+0x70>
    802054b4:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    802054b6:	00019797          	auipc	a5,0x19
    802054ba:	f7278793          	addi	a5,a5,-142 # 8021e428 <fat>
    802054be:	0107d683          	lhu	a3,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    802054c2:	ffe5099b          	addiw	s3,a0,-2
    802054c6:	0127c603          	lbu	a2,18(a5)
    802054ca:	02c989bb          	mulw	s3,s3,a2
    802054ce:	439c                	lw	a5,0(a5)
    802054d0:	00f989bb          	addw	s3,s3,a5
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    802054d4:	02d757bb          	divuw	a5,a4,a3
    802054d8:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    802054dc:	02d77abb          	remuw	s5,a4,a3
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802054e0:	0e0c0363          	beqz	s8,802055c6 <rw_clus+0x148>
    802054e4:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    802054e6:	20000d93          	li	s11,512
        if (bad == -1) {
    802054ea:	5d7d                	li	s10,-1
    802054ec:	a095                	j	80205550 <rw_clus+0xd2>
        panic("offset out of range");
    802054ee:	00004517          	auipc	a0,0x4
    802054f2:	74a50513          	addi	a0,a0,1866 # 80209c38 <digits+0x8b8>
    802054f6:	ffffb097          	auipc	ra,0xffffb
    802054fa:	c4e080e7          	jalr	-946(ra) # 80200144 <panic>
                bwrite(bp);
    802054fe:	854a                	mv	a0,s2
    80205500:	ffffe097          	auipc	ra,0xffffe
    80205504:	ff4080e7          	jalr	-12(ra) # 802034f4 <bwrite>
        brelse(bp);
    80205508:	854a                	mv	a0,s2
    8020550a:	ffffe097          	auipc	ra,0xffffe
    8020550e:	026080e7          	jalr	38(ra) # 80203530 <brelse>
        if (bad == -1) {
    80205512:	a02d                	j	8020553c <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    80205514:	05890613          	addi	a2,s2,88
    80205518:	1682                	slli	a3,a3,0x20
    8020551a:	9281                	srli	a3,a3,0x20
    8020551c:	963a                	add	a2,a2,a4
    8020551e:	85da                	mv	a1,s6
    80205520:	f8843503          	ld	a0,-120(s0)
    80205524:	ffffd097          	auipc	ra,0xffffd
    80205528:	012080e7          	jalr	18(ra) # 80202536 <either_copyout>
    8020552c:	8baa                	mv	s7,a0
        brelse(bp);
    8020552e:	854a                	mv	a0,s2
    80205530:	ffffe097          	auipc	ra,0xffffe
    80205534:	000080e7          	jalr	ra # 80203530 <brelse>
        if (bad == -1) {
    80205538:	07ab8763          	beq	s7,s10,802055a6 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    8020553c:	01448a3b          	addw	s4,s1,s4
    80205540:	01548abb          	addw	s5,s1,s5
    80205544:	1482                	slli	s1,s1,0x20
    80205546:	9081                	srli	s1,s1,0x20
    80205548:	9b26                	add	s6,s6,s1
    8020554a:	2985                	addiw	s3,s3,1
    8020554c:	058a7d63          	bgeu	s4,s8,802055a6 <rw_clus+0x128>
        bp = bread(0, sec);
    80205550:	85ce                	mv	a1,s3
    80205552:	4501                	li	a0,0
    80205554:	ffffe097          	auipc	ra,0xffffe
    80205558:	eb0080e7          	jalr	-336(ra) # 80203404 <bread>
    8020555c:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    8020555e:	1ffaf713          	andi	a4,s5,511
        if (n - tot < m) {
    80205562:	414c07bb          	subw	a5,s8,s4
        m = BSIZE - off % BSIZE;
    80205566:	40ed863b          	subw	a2,s11,a4
    8020556a:	86be                	mv	a3,a5
    8020556c:	2781                	sext.w	a5,a5
    8020556e:	0006059b          	sext.w	a1,a2
    80205572:	00f5f363          	bgeu	a1,a5,80205578 <rw_clus+0xfa>
    80205576:	86b2                	mv	a3,a2
    80205578:	0006849b          	sext.w	s1,a3
        if (write) {
    8020557c:	f80c8ce3          	beqz	s9,80205514 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    80205580:	05890513          	addi	a0,s2,88
    80205584:	1682                	slli	a3,a3,0x20
    80205586:	9281                	srli	a3,a3,0x20
    80205588:	865a                	mv	a2,s6
    8020558a:	f8843583          	ld	a1,-120(s0)
    8020558e:	953a                	add	a0,a0,a4
    80205590:	ffffd097          	auipc	ra,0xffffd
    80205594:	fdc080e7          	jalr	-36(ra) # 8020256c <either_copyin>
    80205598:	f7a513e3          	bne	a0,s10,802054fe <rw_clus+0x80>
        brelse(bp);
    8020559c:	854a                	mv	a0,s2
    8020559e:	ffffe097          	auipc	ra,0xffffe
    802055a2:	f92080e7          	jalr	-110(ra) # 80203530 <brelse>
}
    802055a6:	8552                	mv	a0,s4
    802055a8:	70e6                	ld	ra,120(sp)
    802055aa:	7446                	ld	s0,112(sp)
    802055ac:	74a6                	ld	s1,104(sp)
    802055ae:	7906                	ld	s2,96(sp)
    802055b0:	69e6                	ld	s3,88(sp)
    802055b2:	6a46                	ld	s4,80(sp)
    802055b4:	6aa6                	ld	s5,72(sp)
    802055b6:	6b06                	ld	s6,64(sp)
    802055b8:	7be2                	ld	s7,56(sp)
    802055ba:	7c42                	ld	s8,48(sp)
    802055bc:	7ca2                	ld	s9,40(sp)
    802055be:	7d02                	ld	s10,32(sp)
    802055c0:	6de2                	ld	s11,24(sp)
    802055c2:	6109                	addi	sp,sp,128
    802055c4:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802055c6:	8a62                	mv	s4,s8
    802055c8:	bff9                	j	802055a6 <rw_clus+0x128>

00000000802055ca <eget>:
// by their whole path. But when parsing a path, we open all the directories through it, 
// which forms a linked list from the final file to the root. Thus, we use the "parent" pointer 
// to recognize whether an entry with the "name" as given is really the file we want in the right path.
// Should never get root by eget, it's easy to understand.
static struct dirent *eget(struct dirent *parent, char *name)
{
    802055ca:	7139                	addi	sp,sp,-64
    802055cc:	fc06                	sd	ra,56(sp)
    802055ce:	f822                	sd	s0,48(sp)
    802055d0:	f426                	sd	s1,40(sp)
    802055d2:	f04a                	sd	s2,32(sp)
    802055d4:	ec4e                	sd	s3,24(sp)
    802055d6:	e852                	sd	s4,16(sp)
    802055d8:	e456                	sd	s5,8(sp)
    802055da:	0080                	addi	s0,sp,64
    802055dc:	8a2a                	mv	s4,a0
    802055de:	8aae                	mv	s5,a1
    struct dirent *ep;
    acquire(&ecache.lock);
    802055e0:	00019517          	auipc	a0,0x19
    802055e4:	fd850513          	addi	a0,a0,-40 # 8021e5b8 <ecache>
    802055e8:	ffffb097          	auipc	ra,0xffffb
    802055ec:	0de080e7          	jalr	222(ra) # 802006c6 <acquire>
    if (name) {
    802055f0:	060a8b63          	beqz	s5,80205666 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802055f4:	00019497          	auipc	s1,0x19
    802055f8:	f844b483          	ld	s1,-124(s1) # 8021e578 <root+0x128>
    802055fc:	00019797          	auipc	a5,0x19
    80205600:	e5478793          	addi	a5,a5,-428 # 8021e450 <root>
    80205604:	06f48163          	beq	s1,a5,80205666 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80205608:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    8020560a:	89be                	mv	s3,a5
    8020560c:	a029                	j	80205616 <eget+0x4c>
    8020560e:	1284b483          	ld	s1,296(s1)
    80205612:	05348a63          	beq	s1,s3,80205666 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80205616:	11649783          	lh	a5,278(s1)
    8020561a:	ff279ae3          	bne	a5,s2,8020560e <eget+0x44>
    8020561e:	1204b783          	ld	a5,288(s1)
    80205622:	ff4796e3          	bne	a5,s4,8020560e <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    80205626:	0ff00613          	li	a2,255
    8020562a:	85d6                	mv	a1,s5
    8020562c:	8526                	mv	a0,s1
    8020562e:	ffffb097          	auipc	ra,0xffffb
    80205632:	20c080e7          	jalr	524(ra) # 8020083a <strncmp>
    80205636:	fd61                	bnez	a0,8020560e <eget+0x44>
                if (ep->ref++ == 0) {
    80205638:	1184a783          	lw	a5,280(s1)
    8020563c:	0017871b          	addiw	a4,a5,1
    80205640:	10e4ac23          	sw	a4,280(s1)
    80205644:	eb81                	bnez	a5,80205654 <eget+0x8a>
                    ep->parent->ref++;
    80205646:	1204b703          	ld	a4,288(s1)
    8020564a:	11872783          	lw	a5,280(a4)
    8020564e:	2785                	addiw	a5,a5,1
    80205650:	10f72c23          	sw	a5,280(a4)
                }
                release(&ecache.lock);
    80205654:	00019517          	auipc	a0,0x19
    80205658:	f6450513          	addi	a0,a0,-156 # 8021e5b8 <ecache>
    8020565c:	ffffb097          	auipc	ra,0xffffb
    80205660:	0be080e7          	jalr	190(ra) # 8020071a <release>
                // edup(ep->parent);
                return ep;
    80205664:	a085                	j	802056c4 <eget+0xfa>
            }
        }
    }
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205666:	00019497          	auipc	s1,0x19
    8020566a:	f1a4b483          	ld	s1,-230(s1) # 8021e580 <root+0x130>
    8020566e:	00019797          	auipc	a5,0x19
    80205672:	de278793          	addi	a5,a5,-542 # 8021e450 <root>
    80205676:	00f48a63          	beq	s1,a5,8020568a <eget+0xc0>
    8020567a:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    8020567c:	1184a783          	lw	a5,280(s1)
    80205680:	cf89                	beqz	a5,8020569a <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205682:	1304b483          	ld	s1,304(s1)
    80205686:	fee49be3          	bne	s1,a4,8020567c <eget+0xb2>
            ep->dirty = 0;
            release(&ecache.lock);
            return ep;
        }
    }
    panic("eget: insufficient ecache");
    8020568a:	00004517          	auipc	a0,0x4
    8020568e:	5c650513          	addi	a0,a0,1478 # 80209c50 <digits+0x8d0>
    80205692:	ffffb097          	auipc	ra,0xffffb
    80205696:	ab2080e7          	jalr	-1358(ra) # 80200144 <panic>
            ep->ref = 1;
    8020569a:	4785                	li	a5,1
    8020569c:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    802056a0:	114a4783          	lbu	a5,276(s4)
    802056a4:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    802056a8:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    802056ac:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    802056b0:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    802056b4:	00019517          	auipc	a0,0x19
    802056b8:	f0450513          	addi	a0,a0,-252 # 8021e5b8 <ecache>
    802056bc:	ffffb097          	auipc	ra,0xffffb
    802056c0:	05e080e7          	jalr	94(ra) # 8020071a <release>
    return 0;
}
    802056c4:	8526                	mv	a0,s1
    802056c6:	70e2                	ld	ra,56(sp)
    802056c8:	7442                	ld	s0,48(sp)
    802056ca:	74a2                	ld	s1,40(sp)
    802056cc:	7902                	ld	s2,32(sp)
    802056ce:	69e2                	ld	s3,24(sp)
    802056d0:	6a42                	ld	s4,16(sp)
    802056d2:	6aa2                	ld	s5,8(sp)
    802056d4:	6121                	addi	sp,sp,64
    802056d6:	8082                	ret

00000000802056d8 <read_entry_name>:
 * @param   buffer      pointer to the array that stores the name
 * @param   raw_entry   pointer to the entry in a sector buffer
 * @param   islong      if non-zero, read as l-n-e, otherwise s-n-e.
 */
static void read_entry_name(char *buffer, union dentry *d)
{
    802056d8:	7139                	addi	sp,sp,-64
    802056da:	fc06                	sd	ra,56(sp)
    802056dc:	f822                	sd	s0,48(sp)
    802056de:	f426                	sd	s1,40(sp)
    802056e0:	f04a                	sd	s2,32(sp)
    802056e2:	ec4e                	sd	s3,24(sp)
    802056e4:	0080                	addi	s0,sp,64
    802056e6:	84aa                	mv	s1,a0
    802056e8:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    802056ea:	00b5c703          	lbu	a4,11(a1)
    802056ee:	47bd                	li	a5,15
    802056f0:	08f70563          	beq	a4,a5,8020577a <read_entry_name+0xa2>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
        buffer += NELEM(d->lne.name2);
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    } else {
        // assert: only "." and ".." will enter this branch
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    802056f4:	4635                	li	a2,13
    802056f6:	4581                	li	a1,0
    802056f8:	ffffb097          	auipc	ra,0xffffb
    802056fc:	06a080e7          	jalr	106(ra) # 80200762 <memset>
        int i;
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80205700:	00094703          	lbu	a4,0(s2)
    80205704:	02000793          	li	a5,32
    80205708:	0af70c63          	beq	a4,a5,802057c0 <read_entry_name+0xe8>
    8020570c:	4785                	li	a5,1
    8020570e:	02000613          	li	a2,32
    80205712:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80205714:	00f486b3          	add	a3,s1,a5
    80205718:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020571c:	0007869b          	sext.w	a3,a5
    80205720:	00f90733          	add	a4,s2,a5
    80205724:	00074703          	lbu	a4,0(a4)
    80205728:	00c70563          	beq	a4,a2,80205732 <read_entry_name+0x5a>
    8020572c:	0785                	addi	a5,a5,1
    8020572e:	feb793e3          	bne	a5,a1,80205714 <read_entry_name+0x3c>
        }
        if (d->sne.name[8] != ' ') {
    80205732:	00894703          	lbu	a4,8(s2)
    80205736:	02000793          	li	a5,32
    8020573a:	00f70963          	beq	a4,a5,8020574c <read_entry_name+0x74>
            buffer[i++] = '.';
    8020573e:	00d487b3          	add	a5,s1,a3
    80205742:	02e00713          	li	a4,46
    80205746:	00e78023          	sb	a4,0(a5)
    8020574a:	2685                	addiw	a3,a3,1
        }
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    8020574c:	00890793          	addi	a5,s2,8
    80205750:	94b6                	add	s1,s1,a3
    80205752:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    80205754:	02000693          	li	a3,32
    80205758:	0007c703          	lbu	a4,0(a5)
    8020575c:	00d70863          	beq	a4,a3,8020576c <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    80205760:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80205764:	0785                	addi	a5,a5,1
    80205766:	0485                	addi	s1,s1,1
    80205768:	ff2798e3          	bne	a5,s2,80205758 <read_entry_name+0x80>
        }
    }
}
    8020576c:	70e2                	ld	ra,56(sp)
    8020576e:	7442                	ld	s0,48(sp)
    80205770:	74a2                	ld	s1,40(sp)
    80205772:	7902                	ld	s2,32(sp)
    80205774:	69e2                	ld	s3,24(sp)
    80205776:	6121                	addi	sp,sp,64
    80205778:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    8020577a:	4629                	li	a2,10
    8020577c:	0585                	addi	a1,a1,1
    8020577e:	fc040993          	addi	s3,s0,-64
    80205782:	854e                	mv	a0,s3
    80205784:	ffffb097          	auipc	ra,0xffffb
    80205788:	03a080e7          	jalr	58(ra) # 802007be <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    8020578c:	4615                	li	a2,5
    8020578e:	85ce                	mv	a1,s3
    80205790:	8526                	mv	a0,s1
    80205792:	ffffb097          	auipc	ra,0xffffb
    80205796:	1b0080e7          	jalr	432(ra) # 80200942 <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    8020579a:	4619                	li	a2,6
    8020579c:	00e90593          	addi	a1,s2,14
    802057a0:	00548513          	addi	a0,s1,5
    802057a4:	ffffb097          	auipc	ra,0xffffb
    802057a8:	19e080e7          	jalr	414(ra) # 80200942 <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    802057ac:	4609                	li	a2,2
    802057ae:	01c90593          	addi	a1,s2,28
    802057b2:	00b48513          	addi	a0,s1,11
    802057b6:	ffffb097          	auipc	ra,0xffffb
    802057ba:	18c080e7          	jalr	396(ra) # 80200942 <snstr>
    802057be:	b77d                	j	8020576c <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802057c0:	4681                	li	a3,0
    802057c2:	bf85                	j	80205732 <read_entry_name+0x5a>

00000000802057c4 <fat32_init>:
{
    802057c4:	7139                	addi	sp,sp,-64
    802057c6:	fc06                	sd	ra,56(sp)
    802057c8:	f822                	sd	s0,48(sp)
    802057ca:	f426                	sd	s1,40(sp)
    802057cc:	f04a                	sd	s2,32(sp)
    802057ce:	ec4e                	sd	s3,24(sp)
    802057d0:	e852                	sd	s4,16(sp)
    802057d2:	e456                	sd	s5,8(sp)
    802057d4:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    802057d6:	4581                	li	a1,0
    802057d8:	4501                	li	a0,0
    802057da:	ffffe097          	auipc	ra,0xffffe
    802057de:	c2a080e7          	jalr	-982(ra) # 80203404 <bread>
    802057e2:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    802057e4:	4615                	li	a2,5
    802057e6:	00004597          	auipc	a1,0x4
    802057ea:	48a58593          	addi	a1,a1,1162 # 80209c70 <digits+0x8f0>
    802057ee:	0aa50513          	addi	a0,a0,170
    802057f2:	ffffb097          	auipc	ra,0xffffb
    802057f6:	048080e7          	jalr	72(ra) # 8020083a <strncmp>
    802057fa:	16051863          	bnez	a0,8020596a <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    802057fe:	00019497          	auipc	s1,0x19
    80205802:	c2a48493          	addi	s1,s1,-982 # 8021e428 <fat>
    80205806:	4609                	li	a2,2
    80205808:	06390593          	addi	a1,s2,99
    8020580c:	00019517          	auipc	a0,0x19
    80205810:	c2c50513          	addi	a0,a0,-980 # 8021e438 <fat+0x10>
    80205814:	ffffb097          	auipc	ra,0xffffb
    80205818:	faa080e7          	jalr	-86(ra) # 802007be <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    8020581c:	06594683          	lbu	a3,101(s2)
    80205820:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80205824:	06695603          	lhu	a2,102(s2)
    80205828:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    8020582c:	06894703          	lbu	a4,104(s2)
    80205830:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80205834:	07492783          	lw	a5,116(s2)
    80205838:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    8020583a:	07892783          	lw	a5,120(s2)
    8020583e:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    80205840:	07c92583          	lw	a1,124(s2)
    80205844:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80205846:	08492503          	lw	a0,132(s2)
    8020584a:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    8020584c:	02b7073b          	mulw	a4,a4,a1
    80205850:	9f31                	addw	a4,a4,a2
    80205852:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80205854:	9f99                	subw	a5,a5,a4
    80205856:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80205858:	02d7d7bb          	divuw	a5,a5,a3
    8020585c:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    8020585e:	0104d783          	lhu	a5,16(s1)
    80205862:	02d787bb          	mulw	a5,a5,a3
    80205866:	c4dc                	sw	a5,12(s1)
    brelse(b);
    80205868:	854a                	mv	a0,s2
    8020586a:	ffffe097          	auipc	ra,0xffffe
    8020586e:	cc6080e7          	jalr	-826(ra) # 80203530 <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    80205872:	0104d703          	lhu	a4,16(s1)
    80205876:	20000793          	li	a5,512
    8020587a:	10f71063          	bne	a4,a5,8020597a <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    8020587e:	00004597          	auipc	a1,0x4
    80205882:	42a58593          	addi	a1,a1,1066 # 80209ca8 <digits+0x928>
    80205886:	00019517          	auipc	a0,0x19
    8020588a:	d3250513          	addi	a0,a0,-718 # 8021e5b8 <ecache>
    8020588e:	ffffb097          	auipc	ra,0xffffb
    80205892:	df4080e7          	jalr	-524(ra) # 80200682 <initlock>
    memset(&root, 0, sizeof(root));
    80205896:	00019497          	auipc	s1,0x19
    8020589a:	b9248493          	addi	s1,s1,-1134 # 8021e428 <fat>
    8020589e:	00019917          	auipc	s2,0x19
    802058a2:	bb290913          	addi	s2,s2,-1102 # 8021e450 <root>
    802058a6:	16800613          	li	a2,360
    802058aa:	4581                	li	a1,0
    802058ac:	854a                	mv	a0,s2
    802058ae:	ffffb097          	auipc	ra,0xffffb
    802058b2:	eb4080e7          	jalr	-332(ra) # 80200762 <memset>
    initsleeplock(&root.lock, "entry");
    802058b6:	00004597          	auipc	a1,0x4
    802058ba:	3fa58593          	addi	a1,a1,1018 # 80209cb0 <digits+0x930>
    802058be:	00019517          	auipc	a0,0x19
    802058c2:	cca50513          	addi	a0,a0,-822 # 8021e588 <root+0x138>
    802058c6:	ffffe097          	auipc	ra,0xffffe
    802058ca:	d80080e7          	jalr	-640(ra) # 80203646 <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    802058ce:	47d1                	li	a5,20
    802058d0:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    802058d4:	50dc                	lw	a5,36(s1)
    802058d6:	12f4aa23          	sw	a5,308(s1)
    802058da:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    802058de:	4785                	li	a5,1
    802058e0:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    802058e4:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    802058e8:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802058ec:	00019497          	auipc	s1,0x19
    802058f0:	ce448493          	addi	s1,s1,-796 # 8021e5d0 <ecache+0x18>
        de->next = root.next;
    802058f4:	00019917          	auipc	s2,0x19
    802058f8:	b3490913          	addi	s2,s2,-1228 # 8021e428 <fat>
        de->prev = &root;
    802058fc:	00019a97          	auipc	s5,0x19
    80205900:	b54a8a93          	addi	s5,s5,-1196 # 8021e450 <root>
        initsleeplock(&de->lock, "entry");
    80205904:	00004a17          	auipc	s4,0x4
    80205908:	3aca0a13          	addi	s4,s4,940 # 80209cb0 <digits+0x930>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020590c:	0001d997          	auipc	s3,0x1d
    80205910:	31498993          	addi	s3,s3,788 # 80222c20 <cons>
        de->dev = 0;
    80205914:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80205918:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    8020591c:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    80205920:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    80205924:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80205928:	15093783          	ld	a5,336(s2)
    8020592c:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    80205930:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    80205934:	85d2                	mv	a1,s4
    80205936:	13848513          	addi	a0,s1,312
    8020593a:	ffffe097          	auipc	ra,0xffffe
    8020593e:	d0c080e7          	jalr	-756(ra) # 80203646 <initsleeplock>
        root.next->prev = de;
    80205942:	15093783          	ld	a5,336(s2)
    80205946:	1297b823          	sd	s1,304(a5)
        root.next = de;
    8020594a:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020594e:	16848493          	addi	s1,s1,360
    80205952:	fd3491e3          	bne	s1,s3,80205914 <fat32_init+0x150>
}
    80205956:	4501                	li	a0,0
    80205958:	70e2                	ld	ra,56(sp)
    8020595a:	7442                	ld	s0,48(sp)
    8020595c:	74a2                	ld	s1,40(sp)
    8020595e:	7902                	ld	s2,32(sp)
    80205960:	69e2                	ld	s3,24(sp)
    80205962:	6a42                	ld	s4,16(sp)
    80205964:	6aa2                	ld	s5,8(sp)
    80205966:	6121                	addi	sp,sp,64
    80205968:	8082                	ret
        panic("not FAT32 volume");
    8020596a:	00004517          	auipc	a0,0x4
    8020596e:	30e50513          	addi	a0,a0,782 # 80209c78 <digits+0x8f8>
    80205972:	ffffa097          	auipc	ra,0xffffa
    80205976:	7d2080e7          	jalr	2002(ra) # 80200144 <panic>
        panic("byts_per_sec != BSIZE");
    8020597a:	00004517          	auipc	a0,0x4
    8020597e:	31650513          	addi	a0,a0,790 # 80209c90 <digits+0x910>
    80205982:	ffffa097          	auipc	ra,0xffffa
    80205986:	7c2080e7          	jalr	1986(ra) # 80200144 <panic>

000000008020598a <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    8020598a:	10852783          	lw	a5,264(a0)
    8020598e:	0ed7e863          	bltu	a5,a3,80205a7e <eread+0xf4>
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
    802059aa:	e06a                	sd	s10,0(sp)
    802059ac:	1080                	addi	s0,sp,96
    802059ae:	8a2a                	mv	s4,a0
    802059b0:	8bae                	mv	s7,a1
    802059b2:	8ab2                	mv	s5,a2
    802059b4:	8936                	mv	s2,a3
    802059b6:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802059b8:	9eb9                	addw	a3,a3,a4
        return 0;
    802059ba:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802059bc:	0b26e163          	bltu	a3,s2,80205a5e <eread+0xd4>
    802059c0:	100a4703          	lbu	a4,256(s4)
    802059c4:	8b41                	andi	a4,a4,16
    802059c6:	ef41                	bnez	a4,80205a5e <eread+0xd4>
    if (off + n > entry->file_size) {
    802059c8:	00d7f463          	bgeu	a5,a3,802059d0 <eread+0x46>
        n = entry->file_size - off;
    802059cc:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802059d0:	10ca2703          	lw	a4,268(s4)
    802059d4:	100007b7          	lui	a5,0x10000
    802059d8:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
    802059da:	06e7ef63          	bltu	a5,a4,80205a58 <eread+0xce>
    802059de:	080b0e63          	beqz	s6,80205a7a <eread+0xf0>
    802059e2:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802059e4:	00019c97          	auipc	s9,0x19
    802059e8:	a44c8c93          	addi	s9,s9,-1468 # 8021e428 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802059ec:	8c3e                	mv	s8,a5
    802059ee:	a82d                	j	80205a28 <eread+0x9e>
    802059f0:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    802059f4:	87ea                	mv	a5,s10
    802059f6:	86d6                	mv	a3,s5
    802059f8:	865e                	mv	a2,s7
    802059fa:	4581                	li	a1,0
    802059fc:	10ca2503          	lw	a0,268(s4)
    80205a00:	00000097          	auipc	ra,0x0
    80205a04:	a7e080e7          	jalr	-1410(ra) # 8020547e <rw_clus>
    80205a08:	2501                	sext.w	a0,a0
    80205a0a:	04ad1863          	bne	s10,a0,80205a5a <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205a0e:	013489bb          	addw	s3,s1,s3
    80205a12:	0124893b          	addw	s2,s1,s2
    80205a16:	1482                	slli	s1,s1,0x20
    80205a18:	9081                	srli	s1,s1,0x20
    80205a1a:	9aa6                	add	s5,s5,s1
    80205a1c:	10ca2783          	lw	a5,268(s4)
    80205a20:	02fc6d63          	bltu	s8,a5,80205a5a <eread+0xd0>
    80205a24:	0369fb63          	bgeu	s3,s6,80205a5a <eread+0xd0>
        reloc_clus(entry, off, 0);
    80205a28:	4601                	li	a2,0
    80205a2a:	85ca                	mv	a1,s2
    80205a2c:	8552                	mv	a0,s4
    80205a2e:	00000097          	auipc	ra,0x0
    80205a32:	948080e7          	jalr	-1720(ra) # 80205376 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205a36:	00cca683          	lw	a3,12(s9)
    80205a3a:	02d9763b          	remuw	a2,s2,a3
    80205a3e:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    80205a42:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205a46:	9e91                	subw	a3,a3,a2
    80205a48:	84be                	mv	s1,a5
    80205a4a:	2781                	sext.w	a5,a5
    80205a4c:	0006861b          	sext.w	a2,a3
    80205a50:	faf670e3          	bgeu	a2,a5,802059f0 <eread+0x66>
    80205a54:	84b6                	mv	s1,a3
    80205a56:	bf69                	j	802059f0 <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205a58:	4981                	li	s3,0
    return tot;
    80205a5a:	0009851b          	sext.w	a0,s3
}
    80205a5e:	60e6                	ld	ra,88(sp)
    80205a60:	6446                	ld	s0,80(sp)
    80205a62:	64a6                	ld	s1,72(sp)
    80205a64:	6906                	ld	s2,64(sp)
    80205a66:	79e2                	ld	s3,56(sp)
    80205a68:	7a42                	ld	s4,48(sp)
    80205a6a:	7aa2                	ld	s5,40(sp)
    80205a6c:	7b02                	ld	s6,32(sp)
    80205a6e:	6be2                	ld	s7,24(sp)
    80205a70:	6c42                	ld	s8,16(sp)
    80205a72:	6ca2                	ld	s9,8(sp)
    80205a74:	6d02                	ld	s10,0(sp)
    80205a76:	6125                	addi	sp,sp,96
    80205a78:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205a7a:	89da                	mv	s3,s6
    80205a7c:	bff9                	j	80205a5a <eread+0xd0>
        return 0;
    80205a7e:	4501                	li	a0,0
}
    80205a80:	8082                	ret

0000000080205a82 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80205a82:	10852783          	lw	a5,264(a0)
    80205a86:	0ed7e463          	bltu	a5,a3,80205b6e <ewrite+0xec>
{
    80205a8a:	711d                	addi	sp,sp,-96
    80205a8c:	ec86                	sd	ra,88(sp)
    80205a8e:	e8a2                	sd	s0,80(sp)
    80205a90:	e4a6                	sd	s1,72(sp)
    80205a92:	e0ca                	sd	s2,64(sp)
    80205a94:	fc4e                	sd	s3,56(sp)
    80205a96:	f852                	sd	s4,48(sp)
    80205a98:	f456                	sd	s5,40(sp)
    80205a9a:	f05a                	sd	s6,32(sp)
    80205a9c:	ec5e                	sd	s7,24(sp)
    80205a9e:	e862                	sd	s8,16(sp)
    80205aa0:	e466                	sd	s9,8(sp)
    80205aa2:	1080                	addi	s0,sp,96
    80205aa4:	8aaa                	mv	s5,a0
    80205aa6:	8bae                	mv	s7,a1
    80205aa8:	8a32                	mv	s4,a2
    80205aaa:	8936                	mv	s2,a3
    80205aac:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80205aae:	00e687bb          	addw	a5,a3,a4
    80205ab2:	0cd7e063          	bltu	a5,a3,80205b72 <ewrite+0xf0>
    80205ab6:	02069793          	slli	a5,a3,0x20
    80205aba:	9381                	srli	a5,a5,0x20
    80205abc:	1702                	slli	a4,a4,0x20
    80205abe:	9301                	srli	a4,a4,0x20
    80205ac0:	97ba                	add	a5,a5,a4
    80205ac2:	577d                	li	a4,-1
    80205ac4:	9301                	srli	a4,a4,0x20
    80205ac6:	0af76863          	bltu	a4,a5,80205b76 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    80205aca:	10054783          	lbu	a5,256(a0)
    80205ace:	8b85                	andi	a5,a5,1
    80205ad0:	e7cd                	bnez	a5,80205b7a <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    80205ad2:	10452783          	lw	a5,260(a0)
    80205ad6:	cb89                	beqz	a5,80205ae8 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80205ad8:	080b0963          	beqz	s6,80205b6a <ewrite+0xe8>
    80205adc:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205ade:	00019c17          	auipc	s8,0x19
    80205ae2:	94ac0c13          	addi	s8,s8,-1718 # 8021e428 <fat>
    80205ae6:	a891                	j	80205b3a <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    80205ae8:	11454503          	lbu	a0,276(a0)
    80205aec:	fffff097          	auipc	ra,0xfffff
    80205af0:	6c8080e7          	jalr	1736(ra) # 802051b4 <alloc_clus>
    80205af4:	2501                	sext.w	a0,a0
    80205af6:	10aaa223          	sw	a0,260(s5)
    80205afa:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    80205afe:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    80205b02:	4785                	li	a5,1
    80205b04:	10fa8aa3          	sb	a5,277(s5)
    80205b08:	bfc1                	j	80205ad8 <ewrite+0x56>
    80205b0a:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    80205b0e:	87e6                	mv	a5,s9
    80205b10:	86d2                	mv	a3,s4
    80205b12:	865e                	mv	a2,s7
    80205b14:	4585                	li	a1,1
    80205b16:	10caa503          	lw	a0,268(s5)
    80205b1a:	00000097          	auipc	ra,0x0
    80205b1e:	964080e7          	jalr	-1692(ra) # 8020547e <rw_clus>
    80205b22:	2501                	sext.w	a0,a0
    80205b24:	04ac9d63          	bne	s9,a0,80205b7e <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80205b28:	013489bb          	addw	s3,s1,s3
    80205b2c:	0124893b          	addw	s2,s1,s2
    80205b30:	1482                	slli	s1,s1,0x20
    80205b32:	9081                	srli	s1,s1,0x20
    80205b34:	9a26                	add	s4,s4,s1
    80205b36:	0569f463          	bgeu	s3,s6,80205b7e <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    80205b3a:	4605                	li	a2,1
    80205b3c:	85ca                	mv	a1,s2
    80205b3e:	8556                	mv	a0,s5
    80205b40:	00000097          	auipc	ra,0x0
    80205b44:	836080e7          	jalr	-1994(ra) # 80205376 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205b48:	00cc2683          	lw	a3,12(s8)
    80205b4c:	02d9763b          	remuw	a2,s2,a3
    80205b50:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    80205b54:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205b58:	9e91                	subw	a3,a3,a2
    80205b5a:	84be                	mv	s1,a5
    80205b5c:	2781                	sext.w	a5,a5
    80205b5e:	0006861b          	sext.w	a2,a3
    80205b62:	faf674e3          	bgeu	a2,a5,80205b0a <ewrite+0x88>
    80205b66:	84b6                	mv	s1,a3
    80205b68:	b74d                	j	80205b0a <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80205b6a:	89da                	mv	s3,s6
    80205b6c:	a015                	j	80205b90 <ewrite+0x10e>
        return -1;
    80205b6e:	557d                	li	a0,-1
}
    80205b70:	8082                	ret
        return -1;
    80205b72:	557d                	li	a0,-1
    80205b74:	a005                	j	80205b94 <ewrite+0x112>
    80205b76:	557d                	li	a0,-1
    80205b78:	a831                	j	80205b94 <ewrite+0x112>
    80205b7a:	557d                	li	a0,-1
    80205b7c:	a821                	j	80205b94 <ewrite+0x112>
        if(off > entry->file_size) {
    80205b7e:	108aa783          	lw	a5,264(s5)
    80205b82:	0127f763          	bgeu	a5,s2,80205b90 <ewrite+0x10e>
            entry->file_size = off;
    80205b86:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80205b8a:	4785                	li	a5,1
    80205b8c:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    80205b90:	0009851b          	sext.w	a0,s3
}
    80205b94:	60e6                	ld	ra,88(sp)
    80205b96:	6446                	ld	s0,80(sp)
    80205b98:	64a6                	ld	s1,72(sp)
    80205b9a:	6906                	ld	s2,64(sp)
    80205b9c:	79e2                	ld	s3,56(sp)
    80205b9e:	7a42                	ld	s4,48(sp)
    80205ba0:	7aa2                	ld	s5,40(sp)
    80205ba2:	7b02                	ld	s6,32(sp)
    80205ba4:	6be2                	ld	s7,24(sp)
    80205ba6:	6c42                	ld	s8,16(sp)
    80205ba8:	6ca2                	ld	s9,8(sp)
    80205baa:	6125                	addi	sp,sp,96
    80205bac:	8082                	ret

0000000080205bae <formatname>:
{
    80205bae:	7179                	addi	sp,sp,-48
    80205bb0:	f406                	sd	ra,40(sp)
    80205bb2:	f022                	sd	s0,32(sp)
    80205bb4:	ec26                	sd	s1,24(sp)
    80205bb6:	e84a                	sd	s2,16(sp)
    80205bb8:	e44e                	sd	s3,8(sp)
    80205bba:	e052                	sd	s4,0(sp)
    80205bbc:	1800                	addi	s0,sp,48
    80205bbe:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    80205bc0:	02000793          	li	a5,32
    80205bc4:	02e00713          	li	a4,46
    80205bc8:	a011                	j	80205bcc <formatname+0x1e>
    80205bca:	0485                	addi	s1,s1,1
    80205bcc:	0004c583          	lbu	a1,0(s1)
    80205bd0:	fef58de3          	beq	a1,a5,80205bca <formatname+0x1c>
    80205bd4:	fee58be3          	beq	a1,a4,80205bca <formatname+0x1c>
    for (p = name; *p; p++) {
    80205bd8:	c1b9                	beqz	a1,80205c1e <formatname+0x70>
    80205bda:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    80205bdc:	49fd                	li	s3,31
    80205bde:	00006a17          	auipc	s4,0x6
    80205be2:	e42a0a13          	addi	s4,s4,-446 # 8020ba20 <illegal.1>
    80205be6:	02b9fe63          	bgeu	s3,a1,80205c22 <formatname+0x74>
    80205bea:	8552                	mv	a0,s4
    80205bec:	ffffb097          	auipc	ra,0xffffb
    80205bf0:	dd4080e7          	jalr	-556(ra) # 802009c0 <strchr>
    80205bf4:	e121                	bnez	a0,80205c34 <formatname+0x86>
    for (p = name; *p; p++) {
    80205bf6:	0905                	addi	s2,s2,1
    80205bf8:	00094583          	lbu	a1,0(s2)
    80205bfc:	f5ed                	bnez	a1,80205be6 <formatname+0x38>
        if (*p != ' ') {
    80205bfe:	02000693          	li	a3,32
    80205c02:	874a                	mv	a4,s2
    while (p-- > name) {
    80205c04:	0124fb63          	bgeu	s1,s2,80205c1a <formatname+0x6c>
        if (*p != ' ') {
    80205c08:	197d                	addi	s2,s2,-1
    80205c0a:	00094783          	lbu	a5,0(s2)
    80205c0e:	fed78ae3          	beq	a5,a3,80205c02 <formatname+0x54>
            p[1] = '\0';
    80205c12:	00070023          	sb	zero,0(a4)
            break;
    80205c16:	8526                	mv	a0,s1
    80205c18:	a031                	j	80205c24 <formatname+0x76>
    80205c1a:	8526                	mv	a0,s1
    80205c1c:	a021                	j	80205c24 <formatname+0x76>
    for (p = name; *p; p++) {
    80205c1e:	8526                	mv	a0,s1
    80205c20:	a011                	j	80205c24 <formatname+0x76>
            return 0;
    80205c22:	4501                	li	a0,0
}
    80205c24:	70a2                	ld	ra,40(sp)
    80205c26:	7402                	ld	s0,32(sp)
    80205c28:	64e2                	ld	s1,24(sp)
    80205c2a:	6942                	ld	s2,16(sp)
    80205c2c:	69a2                	ld	s3,8(sp)
    80205c2e:	6a02                	ld	s4,0(sp)
    80205c30:	6145                	addi	sp,sp,48
    80205c32:	8082                	ret
            return 0;
    80205c34:	4501                	li	a0,0
    80205c36:	b7fd                	j	80205c24 <formatname+0x76>

0000000080205c38 <cal_checksum>:
{
    80205c38:	1141                	addi	sp,sp,-16
    80205c3a:	e422                	sd	s0,8(sp)
    80205c3c:	0800                	addi	s0,sp,16
    80205c3e:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80205c40:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    80205c44:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    80205c46:	0075171b          	slliw	a4,a0,0x7
    80205c4a:	0785                	addi	a5,a5,1
    80205c4c:	0015551b          	srliw	a0,a0,0x1
    80205c50:	fff7c683          	lbu	a3,-1(a5)
    80205c54:	9d35                	addw	a0,a0,a3
    80205c56:	953a                	add	a0,a0,a4
    80205c58:	0ff57513          	zext.b	a0,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80205c5c:	fef615e3          	bne	a2,a5,80205c46 <cal_checksum+0xe>
}
    80205c60:	6422                	ld	s0,8(sp)
    80205c62:	0141                	addi	sp,sp,16
    80205c64:	8082                	ret

0000000080205c66 <emake>:
{
    80205c66:	7131                	addi	sp,sp,-192
    80205c68:	fd06                	sd	ra,184(sp)
    80205c6a:	f922                	sd	s0,176(sp)
    80205c6c:	f526                	sd	s1,168(sp)
    80205c6e:	f14a                	sd	s2,160(sp)
    80205c70:	ed4e                	sd	s3,152(sp)
    80205c72:	e952                	sd	s4,144(sp)
    80205c74:	e556                	sd	s5,136(sp)
    80205c76:	e15a                	sd	s6,128(sp)
    80205c78:	fcde                	sd	s7,120(sp)
    80205c7a:	f8e2                	sd	s8,112(sp)
    80205c7c:	f4e6                	sd	s9,104(sp)
    80205c7e:	f0ea                	sd	s10,96(sp)
    80205c80:	ecee                	sd	s11,88(sp)
    80205c82:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80205c84:	10054783          	lbu	a5,256(a0)
    80205c88:	8bc1                	andi	a5,a5,16
    80205c8a:	c3d5                	beqz	a5,80205d2e <emake+0xc8>
    80205c8c:	8b2a                	mv	s6,a0
    80205c8e:	8d2e                	mv	s10,a1
    80205c90:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    80205c92:	01f67793          	andi	a5,a2,31
    80205c96:	e7c5                	bnez	a5,80205d3e <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80205c98:	02000613          	li	a2,32
    80205c9c:	4581                	li	a1,0
    80205c9e:	f7040513          	addi	a0,s0,-144
    80205ca2:	ffffb097          	auipc	ra,0xffffb
    80205ca6:	ac0080e7          	jalr	-1344(ra) # 80200762 <memset>
    if (off <= 32) {
    80205caa:	02000793          	li	a5,32
    80205cae:	0b97ec63          	bltu	a5,s9,80205d66 <emake+0x100>
        if (off == 0) {
    80205cb2:	080c9e63          	bnez	s9,80205d4e <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80205cb6:	462d                	li	a2,11
    80205cb8:	00004597          	auipc	a1,0x4
    80205cbc:	02858593          	addi	a1,a1,40 # 80209ce0 <digits+0x960>
    80205cc0:	f7040513          	addi	a0,s0,-144
    80205cc4:	ffffb097          	auipc	ra,0xffffb
    80205cc8:	bb2080e7          	jalr	-1102(ra) # 80200876 <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    80205ccc:	47c1                	li	a5,16
    80205cce:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80205cd2:	104d2783          	lw	a5,260(s10) # fffffffffffff104 <ebss_clear+0xffffffff7fdd9104>
    80205cd6:	0107d71b          	srliw	a4,a5,0x10
    80205cda:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    80205cde:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    80205ce2:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    80205ce6:	4605                	li	a2,1
    80205ce8:	85e6                	mv	a1,s9
    80205cea:	855a                	mv	a0,s6
    80205cec:	fffff097          	auipc	ra,0xfffff
    80205cf0:	68a080e7          	jalr	1674(ra) # 80205376 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80205cf4:	02000793          	li	a5,32
    80205cf8:	0005071b          	sext.w	a4,a0
    80205cfc:	f7040693          	addi	a3,s0,-144
    80205d00:	4601                	li	a2,0
    80205d02:	4585                	li	a1,1
    80205d04:	10cb2503          	lw	a0,268(s6)
    80205d08:	fffff097          	auipc	ra,0xfffff
    80205d0c:	776080e7          	jalr	1910(ra) # 8020547e <rw_clus>
}
    80205d10:	70ea                	ld	ra,184(sp)
    80205d12:	744a                	ld	s0,176(sp)
    80205d14:	74aa                	ld	s1,168(sp)
    80205d16:	790a                	ld	s2,160(sp)
    80205d18:	69ea                	ld	s3,152(sp)
    80205d1a:	6a4a                	ld	s4,144(sp)
    80205d1c:	6aaa                	ld	s5,136(sp)
    80205d1e:	6b0a                	ld	s6,128(sp)
    80205d20:	7be6                	ld	s7,120(sp)
    80205d22:	7c46                	ld	s8,112(sp)
    80205d24:	7ca6                	ld	s9,104(sp)
    80205d26:	7d06                	ld	s10,96(sp)
    80205d28:	6de6                	ld	s11,88(sp)
    80205d2a:	6129                	addi	sp,sp,192
    80205d2c:	8082                	ret
        panic("emake: not dir");
    80205d2e:	00004517          	auipc	a0,0x4
    80205d32:	f8a50513          	addi	a0,a0,-118 # 80209cb8 <digits+0x938>
    80205d36:	ffffa097          	auipc	ra,0xffffa
    80205d3a:	40e080e7          	jalr	1038(ra) # 80200144 <panic>
        panic("emake: not aligned");
    80205d3e:	00004517          	auipc	a0,0x4
    80205d42:	f8a50513          	addi	a0,a0,-118 # 80209cc8 <digits+0x948>
    80205d46:	ffffa097          	auipc	ra,0xffffa
    80205d4a:	3fe080e7          	jalr	1022(ra) # 80200144 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    80205d4e:	462d                	li	a2,11
    80205d50:	00004597          	auipc	a1,0x4
    80205d54:	fa058593          	addi	a1,a1,-96 # 80209cf0 <digits+0x970>
    80205d58:	f7040513          	addi	a0,s0,-144
    80205d5c:	ffffb097          	auipc	ra,0xffffb
    80205d60:	b1a080e7          	jalr	-1254(ra) # 80200876 <strncpy>
    80205d64:	b7a5                	j	80205ccc <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    80205d66:	896a                	mv	s2,s10
    80205d68:	856a                	mv	a0,s10
    80205d6a:	ffffb097          	auipc	ra,0xffffb
    80205d6e:	b7c080e7          	jalr	-1156(ra) # 802008e6 <strlen>
    80205d72:	f4a43423          	sd	a0,-184(s0)
    80205d76:	00c5071b          	addiw	a4,a0,12
    80205d7a:	47b5                	li	a5,13
    80205d7c:	02f747bb          	divw	a5,a4,a5
    80205d80:	f4f42c23          	sw	a5,-168(s0)
    80205d84:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    80205d88:	4631                	li	a2,12
    80205d8a:	4581                	li	a1,0
    80205d8c:	f6040513          	addi	a0,s0,-160
    80205d90:	ffffb097          	auipc	ra,0xffffb
    80205d94:	9d2080e7          	jalr	-1582(ra) # 80200762 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80205d98:	856a                	mv	a0,s10
    80205d9a:	ffffb097          	auipc	ra,0xffffb
    80205d9e:	b4c080e7          	jalr	-1204(ra) # 802008e6 <strlen>
    80205da2:	fff5079b          	addiw	a5,a0,-1
    80205da6:	0207cf63          	bltz	a5,80205de4 <emake+0x17e>
    80205daa:	97ea                	add	a5,a5,s10
    80205dac:	ffed0693          	addi	a3,s10,-2
    80205db0:	96aa                	add	a3,a3,a0
    80205db2:	fff5071b          	addiw	a4,a0,-1
    80205db6:	1702                	slli	a4,a4,0x20
    80205db8:	9301                	srli	a4,a4,0x20
    80205dba:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    80205dbc:	02e00613          	li	a2,46
    80205dc0:	89be                	mv	s3,a5
    80205dc2:	0007c703          	lbu	a4,0(a5)
    80205dc6:	00c70663          	beq	a4,a2,80205dd2 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80205dca:	17fd                	addi	a5,a5,-1
    80205dcc:	fed79ae3          	bne	a5,a3,80205dc0 <emake+0x15a>
    char c, *p = name;
    80205dd0:	89ea                	mv	s3,s10
        shortname[i++] = c;
    80205dd2:	4481                	li	s1,0
        if (i == 8 && p) {
    80205dd4:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80205dd6:	4ba9                	li	s7,10
        if (c >= 'a' && c <= 'z') {
    80205dd8:	4c65                	li	s8,25
                memset(shortname + i, ' ', 8 - i);
    80205dda:	f6040793          	addi	a5,s0,-160
    80205dde:	f4f43823          	sd	a5,-176(s0)
    80205de2:	a8d9                	j	80205eb8 <emake+0x252>
    char c, *p = name;
    80205de4:	89ea                	mv	s3,s10
    80205de6:	b7f5                	j	80205dd2 <emake+0x16c>
        if (i == 8 && p) {
    80205de8:	22098b63          	beqz	s3,8020601e <emake+0x3b8>
            if (p + 1 < name) { break; }            // no '.'
    80205dec:	0985                	addi	s3,s3,1
    80205dee:	0949fc63          	bgeu	s3,s4,80205e86 <emake+0x220>
    80205df2:	f6040793          	addi	a5,s0,-160
    80205df6:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    80205df8:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    80205dfc:	4729                	li	a4,10
        shortname[i++] = ' ';
    80205dfe:	2485                	addiw	s1,s1,1
    80205e00:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    80205e04:	0785                	addi	a5,a5,1
    80205e06:	fe975ce3          	bge	a4,s1,80205dfe <emake+0x198>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    80205e0a:	f6040513          	addi	a0,s0,-160
    80205e0e:	00000097          	auipc	ra,0x0
    80205e12:	e2a080e7          	jalr	-470(ra) # 80205c38 <cal_checksum>
    80205e16:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    80205e1a:	47bd                	li	a5,15
    80205e1c:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    80205e20:	f4843783          	ld	a5,-184(s0)
    80205e24:	14f05c63          	blez	a5,80205f7c <emake+0x316>
    80205e28:	f5842783          	lw	a5,-168(s0)
    80205e2c:	37fd                	addiw	a5,a5,-1
    80205e2e:	f4f42223          	sw	a5,-188(s0)
    80205e32:	00179b9b          	slliw	s7,a5,0x1
    80205e36:	00fb8bbb          	addw	s7,s7,a5
    80205e3a:	002b9b9b          	slliw	s7,s7,0x2
    80205e3e:	00fb8bbb          	addw	s7,s7,a5
    80205e42:	9bea                	add	s7,s7,s10
    80205e44:	8aee                	mv	s5,s11
    80205e46:	8c66                	mv	s8,s9
            int end = 0;
    80205e48:	4981                	li	s3,0
            uint8 *w = (uint8 *)de.lne.name1;
    80205e4a:	f7140793          	addi	a5,s0,-143
    80205e4e:	f4f43823          	sd	a5,-176(s0)
    80205e52:	0ff00913          	li	s2,255
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80205e56:	f7e40793          	addi	a5,s0,-130
    80205e5a:	f4f43c23          	sd	a5,-168(s0)
                switch (j) {
    80205e5e:	44ad                	li	s1,11
    80205e60:	f8c40a13          	addi	s4,s0,-116
    80205e64:	a0c5                	j	80205f44 <emake+0x2de>
            if (name > p) {                    // last '.'
    80205e66:	0549f663          	bgeu	s3,s4,80205eb2 <emake+0x24c>
                memset(shortname + i, ' ', 8 - i);
    80205e6a:	47a1                	li	a5,8
    80205e6c:	4097863b          	subw	a2,a5,s1
    80205e70:	02000593          	li	a1,32
    80205e74:	f5043783          	ld	a5,-176(s0)
    80205e78:	00978533          	add	a0,a5,s1
    80205e7c:	ffffb097          	auipc	ra,0xffffb
    80205e80:	8e6080e7          	jalr	-1818(ra) # 80200762 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80205e84:	89d2                	mv	s3,s4
        shortname[i++] = c;
    80205e86:	8a4e                	mv	s4,s3
    80205e88:	84d6                	mv	s1,s5
    80205e8a:	4981                	li	s3,0
    80205e8c:	a02d                	j	80205eb6 <emake+0x250>
            if (strchr(illegal, c) != NULL) {
    80205e8e:	85ca                	mv	a1,s2
    80205e90:	00006517          	auipc	a0,0x6
    80205e94:	ba050513          	addi	a0,a0,-1120 # 8020ba30 <illegal.0>
    80205e98:	ffffb097          	auipc	ra,0xffffb
    80205e9c:	b28080e7          	jalr	-1240(ra) # 802009c0 <strchr>
    80205ea0:	c119                	beqz	a0,80205ea6 <emake+0x240>
                c = '_';
    80205ea2:	05f00913          	li	s2,95
        shortname[i++] = c;
    80205ea6:	f9048793          	addi	a5,s1,-112
    80205eaa:	97a2                	add	a5,a5,s0
    80205eac:	fd278823          	sb	s2,-48(a5)
    80205eb0:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80205eb2:	f49bcce3          	blt	s7,s1,80205e0a <emake+0x1a4>
        shortname[i++] = c;
    80205eb6:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80205eb8:	00190a13          	addi	s4,s2,1
    80205ebc:	00094903          	lbu	s2,0(s2)
    80205ec0:	02090663          	beqz	s2,80205eec <emake+0x286>
        if (i == 8 && p) {
    80205ec4:	f35482e3          	beq	s1,s5,80205de8 <emake+0x182>
        if (c == ' ') { continue; }
    80205ec8:	02000793          	li	a5,32
    80205ecc:	fef903e3          	beq	s2,a5,80205eb2 <emake+0x24c>
        if (c == '.') {
    80205ed0:	02e00793          	li	a5,46
    80205ed4:	f8f909e3          	beq	s2,a5,80205e66 <emake+0x200>
        if (c >= 'a' && c <= 'z') {
    80205ed8:	f9f9079b          	addiw	a5,s2,-97
    80205edc:	0ff7f793          	zext.b	a5,a5
    80205ee0:	fafc67e3          	bltu	s8,a5,80205e8e <emake+0x228>
            c += 'A' - 'a';
    80205ee4:	3901                	addiw	s2,s2,-32
    80205ee6:	0ff97913          	zext.b	s2,s2
    80205eea:	bf75                	j	80205ea6 <emake+0x240>
    while (i < CHAR_SHORT_NAME) {
    80205eec:	47a9                	li	a5,10
    80205eee:	f097d2e3          	bge	a5,s1,80205df2 <emake+0x18c>
    80205ef2:	bf21                	j	80205e0a <emake+0x1a4>
                de.lne.order |= LAST_LONG_ENTRY;
    80205ef4:	0407e793          	ori	a5,a5,64
    80205ef8:	f6f40823          	sb	a5,-144(s0)
    80205efc:	a891                	j	80205f50 <emake+0x2ea>
                    if ((*w++ = *p++) == 0) {
    80205efe:	00084603          	lbu	a2,0(a6)
                        end = 1;
    80205f02:	00163513          	seqz	a0,a2
                    *w++ = 0;
    80205f06:	00278893          	addi	a7,a5,2
                    if ((*w++ = *p++) == 0) {
    80205f0a:	0805                	addi	a6,a6,1
                    *w++ = 0;
    80205f0c:	85ce                	mv	a1,s3
    80205f0e:	a8d5                	j	80206002 <emake+0x39c>
            uint off2 = reloc_clus(dp, off, 1);
    80205f10:	4605                	li	a2,1
    80205f12:	85e2                	mv	a1,s8
    80205f14:	855a                	mv	a0,s6
    80205f16:	fffff097          	auipc	ra,0xfffff
    80205f1a:	460080e7          	jalr	1120(ra) # 80205376 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80205f1e:	02000793          	li	a5,32
    80205f22:	0005071b          	sext.w	a4,a0
    80205f26:	f7040693          	addi	a3,s0,-144
    80205f2a:	864e                	mv	a2,s3
    80205f2c:	4585                	li	a1,1
    80205f2e:	10cb2503          	lw	a0,268(s6)
    80205f32:	fffff097          	auipc	ra,0xfffff
    80205f36:	54c080e7          	jalr	1356(ra) # 8020547e <rw_clus>
            off += sizeof(de);
    80205f3a:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    80205f3e:	1bcd                	addi	s7,s7,-13
    80205f40:	03505163          	blez	s5,80205f62 <emake+0x2fc>
            if ((de.lne.order = i) == entcnt) {
    80205f44:	0ffaf793          	zext.b	a5,s5
    80205f48:	fafd86e3          	beq	s11,a5,80205ef4 <emake+0x28e>
    80205f4c:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    80205f50:	3afd                	addiw	s5,s5,-1
    80205f52:	885e                	mv	a6,s7
    80205f54:	4709                	li	a4,2
            int end = 0;
    80205f56:	854e                	mv	a0,s3
            uint8 *w = (uint8 *)de.lne.name1;
    80205f58:	f5043783          	ld	a5,-176(s0)
                switch (j) {
    80205f5c:	4315                	li	t1,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80205f5e:	4e35                	li	t3,13
    80205f60:	a851                	j	80205ff4 <emake+0x38e>
    80205f62:	020c8c9b          	addiw	s9,s9,32
            off += sizeof(de);
    80205f66:	4781                	li	a5,0
    80205f68:	f4843703          	ld	a4,-184(s0)
    80205f6c:	00e05663          	blez	a4,80205f78 <emake+0x312>
    80205f70:	f4442783          	lw	a5,-188(s0)
    80205f74:	0057979b          	slliw	a5,a5,0x5
    80205f78:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    80205f7c:	02000613          	li	a2,32
    80205f80:	4581                	li	a1,0
    80205f82:	f7040493          	addi	s1,s0,-144
    80205f86:	8526                	mv	a0,s1
    80205f88:	ffffa097          	auipc	ra,0xffffa
    80205f8c:	7da080e7          	jalr	2010(ra) # 80200762 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    80205f90:	462d                	li	a2,11
    80205f92:	f6040593          	addi	a1,s0,-160
    80205f96:	8526                	mv	a0,s1
    80205f98:	ffffb097          	auipc	ra,0xffffb
    80205f9c:	8de080e7          	jalr	-1826(ra) # 80200876 <strncpy>
        de.sne.attr = ep->attribute;
    80205fa0:	100d4783          	lbu	a5,256(s10)
    80205fa4:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    80205fa8:	104d2783          	lw	a5,260(s10)
    80205fac:	0107d71b          	srliw	a4,a5,0x10
    80205fb0:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    80205fb4:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    80205fb8:	108d2783          	lw	a5,264(s10)
    80205fbc:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80205fc0:	4605                	li	a2,1
    80205fc2:	85e6                	mv	a1,s9
    80205fc4:	855a                	mv	a0,s6
    80205fc6:	fffff097          	auipc	ra,0xfffff
    80205fca:	3b0080e7          	jalr	944(ra) # 80205376 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80205fce:	02000793          	li	a5,32
    80205fd2:	0005071b          	sext.w	a4,a0
    80205fd6:	86a6                	mv	a3,s1
    80205fd8:	4601                	li	a2,0
    80205fda:	4585                	li	a1,1
    80205fdc:	10cb2503          	lw	a0,268(s6)
    80205fe0:	fffff097          	auipc	ra,0xfffff
    80205fe4:	49e080e7          	jalr	1182(ra) # 8020547e <rw_clus>
}
    80205fe8:	b325                	j	80205d10 <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80205fea:	f5843783          	ld	a5,-168(s0)
    80205fee:	a011                	j	80205ff2 <emake+0x38c>
                switch (j) {
    80205ff0:	87d2                	mv	a5,s4
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80205ff2:	2705                	addiw	a4,a4,1
    80205ff4:	fff7069b          	addiw	a3,a4,-1
                if (end) {
    80205ff8:	d119                	beqz	a0,80205efe <emake+0x298>
                    *w++ = 0xff;
    80205ffa:	00278893          	addi	a7,a5,2
    80205ffe:	864a                	mv	a2,s2
    80206000:	85ca                	mv	a1,s2
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206002:	00c78023          	sb	a2,0(a5)
                    *w++ = 0xff;
    80206006:	00b780a3          	sb	a1,1(a5)
                switch (j) {
    8020600a:	fe6680e3          	beq	a3,t1,80205fea <emake+0x384>
    8020600e:	fe9681e3          	beq	a3,s1,80205ff0 <emake+0x38a>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206012:	0007079b          	sext.w	a5,a4
    80206016:	eefe4de3          	blt	t3,a5,80205f10 <emake+0x2aa>
    8020601a:	87c6                	mv	a5,a7
    8020601c:	bfd9                	j	80205ff2 <emake+0x38c>
        if (c == ' ') { continue; }
    8020601e:	02000793          	li	a5,32
    80206022:	e8f90ae3          	beq	s2,a5,80205eb6 <emake+0x250>
        if (c == '.') {
    80206026:	02e00793          	li	a5,46
    8020602a:	eaf917e3          	bne	s2,a5,80205ed8 <emake+0x272>
    8020602e:	bd35                	j	80205e6a <emake+0x204>

0000000080206030 <edup>:
{
    80206030:	1101                	addi	sp,sp,-32
    80206032:	ec06                	sd	ra,24(sp)
    80206034:	e822                	sd	s0,16(sp)
    80206036:	e426                	sd	s1,8(sp)
    80206038:	1000                	addi	s0,sp,32
    8020603a:	84aa                	mv	s1,a0
    if (entry != 0) {
    8020603c:	c515                	beqz	a0,80206068 <edup+0x38>
        acquire(&ecache.lock);
    8020603e:	00018517          	auipc	a0,0x18
    80206042:	57a50513          	addi	a0,a0,1402 # 8021e5b8 <ecache>
    80206046:	ffffa097          	auipc	ra,0xffffa
    8020604a:	680080e7          	jalr	1664(ra) # 802006c6 <acquire>
        entry->ref++;
    8020604e:	1184a783          	lw	a5,280(s1)
    80206052:	2785                	addiw	a5,a5,1
    80206054:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206058:	00018517          	auipc	a0,0x18
    8020605c:	56050513          	addi	a0,a0,1376 # 8021e5b8 <ecache>
    80206060:	ffffa097          	auipc	ra,0xffffa
    80206064:	6ba080e7          	jalr	1722(ra) # 8020071a <release>
}
    80206068:	8526                	mv	a0,s1
    8020606a:	60e2                	ld	ra,24(sp)
    8020606c:	6442                	ld	s0,16(sp)
    8020606e:	64a2                	ld	s1,8(sp)
    80206070:	6105                	addi	sp,sp,32
    80206072:	8082                	ret

0000000080206074 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    80206074:	11554783          	lbu	a5,277(a0)
    80206078:	c3e5                	beqz	a5,80206158 <eupdate+0xe4>
{
    8020607a:	711d                	addi	sp,sp,-96
    8020607c:	ec86                	sd	ra,88(sp)
    8020607e:	e8a2                	sd	s0,80(sp)
    80206080:	e4a6                	sd	s1,72(sp)
    80206082:	e0ca                	sd	s2,64(sp)
    80206084:	fc4e                	sd	s3,56(sp)
    80206086:	1080                	addi	s0,sp,96
    80206088:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    8020608a:	11651703          	lh	a4,278(a0)
    8020608e:	4785                	li	a5,1
    80206090:	00f70963          	beq	a4,a5,802060a2 <eupdate+0x2e>
}
    80206094:	60e6                	ld	ra,88(sp)
    80206096:	6446                	ld	s0,80(sp)
    80206098:	64a6                	ld	s1,72(sp)
    8020609a:	6906                	ld	s2,64(sp)
    8020609c:	79e2                	ld	s3,56(sp)
    8020609e:	6125                	addi	sp,sp,96
    802060a0:	8082                	ret
    uint entcnt = 0;
    802060a2:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    802060a6:	4601                	li	a2,0
    802060a8:	11c52583          	lw	a1,284(a0)
    802060ac:	12053503          	ld	a0,288(a0)
    802060b0:	fffff097          	auipc	ra,0xfffff
    802060b4:	2c6080e7          	jalr	710(ra) # 80205376 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    802060b8:	1204b803          	ld	a6,288(s1)
    802060bc:	4785                	li	a5,1
    802060be:	0005071b          	sext.w	a4,a0
    802060c2:	fcc40693          	addi	a3,s0,-52
    802060c6:	4601                	li	a2,0
    802060c8:	4581                	li	a1,0
    802060ca:	10c82503          	lw	a0,268(a6)
    802060ce:	fffff097          	auipc	ra,0xfffff
    802060d2:	3b0080e7          	jalr	944(ra) # 8020547e <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    802060d6:	fcc42583          	lw	a1,-52(s0)
    802060da:	fbf5f593          	andi	a1,a1,-65
    802060de:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    802060e2:	0055959b          	slliw	a1,a1,0x5
    802060e6:	11c4a783          	lw	a5,284(s1)
    802060ea:	4601                	li	a2,0
    802060ec:	9dbd                	addw	a1,a1,a5
    802060ee:	1204b503          	ld	a0,288(s1)
    802060f2:	fffff097          	auipc	ra,0xfffff
    802060f6:	284080e7          	jalr	644(ra) # 80205376 <reloc_clus>
    802060fa:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    802060fe:	1204b503          	ld	a0,288(s1)
    80206102:	02000793          	li	a5,32
    80206106:	874e                	mv	a4,s3
    80206108:	fa840913          	addi	s2,s0,-88
    8020610c:	86ca                	mv	a3,s2
    8020610e:	4601                	li	a2,0
    80206110:	4581                	li	a1,0
    80206112:	10c52503          	lw	a0,268(a0)
    80206116:	fffff097          	auipc	ra,0xfffff
    8020611a:	368080e7          	jalr	872(ra) # 8020547e <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    8020611e:	1044a783          	lw	a5,260(s1)
    80206122:	0107d71b          	srliw	a4,a5,0x10
    80206126:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    8020612a:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    8020612e:	1084a783          	lw	a5,264(s1)
    80206132:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206136:	1204b503          	ld	a0,288(s1)
    8020613a:	02000793          	li	a5,32
    8020613e:	874e                	mv	a4,s3
    80206140:	86ca                	mv	a3,s2
    80206142:	4601                	li	a2,0
    80206144:	4585                	li	a1,1
    80206146:	10c52503          	lw	a0,268(a0)
    8020614a:	fffff097          	auipc	ra,0xfffff
    8020614e:	334080e7          	jalr	820(ra) # 8020547e <rw_clus>
    entry->dirty = 0;
    80206152:	10048aa3          	sb	zero,277(s1)
    80206156:	bf3d                	j	80206094 <eupdate+0x20>
    80206158:	8082                	ret

000000008020615a <eremove>:
    if (entry->valid != 1) { return; }
    8020615a:	11651703          	lh	a4,278(a0)
    8020615e:	4785                	li	a5,1
    80206160:	00f70363          	beq	a4,a5,80206166 <eremove+0xc>
    80206164:	8082                	ret
{
    80206166:	715d                	addi	sp,sp,-80
    80206168:	e486                	sd	ra,72(sp)
    8020616a:	e0a2                	sd	s0,64(sp)
    8020616c:	fc26                	sd	s1,56(sp)
    8020616e:	f84a                	sd	s2,48(sp)
    80206170:	f44e                	sd	s3,40(sp)
    80206172:	f052                	sd	s4,32(sp)
    80206174:	ec56                	sd	s5,24(sp)
    80206176:	0880                	addi	s0,sp,80
    80206178:	89aa                	mv	s3,a0
    uint entcnt = 0;
    8020617a:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    8020617e:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    80206182:	4601                	li	a2,0
    80206184:	85d2                	mv	a1,s4
    80206186:	12053503          	ld	a0,288(a0)
    8020618a:	fffff097          	auipc	ra,0xfffff
    8020618e:	1ec080e7          	jalr	492(ra) # 80205376 <reloc_clus>
    80206192:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    80206196:	1209b503          	ld	a0,288(s3)
    8020619a:	4785                	li	a5,1
    8020619c:	8726                	mv	a4,s1
    8020619e:	fbc40693          	addi	a3,s0,-68
    802061a2:	4601                	li	a2,0
    802061a4:	4581                	li	a1,0
    802061a6:	10c52503          	lw	a0,268(a0)
    802061aa:	fffff097          	auipc	ra,0xfffff
    802061ae:	2d4080e7          	jalr	724(ra) # 8020547e <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    802061b2:	fbc42783          	lw	a5,-68(s0)
    802061b6:	fbf7f793          	andi	a5,a5,-65
    802061ba:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    802061be:	5795                	li	a5,-27
    802061c0:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    802061c4:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    802061c6:	fbb40a93          	addi	s5,s0,-69
    802061ca:	1209b503          	ld	a0,288(s3)
    802061ce:	4785                	li	a5,1
    802061d0:	8726                	mv	a4,s1
    802061d2:	86d6                	mv	a3,s5
    802061d4:	4601                	li	a2,0
    802061d6:	4585                	li	a1,1
    802061d8:	10c52503          	lw	a0,268(a0)
    802061dc:	fffff097          	auipc	ra,0xfffff
    802061e0:	2a2080e7          	jalr	674(ra) # 8020547e <rw_clus>
        off += 32;
    802061e4:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    802061e8:	4601                	li	a2,0
    802061ea:	85d2                	mv	a1,s4
    802061ec:	1209b503          	ld	a0,288(s3)
    802061f0:	fffff097          	auipc	ra,0xfffff
    802061f4:	186080e7          	jalr	390(ra) # 80205376 <reloc_clus>
    802061f8:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    802061fc:	0019079b          	addiw	a5,s2,1
    80206200:	0007891b          	sext.w	s2,a5
    80206204:	fbc42703          	lw	a4,-68(s0)
    80206208:	fd2771e3          	bgeu	a4,s2,802061ca <eremove+0x70>
    entry->valid = -1;
    8020620c:	57fd                	li	a5,-1
    8020620e:	10f99b23          	sh	a5,278(s3)
}
    80206212:	60a6                	ld	ra,72(sp)
    80206214:	6406                	ld	s0,64(sp)
    80206216:	74e2                	ld	s1,56(sp)
    80206218:	7942                	ld	s2,48(sp)
    8020621a:	79a2                	ld	s3,40(sp)
    8020621c:	7a02                	ld	s4,32(sp)
    8020621e:	6ae2                	ld	s5,24(sp)
    80206220:	6161                	addi	sp,sp,80
    80206222:	8082                	ret

0000000080206224 <etrunc>:
{
    80206224:	7179                	addi	sp,sp,-48
    80206226:	f406                	sd	ra,40(sp)
    80206228:	f022                	sd	s0,32(sp)
    8020622a:	ec26                	sd	s1,24(sp)
    8020622c:	e84a                	sd	s2,16(sp)
    8020622e:	e44e                	sd	s3,8(sp)
    80206230:	e052                	sd	s4,0(sp)
    80206232:	1800                	addi	s0,sp,48
    80206234:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206236:	10452483          	lw	s1,260(a0)
    8020623a:	ffe4871b          	addiw	a4,s1,-2
    8020623e:	100007b7          	lui	a5,0x10000
    80206242:	17d5                	addi	a5,a5,-11 # ffffff5 <_entry-0x7020000b>
    80206244:	02e7e663          	bltu	a5,a4,80206270 <etrunc+0x4c>
    80206248:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    8020624a:	0004891b          	sext.w	s2,s1
    8020624e:	8526                	mv	a0,s1
    80206250:	fffff097          	auipc	ra,0xfffff
    80206254:	eee080e7          	jalr	-274(ra) # 8020513e <read_fat>
    80206258:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    8020625c:	4581                	li	a1,0
    8020625e:	854a                	mv	a0,s2
    80206260:	fffff097          	auipc	ra,0xfffff
    80206264:	096080e7          	jalr	150(ra) # 802052f6 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206268:	ffe4879b          	addiw	a5,s1,-2
    8020626c:	fcf9ffe3          	bgeu	s3,a5,8020624a <etrunc+0x26>
    entry->file_size = 0;
    80206270:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    80206274:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    80206278:	4785                	li	a5,1
    8020627a:	10fa0aa3          	sb	a5,277(s4)
}
    8020627e:	70a2                	ld	ra,40(sp)
    80206280:	7402                	ld	s0,32(sp)
    80206282:	64e2                	ld	s1,24(sp)
    80206284:	6942                	ld	s2,16(sp)
    80206286:	69a2                	ld	s3,8(sp)
    80206288:	6a02                	ld	s4,0(sp)
    8020628a:	6145                	addi	sp,sp,48
    8020628c:	8082                	ret

000000008020628e <elock>:
{
    8020628e:	1141                	addi	sp,sp,-16
    80206290:	e406                	sd	ra,8(sp)
    80206292:	e022                	sd	s0,0(sp)
    80206294:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    80206296:	cd19                	beqz	a0,802062b4 <elock+0x26>
    80206298:	11852783          	lw	a5,280(a0)
    8020629c:	00f05c63          	blez	a5,802062b4 <elock+0x26>
    acquiresleep(&entry->lock);
    802062a0:	13850513          	addi	a0,a0,312
    802062a4:	ffffd097          	auipc	ra,0xffffd
    802062a8:	3dc080e7          	jalr	988(ra) # 80203680 <acquiresleep>
}
    802062ac:	60a2                	ld	ra,8(sp)
    802062ae:	6402                	ld	s0,0(sp)
    802062b0:	0141                	addi	sp,sp,16
    802062b2:	8082                	ret
        panic("elock");
    802062b4:	00004517          	auipc	a0,0x4
    802062b8:	a4c50513          	addi	a0,a0,-1460 # 80209d00 <digits+0x980>
    802062bc:	ffffa097          	auipc	ra,0xffffa
    802062c0:	e88080e7          	jalr	-376(ra) # 80200144 <panic>

00000000802062c4 <eunlock>:
{
    802062c4:	1101                	addi	sp,sp,-32
    802062c6:	ec06                	sd	ra,24(sp)
    802062c8:	e822                	sd	s0,16(sp)
    802062ca:	e426                	sd	s1,8(sp)
    802062cc:	e04a                	sd	s2,0(sp)
    802062ce:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    802062d0:	c90d                	beqz	a0,80206302 <eunlock+0x3e>
    802062d2:	84aa                	mv	s1,a0
    802062d4:	13850913          	addi	s2,a0,312
    802062d8:	854a                	mv	a0,s2
    802062da:	ffffd097          	auipc	ra,0xffffd
    802062de:	440080e7          	jalr	1088(ra) # 8020371a <holdingsleep>
    802062e2:	c105                	beqz	a0,80206302 <eunlock+0x3e>
    802062e4:	1184a783          	lw	a5,280(s1)
    802062e8:	00f05d63          	blez	a5,80206302 <eunlock+0x3e>
    releasesleep(&entry->lock);
    802062ec:	854a                	mv	a0,s2
    802062ee:	ffffd097          	auipc	ra,0xffffd
    802062f2:	3e8080e7          	jalr	1000(ra) # 802036d6 <releasesleep>
}
    802062f6:	60e2                	ld	ra,24(sp)
    802062f8:	6442                	ld	s0,16(sp)
    802062fa:	64a2                	ld	s1,8(sp)
    802062fc:	6902                	ld	s2,0(sp)
    802062fe:	6105                	addi	sp,sp,32
    80206300:	8082                	ret
        panic("eunlock");
    80206302:	00004517          	auipc	a0,0x4
    80206306:	a0650513          	addi	a0,a0,-1530 # 80209d08 <digits+0x988>
    8020630a:	ffffa097          	auipc	ra,0xffffa
    8020630e:	e3a080e7          	jalr	-454(ra) # 80200144 <panic>

0000000080206312 <eput>:
{
    80206312:	1101                	addi	sp,sp,-32
    80206314:	ec06                	sd	ra,24(sp)
    80206316:	e822                	sd	s0,16(sp)
    80206318:	e426                	sd	s1,8(sp)
    8020631a:	e04a                	sd	s2,0(sp)
    8020631c:	1000                	addi	s0,sp,32
    8020631e:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    80206320:	00018517          	auipc	a0,0x18
    80206324:	29850513          	addi	a0,a0,664 # 8021e5b8 <ecache>
    80206328:	ffffa097          	auipc	ra,0xffffa
    8020632c:	39e080e7          	jalr	926(ra) # 802006c6 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    80206330:	00018797          	auipc	a5,0x18
    80206334:	12078793          	addi	a5,a5,288 # 8021e450 <root>
    80206338:	00f48a63          	beq	s1,a5,8020634c <eput+0x3a>
    8020633c:	11649783          	lh	a5,278(s1)
    80206340:	c791                	beqz	a5,8020634c <eput+0x3a>
    80206342:	1184a703          	lw	a4,280(s1)
    80206346:	4785                	li	a5,1
    80206348:	02f70563          	beq	a4,a5,80206372 <eput+0x60>
    entry->ref--;
    8020634c:	1184a783          	lw	a5,280(s1)
    80206350:	37fd                	addiw	a5,a5,-1
    80206352:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    80206356:	00018517          	auipc	a0,0x18
    8020635a:	26250513          	addi	a0,a0,610 # 8021e5b8 <ecache>
    8020635e:	ffffa097          	auipc	ra,0xffffa
    80206362:	3bc080e7          	jalr	956(ra) # 8020071a <release>
}
    80206366:	60e2                	ld	ra,24(sp)
    80206368:	6442                	ld	s0,16(sp)
    8020636a:	64a2                	ld	s1,8(sp)
    8020636c:	6902                	ld	s2,0(sp)
    8020636e:	6105                	addi	sp,sp,32
    80206370:	8082                	ret
        acquiresleep(&entry->lock);
    80206372:	13848913          	addi	s2,s1,312
    80206376:	854a                	mv	a0,s2
    80206378:	ffffd097          	auipc	ra,0xffffd
    8020637c:	308080e7          	jalr	776(ra) # 80203680 <acquiresleep>
        entry->next->prev = entry->prev;
    80206380:	1284b703          	ld	a4,296(s1)
    80206384:	1304b783          	ld	a5,304(s1)
    80206388:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    8020638c:	1284b703          	ld	a4,296(s1)
    80206390:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    80206394:	00018797          	auipc	a5,0x18
    80206398:	09478793          	addi	a5,a5,148 # 8021e428 <fat>
    8020639c:	1507b703          	ld	a4,336(a5)
    802063a0:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    802063a4:	00018697          	auipc	a3,0x18
    802063a8:	0ac68693          	addi	a3,a3,172 # 8021e450 <root>
    802063ac:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    802063b0:	12973823          	sd	s1,304(a4)
        root.next = entry;
    802063b4:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    802063b8:	00018517          	auipc	a0,0x18
    802063bc:	20050513          	addi	a0,a0,512 # 8021e5b8 <ecache>
    802063c0:	ffffa097          	auipc	ra,0xffffa
    802063c4:	35a080e7          	jalr	858(ra) # 8020071a <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    802063c8:	11649703          	lh	a4,278(s1)
    802063cc:	57fd                	li	a5,-1
    802063ce:	06f70863          	beq	a4,a5,8020643e <eput+0x12c>
            elock(entry->parent);
    802063d2:	1204b503          	ld	a0,288(s1)
    802063d6:	00000097          	auipc	ra,0x0
    802063da:	eb8080e7          	jalr	-328(ra) # 8020628e <elock>
            eupdate(entry);
    802063de:	8526                	mv	a0,s1
    802063e0:	00000097          	auipc	ra,0x0
    802063e4:	c94080e7          	jalr	-876(ra) # 80206074 <eupdate>
            eunlock(entry->parent);
    802063e8:	1204b503          	ld	a0,288(s1)
    802063ec:	00000097          	auipc	ra,0x0
    802063f0:	ed8080e7          	jalr	-296(ra) # 802062c4 <eunlock>
        releasesleep(&entry->lock);
    802063f4:	854a                	mv	a0,s2
    802063f6:	ffffd097          	auipc	ra,0xffffd
    802063fa:	2e0080e7          	jalr	736(ra) # 802036d6 <releasesleep>
        struct dirent *eparent = entry->parent;
    802063fe:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80206402:	00018517          	auipc	a0,0x18
    80206406:	1b650513          	addi	a0,a0,438 # 8021e5b8 <ecache>
    8020640a:	ffffa097          	auipc	ra,0xffffa
    8020640e:	2bc080e7          	jalr	700(ra) # 802006c6 <acquire>
        entry->ref--;
    80206412:	1184a783          	lw	a5,280(s1)
    80206416:	37fd                	addiw	a5,a5,-1
    80206418:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    8020641c:	00018517          	auipc	a0,0x18
    80206420:	19c50513          	addi	a0,a0,412 # 8021e5b8 <ecache>
    80206424:	ffffa097          	auipc	ra,0xffffa
    80206428:	2f6080e7          	jalr	758(ra) # 8020071a <release>
        if (entry->ref == 0) {
    8020642c:	1184a783          	lw	a5,280(s1)
    80206430:	fb9d                	bnez	a5,80206366 <eput+0x54>
            eput(eparent);
    80206432:	854a                	mv	a0,s2
    80206434:	00000097          	auipc	ra,0x0
    80206438:	ede080e7          	jalr	-290(ra) # 80206312 <eput>
    8020643c:	b72d                	j	80206366 <eput+0x54>
            etrunc(entry);
    8020643e:	8526                	mv	a0,s1
    80206440:	00000097          	auipc	ra,0x0
    80206444:	de4080e7          	jalr	-540(ra) # 80206224 <etrunc>
    80206448:	b775                	j	802063f4 <eput+0xe2>

000000008020644a <estat>:
{
    8020644a:	1101                	addi	sp,sp,-32
    8020644c:	ec06                	sd	ra,24(sp)
    8020644e:	e822                	sd	s0,16(sp)
    80206450:	e426                	sd	s1,8(sp)
    80206452:	e04a                	sd	s2,0(sp)
    80206454:	1000                	addi	s0,sp,32
    80206456:	892a                	mv	s2,a0
    80206458:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    8020645a:	02000613          	li	a2,32
    8020645e:	85aa                	mv	a1,a0
    80206460:	8526                	mv	a0,s1
    80206462:	ffffa097          	auipc	ra,0xffffa
    80206466:	414080e7          	jalr	1044(ra) # 80200876 <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    8020646a:	10094783          	lbu	a5,256(s2)
    8020646e:	8bc1                	andi	a5,a5,16
    80206470:	0017b793          	seqz	a5,a5
    80206474:	0785                	addi	a5,a5,1
    80206476:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    8020647a:	11494783          	lbu	a5,276(s2)
    8020647e:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    80206480:	10896783          	lwu	a5,264(s2)
    80206484:	f89c                	sd	a5,48(s1)
}
    80206486:	60e2                	ld	ra,24(sp)
    80206488:	6442                	ld	s0,16(sp)
    8020648a:	64a2                	ld	s1,8(sp)
    8020648c:	6902                	ld	s2,0(sp)
    8020648e:	6105                	addi	sp,sp,32
    80206490:	8082                	ret

0000000080206492 <enext>:
 * @return  -1      meet the end of dir
 *          0       find empty slots
 *          1       find a file with all its entries
 */
int enext(struct dirent *dp, struct dirent *ep, uint off, int *count)
{
    80206492:	7119                	addi	sp,sp,-128
    80206494:	fc86                	sd	ra,120(sp)
    80206496:	f8a2                	sd	s0,112(sp)
    80206498:	f4a6                	sd	s1,104(sp)
    8020649a:	f0ca                	sd	s2,96(sp)
    8020649c:	ecce                	sd	s3,88(sp)
    8020649e:	e8d2                	sd	s4,80(sp)
    802064a0:	e4d6                	sd	s5,72(sp)
    802064a2:	e0da                	sd	s6,64(sp)
    802064a4:	fc5e                	sd	s7,56(sp)
    802064a6:	f862                	sd	s8,48(sp)
    802064a8:	f466                	sd	s9,40(sp)
    802064aa:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    802064ac:	10054783          	lbu	a5,256(a0)
    802064b0:	8bc1                	andi	a5,a5,16
    802064b2:	cf95                	beqz	a5,802064ee <enext+0x5c>
    802064b4:	892a                	mv	s2,a0
    802064b6:	89ae                	mv	s3,a1
    802064b8:	84b2                	mv	s1,a2
    802064ba:	8ab6                	mv	s5,a3
        panic("enext not dir");
    if (ep->valid)
    802064bc:	11659783          	lh	a5,278(a1)
    802064c0:	ef9d                	bnez	a5,802064fe <enext+0x6c>
        panic("enext ep valid");
    if (off % 32)
    802064c2:	01f67793          	andi	a5,a2,31
    802064c6:	e7a1                	bnez	a5,8020650e <enext+0x7c>
        panic("enext not align");
    if (dp->valid != 1) { return -1; }
    802064c8:	11651703          	lh	a4,278(a0)
    802064cc:	4785                	li	a5,1
    802064ce:	557d                	li	a0,-1
    802064d0:	04f70763          	beq	a4,a5,8020651e <enext+0x8c>
            read_entry_info(ep, &de);
            return 1;
        }
    }
    return -1;
}
    802064d4:	70e6                	ld	ra,120(sp)
    802064d6:	7446                	ld	s0,112(sp)
    802064d8:	74a6                	ld	s1,104(sp)
    802064da:	7906                	ld	s2,96(sp)
    802064dc:	69e6                	ld	s3,88(sp)
    802064de:	6a46                	ld	s4,80(sp)
    802064e0:	6aa6                	ld	s5,72(sp)
    802064e2:	6b06                	ld	s6,64(sp)
    802064e4:	7be2                	ld	s7,56(sp)
    802064e6:	7c42                	ld	s8,48(sp)
    802064e8:	7ca2                	ld	s9,40(sp)
    802064ea:	6109                	addi	sp,sp,128
    802064ec:	8082                	ret
        panic("enext not dir");
    802064ee:	00004517          	auipc	a0,0x4
    802064f2:	82250513          	addi	a0,a0,-2014 # 80209d10 <digits+0x990>
    802064f6:	ffffa097          	auipc	ra,0xffffa
    802064fa:	c4e080e7          	jalr	-946(ra) # 80200144 <panic>
        panic("enext ep valid");
    802064fe:	00004517          	auipc	a0,0x4
    80206502:	82250513          	addi	a0,a0,-2014 # 80209d20 <digits+0x9a0>
    80206506:	ffffa097          	auipc	ra,0xffffa
    8020650a:	c3e080e7          	jalr	-962(ra) # 80200144 <panic>
        panic("enext not align");
    8020650e:	00004517          	auipc	a0,0x4
    80206512:	82250513          	addi	a0,a0,-2014 # 80209d30 <digits+0x9b0>
    80206516:	ffffa097          	auipc	ra,0xffffa
    8020651a:	c2e080e7          	jalr	-978(ra) # 80200144 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    8020651e:	10000613          	li	a2,256
    80206522:	4581                	li	a1,0
    80206524:	854e                	mv	a0,s3
    80206526:	ffffa097          	auipc	ra,0xffffa
    8020652a:	23c080e7          	jalr	572(ra) # 80200762 <memset>
    int cnt = 0;
    8020652e:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206530:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80206532:	f8040a13          	addi	s4,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    80206536:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    8020653a:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    8020653c:	a03d                	j	8020656a <enext+0xd8>
            cnt++;
    8020653e:	2b05                	addiw	s6,s6,1
            continue;
    80206540:	a01d                	j	80206566 <enext+0xd4>
            *count = cnt;
    80206542:	016aa023          	sw	s6,0(s5)
            return 0;
    80206546:	4501                	li	a0,0
    80206548:	b771                	j	802064d4 <enext+0x42>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    8020654a:	fff7079b          	addiw	a5,a4,-1
    8020654e:	0017951b          	slliw	a0,a5,0x1
    80206552:	9d3d                	addw	a0,a0,a5
    80206554:	0025151b          	slliw	a0,a0,0x2
    80206558:	9d3d                	addw	a0,a0,a5
    8020655a:	85d2                	mv	a1,s4
    8020655c:	954e                	add	a0,a0,s3
    8020655e:	fffff097          	auipc	ra,0xfffff
    80206562:	17a080e7          	jalr	378(ra) # 802056d8 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206566:	0204849b          	addiw	s1,s1,32
    8020656a:	4601                	li	a2,0
    8020656c:	85a6                	mv	a1,s1
    8020656e:	854a                	mv	a0,s2
    80206570:	fffff097          	auipc	ra,0xfffff
    80206574:	e06080e7          	jalr	-506(ra) # 80205376 <reloc_clus>
    80206578:	f5750ee3          	beq	a0,s7,802064d4 <enext+0x42>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    8020657c:	02000793          	li	a5,32
    80206580:	0005071b          	sext.w	a4,a0
    80206584:	86d2                	mv	a3,s4
    80206586:	4601                	li	a2,0
    80206588:	4581                	li	a1,0
    8020658a:	10c92503          	lw	a0,268(s2)
    8020658e:	fffff097          	auipc	ra,0xfffff
    80206592:	ef0080e7          	jalr	-272(ra) # 8020547e <rw_clus>
    80206596:	2501                	sext.w	a0,a0
    80206598:	02000793          	li	a5,32
    8020659c:	06f51c63          	bne	a0,a5,80206614 <enext+0x182>
    802065a0:	f8044783          	lbu	a5,-128(s0)
    802065a4:	cbb5                	beqz	a5,80206618 <enext+0x186>
        if (de.lne.order == EMPTY_ENTRY) {
    802065a6:	f9878ce3          	beq	a5,s8,8020653e <enext+0xac>
        } else if (cnt) {
    802065aa:	f80b1ce3          	bnez	s6,80206542 <enext+0xb0>
        if (de.lne.attr == ATTR_LONG_NAME) {
    802065ae:	f8b44703          	lbu	a4,-117(s0)
    802065b2:	01971d63          	bne	a4,s9,802065cc <enext+0x13a>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    802065b6:	0bf7f713          	andi	a4,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    802065ba:	0407f793          	andi	a5,a5,64
    802065be:	d7d1                	beqz	a5,8020654a <enext+0xb8>
                *count = lcnt + 1;                              // plus the s-n-e;
    802065c0:	0017079b          	addiw	a5,a4,1
    802065c4:	00faa023          	sw	a5,0(s5)
                count = 0;
    802065c8:	4a81                	li	s5,0
    802065ca:	b741                	j	8020654a <enext+0xb8>
            if (count) {
    802065cc:	000a8c63          	beqz	s5,802065e4 <enext+0x152>
                *count = 1;
    802065d0:	4785                	li	a5,1
    802065d2:	00faa023          	sw	a5,0(s5)
                read_entry_name(ep->filename, &de);
    802065d6:	f8040593          	addi	a1,s0,-128
    802065da:	854e                	mv	a0,s3
    802065dc:	fffff097          	auipc	ra,0xfffff
    802065e0:	0fc080e7          	jalr	252(ra) # 802056d8 <read_entry_name>
    entry->attribute = d->sne.attr;
    802065e4:	f8b44783          	lbu	a5,-117(s0)
    802065e8:	10f98023          	sb	a5,256(s3)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    802065ec:	f9445783          	lhu	a5,-108(s0)
    802065f0:	0107979b          	slliw	a5,a5,0x10
    802065f4:	f9a45703          	lhu	a4,-102(s0)
    802065f8:	8fd9                	or	a5,a5,a4
    802065fa:	2781                	sext.w	a5,a5
    802065fc:	10f9a223          	sw	a5,260(s3)
    entry->file_size = d->sne.file_size;
    80206600:	f9c42703          	lw	a4,-100(s0)
    80206604:	10e9a423          	sw	a4,264(s3)
    entry->cur_clus = entry->first_clus;
    80206608:	10f9a623          	sw	a5,268(s3)
    entry->clus_cnt = 0;
    8020660c:	1009a823          	sw	zero,272(s3)
            return 1;
    80206610:	4505                	li	a0,1
}
    80206612:	b5c9                	j	802064d4 <enext+0x42>
            return -1;
    80206614:	557d                	li	a0,-1
    80206616:	bd7d                	j	802064d4 <enext+0x42>
    80206618:	557d                	li	a0,-1
    8020661a:	bd6d                	j	802064d4 <enext+0x42>

000000008020661c <dirlookup>:
 * @param   dp          entry of a directory file
 * @param   filename    target filename
 * @param   poff        offset of proper empty entry slots from the beginning of the dir
 */
struct dirent *dirlookup(struct dirent *dp, char *filename, uint *poff)
{
    8020661c:	711d                	addi	sp,sp,-96
    8020661e:	ec86                	sd	ra,88(sp)
    80206620:	e8a2                	sd	s0,80(sp)
    80206622:	e4a6                	sd	s1,72(sp)
    80206624:	e0ca                	sd	s2,64(sp)
    80206626:	fc4e                	sd	s3,56(sp)
    80206628:	f852                	sd	s4,48(sp)
    8020662a:	f456                	sd	s5,40(sp)
    8020662c:	f05a                	sd	s6,32(sp)
    8020662e:	ec5e                	sd	s7,24(sp)
    80206630:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206632:	10054783          	lbu	a5,256(a0)
    80206636:	8bc1                	andi	a5,a5,16
    80206638:	cbb1                	beqz	a5,8020668c <dirlookup+0x70>
    8020663a:	84aa                	mv	s1,a0
    8020663c:	89ae                	mv	s3,a1
    8020663e:	8ab2                	mv	s5,a2
        panic("dirlookup not DIR");
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    80206640:	0ff00613          	li	a2,255
    80206644:	00003597          	auipc	a1,0x3
    80206648:	71458593          	addi	a1,a1,1812 # 80209d58 <digits+0x9d8>
    8020664c:	854e                	mv	a0,s3
    8020664e:	ffffa097          	auipc	ra,0xffffa
    80206652:	1ec080e7          	jalr	492(ra) # 8020083a <strncmp>
    80206656:	c139                	beqz	a0,8020669c <dirlookup+0x80>
        return edup(dp);
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    80206658:	0ff00613          	li	a2,255
    8020665c:	00003597          	auipc	a1,0x3
    80206660:	70458593          	addi	a1,a1,1796 # 80209d60 <digits+0x9e0>
    80206664:	854e                	mv	a0,s3
    80206666:	ffffa097          	auipc	ra,0xffffa
    8020666a:	1d4080e7          	jalr	468(ra) # 8020083a <strncmp>
    8020666e:	e125                	bnez	a0,802066ce <dirlookup+0xb2>
        if (dp == &root) {
    80206670:	00018797          	auipc	a5,0x18
    80206674:	de078793          	addi	a5,a5,-544 # 8021e450 <root>
    80206678:	04f48463          	beq	s1,a5,802066c0 <dirlookup+0xa4>
            return edup(&root);
        }
        return edup(dp->parent);
    8020667c:	1204b503          	ld	a0,288(s1)
    80206680:	00000097          	auipc	ra,0x0
    80206684:	9b0080e7          	jalr	-1616(ra) # 80206030 <edup>
    80206688:	892a                	mv	s2,a0
    8020668a:	a839                	j	802066a8 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    8020668c:	00003517          	auipc	a0,0x3
    80206690:	6b450513          	addi	a0,a0,1716 # 80209d40 <digits+0x9c0>
    80206694:	ffffa097          	auipc	ra,0xffffa
    80206698:	ab0080e7          	jalr	-1360(ra) # 80200144 <panic>
        return edup(dp);
    8020669c:	8526                	mv	a0,s1
    8020669e:	00000097          	auipc	ra,0x0
    802066a2:	992080e7          	jalr	-1646(ra) # 80206030 <edup>
    802066a6:	892a                	mv	s2,a0
    if (poff) {
        *poff = off;
    }
    eput(ep);
    return NULL;
}
    802066a8:	854a                	mv	a0,s2
    802066aa:	60e6                	ld	ra,88(sp)
    802066ac:	6446                	ld	s0,80(sp)
    802066ae:	64a6                	ld	s1,72(sp)
    802066b0:	6906                	ld	s2,64(sp)
    802066b2:	79e2                	ld	s3,56(sp)
    802066b4:	7a42                	ld	s4,48(sp)
    802066b6:	7aa2                	ld	s5,40(sp)
    802066b8:	7b02                	ld	s6,32(sp)
    802066ba:	6be2                	ld	s7,24(sp)
    802066bc:	6125                	addi	sp,sp,96
    802066be:	8082                	ret
            return edup(&root);
    802066c0:	853e                	mv	a0,a5
    802066c2:	00000097          	auipc	ra,0x0
    802066c6:	96e080e7          	jalr	-1682(ra) # 80206030 <edup>
    802066ca:	892a                	mv	s2,a0
    802066cc:	bff1                	j	802066a8 <dirlookup+0x8c>
    if (dp->valid != 1) {
    802066ce:	11649703          	lh	a4,278(s1)
    802066d2:	4785                	li	a5,1
        return NULL;
    802066d4:	4901                	li	s2,0
    if (dp->valid != 1) {
    802066d6:	fcf719e3          	bne	a4,a5,802066a8 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    802066da:	85ce                	mv	a1,s3
    802066dc:	8526                	mv	a0,s1
    802066de:	fffff097          	auipc	ra,0xfffff
    802066e2:	eec080e7          	jalr	-276(ra) # 802055ca <eget>
    802066e6:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    802066e8:	11651703          	lh	a4,278(a0)
    802066ec:	4785                	li	a5,1
    802066ee:	faf70de3          	beq	a4,a5,802066a8 <dirlookup+0x8c>
    int len = strlen(filename);
    802066f2:	854e                	mv	a0,s3
    802066f4:	ffffa097          	auipc	ra,0xffffa
    802066f8:	1f2080e7          	jalr	498(ra) # 802008e6 <strlen>
    int count = 0;
    802066fc:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    80206700:	4601                	li	a2,0
    80206702:	4581                	li	a1,0
    80206704:	8526                	mv	a0,s1
    80206706:	fffff097          	auipc	ra,0xfffff
    8020670a:	c70080e7          	jalr	-912(ra) # 80205376 <reloc_clus>
    uint off = 0;
    8020670e:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    80206710:	fac40b93          	addi	s7,s0,-84
    80206714:	5b7d                	li	s6,-1
    80206716:	86de                	mv	a3,s7
    80206718:	8652                	mv	a2,s4
    8020671a:	85ca                	mv	a1,s2
    8020671c:	8526                	mv	a0,s1
    8020671e:	00000097          	auipc	ra,0x0
    80206722:	d74080e7          	jalr	-652(ra) # 80206492 <enext>
    80206726:	03650f63          	beq	a0,s6,80206764 <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    8020672a:	0ff00613          	li	a2,255
    8020672e:	85ca                	mv	a1,s2
    80206730:	854e                	mv	a0,s3
    80206732:	ffffa097          	auipc	ra,0xffffa
    80206736:	108080e7          	jalr	264(ra) # 8020083a <strncmp>
    8020673a:	c901                	beqz	a0,8020674a <dirlookup+0x12e>
        off += count << 5;
    8020673c:	fac42783          	lw	a5,-84(s0)
    80206740:	0057979b          	slliw	a5,a5,0x5
    80206744:	01478a3b          	addw	s4,a5,s4
    80206748:	b7f9                	j	80206716 <dirlookup+0xfa>
            ep->parent = edup(dp);
    8020674a:	8526                	mv	a0,s1
    8020674c:	00000097          	auipc	ra,0x0
    80206750:	8e4080e7          	jalr	-1820(ra) # 80206030 <edup>
    80206754:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    80206758:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    8020675c:	4785                	li	a5,1
    8020675e:	10f91b23          	sh	a5,278(s2)
            return ep;
    80206762:	b799                	j	802066a8 <dirlookup+0x8c>
    if (poff) {
    80206764:	000a8463          	beqz	s5,8020676c <dirlookup+0x150>
        *poff = off;
    80206768:	014aa023          	sw	s4,0(s5)
    eput(ep);
    8020676c:	854a                	mv	a0,s2
    8020676e:	00000097          	auipc	ra,0x0
    80206772:	ba4080e7          	jalr	-1116(ra) # 80206312 <eput>
    return NULL;
    80206776:	4901                	li	s2,0
    80206778:	bf05                	j	802066a8 <dirlookup+0x8c>

000000008020677a <ealloc>:
{
    8020677a:	715d                	addi	sp,sp,-80
    8020677c:	e486                	sd	ra,72(sp)
    8020677e:	e0a2                	sd	s0,64(sp)
    80206780:	fc26                	sd	s1,56(sp)
    80206782:	f84a                	sd	s2,48(sp)
    80206784:	f44e                	sd	s3,40(sp)
    80206786:	f052                	sd	s4,32(sp)
    80206788:	ec56                	sd	s5,24(sp)
    8020678a:	0880                	addi	s0,sp,80
    8020678c:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    8020678e:	10054783          	lbu	a5,256(a0)
    80206792:	8bc1                	andi	a5,a5,16
    80206794:	c7b1                	beqz	a5,802067e0 <ealloc+0x66>
    80206796:	852e                	mv	a0,a1
    80206798:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    8020679a:	11691703          	lh	a4,278(s2)
    8020679e:	4785                	li	a5,1
        return NULL;
    802067a0:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    802067a2:	02f71563          	bne	a4,a5,802067cc <ealloc+0x52>
    802067a6:	fffff097          	auipc	ra,0xfffff
    802067aa:	408080e7          	jalr	1032(ra) # 80205bae <formatname>
    802067ae:	89aa                	mv	s3,a0
    802067b0:	10050663          	beqz	a0,802068bc <ealloc+0x142>
    uint off = 0;
    802067b4:	fa042e23          	sw	zero,-68(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    802067b8:	fbc40613          	addi	a2,s0,-68
    802067bc:	85aa                	mv	a1,a0
    802067be:	854a                	mv	a0,s2
    802067c0:	00000097          	auipc	ra,0x0
    802067c4:	e5c080e7          	jalr	-420(ra) # 8020661c <dirlookup>
    802067c8:	84aa                	mv	s1,a0
    802067ca:	c11d                	beqz	a0,802067f0 <ealloc+0x76>
}
    802067cc:	8526                	mv	a0,s1
    802067ce:	60a6                	ld	ra,72(sp)
    802067d0:	6406                	ld	s0,64(sp)
    802067d2:	74e2                	ld	s1,56(sp)
    802067d4:	7942                	ld	s2,48(sp)
    802067d6:	79a2                	ld	s3,40(sp)
    802067d8:	7a02                	ld	s4,32(sp)
    802067da:	6ae2                	ld	s5,24(sp)
    802067dc:	6161                	addi	sp,sp,80
    802067de:	8082                	ret
        panic("ealloc not dir");
    802067e0:	00003517          	auipc	a0,0x3
    802067e4:	58850513          	addi	a0,a0,1416 # 80209d68 <digits+0x9e8>
    802067e8:	ffffa097          	auipc	ra,0xffffa
    802067ec:	95c080e7          	jalr	-1700(ra) # 80200144 <panic>
    ep = eget(dp, name);
    802067f0:	85ce                	mv	a1,s3
    802067f2:	854a                	mv	a0,s2
    802067f4:	fffff097          	auipc	ra,0xfffff
    802067f8:	dd6080e7          	jalr	-554(ra) # 802055ca <eget>
    802067fc:	84aa                	mv	s1,a0
    elock(ep);
    802067fe:	00000097          	auipc	ra,0x0
    80206802:	a90080e7          	jalr	-1392(ra) # 8020628e <elock>
    ep->attribute = attr;
    80206806:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    8020680a:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    8020680e:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    80206812:	854a                	mv	a0,s2
    80206814:	00000097          	auipc	ra,0x0
    80206818:	81c080e7          	jalr	-2020(ra) # 80206030 <edup>
    8020681c:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    80206820:	fbc42a83          	lw	s5,-68(s0)
    80206824:	1154ae23          	sw	s5,284(s1)
    ep->clus_cnt = 0;
    80206828:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    8020682c:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    80206830:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    80206834:	0ff00613          	li	a2,255
    80206838:	85ce                	mv	a1,s3
    8020683a:	8526                	mv	a0,s1
    8020683c:	ffffa097          	auipc	ra,0xffffa
    80206840:	03a080e7          	jalr	58(ra) # 80200876 <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    80206844:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    80206848:	47c1                	li	a5,16
    8020684a:	02fa0863          	beq	s4,a5,8020687a <ealloc+0x100>
        ep->attribute |= ATTR_ARCHIVE;
    8020684e:	1004c783          	lbu	a5,256(s1)
    80206852:	0207e793          	ori	a5,a5,32
    80206856:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    8020685a:	8656                	mv	a2,s5
    8020685c:	85a6                	mv	a1,s1
    8020685e:	854a                	mv	a0,s2
    80206860:	fffff097          	auipc	ra,0xfffff
    80206864:	406080e7          	jalr	1030(ra) # 80205c66 <emake>
    ep->valid = 1;
    80206868:	4785                	li	a5,1
    8020686a:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    8020686e:	8526                	mv	a0,s1
    80206870:	00000097          	auipc	ra,0x0
    80206874:	a54080e7          	jalr	-1452(ra) # 802062c4 <eunlock>
    return ep;
    80206878:	bf91                	j	802067cc <ealloc+0x52>
        ep->attribute |= ATTR_DIRECTORY;
    8020687a:	1004c783          	lbu	a5,256(s1)
    8020687e:	0107e793          	ori	a5,a5,16
    80206882:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    80206886:	11494503          	lbu	a0,276(s2)
    8020688a:	fffff097          	auipc	ra,0xfffff
    8020688e:	92a080e7          	jalr	-1750(ra) # 802051b4 <alloc_clus>
    80206892:	2501                	sext.w	a0,a0
    80206894:	10a4a223          	sw	a0,260(s1)
    80206898:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    8020689c:	4601                	li	a2,0
    8020689e:	85a6                	mv	a1,s1
    802068a0:	8526                	mv	a0,s1
    802068a2:	fffff097          	auipc	ra,0xfffff
    802068a6:	3c4080e7          	jalr	964(ra) # 80205c66 <emake>
        emake(ep, dp, 32);
    802068aa:	02000613          	li	a2,32
    802068ae:	85ca                	mv	a1,s2
    802068b0:	8526                	mv	a0,s1
    802068b2:	fffff097          	auipc	ra,0xfffff
    802068b6:	3b4080e7          	jalr	948(ra) # 80205c66 <emake>
    802068ba:	b745                	j	8020685a <ealloc+0xe0>
        return NULL;
    802068bc:	84aa                	mv	s1,a0
    802068be:	b739                	j	802067cc <ealloc+0x52>

00000000802068c0 <lookup_path>:
    return path;
}

// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    802068c0:	715d                	addi	sp,sp,-80
    802068c2:	e486                	sd	ra,72(sp)
    802068c4:	e0a2                	sd	s0,64(sp)
    802068c6:	fc26                	sd	s1,56(sp)
    802068c8:	f84a                	sd	s2,48(sp)
    802068ca:	f44e                	sd	s3,40(sp)
    802068cc:	f052                	sd	s4,32(sp)
    802068ce:	ec56                	sd	s5,24(sp)
    802068d0:	e85a                	sd	s6,16(sp)
    802068d2:	e45e                	sd	s7,8(sp)
    802068d4:	e062                	sd	s8,0(sp)
    802068d6:	0880                	addi	s0,sp,80
    802068d8:	892a                	mv	s2,a0
    802068da:	8b2e                	mv	s6,a1
    802068dc:	8ab2                	mv	s5,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    802068de:	00054783          	lbu	a5,0(a0)
    802068e2:	02f00713          	li	a4,47
    802068e6:	02e78663          	beq	a5,a4,80206912 <lookup_path+0x52>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    802068ea:	4a01                	li	s4,0
    } else if (*path != '\0') {
    802068ec:	cba1                	beqz	a5,8020693c <lookup_path+0x7c>
        entry = edup(myproc()->cwd);
    802068ee:	ffffb097          	auipc	ra,0xffffb
    802068f2:	14e080e7          	jalr	334(ra) # 80201a3c <myproc>
    802068f6:	15853503          	ld	a0,344(a0)
    802068fa:	fffff097          	auipc	ra,0xfffff
    802068fe:	736080e7          	jalr	1846(ra) # 80206030 <edup>
    80206902:	8a2a                	mv	s4,a0
    while (*path == '/') {
    80206904:	02f00993          	li	s3,47
    80206908:	0ff00b93          	li	s7,255
    8020690c:	0ff00c13          	li	s8,255
    80206910:	a0e5                	j	802069f8 <lookup_path+0x138>
        entry = edup(&root);
    80206912:	00018517          	auipc	a0,0x18
    80206916:	b3e50513          	addi	a0,a0,-1218 # 8021e450 <root>
    8020691a:	fffff097          	auipc	ra,0xfffff
    8020691e:	716080e7          	jalr	1814(ra) # 80206030 <edup>
    80206922:	8a2a                	mv	s4,a0
    80206924:	b7c5                	j	80206904 <lookup_path+0x44>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    80206926:	8552                	mv	a0,s4
    80206928:	00000097          	auipc	ra,0x0
    8020692c:	99c080e7          	jalr	-1636(ra) # 802062c4 <eunlock>
            eput(entry);
    80206930:	8552                	mv	a0,s4
    80206932:	00000097          	auipc	ra,0x0
    80206936:	9e0080e7          	jalr	-1568(ra) # 80206312 <eput>
            return NULL;
    8020693a:	4a01                	li	s4,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    8020693c:	8552                	mv	a0,s4
    8020693e:	60a6                	ld	ra,72(sp)
    80206940:	6406                	ld	s0,64(sp)
    80206942:	74e2                	ld	s1,56(sp)
    80206944:	7942                	ld	s2,48(sp)
    80206946:	79a2                	ld	s3,40(sp)
    80206948:	7a02                	ld	s4,32(sp)
    8020694a:	6ae2                	ld	s5,24(sp)
    8020694c:	6b42                	ld	s6,16(sp)
    8020694e:	6ba2                	ld	s7,8(sp)
    80206950:	6c02                	ld	s8,0(sp)
    80206952:	6161                	addi	sp,sp,80
    80206954:	8082                	ret
            eunlock(entry);
    80206956:	8552                	mv	a0,s4
    80206958:	00000097          	auipc	ra,0x0
    8020695c:	96c080e7          	jalr	-1684(ra) # 802062c4 <eunlock>
            return entry;
    80206960:	bff1                	j	8020693c <lookup_path+0x7c>
            eunlock(entry);
    80206962:	8552                	mv	a0,s4
    80206964:	00000097          	auipc	ra,0x0
    80206968:	960080e7          	jalr	-1696(ra) # 802062c4 <eunlock>
            eput(entry);
    8020696c:	8552                	mv	a0,s4
    8020696e:	00000097          	auipc	ra,0x0
    80206972:	9a4080e7          	jalr	-1628(ra) # 80206312 <eput>
            return NULL;
    80206976:	8a4a                	mv	s4,s2
    80206978:	b7d1                	j	8020693c <lookup_path+0x7c>
    int len = path - s;
    8020697a:	412487b3          	sub	a5,s1,s2
    8020697e:	863e                	mv	a2,a5
    80206980:	2781                	sext.w	a5,a5
    80206982:	00fbd363          	bge	s7,a5,80206988 <lookup_path+0xc8>
    80206986:	8662                	mv	a2,s8
    80206988:	0006079b          	sext.w	a5,a2
    name[len] = 0;
    8020698c:	97d6                	add	a5,a5,s5
    8020698e:	00078023          	sb	zero,0(a5)
    memmove(name, s, len);
    80206992:	2601                	sext.w	a2,a2
    80206994:	85ca                	mv	a1,s2
    80206996:	8556                	mv	a0,s5
    80206998:	ffffa097          	auipc	ra,0xffffa
    8020699c:	e26080e7          	jalr	-474(ra) # 802007be <memmove>
    while (*path == '/') {
    802069a0:	0004c783          	lbu	a5,0(s1)
    802069a4:	01379763          	bne	a5,s3,802069b2 <lookup_path+0xf2>
        path++;
    802069a8:	0485                	addi	s1,s1,1
    while (*path == '/') {
    802069aa:	0004c783          	lbu	a5,0(s1)
    802069ae:	ff378de3          	beq	a5,s3,802069a8 <lookup_path+0xe8>
        elock(entry);
    802069b2:	8552                	mv	a0,s4
    802069b4:	00000097          	auipc	ra,0x0
    802069b8:	8da080e7          	jalr	-1830(ra) # 8020628e <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    802069bc:	100a4783          	lbu	a5,256(s4)
    802069c0:	8bc1                	andi	a5,a5,16
    802069c2:	d3b5                	beqz	a5,80206926 <lookup_path+0x66>
        if (parent && *path == '\0') {
    802069c4:	000b0563          	beqz	s6,802069ce <lookup_path+0x10e>
    802069c8:	0004c783          	lbu	a5,0(s1)
    802069cc:	d7c9                	beqz	a5,80206956 <lookup_path+0x96>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    802069ce:	4601                	li	a2,0
    802069d0:	85d6                	mv	a1,s5
    802069d2:	8552                	mv	a0,s4
    802069d4:	00000097          	auipc	ra,0x0
    802069d8:	c48080e7          	jalr	-952(ra) # 8020661c <dirlookup>
    802069dc:	892a                	mv	s2,a0
    802069de:	d151                	beqz	a0,80206962 <lookup_path+0xa2>
        eunlock(entry);
    802069e0:	8552                	mv	a0,s4
    802069e2:	00000097          	auipc	ra,0x0
    802069e6:	8e2080e7          	jalr	-1822(ra) # 802062c4 <eunlock>
        eput(entry);
    802069ea:	8552                	mv	a0,s4
    802069ec:	00000097          	auipc	ra,0x0
    802069f0:	926080e7          	jalr	-1754(ra) # 80206312 <eput>
        entry = next;
    802069f4:	8a4a                	mv	s4,s2
        eput(entry);
    802069f6:	8926                	mv	s2,s1
    while (*path == '/') {
    802069f8:	00094783          	lbu	a5,0(s2)
    802069fc:	03379363          	bne	a5,s3,80206a22 <lookup_path+0x162>
        path++;
    80206a00:	0905                	addi	s2,s2,1
    while (*path == '/') {
    80206a02:	00094783          	lbu	a5,0(s2)
    80206a06:	ff378de3          	beq	a5,s3,80206a00 <lookup_path+0x140>
    if (*path == 0) { return NULL; }
    80206a0a:	cf89                	beqz	a5,80206a24 <lookup_path+0x164>
        path++;
    80206a0c:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    80206a0e:	f73786e3          	beq	a5,s3,8020697a <lookup_path+0xba>
        eput(entry);
    80206a12:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    80206a14:	d3bd                	beqz	a5,8020697a <lookup_path+0xba>
        path++;
    80206a16:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    80206a18:	0004c783          	lbu	a5,0(s1)
    80206a1c:	ff379ce3          	bne	a5,s3,80206a14 <lookup_path+0x154>
    80206a20:	bfa9                	j	8020697a <lookup_path+0xba>
    if (*path == 0) { return NULL; }
    80206a22:	fbe5                	bnez	a5,80206a12 <lookup_path+0x152>
    if (parent) {
    80206a24:	f00b0ce3          	beqz	s6,8020693c <lookup_path+0x7c>
        eput(entry);
    80206a28:	8552                	mv	a0,s4
    80206a2a:	00000097          	auipc	ra,0x0
    80206a2e:	8e8080e7          	jalr	-1816(ra) # 80206312 <eput>
        return NULL;
    80206a32:	4a01                	li	s4,0
    80206a34:	b721                	j	8020693c <lookup_path+0x7c>

0000000080206a36 <ename>:

struct dirent *ename(char *path)
{
    80206a36:	716d                	addi	sp,sp,-272
    80206a38:	e606                	sd	ra,264(sp)
    80206a3a:	e222                	sd	s0,256(sp)
    80206a3c:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    80206a3e:	ef040613          	addi	a2,s0,-272
    80206a42:	4581                	li	a1,0
    80206a44:	00000097          	auipc	ra,0x0
    80206a48:	e7c080e7          	jalr	-388(ra) # 802068c0 <lookup_path>
}
    80206a4c:	60b2                	ld	ra,264(sp)
    80206a4e:	6412                	ld	s0,256(sp)
    80206a50:	6151                	addi	sp,sp,272
    80206a52:	8082                	ret

0000000080206a54 <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    80206a54:	1141                	addi	sp,sp,-16
    80206a56:	e406                	sd	ra,8(sp)
    80206a58:	e022                	sd	s0,0(sp)
    80206a5a:	0800                	addi	s0,sp,16
    80206a5c:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    80206a5e:	4585                	li	a1,1
    80206a60:	00000097          	auipc	ra,0x0
    80206a64:	e60080e7          	jalr	-416(ra) # 802068c0 <lookup_path>
}
    80206a68:	60a2                	ld	ra,8(sp)
    80206a6a:	6402                	ld	s0,0(sp)
    80206a6c:	0141                	addi	sp,sp,16
    80206a6e:	8082                	ret

0000000080206a70 <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    80206a70:	1141                	addi	sp,sp,-16
    80206a72:	e422                	sd	s0,8(sp)
    80206a74:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    80206a76:	00fc37b7          	lui	a5,0xfc3
    80206a7a:	07ba                	slli	a5,a5,0xe
    80206a7c:	4705                	li	a4,1
    80206a7e:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    80206a80:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    80206a82:	6422                	ld	s0,8(sp)
    80206a84:	0141                	addi	sp,sp,16
    80206a86:	8082                	ret

0000000080206a88 <plicinithart>:

void
plicinithart(void)
{
    80206a88:	1141                	addi	sp,sp,-16
    80206a8a:	e406                	sd	ra,8(sp)
    80206a8c:	e022                	sd	s0,0(sp)
    80206a8e:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80206a90:	ffffb097          	auipc	ra,0xffffb
    80206a94:	f80080e7          	jalr	-128(ra) # 80201a10 <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    80206a98:	0085171b          	slliw	a4,a0,0x8
    80206a9c:	01f867b7          	lui	a5,0x1f86
    80206aa0:	0785                	addi	a5,a5,1 # 1f86001 <_entry-0x7e279fff>
    80206aa2:	07b6                	slli	a5,a5,0xd
    80206aa4:	97ba                	add	a5,a5,a4
    80206aa6:	40200713          	li	a4,1026
    80206aaa:	08e7a023          	sw	a4,128(a5)
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80206aae:	00d5151b          	slliw	a0,a0,0xd
    80206ab2:	03f0c7b7          	lui	a5,0x3f0c
    80206ab6:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80206aba:	07b2                	slli	a5,a5,0xc
    80206abc:	97aa                	add	a5,a5,a0
    80206abe:	0007a023          	sw	zero,0(a5)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    80206ac2:	60a2                	ld	ra,8(sp)
    80206ac4:	6402                	ld	s0,0(sp)
    80206ac6:	0141                	addi	sp,sp,16
    80206ac8:	8082                	ret

0000000080206aca <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80206aca:	1141                	addi	sp,sp,-16
    80206acc:	e406                	sd	ra,8(sp)
    80206ace:	e022                	sd	s0,0(sp)
    80206ad0:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80206ad2:	ffffb097          	auipc	ra,0xffffb
    80206ad6:	f3e080e7          	jalr	-194(ra) # 80201a10 <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    80206ada:	00d5151b          	slliw	a0,a0,0xd
    80206ade:	03f0c7b7          	lui	a5,0x3f0c
    80206ae2:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80206ae6:	07b2                	slli	a5,a5,0xc
    80206ae8:	97aa                	add	a5,a5,a0
  #endif
  return irq;
}
    80206aea:	43c8                	lw	a0,4(a5)
    80206aec:	60a2                	ld	ra,8(sp)
    80206aee:	6402                	ld	s0,0(sp)
    80206af0:	0141                	addi	sp,sp,16
    80206af2:	8082                	ret

0000000080206af4 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80206af4:	1101                	addi	sp,sp,-32
    80206af6:	ec06                	sd	ra,24(sp)
    80206af8:	e822                	sd	s0,16(sp)
    80206afa:	e426                	sd	s1,8(sp)
    80206afc:	1000                	addi	s0,sp,32
    80206afe:	84aa                	mv	s1,a0
  int hart = cpuid();
    80206b00:	ffffb097          	auipc	ra,0xffffb
    80206b04:	f10080e7          	jalr	-240(ra) # 80201a10 <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80206b08:	00d5151b          	slliw	a0,a0,0xd
    80206b0c:	03f0c7b7          	lui	a5,0x3f0c
    80206b10:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80206b14:	07b2                	slli	a5,a5,0xc
    80206b16:	97aa                	add	a5,a5,a0
    80206b18:	c3c4                	sw	s1,4(a5)
  #endif
}
    80206b1a:	60e2                	ld	ra,24(sp)
    80206b1c:	6442                	ld	s0,16(sp)
    80206b1e:	64a2                	ld	s1,8(sp)
    80206b20:	6105                	addi	sp,sp,32
    80206b22:	8082                	ret

0000000080206b24 <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    80206b24:	715d                	addi	sp,sp,-80
    80206b26:	e486                	sd	ra,72(sp)
    80206b28:	e0a2                	sd	s0,64(sp)
    80206b2a:	fc26                	sd	s1,56(sp)
    80206b2c:	f84a                	sd	s2,48(sp)
    80206b2e:	f44e                	sd	s3,40(sp)
    80206b30:	f052                	sd	s4,32(sp)
    80206b32:	ec56                	sd	s5,24(sp)
    80206b34:	e85a                	sd	s6,16(sp)
    80206b36:	0880                	addi	s0,sp,80
    80206b38:	8a2a                	mv	s4,a0
    80206b3a:	84ae                	mv	s1,a1
    80206b3c:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    80206b3e:	0001c517          	auipc	a0,0x1c
    80206b42:	0e250513          	addi	a0,a0,226 # 80222c20 <cons>
    80206b46:	ffffa097          	auipc	ra,0xffffa
    80206b4a:	b80080e7          	jalr	-1152(ra) # 802006c6 <acquire>
  for(i = 0; i < n; i++){
    80206b4e:	07305063          	blez	s3,80206bae <consolewrite+0x8a>
    80206b52:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    80206b54:	fbf40b13          	addi	s6,s0,-65
    80206b58:	5afd                	li	s5,-1
    80206b5a:	4685                	li	a3,1
    80206b5c:	8626                	mv	a2,s1
    80206b5e:	85d2                	mv	a1,s4
    80206b60:	855a                	mv	a0,s6
    80206b62:	ffffc097          	auipc	ra,0xffffc
    80206b66:	a0a080e7          	jalr	-1526(ra) # 8020256c <either_copyin>
    80206b6a:	01550f63          	beq	a0,s5,80206b88 <consolewrite+0x64>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    80206b6e:	fbf44503          	lbu	a0,-65(s0)
    80206b72:	4581                	li	a1,0
    80206b74:	4601                	li	a2,0
    80206b76:	4681                	li	a3,0
    80206b78:	4885                	li	a7,1
    80206b7a:	00000073          	ecall
  for(i = 0; i < n; i++){
    80206b7e:	2905                	addiw	s2,s2,1
    80206b80:	0485                	addi	s1,s1,1
    80206b82:	fd299ce3          	bne	s3,s2,80206b5a <consolewrite+0x36>
    80206b86:	894e                	mv	s2,s3
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    80206b88:	0001c517          	auipc	a0,0x1c
    80206b8c:	09850513          	addi	a0,a0,152 # 80222c20 <cons>
    80206b90:	ffffa097          	auipc	ra,0xffffa
    80206b94:	b8a080e7          	jalr	-1142(ra) # 8020071a <release>

  return i;
}
    80206b98:	854a                	mv	a0,s2
    80206b9a:	60a6                	ld	ra,72(sp)
    80206b9c:	6406                	ld	s0,64(sp)
    80206b9e:	74e2                	ld	s1,56(sp)
    80206ba0:	7942                	ld	s2,48(sp)
    80206ba2:	79a2                	ld	s3,40(sp)
    80206ba4:	7a02                	ld	s4,32(sp)
    80206ba6:	6ae2                	ld	s5,24(sp)
    80206ba8:	6b42                	ld	s6,16(sp)
    80206baa:	6161                	addi	sp,sp,80
    80206bac:	8082                	ret
  for(i = 0; i < n; i++){
    80206bae:	4901                	li	s2,0
    80206bb0:	bfe1                	j	80206b88 <consolewrite+0x64>

0000000080206bb2 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80206bb2:	7119                	addi	sp,sp,-128
    80206bb4:	fc86                	sd	ra,120(sp)
    80206bb6:	f8a2                	sd	s0,112(sp)
    80206bb8:	f4a6                	sd	s1,104(sp)
    80206bba:	f0ca                	sd	s2,96(sp)
    80206bbc:	ecce                	sd	s3,88(sp)
    80206bbe:	e8d2                	sd	s4,80(sp)
    80206bc0:	e4d6                	sd	s5,72(sp)
    80206bc2:	e0da                	sd	s6,64(sp)
    80206bc4:	fc5e                	sd	s7,56(sp)
    80206bc6:	f862                	sd	s8,48(sp)
    80206bc8:	f466                	sd	s9,40(sp)
    80206bca:	f06a                	sd	s10,32(sp)
    80206bcc:	ec6e                	sd	s11,24(sp)
    80206bce:	0100                	addi	s0,sp,128
    80206bd0:	8aaa                	mv	s5,a0
    80206bd2:	8a2e                	mv	s4,a1
    80206bd4:	89b2                	mv	s3,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    80206bd6:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    80206bda:	0001c517          	auipc	a0,0x1c
    80206bde:	04650513          	addi	a0,a0,70 # 80222c20 <cons>
    80206be2:	ffffa097          	auipc	ra,0xffffa
    80206be6:	ae4080e7          	jalr	-1308(ra) # 802006c6 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80206bea:	0001c497          	auipc	s1,0x1c
    80206bee:	03648493          	addi	s1,s1,54 # 80222c20 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    80206bf2:	0001c917          	auipc	s2,0x1c
    80206bf6:	0c690913          	addi	s2,s2,198 # 80222cb8 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80206bfa:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80206bfc:	f8f40d13          	addi	s10,s0,-113
    80206c00:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    80206c02:	4da9                	li	s11,10
  while(n > 0){
    80206c04:	07305763          	blez	s3,80206c72 <consoleread+0xc0>
    while(cons.r == cons.w){
    80206c08:	0984a783          	lw	a5,152(s1)
    80206c0c:	09c4a703          	lw	a4,156(s1)
    80206c10:	02f71463          	bne	a4,a5,80206c38 <consoleread+0x86>
      if(myproc()->killed){
    80206c14:	ffffb097          	auipc	ra,0xffffb
    80206c18:	e28080e7          	jalr	-472(ra) # 80201a3c <myproc>
    80206c1c:	591c                	lw	a5,48(a0)
    80206c1e:	e7ad                	bnez	a5,80206c88 <consoleread+0xd6>
      sleep(&cons.r, &cons.lock);
    80206c20:	85a6                	mv	a1,s1
    80206c22:	854a                	mv	a0,s2
    80206c24:	ffffb097          	auipc	ra,0xffffb
    80206c28:	6bc080e7          	jalr	1724(ra) # 802022e0 <sleep>
    while(cons.r == cons.w){
    80206c2c:	0984a783          	lw	a5,152(s1)
    80206c30:	09c4a703          	lw	a4,156(s1)
    80206c34:	fef700e3          	beq	a4,a5,80206c14 <consoleread+0x62>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80206c38:	0017871b          	addiw	a4,a5,1
    80206c3c:	08e4ac23          	sw	a4,152(s1)
    80206c40:	07f7f713          	andi	a4,a5,127
    80206c44:	9726                	add	a4,a4,s1
    80206c46:	01874703          	lbu	a4,24(a4)
    80206c4a:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    80206c4e:	078b8563          	beq	s7,s8,80206cb8 <consoleread+0x106>
    cbuf = c;
    80206c52:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80206c56:	4685                	li	a3,1
    80206c58:	866a                	mv	a2,s10
    80206c5a:	85d2                	mv	a1,s4
    80206c5c:	8556                	mv	a0,s5
    80206c5e:	ffffc097          	auipc	ra,0xffffc
    80206c62:	8d8080e7          	jalr	-1832(ra) # 80202536 <either_copyout>
    80206c66:	01950663          	beq	a0,s9,80206c72 <consoleread+0xc0>
    dst++;
    80206c6a:	0a05                	addi	s4,s4,1
    --n;
    80206c6c:	39fd                	addiw	s3,s3,-1
    if(c == '\n'){
    80206c6e:	f9bb9be3          	bne	s7,s11,80206c04 <consoleread+0x52>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    80206c72:	0001c517          	auipc	a0,0x1c
    80206c76:	fae50513          	addi	a0,a0,-82 # 80222c20 <cons>
    80206c7a:	ffffa097          	auipc	ra,0xffffa
    80206c7e:	aa0080e7          	jalr	-1376(ra) # 8020071a <release>

  return target - n;
    80206c82:	413b053b          	subw	a0,s6,s3
    80206c86:	a811                	j	80206c9a <consoleread+0xe8>
        release(&cons.lock);
    80206c88:	0001c517          	auipc	a0,0x1c
    80206c8c:	f9850513          	addi	a0,a0,-104 # 80222c20 <cons>
    80206c90:	ffffa097          	auipc	ra,0xffffa
    80206c94:	a8a080e7          	jalr	-1398(ra) # 8020071a <release>
        return -1;
    80206c98:	557d                	li	a0,-1
}
    80206c9a:	70e6                	ld	ra,120(sp)
    80206c9c:	7446                	ld	s0,112(sp)
    80206c9e:	74a6                	ld	s1,104(sp)
    80206ca0:	7906                	ld	s2,96(sp)
    80206ca2:	69e6                	ld	s3,88(sp)
    80206ca4:	6a46                	ld	s4,80(sp)
    80206ca6:	6aa6                	ld	s5,72(sp)
    80206ca8:	6b06                	ld	s6,64(sp)
    80206caa:	7be2                	ld	s7,56(sp)
    80206cac:	7c42                	ld	s8,48(sp)
    80206cae:	7ca2                	ld	s9,40(sp)
    80206cb0:	7d02                	ld	s10,32(sp)
    80206cb2:	6de2                	ld	s11,24(sp)
    80206cb4:	6109                	addi	sp,sp,128
    80206cb6:	8082                	ret
      if(n < target){
    80206cb8:	0009871b          	sext.w	a4,s3
    80206cbc:	fb677be3          	bgeu	a4,s6,80206c72 <consoleread+0xc0>
        cons.r--;
    80206cc0:	0001c717          	auipc	a4,0x1c
    80206cc4:	fef72c23          	sw	a5,-8(a4) # 80222cb8 <cons+0x98>
    80206cc8:	b76d                	j	80206c72 <consoleread+0xc0>

0000000080206cca <consputc>:
void consputc(int c) {
    80206cca:	1141                	addi	sp,sp,-16
    80206ccc:	e422                	sd	s0,8(sp)
    80206cce:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    80206cd0:	10000793          	li	a5,256
    80206cd4:	00f50b63          	beq	a0,a5,80206cea <consputc+0x20>
    80206cd8:	4581                	li	a1,0
    80206cda:	4601                	li	a2,0
    80206cdc:	4681                	li	a3,0
    80206cde:	4885                	li	a7,1
    80206ce0:	00000073          	ecall
}
    80206ce4:	6422                	ld	s0,8(sp)
    80206ce6:	0141                	addi	sp,sp,16
    80206ce8:	8082                	ret
    80206cea:	4521                	li	a0,8
    80206cec:	4581                	li	a1,0
    80206cee:	4601                	li	a2,0
    80206cf0:	4681                	li	a3,0
    80206cf2:	4885                	li	a7,1
    80206cf4:	00000073          	ecall
    80206cf8:	02000513          	li	a0,32
    80206cfc:	00000073          	ecall
    80206d00:	4521                	li	a0,8
    80206d02:	00000073          	ecall
}
    80206d06:	bff9                	j	80206ce4 <consputc+0x1a>

0000000080206d08 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    80206d08:	1101                	addi	sp,sp,-32
    80206d0a:	ec06                	sd	ra,24(sp)
    80206d0c:	e822                	sd	s0,16(sp)
    80206d0e:	e426                	sd	s1,8(sp)
    80206d10:	e04a                	sd	s2,0(sp)
    80206d12:	1000                	addi	s0,sp,32
    80206d14:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    80206d16:	0001c517          	auipc	a0,0x1c
    80206d1a:	f0a50513          	addi	a0,a0,-246 # 80222c20 <cons>
    80206d1e:	ffffa097          	auipc	ra,0xffffa
    80206d22:	9a8080e7          	jalr	-1624(ra) # 802006c6 <acquire>

  switch(c){
    80206d26:	47d5                	li	a5,21
    80206d28:	0af48663          	beq	s1,a5,80206dd4 <consoleintr+0xcc>
    80206d2c:	0297ca63          	blt	a5,s1,80206d60 <consoleintr+0x58>
    80206d30:	47a1                	li	a5,8
    80206d32:	0ef48763          	beq	s1,a5,80206e20 <consoleintr+0x118>
    80206d36:	47c1                	li	a5,16
    80206d38:	10f49a63          	bne	s1,a5,80206e4c <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    80206d3c:	ffffc097          	auipc	ra,0xffffc
    80206d40:	864080e7          	jalr	-1948(ra) # 802025a0 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    80206d44:	0001c517          	auipc	a0,0x1c
    80206d48:	edc50513          	addi	a0,a0,-292 # 80222c20 <cons>
    80206d4c:	ffffa097          	auipc	ra,0xffffa
    80206d50:	9ce080e7          	jalr	-1586(ra) # 8020071a <release>
}
    80206d54:	60e2                	ld	ra,24(sp)
    80206d56:	6442                	ld	s0,16(sp)
    80206d58:	64a2                	ld	s1,8(sp)
    80206d5a:	6902                	ld	s2,0(sp)
    80206d5c:	6105                	addi	sp,sp,32
    80206d5e:	8082                	ret
  switch(c){
    80206d60:	07f00793          	li	a5,127
    80206d64:	0af48e63          	beq	s1,a5,80206e20 <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80206d68:	0001c717          	auipc	a4,0x1c
    80206d6c:	eb870713          	addi	a4,a4,-328 # 80222c20 <cons>
    80206d70:	0a072783          	lw	a5,160(a4)
    80206d74:	09872703          	lw	a4,152(a4)
    80206d78:	9f99                	subw	a5,a5,a4
    80206d7a:	07f00713          	li	a4,127
    80206d7e:	fcf763e3          	bltu	a4,a5,80206d44 <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    80206d82:	47b5                	li	a5,13
    80206d84:	0cf48763          	beq	s1,a5,80206e52 <consoleintr+0x14a>
      consputc(c);
    80206d88:	8526                	mv	a0,s1
    80206d8a:	00000097          	auipc	ra,0x0
    80206d8e:	f40080e7          	jalr	-192(ra) # 80206cca <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80206d92:	0001c797          	auipc	a5,0x1c
    80206d96:	e8e78793          	addi	a5,a5,-370 # 80222c20 <cons>
    80206d9a:	0a07a703          	lw	a4,160(a5)
    80206d9e:	0017069b          	addiw	a3,a4,1
    80206da2:	0006861b          	sext.w	a2,a3
    80206da6:	0ad7a023          	sw	a3,160(a5)
    80206daa:	07f77713          	andi	a4,a4,127
    80206dae:	97ba                	add	a5,a5,a4
    80206db0:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    80206db4:	47a9                	li	a5,10
    80206db6:	0cf48563          	beq	s1,a5,80206e80 <consoleintr+0x178>
    80206dba:	4791                	li	a5,4
    80206dbc:	0cf48263          	beq	s1,a5,80206e80 <consoleintr+0x178>
    80206dc0:	0001c797          	auipc	a5,0x1c
    80206dc4:	ef87a783          	lw	a5,-264(a5) # 80222cb8 <cons+0x98>
    80206dc8:	0807879b          	addiw	a5,a5,128
    80206dcc:	f6f61ce3          	bne	a2,a5,80206d44 <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80206dd0:	863e                	mv	a2,a5
    80206dd2:	a07d                	j	80206e80 <consoleintr+0x178>
    while(cons.e != cons.w &&
    80206dd4:	0001c717          	auipc	a4,0x1c
    80206dd8:	e4c70713          	addi	a4,a4,-436 # 80222c20 <cons>
    80206ddc:	0a072783          	lw	a5,160(a4)
    80206de0:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80206de4:	0001c497          	auipc	s1,0x1c
    80206de8:	e3c48493          	addi	s1,s1,-452 # 80222c20 <cons>
    while(cons.e != cons.w &&
    80206dec:	4929                	li	s2,10
    80206dee:	f4f70be3          	beq	a4,a5,80206d44 <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80206df2:	37fd                	addiw	a5,a5,-1
    80206df4:	07f7f713          	andi	a4,a5,127
    80206df8:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    80206dfa:	01874703          	lbu	a4,24(a4)
    80206dfe:	f52703e3          	beq	a4,s2,80206d44 <consoleintr+0x3c>
      cons.e--;
    80206e02:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    80206e06:	10000513          	li	a0,256
    80206e0a:	00000097          	auipc	ra,0x0
    80206e0e:	ec0080e7          	jalr	-320(ra) # 80206cca <consputc>
    while(cons.e != cons.w &&
    80206e12:	0a04a783          	lw	a5,160(s1)
    80206e16:	09c4a703          	lw	a4,156(s1)
    80206e1a:	fcf71ce3          	bne	a4,a5,80206df2 <consoleintr+0xea>
    80206e1e:	b71d                	j	80206d44 <consoleintr+0x3c>
    if(cons.e != cons.w){
    80206e20:	0001c717          	auipc	a4,0x1c
    80206e24:	e0070713          	addi	a4,a4,-512 # 80222c20 <cons>
    80206e28:	0a072783          	lw	a5,160(a4)
    80206e2c:	09c72703          	lw	a4,156(a4)
    80206e30:	f0f70ae3          	beq	a4,a5,80206d44 <consoleintr+0x3c>
      cons.e--;
    80206e34:	37fd                	addiw	a5,a5,-1
    80206e36:	0001c717          	auipc	a4,0x1c
    80206e3a:	e8f72523          	sw	a5,-374(a4) # 80222cc0 <cons+0xa0>
      consputc(BACKSPACE);
    80206e3e:	10000513          	li	a0,256
    80206e42:	00000097          	auipc	ra,0x0
    80206e46:	e88080e7          	jalr	-376(ra) # 80206cca <consputc>
    80206e4a:	bded                	j	80206d44 <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80206e4c:	ee048ce3          	beqz	s1,80206d44 <consoleintr+0x3c>
    80206e50:	bf21                	j	80206d68 <consoleintr+0x60>
      consputc(c);
    80206e52:	4529                	li	a0,10
    80206e54:	00000097          	auipc	ra,0x0
    80206e58:	e76080e7          	jalr	-394(ra) # 80206cca <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80206e5c:	0001c797          	auipc	a5,0x1c
    80206e60:	dc478793          	addi	a5,a5,-572 # 80222c20 <cons>
    80206e64:	0a07a703          	lw	a4,160(a5)
    80206e68:	0017069b          	addiw	a3,a4,1
    80206e6c:	0006861b          	sext.w	a2,a3
    80206e70:	0ad7a023          	sw	a3,160(a5)
    80206e74:	07f77713          	andi	a4,a4,127
    80206e78:	97ba                	add	a5,a5,a4
    80206e7a:	4729                	li	a4,10
    80206e7c:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    80206e80:	0001c797          	auipc	a5,0x1c
    80206e84:	e2c7ae23          	sw	a2,-452(a5) # 80222cbc <cons+0x9c>
        wakeup(&cons.r);
    80206e88:	0001c517          	auipc	a0,0x1c
    80206e8c:	e3050513          	addi	a0,a0,-464 # 80222cb8 <cons+0x98>
    80206e90:	ffffb097          	auipc	ra,0xffffb
    80206e94:	5cc080e7          	jalr	1484(ra) # 8020245c <wakeup>
    80206e98:	b575                	j	80206d44 <consoleintr+0x3c>

0000000080206e9a <consoleinit>:

void
consoleinit(void)
{
    80206e9a:	1101                	addi	sp,sp,-32
    80206e9c:	ec06                	sd	ra,24(sp)
    80206e9e:	e822                	sd	s0,16(sp)
    80206ea0:	e426                	sd	s1,8(sp)
    80206ea2:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    80206ea4:	0001c497          	auipc	s1,0x1c
    80206ea8:	d7c48493          	addi	s1,s1,-644 # 80222c20 <cons>
    80206eac:	00003597          	auipc	a1,0x3
    80206eb0:	ecc58593          	addi	a1,a1,-308 # 80209d78 <digits+0x9f8>
    80206eb4:	8526                	mv	a0,s1
    80206eb6:	ffff9097          	auipc	ra,0xffff9
    80206eba:	7cc080e7          	jalr	1996(ra) # 80200682 <initlock>

  cons.e = cons.w = cons.r = 0;
    80206ebe:	0804ac23          	sw	zero,152(s1)
    80206ec2:	0804ae23          	sw	zero,156(s1)
    80206ec6:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80206eca:	00005797          	auipc	a5,0x5
    80206ece:	bc67b783          	ld	a5,-1082(a5) # 8020ba90 <_GLOBAL_OFFSET_TABLE_+0x58>
    80206ed2:	00000717          	auipc	a4,0x0
    80206ed6:	ce070713          	addi	a4,a4,-800 # 80206bb2 <consoleread>
    80206eda:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    80206edc:	00000717          	auipc	a4,0x0
    80206ee0:	c4870713          	addi	a4,a4,-952 # 80206b24 <consolewrite>
    80206ee4:	ef98                	sd	a4,24(a5)
}
    80206ee6:	60e2                	ld	ra,24(sp)
    80206ee8:	6442                	ld	s0,16(sp)
    80206eea:	64a2                	ld	s1,8(sp)
    80206eec:	6105                	addi	sp,sp,32
    80206eee:	8082                	ret

0000000080206ef0 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    80206ef0:	1141                	addi	sp,sp,-16
    80206ef2:	e406                	sd	ra,8(sp)
    80206ef4:	e022                	sd	s0,0(sp)
    80206ef6:	0800                	addi	s0,sp,16
  if(i >= NUM)
    80206ef8:	479d                	li	a5,7
    80206efa:	04a7cb63          	blt	a5,a0,80206f50 <free_desc+0x60>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    80206efe:	0001c717          	auipc	a4,0x1c
    80206f02:	10270713          	addi	a4,a4,258 # 80223000 <disk>
    80206f06:	972a                	add	a4,a4,a0
    80206f08:	6789                	lui	a5,0x2
    80206f0a:	97ba                	add	a5,a5,a4
    80206f0c:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    80206f10:	eba1                	bnez	a5,80206f60 <free_desc+0x70>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    80206f12:	00451713          	slli	a4,a0,0x4
    80206f16:	0001e797          	auipc	a5,0x1e
    80206f1a:	0ea7b783          	ld	a5,234(a5) # 80225000 <disk+0x2000>
    80206f1e:	97ba                	add	a5,a5,a4
    80206f20:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    80206f24:	0001c717          	auipc	a4,0x1c
    80206f28:	0dc70713          	addi	a4,a4,220 # 80223000 <disk>
    80206f2c:	972a                	add	a4,a4,a0
    80206f2e:	6789                	lui	a5,0x2
    80206f30:	97ba                	add	a5,a5,a4
    80206f32:	4705                	li	a4,1
    80206f34:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    80206f38:	0001e517          	auipc	a0,0x1e
    80206f3c:	0e050513          	addi	a0,a0,224 # 80225018 <disk+0x2018>
    80206f40:	ffffb097          	auipc	ra,0xffffb
    80206f44:	51c080e7          	jalr	1308(ra) # 8020245c <wakeup>
}
    80206f48:	60a2                	ld	ra,8(sp)
    80206f4a:	6402                	ld	s0,0(sp)
    80206f4c:	0141                	addi	sp,sp,16
    80206f4e:	8082                	ret
    panic("virtio_disk_intr 1");
    80206f50:	00003517          	auipc	a0,0x3
    80206f54:	e3050513          	addi	a0,a0,-464 # 80209d80 <digits+0xa00>
    80206f58:	ffff9097          	auipc	ra,0xffff9
    80206f5c:	1ec080e7          	jalr	492(ra) # 80200144 <panic>
    panic("virtio_disk_intr 2");
    80206f60:	00003517          	auipc	a0,0x3
    80206f64:	e3850513          	addi	a0,a0,-456 # 80209d98 <digits+0xa18>
    80206f68:	ffff9097          	auipc	ra,0xffff9
    80206f6c:	1dc080e7          	jalr	476(ra) # 80200144 <panic>

0000000080206f70 <virtio_disk_init>:
{
    80206f70:	1141                	addi	sp,sp,-16
    80206f72:	e406                	sd	ra,8(sp)
    80206f74:	e022                	sd	s0,0(sp)
    80206f76:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    80206f78:	00003597          	auipc	a1,0x3
    80206f7c:	e3858593          	addi	a1,a1,-456 # 80209db0 <digits+0xa30>
    80206f80:	0001e517          	auipc	a0,0x1e
    80206f84:	12850513          	addi	a0,a0,296 # 802250a8 <disk+0x20a8>
    80206f88:	ffff9097          	auipc	ra,0xffff9
    80206f8c:	6fa080e7          	jalr	1786(ra) # 80200682 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80206f90:	03f107b7          	lui	a5,0x3f10
    80206f94:	0785                	addi	a5,a5,1 # 3f10001 <_entry-0x7c2effff>
    80206f96:	07b2                	slli	a5,a5,0xc
    80206f98:	4398                	lw	a4,0(a5)
    80206f9a:	2701                	sext.w	a4,a4
    80206f9c:	747277b7          	lui	a5,0x74727
    80206fa0:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    80206fa4:	12f71163          	bne	a4,a5,802070c6 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80206fa8:	00003797          	auipc	a5,0x3
    80206fac:	e907b783          	ld	a5,-368(a5) # 80209e38 <digits+0xab8>
    80206fb0:	439c                	lw	a5,0(a5)
    80206fb2:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80206fb4:	4705                	li	a4,1
    80206fb6:	10e79863          	bne	a5,a4,802070c6 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80206fba:	00003797          	auipc	a5,0x3
    80206fbe:	e867b783          	ld	a5,-378(a5) # 80209e40 <digits+0xac0>
    80206fc2:	439c                	lw	a5,0(a5)
    80206fc4:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80206fc6:	4709                	li	a4,2
    80206fc8:	0ee79f63          	bne	a5,a4,802070c6 <virtio_disk_init+0x156>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80206fcc:	00003797          	auipc	a5,0x3
    80206fd0:	e7c7b783          	ld	a5,-388(a5) # 80209e48 <digits+0xac8>
    80206fd4:	4398                	lw	a4,0(a5)
    80206fd6:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80206fd8:	554d47b7          	lui	a5,0x554d4
    80206fdc:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    80206fe0:	0ef71363          	bne	a4,a5,802070c6 <virtio_disk_init+0x156>
  *R(VIRTIO_MMIO_STATUS) = status;
    80206fe4:	00003797          	auipc	a5,0x3
    80206fe8:	e6c7b783          	ld	a5,-404(a5) # 80209e50 <digits+0xad0>
    80206fec:	4705                	li	a4,1
    80206fee:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80206ff0:	470d                	li	a4,3
    80206ff2:	c398                	sw	a4,0(a5)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80206ff4:	00003717          	auipc	a4,0x3
    80206ff8:	e6473703          	ld	a4,-412(a4) # 80209e58 <digits+0xad8>
    80206ffc:	4318                	lw	a4,0(a4)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80206ffe:	c7ffe6b7          	lui	a3,0xc7ffe
    80207002:	75f68693          	addi	a3,a3,1887 # ffffffffc7ffe75f <ebss_clear+0xffffffff47dd875f>
    80207006:	8f75                	and	a4,a4,a3
    80207008:	00003697          	auipc	a3,0x3
    8020700c:	e586b683          	ld	a3,-424(a3) # 80209e60 <digits+0xae0>
    80207010:	c298                	sw	a4,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207012:	472d                	li	a4,11
    80207014:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207016:	473d                	li	a4,15
    80207018:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    8020701a:	00003797          	auipc	a5,0x3
    8020701e:	e4e7b783          	ld	a5,-434(a5) # 80209e68 <digits+0xae8>
    80207022:	6705                	lui	a4,0x1
    80207024:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80207026:	00003797          	auipc	a5,0x3
    8020702a:	e4a7b783          	ld	a5,-438(a5) # 80209e70 <digits+0xaf0>
    8020702e:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80207032:	00003797          	auipc	a5,0x3
    80207036:	e467b783          	ld	a5,-442(a5) # 80209e78 <digits+0xaf8>
    8020703a:	439c                	lw	a5,0(a5)
    8020703c:	2781                	sext.w	a5,a5
  if(max == 0)
    8020703e:	cfc1                	beqz	a5,802070d6 <virtio_disk_init+0x166>
  if(max < NUM)
    80207040:	471d                	li	a4,7
    80207042:	0af77263          	bgeu	a4,a5,802070e6 <virtio_disk_init+0x176>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80207046:	00003797          	auipc	a5,0x3
    8020704a:	e3a7b783          	ld	a5,-454(a5) # 80209e80 <digits+0xb00>
    8020704e:	4721                	li	a4,8
    80207050:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80207052:	6609                	lui	a2,0x2
    80207054:	4581                	li	a1,0
    80207056:	0001c517          	auipc	a0,0x1c
    8020705a:	faa50513          	addi	a0,a0,-86 # 80223000 <disk>
    8020705e:	ffff9097          	auipc	ra,0xffff9
    80207062:	704080e7          	jalr	1796(ra) # 80200762 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80207066:	0001c717          	auipc	a4,0x1c
    8020706a:	f9a70713          	addi	a4,a4,-102 # 80223000 <disk>
    8020706e:	00c75793          	srli	a5,a4,0xc
    80207072:	2781                	sext.w	a5,a5
    80207074:	00003697          	auipc	a3,0x3
    80207078:	e146b683          	ld	a3,-492(a3) # 80209e88 <digits+0xb08>
    8020707c:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    8020707e:	0001e797          	auipc	a5,0x1e
    80207082:	f8278793          	addi	a5,a5,-126 # 80225000 <disk+0x2000>
    80207086:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    80207088:	0001c717          	auipc	a4,0x1c
    8020708c:	ff870713          	addi	a4,a4,-8 # 80223080 <disk+0x80>
    80207090:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    80207092:	0001d717          	auipc	a4,0x1d
    80207096:	f6e70713          	addi	a4,a4,-146 # 80224000 <disk+0x1000>
    8020709a:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    8020709c:	4705                	li	a4,1
    8020709e:	00e78c23          	sb	a4,24(a5)
    802070a2:	00e78ca3          	sb	a4,25(a5)
    802070a6:	00e78d23          	sb	a4,26(a5)
    802070aa:	00e78da3          	sb	a4,27(a5)
    802070ae:	00e78e23          	sb	a4,28(a5)
    802070b2:	00e78ea3          	sb	a4,29(a5)
    802070b6:	00e78f23          	sb	a4,30(a5)
    802070ba:	00e78fa3          	sb	a4,31(a5)
}
    802070be:	60a2                	ld	ra,8(sp)
    802070c0:	6402                	ld	s0,0(sp)
    802070c2:	0141                	addi	sp,sp,16
    802070c4:	8082                	ret
    panic("could not find virtio disk");
    802070c6:	00003517          	auipc	a0,0x3
    802070ca:	cfa50513          	addi	a0,a0,-774 # 80209dc0 <digits+0xa40>
    802070ce:	ffff9097          	auipc	ra,0xffff9
    802070d2:	076080e7          	jalr	118(ra) # 80200144 <panic>
    panic("virtio disk has no queue 0");
    802070d6:	00003517          	auipc	a0,0x3
    802070da:	d0a50513          	addi	a0,a0,-758 # 80209de0 <digits+0xa60>
    802070de:	ffff9097          	auipc	ra,0xffff9
    802070e2:	066080e7          	jalr	102(ra) # 80200144 <panic>
    panic("virtio disk max queue too short");
    802070e6:	00003517          	auipc	a0,0x3
    802070ea:	d1a50513          	addi	a0,a0,-742 # 80209e00 <digits+0xa80>
    802070ee:	ffff9097          	auipc	ra,0xffff9
    802070f2:	056080e7          	jalr	86(ra) # 80200144 <panic>

00000000802070f6 <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    802070f6:	7175                	addi	sp,sp,-144
    802070f8:	e506                	sd	ra,136(sp)
    802070fa:	e122                	sd	s0,128(sp)
    802070fc:	fca6                	sd	s1,120(sp)
    802070fe:	f8ca                	sd	s2,112(sp)
    80207100:	f4ce                	sd	s3,104(sp)
    80207102:	f0d2                	sd	s4,96(sp)
    80207104:	ecd6                	sd	s5,88(sp)
    80207106:	e8da                	sd	s6,80(sp)
    80207108:	e4de                	sd	s7,72(sp)
    8020710a:	e0e2                	sd	s8,64(sp)
    8020710c:	fc66                	sd	s9,56(sp)
    8020710e:	f86a                	sd	s10,48(sp)
    80207110:	f46e                	sd	s11,40(sp)
    80207112:	0900                	addi	s0,sp,144
    80207114:	8aaa                	mv	s5,a0
    80207116:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    80207118:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    8020711c:	0001e517          	auipc	a0,0x1e
    80207120:	f8c50513          	addi	a0,a0,-116 # 802250a8 <disk+0x20a8>
    80207124:	ffff9097          	auipc	ra,0xffff9
    80207128:	5a2080e7          	jalr	1442(ra) # 802006c6 <acquire>
  for(int i = 0; i < 3; i++){
    8020712c:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    8020712e:	44a1                	li	s1,8
      disk.free[i] = 0;
    80207130:	0001cc17          	auipc	s8,0x1c
    80207134:	ed0c0c13          	addi	s8,s8,-304 # 80223000 <disk>
    80207138:	6b89                	lui	s7,0x2
  for(int i = 0; i < 3; i++){
    8020713a:	4b0d                	li	s6,3
    8020713c:	a0ad                	j	802071a6 <virtio_disk_rw+0xb0>
      disk.free[i] = 0;
    8020713e:	00fc0733          	add	a4,s8,a5
    80207142:	975e                	add	a4,a4,s7
    80207144:	00070c23          	sb	zero,24(a4)
    idx[i] = alloc_desc();
    80207148:	c19c                	sw	a5,0(a1)
    if(idx[i] < 0){
    8020714a:	0207c563          	bltz	a5,80207174 <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    8020714e:	2905                	addiw	s2,s2,1
    80207150:	0611                	addi	a2,a2,4 # 2004 <_entry-0x801fdffc>
    80207152:	19690e63          	beq	s2,s6,802072ee <virtio_disk_rw+0x1f8>
    idx[i] = alloc_desc();
    80207156:	85b2                	mv	a1,a2
  for(int i = 0; i < NUM; i++){
    80207158:	0001e717          	auipc	a4,0x1e
    8020715c:	ec070713          	addi	a4,a4,-320 # 80225018 <disk+0x2018>
    80207160:	87ce                	mv	a5,s3
    if(disk.free[i]){
    80207162:	00074683          	lbu	a3,0(a4)
    80207166:	fee1                	bnez	a3,8020713e <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    80207168:	2785                	addiw	a5,a5,1
    8020716a:	0705                	addi	a4,a4,1
    8020716c:	fe979be3          	bne	a5,s1,80207162 <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    80207170:	57fd                	li	a5,-1
    80207172:	c19c                	sw	a5,0(a1)
      for(int j = 0; j < i; j++)
    80207174:	01205d63          	blez	s2,8020718e <virtio_disk_rw+0x98>
    80207178:	8dce                	mv	s11,s3
        free_desc(idx[j]);
    8020717a:	000a2503          	lw	a0,0(s4)
    8020717e:	00000097          	auipc	ra,0x0
    80207182:	d72080e7          	jalr	-654(ra) # 80206ef0 <free_desc>
      for(int j = 0; j < i; j++)
    80207186:	2d85                	addiw	s11,s11,1
    80207188:	0a11                	addi	s4,s4,4
    8020718a:	ff2d98e3          	bne	s11,s2,8020717a <virtio_disk_rw+0x84>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    8020718e:	0001e597          	auipc	a1,0x1e
    80207192:	f1a58593          	addi	a1,a1,-230 # 802250a8 <disk+0x20a8>
    80207196:	0001e517          	auipc	a0,0x1e
    8020719a:	e8250513          	addi	a0,a0,-382 # 80225018 <disk+0x2018>
    8020719e:	ffffb097          	auipc	ra,0xffffb
    802071a2:	142080e7          	jalr	322(ra) # 802022e0 <sleep>
  for(int i = 0; i < 3; i++){
    802071a6:	f8040a13          	addi	s4,s0,-128
{
    802071aa:	8652                	mv	a2,s4
  for(int i = 0; i < 3; i++){
    802071ac:	894e                	mv	s2,s3
    802071ae:	b765                	j	80207156 <virtio_disk_rw+0x60>
  disk.desc[idx[0]].next = idx[1];

  disk.desc[idx[1]].addr = (uint64) b->data;
  disk.desc[idx[1]].len = BSIZE;
  if(write)
    disk.desc[idx[1]].flags = 0; // device reads b->data
    802071b0:	0001e717          	auipc	a4,0x1e
    802071b4:	e5073703          	ld	a4,-432(a4) # 80225000 <disk+0x2000>
    802071b8:	973e                	add	a4,a4,a5
    802071ba:	00071623          	sh	zero,12(a4)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    802071be:	0001c517          	auipc	a0,0x1c
    802071c2:	e4250513          	addi	a0,a0,-446 # 80223000 <disk>
    802071c6:	0001e717          	auipc	a4,0x1e
    802071ca:	e3a70713          	addi	a4,a4,-454 # 80225000 <disk+0x2000>
    802071ce:	6314                	ld	a3,0(a4)
    802071d0:	96be                	add	a3,a3,a5
    802071d2:	00c6d603          	lhu	a2,12(a3)
    802071d6:	00166613          	ori	a2,a2,1
    802071da:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    802071de:	f8842683          	lw	a3,-120(s0)
    802071e2:	6310                	ld	a2,0(a4)
    802071e4:	97b2                	add	a5,a5,a2
    802071e6:	00d79723          	sh	a3,14(a5)

  disk.info[idx[0]].status = 0;
    802071ea:	20048613          	addi	a2,s1,512
    802071ee:	0612                	slli	a2,a2,0x4
    802071f0:	962a                	add	a2,a2,a0
    802071f2:	02060823          	sb	zero,48(a2)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    802071f6:	00469793          	slli	a5,a3,0x4
    802071fa:	630c                	ld	a1,0(a4)
    802071fc:	95be                	add	a1,a1,a5
    802071fe:	6689                	lui	a3,0x2
    80207200:	03068693          	addi	a3,a3,48 # 2030 <_entry-0x801fdfd0>
    80207204:	96ca                	add	a3,a3,s2
    80207206:	96aa                	add	a3,a3,a0
    80207208:	e194                	sd	a3,0(a1)
  disk.desc[idx[2]].len = 1;
    8020720a:	6314                	ld	a3,0(a4)
    8020720c:	96be                	add	a3,a3,a5
    8020720e:	4585                	li	a1,1
    80207210:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80207212:	6314                	ld	a3,0(a4)
    80207214:	96be                	add	a3,a3,a5
    80207216:	4509                	li	a0,2
    80207218:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    8020721c:	6314                	ld	a3,0(a4)
    8020721e:	97b6                	add	a5,a5,a3
    80207220:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80207224:	00baa223          	sw	a1,4(s5)
  disk.info[idx[0]].b = b;
    80207228:	03563423          	sd	s5,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    8020722c:	6714                	ld	a3,8(a4)
    8020722e:	0026d783          	lhu	a5,2(a3)
    80207232:	8b9d                	andi	a5,a5,7
    80207234:	0789                	addi	a5,a5,2
    80207236:	0786                	slli	a5,a5,0x1
    80207238:	96be                	add	a3,a3,a5
    8020723a:	00969023          	sh	s1,0(a3)
  __sync_synchronize();
    8020723e:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    80207242:	6718                	ld	a4,8(a4)
    80207244:	00275783          	lhu	a5,2(a4)
    80207248:	2785                	addiw	a5,a5,1
    8020724a:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    8020724e:	00003797          	auipc	a5,0x3
    80207252:	c427b783          	ld	a5,-958(a5) # 80209e90 <digits+0xb10>
    80207256:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    8020725a:	004aa783          	lw	a5,4(s5)
    8020725e:	02b79163          	bne	a5,a1,80207280 <virtio_disk_rw+0x18a>
    sleep(b, &disk.vdisk_lock);
    80207262:	0001e917          	auipc	s2,0x1e
    80207266:	e4690913          	addi	s2,s2,-442 # 802250a8 <disk+0x20a8>
  while(b->disk == 1) {
    8020726a:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    8020726c:	85ca                	mv	a1,s2
    8020726e:	8556                	mv	a0,s5
    80207270:	ffffb097          	auipc	ra,0xffffb
    80207274:	070080e7          	jalr	112(ra) # 802022e0 <sleep>
  while(b->disk == 1) {
    80207278:	004aa783          	lw	a5,4(s5)
    8020727c:	fe9788e3          	beq	a5,s1,8020726c <virtio_disk_rw+0x176>
  }

  disk.info[idx[0]].b = 0;
    80207280:	f8042483          	lw	s1,-128(s0)
    80207284:	20048713          	addi	a4,s1,512
    80207288:	0712                	slli	a4,a4,0x4
    8020728a:	0001c797          	auipc	a5,0x1c
    8020728e:	d7678793          	addi	a5,a5,-650 # 80223000 <disk>
    80207292:	97ba                	add	a5,a5,a4
    80207294:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80207298:	0001e917          	auipc	s2,0x1e
    8020729c:	d6890913          	addi	s2,s2,-664 # 80225000 <disk+0x2000>
    802072a0:	a019                	j	802072a6 <virtio_disk_rw+0x1b0>
      i = disk.desc[i].next;
    802072a2:	00e7d483          	lhu	s1,14(a5)
    free_desc(i);
    802072a6:	8526                	mv	a0,s1
    802072a8:	00000097          	auipc	ra,0x0
    802072ac:	c48080e7          	jalr	-952(ra) # 80206ef0 <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    802072b0:	0492                	slli	s1,s1,0x4
    802072b2:	00093783          	ld	a5,0(s2)
    802072b6:	97a6                	add	a5,a5,s1
    802072b8:	00c7d703          	lhu	a4,12(a5)
    802072bc:	8b05                	andi	a4,a4,1
    802072be:	f375                	bnez	a4,802072a2 <virtio_disk_rw+0x1ac>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    802072c0:	0001e517          	auipc	a0,0x1e
    802072c4:	de850513          	addi	a0,a0,-536 # 802250a8 <disk+0x20a8>
    802072c8:	ffff9097          	auipc	ra,0xffff9
    802072cc:	452080e7          	jalr	1106(ra) # 8020071a <release>
}
    802072d0:	60aa                	ld	ra,136(sp)
    802072d2:	640a                	ld	s0,128(sp)
    802072d4:	74e6                	ld	s1,120(sp)
    802072d6:	7946                	ld	s2,112(sp)
    802072d8:	79a6                	ld	s3,104(sp)
    802072da:	7a06                	ld	s4,96(sp)
    802072dc:	6ae6                	ld	s5,88(sp)
    802072de:	6b46                	ld	s6,80(sp)
    802072e0:	6ba6                	ld	s7,72(sp)
    802072e2:	6c06                	ld	s8,64(sp)
    802072e4:	7ce2                	ld	s9,56(sp)
    802072e6:	7d42                	ld	s10,48(sp)
    802072e8:	7da2                	ld	s11,40(sp)
    802072ea:	6149                	addi	sp,sp,144
    802072ec:	8082                	ret
  if(write)
    802072ee:	019037b3          	snez	a5,s9
    802072f2:	f6f42823          	sw	a5,-144(s0)
  buf0.reserved = 0;
    802072f6:	f6042a23          	sw	zero,-140(s0)
  buf0.sector = sector;
    802072fa:	f7a43c23          	sd	s10,-136(s0)
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    802072fe:	ffffa097          	auipc	ra,0xffffa
    80207302:	73e080e7          	jalr	1854(ra) # 80201a3c <myproc>
    80207306:	f8042483          	lw	s1,-128(s0)
    8020730a:	00449913          	slli	s2,s1,0x4
    8020730e:	0001e997          	auipc	s3,0x1e
    80207312:	cf298993          	addi	s3,s3,-782 # 80225000 <disk+0x2000>
    80207316:	0009ba03          	ld	s4,0(s3)
    8020731a:	9a4a                	add	s4,s4,s2
    8020731c:	f7040593          	addi	a1,s0,-144
    80207320:	6d28                	ld	a0,88(a0)
    80207322:	ffffa097          	auipc	ra,0xffffa
    80207326:	8ce080e7          	jalr	-1842(ra) # 80200bf0 <kwalkaddr>
    8020732a:	00aa3023          	sd	a0,0(s4)
  disk.desc[idx[0]].len = sizeof(buf0);
    8020732e:	0009b783          	ld	a5,0(s3)
    80207332:	97ca                	add	a5,a5,s2
    80207334:	4741                	li	a4,16
    80207336:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80207338:	0009b783          	ld	a5,0(s3)
    8020733c:	97ca                	add	a5,a5,s2
    8020733e:	4705                	li	a4,1
    80207340:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80207344:	f8442783          	lw	a5,-124(s0)
    80207348:	0009b703          	ld	a4,0(s3)
    8020734c:	974a                	add	a4,a4,s2
    8020734e:	00f71723          	sh	a5,14(a4)
  disk.desc[idx[1]].addr = (uint64) b->data;
    80207352:	0792                	slli	a5,a5,0x4
    80207354:	0009b703          	ld	a4,0(s3)
    80207358:	973e                	add	a4,a4,a5
    8020735a:	058a8693          	addi	a3,s5,88
    8020735e:	e314                	sd	a3,0(a4)
  disk.desc[idx[1]].len = BSIZE;
    80207360:	0009b703          	ld	a4,0(s3)
    80207364:	973e                	add	a4,a4,a5
    80207366:	20000693          	li	a3,512
    8020736a:	c714                	sw	a3,8(a4)
  if(write)
    8020736c:	e40c92e3          	bnez	s9,802071b0 <virtio_disk_rw+0xba>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80207370:	0001e717          	auipc	a4,0x1e
    80207374:	c9073703          	ld	a4,-880(a4) # 80225000 <disk+0x2000>
    80207378:	973e                	add	a4,a4,a5
    8020737a:	4689                	li	a3,2
    8020737c:	00d71623          	sh	a3,12(a4)
    80207380:	bd3d                	j	802071be <virtio_disk_rw+0xc8>

0000000080207382 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80207382:	1101                	addi	sp,sp,-32
    80207384:	ec06                	sd	ra,24(sp)
    80207386:	e822                	sd	s0,16(sp)
    80207388:	e426                	sd	s1,8(sp)
    8020738a:	e04a                	sd	s2,0(sp)
    8020738c:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    8020738e:	0001e517          	auipc	a0,0x1e
    80207392:	d1a50513          	addi	a0,a0,-742 # 802250a8 <disk+0x20a8>
    80207396:	ffff9097          	auipc	ra,0xffff9
    8020739a:	330080e7          	jalr	816(ra) # 802006c6 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    8020739e:	0001e717          	auipc	a4,0x1e
    802073a2:	c6270713          	addi	a4,a4,-926 # 80225000 <disk+0x2000>
    802073a6:	02075783          	lhu	a5,32(a4)
    802073aa:	6b18                	ld	a4,16(a4)
    802073ac:	00275683          	lhu	a3,2(a4)
    802073b0:	8ebd                	xor	a3,a3,a5
    802073b2:	8a9d                	andi	a3,a3,7
    802073b4:	cab9                	beqz	a3,8020740a <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    802073b6:	0001c917          	auipc	s2,0x1c
    802073ba:	c4a90913          	addi	s2,s2,-950 # 80223000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    802073be:	0001e497          	auipc	s1,0x1e
    802073c2:	c4248493          	addi	s1,s1,-958 # 80225000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    802073c6:	078e                	slli	a5,a5,0x3
    802073c8:	973e                	add	a4,a4,a5
    802073ca:	435c                	lw	a5,4(a4)
    if(disk.info[id].status != 0)
    802073cc:	20078713          	addi	a4,a5,512
    802073d0:	0712                	slli	a4,a4,0x4
    802073d2:	974a                	add	a4,a4,s2
    802073d4:	03074703          	lbu	a4,48(a4)
    802073d8:	e335                	bnez	a4,8020743c <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    802073da:	20078793          	addi	a5,a5,512
    802073de:	0792                	slli	a5,a5,0x4
    802073e0:	97ca                	add	a5,a5,s2
    802073e2:	7798                	ld	a4,40(a5)
    802073e4:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    802073e8:	7788                	ld	a0,40(a5)
    802073ea:	ffffb097          	auipc	ra,0xffffb
    802073ee:	072080e7          	jalr	114(ra) # 8020245c <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    802073f2:	0204d783          	lhu	a5,32(s1)
    802073f6:	2785                	addiw	a5,a5,1
    802073f8:	8b9d                	andi	a5,a5,7
    802073fa:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    802073fe:	6898                	ld	a4,16(s1)
    80207400:	00275683          	lhu	a3,2(a4)
    80207404:	8a9d                	andi	a3,a3,7
    80207406:	fcf690e3          	bne	a3,a5,802073c6 <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8020740a:	00003797          	auipc	a5,0x3
    8020740e:	a8e7b783          	ld	a5,-1394(a5) # 80209e98 <digits+0xb18>
    80207412:	439c                	lw	a5,0(a5)
    80207414:	8b8d                	andi	a5,a5,3
    80207416:	00003717          	auipc	a4,0x3
    8020741a:	a8a73703          	ld	a4,-1398(a4) # 80209ea0 <digits+0xb20>
    8020741e:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    80207420:	0001e517          	auipc	a0,0x1e
    80207424:	c8850513          	addi	a0,a0,-888 # 802250a8 <disk+0x20a8>
    80207428:	ffff9097          	auipc	ra,0xffff9
    8020742c:	2f2080e7          	jalr	754(ra) # 8020071a <release>
}
    80207430:	60e2                	ld	ra,24(sp)
    80207432:	6442                	ld	s0,16(sp)
    80207434:	64a2                	ld	s1,8(sp)
    80207436:	6902                	ld	s2,0(sp)
    80207438:	6105                	addi	sp,sp,32
    8020743a:	8082                	ret
      panic("virtio_disk_intr status");
    8020743c:	00003517          	auipc	a0,0x3
    80207440:	9e450513          	addi	a0,a0,-1564 # 80209e20 <digits+0xaa0>
    80207444:	ffff9097          	auipc	ra,0xffff9
    80207448:	d00080e7          	jalr	-768(ra) # 80200144 <panic>
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
