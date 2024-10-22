
target/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0000c117          	auipc	sp,0xc
    8020000a:	a8213103          	ld	sp,-1406(sp) # 8020ba88 <_GLOBAL_OFFSET_TABLE_+0x50>
    8020000e:	9116                	add	sp,sp,t0
    80200010:	1d3000ef          	jal	ra,802009e2 <main>

0000000080200014 <loop>:
    80200014:	a001                	j	80200014 <loop>

0000000080200016 <printint>:
    80200016:	7179                	addi	sp,sp,-48
    80200018:	f406                	sd	ra,40(sp)
    8020001a:	f022                	sd	s0,32(sp)
    8020001c:	ec26                	sd	s1,24(sp)
    8020001e:	e84a                	sd	s2,16(sp)
    80200020:	1800                	addi	s0,sp,48
    80200022:	c219                	beqz	a2,80200028 <printint+0x12>
    80200024:	08054663          	bltz	a0,802000b0 <printint+0x9a>
    80200028:	2501                	sext.w	a0,a0
    8020002a:	4881                	li	a7,0
    8020002c:	fd040913          	addi	s2,s0,-48
    80200030:	86ca                	mv	a3,s2
    80200032:	4701                	li	a4,0
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
    80200054:	0005079b          	sext.w	a5,a0
    80200058:	02b5553b          	divuw	a0,a0,a1
    8020005c:	0685                	addi	a3,a3,1
    8020005e:	feb7f0e3          	bgeu	a5,a1,8020003e <printint+0x28>
    80200062:	00088c63          	beqz	a7,8020007a <printint+0x64>
    80200066:	fe070793          	addi	a5,a4,-32
    8020006a:	00878733          	add	a4,a5,s0
    8020006e:	02d00793          	li	a5,45
    80200072:	fef70823          	sb	a5,-16(a4)
    80200076:	0028071b          	addiw	a4,a6,2
    8020007a:	02e05563          	blez	a4,802000a4 <printint+0x8e>
    8020007e:	fd040493          	addi	s1,s0,-48
    80200082:	94ba                	add	s1,s1,a4
    80200084:	197d                	addi	s2,s2,-1
    80200086:	993a                	add	s2,s2,a4
    80200088:	377d                	addiw	a4,a4,-1
    8020008a:	1702                	slli	a4,a4,0x20
    8020008c:	9301                	srli	a4,a4,0x20
    8020008e:	40e90933          	sub	s2,s2,a4
    80200092:	fff4c503          	lbu	a0,-1(s1)
    80200096:	00007097          	auipc	ra,0x7
    8020009a:	ac4080e7          	jalr	-1340(ra) # 80206b5a <consputc>
    8020009e:	14fd                	addi	s1,s1,-1
    802000a0:	ff2499e3          	bne	s1,s2,80200092 <printint+0x7c>
    802000a4:	70a2                	ld	ra,40(sp)
    802000a6:	7402                	ld	s0,32(sp)
    802000a8:	64e2                	ld	s1,24(sp)
    802000aa:	6942                	ld	s2,16(sp)
    802000ac:	6145                	addi	sp,sp,48
    802000ae:	8082                	ret
    802000b0:	40a0053b          	negw	a0,a0
    802000b4:	4885                	li	a7,1
    802000b6:	bf9d                	j	8020002c <printint+0x16>

00000000802000b8 <printstring>:
    802000b8:	1101                	addi	sp,sp,-32
    802000ba:	ec06                	sd	ra,24(sp)
    802000bc:	e822                	sd	s0,16(sp)
    802000be:	e426                	sd	s1,8(sp)
    802000c0:	1000                	addi	s0,sp,32
    802000c2:	84aa                	mv	s1,a0
    802000c4:	00054503          	lbu	a0,0(a0)
    802000c8:	c909                	beqz	a0,802000da <printstring+0x22>
    802000ca:	0485                	addi	s1,s1,1
    802000cc:	00007097          	auipc	ra,0x7
    802000d0:	a8e080e7          	jalr	-1394(ra) # 80206b5a <consputc>
    802000d4:	0004c503          	lbu	a0,0(s1)
    802000d8:	f96d                	bnez	a0,802000ca <printstring+0x12>
    802000da:	60e2                	ld	ra,24(sp)
    802000dc:	6442                	ld	s0,16(sp)
    802000de:	64a2                	ld	s1,8(sp)
    802000e0:	6105                	addi	sp,sp,32
    802000e2:	8082                	ret

00000000802000e4 <backtrace>:
    802000e4:	7179                	addi	sp,sp,-48
    802000e6:	f406                	sd	ra,40(sp)
    802000e8:	f022                	sd	s0,32(sp)
    802000ea:	ec26                	sd	s1,24(sp)
    802000ec:	e84a                	sd	s2,16(sp)
    802000ee:	e44e                	sd	s3,8(sp)
    802000f0:	1800                	addi	s0,sp,48
    802000f2:	8922                	mv	s2,s0
    802000f4:	84ca                	mv	s1,s2
    802000f6:	6785                	lui	a5,0x1
    802000f8:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    802000fa:	993e                	add	s2,s2,a5
    802000fc:	77fd                	lui	a5,0xfffff
    802000fe:	00f97933          	and	s2,s2,a5
    80200102:	00009517          	auipc	a0,0x9
    80200106:	efe50513          	addi	a0,a0,-258 # 80209000 <etext>
    8020010a:	00000097          	auipc	ra,0x0
    8020010e:	084080e7          	jalr	132(ra) # 8020018e <printf>
    80200112:	0324f263          	bgeu	s1,s2,80200136 <backtrace+0x52>
    80200116:	00009997          	auipc	s3,0x9
    8020011a:	4d298993          	addi	s3,s3,1234 # 802095e8 <digits+0x268>
    8020011e:	ff84b583          	ld	a1,-8(s1)
    80200122:	15f1                	addi	a1,a1,-4
    80200124:	854e                	mv	a0,s3
    80200126:	00000097          	auipc	ra,0x0
    8020012a:	068080e7          	jalr	104(ra) # 8020018e <printf>
    8020012e:	ff04b483          	ld	s1,-16(s1)
    80200132:	ff24e6e3          	bltu	s1,s2,8020011e <backtrace+0x3a>
    80200136:	70a2                	ld	ra,40(sp)
    80200138:	7402                	ld	s0,32(sp)
    8020013a:	64e2                	ld	s1,24(sp)
    8020013c:	6942                	ld	s2,16(sp)
    8020013e:	69a2                	ld	s3,8(sp)
    80200140:	6145                	addi	sp,sp,48
    80200142:	8082                	ret

0000000080200144 <panic>:
    80200144:	1101                	addi	sp,sp,-32
    80200146:	ec06                	sd	ra,24(sp)
    80200148:	e822                	sd	s0,16(sp)
    8020014a:	e426                	sd	s1,8(sp)
    8020014c:	1000                	addi	s0,sp,32
    8020014e:	84aa                	mv	s1,a0
    80200150:	00009517          	auipc	a0,0x9
    80200154:	ec050513          	addi	a0,a0,-320 # 80209010 <etext+0x10>
    80200158:	00000097          	auipc	ra,0x0
    8020015c:	036080e7          	jalr	54(ra) # 8020018e <printf>
    80200160:	8526                	mv	a0,s1
    80200162:	00000097          	auipc	ra,0x0
    80200166:	02c080e7          	jalr	44(ra) # 8020018e <printf>
    8020016a:	00009517          	auipc	a0,0x9
    8020016e:	f6e50513          	addi	a0,a0,-146 # 802090d8 <etext+0xd8>
    80200172:	00000097          	auipc	ra,0x0
    80200176:	01c080e7          	jalr	28(ra) # 8020018e <printf>
    8020017a:	00000097          	auipc	ra,0x0
    8020017e:	f6a080e7          	jalr	-150(ra) # 802000e4 <backtrace>
    80200182:	4785                	li	a5,1
    80200184:	00014717          	auipc	a4,0x14
    80200188:	e6f72e23          	sw	a5,-388(a4) # 80214000 <panicked>
    8020018c:	a001                	j	8020018c <panic+0x48>

000000008020018e <printf>:
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
    802001c0:	00014d97          	auipc	s11,0x14
    802001c4:	e60dad83          	lw	s11,-416(s11) # 80214020 <pr+0x18>
    802001c8:	020d9b63          	bnez	s11,802001fe <printf+0x70>
    802001cc:	040a0263          	beqz	s4,80200210 <printf+0x82>
    802001d0:	00840793          	addi	a5,s0,8
    802001d4:	f8f43423          	sd	a5,-120(s0)
    802001d8:	000a4503          	lbu	a0,0(s4)
    802001dc:	14050f63          	beqz	a0,8020033a <printf+0x1ac>
    802001e0:	4981                	li	s3,0
    802001e2:	02500a93          	li	s5,37
    802001e6:	07000b93          	li	s7,112
    802001ea:	4d41                	li	s10,16
    802001ec:	00009b17          	auipc	s6,0x9
    802001f0:	194b0b13          	addi	s6,s6,404 # 80209380 <digits>
    802001f4:	07300c93          	li	s9,115
    802001f8:	06400c13          	li	s8,100
    802001fc:	a82d                	j	80200236 <printf+0xa8>
    802001fe:	00014517          	auipc	a0,0x14
    80200202:	e0a50513          	addi	a0,a0,-502 # 80214008 <pr>
    80200206:	00000097          	auipc	ra,0x0
    8020020a:	4c0080e7          	jalr	1216(ra) # 802006c6 <acquire>
    8020020e:	bf7d                	j	802001cc <printf+0x3e>
    80200210:	00009517          	auipc	a0,0x9
    80200214:	e1050513          	addi	a0,a0,-496 # 80209020 <etext+0x20>
    80200218:	00000097          	auipc	ra,0x0
    8020021c:	f2c080e7          	jalr	-212(ra) # 80200144 <panic>
    80200220:	00007097          	auipc	ra,0x7
    80200224:	93a080e7          	jalr	-1734(ra) # 80206b5a <consputc>
    80200228:	2985                	addiw	s3,s3,1
    8020022a:	013a07b3          	add	a5,s4,s3
    8020022e:	0007c503          	lbu	a0,0(a5) # fffffffffffff000 <ebss_clear+0xffffffff7fdd9000>
    80200232:	10050463          	beqz	a0,8020033a <printf+0x1ac>
    80200236:	ff5515e3          	bne	a0,s5,80200220 <printf+0x92>
    8020023a:	2985                	addiw	s3,s3,1
    8020023c:	013a07b3          	add	a5,s4,s3
    80200240:	0007c783          	lbu	a5,0(a5)
    80200244:	0007849b          	sext.w	s1,a5
    80200248:	cbed                	beqz	a5,8020033a <printf+0x1ac>
    8020024a:	05778a63          	beq	a5,s7,8020029e <printf+0x110>
    8020024e:	02fbf663          	bgeu	s7,a5,8020027a <printf+0xec>
    80200252:	09978863          	beq	a5,s9,802002e2 <printf+0x154>
    80200256:	07800713          	li	a4,120
    8020025a:	0ce79563          	bne	a5,a4,80200324 <printf+0x196>
    8020025e:	f8843783          	ld	a5,-120(s0)
    80200262:	00878713          	addi	a4,a5,8
    80200266:	f8e43423          	sd	a4,-120(s0)
    8020026a:	4605                	li	a2,1
    8020026c:	85ea                	mv	a1,s10
    8020026e:	4388                	lw	a0,0(a5)
    80200270:	00000097          	auipc	ra,0x0
    80200274:	da6080e7          	jalr	-602(ra) # 80200016 <printint>
    80200278:	bf45                	j	80200228 <printf+0x9a>
    8020027a:	09578f63          	beq	a5,s5,80200318 <printf+0x18a>
    8020027e:	0b879363          	bne	a5,s8,80200324 <printf+0x196>
    80200282:	f8843783          	ld	a5,-120(s0)
    80200286:	00878713          	addi	a4,a5,8
    8020028a:	f8e43423          	sd	a4,-120(s0)
    8020028e:	4605                	li	a2,1
    80200290:	45a9                	li	a1,10
    80200292:	4388                	lw	a0,0(a5)
    80200294:	00000097          	auipc	ra,0x0
    80200298:	d82080e7          	jalr	-638(ra) # 80200016 <printint>
    8020029c:	b771                	j	80200228 <printf+0x9a>
    8020029e:	f8843783          	ld	a5,-120(s0)
    802002a2:	00878713          	addi	a4,a5,8
    802002a6:	f8e43423          	sd	a4,-120(s0)
    802002aa:	0007b903          	ld	s2,0(a5)
    802002ae:	03000513          	li	a0,48
    802002b2:	00007097          	auipc	ra,0x7
    802002b6:	8a8080e7          	jalr	-1880(ra) # 80206b5a <consputc>
    802002ba:	07800513          	li	a0,120
    802002be:	00007097          	auipc	ra,0x7
    802002c2:	89c080e7          	jalr	-1892(ra) # 80206b5a <consputc>
    802002c6:	84ea                	mv	s1,s10
    802002c8:	03c95793          	srli	a5,s2,0x3c
    802002cc:	97da                	add	a5,a5,s6
    802002ce:	0007c503          	lbu	a0,0(a5)
    802002d2:	00007097          	auipc	ra,0x7
    802002d6:	888080e7          	jalr	-1912(ra) # 80206b5a <consputc>
    802002da:	0912                	slli	s2,s2,0x4
    802002dc:	34fd                	addiw	s1,s1,-1
    802002de:	f4ed                	bnez	s1,802002c8 <printf+0x13a>
    802002e0:	b7a1                	j	80200228 <printf+0x9a>
    802002e2:	f8843783          	ld	a5,-120(s0)
    802002e6:	00878713          	addi	a4,a5,8
    802002ea:	f8e43423          	sd	a4,-120(s0)
    802002ee:	6384                	ld	s1,0(a5)
    802002f0:	cc89                	beqz	s1,8020030a <printf+0x17c>
    802002f2:	0004c503          	lbu	a0,0(s1)
    802002f6:	d90d                	beqz	a0,80200228 <printf+0x9a>
    802002f8:	00007097          	auipc	ra,0x7
    802002fc:	862080e7          	jalr	-1950(ra) # 80206b5a <consputc>
    80200300:	0485                	addi	s1,s1,1
    80200302:	0004c503          	lbu	a0,0(s1)
    80200306:	f96d                	bnez	a0,802002f8 <printf+0x16a>
    80200308:	b705                	j	80200228 <printf+0x9a>
    8020030a:	00009497          	auipc	s1,0x9
    8020030e:	d0e48493          	addi	s1,s1,-754 # 80209018 <etext+0x18>
    80200312:	02800513          	li	a0,40
    80200316:	b7cd                	j	802002f8 <printf+0x16a>
    80200318:	8556                	mv	a0,s5
    8020031a:	00007097          	auipc	ra,0x7
    8020031e:	840080e7          	jalr	-1984(ra) # 80206b5a <consputc>
    80200322:	b719                	j	80200228 <printf+0x9a>
    80200324:	8556                	mv	a0,s5
    80200326:	00007097          	auipc	ra,0x7
    8020032a:	834080e7          	jalr	-1996(ra) # 80206b5a <consputc>
    8020032e:	8526                	mv	a0,s1
    80200330:	00007097          	auipc	ra,0x7
    80200334:	82a080e7          	jalr	-2006(ra) # 80206b5a <consputc>
    80200338:	bdc5                	j	80200228 <printf+0x9a>
    8020033a:	020d9163          	bnez	s11,8020035c <printf+0x1ce>
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
    8020035c:	00014517          	auipc	a0,0x14
    80200360:	cac50513          	addi	a0,a0,-852 # 80214008 <pr>
    80200364:	00000097          	auipc	ra,0x0
    80200368:	3b6080e7          	jalr	950(ra) # 8020071a <release>
    8020036c:	bfc9                	j	8020033e <printf+0x1b0>

000000008020036e <printfinit>:
    8020036e:	1141                	addi	sp,sp,-16
    80200370:	e406                	sd	ra,8(sp)
    80200372:	e022                	sd	s0,0(sp)
    80200374:	0800                	addi	s0,sp,16
    80200376:	00009597          	auipc	a1,0x9
    8020037a:	cba58593          	addi	a1,a1,-838 # 80209030 <etext+0x30>
    8020037e:	00014517          	auipc	a0,0x14
    80200382:	c8a50513          	addi	a0,a0,-886 # 80214008 <pr>
    80200386:	00000097          	auipc	ra,0x0
    8020038a:	2fc080e7          	jalr	764(ra) # 80200682 <initlock>
    8020038e:	4785                	li	a5,1
    80200390:	00014717          	auipc	a4,0x14
    80200394:	c8f72823          	sw	a5,-880(a4) # 80214020 <pr+0x18>
    80200398:	60a2                	ld	ra,8(sp)
    8020039a:	6402                	ld	s0,0(sp)
    8020039c:	0141                	addi	sp,sp,16
    8020039e:	8082                	ret

00000000802003a0 <print_logo>:
    802003a0:	1141                	addi	sp,sp,-16
    802003a2:	e406                	sd	ra,8(sp)
    802003a4:	e022                	sd	s0,0(sp)
    802003a6:	0800                	addi	s0,sp,16
    802003a8:	00009517          	auipc	a0,0x9
    802003ac:	c9050513          	addi	a0,a0,-880 # 80209038 <etext+0x38>
    802003b0:	00000097          	auipc	ra,0x0
    802003b4:	dde080e7          	jalr	-546(ra) # 8020018e <printf>
    802003b8:	00009517          	auipc	a0,0x9
    802003bc:	cd050513          	addi	a0,a0,-816 # 80209088 <etext+0x88>
    802003c0:	00000097          	auipc	ra,0x0
    802003c4:	dce080e7          	jalr	-562(ra) # 8020018e <printf>
    802003c8:	00009517          	auipc	a0,0x9
    802003cc:	d1850513          	addi	a0,a0,-744 # 802090e0 <etext+0xe0>
    802003d0:	00000097          	auipc	ra,0x0
    802003d4:	dbe080e7          	jalr	-578(ra) # 8020018e <printf>
    802003d8:	00009517          	auipc	a0,0x9
    802003dc:	d6850513          	addi	a0,a0,-664 # 80209140 <etext+0x140>
    802003e0:	00000097          	auipc	ra,0x0
    802003e4:	dae080e7          	jalr	-594(ra) # 8020018e <printf>
    802003e8:	00009517          	auipc	a0,0x9
    802003ec:	db850513          	addi	a0,a0,-584 # 802091a0 <etext+0x1a0>
    802003f0:	00000097          	auipc	ra,0x0
    802003f4:	d9e080e7          	jalr	-610(ra) # 8020018e <printf>
    802003f8:	00009517          	auipc	a0,0x9
    802003fc:	e0850513          	addi	a0,a0,-504 # 80209200 <etext+0x200>
    80200400:	00000097          	auipc	ra,0x0
    80200404:	d8e080e7          	jalr	-626(ra) # 8020018e <printf>
    80200408:	00009517          	auipc	a0,0x9
    8020040c:	e5850513          	addi	a0,a0,-424 # 80209260 <etext+0x260>
    80200410:	00000097          	auipc	ra,0x0
    80200414:	d7e080e7          	jalr	-642(ra) # 8020018e <printf>
    80200418:	00009517          	auipc	a0,0x9
    8020041c:	ea850513          	addi	a0,a0,-344 # 802092c0 <etext+0x2c0>
    80200420:	00000097          	auipc	ra,0x0
    80200424:	d6e080e7          	jalr	-658(ra) # 8020018e <printf>
    80200428:	00009517          	auipc	a0,0x9
    8020042c:	ef850513          	addi	a0,a0,-264 # 80209320 <etext+0x320>
    80200430:	00000097          	auipc	ra,0x0
    80200434:	d5e080e7          	jalr	-674(ra) # 8020018e <printf>
    80200438:	60a2                	ld	ra,8(sp)
    8020043a:	6402                	ld	s0,0(sp)
    8020043c:	0141                	addi	sp,sp,16
    8020043e:	8082                	ret

0000000080200440 <kfree>:
    80200440:	1101                	addi	sp,sp,-32
    80200442:	ec06                	sd	ra,24(sp)
    80200444:	e822                	sd	s0,16(sp)
    80200446:	e426                	sd	s1,8(sp)
    80200448:	e04a                	sd	s2,0(sp)
    8020044a:	1000                	addi	s0,sp,32
    8020044c:	03451793          	slli	a5,a0,0x34
    80200450:	e3ad                	bnez	a5,802004b2 <kfree+0x72>
    80200452:	84aa                	mv	s1,a0
    80200454:	0000b797          	auipc	a5,0xb
    80200458:	60c7b783          	ld	a5,1548(a5) # 8020ba60 <_GLOBAL_OFFSET_TABLE_+0x28>
    8020045c:	04f56b63          	bltu	a0,a5,802004b2 <kfree+0x72>
    80200460:	40300793          	li	a5,1027
    80200464:	07d6                	slli	a5,a5,0x15
    80200466:	04f57663          	bgeu	a0,a5,802004b2 <kfree+0x72>
    8020046a:	6605                	lui	a2,0x1
    8020046c:	4585                	li	a1,1
    8020046e:	00000097          	auipc	ra,0x0
    80200472:	2f4080e7          	jalr	756(ra) # 80200762 <memset>
    80200476:	00014917          	auipc	s2,0x14
    8020047a:	bb290913          	addi	s2,s2,-1102 # 80214028 <kmem>
    8020047e:	854a                	mv	a0,s2
    80200480:	00000097          	auipc	ra,0x0
    80200484:	246080e7          	jalr	582(ra) # 802006c6 <acquire>
    80200488:	01893783          	ld	a5,24(s2)
    8020048c:	e09c                	sd	a5,0(s1)
    8020048e:	00993c23          	sd	s1,24(s2)
    80200492:	02093783          	ld	a5,32(s2)
    80200496:	0785                	addi	a5,a5,1
    80200498:	02f93023          	sd	a5,32(s2)
    8020049c:	854a                	mv	a0,s2
    8020049e:	00000097          	auipc	ra,0x0
    802004a2:	27c080e7          	jalr	636(ra) # 8020071a <release>
    802004a6:	60e2                	ld	ra,24(sp)
    802004a8:	6442                	ld	s0,16(sp)
    802004aa:	64a2                	ld	s1,8(sp)
    802004ac:	6902                	ld	s2,0(sp)
    802004ae:	6105                	addi	sp,sp,32
    802004b0:	8082                	ret
    802004b2:	00009517          	auipc	a0,0x9
    802004b6:	ee650513          	addi	a0,a0,-282 # 80209398 <digits+0x18>
    802004ba:	00000097          	auipc	ra,0x0
    802004be:	c8a080e7          	jalr	-886(ra) # 80200144 <panic>

00000000802004c2 <freerange>:
    802004c2:	7179                	addi	sp,sp,-48
    802004c4:	f406                	sd	ra,40(sp)
    802004c6:	f022                	sd	s0,32(sp)
    802004c8:	ec26                	sd	s1,24(sp)
    802004ca:	e84a                	sd	s2,16(sp)
    802004cc:	e44e                	sd	s3,8(sp)
    802004ce:	e052                	sd	s4,0(sp)
    802004d0:	1800                	addi	s0,sp,48
    802004d2:	6785                	lui	a5,0x1
    802004d4:	fff78713          	addi	a4,a5,-1 # fff <_entry-0x801ff001>
    802004d8:	00e504b3          	add	s1,a0,a4
    802004dc:	777d                	lui	a4,0xfffff
    802004de:	8cf9                	and	s1,s1,a4
    802004e0:	94be                	add	s1,s1,a5
    802004e2:	0095ee63          	bltu	a1,s1,802004fe <freerange+0x3c>
    802004e6:	892e                	mv	s2,a1
    802004e8:	7a7d                	lui	s4,0xfffff
    802004ea:	6985                	lui	s3,0x1
    802004ec:	01448533          	add	a0,s1,s4
    802004f0:	00000097          	auipc	ra,0x0
    802004f4:	f50080e7          	jalr	-176(ra) # 80200440 <kfree>
    802004f8:	94ce                	add	s1,s1,s3
    802004fa:	fe9979e3          	bgeu	s2,s1,802004ec <freerange+0x2a>
    802004fe:	70a2                	ld	ra,40(sp)
    80200500:	7402                	ld	s0,32(sp)
    80200502:	64e2                	ld	s1,24(sp)
    80200504:	6942                	ld	s2,16(sp)
    80200506:	69a2                	ld	s3,8(sp)
    80200508:	6a02                	ld	s4,0(sp)
    8020050a:	6145                	addi	sp,sp,48
    8020050c:	8082                	ret

000000008020050e <kinit>:
    8020050e:	1101                	addi	sp,sp,-32
    80200510:	ec06                	sd	ra,24(sp)
    80200512:	e822                	sd	s0,16(sp)
    80200514:	e426                	sd	s1,8(sp)
    80200516:	1000                	addi	s0,sp,32
    80200518:	00014497          	auipc	s1,0x14
    8020051c:	b1048493          	addi	s1,s1,-1264 # 80214028 <kmem>
    80200520:	00009597          	auipc	a1,0x9
    80200524:	e8058593          	addi	a1,a1,-384 # 802093a0 <digits+0x20>
    80200528:	8526                	mv	a0,s1
    8020052a:	00000097          	auipc	ra,0x0
    8020052e:	158080e7          	jalr	344(ra) # 80200682 <initlock>
    80200532:	0004bc23          	sd	zero,24(s1)
    80200536:	0204b023          	sd	zero,32(s1)
    8020053a:	40300593          	li	a1,1027
    8020053e:	05d6                	slli	a1,a1,0x15
    80200540:	0000b517          	auipc	a0,0xb
    80200544:	52053503          	ld	a0,1312(a0) # 8020ba60 <_GLOBAL_OFFSET_TABLE_+0x28>
    80200548:	00000097          	auipc	ra,0x0
    8020054c:	f7a080e7          	jalr	-134(ra) # 802004c2 <freerange>
    80200550:	60e2                	ld	ra,24(sp)
    80200552:	6442                	ld	s0,16(sp)
    80200554:	64a2                	ld	s1,8(sp)
    80200556:	6105                	addi	sp,sp,32
    80200558:	8082                	ret

000000008020055a <kalloc>:
    8020055a:	1101                	addi	sp,sp,-32
    8020055c:	ec06                	sd	ra,24(sp)
    8020055e:	e822                	sd	s0,16(sp)
    80200560:	e426                	sd	s1,8(sp)
    80200562:	1000                	addi	s0,sp,32
    80200564:	00014497          	auipc	s1,0x14
    80200568:	ac448493          	addi	s1,s1,-1340 # 80214028 <kmem>
    8020056c:	8526                	mv	a0,s1
    8020056e:	00000097          	auipc	ra,0x0
    80200572:	158080e7          	jalr	344(ra) # 802006c6 <acquire>
    80200576:	6c84                	ld	s1,24(s1)
    80200578:	c89d                	beqz	s1,802005ae <kalloc+0x54>
    8020057a:	609c                	ld	a5,0(s1)
    8020057c:	00014517          	auipc	a0,0x14
    80200580:	aac50513          	addi	a0,a0,-1364 # 80214028 <kmem>
    80200584:	ed1c                	sd	a5,24(a0)
    80200586:	711c                	ld	a5,32(a0)
    80200588:	17fd                	addi	a5,a5,-1
    8020058a:	f11c                	sd	a5,32(a0)
    8020058c:	00000097          	auipc	ra,0x0
    80200590:	18e080e7          	jalr	398(ra) # 8020071a <release>
    80200594:	6605                	lui	a2,0x1
    80200596:	4595                	li	a1,5
    80200598:	8526                	mv	a0,s1
    8020059a:	00000097          	auipc	ra,0x0
    8020059e:	1c8080e7          	jalr	456(ra) # 80200762 <memset>
    802005a2:	8526                	mv	a0,s1
    802005a4:	60e2                	ld	ra,24(sp)
    802005a6:	6442                	ld	s0,16(sp)
    802005a8:	64a2                	ld	s1,8(sp)
    802005aa:	6105                	addi	sp,sp,32
    802005ac:	8082                	ret
    802005ae:	00014517          	auipc	a0,0x14
    802005b2:	a7a50513          	addi	a0,a0,-1414 # 80214028 <kmem>
    802005b6:	00000097          	auipc	ra,0x0
    802005ba:	164080e7          	jalr	356(ra) # 8020071a <release>
    802005be:	b7d5                	j	802005a2 <kalloc+0x48>

00000000802005c0 <freemem_amount>:
    802005c0:	1141                	addi	sp,sp,-16
    802005c2:	e422                	sd	s0,8(sp)
    802005c4:	0800                	addi	s0,sp,16
    802005c6:	00014517          	auipc	a0,0x14
    802005ca:	a8253503          	ld	a0,-1406(a0) # 80214048 <kmem+0x20>
    802005ce:	0532                	slli	a0,a0,0xc
    802005d0:	6422                	ld	s0,8(sp)
    802005d2:	0141                	addi	sp,sp,16
    802005d4:	8082                	ret

00000000802005d6 <push_off>:
    802005d6:	1101                	addi	sp,sp,-32
    802005d8:	ec06                	sd	ra,24(sp)
    802005da:	e822                	sd	s0,16(sp)
    802005dc:	e426                	sd	s1,8(sp)
    802005de:	1000                	addi	s0,sp,32
    802005e0:	100024f3          	csrr	s1,sstatus
    802005e4:	100027f3          	csrr	a5,sstatus
    802005e8:	9bf5                	andi	a5,a5,-3
    802005ea:	10079073          	csrw	sstatus,a5
    802005ee:	00001097          	auipc	ra,0x1
    802005f2:	436080e7          	jalr	1078(ra) # 80201a24 <mycpu>
    802005f6:	5d3c                	lw	a5,120(a0)
    802005f8:	cf89                	beqz	a5,80200612 <push_off+0x3c>
    802005fa:	00001097          	auipc	ra,0x1
    802005fe:	42a080e7          	jalr	1066(ra) # 80201a24 <mycpu>
    80200602:	5d3c                	lw	a5,120(a0)
    80200604:	2785                	addiw	a5,a5,1
    80200606:	dd3c                	sw	a5,120(a0)
    80200608:	60e2                	ld	ra,24(sp)
    8020060a:	6442                	ld	s0,16(sp)
    8020060c:	64a2                	ld	s1,8(sp)
    8020060e:	6105                	addi	sp,sp,32
    80200610:	8082                	ret
    80200612:	00001097          	auipc	ra,0x1
    80200616:	412080e7          	jalr	1042(ra) # 80201a24 <mycpu>
    8020061a:	8085                	srli	s1,s1,0x1
    8020061c:	8885                	andi	s1,s1,1
    8020061e:	dd64                	sw	s1,124(a0)
    80200620:	bfe9                	j	802005fa <push_off+0x24>

0000000080200622 <pop_off>:
    80200622:	1141                	addi	sp,sp,-16
    80200624:	e406                	sd	ra,8(sp)
    80200626:	e022                	sd	s0,0(sp)
    80200628:	0800                	addi	s0,sp,16
    8020062a:	00001097          	auipc	ra,0x1
    8020062e:	3fa080e7          	jalr	1018(ra) # 80201a24 <mycpu>
    80200632:	100027f3          	csrr	a5,sstatus
    80200636:	8b89                	andi	a5,a5,2
    80200638:	e78d                	bnez	a5,80200662 <pop_off+0x40>
    8020063a:	5d3c                	lw	a5,120(a0)
    8020063c:	02f05b63          	blez	a5,80200672 <pop_off+0x50>
    80200640:	37fd                	addiw	a5,a5,-1
    80200642:	0007871b          	sext.w	a4,a5
    80200646:	dd3c                	sw	a5,120(a0)
    80200648:	eb09                	bnez	a4,8020065a <pop_off+0x38>
    8020064a:	5d7c                	lw	a5,124(a0)
    8020064c:	c799                	beqz	a5,8020065a <pop_off+0x38>
    8020064e:	100027f3          	csrr	a5,sstatus
    80200652:	0027e793          	ori	a5,a5,2
    80200656:	10079073          	csrw	sstatus,a5
    8020065a:	60a2                	ld	ra,8(sp)
    8020065c:	6402                	ld	s0,0(sp)
    8020065e:	0141                	addi	sp,sp,16
    80200660:	8082                	ret
    80200662:	00009517          	auipc	a0,0x9
    80200666:	d4650513          	addi	a0,a0,-698 # 802093a8 <digits+0x28>
    8020066a:	00000097          	auipc	ra,0x0
    8020066e:	ada080e7          	jalr	-1318(ra) # 80200144 <panic>
    80200672:	00009517          	auipc	a0,0x9
    80200676:	d4e50513          	addi	a0,a0,-690 # 802093c0 <digits+0x40>
    8020067a:	00000097          	auipc	ra,0x0
    8020067e:	aca080e7          	jalr	-1334(ra) # 80200144 <panic>

0000000080200682 <initlock>:
    80200682:	1141                	addi	sp,sp,-16
    80200684:	e422                	sd	s0,8(sp)
    80200686:	0800                	addi	s0,sp,16
    80200688:	e50c                	sd	a1,8(a0)
    8020068a:	00052023          	sw	zero,0(a0)
    8020068e:	00053823          	sd	zero,16(a0)
    80200692:	6422                	ld	s0,8(sp)
    80200694:	0141                	addi	sp,sp,16
    80200696:	8082                	ret

0000000080200698 <holding>:
    80200698:	411c                	lw	a5,0(a0)
    8020069a:	e399                	bnez	a5,802006a0 <holding+0x8>
    8020069c:	4501                	li	a0,0
    8020069e:	8082                	ret
    802006a0:	1101                	addi	sp,sp,-32
    802006a2:	ec06                	sd	ra,24(sp)
    802006a4:	e822                	sd	s0,16(sp)
    802006a6:	e426                	sd	s1,8(sp)
    802006a8:	1000                	addi	s0,sp,32
    802006aa:	6904                	ld	s1,16(a0)
    802006ac:	00001097          	auipc	ra,0x1
    802006b0:	378080e7          	jalr	888(ra) # 80201a24 <mycpu>
    802006b4:	40a48533          	sub	a0,s1,a0
    802006b8:	00153513          	seqz	a0,a0
    802006bc:	60e2                	ld	ra,24(sp)
    802006be:	6442                	ld	s0,16(sp)
    802006c0:	64a2                	ld	s1,8(sp)
    802006c2:	6105                	addi	sp,sp,32
    802006c4:	8082                	ret

00000000802006c6 <acquire>:
    802006c6:	1101                	addi	sp,sp,-32
    802006c8:	ec06                	sd	ra,24(sp)
    802006ca:	e822                	sd	s0,16(sp)
    802006cc:	e426                	sd	s1,8(sp)
    802006ce:	1000                	addi	s0,sp,32
    802006d0:	84aa                	mv	s1,a0
    802006d2:	00000097          	auipc	ra,0x0
    802006d6:	f04080e7          	jalr	-252(ra) # 802005d6 <push_off>
    802006da:	8526                	mv	a0,s1
    802006dc:	00000097          	auipc	ra,0x0
    802006e0:	fbc080e7          	jalr	-68(ra) # 80200698 <holding>
    802006e4:	4705                	li	a4,1
    802006e6:	e115                	bnez	a0,8020070a <acquire+0x44>
    802006e8:	87ba                	mv	a5,a4
    802006ea:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    802006ee:	2781                	sext.w	a5,a5
    802006f0:	ffe5                	bnez	a5,802006e8 <acquire+0x22>
    802006f2:	0ff0000f          	fence
    802006f6:	00001097          	auipc	ra,0x1
    802006fa:	32e080e7          	jalr	814(ra) # 80201a24 <mycpu>
    802006fe:	e888                	sd	a0,16(s1)
    80200700:	60e2                	ld	ra,24(sp)
    80200702:	6442                	ld	s0,16(sp)
    80200704:	64a2                	ld	s1,8(sp)
    80200706:	6105                	addi	sp,sp,32
    80200708:	8082                	ret
    8020070a:	00009517          	auipc	a0,0x9
    8020070e:	cbe50513          	addi	a0,a0,-834 # 802093c8 <digits+0x48>
    80200712:	00000097          	auipc	ra,0x0
    80200716:	a32080e7          	jalr	-1486(ra) # 80200144 <panic>

000000008020071a <release>:
    8020071a:	1101                	addi	sp,sp,-32
    8020071c:	ec06                	sd	ra,24(sp)
    8020071e:	e822                	sd	s0,16(sp)
    80200720:	e426                	sd	s1,8(sp)
    80200722:	1000                	addi	s0,sp,32
    80200724:	84aa                	mv	s1,a0
    80200726:	00000097          	auipc	ra,0x0
    8020072a:	f72080e7          	jalr	-142(ra) # 80200698 <holding>
    8020072e:	c115                	beqz	a0,80200752 <release+0x38>
    80200730:	0004b823          	sd	zero,16(s1)
    80200734:	0ff0000f          	fence
    80200738:	0f50000f          	fence	iorw,ow
    8020073c:	0804a02f          	amoswap.w	zero,zero,(s1)
    80200740:	00000097          	auipc	ra,0x0
    80200744:	ee2080e7          	jalr	-286(ra) # 80200622 <pop_off>
    80200748:	60e2                	ld	ra,24(sp)
    8020074a:	6442                	ld	s0,16(sp)
    8020074c:	64a2                	ld	s1,8(sp)
    8020074e:	6105                	addi	sp,sp,32
    80200750:	8082                	ret
    80200752:	00009517          	auipc	a0,0x9
    80200756:	c7e50513          	addi	a0,a0,-898 # 802093d0 <digits+0x50>
    8020075a:	00000097          	auipc	ra,0x0
    8020075e:	9ea080e7          	jalr	-1558(ra) # 80200144 <panic>

0000000080200762 <memset>:
    80200762:	1141                	addi	sp,sp,-16
    80200764:	e422                	sd	s0,8(sp)
    80200766:	0800                	addi	s0,sp,16
    80200768:	ca19                	beqz	a2,8020077e <memset+0x1c>
    8020076a:	87aa                	mv	a5,a0
    8020076c:	1602                	slli	a2,a2,0x20
    8020076e:	9201                	srli	a2,a2,0x20
    80200770:	00a60733          	add	a4,a2,a0
    80200774:	00b78023          	sb	a1,0(a5)
    80200778:	0785                	addi	a5,a5,1
    8020077a:	fee79de3          	bne	a5,a4,80200774 <memset+0x12>
    8020077e:	6422                	ld	s0,8(sp)
    80200780:	0141                	addi	sp,sp,16
    80200782:	8082                	ret

0000000080200784 <memcmp>:
    80200784:	1141                	addi	sp,sp,-16
    80200786:	e422                	sd	s0,8(sp)
    80200788:	0800                	addi	s0,sp,16
    8020078a:	ca05                	beqz	a2,802007ba <memcmp+0x36>
    8020078c:	fff6069b          	addiw	a3,a2,-1 # fff <_entry-0x801ff001>
    80200790:	1682                	slli	a3,a3,0x20
    80200792:	9281                	srli	a3,a3,0x20
    80200794:	0685                	addi	a3,a3,1
    80200796:	96aa                	add	a3,a3,a0
    80200798:	00054783          	lbu	a5,0(a0)
    8020079c:	0005c703          	lbu	a4,0(a1)
    802007a0:	00e79863          	bne	a5,a4,802007b0 <memcmp+0x2c>
    802007a4:	0505                	addi	a0,a0,1
    802007a6:	0585                	addi	a1,a1,1
    802007a8:	fed518e3          	bne	a0,a3,80200798 <memcmp+0x14>
    802007ac:	4501                	li	a0,0
    802007ae:	a019                	j	802007b4 <memcmp+0x30>
    802007b0:	40e7853b          	subw	a0,a5,a4
    802007b4:	6422                	ld	s0,8(sp)
    802007b6:	0141                	addi	sp,sp,16
    802007b8:	8082                	ret
    802007ba:	4501                	li	a0,0
    802007bc:	bfe5                	j	802007b4 <memcmp+0x30>

00000000802007be <memmove>:
    802007be:	1141                	addi	sp,sp,-16
    802007c0:	e422                	sd	s0,8(sp)
    802007c2:	0800                	addi	s0,sp,16
    802007c4:	02a5e563          	bltu	a1,a0,802007ee <memmove+0x30>
    802007c8:	fff6069b          	addiw	a3,a2,-1
    802007cc:	ce11                	beqz	a2,802007e8 <memmove+0x2a>
    802007ce:	1682                	slli	a3,a3,0x20
    802007d0:	9281                	srli	a3,a3,0x20
    802007d2:	0685                	addi	a3,a3,1
    802007d4:	96ae                	add	a3,a3,a1
    802007d6:	87aa                	mv	a5,a0
    802007d8:	0585                	addi	a1,a1,1
    802007da:	0785                	addi	a5,a5,1
    802007dc:	fff5c703          	lbu	a4,-1(a1)
    802007e0:	fee78fa3          	sb	a4,-1(a5)
    802007e4:	fed59ae3          	bne	a1,a3,802007d8 <memmove+0x1a>
    802007e8:	6422                	ld	s0,8(sp)
    802007ea:	0141                	addi	sp,sp,16
    802007ec:	8082                	ret
    802007ee:	02061713          	slli	a4,a2,0x20
    802007f2:	9301                	srli	a4,a4,0x20
    802007f4:	00e587b3          	add	a5,a1,a4
    802007f8:	fcf578e3          	bgeu	a0,a5,802007c8 <memmove+0xa>
    802007fc:	972a                	add	a4,a4,a0
    802007fe:	fff6069b          	addiw	a3,a2,-1
    80200802:	d27d                	beqz	a2,802007e8 <memmove+0x2a>
    80200804:	02069613          	slli	a2,a3,0x20
    80200808:	9201                	srli	a2,a2,0x20
    8020080a:	fff64613          	not	a2,a2
    8020080e:	963e                	add	a2,a2,a5
    80200810:	17fd                	addi	a5,a5,-1
    80200812:	177d                	addi	a4,a4,-1 # ffffffffffffefff <ebss_clear+0xffffffff7fdd8fff>
    80200814:	0007c683          	lbu	a3,0(a5)
    80200818:	00d70023          	sb	a3,0(a4)
    8020081c:	fef61ae3          	bne	a2,a5,80200810 <memmove+0x52>
    80200820:	b7e1                	j	802007e8 <memmove+0x2a>

0000000080200822 <memcpy>:
    80200822:	1141                	addi	sp,sp,-16
    80200824:	e406                	sd	ra,8(sp)
    80200826:	e022                	sd	s0,0(sp)
    80200828:	0800                	addi	s0,sp,16
    8020082a:	00000097          	auipc	ra,0x0
    8020082e:	f94080e7          	jalr	-108(ra) # 802007be <memmove>
    80200832:	60a2                	ld	ra,8(sp)
    80200834:	6402                	ld	s0,0(sp)
    80200836:	0141                	addi	sp,sp,16
    80200838:	8082                	ret

000000008020083a <strncmp>:
    8020083a:	1141                	addi	sp,sp,-16
    8020083c:	e422                	sd	s0,8(sp)
    8020083e:	0800                	addi	s0,sp,16
    80200840:	ce11                	beqz	a2,8020085c <strncmp+0x22>
    80200842:	00054783          	lbu	a5,0(a0)
    80200846:	cf89                	beqz	a5,80200860 <strncmp+0x26>
    80200848:	0005c703          	lbu	a4,0(a1)
    8020084c:	00f71a63          	bne	a4,a5,80200860 <strncmp+0x26>
    80200850:	367d                	addiw	a2,a2,-1
    80200852:	0505                	addi	a0,a0,1
    80200854:	0585                	addi	a1,a1,1
    80200856:	f675                	bnez	a2,80200842 <strncmp+0x8>
    80200858:	4501                	li	a0,0
    8020085a:	a809                	j	8020086c <strncmp+0x32>
    8020085c:	4501                	li	a0,0
    8020085e:	a039                	j	8020086c <strncmp+0x32>
    80200860:	ca09                	beqz	a2,80200872 <strncmp+0x38>
    80200862:	00054503          	lbu	a0,0(a0)
    80200866:	0005c783          	lbu	a5,0(a1)
    8020086a:	9d1d                	subw	a0,a0,a5
    8020086c:	6422                	ld	s0,8(sp)
    8020086e:	0141                	addi	sp,sp,16
    80200870:	8082                	ret
    80200872:	4501                	li	a0,0
    80200874:	bfe5                	j	8020086c <strncmp+0x32>

0000000080200876 <strncpy>:
    80200876:	1141                	addi	sp,sp,-16
    80200878:	e422                	sd	s0,8(sp)
    8020087a:	0800                	addi	s0,sp,16
    8020087c:	87aa                	mv	a5,a0
    8020087e:	86b2                	mv	a3,a2
    80200880:	367d                	addiw	a2,a2,-1
    80200882:	00d05963          	blez	a3,80200894 <strncpy+0x1e>
    80200886:	0785                	addi	a5,a5,1
    80200888:	0005c703          	lbu	a4,0(a1)
    8020088c:	fee78fa3          	sb	a4,-1(a5)
    80200890:	0585                	addi	a1,a1,1
    80200892:	f775                	bnez	a4,8020087e <strncpy+0x8>
    80200894:	873e                	mv	a4,a5
    80200896:	9fb5                	addw	a5,a5,a3
    80200898:	37fd                	addiw	a5,a5,-1
    8020089a:	00c05963          	blez	a2,802008ac <strncpy+0x36>
    8020089e:	0705                	addi	a4,a4,1
    802008a0:	fe070fa3          	sb	zero,-1(a4)
    802008a4:	40e786bb          	subw	a3,a5,a4
    802008a8:	fed04be3          	bgtz	a3,8020089e <strncpy+0x28>
    802008ac:	6422                	ld	s0,8(sp)
    802008ae:	0141                	addi	sp,sp,16
    802008b0:	8082                	ret

00000000802008b2 <safestrcpy>:
    802008b2:	1141                	addi	sp,sp,-16
    802008b4:	e422                	sd	s0,8(sp)
    802008b6:	0800                	addi	s0,sp,16
    802008b8:	02c05363          	blez	a2,802008de <safestrcpy+0x2c>
    802008bc:	fff6069b          	addiw	a3,a2,-1
    802008c0:	1682                	slli	a3,a3,0x20
    802008c2:	9281                	srli	a3,a3,0x20
    802008c4:	96ae                	add	a3,a3,a1
    802008c6:	87aa                	mv	a5,a0
    802008c8:	00d58963          	beq	a1,a3,802008da <safestrcpy+0x28>
    802008cc:	0585                	addi	a1,a1,1
    802008ce:	0785                	addi	a5,a5,1
    802008d0:	fff5c703          	lbu	a4,-1(a1)
    802008d4:	fee78fa3          	sb	a4,-1(a5)
    802008d8:	fb65                	bnez	a4,802008c8 <safestrcpy+0x16>
    802008da:	00078023          	sb	zero,0(a5)
    802008de:	6422                	ld	s0,8(sp)
    802008e0:	0141                	addi	sp,sp,16
    802008e2:	8082                	ret

00000000802008e4 <strlen>:
    802008e4:	1141                	addi	sp,sp,-16
    802008e6:	e422                	sd	s0,8(sp)
    802008e8:	0800                	addi	s0,sp,16
    802008ea:	00054783          	lbu	a5,0(a0)
    802008ee:	cf91                	beqz	a5,8020090a <strlen+0x26>
    802008f0:	0505                	addi	a0,a0,1
    802008f2:	87aa                	mv	a5,a0
    802008f4:	86be                	mv	a3,a5
    802008f6:	0785                	addi	a5,a5,1
    802008f8:	fff7c703          	lbu	a4,-1(a5)
    802008fc:	ff65                	bnez	a4,802008f4 <strlen+0x10>
    802008fe:	40a6853b          	subw	a0,a3,a0
    80200902:	2505                	addiw	a0,a0,1
    80200904:	6422                	ld	s0,8(sp)
    80200906:	0141                	addi	sp,sp,16
    80200908:	8082                	ret
    8020090a:	4501                	li	a0,0
    8020090c:	bfe5                	j	80200904 <strlen+0x20>

000000008020090e <wnstr>:
    8020090e:	1141                	addi	sp,sp,-16
    80200910:	e422                	sd	s0,8(sp)
    80200912:	0800                	addi	s0,sp,16
    80200914:	c20d                	beqz	a2,80200936 <wnstr+0x28>
    80200916:	02061793          	slli	a5,a2,0x20
    8020091a:	01f7d613          	srli	a2,a5,0x1f
    8020091e:	00c50733          	add	a4,a0,a2
    80200922:	0005c783          	lbu	a5,0(a1)
    80200926:	cb81                	beqz	a5,80200936 <wnstr+0x28>
    80200928:	0585                	addi	a1,a1,1
    8020092a:	00f50023          	sb	a5,0(a0)
    8020092e:	0509                	addi	a0,a0,2
    80200930:	fee519e3          	bne	a0,a4,80200922 <wnstr+0x14>
    80200934:	853a                	mv	a0,a4
    80200936:	00051023          	sh	zero,0(a0)
    8020093a:	6422                	ld	s0,8(sp)
    8020093c:	0141                	addi	sp,sp,16
    8020093e:	8082                	ret

0000000080200940 <snstr>:
    80200940:	1141                	addi	sp,sp,-16
    80200942:	e422                	sd	s0,8(sp)
    80200944:	0800                	addi	s0,sp,16
    80200946:	fff6071b          	addiw	a4,a2,-1
    8020094a:	02061693          	slli	a3,a2,0x20
    8020094e:	9281                	srli	a3,a3,0x20
    80200950:	96aa                	add	a3,a3,a0
    80200952:	c61d                	beqz	a2,80200980 <snstr+0x40>
    80200954:	0005d783          	lhu	a5,0(a1)
    80200958:	cb89                	beqz	a5,8020096a <snstr+0x2a>
    8020095a:	0505                	addi	a0,a0,1
    8020095c:	fef50fa3          	sb	a5,-1(a0)
    80200960:	0589                	addi	a1,a1,2
    80200962:	377d                	addiw	a4,a4,-1
    80200964:	fed518e3          	bne	a0,a3,80200954 <snstr+0x14>
    80200968:	8536                	mv	a0,a3
    8020096a:	02071793          	slli	a5,a4,0x20
    8020096e:	9381                	srli	a5,a5,0x20
    80200970:	97aa                	add	a5,a5,a0
    80200972:	00e05763          	blez	a4,80200980 <snstr+0x40>
    80200976:	0505                	addi	a0,a0,1
    80200978:	fe050fa3          	sb	zero,-1(a0)
    8020097c:	fea79de3          	bne	a5,a0,80200976 <snstr+0x36>
    80200980:	6422                	ld	s0,8(sp)
    80200982:	0141                	addi	sp,sp,16
    80200984:	8082                	ret

0000000080200986 <wcsncmp>:
    80200986:	1141                	addi	sp,sp,-16
    80200988:	e422                	sd	s0,8(sp)
    8020098a:	0800                	addi	s0,sp,16
    8020098c:	872a                	mv	a4,a0
    8020098e:	02061793          	slli	a5,a2,0x20
    80200992:	01f7d613          	srli	a2,a5,0x1f
    80200996:	962e                	add	a2,a2,a1
    80200998:	00c58f63          	beq	a1,a2,802009b6 <wcsncmp+0x30>
    8020099c:	00075783          	lhu	a5,0(a4)
    802009a0:	cb89                	beqz	a5,802009b2 <wcsncmp+0x2c>
    802009a2:	0709                	addi	a4,a4,2
    802009a4:	0589                	addi	a1,a1,2
    802009a6:	ffe5d683          	lhu	a3,-2(a1)
    802009aa:	40d7853b          	subw	a0,a5,a3
    802009ae:	d56d                	beqz	a0,80200998 <wcsncmp+0x12>
    802009b0:	a021                	j	802009b8 <wcsncmp+0x32>
    802009b2:	4501                	li	a0,0
    802009b4:	a011                	j	802009b8 <wcsncmp+0x32>
    802009b6:	4501                	li	a0,0
    802009b8:	6422                	ld	s0,8(sp)
    802009ba:	0141                	addi	sp,sp,16
    802009bc:	8082                	ret

00000000802009be <strchr>:
    802009be:	1141                	addi	sp,sp,-16
    802009c0:	e422                	sd	s0,8(sp)
    802009c2:	0800                	addi	s0,sp,16
    802009c4:	00054783          	lbu	a5,0(a0)
    802009c8:	cb99                	beqz	a5,802009de <strchr+0x20>
    802009ca:	00f58763          	beq	a1,a5,802009d8 <strchr+0x1a>
    802009ce:	0505                	addi	a0,a0,1
    802009d0:	00054783          	lbu	a5,0(a0)
    802009d4:	fbfd                	bnez	a5,802009ca <strchr+0xc>
    802009d6:	4501                	li	a0,0
    802009d8:	6422                	ld	s0,8(sp)
    802009da:	0141                	addi	sp,sp,16
    802009dc:	8082                	ret
    802009de:	4501                	li	a0,0
    802009e0:	bfe5                	j	802009d8 <strchr+0x1a>

00000000802009e2 <main>:
    802009e2:	1101                	addi	sp,sp,-32
    802009e4:	ec06                	sd	ra,24(sp)
    802009e6:	e822                	sd	s0,16(sp)
    802009e8:	1000                	addi	s0,sp,32
    802009ea:	00157793          	andi	a5,a0,1
    802009ee:	823e                	mv	tp,a5
    802009f0:	00013717          	auipc	a4,0x13
    802009f4:	66070713          	addi	a4,a4,1632 # 80214050 <started>
    802009f8:	cd15                	beqz	a0,80200a34 <main+0x52>
    802009fa:	431c                	lw	a5,0(a4)
    802009fc:	2781                	sext.w	a5,a5
    802009fe:	dff5                	beqz	a5,802009fa <main+0x18>
    80200a00:	0ff0000f          	fence
    80200a04:	00000097          	auipc	ra,0x0
    80200a08:	0de080e7          	jalr	222(ra) # 80200ae2 <kvminithart>
    80200a0c:	00002097          	auipc	ra,0x2
    80200a10:	cc2080e7          	jalr	-830(ra) # 802026ce <trapinithart>
    80200a14:	00006097          	auipc	ra,0x6
    80200a18:	f0e080e7          	jalr	-242(ra) # 80206922 <plicinithart>
    80200a1c:	00009517          	auipc	a0,0x9
    80200a20:	9d450513          	addi	a0,a0,-1580 # 802093f0 <digits+0x70>
    80200a24:	fffff097          	auipc	ra,0xfffff
    80200a28:	76a080e7          	jalr	1898(ra) # 8020018e <printf>
    80200a2c:	00001097          	auipc	ra,0x1
    80200a30:	598080e7          	jalr	1432(ra) # 80201fc4 <scheduler>
    80200a34:	00006097          	auipc	ra,0x6
    80200a38:	2f6080e7          	jalr	758(ra) # 80206d2a <consoleinit>
    80200a3c:	00000097          	auipc	ra,0x0
    80200a40:	932080e7          	jalr	-1742(ra) # 8020036e <printfinit>
    80200a44:	00000097          	auipc	ra,0x0
    80200a48:	95c080e7          	jalr	-1700(ra) # 802003a0 <print_logo>
    80200a4c:	00000097          	auipc	ra,0x0
    80200a50:	ac2080e7          	jalr	-1342(ra) # 8020050e <kinit>
    80200a54:	00000097          	auipc	ra,0x0
    80200a58:	2d8080e7          	jalr	728(ra) # 80200d2c <kvminit>
    80200a5c:	00000097          	auipc	ra,0x0
    80200a60:	086080e7          	jalr	134(ra) # 80200ae2 <kvminithart>
    80200a64:	00004097          	auipc	ra,0x4
    80200a68:	47a080e7          	jalr	1146(ra) # 80204ede <timerinit>
    80200a6c:	00002097          	auipc	ra,0x2
    80200a70:	c62080e7          	jalr	-926(ra) # 802026ce <trapinithart>
    80200a74:	00001097          	auipc	ra,0x1
    80200a78:	f2a080e7          	jalr	-214(ra) # 8020199e <procinit>
    80200a7c:	00006097          	auipc	ra,0x6
    80200a80:	e8e080e7          	jalr	-370(ra) # 8020690a <plicinit>
    80200a84:	00006097          	auipc	ra,0x6
    80200a88:	e9e080e7          	jalr	-354(ra) # 80206922 <plicinithart>
    80200a8c:	00004097          	auipc	ra,0x4
    80200a90:	4ee080e7          	jalr	1262(ra) # 80204f7a <disk_init>
    80200a94:	00003097          	auipc	ra,0x3
    80200a98:	84c080e7          	jalr	-1972(ra) # 802032e0 <binit>
    80200a9c:	00003097          	auipc	ra,0x3
    80200aa0:	c4e080e7          	jalr	-946(ra) # 802036ea <fileinit>
    80200aa4:	00001097          	auipc	ra,0x1
    80200aa8:	2aa080e7          	jalr	682(ra) # 80201d4e <userinit>
    80200aac:	00009517          	auipc	a0,0x9
    80200ab0:	92c50513          	addi	a0,a0,-1748 # 802093d8 <digits+0x58>
    80200ab4:	fffff097          	auipc	ra,0xfffff
    80200ab8:	6da080e7          	jalr	1754(ra) # 8020018e <printf>
    80200abc:	4789                	li	a5,2
    80200abe:	fef43423          	sd	a5,-24(s0)
    80200ac2:	fe840513          	addi	a0,s0,-24
    80200ac6:	4581                	li	a1,0
    80200ac8:	4601                	li	a2,0
    80200aca:	4681                	li	a3,0
    80200acc:	4891                	li	a7,4
    80200ace:	00000073          	ecall
    80200ad2:	0ff0000f          	fence
    80200ad6:	4785                	li	a5,1
    80200ad8:	00013717          	auipc	a4,0x13
    80200adc:	56f72c23          	sw	a5,1400(a4) # 80214050 <started>
    80200ae0:	b7b1                	j	80200a2c <main+0x4a>

0000000080200ae2 <kvminithart>:
    80200ae2:	1141                	addi	sp,sp,-16
    80200ae4:	e422                	sd	s0,8(sp)
    80200ae6:	0800                	addi	s0,sp,16
    80200ae8:	00013797          	auipc	a5,0x13
    80200aec:	5707b783          	ld	a5,1392(a5) # 80214058 <kernel_pagetable>
    80200af0:	83b1                	srli	a5,a5,0xc
    80200af2:	577d                	li	a4,-1
    80200af4:	177e                	slli	a4,a4,0x3f
    80200af6:	8fd9                	or	a5,a5,a4
    80200af8:	18079073          	csrw	satp,a5
    80200afc:	12000073          	sfence.vma
    80200b00:	6422                	ld	s0,8(sp)
    80200b02:	0141                	addi	sp,sp,16
    80200b04:	8082                	ret

0000000080200b06 <walk>:
    80200b06:	7139                	addi	sp,sp,-64
    80200b08:	fc06                	sd	ra,56(sp)
    80200b0a:	f822                	sd	s0,48(sp)
    80200b0c:	f426                	sd	s1,40(sp)
    80200b0e:	f04a                	sd	s2,32(sp)
    80200b10:	ec4e                	sd	s3,24(sp)
    80200b12:	e852                	sd	s4,16(sp)
    80200b14:	e456                	sd	s5,8(sp)
    80200b16:	e05a                	sd	s6,0(sp)
    80200b18:	0080                	addi	s0,sp,64
    80200b1a:	84aa                	mv	s1,a0
    80200b1c:	89ae                	mv	s3,a1
    80200b1e:	8ab2                	mv	s5,a2
    80200b20:	57fd                	li	a5,-1
    80200b22:	83e9                	srli	a5,a5,0x1a
    80200b24:	4a79                	li	s4,30
    80200b26:	4b31                	li	s6,12
    80200b28:	04b7f263          	bgeu	a5,a1,80200b6c <walk+0x66>
    80200b2c:	00009517          	auipc	a0,0x9
    80200b30:	8dc50513          	addi	a0,a0,-1828 # 80209408 <digits+0x88>
    80200b34:	fffff097          	auipc	ra,0xfffff
    80200b38:	610080e7          	jalr	1552(ra) # 80200144 <panic>
    80200b3c:	060a8663          	beqz	s5,80200ba8 <walk+0xa2>
    80200b40:	00000097          	auipc	ra,0x0
    80200b44:	a1a080e7          	jalr	-1510(ra) # 8020055a <kalloc>
    80200b48:	84aa                	mv	s1,a0
    80200b4a:	c529                	beqz	a0,80200b94 <walk+0x8e>
    80200b4c:	6605                	lui	a2,0x1
    80200b4e:	4581                	li	a1,0
    80200b50:	00000097          	auipc	ra,0x0
    80200b54:	c12080e7          	jalr	-1006(ra) # 80200762 <memset>
    80200b58:	00c4d793          	srli	a5,s1,0xc
    80200b5c:	07aa                	slli	a5,a5,0xa
    80200b5e:	0017e793          	ori	a5,a5,1
    80200b62:	00f93023          	sd	a5,0(s2)
    80200b66:	3a5d                	addiw	s4,s4,-9 # ffffffffffffeff7 <ebss_clear+0xffffffff7fdd8ff7>
    80200b68:	036a0063          	beq	s4,s6,80200b88 <walk+0x82>
    80200b6c:	0149d933          	srl	s2,s3,s4
    80200b70:	1ff97913          	andi	s2,s2,511
    80200b74:	090e                	slli	s2,s2,0x3
    80200b76:	9926                	add	s2,s2,s1
    80200b78:	00093483          	ld	s1,0(s2)
    80200b7c:	0014f793          	andi	a5,s1,1
    80200b80:	dfd5                	beqz	a5,80200b3c <walk+0x36>
    80200b82:	80a9                	srli	s1,s1,0xa
    80200b84:	04b2                	slli	s1,s1,0xc
    80200b86:	b7c5                	j	80200b66 <walk+0x60>
    80200b88:	00c9d513          	srli	a0,s3,0xc
    80200b8c:	1ff57513          	andi	a0,a0,511
    80200b90:	050e                	slli	a0,a0,0x3
    80200b92:	9526                	add	a0,a0,s1
    80200b94:	70e2                	ld	ra,56(sp)
    80200b96:	7442                	ld	s0,48(sp)
    80200b98:	74a2                	ld	s1,40(sp)
    80200b9a:	7902                	ld	s2,32(sp)
    80200b9c:	69e2                	ld	s3,24(sp)
    80200b9e:	6a42                	ld	s4,16(sp)
    80200ba0:	6aa2                	ld	s5,8(sp)
    80200ba2:	6b02                	ld	s6,0(sp)
    80200ba4:	6121                	addi	sp,sp,64
    80200ba6:	8082                	ret
    80200ba8:	4501                	li	a0,0
    80200baa:	b7ed                	j	80200b94 <walk+0x8e>

0000000080200bac <walkaddr>:
    80200bac:	57fd                	li	a5,-1
    80200bae:	83e9                	srli	a5,a5,0x1a
    80200bb0:	00b7f463          	bgeu	a5,a1,80200bb8 <walkaddr+0xc>
    80200bb4:	4501                	li	a0,0
    80200bb6:	8082                	ret
    80200bb8:	1141                	addi	sp,sp,-16
    80200bba:	e406                	sd	ra,8(sp)
    80200bbc:	e022                	sd	s0,0(sp)
    80200bbe:	0800                	addi	s0,sp,16
    80200bc0:	4601                	li	a2,0
    80200bc2:	00000097          	auipc	ra,0x0
    80200bc6:	f44080e7          	jalr	-188(ra) # 80200b06 <walk>
    80200bca:	c105                	beqz	a0,80200bea <walkaddr+0x3e>
    80200bcc:	611c                	ld	a5,0(a0)
    80200bce:	0117f693          	andi	a3,a5,17
    80200bd2:	4745                	li	a4,17
    80200bd4:	4501                	li	a0,0
    80200bd6:	00e68663          	beq	a3,a4,80200be2 <walkaddr+0x36>
    80200bda:	60a2                	ld	ra,8(sp)
    80200bdc:	6402                	ld	s0,0(sp)
    80200bde:	0141                	addi	sp,sp,16
    80200be0:	8082                	ret
    80200be2:	83a9                	srli	a5,a5,0xa
    80200be4:	00c79513          	slli	a0,a5,0xc
    80200be8:	bfcd                	j	80200bda <walkaddr+0x2e>
    80200bea:	4501                	li	a0,0
    80200bec:	b7fd                	j	80200bda <walkaddr+0x2e>

0000000080200bee <kwalkaddr>:
    80200bee:	1101                	addi	sp,sp,-32
    80200bf0:	ec06                	sd	ra,24(sp)
    80200bf2:	e822                	sd	s0,16(sp)
    80200bf4:	e426                	sd	s1,8(sp)
    80200bf6:	1000                	addi	s0,sp,32
    80200bf8:	03459793          	slli	a5,a1,0x34
    80200bfc:	0347d493          	srli	s1,a5,0x34
    80200c00:	4601                	li	a2,0
    80200c02:	00000097          	auipc	ra,0x0
    80200c06:	f04080e7          	jalr	-252(ra) # 80200b06 <walk>
    80200c0a:	cd09                	beqz	a0,80200c24 <kwalkaddr+0x36>
    80200c0c:	6108                	ld	a0,0(a0)
    80200c0e:	00157793          	andi	a5,a0,1
    80200c12:	c38d                	beqz	a5,80200c34 <kwalkaddr+0x46>
    80200c14:	8129                	srli	a0,a0,0xa
    80200c16:	0532                	slli	a0,a0,0xc
    80200c18:	9526                	add	a0,a0,s1
    80200c1a:	60e2                	ld	ra,24(sp)
    80200c1c:	6442                	ld	s0,16(sp)
    80200c1e:	64a2                	ld	s1,8(sp)
    80200c20:	6105                	addi	sp,sp,32
    80200c22:	8082                	ret
    80200c24:	00008517          	auipc	a0,0x8
    80200c28:	7ec50513          	addi	a0,a0,2028 # 80209410 <digits+0x90>
    80200c2c:	fffff097          	auipc	ra,0xfffff
    80200c30:	518080e7          	jalr	1304(ra) # 80200144 <panic>
    80200c34:	00008517          	auipc	a0,0x8
    80200c38:	7dc50513          	addi	a0,a0,2012 # 80209410 <digits+0x90>
    80200c3c:	fffff097          	auipc	ra,0xfffff
    80200c40:	508080e7          	jalr	1288(ra) # 80200144 <panic>

0000000080200c44 <kvmpa>:
    80200c44:	1141                	addi	sp,sp,-16
    80200c46:	e406                	sd	ra,8(sp)
    80200c48:	e022                	sd	s0,0(sp)
    80200c4a:	0800                	addi	s0,sp,16
    80200c4c:	85aa                	mv	a1,a0
    80200c4e:	00013517          	auipc	a0,0x13
    80200c52:	40a53503          	ld	a0,1034(a0) # 80214058 <kernel_pagetable>
    80200c56:	00000097          	auipc	ra,0x0
    80200c5a:	f98080e7          	jalr	-104(ra) # 80200bee <kwalkaddr>
    80200c5e:	60a2                	ld	ra,8(sp)
    80200c60:	6402                	ld	s0,0(sp)
    80200c62:	0141                	addi	sp,sp,16
    80200c64:	8082                	ret

0000000080200c66 <mappages>:
    80200c66:	715d                	addi	sp,sp,-80
    80200c68:	e486                	sd	ra,72(sp)
    80200c6a:	e0a2                	sd	s0,64(sp)
    80200c6c:	fc26                	sd	s1,56(sp)
    80200c6e:	f84a                	sd	s2,48(sp)
    80200c70:	f44e                	sd	s3,40(sp)
    80200c72:	f052                	sd	s4,32(sp)
    80200c74:	ec56                	sd	s5,24(sp)
    80200c76:	e85a                	sd	s6,16(sp)
    80200c78:	e45e                	sd	s7,8(sp)
    80200c7a:	0880                	addi	s0,sp,80
    80200c7c:	8aaa                	mv	s5,a0
    80200c7e:	8b3a                	mv	s6,a4
    80200c80:	777d                	lui	a4,0xfffff
    80200c82:	00e5f7b3          	and	a5,a1,a4
    80200c86:	fff60993          	addi	s3,a2,-1 # fff <_entry-0x801ff001>
    80200c8a:	99ae                	add	s3,s3,a1
    80200c8c:	00e9f9b3          	and	s3,s3,a4
    80200c90:	893e                	mv	s2,a5
    80200c92:	40f68a33          	sub	s4,a3,a5
    80200c96:	6b85                	lui	s7,0x1
    80200c98:	012a04b3          	add	s1,s4,s2
    80200c9c:	4605                	li	a2,1
    80200c9e:	85ca                	mv	a1,s2
    80200ca0:	8556                	mv	a0,s5
    80200ca2:	00000097          	auipc	ra,0x0
    80200ca6:	e64080e7          	jalr	-412(ra) # 80200b06 <walk>
    80200caa:	c51d                	beqz	a0,80200cd8 <mappages+0x72>
    80200cac:	611c                	ld	a5,0(a0)
    80200cae:	8b85                	andi	a5,a5,1
    80200cb0:	ef81                	bnez	a5,80200cc8 <mappages+0x62>
    80200cb2:	80b1                	srli	s1,s1,0xc
    80200cb4:	04aa                	slli	s1,s1,0xa
    80200cb6:	0164e4b3          	or	s1,s1,s6
    80200cba:	0014e493          	ori	s1,s1,1
    80200cbe:	e104                	sd	s1,0(a0)
    80200cc0:	03390863          	beq	s2,s3,80200cf0 <mappages+0x8a>
    80200cc4:	995e                	add	s2,s2,s7
    80200cc6:	bfc9                	j	80200c98 <mappages+0x32>
    80200cc8:	00008517          	auipc	a0,0x8
    80200ccc:	75050513          	addi	a0,a0,1872 # 80209418 <digits+0x98>
    80200cd0:	fffff097          	auipc	ra,0xfffff
    80200cd4:	474080e7          	jalr	1140(ra) # 80200144 <panic>
    80200cd8:	557d                	li	a0,-1
    80200cda:	60a6                	ld	ra,72(sp)
    80200cdc:	6406                	ld	s0,64(sp)
    80200cde:	74e2                	ld	s1,56(sp)
    80200ce0:	7942                	ld	s2,48(sp)
    80200ce2:	79a2                	ld	s3,40(sp)
    80200ce4:	7a02                	ld	s4,32(sp)
    80200ce6:	6ae2                	ld	s5,24(sp)
    80200ce8:	6b42                	ld	s6,16(sp)
    80200cea:	6ba2                	ld	s7,8(sp)
    80200cec:	6161                	addi	sp,sp,80
    80200cee:	8082                	ret
    80200cf0:	4501                	li	a0,0
    80200cf2:	b7e5                	j	80200cda <mappages+0x74>

0000000080200cf4 <kvmmap>:
    80200cf4:	1141                	addi	sp,sp,-16
    80200cf6:	e406                	sd	ra,8(sp)
    80200cf8:	e022                	sd	s0,0(sp)
    80200cfa:	0800                	addi	s0,sp,16
    80200cfc:	8736                	mv	a4,a3
    80200cfe:	86ae                	mv	a3,a1
    80200d00:	85aa                	mv	a1,a0
    80200d02:	00013517          	auipc	a0,0x13
    80200d06:	35653503          	ld	a0,854(a0) # 80214058 <kernel_pagetable>
    80200d0a:	00000097          	auipc	ra,0x0
    80200d0e:	f5c080e7          	jalr	-164(ra) # 80200c66 <mappages>
    80200d12:	e509                	bnez	a0,80200d1c <kvmmap+0x28>
    80200d14:	60a2                	ld	ra,8(sp)
    80200d16:	6402                	ld	s0,0(sp)
    80200d18:	0141                	addi	sp,sp,16
    80200d1a:	8082                	ret
    80200d1c:	00008517          	auipc	a0,0x8
    80200d20:	70450513          	addi	a0,a0,1796 # 80209420 <digits+0xa0>
    80200d24:	fffff097          	auipc	ra,0xfffff
    80200d28:	420080e7          	jalr	1056(ra) # 80200144 <panic>

0000000080200d2c <kvminit>:
    80200d2c:	1101                	addi	sp,sp,-32
    80200d2e:	ec06                	sd	ra,24(sp)
    80200d30:	e822                	sd	s0,16(sp)
    80200d32:	e426                	sd	s1,8(sp)
    80200d34:	1000                	addi	s0,sp,32
    80200d36:	00000097          	auipc	ra,0x0
    80200d3a:	824080e7          	jalr	-2012(ra) # 8020055a <kalloc>
    80200d3e:	00013717          	auipc	a4,0x13
    80200d42:	30a73d23          	sd	a0,794(a4) # 80214058 <kernel_pagetable>
    80200d46:	6605                	lui	a2,0x1
    80200d48:	4581                	li	a1,0
    80200d4a:	00000097          	auipc	ra,0x0
    80200d4e:	a18080e7          	jalr	-1512(ra) # 80200762 <memset>
    80200d52:	4699                	li	a3,6
    80200d54:	6605                	lui	a2,0x1
    80200d56:	100005b7          	lui	a1,0x10000
    80200d5a:	3f100513          	li	a0,1009
    80200d5e:	0572                	slli	a0,a0,0x1c
    80200d60:	00000097          	auipc	ra,0x0
    80200d64:	f94080e7          	jalr	-108(ra) # 80200cf4 <kvmmap>
    80200d68:	4699                	li	a3,6
    80200d6a:	6605                	lui	a2,0x1
    80200d6c:	100015b7          	lui	a1,0x10001
    80200d70:	03f10537          	lui	a0,0x3f10
    80200d74:	0505                	addi	a0,a0,1 # 3f10001 <_entry-0x7c2effff>
    80200d76:	0532                	slli	a0,a0,0xc
    80200d78:	00000097          	auipc	ra,0x0
    80200d7c:	f7c080e7          	jalr	-132(ra) # 80200cf4 <kvmmap>
    80200d80:	4699                	li	a3,6
    80200d82:	6641                	lui	a2,0x10
    80200d84:	020005b7          	lui	a1,0x2000
    80200d88:	01f81537          	lui	a0,0x1f81
    80200d8c:	0536                	slli	a0,a0,0xd
    80200d8e:	00000097          	auipc	ra,0x0
    80200d92:	f66080e7          	jalr	-154(ra) # 80200cf4 <kvmmap>
    80200d96:	4699                	li	a3,6
    80200d98:	6611                	lui	a2,0x4
    80200d9a:	0c0005b7          	lui	a1,0xc000
    80200d9e:	00fc3537          	lui	a0,0xfc3
    80200da2:	053a                	slli	a0,a0,0xe
    80200da4:	00000097          	auipc	ra,0x0
    80200da8:	f50080e7          	jalr	-176(ra) # 80200cf4 <kvmmap>
    80200dac:	4699                	li	a3,6
    80200dae:	6611                	lui	a2,0x4
    80200db0:	0c2005b7          	lui	a1,0xc200
    80200db4:	1f861537          	lui	a0,0x1f861
    80200db8:	0526                	slli	a0,a0,0x9
    80200dba:	00000097          	auipc	ra,0x0
    80200dbe:	f3a080e7          	jalr	-198(ra) # 80200cf4 <kvmmap>
    80200dc2:	0000b497          	auipc	s1,0xb
    80200dc6:	c964b483          	ld	s1,-874(s1) # 8020ba58 <_GLOBAL_OFFSET_TABLE_+0x20>
    80200dca:	46a9                	li	a3,10
    80200dcc:	bff00613          	li	a2,-1025
    80200dd0:	0656                	slli	a2,a2,0x15
    80200dd2:	9626                	add	a2,a2,s1
    80200dd4:	40100593          	li	a1,1025
    80200dd8:	05d6                	slli	a1,a1,0x15
    80200dda:	852e                	mv	a0,a1
    80200ddc:	00000097          	auipc	ra,0x0
    80200de0:	f18080e7          	jalr	-232(ra) # 80200cf4 <kvmmap>
    80200de4:	4699                	li	a3,6
    80200de6:	40300613          	li	a2,1027
    80200dea:	0656                	slli	a2,a2,0x15
    80200dec:	8e05                	sub	a2,a2,s1
    80200dee:	85a6                	mv	a1,s1
    80200df0:	8526                	mv	a0,s1
    80200df2:	00000097          	auipc	ra,0x0
    80200df6:	f02080e7          	jalr	-254(ra) # 80200cf4 <kvmmap>
    80200dfa:	46a9                	li	a3,10
    80200dfc:	6605                	lui	a2,0x1
    80200dfe:	0000b597          	auipc	a1,0xb
    80200e02:	c425b583          	ld	a1,-958(a1) # 8020ba40 <_GLOBAL_OFFSET_TABLE_+0x8>
    80200e06:	04000537          	lui	a0,0x4000
    80200e0a:	157d                	addi	a0,a0,-1 # 3ffffff <_entry-0x7c200001>
    80200e0c:	0532                	slli	a0,a0,0xc
    80200e0e:	00000097          	auipc	ra,0x0
    80200e12:	ee6080e7          	jalr	-282(ra) # 80200cf4 <kvmmap>
    80200e16:	60e2                	ld	ra,24(sp)
    80200e18:	6442                	ld	s0,16(sp)
    80200e1a:	64a2                	ld	s1,8(sp)
    80200e1c:	6105                	addi	sp,sp,32
    80200e1e:	8082                	ret

0000000080200e20 <vmunmap>:
    80200e20:	715d                	addi	sp,sp,-80
    80200e22:	e486                	sd	ra,72(sp)
    80200e24:	e0a2                	sd	s0,64(sp)
    80200e26:	fc26                	sd	s1,56(sp)
    80200e28:	f84a                	sd	s2,48(sp)
    80200e2a:	f44e                	sd	s3,40(sp)
    80200e2c:	f052                	sd	s4,32(sp)
    80200e2e:	ec56                	sd	s5,24(sp)
    80200e30:	e85a                	sd	s6,16(sp)
    80200e32:	e45e                	sd	s7,8(sp)
    80200e34:	0880                	addi	s0,sp,80
    80200e36:	03459793          	slli	a5,a1,0x34
    80200e3a:	e795                	bnez	a5,80200e66 <vmunmap+0x46>
    80200e3c:	8a2a                	mv	s4,a0
    80200e3e:	892e                	mv	s2,a1
    80200e40:	8ab6                	mv	s5,a3
    80200e42:	0632                	slli	a2,a2,0xc
    80200e44:	00b609b3          	add	s3,a2,a1
    80200e48:	4b85                	li	s7,1
    80200e4a:	6b05                	lui	s6,0x1
    80200e4c:	0735e263          	bltu	a1,s3,80200eb0 <vmunmap+0x90>
    80200e50:	60a6                	ld	ra,72(sp)
    80200e52:	6406                	ld	s0,64(sp)
    80200e54:	74e2                	ld	s1,56(sp)
    80200e56:	7942                	ld	s2,48(sp)
    80200e58:	79a2                	ld	s3,40(sp)
    80200e5a:	7a02                	ld	s4,32(sp)
    80200e5c:	6ae2                	ld	s5,24(sp)
    80200e5e:	6b42                	ld	s6,16(sp)
    80200e60:	6ba2                	ld	s7,8(sp)
    80200e62:	6161                	addi	sp,sp,80
    80200e64:	8082                	ret
    80200e66:	00008517          	auipc	a0,0x8
    80200e6a:	5c250513          	addi	a0,a0,1474 # 80209428 <digits+0xa8>
    80200e6e:	fffff097          	auipc	ra,0xfffff
    80200e72:	2d6080e7          	jalr	726(ra) # 80200144 <panic>
    80200e76:	00008517          	auipc	a0,0x8
    80200e7a:	5ca50513          	addi	a0,a0,1482 # 80209440 <digits+0xc0>
    80200e7e:	fffff097          	auipc	ra,0xfffff
    80200e82:	2c6080e7          	jalr	710(ra) # 80200144 <panic>
    80200e86:	00008517          	auipc	a0,0x8
    80200e8a:	5ca50513          	addi	a0,a0,1482 # 80209450 <digits+0xd0>
    80200e8e:	fffff097          	auipc	ra,0xfffff
    80200e92:	2b6080e7          	jalr	694(ra) # 80200144 <panic>
    80200e96:	00008517          	auipc	a0,0x8
    80200e9a:	5d250513          	addi	a0,a0,1490 # 80209468 <digits+0xe8>
    80200e9e:	fffff097          	auipc	ra,0xfffff
    80200ea2:	2a6080e7          	jalr	678(ra) # 80200144 <panic>
    80200ea6:	0004b023          	sd	zero,0(s1)
    80200eaa:	995a                	add	s2,s2,s6
    80200eac:	fb3972e3          	bgeu	s2,s3,80200e50 <vmunmap+0x30>
    80200eb0:	4601                	li	a2,0
    80200eb2:	85ca                	mv	a1,s2
    80200eb4:	8552                	mv	a0,s4
    80200eb6:	00000097          	auipc	ra,0x0
    80200eba:	c50080e7          	jalr	-944(ra) # 80200b06 <walk>
    80200ebe:	84aa                	mv	s1,a0
    80200ec0:	d95d                	beqz	a0,80200e76 <vmunmap+0x56>
    80200ec2:	6108                	ld	a0,0(a0)
    80200ec4:	00157793          	andi	a5,a0,1
    80200ec8:	dfdd                	beqz	a5,80200e86 <vmunmap+0x66>
    80200eca:	3ff57793          	andi	a5,a0,1023
    80200ece:	fd7784e3          	beq	a5,s7,80200e96 <vmunmap+0x76>
    80200ed2:	fc0a8ae3          	beqz	s5,80200ea6 <vmunmap+0x86>
    80200ed6:	8129                	srli	a0,a0,0xa
    80200ed8:	0532                	slli	a0,a0,0xc
    80200eda:	fffff097          	auipc	ra,0xfffff
    80200ede:	566080e7          	jalr	1382(ra) # 80200440 <kfree>
    80200ee2:	b7d1                	j	80200ea6 <vmunmap+0x86>

0000000080200ee4 <uvmcreate>:
    80200ee4:	1101                	addi	sp,sp,-32
    80200ee6:	ec06                	sd	ra,24(sp)
    80200ee8:	e822                	sd	s0,16(sp)
    80200eea:	e426                	sd	s1,8(sp)
    80200eec:	1000                	addi	s0,sp,32
    80200eee:	fffff097          	auipc	ra,0xfffff
    80200ef2:	66c080e7          	jalr	1644(ra) # 8020055a <kalloc>
    80200ef6:	84aa                	mv	s1,a0
    80200ef8:	c519                	beqz	a0,80200f06 <uvmcreate+0x22>
    80200efa:	6605                	lui	a2,0x1
    80200efc:	4581                	li	a1,0
    80200efe:	00000097          	auipc	ra,0x0
    80200f02:	864080e7          	jalr	-1948(ra) # 80200762 <memset>
    80200f06:	8526                	mv	a0,s1
    80200f08:	60e2                	ld	ra,24(sp)
    80200f0a:	6442                	ld	s0,16(sp)
    80200f0c:	64a2                	ld	s1,8(sp)
    80200f0e:	6105                	addi	sp,sp,32
    80200f10:	8082                	ret

0000000080200f12 <uvminit>:
    80200f12:	7139                	addi	sp,sp,-64
    80200f14:	fc06                	sd	ra,56(sp)
    80200f16:	f822                	sd	s0,48(sp)
    80200f18:	f426                	sd	s1,40(sp)
    80200f1a:	f04a                	sd	s2,32(sp)
    80200f1c:	ec4e                	sd	s3,24(sp)
    80200f1e:	e852                	sd	s4,16(sp)
    80200f20:	e456                	sd	s5,8(sp)
    80200f22:	0080                	addi	s0,sp,64
    80200f24:	6785                	lui	a5,0x1
    80200f26:	06f6f363          	bgeu	a3,a5,80200f8c <uvminit+0x7a>
    80200f2a:	8aaa                	mv	s5,a0
    80200f2c:	8a2e                	mv	s4,a1
    80200f2e:	89b2                	mv	s3,a2
    80200f30:	8936                	mv	s2,a3
    80200f32:	fffff097          	auipc	ra,0xfffff
    80200f36:	628080e7          	jalr	1576(ra) # 8020055a <kalloc>
    80200f3a:	84aa                	mv	s1,a0
    80200f3c:	6605                	lui	a2,0x1
    80200f3e:	4581                	li	a1,0
    80200f40:	00000097          	auipc	ra,0x0
    80200f44:	822080e7          	jalr	-2014(ra) # 80200762 <memset>
    80200f48:	4779                	li	a4,30
    80200f4a:	86a6                	mv	a3,s1
    80200f4c:	6605                	lui	a2,0x1
    80200f4e:	4581                	li	a1,0
    80200f50:	8556                	mv	a0,s5
    80200f52:	00000097          	auipc	ra,0x0
    80200f56:	d14080e7          	jalr	-748(ra) # 80200c66 <mappages>
    80200f5a:	4739                	li	a4,14
    80200f5c:	86a6                	mv	a3,s1
    80200f5e:	6605                	lui	a2,0x1
    80200f60:	4581                	li	a1,0
    80200f62:	8552                	mv	a0,s4
    80200f64:	00000097          	auipc	ra,0x0
    80200f68:	d02080e7          	jalr	-766(ra) # 80200c66 <mappages>
    80200f6c:	864a                	mv	a2,s2
    80200f6e:	85ce                	mv	a1,s3
    80200f70:	8526                	mv	a0,s1
    80200f72:	00000097          	auipc	ra,0x0
    80200f76:	84c080e7          	jalr	-1972(ra) # 802007be <memmove>
    80200f7a:	70e2                	ld	ra,56(sp)
    80200f7c:	7442                	ld	s0,48(sp)
    80200f7e:	74a2                	ld	s1,40(sp)
    80200f80:	7902                	ld	s2,32(sp)
    80200f82:	69e2                	ld	s3,24(sp)
    80200f84:	6a42                	ld	s4,16(sp)
    80200f86:	6aa2                	ld	s5,8(sp)
    80200f88:	6121                	addi	sp,sp,64
    80200f8a:	8082                	ret
    80200f8c:	00008517          	auipc	a0,0x8
    80200f90:	4f450513          	addi	a0,a0,1268 # 80209480 <digits+0x100>
    80200f94:	fffff097          	auipc	ra,0xfffff
    80200f98:	1b0080e7          	jalr	432(ra) # 80200144 <panic>

0000000080200f9c <uvmdealloc>:
    80200f9c:	7179                	addi	sp,sp,-48
    80200f9e:	f406                	sd	ra,40(sp)
    80200fa0:	f022                	sd	s0,32(sp)
    80200fa2:	ec26                	sd	s1,24(sp)
    80200fa4:	e84a                	sd	s2,16(sp)
    80200fa6:	e44e                	sd	s3,8(sp)
    80200fa8:	e052                	sd	s4,0(sp)
    80200faa:	1800                	addi	s0,sp,48
    80200fac:	8932                	mv	s2,a2
    80200fae:	02c6f063          	bgeu	a3,a2,80200fce <uvmdealloc+0x32>
    80200fb2:	89aa                	mv	s3,a0
    80200fb4:	852e                	mv	a0,a1
    80200fb6:	8936                	mv	s2,a3
    80200fb8:	6785                	lui	a5,0x1
    80200fba:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    80200fbc:	00f68a33          	add	s4,a3,a5
    80200fc0:	777d                	lui	a4,0xfffff
    80200fc2:	00ea7a33          	and	s4,s4,a4
    80200fc6:	963e                	add	a2,a2,a5
    80200fc8:	8e79                	and	a2,a2,a4
    80200fca:	00ca6b63          	bltu	s4,a2,80200fe0 <uvmdealloc+0x44>
    80200fce:	854a                	mv	a0,s2
    80200fd0:	70a2                	ld	ra,40(sp)
    80200fd2:	7402                	ld	s0,32(sp)
    80200fd4:	64e2                	ld	s1,24(sp)
    80200fd6:	6942                	ld	s2,16(sp)
    80200fd8:	69a2                	ld	s3,8(sp)
    80200fda:	6a02                	ld	s4,0(sp)
    80200fdc:	6145                	addi	sp,sp,48
    80200fde:	8082                	ret
    80200fe0:	414604b3          	sub	s1,a2,s4
    80200fe4:	80b1                	srli	s1,s1,0xc
    80200fe6:	2481                	sext.w	s1,s1
    80200fe8:	4681                	li	a3,0
    80200fea:	8626                	mv	a2,s1
    80200fec:	85d2                	mv	a1,s4
    80200fee:	00000097          	auipc	ra,0x0
    80200ff2:	e32080e7          	jalr	-462(ra) # 80200e20 <vmunmap>
    80200ff6:	4685                	li	a3,1
    80200ff8:	8626                	mv	a2,s1
    80200ffa:	85d2                	mv	a1,s4
    80200ffc:	854e                	mv	a0,s3
    80200ffe:	00000097          	auipc	ra,0x0
    80201002:	e22080e7          	jalr	-478(ra) # 80200e20 <vmunmap>
    80201006:	b7e1                	j	80200fce <uvmdealloc+0x32>

0000000080201008 <uvmalloc>:
    80201008:	0ec6e763          	bltu	a3,a2,802010f6 <uvmalloc+0xee>
    8020100c:	7139                	addi	sp,sp,-64
    8020100e:	fc06                	sd	ra,56(sp)
    80201010:	f822                	sd	s0,48(sp)
    80201012:	f426                	sd	s1,40(sp)
    80201014:	f04a                	sd	s2,32(sp)
    80201016:	ec4e                	sd	s3,24(sp)
    80201018:	e852                	sd	s4,16(sp)
    8020101a:	e456                	sd	s5,8(sp)
    8020101c:	e05a                	sd	s6,0(sp)
    8020101e:	0080                	addi	s0,sp,64
    80201020:	8a2a                	mv	s4,a0
    80201022:	8aae                	mv	s5,a1
    80201024:	8b36                	mv	s6,a3
    80201026:	6785                	lui	a5,0x1
    80201028:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    8020102a:	963e                	add	a2,a2,a5
    8020102c:	77fd                	lui	a5,0xfffff
    8020102e:	00f679b3          	and	s3,a2,a5
    80201032:	0cd9f463          	bgeu	s3,a3,802010fa <uvmalloc+0xf2>
    80201036:	894e                	mv	s2,s3
    80201038:	fffff097          	auipc	ra,0xfffff
    8020103c:	522080e7          	jalr	1314(ra) # 8020055a <kalloc>
    80201040:	84aa                	mv	s1,a0
    80201042:	c129                	beqz	a0,80201084 <uvmalloc+0x7c>
    80201044:	6605                	lui	a2,0x1
    80201046:	4581                	li	a1,0
    80201048:	fffff097          	auipc	ra,0xfffff
    8020104c:	71a080e7          	jalr	1818(ra) # 80200762 <memset>
    80201050:	4779                	li	a4,30
    80201052:	86a6                	mv	a3,s1
    80201054:	6605                	lui	a2,0x1
    80201056:	85ca                	mv	a1,s2
    80201058:	8552                	mv	a0,s4
    8020105a:	00000097          	auipc	ra,0x0
    8020105e:	c0c080e7          	jalr	-1012(ra) # 80200c66 <mappages>
    80201062:	e521                	bnez	a0,802010aa <uvmalloc+0xa2>
    80201064:	4739                	li	a4,14
    80201066:	86a6                	mv	a3,s1
    80201068:	6605                	lui	a2,0x1
    8020106a:	85ca                	mv	a1,s2
    8020106c:	8556                	mv	a0,s5
    8020106e:	00000097          	auipc	ra,0x0
    80201072:	bf8080e7          	jalr	-1032(ra) # 80200c66 <mappages>
    80201076:	e929                	bnez	a0,802010c8 <uvmalloc+0xc0>
    80201078:	6785                	lui	a5,0x1
    8020107a:	993e                	add	s2,s2,a5
    8020107c:	fb696ee3          	bltu	s2,s6,80201038 <uvmalloc+0x30>
    80201080:	855a                	mv	a0,s6
    80201082:	a811                	j	80201096 <uvmalloc+0x8e>
    80201084:	86ce                	mv	a3,s3
    80201086:	864a                	mv	a2,s2
    80201088:	85d6                	mv	a1,s5
    8020108a:	8552                	mv	a0,s4
    8020108c:	00000097          	auipc	ra,0x0
    80201090:	f10080e7          	jalr	-240(ra) # 80200f9c <uvmdealloc>
    80201094:	4501                	li	a0,0
    80201096:	70e2                	ld	ra,56(sp)
    80201098:	7442                	ld	s0,48(sp)
    8020109a:	74a2                	ld	s1,40(sp)
    8020109c:	7902                	ld	s2,32(sp)
    8020109e:	69e2                	ld	s3,24(sp)
    802010a0:	6a42                	ld	s4,16(sp)
    802010a2:	6aa2                	ld	s5,8(sp)
    802010a4:	6b02                	ld	s6,0(sp)
    802010a6:	6121                	addi	sp,sp,64
    802010a8:	8082                	ret
    802010aa:	8526                	mv	a0,s1
    802010ac:	fffff097          	auipc	ra,0xfffff
    802010b0:	394080e7          	jalr	916(ra) # 80200440 <kfree>
    802010b4:	86ce                	mv	a3,s3
    802010b6:	864a                	mv	a2,s2
    802010b8:	85d6                	mv	a1,s5
    802010ba:	8552                	mv	a0,s4
    802010bc:	00000097          	auipc	ra,0x0
    802010c0:	ee0080e7          	jalr	-288(ra) # 80200f9c <uvmdealloc>
    802010c4:	4501                	li	a0,0
    802010c6:	bfc1                	j	80201096 <uvmalloc+0x8e>
    802010c8:	41390633          	sub	a2,s2,s3
    802010cc:	8231                	srli	a2,a2,0xc
    802010ce:	0006049b          	sext.w	s1,a2
    802010d2:	4685                	li	a3,1
    802010d4:	2605                	addiw	a2,a2,1 # 1001 <_entry-0x801fefff>
    802010d6:	85ce                	mv	a1,s3
    802010d8:	8552                	mv	a0,s4
    802010da:	00000097          	auipc	ra,0x0
    802010de:	d46080e7          	jalr	-698(ra) # 80200e20 <vmunmap>
    802010e2:	4681                	li	a3,0
    802010e4:	8626                	mv	a2,s1
    802010e6:	85ce                	mv	a1,s3
    802010e8:	8556                	mv	a0,s5
    802010ea:	00000097          	auipc	ra,0x0
    802010ee:	d36080e7          	jalr	-714(ra) # 80200e20 <vmunmap>
    802010f2:	4501                	li	a0,0
    802010f4:	b74d                	j	80201096 <uvmalloc+0x8e>
    802010f6:	8532                	mv	a0,a2
    802010f8:	8082                	ret
    802010fa:	8536                	mv	a0,a3
    802010fc:	bf69                	j	80201096 <uvmalloc+0x8e>

00000000802010fe <freewalk>:
    802010fe:	7179                	addi	sp,sp,-48
    80201100:	f406                	sd	ra,40(sp)
    80201102:	f022                	sd	s0,32(sp)
    80201104:	ec26                	sd	s1,24(sp)
    80201106:	e84a                	sd	s2,16(sp)
    80201108:	e44e                	sd	s3,8(sp)
    8020110a:	e052                	sd	s4,0(sp)
    8020110c:	1800                	addi	s0,sp,48
    8020110e:	8a2a                	mv	s4,a0
    80201110:	84aa                	mv	s1,a0
    80201112:	6905                	lui	s2,0x1
    80201114:	992a                	add	s2,s2,a0
    80201116:	4985                	li	s3,1
    80201118:	a829                	j	80201132 <freewalk+0x34>
    8020111a:	83a9                	srli	a5,a5,0xa
    8020111c:	00c79513          	slli	a0,a5,0xc
    80201120:	00000097          	auipc	ra,0x0
    80201124:	fde080e7          	jalr	-34(ra) # 802010fe <freewalk>
    80201128:	0004b023          	sd	zero,0(s1)
    8020112c:	04a1                	addi	s1,s1,8
    8020112e:	03248163          	beq	s1,s2,80201150 <freewalk+0x52>
    80201132:	609c                	ld	a5,0(s1)
    80201134:	00f7f713          	andi	a4,a5,15
    80201138:	ff3701e3          	beq	a4,s3,8020111a <freewalk+0x1c>
    8020113c:	8b85                	andi	a5,a5,1
    8020113e:	d7fd                	beqz	a5,8020112c <freewalk+0x2e>
    80201140:	00008517          	auipc	a0,0x8
    80201144:	36050513          	addi	a0,a0,864 # 802094a0 <digits+0x120>
    80201148:	fffff097          	auipc	ra,0xfffff
    8020114c:	ffc080e7          	jalr	-4(ra) # 80200144 <panic>
    80201150:	8552                	mv	a0,s4
    80201152:	fffff097          	auipc	ra,0xfffff
    80201156:	2ee080e7          	jalr	750(ra) # 80200440 <kfree>
    8020115a:	70a2                	ld	ra,40(sp)
    8020115c:	7402                	ld	s0,32(sp)
    8020115e:	64e2                	ld	s1,24(sp)
    80201160:	6942                	ld	s2,16(sp)
    80201162:	69a2                	ld	s3,8(sp)
    80201164:	6a02                	ld	s4,0(sp)
    80201166:	6145                	addi	sp,sp,48
    80201168:	8082                	ret

000000008020116a <uvmfree>:
    8020116a:	1101                	addi	sp,sp,-32
    8020116c:	ec06                	sd	ra,24(sp)
    8020116e:	e822                	sd	s0,16(sp)
    80201170:	e426                	sd	s1,8(sp)
    80201172:	1000                	addi	s0,sp,32
    80201174:	84aa                	mv	s1,a0
    80201176:	e999                	bnez	a1,8020118c <uvmfree+0x22>
    80201178:	8526                	mv	a0,s1
    8020117a:	00000097          	auipc	ra,0x0
    8020117e:	f84080e7          	jalr	-124(ra) # 802010fe <freewalk>
    80201182:	60e2                	ld	ra,24(sp)
    80201184:	6442                	ld	s0,16(sp)
    80201186:	64a2                	ld	s1,8(sp)
    80201188:	6105                	addi	sp,sp,32
    8020118a:	8082                	ret
    8020118c:	6785                	lui	a5,0x1
    8020118e:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    80201190:	95be                	add	a1,a1,a5
    80201192:	4685                	li	a3,1
    80201194:	00c5d613          	srli	a2,a1,0xc
    80201198:	4581                	li	a1,0
    8020119a:	00000097          	auipc	ra,0x0
    8020119e:	c86080e7          	jalr	-890(ra) # 80200e20 <vmunmap>
    802011a2:	bfd9                	j	80201178 <uvmfree+0xe>

00000000802011a4 <uvmcopy>:
    802011a4:	10068863          	beqz	a3,802012b4 <uvmcopy+0x110>
    802011a8:	711d                	addi	sp,sp,-96
    802011aa:	ec86                	sd	ra,88(sp)
    802011ac:	e8a2                	sd	s0,80(sp)
    802011ae:	e4a6                	sd	s1,72(sp)
    802011b0:	e0ca                	sd	s2,64(sp)
    802011b2:	fc4e                	sd	s3,56(sp)
    802011b4:	f852                	sd	s4,48(sp)
    802011b6:	f456                	sd	s5,40(sp)
    802011b8:	f05a                	sd	s6,32(sp)
    802011ba:	ec5e                	sd	s7,24(sp)
    802011bc:	e862                	sd	s8,16(sp)
    802011be:	e466                	sd	s9,8(sp)
    802011c0:	1080                	addi	s0,sp,96
    802011c2:	8baa                	mv	s7,a0
    802011c4:	8a2e                	mv	s4,a1
    802011c6:	8b32                	mv	s6,a2
    802011c8:	8ab6                	mv	s5,a3
    802011ca:	4981                	li	s3,0
    802011cc:	a011                	j	802011d0 <uvmcopy+0x2c>
    802011ce:	89a6                	mv	s3,s1
    802011d0:	4601                	li	a2,0
    802011d2:	85ce                	mv	a1,s3
    802011d4:	855e                	mv	a0,s7
    802011d6:	00000097          	auipc	ra,0x0
    802011da:	930080e7          	jalr	-1744(ra) # 80200b06 <walk>
    802011de:	c13d                	beqz	a0,80201244 <uvmcopy+0xa0>
    802011e0:	6118                	ld	a4,0(a0)
    802011e2:	00177793          	andi	a5,a4,1
    802011e6:	c7bd                	beqz	a5,80201254 <uvmcopy+0xb0>
    802011e8:	00a75593          	srli	a1,a4,0xa
    802011ec:	00c59c93          	slli	s9,a1,0xc
    802011f0:	00070c1b          	sext.w	s8,a4
    802011f4:	3ff77493          	andi	s1,a4,1023
    802011f8:	fffff097          	auipc	ra,0xfffff
    802011fc:	362080e7          	jalr	866(ra) # 8020055a <kalloc>
    80201200:	892a                	mv	s2,a0
    80201202:	c925                	beqz	a0,80201272 <uvmcopy+0xce>
    80201204:	6605                	lui	a2,0x1
    80201206:	85e6                	mv	a1,s9
    80201208:	fffff097          	auipc	ra,0xfffff
    8020120c:	5b6080e7          	jalr	1462(ra) # 802007be <memmove>
    80201210:	8726                	mv	a4,s1
    80201212:	86ca                	mv	a3,s2
    80201214:	6605                	lui	a2,0x1
    80201216:	85ce                	mv	a1,s3
    80201218:	8552                	mv	a0,s4
    8020121a:	00000097          	auipc	ra,0x0
    8020121e:	a4c080e7          	jalr	-1460(ra) # 80200c66 <mappages>
    80201222:	e129                	bnez	a0,80201264 <uvmcopy+0xc0>
    80201224:	6485                	lui	s1,0x1
    80201226:	94ce                	add	s1,s1,s3
    80201228:	3efc7713          	andi	a4,s8,1007
    8020122c:	86ca                	mv	a3,s2
    8020122e:	6605                	lui	a2,0x1
    80201230:	85ce                	mv	a1,s3
    80201232:	855a                	mv	a0,s6
    80201234:	00000097          	auipc	ra,0x0
    80201238:	a32080e7          	jalr	-1486(ra) # 80200c66 <mappages>
    8020123c:	ed05                	bnez	a0,80201274 <uvmcopy+0xd0>
    8020123e:	f954e8e3          	bltu	s1,s5,802011ce <uvmcopy+0x2a>
    80201242:	a8a1                	j	8020129a <uvmcopy+0xf6>
    80201244:	00008517          	auipc	a0,0x8
    80201248:	26c50513          	addi	a0,a0,620 # 802094b0 <digits+0x130>
    8020124c:	fffff097          	auipc	ra,0xfffff
    80201250:	ef8080e7          	jalr	-264(ra) # 80200144 <panic>
    80201254:	00008517          	auipc	a0,0x8
    80201258:	27c50513          	addi	a0,a0,636 # 802094d0 <digits+0x150>
    8020125c:	fffff097          	auipc	ra,0xfffff
    80201260:	ee8080e7          	jalr	-280(ra) # 80200144 <panic>
    80201264:	854a                	mv	a0,s2
    80201266:	fffff097          	auipc	ra,0xfffff
    8020126a:	1da080e7          	jalr	474(ra) # 80200440 <kfree>
    8020126e:	84ce                	mv	s1,s3
    80201270:	a011                	j	80201274 <uvmcopy+0xd0>
    80201272:	84ce                	mv	s1,s3
    80201274:	4681                	li	a3,0
    80201276:	00c9d613          	srli	a2,s3,0xc
    8020127a:	4581                	li	a1,0
    8020127c:	855a                	mv	a0,s6
    8020127e:	00000097          	auipc	ra,0x0
    80201282:	ba2080e7          	jalr	-1118(ra) # 80200e20 <vmunmap>
    80201286:	4685                	li	a3,1
    80201288:	00c4d613          	srli	a2,s1,0xc
    8020128c:	4581                	li	a1,0
    8020128e:	8552                	mv	a0,s4
    80201290:	00000097          	auipc	ra,0x0
    80201294:	b90080e7          	jalr	-1136(ra) # 80200e20 <vmunmap>
    80201298:	557d                	li	a0,-1
    8020129a:	60e6                	ld	ra,88(sp)
    8020129c:	6446                	ld	s0,80(sp)
    8020129e:	64a6                	ld	s1,72(sp)
    802012a0:	6906                	ld	s2,64(sp)
    802012a2:	79e2                	ld	s3,56(sp)
    802012a4:	7a42                	ld	s4,48(sp)
    802012a6:	7aa2                	ld	s5,40(sp)
    802012a8:	7b02                	ld	s6,32(sp)
    802012aa:	6be2                	ld	s7,24(sp)
    802012ac:	6c42                	ld	s8,16(sp)
    802012ae:	6ca2                	ld	s9,8(sp)
    802012b0:	6125                	addi	sp,sp,96
    802012b2:	8082                	ret
    802012b4:	4501                	li	a0,0
    802012b6:	8082                	ret

00000000802012b8 <uvmclear>:
    802012b8:	1141                	addi	sp,sp,-16
    802012ba:	e406                	sd	ra,8(sp)
    802012bc:	e022                	sd	s0,0(sp)
    802012be:	0800                	addi	s0,sp,16
    802012c0:	4601                	li	a2,0
    802012c2:	00000097          	auipc	ra,0x0
    802012c6:	844080e7          	jalr	-1980(ra) # 80200b06 <walk>
    802012ca:	c901                	beqz	a0,802012da <uvmclear+0x22>
    802012cc:	611c                	ld	a5,0(a0)
    802012ce:	9bbd                	andi	a5,a5,-17
    802012d0:	e11c                	sd	a5,0(a0)
    802012d2:	60a2                	ld	ra,8(sp)
    802012d4:	6402                	ld	s0,0(sp)
    802012d6:	0141                	addi	sp,sp,16
    802012d8:	8082                	ret
    802012da:	00008517          	auipc	a0,0x8
    802012de:	21650513          	addi	a0,a0,534 # 802094f0 <digits+0x170>
    802012e2:	fffff097          	auipc	ra,0xfffff
    802012e6:	e62080e7          	jalr	-414(ra) # 80200144 <panic>

00000000802012ea <copyout>:
    802012ea:	c6bd                	beqz	a3,80201358 <copyout+0x6e>
    802012ec:	715d                	addi	sp,sp,-80
    802012ee:	e486                	sd	ra,72(sp)
    802012f0:	e0a2                	sd	s0,64(sp)
    802012f2:	fc26                	sd	s1,56(sp)
    802012f4:	f84a                	sd	s2,48(sp)
    802012f6:	f44e                	sd	s3,40(sp)
    802012f8:	f052                	sd	s4,32(sp)
    802012fa:	ec56                	sd	s5,24(sp)
    802012fc:	e85a                	sd	s6,16(sp)
    802012fe:	e45e                	sd	s7,8(sp)
    80201300:	e062                	sd	s8,0(sp)
    80201302:	0880                	addi	s0,sp,80
    80201304:	8b2a                	mv	s6,a0
    80201306:	8c2e                	mv	s8,a1
    80201308:	8a32                	mv	s4,a2
    8020130a:	89b6                	mv	s3,a3
    8020130c:	7bfd                	lui	s7,0xfffff
    8020130e:	6a85                	lui	s5,0x1
    80201310:	a015                	j	80201334 <copyout+0x4a>
    80201312:	9562                	add	a0,a0,s8
    80201314:	0004861b          	sext.w	a2,s1
    80201318:	85d2                	mv	a1,s4
    8020131a:	41250533          	sub	a0,a0,s2
    8020131e:	fffff097          	auipc	ra,0xfffff
    80201322:	4a0080e7          	jalr	1184(ra) # 802007be <memmove>
    80201326:	409989b3          	sub	s3,s3,s1
    8020132a:	9a26                	add	s4,s4,s1
    8020132c:	01590c33          	add	s8,s2,s5
    80201330:	02098263          	beqz	s3,80201354 <copyout+0x6a>
    80201334:	017c7933          	and	s2,s8,s7
    80201338:	85ca                	mv	a1,s2
    8020133a:	855a                	mv	a0,s6
    8020133c:	00000097          	auipc	ra,0x0
    80201340:	870080e7          	jalr	-1936(ra) # 80200bac <walkaddr>
    80201344:	cd01                	beqz	a0,8020135c <copyout+0x72>
    80201346:	418904b3          	sub	s1,s2,s8
    8020134a:	94d6                	add	s1,s1,s5
    8020134c:	fc99f3e3          	bgeu	s3,s1,80201312 <copyout+0x28>
    80201350:	84ce                	mv	s1,s3
    80201352:	b7c1                	j	80201312 <copyout+0x28>
    80201354:	4501                	li	a0,0
    80201356:	a021                	j	8020135e <copyout+0x74>
    80201358:	4501                	li	a0,0
    8020135a:	8082                	ret
    8020135c:	557d                	li	a0,-1
    8020135e:	60a6                	ld	ra,72(sp)
    80201360:	6406                	ld	s0,64(sp)
    80201362:	74e2                	ld	s1,56(sp)
    80201364:	7942                	ld	s2,48(sp)
    80201366:	79a2                	ld	s3,40(sp)
    80201368:	7a02                	ld	s4,32(sp)
    8020136a:	6ae2                	ld	s5,24(sp)
    8020136c:	6b42                	ld	s6,16(sp)
    8020136e:	6ba2                	ld	s7,8(sp)
    80201370:	6c02                	ld	s8,0(sp)
    80201372:	6161                	addi	sp,sp,80
    80201374:	8082                	ret

0000000080201376 <copyout2>:
    80201376:	7179                	addi	sp,sp,-48
    80201378:	f406                	sd	ra,40(sp)
    8020137a:	f022                	sd	s0,32(sp)
    8020137c:	ec26                	sd	s1,24(sp)
    8020137e:	e84a                	sd	s2,16(sp)
    80201380:	e44e                	sd	s3,8(sp)
    80201382:	1800                	addi	s0,sp,48
    80201384:	84aa                	mv	s1,a0
    80201386:	89ae                	mv	s3,a1
    80201388:	8932                	mv	s2,a2
    8020138a:	00000097          	auipc	ra,0x0
    8020138e:	6b6080e7          	jalr	1718(ra) # 80201a40 <myproc>
    80201392:	653c                	ld	a5,72(a0)
    80201394:	01248733          	add	a4,s1,s2
    80201398:	02e7e463          	bltu	a5,a4,802013c0 <copyout2+0x4a>
    8020139c:	02f4f463          	bgeu	s1,a5,802013c4 <copyout2+0x4e>
    802013a0:	0009061b          	sext.w	a2,s2
    802013a4:	85ce                	mv	a1,s3
    802013a6:	8526                	mv	a0,s1
    802013a8:	fffff097          	auipc	ra,0xfffff
    802013ac:	416080e7          	jalr	1046(ra) # 802007be <memmove>
    802013b0:	4501                	li	a0,0
    802013b2:	70a2                	ld	ra,40(sp)
    802013b4:	7402                	ld	s0,32(sp)
    802013b6:	64e2                	ld	s1,24(sp)
    802013b8:	6942                	ld	s2,16(sp)
    802013ba:	69a2                	ld	s3,8(sp)
    802013bc:	6145                	addi	sp,sp,48
    802013be:	8082                	ret
    802013c0:	557d                	li	a0,-1
    802013c2:	bfc5                	j	802013b2 <copyout2+0x3c>
    802013c4:	557d                	li	a0,-1
    802013c6:	b7f5                	j	802013b2 <copyout2+0x3c>

00000000802013c8 <copyin>:
    802013c8:	caa5                	beqz	a3,80201438 <copyin+0x70>
    802013ca:	715d                	addi	sp,sp,-80
    802013cc:	e486                	sd	ra,72(sp)
    802013ce:	e0a2                	sd	s0,64(sp)
    802013d0:	fc26                	sd	s1,56(sp)
    802013d2:	f84a                	sd	s2,48(sp)
    802013d4:	f44e                	sd	s3,40(sp)
    802013d6:	f052                	sd	s4,32(sp)
    802013d8:	ec56                	sd	s5,24(sp)
    802013da:	e85a                	sd	s6,16(sp)
    802013dc:	e45e                	sd	s7,8(sp)
    802013de:	e062                	sd	s8,0(sp)
    802013e0:	0880                	addi	s0,sp,80
    802013e2:	8b2a                	mv	s6,a0
    802013e4:	8a2e                	mv	s4,a1
    802013e6:	8c32                	mv	s8,a2
    802013e8:	89b6                	mv	s3,a3
    802013ea:	7bfd                	lui	s7,0xfffff
    802013ec:	6a85                	lui	s5,0x1
    802013ee:	a01d                	j	80201414 <copyin+0x4c>
    802013f0:	018505b3          	add	a1,a0,s8
    802013f4:	0004861b          	sext.w	a2,s1
    802013f8:	412585b3          	sub	a1,a1,s2
    802013fc:	8552                	mv	a0,s4
    802013fe:	fffff097          	auipc	ra,0xfffff
    80201402:	3c0080e7          	jalr	960(ra) # 802007be <memmove>
    80201406:	409989b3          	sub	s3,s3,s1
    8020140a:	9a26                	add	s4,s4,s1
    8020140c:	01590c33          	add	s8,s2,s5
    80201410:	02098263          	beqz	s3,80201434 <copyin+0x6c>
    80201414:	017c7933          	and	s2,s8,s7
    80201418:	85ca                	mv	a1,s2
    8020141a:	855a                	mv	a0,s6
    8020141c:	fffff097          	auipc	ra,0xfffff
    80201420:	790080e7          	jalr	1936(ra) # 80200bac <walkaddr>
    80201424:	cd01                	beqz	a0,8020143c <copyin+0x74>
    80201426:	418904b3          	sub	s1,s2,s8
    8020142a:	94d6                	add	s1,s1,s5
    8020142c:	fc99f2e3          	bgeu	s3,s1,802013f0 <copyin+0x28>
    80201430:	84ce                	mv	s1,s3
    80201432:	bf7d                	j	802013f0 <copyin+0x28>
    80201434:	4501                	li	a0,0
    80201436:	a021                	j	8020143e <copyin+0x76>
    80201438:	4501                	li	a0,0
    8020143a:	8082                	ret
    8020143c:	557d                	li	a0,-1
    8020143e:	60a6                	ld	ra,72(sp)
    80201440:	6406                	ld	s0,64(sp)
    80201442:	74e2                	ld	s1,56(sp)
    80201444:	7942                	ld	s2,48(sp)
    80201446:	79a2                	ld	s3,40(sp)
    80201448:	7a02                	ld	s4,32(sp)
    8020144a:	6ae2                	ld	s5,24(sp)
    8020144c:	6b42                	ld	s6,16(sp)
    8020144e:	6ba2                	ld	s7,8(sp)
    80201450:	6c02                	ld	s8,0(sp)
    80201452:	6161                	addi	sp,sp,80
    80201454:	8082                	ret

0000000080201456 <copyin2>:
    80201456:	7179                	addi	sp,sp,-48
    80201458:	f406                	sd	ra,40(sp)
    8020145a:	f022                	sd	s0,32(sp)
    8020145c:	ec26                	sd	s1,24(sp)
    8020145e:	e84a                	sd	s2,16(sp)
    80201460:	e44e                	sd	s3,8(sp)
    80201462:	1800                	addi	s0,sp,48
    80201464:	89aa                	mv	s3,a0
    80201466:	84ae                	mv	s1,a1
    80201468:	8932                	mv	s2,a2
    8020146a:	00000097          	auipc	ra,0x0
    8020146e:	5d6080e7          	jalr	1494(ra) # 80201a40 <myproc>
    80201472:	653c                	ld	a5,72(a0)
    80201474:	01248733          	add	a4,s1,s2
    80201478:	02e7e463          	bltu	a5,a4,802014a0 <copyin2+0x4a>
    8020147c:	02f4f463          	bgeu	s1,a5,802014a4 <copyin2+0x4e>
    80201480:	0009061b          	sext.w	a2,s2
    80201484:	85a6                	mv	a1,s1
    80201486:	854e                	mv	a0,s3
    80201488:	fffff097          	auipc	ra,0xfffff
    8020148c:	336080e7          	jalr	822(ra) # 802007be <memmove>
    80201490:	4501                	li	a0,0
    80201492:	70a2                	ld	ra,40(sp)
    80201494:	7402                	ld	s0,32(sp)
    80201496:	64e2                	ld	s1,24(sp)
    80201498:	6942                	ld	s2,16(sp)
    8020149a:	69a2                	ld	s3,8(sp)
    8020149c:	6145                	addi	sp,sp,48
    8020149e:	8082                	ret
    802014a0:	557d                	li	a0,-1
    802014a2:	bfc5                	j	80201492 <copyin2+0x3c>
    802014a4:	557d                	li	a0,-1
    802014a6:	b7f5                	j	80201492 <copyin2+0x3c>

00000000802014a8 <copyinstr>:
    802014a8:	c2dd                	beqz	a3,8020154e <copyinstr+0xa6>
    802014aa:	715d                	addi	sp,sp,-80
    802014ac:	e486                	sd	ra,72(sp)
    802014ae:	e0a2                	sd	s0,64(sp)
    802014b0:	fc26                	sd	s1,56(sp)
    802014b2:	f84a                	sd	s2,48(sp)
    802014b4:	f44e                	sd	s3,40(sp)
    802014b6:	f052                	sd	s4,32(sp)
    802014b8:	ec56                	sd	s5,24(sp)
    802014ba:	e85a                	sd	s6,16(sp)
    802014bc:	e45e                	sd	s7,8(sp)
    802014be:	0880                	addi	s0,sp,80
    802014c0:	8a2a                	mv	s4,a0
    802014c2:	8b2e                	mv	s6,a1
    802014c4:	8bb2                	mv	s7,a2
    802014c6:	84b6                	mv	s1,a3
    802014c8:	7afd                	lui	s5,0xfffff
    802014ca:	6985                	lui	s3,0x1
    802014cc:	a02d                	j	802014f6 <copyinstr+0x4e>
    802014ce:	00078023          	sb	zero,0(a5)
    802014d2:	4785                	li	a5,1
    802014d4:	37fd                	addiw	a5,a5,-1
    802014d6:	0007851b          	sext.w	a0,a5
    802014da:	60a6                	ld	ra,72(sp)
    802014dc:	6406                	ld	s0,64(sp)
    802014de:	74e2                	ld	s1,56(sp)
    802014e0:	7942                	ld	s2,48(sp)
    802014e2:	79a2                	ld	s3,40(sp)
    802014e4:	7a02                	ld	s4,32(sp)
    802014e6:	6ae2                	ld	s5,24(sp)
    802014e8:	6b42                	ld	s6,16(sp)
    802014ea:	6ba2                	ld	s7,8(sp)
    802014ec:	6161                	addi	sp,sp,80
    802014ee:	8082                	ret
    802014f0:	01390bb3          	add	s7,s2,s3
    802014f4:	c8a9                	beqz	s1,80201546 <copyinstr+0x9e>
    802014f6:	015bf933          	and	s2,s7,s5
    802014fa:	85ca                	mv	a1,s2
    802014fc:	8552                	mv	a0,s4
    802014fe:	fffff097          	auipc	ra,0xfffff
    80201502:	6ae080e7          	jalr	1710(ra) # 80200bac <walkaddr>
    80201506:	c131                	beqz	a0,8020154a <copyinstr+0xa2>
    80201508:	417906b3          	sub	a3,s2,s7
    8020150c:	96ce                	add	a3,a3,s3
    8020150e:	00d4f363          	bgeu	s1,a3,80201514 <copyinstr+0x6c>
    80201512:	86a6                	mv	a3,s1
    80201514:	955e                	add	a0,a0,s7
    80201516:	41250533          	sub	a0,a0,s2
    8020151a:	daf9                	beqz	a3,802014f0 <copyinstr+0x48>
    8020151c:	87da                	mv	a5,s6
    8020151e:	885a                	mv	a6,s6
    80201520:	41650633          	sub	a2,a0,s6
    80201524:	96da                	add	a3,a3,s6
    80201526:	85be                	mv	a1,a5
    80201528:	00f60733          	add	a4,a2,a5
    8020152c:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <ebss_clear+0xffffffff7fdd9000>
    80201530:	df59                	beqz	a4,802014ce <copyinstr+0x26>
    80201532:	00e78023          	sb	a4,0(a5)
    80201536:	0785                	addi	a5,a5,1
    80201538:	fed797e3          	bne	a5,a3,80201526 <copyinstr+0x7e>
    8020153c:	14fd                	addi	s1,s1,-1 # fff <_entry-0x801ff001>
    8020153e:	94c2                	add	s1,s1,a6
    80201540:	8c8d                	sub	s1,s1,a1
    80201542:	8b3e                	mv	s6,a5
    80201544:	b775                	j	802014f0 <copyinstr+0x48>
    80201546:	4781                	li	a5,0
    80201548:	b771                	j	802014d4 <copyinstr+0x2c>
    8020154a:	557d                	li	a0,-1
    8020154c:	b779                	j	802014da <copyinstr+0x32>
    8020154e:	4781                	li	a5,0
    80201550:	37fd                	addiw	a5,a5,-1
    80201552:	0007851b          	sext.w	a0,a5
    80201556:	8082                	ret

0000000080201558 <copyinstr2>:
    80201558:	7179                	addi	sp,sp,-48
    8020155a:	f406                	sd	ra,40(sp)
    8020155c:	f022                	sd	s0,32(sp)
    8020155e:	ec26                	sd	s1,24(sp)
    80201560:	e84a                	sd	s2,16(sp)
    80201562:	e44e                	sd	s3,8(sp)
    80201564:	1800                	addi	s0,sp,48
    80201566:	89aa                	mv	s3,a0
    80201568:	84ae                	mv	s1,a1
    8020156a:	8932                	mv	s2,a2
    8020156c:	00000097          	auipc	ra,0x0
    80201570:	4d4080e7          	jalr	1236(ra) # 80201a40 <myproc>
    80201574:	6534                	ld	a3,72(a0)
    80201576:	04d4f363          	bgeu	s1,a3,802015bc <copyinstr2+0x64>
    8020157a:	04090363          	beqz	s2,802015c0 <copyinstr2+0x68>
    8020157e:	01298633          	add	a2,s3,s2
    80201582:	8e85                	sub	a3,a3,s1
    80201584:	96ce                	add	a3,a3,s3
    80201586:	87ce                	mv	a5,s3
    80201588:	413485b3          	sub	a1,s1,s3
    8020158c:	00b78733          	add	a4,a5,a1
    80201590:	00074703          	lbu	a4,0(a4)
    80201594:	cb11                	beqz	a4,802015a8 <copyinstr2+0x50>
    80201596:	00e78023          	sb	a4,0(a5)
    8020159a:	0785                	addi	a5,a5,1
    8020159c:	02d78463          	beq	a5,a3,802015c4 <copyinstr2+0x6c>
    802015a0:	fec796e3          	bne	a5,a2,8020158c <copyinstr2+0x34>
    802015a4:	557d                	li	a0,-1
    802015a6:	a021                	j	802015ae <copyinstr2+0x56>
    802015a8:	00078023          	sb	zero,0(a5)
    802015ac:	4501                	li	a0,0
    802015ae:	70a2                	ld	ra,40(sp)
    802015b0:	7402                	ld	s0,32(sp)
    802015b2:	64e2                	ld	s1,24(sp)
    802015b4:	6942                	ld	s2,16(sp)
    802015b6:	69a2                	ld	s3,8(sp)
    802015b8:	6145                	addi	sp,sp,48
    802015ba:	8082                	ret
    802015bc:	557d                	li	a0,-1
    802015be:	bfc5                	j	802015ae <copyinstr2+0x56>
    802015c0:	557d                	li	a0,-1
    802015c2:	b7f5                	j	802015ae <copyinstr2+0x56>
    802015c4:	557d                	li	a0,-1
    802015c6:	b7e5                	j	802015ae <copyinstr2+0x56>

00000000802015c8 <kfreewalk>:
    802015c8:	7179                	addi	sp,sp,-48
    802015ca:	f406                	sd	ra,40(sp)
    802015cc:	f022                	sd	s0,32(sp)
    802015ce:	ec26                	sd	s1,24(sp)
    802015d0:	e84a                	sd	s2,16(sp)
    802015d2:	e44e                	sd	s3,8(sp)
    802015d4:	e052                	sd	s4,0(sp)
    802015d6:	1800                	addi	s0,sp,48
    802015d8:	8a2a                	mv	s4,a0
    802015da:	84aa                	mv	s1,a0
    802015dc:	6905                	lui	s2,0x1
    802015de:	992a                	add	s2,s2,a0
    802015e0:	4985                	li	s3,1
    802015e2:	a829                	j	802015fc <kfreewalk+0x34>
    802015e4:	83a9                	srli	a5,a5,0xa
    802015e6:	00c79513          	slli	a0,a5,0xc
    802015ea:	00000097          	auipc	ra,0x0
    802015ee:	fde080e7          	jalr	-34(ra) # 802015c8 <kfreewalk>
    802015f2:	0004b023          	sd	zero,0(s1)
    802015f6:	04a1                	addi	s1,s1,8
    802015f8:	01248963          	beq	s1,s2,8020160a <kfreewalk+0x42>
    802015fc:	609c                	ld	a5,0(s1)
    802015fe:	00f7f713          	andi	a4,a5,15
    80201602:	ff3701e3          	beq	a4,s3,802015e4 <kfreewalk+0x1c>
    80201606:	8b85                	andi	a5,a5,1
    80201608:	d7fd                	beqz	a5,802015f6 <kfreewalk+0x2e>
    8020160a:	8552                	mv	a0,s4
    8020160c:	fffff097          	auipc	ra,0xfffff
    80201610:	e34080e7          	jalr	-460(ra) # 80200440 <kfree>
    80201614:	70a2                	ld	ra,40(sp)
    80201616:	7402                	ld	s0,32(sp)
    80201618:	64e2                	ld	s1,24(sp)
    8020161a:	6942                	ld	s2,16(sp)
    8020161c:	69a2                	ld	s3,8(sp)
    8020161e:	6a02                	ld	s4,0(sp)
    80201620:	6145                	addi	sp,sp,48
    80201622:	8082                	ret

0000000080201624 <kvmfreeusr>:
    80201624:	1101                	addi	sp,sp,-32
    80201626:	ec06                	sd	ra,24(sp)
    80201628:	e822                	sd	s0,16(sp)
    8020162a:	e426                	sd	s1,8(sp)
    8020162c:	1000                	addi	s0,sp,32
    8020162e:	84aa                	mv	s1,a0
    80201630:	6108                	ld	a0,0(a0)
    80201632:	00f57713          	andi	a4,a0,15
    80201636:	4785                	li	a5,1
    80201638:	00f70d63          	beq	a4,a5,80201652 <kvmfreeusr+0x2e>
    8020163c:	6488                	ld	a0,8(s1)
    8020163e:	00f57713          	andi	a4,a0,15
    80201642:	4785                	li	a5,1
    80201644:	02f70063          	beq	a4,a5,80201664 <kvmfreeusr+0x40>
    80201648:	60e2                	ld	ra,24(sp)
    8020164a:	6442                	ld	s0,16(sp)
    8020164c:	64a2                	ld	s1,8(sp)
    8020164e:	6105                	addi	sp,sp,32
    80201650:	8082                	ret
    80201652:	8129                	srli	a0,a0,0xa
    80201654:	0532                	slli	a0,a0,0xc
    80201656:	00000097          	auipc	ra,0x0
    8020165a:	f72080e7          	jalr	-142(ra) # 802015c8 <kfreewalk>
    8020165e:	0004b023          	sd	zero,0(s1)
    80201662:	bfe9                	j	8020163c <kvmfreeusr+0x18>
    80201664:	8129                	srli	a0,a0,0xa
    80201666:	0532                	slli	a0,a0,0xc
    80201668:	00000097          	auipc	ra,0x0
    8020166c:	f60080e7          	jalr	-160(ra) # 802015c8 <kfreewalk>
    80201670:	0004b423          	sd	zero,8(s1)
    80201674:	bfd1                	j	80201648 <kvmfreeusr+0x24>

0000000080201676 <kvmfree>:
    80201676:	1101                	addi	sp,sp,-32
    80201678:	ec06                	sd	ra,24(sp)
    8020167a:	e822                	sd	s0,16(sp)
    8020167c:	e426                	sd	s1,8(sp)
    8020167e:	1000                	addi	s0,sp,32
    80201680:	84aa                	mv	s1,a0
    80201682:	e185                	bnez	a1,802016a2 <kvmfree+0x2c>
    80201684:	8526                	mv	a0,s1
    80201686:	00000097          	auipc	ra,0x0
    8020168a:	f9e080e7          	jalr	-98(ra) # 80201624 <kvmfreeusr>
    8020168e:	8526                	mv	a0,s1
    80201690:	fffff097          	auipc	ra,0xfffff
    80201694:	db0080e7          	jalr	-592(ra) # 80200440 <kfree>
    80201698:	60e2                	ld	ra,24(sp)
    8020169a:	6442                	ld	s0,16(sp)
    8020169c:	64a2                	ld	s1,8(sp)
    8020169e:	6105                	addi	sp,sp,32
    802016a0:	8082                	ret
    802016a2:	4685                	li	a3,1
    802016a4:	4605                	li	a2,1
    802016a6:	0fb00593          	li	a1,251
    802016aa:	05fa                	slli	a1,a1,0x1e
    802016ac:	fffff097          	auipc	ra,0xfffff
    802016b0:	774080e7          	jalr	1908(ra) # 80200e20 <vmunmap>
    802016b4:	7d84b503          	ld	a0,2008(s1)
    802016b8:	00f57713          	andi	a4,a0,15
    802016bc:	4785                	li	a5,1
    802016be:	fcf713e3          	bne	a4,a5,80201684 <kvmfree+0xe>
    802016c2:	8129                	srli	a0,a0,0xa
    802016c4:	0532                	slli	a0,a0,0xc
    802016c6:	00000097          	auipc	ra,0x0
    802016ca:	f02080e7          	jalr	-254(ra) # 802015c8 <kfreewalk>
    802016ce:	bf5d                	j	80201684 <kvmfree+0xe>

00000000802016d0 <proc_kpagetable>:
    802016d0:	1101                	addi	sp,sp,-32
    802016d2:	ec06                	sd	ra,24(sp)
    802016d4:	e822                	sd	s0,16(sp)
    802016d6:	e426                	sd	s1,8(sp)
    802016d8:	1000                	addi	s0,sp,32
    802016da:	fffff097          	auipc	ra,0xfffff
    802016de:	e80080e7          	jalr	-384(ra) # 8020055a <kalloc>
    802016e2:	84aa                	mv	s1,a0
    802016e4:	c91d                	beqz	a0,8020171a <proc_kpagetable+0x4a>
    802016e6:	6605                	lui	a2,0x1
    802016e8:	00013597          	auipc	a1,0x13
    802016ec:	9705b583          	ld	a1,-1680(a1) # 80214058 <kernel_pagetable>
    802016f0:	fffff097          	auipc	ra,0xfffff
    802016f4:	0ce080e7          	jalr	206(ra) # 802007be <memmove>
    802016f8:	fffff097          	auipc	ra,0xfffff
    802016fc:	e62080e7          	jalr	-414(ra) # 8020055a <kalloc>
    80201700:	86aa                	mv	a3,a0
    80201702:	c115                	beqz	a0,80201726 <proc_kpagetable+0x56>
    80201704:	4719                	li	a4,6
    80201706:	6605                	lui	a2,0x1
    80201708:	0fb00593          	li	a1,251
    8020170c:	05fa                	slli	a1,a1,0x1e
    8020170e:	8526                	mv	a0,s1
    80201710:	fffff097          	auipc	ra,0xfffff
    80201714:	556080e7          	jalr	1366(ra) # 80200c66 <mappages>
    80201718:	e519                	bnez	a0,80201726 <proc_kpagetable+0x56>
    8020171a:	8526                	mv	a0,s1
    8020171c:	60e2                	ld	ra,24(sp)
    8020171e:	6442                	ld	s0,16(sp)
    80201720:	64a2                	ld	s1,8(sp)
    80201722:	6105                	addi	sp,sp,32
    80201724:	8082                	ret
    80201726:	4585                	li	a1,1
    80201728:	8526                	mv	a0,s1
    8020172a:	00000097          	auipc	ra,0x0
    8020172e:	f4c080e7          	jalr	-180(ra) # 80201676 <kvmfree>
    80201732:	4481                	li	s1,0
    80201734:	b7dd                	j	8020171a <proc_kpagetable+0x4a>

0000000080201736 <vmprint>:
    80201736:	7119                	addi	sp,sp,-128
    80201738:	fc86                	sd	ra,120(sp)
    8020173a:	f8a2                	sd	s0,112(sp)
    8020173c:	f4a6                	sd	s1,104(sp)
    8020173e:	f0ca                	sd	s2,96(sp)
    80201740:	ecce                	sd	s3,88(sp)
    80201742:	e8d2                	sd	s4,80(sp)
    80201744:	e4d6                	sd	s5,72(sp)
    80201746:	e0da                	sd	s6,64(sp)
    80201748:	fc5e                	sd	s7,56(sp)
    8020174a:	f862                	sd	s8,48(sp)
    8020174c:	f466                	sd	s9,40(sp)
    8020174e:	f06a                	sd	s10,32(sp)
    80201750:	ec6e                	sd	s11,24(sp)
    80201752:	0100                	addi	s0,sp,128
    80201754:	8baa                	mv	s7,a0
    80201756:	f8a43423          	sd	a0,-120(s0)
    8020175a:	85aa                	mv	a1,a0
    8020175c:	00008517          	auipc	a0,0x8
    80201760:	da450513          	addi	a0,a0,-604 # 80209500 <digits+0x180>
    80201764:	fffff097          	auipc	ra,0xfffff
    80201768:	a2a080e7          	jalr	-1494(ra) # 8020018e <printf>
    8020176c:	6d85                	lui	s11,0x1
    8020176e:	9dde                	add	s11,s11,s7
    80201770:	6c85                	lui	s9,0x1
    80201772:	00008d17          	auipc	s10,0x8
    80201776:	db6d0d13          	addi	s10,s10,-586 # 80209528 <digits+0x1a8>
    8020177a:	00008a17          	auipc	s4,0x8
    8020177e:	dc6a0a13          	addi	s4,s4,-570 # 80209540 <digits+0x1c0>
    80201782:	a885                	j	802017f2 <vmprint+0xbc>
    80201784:	04a1                	addi	s1,s1,8
    80201786:	197d                	addi	s2,s2,-1 # fff <_entry-0x801ff001>
    80201788:	02090263          	beqz	s2,802017ac <vmprint+0x76>
    8020178c:	6090                	ld	a2,0(s1)
    8020178e:	00167793          	andi	a5,a2,1
    80201792:	dbed                	beqz	a5,80201784 <vmprint+0x4e>
    80201794:	00a65693          	srli	a3,a2,0xa
    80201798:	413485b3          	sub	a1,s1,s3
    8020179c:	06b2                	slli	a3,a3,0xc
    8020179e:	858d                	srai	a1,a1,0x3
    802017a0:	8552                	mv	a0,s4
    802017a2:	fffff097          	auipc	ra,0xfffff
    802017a6:	9ec080e7          	jalr	-1556(ra) # 8020018e <printf>
    802017aa:	bfe9                	j	80201784 <vmprint+0x4e>
    802017ac:	0aa1                	addi	s5,s5,8 # fffffffffffff008 <ebss_clear+0xffffffff7fdd9008>
    802017ae:	1b7d                	addi	s6,s6,-1 # fff <_entry-0x801ff001>
    802017b0:	020b0e63          	beqz	s6,802017ec <vmprint+0xb6>
    802017b4:	000ab603          	ld	a2,0(s5)
    802017b8:	00167793          	andi	a5,a2,1
    802017bc:	dbe5                	beqz	a5,802017ac <vmprint+0x76>
    802017be:	00a65993          	srli	s3,a2,0xa
    802017c2:	09b2                	slli	s3,s3,0xc
    802017c4:	418a85b3          	sub	a1,s5,s8
    802017c8:	86ce                	mv	a3,s3
    802017ca:	858d                	srai	a1,a1,0x3
    802017cc:	856a                	mv	a0,s10
    802017ce:	fffff097          	auipc	ra,0xfffff
    802017d2:	9c0080e7          	jalr	-1600(ra) # 8020018e <printf>
    802017d6:	00898713          	addi	a4,s3,8 # 1008 <_entry-0x801feff8>
    802017da:	019987b3          	add	a5,s3,s9
    802017de:	20000913          	li	s2,512
    802017e2:	00e7f363          	bgeu	a5,a4,802017e8 <vmprint+0xb2>
    802017e6:	4905                	li	s2,1
    802017e8:	84ce                	mv	s1,s3
    802017ea:	b74d                	j	8020178c <vmprint+0x56>
    802017ec:	0ba1                	addi	s7,s7,8 # fffffffffffff008 <ebss_clear+0xffffffff7fdd9008>
    802017ee:	05bb8463          	beq	s7,s11,80201836 <vmprint+0x100>
    802017f2:	000bb603          	ld	a2,0(s7)
    802017f6:	00167793          	andi	a5,a2,1
    802017fa:	dbed                	beqz	a5,802017ec <vmprint+0xb6>
    802017fc:	00a65c13          	srli	s8,a2,0xa
    80201800:	0c32                	slli	s8,s8,0xc
    80201802:	f8843783          	ld	a5,-120(s0)
    80201806:	40fb87b3          	sub	a5,s7,a5
    8020180a:	86e2                	mv	a3,s8
    8020180c:	4037d593          	srai	a1,a5,0x3
    80201810:	00008517          	auipc	a0,0x8
    80201814:	d0050513          	addi	a0,a0,-768 # 80209510 <digits+0x190>
    80201818:	fffff097          	auipc	ra,0xfffff
    8020181c:	976080e7          	jalr	-1674(ra) # 8020018e <printf>
    80201820:	019c0733          	add	a4,s8,s9
    80201824:	008c0793          	addi	a5,s8,8
    80201828:	20000b13          	li	s6,512
    8020182c:	00f77363          	bgeu	a4,a5,80201832 <vmprint+0xfc>
    80201830:	4b05                	li	s6,1
    80201832:	8ae2                	mv	s5,s8
    80201834:	b741                	j	802017b4 <vmprint+0x7e>
    80201836:	70e6                	ld	ra,120(sp)
    80201838:	7446                	ld	s0,112(sp)
    8020183a:	74a6                	ld	s1,104(sp)
    8020183c:	7906                	ld	s2,96(sp)
    8020183e:	69e6                	ld	s3,88(sp)
    80201840:	6a46                	ld	s4,80(sp)
    80201842:	6aa6                	ld	s5,72(sp)
    80201844:	6b06                	ld	s6,64(sp)
    80201846:	7be2                	ld	s7,56(sp)
    80201848:	7c42                	ld	s8,48(sp)
    8020184a:	7ca2                	ld	s9,40(sp)
    8020184c:	7d02                	ld	s10,32(sp)
    8020184e:	6de2                	ld	s11,24(sp)
    80201850:	6109                	addi	sp,sp,128
    80201852:	8082                	ret

0000000080201854 <wakeup1>:

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
    80201854:	1101                	addi	sp,sp,-32
    80201856:	ec06                	sd	ra,24(sp)
    80201858:	e822                	sd	s0,16(sp)
    8020185a:	e426                	sd	s1,8(sp)
    8020185c:	1000                	addi	s0,sp,32
    8020185e:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    80201860:	fffff097          	auipc	ra,0xfffff
    80201864:	e38080e7          	jalr	-456(ra) # 80200698 <holding>
    80201868:	c909                	beqz	a0,8020187a <wakeup1+0x26>
    panic("wakeup1");
  if(p->chan == p && p->state == SLEEPING) {
    8020186a:	749c                	ld	a5,40(s1)
    8020186c:	00978f63          	beq	a5,s1,8020188a <wakeup1+0x36>
    p->state = RUNNABLE;
  }
}
    80201870:	60e2                	ld	ra,24(sp)
    80201872:	6442                	ld	s0,16(sp)
    80201874:	64a2                	ld	s1,8(sp)
    80201876:	6105                	addi	sp,sp,32
    80201878:	8082                	ret
    panic("wakeup1");
    8020187a:	00008517          	auipc	a0,0x8
    8020187e:	ce650513          	addi	a0,a0,-794 # 80209560 <digits+0x1e0>
    80201882:	fffff097          	auipc	ra,0xfffff
    80201886:	8c2080e7          	jalr	-1854(ra) # 80200144 <panic>
  if(p->chan == p && p->state == SLEEPING) {
    8020188a:	4c98                	lw	a4,24(s1)
    8020188c:	4785                	li	a5,1
    8020188e:	fef711e3          	bne	a4,a5,80201870 <wakeup1+0x1c>
    p->state = RUNNABLE;
    80201892:	4789                	li	a5,2
    80201894:	cc9c                	sw	a5,24(s1)
}
    80201896:	bfe9                	j	80201870 <wakeup1+0x1c>

0000000080201898 <reg_info>:
void reg_info(void) {
    80201898:	1141                	addi	sp,sp,-16
    8020189a:	e406                	sd	ra,8(sp)
    8020189c:	e022                	sd	s0,0(sp)
    8020189e:	0800                	addi	s0,sp,16
  printf("register info: {\n");
    802018a0:	00008517          	auipc	a0,0x8
    802018a4:	cc850513          	addi	a0,a0,-824 # 80209568 <digits+0x1e8>
    802018a8:	fffff097          	auipc	ra,0xfffff
    802018ac:	8e6080e7          	jalr	-1818(ra) # 8020018e <printf>

static inline uint64
r_sstatus()
{
  uint64 x;
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802018b0:	100025f3          	csrr	a1,sstatus
  printf("sstatus: %p\n", r_sstatus());
    802018b4:	00008517          	auipc	a0,0x8
    802018b8:	ccc50513          	addi	a0,a0,-820 # 80209580 <digits+0x200>
    802018bc:	fffff097          	auipc	ra,0xfffff
    802018c0:	8d2080e7          	jalr	-1838(ra) # 8020018e <printf>
// Supervisor Interrupt Pending
static inline uint64
r_sip()
{
  uint64 x;
  asm volatile("csrr %0, sip" : "=r" (x) );
    802018c4:	144025f3          	csrr	a1,sip
  printf("sip: %p\n", r_sip());
    802018c8:	00008517          	auipc	a0,0x8
    802018cc:	cc850513          	addi	a0,a0,-824 # 80209590 <digits+0x210>
    802018d0:	fffff097          	auipc	ra,0xfffff
    802018d4:	8be080e7          	jalr	-1858(ra) # 8020018e <printf>
#define SIE_SSIE (1L << 1) // software
static inline uint64
r_sie()
{
  uint64 x;
  asm volatile("csrr %0, sie" : "=r" (x) );
    802018d8:	104025f3          	csrr	a1,sie
  printf("sie: %p\n", r_sie());
    802018dc:	00008517          	auipc	a0,0x8
    802018e0:	cc450513          	addi	a0,a0,-828 # 802095a0 <digits+0x220>
    802018e4:	fffff097          	auipc	ra,0xfffff
    802018e8:	8aa080e7          	jalr	-1878(ra) # 8020018e <printf>

static inline uint64
r_sepc()
{
  uint64 x;
  asm volatile("csrr %0, sepc" : "=r" (x) );
    802018ec:	141025f3          	csrr	a1,sepc
  printf("sepc: %p\n", r_sepc());
    802018f0:	00008517          	auipc	a0,0x8
    802018f4:	cc050513          	addi	a0,a0,-832 # 802095b0 <digits+0x230>
    802018f8:	fffff097          	auipc	ra,0xfffff
    802018fc:	896080e7          	jalr	-1898(ra) # 8020018e <printf>

static inline uint64
r_stvec()
{
  uint64 x;
  asm volatile("csrr %0, stvec" : "=r" (x) );
    80201900:	105025f3          	csrr	a1,stvec
  printf("stvec: %p\n", r_stvec());
    80201904:	00008517          	auipc	a0,0x8
    80201908:	cbc50513          	addi	a0,a0,-836 # 802095c0 <digits+0x240>
    8020190c:	fffff097          	auipc	ra,0xfffff
    80201910:	882080e7          	jalr	-1918(ra) # 8020018e <printf>

static inline uint64
r_satp()
{
  uint64 x;
  asm volatile("csrr %0, satp" : "=r" (x) );
    80201914:	180025f3          	csrr	a1,satp
  printf("satp: %p\n", r_satp());
    80201918:	00008517          	auipc	a0,0x8
    8020191c:	cb850513          	addi	a0,a0,-840 # 802095d0 <digits+0x250>
    80201920:	fffff097          	auipc	ra,0xfffff
    80201924:	86e080e7          	jalr	-1938(ra) # 8020018e <printf>
// Supervisor Trap Cause
static inline uint64
r_scause()
{
  uint64 x;
  asm volatile("csrr %0, scause" : "=r" (x) );
    80201928:	142025f3          	csrr	a1,scause
  printf("scause: %p\n", r_scause());
    8020192c:	00008517          	auipc	a0,0x8
    80201930:	cb450513          	addi	a0,a0,-844 # 802095e0 <digits+0x260>
    80201934:	fffff097          	auipc	ra,0xfffff
    80201938:	85a080e7          	jalr	-1958(ra) # 8020018e <printf>
// Supervisor Trap Value
static inline uint64
r_stval()
{
  uint64 x;
  asm volatile("csrr %0, stval" : "=r" (x) );
    8020193c:	143025f3          	csrr	a1,stval
  printf("stval: %p\n", r_stval());
    80201940:	00008517          	auipc	a0,0x8
    80201944:	cb050513          	addi	a0,a0,-848 # 802095f0 <digits+0x270>
    80201948:	fffff097          	auipc	ra,0xfffff
    8020194c:	846080e7          	jalr	-1978(ra) # 8020018e <printf>

static inline uint64
r_sp()
{
  uint64 x;
  asm volatile("mv %0, sp" : "=r" (x) );
    80201950:	858a                	mv	a1,sp
  printf("sp: %p\n", r_sp());
    80201952:	00008517          	auipc	a0,0x8
    80201956:	cae50513          	addi	a0,a0,-850 # 80209600 <digits+0x280>
    8020195a:	fffff097          	auipc	ra,0xfffff
    8020195e:	834080e7          	jalr	-1996(ra) # 8020018e <printf>
// this core's hartid (core number), the index into cpus[].
static inline uint64
r_tp()
{
  uint64 x;
  asm volatile("mv %0, tp" : "=r" (x) );
    80201962:	8592                	mv	a1,tp
  printf("tp: %p\n", r_tp());
    80201964:	00008517          	auipc	a0,0x8
    80201968:	ca450513          	addi	a0,a0,-860 # 80209608 <digits+0x288>
    8020196c:	fffff097          	auipc	ra,0xfffff
    80201970:	822080e7          	jalr	-2014(ra) # 8020018e <printf>

static inline uint64
r_ra()
{
  uint64 x;
  asm volatile("mv %0, ra" : "=r" (x) );
    80201974:	8586                	mv	a1,ra
  printf("ra: %p\n", r_ra());
    80201976:	00008517          	auipc	a0,0x8
    8020197a:	c9a50513          	addi	a0,a0,-870 # 80209610 <digits+0x290>
    8020197e:	fffff097          	auipc	ra,0xfffff
    80201982:	810080e7          	jalr	-2032(ra) # 8020018e <printf>
  printf("}\n");
    80201986:	00008517          	auipc	a0,0x8
    8020198a:	c9250513          	addi	a0,a0,-878 # 80209618 <digits+0x298>
    8020198e:	fffff097          	auipc	ra,0xfffff
    80201992:	800080e7          	jalr	-2048(ra) # 8020018e <printf>
}
    80201996:	60a2                	ld	ra,8(sp)
    80201998:	6402                	ld	s0,0(sp)
    8020199a:	0141                	addi	sp,sp,16
    8020199c:	8082                	ret

000000008020199e <procinit>:
{
    8020199e:	7179                	addi	sp,sp,-48
    802019a0:	f406                	sd	ra,40(sp)
    802019a2:	f022                	sd	s0,32(sp)
    802019a4:	ec26                	sd	s1,24(sp)
    802019a6:	e84a                	sd	s2,16(sp)
    802019a8:	e44e                	sd	s3,8(sp)
    802019aa:	1800                	addi	s0,sp,48
  initlock(&pid_lock, "nextpid");
    802019ac:	00008597          	auipc	a1,0x8
    802019b0:	c7458593          	addi	a1,a1,-908 # 80209620 <digits+0x2a0>
    802019b4:	00012517          	auipc	a0,0x12
    802019b8:	6ac50513          	addi	a0,a0,1708 # 80214060 <pid_lock>
    802019bc:	fffff097          	auipc	ra,0xfffff
    802019c0:	cc6080e7          	jalr	-826(ra) # 80200682 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    802019c4:	00012497          	auipc	s1,0x12
    802019c8:	7bc48493          	addi	s1,s1,1980 # 80214180 <proc>
      initlock(&p->lock, "proc");
    802019cc:	00008997          	auipc	s3,0x8
    802019d0:	c5c98993          	addi	s3,s3,-932 # 80209628 <digits+0x2a8>
  for(p = proc; p < &proc[NPROC]; p++) {
    802019d4:	00017917          	auipc	s2,0x17
    802019d8:	11c90913          	addi	s2,s2,284 # 80218af0 <bcache>
      initlock(&p->lock, "proc");
    802019dc:	85ce                	mv	a1,s3
    802019de:	8526                	mv	a0,s1
    802019e0:	fffff097          	auipc	ra,0xfffff
    802019e4:	ca2080e7          	jalr	-862(ra) # 80200682 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    802019e8:	17848493          	addi	s1,s1,376
    802019ec:	ff2498e3          	bne	s1,s2,802019dc <procinit+0x3e>
  memset(cpus, 0, sizeof(cpus));
    802019f0:	10000613          	li	a2,256
    802019f4:	4581                	li	a1,0
    802019f6:	00012517          	auipc	a0,0x12
    802019fa:	68250513          	addi	a0,a0,1666 # 80214078 <cpus>
    802019fe:	fffff097          	auipc	ra,0xfffff
    80201a02:	d64080e7          	jalr	-668(ra) # 80200762 <memset>
}
    80201a06:	70a2                	ld	ra,40(sp)
    80201a08:	7402                	ld	s0,32(sp)
    80201a0a:	64e2                	ld	s1,24(sp)
    80201a0c:	6942                	ld	s2,16(sp)
    80201a0e:	69a2                	ld	s3,8(sp)
    80201a10:	6145                	addi	sp,sp,48
    80201a12:	8082                	ret

0000000080201a14 <cpuid>:
{
    80201a14:	1141                	addi	sp,sp,-16
    80201a16:	e422                	sd	s0,8(sp)
    80201a18:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r" (x) );
    80201a1a:	8512                	mv	a0,tp
}
    80201a1c:	2501                	sext.w	a0,a0
    80201a1e:	6422                	ld	s0,8(sp)
    80201a20:	0141                	addi	sp,sp,16
    80201a22:	8082                	ret

0000000080201a24 <mycpu>:
mycpu(void) {
    80201a24:	1141                	addi	sp,sp,-16
    80201a26:	e422                	sd	s0,8(sp)
    80201a28:	0800                	addi	s0,sp,16
    80201a2a:	8792                	mv	a5,tp
  struct cpu *c = &cpus[id];
    80201a2c:	2781                	sext.w	a5,a5
    80201a2e:	079e                	slli	a5,a5,0x7
}
    80201a30:	00012517          	auipc	a0,0x12
    80201a34:	64850513          	addi	a0,a0,1608 # 80214078 <cpus>
    80201a38:	953e                	add	a0,a0,a5
    80201a3a:	6422                	ld	s0,8(sp)
    80201a3c:	0141                	addi	sp,sp,16
    80201a3e:	8082                	ret

0000000080201a40 <myproc>:
myproc(void) {
    80201a40:	1101                	addi	sp,sp,-32
    80201a42:	ec06                	sd	ra,24(sp)
    80201a44:	e822                	sd	s0,16(sp)
    80201a46:	e426                	sd	s1,8(sp)
    80201a48:	1000                	addi	s0,sp,32
  push_off();
    80201a4a:	fffff097          	auipc	ra,0xfffff
    80201a4e:	b8c080e7          	jalr	-1140(ra) # 802005d6 <push_off>
    80201a52:	8792                	mv	a5,tp
  struct proc *p = c->proc;
    80201a54:	2781                	sext.w	a5,a5
    80201a56:	079e                	slli	a5,a5,0x7
    80201a58:	00012717          	auipc	a4,0x12
    80201a5c:	60870713          	addi	a4,a4,1544 # 80214060 <pid_lock>
    80201a60:	97ba                	add	a5,a5,a4
    80201a62:	6f84                	ld	s1,24(a5)
  pop_off();
    80201a64:	fffff097          	auipc	ra,0xfffff
    80201a68:	bbe080e7          	jalr	-1090(ra) # 80200622 <pop_off>
}
    80201a6c:	8526                	mv	a0,s1
    80201a6e:	60e2                	ld	ra,24(sp)
    80201a70:	6442                	ld	s0,16(sp)
    80201a72:	64a2                	ld	s1,8(sp)
    80201a74:	6105                	addi	sp,sp,32
    80201a76:	8082                	ret

0000000080201a78 <forkret>:
{
    80201a78:	1101                	addi	sp,sp,-32
    80201a7a:	ec06                	sd	ra,24(sp)
    80201a7c:	e822                	sd	s0,16(sp)
    80201a7e:	e426                	sd	s1,8(sp)
    80201a80:	1000                	addi	s0,sp,32
  release(&myproc()->lock);
    80201a82:	00000097          	auipc	ra,0x0
    80201a86:	fbe080e7          	jalr	-66(ra) # 80201a40 <myproc>
    80201a8a:	fffff097          	auipc	ra,0xfffff
    80201a8e:	c90080e7          	jalr	-880(ra) # 8020071a <release>
  if (first) {
    80201a92:	00008797          	auipc	a5,0x8
    80201a96:	56e7a783          	lw	a5,1390(a5) # 8020a000 <first.1>
    80201a9a:	eb91                	bnez	a5,80201aae <forkret+0x36>
  usertrapret();
    80201a9c:	00001097          	auipc	ra,0x1
    80201aa0:	c6e080e7          	jalr	-914(ra) # 8020270a <usertrapret>
}
    80201aa4:	60e2                	ld	ra,24(sp)
    80201aa6:	6442                	ld	s0,16(sp)
    80201aa8:	64a2                	ld	s1,8(sp)
    80201aaa:	6105                	addi	sp,sp,32
    80201aac:	8082                	ret
    first = 0;
    80201aae:	00008797          	auipc	a5,0x8
    80201ab2:	5407a923          	sw	zero,1362(a5) # 8020a000 <first.1>
    fat32_init();
    80201ab6:	00004097          	auipc	ra,0x4
    80201aba:	bac080e7          	jalr	-1108(ra) # 80205662 <fat32_init>
    myproc()->cwd = ename("/");
    80201abe:	00000097          	auipc	ra,0x0
    80201ac2:	f82080e7          	jalr	-126(ra) # 80201a40 <myproc>
    80201ac6:	84aa                	mv	s1,a0
    80201ac8:	00008517          	auipc	a0,0x8
    80201acc:	b6850513          	addi	a0,a0,-1176 # 80209630 <digits+0x2b0>
    80201ad0:	00005097          	auipc	ra,0x5
    80201ad4:	e00080e7          	jalr	-512(ra) # 802068d0 <ename>
    80201ad8:	14a4bc23          	sd	a0,344(s1)
    80201adc:	b7c1                	j	80201a9c <forkret+0x24>

0000000080201ade <allocpid>:
allocpid() {
    80201ade:	1101                	addi	sp,sp,-32
    80201ae0:	ec06                	sd	ra,24(sp)
    80201ae2:	e822                	sd	s0,16(sp)
    80201ae4:	e426                	sd	s1,8(sp)
    80201ae6:	e04a                	sd	s2,0(sp)
    80201ae8:	1000                	addi	s0,sp,32
  acquire(&pid_lock);
    80201aea:	00012917          	auipc	s2,0x12
    80201aee:	57690913          	addi	s2,s2,1398 # 80214060 <pid_lock>
    80201af2:	854a                	mv	a0,s2
    80201af4:	fffff097          	auipc	ra,0xfffff
    80201af8:	bd2080e7          	jalr	-1070(ra) # 802006c6 <acquire>
  pid = nextpid;
    80201afc:	00008797          	auipc	a5,0x8
    80201b00:	50478793          	addi	a5,a5,1284 # 8020a000 <first.1>
    80201b04:	43c4                	lw	s1,4(a5)
  nextpid = nextpid + 1;
    80201b06:	0014871b          	addiw	a4,s1,1
    80201b0a:	c3d8                	sw	a4,4(a5)
  release(&pid_lock);
    80201b0c:	854a                	mv	a0,s2
    80201b0e:	fffff097          	auipc	ra,0xfffff
    80201b12:	c0c080e7          	jalr	-1012(ra) # 8020071a <release>
}
    80201b16:	8526                	mv	a0,s1
    80201b18:	60e2                	ld	ra,24(sp)
    80201b1a:	6442                	ld	s0,16(sp)
    80201b1c:	64a2                	ld	s1,8(sp)
    80201b1e:	6902                	ld	s2,0(sp)
    80201b20:	6105                	addi	sp,sp,32
    80201b22:	8082                	ret

0000000080201b24 <proc_pagetable>:
{
    80201b24:	1101                	addi	sp,sp,-32
    80201b26:	ec06                	sd	ra,24(sp)
    80201b28:	e822                	sd	s0,16(sp)
    80201b2a:	e426                	sd	s1,8(sp)
    80201b2c:	e04a                	sd	s2,0(sp)
    80201b2e:	1000                	addi	s0,sp,32
    80201b30:	892a                	mv	s2,a0
  pagetable = uvmcreate();
    80201b32:	fffff097          	auipc	ra,0xfffff
    80201b36:	3b2080e7          	jalr	946(ra) # 80200ee4 <uvmcreate>
    80201b3a:	84aa                	mv	s1,a0
  if(pagetable == 0)
    80201b3c:	c121                	beqz	a0,80201b7c <proc_pagetable+0x58>
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80201b3e:	4729                	li	a4,10
    80201b40:	0000a697          	auipc	a3,0xa
    80201b44:	f006b683          	ld	a3,-256(a3) # 8020ba40 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201b48:	6605                	lui	a2,0x1
    80201b4a:	040005b7          	lui	a1,0x4000
    80201b4e:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201b50:	05b2                	slli	a1,a1,0xc
    80201b52:	fffff097          	auipc	ra,0xfffff
    80201b56:	114080e7          	jalr	276(ra) # 80200c66 <mappages>
    80201b5a:	02054863          	bltz	a0,80201b8a <proc_pagetable+0x66>
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80201b5e:	4719                	li	a4,6
    80201b60:	06093683          	ld	a3,96(s2)
    80201b64:	6605                	lui	a2,0x1
    80201b66:	020005b7          	lui	a1,0x2000
    80201b6a:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    80201b6c:	05b6                	slli	a1,a1,0xd
    80201b6e:	8526                	mv	a0,s1
    80201b70:	fffff097          	auipc	ra,0xfffff
    80201b74:	0f6080e7          	jalr	246(ra) # 80200c66 <mappages>
    80201b78:	02054163          	bltz	a0,80201b9a <proc_pagetable+0x76>
}
    80201b7c:	8526                	mv	a0,s1
    80201b7e:	60e2                	ld	ra,24(sp)
    80201b80:	6442                	ld	s0,16(sp)
    80201b82:	64a2                	ld	s1,8(sp)
    80201b84:	6902                	ld	s2,0(sp)
    80201b86:	6105                	addi	sp,sp,32
    80201b88:	8082                	ret
    uvmfree(pagetable, 0);
    80201b8a:	4581                	li	a1,0
    80201b8c:	8526                	mv	a0,s1
    80201b8e:	fffff097          	auipc	ra,0xfffff
    80201b92:	5dc080e7          	jalr	1500(ra) # 8020116a <uvmfree>
    return NULL;
    80201b96:	4481                	li	s1,0
    80201b98:	b7d5                	j	80201b7c <proc_pagetable+0x58>
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201b9a:	4681                	li	a3,0
    80201b9c:	4605                	li	a2,1
    80201b9e:	040005b7          	lui	a1,0x4000
    80201ba2:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201ba4:	05b2                	slli	a1,a1,0xc
    80201ba6:	8526                	mv	a0,s1
    80201ba8:	fffff097          	auipc	ra,0xfffff
    80201bac:	278080e7          	jalr	632(ra) # 80200e20 <vmunmap>
    uvmfree(pagetable, 0);
    80201bb0:	4581                	li	a1,0
    80201bb2:	8526                	mv	a0,s1
    80201bb4:	fffff097          	auipc	ra,0xfffff
    80201bb8:	5b6080e7          	jalr	1462(ra) # 8020116a <uvmfree>
    return NULL;
    80201bbc:	4481                	li	s1,0
    80201bbe:	bf7d                	j	80201b7c <proc_pagetable+0x58>

0000000080201bc0 <proc_freepagetable>:
{
    80201bc0:	1101                	addi	sp,sp,-32
    80201bc2:	ec06                	sd	ra,24(sp)
    80201bc4:	e822                	sd	s0,16(sp)
    80201bc6:	e426                	sd	s1,8(sp)
    80201bc8:	e04a                	sd	s2,0(sp)
    80201bca:	1000                	addi	s0,sp,32
    80201bcc:	84aa                	mv	s1,a0
    80201bce:	892e                	mv	s2,a1
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201bd0:	4681                	li	a3,0
    80201bd2:	4605                	li	a2,1
    80201bd4:	040005b7          	lui	a1,0x4000
    80201bd8:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201bda:	05b2                	slli	a1,a1,0xc
    80201bdc:	fffff097          	auipc	ra,0xfffff
    80201be0:	244080e7          	jalr	580(ra) # 80200e20 <vmunmap>
  vmunmap(pagetable, TRAPFRAME, 1, 0);
    80201be4:	4681                	li	a3,0
    80201be6:	4605                	li	a2,1
    80201be8:	020005b7          	lui	a1,0x2000
    80201bec:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    80201bee:	05b6                	slli	a1,a1,0xd
    80201bf0:	8526                	mv	a0,s1
    80201bf2:	fffff097          	auipc	ra,0xfffff
    80201bf6:	22e080e7          	jalr	558(ra) # 80200e20 <vmunmap>
  uvmfree(pagetable, sz);
    80201bfa:	85ca                	mv	a1,s2
    80201bfc:	8526                	mv	a0,s1
    80201bfe:	fffff097          	auipc	ra,0xfffff
    80201c02:	56c080e7          	jalr	1388(ra) # 8020116a <uvmfree>
}
    80201c06:	60e2                	ld	ra,24(sp)
    80201c08:	6442                	ld	s0,16(sp)
    80201c0a:	64a2                	ld	s1,8(sp)
    80201c0c:	6902                	ld	s2,0(sp)
    80201c0e:	6105                	addi	sp,sp,32
    80201c10:	8082                	ret

0000000080201c12 <freeproc>:
{
    80201c12:	1101                	addi	sp,sp,-32
    80201c14:	ec06                	sd	ra,24(sp)
    80201c16:	e822                	sd	s0,16(sp)
    80201c18:	e426                	sd	s1,8(sp)
    80201c1a:	1000                	addi	s0,sp,32
    80201c1c:	84aa                	mv	s1,a0
  if(p->trapframe)
    80201c1e:	7128                	ld	a0,96(a0)
    80201c20:	c509                	beqz	a0,80201c2a <freeproc+0x18>
    kfree((void*)p->trapframe);
    80201c22:	fffff097          	auipc	ra,0xfffff
    80201c26:	81e080e7          	jalr	-2018(ra) # 80200440 <kfree>
  p->trapframe = 0;
    80201c2a:	0604b023          	sd	zero,96(s1)
  if (p->kpagetable) {
    80201c2e:	6ca8                	ld	a0,88(s1)
    80201c30:	c511                	beqz	a0,80201c3c <freeproc+0x2a>
    kvmfree(p->kpagetable, 1);
    80201c32:	4585                	li	a1,1
    80201c34:	00000097          	auipc	ra,0x0
    80201c38:	a42080e7          	jalr	-1470(ra) # 80201676 <kvmfree>
  p->kpagetable = 0;
    80201c3c:	0404bc23          	sd	zero,88(s1)
  if(p->pagetable)
    80201c40:	68a8                	ld	a0,80(s1)
    80201c42:	c511                	beqz	a0,80201c4e <freeproc+0x3c>
    proc_freepagetable(p->pagetable, p->sz);
    80201c44:	64ac                	ld	a1,72(s1)
    80201c46:	00000097          	auipc	ra,0x0
    80201c4a:	f7a080e7          	jalr	-134(ra) # 80201bc0 <proc_freepagetable>
  p->pagetable = 0;
    80201c4e:	0404b823          	sd	zero,80(s1)
  p->sz = 0;
    80201c52:	0404b423          	sd	zero,72(s1)
  p->pid = 0;
    80201c56:	0204ac23          	sw	zero,56(s1)
  p->parent = 0;
    80201c5a:	0204b023          	sd	zero,32(s1)
  p->name[0] = 0;
    80201c5e:	16048023          	sb	zero,352(s1)
  p->chan = 0;
    80201c62:	0204b423          	sd	zero,40(s1)
  p->killed = 0;
    80201c66:	0204a823          	sw	zero,48(s1)
  p->xstate = 0;
    80201c6a:	0204aa23          	sw	zero,52(s1)
  p->state = UNUSED;
    80201c6e:	0004ac23          	sw	zero,24(s1)
}
    80201c72:	60e2                	ld	ra,24(sp)
    80201c74:	6442                	ld	s0,16(sp)
    80201c76:	64a2                	ld	s1,8(sp)
    80201c78:	6105                	addi	sp,sp,32
    80201c7a:	8082                	ret

0000000080201c7c <allocproc>:
{
    80201c7c:	1101                	addi	sp,sp,-32
    80201c7e:	ec06                	sd	ra,24(sp)
    80201c80:	e822                	sd	s0,16(sp)
    80201c82:	e426                	sd	s1,8(sp)
    80201c84:	e04a                	sd	s2,0(sp)
    80201c86:	1000                	addi	s0,sp,32
  for(p = proc; p < &proc[NPROC]; p++) {
    80201c88:	00012497          	auipc	s1,0x12
    80201c8c:	4f848493          	addi	s1,s1,1272 # 80214180 <proc>
    80201c90:	00017917          	auipc	s2,0x17
    80201c94:	e6090913          	addi	s2,s2,-416 # 80218af0 <bcache>
    acquire(&p->lock);
    80201c98:	8526                	mv	a0,s1
    80201c9a:	fffff097          	auipc	ra,0xfffff
    80201c9e:	a2c080e7          	jalr	-1492(ra) # 802006c6 <acquire>
    if(p->state == UNUSED) {
    80201ca2:	4c9c                	lw	a5,24(s1)
    80201ca4:	cf81                	beqz	a5,80201cbc <allocproc+0x40>
      release(&p->lock);
    80201ca6:	8526                	mv	a0,s1
    80201ca8:	fffff097          	auipc	ra,0xfffff
    80201cac:	a72080e7          	jalr	-1422(ra) # 8020071a <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201cb0:	17848493          	addi	s1,s1,376
    80201cb4:	ff2492e3          	bne	s1,s2,80201c98 <allocproc+0x1c>
  return NULL;
    80201cb8:	4481                	li	s1,0
    80201cba:	a085                	j	80201d1a <allocproc+0x9e>
  p->pid = allocpid();
    80201cbc:	00000097          	auipc	ra,0x0
    80201cc0:	e22080e7          	jalr	-478(ra) # 80201ade <allocpid>
    80201cc4:	dc88                	sw	a0,56(s1)
  if((p->trapframe = (struct trapframe *)kalloc()) == NULL){
    80201cc6:	fffff097          	auipc	ra,0xfffff
    80201cca:	894080e7          	jalr	-1900(ra) # 8020055a <kalloc>
    80201cce:	892a                	mv	s2,a0
    80201cd0:	f0a8                	sd	a0,96(s1)
    80201cd2:	c939                	beqz	a0,80201d28 <allocproc+0xac>
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201cd4:	8526                	mv	a0,s1
    80201cd6:	00000097          	auipc	ra,0x0
    80201cda:	e4e080e7          	jalr	-434(ra) # 80201b24 <proc_pagetable>
    80201cde:	e8a8                	sd	a0,80(s1)
    80201ce0:	c939                	beqz	a0,80201d36 <allocproc+0xba>
      (p->kpagetable = proc_kpagetable()) == NULL) {
    80201ce2:	00000097          	auipc	ra,0x0
    80201ce6:	9ee080e7          	jalr	-1554(ra) # 802016d0 <proc_kpagetable>
    80201cea:	eca8                	sd	a0,88(s1)
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201cec:	c529                	beqz	a0,80201d36 <allocproc+0xba>
  p->kstack = VKSTACK;
    80201cee:	0fb00793          	li	a5,251
    80201cf2:	07fa                	slli	a5,a5,0x1e
    80201cf4:	e0bc                	sd	a5,64(s1)
  memset(&p->context, 0, sizeof(p->context));
    80201cf6:	07000613          	li	a2,112
    80201cfa:	4581                	li	a1,0
    80201cfc:	06848513          	addi	a0,s1,104
    80201d00:	fffff097          	auipc	ra,0xfffff
    80201d04:	a62080e7          	jalr	-1438(ra) # 80200762 <memset>
  p->context.ra = (uint64)forkret;
    80201d08:	00000797          	auipc	a5,0x0
    80201d0c:	d7078793          	addi	a5,a5,-656 # 80201a78 <forkret>
    80201d10:	f4bc                	sd	a5,104(s1)
  p->context.sp = p->kstack + PGSIZE;
    80201d12:	60bc                	ld	a5,64(s1)
    80201d14:	6705                	lui	a4,0x1
    80201d16:	97ba                	add	a5,a5,a4
    80201d18:	f8bc                	sd	a5,112(s1)
}
    80201d1a:	8526                	mv	a0,s1
    80201d1c:	60e2                	ld	ra,24(sp)
    80201d1e:	6442                	ld	s0,16(sp)
    80201d20:	64a2                	ld	s1,8(sp)
    80201d22:	6902                	ld	s2,0(sp)
    80201d24:	6105                	addi	sp,sp,32
    80201d26:	8082                	ret
    release(&p->lock);
    80201d28:	8526                	mv	a0,s1
    80201d2a:	fffff097          	auipc	ra,0xfffff
    80201d2e:	9f0080e7          	jalr	-1552(ra) # 8020071a <release>
    return NULL;
    80201d32:	84ca                	mv	s1,s2
    80201d34:	b7dd                	j	80201d1a <allocproc+0x9e>
    freeproc(p);
    80201d36:	8526                	mv	a0,s1
    80201d38:	00000097          	auipc	ra,0x0
    80201d3c:	eda080e7          	jalr	-294(ra) # 80201c12 <freeproc>
    release(&p->lock);
    80201d40:	8526                	mv	a0,s1
    80201d42:	fffff097          	auipc	ra,0xfffff
    80201d46:	9d8080e7          	jalr	-1576(ra) # 8020071a <release>
    return NULL;
    80201d4a:	4481                	li	s1,0
    80201d4c:	b7f9                	j	80201d1a <allocproc+0x9e>

0000000080201d4e <userinit>:
{
    80201d4e:	1101                	addi	sp,sp,-32
    80201d50:	ec06                	sd	ra,24(sp)
    80201d52:	e822                	sd	s0,16(sp)
    80201d54:	e426                	sd	s1,8(sp)
    80201d56:	e04a                	sd	s2,0(sp)
    80201d58:	1000                	addi	s0,sp,32
  p = allocproc();
    80201d5a:	00000097          	auipc	ra,0x0
    80201d5e:	f22080e7          	jalr	-222(ra) # 80201c7c <allocproc>
    80201d62:	84aa                	mv	s1,a0
  initproc = p;
    80201d64:	00012797          	auipc	a5,0x12
    80201d68:	40a7ba23          	sd	a0,1044(a5) # 80214178 <initproc>
  uvminit(p->pagetable , p->kpagetable, initcode, sizeof(initcode));
    80201d6c:	6905                	lui	s2,0x1
    80201d6e:	c8090693          	addi	a3,s2,-896 # c80 <_entry-0x801ff380>
    80201d72:	00008617          	auipc	a2,0x8
    80201d76:	29660613          	addi	a2,a2,662 # 8020a008 <initcode>
    80201d7a:	6d2c                	ld	a1,88(a0)
    80201d7c:	6928                	ld	a0,80(a0)
    80201d7e:	fffff097          	auipc	ra,0xfffff
    80201d82:	194080e7          	jalr	404(ra) # 80200f12 <uvminit>
  p->sz = PGSIZE;
    80201d86:	0524b423          	sd	s2,72(s1)
  p->trapframe->epc = 0x0;      // user program counter
    80201d8a:	70bc                	ld	a5,96(s1)
    80201d8c:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80201d90:	70bc                	ld	a5,96(s1)
    80201d92:	0327b823          	sd	s2,48(a5)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80201d96:	4641                	li	a2,16
    80201d98:	00008597          	auipc	a1,0x8
    80201d9c:	8a058593          	addi	a1,a1,-1888 # 80209638 <digits+0x2b8>
    80201da0:	16048513          	addi	a0,s1,352
    80201da4:	fffff097          	auipc	ra,0xfffff
    80201da8:	b0e080e7          	jalr	-1266(ra) # 802008b2 <safestrcpy>
  p->state = RUNNABLE;
    80201dac:	4789                	li	a5,2
    80201dae:	cc9c                	sw	a5,24(s1)
  p->tmask = 0;
    80201db0:	1604a823          	sw	zero,368(s1)
  release(&p->lock);
    80201db4:	8526                	mv	a0,s1
    80201db6:	fffff097          	auipc	ra,0xfffff
    80201dba:	964080e7          	jalr	-1692(ra) # 8020071a <release>
}
    80201dbe:	60e2                	ld	ra,24(sp)
    80201dc0:	6442                	ld	s0,16(sp)
    80201dc2:	64a2                	ld	s1,8(sp)
    80201dc4:	6902                	ld	s2,0(sp)
    80201dc6:	6105                	addi	sp,sp,32
    80201dc8:	8082                	ret

0000000080201dca <growproc>:
{
    80201dca:	1101                	addi	sp,sp,-32
    80201dcc:	ec06                	sd	ra,24(sp)
    80201dce:	e822                	sd	s0,16(sp)
    80201dd0:	e426                	sd	s1,8(sp)
    80201dd2:	e04a                	sd	s2,0(sp)
    80201dd4:	1000                	addi	s0,sp,32
    80201dd6:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80201dd8:	00000097          	auipc	ra,0x0
    80201ddc:	c68080e7          	jalr	-920(ra) # 80201a40 <myproc>
    80201de0:	892a                	mv	s2,a0
  sz = p->sz;
    80201de2:	6530                	ld	a2,72(a0)
    80201de4:	0006079b          	sext.w	a5,a2
  if(n > 0){
    80201de8:	00904f63          	bgtz	s1,80201e06 <growproc+0x3c>
  } else if(n < 0){
    80201dec:	0204ce63          	bltz	s1,80201e28 <growproc+0x5e>
  p->sz = sz;
    80201df0:	1782                	slli	a5,a5,0x20
    80201df2:	9381                	srli	a5,a5,0x20
    80201df4:	04f93423          	sd	a5,72(s2)
  return 0;
    80201df8:	4501                	li	a0,0
}
    80201dfa:	60e2                	ld	ra,24(sp)
    80201dfc:	6442                	ld	s0,16(sp)
    80201dfe:	64a2                	ld	s1,8(sp)
    80201e00:	6902                	ld	s2,0(sp)
    80201e02:	6105                	addi	sp,sp,32
    80201e04:	8082                	ret
    if((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0) {
    80201e06:	00f486bb          	addw	a3,s1,a5
    80201e0a:	1682                	slli	a3,a3,0x20
    80201e0c:	9281                	srli	a3,a3,0x20
    80201e0e:	1602                	slli	a2,a2,0x20
    80201e10:	9201                	srli	a2,a2,0x20
    80201e12:	6d2c                	ld	a1,88(a0)
    80201e14:	6928                	ld	a0,80(a0)
    80201e16:	fffff097          	auipc	ra,0xfffff
    80201e1a:	1f2080e7          	jalr	498(ra) # 80201008 <uvmalloc>
    80201e1e:	0005079b          	sext.w	a5,a0
    80201e22:	f7f9                	bnez	a5,80201df0 <growproc+0x26>
      return -1;
    80201e24:	557d                	li	a0,-1
    80201e26:	bfd1                	j	80201dfa <growproc+0x30>
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
    80201e28:	00f486bb          	addw	a3,s1,a5
    80201e2c:	1682                	slli	a3,a3,0x20
    80201e2e:	9281                	srli	a3,a3,0x20
    80201e30:	1602                	slli	a2,a2,0x20
    80201e32:	9201                	srli	a2,a2,0x20
    80201e34:	6d2c                	ld	a1,88(a0)
    80201e36:	6928                	ld	a0,80(a0)
    80201e38:	fffff097          	auipc	ra,0xfffff
    80201e3c:	164080e7          	jalr	356(ra) # 80200f9c <uvmdealloc>
    80201e40:	0005079b          	sext.w	a5,a0
    80201e44:	b775                	j	80201df0 <growproc+0x26>

0000000080201e46 <fork>:
{
    80201e46:	7139                	addi	sp,sp,-64
    80201e48:	fc06                	sd	ra,56(sp)
    80201e4a:	f822                	sd	s0,48(sp)
    80201e4c:	f426                	sd	s1,40(sp)
    80201e4e:	f04a                	sd	s2,32(sp)
    80201e50:	ec4e                	sd	s3,24(sp)
    80201e52:	e852                	sd	s4,16(sp)
    80201e54:	e456                	sd	s5,8(sp)
    80201e56:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    80201e58:	00000097          	auipc	ra,0x0
    80201e5c:	be8080e7          	jalr	-1048(ra) # 80201a40 <myproc>
    80201e60:	8aaa                	mv	s5,a0
  if((np = allocproc()) == NULL){
    80201e62:	00000097          	auipc	ra,0x0
    80201e66:	e1a080e7          	jalr	-486(ra) # 80201c7c <allocproc>
    80201e6a:	c965                	beqz	a0,80201f5a <fork+0x114>
    80201e6c:	8a2a                	mv	s4,a0
  if(uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0){
    80201e6e:	048ab683          	ld	a3,72(s5)
    80201e72:	6d30                	ld	a2,88(a0)
    80201e74:	692c                	ld	a1,80(a0)
    80201e76:	050ab503          	ld	a0,80(s5)
    80201e7a:	fffff097          	auipc	ra,0xfffff
    80201e7e:	32a080e7          	jalr	810(ra) # 802011a4 <uvmcopy>
    80201e82:	04054e63          	bltz	a0,80201ede <fork+0x98>
  np->sz = p->sz;
    80201e86:	048ab783          	ld	a5,72(s5)
    80201e8a:	04fa3423          	sd	a5,72(s4)
  np->parent = p;
    80201e8e:	035a3023          	sd	s5,32(s4)
  np->tmask = p->tmask;
    80201e92:	170aa783          	lw	a5,368(s5)
    80201e96:	16fa2823          	sw	a5,368(s4)
  *(np->trapframe) = *(p->trapframe);
    80201e9a:	060ab683          	ld	a3,96(s5)
    80201e9e:	87b6                	mv	a5,a3
    80201ea0:	060a3703          	ld	a4,96(s4)
    80201ea4:	12068693          	addi	a3,a3,288
    80201ea8:	0007b803          	ld	a6,0(a5)
    80201eac:	6788                	ld	a0,8(a5)
    80201eae:	6b8c                	ld	a1,16(a5)
    80201eb0:	6f90                	ld	a2,24(a5)
    80201eb2:	01073023          	sd	a6,0(a4) # 1000 <_entry-0x801ff000>
    80201eb6:	e708                	sd	a0,8(a4)
    80201eb8:	eb0c                	sd	a1,16(a4)
    80201eba:	ef10                	sd	a2,24(a4)
    80201ebc:	02078793          	addi	a5,a5,32
    80201ec0:	02070713          	addi	a4,a4,32
    80201ec4:	fed792e3          	bne	a5,a3,80201ea8 <fork+0x62>
  np->trapframe->a0 = 0;
    80201ec8:	060a3783          	ld	a5,96(s4)
    80201ecc:	0607b823          	sd	zero,112(a5)
  for(i = 0; i < NOFILE; i++)
    80201ed0:	0d8a8493          	addi	s1,s5,216
    80201ed4:	0d8a0913          	addi	s2,s4,216
    80201ed8:	158a8993          	addi	s3,s5,344
    80201edc:	a00d                	j	80201efe <fork+0xb8>
    freeproc(np);
    80201ede:	8552                	mv	a0,s4
    80201ee0:	00000097          	auipc	ra,0x0
    80201ee4:	d32080e7          	jalr	-718(ra) # 80201c12 <freeproc>
    release(&np->lock);
    80201ee8:	8552                	mv	a0,s4
    80201eea:	fffff097          	auipc	ra,0xfffff
    80201eee:	830080e7          	jalr	-2000(ra) # 8020071a <release>
    return -1;
    80201ef2:	54fd                	li	s1,-1
    80201ef4:	a889                	j	80201f46 <fork+0x100>
  for(i = 0; i < NOFILE; i++)
    80201ef6:	04a1                	addi	s1,s1,8
    80201ef8:	0921                	addi	s2,s2,8
    80201efa:	01348b63          	beq	s1,s3,80201f10 <fork+0xca>
    if(p->ofile[i])
    80201efe:	6088                	ld	a0,0(s1)
    80201f00:	d97d                	beqz	a0,80201ef6 <fork+0xb0>
      np->ofile[i] = filedup(p->ofile[i]);
    80201f02:	00002097          	auipc	ra,0x2
    80201f06:	8aa080e7          	jalr	-1878(ra) # 802037ac <filedup>
    80201f0a:	00a93023          	sd	a0,0(s2)
    80201f0e:	b7e5                	j	80201ef6 <fork+0xb0>
  np->cwd = edup(p->cwd);
    80201f10:	158ab503          	ld	a0,344(s5)
    80201f14:	00004097          	auipc	ra,0x4
    80201f18:	fb4080e7          	jalr	-76(ra) # 80205ec8 <edup>
    80201f1c:	14aa3c23          	sd	a0,344(s4)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80201f20:	4641                	li	a2,16
    80201f22:	160a8593          	addi	a1,s5,352
    80201f26:	160a0513          	addi	a0,s4,352
    80201f2a:	fffff097          	auipc	ra,0xfffff
    80201f2e:	988080e7          	jalr	-1656(ra) # 802008b2 <safestrcpy>
  pid = np->pid;
    80201f32:	038a2483          	lw	s1,56(s4)
  np->state = RUNNABLE;
    80201f36:	4789                	li	a5,2
    80201f38:	00fa2c23          	sw	a5,24(s4)
  release(&np->lock);
    80201f3c:	8552                	mv	a0,s4
    80201f3e:	ffffe097          	auipc	ra,0xffffe
    80201f42:	7dc080e7          	jalr	2012(ra) # 8020071a <release>
}
    80201f46:	8526                	mv	a0,s1
    80201f48:	70e2                	ld	ra,56(sp)
    80201f4a:	7442                	ld	s0,48(sp)
    80201f4c:	74a2                	ld	s1,40(sp)
    80201f4e:	7902                	ld	s2,32(sp)
    80201f50:	69e2                	ld	s3,24(sp)
    80201f52:	6a42                	ld	s4,16(sp)
    80201f54:	6aa2                	ld	s5,8(sp)
    80201f56:	6121                	addi	sp,sp,64
    80201f58:	8082                	ret
    return -1;
    80201f5a:	54fd                	li	s1,-1
    80201f5c:	b7ed                	j	80201f46 <fork+0x100>

0000000080201f5e <reparent>:
{
    80201f5e:	7179                	addi	sp,sp,-48
    80201f60:	f406                	sd	ra,40(sp)
    80201f62:	f022                	sd	s0,32(sp)
    80201f64:	ec26                	sd	s1,24(sp)
    80201f66:	e84a                	sd	s2,16(sp)
    80201f68:	e44e                	sd	s3,8(sp)
    80201f6a:	e052                	sd	s4,0(sp)
    80201f6c:	1800                	addi	s0,sp,48
    80201f6e:	892a                	mv	s2,a0
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80201f70:	00012497          	auipc	s1,0x12
    80201f74:	21048493          	addi	s1,s1,528 # 80214180 <proc>
      pp->parent = initproc;
    80201f78:	00012a17          	auipc	s4,0x12
    80201f7c:	0e8a0a13          	addi	s4,s4,232 # 80214060 <pid_lock>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80201f80:	00017997          	auipc	s3,0x17
    80201f84:	b7098993          	addi	s3,s3,-1168 # 80218af0 <bcache>
    80201f88:	a029                	j	80201f92 <reparent+0x34>
    80201f8a:	17848493          	addi	s1,s1,376
    80201f8e:	03348363          	beq	s1,s3,80201fb4 <reparent+0x56>
    if(pp->parent == p){
    80201f92:	709c                	ld	a5,32(s1)
    80201f94:	ff279be3          	bne	a5,s2,80201f8a <reparent+0x2c>
      acquire(&pp->lock);
    80201f98:	8526                	mv	a0,s1
    80201f9a:	ffffe097          	auipc	ra,0xffffe
    80201f9e:	72c080e7          	jalr	1836(ra) # 802006c6 <acquire>
      pp->parent = initproc;
    80201fa2:	118a3783          	ld	a5,280(s4)
    80201fa6:	f09c                	sd	a5,32(s1)
      release(&pp->lock);
    80201fa8:	8526                	mv	a0,s1
    80201faa:	ffffe097          	auipc	ra,0xffffe
    80201fae:	770080e7          	jalr	1904(ra) # 8020071a <release>
    80201fb2:	bfe1                	j	80201f8a <reparent+0x2c>
}
    80201fb4:	70a2                	ld	ra,40(sp)
    80201fb6:	7402                	ld	s0,32(sp)
    80201fb8:	64e2                	ld	s1,24(sp)
    80201fba:	6942                	ld	s2,16(sp)
    80201fbc:	69a2                	ld	s3,8(sp)
    80201fbe:	6a02                	ld	s4,0(sp)
    80201fc0:	6145                	addi	sp,sp,48
    80201fc2:	8082                	ret

0000000080201fc4 <scheduler>:
{
    80201fc4:	715d                	addi	sp,sp,-80
    80201fc6:	e486                	sd	ra,72(sp)
    80201fc8:	e0a2                	sd	s0,64(sp)
    80201fca:	fc26                	sd	s1,56(sp)
    80201fcc:	f84a                	sd	s2,48(sp)
    80201fce:	f44e                	sd	s3,40(sp)
    80201fd0:	f052                	sd	s4,32(sp)
    80201fd2:	ec56                	sd	s5,24(sp)
    80201fd4:	e85a                	sd	s6,16(sp)
    80201fd6:	e45e                	sd	s7,8(sp)
    80201fd8:	e062                	sd	s8,0(sp)
    80201fda:	0880                	addi	s0,sp,80
    80201fdc:	8792                	mv	a5,tp
  int id = r_tp();
    80201fde:	2781                	sext.w	a5,a5
  c->proc = 0;
    80201fe0:	00779b13          	slli	s6,a5,0x7
    80201fe4:	00012717          	auipc	a4,0x12
    80201fe8:	07c70713          	addi	a4,a4,124 # 80214060 <pid_lock>
    80201fec:	975a                	add	a4,a4,s6
    80201fee:	00073c23          	sd	zero,24(a4)
        swtch(&c->context, &p->context);
    80201ff2:	00012717          	auipc	a4,0x12
    80201ff6:	08e70713          	addi	a4,a4,142 # 80214080 <cpus+0x8>
    80201ffa:	9b3a                	add	s6,s6,a4
        c->proc = p;
    80201ffc:	079e                	slli	a5,a5,0x7
    80201ffe:	00012a97          	auipc	s5,0x12
    80202002:	062a8a93          	addi	s5,s5,98 # 80214060 <pid_lock>
    80202006:	9abe                	add	s5,s5,a5
        w_satp(MAKE_SATP(p->kpagetable));
    80202008:	5a7d                	li	s4,-1
    8020200a:	1a7e                	slli	s4,s4,0x3f
        w_satp(MAKE_SATP(kernel_pagetable));
    8020200c:	0000ab97          	auipc	s7,0xa
    80202010:	a74bbb83          	ld	s7,-1420(s7) # 8020ba80 <_GLOBAL_OFFSET_TABLE_+0x48>
    80202014:	a8a5                	j	8020208c <scheduler+0xc8>
      release(&p->lock);
    80202016:	8526                	mv	a0,s1
    80202018:	ffffe097          	auipc	ra,0xffffe
    8020201c:	702080e7          	jalr	1794(ra) # 8020071a <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    80202020:	17848493          	addi	s1,s1,376
    80202024:	05248a63          	beq	s1,s2,80202078 <scheduler+0xb4>
      acquire(&p->lock);
    80202028:	8526                	mv	a0,s1
    8020202a:	ffffe097          	auipc	ra,0xffffe
    8020202e:	69c080e7          	jalr	1692(ra) # 802006c6 <acquire>
      if(p->state == RUNNABLE) {
    80202032:	4c9c                	lw	a5,24(s1)
    80202034:	ff3791e3          	bne	a5,s3,80202016 <scheduler+0x52>
        p->state = RUNNING;
    80202038:	478d                	li	a5,3
    8020203a:	cc9c                	sw	a5,24(s1)
        c->proc = p;
    8020203c:	009abc23          	sd	s1,24(s5)
        w_satp(MAKE_SATP(p->kpagetable));
    80202040:	6cbc                	ld	a5,88(s1)
    80202042:	83b1                	srli	a5,a5,0xc
    80202044:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    80202048:	18079073          	csrw	satp,a5
static inline void
sfence_vma()
{
  // the zero, zero means flush all TLB entries.
  // asm volatile("sfence.vma zero, zero");
  asm volatile("sfence.vma");
    8020204c:	12000073          	sfence.vma
        swtch(&c->context, &p->context);
    80202050:	06848593          	addi	a1,s1,104
    80202054:	855a                	mv	a0,s6
    80202056:	00000097          	auipc	ra,0x0
    8020205a:	60e080e7          	jalr	1550(ra) # 80202664 <swtch>
        w_satp(MAKE_SATP(kernel_pagetable));
    8020205e:	000bb783          	ld	a5,0(s7)
    80202062:	83b1                	srli	a5,a5,0xc
    80202064:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    80202068:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    8020206c:	12000073          	sfence.vma
        c->proc = 0;
    80202070:	000abc23          	sd	zero,24(s5)
        found = 1;
    80202074:	4c05                	li	s8,1
    80202076:	b745                	j	80202016 <scheduler+0x52>
    if(found == 0) {
    80202078:	000c1a63          	bnez	s8,8020208c <scheduler+0xc8>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020207c:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202080:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202084:	10079073          	csrw	sstatus,a5
      asm volatile("wfi");
    80202088:	10500073          	wfi
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020208c:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202090:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202094:	10079073          	csrw	sstatus,a5
    int found = 0;
    80202098:	4c01                	li	s8,0
    for(p = proc; p < &proc[NPROC]; p++) {
    8020209a:	00012497          	auipc	s1,0x12
    8020209e:	0e648493          	addi	s1,s1,230 # 80214180 <proc>
      if(p->state == RUNNABLE) {
    802020a2:	4989                	li	s3,2
    for(p = proc; p < &proc[NPROC]; p++) {
    802020a4:	00017917          	auipc	s2,0x17
    802020a8:	a4c90913          	addi	s2,s2,-1460 # 80218af0 <bcache>
    802020ac:	bfb5                	j	80202028 <scheduler+0x64>

00000000802020ae <sched>:
{
    802020ae:	7179                	addi	sp,sp,-48
    802020b0:	f406                	sd	ra,40(sp)
    802020b2:	f022                	sd	s0,32(sp)
    802020b4:	ec26                	sd	s1,24(sp)
    802020b6:	e84a                	sd	s2,16(sp)
    802020b8:	e44e                	sd	s3,8(sp)
    802020ba:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    802020bc:	00000097          	auipc	ra,0x0
    802020c0:	984080e7          	jalr	-1660(ra) # 80201a40 <myproc>
    802020c4:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    802020c6:	ffffe097          	auipc	ra,0xffffe
    802020ca:	5d2080e7          	jalr	1490(ra) # 80200698 <holding>
    802020ce:	c93d                	beqz	a0,80202144 <sched+0x96>
  asm volatile("mv %0, tp" : "=r" (x) );
    802020d0:	8792                	mv	a5,tp
  if(mycpu()->noff != 1)
    802020d2:	2781                	sext.w	a5,a5
    802020d4:	079e                	slli	a5,a5,0x7
    802020d6:	00012717          	auipc	a4,0x12
    802020da:	f8a70713          	addi	a4,a4,-118 # 80214060 <pid_lock>
    802020de:	97ba                	add	a5,a5,a4
    802020e0:	0907a703          	lw	a4,144(a5)
    802020e4:	4785                	li	a5,1
    802020e6:	06f71763          	bne	a4,a5,80202154 <sched+0xa6>
  if(p->state == RUNNING)
    802020ea:	4c98                	lw	a4,24(s1)
    802020ec:	478d                	li	a5,3
    802020ee:	06f70b63          	beq	a4,a5,80202164 <sched+0xb6>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802020f2:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    802020f6:	8b89                	andi	a5,a5,2
  if(intr_get())
    802020f8:	efb5                	bnez	a5,80202174 <sched+0xc6>
  asm volatile("mv %0, tp" : "=r" (x) );
    802020fa:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    802020fc:	00012917          	auipc	s2,0x12
    80202100:	f6490913          	addi	s2,s2,-156 # 80214060 <pid_lock>
    80202104:	2781                	sext.w	a5,a5
    80202106:	079e                	slli	a5,a5,0x7
    80202108:	97ca                	add	a5,a5,s2
    8020210a:	0947a983          	lw	s3,148(a5)
    8020210e:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    80202110:	2781                	sext.w	a5,a5
    80202112:	079e                	slli	a5,a5,0x7
    80202114:	00012597          	auipc	a1,0x12
    80202118:	f6c58593          	addi	a1,a1,-148 # 80214080 <cpus+0x8>
    8020211c:	95be                	add	a1,a1,a5
    8020211e:	06848513          	addi	a0,s1,104
    80202122:	00000097          	auipc	ra,0x0
    80202126:	542080e7          	jalr	1346(ra) # 80202664 <swtch>
    8020212a:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    8020212c:	2781                	sext.w	a5,a5
    8020212e:	079e                	slli	a5,a5,0x7
    80202130:	993e                	add	s2,s2,a5
    80202132:	09392a23          	sw	s3,148(s2)
}
    80202136:	70a2                	ld	ra,40(sp)
    80202138:	7402                	ld	s0,32(sp)
    8020213a:	64e2                	ld	s1,24(sp)
    8020213c:	6942                	ld	s2,16(sp)
    8020213e:	69a2                	ld	s3,8(sp)
    80202140:	6145                	addi	sp,sp,48
    80202142:	8082                	ret
    panic("sched p->lock");
    80202144:	00007517          	auipc	a0,0x7
    80202148:	50450513          	addi	a0,a0,1284 # 80209648 <digits+0x2c8>
    8020214c:	ffffe097          	auipc	ra,0xffffe
    80202150:	ff8080e7          	jalr	-8(ra) # 80200144 <panic>
    panic("sched locks");
    80202154:	00007517          	auipc	a0,0x7
    80202158:	50450513          	addi	a0,a0,1284 # 80209658 <digits+0x2d8>
    8020215c:	ffffe097          	auipc	ra,0xffffe
    80202160:	fe8080e7          	jalr	-24(ra) # 80200144 <panic>
    panic("sched running");
    80202164:	00007517          	auipc	a0,0x7
    80202168:	50450513          	addi	a0,a0,1284 # 80209668 <digits+0x2e8>
    8020216c:	ffffe097          	auipc	ra,0xffffe
    80202170:	fd8080e7          	jalr	-40(ra) # 80200144 <panic>
    panic("sched interruptible");
    80202174:	00007517          	auipc	a0,0x7
    80202178:	50450513          	addi	a0,a0,1284 # 80209678 <digits+0x2f8>
    8020217c:	ffffe097          	auipc	ra,0xffffe
    80202180:	fc8080e7          	jalr	-56(ra) # 80200144 <panic>

0000000080202184 <exit>:
{
    80202184:	7179                	addi	sp,sp,-48
    80202186:	f406                	sd	ra,40(sp)
    80202188:	f022                	sd	s0,32(sp)
    8020218a:	ec26                	sd	s1,24(sp)
    8020218c:	e84a                	sd	s2,16(sp)
    8020218e:	e44e                	sd	s3,8(sp)
    80202190:	e052                	sd	s4,0(sp)
    80202192:	1800                	addi	s0,sp,48
    80202194:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    80202196:	00000097          	auipc	ra,0x0
    8020219a:	8aa080e7          	jalr	-1878(ra) # 80201a40 <myproc>
    8020219e:	89aa                	mv	s3,a0
  if(p == initproc)
    802021a0:	00012797          	auipc	a5,0x12
    802021a4:	fd87b783          	ld	a5,-40(a5) # 80214178 <initproc>
    802021a8:	0d850493          	addi	s1,a0,216
    802021ac:	15850913          	addi	s2,a0,344
    802021b0:	02a79363          	bne	a5,a0,802021d6 <exit+0x52>
    panic("init exiting");
    802021b4:	00007517          	auipc	a0,0x7
    802021b8:	4dc50513          	addi	a0,a0,1244 # 80209690 <digits+0x310>
    802021bc:	ffffe097          	auipc	ra,0xffffe
    802021c0:	f88080e7          	jalr	-120(ra) # 80200144 <panic>
      fileclose(f);
    802021c4:	00001097          	auipc	ra,0x1
    802021c8:	63a080e7          	jalr	1594(ra) # 802037fe <fileclose>
      p->ofile[fd] = 0;
    802021cc:	0004b023          	sd	zero,0(s1)
  for(int fd = 0; fd < NOFILE; fd++){
    802021d0:	04a1                	addi	s1,s1,8
    802021d2:	01248563          	beq	s1,s2,802021dc <exit+0x58>
    if(p->ofile[fd]){
    802021d6:	6088                	ld	a0,0(s1)
    802021d8:	f575                	bnez	a0,802021c4 <exit+0x40>
    802021da:	bfdd                	j	802021d0 <exit+0x4c>
  eput(p->cwd);
    802021dc:	1589b503          	ld	a0,344(s3)
    802021e0:	00004097          	auipc	ra,0x4
    802021e4:	fca080e7          	jalr	-54(ra) # 802061aa <eput>
  p->cwd = 0;
    802021e8:	1409bc23          	sd	zero,344(s3)
  acquire(&initproc->lock);
    802021ec:	00012497          	auipc	s1,0x12
    802021f0:	e7448493          	addi	s1,s1,-396 # 80214060 <pid_lock>
    802021f4:	1184b503          	ld	a0,280(s1)
    802021f8:	ffffe097          	auipc	ra,0xffffe
    802021fc:	4ce080e7          	jalr	1230(ra) # 802006c6 <acquire>
  wakeup1(initproc);
    80202200:	1184b503          	ld	a0,280(s1)
    80202204:	fffff097          	auipc	ra,0xfffff
    80202208:	650080e7          	jalr	1616(ra) # 80201854 <wakeup1>
  release(&initproc->lock);
    8020220c:	1184b503          	ld	a0,280(s1)
    80202210:	ffffe097          	auipc	ra,0xffffe
    80202214:	50a080e7          	jalr	1290(ra) # 8020071a <release>
  acquire(&p->lock);
    80202218:	854e                	mv	a0,s3
    8020221a:	ffffe097          	auipc	ra,0xffffe
    8020221e:	4ac080e7          	jalr	1196(ra) # 802006c6 <acquire>
  struct proc *original_parent = p->parent;
    80202222:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    80202226:	854e                	mv	a0,s3
    80202228:	ffffe097          	auipc	ra,0xffffe
    8020222c:	4f2080e7          	jalr	1266(ra) # 8020071a <release>
  acquire(&original_parent->lock);
    80202230:	8526                	mv	a0,s1
    80202232:	ffffe097          	auipc	ra,0xffffe
    80202236:	494080e7          	jalr	1172(ra) # 802006c6 <acquire>
  acquire(&p->lock);
    8020223a:	854e                	mv	a0,s3
    8020223c:	ffffe097          	auipc	ra,0xffffe
    80202240:	48a080e7          	jalr	1162(ra) # 802006c6 <acquire>
  reparent(p);
    80202244:	854e                	mv	a0,s3
    80202246:	00000097          	auipc	ra,0x0
    8020224a:	d18080e7          	jalr	-744(ra) # 80201f5e <reparent>
  wakeup1(original_parent);
    8020224e:	8526                	mv	a0,s1
    80202250:	fffff097          	auipc	ra,0xfffff
    80202254:	604080e7          	jalr	1540(ra) # 80201854 <wakeup1>
  p->xstate = status;
    80202258:	0349aa23          	sw	s4,52(s3)
  p->state = ZOMBIE;
    8020225c:	4791                	li	a5,4
    8020225e:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    80202262:	8526                	mv	a0,s1
    80202264:	ffffe097          	auipc	ra,0xffffe
    80202268:	4b6080e7          	jalr	1206(ra) # 8020071a <release>
  sched();
    8020226c:	00000097          	auipc	ra,0x0
    80202270:	e42080e7          	jalr	-446(ra) # 802020ae <sched>
  panic("zombie exit");
    80202274:	00007517          	auipc	a0,0x7
    80202278:	42c50513          	addi	a0,a0,1068 # 802096a0 <digits+0x320>
    8020227c:	ffffe097          	auipc	ra,0xffffe
    80202280:	ec8080e7          	jalr	-312(ra) # 80200144 <panic>

0000000080202284 <yield>:
{
    80202284:	1101                	addi	sp,sp,-32
    80202286:	ec06                	sd	ra,24(sp)
    80202288:	e822                	sd	s0,16(sp)
    8020228a:	e426                	sd	s1,8(sp)
    8020228c:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    8020228e:	fffff097          	auipc	ra,0xfffff
    80202292:	7b2080e7          	jalr	1970(ra) # 80201a40 <myproc>
    80202296:	84aa                	mv	s1,a0
  acquire(&p->lock);
    80202298:	ffffe097          	auipc	ra,0xffffe
    8020229c:	42e080e7          	jalr	1070(ra) # 802006c6 <acquire>
  p->state = RUNNABLE;
    802022a0:	4789                	li	a5,2
    802022a2:	cc9c                	sw	a5,24(s1)
  sched();
    802022a4:	00000097          	auipc	ra,0x0
    802022a8:	e0a080e7          	jalr	-502(ra) # 802020ae <sched>
  release(&p->lock);
    802022ac:	8526                	mv	a0,s1
    802022ae:	ffffe097          	auipc	ra,0xffffe
    802022b2:	46c080e7          	jalr	1132(ra) # 8020071a <release>
}
    802022b6:	60e2                	ld	ra,24(sp)
    802022b8:	6442                	ld	s0,16(sp)
    802022ba:	64a2                	ld	s1,8(sp)
    802022bc:	6105                	addi	sp,sp,32
    802022be:	8082                	ret

00000000802022c0 <sleep>:
{
    802022c0:	7179                	addi	sp,sp,-48
    802022c2:	f406                	sd	ra,40(sp)
    802022c4:	f022                	sd	s0,32(sp)
    802022c6:	ec26                	sd	s1,24(sp)
    802022c8:	e84a                	sd	s2,16(sp)
    802022ca:	e44e                	sd	s3,8(sp)
    802022cc:	1800                	addi	s0,sp,48
    802022ce:	89aa                	mv	s3,a0
    802022d0:	892e                	mv	s2,a1
  struct proc *p = myproc();
    802022d2:	fffff097          	auipc	ra,0xfffff
    802022d6:	76e080e7          	jalr	1902(ra) # 80201a40 <myproc>
    802022da:	84aa                	mv	s1,a0
  if(lk != &p->lock){  //DOC: sleeplock0
    802022dc:	05250663          	beq	a0,s2,80202328 <sleep+0x68>
    acquire(&p->lock);  //DOC: sleeplock1
    802022e0:	ffffe097          	auipc	ra,0xffffe
    802022e4:	3e6080e7          	jalr	998(ra) # 802006c6 <acquire>
    release(lk);
    802022e8:	854a                	mv	a0,s2
    802022ea:	ffffe097          	auipc	ra,0xffffe
    802022ee:	430080e7          	jalr	1072(ra) # 8020071a <release>
  p->chan = chan;
    802022f2:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    802022f6:	4785                	li	a5,1
    802022f8:	cc9c                	sw	a5,24(s1)
  sched();
    802022fa:	00000097          	auipc	ra,0x0
    802022fe:	db4080e7          	jalr	-588(ra) # 802020ae <sched>
  p->chan = 0;
    80202302:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    80202306:	8526                	mv	a0,s1
    80202308:	ffffe097          	auipc	ra,0xffffe
    8020230c:	412080e7          	jalr	1042(ra) # 8020071a <release>
    acquire(lk);
    80202310:	854a                	mv	a0,s2
    80202312:	ffffe097          	auipc	ra,0xffffe
    80202316:	3b4080e7          	jalr	948(ra) # 802006c6 <acquire>
}
    8020231a:	70a2                	ld	ra,40(sp)
    8020231c:	7402                	ld	s0,32(sp)
    8020231e:	64e2                	ld	s1,24(sp)
    80202320:	6942                	ld	s2,16(sp)
    80202322:	69a2                	ld	s3,8(sp)
    80202324:	6145                	addi	sp,sp,48
    80202326:	8082                	ret
  p->chan = chan;
    80202328:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    8020232c:	4785                	li	a5,1
    8020232e:	cd1c                	sw	a5,24(a0)
  sched();
    80202330:	00000097          	auipc	ra,0x0
    80202334:	d7e080e7          	jalr	-642(ra) # 802020ae <sched>
  p->chan = 0;
    80202338:	0204b423          	sd	zero,40(s1)
  if(lk != &p->lock){
    8020233c:	bff9                	j	8020231a <sleep+0x5a>

000000008020233e <wait>:
{
    8020233e:	715d                	addi	sp,sp,-80
    80202340:	e486                	sd	ra,72(sp)
    80202342:	e0a2                	sd	s0,64(sp)
    80202344:	fc26                	sd	s1,56(sp)
    80202346:	f84a                	sd	s2,48(sp)
    80202348:	f44e                	sd	s3,40(sp)
    8020234a:	f052                	sd	s4,32(sp)
    8020234c:	ec56                	sd	s5,24(sp)
    8020234e:	e85a                	sd	s6,16(sp)
    80202350:	e45e                	sd	s7,8(sp)
    80202352:	0880                	addi	s0,sp,80
    80202354:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
    80202356:	fffff097          	auipc	ra,0xfffff
    8020235a:	6ea080e7          	jalr	1770(ra) # 80201a40 <myproc>
    8020235e:	892a                	mv	s2,a0
  acquire(&p->lock);
    80202360:	ffffe097          	auipc	ra,0xffffe
    80202364:	366080e7          	jalr	870(ra) # 802006c6 <acquire>
    havekids = 0;
    80202368:	4b81                	li	s7,0
        if(np->state == ZOMBIE){
    8020236a:	4a11                	li	s4,4
        havekids = 1;
    8020236c:	4a85                	li	s5,1
    for(np = proc; np < &proc[NPROC]; np++){
    8020236e:	00016997          	auipc	s3,0x16
    80202372:	78298993          	addi	s3,s3,1922 # 80218af0 <bcache>
    havekids = 0;
    80202376:	875e                	mv	a4,s7
    for(np = proc; np < &proc[NPROC]; np++){
    80202378:	00012497          	auipc	s1,0x12
    8020237c:	e0848493          	addi	s1,s1,-504 # 80214180 <proc>
    80202380:	a8b9                	j	802023de <wait+0xa0>
          pid = np->pid;
    80202382:	0384a983          	lw	s3,56(s1)
          if(addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0) {
    80202386:	000b0c63          	beqz	s6,8020239e <wait+0x60>
    8020238a:	4611                	li	a2,4
    8020238c:	03448593          	addi	a1,s1,52
    80202390:	855a                	mv	a0,s6
    80202392:	fffff097          	auipc	ra,0xfffff
    80202396:	fe4080e7          	jalr	-28(ra) # 80201376 <copyout2>
    8020239a:	02054263          	bltz	a0,802023be <wait+0x80>
          freeproc(np);
    8020239e:	8526                	mv	a0,s1
    802023a0:	00000097          	auipc	ra,0x0
    802023a4:	872080e7          	jalr	-1934(ra) # 80201c12 <freeproc>
          release(&np->lock);
    802023a8:	8526                	mv	a0,s1
    802023aa:	ffffe097          	auipc	ra,0xffffe
    802023ae:	370080e7          	jalr	880(ra) # 8020071a <release>
          release(&p->lock);
    802023b2:	854a                	mv	a0,s2
    802023b4:	ffffe097          	auipc	ra,0xffffe
    802023b8:	366080e7          	jalr	870(ra) # 8020071a <release>
          return pid;
    802023bc:	a8a9                	j	80202416 <wait+0xd8>
            release(&np->lock);
    802023be:	8526                	mv	a0,s1
    802023c0:	ffffe097          	auipc	ra,0xffffe
    802023c4:	35a080e7          	jalr	858(ra) # 8020071a <release>
            release(&p->lock);
    802023c8:	854a                	mv	a0,s2
    802023ca:	ffffe097          	auipc	ra,0xffffe
    802023ce:	350080e7          	jalr	848(ra) # 8020071a <release>
            return -1;
    802023d2:	59fd                	li	s3,-1
    802023d4:	a089                	j	80202416 <wait+0xd8>
    for(np = proc; np < &proc[NPROC]; np++){
    802023d6:	17848493          	addi	s1,s1,376
    802023da:	03348463          	beq	s1,s3,80202402 <wait+0xc4>
      if(np->parent == p){
    802023de:	709c                	ld	a5,32(s1)
    802023e0:	ff279be3          	bne	a5,s2,802023d6 <wait+0x98>
        acquire(&np->lock);
    802023e4:	8526                	mv	a0,s1
    802023e6:	ffffe097          	auipc	ra,0xffffe
    802023ea:	2e0080e7          	jalr	736(ra) # 802006c6 <acquire>
        if(np->state == ZOMBIE){
    802023ee:	4c9c                	lw	a5,24(s1)
    802023f0:	f94789e3          	beq	a5,s4,80202382 <wait+0x44>
        release(&np->lock);
    802023f4:	8526                	mv	a0,s1
    802023f6:	ffffe097          	auipc	ra,0xffffe
    802023fa:	324080e7          	jalr	804(ra) # 8020071a <release>
        havekids = 1;
    802023fe:	8756                	mv	a4,s5
    80202400:	bfd9                	j	802023d6 <wait+0x98>
    if(!havekids || p->killed){
    80202402:	c701                	beqz	a4,8020240a <wait+0xcc>
    80202404:	03092783          	lw	a5,48(s2)
    80202408:	c39d                	beqz	a5,8020242e <wait+0xf0>
      release(&p->lock);
    8020240a:	854a                	mv	a0,s2
    8020240c:	ffffe097          	auipc	ra,0xffffe
    80202410:	30e080e7          	jalr	782(ra) # 8020071a <release>
      return -1;
    80202414:	59fd                	li	s3,-1
}
    80202416:	854e                	mv	a0,s3
    80202418:	60a6                	ld	ra,72(sp)
    8020241a:	6406                	ld	s0,64(sp)
    8020241c:	74e2                	ld	s1,56(sp)
    8020241e:	7942                	ld	s2,48(sp)
    80202420:	79a2                	ld	s3,40(sp)
    80202422:	7a02                	ld	s4,32(sp)
    80202424:	6ae2                	ld	s5,24(sp)
    80202426:	6b42                	ld	s6,16(sp)
    80202428:	6ba2                	ld	s7,8(sp)
    8020242a:	6161                	addi	sp,sp,80
    8020242c:	8082                	ret
    sleep(p, &p->lock);  //DOC: wait-sleep
    8020242e:	85ca                	mv	a1,s2
    80202430:	854a                	mv	a0,s2
    80202432:	00000097          	auipc	ra,0x0
    80202436:	e8e080e7          	jalr	-370(ra) # 802022c0 <sleep>
    havekids = 0;
    8020243a:	bf35                	j	80202376 <wait+0x38>

000000008020243c <wakeup>:
{
    8020243c:	7139                	addi	sp,sp,-64
    8020243e:	fc06                	sd	ra,56(sp)
    80202440:	f822                	sd	s0,48(sp)
    80202442:	f426                	sd	s1,40(sp)
    80202444:	f04a                	sd	s2,32(sp)
    80202446:	ec4e                	sd	s3,24(sp)
    80202448:	e852                	sd	s4,16(sp)
    8020244a:	e456                	sd	s5,8(sp)
    8020244c:	0080                	addi	s0,sp,64
    8020244e:	8a2a                	mv	s4,a0
  for(p = proc; p < &proc[NPROC]; p++) {
    80202450:	00012497          	auipc	s1,0x12
    80202454:	d3048493          	addi	s1,s1,-720 # 80214180 <proc>
    if(p->state == SLEEPING && p->chan == chan) {
    80202458:	4985                	li	s3,1
      p->state = RUNNABLE;
    8020245a:	4a89                	li	s5,2
  for(p = proc; p < &proc[NPROC]; p++) {
    8020245c:	00016917          	auipc	s2,0x16
    80202460:	69490913          	addi	s2,s2,1684 # 80218af0 <bcache>
    80202464:	a811                	j	80202478 <wakeup+0x3c>
    release(&p->lock);
    80202466:	8526                	mv	a0,s1
    80202468:	ffffe097          	auipc	ra,0xffffe
    8020246c:	2b2080e7          	jalr	690(ra) # 8020071a <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80202470:	17848493          	addi	s1,s1,376
    80202474:	03248063          	beq	s1,s2,80202494 <wakeup+0x58>
    acquire(&p->lock);
    80202478:	8526                	mv	a0,s1
    8020247a:	ffffe097          	auipc	ra,0xffffe
    8020247e:	24c080e7          	jalr	588(ra) # 802006c6 <acquire>
    if(p->state == SLEEPING && p->chan == chan) {
    80202482:	4c9c                	lw	a5,24(s1)
    80202484:	ff3791e3          	bne	a5,s3,80202466 <wakeup+0x2a>
    80202488:	749c                	ld	a5,40(s1)
    8020248a:	fd479ee3          	bne	a5,s4,80202466 <wakeup+0x2a>
      p->state = RUNNABLE;
    8020248e:	0154ac23          	sw	s5,24(s1)
    80202492:	bfd1                	j	80202466 <wakeup+0x2a>
}
    80202494:	70e2                	ld	ra,56(sp)
    80202496:	7442                	ld	s0,48(sp)
    80202498:	74a2                	ld	s1,40(sp)
    8020249a:	7902                	ld	s2,32(sp)
    8020249c:	69e2                	ld	s3,24(sp)
    8020249e:	6a42                	ld	s4,16(sp)
    802024a0:	6aa2                	ld	s5,8(sp)
    802024a2:	6121                	addi	sp,sp,64
    802024a4:	8082                	ret

00000000802024a6 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    802024a6:	7179                	addi	sp,sp,-48
    802024a8:	f406                	sd	ra,40(sp)
    802024aa:	f022                	sd	s0,32(sp)
    802024ac:	ec26                	sd	s1,24(sp)
    802024ae:	e84a                	sd	s2,16(sp)
    802024b0:	e44e                	sd	s3,8(sp)
    802024b2:	1800                	addi	s0,sp,48
    802024b4:	892a                	mv	s2,a0
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    802024b6:	00012497          	auipc	s1,0x12
    802024ba:	cca48493          	addi	s1,s1,-822 # 80214180 <proc>
    802024be:	00016997          	auipc	s3,0x16
    802024c2:	63298993          	addi	s3,s3,1586 # 80218af0 <bcache>
    acquire(&p->lock);
    802024c6:	8526                	mv	a0,s1
    802024c8:	ffffe097          	auipc	ra,0xffffe
    802024cc:	1fe080e7          	jalr	510(ra) # 802006c6 <acquire>
    if(p->pid == pid){
    802024d0:	5c9c                	lw	a5,56(s1)
    802024d2:	01278d63          	beq	a5,s2,802024ec <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    802024d6:	8526                	mv	a0,s1
    802024d8:	ffffe097          	auipc	ra,0xffffe
    802024dc:	242080e7          	jalr	578(ra) # 8020071a <release>
  for(p = proc; p < &proc[NPROC]; p++){
    802024e0:	17848493          	addi	s1,s1,376
    802024e4:	ff3491e3          	bne	s1,s3,802024c6 <kill+0x20>
  }
  return -1;
    802024e8:	557d                	li	a0,-1
    802024ea:	a821                	j	80202502 <kill+0x5c>
      p->killed = 1;
    802024ec:	4785                	li	a5,1
    802024ee:	d89c                	sw	a5,48(s1)
      if(p->state == SLEEPING){
    802024f0:	4c98                	lw	a4,24(s1)
    802024f2:	00f70f63          	beq	a4,a5,80202510 <kill+0x6a>
      release(&p->lock);
    802024f6:	8526                	mv	a0,s1
    802024f8:	ffffe097          	auipc	ra,0xffffe
    802024fc:	222080e7          	jalr	546(ra) # 8020071a <release>
      return 0;
    80202500:	4501                	li	a0,0
}
    80202502:	70a2                	ld	ra,40(sp)
    80202504:	7402                	ld	s0,32(sp)
    80202506:	64e2                	ld	s1,24(sp)
    80202508:	6942                	ld	s2,16(sp)
    8020250a:	69a2                	ld	s3,8(sp)
    8020250c:	6145                	addi	sp,sp,48
    8020250e:	8082                	ret
        p->state = RUNNABLE;
    80202510:	4789                	li	a5,2
    80202512:	cc9c                	sw	a5,24(s1)
    80202514:	b7cd                	j	802024f6 <kill+0x50>

0000000080202516 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80202516:	1101                	addi	sp,sp,-32
    80202518:	ec06                	sd	ra,24(sp)
    8020251a:	e822                	sd	s0,16(sp)
    8020251c:	e426                	sd	s1,8(sp)
    8020251e:	1000                	addi	s0,sp,32
    80202520:	84aa                	mv	s1,a0
    80202522:	852e                	mv	a0,a1
    80202524:	85b2                	mv	a1,a2
    80202526:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_dst){
    80202528:	c891                	beqz	s1,8020253c <either_copyout+0x26>
    // return copyout(p->pagetable, dst, src, len);
    return copyout2(dst, src, len);
    8020252a:	fffff097          	auipc	ra,0xfffff
    8020252e:	e4c080e7          	jalr	-436(ra) # 80201376 <copyout2>
  } else {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    80202532:	60e2                	ld	ra,24(sp)
    80202534:	6442                	ld	s0,16(sp)
    80202536:	64a2                	ld	s1,8(sp)
    80202538:	6105                	addi	sp,sp,32
    8020253a:	8082                	ret
    memmove((char *)dst, src, len);
    8020253c:	0006861b          	sext.w	a2,a3
    80202540:	ffffe097          	auipc	ra,0xffffe
    80202544:	27e080e7          	jalr	638(ra) # 802007be <memmove>
    return 0;
    80202548:	8526                	mv	a0,s1
    8020254a:	b7e5                	j	80202532 <either_copyout+0x1c>

000000008020254c <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    8020254c:	1101                	addi	sp,sp,-32
    8020254e:	ec06                	sd	ra,24(sp)
    80202550:	e822                	sd	s0,16(sp)
    80202552:	e426                	sd	s1,8(sp)
    80202554:	1000                	addi	s0,sp,32
    80202556:	84ae                	mv	s1,a1
    80202558:	85b2                	mv	a1,a2
    8020255a:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_src){
    8020255c:	c891                	beqz	s1,80202570 <either_copyin+0x24>
    // return copyin(p->pagetable, dst, src, len);
    return copyin2(dst, src, len);
    8020255e:	fffff097          	auipc	ra,0xfffff
    80202562:	ef8080e7          	jalr	-264(ra) # 80201456 <copyin2>
  } else {
    memmove(dst, (char*)src, len);
    return 0;
  }
}
    80202566:	60e2                	ld	ra,24(sp)
    80202568:	6442                	ld	s0,16(sp)
    8020256a:	64a2                	ld	s1,8(sp)
    8020256c:	6105                	addi	sp,sp,32
    8020256e:	8082                	ret
    memmove(dst, (char*)src, len);
    80202570:	0006861b          	sext.w	a2,a3
    80202574:	ffffe097          	auipc	ra,0xffffe
    80202578:	24a080e7          	jalr	586(ra) # 802007be <memmove>
    return 0;
    8020257c:	8526                	mv	a0,s1
    8020257e:	b7e5                	j	80202566 <either_copyin+0x1a>

0000000080202580 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80202580:	715d                	addi	sp,sp,-80
    80202582:	e486                	sd	ra,72(sp)
    80202584:	e0a2                	sd	s0,64(sp)
    80202586:	fc26                	sd	s1,56(sp)
    80202588:	f84a                	sd	s2,48(sp)
    8020258a:	f44e                	sd	s3,40(sp)
    8020258c:	f052                	sd	s4,32(sp)
    8020258e:	ec56                	sd	s5,24(sp)
    80202590:	e85a                	sd	s6,16(sp)
    80202592:	e45e                	sd	s7,8(sp)
    80202594:	0880                	addi	s0,sp,80
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    80202596:	00007517          	auipc	a0,0x7
    8020259a:	12250513          	addi	a0,a0,290 # 802096b8 <digits+0x338>
    8020259e:	ffffe097          	auipc	ra,0xffffe
    802025a2:	bf0080e7          	jalr	-1040(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    802025a6:	00012497          	auipc	s1,0x12
    802025aa:	d3a48493          	addi	s1,s1,-710 # 802142e0 <proc+0x160>
    802025ae:	00016917          	auipc	s2,0x16
    802025b2:	6a290913          	addi	s2,s2,1698 # 80218c50 <bcache+0x160>
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802025b6:	4b11                	li	s6,4
      state = states[p->state];
    else
      state = "???";
    802025b8:	00007997          	auipc	s3,0x7
    802025bc:	0f898993          	addi	s3,s3,248 # 802096b0 <digits+0x330>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802025c0:	00007a97          	auipc	s5,0x7
    802025c4:	110a8a93          	addi	s5,s5,272 # 802096d0 <digits+0x350>
    printf("\n");
    802025c8:	00007a17          	auipc	s4,0x7
    802025cc:	b10a0a13          	addi	s4,s4,-1264 # 802090d8 <etext+0xd8>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802025d0:	00008b97          	auipc	s7,0x8
    802025d4:	6b8b8b93          	addi	s7,s7,1720 # 8020ac88 <states.0>
    802025d8:	a01d                	j	802025fe <procdump+0x7e>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802025da:	ee86b703          	ld	a4,-280(a3)
    802025de:	ed86a583          	lw	a1,-296(a3)
    802025e2:	8556                	mv	a0,s5
    802025e4:	ffffe097          	auipc	ra,0xffffe
    802025e8:	baa080e7          	jalr	-1110(ra) # 8020018e <printf>
    printf("\n");
    802025ec:	8552                	mv	a0,s4
    802025ee:	ffffe097          	auipc	ra,0xffffe
    802025f2:	ba0080e7          	jalr	-1120(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    802025f6:	17848493          	addi	s1,s1,376
    802025fa:	03248263          	beq	s1,s2,8020261e <procdump+0x9e>
    if(p->state == UNUSED)
    802025fe:	86a6                	mv	a3,s1
    80202600:	eb84a783          	lw	a5,-328(s1)
    80202604:	dbed                	beqz	a5,802025f6 <procdump+0x76>
      state = "???";
    80202606:	864e                	mv	a2,s3
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80202608:	fcfb69e3          	bltu	s6,a5,802025da <procdump+0x5a>
    8020260c:	02079713          	slli	a4,a5,0x20
    80202610:	01d75793          	srli	a5,a4,0x1d
    80202614:	97de                	add	a5,a5,s7
    80202616:	6390                	ld	a2,0(a5)
    80202618:	f269                	bnez	a2,802025da <procdump+0x5a>
      state = "???";
    8020261a:	864e                	mv	a2,s3
    8020261c:	bf7d                	j	802025da <procdump+0x5a>
  }
}
    8020261e:	60a6                	ld	ra,72(sp)
    80202620:	6406                	ld	s0,64(sp)
    80202622:	74e2                	ld	s1,56(sp)
    80202624:	7942                	ld	s2,48(sp)
    80202626:	79a2                	ld	s3,40(sp)
    80202628:	7a02                	ld	s4,32(sp)
    8020262a:	6ae2                	ld	s5,24(sp)
    8020262c:	6b42                	ld	s6,16(sp)
    8020262e:	6ba2                	ld	s7,8(sp)
    80202630:	6161                	addi	sp,sp,80
    80202632:	8082                	ret

0000000080202634 <procnum>:

uint64
procnum(void)
{
    80202634:	1141                	addi	sp,sp,-16
    80202636:	e422                	sd	s0,8(sp)
    80202638:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++) {
    8020263a:	00012797          	auipc	a5,0x12
    8020263e:	b4678793          	addi	a5,a5,-1210 # 80214180 <proc>
  int num = 0;
    80202642:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++) {
    80202644:	00016697          	auipc	a3,0x16
    80202648:	4ac68693          	addi	a3,a3,1196 # 80218af0 <bcache>
    8020264c:	a029                	j	80202656 <procnum+0x22>
    8020264e:	17878793          	addi	a5,a5,376
    80202652:	00d78663          	beq	a5,a3,8020265e <procnum+0x2a>
    if (p->state != UNUSED) {
    80202656:	4f98                	lw	a4,24(a5)
    80202658:	db7d                	beqz	a4,8020264e <procnum+0x1a>
      num++;
    8020265a:	2505                	addiw	a0,a0,1
    8020265c:	bfcd                	j	8020264e <procnum+0x1a>
    }
  }

  return num;
}
    8020265e:	6422                	ld	s0,8(sp)
    80202660:	0141                	addi	sp,sp,16
    80202662:	8082                	ret

0000000080202664 <swtch>:
    80202664:	00153023          	sd	ra,0(a0)
    80202668:	00253423          	sd	sp,8(a0)
    8020266c:	e900                	sd	s0,16(a0)
    8020266e:	ed04                	sd	s1,24(a0)
    80202670:	03253023          	sd	s2,32(a0)
    80202674:	03353423          	sd	s3,40(a0)
    80202678:	03453823          	sd	s4,48(a0)
    8020267c:	03553c23          	sd	s5,56(a0)
    80202680:	05653023          	sd	s6,64(a0)
    80202684:	05753423          	sd	s7,72(a0)
    80202688:	05853823          	sd	s8,80(a0)
    8020268c:	05953c23          	sd	s9,88(a0)
    80202690:	07a53023          	sd	s10,96(a0)
    80202694:	07b53423          	sd	s11,104(a0)
    80202698:	0005b083          	ld	ra,0(a1)
    8020269c:	0085b103          	ld	sp,8(a1)
    802026a0:	6980                	ld	s0,16(a1)
    802026a2:	6d84                	ld	s1,24(a1)
    802026a4:	0205b903          	ld	s2,32(a1)
    802026a8:	0285b983          	ld	s3,40(a1)
    802026ac:	0305ba03          	ld	s4,48(a1)
    802026b0:	0385ba83          	ld	s5,56(a1)
    802026b4:	0405bb03          	ld	s6,64(a1)
    802026b8:	0485bb83          	ld	s7,72(a1)
    802026bc:	0505bc03          	ld	s8,80(a1)
    802026c0:	0585bc83          	ld	s9,88(a1)
    802026c4:	0605bd03          	ld	s10,96(a1)
    802026c8:	0685bd83          	ld	s11,104(a1)
    802026cc:	8082                	ret

00000000802026ce <trapinithart>:
    802026ce:	1141                	addi	sp,sp,-16
    802026d0:	e406                	sd	ra,8(sp)
    802026d2:	e022                	sd	s0,0(sp)
    802026d4:	0800                	addi	s0,sp,16
    802026d6:	00009797          	auipc	a5,0x9
    802026da:	37a7b783          	ld	a5,890(a5) # 8020ba50 <_GLOBAL_OFFSET_TABLE_+0x18>
    802026de:	10579073          	csrw	stvec,a5
    802026e2:	100027f3          	csrr	a5,sstatus
    802026e6:	0027e793          	ori	a5,a5,2
    802026ea:	10079073          	csrw	sstatus,a5
    802026ee:	104027f3          	csrr	a5,sie
    802026f2:	2227e793          	ori	a5,a5,546
    802026f6:	10479073          	csrw	sie,a5
    802026fa:	00003097          	auipc	ra,0x3
    802026fe:	80c080e7          	jalr	-2036(ra) # 80204f06 <set_next_timeout>
    80202702:	60a2                	ld	ra,8(sp)
    80202704:	6402                	ld	s0,0(sp)
    80202706:	0141                	addi	sp,sp,16
    80202708:	8082                	ret

000000008020270a <usertrapret>:
    8020270a:	1141                	addi	sp,sp,-16
    8020270c:	e406                	sd	ra,8(sp)
    8020270e:	e022                	sd	s0,0(sp)
    80202710:	0800                	addi	s0,sp,16
    80202712:	fffff097          	auipc	ra,0xfffff
    80202716:	32e080e7          	jalr	814(ra) # 80201a40 <myproc>
    8020271a:	100027f3          	csrr	a5,sstatus
    8020271e:	9bf5                	andi	a5,a5,-3
    80202720:	10079073          	csrw	sstatus,a5
    80202724:	00009697          	auipc	a3,0x9
    80202728:	31c6b683          	ld	a3,796(a3) # 8020ba40 <_GLOBAL_OFFSET_TABLE_+0x8>
    8020272c:	00009717          	auipc	a4,0x9
    80202730:	34473703          	ld	a4,836(a4) # 8020ba70 <_GLOBAL_OFFSET_TABLE_+0x38>
    80202734:	8f15                	sub	a4,a4,a3
    80202736:	040007b7          	lui	a5,0x4000
    8020273a:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c200001>
    8020273c:	07b2                	slli	a5,a5,0xc
    8020273e:	973e                	add	a4,a4,a5
    80202740:	10571073          	csrw	stvec,a4
    80202744:	7138                	ld	a4,96(a0)
    80202746:	18002673          	csrr	a2,satp
    8020274a:	e310                	sd	a2,0(a4)
    8020274c:	7130                	ld	a2,96(a0)
    8020274e:	6138                	ld	a4,64(a0)
    80202750:	6585                	lui	a1,0x1
    80202752:	972e                	add	a4,a4,a1
    80202754:	e618                	sd	a4,8(a2)
    80202756:	7138                	ld	a4,96(a0)
    80202758:	00000617          	auipc	a2,0x0
    8020275c:	0f860613          	addi	a2,a2,248 # 80202850 <usertrap>
    80202760:	eb10                	sd	a2,16(a4)
    80202762:	7138                	ld	a4,96(a0)
    80202764:	8612                	mv	a2,tp
    80202766:	f310                	sd	a2,32(a4)
    80202768:	10002773          	csrr	a4,sstatus
    8020276c:	eff77713          	andi	a4,a4,-257
    80202770:	02076713          	ori	a4,a4,32
    80202774:	10071073          	csrw	sstatus,a4
    80202778:	7138                	ld	a4,96(a0)
    8020277a:	6f18                	ld	a4,24(a4)
    8020277c:	14171073          	csrw	sepc,a4
    80202780:	692c                	ld	a1,80(a0)
    80202782:	81b1                	srli	a1,a1,0xc
    80202784:	00009717          	auipc	a4,0x9
    80202788:	2c473703          	ld	a4,708(a4) # 8020ba48 <_GLOBAL_OFFSET_TABLE_+0x10>
    8020278c:	8f15                	sub	a4,a4,a3
    8020278e:	97ba                	add	a5,a5,a4
    80202790:	577d                	li	a4,-1
    80202792:	177e                	slli	a4,a4,0x3f
    80202794:	8dd9                	or	a1,a1,a4
    80202796:	02000537          	lui	a0,0x2000
    8020279a:	157d                	addi	a0,a0,-1 # 1ffffff <_entry-0x7e200001>
    8020279c:	0536                	slli	a0,a0,0xd
    8020279e:	9782                	jalr	a5
    802027a0:	60a2                	ld	ra,8(sp)
    802027a2:	6402                	ld	s0,0(sp)
    802027a4:	0141                	addi	sp,sp,16
    802027a6:	8082                	ret

00000000802027a8 <devintr>:
    802027a8:	142027f3          	csrr	a5,scause
    802027ac:	4501                	li	a0,0
    802027ae:	0a07d063          	bgez	a5,8020284e <devintr+0xa6>
    802027b2:	1101                	addi	sp,sp,-32
    802027b4:	ec06                	sd	ra,24(sp)
    802027b6:	e822                	sd	s0,16(sp)
    802027b8:	e426                	sd	s1,8(sp)
    802027ba:	1000                	addi	s0,sp,32
    802027bc:	0ff7f713          	zext.b	a4,a5
    802027c0:	46a5                	li	a3,9
    802027c2:	00d70d63          	beq	a4,a3,802027dc <devintr+0x34>
    802027c6:	577d                	li	a4,-1
    802027c8:	177e                	slli	a4,a4,0x3f
    802027ca:	0715                	addi	a4,a4,5
    802027cc:	4501                	li	a0,0
    802027ce:	06e78a63          	beq	a5,a4,80202842 <devintr+0x9a>
    802027d2:	60e2                	ld	ra,24(sp)
    802027d4:	6442                	ld	s0,16(sp)
    802027d6:	64a2                	ld	s1,8(sp)
    802027d8:	6105                	addi	sp,sp,32
    802027da:	8082                	ret
    802027dc:	00004097          	auipc	ra,0x4
    802027e0:	188080e7          	jalr	392(ra) # 80206964 <plic_claim>
    802027e4:	84aa                	mv	s1,a0
    802027e6:	47a9                	li	a5,10
    802027e8:	02f50163          	beq	a0,a5,8020280a <devintr+0x62>
    802027ec:	4785                	li	a5,1
    802027ee:	04f50563          	beq	a0,a5,80202838 <devintr+0x90>
    802027f2:	4505                	li	a0,1
    802027f4:	dcf9                	beqz	s1,802027d2 <devintr+0x2a>
    802027f6:	85a6                	mv	a1,s1
    802027f8:	00007517          	auipc	a0,0x7
    802027fc:	f1050513          	addi	a0,a0,-240 # 80209708 <digits+0x388>
    80202800:	ffffe097          	auipc	ra,0xffffe
    80202804:	98e080e7          	jalr	-1650(ra) # 8020018e <printf>
    80202808:	a821                	j	80202820 <devintr+0x78>
    8020280a:	4501                	li	a0,0
    8020280c:	4581                	li	a1,0
    8020280e:	4601                	li	a2,0
    80202810:	4681                	li	a3,0
    80202812:	4889                	li	a7,2
    80202814:	00000073          	ecall
    80202818:	2501                	sext.w	a0,a0
    8020281a:	57fd                	li	a5,-1
    8020281c:	00f51963          	bne	a0,a5,8020282e <devintr+0x86>
    80202820:	8526                	mv	a0,s1
    80202822:	00004097          	auipc	ra,0x4
    80202826:	16c080e7          	jalr	364(ra) # 8020698e <plic_complete>
    8020282a:	4505                	li	a0,1
    8020282c:	b75d                	j	802027d2 <devintr+0x2a>
    8020282e:	00004097          	auipc	ra,0x4
    80202832:	36a080e7          	jalr	874(ra) # 80206b98 <consoleintr>
    80202836:	b7ed                	j	80202820 <devintr+0x78>
    80202838:	00002097          	auipc	ra,0x2
    8020283c:	78e080e7          	jalr	1934(ra) # 80204fc6 <disk_intr>
    80202840:	b7c5                	j	80202820 <devintr+0x78>
    80202842:	00002097          	auipc	ra,0x2
    80202846:	6ea080e7          	jalr	1770(ra) # 80204f2c <timer_tick>
    8020284a:	4509                	li	a0,2
    8020284c:	b759                	j	802027d2 <devintr+0x2a>
    8020284e:	8082                	ret

0000000080202850 <usertrap>:
    80202850:	1101                	addi	sp,sp,-32
    80202852:	ec06                	sd	ra,24(sp)
    80202854:	e822                	sd	s0,16(sp)
    80202856:	e426                	sd	s1,8(sp)
    80202858:	e04a                	sd	s2,0(sp)
    8020285a:	1000                	addi	s0,sp,32
    8020285c:	100027f3          	csrr	a5,sstatus
    80202860:	1007f793          	andi	a5,a5,256
    80202864:	e3ad                	bnez	a5,802028c6 <usertrap+0x76>
    80202866:	00009797          	auipc	a5,0x9
    8020286a:	1ea7b783          	ld	a5,490(a5) # 8020ba50 <_GLOBAL_OFFSET_TABLE_+0x18>
    8020286e:	10579073          	csrw	stvec,a5
    80202872:	fffff097          	auipc	ra,0xfffff
    80202876:	1ce080e7          	jalr	462(ra) # 80201a40 <myproc>
    8020287a:	84aa                	mv	s1,a0
    8020287c:	713c                	ld	a5,96(a0)
    8020287e:	14102773          	csrr	a4,sepc
    80202882:	ef98                	sd	a4,24(a5)
    80202884:	14202773          	csrr	a4,scause
    80202888:	47a1                	li	a5,8
    8020288a:	04f71c63          	bne	a4,a5,802028e2 <usertrap+0x92>
    8020288e:	591c                	lw	a5,48(a0)
    80202890:	e3b9                	bnez	a5,802028d6 <usertrap+0x86>
    80202892:	70b8                	ld	a4,96(s1)
    80202894:	6f1c                	ld	a5,24(a4)
    80202896:	0791                	addi	a5,a5,4
    80202898:	ef1c                	sd	a5,24(a4)
    8020289a:	100027f3          	csrr	a5,sstatus
    8020289e:	0027e793          	ori	a5,a5,2
    802028a2:	10079073          	csrw	sstatus,a5
    802028a6:	00000097          	auipc	ra,0x0
    802028aa:	5d4080e7          	jalr	1492(ra) # 80202e7a <syscall>
    802028ae:	589c                	lw	a5,48(s1)
    802028b0:	ebd1                	bnez	a5,80202944 <usertrap+0xf4>
    802028b2:	00000097          	auipc	ra,0x0
    802028b6:	e58080e7          	jalr	-424(ra) # 8020270a <usertrapret>
    802028ba:	60e2                	ld	ra,24(sp)
    802028bc:	6442                	ld	s0,16(sp)
    802028be:	64a2                	ld	s1,8(sp)
    802028c0:	6902                	ld	s2,0(sp)
    802028c2:	6105                	addi	sp,sp,32
    802028c4:	8082                	ret
    802028c6:	00007517          	auipc	a0,0x7
    802028ca:	e6250513          	addi	a0,a0,-414 # 80209728 <digits+0x3a8>
    802028ce:	ffffe097          	auipc	ra,0xffffe
    802028d2:	876080e7          	jalr	-1930(ra) # 80200144 <panic>
    802028d6:	557d                	li	a0,-1
    802028d8:	00000097          	auipc	ra,0x0
    802028dc:	8ac080e7          	jalr	-1876(ra) # 80202184 <exit>
    802028e0:	bf4d                	j	80202892 <usertrap+0x42>
    802028e2:	00000097          	auipc	ra,0x0
    802028e6:	ec6080e7          	jalr	-314(ra) # 802027a8 <devintr>
    802028ea:	892a                	mv	s2,a0
    802028ec:	c501                	beqz	a0,802028f4 <usertrap+0xa4>
    802028ee:	589c                	lw	a5,48(s1)
    802028f0:	c3b1                	beqz	a5,80202934 <usertrap+0xe4>
    802028f2:	a825                	j	8020292a <usertrap+0xda>
    802028f4:	142025f3          	csrr	a1,scause
    802028f8:	16048693          	addi	a3,s1,352
    802028fc:	5c90                	lw	a2,56(s1)
    802028fe:	00007517          	auipc	a0,0x7
    80202902:	e4a50513          	addi	a0,a0,-438 # 80209748 <digits+0x3c8>
    80202906:	ffffe097          	auipc	ra,0xffffe
    8020290a:	888080e7          	jalr	-1912(ra) # 8020018e <printf>
    8020290e:	141025f3          	csrr	a1,sepc
    80202912:	14302673          	csrr	a2,stval
    80202916:	00007517          	auipc	a0,0x7
    8020291a:	e6250513          	addi	a0,a0,-414 # 80209778 <digits+0x3f8>
    8020291e:	ffffe097          	auipc	ra,0xffffe
    80202922:	870080e7          	jalr	-1936(ra) # 8020018e <printf>
    80202926:	4785                	li	a5,1
    80202928:	d89c                	sw	a5,48(s1)
    8020292a:	557d                	li	a0,-1
    8020292c:	00000097          	auipc	ra,0x0
    80202930:	858080e7          	jalr	-1960(ra) # 80202184 <exit>
    80202934:	4789                	li	a5,2
    80202936:	f6f91ee3          	bne	s2,a5,802028b2 <usertrap+0x62>
    8020293a:	00000097          	auipc	ra,0x0
    8020293e:	94a080e7          	jalr	-1718(ra) # 80202284 <yield>
    80202942:	bf85                	j	802028b2 <usertrap+0x62>
    80202944:	4901                	li	s2,0
    80202946:	b7d5                	j	8020292a <usertrap+0xda>

0000000080202948 <kerneltrap>:
    80202948:	7179                	addi	sp,sp,-48
    8020294a:	f406                	sd	ra,40(sp)
    8020294c:	f022                	sd	s0,32(sp)
    8020294e:	ec26                	sd	s1,24(sp)
    80202950:	e84a                	sd	s2,16(sp)
    80202952:	e44e                	sd	s3,8(sp)
    80202954:	1800                	addi	s0,sp,48
    80202956:	14102973          	csrr	s2,sepc
    8020295a:	100024f3          	csrr	s1,sstatus
    8020295e:	142029f3          	csrr	s3,scause
    80202962:	1004f793          	andi	a5,s1,256
    80202966:	cb85                	beqz	a5,80202996 <kerneltrap+0x4e>
    80202968:	100027f3          	csrr	a5,sstatus
    8020296c:	8b89                	andi	a5,a5,2
    8020296e:	ef85                	bnez	a5,802029a6 <kerneltrap+0x5e>
    80202970:	00000097          	auipc	ra,0x0
    80202974:	e38080e7          	jalr	-456(ra) # 802027a8 <devintr>
    80202978:	cd1d                	beqz	a0,802029b6 <kerneltrap+0x6e>
    8020297a:	4789                	li	a5,2
    8020297c:	08f50b63          	beq	a0,a5,80202a12 <kerneltrap+0xca>
    80202980:	14191073          	csrw	sepc,s2
    80202984:	10049073          	csrw	sstatus,s1
    80202988:	70a2                	ld	ra,40(sp)
    8020298a:	7402                	ld	s0,32(sp)
    8020298c:	64e2                	ld	s1,24(sp)
    8020298e:	6942                	ld	s2,16(sp)
    80202990:	69a2                	ld	s3,8(sp)
    80202992:	6145                	addi	sp,sp,48
    80202994:	8082                	ret
    80202996:	00007517          	auipc	a0,0x7
    8020299a:	e0250513          	addi	a0,a0,-510 # 80209798 <digits+0x418>
    8020299e:	ffffd097          	auipc	ra,0xffffd
    802029a2:	7a6080e7          	jalr	1958(ra) # 80200144 <panic>
    802029a6:	00007517          	auipc	a0,0x7
    802029aa:	e1a50513          	addi	a0,a0,-486 # 802097c0 <digits+0x440>
    802029ae:	ffffd097          	auipc	ra,0xffffd
    802029b2:	796080e7          	jalr	1942(ra) # 80200144 <panic>
    802029b6:	85ce                	mv	a1,s3
    802029b8:	00007517          	auipc	a0,0x7
    802029bc:	e2850513          	addi	a0,a0,-472 # 802097e0 <digits+0x460>
    802029c0:	ffffd097          	auipc	ra,0xffffd
    802029c4:	7ce080e7          	jalr	1998(ra) # 8020018e <printf>
    802029c8:	141025f3          	csrr	a1,sepc
    802029cc:	14302673          	csrr	a2,stval
    802029d0:	8692                	mv	a3,tp
    802029d2:	00007517          	auipc	a0,0x7
    802029d6:	e1e50513          	addi	a0,a0,-482 # 802097f0 <digits+0x470>
    802029da:	ffffd097          	auipc	ra,0xffffd
    802029de:	7b4080e7          	jalr	1972(ra) # 8020018e <printf>
    802029e2:	fffff097          	auipc	ra,0xfffff
    802029e6:	05e080e7          	jalr	94(ra) # 80201a40 <myproc>
    802029ea:	cd01                	beqz	a0,80202a02 <kerneltrap+0xba>
    802029ec:	16050613          	addi	a2,a0,352
    802029f0:	5d0c                	lw	a1,56(a0)
    802029f2:	00007517          	auipc	a0,0x7
    802029f6:	e1e50513          	addi	a0,a0,-482 # 80209810 <digits+0x490>
    802029fa:	ffffd097          	auipc	ra,0xffffd
    802029fe:	794080e7          	jalr	1940(ra) # 8020018e <printf>
    80202a02:	00007517          	auipc	a0,0x7
    80202a06:	e2650513          	addi	a0,a0,-474 # 80209828 <digits+0x4a8>
    80202a0a:	ffffd097          	auipc	ra,0xffffd
    80202a0e:	73a080e7          	jalr	1850(ra) # 80200144 <panic>
    80202a12:	fffff097          	auipc	ra,0xfffff
    80202a16:	02e080e7          	jalr	46(ra) # 80201a40 <myproc>
    80202a1a:	d13d                	beqz	a0,80202980 <kerneltrap+0x38>
    80202a1c:	fffff097          	auipc	ra,0xfffff
    80202a20:	024080e7          	jalr	36(ra) # 80201a40 <myproc>
    80202a24:	4d18                	lw	a4,24(a0)
    80202a26:	478d                	li	a5,3
    80202a28:	f4f71ce3          	bne	a4,a5,80202980 <kerneltrap+0x38>
    80202a2c:	00000097          	auipc	ra,0x0
    80202a30:	858080e7          	jalr	-1960(ra) # 80202284 <yield>
    80202a34:	b7b1                	j	80202980 <kerneltrap+0x38>

0000000080202a36 <trapframedump>:
    80202a36:	1101                	addi	sp,sp,-32
    80202a38:	ec06                	sd	ra,24(sp)
    80202a3a:	e822                	sd	s0,16(sp)
    80202a3c:	e426                	sd	s1,8(sp)
    80202a3e:	1000                	addi	s0,sp,32
    80202a40:	84aa                	mv	s1,a0
    80202a42:	792c                	ld	a1,112(a0)
    80202a44:	00007517          	auipc	a0,0x7
    80202a48:	df450513          	addi	a0,a0,-524 # 80209838 <digits+0x4b8>
    80202a4c:	ffffd097          	auipc	ra,0xffffd
    80202a50:	742080e7          	jalr	1858(ra) # 8020018e <printf>
    80202a54:	7cac                	ld	a1,120(s1)
    80202a56:	00007517          	auipc	a0,0x7
    80202a5a:	dea50513          	addi	a0,a0,-534 # 80209840 <digits+0x4c0>
    80202a5e:	ffffd097          	auipc	ra,0xffffd
    80202a62:	730080e7          	jalr	1840(ra) # 8020018e <printf>
    80202a66:	60cc                	ld	a1,128(s1)
    80202a68:	00007517          	auipc	a0,0x7
    80202a6c:	de050513          	addi	a0,a0,-544 # 80209848 <digits+0x4c8>
    80202a70:	ffffd097          	auipc	ra,0xffffd
    80202a74:	71e080e7          	jalr	1822(ra) # 8020018e <printf>
    80202a78:	64cc                	ld	a1,136(s1)
    80202a7a:	00007517          	auipc	a0,0x7
    80202a7e:	dd650513          	addi	a0,a0,-554 # 80209850 <digits+0x4d0>
    80202a82:	ffffd097          	auipc	ra,0xffffd
    80202a86:	70c080e7          	jalr	1804(ra) # 8020018e <printf>
    80202a8a:	68cc                	ld	a1,144(s1)
    80202a8c:	00007517          	auipc	a0,0x7
    80202a90:	dcc50513          	addi	a0,a0,-564 # 80209858 <digits+0x4d8>
    80202a94:	ffffd097          	auipc	ra,0xffffd
    80202a98:	6fa080e7          	jalr	1786(ra) # 8020018e <printf>
    80202a9c:	6ccc                	ld	a1,152(s1)
    80202a9e:	00007517          	auipc	a0,0x7
    80202aa2:	dc250513          	addi	a0,a0,-574 # 80209860 <digits+0x4e0>
    80202aa6:	ffffd097          	auipc	ra,0xffffd
    80202aaa:	6e8080e7          	jalr	1768(ra) # 8020018e <printf>
    80202aae:	70cc                	ld	a1,160(s1)
    80202ab0:	00007517          	auipc	a0,0x7
    80202ab4:	db850513          	addi	a0,a0,-584 # 80209868 <digits+0x4e8>
    80202ab8:	ffffd097          	auipc	ra,0xffffd
    80202abc:	6d6080e7          	jalr	1750(ra) # 8020018e <printf>
    80202ac0:	74cc                	ld	a1,168(s1)
    80202ac2:	00007517          	auipc	a0,0x7
    80202ac6:	dae50513          	addi	a0,a0,-594 # 80209870 <digits+0x4f0>
    80202aca:	ffffd097          	auipc	ra,0xffffd
    80202ace:	6c4080e7          	jalr	1732(ra) # 8020018e <printf>
    80202ad2:	64ac                	ld	a1,72(s1)
    80202ad4:	00007517          	auipc	a0,0x7
    80202ad8:	da450513          	addi	a0,a0,-604 # 80209878 <digits+0x4f8>
    80202adc:	ffffd097          	auipc	ra,0xffffd
    80202ae0:	6b2080e7          	jalr	1714(ra) # 8020018e <printf>
    80202ae4:	68ac                	ld	a1,80(s1)
    80202ae6:	00007517          	auipc	a0,0x7
    80202aea:	d9a50513          	addi	a0,a0,-614 # 80209880 <digits+0x500>
    80202aee:	ffffd097          	auipc	ra,0xffffd
    80202af2:	6a0080e7          	jalr	1696(ra) # 8020018e <printf>
    80202af6:	6cac                	ld	a1,88(s1)
    80202af8:	00007517          	auipc	a0,0x7
    80202afc:	d9050513          	addi	a0,a0,-624 # 80209888 <digits+0x508>
    80202b00:	ffffd097          	auipc	ra,0xffffd
    80202b04:	68e080e7          	jalr	1678(ra) # 8020018e <printf>
    80202b08:	1004b583          	ld	a1,256(s1)
    80202b0c:	00007517          	auipc	a0,0x7
    80202b10:	d8450513          	addi	a0,a0,-636 # 80209890 <digits+0x510>
    80202b14:	ffffd097          	auipc	ra,0xffffd
    80202b18:	67a080e7          	jalr	1658(ra) # 8020018e <printf>
    80202b1c:	1084b583          	ld	a1,264(s1)
    80202b20:	00007517          	auipc	a0,0x7
    80202b24:	d7850513          	addi	a0,a0,-648 # 80209898 <digits+0x518>
    80202b28:	ffffd097          	auipc	ra,0xffffd
    80202b2c:	666080e7          	jalr	1638(ra) # 8020018e <printf>
    80202b30:	1104b583          	ld	a1,272(s1)
    80202b34:	00007517          	auipc	a0,0x7
    80202b38:	d6c50513          	addi	a0,a0,-660 # 802098a0 <digits+0x520>
    80202b3c:	ffffd097          	auipc	ra,0xffffd
    80202b40:	652080e7          	jalr	1618(ra) # 8020018e <printf>
    80202b44:	1184b583          	ld	a1,280(s1)
    80202b48:	00007517          	auipc	a0,0x7
    80202b4c:	d6050513          	addi	a0,a0,-672 # 802098a8 <digits+0x528>
    80202b50:	ffffd097          	auipc	ra,0xffffd
    80202b54:	63e080e7          	jalr	1598(ra) # 8020018e <printf>
    80202b58:	70ac                	ld	a1,96(s1)
    80202b5a:	00007517          	auipc	a0,0x7
    80202b5e:	d5650513          	addi	a0,a0,-682 # 802098b0 <digits+0x530>
    80202b62:	ffffd097          	auipc	ra,0xffffd
    80202b66:	62c080e7          	jalr	1580(ra) # 8020018e <printf>
    80202b6a:	74ac                	ld	a1,104(s1)
    80202b6c:	00007517          	auipc	a0,0x7
    80202b70:	d4c50513          	addi	a0,a0,-692 # 802098b8 <digits+0x538>
    80202b74:	ffffd097          	auipc	ra,0xffffd
    80202b78:	61a080e7          	jalr	1562(ra) # 8020018e <printf>
    80202b7c:	78cc                	ld	a1,176(s1)
    80202b7e:	00007517          	auipc	a0,0x7
    80202b82:	d4250513          	addi	a0,a0,-702 # 802098c0 <digits+0x540>
    80202b86:	ffffd097          	auipc	ra,0xffffd
    80202b8a:	608080e7          	jalr	1544(ra) # 8020018e <printf>
    80202b8e:	7ccc                	ld	a1,184(s1)
    80202b90:	00007517          	auipc	a0,0x7
    80202b94:	d3850513          	addi	a0,a0,-712 # 802098c8 <digits+0x548>
    80202b98:	ffffd097          	auipc	ra,0xffffd
    80202b9c:	5f6080e7          	jalr	1526(ra) # 8020018e <printf>
    80202ba0:	60ec                	ld	a1,192(s1)
    80202ba2:	00007517          	auipc	a0,0x7
    80202ba6:	d2e50513          	addi	a0,a0,-722 # 802098d0 <digits+0x550>
    80202baa:	ffffd097          	auipc	ra,0xffffd
    80202bae:	5e4080e7          	jalr	1508(ra) # 8020018e <printf>
    80202bb2:	64ec                	ld	a1,200(s1)
    80202bb4:	00007517          	auipc	a0,0x7
    80202bb8:	d2450513          	addi	a0,a0,-732 # 802098d8 <digits+0x558>
    80202bbc:	ffffd097          	auipc	ra,0xffffd
    80202bc0:	5d2080e7          	jalr	1490(ra) # 8020018e <printf>
    80202bc4:	68ec                	ld	a1,208(s1)
    80202bc6:	00007517          	auipc	a0,0x7
    80202bca:	d1a50513          	addi	a0,a0,-742 # 802098e0 <digits+0x560>
    80202bce:	ffffd097          	auipc	ra,0xffffd
    80202bd2:	5c0080e7          	jalr	1472(ra) # 8020018e <printf>
    80202bd6:	6cec                	ld	a1,216(s1)
    80202bd8:	00007517          	auipc	a0,0x7
    80202bdc:	d1050513          	addi	a0,a0,-752 # 802098e8 <digits+0x568>
    80202be0:	ffffd097          	auipc	ra,0xffffd
    80202be4:	5ae080e7          	jalr	1454(ra) # 8020018e <printf>
    80202be8:	70ec                	ld	a1,224(s1)
    80202bea:	00007517          	auipc	a0,0x7
    80202bee:	d0650513          	addi	a0,a0,-762 # 802098f0 <digits+0x570>
    80202bf2:	ffffd097          	auipc	ra,0xffffd
    80202bf6:	59c080e7          	jalr	1436(ra) # 8020018e <printf>
    80202bfa:	74ec                	ld	a1,232(s1)
    80202bfc:	00007517          	auipc	a0,0x7
    80202c00:	cfc50513          	addi	a0,a0,-772 # 802098f8 <digits+0x578>
    80202c04:	ffffd097          	auipc	ra,0xffffd
    80202c08:	58a080e7          	jalr	1418(ra) # 8020018e <printf>
    80202c0c:	78ec                	ld	a1,240(s1)
    80202c0e:	00007517          	auipc	a0,0x7
    80202c12:	cf250513          	addi	a0,a0,-782 # 80209900 <digits+0x580>
    80202c16:	ffffd097          	auipc	ra,0xffffd
    80202c1a:	578080e7          	jalr	1400(ra) # 8020018e <printf>
    80202c1e:	7cec                	ld	a1,248(s1)
    80202c20:	00007517          	auipc	a0,0x7
    80202c24:	cf050513          	addi	a0,a0,-784 # 80209910 <digits+0x590>
    80202c28:	ffffd097          	auipc	ra,0xffffd
    80202c2c:	566080e7          	jalr	1382(ra) # 8020018e <printf>
    80202c30:	748c                	ld	a1,40(s1)
    80202c32:	00007517          	auipc	a0,0x7
    80202c36:	9de50513          	addi	a0,a0,-1570 # 80209610 <digits+0x290>
    80202c3a:	ffffd097          	auipc	ra,0xffffd
    80202c3e:	554080e7          	jalr	1364(ra) # 8020018e <printf>
    80202c42:	788c                	ld	a1,48(s1)
    80202c44:	00007517          	auipc	a0,0x7
    80202c48:	cdc50513          	addi	a0,a0,-804 # 80209920 <digits+0x5a0>
    80202c4c:	ffffd097          	auipc	ra,0xffffd
    80202c50:	542080e7          	jalr	1346(ra) # 8020018e <printf>
    80202c54:	7c8c                	ld	a1,56(s1)
    80202c56:	00007517          	auipc	a0,0x7
    80202c5a:	cd250513          	addi	a0,a0,-814 # 80209928 <digits+0x5a8>
    80202c5e:	ffffd097          	auipc	ra,0xffffd
    80202c62:	530080e7          	jalr	1328(ra) # 8020018e <printf>
    80202c66:	60ac                	ld	a1,64(s1)
    80202c68:	00007517          	auipc	a0,0x7
    80202c6c:	cc850513          	addi	a0,a0,-824 # 80209930 <digits+0x5b0>
    80202c70:	ffffd097          	auipc	ra,0xffffd
    80202c74:	51e080e7          	jalr	1310(ra) # 8020018e <printf>
    80202c78:	6c8c                	ld	a1,24(s1)
    80202c7a:	00007517          	auipc	a0,0x7
    80202c7e:	cbe50513          	addi	a0,a0,-834 # 80209938 <digits+0x5b8>
    80202c82:	ffffd097          	auipc	ra,0xffffd
    80202c86:	50c080e7          	jalr	1292(ra) # 8020018e <printf>
    80202c8a:	60e2                	ld	ra,24(sp)
    80202c8c:	6442                	ld	s0,16(sp)
    80202c8e:	64a2                	ld	s1,8(sp)
    80202c90:	6105                	addi	sp,sp,32
    80202c92:	8082                	ret

0000000080202c94 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202c94:	1101                	addi	sp,sp,-32
    80202c96:	ec06                	sd	ra,24(sp)
    80202c98:	e822                	sd	s0,16(sp)
    80202c9a:	e426                	sd	s1,8(sp)
    80202c9c:	1000                	addi	s0,sp,32
    80202c9e:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202ca0:	fffff097          	auipc	ra,0xfffff
    80202ca4:	da0080e7          	jalr	-608(ra) # 80201a40 <myproc>
  switch (n) {
    80202ca8:	4795                	li	a5,5
    80202caa:	0497e163          	bltu	a5,s1,80202cec <argraw+0x58>
    80202cae:	048a                	slli	s1,s1,0x2
    80202cb0:	00007717          	auipc	a4,0x7
    80202cb4:	de470713          	addi	a4,a4,-540 # 80209a94 <digits+0x714>
    80202cb8:	94ba                	add	s1,s1,a4
    80202cba:	409c                	lw	a5,0(s1)
    80202cbc:	97ba                	add	a5,a5,a4
    80202cbe:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202cc0:	713c                	ld	a5,96(a0)
    80202cc2:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202cc4:	60e2                	ld	ra,24(sp)
    80202cc6:	6442                	ld	s0,16(sp)
    80202cc8:	64a2                	ld	s1,8(sp)
    80202cca:	6105                	addi	sp,sp,32
    80202ccc:	8082                	ret
    return p->trapframe->a1;
    80202cce:	713c                	ld	a5,96(a0)
    80202cd0:	7fa8                	ld	a0,120(a5)
    80202cd2:	bfcd                	j	80202cc4 <argraw+0x30>
    return p->trapframe->a2;
    80202cd4:	713c                	ld	a5,96(a0)
    80202cd6:	63c8                	ld	a0,128(a5)
    80202cd8:	b7f5                	j	80202cc4 <argraw+0x30>
    return p->trapframe->a3;
    80202cda:	713c                	ld	a5,96(a0)
    80202cdc:	67c8                	ld	a0,136(a5)
    80202cde:	b7dd                	j	80202cc4 <argraw+0x30>
    return p->trapframe->a4;
    80202ce0:	713c                	ld	a5,96(a0)
    80202ce2:	6bc8                	ld	a0,144(a5)
    80202ce4:	b7c5                	j	80202cc4 <argraw+0x30>
    return p->trapframe->a5;
    80202ce6:	713c                	ld	a5,96(a0)
    80202ce8:	6fc8                	ld	a0,152(a5)
    80202cea:	bfe9                	j	80202cc4 <argraw+0x30>
  panic("argraw");
    80202cec:	00007517          	auipc	a0,0x7
    80202cf0:	c5c50513          	addi	a0,a0,-932 # 80209948 <digits+0x5c8>
    80202cf4:	ffffd097          	auipc	ra,0xffffd
    80202cf8:	450080e7          	jalr	1104(ra) # 80200144 <panic>

0000000080202cfc <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80202cfc:	7179                	addi	sp,sp,-48
    80202cfe:	f406                	sd	ra,40(sp)
    80202d00:	f022                	sd	s0,32(sp)
    80202d02:	ec26                	sd	s1,24(sp)
    80202d04:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80202d06:	4501                	li	a0,0
    80202d08:	00000097          	auipc	ra,0x0
    80202d0c:	f8c080e7          	jalr	-116(ra) # 80202c94 <argraw>
    80202d10:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80202d12:	ffffe097          	auipc	ra,0xffffe
    80202d16:	8ae080e7          	jalr	-1874(ra) # 802005c0 <freemem_amount>
    80202d1a:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80202d1e:	00000097          	auipc	ra,0x0
    80202d22:	916080e7          	jalr	-1770(ra) # 80202634 <procnum>
    80202d26:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80202d2a:	4641                	li	a2,16
    80202d2c:	fd040593          	addi	a1,s0,-48
    80202d30:	8526                	mv	a0,s1
    80202d32:	ffffe097          	auipc	ra,0xffffe
    80202d36:	644080e7          	jalr	1604(ra) # 80201376 <copyout2>
    return -1;
  }

  return 0;
    80202d3a:	957d                	srai	a0,a0,0x3f
    80202d3c:	70a2                	ld	ra,40(sp)
    80202d3e:	7402                	ld	s0,32(sp)
    80202d40:	64e2                	ld	s1,24(sp)
    80202d42:	6145                	addi	sp,sp,48
    80202d44:	8082                	ret

0000000080202d46 <fetchaddr>:
{
    80202d46:	1101                	addi	sp,sp,-32
    80202d48:	ec06                	sd	ra,24(sp)
    80202d4a:	e822                	sd	s0,16(sp)
    80202d4c:	e426                	sd	s1,8(sp)
    80202d4e:	e04a                	sd	s2,0(sp)
    80202d50:	1000                	addi	s0,sp,32
    80202d52:	84aa                	mv	s1,a0
    80202d54:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202d56:	fffff097          	auipc	ra,0xfffff
    80202d5a:	cea080e7          	jalr	-790(ra) # 80201a40 <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80202d5e:	653c                	ld	a5,72(a0)
    80202d60:	02f4f763          	bgeu	s1,a5,80202d8e <fetchaddr+0x48>
    80202d64:	00848713          	addi	a4,s1,8
    80202d68:	02e7e563          	bltu	a5,a4,80202d92 <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    80202d6c:	4621                	li	a2,8
    80202d6e:	85a6                	mv	a1,s1
    80202d70:	854a                	mv	a0,s2
    80202d72:	ffffe097          	auipc	ra,0xffffe
    80202d76:	6e4080e7          	jalr	1764(ra) # 80201456 <copyin2>
    80202d7a:	00a03533          	snez	a0,a0
    80202d7e:	40a00533          	neg	a0,a0
}
    80202d82:	60e2                	ld	ra,24(sp)
    80202d84:	6442                	ld	s0,16(sp)
    80202d86:	64a2                	ld	s1,8(sp)
    80202d88:	6902                	ld	s2,0(sp)
    80202d8a:	6105                	addi	sp,sp,32
    80202d8c:	8082                	ret
    return -1;
    80202d8e:	557d                	li	a0,-1
    80202d90:	bfcd                	j	80202d82 <fetchaddr+0x3c>
    80202d92:	557d                	li	a0,-1
    80202d94:	b7fd                	j	80202d82 <fetchaddr+0x3c>

0000000080202d96 <fetchstr>:
{
    80202d96:	1101                	addi	sp,sp,-32
    80202d98:	ec06                	sd	ra,24(sp)
    80202d9a:	e822                	sd	s0,16(sp)
    80202d9c:	e426                	sd	s1,8(sp)
    80202d9e:	1000                	addi	s0,sp,32
    80202da0:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    80202da2:	85aa                	mv	a1,a0
    80202da4:	8526                	mv	a0,s1
    80202da6:	ffffe097          	auipc	ra,0xffffe
    80202daa:	7b2080e7          	jalr	1970(ra) # 80201558 <copyinstr2>
  if(err < 0)
    80202dae:	00054763          	bltz	a0,80202dbc <fetchstr+0x26>
  return strlen(buf);
    80202db2:	8526                	mv	a0,s1
    80202db4:	ffffe097          	auipc	ra,0xffffe
    80202db8:	b30080e7          	jalr	-1232(ra) # 802008e4 <strlen>
}
    80202dbc:	60e2                	ld	ra,24(sp)
    80202dbe:	6442                	ld	s0,16(sp)
    80202dc0:	64a2                	ld	s1,8(sp)
    80202dc2:	6105                	addi	sp,sp,32
    80202dc4:	8082                	ret

0000000080202dc6 <argint>:
{
    80202dc6:	1101                	addi	sp,sp,-32
    80202dc8:	ec06                	sd	ra,24(sp)
    80202dca:	e822                	sd	s0,16(sp)
    80202dcc:	e426                	sd	s1,8(sp)
    80202dce:	1000                	addi	s0,sp,32
    80202dd0:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202dd2:	00000097          	auipc	ra,0x0
    80202dd6:	ec2080e7          	jalr	-318(ra) # 80202c94 <argraw>
    80202dda:	c088                	sw	a0,0(s1)
}
    80202ddc:	4501                	li	a0,0
    80202dde:	60e2                	ld	ra,24(sp)
    80202de0:	6442                	ld	s0,16(sp)
    80202de2:	64a2                	ld	s1,8(sp)
    80202de4:	6105                	addi	sp,sp,32
    80202de6:	8082                	ret

0000000080202de8 <sys_test_proc>:
sys_test_proc(void) {
    80202de8:	1101                	addi	sp,sp,-32
    80202dea:	ec06                	sd	ra,24(sp)
    80202dec:	e822                	sd	s0,16(sp)
    80202dee:	1000                	addi	s0,sp,32
    argint(0, &n);
    80202df0:	fec40593          	addi	a1,s0,-20
    80202df4:	4501                	li	a0,0
    80202df6:	00000097          	auipc	ra,0x0
    80202dfa:	fd0080e7          	jalr	-48(ra) # 80202dc6 <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    80202dfe:	fffff097          	auipc	ra,0xfffff
    80202e02:	c42080e7          	jalr	-958(ra) # 80201a40 <myproc>
    80202e06:	8612                	mv	a2,tp
    80202e08:	fec42683          	lw	a3,-20(s0)
    80202e0c:	5d0c                	lw	a1,56(a0)
    80202e0e:	00007517          	auipc	a0,0x7
    80202e12:	b4250513          	addi	a0,a0,-1214 # 80209950 <digits+0x5d0>
    80202e16:	ffffd097          	auipc	ra,0xffffd
    80202e1a:	378080e7          	jalr	888(ra) # 8020018e <printf>
}
    80202e1e:	4501                	li	a0,0
    80202e20:	60e2                	ld	ra,24(sp)
    80202e22:	6442                	ld	s0,16(sp)
    80202e24:	6105                	addi	sp,sp,32
    80202e26:	8082                	ret

0000000080202e28 <argaddr>:
{
    80202e28:	1101                	addi	sp,sp,-32
    80202e2a:	ec06                	sd	ra,24(sp)
    80202e2c:	e822                	sd	s0,16(sp)
    80202e2e:	e426                	sd	s1,8(sp)
    80202e30:	1000                	addi	s0,sp,32
    80202e32:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202e34:	00000097          	auipc	ra,0x0
    80202e38:	e60080e7          	jalr	-416(ra) # 80202c94 <argraw>
    80202e3c:	e088                	sd	a0,0(s1)
}
    80202e3e:	4501                	li	a0,0
    80202e40:	60e2                	ld	ra,24(sp)
    80202e42:	6442                	ld	s0,16(sp)
    80202e44:	64a2                	ld	s1,8(sp)
    80202e46:	6105                	addi	sp,sp,32
    80202e48:	8082                	ret

0000000080202e4a <argstr>:
{
    80202e4a:	1101                	addi	sp,sp,-32
    80202e4c:	ec06                	sd	ra,24(sp)
    80202e4e:	e822                	sd	s0,16(sp)
    80202e50:	e426                	sd	s1,8(sp)
    80202e52:	e04a                	sd	s2,0(sp)
    80202e54:	1000                	addi	s0,sp,32
    80202e56:	84ae                	mv	s1,a1
    80202e58:	8932                	mv	s2,a2
  *ip = argraw(n);
    80202e5a:	00000097          	auipc	ra,0x0
    80202e5e:	e3a080e7          	jalr	-454(ra) # 80202c94 <argraw>
  return fetchstr(addr, buf, max);
    80202e62:	864a                	mv	a2,s2
    80202e64:	85a6                	mv	a1,s1
    80202e66:	00000097          	auipc	ra,0x0
    80202e6a:	f30080e7          	jalr	-208(ra) # 80202d96 <fetchstr>
}
    80202e6e:	60e2                	ld	ra,24(sp)
    80202e70:	6442                	ld	s0,16(sp)
    80202e72:	64a2                	ld	s1,8(sp)
    80202e74:	6902                	ld	s2,0(sp)
    80202e76:	6105                	addi	sp,sp,32
    80202e78:	8082                	ret

0000000080202e7a <syscall>:
{
    80202e7a:	7179                	addi	sp,sp,-48
    80202e7c:	f406                	sd	ra,40(sp)
    80202e7e:	f022                	sd	s0,32(sp)
    80202e80:	ec26                	sd	s1,24(sp)
    80202e82:	e84a                	sd	s2,16(sp)
    80202e84:	e44e                	sd	s3,8(sp)
    80202e86:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202e88:	fffff097          	auipc	ra,0xfffff
    80202e8c:	bb8080e7          	jalr	-1096(ra) # 80201a40 <myproc>
    80202e90:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80202e92:	06053903          	ld	s2,96(a0)
    80202e96:	0a893783          	ld	a5,168(s2)
    80202e9a:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80202e9e:	37fd                	addiw	a5,a5,-1
    80202ea0:	0d500713          	li	a4,213
    80202ea4:	04f76763          	bltu	a4,a5,80202ef2 <syscall+0x78>
    80202ea8:	00399713          	slli	a4,s3,0x3
    80202eac:	00008797          	auipc	a5,0x8
    80202eb0:	e0478793          	addi	a5,a5,-508 # 8020acb0 <syscalls>
    80202eb4:	97ba                	add	a5,a5,a4
    80202eb6:	639c                	ld	a5,0(a5)
    80202eb8:	cf8d                	beqz	a5,80202ef2 <syscall+0x78>
    p->trapframe->a0 = syscalls[num]();
    80202eba:	9782                	jalr	a5
    80202ebc:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    80202ec0:	1704a783          	lw	a5,368(s1)
    80202ec4:	4137d7bb          	sraw	a5,a5,s3
    80202ec8:	8b85                	andi	a5,a5,1
    80202eca:	c3b9                	beqz	a5,80202f10 <syscall+0x96>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    80202ecc:	70b8                	ld	a4,96(s1)
    80202ece:	098e                	slli	s3,s3,0x3
    80202ed0:	00008797          	auipc	a5,0x8
    80202ed4:	49878793          	addi	a5,a5,1176 # 8020b368 <sysnames>
    80202ed8:	97ce                	add	a5,a5,s3
    80202eda:	7b34                	ld	a3,112(a4)
    80202edc:	6390                	ld	a2,0(a5)
    80202ede:	5c8c                	lw	a1,56(s1)
    80202ee0:	00007517          	auipc	a0,0x7
    80202ee4:	aa050513          	addi	a0,a0,-1376 # 80209980 <digits+0x600>
    80202ee8:	ffffd097          	auipc	ra,0xffffd
    80202eec:	2a6080e7          	jalr	678(ra) # 8020018e <printf>
    80202ef0:	a005                	j	80202f10 <syscall+0x96>
    printf("pid %d %s: unknown sys call %d\n",
    80202ef2:	86ce                	mv	a3,s3
    80202ef4:	16048613          	addi	a2,s1,352
    80202ef8:	5c8c                	lw	a1,56(s1)
    80202efa:	00007517          	auipc	a0,0x7
    80202efe:	a9e50513          	addi	a0,a0,-1378 # 80209998 <digits+0x618>
    80202f02:	ffffd097          	auipc	ra,0xffffd
    80202f06:	28c080e7          	jalr	652(ra) # 8020018e <printf>
    p->trapframe->a0 = -1;
    80202f0a:	70bc                	ld	a5,96(s1)
    80202f0c:	577d                	li	a4,-1
    80202f0e:	fbb8                	sd	a4,112(a5)
}
    80202f10:	70a2                	ld	ra,40(sp)
    80202f12:	7402                	ld	s0,32(sp)
    80202f14:	64e2                	ld	s1,24(sp)
    80202f16:	6942                	ld	s2,16(sp)
    80202f18:	69a2                	ld	s3,8(sp)
    80202f1a:	6145                	addi	sp,sp,48
    80202f1c:	8082                	ret

0000000080202f1e <sys_exec>:

extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    80202f1e:	d9010113          	addi	sp,sp,-624
    80202f22:	26113423          	sd	ra,616(sp)
    80202f26:	26813023          	sd	s0,608(sp)
    80202f2a:	24913c23          	sd	s1,600(sp)
    80202f2e:	25213823          	sd	s2,592(sp)
    80202f32:	25313423          	sd	s3,584(sp)
    80202f36:	25413023          	sd	s4,576(sp)
    80202f3a:	23513c23          	sd	s5,568(sp)
    80202f3e:	23613823          	sd	s6,560(sp)
    80202f42:	23713423          	sd	s7,552(sp)
    80202f46:	1c80                	addi	s0,sp,624
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80202f48:	10400613          	li	a2,260
    80202f4c:	ea840593          	addi	a1,s0,-344
    80202f50:	4501                	li	a0,0
    80202f52:	00000097          	auipc	ra,0x0
    80202f56:	ef8080e7          	jalr	-264(ra) # 80202e4a <argstr>
    return -1;
    80202f5a:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80202f5c:	0c054c63          	bltz	a0,80203034 <sys_exec+0x116>
    80202f60:	da040593          	addi	a1,s0,-608
    80202f64:	4505                	li	a0,1
    80202f66:	00000097          	auipc	ra,0x0
    80202f6a:	ec2080e7          	jalr	-318(ra) # 80202e28 <argaddr>
    80202f6e:	0c054363          	bltz	a0,80203034 <sys_exec+0x116>
  }
  memset(argv, 0, sizeof(argv));
    80202f72:	da840a13          	addi	s4,s0,-600
    80202f76:	10000613          	li	a2,256
    80202f7a:	4581                	li	a1,0
    80202f7c:	8552                	mv	a0,s4
    80202f7e:	ffffd097          	auipc	ra,0xffffd
    80202f82:	7e4080e7          	jalr	2020(ra) # 80200762 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    80202f86:	84d2                	mv	s1,s4
  memset(argv, 0, sizeof(argv));
    80202f88:	89d2                	mv	s3,s4
    80202f8a:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80202f8c:	d9840a93          	addi	s5,s0,-616
    if(i >= NELEM(argv)){
    80202f90:	02000b13          	li	s6,32
    80202f94:	00090b9b          	sext.w	s7,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80202f98:	00391513          	slli	a0,s2,0x3
    80202f9c:	85d6                	mv	a1,s5
    80202f9e:	da043783          	ld	a5,-608(s0)
    80202fa2:	953e                	add	a0,a0,a5
    80202fa4:	00000097          	auipc	ra,0x0
    80202fa8:	da2080e7          	jalr	-606(ra) # 80202d46 <fetchaddr>
    80202fac:	02054a63          	bltz	a0,80202fe0 <sys_exec+0xc2>
      goto bad;
    }
    if(uarg == 0){
    80202fb0:	d9843783          	ld	a5,-616(s0)
    80202fb4:	c3b9                	beqz	a5,80202ffa <sys_exec+0xdc>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    80202fb6:	ffffd097          	auipc	ra,0xffffd
    80202fba:	5a4080e7          	jalr	1444(ra) # 8020055a <kalloc>
    80202fbe:	85aa                	mv	a1,a0
    80202fc0:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    80202fc4:	cd11                	beqz	a0,80202fe0 <sys_exec+0xc2>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80202fc6:	6605                	lui	a2,0x1
    80202fc8:	d9843503          	ld	a0,-616(s0)
    80202fcc:	00000097          	auipc	ra,0x0
    80202fd0:	dca080e7          	jalr	-566(ra) # 80202d96 <fetchstr>
    80202fd4:	00054663          	bltz	a0,80202fe0 <sys_exec+0xc2>
    if(i >= NELEM(argv)){
    80202fd8:	0905                	addi	s2,s2,1
    80202fda:	09a1                	addi	s3,s3,8
    80202fdc:	fb691ce3          	bne	s2,s6,80202f94 <sys_exec+0x76>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80202fe0:	100a0a13          	addi	s4,s4,256
    80202fe4:	6088                	ld	a0,0(s1)
    80202fe6:	c531                	beqz	a0,80203032 <sys_exec+0x114>
    kfree(argv[i]);
    80202fe8:	ffffd097          	auipc	ra,0xffffd
    80202fec:	458080e7          	jalr	1112(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80202ff0:	04a1                	addi	s1,s1,8
    80202ff2:	ff4499e3          	bne	s1,s4,80202fe4 <sys_exec+0xc6>
  return -1;
    80202ff6:	597d                	li	s2,-1
    80202ff8:	a835                	j	80203034 <sys_exec+0x116>
      argv[i] = 0;
    80202ffa:	0b8e                	slli	s7,s7,0x3
    80202ffc:	fb0b8793          	addi	a5,s7,-80
    80203000:	00878bb3          	add	s7,a5,s0
    80203004:	de0bbc23          	sd	zero,-520(s7)
  int ret = exec(path, argv);
    80203008:	da840593          	addi	a1,s0,-600
    8020300c:	ea840513          	addi	a0,s0,-344
    80203010:	00001097          	auipc	ra,0x1
    80203014:	e82080e7          	jalr	-382(ra) # 80203e92 <exec>
    80203018:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020301a:	100a0a13          	addi	s4,s4,256
    8020301e:	6088                	ld	a0,0(s1)
    80203020:	c911                	beqz	a0,80203034 <sys_exec+0x116>
    kfree(argv[i]);
    80203022:	ffffd097          	auipc	ra,0xffffd
    80203026:	41e080e7          	jalr	1054(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020302a:	04a1                	addi	s1,s1,8
    8020302c:	ff4499e3          	bne	s1,s4,8020301e <sys_exec+0x100>
    80203030:	a011                	j	80203034 <sys_exec+0x116>
  return -1;
    80203032:	597d                	li	s2,-1
}
    80203034:	854a                	mv	a0,s2
    80203036:	26813083          	ld	ra,616(sp)
    8020303a:	26013403          	ld	s0,608(sp)
    8020303e:	25813483          	ld	s1,600(sp)
    80203042:	25013903          	ld	s2,592(sp)
    80203046:	24813983          	ld	s3,584(sp)
    8020304a:	24013a03          	ld	s4,576(sp)
    8020304e:	23813a83          	ld	s5,568(sp)
    80203052:	23013b03          	ld	s6,560(sp)
    80203056:	22813b83          	ld	s7,552(sp)
    8020305a:	27010113          	addi	sp,sp,624
    8020305e:	8082                	ret

0000000080203060 <sys_exit>:

uint64
sys_exit(void)
{
    80203060:	1101                	addi	sp,sp,-32
    80203062:	ec06                	sd	ra,24(sp)
    80203064:	e822                	sd	s0,16(sp)
    80203066:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    80203068:	fec40593          	addi	a1,s0,-20
    8020306c:	4501                	li	a0,0
    8020306e:	00000097          	auipc	ra,0x0
    80203072:	d58080e7          	jalr	-680(ra) # 80202dc6 <argint>
    return -1;
    80203076:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80203078:	00054963          	bltz	a0,8020308a <sys_exit+0x2a>
  exit(n);
    8020307c:	fec42503          	lw	a0,-20(s0)
    80203080:	fffff097          	auipc	ra,0xfffff
    80203084:	104080e7          	jalr	260(ra) # 80202184 <exit>
  return 0;  // not reached
    80203088:	4781                	li	a5,0
}
    8020308a:	853e                	mv	a0,a5
    8020308c:	60e2                	ld	ra,24(sp)
    8020308e:	6442                	ld	s0,16(sp)
    80203090:	6105                	addi	sp,sp,32
    80203092:	8082                	ret

0000000080203094 <sys_getpid>:

uint64
sys_getpid(void)
{
    80203094:	1141                	addi	sp,sp,-16
    80203096:	e406                	sd	ra,8(sp)
    80203098:	e022                	sd	s0,0(sp)
    8020309a:	0800                	addi	s0,sp,16
  return myproc()->pid;
    8020309c:	fffff097          	auipc	ra,0xfffff
    802030a0:	9a4080e7          	jalr	-1628(ra) # 80201a40 <myproc>
}
    802030a4:	5d08                	lw	a0,56(a0)
    802030a6:	60a2                	ld	ra,8(sp)
    802030a8:	6402                	ld	s0,0(sp)
    802030aa:	0141                	addi	sp,sp,16
    802030ac:	8082                	ret

00000000802030ae <sys_fork>:

uint64
sys_fork(void)
{
    802030ae:	1141                	addi	sp,sp,-16
    802030b0:	e406                	sd	ra,8(sp)
    802030b2:	e022                	sd	s0,0(sp)
    802030b4:	0800                	addi	s0,sp,16
  return fork();
    802030b6:	fffff097          	auipc	ra,0xfffff
    802030ba:	d90080e7          	jalr	-624(ra) # 80201e46 <fork>
}
    802030be:	60a2                	ld	ra,8(sp)
    802030c0:	6402                	ld	s0,0(sp)
    802030c2:	0141                	addi	sp,sp,16
    802030c4:	8082                	ret

00000000802030c6 <sys_wait>:

uint64
sys_wait(void)
{
    802030c6:	1101                	addi	sp,sp,-32
    802030c8:	ec06                	sd	ra,24(sp)
    802030ca:	e822                	sd	s0,16(sp)
    802030cc:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    802030ce:	fe840593          	addi	a1,s0,-24
    802030d2:	4501                	li	a0,0
    802030d4:	00000097          	auipc	ra,0x0
    802030d8:	d54080e7          	jalr	-684(ra) # 80202e28 <argaddr>
    802030dc:	87aa                	mv	a5,a0
    return -1;
    802030de:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    802030e0:	0007c863          	bltz	a5,802030f0 <sys_wait+0x2a>
  return wait(p);
    802030e4:	fe843503          	ld	a0,-24(s0)
    802030e8:	fffff097          	auipc	ra,0xfffff
    802030ec:	256080e7          	jalr	598(ra) # 8020233e <wait>
}
    802030f0:	60e2                	ld	ra,24(sp)
    802030f2:	6442                	ld	s0,16(sp)
    802030f4:	6105                	addi	sp,sp,32
    802030f6:	8082                	ret

00000000802030f8 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    802030f8:	7179                	addi	sp,sp,-48
    802030fa:	f406                	sd	ra,40(sp)
    802030fc:	f022                	sd	s0,32(sp)
    802030fe:	ec26                	sd	s1,24(sp)
    80203100:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    80203102:	fdc40593          	addi	a1,s0,-36
    80203106:	4501                	li	a0,0
    80203108:	00000097          	auipc	ra,0x0
    8020310c:	cbe080e7          	jalr	-834(ra) # 80202dc6 <argint>
    80203110:	87aa                	mv	a5,a0
    return -1;
    80203112:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    80203114:	0207c063          	bltz	a5,80203134 <sys_sbrk+0x3c>
  addr = myproc()->sz;
    80203118:	fffff097          	auipc	ra,0xfffff
    8020311c:	928080e7          	jalr	-1752(ra) # 80201a40 <myproc>
    80203120:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    80203122:	fdc42503          	lw	a0,-36(s0)
    80203126:	fffff097          	auipc	ra,0xfffff
    8020312a:	ca4080e7          	jalr	-860(ra) # 80201dca <growproc>
    8020312e:	00054863          	bltz	a0,8020313e <sys_sbrk+0x46>
    return -1;
  return addr;
    80203132:	8526                	mv	a0,s1
}
    80203134:	70a2                	ld	ra,40(sp)
    80203136:	7402                	ld	s0,32(sp)
    80203138:	64e2                	ld	s1,24(sp)
    8020313a:	6145                	addi	sp,sp,48
    8020313c:	8082                	ret
    return -1;
    8020313e:	557d                	li	a0,-1
    80203140:	bfd5                	j	80203134 <sys_sbrk+0x3c>

0000000080203142 <sys_sleep>:

uint64
sys_sleep(void)
{
    80203142:	7139                	addi	sp,sp,-64
    80203144:	fc06                	sd	ra,56(sp)
    80203146:	f822                	sd	s0,48(sp)
    80203148:	f426                	sd	s1,40(sp)
    8020314a:	f04a                	sd	s2,32(sp)
    8020314c:	ec4e                	sd	s3,24(sp)
    8020314e:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    80203150:	fcc40593          	addi	a1,s0,-52
    80203154:	4501                	li	a0,0
    80203156:	00000097          	auipc	ra,0x0
    8020315a:	c70080e7          	jalr	-912(ra) # 80202dc6 <argint>
    return -1;
    8020315e:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80203160:	06054763          	bltz	a0,802031ce <sys_sleep+0x8c>
  acquire(&tickslock);
    80203164:	00009517          	auipc	a0,0x9
    80203168:	90453503          	ld	a0,-1788(a0) # 8020ba68 <_GLOBAL_OFFSET_TABLE_+0x30>
    8020316c:	ffffd097          	auipc	ra,0xffffd
    80203170:	55a080e7          	jalr	1370(ra) # 802006c6 <acquire>
  ticks0 = ticks;
    80203174:	00009797          	auipc	a5,0x9
    80203178:	9047b783          	ld	a5,-1788(a5) # 8020ba78 <_GLOBAL_OFFSET_TABLE_+0x40>
    8020317c:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    80203180:	fcc42783          	lw	a5,-52(s0)
    80203184:	cf85                	beqz	a5,802031bc <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    80203186:	00009997          	auipc	s3,0x9
    8020318a:	8e29b983          	ld	s3,-1822(s3) # 8020ba68 <_GLOBAL_OFFSET_TABLE_+0x30>
    8020318e:	00009497          	auipc	s1,0x9
    80203192:	8ea4b483          	ld	s1,-1814(s1) # 8020ba78 <_GLOBAL_OFFSET_TABLE_+0x40>
    if(myproc()->killed){
    80203196:	fffff097          	auipc	ra,0xfffff
    8020319a:	8aa080e7          	jalr	-1878(ra) # 80201a40 <myproc>
    8020319e:	591c                	lw	a5,48(a0)
    802031a0:	ef9d                	bnez	a5,802031de <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    802031a2:	85ce                	mv	a1,s3
    802031a4:	8526                	mv	a0,s1
    802031a6:	fffff097          	auipc	ra,0xfffff
    802031aa:	11a080e7          	jalr	282(ra) # 802022c0 <sleep>
  while(ticks - ticks0 < n){
    802031ae:	409c                	lw	a5,0(s1)
    802031b0:	412787bb          	subw	a5,a5,s2
    802031b4:	fcc42703          	lw	a4,-52(s0)
    802031b8:	fce7efe3          	bltu	a5,a4,80203196 <sys_sleep+0x54>
  }
  release(&tickslock);
    802031bc:	00009517          	auipc	a0,0x9
    802031c0:	8ac53503          	ld	a0,-1876(a0) # 8020ba68 <_GLOBAL_OFFSET_TABLE_+0x30>
    802031c4:	ffffd097          	auipc	ra,0xffffd
    802031c8:	556080e7          	jalr	1366(ra) # 8020071a <release>
  return 0;
    802031cc:	4781                	li	a5,0
}
    802031ce:	853e                	mv	a0,a5
    802031d0:	70e2                	ld	ra,56(sp)
    802031d2:	7442                	ld	s0,48(sp)
    802031d4:	74a2                	ld	s1,40(sp)
    802031d6:	7902                	ld	s2,32(sp)
    802031d8:	69e2                	ld	s3,24(sp)
    802031da:	6121                	addi	sp,sp,64
    802031dc:	8082                	ret
      release(&tickslock);
    802031de:	00009517          	auipc	a0,0x9
    802031e2:	88a53503          	ld	a0,-1910(a0) # 8020ba68 <_GLOBAL_OFFSET_TABLE_+0x30>
    802031e6:	ffffd097          	auipc	ra,0xffffd
    802031ea:	534080e7          	jalr	1332(ra) # 8020071a <release>
      return -1;
    802031ee:	57fd                	li	a5,-1
    802031f0:	bff9                	j	802031ce <sys_sleep+0x8c>

00000000802031f2 <sys_kill>:

uint64
sys_kill(void)
{
    802031f2:	1101                	addi	sp,sp,-32
    802031f4:	ec06                	sd	ra,24(sp)
    802031f6:	e822                	sd	s0,16(sp)
    802031f8:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    802031fa:	fec40593          	addi	a1,s0,-20
    802031fe:	4501                	li	a0,0
    80203200:	00000097          	auipc	ra,0x0
    80203204:	bc6080e7          	jalr	-1082(ra) # 80202dc6 <argint>
    80203208:	87aa                	mv	a5,a0
    return -1;
    8020320a:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    8020320c:	0007c863          	bltz	a5,8020321c <sys_kill+0x2a>
  return kill(pid);
    80203210:	fec42503          	lw	a0,-20(s0)
    80203214:	fffff097          	auipc	ra,0xfffff
    80203218:	292080e7          	jalr	658(ra) # 802024a6 <kill>
}
    8020321c:	60e2                	ld	ra,24(sp)
    8020321e:	6442                	ld	s0,16(sp)
    80203220:	6105                	addi	sp,sp,32
    80203222:	8082                	ret

0000000080203224 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80203224:	1101                	addi	sp,sp,-32
    80203226:	ec06                	sd	ra,24(sp)
    80203228:	e822                	sd	s0,16(sp)
    8020322a:	e426                	sd	s1,8(sp)
    8020322c:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    8020322e:	00009517          	auipc	a0,0x9
    80203232:	83a53503          	ld	a0,-1990(a0) # 8020ba68 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203236:	ffffd097          	auipc	ra,0xffffd
    8020323a:	490080e7          	jalr	1168(ra) # 802006c6 <acquire>
  xticks = ticks;
    8020323e:	00009797          	auipc	a5,0x9
    80203242:	83a7b783          	ld	a5,-1990(a5) # 8020ba78 <_GLOBAL_OFFSET_TABLE_+0x40>
    80203246:	4384                	lw	s1,0(a5)
  release(&tickslock);
    80203248:	00009517          	auipc	a0,0x9
    8020324c:	82053503          	ld	a0,-2016(a0) # 8020ba68 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203250:	ffffd097          	auipc	ra,0xffffd
    80203254:	4ca080e7          	jalr	1226(ra) # 8020071a <release>
  return xticks;
}
    80203258:	02049513          	slli	a0,s1,0x20
    8020325c:	9101                	srli	a0,a0,0x20
    8020325e:	60e2                	ld	ra,24(sp)
    80203260:	6442                	ld	s0,16(sp)
    80203262:	64a2                	ld	s1,8(sp)
    80203264:	6105                	addi	sp,sp,32
    80203266:	8082                	ret

0000000080203268 <sys_trace>:

uint64
sys_trace(void)
{
    80203268:	1101                	addi	sp,sp,-32
    8020326a:	ec06                	sd	ra,24(sp)
    8020326c:	e822                	sd	s0,16(sp)
    8020326e:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    80203270:	fec40593          	addi	a1,s0,-20
    80203274:	4501                	li	a0,0
    80203276:	00000097          	auipc	ra,0x0
    8020327a:	b50080e7          	jalr	-1200(ra) # 80202dc6 <argint>
    return -1;
    8020327e:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    80203280:	00054b63          	bltz	a0,80203296 <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    80203284:	ffffe097          	auipc	ra,0xffffe
    80203288:	7bc080e7          	jalr	1980(ra) # 80201a40 <myproc>
    8020328c:	fec42783          	lw	a5,-20(s0)
    80203290:	16f52823          	sw	a5,368(a0)
  return 0;
    80203294:	4781                	li	a5,0
}
    80203296:	853e                	mv	a0,a5
    80203298:	60e2                	ld	ra,24(sp)
    8020329a:	6442                	ld	s0,16(sp)
    8020329c:	6105                	addi	sp,sp,32
    8020329e:	8082                	ret

00000000802032a0 <sys_brk>:

uint64
sys_brk(void){
    802032a0:	1101                	addi	sp,sp,-32
    802032a2:	ec06                	sd	ra,24(sp)
    802032a4:	e822                	sd	s0,16(sp)
    802032a6:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    802032a8:	fec40593          	addi	a1,s0,-20
    802032ac:	4501                	li	a0,0
    802032ae:	00000097          	auipc	ra,0x0
    802032b2:	b18080e7          	jalr	-1256(ra) # 80202dc6 <argint>
  printf("hello brk from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    802032b6:	ffffe097          	auipc	ra,0xffffe
    802032ba:	78a080e7          	jalr	1930(ra) # 80201a40 <myproc>
    802032be:	8612                	mv	a2,tp
    802032c0:	fec42683          	lw	a3,-20(s0)
    802032c4:	5d0c                	lw	a1,56(a0)
    802032c6:	00006517          	auipc	a0,0x6
    802032ca:	7ea50513          	addi	a0,a0,2026 # 80209ab0 <digits+0x730>
    802032ce:	ffffd097          	auipc	ra,0xffffd
    802032d2:	ec0080e7          	jalr	-320(ra) # 8020018e <printf>
  return 0;
}
    802032d6:	4501                	li	a0,0
    802032d8:	60e2                	ld	ra,24(sp)
    802032da:	6442                	ld	s0,16(sp)
    802032dc:	6105                	addi	sp,sp,32
    802032de:	8082                	ret

00000000802032e0 <binit>:
    802032e0:	7139                	addi	sp,sp,-64
    802032e2:	fc06                	sd	ra,56(sp)
    802032e4:	f822                	sd	s0,48(sp)
    802032e6:	f426                	sd	s1,40(sp)
    802032e8:	f04a                	sd	s2,32(sp)
    802032ea:	ec4e                	sd	s3,24(sp)
    802032ec:	e852                	sd	s4,16(sp)
    802032ee:	e456                	sd	s5,8(sp)
    802032f0:	0080                	addi	s0,sp,64
    802032f2:	00006597          	auipc	a1,0x6
    802032f6:	7ee58593          	addi	a1,a1,2030 # 80209ae0 <digits+0x760>
    802032fa:	00015517          	auipc	a0,0x15
    802032fe:	7f650513          	addi	a0,a0,2038 # 80218af0 <bcache>
    80203302:	ffffd097          	auipc	ra,0xffffd
    80203306:	380080e7          	jalr	896(ra) # 80200682 <initlock>
    8020330a:	00019797          	auipc	a5,0x19
    8020330e:	7e678793          	addi	a5,a5,2022 # 8021caf0 <bcache+0x4000>
    80203312:	0001a717          	auipc	a4,0x1a
    80203316:	e4670713          	addi	a4,a4,-442 # 8021d158 <bcache+0x4668>
    8020331a:	6ae7b823          	sd	a4,1712(a5)
    8020331e:	6ae7bc23          	sd	a4,1720(a5)
    80203322:	00015497          	auipc	s1,0x15
    80203326:	7e648493          	addi	s1,s1,2022 # 80218b08 <bcache+0x18>
    8020332a:	5a7d                	li	s4,-1
    8020332c:	893e                	mv	s2,a5
    8020332e:	89ba                	mv	s3,a4
    80203330:	00006a97          	auipc	s5,0x6
    80203334:	7b8a8a93          	addi	s5,s5,1976 # 80209ae8 <digits+0x768>
    80203338:	0404a023          	sw	zero,64(s1)
    8020333c:	0144a623          	sw	s4,12(s1)
    80203340:	0144a423          	sw	s4,8(s1)
    80203344:	6b893783          	ld	a5,1720(s2)
    80203348:	e8bc                	sd	a5,80(s1)
    8020334a:	0534b423          	sd	s3,72(s1)
    8020334e:	85d6                	mv	a1,s5
    80203350:	01048513          	addi	a0,s1,16
    80203354:	00000097          	auipc	ra,0x0
    80203358:	26c080e7          	jalr	620(ra) # 802035c0 <initsleeplock>
    8020335c:	6b893783          	ld	a5,1720(s2)
    80203360:	e7a4                	sd	s1,72(a5)
    80203362:	6a993c23          	sd	s1,1720(s2)
    80203366:	25848493          	addi	s1,s1,600
    8020336a:	fd3497e3          	bne	s1,s3,80203338 <binit+0x58>
    8020336e:	70e2                	ld	ra,56(sp)
    80203370:	7442                	ld	s0,48(sp)
    80203372:	74a2                	ld	s1,40(sp)
    80203374:	7902                	ld	s2,32(sp)
    80203376:	69e2                	ld	s3,24(sp)
    80203378:	6a42                	ld	s4,16(sp)
    8020337a:	6aa2                	ld	s5,8(sp)
    8020337c:	6121                	addi	sp,sp,64
    8020337e:	8082                	ret

0000000080203380 <bread>:
    80203380:	7179                	addi	sp,sp,-48
    80203382:	f406                	sd	ra,40(sp)
    80203384:	f022                	sd	s0,32(sp)
    80203386:	ec26                	sd	s1,24(sp)
    80203388:	e84a                	sd	s2,16(sp)
    8020338a:	e44e                	sd	s3,8(sp)
    8020338c:	1800                	addi	s0,sp,48
    8020338e:	892a                	mv	s2,a0
    80203390:	89ae                	mv	s3,a1
    80203392:	00015517          	auipc	a0,0x15
    80203396:	75e50513          	addi	a0,a0,1886 # 80218af0 <bcache>
    8020339a:	ffffd097          	auipc	ra,0xffffd
    8020339e:	32c080e7          	jalr	812(ra) # 802006c6 <acquire>
    802033a2:	0001a497          	auipc	s1,0x1a
    802033a6:	e064b483          	ld	s1,-506(s1) # 8021d1a8 <bcache+0x46b8>
    802033aa:	0001a797          	auipc	a5,0x1a
    802033ae:	dae78793          	addi	a5,a5,-594 # 8021d158 <bcache+0x4668>
    802033b2:	02f48f63          	beq	s1,a5,802033f0 <bread+0x70>
    802033b6:	873e                	mv	a4,a5
    802033b8:	a021                	j	802033c0 <bread+0x40>
    802033ba:	68a4                	ld	s1,80(s1)
    802033bc:	02e48a63          	beq	s1,a4,802033f0 <bread+0x70>
    802033c0:	449c                	lw	a5,8(s1)
    802033c2:	ff279ce3          	bne	a5,s2,802033ba <bread+0x3a>
    802033c6:	44dc                	lw	a5,12(s1)
    802033c8:	ff3799e3          	bne	a5,s3,802033ba <bread+0x3a>
    802033cc:	40bc                	lw	a5,64(s1)
    802033ce:	2785                	addiw	a5,a5,1
    802033d0:	c0bc                	sw	a5,64(s1)
    802033d2:	00015517          	auipc	a0,0x15
    802033d6:	71e50513          	addi	a0,a0,1822 # 80218af0 <bcache>
    802033da:	ffffd097          	auipc	ra,0xffffd
    802033de:	340080e7          	jalr	832(ra) # 8020071a <release>
    802033e2:	01048513          	addi	a0,s1,16
    802033e6:	00000097          	auipc	ra,0x0
    802033ea:	214080e7          	jalr	532(ra) # 802035fa <acquiresleep>
    802033ee:	a8b9                	j	8020344c <bread+0xcc>
    802033f0:	0001a497          	auipc	s1,0x1a
    802033f4:	db04b483          	ld	s1,-592(s1) # 8021d1a0 <bcache+0x46b0>
    802033f8:	0001a797          	auipc	a5,0x1a
    802033fc:	d6078793          	addi	a5,a5,-672 # 8021d158 <bcache+0x4668>
    80203400:	00f48863          	beq	s1,a5,80203410 <bread+0x90>
    80203404:	873e                	mv	a4,a5
    80203406:	40bc                	lw	a5,64(s1)
    80203408:	cf81                	beqz	a5,80203420 <bread+0xa0>
    8020340a:	64a4                	ld	s1,72(s1)
    8020340c:	fee49de3          	bne	s1,a4,80203406 <bread+0x86>
    80203410:	00006517          	auipc	a0,0x6
    80203414:	6e050513          	addi	a0,a0,1760 # 80209af0 <digits+0x770>
    80203418:	ffffd097          	auipc	ra,0xffffd
    8020341c:	d2c080e7          	jalr	-724(ra) # 80200144 <panic>
    80203420:	0124a423          	sw	s2,8(s1)
    80203424:	0134a623          	sw	s3,12(s1)
    80203428:	0004a023          	sw	zero,0(s1)
    8020342c:	4785                	li	a5,1
    8020342e:	c0bc                	sw	a5,64(s1)
    80203430:	00015517          	auipc	a0,0x15
    80203434:	6c050513          	addi	a0,a0,1728 # 80218af0 <bcache>
    80203438:	ffffd097          	auipc	ra,0xffffd
    8020343c:	2e2080e7          	jalr	738(ra) # 8020071a <release>
    80203440:	01048513          	addi	a0,s1,16
    80203444:	00000097          	auipc	ra,0x0
    80203448:	1b6080e7          	jalr	438(ra) # 802035fa <acquiresleep>
    8020344c:	409c                	lw	a5,0(s1)
    8020344e:	cb89                	beqz	a5,80203460 <bread+0xe0>
    80203450:	8526                	mv	a0,s1
    80203452:	70a2                	ld	ra,40(sp)
    80203454:	7402                	ld	s0,32(sp)
    80203456:	64e2                	ld	s1,24(sp)
    80203458:	6942                	ld	s2,16(sp)
    8020345a:	69a2                	ld	s3,8(sp)
    8020345c:	6145                	addi	sp,sp,48
    8020345e:	8082                	ret
    80203460:	8526                	mv	a0,s1
    80203462:	00002097          	auipc	ra,0x2
    80203466:	b30080e7          	jalr	-1232(ra) # 80204f92 <disk_read>
    8020346a:	4785                	li	a5,1
    8020346c:	c09c                	sw	a5,0(s1)
    8020346e:	b7cd                	j	80203450 <bread+0xd0>

0000000080203470 <bwrite>:
    80203470:	1101                	addi	sp,sp,-32
    80203472:	ec06                	sd	ra,24(sp)
    80203474:	e822                	sd	s0,16(sp)
    80203476:	e426                	sd	s1,8(sp)
    80203478:	1000                	addi	s0,sp,32
    8020347a:	84aa                	mv	s1,a0
    8020347c:	0541                	addi	a0,a0,16
    8020347e:	00000097          	auipc	ra,0x0
    80203482:	216080e7          	jalr	534(ra) # 80203694 <holdingsleep>
    80203486:	c919                	beqz	a0,8020349c <bwrite+0x2c>
    80203488:	8526                	mv	a0,s1
    8020348a:	00002097          	auipc	ra,0x2
    8020348e:	b22080e7          	jalr	-1246(ra) # 80204fac <disk_write>
    80203492:	60e2                	ld	ra,24(sp)
    80203494:	6442                	ld	s0,16(sp)
    80203496:	64a2                	ld	s1,8(sp)
    80203498:	6105                	addi	sp,sp,32
    8020349a:	8082                	ret
    8020349c:	00006517          	auipc	a0,0x6
    802034a0:	66c50513          	addi	a0,a0,1644 # 80209b08 <digits+0x788>
    802034a4:	ffffd097          	auipc	ra,0xffffd
    802034a8:	ca0080e7          	jalr	-864(ra) # 80200144 <panic>

00000000802034ac <brelse>:
    802034ac:	1101                	addi	sp,sp,-32
    802034ae:	ec06                	sd	ra,24(sp)
    802034b0:	e822                	sd	s0,16(sp)
    802034b2:	e426                	sd	s1,8(sp)
    802034b4:	e04a                	sd	s2,0(sp)
    802034b6:	1000                	addi	s0,sp,32
    802034b8:	84aa                	mv	s1,a0
    802034ba:	01050913          	addi	s2,a0,16
    802034be:	854a                	mv	a0,s2
    802034c0:	00000097          	auipc	ra,0x0
    802034c4:	1d4080e7          	jalr	468(ra) # 80203694 <holdingsleep>
    802034c8:	c925                	beqz	a0,80203538 <brelse+0x8c>
    802034ca:	854a                	mv	a0,s2
    802034cc:	00000097          	auipc	ra,0x0
    802034d0:	184080e7          	jalr	388(ra) # 80203650 <releasesleep>
    802034d4:	00015517          	auipc	a0,0x15
    802034d8:	61c50513          	addi	a0,a0,1564 # 80218af0 <bcache>
    802034dc:	ffffd097          	auipc	ra,0xffffd
    802034e0:	1ea080e7          	jalr	490(ra) # 802006c6 <acquire>
    802034e4:	40bc                	lw	a5,64(s1)
    802034e6:	37fd                	addiw	a5,a5,-1
    802034e8:	0007871b          	sext.w	a4,a5
    802034ec:	c0bc                	sw	a5,64(s1)
    802034ee:	e71d                	bnez	a4,8020351c <brelse+0x70>
    802034f0:	68b8                	ld	a4,80(s1)
    802034f2:	64bc                	ld	a5,72(s1)
    802034f4:	e73c                	sd	a5,72(a4)
    802034f6:	68b8                	ld	a4,80(s1)
    802034f8:	ebb8                	sd	a4,80(a5)
    802034fa:	00019797          	auipc	a5,0x19
    802034fe:	5f678793          	addi	a5,a5,1526 # 8021caf0 <bcache+0x4000>
    80203502:	6b87b703          	ld	a4,1720(a5)
    80203506:	e8b8                	sd	a4,80(s1)
    80203508:	0001a717          	auipc	a4,0x1a
    8020350c:	c5070713          	addi	a4,a4,-944 # 8021d158 <bcache+0x4668>
    80203510:	e4b8                	sd	a4,72(s1)
    80203512:	6b87b703          	ld	a4,1720(a5)
    80203516:	e724                	sd	s1,72(a4)
    80203518:	6a97bc23          	sd	s1,1720(a5)
    8020351c:	00015517          	auipc	a0,0x15
    80203520:	5d450513          	addi	a0,a0,1492 # 80218af0 <bcache>
    80203524:	ffffd097          	auipc	ra,0xffffd
    80203528:	1f6080e7          	jalr	502(ra) # 8020071a <release>
    8020352c:	60e2                	ld	ra,24(sp)
    8020352e:	6442                	ld	s0,16(sp)
    80203530:	64a2                	ld	s1,8(sp)
    80203532:	6902                	ld	s2,0(sp)
    80203534:	6105                	addi	sp,sp,32
    80203536:	8082                	ret
    80203538:	00006517          	auipc	a0,0x6
    8020353c:	5d850513          	addi	a0,a0,1496 # 80209b10 <digits+0x790>
    80203540:	ffffd097          	auipc	ra,0xffffd
    80203544:	c04080e7          	jalr	-1020(ra) # 80200144 <panic>

0000000080203548 <bpin>:
    80203548:	1101                	addi	sp,sp,-32
    8020354a:	ec06                	sd	ra,24(sp)
    8020354c:	e822                	sd	s0,16(sp)
    8020354e:	e426                	sd	s1,8(sp)
    80203550:	1000                	addi	s0,sp,32
    80203552:	84aa                	mv	s1,a0
    80203554:	00015517          	auipc	a0,0x15
    80203558:	59c50513          	addi	a0,a0,1436 # 80218af0 <bcache>
    8020355c:	ffffd097          	auipc	ra,0xffffd
    80203560:	16a080e7          	jalr	362(ra) # 802006c6 <acquire>
    80203564:	40bc                	lw	a5,64(s1)
    80203566:	2785                	addiw	a5,a5,1
    80203568:	c0bc                	sw	a5,64(s1)
    8020356a:	00015517          	auipc	a0,0x15
    8020356e:	58650513          	addi	a0,a0,1414 # 80218af0 <bcache>
    80203572:	ffffd097          	auipc	ra,0xffffd
    80203576:	1a8080e7          	jalr	424(ra) # 8020071a <release>
    8020357a:	60e2                	ld	ra,24(sp)
    8020357c:	6442                	ld	s0,16(sp)
    8020357e:	64a2                	ld	s1,8(sp)
    80203580:	6105                	addi	sp,sp,32
    80203582:	8082                	ret

0000000080203584 <bunpin>:
    80203584:	1101                	addi	sp,sp,-32
    80203586:	ec06                	sd	ra,24(sp)
    80203588:	e822                	sd	s0,16(sp)
    8020358a:	e426                	sd	s1,8(sp)
    8020358c:	1000                	addi	s0,sp,32
    8020358e:	84aa                	mv	s1,a0
    80203590:	00015517          	auipc	a0,0x15
    80203594:	56050513          	addi	a0,a0,1376 # 80218af0 <bcache>
    80203598:	ffffd097          	auipc	ra,0xffffd
    8020359c:	12e080e7          	jalr	302(ra) # 802006c6 <acquire>
    802035a0:	40bc                	lw	a5,64(s1)
    802035a2:	37fd                	addiw	a5,a5,-1
    802035a4:	c0bc                	sw	a5,64(s1)
    802035a6:	00015517          	auipc	a0,0x15
    802035aa:	54a50513          	addi	a0,a0,1354 # 80218af0 <bcache>
    802035ae:	ffffd097          	auipc	ra,0xffffd
    802035b2:	16c080e7          	jalr	364(ra) # 8020071a <release>
    802035b6:	60e2                	ld	ra,24(sp)
    802035b8:	6442                	ld	s0,16(sp)
    802035ba:	64a2                	ld	s1,8(sp)
    802035bc:	6105                	addi	sp,sp,32
    802035be:	8082                	ret

00000000802035c0 <initsleeplock>:
    802035c0:	1101                	addi	sp,sp,-32
    802035c2:	ec06                	sd	ra,24(sp)
    802035c4:	e822                	sd	s0,16(sp)
    802035c6:	e426                	sd	s1,8(sp)
    802035c8:	e04a                	sd	s2,0(sp)
    802035ca:	1000                	addi	s0,sp,32
    802035cc:	84aa                	mv	s1,a0
    802035ce:	892e                	mv	s2,a1
    802035d0:	00006597          	auipc	a1,0x6
    802035d4:	54858593          	addi	a1,a1,1352 # 80209b18 <digits+0x798>
    802035d8:	0521                	addi	a0,a0,8
    802035da:	ffffd097          	auipc	ra,0xffffd
    802035de:	0a8080e7          	jalr	168(ra) # 80200682 <initlock>
    802035e2:	0324b023          	sd	s2,32(s1)
    802035e6:	0004a023          	sw	zero,0(s1)
    802035ea:	0204a423          	sw	zero,40(s1)
    802035ee:	60e2                	ld	ra,24(sp)
    802035f0:	6442                	ld	s0,16(sp)
    802035f2:	64a2                	ld	s1,8(sp)
    802035f4:	6902                	ld	s2,0(sp)
    802035f6:	6105                	addi	sp,sp,32
    802035f8:	8082                	ret

00000000802035fa <acquiresleep>:
    802035fa:	1101                	addi	sp,sp,-32
    802035fc:	ec06                	sd	ra,24(sp)
    802035fe:	e822                	sd	s0,16(sp)
    80203600:	e426                	sd	s1,8(sp)
    80203602:	e04a                	sd	s2,0(sp)
    80203604:	1000                	addi	s0,sp,32
    80203606:	84aa                	mv	s1,a0
    80203608:	00850913          	addi	s2,a0,8
    8020360c:	854a                	mv	a0,s2
    8020360e:	ffffd097          	auipc	ra,0xffffd
    80203612:	0b8080e7          	jalr	184(ra) # 802006c6 <acquire>
    80203616:	409c                	lw	a5,0(s1)
    80203618:	cb89                	beqz	a5,8020362a <acquiresleep+0x30>
    8020361a:	85ca                	mv	a1,s2
    8020361c:	8526                	mv	a0,s1
    8020361e:	fffff097          	auipc	ra,0xfffff
    80203622:	ca2080e7          	jalr	-862(ra) # 802022c0 <sleep>
    80203626:	409c                	lw	a5,0(s1)
    80203628:	fbed                	bnez	a5,8020361a <acquiresleep+0x20>
    8020362a:	4785                	li	a5,1
    8020362c:	c09c                	sw	a5,0(s1)
    8020362e:	ffffe097          	auipc	ra,0xffffe
    80203632:	412080e7          	jalr	1042(ra) # 80201a40 <myproc>
    80203636:	5d1c                	lw	a5,56(a0)
    80203638:	d49c                	sw	a5,40(s1)
    8020363a:	854a                	mv	a0,s2
    8020363c:	ffffd097          	auipc	ra,0xffffd
    80203640:	0de080e7          	jalr	222(ra) # 8020071a <release>
    80203644:	60e2                	ld	ra,24(sp)
    80203646:	6442                	ld	s0,16(sp)
    80203648:	64a2                	ld	s1,8(sp)
    8020364a:	6902                	ld	s2,0(sp)
    8020364c:	6105                	addi	sp,sp,32
    8020364e:	8082                	ret

0000000080203650 <releasesleep>:
    80203650:	1101                	addi	sp,sp,-32
    80203652:	ec06                	sd	ra,24(sp)
    80203654:	e822                	sd	s0,16(sp)
    80203656:	e426                	sd	s1,8(sp)
    80203658:	e04a                	sd	s2,0(sp)
    8020365a:	1000                	addi	s0,sp,32
    8020365c:	84aa                	mv	s1,a0
    8020365e:	00850913          	addi	s2,a0,8
    80203662:	854a                	mv	a0,s2
    80203664:	ffffd097          	auipc	ra,0xffffd
    80203668:	062080e7          	jalr	98(ra) # 802006c6 <acquire>
    8020366c:	0004a023          	sw	zero,0(s1)
    80203670:	0204a423          	sw	zero,40(s1)
    80203674:	8526                	mv	a0,s1
    80203676:	fffff097          	auipc	ra,0xfffff
    8020367a:	dc6080e7          	jalr	-570(ra) # 8020243c <wakeup>
    8020367e:	854a                	mv	a0,s2
    80203680:	ffffd097          	auipc	ra,0xffffd
    80203684:	09a080e7          	jalr	154(ra) # 8020071a <release>
    80203688:	60e2                	ld	ra,24(sp)
    8020368a:	6442                	ld	s0,16(sp)
    8020368c:	64a2                	ld	s1,8(sp)
    8020368e:	6902                	ld	s2,0(sp)
    80203690:	6105                	addi	sp,sp,32
    80203692:	8082                	ret

0000000080203694 <holdingsleep>:
    80203694:	7179                	addi	sp,sp,-48
    80203696:	f406                	sd	ra,40(sp)
    80203698:	f022                	sd	s0,32(sp)
    8020369a:	ec26                	sd	s1,24(sp)
    8020369c:	e84a                	sd	s2,16(sp)
    8020369e:	e44e                	sd	s3,8(sp)
    802036a0:	1800                	addi	s0,sp,48
    802036a2:	84aa                	mv	s1,a0
    802036a4:	00850913          	addi	s2,a0,8
    802036a8:	854a                	mv	a0,s2
    802036aa:	ffffd097          	auipc	ra,0xffffd
    802036ae:	01c080e7          	jalr	28(ra) # 802006c6 <acquire>
    802036b2:	409c                	lw	a5,0(s1)
    802036b4:	ef99                	bnez	a5,802036d2 <holdingsleep+0x3e>
    802036b6:	4481                	li	s1,0
    802036b8:	854a                	mv	a0,s2
    802036ba:	ffffd097          	auipc	ra,0xffffd
    802036be:	060080e7          	jalr	96(ra) # 8020071a <release>
    802036c2:	8526                	mv	a0,s1
    802036c4:	70a2                	ld	ra,40(sp)
    802036c6:	7402                	ld	s0,32(sp)
    802036c8:	64e2                	ld	s1,24(sp)
    802036ca:	6942                	ld	s2,16(sp)
    802036cc:	69a2                	ld	s3,8(sp)
    802036ce:	6145                	addi	sp,sp,48
    802036d0:	8082                	ret
    802036d2:	0284a983          	lw	s3,40(s1)
    802036d6:	ffffe097          	auipc	ra,0xffffe
    802036da:	36a080e7          	jalr	874(ra) # 80201a40 <myproc>
    802036de:	5d04                	lw	s1,56(a0)
    802036e0:	413484b3          	sub	s1,s1,s3
    802036e4:	0014b493          	seqz	s1,s1
    802036e8:	bfc1                	j	802036b8 <holdingsleep+0x24>

00000000802036ea <fileinit>:
    802036ea:	1101                	addi	sp,sp,-32
    802036ec:	ec06                	sd	ra,24(sp)
    802036ee:	e822                	sd	s0,16(sp)
    802036f0:	e426                	sd	s1,8(sp)
    802036f2:	e04a                	sd	s2,0(sp)
    802036f4:	1000                	addi	s0,sp,32
    802036f6:	00006597          	auipc	a1,0x6
    802036fa:	43258593          	addi	a1,a1,1074 # 80209b28 <digits+0x7a8>
    802036fe:	0001a517          	auipc	a0,0x1a
    80203702:	d5250513          	addi	a0,a0,-686 # 8021d450 <ftable>
    80203706:	ffffd097          	auipc	ra,0xffffd
    8020370a:	f7c080e7          	jalr	-132(ra) # 80200682 <initlock>
    8020370e:	0001a497          	auipc	s1,0x1a
    80203712:	d5a48493          	addi	s1,s1,-678 # 8021d468 <ftable+0x18>
    80203716:	0001b917          	auipc	s2,0x1b
    8020371a:	cf290913          	addi	s2,s2,-782 # 8021e408 <tickslock>
    8020371e:	02800613          	li	a2,40
    80203722:	4581                	li	a1,0
    80203724:	8526                	mv	a0,s1
    80203726:	ffffd097          	auipc	ra,0xffffd
    8020372a:	03c080e7          	jalr	60(ra) # 80200762 <memset>
    8020372e:	02848493          	addi	s1,s1,40
    80203732:	ff2496e3          	bne	s1,s2,8020371e <fileinit+0x34>
    80203736:	60e2                	ld	ra,24(sp)
    80203738:	6442                	ld	s0,16(sp)
    8020373a:	64a2                	ld	s1,8(sp)
    8020373c:	6902                	ld	s2,0(sp)
    8020373e:	6105                	addi	sp,sp,32
    80203740:	8082                	ret

0000000080203742 <filealloc>:
    80203742:	1101                	addi	sp,sp,-32
    80203744:	ec06                	sd	ra,24(sp)
    80203746:	e822                	sd	s0,16(sp)
    80203748:	e426                	sd	s1,8(sp)
    8020374a:	1000                	addi	s0,sp,32
    8020374c:	0001a517          	auipc	a0,0x1a
    80203750:	d0450513          	addi	a0,a0,-764 # 8021d450 <ftable>
    80203754:	ffffd097          	auipc	ra,0xffffd
    80203758:	f72080e7          	jalr	-142(ra) # 802006c6 <acquire>
    8020375c:	0001a497          	auipc	s1,0x1a
    80203760:	d0c48493          	addi	s1,s1,-756 # 8021d468 <ftable+0x18>
    80203764:	0001b717          	auipc	a4,0x1b
    80203768:	ca470713          	addi	a4,a4,-860 # 8021e408 <tickslock>
    8020376c:	40dc                	lw	a5,4(s1)
    8020376e:	cf99                	beqz	a5,8020378c <filealloc+0x4a>
    80203770:	02848493          	addi	s1,s1,40
    80203774:	fee49ce3          	bne	s1,a4,8020376c <filealloc+0x2a>
    80203778:	0001a517          	auipc	a0,0x1a
    8020377c:	cd850513          	addi	a0,a0,-808 # 8021d450 <ftable>
    80203780:	ffffd097          	auipc	ra,0xffffd
    80203784:	f9a080e7          	jalr	-102(ra) # 8020071a <release>
    80203788:	4481                	li	s1,0
    8020378a:	a819                	j	802037a0 <filealloc+0x5e>
    8020378c:	4785                	li	a5,1
    8020378e:	c0dc                	sw	a5,4(s1)
    80203790:	0001a517          	auipc	a0,0x1a
    80203794:	cc050513          	addi	a0,a0,-832 # 8021d450 <ftable>
    80203798:	ffffd097          	auipc	ra,0xffffd
    8020379c:	f82080e7          	jalr	-126(ra) # 8020071a <release>
    802037a0:	8526                	mv	a0,s1
    802037a2:	60e2                	ld	ra,24(sp)
    802037a4:	6442                	ld	s0,16(sp)
    802037a6:	64a2                	ld	s1,8(sp)
    802037a8:	6105                	addi	sp,sp,32
    802037aa:	8082                	ret

00000000802037ac <filedup>:
    802037ac:	1101                	addi	sp,sp,-32
    802037ae:	ec06                	sd	ra,24(sp)
    802037b0:	e822                	sd	s0,16(sp)
    802037b2:	e426                	sd	s1,8(sp)
    802037b4:	1000                	addi	s0,sp,32
    802037b6:	84aa                	mv	s1,a0
    802037b8:	0001a517          	auipc	a0,0x1a
    802037bc:	c9850513          	addi	a0,a0,-872 # 8021d450 <ftable>
    802037c0:	ffffd097          	auipc	ra,0xffffd
    802037c4:	f06080e7          	jalr	-250(ra) # 802006c6 <acquire>
    802037c8:	40dc                	lw	a5,4(s1)
    802037ca:	02f05263          	blez	a5,802037ee <filedup+0x42>
    802037ce:	2785                	addiw	a5,a5,1
    802037d0:	c0dc                	sw	a5,4(s1)
    802037d2:	0001a517          	auipc	a0,0x1a
    802037d6:	c7e50513          	addi	a0,a0,-898 # 8021d450 <ftable>
    802037da:	ffffd097          	auipc	ra,0xffffd
    802037de:	f40080e7          	jalr	-192(ra) # 8020071a <release>
    802037e2:	8526                	mv	a0,s1
    802037e4:	60e2                	ld	ra,24(sp)
    802037e6:	6442                	ld	s0,16(sp)
    802037e8:	64a2                	ld	s1,8(sp)
    802037ea:	6105                	addi	sp,sp,32
    802037ec:	8082                	ret
    802037ee:	00006517          	auipc	a0,0x6
    802037f2:	34250513          	addi	a0,a0,834 # 80209b30 <digits+0x7b0>
    802037f6:	ffffd097          	auipc	ra,0xffffd
    802037fa:	94e080e7          	jalr	-1714(ra) # 80200144 <panic>

00000000802037fe <fileclose>:
    802037fe:	7139                	addi	sp,sp,-64
    80203800:	fc06                	sd	ra,56(sp)
    80203802:	f822                	sd	s0,48(sp)
    80203804:	f426                	sd	s1,40(sp)
    80203806:	f04a                	sd	s2,32(sp)
    80203808:	ec4e                	sd	s3,24(sp)
    8020380a:	e852                	sd	s4,16(sp)
    8020380c:	e456                	sd	s5,8(sp)
    8020380e:	0080                	addi	s0,sp,64
    80203810:	84aa                	mv	s1,a0
    80203812:	0001a517          	auipc	a0,0x1a
    80203816:	c3e50513          	addi	a0,a0,-962 # 8021d450 <ftable>
    8020381a:	ffffd097          	auipc	ra,0xffffd
    8020381e:	eac080e7          	jalr	-340(ra) # 802006c6 <acquire>
    80203822:	40dc                	lw	a5,4(s1)
    80203824:	04f05863          	blez	a5,80203874 <fileclose+0x76>
    80203828:	37fd                	addiw	a5,a5,-1
    8020382a:	0007871b          	sext.w	a4,a5
    8020382e:	c0dc                	sw	a5,4(s1)
    80203830:	04e04a63          	bgtz	a4,80203884 <fileclose+0x86>
    80203834:	0004a903          	lw	s2,0(s1)
    80203838:	0094ca03          	lbu	s4,9(s1)
    8020383c:	0104b983          	ld	s3,16(s1)
    80203840:	0184ba83          	ld	s5,24(s1)
    80203844:	0004a223          	sw	zero,4(s1)
    80203848:	0004a023          	sw	zero,0(s1)
    8020384c:	0001a517          	auipc	a0,0x1a
    80203850:	c0450513          	addi	a0,a0,-1020 # 8021d450 <ftable>
    80203854:	ffffd097          	auipc	ra,0xffffd
    80203858:	ec6080e7          	jalr	-314(ra) # 8020071a <release>
    8020385c:	4785                	li	a5,1
    8020385e:	04f90463          	beq	s2,a5,802038a6 <fileclose+0xa8>
    80203862:	4789                	li	a5,2
    80203864:	02f91863          	bne	s2,a5,80203894 <fileclose+0x96>
    80203868:	8556                	mv	a0,s5
    8020386a:	00003097          	auipc	ra,0x3
    8020386e:	940080e7          	jalr	-1728(ra) # 802061aa <eput>
    80203872:	a00d                	j	80203894 <fileclose+0x96>
    80203874:	00006517          	auipc	a0,0x6
    80203878:	2c450513          	addi	a0,a0,708 # 80209b38 <digits+0x7b8>
    8020387c:	ffffd097          	auipc	ra,0xffffd
    80203880:	8c8080e7          	jalr	-1848(ra) # 80200144 <panic>
    80203884:	0001a517          	auipc	a0,0x1a
    80203888:	bcc50513          	addi	a0,a0,-1076 # 8021d450 <ftable>
    8020388c:	ffffd097          	auipc	ra,0xffffd
    80203890:	e8e080e7          	jalr	-370(ra) # 8020071a <release>
    80203894:	70e2                	ld	ra,56(sp)
    80203896:	7442                	ld	s0,48(sp)
    80203898:	74a2                	ld	s1,40(sp)
    8020389a:	7902                	ld	s2,32(sp)
    8020389c:	69e2                	ld	s3,24(sp)
    8020389e:	6a42                	ld	s4,16(sp)
    802038a0:	6aa2                	ld	s5,8(sp)
    802038a2:	6121                	addi	sp,sp,64
    802038a4:	8082                	ret
    802038a6:	85d2                	mv	a1,s4
    802038a8:	854e                	mv	a0,s3
    802038aa:	00000097          	auipc	ra,0x0
    802038ae:	39c080e7          	jalr	924(ra) # 80203c46 <pipeclose>
    802038b2:	b7cd                	j	80203894 <fileclose+0x96>

00000000802038b4 <filestat>:
    802038b4:	4118                	lw	a4,0(a0)
    802038b6:	4789                	li	a5,2
    802038b8:	04f71e63          	bne	a4,a5,80203914 <filestat+0x60>
    802038bc:	7159                	addi	sp,sp,-112
    802038be:	f486                	sd	ra,104(sp)
    802038c0:	f0a2                	sd	s0,96(sp)
    802038c2:	eca6                	sd	s1,88(sp)
    802038c4:	e8ca                	sd	s2,80(sp)
    802038c6:	e4ce                	sd	s3,72(sp)
    802038c8:	1880                	addi	s0,sp,112
    802038ca:	84aa                	mv	s1,a0
    802038cc:	892e                	mv	s2,a1
    802038ce:	6d08                	ld	a0,24(a0)
    802038d0:	00003097          	auipc	ra,0x3
    802038d4:	856080e7          	jalr	-1962(ra) # 80206126 <elock>
    802038d8:	f9840993          	addi	s3,s0,-104
    802038dc:	85ce                	mv	a1,s3
    802038de:	6c88                	ld	a0,24(s1)
    802038e0:	00003097          	auipc	ra,0x3
    802038e4:	a02080e7          	jalr	-1534(ra) # 802062e2 <estat>
    802038e8:	6c88                	ld	a0,24(s1)
    802038ea:	00003097          	auipc	ra,0x3
    802038ee:	872080e7          	jalr	-1934(ra) # 8020615c <eunlock>
    802038f2:	03800613          	li	a2,56
    802038f6:	85ce                	mv	a1,s3
    802038f8:	854a                	mv	a0,s2
    802038fa:	ffffe097          	auipc	ra,0xffffe
    802038fe:	a7c080e7          	jalr	-1412(ra) # 80201376 <copyout2>
    80203902:	41f5551b          	sraiw	a0,a0,0x1f
    80203906:	70a6                	ld	ra,104(sp)
    80203908:	7406                	ld	s0,96(sp)
    8020390a:	64e6                	ld	s1,88(sp)
    8020390c:	6946                	ld	s2,80(sp)
    8020390e:	69a6                	ld	s3,72(sp)
    80203910:	6165                	addi	sp,sp,112
    80203912:	8082                	ret
    80203914:	557d                	li	a0,-1
    80203916:	8082                	ret

0000000080203918 <fileread>:
    80203918:	7179                	addi	sp,sp,-48
    8020391a:	f406                	sd	ra,40(sp)
    8020391c:	f022                	sd	s0,32(sp)
    8020391e:	ec26                	sd	s1,24(sp)
    80203920:	e84a                	sd	s2,16(sp)
    80203922:	e44e                	sd	s3,8(sp)
    80203924:	1800                	addi	s0,sp,48
    80203926:	00854783          	lbu	a5,8(a0)
    8020392a:	c3d5                	beqz	a5,802039ce <fileread+0xb6>
    8020392c:	84aa                	mv	s1,a0
    8020392e:	89ae                	mv	s3,a1
    80203930:	8932                	mv	s2,a2
    80203932:	411c                	lw	a5,0(a0)
    80203934:	4709                	li	a4,2
    80203936:	06e78263          	beq	a5,a4,8020399a <fileread+0x82>
    8020393a:	470d                	li	a4,3
    8020393c:	02e78b63          	beq	a5,a4,80203972 <fileread+0x5a>
    80203940:	4705                	li	a4,1
    80203942:	00e78a63          	beq	a5,a4,80203956 <fileread+0x3e>
    80203946:	00006517          	auipc	a0,0x6
    8020394a:	20250513          	addi	a0,a0,514 # 80209b48 <digits+0x7c8>
    8020394e:	ffffc097          	auipc	ra,0xffffc
    80203952:	7f6080e7          	jalr	2038(ra) # 80200144 <panic>
    80203956:	6908                	ld	a0,16(a0)
    80203958:	00000097          	auipc	ra,0x0
    8020395c:	454080e7          	jalr	1108(ra) # 80203dac <piperead>
    80203960:	892a                	mv	s2,a0
    80203962:	854a                	mv	a0,s2
    80203964:	70a2                	ld	ra,40(sp)
    80203966:	7402                	ld	s0,32(sp)
    80203968:	64e2                	ld	s1,24(sp)
    8020396a:	6942                	ld	s2,16(sp)
    8020396c:	69a2                	ld	s3,8(sp)
    8020396e:	6145                	addi	sp,sp,48
    80203970:	8082                	ret
    80203972:	02451783          	lh	a5,36(a0)
    80203976:	03079693          	slli	a3,a5,0x30
    8020397a:	92c1                	srli	a3,a3,0x30
    8020397c:	4725                	li	a4,9
    8020397e:	04d76a63          	bltu	a4,a3,802039d2 <fileread+0xba>
    80203982:	0792                	slli	a5,a5,0x4
    80203984:	0001a717          	auipc	a4,0x1a
    80203988:	a2c70713          	addi	a4,a4,-1492 # 8021d3b0 <devsw>
    8020398c:	97ba                	add	a5,a5,a4
    8020398e:	639c                	ld	a5,0(a5)
    80203990:	c3b9                	beqz	a5,802039d6 <fileread+0xbe>
    80203992:	4505                	li	a0,1
    80203994:	9782                	jalr	a5
    80203996:	892a                	mv	s2,a0
    80203998:	b7e9                	j	80203962 <fileread+0x4a>
    8020399a:	6d08                	ld	a0,24(a0)
    8020399c:	00002097          	auipc	ra,0x2
    802039a0:	78a080e7          	jalr	1930(ra) # 80206126 <elock>
    802039a4:	874a                	mv	a4,s2
    802039a6:	5094                	lw	a3,32(s1)
    802039a8:	864e                	mv	a2,s3
    802039aa:	4585                	li	a1,1
    802039ac:	6c88                	ld	a0,24(s1)
    802039ae:	00002097          	auipc	ra,0x2
    802039b2:	e7a080e7          	jalr	-390(ra) # 80205828 <eread>
    802039b6:	892a                	mv	s2,a0
    802039b8:	00a05563          	blez	a0,802039c2 <fileread+0xaa>
    802039bc:	509c                	lw	a5,32(s1)
    802039be:	9fa9                	addw	a5,a5,a0
    802039c0:	d09c                	sw	a5,32(s1)
    802039c2:	6c88                	ld	a0,24(s1)
    802039c4:	00002097          	auipc	ra,0x2
    802039c8:	798080e7          	jalr	1944(ra) # 8020615c <eunlock>
    802039cc:	bf59                	j	80203962 <fileread+0x4a>
    802039ce:	597d                	li	s2,-1
    802039d0:	bf49                	j	80203962 <fileread+0x4a>
    802039d2:	597d                	li	s2,-1
    802039d4:	b779                	j	80203962 <fileread+0x4a>
    802039d6:	597d                	li	s2,-1
    802039d8:	b769                	j	80203962 <fileread+0x4a>

00000000802039da <filewrite>:
    802039da:	7179                	addi	sp,sp,-48
    802039dc:	f406                	sd	ra,40(sp)
    802039de:	f022                	sd	s0,32(sp)
    802039e0:	ec26                	sd	s1,24(sp)
    802039e2:	e84a                	sd	s2,16(sp)
    802039e4:	e44e                	sd	s3,8(sp)
    802039e6:	e052                	sd	s4,0(sp)
    802039e8:	1800                	addi	s0,sp,48
    802039ea:	00954783          	lbu	a5,9(a0)
    802039ee:	cbc5                	beqz	a5,80203a9e <filewrite+0xc4>
    802039f0:	84aa                	mv	s1,a0
    802039f2:	892e                	mv	s2,a1
    802039f4:	89b2                	mv	s3,a2
    802039f6:	411c                	lw	a5,0(a0)
    802039f8:	4705                	li	a4,1
    802039fa:	04e78963          	beq	a5,a4,80203a4c <filewrite+0x72>
    802039fe:	470d                	li	a4,3
    80203a00:	04e78d63          	beq	a5,a4,80203a5a <filewrite+0x80>
    80203a04:	4709                	li	a4,2
    80203a06:	08e79463          	bne	a5,a4,80203a8e <filewrite+0xb4>
    80203a0a:	6d08                	ld	a0,24(a0)
    80203a0c:	00002097          	auipc	ra,0x2
    80203a10:	71a080e7          	jalr	1818(ra) # 80206126 <elock>
    80203a14:	00098a1b          	sext.w	s4,s3
    80203a18:	8752                	mv	a4,s4
    80203a1a:	5094                	lw	a3,32(s1)
    80203a1c:	864a                	mv	a2,s2
    80203a1e:	4585                	li	a1,1
    80203a20:	6c88                	ld	a0,24(s1)
    80203a22:	00002097          	auipc	ra,0x2
    80203a26:	efe080e7          	jalr	-258(ra) # 80205920 <ewrite>
    80203a2a:	597d                	li	s2,-1
    80203a2c:	05350b63          	beq	a0,s3,80203a82 <filewrite+0xa8>
    80203a30:	6c88                	ld	a0,24(s1)
    80203a32:	00002097          	auipc	ra,0x2
    80203a36:	72a080e7          	jalr	1834(ra) # 8020615c <eunlock>
    80203a3a:	854a                	mv	a0,s2
    80203a3c:	70a2                	ld	ra,40(sp)
    80203a3e:	7402                	ld	s0,32(sp)
    80203a40:	64e2                	ld	s1,24(sp)
    80203a42:	6942                	ld	s2,16(sp)
    80203a44:	69a2                	ld	s3,8(sp)
    80203a46:	6a02                	ld	s4,0(sp)
    80203a48:	6145                	addi	sp,sp,48
    80203a4a:	8082                	ret
    80203a4c:	6908                	ld	a0,16(a0)
    80203a4e:	00000097          	auipc	ra,0x0
    80203a52:	268080e7          	jalr	616(ra) # 80203cb6 <pipewrite>
    80203a56:	892a                	mv	s2,a0
    80203a58:	b7cd                	j	80203a3a <filewrite+0x60>
    80203a5a:	02451783          	lh	a5,36(a0)
    80203a5e:	03079693          	slli	a3,a5,0x30
    80203a62:	92c1                	srli	a3,a3,0x30
    80203a64:	4725                	li	a4,9
    80203a66:	02d76e63          	bltu	a4,a3,80203aa2 <filewrite+0xc8>
    80203a6a:	0792                	slli	a5,a5,0x4
    80203a6c:	0001a717          	auipc	a4,0x1a
    80203a70:	94470713          	addi	a4,a4,-1724 # 8021d3b0 <devsw>
    80203a74:	97ba                	add	a5,a5,a4
    80203a76:	679c                	ld	a5,8(a5)
    80203a78:	c79d                	beqz	a5,80203aa6 <filewrite+0xcc>
    80203a7a:	4505                	li	a0,1
    80203a7c:	9782                	jalr	a5
    80203a7e:	892a                	mv	s2,a0
    80203a80:	bf6d                	j	80203a3a <filewrite+0x60>
    80203a82:	509c                	lw	a5,32(s1)
    80203a84:	014787bb          	addw	a5,a5,s4
    80203a88:	d09c                	sw	a5,32(s1)
    80203a8a:	894e                	mv	s2,s3
    80203a8c:	b755                	j	80203a30 <filewrite+0x56>
    80203a8e:	00006517          	auipc	a0,0x6
    80203a92:	0ca50513          	addi	a0,a0,202 # 80209b58 <digits+0x7d8>
    80203a96:	ffffc097          	auipc	ra,0xffffc
    80203a9a:	6ae080e7          	jalr	1710(ra) # 80200144 <panic>
    80203a9e:	597d                	li	s2,-1
    80203aa0:	bf69                	j	80203a3a <filewrite+0x60>
    80203aa2:	597d                	li	s2,-1
    80203aa4:	bf59                	j	80203a3a <filewrite+0x60>
    80203aa6:	597d                	li	s2,-1
    80203aa8:	bf49                	j	80203a3a <filewrite+0x60>

0000000080203aaa <dirnext>:
    80203aaa:	00854783          	lbu	a5,8(a0)
    80203aae:	cfcd                	beqz	a5,80203b68 <dirnext+0xbe>
    80203ab0:	7141                	addi	sp,sp,-496
    80203ab2:	f786                	sd	ra,488(sp)
    80203ab4:	f3a2                	sd	s0,480(sp)
    80203ab6:	efa6                	sd	s1,472(sp)
    80203ab8:	ebca                	sd	s2,464(sp)
    80203aba:	e7ce                	sd	s3,456(sp)
    80203abc:	e3d2                	sd	s4,448(sp)
    80203abe:	ff56                	sd	s5,440(sp)
    80203ac0:	1b80                	addi	s0,sp,496
    80203ac2:	84aa                	mv	s1,a0
    80203ac4:	8aae                	mv	s5,a1
    80203ac6:	6d18                	ld	a4,24(a0)
    80203ac8:	10074783          	lbu	a5,256(a4)
    80203acc:	8bc1                	andi	a5,a5,16
    80203ace:	557d                	li	a0,-1
    80203ad0:	eb91                	bnez	a5,80203ae4 <dirnext+0x3a>
    80203ad2:	70be                	ld	ra,488(sp)
    80203ad4:	741e                	ld	s0,480(sp)
    80203ad6:	64fe                	ld	s1,472(sp)
    80203ad8:	695e                	ld	s2,464(sp)
    80203ada:	69be                	ld	s3,456(sp)
    80203adc:	6a1e                	ld	s4,448(sp)
    80203ade:	7afa                	ld	s5,440(sp)
    80203ae0:	617d                	addi	sp,sp,496
    80203ae2:	8082                	ret
    80203ae4:	e0042e23          	sw	zero,-484(s0)
    80203ae8:	853a                	mv	a0,a4
    80203aea:	00002097          	auipc	ra,0x2
    80203aee:	63c080e7          	jalr	1596(ra) # 80206126 <elock>
    80203af2:	e1c40a13          	addi	s4,s0,-484
    80203af6:	e5840993          	addi	s3,s0,-424
    80203afa:	a801                	j	80203b0a <dirnext+0x60>
    80203afc:	e1c42783          	lw	a5,-484(s0)
    80203b00:	0057979b          	slliw	a5,a5,0x5
    80203b04:	5098                	lw	a4,32(s1)
    80203b06:	9fb9                	addw	a5,a5,a4
    80203b08:	d09c                	sw	a5,32(s1)
    80203b0a:	86d2                	mv	a3,s4
    80203b0c:	5090                	lw	a2,32(s1)
    80203b0e:	85ce                	mv	a1,s3
    80203b10:	6c88                	ld	a0,24(s1)
    80203b12:	00003097          	auipc	ra,0x3
    80203b16:	818080e7          	jalr	-2024(ra) # 8020632a <enext>
    80203b1a:	892a                	mv	s2,a0
    80203b1c:	d165                	beqz	a0,80203afc <dirnext+0x52>
    80203b1e:	6c88                	ld	a0,24(s1)
    80203b20:	00002097          	auipc	ra,0x2
    80203b24:	63c080e7          	jalr	1596(ra) # 8020615c <eunlock>
    80203b28:	57fd                	li	a5,-1
    80203b2a:	4501                	li	a0,0
    80203b2c:	faf903e3          	beq	s2,a5,80203ad2 <dirnext+0x28>
    80203b30:	e1c42783          	lw	a5,-484(s0)
    80203b34:	0057979b          	slliw	a5,a5,0x5
    80203b38:	5098                	lw	a4,32(s1)
    80203b3a:	9fb9                	addw	a5,a5,a4
    80203b3c:	d09c                	sw	a5,32(s1)
    80203b3e:	e2040493          	addi	s1,s0,-480
    80203b42:	85a6                	mv	a1,s1
    80203b44:	e5840513          	addi	a0,s0,-424
    80203b48:	00002097          	auipc	ra,0x2
    80203b4c:	79a080e7          	jalr	1946(ra) # 802062e2 <estat>
    80203b50:	03800613          	li	a2,56
    80203b54:	85a6                	mv	a1,s1
    80203b56:	8556                	mv	a0,s5
    80203b58:	ffffe097          	auipc	ra,0xffffe
    80203b5c:	81e080e7          	jalr	-2018(ra) # 80201376 <copyout2>
    80203b60:	957d                	srai	a0,a0,0x3f
    80203b62:	00156513          	ori	a0,a0,1
    80203b66:	b7b5                	j	80203ad2 <dirnext+0x28>
    80203b68:	557d                	li	a0,-1
    80203b6a:	8082                	ret

0000000080203b6c <pipealloc>:
    80203b6c:	7179                	addi	sp,sp,-48
    80203b6e:	f406                	sd	ra,40(sp)
    80203b70:	f022                	sd	s0,32(sp)
    80203b72:	ec26                	sd	s1,24(sp)
    80203b74:	e84a                	sd	s2,16(sp)
    80203b76:	e44e                	sd	s3,8(sp)
    80203b78:	e052                	sd	s4,0(sp)
    80203b7a:	1800                	addi	s0,sp,48
    80203b7c:	84aa                	mv	s1,a0
    80203b7e:	8a2e                	mv	s4,a1
    80203b80:	0005b023          	sd	zero,0(a1)
    80203b84:	00053023          	sd	zero,0(a0)
    80203b88:	00000097          	auipc	ra,0x0
    80203b8c:	bba080e7          	jalr	-1094(ra) # 80203742 <filealloc>
    80203b90:	e088                	sd	a0,0(s1)
    80203b92:	c551                	beqz	a0,80203c1e <pipealloc+0xb2>
    80203b94:	00000097          	auipc	ra,0x0
    80203b98:	bae080e7          	jalr	-1106(ra) # 80203742 <filealloc>
    80203b9c:	00aa3023          	sd	a0,0(s4)
    80203ba0:	c92d                	beqz	a0,80203c12 <pipealloc+0xa6>
    80203ba2:	ffffd097          	auipc	ra,0xffffd
    80203ba6:	9b8080e7          	jalr	-1608(ra) # 8020055a <kalloc>
    80203baa:	892a                	mv	s2,a0
    80203bac:	c125                	beqz	a0,80203c0c <pipealloc+0xa0>
    80203bae:	4985                	li	s3,1
    80203bb0:	23352023          	sw	s3,544(a0)
    80203bb4:	23352223          	sw	s3,548(a0)
    80203bb8:	20052e23          	sw	zero,540(a0)
    80203bbc:	20052c23          	sw	zero,536(a0)
    80203bc0:	00006597          	auipc	a1,0x6
    80203bc4:	e1058593          	addi	a1,a1,-496 # 802099d0 <digits+0x650>
    80203bc8:	ffffd097          	auipc	ra,0xffffd
    80203bcc:	aba080e7          	jalr	-1350(ra) # 80200682 <initlock>
    80203bd0:	609c                	ld	a5,0(s1)
    80203bd2:	0137a023          	sw	s3,0(a5)
    80203bd6:	609c                	ld	a5,0(s1)
    80203bd8:	01378423          	sb	s3,8(a5)
    80203bdc:	609c                	ld	a5,0(s1)
    80203bde:	000784a3          	sb	zero,9(a5)
    80203be2:	609c                	ld	a5,0(s1)
    80203be4:	0127b823          	sd	s2,16(a5)
    80203be8:	000a3783          	ld	a5,0(s4)
    80203bec:	0137a023          	sw	s3,0(a5)
    80203bf0:	000a3783          	ld	a5,0(s4)
    80203bf4:	00078423          	sb	zero,8(a5)
    80203bf8:	000a3783          	ld	a5,0(s4)
    80203bfc:	013784a3          	sb	s3,9(a5)
    80203c00:	000a3783          	ld	a5,0(s4)
    80203c04:	0127b823          	sd	s2,16(a5)
    80203c08:	4501                	li	a0,0
    80203c0a:	a025                	j	80203c32 <pipealloc+0xc6>
    80203c0c:	6088                	ld	a0,0(s1)
    80203c0e:	e501                	bnez	a0,80203c16 <pipealloc+0xaa>
    80203c10:	a039                	j	80203c1e <pipealloc+0xb2>
    80203c12:	6088                	ld	a0,0(s1)
    80203c14:	c51d                	beqz	a0,80203c42 <pipealloc+0xd6>
    80203c16:	00000097          	auipc	ra,0x0
    80203c1a:	be8080e7          	jalr	-1048(ra) # 802037fe <fileclose>
    80203c1e:	000a3783          	ld	a5,0(s4)
    80203c22:	557d                	li	a0,-1
    80203c24:	c799                	beqz	a5,80203c32 <pipealloc+0xc6>
    80203c26:	853e                	mv	a0,a5
    80203c28:	00000097          	auipc	ra,0x0
    80203c2c:	bd6080e7          	jalr	-1066(ra) # 802037fe <fileclose>
    80203c30:	557d                	li	a0,-1
    80203c32:	70a2                	ld	ra,40(sp)
    80203c34:	7402                	ld	s0,32(sp)
    80203c36:	64e2                	ld	s1,24(sp)
    80203c38:	6942                	ld	s2,16(sp)
    80203c3a:	69a2                	ld	s3,8(sp)
    80203c3c:	6a02                	ld	s4,0(sp)
    80203c3e:	6145                	addi	sp,sp,48
    80203c40:	8082                	ret
    80203c42:	557d                	li	a0,-1
    80203c44:	b7fd                	j	80203c32 <pipealloc+0xc6>

0000000080203c46 <pipeclose>:
    80203c46:	1101                	addi	sp,sp,-32
    80203c48:	ec06                	sd	ra,24(sp)
    80203c4a:	e822                	sd	s0,16(sp)
    80203c4c:	e426                	sd	s1,8(sp)
    80203c4e:	e04a                	sd	s2,0(sp)
    80203c50:	1000                	addi	s0,sp,32
    80203c52:	84aa                	mv	s1,a0
    80203c54:	892e                	mv	s2,a1
    80203c56:	ffffd097          	auipc	ra,0xffffd
    80203c5a:	a70080e7          	jalr	-1424(ra) # 802006c6 <acquire>
    80203c5e:	02090d63          	beqz	s2,80203c98 <pipeclose+0x52>
    80203c62:	2204a223          	sw	zero,548(s1)
    80203c66:	21848513          	addi	a0,s1,536
    80203c6a:	ffffe097          	auipc	ra,0xffffe
    80203c6e:	7d2080e7          	jalr	2002(ra) # 8020243c <wakeup>
    80203c72:	2204b783          	ld	a5,544(s1)
    80203c76:	eb95                	bnez	a5,80203caa <pipeclose+0x64>
    80203c78:	8526                	mv	a0,s1
    80203c7a:	ffffd097          	auipc	ra,0xffffd
    80203c7e:	aa0080e7          	jalr	-1376(ra) # 8020071a <release>
    80203c82:	8526                	mv	a0,s1
    80203c84:	ffffc097          	auipc	ra,0xffffc
    80203c88:	7bc080e7          	jalr	1980(ra) # 80200440 <kfree>
    80203c8c:	60e2                	ld	ra,24(sp)
    80203c8e:	6442                	ld	s0,16(sp)
    80203c90:	64a2                	ld	s1,8(sp)
    80203c92:	6902                	ld	s2,0(sp)
    80203c94:	6105                	addi	sp,sp,32
    80203c96:	8082                	ret
    80203c98:	2204a023          	sw	zero,544(s1)
    80203c9c:	21c48513          	addi	a0,s1,540
    80203ca0:	ffffe097          	auipc	ra,0xffffe
    80203ca4:	79c080e7          	jalr	1948(ra) # 8020243c <wakeup>
    80203ca8:	b7e9                	j	80203c72 <pipeclose+0x2c>
    80203caa:	8526                	mv	a0,s1
    80203cac:	ffffd097          	auipc	ra,0xffffd
    80203cb0:	a6e080e7          	jalr	-1426(ra) # 8020071a <release>
    80203cb4:	bfe1                	j	80203c8c <pipeclose+0x46>

0000000080203cb6 <pipewrite>:
    80203cb6:	711d                	addi	sp,sp,-96
    80203cb8:	ec86                	sd	ra,88(sp)
    80203cba:	e8a2                	sd	s0,80(sp)
    80203cbc:	e4a6                	sd	s1,72(sp)
    80203cbe:	e0ca                	sd	s2,64(sp)
    80203cc0:	fc4e                	sd	s3,56(sp)
    80203cc2:	f852                	sd	s4,48(sp)
    80203cc4:	f456                	sd	s5,40(sp)
    80203cc6:	f05a                	sd	s6,32(sp)
    80203cc8:	ec5e                	sd	s7,24(sp)
    80203cca:	1080                	addi	s0,sp,96
    80203ccc:	84aa                	mv	s1,a0
    80203cce:	8b2e                	mv	s6,a1
    80203cd0:	8ab2                	mv	s5,a2
    80203cd2:	ffffe097          	auipc	ra,0xffffe
    80203cd6:	d6e080e7          	jalr	-658(ra) # 80201a40 <myproc>
    80203cda:	892a                	mv	s2,a0
    80203cdc:	8526                	mv	a0,s1
    80203cde:	ffffd097          	auipc	ra,0xffffd
    80203ce2:	9e8080e7          	jalr	-1560(ra) # 802006c6 <acquire>
    80203ce6:	4b81                	li	s7,0
    80203ce8:	21848a13          	addi	s4,s1,536
    80203cec:	21c48993          	addi	s3,s1,540
    80203cf0:	09505063          	blez	s5,80203d70 <pipewrite+0xba>
    80203cf4:	2184a783          	lw	a5,536(s1)
    80203cf8:	21c4a703          	lw	a4,540(s1)
    80203cfc:	2007879b          	addiw	a5,a5,512
    80203d00:	02f71b63          	bne	a4,a5,80203d36 <pipewrite+0x80>
    80203d04:	2204a783          	lw	a5,544(s1)
    80203d08:	c3c1                	beqz	a5,80203d88 <pipewrite+0xd2>
    80203d0a:	03092783          	lw	a5,48(s2)
    80203d0e:	efad                	bnez	a5,80203d88 <pipewrite+0xd2>
    80203d10:	8552                	mv	a0,s4
    80203d12:	ffffe097          	auipc	ra,0xffffe
    80203d16:	72a080e7          	jalr	1834(ra) # 8020243c <wakeup>
    80203d1a:	85a6                	mv	a1,s1
    80203d1c:	854e                	mv	a0,s3
    80203d1e:	ffffe097          	auipc	ra,0xffffe
    80203d22:	5a2080e7          	jalr	1442(ra) # 802022c0 <sleep>
    80203d26:	2184a783          	lw	a5,536(s1)
    80203d2a:	21c4a703          	lw	a4,540(s1)
    80203d2e:	2007879b          	addiw	a5,a5,512
    80203d32:	fcf709e3          	beq	a4,a5,80203d04 <pipewrite+0x4e>
    80203d36:	4605                	li	a2,1
    80203d38:	85da                	mv	a1,s6
    80203d3a:	faf40513          	addi	a0,s0,-81
    80203d3e:	ffffd097          	auipc	ra,0xffffd
    80203d42:	718080e7          	jalr	1816(ra) # 80201456 <copyin2>
    80203d46:	57fd                	li	a5,-1
    80203d48:	02f50463          	beq	a0,a5,80203d70 <pipewrite+0xba>
    80203d4c:	21c4a783          	lw	a5,540(s1)
    80203d50:	0017871b          	addiw	a4,a5,1
    80203d54:	20e4ae23          	sw	a4,540(s1)
    80203d58:	1ff7f793          	andi	a5,a5,511
    80203d5c:	97a6                	add	a5,a5,s1
    80203d5e:	faf44703          	lbu	a4,-81(s0)
    80203d62:	00e78c23          	sb	a4,24(a5)
    80203d66:	2b85                	addiw	s7,s7,1
    80203d68:	0b05                	addi	s6,s6,1
    80203d6a:	f97a95e3          	bne	s5,s7,80203cf4 <pipewrite+0x3e>
    80203d6e:	8bd6                	mv	s7,s5
    80203d70:	21848513          	addi	a0,s1,536
    80203d74:	ffffe097          	auipc	ra,0xffffe
    80203d78:	6c8080e7          	jalr	1736(ra) # 8020243c <wakeup>
    80203d7c:	8526                	mv	a0,s1
    80203d7e:	ffffd097          	auipc	ra,0xffffd
    80203d82:	99c080e7          	jalr	-1636(ra) # 8020071a <release>
    80203d86:	a039                	j	80203d94 <pipewrite+0xde>
    80203d88:	8526                	mv	a0,s1
    80203d8a:	ffffd097          	auipc	ra,0xffffd
    80203d8e:	990080e7          	jalr	-1648(ra) # 8020071a <release>
    80203d92:	5bfd                	li	s7,-1
    80203d94:	855e                	mv	a0,s7
    80203d96:	60e6                	ld	ra,88(sp)
    80203d98:	6446                	ld	s0,80(sp)
    80203d9a:	64a6                	ld	s1,72(sp)
    80203d9c:	6906                	ld	s2,64(sp)
    80203d9e:	79e2                	ld	s3,56(sp)
    80203da0:	7a42                	ld	s4,48(sp)
    80203da2:	7aa2                	ld	s5,40(sp)
    80203da4:	7b02                	ld	s6,32(sp)
    80203da6:	6be2                	ld	s7,24(sp)
    80203da8:	6125                	addi	sp,sp,96
    80203daa:	8082                	ret

0000000080203dac <piperead>:
    80203dac:	715d                	addi	sp,sp,-80
    80203dae:	e486                	sd	ra,72(sp)
    80203db0:	e0a2                	sd	s0,64(sp)
    80203db2:	fc26                	sd	s1,56(sp)
    80203db4:	f84a                	sd	s2,48(sp)
    80203db6:	f44e                	sd	s3,40(sp)
    80203db8:	f052                	sd	s4,32(sp)
    80203dba:	ec56                	sd	s5,24(sp)
    80203dbc:	e85a                	sd	s6,16(sp)
    80203dbe:	0880                	addi	s0,sp,80
    80203dc0:	84aa                	mv	s1,a0
    80203dc2:	892e                	mv	s2,a1
    80203dc4:	8a32                	mv	s4,a2
    80203dc6:	ffffe097          	auipc	ra,0xffffe
    80203dca:	c7a080e7          	jalr	-902(ra) # 80201a40 <myproc>
    80203dce:	89aa                	mv	s3,a0
    80203dd0:	8526                	mv	a0,s1
    80203dd2:	ffffd097          	auipc	ra,0xffffd
    80203dd6:	8f4080e7          	jalr	-1804(ra) # 802006c6 <acquire>
    80203dda:	2184a703          	lw	a4,536(s1)
    80203dde:	21c4a783          	lw	a5,540(s1)
    80203de2:	21848a93          	addi	s5,s1,536
    80203de6:	02f71463          	bne	a4,a5,80203e0e <piperead+0x62>
    80203dea:	2244a783          	lw	a5,548(s1)
    80203dee:	c385                	beqz	a5,80203e0e <piperead+0x62>
    80203df0:	0309a783          	lw	a5,48(s3)
    80203df4:	ebc1                	bnez	a5,80203e84 <piperead+0xd8>
    80203df6:	85a6                	mv	a1,s1
    80203df8:	8556                	mv	a0,s5
    80203dfa:	ffffe097          	auipc	ra,0xffffe
    80203dfe:	4c6080e7          	jalr	1222(ra) # 802022c0 <sleep>
    80203e02:	2184a703          	lw	a4,536(s1)
    80203e06:	21c4a783          	lw	a5,540(s1)
    80203e0a:	fef700e3          	beq	a4,a5,80203dea <piperead+0x3e>
    80203e0e:	4981                	li	s3,0
    80203e10:	fbf40b13          	addi	s6,s0,-65
    80203e14:	5afd                	li	s5,-1
    80203e16:	05405163          	blez	s4,80203e58 <piperead+0xac>
    80203e1a:	2184a783          	lw	a5,536(s1)
    80203e1e:	21c4a703          	lw	a4,540(s1)
    80203e22:	02f70b63          	beq	a4,a5,80203e58 <piperead+0xac>
    80203e26:	0017871b          	addiw	a4,a5,1
    80203e2a:	20e4ac23          	sw	a4,536(s1)
    80203e2e:	1ff7f793          	andi	a5,a5,511
    80203e32:	97a6                	add	a5,a5,s1
    80203e34:	0187c783          	lbu	a5,24(a5)
    80203e38:	faf40fa3          	sb	a5,-65(s0)
    80203e3c:	4605                	li	a2,1
    80203e3e:	85da                	mv	a1,s6
    80203e40:	854a                	mv	a0,s2
    80203e42:	ffffd097          	auipc	ra,0xffffd
    80203e46:	534080e7          	jalr	1332(ra) # 80201376 <copyout2>
    80203e4a:	01550763          	beq	a0,s5,80203e58 <piperead+0xac>
    80203e4e:	2985                	addiw	s3,s3,1
    80203e50:	0905                	addi	s2,s2,1
    80203e52:	fd3a14e3          	bne	s4,s3,80203e1a <piperead+0x6e>
    80203e56:	89d2                	mv	s3,s4
    80203e58:	21c48513          	addi	a0,s1,540
    80203e5c:	ffffe097          	auipc	ra,0xffffe
    80203e60:	5e0080e7          	jalr	1504(ra) # 8020243c <wakeup>
    80203e64:	8526                	mv	a0,s1
    80203e66:	ffffd097          	auipc	ra,0xffffd
    80203e6a:	8b4080e7          	jalr	-1868(ra) # 8020071a <release>
    80203e6e:	854e                	mv	a0,s3
    80203e70:	60a6                	ld	ra,72(sp)
    80203e72:	6406                	ld	s0,64(sp)
    80203e74:	74e2                	ld	s1,56(sp)
    80203e76:	7942                	ld	s2,48(sp)
    80203e78:	79a2                	ld	s3,40(sp)
    80203e7a:	7a02                	ld	s4,32(sp)
    80203e7c:	6ae2                	ld	s5,24(sp)
    80203e7e:	6b42                	ld	s6,16(sp)
    80203e80:	6161                	addi	sp,sp,80
    80203e82:	8082                	ret
    80203e84:	8526                	mv	a0,s1
    80203e86:	ffffd097          	auipc	ra,0xffffd
    80203e8a:	894080e7          	jalr	-1900(ra) # 8020071a <release>
    80203e8e:	59fd                	li	s3,-1
    80203e90:	bff9                	j	80203e6e <piperead+0xc2>

0000000080203e92 <exec>:
    80203e92:	de010113          	addi	sp,sp,-544
    80203e96:	20113c23          	sd	ra,536(sp)
    80203e9a:	20813823          	sd	s0,528(sp)
    80203e9e:	20913423          	sd	s1,520(sp)
    80203ea2:	21213023          	sd	s2,512(sp)
    80203ea6:	ffce                	sd	s3,504(sp)
    80203ea8:	fbd2                	sd	s4,496(sp)
    80203eaa:	f7d6                	sd	s5,488(sp)
    80203eac:	f3da                	sd	s6,480(sp)
    80203eae:	efde                	sd	s7,472(sp)
    80203eb0:	ebe2                	sd	s8,464(sp)
    80203eb2:	e7e6                	sd	s9,456(sp)
    80203eb4:	e3ea                	sd	s10,448(sp)
    80203eb6:	ff6e                	sd	s11,440(sp)
    80203eb8:	1400                	addi	s0,sp,544
    80203eba:	892a                	mv	s2,a0
    80203ebc:	dea43423          	sd	a0,-536(s0)
    80203ec0:	deb43c23          	sd	a1,-520(s0)
    80203ec4:	ffffe097          	auipc	ra,0xffffe
    80203ec8:	b7c080e7          	jalr	-1156(ra) # 80201a40 <myproc>
    80203ecc:	84aa                	mv	s1,a0
    80203ece:	ffffc097          	auipc	ra,0xffffc
    80203ed2:	68c080e7          	jalr	1676(ra) # 8020055a <kalloc>
    80203ed6:	3a050b63          	beqz	a0,8020428c <exec+0x3fa>
    80203eda:	8b2a                	mv	s6,a0
    80203edc:	6605                	lui	a2,0x1
    80203ede:	6cac                	ld	a1,88(s1)
    80203ee0:	ffffd097          	auipc	ra,0xffffd
    80203ee4:	8de080e7          	jalr	-1826(ra) # 802007be <memmove>
    80203ee8:	000b3023          	sd	zero,0(s6)
    80203eec:	000b3423          	sd	zero,8(s6)
    80203ef0:	854a                	mv	a0,s2
    80203ef2:	00003097          	auipc	ra,0x3
    80203ef6:	9de080e7          	jalr	-1570(ra) # 802068d0 <ename>
    80203efa:	89aa                	mv	s3,a0
    80203efc:	38050d63          	beqz	a0,80204296 <exec+0x404>
    80203f00:	00002097          	auipc	ra,0x2
    80203f04:	226080e7          	jalr	550(ra) # 80206126 <elock>
    80203f08:	04000713          	li	a4,64
    80203f0c:	4681                	li	a3,0
    80203f0e:	e4840613          	addi	a2,s0,-440
    80203f12:	4581                	li	a1,0
    80203f14:	854e                	mv	a0,s3
    80203f16:	00002097          	auipc	ra,0x2
    80203f1a:	912080e7          	jalr	-1774(ra) # 80205828 <eread>
    80203f1e:	04000793          	li	a5,64
    80203f22:	00f51a63          	bne	a0,a5,80203f36 <exec+0xa4>
    80203f26:	e4842703          	lw	a4,-440(s0)
    80203f2a:	464c47b7          	lui	a5,0x464c4
    80203f2e:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    80203f32:	00f70963          	beq	a4,a5,80203f44 <exec+0xb2>
    80203f36:	4581                	li	a1,0
    80203f38:	855a                	mv	a0,s6
    80203f3a:	ffffd097          	auipc	ra,0xffffd
    80203f3e:	73c080e7          	jalr	1852(ra) # 80201676 <kvmfree>
    80203f42:	accd                	j	80204234 <exec+0x3a2>
    80203f44:	8526                	mv	a0,s1
    80203f46:	ffffe097          	auipc	ra,0xffffe
    80203f4a:	bde080e7          	jalr	-1058(ra) # 80201b24 <proc_pagetable>
    80203f4e:	8baa                	mv	s7,a0
    80203f50:	d17d                	beqz	a0,80203f36 <exec+0xa4>
    80203f52:	e6842783          	lw	a5,-408(s0)
    80203f56:	e8045703          	lhu	a4,-384(s0)
    80203f5a:	10070663          	beqz	a4,80204066 <exec+0x1d4>
    80203f5e:	4481                	li	s1,0
    80203f60:	4d81                	li	s11,0
    80203f62:	e1040713          	addi	a4,s0,-496
    80203f66:	dee43823          	sd	a4,-528(s0)
    80203f6a:	6d05                	lui	s10,0x1
    80203f6c:	fffd0713          	addi	a4,s10,-1 # fff <_entry-0x801ff001>
    80203f70:	dee43023          	sd	a4,-544(s0)
    80203f74:	6a85                	lui	s5,0x1
    80203f76:	a885                	j	80203fe6 <exec+0x154>
    80203f78:	00006517          	auipc	a0,0x6
    80203f7c:	bf050513          	addi	a0,a0,-1040 # 80209b68 <digits+0x7e8>
    80203f80:	ffffc097          	auipc	ra,0xffffc
    80203f84:	1c4080e7          	jalr	452(ra) # 80200144 <panic>
    80203f88:	2481                	sext.w	s1,s1
    80203f8a:	8726                	mv	a4,s1
    80203f8c:	012c86bb          	addw	a3,s9,s2
    80203f90:	4581                	li	a1,0
    80203f92:	854e                	mv	a0,s3
    80203f94:	00002097          	auipc	ra,0x2
    80203f98:	894080e7          	jalr	-1900(ra) # 80205828 <eread>
    80203f9c:	2501                	sext.w	a0,a0
    80203f9e:	26a49b63          	bne	s1,a0,80204214 <exec+0x382>
    80203fa2:	012a893b          	addw	s2,s5,s2
    80203fa6:	03497563          	bgeu	s2,s4,80203fd0 <exec+0x13e>
    80203faa:	02091593          	slli	a1,s2,0x20
    80203fae:	9181                	srli	a1,a1,0x20
    80203fb0:	95e2                	add	a1,a1,s8
    80203fb2:	855e                	mv	a0,s7
    80203fb4:	ffffd097          	auipc	ra,0xffffd
    80203fb8:	bf8080e7          	jalr	-1032(ra) # 80200bac <walkaddr>
    80203fbc:	862a                	mv	a2,a0
    80203fbe:	dd4d                	beqz	a0,80203f78 <exec+0xe6>
    80203fc0:	412a04bb          	subw	s1,s4,s2
    80203fc4:	0004879b          	sext.w	a5,s1
    80203fc8:	fcfd70e3          	bgeu	s10,a5,80203f88 <exec+0xf6>
    80203fcc:	84d6                	mv	s1,s5
    80203fce:	bf6d                	j	80203f88 <exec+0xf6>
    80203fd0:	e0043483          	ld	s1,-512(s0)
    80203fd4:	2d85                	addiw	s11,s11,1 # 1001 <_entry-0x801fefff>
    80203fd6:	e0843783          	ld	a5,-504(s0)
    80203fda:	0387879b          	addiw	a5,a5,56
    80203fde:	e8045703          	lhu	a4,-384(s0)
    80203fe2:	08edd363          	bge	s11,a4,80204068 <exec+0x1d6>
    80203fe6:	2781                	sext.w	a5,a5
    80203fe8:	e0f43423          	sd	a5,-504(s0)
    80203fec:	03800713          	li	a4,56
    80203ff0:	86be                	mv	a3,a5
    80203ff2:	df043603          	ld	a2,-528(s0)
    80203ff6:	4581                	li	a1,0
    80203ff8:	854e                	mv	a0,s3
    80203ffa:	00002097          	auipc	ra,0x2
    80203ffe:	82e080e7          	jalr	-2002(ra) # 80205828 <eread>
    80204002:	03800793          	li	a5,56
    80204006:	20f51563          	bne	a0,a5,80204210 <exec+0x37e>
    8020400a:	e1042783          	lw	a5,-496(s0)
    8020400e:	4705                	li	a4,1
    80204010:	fce792e3          	bne	a5,a4,80203fd4 <exec+0x142>
    80204014:	e3843683          	ld	a3,-456(s0)
    80204018:	e3043783          	ld	a5,-464(s0)
    8020401c:	24f6eb63          	bltu	a3,a5,80204272 <exec+0x3e0>
    80204020:	e2043783          	ld	a5,-480(s0)
    80204024:	96be                	add	a3,a3,a5
    80204026:	24f6e963          	bltu	a3,a5,80204278 <exec+0x3e6>
    8020402a:	8626                	mv	a2,s1
    8020402c:	85da                	mv	a1,s6
    8020402e:	855e                	mv	a0,s7
    80204030:	ffffd097          	auipc	ra,0xffffd
    80204034:	fd8080e7          	jalr	-40(ra) # 80201008 <uvmalloc>
    80204038:	e0a43023          	sd	a0,-512(s0)
    8020403c:	24050163          	beqz	a0,8020427e <exec+0x3ec>
    80204040:	e2043c03          	ld	s8,-480(s0)
    80204044:	de043783          	ld	a5,-544(s0)
    80204048:	00fc77b3          	and	a5,s8,a5
    8020404c:	1c079463          	bnez	a5,80204214 <exec+0x382>
    80204050:	e1842c83          	lw	s9,-488(s0)
    80204054:	e3042a03          	lw	s4,-464(s0)
    80204058:	000a0463          	beqz	s4,80204060 <exec+0x1ce>
    8020405c:	4901                	li	s2,0
    8020405e:	b7b1                	j	80203faa <exec+0x118>
    80204060:	e0043483          	ld	s1,-512(s0)
    80204064:	bf85                	j	80203fd4 <exec+0x142>
    80204066:	4481                	li	s1,0
    80204068:	854e                	mv	a0,s3
    8020406a:	00002097          	auipc	ra,0x2
    8020406e:	0f2080e7          	jalr	242(ra) # 8020615c <eunlock>
    80204072:	854e                	mv	a0,s3
    80204074:	00002097          	auipc	ra,0x2
    80204078:	136080e7          	jalr	310(ra) # 802061aa <eput>
    8020407c:	ffffe097          	auipc	ra,0xffffe
    80204080:	9c4080e7          	jalr	-1596(ra) # 80201a40 <myproc>
    80204084:	8aaa                	mv	s5,a0
    80204086:	04853d03          	ld	s10,72(a0)
    8020408a:	6985                	lui	s3,0x1
    8020408c:	19fd                	addi	s3,s3,-1 # fff <_entry-0x801ff001>
    8020408e:	99a6                	add	s3,s3,s1
    80204090:	77fd                	lui	a5,0xfffff
    80204092:	00f9f9b3          	and	s3,s3,a5
    80204096:	6689                	lui	a3,0x2
    80204098:	96ce                	add	a3,a3,s3
    8020409a:	864e                	mv	a2,s3
    8020409c:	85da                	mv	a1,s6
    8020409e:	855e                	mv	a0,s7
    802040a0:	ffffd097          	auipc	ra,0xffffd
    802040a4:	f68080e7          	jalr	-152(ra) # 80201008 <uvmalloc>
    802040a8:	892a                	mv	s2,a0
    802040aa:	e0a43023          	sd	a0,-512(s0)
    802040ae:	e509                	bnez	a0,802040b8 <exec+0x226>
    802040b0:	e1343023          	sd	s3,-512(s0)
    802040b4:	4981                	li	s3,0
    802040b6:	aab9                	j	80204214 <exec+0x382>
    802040b8:	75f9                	lui	a1,0xffffe
    802040ba:	95aa                	add	a1,a1,a0
    802040bc:	855e                	mv	a0,s7
    802040be:	ffffd097          	auipc	ra,0xffffd
    802040c2:	1fa080e7          	jalr	506(ra) # 802012b8 <uvmclear>
    802040c6:	7c7d                	lui	s8,0xfffff
    802040c8:	9c4a                	add	s8,s8,s2
    802040ca:	df843783          	ld	a5,-520(s0)
    802040ce:	6388                	ld	a0,0(a5)
    802040d0:	c52d                	beqz	a0,8020413a <exec+0x2a8>
    802040d2:	e8840993          	addi	s3,s0,-376
    802040d6:	f8840c93          	addi	s9,s0,-120
    802040da:	4481                	li	s1,0
    802040dc:	ffffd097          	auipc	ra,0xffffd
    802040e0:	808080e7          	jalr	-2040(ra) # 802008e4 <strlen>
    802040e4:	0015079b          	addiw	a5,a0,1
    802040e8:	40f907b3          	sub	a5,s2,a5
    802040ec:	ff07f913          	andi	s2,a5,-16
    802040f0:	19896a63          	bltu	s2,s8,80204284 <exec+0x3f2>
    802040f4:	df843d83          	ld	s11,-520(s0)
    802040f8:	000dba03          	ld	s4,0(s11)
    802040fc:	8552                	mv	a0,s4
    802040fe:	ffffc097          	auipc	ra,0xffffc
    80204102:	7e6080e7          	jalr	2022(ra) # 802008e4 <strlen>
    80204106:	0015069b          	addiw	a3,a0,1
    8020410a:	8652                	mv	a2,s4
    8020410c:	85ca                	mv	a1,s2
    8020410e:	855e                	mv	a0,s7
    80204110:	ffffd097          	auipc	ra,0xffffd
    80204114:	1da080e7          	jalr	474(ra) # 802012ea <copyout>
    80204118:	16054863          	bltz	a0,80204288 <exec+0x3f6>
    8020411c:	0129b023          	sd	s2,0(s3)
    80204120:	0485                	addi	s1,s1,1
    80204122:	008d8793          	addi	a5,s11,8
    80204126:	def43c23          	sd	a5,-520(s0)
    8020412a:	008db503          	ld	a0,8(s11)
    8020412e:	c909                	beqz	a0,80204140 <exec+0x2ae>
    80204130:	09a1                	addi	s3,s3,8
    80204132:	fb9995e3          	bne	s3,s9,802040dc <exec+0x24a>
    80204136:	4981                	li	s3,0
    80204138:	a8f1                	j	80204214 <exec+0x382>
    8020413a:	e0043903          	ld	s2,-512(s0)
    8020413e:	4481                	li	s1,0
    80204140:	00349793          	slli	a5,s1,0x3
    80204144:	f9078793          	addi	a5,a5,-112 # ffffffffffffef90 <ebss_clear+0xffffffff7fdd8f90>
    80204148:	97a2                	add	a5,a5,s0
    8020414a:	ee07bc23          	sd	zero,-264(a5)
    8020414e:	00148693          	addi	a3,s1,1
    80204152:	068e                	slli	a3,a3,0x3
    80204154:	40d90933          	sub	s2,s2,a3
    80204158:	ff097913          	andi	s2,s2,-16
    8020415c:	e0043983          	ld	s3,-512(s0)
    80204160:	f58968e3          	bltu	s2,s8,802040b0 <exec+0x21e>
    80204164:	e8840613          	addi	a2,s0,-376
    80204168:	85ca                	mv	a1,s2
    8020416a:	855e                	mv	a0,s7
    8020416c:	ffffd097          	auipc	ra,0xffffd
    80204170:	17e080e7          	jalr	382(ra) # 802012ea <copyout>
    80204174:	10054e63          	bltz	a0,80204290 <exec+0x3fe>
    80204178:	060ab783          	ld	a5,96(s5) # 1060 <_entry-0x801fefa0>
    8020417c:	0727bc23          	sd	s2,120(a5)
    80204180:	de843783          	ld	a5,-536(s0)
    80204184:	0007c703          	lbu	a4,0(a5)
    80204188:	cf11                	beqz	a4,802041a4 <exec+0x312>
    8020418a:	0785                	addi	a5,a5,1
    8020418c:	02f00693          	li	a3,47
    80204190:	a039                	j	8020419e <exec+0x30c>
    80204192:	def43423          	sd	a5,-536(s0)
    80204196:	0785                	addi	a5,a5,1
    80204198:	fff7c703          	lbu	a4,-1(a5)
    8020419c:	c701                	beqz	a4,802041a4 <exec+0x312>
    8020419e:	fed71ce3          	bne	a4,a3,80204196 <exec+0x304>
    802041a2:	bfc5                	j	80204192 <exec+0x300>
    802041a4:	4641                	li	a2,16
    802041a6:	de843583          	ld	a1,-536(s0)
    802041aa:	160a8513          	addi	a0,s5,352
    802041ae:	ffffc097          	auipc	ra,0xffffc
    802041b2:	704080e7          	jalr	1796(ra) # 802008b2 <safestrcpy>
    802041b6:	050ab503          	ld	a0,80(s5)
    802041ba:	058ab983          	ld	s3,88(s5)
    802041be:	057ab823          	sd	s7,80(s5)
    802041c2:	056abc23          	sd	s6,88(s5)
    802041c6:	e0043783          	ld	a5,-512(s0)
    802041ca:	04fab423          	sd	a5,72(s5)
    802041ce:	060ab783          	ld	a5,96(s5)
    802041d2:	e6043703          	ld	a4,-416(s0)
    802041d6:	ef98                	sd	a4,24(a5)
    802041d8:	060ab783          	ld	a5,96(s5)
    802041dc:	0327b823          	sd	s2,48(a5)
    802041e0:	85ea                	mv	a1,s10
    802041e2:	ffffe097          	auipc	ra,0xffffe
    802041e6:	9de080e7          	jalr	-1570(ra) # 80201bc0 <proc_freepagetable>
    802041ea:	058ab783          	ld	a5,88(s5)
    802041ee:	83b1                	srli	a5,a5,0xc
    802041f0:	577d                	li	a4,-1
    802041f2:	177e                	slli	a4,a4,0x3f
    802041f4:	8fd9                	or	a5,a5,a4
    802041f6:	18079073          	csrw	satp,a5
    802041fa:	12000073          	sfence.vma
    802041fe:	4581                	li	a1,0
    80204200:	854e                	mv	a0,s3
    80204202:	ffffd097          	auipc	ra,0xffffd
    80204206:	474080e7          	jalr	1140(ra) # 80201676 <kvmfree>
    8020420a:	0004851b          	sext.w	a0,s1
    8020420e:	a835                	j	8020424a <exec+0x3b8>
    80204210:	e0943023          	sd	s1,-512(s0)
    80204214:	e0043583          	ld	a1,-512(s0)
    80204218:	855e                	mv	a0,s7
    8020421a:	ffffe097          	auipc	ra,0xffffe
    8020421e:	9a6080e7          	jalr	-1626(ra) # 80201bc0 <proc_freepagetable>
    80204222:	4581                	li	a1,0
    80204224:	855a                	mv	a0,s6
    80204226:	ffffd097          	auipc	ra,0xffffd
    8020422a:	450080e7          	jalr	1104(ra) # 80201676 <kvmfree>
    8020422e:	557d                	li	a0,-1
    80204230:	00098d63          	beqz	s3,8020424a <exec+0x3b8>
    80204234:	854e                	mv	a0,s3
    80204236:	00002097          	auipc	ra,0x2
    8020423a:	f26080e7          	jalr	-218(ra) # 8020615c <eunlock>
    8020423e:	854e                	mv	a0,s3
    80204240:	00002097          	auipc	ra,0x2
    80204244:	f6a080e7          	jalr	-150(ra) # 802061aa <eput>
    80204248:	557d                	li	a0,-1
    8020424a:	21813083          	ld	ra,536(sp)
    8020424e:	21013403          	ld	s0,528(sp)
    80204252:	20813483          	ld	s1,520(sp)
    80204256:	20013903          	ld	s2,512(sp)
    8020425a:	79fe                	ld	s3,504(sp)
    8020425c:	7a5e                	ld	s4,496(sp)
    8020425e:	7abe                	ld	s5,488(sp)
    80204260:	7b1e                	ld	s6,480(sp)
    80204262:	6bfe                	ld	s7,472(sp)
    80204264:	6c5e                	ld	s8,464(sp)
    80204266:	6cbe                	ld	s9,456(sp)
    80204268:	6d1e                	ld	s10,448(sp)
    8020426a:	7dfa                	ld	s11,440(sp)
    8020426c:	22010113          	addi	sp,sp,544
    80204270:	8082                	ret
    80204272:	e0943023          	sd	s1,-512(s0)
    80204276:	bf79                	j	80204214 <exec+0x382>
    80204278:	e0943023          	sd	s1,-512(s0)
    8020427c:	bf61                	j	80204214 <exec+0x382>
    8020427e:	e0943023          	sd	s1,-512(s0)
    80204282:	bf49                	j	80204214 <exec+0x382>
    80204284:	4981                	li	s3,0
    80204286:	b779                	j	80204214 <exec+0x382>
    80204288:	4981                	li	s3,0
    8020428a:	b769                	j	80204214 <exec+0x382>
    8020428c:	557d                	li	a0,-1
    8020428e:	bf75                	j	8020424a <exec+0x3b8>
    80204290:	e0043983          	ld	s3,-512(s0)
    80204294:	bd31                	j	802040b0 <exec+0x21e>
    80204296:	4581                	li	a1,0
    80204298:	855a                	mv	a0,s6
    8020429a:	ffffd097          	auipc	ra,0xffffd
    8020429e:	3dc080e7          	jalr	988(ra) # 80201676 <kvmfree>
    802042a2:	557d                	li	a0,-1
    802042a4:	b75d                	j	8020424a <exec+0x3b8>

00000000802042a6 <argfd>:
    802042a6:	7179                	addi	sp,sp,-48
    802042a8:	f406                	sd	ra,40(sp)
    802042aa:	f022                	sd	s0,32(sp)
    802042ac:	ec26                	sd	s1,24(sp)
    802042ae:	e84a                	sd	s2,16(sp)
    802042b0:	1800                	addi	s0,sp,48
    802042b2:	892e                	mv	s2,a1
    802042b4:	84b2                	mv	s1,a2
    802042b6:	fdc40593          	addi	a1,s0,-36
    802042ba:	fffff097          	auipc	ra,0xfffff
    802042be:	b0c080e7          	jalr	-1268(ra) # 80202dc6 <argint>
    802042c2:	04054063          	bltz	a0,80204302 <argfd+0x5c>
    802042c6:	fdc42703          	lw	a4,-36(s0)
    802042ca:	47bd                	li	a5,15
    802042cc:	02e7ed63          	bltu	a5,a4,80204306 <argfd+0x60>
    802042d0:	ffffd097          	auipc	ra,0xffffd
    802042d4:	770080e7          	jalr	1904(ra) # 80201a40 <myproc>
    802042d8:	fdc42703          	lw	a4,-36(s0)
    802042dc:	01a70793          	addi	a5,a4,26
    802042e0:	078e                	slli	a5,a5,0x3
    802042e2:	953e                	add	a0,a0,a5
    802042e4:	651c                	ld	a5,8(a0)
    802042e6:	c395                	beqz	a5,8020430a <argfd+0x64>
    802042e8:	00090463          	beqz	s2,802042f0 <argfd+0x4a>
    802042ec:	00e92023          	sw	a4,0(s2)
    802042f0:	4501                	li	a0,0
    802042f2:	c091                	beqz	s1,802042f6 <argfd+0x50>
    802042f4:	e09c                	sd	a5,0(s1)
    802042f6:	70a2                	ld	ra,40(sp)
    802042f8:	7402                	ld	s0,32(sp)
    802042fa:	64e2                	ld	s1,24(sp)
    802042fc:	6942                	ld	s2,16(sp)
    802042fe:	6145                	addi	sp,sp,48
    80204300:	8082                	ret
    80204302:	557d                	li	a0,-1
    80204304:	bfcd                	j	802042f6 <argfd+0x50>
    80204306:	557d                	li	a0,-1
    80204308:	b7fd                	j	802042f6 <argfd+0x50>
    8020430a:	557d                	li	a0,-1
    8020430c:	b7ed                	j	802042f6 <argfd+0x50>

000000008020430e <fdalloc>:
    8020430e:	1101                	addi	sp,sp,-32
    80204310:	ec06                	sd	ra,24(sp)
    80204312:	e822                	sd	s0,16(sp)
    80204314:	e426                	sd	s1,8(sp)
    80204316:	1000                	addi	s0,sp,32
    80204318:	84aa                	mv	s1,a0
    8020431a:	ffffd097          	auipc	ra,0xffffd
    8020431e:	726080e7          	jalr	1830(ra) # 80201a40 <myproc>
    80204322:	862a                	mv	a2,a0
    80204324:	0d850793          	addi	a5,a0,216
    80204328:	4501                	li	a0,0
    8020432a:	46c1                	li	a3,16
    8020432c:	6398                	ld	a4,0(a5)
    8020432e:	cb19                	beqz	a4,80204344 <fdalloc+0x36>
    80204330:	2505                	addiw	a0,a0,1
    80204332:	07a1                	addi	a5,a5,8
    80204334:	fed51ce3          	bne	a0,a3,8020432c <fdalloc+0x1e>
    80204338:	557d                	li	a0,-1
    8020433a:	60e2                	ld	ra,24(sp)
    8020433c:	6442                	ld	s0,16(sp)
    8020433e:	64a2                	ld	s1,8(sp)
    80204340:	6105                	addi	sp,sp,32
    80204342:	8082                	ret
    80204344:	01a50793          	addi	a5,a0,26
    80204348:	078e                	slli	a5,a5,0x3
    8020434a:	963e                	add	a2,a2,a5
    8020434c:	e604                	sd	s1,8(a2)
    8020434e:	b7f5                	j	8020433a <fdalloc+0x2c>

0000000080204350 <create>:
    80204350:	7169                	addi	sp,sp,-304
    80204352:	f606                	sd	ra,296(sp)
    80204354:	f222                	sd	s0,288(sp)
    80204356:	ee26                	sd	s1,280(sp)
    80204358:	ea4a                	sd	s2,272(sp)
    8020435a:	e64e                	sd	s3,264(sp)
    8020435c:	1a00                	addi	s0,sp,304
    8020435e:	89ae                	mv	s3,a1
    80204360:	ed040593          	addi	a1,s0,-304
    80204364:	00002097          	auipc	ra,0x2
    80204368:	58a080e7          	jalr	1418(ra) # 802068ee <enameparent>
    8020436c:	84aa                	mv	s1,a0
    8020436e:	c54d                	beqz	a0,80204418 <create+0xc8>
    80204370:	00002097          	auipc	ra,0x2
    80204374:	db6080e7          	jalr	-586(ra) # 80206126 <elock>
    80204378:	fff98613          	addi	a2,s3,-1
    8020437c:	00163613          	seqz	a2,a2
    80204380:	0046161b          	slliw	a2,a2,0x4
    80204384:	ed040593          	addi	a1,s0,-304
    80204388:	8526                	mv	a0,s1
    8020438a:	00002097          	auipc	ra,0x2
    8020438e:	288080e7          	jalr	648(ra) # 80206612 <ealloc>
    80204392:	892a                	mv	s2,a0
    80204394:	c131                	beqz	a0,802043d8 <create+0x88>
    80204396:	4785                	li	a5,1
    80204398:	04f98b63          	beq	s3,a5,802043ee <create+0x9e>
    8020439c:	4789                	li	a5,2
    8020439e:	00f99663          	bne	s3,a5,802043aa <create+0x5a>
    802043a2:	10054783          	lbu	a5,256(a0)
    802043a6:	8bc1                	andi	a5,a5,16
    802043a8:	e7b9                	bnez	a5,802043f6 <create+0xa6>
    802043aa:	8526                	mv	a0,s1
    802043ac:	00002097          	auipc	ra,0x2
    802043b0:	db0080e7          	jalr	-592(ra) # 8020615c <eunlock>
    802043b4:	8526                	mv	a0,s1
    802043b6:	00002097          	auipc	ra,0x2
    802043ba:	df4080e7          	jalr	-524(ra) # 802061aa <eput>
    802043be:	854a                	mv	a0,s2
    802043c0:	00002097          	auipc	ra,0x2
    802043c4:	d66080e7          	jalr	-666(ra) # 80206126 <elock>
    802043c8:	854a                	mv	a0,s2
    802043ca:	70b2                	ld	ra,296(sp)
    802043cc:	7412                	ld	s0,288(sp)
    802043ce:	64f2                	ld	s1,280(sp)
    802043d0:	6952                	ld	s2,272(sp)
    802043d2:	69b2                	ld	s3,264(sp)
    802043d4:	6155                	addi	sp,sp,304
    802043d6:	8082                	ret
    802043d8:	8526                	mv	a0,s1
    802043da:	00002097          	auipc	ra,0x2
    802043de:	d82080e7          	jalr	-638(ra) # 8020615c <eunlock>
    802043e2:	8526                	mv	a0,s1
    802043e4:	00002097          	auipc	ra,0x2
    802043e8:	dc6080e7          	jalr	-570(ra) # 802061aa <eput>
    802043ec:	bff1                	j	802043c8 <create+0x78>
    802043ee:	10054783          	lbu	a5,256(a0)
    802043f2:	8bc1                	andi	a5,a5,16
    802043f4:	fbdd                	bnez	a5,802043aa <create+0x5a>
    802043f6:	8526                	mv	a0,s1
    802043f8:	00002097          	auipc	ra,0x2
    802043fc:	d64080e7          	jalr	-668(ra) # 8020615c <eunlock>
    80204400:	854a                	mv	a0,s2
    80204402:	00002097          	auipc	ra,0x2
    80204406:	da8080e7          	jalr	-600(ra) # 802061aa <eput>
    8020440a:	8526                	mv	a0,s1
    8020440c:	00002097          	auipc	ra,0x2
    80204410:	d9e080e7          	jalr	-610(ra) # 802061aa <eput>
    80204414:	4901                	li	s2,0
    80204416:	bf4d                	j	802043c8 <create+0x78>
    80204418:	892a                	mv	s2,a0
    8020441a:	b77d                	j	802043c8 <create+0x78>

000000008020441c <sys_dup>:
    8020441c:	7179                	addi	sp,sp,-48
    8020441e:	f406                	sd	ra,40(sp)
    80204420:	f022                	sd	s0,32(sp)
    80204422:	ec26                	sd	s1,24(sp)
    80204424:	e84a                	sd	s2,16(sp)
    80204426:	1800                	addi	s0,sp,48
    80204428:	fd840613          	addi	a2,s0,-40
    8020442c:	4581                	li	a1,0
    8020442e:	4501                	li	a0,0
    80204430:	00000097          	auipc	ra,0x0
    80204434:	e76080e7          	jalr	-394(ra) # 802042a6 <argfd>
    80204438:	57fd                	li	a5,-1
    8020443a:	02054363          	bltz	a0,80204460 <sys_dup+0x44>
    8020443e:	fd843903          	ld	s2,-40(s0)
    80204442:	854a                	mv	a0,s2
    80204444:	00000097          	auipc	ra,0x0
    80204448:	eca080e7          	jalr	-310(ra) # 8020430e <fdalloc>
    8020444c:	84aa                	mv	s1,a0
    8020444e:	57fd                	li	a5,-1
    80204450:	00054863          	bltz	a0,80204460 <sys_dup+0x44>
    80204454:	854a                	mv	a0,s2
    80204456:	fffff097          	auipc	ra,0xfffff
    8020445a:	356080e7          	jalr	854(ra) # 802037ac <filedup>
    8020445e:	87a6                	mv	a5,s1
    80204460:	853e                	mv	a0,a5
    80204462:	70a2                	ld	ra,40(sp)
    80204464:	7402                	ld	s0,32(sp)
    80204466:	64e2                	ld	s1,24(sp)
    80204468:	6942                	ld	s2,16(sp)
    8020446a:	6145                	addi	sp,sp,48
    8020446c:	8082                	ret

000000008020446e <sys_read>:
    8020446e:	7179                	addi	sp,sp,-48
    80204470:	f406                	sd	ra,40(sp)
    80204472:	f022                	sd	s0,32(sp)
    80204474:	1800                	addi	s0,sp,48
    80204476:	fe840613          	addi	a2,s0,-24
    8020447a:	4581                	li	a1,0
    8020447c:	4501                	li	a0,0
    8020447e:	00000097          	auipc	ra,0x0
    80204482:	e28080e7          	jalr	-472(ra) # 802042a6 <argfd>
    80204486:	57fd                	li	a5,-1
    80204488:	04054163          	bltz	a0,802044ca <sys_read+0x5c>
    8020448c:	fe440593          	addi	a1,s0,-28
    80204490:	4509                	li	a0,2
    80204492:	fffff097          	auipc	ra,0xfffff
    80204496:	934080e7          	jalr	-1740(ra) # 80202dc6 <argint>
    8020449a:	57fd                	li	a5,-1
    8020449c:	02054763          	bltz	a0,802044ca <sys_read+0x5c>
    802044a0:	fd840593          	addi	a1,s0,-40
    802044a4:	4505                	li	a0,1
    802044a6:	fffff097          	auipc	ra,0xfffff
    802044aa:	982080e7          	jalr	-1662(ra) # 80202e28 <argaddr>
    802044ae:	57fd                	li	a5,-1
    802044b0:	00054d63          	bltz	a0,802044ca <sys_read+0x5c>
    802044b4:	fe442603          	lw	a2,-28(s0)
    802044b8:	fd843583          	ld	a1,-40(s0)
    802044bc:	fe843503          	ld	a0,-24(s0)
    802044c0:	fffff097          	auipc	ra,0xfffff
    802044c4:	458080e7          	jalr	1112(ra) # 80203918 <fileread>
    802044c8:	87aa                	mv	a5,a0
    802044ca:	853e                	mv	a0,a5
    802044cc:	70a2                	ld	ra,40(sp)
    802044ce:	7402                	ld	s0,32(sp)
    802044d0:	6145                	addi	sp,sp,48
    802044d2:	8082                	ret

00000000802044d4 <sys_write>:
    802044d4:	7179                	addi	sp,sp,-48
    802044d6:	f406                	sd	ra,40(sp)
    802044d8:	f022                	sd	s0,32(sp)
    802044da:	1800                	addi	s0,sp,48
    802044dc:	fe840613          	addi	a2,s0,-24
    802044e0:	4581                	li	a1,0
    802044e2:	4501                	li	a0,0
    802044e4:	00000097          	auipc	ra,0x0
    802044e8:	dc2080e7          	jalr	-574(ra) # 802042a6 <argfd>
    802044ec:	57fd                	li	a5,-1
    802044ee:	04054163          	bltz	a0,80204530 <sys_write+0x5c>
    802044f2:	fe440593          	addi	a1,s0,-28
    802044f6:	4509                	li	a0,2
    802044f8:	fffff097          	auipc	ra,0xfffff
    802044fc:	8ce080e7          	jalr	-1842(ra) # 80202dc6 <argint>
    80204500:	57fd                	li	a5,-1
    80204502:	02054763          	bltz	a0,80204530 <sys_write+0x5c>
    80204506:	fd840593          	addi	a1,s0,-40
    8020450a:	4505                	li	a0,1
    8020450c:	fffff097          	auipc	ra,0xfffff
    80204510:	91c080e7          	jalr	-1764(ra) # 80202e28 <argaddr>
    80204514:	57fd                	li	a5,-1
    80204516:	00054d63          	bltz	a0,80204530 <sys_write+0x5c>
    8020451a:	fe442603          	lw	a2,-28(s0)
    8020451e:	fd843583          	ld	a1,-40(s0)
    80204522:	fe843503          	ld	a0,-24(s0)
    80204526:	fffff097          	auipc	ra,0xfffff
    8020452a:	4b4080e7          	jalr	1204(ra) # 802039da <filewrite>
    8020452e:	87aa                	mv	a5,a0
    80204530:	853e                	mv	a0,a5
    80204532:	70a2                	ld	ra,40(sp)
    80204534:	7402                	ld	s0,32(sp)
    80204536:	6145                	addi	sp,sp,48
    80204538:	8082                	ret

000000008020453a <sys_close>:
    8020453a:	1101                	addi	sp,sp,-32
    8020453c:	ec06                	sd	ra,24(sp)
    8020453e:	e822                	sd	s0,16(sp)
    80204540:	1000                	addi	s0,sp,32
    80204542:	fe040613          	addi	a2,s0,-32
    80204546:	fec40593          	addi	a1,s0,-20
    8020454a:	4501                	li	a0,0
    8020454c:	00000097          	auipc	ra,0x0
    80204550:	d5a080e7          	jalr	-678(ra) # 802042a6 <argfd>
    80204554:	57fd                	li	a5,-1
    80204556:	02054463          	bltz	a0,8020457e <sys_close+0x44>
    8020455a:	ffffd097          	auipc	ra,0xffffd
    8020455e:	4e6080e7          	jalr	1254(ra) # 80201a40 <myproc>
    80204562:	fec42783          	lw	a5,-20(s0)
    80204566:	07e9                	addi	a5,a5,26
    80204568:	078e                	slli	a5,a5,0x3
    8020456a:	953e                	add	a0,a0,a5
    8020456c:	00053423          	sd	zero,8(a0)
    80204570:	fe043503          	ld	a0,-32(s0)
    80204574:	fffff097          	auipc	ra,0xfffff
    80204578:	28a080e7          	jalr	650(ra) # 802037fe <fileclose>
    8020457c:	4781                	li	a5,0
    8020457e:	853e                	mv	a0,a5
    80204580:	60e2                	ld	ra,24(sp)
    80204582:	6442                	ld	s0,16(sp)
    80204584:	6105                	addi	sp,sp,32
    80204586:	8082                	ret

0000000080204588 <sys_fstat>:
    80204588:	1101                	addi	sp,sp,-32
    8020458a:	ec06                	sd	ra,24(sp)
    8020458c:	e822                	sd	s0,16(sp)
    8020458e:	1000                	addi	s0,sp,32
    80204590:	fe840613          	addi	a2,s0,-24
    80204594:	4581                	li	a1,0
    80204596:	4501                	li	a0,0
    80204598:	00000097          	auipc	ra,0x0
    8020459c:	d0e080e7          	jalr	-754(ra) # 802042a6 <argfd>
    802045a0:	57fd                	li	a5,-1
    802045a2:	02054563          	bltz	a0,802045cc <sys_fstat+0x44>
    802045a6:	fe040593          	addi	a1,s0,-32
    802045aa:	4505                	li	a0,1
    802045ac:	fffff097          	auipc	ra,0xfffff
    802045b0:	87c080e7          	jalr	-1924(ra) # 80202e28 <argaddr>
    802045b4:	57fd                	li	a5,-1
    802045b6:	00054b63          	bltz	a0,802045cc <sys_fstat+0x44>
    802045ba:	fe043583          	ld	a1,-32(s0)
    802045be:	fe843503          	ld	a0,-24(s0)
    802045c2:	fffff097          	auipc	ra,0xfffff
    802045c6:	2f2080e7          	jalr	754(ra) # 802038b4 <filestat>
    802045ca:	87aa                	mv	a5,a0
    802045cc:	853e                	mv	a0,a5
    802045ce:	60e2                	ld	ra,24(sp)
    802045d0:	6442                	ld	s0,16(sp)
    802045d2:	6105                	addi	sp,sp,32
    802045d4:	8082                	ret

00000000802045d6 <sys_open>:
    802045d6:	7129                	addi	sp,sp,-320
    802045d8:	fe06                	sd	ra,312(sp)
    802045da:	fa22                	sd	s0,304(sp)
    802045dc:	f626                	sd	s1,296(sp)
    802045de:	f24a                	sd	s2,288(sp)
    802045e0:	ee4e                	sd	s3,280(sp)
    802045e2:	0280                	addi	s0,sp,320
    802045e4:	10400613          	li	a2,260
    802045e8:	ec840593          	addi	a1,s0,-312
    802045ec:	4501                	li	a0,0
    802045ee:	fffff097          	auipc	ra,0xfffff
    802045f2:	85c080e7          	jalr	-1956(ra) # 80202e4a <argstr>
    802045f6:	87aa                	mv	a5,a0
    802045f8:	557d                	li	a0,-1
    802045fa:	0807ce63          	bltz	a5,80204696 <sys_open+0xc0>
    802045fe:	ec440593          	addi	a1,s0,-316
    80204602:	4505                	li	a0,1
    80204604:	ffffe097          	auipc	ra,0xffffe
    80204608:	7c2080e7          	jalr	1986(ra) # 80202dc6 <argint>
    8020460c:	10054263          	bltz	a0,80204710 <sys_open+0x13a>
    80204610:	ec442603          	lw	a2,-316(s0)
    80204614:	20067793          	andi	a5,a2,512
    80204618:	c7d1                	beqz	a5,802046a4 <sys_open+0xce>
    8020461a:	4589                	li	a1,2
    8020461c:	ec840513          	addi	a0,s0,-312
    80204620:	00000097          	auipc	ra,0x0
    80204624:	d30080e7          	jalr	-720(ra) # 80204350 <create>
    80204628:	892a                	mv	s2,a0
    8020462a:	c56d                	beqz	a0,80204714 <sys_open+0x13e>
    8020462c:	fffff097          	auipc	ra,0xfffff
    80204630:	116080e7          	jalr	278(ra) # 80203742 <filealloc>
    80204634:	89aa                	mv	s3,a0
    80204636:	c95d                	beqz	a0,802046ec <sys_open+0x116>
    80204638:	00000097          	auipc	ra,0x0
    8020463c:	cd6080e7          	jalr	-810(ra) # 8020430e <fdalloc>
    80204640:	84aa                	mv	s1,a0
    80204642:	0a054063          	bltz	a0,802046e2 <sys_open+0x10c>
    80204646:	10094783          	lbu	a5,256(s2)
    8020464a:	8bc1                	andi	a5,a5,16
    8020464c:	e791                	bnez	a5,80204658 <sys_open+0x82>
    8020464e:	ec442783          	lw	a5,-316(s0)
    80204652:	4007f793          	andi	a5,a5,1024
    80204656:	e7dd                	bnez	a5,80204704 <sys_open+0x12e>
    80204658:	4789                	li	a5,2
    8020465a:	00f9a023          	sw	a5,0(s3)
    8020465e:	ec442783          	lw	a5,-316(s0)
    80204662:	0047f693          	andi	a3,a5,4
    80204666:	4701                	li	a4,0
    80204668:	c299                	beqz	a3,8020466e <sys_open+0x98>
    8020466a:	10892703          	lw	a4,264(s2)
    8020466e:	02e9a023          	sw	a4,32(s3)
    80204672:	0129bc23          	sd	s2,24(s3)
    80204676:	0017c713          	xori	a4,a5,1
    8020467a:	8b05                	andi	a4,a4,1
    8020467c:	00e98423          	sb	a4,8(s3)
    80204680:	8b8d                	andi	a5,a5,3
    80204682:	00f037b3          	snez	a5,a5
    80204686:	00f984a3          	sb	a5,9(s3)
    8020468a:	854a                	mv	a0,s2
    8020468c:	00002097          	auipc	ra,0x2
    80204690:	ad0080e7          	jalr	-1328(ra) # 8020615c <eunlock>
    80204694:	8526                	mv	a0,s1
    80204696:	70f2                	ld	ra,312(sp)
    80204698:	7452                	ld	s0,304(sp)
    8020469a:	74b2                	ld	s1,296(sp)
    8020469c:	7912                	ld	s2,288(sp)
    8020469e:	69f2                	ld	s3,280(sp)
    802046a0:	6131                	addi	sp,sp,320
    802046a2:	8082                	ret
    802046a4:	ec840513          	addi	a0,s0,-312
    802046a8:	00002097          	auipc	ra,0x2
    802046ac:	228080e7          	jalr	552(ra) # 802068d0 <ename>
    802046b0:	892a                	mv	s2,a0
    802046b2:	c13d                	beqz	a0,80204718 <sys_open+0x142>
    802046b4:	00002097          	auipc	ra,0x2
    802046b8:	a72080e7          	jalr	-1422(ra) # 80206126 <elock>
    802046bc:	10094783          	lbu	a5,256(s2)
    802046c0:	8bc1                	andi	a5,a5,16
    802046c2:	d7ad                	beqz	a5,8020462c <sys_open+0x56>
    802046c4:	ec442783          	lw	a5,-316(s0)
    802046c8:	d3b5                	beqz	a5,8020462c <sys_open+0x56>
    802046ca:	854a                	mv	a0,s2
    802046cc:	00002097          	auipc	ra,0x2
    802046d0:	a90080e7          	jalr	-1392(ra) # 8020615c <eunlock>
    802046d4:	854a                	mv	a0,s2
    802046d6:	00002097          	auipc	ra,0x2
    802046da:	ad4080e7          	jalr	-1324(ra) # 802061aa <eput>
    802046de:	557d                	li	a0,-1
    802046e0:	bf5d                	j	80204696 <sys_open+0xc0>
    802046e2:	854e                	mv	a0,s3
    802046e4:	fffff097          	auipc	ra,0xfffff
    802046e8:	11a080e7          	jalr	282(ra) # 802037fe <fileclose>
    802046ec:	854a                	mv	a0,s2
    802046ee:	00002097          	auipc	ra,0x2
    802046f2:	a6e080e7          	jalr	-1426(ra) # 8020615c <eunlock>
    802046f6:	854a                	mv	a0,s2
    802046f8:	00002097          	auipc	ra,0x2
    802046fc:	ab2080e7          	jalr	-1358(ra) # 802061aa <eput>
    80204700:	557d                	li	a0,-1
    80204702:	bf51                	j	80204696 <sys_open+0xc0>
    80204704:	854a                	mv	a0,s2
    80204706:	00002097          	auipc	ra,0x2
    8020470a:	9b6080e7          	jalr	-1610(ra) # 802060bc <etrunc>
    8020470e:	b7a9                	j	80204658 <sys_open+0x82>
    80204710:	557d                	li	a0,-1
    80204712:	b751                	j	80204696 <sys_open+0xc0>
    80204714:	557d                	li	a0,-1
    80204716:	b741                	j	80204696 <sys_open+0xc0>
    80204718:	557d                	li	a0,-1
    8020471a:	bfb5                	j	80204696 <sys_open+0xc0>

000000008020471c <sys_mkdir>:
    8020471c:	7169                	addi	sp,sp,-304
    8020471e:	f606                	sd	ra,296(sp)
    80204720:	f222                	sd	s0,288(sp)
    80204722:	ee26                	sd	s1,280(sp)
    80204724:	1a00                	addi	s0,sp,304
    80204726:	10400613          	li	a2,260
    8020472a:	ed840593          	addi	a1,s0,-296
    8020472e:	4501                	li	a0,0
    80204730:	ffffe097          	auipc	ra,0xffffe
    80204734:	71a080e7          	jalr	1818(ra) # 80202e4a <argstr>
    80204738:	57fd                	li	a5,-1
    8020473a:	02054663          	bltz	a0,80204766 <sys_mkdir+0x4a>
    8020473e:	4601                	li	a2,0
    80204740:	4585                	li	a1,1
    80204742:	ed840513          	addi	a0,s0,-296
    80204746:	00000097          	auipc	ra,0x0
    8020474a:	c0a080e7          	jalr	-1014(ra) # 80204350 <create>
    8020474e:	84aa                	mv	s1,a0
    80204750:	c10d                	beqz	a0,80204772 <sys_mkdir+0x56>
    80204752:	00002097          	auipc	ra,0x2
    80204756:	a0a080e7          	jalr	-1526(ra) # 8020615c <eunlock>
    8020475a:	8526                	mv	a0,s1
    8020475c:	00002097          	auipc	ra,0x2
    80204760:	a4e080e7          	jalr	-1458(ra) # 802061aa <eput>
    80204764:	4781                	li	a5,0
    80204766:	853e                	mv	a0,a5
    80204768:	70b2                	ld	ra,296(sp)
    8020476a:	7412                	ld	s0,288(sp)
    8020476c:	64f2                	ld	s1,280(sp)
    8020476e:	6155                	addi	sp,sp,304
    80204770:	8082                	ret
    80204772:	57fd                	li	a5,-1
    80204774:	bfcd                	j	80204766 <sys_mkdir+0x4a>

0000000080204776 <sys_chdir>:
    80204776:	7169                	addi	sp,sp,-304
    80204778:	f606                	sd	ra,296(sp)
    8020477a:	f222                	sd	s0,288(sp)
    8020477c:	ee26                	sd	s1,280(sp)
    8020477e:	ea4a                	sd	s2,272(sp)
    80204780:	1a00                	addi	s0,sp,304
    80204782:	ffffd097          	auipc	ra,0xffffd
    80204786:	2be080e7          	jalr	702(ra) # 80201a40 <myproc>
    8020478a:	892a                	mv	s2,a0
    8020478c:	10400613          	li	a2,260
    80204790:	ed840593          	addi	a1,s0,-296
    80204794:	4501                	li	a0,0
    80204796:	ffffe097          	auipc	ra,0xffffe
    8020479a:	6b4080e7          	jalr	1716(ra) # 80202e4a <argstr>
    8020479e:	57fd                	li	a5,-1
    802047a0:	04054063          	bltz	a0,802047e0 <sys_chdir+0x6a>
    802047a4:	ed840513          	addi	a0,s0,-296
    802047a8:	00002097          	auipc	ra,0x2
    802047ac:	128080e7          	jalr	296(ra) # 802068d0 <ename>
    802047b0:	84aa                	mv	s1,a0
    802047b2:	c931                	beqz	a0,80204806 <sys_chdir+0x90>
    802047b4:	00002097          	auipc	ra,0x2
    802047b8:	972080e7          	jalr	-1678(ra) # 80206126 <elock>
    802047bc:	1004c783          	lbu	a5,256(s1)
    802047c0:	8bc1                	andi	a5,a5,16
    802047c2:	c795                	beqz	a5,802047ee <sys_chdir+0x78>
    802047c4:	8526                	mv	a0,s1
    802047c6:	00002097          	auipc	ra,0x2
    802047ca:	996080e7          	jalr	-1642(ra) # 8020615c <eunlock>
    802047ce:	15893503          	ld	a0,344(s2)
    802047d2:	00002097          	auipc	ra,0x2
    802047d6:	9d8080e7          	jalr	-1576(ra) # 802061aa <eput>
    802047da:	14993c23          	sd	s1,344(s2)
    802047de:	4781                	li	a5,0
    802047e0:	853e                	mv	a0,a5
    802047e2:	70b2                	ld	ra,296(sp)
    802047e4:	7412                	ld	s0,288(sp)
    802047e6:	64f2                	ld	s1,280(sp)
    802047e8:	6952                	ld	s2,272(sp)
    802047ea:	6155                	addi	sp,sp,304
    802047ec:	8082                	ret
    802047ee:	8526                	mv	a0,s1
    802047f0:	00002097          	auipc	ra,0x2
    802047f4:	96c080e7          	jalr	-1684(ra) # 8020615c <eunlock>
    802047f8:	8526                	mv	a0,s1
    802047fa:	00002097          	auipc	ra,0x2
    802047fe:	9b0080e7          	jalr	-1616(ra) # 802061aa <eput>
    80204802:	57fd                	li	a5,-1
    80204804:	bff1                	j	802047e0 <sys_chdir+0x6a>
    80204806:	57fd                	li	a5,-1
    80204808:	bfe1                	j	802047e0 <sys_chdir+0x6a>

000000008020480a <sys_pipe>:
    8020480a:	7139                	addi	sp,sp,-64
    8020480c:	fc06                	sd	ra,56(sp)
    8020480e:	f822                	sd	s0,48(sp)
    80204810:	f426                	sd	s1,40(sp)
    80204812:	0080                	addi	s0,sp,64
    80204814:	ffffd097          	auipc	ra,0xffffd
    80204818:	22c080e7          	jalr	556(ra) # 80201a40 <myproc>
    8020481c:	84aa                	mv	s1,a0
    8020481e:	fd840593          	addi	a1,s0,-40
    80204822:	4501                	li	a0,0
    80204824:	ffffe097          	auipc	ra,0xffffe
    80204828:	604080e7          	jalr	1540(ra) # 80202e28 <argaddr>
    8020482c:	57fd                	li	a5,-1
    8020482e:	0c054e63          	bltz	a0,8020490a <sys_pipe+0x100>
    80204832:	fc840593          	addi	a1,s0,-56
    80204836:	fd040513          	addi	a0,s0,-48
    8020483a:	fffff097          	auipc	ra,0xfffff
    8020483e:	332080e7          	jalr	818(ra) # 80203b6c <pipealloc>
    80204842:	57fd                	li	a5,-1
    80204844:	0c054363          	bltz	a0,8020490a <sys_pipe+0x100>
    80204848:	fcf42223          	sw	a5,-60(s0)
    8020484c:	fd043503          	ld	a0,-48(s0)
    80204850:	00000097          	auipc	ra,0x0
    80204854:	abe080e7          	jalr	-1346(ra) # 8020430e <fdalloc>
    80204858:	fca42223          	sw	a0,-60(s0)
    8020485c:	08054a63          	bltz	a0,802048f0 <sys_pipe+0xe6>
    80204860:	fc843503          	ld	a0,-56(s0)
    80204864:	00000097          	auipc	ra,0x0
    80204868:	aaa080e7          	jalr	-1366(ra) # 8020430e <fdalloc>
    8020486c:	fca42023          	sw	a0,-64(s0)
    80204870:	06054763          	bltz	a0,802048de <sys_pipe+0xd4>
    80204874:	4611                	li	a2,4
    80204876:	fc440593          	addi	a1,s0,-60
    8020487a:	fd843503          	ld	a0,-40(s0)
    8020487e:	ffffd097          	auipc	ra,0xffffd
    80204882:	af8080e7          	jalr	-1288(ra) # 80201376 <copyout2>
    80204886:	00054f63          	bltz	a0,802048a4 <sys_pipe+0x9a>
    8020488a:	4611                	li	a2,4
    8020488c:	fc040593          	addi	a1,s0,-64
    80204890:	fd843503          	ld	a0,-40(s0)
    80204894:	0511                	addi	a0,a0,4
    80204896:	ffffd097          	auipc	ra,0xffffd
    8020489a:	ae0080e7          	jalr	-1312(ra) # 80201376 <copyout2>
    8020489e:	4781                	li	a5,0
    802048a0:	06055563          	bgez	a0,8020490a <sys_pipe+0x100>
    802048a4:	fc442783          	lw	a5,-60(s0)
    802048a8:	07e9                	addi	a5,a5,26
    802048aa:	078e                	slli	a5,a5,0x3
    802048ac:	97a6                	add	a5,a5,s1
    802048ae:	0007b423          	sd	zero,8(a5)
    802048b2:	fc042783          	lw	a5,-64(s0)
    802048b6:	07e9                	addi	a5,a5,26
    802048b8:	078e                	slli	a5,a5,0x3
    802048ba:	00f48533          	add	a0,s1,a5
    802048be:	00053423          	sd	zero,8(a0)
    802048c2:	fd043503          	ld	a0,-48(s0)
    802048c6:	fffff097          	auipc	ra,0xfffff
    802048ca:	f38080e7          	jalr	-200(ra) # 802037fe <fileclose>
    802048ce:	fc843503          	ld	a0,-56(s0)
    802048d2:	fffff097          	auipc	ra,0xfffff
    802048d6:	f2c080e7          	jalr	-212(ra) # 802037fe <fileclose>
    802048da:	57fd                	li	a5,-1
    802048dc:	a03d                	j	8020490a <sys_pipe+0x100>
    802048de:	fc442783          	lw	a5,-60(s0)
    802048e2:	0007c763          	bltz	a5,802048f0 <sys_pipe+0xe6>
    802048e6:	07e9                	addi	a5,a5,26
    802048e8:	078e                	slli	a5,a5,0x3
    802048ea:	97a6                	add	a5,a5,s1
    802048ec:	0007b423          	sd	zero,8(a5)
    802048f0:	fd043503          	ld	a0,-48(s0)
    802048f4:	fffff097          	auipc	ra,0xfffff
    802048f8:	f0a080e7          	jalr	-246(ra) # 802037fe <fileclose>
    802048fc:	fc843503          	ld	a0,-56(s0)
    80204900:	fffff097          	auipc	ra,0xfffff
    80204904:	efe080e7          	jalr	-258(ra) # 802037fe <fileclose>
    80204908:	57fd                	li	a5,-1
    8020490a:	853e                	mv	a0,a5
    8020490c:	70e2                	ld	ra,56(sp)
    8020490e:	7442                	ld	s0,48(sp)
    80204910:	74a2                	ld	s1,40(sp)
    80204912:	6121                	addi	sp,sp,64
    80204914:	8082                	ret

0000000080204916 <sys_dev>:
    80204916:	7179                	addi	sp,sp,-48
    80204918:	f406                	sd	ra,40(sp)
    8020491a:	f022                	sd	s0,32(sp)
    8020491c:	ec26                	sd	s1,24(sp)
    8020491e:	1800                	addi	s0,sp,48
    80204920:	fdc40593          	addi	a1,s0,-36
    80204924:	4501                	li	a0,0
    80204926:	ffffe097          	auipc	ra,0xffffe
    8020492a:	4a0080e7          	jalr	1184(ra) # 80202dc6 <argint>
    8020492e:	0a054163          	bltz	a0,802049d0 <sys_dev+0xba>
    80204932:	fd840593          	addi	a1,s0,-40
    80204936:	4505                	li	a0,1
    80204938:	ffffe097          	auipc	ra,0xffffe
    8020493c:	48e080e7          	jalr	1166(ra) # 80202dc6 <argint>
    80204940:	08054e63          	bltz	a0,802049dc <sys_dev+0xc6>
    80204944:	fd440593          	addi	a1,s0,-44
    80204948:	4509                	li	a0,2
    8020494a:	ffffe097          	auipc	ra,0xffffe
    8020494e:	47c080e7          	jalr	1148(ra) # 80202dc6 <argint>
    80204952:	08054763          	bltz	a0,802049e0 <sys_dev+0xca>
    80204956:	fdc42783          	lw	a5,-36(s0)
    8020495a:	2007f793          	andi	a5,a5,512
    8020495e:	ebb1                	bnez	a5,802049b2 <sys_dev+0x9c>
    80204960:	fd842703          	lw	a4,-40(s0)
    80204964:	47a5                	li	a5,9
    80204966:	557d                	li	a0,-1
    80204968:	06e7e563          	bltu	a5,a4,802049d2 <sys_dev+0xbc>
    8020496c:	fffff097          	auipc	ra,0xfffff
    80204970:	dd6080e7          	jalr	-554(ra) # 80203742 <filealloc>
    80204974:	84aa                	mv	s1,a0
    80204976:	c53d                	beqz	a0,802049e4 <sys_dev+0xce>
    80204978:	00000097          	auipc	ra,0x0
    8020497c:	996080e7          	jalr	-1642(ra) # 8020430e <fdalloc>
    80204980:	04054163          	bltz	a0,802049c2 <sys_dev+0xac>
    80204984:	478d                	li	a5,3
    80204986:	c09c                	sw	a5,0(s1)
    80204988:	0204a023          	sw	zero,32(s1)
    8020498c:	0004bc23          	sd	zero,24(s1)
    80204990:	fd842783          	lw	a5,-40(s0)
    80204994:	02f49223          	sh	a5,36(s1)
    80204998:	fdc42783          	lw	a5,-36(s0)
    8020499c:	0017c713          	xori	a4,a5,1
    802049a0:	8b05                	andi	a4,a4,1
    802049a2:	00e48423          	sb	a4,8(s1)
    802049a6:	8b8d                	andi	a5,a5,3
    802049a8:	00f037b3          	snez	a5,a5
    802049ac:	00f484a3          	sb	a5,9(s1)
    802049b0:	a00d                	j	802049d2 <sys_dev+0xbc>
    802049b2:	00005517          	auipc	a0,0x5
    802049b6:	1d650513          	addi	a0,a0,470 # 80209b88 <digits+0x808>
    802049ba:	ffffb097          	auipc	ra,0xffffb
    802049be:	78a080e7          	jalr	1930(ra) # 80200144 <panic>
    802049c2:	8526                	mv	a0,s1
    802049c4:	fffff097          	auipc	ra,0xfffff
    802049c8:	e3a080e7          	jalr	-454(ra) # 802037fe <fileclose>
    802049cc:	557d                	li	a0,-1
    802049ce:	a011                	j	802049d2 <sys_dev+0xbc>
    802049d0:	557d                	li	a0,-1
    802049d2:	70a2                	ld	ra,40(sp)
    802049d4:	7402                	ld	s0,32(sp)
    802049d6:	64e2                	ld	s1,24(sp)
    802049d8:	6145                	addi	sp,sp,48
    802049da:	8082                	ret
    802049dc:	557d                	li	a0,-1
    802049de:	bfd5                	j	802049d2 <sys_dev+0xbc>
    802049e0:	557d                	li	a0,-1
    802049e2:	bfc5                	j	802049d2 <sys_dev+0xbc>
    802049e4:	557d                	li	a0,-1
    802049e6:	b7f5                	j	802049d2 <sys_dev+0xbc>

00000000802049e8 <sys_readdir>:
    802049e8:	1101                	addi	sp,sp,-32
    802049ea:	ec06                	sd	ra,24(sp)
    802049ec:	e822                	sd	s0,16(sp)
    802049ee:	1000                	addi	s0,sp,32
    802049f0:	fe840613          	addi	a2,s0,-24
    802049f4:	4581                	li	a1,0
    802049f6:	4501                	li	a0,0
    802049f8:	00000097          	auipc	ra,0x0
    802049fc:	8ae080e7          	jalr	-1874(ra) # 802042a6 <argfd>
    80204a00:	57fd                	li	a5,-1
    80204a02:	02054563          	bltz	a0,80204a2c <sys_readdir+0x44>
    80204a06:	fe040593          	addi	a1,s0,-32
    80204a0a:	4505                	li	a0,1
    80204a0c:	ffffe097          	auipc	ra,0xffffe
    80204a10:	41c080e7          	jalr	1052(ra) # 80202e28 <argaddr>
    80204a14:	57fd                	li	a5,-1
    80204a16:	00054b63          	bltz	a0,80204a2c <sys_readdir+0x44>
    80204a1a:	fe043583          	ld	a1,-32(s0)
    80204a1e:	fe843503          	ld	a0,-24(s0)
    80204a22:	fffff097          	auipc	ra,0xfffff
    80204a26:	088080e7          	jalr	136(ra) # 80203aaa <dirnext>
    80204a2a:	87aa                	mv	a5,a0
    80204a2c:	853e                	mv	a0,a5
    80204a2e:	60e2                	ld	ra,24(sp)
    80204a30:	6442                	ld	s0,16(sp)
    80204a32:	6105                	addi	sp,sp,32
    80204a34:	8082                	ret

0000000080204a36 <sys_getcwd>:
    80204a36:	714d                	addi	sp,sp,-336
    80204a38:	e686                	sd	ra,328(sp)
    80204a3a:	e2a2                	sd	s0,320(sp)
    80204a3c:	fe26                	sd	s1,312(sp)
    80204a3e:	fa4a                	sd	s2,304(sp)
    80204a40:	f64e                	sd	s3,296(sp)
    80204a42:	f252                	sd	s4,288(sp)
    80204a44:	ee56                	sd	s5,280(sp)
    80204a46:	0a80                	addi	s0,sp,336
    80204a48:	fb840593          	addi	a1,s0,-72
    80204a4c:	4501                	li	a0,0
    80204a4e:	ffffe097          	auipc	ra,0xffffe
    80204a52:	3da080e7          	jalr	986(ra) # 80202e28 <argaddr>
    80204a56:	87aa                	mv	a5,a0
    80204a58:	557d                	li	a0,-1
    80204a5a:	0607cc63          	bltz	a5,80204ad2 <sys_getcwd+0x9c>
    80204a5e:	ffffd097          	auipc	ra,0xffffd
    80204a62:	fe2080e7          	jalr	-30(ra) # 80201a40 <myproc>
    80204a66:	15853483          	ld	s1,344(a0)
    80204a6a:	1204b783          	ld	a5,288(s1)
    80204a6e:	cbbd                	beqz	a5,80204ae4 <sys_getcwd+0xae>
    80204a70:	fa0409a3          	sb	zero,-77(s0)
    80204a74:	fb340993          	addi	s3,s0,-77
    80204a78:	eb040a13          	addi	s4,s0,-336
    80204a7c:	02f00a93          	li	s5,47
    80204a80:	8526                	mv	a0,s1
    80204a82:	ffffc097          	auipc	ra,0xffffc
    80204a86:	e62080e7          	jalr	-414(ra) # 802008e4 <strlen>
    80204a8a:	862a                	mv	a2,a0
    80204a8c:	40a98933          	sub	s2,s3,a0
    80204a90:	052a7f63          	bgeu	s4,s2,80204aee <sys_getcwd+0xb8>
    80204a94:	85a6                	mv	a1,s1
    80204a96:	854a                	mv	a0,s2
    80204a98:	ffffc097          	auipc	ra,0xffffc
    80204a9c:	dde080e7          	jalr	-546(ra) # 80200876 <strncpy>
    80204aa0:	fff90993          	addi	s3,s2,-1
    80204aa4:	ff590fa3          	sb	s5,-1(s2)
    80204aa8:	1204b483          	ld	s1,288(s1)
    80204aac:	1204b783          	ld	a5,288(s1)
    80204ab0:	fbe1                	bnez	a5,80204a80 <sys_getcwd+0x4a>
    80204ab2:	fb843483          	ld	s1,-72(s0)
    80204ab6:	854e                	mv	a0,s3
    80204ab8:	ffffc097          	auipc	ra,0xffffc
    80204abc:	e2c080e7          	jalr	-468(ra) # 802008e4 <strlen>
    80204ac0:	0015061b          	addiw	a2,a0,1
    80204ac4:	85ce                	mv	a1,s3
    80204ac6:	8526                	mv	a0,s1
    80204ac8:	ffffd097          	auipc	ra,0xffffd
    80204acc:	8ae080e7          	jalr	-1874(ra) # 80201376 <copyout2>
    80204ad0:	957d                	srai	a0,a0,0x3f
    80204ad2:	60b6                	ld	ra,328(sp)
    80204ad4:	6416                	ld	s0,320(sp)
    80204ad6:	74f2                	ld	s1,312(sp)
    80204ad8:	7952                	ld	s2,304(sp)
    80204ada:	79b2                	ld	s3,296(sp)
    80204adc:	7a12                	ld	s4,288(sp)
    80204ade:	6af2                	ld	s5,280(sp)
    80204ae0:	6171                	addi	sp,sp,336
    80204ae2:	8082                	ret
    80204ae4:	00005997          	auipc	s3,0x5
    80204ae8:	b4c98993          	addi	s3,s3,-1204 # 80209630 <digits+0x2b0>
    80204aec:	b7d9                	j	80204ab2 <sys_getcwd+0x7c>
    80204aee:	557d                	li	a0,-1
    80204af0:	b7cd                	j	80204ad2 <sys_getcwd+0x9c>

0000000080204af2 <sys_remove>:
    80204af2:	d6010113          	addi	sp,sp,-672
    80204af6:	28113c23          	sd	ra,664(sp)
    80204afa:	28813823          	sd	s0,656(sp)
    80204afe:	28913423          	sd	s1,648(sp)
    80204b02:	1500                	addi	s0,sp,672
    80204b04:	10400613          	li	a2,260
    80204b08:	ed840593          	addi	a1,s0,-296
    80204b0c:	4501                	li	a0,0
    80204b0e:	ffffe097          	auipc	ra,0xffffe
    80204b12:	33c080e7          	jalr	828(ra) # 80202e4a <argstr>
    80204b16:	0ea05a63          	blez	a0,80204c0a <sys_remove+0x118>
    80204b1a:	157d                	addi	a0,a0,-1
    80204b1c:	ed840713          	addi	a4,s0,-296
    80204b20:	00a707b3          	add	a5,a4,a0
    80204b24:	02f00693          	li	a3,47
    80204b28:	863a                	mv	a2,a4
    80204b2a:	00e7e963          	bltu	a5,a4,80204b3c <sys_remove+0x4a>
    80204b2e:	0007c703          	lbu	a4,0(a5)
    80204b32:	08d71a63          	bne	a4,a3,80204bc6 <sys_remove+0xd4>
    80204b36:	17fd                	addi	a5,a5,-1
    80204b38:	fec7fbe3          	bgeu	a5,a2,80204b2e <sys_remove+0x3c>
    80204b3c:	ed840513          	addi	a0,s0,-296
    80204b40:	00002097          	auipc	ra,0x2
    80204b44:	d90080e7          	jalr	-624(ra) # 802068d0 <ename>
    80204b48:	84aa                	mv	s1,a0
    80204b4a:	c561                	beqz	a0,80204c12 <sys_remove+0x120>
    80204b4c:	00001097          	auipc	ra,0x1
    80204b50:	5da080e7          	jalr	1498(ra) # 80206126 <elock>
    80204b54:	1004c783          	lbu	a5,256(s1)
    80204b58:	8bc1                	andi	a5,a5,16
    80204b5a:	c38d                	beqz	a5,80204b7c <sys_remove+0x8a>
    80204b5c:	e8041323          	sh	zero,-378(s0)
    80204b60:	d6c40693          	addi	a3,s0,-660
    80204b64:	04000613          	li	a2,64
    80204b68:	d7040593          	addi	a1,s0,-656
    80204b6c:	8526                	mv	a0,s1
    80204b6e:	00001097          	auipc	ra,0x1
    80204b72:	7bc080e7          	jalr	1980(ra) # 8020632a <enext>
    80204b76:	57fd                	li	a5,-1
    80204b78:	06f51d63          	bne	a0,a5,80204bf2 <sys_remove+0x100>
    80204b7c:	1204b503          	ld	a0,288(s1)
    80204b80:	00001097          	auipc	ra,0x1
    80204b84:	5a6080e7          	jalr	1446(ra) # 80206126 <elock>
    80204b88:	8526                	mv	a0,s1
    80204b8a:	00001097          	auipc	ra,0x1
    80204b8e:	468080e7          	jalr	1128(ra) # 80205ff2 <eremove>
    80204b92:	1204b503          	ld	a0,288(s1)
    80204b96:	00001097          	auipc	ra,0x1
    80204b9a:	5c6080e7          	jalr	1478(ra) # 8020615c <eunlock>
    80204b9e:	8526                	mv	a0,s1
    80204ba0:	00001097          	auipc	ra,0x1
    80204ba4:	5bc080e7          	jalr	1468(ra) # 8020615c <eunlock>
    80204ba8:	8526                	mv	a0,s1
    80204baa:	00001097          	auipc	ra,0x1
    80204bae:	600080e7          	jalr	1536(ra) # 802061aa <eput>
    80204bb2:	4501                	li	a0,0
    80204bb4:	29813083          	ld	ra,664(sp)
    80204bb8:	29013403          	ld	s0,656(sp)
    80204bbc:	28813483          	ld	s1,648(sp)
    80204bc0:	2a010113          	addi	sp,sp,672
    80204bc4:	8082                	ret
    80204bc6:	ed840713          	addi	a4,s0,-296
    80204bca:	f6e7e9e3          	bltu	a5,a4,80204b3c <sys_remove+0x4a>
    80204bce:	0007c683          	lbu	a3,0(a5)
    80204bd2:	02e00713          	li	a4,46
    80204bd6:	f6e693e3          	bne	a3,a4,80204b3c <sys_remove+0x4a>
    80204bda:	ed840713          	addi	a4,s0,-296
    80204bde:	02e78863          	beq	a5,a4,80204c0e <sys_remove+0x11c>
    80204be2:	fff7c703          	lbu	a4,-1(a5)
    80204be6:	02f00793          	li	a5,47
    80204bea:	f4f719e3          	bne	a4,a5,80204b3c <sys_remove+0x4a>
    80204bee:	557d                	li	a0,-1
    80204bf0:	b7d1                	j	80204bb4 <sys_remove+0xc2>
    80204bf2:	8526                	mv	a0,s1
    80204bf4:	00001097          	auipc	ra,0x1
    80204bf8:	568080e7          	jalr	1384(ra) # 8020615c <eunlock>
    80204bfc:	8526                	mv	a0,s1
    80204bfe:	00001097          	auipc	ra,0x1
    80204c02:	5ac080e7          	jalr	1452(ra) # 802061aa <eput>
    80204c06:	557d                	li	a0,-1
    80204c08:	b775                	j	80204bb4 <sys_remove+0xc2>
    80204c0a:	557d                	li	a0,-1
    80204c0c:	b765                	j	80204bb4 <sys_remove+0xc2>
    80204c0e:	557d                	li	a0,-1
    80204c10:	b755                	j	80204bb4 <sys_remove+0xc2>
    80204c12:	557d                	li	a0,-1
    80204c14:	b745                	j	80204bb4 <sys_remove+0xc2>

0000000080204c16 <sys_rename>:
    80204c16:	c4010113          	addi	sp,sp,-960
    80204c1a:	3a113c23          	sd	ra,952(sp)
    80204c1e:	3a813823          	sd	s0,944(sp)
    80204c22:	3a913423          	sd	s1,936(sp)
    80204c26:	3b213023          	sd	s2,928(sp)
    80204c2a:	39313c23          	sd	s3,920(sp)
    80204c2e:	39413823          	sd	s4,912(sp)
    80204c32:	0780                	addi	s0,sp,960
    80204c34:	10400613          	li	a2,260
    80204c38:	ec840593          	addi	a1,s0,-312
    80204c3c:	4501                	li	a0,0
    80204c3e:	ffffe097          	auipc	ra,0xffffe
    80204c42:	20c080e7          	jalr	524(ra) # 80202e4a <argstr>
    80204c46:	57fd                	li	a5,-1
    80204c48:	0c054d63          	bltz	a0,80204d22 <sys_rename+0x10c>
    80204c4c:	10400613          	li	a2,260
    80204c50:	dc040593          	addi	a1,s0,-576
    80204c54:	4505                	li	a0,1
    80204c56:	ffffe097          	auipc	ra,0xffffe
    80204c5a:	1f4080e7          	jalr	500(ra) # 80202e4a <argstr>
    80204c5e:	57fd                	li	a5,-1
    80204c60:	0c054163          	bltz	a0,80204d22 <sys_rename+0x10c>
    80204c64:	ec840513          	addi	a0,s0,-312
    80204c68:	00002097          	auipc	ra,0x2
    80204c6c:	c68080e7          	jalr	-920(ra) # 802068d0 <ename>
    80204c70:	84aa                	mv	s1,a0
    80204c72:	1c050963          	beqz	a0,80204e44 <sys_rename+0x22e>
    80204c76:	ec840593          	addi	a1,s0,-312
    80204c7a:	dc040513          	addi	a0,s0,-576
    80204c7e:	00002097          	auipc	ra,0x2
    80204c82:	c70080e7          	jalr	-912(ra) # 802068ee <enameparent>
    80204c86:	892a                	mv	s2,a0
    80204c88:	cd35                	beqz	a0,80204d04 <sys_rename+0xee>
    80204c8a:	ec840513          	addi	a0,s0,-312
    80204c8e:	00001097          	auipc	ra,0x1
    80204c92:	dbe080e7          	jalr	-578(ra) # 80205a4c <formatname>
    80204c96:	89aa                	mv	s3,a0
    80204c98:	c535                	beqz	a0,80204d04 <sys_rename+0xee>
    80204c9a:	07248563          	beq	s1,s2,80204d04 <sys_rename+0xee>
    80204c9e:	87ca                	mv	a5,s2
    80204ca0:	1207b783          	ld	a5,288(a5)
    80204ca4:	c781                	beqz	a5,80204cac <sys_rename+0x96>
    80204ca6:	fef49de3          	bne	s1,a5,80204ca0 <sys_rename+0x8a>
    80204caa:	a8a9                	j	80204d04 <sys_rename+0xee>
    80204cac:	8526                	mv	a0,s1
    80204cae:	00001097          	auipc	ra,0x1
    80204cb2:	478080e7          	jalr	1144(ra) # 80206126 <elock>
    80204cb6:	854a                	mv	a0,s2
    80204cb8:	00001097          	auipc	ra,0x1
    80204cbc:	46e080e7          	jalr	1134(ra) # 80206126 <elock>
    80204cc0:	dbc40613          	addi	a2,s0,-580
    80204cc4:	85ce                	mv	a1,s3
    80204cc6:	854a                	mv	a0,s2
    80204cc8:	00001097          	auipc	ra,0x1
    80204ccc:	7ec080e7          	jalr	2028(ra) # 802064b4 <dirlookup>
    80204cd0:	8a2a                	mv	s4,a0
    80204cd2:	cd45                	beqz	a0,80204d8a <sys_rename+0x174>
    80204cd4:	854a                	mv	a0,s2
    80204cd6:	00001097          	auipc	ra,0x1
    80204cda:	486080e7          	jalr	1158(ra) # 8020615c <eunlock>
    80204cde:	01448963          	beq	s1,s4,80204cf0 <sys_rename+0xda>
    80204ce2:	1004c783          	lbu	a5,256(s1)
    80204ce6:	100a4703          	lbu	a4,256(s4)
    80204cea:	8ff9                	and	a5,a5,a4
    80204cec:	8bc1                	andi	a5,a5,16
    80204cee:	ebb1                	bnez	a5,80204d42 <sys_rename+0x12c>
    80204cf0:	8526                	mv	a0,s1
    80204cf2:	00001097          	auipc	ra,0x1
    80204cf6:	46a080e7          	jalr	1130(ra) # 8020615c <eunlock>
    80204cfa:	8552                	mv	a0,s4
    80204cfc:	00001097          	auipc	ra,0x1
    80204d00:	4ae080e7          	jalr	1198(ra) # 802061aa <eput>
    80204d04:	00090763          	beqz	s2,80204d12 <sys_rename+0xfc>
    80204d08:	854a                	mv	a0,s2
    80204d0a:	00001097          	auipc	ra,0x1
    80204d0e:	4a0080e7          	jalr	1184(ra) # 802061aa <eput>
    80204d12:	57fd                	li	a5,-1
    80204d14:	c499                	beqz	s1,80204d22 <sys_rename+0x10c>
    80204d16:	8526                	mv	a0,s1
    80204d18:	00001097          	auipc	ra,0x1
    80204d1c:	492080e7          	jalr	1170(ra) # 802061aa <eput>
    80204d20:	57fd                	li	a5,-1
    80204d22:	853e                	mv	a0,a5
    80204d24:	3b813083          	ld	ra,952(sp)
    80204d28:	3b013403          	ld	s0,944(sp)
    80204d2c:	3a813483          	ld	s1,936(sp)
    80204d30:	3a013903          	ld	s2,928(sp)
    80204d34:	39813983          	ld	s3,920(sp)
    80204d38:	39013a03          	ld	s4,912(sp)
    80204d3c:	3c010113          	addi	sp,sp,960
    80204d40:	8082                	ret
    80204d42:	8552                	mv	a0,s4
    80204d44:	00001097          	auipc	ra,0x1
    80204d48:	3e2080e7          	jalr	994(ra) # 80206126 <elock>
    80204d4c:	d6041323          	sh	zero,-666(s0)
    80204d50:	c4c40693          	addi	a3,s0,-948
    80204d54:	04000613          	li	a2,64
    80204d58:	c5040593          	addi	a1,s0,-944
    80204d5c:	8552                	mv	a0,s4
    80204d5e:	00001097          	auipc	ra,0x1
    80204d62:	5cc080e7          	jalr	1484(ra) # 8020632a <enext>
    80204d66:	57fd                	li	a5,-1
    80204d68:	0cf51863          	bne	a0,a5,80204e38 <sys_rename+0x222>
    80204d6c:	854a                	mv	a0,s2
    80204d6e:	00001097          	auipc	ra,0x1
    80204d72:	3b8080e7          	jalr	952(ra) # 80206126 <elock>
    80204d76:	8552                	mv	a0,s4
    80204d78:	00001097          	auipc	ra,0x1
    80204d7c:	27a080e7          	jalr	634(ra) # 80205ff2 <eremove>
    80204d80:	8552                	mv	a0,s4
    80204d82:	00001097          	auipc	ra,0x1
    80204d86:	3da080e7          	jalr	986(ra) # 8020615c <eunlock>
    80204d8a:	0ff00613          	li	a2,255
    80204d8e:	85ce                	mv	a1,s3
    80204d90:	8526                	mv	a0,s1
    80204d92:	ffffc097          	auipc	ra,0xffffc
    80204d96:	a2c080e7          	jalr	-1492(ra) # 802007be <memmove>
    80204d9a:	dbc42603          	lw	a2,-580(s0)
    80204d9e:	85a6                	mv	a1,s1
    80204da0:	854a                	mv	a0,s2
    80204da2:	00001097          	auipc	ra,0x1
    80204da6:	d62080e7          	jalr	-670(ra) # 80205b04 <emake>
    80204daa:	1204b783          	ld	a5,288(s1)
    80204dae:	01278d63          	beq	a5,s2,80204dc8 <sys_rename+0x1b2>
    80204db2:	854a                	mv	a0,s2
    80204db4:	00001097          	auipc	ra,0x1
    80204db8:	3a8080e7          	jalr	936(ra) # 8020615c <eunlock>
    80204dbc:	1204b503          	ld	a0,288(s1)
    80204dc0:	00001097          	auipc	ra,0x1
    80204dc4:	366080e7          	jalr	870(ra) # 80206126 <elock>
    80204dc8:	8526                	mv	a0,s1
    80204dca:	00001097          	auipc	ra,0x1
    80204dce:	228080e7          	jalr	552(ra) # 80205ff2 <eremove>
    80204dd2:	1204b503          	ld	a0,288(s1)
    80204dd6:	00001097          	auipc	ra,0x1
    80204dda:	386080e7          	jalr	902(ra) # 8020615c <eunlock>
    80204dde:	1204b983          	ld	s3,288(s1)
    80204de2:	854a                	mv	a0,s2
    80204de4:	00001097          	auipc	ra,0x1
    80204de8:	0e4080e7          	jalr	228(ra) # 80205ec8 <edup>
    80204dec:	12a4b023          	sd	a0,288(s1)
    80204df0:	dbc42783          	lw	a5,-580(s0)
    80204df4:	10f4ae23          	sw	a5,284(s1)
    80204df8:	4785                	li	a5,1
    80204dfa:	10f49b23          	sh	a5,278(s1)
    80204dfe:	8526                	mv	a0,s1
    80204e00:	00001097          	auipc	ra,0x1
    80204e04:	35c080e7          	jalr	860(ra) # 8020615c <eunlock>
    80204e08:	854e                	mv	a0,s3
    80204e0a:	00001097          	auipc	ra,0x1
    80204e0e:	3a0080e7          	jalr	928(ra) # 802061aa <eput>
    80204e12:	000a0763          	beqz	s4,80204e20 <sys_rename+0x20a>
    80204e16:	8552                	mv	a0,s4
    80204e18:	00001097          	auipc	ra,0x1
    80204e1c:	392080e7          	jalr	914(ra) # 802061aa <eput>
    80204e20:	854a                	mv	a0,s2
    80204e22:	00001097          	auipc	ra,0x1
    80204e26:	388080e7          	jalr	904(ra) # 802061aa <eput>
    80204e2a:	8526                	mv	a0,s1
    80204e2c:	00001097          	auipc	ra,0x1
    80204e30:	37e080e7          	jalr	894(ra) # 802061aa <eput>
    80204e34:	4781                	li	a5,0
    80204e36:	b5f5                	j	80204d22 <sys_rename+0x10c>
    80204e38:	8552                	mv	a0,s4
    80204e3a:	00001097          	auipc	ra,0x1
    80204e3e:	322080e7          	jalr	802(ra) # 8020615c <eunlock>
    80204e42:	b57d                	j	80204cf0 <sys_rename+0xda>
    80204e44:	892a                	mv	s2,a0
    80204e46:	bd7d                	j	80204d04 <sys_rename+0xee>
	...

0000000080204e50 <kernelvec>:
    80204e50:	7111                	addi	sp,sp,-256
    80204e52:	e006                	sd	ra,0(sp)
    80204e54:	e40a                	sd	sp,8(sp)
    80204e56:	e80e                	sd	gp,16(sp)
    80204e58:	ec12                	sd	tp,24(sp)
    80204e5a:	f016                	sd	t0,32(sp)
    80204e5c:	f41a                	sd	t1,40(sp)
    80204e5e:	f81e                	sd	t2,48(sp)
    80204e60:	fc22                	sd	s0,56(sp)
    80204e62:	e0a6                	sd	s1,64(sp)
    80204e64:	e4aa                	sd	a0,72(sp)
    80204e66:	e8ae                	sd	a1,80(sp)
    80204e68:	ecb2                	sd	a2,88(sp)
    80204e6a:	f0b6                	sd	a3,96(sp)
    80204e6c:	f4ba                	sd	a4,104(sp)
    80204e6e:	f8be                	sd	a5,112(sp)
    80204e70:	fcc2                	sd	a6,120(sp)
    80204e72:	e146                	sd	a7,128(sp)
    80204e74:	e54a                	sd	s2,136(sp)
    80204e76:	e94e                	sd	s3,144(sp)
    80204e78:	ed52                	sd	s4,152(sp)
    80204e7a:	f156                	sd	s5,160(sp)
    80204e7c:	f55a                	sd	s6,168(sp)
    80204e7e:	f95e                	sd	s7,176(sp)
    80204e80:	fd62                	sd	s8,184(sp)
    80204e82:	e1e6                	sd	s9,192(sp)
    80204e84:	e5ea                	sd	s10,200(sp)
    80204e86:	e9ee                	sd	s11,208(sp)
    80204e88:	edf2                	sd	t3,216(sp)
    80204e8a:	f1f6                	sd	t4,224(sp)
    80204e8c:	f5fa                	sd	t5,232(sp)
    80204e8e:	f9fe                	sd	t6,240(sp)
    80204e90:	ab9fd0ef          	jal	ra,80202948 <kerneltrap>
    80204e94:	6082                	ld	ra,0(sp)
    80204e96:	6122                	ld	sp,8(sp)
    80204e98:	61c2                	ld	gp,16(sp)
    80204e9a:	7282                	ld	t0,32(sp)
    80204e9c:	7322                	ld	t1,40(sp)
    80204e9e:	73c2                	ld	t2,48(sp)
    80204ea0:	7462                	ld	s0,56(sp)
    80204ea2:	6486                	ld	s1,64(sp)
    80204ea4:	6526                	ld	a0,72(sp)
    80204ea6:	65c6                	ld	a1,80(sp)
    80204ea8:	6666                	ld	a2,88(sp)
    80204eaa:	7686                	ld	a3,96(sp)
    80204eac:	7726                	ld	a4,104(sp)
    80204eae:	77c6                	ld	a5,112(sp)
    80204eb0:	7866                	ld	a6,120(sp)
    80204eb2:	688a                	ld	a7,128(sp)
    80204eb4:	692a                	ld	s2,136(sp)
    80204eb6:	69ca                	ld	s3,144(sp)
    80204eb8:	6a6a                	ld	s4,152(sp)
    80204eba:	7a8a                	ld	s5,160(sp)
    80204ebc:	7b2a                	ld	s6,168(sp)
    80204ebe:	7bca                	ld	s7,176(sp)
    80204ec0:	7c6a                	ld	s8,184(sp)
    80204ec2:	6c8e                	ld	s9,192(sp)
    80204ec4:	6d2e                	ld	s10,200(sp)
    80204ec6:	6dce                	ld	s11,208(sp)
    80204ec8:	6e6e                	ld	t3,216(sp)
    80204eca:	7e8e                	ld	t4,224(sp)
    80204ecc:	7f2e                	ld	t5,232(sp)
    80204ece:	7fce                	ld	t6,240(sp)
    80204ed0:	6111                	addi	sp,sp,256
    80204ed2:	10200073          	sret
	...

0000000080204ede <timerinit>:
    80204ede:	1141                	addi	sp,sp,-16
    80204ee0:	e406                	sd	ra,8(sp)
    80204ee2:	e022                	sd	s0,0(sp)
    80204ee4:	0800                	addi	s0,sp,16
    80204ee6:	00005597          	auipc	a1,0x5
    80204eea:	cb258593          	addi	a1,a1,-846 # 80209b98 <digits+0x818>
    80204eee:	00019517          	auipc	a0,0x19
    80204ef2:	51a50513          	addi	a0,a0,1306 # 8021e408 <tickslock>
    80204ef6:	ffffb097          	auipc	ra,0xffffb
    80204efa:	78c080e7          	jalr	1932(ra) # 80200682 <initlock>
    80204efe:	60a2                	ld	ra,8(sp)
    80204f00:	6402                	ld	s0,0(sp)
    80204f02:	0141                	addi	sp,sp,16
    80204f04:	8082                	ret

0000000080204f06 <set_next_timeout>:
    80204f06:	1141                	addi	sp,sp,-16
    80204f08:	e422                	sd	s0,8(sp)
    80204f0a:	0800                	addi	s0,sp,16
    80204f0c:	c0102573          	rdtime	a0
    80204f10:	001dc7b7          	lui	a5,0x1dc
    80204f14:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    80204f18:	953e                	add	a0,a0,a5
    80204f1a:	4581                	li	a1,0
    80204f1c:	4601                	li	a2,0
    80204f1e:	4681                	li	a3,0
    80204f20:	4881                	li	a7,0
    80204f22:	00000073          	ecall
    80204f26:	6422                	ld	s0,8(sp)
    80204f28:	0141                	addi	sp,sp,16
    80204f2a:	8082                	ret

0000000080204f2c <timer_tick>:
    80204f2c:	1101                	addi	sp,sp,-32
    80204f2e:	ec06                	sd	ra,24(sp)
    80204f30:	e822                	sd	s0,16(sp)
    80204f32:	e426                	sd	s1,8(sp)
    80204f34:	1000                	addi	s0,sp,32
    80204f36:	00019497          	auipc	s1,0x19
    80204f3a:	4d248493          	addi	s1,s1,1234 # 8021e408 <tickslock>
    80204f3e:	8526                	mv	a0,s1
    80204f40:	ffffb097          	auipc	ra,0xffffb
    80204f44:	786080e7          	jalr	1926(ra) # 802006c6 <acquire>
    80204f48:	4c9c                	lw	a5,24(s1)
    80204f4a:	2785                	addiw	a5,a5,1
    80204f4c:	cc9c                	sw	a5,24(s1)
    80204f4e:	00019517          	auipc	a0,0x19
    80204f52:	4d250513          	addi	a0,a0,1234 # 8021e420 <ticks>
    80204f56:	ffffd097          	auipc	ra,0xffffd
    80204f5a:	4e6080e7          	jalr	1254(ra) # 8020243c <wakeup>
    80204f5e:	8526                	mv	a0,s1
    80204f60:	ffffb097          	auipc	ra,0xffffb
    80204f64:	7ba080e7          	jalr	1978(ra) # 8020071a <release>
    80204f68:	00000097          	auipc	ra,0x0
    80204f6c:	f9e080e7          	jalr	-98(ra) # 80204f06 <set_next_timeout>
    80204f70:	60e2                	ld	ra,24(sp)
    80204f72:	6442                	ld	s0,16(sp)
    80204f74:	64a2                	ld	s1,8(sp)
    80204f76:	6105                	addi	sp,sp,32
    80204f78:	8082                	ret

0000000080204f7a <disk_init>:
    80204f7a:	1141                	addi	sp,sp,-16
    80204f7c:	e406                	sd	ra,8(sp)
    80204f7e:	e022                	sd	s0,0(sp)
    80204f80:	0800                	addi	s0,sp,16
    80204f82:	00002097          	auipc	ra,0x2
    80204f86:	e7e080e7          	jalr	-386(ra) # 80206e00 <virtio_disk_init>
    80204f8a:	60a2                	ld	ra,8(sp)
    80204f8c:	6402                	ld	s0,0(sp)
    80204f8e:	0141                	addi	sp,sp,16
    80204f90:	8082                	ret

0000000080204f92 <disk_read>:
    80204f92:	1141                	addi	sp,sp,-16
    80204f94:	e406                	sd	ra,8(sp)
    80204f96:	e022                	sd	s0,0(sp)
    80204f98:	0800                	addi	s0,sp,16
    80204f9a:	4581                	li	a1,0
    80204f9c:	00002097          	auipc	ra,0x2
    80204fa0:	fea080e7          	jalr	-22(ra) # 80206f86 <virtio_disk_rw>
    80204fa4:	60a2                	ld	ra,8(sp)
    80204fa6:	6402                	ld	s0,0(sp)
    80204fa8:	0141                	addi	sp,sp,16
    80204faa:	8082                	ret

0000000080204fac <disk_write>:
    80204fac:	1141                	addi	sp,sp,-16
    80204fae:	e406                	sd	ra,8(sp)
    80204fb0:	e022                	sd	s0,0(sp)
    80204fb2:	0800                	addi	s0,sp,16
    80204fb4:	4585                	li	a1,1
    80204fb6:	00002097          	auipc	ra,0x2
    80204fba:	fd0080e7          	jalr	-48(ra) # 80206f86 <virtio_disk_rw>
    80204fbe:	60a2                	ld	ra,8(sp)
    80204fc0:	6402                	ld	s0,0(sp)
    80204fc2:	0141                	addi	sp,sp,16
    80204fc4:	8082                	ret

0000000080204fc6 <disk_intr>:
    80204fc6:	1141                	addi	sp,sp,-16
    80204fc8:	e406                	sd	ra,8(sp)
    80204fca:	e022                	sd	s0,0(sp)
    80204fcc:	0800                	addi	s0,sp,16
    80204fce:	00002097          	auipc	ra,0x2
    80204fd2:	242080e7          	jalr	578(ra) # 80207210 <virtio_disk_intr>
    80204fd6:	60a2                	ld	ra,8(sp)
    80204fd8:	6402                	ld	s0,0(sp)
    80204fda:	0141                	addi	sp,sp,16
    80204fdc:	8082                	ret

0000000080204fde <read_fat>:
    80204fde:	1101                	addi	sp,sp,-32
    80204fe0:	ec06                	sd	ra,24(sp)
    80204fe2:	e822                	sd	s0,16(sp)
    80204fe4:	e426                	sd	s1,8(sp)
    80204fe6:	e04a                	sd	s2,0(sp)
    80204fe8:	1000                	addi	s0,sp,32
    80204fea:	100007b7          	lui	a5,0x10000
    80204fee:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
    80204ff0:	84aa                	mv	s1,a0
    80204ff2:	00a7ea63          	bltu	a5,a0,80205006 <read_fat+0x28>
    80204ff6:	00019797          	auipc	a5,0x19
    80204ffa:	43a7a783          	lw	a5,1082(a5) # 8021e430 <fat+0x8>
    80204ffe:	2785                	addiw	a5,a5,1
    80205000:	4481                	li	s1,0
    80205002:	00a7f963          	bgeu	a5,a0,80205014 <read_fat+0x36>
    80205006:	8526                	mv	a0,s1
    80205008:	60e2                	ld	ra,24(sp)
    8020500a:	6442                	ld	s0,16(sp)
    8020500c:	64a2                	ld	s1,8(sp)
    8020500e:	6902                	ld	s2,0(sp)
    80205010:	6105                	addi	sp,sp,32
    80205012:	8082                	ret
    80205014:	0025149b          	slliw	s1,a0,0x2
    80205018:	00019917          	auipc	s2,0x19
    8020501c:	41090913          	addi	s2,s2,1040 # 8021e428 <fat>
    80205020:	01095783          	lhu	a5,16(s2)
    80205024:	02f4d7bb          	divuw	a5,s1,a5
    80205028:	01495583          	lhu	a1,20(s2)
    8020502c:	9dbd                	addw	a1,a1,a5
    8020502e:	4501                	li	a0,0
    80205030:	ffffe097          	auipc	ra,0xffffe
    80205034:	350080e7          	jalr	848(ra) # 80203380 <bread>
    80205038:	01095783          	lhu	a5,16(s2)
    8020503c:	02f4f4bb          	remuw	s1,s1,a5
    80205040:	1482                	slli	s1,s1,0x20
    80205042:	9081                	srli	s1,s1,0x20
    80205044:	009507b3          	add	a5,a0,s1
    80205048:	4fa4                	lw	s1,88(a5)
    8020504a:	ffffe097          	auipc	ra,0xffffe
    8020504e:	462080e7          	jalr	1122(ra) # 802034ac <brelse>
    80205052:	bf55                	j	80205006 <read_fat+0x28>

0000000080205054 <alloc_clus>:
    80205054:	711d                	addi	sp,sp,-96
    80205056:	ec86                	sd	ra,88(sp)
    80205058:	e8a2                	sd	s0,80(sp)
    8020505a:	e4a6                	sd	s1,72(sp)
    8020505c:	e0ca                	sd	s2,64(sp)
    8020505e:	fc4e                	sd	s3,56(sp)
    80205060:	f852                	sd	s4,48(sp)
    80205062:	f456                	sd	s5,40(sp)
    80205064:	f05a                	sd	s6,32(sp)
    80205066:	ec5e                	sd	s7,24(sp)
    80205068:	e862                	sd	s8,16(sp)
    8020506a:	e466                	sd	s9,8(sp)
    8020506c:	1080                	addi	s0,sp,96
    8020506e:	00019797          	auipc	a5,0x19
    80205072:	3ba78793          	addi	a5,a5,954 # 8021e428 <fat>
    80205076:	0147db83          	lhu	s7,20(a5)
    8020507a:	0107d903          	lhu	s2,16(a5)
    8020507e:	539c                	lw	a5,32(a5)
    80205080:	10078263          	beqz	a5,80205184 <alloc_clus+0x130>
    80205084:	0029591b          	srliw	s2,s2,0x2
    80205088:	0009099b          	sext.w	s3,s2
    8020508c:	4b01                	li	s6,0
    8020508e:	00050a9b          	sext.w	s5,a0
    80205092:	4c01                	li	s8,0
    80205094:	00019c97          	auipc	s9,0x19
    80205098:	394c8c93          	addi	s9,s9,916 # 8021e428 <fat>
    8020509c:	a0c9                	j	8020515e <alloc_clus+0x10a>
    8020509e:	10000737          	lui	a4,0x10000
    802050a2:	177d                	addi	a4,a4,-1 # fffffff <_entry-0x70200001>
    802050a4:	c398                	sw	a4,0(a5)
    802050a6:	8552                	mv	a0,s4
    802050a8:	ffffe097          	auipc	ra,0xffffe
    802050ac:	3c8080e7          	jalr	968(ra) # 80203470 <bwrite>
    802050b0:	8552                	mv	a0,s4
    802050b2:	ffffe097          	auipc	ra,0xffffe
    802050b6:	3fa080e7          	jalr	1018(ra) # 802034ac <brelse>
    802050ba:	0369093b          	mulw	s2,s2,s6
    802050be:	0099093b          	addw	s2,s2,s1
    802050c2:	00090a9b          	sext.w	s5,s2
    802050c6:	00019717          	auipc	a4,0x19
    802050ca:	36270713          	addi	a4,a4,866 # 8021e428 <fat>
    802050ce:	01274783          	lbu	a5,18(a4)
    802050d2:	ffe9099b          	addiw	s3,s2,-2
    802050d6:	02f989bb          	mulw	s3,s3,a5
    802050da:	4318                	lw	a4,0(a4)
    802050dc:	00e989bb          	addw	s3,s3,a4
    802050e0:	c7b1                	beqz	a5,8020512c <alloc_clus+0xd8>
    802050e2:	4901                	li	s2,0
    802050e4:	00019a17          	auipc	s4,0x19
    802050e8:	344a0a13          	addi	s4,s4,836 # 8021e428 <fat>
    802050ec:	013905bb          	addw	a1,s2,s3
    802050f0:	4501                	li	a0,0
    802050f2:	ffffe097          	auipc	ra,0xffffe
    802050f6:	28e080e7          	jalr	654(ra) # 80203380 <bread>
    802050fa:	84aa                	mv	s1,a0
    802050fc:	20000613          	li	a2,512
    80205100:	4581                	li	a1,0
    80205102:	05850513          	addi	a0,a0,88
    80205106:	ffffb097          	auipc	ra,0xffffb
    8020510a:	65c080e7          	jalr	1628(ra) # 80200762 <memset>
    8020510e:	8526                	mv	a0,s1
    80205110:	ffffe097          	auipc	ra,0xffffe
    80205114:	360080e7          	jalr	864(ra) # 80203470 <bwrite>
    80205118:	8526                	mv	a0,s1
    8020511a:	ffffe097          	auipc	ra,0xffffe
    8020511e:	392080e7          	jalr	914(ra) # 802034ac <brelse>
    80205122:	2905                	addiw	s2,s2,1
    80205124:	012a4783          	lbu	a5,18(s4)
    80205128:	fcf942e3          	blt	s2,a5,802050ec <alloc_clus+0x98>
    8020512c:	8556                	mv	a0,s5
    8020512e:	60e6                	ld	ra,88(sp)
    80205130:	6446                	ld	s0,80(sp)
    80205132:	64a6                	ld	s1,72(sp)
    80205134:	6906                	ld	s2,64(sp)
    80205136:	79e2                	ld	s3,56(sp)
    80205138:	7a42                	ld	s4,48(sp)
    8020513a:	7aa2                	ld	s5,40(sp)
    8020513c:	7b02                	ld	s6,32(sp)
    8020513e:	6be2                	ld	s7,24(sp)
    80205140:	6c42                	ld	s8,16(sp)
    80205142:	6ca2                	ld	s9,8(sp)
    80205144:	6125                	addi	sp,sp,96
    80205146:	8082                	ret
    80205148:	8552                	mv	a0,s4
    8020514a:	ffffe097          	auipc	ra,0xffffe
    8020514e:	362080e7          	jalr	866(ra) # 802034ac <brelse>
    80205152:	2b05                	addiw	s6,s6,1
    80205154:	2b85                	addiw	s7,s7,1
    80205156:	020ca783          	lw	a5,32(s9)
    8020515a:	02fb7563          	bgeu	s6,a5,80205184 <alloc_clus+0x130>
    8020515e:	85de                	mv	a1,s7
    80205160:	8556                	mv	a0,s5
    80205162:	ffffe097          	auipc	ra,0xffffe
    80205166:	21e080e7          	jalr	542(ra) # 80203380 <bread>
    8020516a:	8a2a                	mv	s4,a0
    8020516c:	fc098ee3          	beqz	s3,80205148 <alloc_clus+0xf4>
    80205170:	05850793          	addi	a5,a0,88
    80205174:	84e2                	mv	s1,s8
    80205176:	4398                	lw	a4,0(a5)
    80205178:	d31d                	beqz	a4,8020509e <alloc_clus+0x4a>
    8020517a:	2485                	addiw	s1,s1,1
    8020517c:	0791                	addi	a5,a5,4
    8020517e:	fe999ce3          	bne	s3,s1,80205176 <alloc_clus+0x122>
    80205182:	b7d9                	j	80205148 <alloc_clus+0xf4>
    80205184:	00005517          	auipc	a0,0x5
    80205188:	a1c50513          	addi	a0,a0,-1508 # 80209ba0 <digits+0x820>
    8020518c:	ffffb097          	auipc	ra,0xffffb
    80205190:	fb8080e7          	jalr	-72(ra) # 80200144 <panic>

0000000080205194 <write_fat>:
    80205194:	00019797          	auipc	a5,0x19
    80205198:	29c7a783          	lw	a5,668(a5) # 8021e430 <fat+0x8>
    8020519c:	2785                	addiw	a5,a5,1
    8020519e:	06a7e963          	bltu	a5,a0,80205210 <write_fat+0x7c>
    802051a2:	7179                	addi	sp,sp,-48
    802051a4:	f406                	sd	ra,40(sp)
    802051a6:	f022                	sd	s0,32(sp)
    802051a8:	ec26                	sd	s1,24(sp)
    802051aa:	e84a                	sd	s2,16(sp)
    802051ac:	e44e                	sd	s3,8(sp)
    802051ae:	e052                	sd	s4,0(sp)
    802051b0:	1800                	addi	s0,sp,48
    802051b2:	89ae                	mv	s3,a1
    802051b4:	0025149b          	slliw	s1,a0,0x2
    802051b8:	00019a17          	auipc	s4,0x19
    802051bc:	270a0a13          	addi	s4,s4,624 # 8021e428 <fat>
    802051c0:	010a5783          	lhu	a5,16(s4)
    802051c4:	02f4d7bb          	divuw	a5,s1,a5
    802051c8:	014a5583          	lhu	a1,20(s4)
    802051cc:	9dbd                	addw	a1,a1,a5
    802051ce:	4501                	li	a0,0
    802051d0:	ffffe097          	auipc	ra,0xffffe
    802051d4:	1b0080e7          	jalr	432(ra) # 80203380 <bread>
    802051d8:	892a                	mv	s2,a0
    802051da:	010a5783          	lhu	a5,16(s4)
    802051de:	02f4f4bb          	remuw	s1,s1,a5
    802051e2:	1482                	slli	s1,s1,0x20
    802051e4:	9081                	srli	s1,s1,0x20
    802051e6:	94aa                	add	s1,s1,a0
    802051e8:	0534ac23          	sw	s3,88(s1)
    802051ec:	ffffe097          	auipc	ra,0xffffe
    802051f0:	284080e7          	jalr	644(ra) # 80203470 <bwrite>
    802051f4:	854a                	mv	a0,s2
    802051f6:	ffffe097          	auipc	ra,0xffffe
    802051fa:	2b6080e7          	jalr	694(ra) # 802034ac <brelse>
    802051fe:	4501                	li	a0,0
    80205200:	70a2                	ld	ra,40(sp)
    80205202:	7402                	ld	s0,32(sp)
    80205204:	64e2                	ld	s1,24(sp)
    80205206:	6942                	ld	s2,16(sp)
    80205208:	69a2                	ld	s3,8(sp)
    8020520a:	6a02                	ld	s4,0(sp)
    8020520c:	6145                	addi	sp,sp,48
    8020520e:	8082                	ret
    80205210:	557d                	li	a0,-1
    80205212:	8082                	ret

0000000080205214 <reloc_clus>:
    80205214:	715d                	addi	sp,sp,-80
    80205216:	e486                	sd	ra,72(sp)
    80205218:	e0a2                	sd	s0,64(sp)
    8020521a:	fc26                	sd	s1,56(sp)
    8020521c:	f84a                	sd	s2,48(sp)
    8020521e:	f44e                	sd	s3,40(sp)
    80205220:	f052                	sd	s4,32(sp)
    80205222:	ec56                	sd	s5,24(sp)
    80205224:	e85a                	sd	s6,16(sp)
    80205226:	e45e                	sd	s7,8(sp)
    80205228:	0880                	addi	s0,sp,80
    8020522a:	84aa                	mv	s1,a0
    8020522c:	8a2e                	mv	s4,a1
    8020522e:	00019b97          	auipc	s7,0x19
    80205232:	206bab83          	lw	s7,518(s7) # 8021e434 <fat+0xc>
    80205236:	0375d9bb          	divuw	s3,a1,s7
    8020523a:	11052703          	lw	a4,272(a0)
    8020523e:	07377563          	bgeu	a4,s3,802052a8 <reloc_clus+0x94>
    80205242:	8b32                	mv	s6,a2
    80205244:	10000ab7          	lui	s5,0x10000
    80205248:	1add                	addi	s5,s5,-9 # ffffff7 <_entry-0x70200009>
    8020524a:	a81d                	j	80205280 <reloc_clus+0x6c>
    8020524c:	1144c503          	lbu	a0,276(s1)
    80205250:	00000097          	auipc	ra,0x0
    80205254:	e04080e7          	jalr	-508(ra) # 80205054 <alloc_clus>
    80205258:	0005091b          	sext.w	s2,a0
    8020525c:	85ca                	mv	a1,s2
    8020525e:	10c4a503          	lw	a0,268(s1)
    80205262:	00000097          	auipc	ra,0x0
    80205266:	f32080e7          	jalr	-206(ra) # 80205194 <write_fat>
    8020526a:	1124a623          	sw	s2,268(s1)
    8020526e:	1104a783          	lw	a5,272(s1)
    80205272:	2785                	addiw	a5,a5,1
    80205274:	0007871b          	sext.w	a4,a5
    80205278:	10f4a823          	sw	a5,272(s1)
    8020527c:	03377663          	bgeu	a4,s3,802052a8 <reloc_clus+0x94>
    80205280:	10c4a503          	lw	a0,268(s1)
    80205284:	00000097          	auipc	ra,0x0
    80205288:	d5a080e7          	jalr	-678(ra) # 80204fde <read_fat>
    8020528c:	0005091b          	sext.w	s2,a0
    80205290:	fd2adde3          	bge	s5,s2,8020526a <reloc_clus+0x56>
    80205294:	fa0b1ce3          	bnez	s6,8020524c <reloc_clus+0x38>
    80205298:	1044a783          	lw	a5,260(s1)
    8020529c:	10f4a623          	sw	a5,268(s1)
    802052a0:	1004a823          	sw	zero,272(s1)
    802052a4:	557d                	li	a0,-1
    802052a6:	a881                	j	802052f6 <reloc_clus+0xe2>
    802052a8:	04e9f163          	bgeu	s3,a4,802052ea <reloc_clus+0xd6>
    802052ac:	1044a783          	lw	a5,260(s1)
    802052b0:	10f4a623          	sw	a5,268(s1)
    802052b4:	1004a823          	sw	zero,272(s1)
    802052b8:	037a6963          	bltu	s4,s7,802052ea <reloc_clus+0xd6>
    802052bc:	10000937          	lui	s2,0x10000
    802052c0:	195d                	addi	s2,s2,-9 # ffffff7 <_entry-0x70200009>
    802052c2:	10c4a503          	lw	a0,268(s1)
    802052c6:	00000097          	auipc	ra,0x0
    802052ca:	d18080e7          	jalr	-744(ra) # 80204fde <read_fat>
    802052ce:	2501                	sext.w	a0,a0
    802052d0:	10a4a623          	sw	a0,268(s1)
    802052d4:	02a96c63          	bltu	s2,a0,8020530c <reloc_clus+0xf8>
    802052d8:	1104a783          	lw	a5,272(s1)
    802052dc:	2785                	addiw	a5,a5,1
    802052de:	0007871b          	sext.w	a4,a5
    802052e2:	10f4a823          	sw	a5,272(s1)
    802052e6:	fd376ee3          	bltu	a4,s3,802052c2 <reloc_clus+0xae>
    802052ea:	00019797          	auipc	a5,0x19
    802052ee:	14a7a783          	lw	a5,330(a5) # 8021e434 <fat+0xc>
    802052f2:	02fa753b          	remuw	a0,s4,a5
    802052f6:	60a6                	ld	ra,72(sp)
    802052f8:	6406                	ld	s0,64(sp)
    802052fa:	74e2                	ld	s1,56(sp)
    802052fc:	7942                	ld	s2,48(sp)
    802052fe:	79a2                	ld	s3,40(sp)
    80205300:	7a02                	ld	s4,32(sp)
    80205302:	6ae2                	ld	s5,24(sp)
    80205304:	6b42                	ld	s6,16(sp)
    80205306:	6ba2                	ld	s7,8(sp)
    80205308:	6161                	addi	sp,sp,80
    8020530a:	8082                	ret
    8020530c:	00005517          	auipc	a0,0x5
    80205310:	8a450513          	addi	a0,a0,-1884 # 80209bb0 <digits+0x830>
    80205314:	ffffb097          	auipc	ra,0xffffb
    80205318:	e30080e7          	jalr	-464(ra) # 80200144 <panic>

000000008020531c <rw_clus>:
    8020531c:	7119                	addi	sp,sp,-128
    8020531e:	fc86                	sd	ra,120(sp)
    80205320:	f8a2                	sd	s0,112(sp)
    80205322:	f4a6                	sd	s1,104(sp)
    80205324:	f0ca                	sd	s2,96(sp)
    80205326:	ecce                	sd	s3,88(sp)
    80205328:	e8d2                	sd	s4,80(sp)
    8020532a:	e4d6                	sd	s5,72(sp)
    8020532c:	e0da                	sd	s6,64(sp)
    8020532e:	fc5e                	sd	s7,56(sp)
    80205330:	f862                	sd	s8,48(sp)
    80205332:	f466                	sd	s9,40(sp)
    80205334:	f06a                	sd	s10,32(sp)
    80205336:	ec6e                	sd	s11,24(sp)
    80205338:	0100                	addi	s0,sp,128
    8020533a:	f8c43423          	sd	a2,-120(s0)
    8020533e:	8b36                	mv	s6,a3
    80205340:	8c3e                	mv	s8,a5
    80205342:	00f706bb          	addw	a3,a4,a5
    80205346:	00019797          	auipc	a5,0x19
    8020534a:	0ee7a783          	lw	a5,238(a5) # 8021e434 <fat+0xc>
    8020534e:	02d7ef63          	bltu	a5,a3,8020538c <rw_clus+0x70>
    80205352:	8cae                	mv	s9,a1
    80205354:	00019797          	auipc	a5,0x19
    80205358:	0d478793          	addi	a5,a5,212 # 8021e428 <fat>
    8020535c:	0107d683          	lhu	a3,16(a5)
    80205360:	ffe5099b          	addiw	s3,a0,-2
    80205364:	0127c603          	lbu	a2,18(a5)
    80205368:	02c989bb          	mulw	s3,s3,a2
    8020536c:	439c                	lw	a5,0(a5)
    8020536e:	00f989bb          	addw	s3,s3,a5
    80205372:	02d757bb          	divuw	a5,a4,a3
    80205376:	00f989bb          	addw	s3,s3,a5
    8020537a:	02d77abb          	remuw	s5,a4,a3
    8020537e:	0e0c0363          	beqz	s8,80205464 <rw_clus+0x148>
    80205382:	4a01                	li	s4,0
    80205384:	20000d93          	li	s11,512
    80205388:	5d7d                	li	s10,-1
    8020538a:	a095                	j	802053ee <rw_clus+0xd2>
    8020538c:	00005517          	auipc	a0,0x5
    80205390:	83450513          	addi	a0,a0,-1996 # 80209bc0 <digits+0x840>
    80205394:	ffffb097          	auipc	ra,0xffffb
    80205398:	db0080e7          	jalr	-592(ra) # 80200144 <panic>
    8020539c:	854a                	mv	a0,s2
    8020539e:	ffffe097          	auipc	ra,0xffffe
    802053a2:	0d2080e7          	jalr	210(ra) # 80203470 <bwrite>
    802053a6:	854a                	mv	a0,s2
    802053a8:	ffffe097          	auipc	ra,0xffffe
    802053ac:	104080e7          	jalr	260(ra) # 802034ac <brelse>
    802053b0:	a02d                	j	802053da <rw_clus+0xbe>
    802053b2:	05890613          	addi	a2,s2,88
    802053b6:	1682                	slli	a3,a3,0x20
    802053b8:	9281                	srli	a3,a3,0x20
    802053ba:	963a                	add	a2,a2,a4
    802053bc:	85da                	mv	a1,s6
    802053be:	f8843503          	ld	a0,-120(s0)
    802053c2:	ffffd097          	auipc	ra,0xffffd
    802053c6:	154080e7          	jalr	340(ra) # 80202516 <either_copyout>
    802053ca:	8baa                	mv	s7,a0
    802053cc:	854a                	mv	a0,s2
    802053ce:	ffffe097          	auipc	ra,0xffffe
    802053d2:	0de080e7          	jalr	222(ra) # 802034ac <brelse>
    802053d6:	07ab8763          	beq	s7,s10,80205444 <rw_clus+0x128>
    802053da:	01448a3b          	addw	s4,s1,s4
    802053de:	01548abb          	addw	s5,s1,s5
    802053e2:	1482                	slli	s1,s1,0x20
    802053e4:	9081                	srli	s1,s1,0x20
    802053e6:	9b26                	add	s6,s6,s1
    802053e8:	2985                	addiw	s3,s3,1
    802053ea:	058a7d63          	bgeu	s4,s8,80205444 <rw_clus+0x128>
    802053ee:	85ce                	mv	a1,s3
    802053f0:	4501                	li	a0,0
    802053f2:	ffffe097          	auipc	ra,0xffffe
    802053f6:	f8e080e7          	jalr	-114(ra) # 80203380 <bread>
    802053fa:	892a                	mv	s2,a0
    802053fc:	1ffaf713          	andi	a4,s5,511
    80205400:	414c07bb          	subw	a5,s8,s4
    80205404:	40ed863b          	subw	a2,s11,a4
    80205408:	86be                	mv	a3,a5
    8020540a:	2781                	sext.w	a5,a5
    8020540c:	0006059b          	sext.w	a1,a2
    80205410:	00f5f363          	bgeu	a1,a5,80205416 <rw_clus+0xfa>
    80205414:	86b2                	mv	a3,a2
    80205416:	0006849b          	sext.w	s1,a3
    8020541a:	f80c8ce3          	beqz	s9,802053b2 <rw_clus+0x96>
    8020541e:	05890513          	addi	a0,s2,88
    80205422:	1682                	slli	a3,a3,0x20
    80205424:	9281                	srli	a3,a3,0x20
    80205426:	865a                	mv	a2,s6
    80205428:	f8843583          	ld	a1,-120(s0)
    8020542c:	953a                	add	a0,a0,a4
    8020542e:	ffffd097          	auipc	ra,0xffffd
    80205432:	11e080e7          	jalr	286(ra) # 8020254c <either_copyin>
    80205436:	f7a513e3          	bne	a0,s10,8020539c <rw_clus+0x80>
    8020543a:	854a                	mv	a0,s2
    8020543c:	ffffe097          	auipc	ra,0xffffe
    80205440:	070080e7          	jalr	112(ra) # 802034ac <brelse>
    80205444:	8552                	mv	a0,s4
    80205446:	70e6                	ld	ra,120(sp)
    80205448:	7446                	ld	s0,112(sp)
    8020544a:	74a6                	ld	s1,104(sp)
    8020544c:	7906                	ld	s2,96(sp)
    8020544e:	69e6                	ld	s3,88(sp)
    80205450:	6a46                	ld	s4,80(sp)
    80205452:	6aa6                	ld	s5,72(sp)
    80205454:	6b06                	ld	s6,64(sp)
    80205456:	7be2                	ld	s7,56(sp)
    80205458:	7c42                	ld	s8,48(sp)
    8020545a:	7ca2                	ld	s9,40(sp)
    8020545c:	7d02                	ld	s10,32(sp)
    8020545e:	6de2                	ld	s11,24(sp)
    80205460:	6109                	addi	sp,sp,128
    80205462:	8082                	ret
    80205464:	8a62                	mv	s4,s8
    80205466:	bff9                	j	80205444 <rw_clus+0x128>

0000000080205468 <eget>:
    80205468:	7139                	addi	sp,sp,-64
    8020546a:	fc06                	sd	ra,56(sp)
    8020546c:	f822                	sd	s0,48(sp)
    8020546e:	f426                	sd	s1,40(sp)
    80205470:	f04a                	sd	s2,32(sp)
    80205472:	ec4e                	sd	s3,24(sp)
    80205474:	e852                	sd	s4,16(sp)
    80205476:	e456                	sd	s5,8(sp)
    80205478:	0080                	addi	s0,sp,64
    8020547a:	8a2a                	mv	s4,a0
    8020547c:	8aae                	mv	s5,a1
    8020547e:	00019517          	auipc	a0,0x19
    80205482:	13a50513          	addi	a0,a0,314 # 8021e5b8 <ecache>
    80205486:	ffffb097          	auipc	ra,0xffffb
    8020548a:	240080e7          	jalr	576(ra) # 802006c6 <acquire>
    8020548e:	060a8b63          	beqz	s5,80205504 <eget+0x9c>
    80205492:	00019497          	auipc	s1,0x19
    80205496:	0e64b483          	ld	s1,230(s1) # 8021e578 <root+0x128>
    8020549a:	00019797          	auipc	a5,0x19
    8020549e:	fb678793          	addi	a5,a5,-74 # 8021e450 <root>
    802054a2:	06f48163          	beq	s1,a5,80205504 <eget+0x9c>
    802054a6:	4905                	li	s2,1
    802054a8:	89be                	mv	s3,a5
    802054aa:	a029                	j	802054b4 <eget+0x4c>
    802054ac:	1284b483          	ld	s1,296(s1)
    802054b0:	05348a63          	beq	s1,s3,80205504 <eget+0x9c>
    802054b4:	11649783          	lh	a5,278(s1)
    802054b8:	ff279ae3          	bne	a5,s2,802054ac <eget+0x44>
    802054bc:	1204b783          	ld	a5,288(s1)
    802054c0:	ff4796e3          	bne	a5,s4,802054ac <eget+0x44>
    802054c4:	0ff00613          	li	a2,255
    802054c8:	85d6                	mv	a1,s5
    802054ca:	8526                	mv	a0,s1
    802054cc:	ffffb097          	auipc	ra,0xffffb
    802054d0:	36e080e7          	jalr	878(ra) # 8020083a <strncmp>
    802054d4:	fd61                	bnez	a0,802054ac <eget+0x44>
    802054d6:	1184a783          	lw	a5,280(s1)
    802054da:	0017871b          	addiw	a4,a5,1
    802054de:	10e4ac23          	sw	a4,280(s1)
    802054e2:	eb81                	bnez	a5,802054f2 <eget+0x8a>
    802054e4:	1204b703          	ld	a4,288(s1)
    802054e8:	11872783          	lw	a5,280(a4)
    802054ec:	2785                	addiw	a5,a5,1
    802054ee:	10f72c23          	sw	a5,280(a4)
    802054f2:	00019517          	auipc	a0,0x19
    802054f6:	0c650513          	addi	a0,a0,198 # 8021e5b8 <ecache>
    802054fa:	ffffb097          	auipc	ra,0xffffb
    802054fe:	220080e7          	jalr	544(ra) # 8020071a <release>
    80205502:	a085                	j	80205562 <eget+0xfa>
    80205504:	00019497          	auipc	s1,0x19
    80205508:	07c4b483          	ld	s1,124(s1) # 8021e580 <root+0x130>
    8020550c:	00019797          	auipc	a5,0x19
    80205510:	f4478793          	addi	a5,a5,-188 # 8021e450 <root>
    80205514:	00f48a63          	beq	s1,a5,80205528 <eget+0xc0>
    80205518:	873e                	mv	a4,a5
    8020551a:	1184a783          	lw	a5,280(s1)
    8020551e:	cf89                	beqz	a5,80205538 <eget+0xd0>
    80205520:	1304b483          	ld	s1,304(s1)
    80205524:	fee49be3          	bne	s1,a4,8020551a <eget+0xb2>
    80205528:	00004517          	auipc	a0,0x4
    8020552c:	6b050513          	addi	a0,a0,1712 # 80209bd8 <digits+0x858>
    80205530:	ffffb097          	auipc	ra,0xffffb
    80205534:	c14080e7          	jalr	-1004(ra) # 80200144 <panic>
    80205538:	4785                	li	a5,1
    8020553a:	10f4ac23          	sw	a5,280(s1)
    8020553e:	114a4783          	lbu	a5,276(s4)
    80205542:	10f48a23          	sb	a5,276(s1)
    80205546:	1004ae23          	sw	zero,284(s1)
    8020554a:	10049b23          	sh	zero,278(s1)
    8020554e:	10048aa3          	sb	zero,277(s1)
    80205552:	00019517          	auipc	a0,0x19
    80205556:	06650513          	addi	a0,a0,102 # 8021e5b8 <ecache>
    8020555a:	ffffb097          	auipc	ra,0xffffb
    8020555e:	1c0080e7          	jalr	448(ra) # 8020071a <release>
    80205562:	8526                	mv	a0,s1
    80205564:	70e2                	ld	ra,56(sp)
    80205566:	7442                	ld	s0,48(sp)
    80205568:	74a2                	ld	s1,40(sp)
    8020556a:	7902                	ld	s2,32(sp)
    8020556c:	69e2                	ld	s3,24(sp)
    8020556e:	6a42                	ld	s4,16(sp)
    80205570:	6aa2                	ld	s5,8(sp)
    80205572:	6121                	addi	sp,sp,64
    80205574:	8082                	ret

0000000080205576 <read_entry_name>:
    80205576:	7139                	addi	sp,sp,-64
    80205578:	fc06                	sd	ra,56(sp)
    8020557a:	f822                	sd	s0,48(sp)
    8020557c:	f426                	sd	s1,40(sp)
    8020557e:	f04a                	sd	s2,32(sp)
    80205580:	ec4e                	sd	s3,24(sp)
    80205582:	0080                	addi	s0,sp,64
    80205584:	84aa                	mv	s1,a0
    80205586:	892e                	mv	s2,a1
    80205588:	00b5c703          	lbu	a4,11(a1)
    8020558c:	47bd                	li	a5,15
    8020558e:	08f70563          	beq	a4,a5,80205618 <read_entry_name+0xa2>
    80205592:	4635                	li	a2,13
    80205594:	4581                	li	a1,0
    80205596:	ffffb097          	auipc	ra,0xffffb
    8020559a:	1cc080e7          	jalr	460(ra) # 80200762 <memset>
    8020559e:	00094703          	lbu	a4,0(s2)
    802055a2:	02000793          	li	a5,32
    802055a6:	0af70c63          	beq	a4,a5,8020565e <read_entry_name+0xe8>
    802055aa:	4785                	li	a5,1
    802055ac:	02000613          	li	a2,32
    802055b0:	45a5                	li	a1,9
    802055b2:	00f486b3          	add	a3,s1,a5
    802055b6:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
    802055ba:	0007869b          	sext.w	a3,a5
    802055be:	00f90733          	add	a4,s2,a5
    802055c2:	00074703          	lbu	a4,0(a4)
    802055c6:	00c70563          	beq	a4,a2,802055d0 <read_entry_name+0x5a>
    802055ca:	0785                	addi	a5,a5,1
    802055cc:	feb793e3          	bne	a5,a1,802055b2 <read_entry_name+0x3c>
    802055d0:	00894703          	lbu	a4,8(s2)
    802055d4:	02000793          	li	a5,32
    802055d8:	00f70963          	beq	a4,a5,802055ea <read_entry_name+0x74>
    802055dc:	00d487b3          	add	a5,s1,a3
    802055e0:	02e00713          	li	a4,46
    802055e4:	00e78023          	sb	a4,0(a5)
    802055e8:	2685                	addiw	a3,a3,1
    802055ea:	00890793          	addi	a5,s2,8
    802055ee:	94b6                	add	s1,s1,a3
    802055f0:	092d                	addi	s2,s2,11
    802055f2:	02000693          	li	a3,32
    802055f6:	0007c703          	lbu	a4,0(a5)
    802055fa:	00d70863          	beq	a4,a3,8020560a <read_entry_name+0x94>
    802055fe:	00e48023          	sb	a4,0(s1)
    80205602:	0785                	addi	a5,a5,1
    80205604:	0485                	addi	s1,s1,1
    80205606:	ff2798e3          	bne	a5,s2,802055f6 <read_entry_name+0x80>
    8020560a:	70e2                	ld	ra,56(sp)
    8020560c:	7442                	ld	s0,48(sp)
    8020560e:	74a2                	ld	s1,40(sp)
    80205610:	7902                	ld	s2,32(sp)
    80205612:	69e2                	ld	s3,24(sp)
    80205614:	6121                	addi	sp,sp,64
    80205616:	8082                	ret
    80205618:	4629                	li	a2,10
    8020561a:	0585                	addi	a1,a1,1
    8020561c:	fc040993          	addi	s3,s0,-64
    80205620:	854e                	mv	a0,s3
    80205622:	ffffb097          	auipc	ra,0xffffb
    80205626:	19c080e7          	jalr	412(ra) # 802007be <memmove>
    8020562a:	4615                	li	a2,5
    8020562c:	85ce                	mv	a1,s3
    8020562e:	8526                	mv	a0,s1
    80205630:	ffffb097          	auipc	ra,0xffffb
    80205634:	310080e7          	jalr	784(ra) # 80200940 <snstr>
    80205638:	4619                	li	a2,6
    8020563a:	00e90593          	addi	a1,s2,14
    8020563e:	00548513          	addi	a0,s1,5
    80205642:	ffffb097          	auipc	ra,0xffffb
    80205646:	2fe080e7          	jalr	766(ra) # 80200940 <snstr>
    8020564a:	4609                	li	a2,2
    8020564c:	01c90593          	addi	a1,s2,28
    80205650:	00b48513          	addi	a0,s1,11
    80205654:	ffffb097          	auipc	ra,0xffffb
    80205658:	2ec080e7          	jalr	748(ra) # 80200940 <snstr>
    8020565c:	b77d                	j	8020560a <read_entry_name+0x94>
    8020565e:	4681                	li	a3,0
    80205660:	bf85                	j	802055d0 <read_entry_name+0x5a>

0000000080205662 <fat32_init>:
    80205662:	7139                	addi	sp,sp,-64
    80205664:	fc06                	sd	ra,56(sp)
    80205666:	f822                	sd	s0,48(sp)
    80205668:	f426                	sd	s1,40(sp)
    8020566a:	f04a                	sd	s2,32(sp)
    8020566c:	ec4e                	sd	s3,24(sp)
    8020566e:	e852                	sd	s4,16(sp)
    80205670:	e456                	sd	s5,8(sp)
    80205672:	0080                	addi	s0,sp,64
    80205674:	4581                	li	a1,0
    80205676:	4501                	li	a0,0
    80205678:	ffffe097          	auipc	ra,0xffffe
    8020567c:	d08080e7          	jalr	-760(ra) # 80203380 <bread>
    80205680:	892a                	mv	s2,a0
    80205682:	4615                	li	a2,5
    80205684:	00004597          	auipc	a1,0x4
    80205688:	57458593          	addi	a1,a1,1396 # 80209bf8 <digits+0x878>
    8020568c:	0aa50513          	addi	a0,a0,170
    80205690:	ffffb097          	auipc	ra,0xffffb
    80205694:	1aa080e7          	jalr	426(ra) # 8020083a <strncmp>
    80205698:	16051863          	bnez	a0,80205808 <fat32_init+0x1a6>
    8020569c:	00019497          	auipc	s1,0x19
    802056a0:	d8c48493          	addi	s1,s1,-628 # 8021e428 <fat>
    802056a4:	4609                	li	a2,2
    802056a6:	06390593          	addi	a1,s2,99
    802056aa:	00019517          	auipc	a0,0x19
    802056ae:	d8e50513          	addi	a0,a0,-626 # 8021e438 <fat+0x10>
    802056b2:	ffffb097          	auipc	ra,0xffffb
    802056b6:	10c080e7          	jalr	268(ra) # 802007be <memmove>
    802056ba:	06594683          	lbu	a3,101(s2)
    802056be:	00d48923          	sb	a3,18(s1)
    802056c2:	06695603          	lhu	a2,102(s2)
    802056c6:	00c49a23          	sh	a2,20(s1)
    802056ca:	06894703          	lbu	a4,104(s2)
    802056ce:	00e48b23          	sb	a4,22(s1)
    802056d2:	07492783          	lw	a5,116(s2)
    802056d6:	cc9c                	sw	a5,24(s1)
    802056d8:	07892783          	lw	a5,120(s2)
    802056dc:	ccdc                	sw	a5,28(s1)
    802056de:	07c92583          	lw	a1,124(s2)
    802056e2:	d08c                	sw	a1,32(s1)
    802056e4:	08492503          	lw	a0,132(s2)
    802056e8:	d0c8                	sw	a0,36(s1)
    802056ea:	02b7073b          	mulw	a4,a4,a1
    802056ee:	9f31                	addw	a4,a4,a2
    802056f0:	c098                	sw	a4,0(s1)
    802056f2:	9f99                	subw	a5,a5,a4
    802056f4:	c0dc                	sw	a5,4(s1)
    802056f6:	02d7d7bb          	divuw	a5,a5,a3
    802056fa:	c49c                	sw	a5,8(s1)
    802056fc:	0104d783          	lhu	a5,16(s1)
    80205700:	02d787bb          	mulw	a5,a5,a3
    80205704:	c4dc                	sw	a5,12(s1)
    80205706:	854a                	mv	a0,s2
    80205708:	ffffe097          	auipc	ra,0xffffe
    8020570c:	da4080e7          	jalr	-604(ra) # 802034ac <brelse>
    80205710:	0104d703          	lhu	a4,16(s1)
    80205714:	20000793          	li	a5,512
    80205718:	10f71063          	bne	a4,a5,80205818 <fat32_init+0x1b6>
    8020571c:	00004597          	auipc	a1,0x4
    80205720:	51458593          	addi	a1,a1,1300 # 80209c30 <digits+0x8b0>
    80205724:	00019517          	auipc	a0,0x19
    80205728:	e9450513          	addi	a0,a0,-364 # 8021e5b8 <ecache>
    8020572c:	ffffb097          	auipc	ra,0xffffb
    80205730:	f56080e7          	jalr	-170(ra) # 80200682 <initlock>
    80205734:	00019497          	auipc	s1,0x19
    80205738:	cf448493          	addi	s1,s1,-780 # 8021e428 <fat>
    8020573c:	00019917          	auipc	s2,0x19
    80205740:	d1490913          	addi	s2,s2,-748 # 8021e450 <root>
    80205744:	16800613          	li	a2,360
    80205748:	4581                	li	a1,0
    8020574a:	854a                	mv	a0,s2
    8020574c:	ffffb097          	auipc	ra,0xffffb
    80205750:	016080e7          	jalr	22(ra) # 80200762 <memset>
    80205754:	00004597          	auipc	a1,0x4
    80205758:	4e458593          	addi	a1,a1,1252 # 80209c38 <digits+0x8b8>
    8020575c:	00019517          	auipc	a0,0x19
    80205760:	e2c50513          	addi	a0,a0,-468 # 8021e588 <root+0x138>
    80205764:	ffffe097          	auipc	ra,0xffffe
    80205768:	e5c080e7          	jalr	-420(ra) # 802035c0 <initsleeplock>
    8020576c:	47d1                	li	a5,20
    8020576e:	12f48423          	sb	a5,296(s1)
    80205772:	50dc                	lw	a5,36(s1)
    80205774:	12f4aa23          	sw	a5,308(s1)
    80205778:	12f4a623          	sw	a5,300(s1)
    8020577c:	4785                	li	a5,1
    8020577e:	12f49f23          	sh	a5,318(s1)
    80205782:	1524bc23          	sd	s2,344(s1)
    80205786:	1524b823          	sd	s2,336(s1)
    8020578a:	00019497          	auipc	s1,0x19
    8020578e:	e4648493          	addi	s1,s1,-442 # 8021e5d0 <ecache+0x18>
    80205792:	00019917          	auipc	s2,0x19
    80205796:	c9690913          	addi	s2,s2,-874 # 8021e428 <fat>
    8020579a:	00019a97          	auipc	s5,0x19
    8020579e:	cb6a8a93          	addi	s5,s5,-842 # 8021e450 <root>
    802057a2:	00004a17          	auipc	s4,0x4
    802057a6:	496a0a13          	addi	s4,s4,1174 # 80209c38 <digits+0x8b8>
    802057aa:	0001d997          	auipc	s3,0x1d
    802057ae:	47698993          	addi	s3,s3,1142 # 80222c20 <cons>
    802057b2:	10048a23          	sb	zero,276(s1)
    802057b6:	10049b23          	sh	zero,278(s1)
    802057ba:	1004ac23          	sw	zero,280(s1)
    802057be:	10048aa3          	sb	zero,277(s1)
    802057c2:	1204b023          	sd	zero,288(s1)
    802057c6:	15093783          	ld	a5,336(s2)
    802057ca:	12f4b423          	sd	a5,296(s1)
    802057ce:	1354b823          	sd	s5,304(s1)
    802057d2:	85d2                	mv	a1,s4
    802057d4:	13848513          	addi	a0,s1,312
    802057d8:	ffffe097          	auipc	ra,0xffffe
    802057dc:	de8080e7          	jalr	-536(ra) # 802035c0 <initsleeplock>
    802057e0:	15093783          	ld	a5,336(s2)
    802057e4:	1297b823          	sd	s1,304(a5)
    802057e8:	14993823          	sd	s1,336(s2)
    802057ec:	16848493          	addi	s1,s1,360
    802057f0:	fd3491e3          	bne	s1,s3,802057b2 <fat32_init+0x150>
    802057f4:	4501                	li	a0,0
    802057f6:	70e2                	ld	ra,56(sp)
    802057f8:	7442                	ld	s0,48(sp)
    802057fa:	74a2                	ld	s1,40(sp)
    802057fc:	7902                	ld	s2,32(sp)
    802057fe:	69e2                	ld	s3,24(sp)
    80205800:	6a42                	ld	s4,16(sp)
    80205802:	6aa2                	ld	s5,8(sp)
    80205804:	6121                	addi	sp,sp,64
    80205806:	8082                	ret
    80205808:	00004517          	auipc	a0,0x4
    8020580c:	3f850513          	addi	a0,a0,1016 # 80209c00 <digits+0x880>
    80205810:	ffffb097          	auipc	ra,0xffffb
    80205814:	934080e7          	jalr	-1740(ra) # 80200144 <panic>
    80205818:	00004517          	auipc	a0,0x4
    8020581c:	40050513          	addi	a0,a0,1024 # 80209c18 <digits+0x898>
    80205820:	ffffb097          	auipc	ra,0xffffb
    80205824:	924080e7          	jalr	-1756(ra) # 80200144 <panic>

0000000080205828 <eread>:
    80205828:	10852783          	lw	a5,264(a0)
    8020582c:	0ed7e863          	bltu	a5,a3,8020591c <eread+0xf4>
    80205830:	711d                	addi	sp,sp,-96
    80205832:	ec86                	sd	ra,88(sp)
    80205834:	e8a2                	sd	s0,80(sp)
    80205836:	e4a6                	sd	s1,72(sp)
    80205838:	e0ca                	sd	s2,64(sp)
    8020583a:	fc4e                	sd	s3,56(sp)
    8020583c:	f852                	sd	s4,48(sp)
    8020583e:	f456                	sd	s5,40(sp)
    80205840:	f05a                	sd	s6,32(sp)
    80205842:	ec5e                	sd	s7,24(sp)
    80205844:	e862                	sd	s8,16(sp)
    80205846:	e466                	sd	s9,8(sp)
    80205848:	e06a                	sd	s10,0(sp)
    8020584a:	1080                	addi	s0,sp,96
    8020584c:	8a2a                	mv	s4,a0
    8020584e:	8bae                	mv	s7,a1
    80205850:	8ab2                	mv	s5,a2
    80205852:	8936                	mv	s2,a3
    80205854:	8b3a                	mv	s6,a4
    80205856:	9eb9                	addw	a3,a3,a4
    80205858:	4501                	li	a0,0
    8020585a:	0b26e163          	bltu	a3,s2,802058fc <eread+0xd4>
    8020585e:	100a4703          	lbu	a4,256(s4)
    80205862:	8b41                	andi	a4,a4,16
    80205864:	ef41                	bnez	a4,802058fc <eread+0xd4>
    80205866:	00d7f463          	bgeu	a5,a3,8020586e <eread+0x46>
    8020586a:	41278b3b          	subw	s6,a5,s2
    8020586e:	10ca2703          	lw	a4,268(s4)
    80205872:	100007b7          	lui	a5,0x10000
    80205876:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
    80205878:	06e7ef63          	bltu	a5,a4,802058f6 <eread+0xce>
    8020587c:	080b0e63          	beqz	s6,80205918 <eread+0xf0>
    80205880:	4981                	li	s3,0
    80205882:	00019c97          	auipc	s9,0x19
    80205886:	ba6c8c93          	addi	s9,s9,-1114 # 8021e428 <fat>
    8020588a:	8c3e                	mv	s8,a5
    8020588c:	a82d                	j	802058c6 <eread+0x9e>
    8020588e:	00048d1b          	sext.w	s10,s1
    80205892:	87ea                	mv	a5,s10
    80205894:	86d6                	mv	a3,s5
    80205896:	865e                	mv	a2,s7
    80205898:	4581                	li	a1,0
    8020589a:	10ca2503          	lw	a0,268(s4)
    8020589e:	00000097          	auipc	ra,0x0
    802058a2:	a7e080e7          	jalr	-1410(ra) # 8020531c <rw_clus>
    802058a6:	2501                	sext.w	a0,a0
    802058a8:	04ad1863          	bne	s10,a0,802058f8 <eread+0xd0>
    802058ac:	013489bb          	addw	s3,s1,s3
    802058b0:	0124893b          	addw	s2,s1,s2
    802058b4:	1482                	slli	s1,s1,0x20
    802058b6:	9081                	srli	s1,s1,0x20
    802058b8:	9aa6                	add	s5,s5,s1
    802058ba:	10ca2783          	lw	a5,268(s4)
    802058be:	02fc6d63          	bltu	s8,a5,802058f8 <eread+0xd0>
    802058c2:	0369fb63          	bgeu	s3,s6,802058f8 <eread+0xd0>
    802058c6:	4601                	li	a2,0
    802058c8:	85ca                	mv	a1,s2
    802058ca:	8552                	mv	a0,s4
    802058cc:	00000097          	auipc	ra,0x0
    802058d0:	948080e7          	jalr	-1720(ra) # 80205214 <reloc_clus>
    802058d4:	00cca683          	lw	a3,12(s9)
    802058d8:	02d9763b          	remuw	a2,s2,a3
    802058dc:	0006071b          	sext.w	a4,a2
    802058e0:	413b07bb          	subw	a5,s6,s3
    802058e4:	9e91                	subw	a3,a3,a2
    802058e6:	84be                	mv	s1,a5
    802058e8:	2781                	sext.w	a5,a5
    802058ea:	0006861b          	sext.w	a2,a3
    802058ee:	faf670e3          	bgeu	a2,a5,8020588e <eread+0x66>
    802058f2:	84b6                	mv	s1,a3
    802058f4:	bf69                	j	8020588e <eread+0x66>
    802058f6:	4981                	li	s3,0
    802058f8:	0009851b          	sext.w	a0,s3
    802058fc:	60e6                	ld	ra,88(sp)
    802058fe:	6446                	ld	s0,80(sp)
    80205900:	64a6                	ld	s1,72(sp)
    80205902:	6906                	ld	s2,64(sp)
    80205904:	79e2                	ld	s3,56(sp)
    80205906:	7a42                	ld	s4,48(sp)
    80205908:	7aa2                	ld	s5,40(sp)
    8020590a:	7b02                	ld	s6,32(sp)
    8020590c:	6be2                	ld	s7,24(sp)
    8020590e:	6c42                	ld	s8,16(sp)
    80205910:	6ca2                	ld	s9,8(sp)
    80205912:	6d02                	ld	s10,0(sp)
    80205914:	6125                	addi	sp,sp,96
    80205916:	8082                	ret
    80205918:	89da                	mv	s3,s6
    8020591a:	bff9                	j	802058f8 <eread+0xd0>
    8020591c:	4501                	li	a0,0
    8020591e:	8082                	ret

0000000080205920 <ewrite>:
    80205920:	10852783          	lw	a5,264(a0)
    80205924:	10d7ec63          	bltu	a5,a3,80205a3c <ewrite+0x11c>
    80205928:	711d                	addi	sp,sp,-96
    8020592a:	ec86                	sd	ra,88(sp)
    8020592c:	e8a2                	sd	s0,80(sp)
    8020592e:	e4a6                	sd	s1,72(sp)
    80205930:	e0ca                	sd	s2,64(sp)
    80205932:	fc4e                	sd	s3,56(sp)
    80205934:	f852                	sd	s4,48(sp)
    80205936:	f456                	sd	s5,40(sp)
    80205938:	f05a                	sd	s6,32(sp)
    8020593a:	ec5e                	sd	s7,24(sp)
    8020593c:	e862                	sd	s8,16(sp)
    8020593e:	e466                	sd	s9,8(sp)
    80205940:	1080                	addi	s0,sp,96
    80205942:	8aaa                	mv	s5,a0
    80205944:	8bae                	mv	s7,a1
    80205946:	8a32                	mv	s4,a2
    80205948:	8936                	mv	s2,a3
    8020594a:	8b3a                	mv	s6,a4
    8020594c:	00e687bb          	addw	a5,a3,a4
    80205950:	0ed7e863          	bltu	a5,a3,80205a40 <ewrite+0x120>
    80205954:	02069793          	slli	a5,a3,0x20
    80205958:	9381                	srli	a5,a5,0x20
    8020595a:	1702                	slli	a4,a4,0x20
    8020595c:	9301                	srli	a4,a4,0x20
    8020595e:	97ba                	add	a5,a5,a4
    80205960:	577d                	li	a4,-1
    80205962:	9301                	srli	a4,a4,0x20
    80205964:	0ef76063          	bltu	a4,a5,80205a44 <ewrite+0x124>
    80205968:	10054783          	lbu	a5,256(a0)
    8020596c:	8b85                	andi	a5,a5,1
    8020596e:	efe9                	bnez	a5,80205a48 <ewrite+0x128>
    80205970:	10452783          	lw	a5,260(a0)
    80205974:	cb89                	beqz	a5,80205986 <ewrite+0x66>
    80205976:	0c0b0163          	beqz	s6,80205a38 <ewrite+0x118>
    8020597a:	4981                	li	s3,0
    8020597c:	00019c17          	auipc	s8,0x19
    80205980:	aacc0c13          	addi	s8,s8,-1364 # 8021e428 <fat>
    80205984:	a891                	j	802059d8 <ewrite+0xb8>
    80205986:	11454503          	lbu	a0,276(a0)
    8020598a:	fffff097          	auipc	ra,0xfffff
    8020598e:	6ca080e7          	jalr	1738(ra) # 80205054 <alloc_clus>
    80205992:	2501                	sext.w	a0,a0
    80205994:	10aaa223          	sw	a0,260(s5)
    80205998:	10aaa623          	sw	a0,268(s5)
    8020599c:	100aa823          	sw	zero,272(s5)
    802059a0:	4785                	li	a5,1
    802059a2:	10fa8aa3          	sb	a5,277(s5)
    802059a6:	bfc1                	j	80205976 <ewrite+0x56>
    802059a8:	00048c9b          	sext.w	s9,s1
    802059ac:	87e6                	mv	a5,s9
    802059ae:	86d2                	mv	a3,s4
    802059b0:	865e                	mv	a2,s7
    802059b2:	4585                	li	a1,1
    802059b4:	10caa503          	lw	a0,268(s5)
    802059b8:	00000097          	auipc	ra,0x0
    802059bc:	964080e7          	jalr	-1692(ra) # 8020531c <rw_clus>
    802059c0:	2501                	sext.w	a0,a0
    802059c2:	04ac9363          	bne	s9,a0,80205a08 <ewrite+0xe8>
    802059c6:	013489bb          	addw	s3,s1,s3
    802059ca:	0124893b          	addw	s2,s1,s2
    802059ce:	1482                	slli	s1,s1,0x20
    802059d0:	9081                	srli	s1,s1,0x20
    802059d2:	9a26                	add	s4,s4,s1
    802059d4:	0369fa63          	bgeu	s3,s6,80205a08 <ewrite+0xe8>
    802059d8:	4605                	li	a2,1
    802059da:	85ca                	mv	a1,s2
    802059dc:	8556                	mv	a0,s5
    802059de:	00000097          	auipc	ra,0x0
    802059e2:	836080e7          	jalr	-1994(ra) # 80205214 <reloc_clus>
    802059e6:	00cc2683          	lw	a3,12(s8)
    802059ea:	02d9763b          	remuw	a2,s2,a3
    802059ee:	0006071b          	sext.w	a4,a2
    802059f2:	413b07bb          	subw	a5,s6,s3
    802059f6:	9e91                	subw	a3,a3,a2
    802059f8:	84be                	mv	s1,a5
    802059fa:	2781                	sext.w	a5,a5
    802059fc:	0006861b          	sext.w	a2,a3
    80205a00:	faf674e3          	bgeu	a2,a5,802059a8 <ewrite+0x88>
    80205a04:	84b6                	mv	s1,a3
    80205a06:	b74d                	j	802059a8 <ewrite+0x88>
    80205a08:	108aa783          	lw	a5,264(s5)
    80205a0c:	0127f763          	bgeu	a5,s2,80205a1a <ewrite+0xfa>
    80205a10:	112aa423          	sw	s2,264(s5)
    80205a14:	4785                	li	a5,1
    80205a16:	10fa8aa3          	sb	a5,277(s5)
    80205a1a:	0009851b          	sext.w	a0,s3
    80205a1e:	60e6                	ld	ra,88(sp)
    80205a20:	6446                	ld	s0,80(sp)
    80205a22:	64a6                	ld	s1,72(sp)
    80205a24:	6906                	ld	s2,64(sp)
    80205a26:	79e2                	ld	s3,56(sp)
    80205a28:	7a42                	ld	s4,48(sp)
    80205a2a:	7aa2                	ld	s5,40(sp)
    80205a2c:	7b02                	ld	s6,32(sp)
    80205a2e:	6be2                	ld	s7,24(sp)
    80205a30:	6c42                	ld	s8,16(sp)
    80205a32:	6ca2                	ld	s9,8(sp)
    80205a34:	6125                	addi	sp,sp,96
    80205a36:	8082                	ret
    80205a38:	89da                	mv	s3,s6
    80205a3a:	b7c5                	j	80205a1a <ewrite+0xfa>
    80205a3c:	557d                	li	a0,-1
    80205a3e:	8082                	ret
    80205a40:	557d                	li	a0,-1
    80205a42:	bff1                	j	80205a1e <ewrite+0xfe>
    80205a44:	557d                	li	a0,-1
    80205a46:	bfe1                	j	80205a1e <ewrite+0xfe>
    80205a48:	557d                	li	a0,-1
    80205a4a:	bfd1                	j	80205a1e <ewrite+0xfe>

0000000080205a4c <formatname>:
    80205a4c:	7179                	addi	sp,sp,-48
    80205a4e:	f406                	sd	ra,40(sp)
    80205a50:	f022                	sd	s0,32(sp)
    80205a52:	ec26                	sd	s1,24(sp)
    80205a54:	e84a                	sd	s2,16(sp)
    80205a56:	e44e                	sd	s3,8(sp)
    80205a58:	e052                	sd	s4,0(sp)
    80205a5a:	1800                	addi	s0,sp,48
    80205a5c:	84aa                	mv	s1,a0
    80205a5e:	02000793          	li	a5,32
    80205a62:	02e00713          	li	a4,46
    80205a66:	a011                	j	80205a6a <formatname+0x1e>
    80205a68:	0485                	addi	s1,s1,1
    80205a6a:	0004c583          	lbu	a1,0(s1)
    80205a6e:	fef58de3          	beq	a1,a5,80205a68 <formatname+0x1c>
    80205a72:	fee58be3          	beq	a1,a4,80205a68 <formatname+0x1c>
    80205a76:	c1a9                	beqz	a1,80205ab8 <formatname+0x6c>
    80205a78:	8926                	mv	s2,s1
    80205a7a:	49fd                	li	s3,31
    80205a7c:	00006a17          	auipc	s4,0x6
    80205a80:	fa4a0a13          	addi	s4,s4,-92 # 8020ba20 <illegal.1>
    80205a84:	02b9fe63          	bgeu	s3,a1,80205ac0 <formatname+0x74>
    80205a88:	8552                	mv	a0,s4
    80205a8a:	ffffb097          	auipc	ra,0xffffb
    80205a8e:	f34080e7          	jalr	-204(ra) # 802009be <strchr>
    80205a92:	e121                	bnez	a0,80205ad2 <formatname+0x86>
    80205a94:	0905                	addi	s2,s2,1
    80205a96:	00094583          	lbu	a1,0(s2)
    80205a9a:	f5ed                	bnez	a1,80205a84 <formatname+0x38>
    80205a9c:	02000713          	li	a4,32
    80205aa0:	86ca                	mv	a3,s2
    80205aa2:	0124fd63          	bgeu	s1,s2,80205abc <formatname+0x70>
    80205aa6:	197d                	addi	s2,s2,-1
    80205aa8:	00094783          	lbu	a5,0(s2)
    80205aac:	fee78ae3          	beq	a5,a4,80205aa0 <formatname+0x54>
    80205ab0:	00068023          	sb	zero,0(a3)
    80205ab4:	8526                	mv	a0,s1
    80205ab6:	a031                	j	80205ac2 <formatname+0x76>
    80205ab8:	8926                	mv	s2,s1
    80205aba:	b7cd                	j	80205a9c <formatname+0x50>
    80205abc:	8526                	mv	a0,s1
    80205abe:	a011                	j	80205ac2 <formatname+0x76>
    80205ac0:	4501                	li	a0,0
    80205ac2:	70a2                	ld	ra,40(sp)
    80205ac4:	7402                	ld	s0,32(sp)
    80205ac6:	64e2                	ld	s1,24(sp)
    80205ac8:	6942                	ld	s2,16(sp)
    80205aca:	69a2                	ld	s3,8(sp)
    80205acc:	6a02                	ld	s4,0(sp)
    80205ace:	6145                	addi	sp,sp,48
    80205ad0:	8082                	ret
    80205ad2:	4501                	li	a0,0
    80205ad4:	b7fd                	j	80205ac2 <formatname+0x76>

0000000080205ad6 <cal_checksum>:
    80205ad6:	1141                	addi	sp,sp,-16
    80205ad8:	e422                	sd	s0,8(sp)
    80205ada:	0800                	addi	s0,sp,16
    80205adc:	87aa                	mv	a5,a0
    80205ade:	00b50613          	addi	a2,a0,11
    80205ae2:	4501                	li	a0,0
    80205ae4:	0075171b          	slliw	a4,a0,0x7
    80205ae8:	0785                	addi	a5,a5,1
    80205aea:	0015551b          	srliw	a0,a0,0x1
    80205aee:	fff7c683          	lbu	a3,-1(a5)
    80205af2:	9d35                	addw	a0,a0,a3
    80205af4:	953a                	add	a0,a0,a4
    80205af6:	0ff57513          	zext.b	a0,a0
    80205afa:	fef615e3          	bne	a2,a5,80205ae4 <cal_checksum+0xe>
    80205afe:	6422                	ld	s0,8(sp)
    80205b00:	0141                	addi	sp,sp,16
    80205b02:	8082                	ret

0000000080205b04 <emake>:
    80205b04:	7155                	addi	sp,sp,-208
    80205b06:	e586                	sd	ra,200(sp)
    80205b08:	e1a2                	sd	s0,192(sp)
    80205b0a:	fd26                	sd	s1,184(sp)
    80205b0c:	f94a                	sd	s2,176(sp)
    80205b0e:	f54e                	sd	s3,168(sp)
    80205b10:	f152                	sd	s4,160(sp)
    80205b12:	ed56                	sd	s5,152(sp)
    80205b14:	e95a                	sd	s6,144(sp)
    80205b16:	e55e                	sd	s7,136(sp)
    80205b18:	e162                	sd	s8,128(sp)
    80205b1a:	fce6                	sd	s9,120(sp)
    80205b1c:	f8ea                	sd	s10,112(sp)
    80205b1e:	f4ee                	sd	s11,104(sp)
    80205b20:	0980                	addi	s0,sp,208
    80205b22:	10054783          	lbu	a5,256(a0)
    80205b26:	8bc1                	andi	a5,a5,16
    80205b28:	c3d5                	beqz	a5,80205bcc <emake+0xc8>
    80205b2a:	8aaa                	mv	s5,a0
    80205b2c:	8d2e                	mv	s10,a1
    80205b2e:	8cb2                	mv	s9,a2
    80205b30:	01f67793          	andi	a5,a2,31
    80205b34:	e7c5                	bnez	a5,80205bdc <emake+0xd8>
    80205b36:	02000613          	li	a2,32
    80205b3a:	4581                	li	a1,0
    80205b3c:	f7040513          	addi	a0,s0,-144
    80205b40:	ffffb097          	auipc	ra,0xffffb
    80205b44:	c22080e7          	jalr	-990(ra) # 80200762 <memset>
    80205b48:	02000793          	li	a5,32
    80205b4c:	0b97ec63          	bltu	a5,s9,80205c04 <emake+0x100>
    80205b50:	080c9e63          	bnez	s9,80205bec <emake+0xe8>
    80205b54:	462d                	li	a2,11
    80205b56:	00004597          	auipc	a1,0x4
    80205b5a:	11258593          	addi	a1,a1,274 # 80209c68 <digits+0x8e8>
    80205b5e:	f7040513          	addi	a0,s0,-144
    80205b62:	ffffb097          	auipc	ra,0xffffb
    80205b66:	d14080e7          	jalr	-748(ra) # 80200876 <strncpy>
    80205b6a:	47c1                	li	a5,16
    80205b6c:	f6f40da3          	sb	a5,-133(s0)
    80205b70:	104d2783          	lw	a5,260(s10)
    80205b74:	0107d71b          	srliw	a4,a5,0x10
    80205b78:	f8e41223          	sh	a4,-124(s0)
    80205b7c:	f8f41523          	sh	a5,-118(s0)
    80205b80:	f8042623          	sw	zero,-116(s0)
    80205b84:	4605                	li	a2,1
    80205b86:	85e6                	mv	a1,s9
    80205b88:	8556                	mv	a0,s5
    80205b8a:	fffff097          	auipc	ra,0xfffff
    80205b8e:	68a080e7          	jalr	1674(ra) # 80205214 <reloc_clus>
    80205b92:	02000793          	li	a5,32
    80205b96:	0005071b          	sext.w	a4,a0
    80205b9a:	f7040693          	addi	a3,s0,-144
    80205b9e:	4601                	li	a2,0
    80205ba0:	4585                	li	a1,1
    80205ba2:	10caa503          	lw	a0,268(s5)
    80205ba6:	fffff097          	auipc	ra,0xfffff
    80205baa:	776080e7          	jalr	1910(ra) # 8020531c <rw_clus>
    80205bae:	60ae                	ld	ra,200(sp)
    80205bb0:	640e                	ld	s0,192(sp)
    80205bb2:	74ea                	ld	s1,184(sp)
    80205bb4:	794a                	ld	s2,176(sp)
    80205bb6:	79aa                	ld	s3,168(sp)
    80205bb8:	7a0a                	ld	s4,160(sp)
    80205bba:	6aea                	ld	s5,152(sp)
    80205bbc:	6b4a                	ld	s6,144(sp)
    80205bbe:	6baa                	ld	s7,136(sp)
    80205bc0:	6c0a                	ld	s8,128(sp)
    80205bc2:	7ce6                	ld	s9,120(sp)
    80205bc4:	7d46                	ld	s10,112(sp)
    80205bc6:	7da6                	ld	s11,104(sp)
    80205bc8:	6169                	addi	sp,sp,208
    80205bca:	8082                	ret
    80205bcc:	00004517          	auipc	a0,0x4
    80205bd0:	07450513          	addi	a0,a0,116 # 80209c40 <digits+0x8c0>
    80205bd4:	ffffa097          	auipc	ra,0xffffa
    80205bd8:	570080e7          	jalr	1392(ra) # 80200144 <panic>
    80205bdc:	00004517          	auipc	a0,0x4
    80205be0:	07450513          	addi	a0,a0,116 # 80209c50 <digits+0x8d0>
    80205be4:	ffffa097          	auipc	ra,0xffffa
    80205be8:	560080e7          	jalr	1376(ra) # 80200144 <panic>
    80205bec:	462d                	li	a2,11
    80205bee:	00004597          	auipc	a1,0x4
    80205bf2:	08a58593          	addi	a1,a1,138 # 80209c78 <digits+0x8f8>
    80205bf6:	f7040513          	addi	a0,s0,-144
    80205bfa:	ffffb097          	auipc	ra,0xffffb
    80205bfe:	c7c080e7          	jalr	-900(ra) # 80200876 <strncpy>
    80205c02:	b7a5                	j	80205b6a <emake+0x66>
    80205c04:	84ea                	mv	s1,s10
    80205c06:	856a                	mv	a0,s10
    80205c08:	ffffb097          	auipc	ra,0xffffb
    80205c0c:	cdc080e7          	jalr	-804(ra) # 802008e4 <strlen>
    80205c10:	f4a43023          	sd	a0,-192(s0)
    80205c14:	00c5071b          	addiw	a4,a0,12
    80205c18:	47b5                	li	a5,13
    80205c1a:	02f747bb          	divw	a5,a4,a5
    80205c1e:	f4f42c23          	sw	a5,-168(s0)
    80205c22:	00078d9b          	sext.w	s11,a5
    80205c26:	4631                	li	a2,12
    80205c28:	4581                	li	a1,0
    80205c2a:	f6040513          	addi	a0,s0,-160
    80205c2e:	ffffb097          	auipc	ra,0xffffb
    80205c32:	b34080e7          	jalr	-1228(ra) # 80200762 <memset>
    80205c36:	856a                	mv	a0,s10
    80205c38:	ffffb097          	auipc	ra,0xffffb
    80205c3c:	cac080e7          	jalr	-852(ra) # 802008e4 <strlen>
    80205c40:	fff5079b          	addiw	a5,a0,-1
    80205c44:	0207cc63          	bltz	a5,80205c7c <emake+0x178>
    80205c48:	97ea                	add	a5,a5,s10
    80205c4a:	ffed0693          	addi	a3,s10,-2
    80205c4e:	96aa                	add	a3,a3,a0
    80205c50:	fff5071b          	addiw	a4,a0,-1
    80205c54:	1702                	slli	a4,a4,0x20
    80205c56:	9301                	srli	a4,a4,0x20
    80205c58:	8e99                	sub	a3,a3,a4
    80205c5a:	02e00613          	li	a2,46
    80205c5e:	89be                	mv	s3,a5
    80205c60:	0007c703          	lbu	a4,0(a5)
    80205c64:	00c70663          	beq	a4,a2,80205c70 <emake+0x16c>
    80205c68:	17fd                	addi	a5,a5,-1
    80205c6a:	fed79ae3          	bne	a5,a3,80205c5e <emake+0x15a>
    80205c6e:	89ea                	mv	s3,s10
    80205c70:	4901                	li	s2,0
    80205c72:	4b21                	li	s6,8
    80205c74:	4ba9                	li	s7,10
    80205c76:	02000c13          	li	s8,32
    80205c7a:	a0ed                	j	80205d64 <emake+0x260>
    80205c7c:	89ea                	mv	s3,s10
    80205c7e:	bfcd                	j	80205c70 <emake+0x16c>
    80205c80:	22098f63          	beqz	s3,80205ebe <emake+0x3ba>
    80205c84:	0985                	addi	s3,s3,1
    80205c86:	0b49f663          	bgeu	s3,s4,80205d32 <emake+0x22e>
    80205c8a:	f6040793          	addi	a5,s0,-160
    80205c8e:	97ca                	add	a5,a5,s2
    80205c90:	f6140713          	addi	a4,s0,-159
    80205c94:	974a                	add	a4,a4,s2
    80205c96:	46a9                	li	a3,10
    80205c98:	412686bb          	subw	a3,a3,s2
    80205c9c:	1682                	slli	a3,a3,0x20
    80205c9e:	9281                	srli	a3,a3,0x20
    80205ca0:	9736                	add	a4,a4,a3
    80205ca2:	02000693          	li	a3,32
    80205ca6:	00d78023          	sb	a3,0(a5)
    80205caa:	0785                	addi	a5,a5,1
    80205cac:	fee79de3          	bne	a5,a4,80205ca6 <emake+0x1a2>
    80205cb0:	f6040513          	addi	a0,s0,-160
    80205cb4:	00000097          	auipc	ra,0x0
    80205cb8:	e22080e7          	jalr	-478(ra) # 80205ad6 <cal_checksum>
    80205cbc:	f6a40ea3          	sb	a0,-131(s0)
    80205cc0:	47bd                	li	a5,15
    80205cc2:	f6f40da3          	sb	a5,-133(s0)
    80205cc6:	f4043783          	ld	a5,-192(s0)
    80205cca:	14f05c63          	blez	a5,80205e22 <emake+0x31e>
    80205cce:	f5842783          	lw	a5,-168(s0)
    80205cd2:	37fd                	addiw	a5,a5,-1
    80205cd4:	f2f42e23          	sw	a5,-196(s0)
    80205cd8:	00179b1b          	slliw	s6,a5,0x1
    80205cdc:	00fb0b3b          	addw	s6,s6,a5
    80205ce0:	002b1b1b          	slliw	s6,s6,0x2
    80205ce4:	00fb0b3b          	addw	s6,s6,a5
    80205ce8:	9b6a                	add	s6,s6,s10
    80205cea:	8a6e                	mv	s4,s11
    80205cec:	8c66                	mv	s8,s9
    80205cee:	4b85                	li	s7,1
    80205cf0:	4901                	li	s2,0
    80205cf2:	f7140793          	addi	a5,s0,-143
    80205cf6:	f4f43423          	sd	a5,-184(s0)
    80205cfa:	0ff00493          	li	s1,255
    80205cfe:	f7e40793          	addi	a5,s0,-130
    80205d02:	f4f43c23          	sd	a5,-168(s0)
    80205d06:	f8c40993          	addi	s3,s0,-116
    80205d0a:	f7040793          	addi	a5,s0,-144
    80205d0e:	f4f43823          	sd	a5,-176(s0)
    80205d12:	a8d9                	j	80205de8 <emake+0x2e4>
    80205d14:	0549f563          	bgeu	s3,s4,80205d5e <emake+0x25a>
    80205d18:	4621                	li	a2,8
    80205d1a:	4126063b          	subw	a2,a2,s2
    80205d1e:	02000593          	li	a1,32
    80205d22:	f6040513          	addi	a0,s0,-160
    80205d26:	954a                	add	a0,a0,s2
    80205d28:	ffffb097          	auipc	ra,0xffffb
    80205d2c:	a3a080e7          	jalr	-1478(ra) # 80200762 <memset>
    80205d30:	89d2                	mv	s3,s4
    80205d32:	8a4e                	mv	s4,s3
    80205d34:	4921                	li	s2,8
    80205d36:	4981                	li	s3,0
    80205d38:	a02d                	j	80205d62 <emake+0x25e>
    80205d3a:	85a6                	mv	a1,s1
    80205d3c:	00006517          	auipc	a0,0x6
    80205d40:	cf450513          	addi	a0,a0,-780 # 8020ba30 <illegal.0>
    80205d44:	ffffb097          	auipc	ra,0xffffb
    80205d48:	c7a080e7          	jalr	-902(ra) # 802009be <strchr>
    80205d4c:	c119                	beqz	a0,80205d52 <emake+0x24e>
    80205d4e:	05f00493          	li	s1,95
    80205d52:	f9090793          	addi	a5,s2,-112
    80205d56:	97a2                	add	a5,a5,s0
    80205d58:	fc978823          	sb	s1,-48(a5)
    80205d5c:	2905                	addiw	s2,s2,1
    80205d5e:	f52bc9e3          	blt	s7,s2,80205cb0 <emake+0x1ac>
    80205d62:	84d2                	mv	s1,s4
    80205d64:	00148a13          	addi	s4,s1,1
    80205d68:	0004c483          	lbu	s1,0(s1)
    80205d6c:	c485                	beqz	s1,80205d94 <emake+0x290>
    80205d6e:	f16909e3          	beq	s2,s6,80205c80 <emake+0x17c>
    80205d72:	ff8486e3          	beq	s1,s8,80205d5e <emake+0x25a>
    80205d76:	02e00793          	li	a5,46
    80205d7a:	f8f48de3          	beq	s1,a5,80205d14 <emake+0x210>
    80205d7e:	f9f4879b          	addiw	a5,s1,-97
    80205d82:	0ff7f793          	zext.b	a5,a5
    80205d86:	4765                	li	a4,25
    80205d88:	faf769e3          	bltu	a4,a5,80205d3a <emake+0x236>
    80205d8c:	3481                	addiw	s1,s1,-32
    80205d8e:	0ff4f493          	zext.b	s1,s1
    80205d92:	b7c1                	j	80205d52 <emake+0x24e>
    80205d94:	47a9                	li	a5,10
    80205d96:	ef27dae3          	bge	a5,s2,80205c8a <emake+0x186>
    80205d9a:	bf19                	j	80205cb0 <emake+0x1ac>
    80205d9c:	0407e793          	ori	a5,a5,64
    80205da0:	a881                	j	80205df0 <emake+0x2ec>
    80205da2:	00054683          	lbu	a3,0(a0)
    80205da6:	0016b593          	seqz	a1,a3
    80205daa:	00270813          	addi	a6,a4,2
    80205dae:	0505                	addi	a0,a0,1
    80205db0:	864a                	mv	a2,s2
    80205db2:	a8cd                	j	80205ea4 <emake+0x3a0>
    80205db4:	865e                	mv	a2,s7
    80205db6:	85e2                	mv	a1,s8
    80205db8:	8556                	mv	a0,s5
    80205dba:	fffff097          	auipc	ra,0xfffff
    80205dbe:	45a080e7          	jalr	1114(ra) # 80205214 <reloc_clus>
    80205dc2:	02000793          	li	a5,32
    80205dc6:	0005071b          	sext.w	a4,a0
    80205dca:	f5043683          	ld	a3,-176(s0)
    80205dce:	864a                	mv	a2,s2
    80205dd0:	85de                	mv	a1,s7
    80205dd2:	10caa503          	lw	a0,268(s5)
    80205dd6:	fffff097          	auipc	ra,0xfffff
    80205dda:	546080e7          	jalr	1350(ra) # 8020531c <rw_clus>
    80205dde:	020c0c1b          	addiw	s8,s8,32
    80205de2:	1b4d                	addi	s6,s6,-13
    80205de4:	03405263          	blez	s4,80205e08 <emake+0x304>
    80205de8:	0ffa7793          	zext.b	a5,s4
    80205dec:	fbb788e3          	beq	a5,s11,80205d9c <emake+0x298>
    80205df0:	f6f40823          	sb	a5,-144(s0)
    80205df4:	3a7d                	addiw	s4,s4,-1
    80205df6:	855a                	mv	a0,s6
    80205df8:	87de                	mv	a5,s7
    80205dfa:	85ca                	mv	a1,s2
    80205dfc:	f4843703          	ld	a4,-184(s0)
    80205e00:	4315                	li	t1,5
    80205e02:	48ad                	li	a7,11
    80205e04:	4e39                	li	t3,14
    80205e06:	a851                	j	80205e9a <emake+0x396>
    80205e08:	020c8c9b          	addiw	s9,s9,32
    80205e0c:	4781                	li	a5,0
    80205e0e:	f4043703          	ld	a4,-192(s0)
    80205e12:	00e05663          	blez	a4,80205e1e <emake+0x31a>
    80205e16:	f3c42783          	lw	a5,-196(s0)
    80205e1a:	0057979b          	slliw	a5,a5,0x5
    80205e1e:	01978cbb          	addw	s9,a5,s9
    80205e22:	02000613          	li	a2,32
    80205e26:	4581                	li	a1,0
    80205e28:	f7040493          	addi	s1,s0,-144
    80205e2c:	8526                	mv	a0,s1
    80205e2e:	ffffb097          	auipc	ra,0xffffb
    80205e32:	934080e7          	jalr	-1740(ra) # 80200762 <memset>
    80205e36:	462d                	li	a2,11
    80205e38:	f6040593          	addi	a1,s0,-160
    80205e3c:	8526                	mv	a0,s1
    80205e3e:	ffffb097          	auipc	ra,0xffffb
    80205e42:	a38080e7          	jalr	-1480(ra) # 80200876 <strncpy>
    80205e46:	100d4783          	lbu	a5,256(s10)
    80205e4a:	f6f40da3          	sb	a5,-133(s0)
    80205e4e:	104d2783          	lw	a5,260(s10)
    80205e52:	0107d71b          	srliw	a4,a5,0x10
    80205e56:	f8e41223          	sh	a4,-124(s0)
    80205e5a:	f8f41523          	sh	a5,-118(s0)
    80205e5e:	108d2783          	lw	a5,264(s10)
    80205e62:	f8f42623          	sw	a5,-116(s0)
    80205e66:	4605                	li	a2,1
    80205e68:	85e6                	mv	a1,s9
    80205e6a:	8556                	mv	a0,s5
    80205e6c:	fffff097          	auipc	ra,0xfffff
    80205e70:	3a8080e7          	jalr	936(ra) # 80205214 <reloc_clus>
    80205e74:	02000793          	li	a5,32
    80205e78:	0005071b          	sext.w	a4,a0
    80205e7c:	86a6                	mv	a3,s1
    80205e7e:	4601                	li	a2,0
    80205e80:	4585                	li	a1,1
    80205e82:	10caa503          	lw	a0,268(s5)
    80205e86:	fffff097          	auipc	ra,0xfffff
    80205e8a:	496080e7          	jalr	1174(ra) # 8020531c <rw_clus>
    80205e8e:	b305                	j	80205bae <emake+0xaa>
    80205e90:	f5843703          	ld	a4,-168(s0)
    80205e94:	a011                	j	80205e98 <emake+0x394>
    80205e96:	874e                	mv	a4,s3
    80205e98:	2785                	addiw	a5,a5,1
    80205e9a:	d581                	beqz	a1,80205da2 <emake+0x29e>
    80205e9c:	00270813          	addi	a6,a4,2
    80205ea0:	86a6                	mv	a3,s1
    80205ea2:	8626                	mv	a2,s1
    80205ea4:	00d70023          	sb	a3,0(a4)
    80205ea8:	00c700a3          	sb	a2,1(a4)
    80205eac:	fe6782e3          	beq	a5,t1,80205e90 <emake+0x38c>
    80205eb0:	ff1783e3          	beq	a5,a7,80205e96 <emake+0x392>
    80205eb4:	2785                	addiw	a5,a5,1
    80205eb6:	efc78fe3          	beq	a5,t3,80205db4 <emake+0x2b0>
    80205eba:	8742                	mv	a4,a6
    80205ebc:	bff9                	j	80205e9a <emake+0x396>
    80205ebe:	02000793          	li	a5,32
    80205ec2:	eaf49ae3          	bne	s1,a5,80205d76 <emake+0x272>
    80205ec6:	bd71                	j	80205d62 <emake+0x25e>

0000000080205ec8 <edup>:
    80205ec8:	1101                	addi	sp,sp,-32
    80205eca:	ec06                	sd	ra,24(sp)
    80205ecc:	e822                	sd	s0,16(sp)
    80205ece:	e426                	sd	s1,8(sp)
    80205ed0:	1000                	addi	s0,sp,32
    80205ed2:	84aa                	mv	s1,a0
    80205ed4:	c515                	beqz	a0,80205f00 <edup+0x38>
    80205ed6:	00018517          	auipc	a0,0x18
    80205eda:	6e250513          	addi	a0,a0,1762 # 8021e5b8 <ecache>
    80205ede:	ffffa097          	auipc	ra,0xffffa
    80205ee2:	7e8080e7          	jalr	2024(ra) # 802006c6 <acquire>
    80205ee6:	1184a783          	lw	a5,280(s1)
    80205eea:	2785                	addiw	a5,a5,1
    80205eec:	10f4ac23          	sw	a5,280(s1)
    80205ef0:	00018517          	auipc	a0,0x18
    80205ef4:	6c850513          	addi	a0,a0,1736 # 8021e5b8 <ecache>
    80205ef8:	ffffb097          	auipc	ra,0xffffb
    80205efc:	822080e7          	jalr	-2014(ra) # 8020071a <release>
    80205f00:	8526                	mv	a0,s1
    80205f02:	60e2                	ld	ra,24(sp)
    80205f04:	6442                	ld	s0,16(sp)
    80205f06:	64a2                	ld	s1,8(sp)
    80205f08:	6105                	addi	sp,sp,32
    80205f0a:	8082                	ret

0000000080205f0c <eupdate>:
    80205f0c:	11554783          	lbu	a5,277(a0)
    80205f10:	c3e5                	beqz	a5,80205ff0 <eupdate+0xe4>
    80205f12:	711d                	addi	sp,sp,-96
    80205f14:	ec86                	sd	ra,88(sp)
    80205f16:	e8a2                	sd	s0,80(sp)
    80205f18:	e4a6                	sd	s1,72(sp)
    80205f1a:	e0ca                	sd	s2,64(sp)
    80205f1c:	fc4e                	sd	s3,56(sp)
    80205f1e:	1080                	addi	s0,sp,96
    80205f20:	84aa                	mv	s1,a0
    80205f22:	11651703          	lh	a4,278(a0)
    80205f26:	4785                	li	a5,1
    80205f28:	00f70963          	beq	a4,a5,80205f3a <eupdate+0x2e>
    80205f2c:	60e6                	ld	ra,88(sp)
    80205f2e:	6446                	ld	s0,80(sp)
    80205f30:	64a6                	ld	s1,72(sp)
    80205f32:	6906                	ld	s2,64(sp)
    80205f34:	79e2                	ld	s3,56(sp)
    80205f36:	6125                	addi	sp,sp,96
    80205f38:	8082                	ret
    80205f3a:	fc042623          	sw	zero,-52(s0)
    80205f3e:	4601                	li	a2,0
    80205f40:	11c52583          	lw	a1,284(a0)
    80205f44:	12053503          	ld	a0,288(a0)
    80205f48:	fffff097          	auipc	ra,0xfffff
    80205f4c:	2cc080e7          	jalr	716(ra) # 80205214 <reloc_clus>
    80205f50:	1204b803          	ld	a6,288(s1)
    80205f54:	4785                	li	a5,1
    80205f56:	0005071b          	sext.w	a4,a0
    80205f5a:	fcc40693          	addi	a3,s0,-52
    80205f5e:	4601                	li	a2,0
    80205f60:	4581                	li	a1,0
    80205f62:	10c82503          	lw	a0,268(a6)
    80205f66:	fffff097          	auipc	ra,0xfffff
    80205f6a:	3b6080e7          	jalr	950(ra) # 8020531c <rw_clus>
    80205f6e:	fcc42583          	lw	a1,-52(s0)
    80205f72:	fbf5f593          	andi	a1,a1,-65
    80205f76:	fcb42623          	sw	a1,-52(s0)
    80205f7a:	0055959b          	slliw	a1,a1,0x5
    80205f7e:	11c4a783          	lw	a5,284(s1)
    80205f82:	4601                	li	a2,0
    80205f84:	9dbd                	addw	a1,a1,a5
    80205f86:	1204b503          	ld	a0,288(s1)
    80205f8a:	fffff097          	auipc	ra,0xfffff
    80205f8e:	28a080e7          	jalr	650(ra) # 80205214 <reloc_clus>
    80205f92:	0005099b          	sext.w	s3,a0
    80205f96:	1204b503          	ld	a0,288(s1)
    80205f9a:	02000793          	li	a5,32
    80205f9e:	874e                	mv	a4,s3
    80205fa0:	fa840913          	addi	s2,s0,-88
    80205fa4:	86ca                	mv	a3,s2
    80205fa6:	4601                	li	a2,0
    80205fa8:	4581                	li	a1,0
    80205faa:	10c52503          	lw	a0,268(a0)
    80205fae:	fffff097          	auipc	ra,0xfffff
    80205fb2:	36e080e7          	jalr	878(ra) # 8020531c <rw_clus>
    80205fb6:	1044a783          	lw	a5,260(s1)
    80205fba:	0107d71b          	srliw	a4,a5,0x10
    80205fbe:	fae41e23          	sh	a4,-68(s0)
    80205fc2:	fcf41123          	sh	a5,-62(s0)
    80205fc6:	1084a783          	lw	a5,264(s1)
    80205fca:	fcf42223          	sw	a5,-60(s0)
    80205fce:	1204b503          	ld	a0,288(s1)
    80205fd2:	02000793          	li	a5,32
    80205fd6:	874e                	mv	a4,s3
    80205fd8:	86ca                	mv	a3,s2
    80205fda:	4601                	li	a2,0
    80205fdc:	4585                	li	a1,1
    80205fde:	10c52503          	lw	a0,268(a0)
    80205fe2:	fffff097          	auipc	ra,0xfffff
    80205fe6:	33a080e7          	jalr	826(ra) # 8020531c <rw_clus>
    80205fea:	10048aa3          	sb	zero,277(s1)
    80205fee:	bf3d                	j	80205f2c <eupdate+0x20>
    80205ff0:	8082                	ret

0000000080205ff2 <eremove>:
    80205ff2:	11651703          	lh	a4,278(a0)
    80205ff6:	4785                	li	a5,1
    80205ff8:	00f70363          	beq	a4,a5,80205ffe <eremove+0xc>
    80205ffc:	8082                	ret
    80205ffe:	715d                	addi	sp,sp,-80
    80206000:	e486                	sd	ra,72(sp)
    80206002:	e0a2                	sd	s0,64(sp)
    80206004:	fc26                	sd	s1,56(sp)
    80206006:	f84a                	sd	s2,48(sp)
    80206008:	f44e                	sd	s3,40(sp)
    8020600a:	f052                	sd	s4,32(sp)
    8020600c:	ec56                	sd	s5,24(sp)
    8020600e:	0880                	addi	s0,sp,80
    80206010:	89aa                	mv	s3,a0
    80206012:	fa042e23          	sw	zero,-68(s0)
    80206016:	11c52a03          	lw	s4,284(a0)
    8020601a:	4601                	li	a2,0
    8020601c:	85d2                	mv	a1,s4
    8020601e:	12053503          	ld	a0,288(a0)
    80206022:	fffff097          	auipc	ra,0xfffff
    80206026:	1f2080e7          	jalr	498(ra) # 80205214 <reloc_clus>
    8020602a:	0005049b          	sext.w	s1,a0
    8020602e:	1209b503          	ld	a0,288(s3)
    80206032:	4785                	li	a5,1
    80206034:	8726                	mv	a4,s1
    80206036:	fbc40693          	addi	a3,s0,-68
    8020603a:	4601                	li	a2,0
    8020603c:	4581                	li	a1,0
    8020603e:	10c52503          	lw	a0,268(a0)
    80206042:	fffff097          	auipc	ra,0xfffff
    80206046:	2da080e7          	jalr	730(ra) # 8020531c <rw_clus>
    8020604a:	fbc42783          	lw	a5,-68(s0)
    8020604e:	fbf7f793          	andi	a5,a5,-65
    80206052:	faf42e23          	sw	a5,-68(s0)
    80206056:	5795                	li	a5,-27
    80206058:	faf40da3          	sb	a5,-69(s0)
    8020605c:	4901                	li	s2,0
    8020605e:	fbb40a93          	addi	s5,s0,-69
    80206062:	1209b503          	ld	a0,288(s3)
    80206066:	4785                	li	a5,1
    80206068:	8726                	mv	a4,s1
    8020606a:	86d6                	mv	a3,s5
    8020606c:	4601                	li	a2,0
    8020606e:	4585                	li	a1,1
    80206070:	10c52503          	lw	a0,268(a0)
    80206074:	fffff097          	auipc	ra,0xfffff
    80206078:	2a8080e7          	jalr	680(ra) # 8020531c <rw_clus>
    8020607c:	020a0a1b          	addiw	s4,s4,32
    80206080:	4601                	li	a2,0
    80206082:	85d2                	mv	a1,s4
    80206084:	1209b503          	ld	a0,288(s3)
    80206088:	fffff097          	auipc	ra,0xfffff
    8020608c:	18c080e7          	jalr	396(ra) # 80205214 <reloc_clus>
    80206090:	0005049b          	sext.w	s1,a0
    80206094:	0019079b          	addiw	a5,s2,1
    80206098:	0007891b          	sext.w	s2,a5
    8020609c:	fbc42703          	lw	a4,-68(s0)
    802060a0:	fd2771e3          	bgeu	a4,s2,80206062 <eremove+0x70>
    802060a4:	57fd                	li	a5,-1
    802060a6:	10f99b23          	sh	a5,278(s3)
    802060aa:	60a6                	ld	ra,72(sp)
    802060ac:	6406                	ld	s0,64(sp)
    802060ae:	74e2                	ld	s1,56(sp)
    802060b0:	7942                	ld	s2,48(sp)
    802060b2:	79a2                	ld	s3,40(sp)
    802060b4:	7a02                	ld	s4,32(sp)
    802060b6:	6ae2                	ld	s5,24(sp)
    802060b8:	6161                	addi	sp,sp,80
    802060ba:	8082                	ret

00000000802060bc <etrunc>:
    802060bc:	7179                	addi	sp,sp,-48
    802060be:	f406                	sd	ra,40(sp)
    802060c0:	f022                	sd	s0,32(sp)
    802060c2:	ec26                	sd	s1,24(sp)
    802060c4:	e84a                	sd	s2,16(sp)
    802060c6:	e44e                	sd	s3,8(sp)
    802060c8:	e052                	sd	s4,0(sp)
    802060ca:	1800                	addi	s0,sp,48
    802060cc:	8a2a                	mv	s4,a0
    802060ce:	10452483          	lw	s1,260(a0)
    802060d2:	ffe4871b          	addiw	a4,s1,-2
    802060d6:	100007b7          	lui	a5,0x10000
    802060da:	17d5                	addi	a5,a5,-11 # ffffff5 <_entry-0x7020000b>
    802060dc:	02e7e663          	bltu	a5,a4,80206108 <etrunc+0x4c>
    802060e0:	89be                	mv	s3,a5
    802060e2:	0004891b          	sext.w	s2,s1
    802060e6:	8526                	mv	a0,s1
    802060e8:	fffff097          	auipc	ra,0xfffff
    802060ec:	ef6080e7          	jalr	-266(ra) # 80204fde <read_fat>
    802060f0:	0005049b          	sext.w	s1,a0
    802060f4:	4581                	li	a1,0
    802060f6:	854a                	mv	a0,s2
    802060f8:	fffff097          	auipc	ra,0xfffff
    802060fc:	09c080e7          	jalr	156(ra) # 80205194 <write_fat>
    80206100:	ffe4879b          	addiw	a5,s1,-2
    80206104:	fcf9ffe3          	bgeu	s3,a5,802060e2 <etrunc+0x26>
    80206108:	100a2423          	sw	zero,264(s4)
    8020610c:	100a2223          	sw	zero,260(s4)
    80206110:	4785                	li	a5,1
    80206112:	10fa0aa3          	sb	a5,277(s4)
    80206116:	70a2                	ld	ra,40(sp)
    80206118:	7402                	ld	s0,32(sp)
    8020611a:	64e2                	ld	s1,24(sp)
    8020611c:	6942                	ld	s2,16(sp)
    8020611e:	69a2                	ld	s3,8(sp)
    80206120:	6a02                	ld	s4,0(sp)
    80206122:	6145                	addi	sp,sp,48
    80206124:	8082                	ret

0000000080206126 <elock>:
    80206126:	1141                	addi	sp,sp,-16
    80206128:	e406                	sd	ra,8(sp)
    8020612a:	e022                	sd	s0,0(sp)
    8020612c:	0800                	addi	s0,sp,16
    8020612e:	cd19                	beqz	a0,8020614c <elock+0x26>
    80206130:	11852783          	lw	a5,280(a0)
    80206134:	00f05c63          	blez	a5,8020614c <elock+0x26>
    80206138:	13850513          	addi	a0,a0,312
    8020613c:	ffffd097          	auipc	ra,0xffffd
    80206140:	4be080e7          	jalr	1214(ra) # 802035fa <acquiresleep>
    80206144:	60a2                	ld	ra,8(sp)
    80206146:	6402                	ld	s0,0(sp)
    80206148:	0141                	addi	sp,sp,16
    8020614a:	8082                	ret
    8020614c:	00004517          	auipc	a0,0x4
    80206150:	b3c50513          	addi	a0,a0,-1220 # 80209c88 <digits+0x908>
    80206154:	ffffa097          	auipc	ra,0xffffa
    80206158:	ff0080e7          	jalr	-16(ra) # 80200144 <panic>

000000008020615c <eunlock>:
    8020615c:	1101                	addi	sp,sp,-32
    8020615e:	ec06                	sd	ra,24(sp)
    80206160:	e822                	sd	s0,16(sp)
    80206162:	e426                	sd	s1,8(sp)
    80206164:	e04a                	sd	s2,0(sp)
    80206166:	1000                	addi	s0,sp,32
    80206168:	c90d                	beqz	a0,8020619a <eunlock+0x3e>
    8020616a:	84aa                	mv	s1,a0
    8020616c:	13850913          	addi	s2,a0,312
    80206170:	854a                	mv	a0,s2
    80206172:	ffffd097          	auipc	ra,0xffffd
    80206176:	522080e7          	jalr	1314(ra) # 80203694 <holdingsleep>
    8020617a:	c105                	beqz	a0,8020619a <eunlock+0x3e>
    8020617c:	1184a783          	lw	a5,280(s1)
    80206180:	00f05d63          	blez	a5,8020619a <eunlock+0x3e>
    80206184:	854a                	mv	a0,s2
    80206186:	ffffd097          	auipc	ra,0xffffd
    8020618a:	4ca080e7          	jalr	1226(ra) # 80203650 <releasesleep>
    8020618e:	60e2                	ld	ra,24(sp)
    80206190:	6442                	ld	s0,16(sp)
    80206192:	64a2                	ld	s1,8(sp)
    80206194:	6902                	ld	s2,0(sp)
    80206196:	6105                	addi	sp,sp,32
    80206198:	8082                	ret
    8020619a:	00004517          	auipc	a0,0x4
    8020619e:	af650513          	addi	a0,a0,-1290 # 80209c90 <digits+0x910>
    802061a2:	ffffa097          	auipc	ra,0xffffa
    802061a6:	fa2080e7          	jalr	-94(ra) # 80200144 <panic>

00000000802061aa <eput>:
    802061aa:	1101                	addi	sp,sp,-32
    802061ac:	ec06                	sd	ra,24(sp)
    802061ae:	e822                	sd	s0,16(sp)
    802061b0:	e426                	sd	s1,8(sp)
    802061b2:	e04a                	sd	s2,0(sp)
    802061b4:	1000                	addi	s0,sp,32
    802061b6:	84aa                	mv	s1,a0
    802061b8:	00018517          	auipc	a0,0x18
    802061bc:	40050513          	addi	a0,a0,1024 # 8021e5b8 <ecache>
    802061c0:	ffffa097          	auipc	ra,0xffffa
    802061c4:	506080e7          	jalr	1286(ra) # 802006c6 <acquire>
    802061c8:	00018797          	auipc	a5,0x18
    802061cc:	28878793          	addi	a5,a5,648 # 8021e450 <root>
    802061d0:	00f48a63          	beq	s1,a5,802061e4 <eput+0x3a>
    802061d4:	11649783          	lh	a5,278(s1)
    802061d8:	c791                	beqz	a5,802061e4 <eput+0x3a>
    802061da:	1184a703          	lw	a4,280(s1)
    802061de:	4785                	li	a5,1
    802061e0:	02f70563          	beq	a4,a5,8020620a <eput+0x60>
    802061e4:	1184a783          	lw	a5,280(s1)
    802061e8:	37fd                	addiw	a5,a5,-1
    802061ea:	10f4ac23          	sw	a5,280(s1)
    802061ee:	00018517          	auipc	a0,0x18
    802061f2:	3ca50513          	addi	a0,a0,970 # 8021e5b8 <ecache>
    802061f6:	ffffa097          	auipc	ra,0xffffa
    802061fa:	524080e7          	jalr	1316(ra) # 8020071a <release>
    802061fe:	60e2                	ld	ra,24(sp)
    80206200:	6442                	ld	s0,16(sp)
    80206202:	64a2                	ld	s1,8(sp)
    80206204:	6902                	ld	s2,0(sp)
    80206206:	6105                	addi	sp,sp,32
    80206208:	8082                	ret
    8020620a:	13848913          	addi	s2,s1,312
    8020620e:	854a                	mv	a0,s2
    80206210:	ffffd097          	auipc	ra,0xffffd
    80206214:	3ea080e7          	jalr	1002(ra) # 802035fa <acquiresleep>
    80206218:	1284b703          	ld	a4,296(s1)
    8020621c:	1304b783          	ld	a5,304(s1)
    80206220:	12f73823          	sd	a5,304(a4)
    80206224:	1284b703          	ld	a4,296(s1)
    80206228:	12e7b423          	sd	a4,296(a5)
    8020622c:	00018797          	auipc	a5,0x18
    80206230:	1fc78793          	addi	a5,a5,508 # 8021e428 <fat>
    80206234:	1507b703          	ld	a4,336(a5)
    80206238:	12e4b423          	sd	a4,296(s1)
    8020623c:	00018697          	auipc	a3,0x18
    80206240:	21468693          	addi	a3,a3,532 # 8021e450 <root>
    80206244:	12d4b823          	sd	a3,304(s1)
    80206248:	12973823          	sd	s1,304(a4)
    8020624c:	1497b823          	sd	s1,336(a5)
    80206250:	00018517          	auipc	a0,0x18
    80206254:	36850513          	addi	a0,a0,872 # 8021e5b8 <ecache>
    80206258:	ffffa097          	auipc	ra,0xffffa
    8020625c:	4c2080e7          	jalr	1218(ra) # 8020071a <release>
    80206260:	11649703          	lh	a4,278(s1)
    80206264:	57fd                	li	a5,-1
    80206266:	06f70863          	beq	a4,a5,802062d6 <eput+0x12c>
    8020626a:	1204b503          	ld	a0,288(s1)
    8020626e:	00000097          	auipc	ra,0x0
    80206272:	eb8080e7          	jalr	-328(ra) # 80206126 <elock>
    80206276:	8526                	mv	a0,s1
    80206278:	00000097          	auipc	ra,0x0
    8020627c:	c94080e7          	jalr	-876(ra) # 80205f0c <eupdate>
    80206280:	1204b503          	ld	a0,288(s1)
    80206284:	00000097          	auipc	ra,0x0
    80206288:	ed8080e7          	jalr	-296(ra) # 8020615c <eunlock>
    8020628c:	854a                	mv	a0,s2
    8020628e:	ffffd097          	auipc	ra,0xffffd
    80206292:	3c2080e7          	jalr	962(ra) # 80203650 <releasesleep>
    80206296:	1204b903          	ld	s2,288(s1)
    8020629a:	00018517          	auipc	a0,0x18
    8020629e:	31e50513          	addi	a0,a0,798 # 8021e5b8 <ecache>
    802062a2:	ffffa097          	auipc	ra,0xffffa
    802062a6:	424080e7          	jalr	1060(ra) # 802006c6 <acquire>
    802062aa:	1184a783          	lw	a5,280(s1)
    802062ae:	37fd                	addiw	a5,a5,-1
    802062b0:	10f4ac23          	sw	a5,280(s1)
    802062b4:	00018517          	auipc	a0,0x18
    802062b8:	30450513          	addi	a0,a0,772 # 8021e5b8 <ecache>
    802062bc:	ffffa097          	auipc	ra,0xffffa
    802062c0:	45e080e7          	jalr	1118(ra) # 8020071a <release>
    802062c4:	1184a783          	lw	a5,280(s1)
    802062c8:	fb9d                	bnez	a5,802061fe <eput+0x54>
    802062ca:	854a                	mv	a0,s2
    802062cc:	00000097          	auipc	ra,0x0
    802062d0:	ede080e7          	jalr	-290(ra) # 802061aa <eput>
    802062d4:	b72d                	j	802061fe <eput+0x54>
    802062d6:	8526                	mv	a0,s1
    802062d8:	00000097          	auipc	ra,0x0
    802062dc:	de4080e7          	jalr	-540(ra) # 802060bc <etrunc>
    802062e0:	b775                	j	8020628c <eput+0xe2>

00000000802062e2 <estat>:
    802062e2:	1101                	addi	sp,sp,-32
    802062e4:	ec06                	sd	ra,24(sp)
    802062e6:	e822                	sd	s0,16(sp)
    802062e8:	e426                	sd	s1,8(sp)
    802062ea:	e04a                	sd	s2,0(sp)
    802062ec:	1000                	addi	s0,sp,32
    802062ee:	892a                	mv	s2,a0
    802062f0:	84ae                	mv	s1,a1
    802062f2:	02000613          	li	a2,32
    802062f6:	85aa                	mv	a1,a0
    802062f8:	8526                	mv	a0,s1
    802062fa:	ffffa097          	auipc	ra,0xffffa
    802062fe:	57c080e7          	jalr	1404(ra) # 80200876 <strncpy>
    80206302:	10094783          	lbu	a5,256(s2)
    80206306:	8bc1                	andi	a5,a5,16
    80206308:	0017b793          	seqz	a5,a5
    8020630c:	0785                	addi	a5,a5,1
    8020630e:	02f49423          	sh	a5,40(s1)
    80206312:	11494783          	lbu	a5,276(s2)
    80206316:	d0dc                	sw	a5,36(s1)
    80206318:	10896783          	lwu	a5,264(s2)
    8020631c:	f89c                	sd	a5,48(s1)
    8020631e:	60e2                	ld	ra,24(sp)
    80206320:	6442                	ld	s0,16(sp)
    80206322:	64a2                	ld	s1,8(sp)
    80206324:	6902                	ld	s2,0(sp)
    80206326:	6105                	addi	sp,sp,32
    80206328:	8082                	ret

000000008020632a <enext>:
    8020632a:	7119                	addi	sp,sp,-128
    8020632c:	fc86                	sd	ra,120(sp)
    8020632e:	f8a2                	sd	s0,112(sp)
    80206330:	f4a6                	sd	s1,104(sp)
    80206332:	f0ca                	sd	s2,96(sp)
    80206334:	ecce                	sd	s3,88(sp)
    80206336:	e8d2                	sd	s4,80(sp)
    80206338:	e4d6                	sd	s5,72(sp)
    8020633a:	e0da                	sd	s6,64(sp)
    8020633c:	fc5e                	sd	s7,56(sp)
    8020633e:	f862                	sd	s8,48(sp)
    80206340:	f466                	sd	s9,40(sp)
    80206342:	0100                	addi	s0,sp,128
    80206344:	10054783          	lbu	a5,256(a0)
    80206348:	8bc1                	andi	a5,a5,16
    8020634a:	cf95                	beqz	a5,80206386 <enext+0x5c>
    8020634c:	892a                	mv	s2,a0
    8020634e:	89ae                	mv	s3,a1
    80206350:	84b2                	mv	s1,a2
    80206352:	8ab6                	mv	s5,a3
    80206354:	11659783          	lh	a5,278(a1)
    80206358:	ef9d                	bnez	a5,80206396 <enext+0x6c>
    8020635a:	01f67793          	andi	a5,a2,31
    8020635e:	e7a1                	bnez	a5,802063a6 <enext+0x7c>
    80206360:	11651703          	lh	a4,278(a0)
    80206364:	4785                	li	a5,1
    80206366:	557d                	li	a0,-1
    80206368:	04f70763          	beq	a4,a5,802063b6 <enext+0x8c>
    8020636c:	70e6                	ld	ra,120(sp)
    8020636e:	7446                	ld	s0,112(sp)
    80206370:	74a6                	ld	s1,104(sp)
    80206372:	7906                	ld	s2,96(sp)
    80206374:	69e6                	ld	s3,88(sp)
    80206376:	6a46                	ld	s4,80(sp)
    80206378:	6aa6                	ld	s5,72(sp)
    8020637a:	6b06                	ld	s6,64(sp)
    8020637c:	7be2                	ld	s7,56(sp)
    8020637e:	7c42                	ld	s8,48(sp)
    80206380:	7ca2                	ld	s9,40(sp)
    80206382:	6109                	addi	sp,sp,128
    80206384:	8082                	ret
    80206386:	00004517          	auipc	a0,0x4
    8020638a:	91250513          	addi	a0,a0,-1774 # 80209c98 <digits+0x918>
    8020638e:	ffffa097          	auipc	ra,0xffffa
    80206392:	db6080e7          	jalr	-586(ra) # 80200144 <panic>
    80206396:	00004517          	auipc	a0,0x4
    8020639a:	91250513          	addi	a0,a0,-1774 # 80209ca8 <digits+0x928>
    8020639e:	ffffa097          	auipc	ra,0xffffa
    802063a2:	da6080e7          	jalr	-602(ra) # 80200144 <panic>
    802063a6:	00004517          	auipc	a0,0x4
    802063aa:	91250513          	addi	a0,a0,-1774 # 80209cb8 <digits+0x938>
    802063ae:	ffffa097          	auipc	ra,0xffffa
    802063b2:	d96080e7          	jalr	-618(ra) # 80200144 <panic>
    802063b6:	10000613          	li	a2,256
    802063ba:	4581                	li	a1,0
    802063bc:	854e                	mv	a0,s3
    802063be:	ffffa097          	auipc	ra,0xffffa
    802063c2:	3a4080e7          	jalr	932(ra) # 80200762 <memset>
    802063c6:	4b01                	li	s6,0
    802063c8:	5bfd                	li	s7,-1
    802063ca:	f8040a13          	addi	s4,s0,-128
    802063ce:	0e500c13          	li	s8,229
    802063d2:	4cbd                	li	s9,15
    802063d4:	a03d                	j	80206402 <enext+0xd8>
    802063d6:	2b05                	addiw	s6,s6,1
    802063d8:	a01d                	j	802063fe <enext+0xd4>
    802063da:	016aa023          	sw	s6,0(s5)
    802063de:	4501                	li	a0,0
    802063e0:	b771                	j	8020636c <enext+0x42>
    802063e2:	fff7079b          	addiw	a5,a4,-1
    802063e6:	0017951b          	slliw	a0,a5,0x1
    802063ea:	9d3d                	addw	a0,a0,a5
    802063ec:	0025151b          	slliw	a0,a0,0x2
    802063f0:	9d3d                	addw	a0,a0,a5
    802063f2:	85d2                	mv	a1,s4
    802063f4:	954e                	add	a0,a0,s3
    802063f6:	fffff097          	auipc	ra,0xfffff
    802063fa:	180080e7          	jalr	384(ra) # 80205576 <read_entry_name>
    802063fe:	0204849b          	addiw	s1,s1,32
    80206402:	4601                	li	a2,0
    80206404:	85a6                	mv	a1,s1
    80206406:	854a                	mv	a0,s2
    80206408:	fffff097          	auipc	ra,0xfffff
    8020640c:	e0c080e7          	jalr	-500(ra) # 80205214 <reloc_clus>
    80206410:	f5750ee3          	beq	a0,s7,8020636c <enext+0x42>
    80206414:	02000793          	li	a5,32
    80206418:	0005071b          	sext.w	a4,a0
    8020641c:	86d2                	mv	a3,s4
    8020641e:	4601                	li	a2,0
    80206420:	4581                	li	a1,0
    80206422:	10c92503          	lw	a0,268(s2)
    80206426:	fffff097          	auipc	ra,0xfffff
    8020642a:	ef6080e7          	jalr	-266(ra) # 8020531c <rw_clus>
    8020642e:	2501                	sext.w	a0,a0
    80206430:	02000793          	li	a5,32
    80206434:	06f51c63          	bne	a0,a5,802064ac <enext+0x182>
    80206438:	f8044783          	lbu	a5,-128(s0)
    8020643c:	cbb5                	beqz	a5,802064b0 <enext+0x186>
    8020643e:	f9878ce3          	beq	a5,s8,802063d6 <enext+0xac>
    80206442:	f80b1ce3          	bnez	s6,802063da <enext+0xb0>
    80206446:	f8b44703          	lbu	a4,-117(s0)
    8020644a:	01971d63          	bne	a4,s9,80206464 <enext+0x13a>
    8020644e:	0bf7f713          	andi	a4,a5,191
    80206452:	0407f793          	andi	a5,a5,64
    80206456:	d7d1                	beqz	a5,802063e2 <enext+0xb8>
    80206458:	0017079b          	addiw	a5,a4,1
    8020645c:	00faa023          	sw	a5,0(s5)
    80206460:	4a81                	li	s5,0
    80206462:	b741                	j	802063e2 <enext+0xb8>
    80206464:	000a8c63          	beqz	s5,8020647c <enext+0x152>
    80206468:	4785                	li	a5,1
    8020646a:	00faa023          	sw	a5,0(s5)
    8020646e:	f8040593          	addi	a1,s0,-128
    80206472:	854e                	mv	a0,s3
    80206474:	fffff097          	auipc	ra,0xfffff
    80206478:	102080e7          	jalr	258(ra) # 80205576 <read_entry_name>
    8020647c:	f8b44783          	lbu	a5,-117(s0)
    80206480:	10f98023          	sb	a5,256(s3)
    80206484:	f9445783          	lhu	a5,-108(s0)
    80206488:	0107979b          	slliw	a5,a5,0x10
    8020648c:	f9a45703          	lhu	a4,-102(s0)
    80206490:	8fd9                	or	a5,a5,a4
    80206492:	2781                	sext.w	a5,a5
    80206494:	10f9a223          	sw	a5,260(s3)
    80206498:	f9c42703          	lw	a4,-100(s0)
    8020649c:	10e9a423          	sw	a4,264(s3)
    802064a0:	10f9a623          	sw	a5,268(s3)
    802064a4:	1009a823          	sw	zero,272(s3)
    802064a8:	4505                	li	a0,1
    802064aa:	b5c9                	j	8020636c <enext+0x42>
    802064ac:	557d                	li	a0,-1
    802064ae:	bd7d                	j	8020636c <enext+0x42>
    802064b0:	557d                	li	a0,-1
    802064b2:	bd6d                	j	8020636c <enext+0x42>

00000000802064b4 <dirlookup>:
    802064b4:	711d                	addi	sp,sp,-96
    802064b6:	ec86                	sd	ra,88(sp)
    802064b8:	e8a2                	sd	s0,80(sp)
    802064ba:	e4a6                	sd	s1,72(sp)
    802064bc:	e0ca                	sd	s2,64(sp)
    802064be:	fc4e                	sd	s3,56(sp)
    802064c0:	f852                	sd	s4,48(sp)
    802064c2:	f456                	sd	s5,40(sp)
    802064c4:	f05a                	sd	s6,32(sp)
    802064c6:	ec5e                	sd	s7,24(sp)
    802064c8:	1080                	addi	s0,sp,96
    802064ca:	10054783          	lbu	a5,256(a0)
    802064ce:	8bc1                	andi	a5,a5,16
    802064d0:	cbb1                	beqz	a5,80206524 <dirlookup+0x70>
    802064d2:	84aa                	mv	s1,a0
    802064d4:	89ae                	mv	s3,a1
    802064d6:	8ab2                	mv	s5,a2
    802064d8:	0ff00613          	li	a2,255
    802064dc:	00004597          	auipc	a1,0x4
    802064e0:	80458593          	addi	a1,a1,-2044 # 80209ce0 <digits+0x960>
    802064e4:	854e                	mv	a0,s3
    802064e6:	ffffa097          	auipc	ra,0xffffa
    802064ea:	354080e7          	jalr	852(ra) # 8020083a <strncmp>
    802064ee:	c139                	beqz	a0,80206534 <dirlookup+0x80>
    802064f0:	0ff00613          	li	a2,255
    802064f4:	00003597          	auipc	a1,0x3
    802064f8:	7f458593          	addi	a1,a1,2036 # 80209ce8 <digits+0x968>
    802064fc:	854e                	mv	a0,s3
    802064fe:	ffffa097          	auipc	ra,0xffffa
    80206502:	33c080e7          	jalr	828(ra) # 8020083a <strncmp>
    80206506:	e125                	bnez	a0,80206566 <dirlookup+0xb2>
    80206508:	00018797          	auipc	a5,0x18
    8020650c:	f4878793          	addi	a5,a5,-184 # 8021e450 <root>
    80206510:	04f48463          	beq	s1,a5,80206558 <dirlookup+0xa4>
    80206514:	1204b503          	ld	a0,288(s1)
    80206518:	00000097          	auipc	ra,0x0
    8020651c:	9b0080e7          	jalr	-1616(ra) # 80205ec8 <edup>
    80206520:	892a                	mv	s2,a0
    80206522:	a839                	j	80206540 <dirlookup+0x8c>
    80206524:	00003517          	auipc	a0,0x3
    80206528:	7a450513          	addi	a0,a0,1956 # 80209cc8 <digits+0x948>
    8020652c:	ffffa097          	auipc	ra,0xffffa
    80206530:	c18080e7          	jalr	-1000(ra) # 80200144 <panic>
    80206534:	8526                	mv	a0,s1
    80206536:	00000097          	auipc	ra,0x0
    8020653a:	992080e7          	jalr	-1646(ra) # 80205ec8 <edup>
    8020653e:	892a                	mv	s2,a0
    80206540:	854a                	mv	a0,s2
    80206542:	60e6                	ld	ra,88(sp)
    80206544:	6446                	ld	s0,80(sp)
    80206546:	64a6                	ld	s1,72(sp)
    80206548:	6906                	ld	s2,64(sp)
    8020654a:	79e2                	ld	s3,56(sp)
    8020654c:	7a42                	ld	s4,48(sp)
    8020654e:	7aa2                	ld	s5,40(sp)
    80206550:	7b02                	ld	s6,32(sp)
    80206552:	6be2                	ld	s7,24(sp)
    80206554:	6125                	addi	sp,sp,96
    80206556:	8082                	ret
    80206558:	853e                	mv	a0,a5
    8020655a:	00000097          	auipc	ra,0x0
    8020655e:	96e080e7          	jalr	-1682(ra) # 80205ec8 <edup>
    80206562:	892a                	mv	s2,a0
    80206564:	bff1                	j	80206540 <dirlookup+0x8c>
    80206566:	11649703          	lh	a4,278(s1)
    8020656a:	4785                	li	a5,1
    8020656c:	4901                	li	s2,0
    8020656e:	fcf719e3          	bne	a4,a5,80206540 <dirlookup+0x8c>
    80206572:	85ce                	mv	a1,s3
    80206574:	8526                	mv	a0,s1
    80206576:	fffff097          	auipc	ra,0xfffff
    8020657a:	ef2080e7          	jalr	-270(ra) # 80205468 <eget>
    8020657e:	892a                	mv	s2,a0
    80206580:	11651703          	lh	a4,278(a0)
    80206584:	4785                	li	a5,1
    80206586:	faf70de3          	beq	a4,a5,80206540 <dirlookup+0x8c>
    8020658a:	854e                	mv	a0,s3
    8020658c:	ffffa097          	auipc	ra,0xffffa
    80206590:	358080e7          	jalr	856(ra) # 802008e4 <strlen>
    80206594:	fa042623          	sw	zero,-84(s0)
    80206598:	4601                	li	a2,0
    8020659a:	4581                	li	a1,0
    8020659c:	8526                	mv	a0,s1
    8020659e:	fffff097          	auipc	ra,0xfffff
    802065a2:	c76080e7          	jalr	-906(ra) # 80205214 <reloc_clus>
    802065a6:	4a01                	li	s4,0
    802065a8:	fac40b93          	addi	s7,s0,-84
    802065ac:	5b7d                	li	s6,-1
    802065ae:	86de                	mv	a3,s7
    802065b0:	8652                	mv	a2,s4
    802065b2:	85ca                	mv	a1,s2
    802065b4:	8526                	mv	a0,s1
    802065b6:	00000097          	auipc	ra,0x0
    802065ba:	d74080e7          	jalr	-652(ra) # 8020632a <enext>
    802065be:	03650f63          	beq	a0,s6,802065fc <dirlookup+0x148>
    802065c2:	0ff00613          	li	a2,255
    802065c6:	85ca                	mv	a1,s2
    802065c8:	854e                	mv	a0,s3
    802065ca:	ffffa097          	auipc	ra,0xffffa
    802065ce:	270080e7          	jalr	624(ra) # 8020083a <strncmp>
    802065d2:	c901                	beqz	a0,802065e2 <dirlookup+0x12e>
    802065d4:	fac42783          	lw	a5,-84(s0)
    802065d8:	0057979b          	slliw	a5,a5,0x5
    802065dc:	01478a3b          	addw	s4,a5,s4
    802065e0:	b7f9                	j	802065ae <dirlookup+0xfa>
    802065e2:	8526                	mv	a0,s1
    802065e4:	00000097          	auipc	ra,0x0
    802065e8:	8e4080e7          	jalr	-1820(ra) # 80205ec8 <edup>
    802065ec:	12a93023          	sd	a0,288(s2)
    802065f0:	11492e23          	sw	s4,284(s2)
    802065f4:	4785                	li	a5,1
    802065f6:	10f91b23          	sh	a5,278(s2)
    802065fa:	b799                	j	80206540 <dirlookup+0x8c>
    802065fc:	000a8463          	beqz	s5,80206604 <dirlookup+0x150>
    80206600:	014aa023          	sw	s4,0(s5)
    80206604:	854a                	mv	a0,s2
    80206606:	00000097          	auipc	ra,0x0
    8020660a:	ba4080e7          	jalr	-1116(ra) # 802061aa <eput>
    8020660e:	4901                	li	s2,0
    80206610:	bf05                	j	80206540 <dirlookup+0x8c>

0000000080206612 <ealloc>:
    80206612:	715d                	addi	sp,sp,-80
    80206614:	e486                	sd	ra,72(sp)
    80206616:	e0a2                	sd	s0,64(sp)
    80206618:	fc26                	sd	s1,56(sp)
    8020661a:	f84a                	sd	s2,48(sp)
    8020661c:	f44e                	sd	s3,40(sp)
    8020661e:	f052                	sd	s4,32(sp)
    80206620:	ec56                	sd	s5,24(sp)
    80206622:	0880                	addi	s0,sp,80
    80206624:	892a                	mv	s2,a0
    80206626:	10054783          	lbu	a5,256(a0)
    8020662a:	8bc1                	andi	a5,a5,16
    8020662c:	c7b1                	beqz	a5,80206678 <ealloc+0x66>
    8020662e:	852e                	mv	a0,a1
    80206630:	8a32                	mv	s4,a2
    80206632:	11691703          	lh	a4,278(s2)
    80206636:	4785                	li	a5,1
    80206638:	4481                	li	s1,0
    8020663a:	02f71563          	bne	a4,a5,80206664 <ealloc+0x52>
    8020663e:	fffff097          	auipc	ra,0xfffff
    80206642:	40e080e7          	jalr	1038(ra) # 80205a4c <formatname>
    80206646:	89aa                	mv	s3,a0
    80206648:	10050663          	beqz	a0,80206754 <ealloc+0x142>
    8020664c:	fa042e23          	sw	zero,-68(s0)
    80206650:	fbc40613          	addi	a2,s0,-68
    80206654:	85aa                	mv	a1,a0
    80206656:	854a                	mv	a0,s2
    80206658:	00000097          	auipc	ra,0x0
    8020665c:	e5c080e7          	jalr	-420(ra) # 802064b4 <dirlookup>
    80206660:	84aa                	mv	s1,a0
    80206662:	c11d                	beqz	a0,80206688 <ealloc+0x76>
    80206664:	8526                	mv	a0,s1
    80206666:	60a6                	ld	ra,72(sp)
    80206668:	6406                	ld	s0,64(sp)
    8020666a:	74e2                	ld	s1,56(sp)
    8020666c:	7942                	ld	s2,48(sp)
    8020666e:	79a2                	ld	s3,40(sp)
    80206670:	7a02                	ld	s4,32(sp)
    80206672:	6ae2                	ld	s5,24(sp)
    80206674:	6161                	addi	sp,sp,80
    80206676:	8082                	ret
    80206678:	00003517          	auipc	a0,0x3
    8020667c:	67850513          	addi	a0,a0,1656 # 80209cf0 <digits+0x970>
    80206680:	ffffa097          	auipc	ra,0xffffa
    80206684:	ac4080e7          	jalr	-1340(ra) # 80200144 <panic>
    80206688:	85ce                	mv	a1,s3
    8020668a:	854a                	mv	a0,s2
    8020668c:	fffff097          	auipc	ra,0xfffff
    80206690:	ddc080e7          	jalr	-548(ra) # 80205468 <eget>
    80206694:	84aa                	mv	s1,a0
    80206696:	00000097          	auipc	ra,0x0
    8020669a:	a90080e7          	jalr	-1392(ra) # 80206126 <elock>
    8020669e:	11448023          	sb	s4,256(s1)
    802066a2:	1004a423          	sw	zero,264(s1)
    802066a6:	1004a223          	sw	zero,260(s1)
    802066aa:	854a                	mv	a0,s2
    802066ac:	00000097          	auipc	ra,0x0
    802066b0:	81c080e7          	jalr	-2020(ra) # 80205ec8 <edup>
    802066b4:	12a4b023          	sd	a0,288(s1)
    802066b8:	fbc42a83          	lw	s5,-68(s0)
    802066bc:	1154ae23          	sw	s5,284(s1)
    802066c0:	1004a823          	sw	zero,272(s1)
    802066c4:	1004a623          	sw	zero,268(s1)
    802066c8:	10048aa3          	sb	zero,277(s1)
    802066cc:	0ff00613          	li	a2,255
    802066d0:	85ce                	mv	a1,s3
    802066d2:	8526                	mv	a0,s1
    802066d4:	ffffa097          	auipc	ra,0xffffa
    802066d8:	1a2080e7          	jalr	418(ra) # 80200876 <strncpy>
    802066dc:	0e048fa3          	sb	zero,255(s1)
    802066e0:	47c1                	li	a5,16
    802066e2:	02fa0863          	beq	s4,a5,80206712 <ealloc+0x100>
    802066e6:	1004c783          	lbu	a5,256(s1)
    802066ea:	0207e793          	ori	a5,a5,32
    802066ee:	10f48023          	sb	a5,256(s1)
    802066f2:	8656                	mv	a2,s5
    802066f4:	85a6                	mv	a1,s1
    802066f6:	854a                	mv	a0,s2
    802066f8:	fffff097          	auipc	ra,0xfffff
    802066fc:	40c080e7          	jalr	1036(ra) # 80205b04 <emake>
    80206700:	4785                	li	a5,1
    80206702:	10f49b23          	sh	a5,278(s1)
    80206706:	8526                	mv	a0,s1
    80206708:	00000097          	auipc	ra,0x0
    8020670c:	a54080e7          	jalr	-1452(ra) # 8020615c <eunlock>
    80206710:	bf91                	j	80206664 <ealloc+0x52>
    80206712:	1004c783          	lbu	a5,256(s1)
    80206716:	0107e793          	ori	a5,a5,16
    8020671a:	10f48023          	sb	a5,256(s1)
    8020671e:	11494503          	lbu	a0,276(s2)
    80206722:	fffff097          	auipc	ra,0xfffff
    80206726:	932080e7          	jalr	-1742(ra) # 80205054 <alloc_clus>
    8020672a:	2501                	sext.w	a0,a0
    8020672c:	10a4a223          	sw	a0,260(s1)
    80206730:	10a4a623          	sw	a0,268(s1)
    80206734:	4601                	li	a2,0
    80206736:	85a6                	mv	a1,s1
    80206738:	8526                	mv	a0,s1
    8020673a:	fffff097          	auipc	ra,0xfffff
    8020673e:	3ca080e7          	jalr	970(ra) # 80205b04 <emake>
    80206742:	02000613          	li	a2,32
    80206746:	85ca                	mv	a1,s2
    80206748:	8526                	mv	a0,s1
    8020674a:	fffff097          	auipc	ra,0xfffff
    8020674e:	3ba080e7          	jalr	954(ra) # 80205b04 <emake>
    80206752:	b745                	j	802066f2 <ealloc+0xe0>
    80206754:	84aa                	mv	s1,a0
    80206756:	b739                	j	80206664 <ealloc+0x52>

0000000080206758 <lookup_path>:
    80206758:	715d                	addi	sp,sp,-80
    8020675a:	e486                	sd	ra,72(sp)
    8020675c:	e0a2                	sd	s0,64(sp)
    8020675e:	fc26                	sd	s1,56(sp)
    80206760:	f84a                	sd	s2,48(sp)
    80206762:	f44e                	sd	s3,40(sp)
    80206764:	f052                	sd	s4,32(sp)
    80206766:	ec56                	sd	s5,24(sp)
    80206768:	e85a                	sd	s6,16(sp)
    8020676a:	e45e                	sd	s7,8(sp)
    8020676c:	e062                	sd	s8,0(sp)
    8020676e:	0880                	addi	s0,sp,80
    80206770:	84aa                	mv	s1,a0
    80206772:	8b2e                	mv	s6,a1
    80206774:	8ab2                	mv	s5,a2
    80206776:	00054783          	lbu	a5,0(a0)
    8020677a:	02f00713          	li	a4,47
    8020677e:	02e78663          	beq	a5,a4,802067aa <lookup_path+0x52>
    80206782:	4981                	li	s3,0
    80206784:	cba1                	beqz	a5,802067d4 <lookup_path+0x7c>
    80206786:	ffffb097          	auipc	ra,0xffffb
    8020678a:	2ba080e7          	jalr	698(ra) # 80201a40 <myproc>
    8020678e:	15853503          	ld	a0,344(a0)
    80206792:	fffff097          	auipc	ra,0xfffff
    80206796:	736080e7          	jalr	1846(ra) # 80205ec8 <edup>
    8020679a:	89aa                	mv	s3,a0
    8020679c:	02f00913          	li	s2,47
    802067a0:	0ff00b93          	li	s7,255
    802067a4:	0ff00c13          	li	s8,255
    802067a8:	a0d5                	j	8020688c <lookup_path+0x134>
    802067aa:	00018517          	auipc	a0,0x18
    802067ae:	ca650513          	addi	a0,a0,-858 # 8021e450 <root>
    802067b2:	fffff097          	auipc	ra,0xfffff
    802067b6:	716080e7          	jalr	1814(ra) # 80205ec8 <edup>
    802067ba:	89aa                	mv	s3,a0
    802067bc:	b7c5                	j	8020679c <lookup_path+0x44>
    802067be:	854e                	mv	a0,s3
    802067c0:	00000097          	auipc	ra,0x0
    802067c4:	99c080e7          	jalr	-1636(ra) # 8020615c <eunlock>
    802067c8:	854e                	mv	a0,s3
    802067ca:	00000097          	auipc	ra,0x0
    802067ce:	9e0080e7          	jalr	-1568(ra) # 802061aa <eput>
    802067d2:	4981                	li	s3,0
    802067d4:	854e                	mv	a0,s3
    802067d6:	60a6                	ld	ra,72(sp)
    802067d8:	6406                	ld	s0,64(sp)
    802067da:	74e2                	ld	s1,56(sp)
    802067dc:	7942                	ld	s2,48(sp)
    802067de:	79a2                	ld	s3,40(sp)
    802067e0:	7a02                	ld	s4,32(sp)
    802067e2:	6ae2                	ld	s5,24(sp)
    802067e4:	6b42                	ld	s6,16(sp)
    802067e6:	6ba2                	ld	s7,8(sp)
    802067e8:	6c02                	ld	s8,0(sp)
    802067ea:	6161                	addi	sp,sp,80
    802067ec:	8082                	ret
    802067ee:	854e                	mv	a0,s3
    802067f0:	00000097          	auipc	ra,0x0
    802067f4:	96c080e7          	jalr	-1684(ra) # 8020615c <eunlock>
    802067f8:	bff1                	j	802067d4 <lookup_path+0x7c>
    802067fa:	854e                	mv	a0,s3
    802067fc:	00000097          	auipc	ra,0x0
    80206800:	960080e7          	jalr	-1696(ra) # 8020615c <eunlock>
    80206804:	854e                	mv	a0,s3
    80206806:	00000097          	auipc	ra,0x0
    8020680a:	9a4080e7          	jalr	-1628(ra) # 802061aa <eput>
    8020680e:	89d2                	mv	s3,s4
    80206810:	b7d1                	j	802067d4 <lookup_path+0x7c>
    80206812:	40b487b3          	sub	a5,s1,a1
    80206816:	863e                	mv	a2,a5
    80206818:	2781                	sext.w	a5,a5
    8020681a:	00fbd363          	bge	s7,a5,80206820 <lookup_path+0xc8>
    8020681e:	8662                	mv	a2,s8
    80206820:	0006079b          	sext.w	a5,a2
    80206824:	97d6                	add	a5,a5,s5
    80206826:	00078023          	sb	zero,0(a5)
    8020682a:	2601                	sext.w	a2,a2
    8020682c:	8556                	mv	a0,s5
    8020682e:	ffffa097          	auipc	ra,0xffffa
    80206832:	f90080e7          	jalr	-112(ra) # 802007be <memmove>
    80206836:	0004c783          	lbu	a5,0(s1)
    8020683a:	01279763          	bne	a5,s2,80206848 <lookup_path+0xf0>
    8020683e:	0485                	addi	s1,s1,1
    80206840:	0004c783          	lbu	a5,0(s1)
    80206844:	ff278de3          	beq	a5,s2,8020683e <lookup_path+0xe6>
    80206848:	854e                	mv	a0,s3
    8020684a:	00000097          	auipc	ra,0x0
    8020684e:	8dc080e7          	jalr	-1828(ra) # 80206126 <elock>
    80206852:	1009c783          	lbu	a5,256(s3)
    80206856:	8bc1                	andi	a5,a5,16
    80206858:	d3bd                	beqz	a5,802067be <lookup_path+0x66>
    8020685a:	000b0563          	beqz	s6,80206864 <lookup_path+0x10c>
    8020685e:	0004c783          	lbu	a5,0(s1)
    80206862:	d7d1                	beqz	a5,802067ee <lookup_path+0x96>
    80206864:	4601                	li	a2,0
    80206866:	85d6                	mv	a1,s5
    80206868:	854e                	mv	a0,s3
    8020686a:	00000097          	auipc	ra,0x0
    8020686e:	c4a080e7          	jalr	-950(ra) # 802064b4 <dirlookup>
    80206872:	8a2a                	mv	s4,a0
    80206874:	d159                	beqz	a0,802067fa <lookup_path+0xa2>
    80206876:	854e                	mv	a0,s3
    80206878:	00000097          	auipc	ra,0x0
    8020687c:	8e4080e7          	jalr	-1820(ra) # 8020615c <eunlock>
    80206880:	854e                	mv	a0,s3
    80206882:	00000097          	auipc	ra,0x0
    80206886:	928080e7          	jalr	-1752(ra) # 802061aa <eput>
    8020688a:	89d2                	mv	s3,s4
    8020688c:	0004c783          	lbu	a5,0(s1)
    80206890:	03279b63          	bne	a5,s2,802068c6 <lookup_path+0x16e>
    80206894:	0485                	addi	s1,s1,1
    80206896:	0004c783          	lbu	a5,0(s1)
    8020689a:	ff278de3          	beq	a5,s2,80206894 <lookup_path+0x13c>
    8020689e:	cb99                	beqz	a5,802068b4 <lookup_path+0x15c>
    802068a0:	85a6                	mv	a1,s1
    802068a2:	f72788e3          	beq	a5,s2,80206812 <lookup_path+0xba>
    802068a6:	d7b5                	beqz	a5,80206812 <lookup_path+0xba>
    802068a8:	0485                	addi	s1,s1,1
    802068aa:	0004c783          	lbu	a5,0(s1)
    802068ae:	ff279ce3          	bne	a5,s2,802068a6 <lookup_path+0x14e>
    802068b2:	b785                	j	80206812 <lookup_path+0xba>
    802068b4:	f20b00e3          	beqz	s6,802067d4 <lookup_path+0x7c>
    802068b8:	854e                	mv	a0,s3
    802068ba:	00000097          	auipc	ra,0x0
    802068be:	8f0080e7          	jalr	-1808(ra) # 802061aa <eput>
    802068c2:	4981                	li	s3,0
    802068c4:	bf01                	j	802067d4 <lookup_path+0x7c>
    802068c6:	d7fd                	beqz	a5,802068b4 <lookup_path+0x15c>
    802068c8:	0004c783          	lbu	a5,0(s1)
    802068cc:	85a6                	mv	a1,s1
    802068ce:	bfe1                	j	802068a6 <lookup_path+0x14e>

00000000802068d0 <ename>:
    802068d0:	716d                	addi	sp,sp,-272
    802068d2:	e606                	sd	ra,264(sp)
    802068d4:	e222                	sd	s0,256(sp)
    802068d6:	0a00                	addi	s0,sp,272
    802068d8:	ef040613          	addi	a2,s0,-272
    802068dc:	4581                	li	a1,0
    802068de:	00000097          	auipc	ra,0x0
    802068e2:	e7a080e7          	jalr	-390(ra) # 80206758 <lookup_path>
    802068e6:	60b2                	ld	ra,264(sp)
    802068e8:	6412                	ld	s0,256(sp)
    802068ea:	6151                	addi	sp,sp,272
    802068ec:	8082                	ret

00000000802068ee <enameparent>:
    802068ee:	1141                	addi	sp,sp,-16
    802068f0:	e406                	sd	ra,8(sp)
    802068f2:	e022                	sd	s0,0(sp)
    802068f4:	0800                	addi	s0,sp,16
    802068f6:	862e                	mv	a2,a1
    802068f8:	4585                	li	a1,1
    802068fa:	00000097          	auipc	ra,0x0
    802068fe:	e5e080e7          	jalr	-418(ra) # 80206758 <lookup_path>
    80206902:	60a2                	ld	ra,8(sp)
    80206904:	6402                	ld	s0,0(sp)
    80206906:	0141                	addi	sp,sp,16
    80206908:	8082                	ret

000000008020690a <plicinit>:
    8020690a:	1141                	addi	sp,sp,-16
    8020690c:	e422                	sd	s0,8(sp)
    8020690e:	0800                	addi	s0,sp,16
    80206910:	00fc37b7          	lui	a5,0xfc3
    80206914:	07ba                	slli	a5,a5,0xe
    80206916:	4705                	li	a4,1
    80206918:	c3d8                	sw	a4,4(a5)
    8020691a:	d798                	sw	a4,40(a5)
    8020691c:	6422                	ld	s0,8(sp)
    8020691e:	0141                	addi	sp,sp,16
    80206920:	8082                	ret

0000000080206922 <plicinithart>:
    80206922:	1141                	addi	sp,sp,-16
    80206924:	e406                	sd	ra,8(sp)
    80206926:	e022                	sd	s0,0(sp)
    80206928:	0800                	addi	s0,sp,16
    8020692a:	ffffb097          	auipc	ra,0xffffb
    8020692e:	0ea080e7          	jalr	234(ra) # 80201a14 <cpuid>
    80206932:	0085171b          	slliw	a4,a0,0x8
    80206936:	01f867b7          	lui	a5,0x1f86
    8020693a:	0785                	addi	a5,a5,1 # 1f86001 <_entry-0x7e279fff>
    8020693c:	07b6                	slli	a5,a5,0xd
    8020693e:	97ba                	add	a5,a5,a4
    80206940:	40200713          	li	a4,1026
    80206944:	08e7a023          	sw	a4,128(a5)
    80206948:	00d5151b          	slliw	a0,a0,0xd
    8020694c:	03f0c7b7          	lui	a5,0x3f0c
    80206950:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80206954:	07b2                	slli	a5,a5,0xc
    80206956:	97aa                	add	a5,a5,a0
    80206958:	0007a023          	sw	zero,0(a5)
    8020695c:	60a2                	ld	ra,8(sp)
    8020695e:	6402                	ld	s0,0(sp)
    80206960:	0141                	addi	sp,sp,16
    80206962:	8082                	ret

0000000080206964 <plic_claim>:
    80206964:	1141                	addi	sp,sp,-16
    80206966:	e406                	sd	ra,8(sp)
    80206968:	e022                	sd	s0,0(sp)
    8020696a:	0800                	addi	s0,sp,16
    8020696c:	ffffb097          	auipc	ra,0xffffb
    80206970:	0a8080e7          	jalr	168(ra) # 80201a14 <cpuid>
    80206974:	00d5151b          	slliw	a0,a0,0xd
    80206978:	03f0c7b7          	lui	a5,0x3f0c
    8020697c:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80206980:	07b2                	slli	a5,a5,0xc
    80206982:	97aa                	add	a5,a5,a0
    80206984:	43c8                	lw	a0,4(a5)
    80206986:	60a2                	ld	ra,8(sp)
    80206988:	6402                	ld	s0,0(sp)
    8020698a:	0141                	addi	sp,sp,16
    8020698c:	8082                	ret

000000008020698e <plic_complete>:
    8020698e:	1101                	addi	sp,sp,-32
    80206990:	ec06                	sd	ra,24(sp)
    80206992:	e822                	sd	s0,16(sp)
    80206994:	e426                	sd	s1,8(sp)
    80206996:	1000                	addi	s0,sp,32
    80206998:	84aa                	mv	s1,a0
    8020699a:	ffffb097          	auipc	ra,0xffffb
    8020699e:	07a080e7          	jalr	122(ra) # 80201a14 <cpuid>
    802069a2:	00d5151b          	slliw	a0,a0,0xd
    802069a6:	03f0c7b7          	lui	a5,0x3f0c
    802069aa:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    802069ae:	07b2                	slli	a5,a5,0xc
    802069b0:	97aa                	add	a5,a5,a0
    802069b2:	c3c4                	sw	s1,4(a5)
    802069b4:	60e2                	ld	ra,24(sp)
    802069b6:	6442                	ld	s0,16(sp)
    802069b8:	64a2                	ld	s1,8(sp)
    802069ba:	6105                	addi	sp,sp,32
    802069bc:	8082                	ret

00000000802069be <consolewrite>:
    802069be:	715d                	addi	sp,sp,-80
    802069c0:	e486                	sd	ra,72(sp)
    802069c2:	e0a2                	sd	s0,64(sp)
    802069c4:	fc26                	sd	s1,56(sp)
    802069c6:	f84a                	sd	s2,48(sp)
    802069c8:	f44e                	sd	s3,40(sp)
    802069ca:	f052                	sd	s4,32(sp)
    802069cc:	ec56                	sd	s5,24(sp)
    802069ce:	e85a                	sd	s6,16(sp)
    802069d0:	0880                	addi	s0,sp,80
    802069d2:	8a2a                	mv	s4,a0
    802069d4:	84ae                	mv	s1,a1
    802069d6:	89b2                	mv	s3,a2
    802069d8:	0001c517          	auipc	a0,0x1c
    802069dc:	24850513          	addi	a0,a0,584 # 80222c20 <cons>
    802069e0:	ffffa097          	auipc	ra,0xffffa
    802069e4:	ce6080e7          	jalr	-794(ra) # 802006c6 <acquire>
    802069e8:	07305063          	blez	s3,80206a48 <consolewrite+0x8a>
    802069ec:	4901                	li	s2,0
    802069ee:	fbf40b13          	addi	s6,s0,-65
    802069f2:	5afd                	li	s5,-1
    802069f4:	4685                	li	a3,1
    802069f6:	8626                	mv	a2,s1
    802069f8:	85d2                	mv	a1,s4
    802069fa:	855a                	mv	a0,s6
    802069fc:	ffffc097          	auipc	ra,0xffffc
    80206a00:	b50080e7          	jalr	-1200(ra) # 8020254c <either_copyin>
    80206a04:	01550f63          	beq	a0,s5,80206a22 <consolewrite+0x64>
    80206a08:	fbf44503          	lbu	a0,-65(s0)
    80206a0c:	4581                	li	a1,0
    80206a0e:	4601                	li	a2,0
    80206a10:	4681                	li	a3,0
    80206a12:	4885                	li	a7,1
    80206a14:	00000073          	ecall
    80206a18:	2905                	addiw	s2,s2,1
    80206a1a:	0485                	addi	s1,s1,1
    80206a1c:	fd299ce3          	bne	s3,s2,802069f4 <consolewrite+0x36>
    80206a20:	894e                	mv	s2,s3
    80206a22:	0001c517          	auipc	a0,0x1c
    80206a26:	1fe50513          	addi	a0,a0,510 # 80222c20 <cons>
    80206a2a:	ffffa097          	auipc	ra,0xffffa
    80206a2e:	cf0080e7          	jalr	-784(ra) # 8020071a <release>
    80206a32:	854a                	mv	a0,s2
    80206a34:	60a6                	ld	ra,72(sp)
    80206a36:	6406                	ld	s0,64(sp)
    80206a38:	74e2                	ld	s1,56(sp)
    80206a3a:	7942                	ld	s2,48(sp)
    80206a3c:	79a2                	ld	s3,40(sp)
    80206a3e:	7a02                	ld	s4,32(sp)
    80206a40:	6ae2                	ld	s5,24(sp)
    80206a42:	6b42                	ld	s6,16(sp)
    80206a44:	6161                	addi	sp,sp,80
    80206a46:	8082                	ret
    80206a48:	4901                	li	s2,0
    80206a4a:	bfe1                	j	80206a22 <consolewrite+0x64>

0000000080206a4c <consoleread>:
    80206a4c:	711d                	addi	sp,sp,-96
    80206a4e:	ec86                	sd	ra,88(sp)
    80206a50:	e8a2                	sd	s0,80(sp)
    80206a52:	e4a6                	sd	s1,72(sp)
    80206a54:	e0ca                	sd	s2,64(sp)
    80206a56:	fc4e                	sd	s3,56(sp)
    80206a58:	f852                	sd	s4,48(sp)
    80206a5a:	f456                	sd	s5,40(sp)
    80206a5c:	f05a                	sd	s6,32(sp)
    80206a5e:	ec5e                	sd	s7,24(sp)
    80206a60:	1080                	addi	s0,sp,96
    80206a62:	8aaa                	mv	s5,a0
    80206a64:	8a2e                	mv	s4,a1
    80206a66:	89b2                	mv	s3,a2
    80206a68:	00060b1b          	sext.w	s6,a2
    80206a6c:	0001c517          	auipc	a0,0x1c
    80206a70:	1b450513          	addi	a0,a0,436 # 80222c20 <cons>
    80206a74:	ffffa097          	auipc	ra,0xffffa
    80206a78:	c52080e7          	jalr	-942(ra) # 802006c6 <acquire>
    80206a7c:	0001c497          	auipc	s1,0x1c
    80206a80:	1a448493          	addi	s1,s1,420 # 80222c20 <cons>
    80206a84:	0001c917          	auipc	s2,0x1c
    80206a88:	23490913          	addi	s2,s2,564 # 80222cb8 <cons+0x98>
    80206a8c:	07305f63          	blez	s3,80206b0a <consoleread+0xbe>
    80206a90:	0984a783          	lw	a5,152(s1)
    80206a94:	09c4a703          	lw	a4,156(s1)
    80206a98:	02f71463          	bne	a4,a5,80206ac0 <consoleread+0x74>
    80206a9c:	ffffb097          	auipc	ra,0xffffb
    80206aa0:	fa4080e7          	jalr	-92(ra) # 80201a40 <myproc>
    80206aa4:	591c                	lw	a5,48(a0)
    80206aa6:	efad                	bnez	a5,80206b20 <consoleread+0xd4>
    80206aa8:	85a6                	mv	a1,s1
    80206aaa:	854a                	mv	a0,s2
    80206aac:	ffffc097          	auipc	ra,0xffffc
    80206ab0:	814080e7          	jalr	-2028(ra) # 802022c0 <sleep>
    80206ab4:	0984a783          	lw	a5,152(s1)
    80206ab8:	09c4a703          	lw	a4,156(s1)
    80206abc:	fef700e3          	beq	a4,a5,80206a9c <consoleread+0x50>
    80206ac0:	0001c717          	auipc	a4,0x1c
    80206ac4:	16070713          	addi	a4,a4,352 # 80222c20 <cons>
    80206ac8:	0017869b          	addiw	a3,a5,1
    80206acc:	08d72c23          	sw	a3,152(a4)
    80206ad0:	07f7f693          	andi	a3,a5,127
    80206ad4:	9736                	add	a4,a4,a3
    80206ad6:	01874703          	lbu	a4,24(a4)
    80206ada:	00070b9b          	sext.w	s7,a4
    80206ade:	4691                	li	a3,4
    80206ae0:	06db8463          	beq	s7,a3,80206b48 <consoleread+0xfc>
    80206ae4:	fae407a3          	sb	a4,-81(s0)
    80206ae8:	4685                	li	a3,1
    80206aea:	faf40613          	addi	a2,s0,-81
    80206aee:	85d2                	mv	a1,s4
    80206af0:	8556                	mv	a0,s5
    80206af2:	ffffc097          	auipc	ra,0xffffc
    80206af6:	a24080e7          	jalr	-1500(ra) # 80202516 <either_copyout>
    80206afa:	57fd                	li	a5,-1
    80206afc:	00f50763          	beq	a0,a5,80206b0a <consoleread+0xbe>
    80206b00:	0a05                	addi	s4,s4,1
    80206b02:	39fd                	addiw	s3,s3,-1
    80206b04:	47a9                	li	a5,10
    80206b06:	f8fb93e3          	bne	s7,a5,80206a8c <consoleread+0x40>
    80206b0a:	0001c517          	auipc	a0,0x1c
    80206b0e:	11650513          	addi	a0,a0,278 # 80222c20 <cons>
    80206b12:	ffffa097          	auipc	ra,0xffffa
    80206b16:	c08080e7          	jalr	-1016(ra) # 8020071a <release>
    80206b1a:	413b053b          	subw	a0,s6,s3
    80206b1e:	a811                	j	80206b32 <consoleread+0xe6>
    80206b20:	0001c517          	auipc	a0,0x1c
    80206b24:	10050513          	addi	a0,a0,256 # 80222c20 <cons>
    80206b28:	ffffa097          	auipc	ra,0xffffa
    80206b2c:	bf2080e7          	jalr	-1038(ra) # 8020071a <release>
    80206b30:	557d                	li	a0,-1
    80206b32:	60e6                	ld	ra,88(sp)
    80206b34:	6446                	ld	s0,80(sp)
    80206b36:	64a6                	ld	s1,72(sp)
    80206b38:	6906                	ld	s2,64(sp)
    80206b3a:	79e2                	ld	s3,56(sp)
    80206b3c:	7a42                	ld	s4,48(sp)
    80206b3e:	7aa2                	ld	s5,40(sp)
    80206b40:	7b02                	ld	s6,32(sp)
    80206b42:	6be2                	ld	s7,24(sp)
    80206b44:	6125                	addi	sp,sp,96
    80206b46:	8082                	ret
    80206b48:	0009871b          	sext.w	a4,s3
    80206b4c:	fb677fe3          	bgeu	a4,s6,80206b0a <consoleread+0xbe>
    80206b50:	0001c717          	auipc	a4,0x1c
    80206b54:	16f72423          	sw	a5,360(a4) # 80222cb8 <cons+0x98>
    80206b58:	bf4d                	j	80206b0a <consoleread+0xbe>

0000000080206b5a <consputc>:
    80206b5a:	1141                	addi	sp,sp,-16
    80206b5c:	e422                	sd	s0,8(sp)
    80206b5e:	0800                	addi	s0,sp,16
    80206b60:	10000793          	li	a5,256
    80206b64:	00f50b63          	beq	a0,a5,80206b7a <consputc+0x20>
    80206b68:	4581                	li	a1,0
    80206b6a:	4601                	li	a2,0
    80206b6c:	4681                	li	a3,0
    80206b6e:	4885                	li	a7,1
    80206b70:	00000073          	ecall
    80206b74:	6422                	ld	s0,8(sp)
    80206b76:	0141                	addi	sp,sp,16
    80206b78:	8082                	ret
    80206b7a:	4521                	li	a0,8
    80206b7c:	4581                	li	a1,0
    80206b7e:	4601                	li	a2,0
    80206b80:	4681                	li	a3,0
    80206b82:	4885                	li	a7,1
    80206b84:	00000073          	ecall
    80206b88:	02000513          	li	a0,32
    80206b8c:	00000073          	ecall
    80206b90:	4521                	li	a0,8
    80206b92:	00000073          	ecall
    80206b96:	bff9                	j	80206b74 <consputc+0x1a>

0000000080206b98 <consoleintr>:
    80206b98:	1101                	addi	sp,sp,-32
    80206b9a:	ec06                	sd	ra,24(sp)
    80206b9c:	e822                	sd	s0,16(sp)
    80206b9e:	e426                	sd	s1,8(sp)
    80206ba0:	e04a                	sd	s2,0(sp)
    80206ba2:	1000                	addi	s0,sp,32
    80206ba4:	84aa                	mv	s1,a0
    80206ba6:	0001c517          	auipc	a0,0x1c
    80206baa:	07a50513          	addi	a0,a0,122 # 80222c20 <cons>
    80206bae:	ffffa097          	auipc	ra,0xffffa
    80206bb2:	b18080e7          	jalr	-1256(ra) # 802006c6 <acquire>
    80206bb6:	47d5                	li	a5,21
    80206bb8:	0af48663          	beq	s1,a5,80206c64 <consoleintr+0xcc>
    80206bbc:	0297ca63          	blt	a5,s1,80206bf0 <consoleintr+0x58>
    80206bc0:	47a1                	li	a5,8
    80206bc2:	0ef48763          	beq	s1,a5,80206cb0 <consoleintr+0x118>
    80206bc6:	47c1                	li	a5,16
    80206bc8:	10f49a63          	bne	s1,a5,80206cdc <consoleintr+0x144>
    80206bcc:	ffffc097          	auipc	ra,0xffffc
    80206bd0:	9b4080e7          	jalr	-1612(ra) # 80202580 <procdump>
    80206bd4:	0001c517          	auipc	a0,0x1c
    80206bd8:	04c50513          	addi	a0,a0,76 # 80222c20 <cons>
    80206bdc:	ffffa097          	auipc	ra,0xffffa
    80206be0:	b3e080e7          	jalr	-1218(ra) # 8020071a <release>
    80206be4:	60e2                	ld	ra,24(sp)
    80206be6:	6442                	ld	s0,16(sp)
    80206be8:	64a2                	ld	s1,8(sp)
    80206bea:	6902                	ld	s2,0(sp)
    80206bec:	6105                	addi	sp,sp,32
    80206bee:	8082                	ret
    80206bf0:	07f00793          	li	a5,127
    80206bf4:	0af48e63          	beq	s1,a5,80206cb0 <consoleintr+0x118>
    80206bf8:	0001c717          	auipc	a4,0x1c
    80206bfc:	02870713          	addi	a4,a4,40 # 80222c20 <cons>
    80206c00:	0a072783          	lw	a5,160(a4)
    80206c04:	09872703          	lw	a4,152(a4)
    80206c08:	9f99                	subw	a5,a5,a4
    80206c0a:	07f00713          	li	a4,127
    80206c0e:	fcf763e3          	bltu	a4,a5,80206bd4 <consoleintr+0x3c>
    80206c12:	47b5                	li	a5,13
    80206c14:	0cf48763          	beq	s1,a5,80206ce2 <consoleintr+0x14a>
    80206c18:	8526                	mv	a0,s1
    80206c1a:	00000097          	auipc	ra,0x0
    80206c1e:	f40080e7          	jalr	-192(ra) # 80206b5a <consputc>
    80206c22:	0001c797          	auipc	a5,0x1c
    80206c26:	ffe78793          	addi	a5,a5,-2 # 80222c20 <cons>
    80206c2a:	0a07a703          	lw	a4,160(a5)
    80206c2e:	0017069b          	addiw	a3,a4,1
    80206c32:	0006861b          	sext.w	a2,a3
    80206c36:	0ad7a023          	sw	a3,160(a5)
    80206c3a:	07f77713          	andi	a4,a4,127
    80206c3e:	97ba                	add	a5,a5,a4
    80206c40:	00978c23          	sb	s1,24(a5)
    80206c44:	47a9                	li	a5,10
    80206c46:	0cf48563          	beq	s1,a5,80206d10 <consoleintr+0x178>
    80206c4a:	4791                	li	a5,4
    80206c4c:	0cf48263          	beq	s1,a5,80206d10 <consoleintr+0x178>
    80206c50:	0001c797          	auipc	a5,0x1c
    80206c54:	0687a783          	lw	a5,104(a5) # 80222cb8 <cons+0x98>
    80206c58:	0807879b          	addiw	a5,a5,128
    80206c5c:	f6f61ce3          	bne	a2,a5,80206bd4 <consoleintr+0x3c>
    80206c60:	863e                	mv	a2,a5
    80206c62:	a07d                	j	80206d10 <consoleintr+0x178>
    80206c64:	0001c717          	auipc	a4,0x1c
    80206c68:	fbc70713          	addi	a4,a4,-68 # 80222c20 <cons>
    80206c6c:	0a072783          	lw	a5,160(a4)
    80206c70:	09c72703          	lw	a4,156(a4)
    80206c74:	0001c497          	auipc	s1,0x1c
    80206c78:	fac48493          	addi	s1,s1,-84 # 80222c20 <cons>
    80206c7c:	4929                	li	s2,10
    80206c7e:	f4f70be3          	beq	a4,a5,80206bd4 <consoleintr+0x3c>
    80206c82:	37fd                	addiw	a5,a5,-1
    80206c84:	07f7f713          	andi	a4,a5,127
    80206c88:	9726                	add	a4,a4,s1
    80206c8a:	01874703          	lbu	a4,24(a4)
    80206c8e:	f52703e3          	beq	a4,s2,80206bd4 <consoleintr+0x3c>
    80206c92:	0af4a023          	sw	a5,160(s1)
    80206c96:	10000513          	li	a0,256
    80206c9a:	00000097          	auipc	ra,0x0
    80206c9e:	ec0080e7          	jalr	-320(ra) # 80206b5a <consputc>
    80206ca2:	0a04a783          	lw	a5,160(s1)
    80206ca6:	09c4a703          	lw	a4,156(s1)
    80206caa:	fcf71ce3          	bne	a4,a5,80206c82 <consoleintr+0xea>
    80206cae:	b71d                	j	80206bd4 <consoleintr+0x3c>
    80206cb0:	0001c717          	auipc	a4,0x1c
    80206cb4:	f7070713          	addi	a4,a4,-144 # 80222c20 <cons>
    80206cb8:	0a072783          	lw	a5,160(a4)
    80206cbc:	09c72703          	lw	a4,156(a4)
    80206cc0:	f0f70ae3          	beq	a4,a5,80206bd4 <consoleintr+0x3c>
    80206cc4:	37fd                	addiw	a5,a5,-1
    80206cc6:	0001c717          	auipc	a4,0x1c
    80206cca:	fef72d23          	sw	a5,-6(a4) # 80222cc0 <cons+0xa0>
    80206cce:	10000513          	li	a0,256
    80206cd2:	00000097          	auipc	ra,0x0
    80206cd6:	e88080e7          	jalr	-376(ra) # 80206b5a <consputc>
    80206cda:	bded                	j	80206bd4 <consoleintr+0x3c>
    80206cdc:	ee048ce3          	beqz	s1,80206bd4 <consoleintr+0x3c>
    80206ce0:	bf21                	j	80206bf8 <consoleintr+0x60>
    80206ce2:	4529                	li	a0,10
    80206ce4:	00000097          	auipc	ra,0x0
    80206ce8:	e76080e7          	jalr	-394(ra) # 80206b5a <consputc>
    80206cec:	0001c797          	auipc	a5,0x1c
    80206cf0:	f3478793          	addi	a5,a5,-204 # 80222c20 <cons>
    80206cf4:	0a07a703          	lw	a4,160(a5)
    80206cf8:	0017069b          	addiw	a3,a4,1
    80206cfc:	0006861b          	sext.w	a2,a3
    80206d00:	0ad7a023          	sw	a3,160(a5)
    80206d04:	07f77713          	andi	a4,a4,127
    80206d08:	97ba                	add	a5,a5,a4
    80206d0a:	4729                	li	a4,10
    80206d0c:	00e78c23          	sb	a4,24(a5)
    80206d10:	0001c797          	auipc	a5,0x1c
    80206d14:	fac7a623          	sw	a2,-84(a5) # 80222cbc <cons+0x9c>
    80206d18:	0001c517          	auipc	a0,0x1c
    80206d1c:	fa050513          	addi	a0,a0,-96 # 80222cb8 <cons+0x98>
    80206d20:	ffffb097          	auipc	ra,0xffffb
    80206d24:	71c080e7          	jalr	1820(ra) # 8020243c <wakeup>
    80206d28:	b575                	j	80206bd4 <consoleintr+0x3c>

0000000080206d2a <consoleinit>:
    80206d2a:	1101                	addi	sp,sp,-32
    80206d2c:	ec06                	sd	ra,24(sp)
    80206d2e:	e822                	sd	s0,16(sp)
    80206d30:	e426                	sd	s1,8(sp)
    80206d32:	1000                	addi	s0,sp,32
    80206d34:	0001c497          	auipc	s1,0x1c
    80206d38:	eec48493          	addi	s1,s1,-276 # 80222c20 <cons>
    80206d3c:	00003597          	auipc	a1,0x3
    80206d40:	fc458593          	addi	a1,a1,-60 # 80209d00 <digits+0x980>
    80206d44:	8526                	mv	a0,s1
    80206d46:	ffffa097          	auipc	ra,0xffffa
    80206d4a:	93c080e7          	jalr	-1732(ra) # 80200682 <initlock>
    80206d4e:	0804ac23          	sw	zero,152(s1)
    80206d52:	0804ae23          	sw	zero,156(s1)
    80206d56:	0a04a023          	sw	zero,160(s1)
    80206d5a:	00005797          	auipc	a5,0x5
    80206d5e:	d367b783          	ld	a5,-714(a5) # 8020ba90 <_GLOBAL_OFFSET_TABLE_+0x58>
    80206d62:	00000717          	auipc	a4,0x0
    80206d66:	cea70713          	addi	a4,a4,-790 # 80206a4c <consoleread>
    80206d6a:	eb98                	sd	a4,16(a5)
    80206d6c:	00000717          	auipc	a4,0x0
    80206d70:	c5270713          	addi	a4,a4,-942 # 802069be <consolewrite>
    80206d74:	ef98                	sd	a4,24(a5)
    80206d76:	60e2                	ld	ra,24(sp)
    80206d78:	6442                	ld	s0,16(sp)
    80206d7a:	64a2                	ld	s1,8(sp)
    80206d7c:	6105                	addi	sp,sp,32
    80206d7e:	8082                	ret

0000000080206d80 <free_desc>:
    80206d80:	1141                	addi	sp,sp,-16
    80206d82:	e406                	sd	ra,8(sp)
    80206d84:	e022                	sd	s0,0(sp)
    80206d86:	0800                	addi	s0,sp,16
    80206d88:	479d                	li	a5,7
    80206d8a:	04a7cb63          	blt	a5,a0,80206de0 <free_desc+0x60>
    80206d8e:	0001c717          	auipc	a4,0x1c
    80206d92:	27270713          	addi	a4,a4,626 # 80223000 <disk>
    80206d96:	972a                	add	a4,a4,a0
    80206d98:	6789                	lui	a5,0x2
    80206d9a:	97ba                	add	a5,a5,a4
    80206d9c:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    80206da0:	eba1                	bnez	a5,80206df0 <free_desc+0x70>
    80206da2:	00451713          	slli	a4,a0,0x4
    80206da6:	0001e797          	auipc	a5,0x1e
    80206daa:	25a7b783          	ld	a5,602(a5) # 80225000 <disk+0x2000>
    80206dae:	97ba                	add	a5,a5,a4
    80206db0:	0007b023          	sd	zero,0(a5)
    80206db4:	0001c717          	auipc	a4,0x1c
    80206db8:	24c70713          	addi	a4,a4,588 # 80223000 <disk>
    80206dbc:	972a                	add	a4,a4,a0
    80206dbe:	6789                	lui	a5,0x2
    80206dc0:	97ba                	add	a5,a5,a4
    80206dc2:	4705                	li	a4,1
    80206dc4:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x801fdfe8>
    80206dc8:	0001e517          	auipc	a0,0x1e
    80206dcc:	25050513          	addi	a0,a0,592 # 80225018 <disk+0x2018>
    80206dd0:	ffffb097          	auipc	ra,0xffffb
    80206dd4:	66c080e7          	jalr	1644(ra) # 8020243c <wakeup>
    80206dd8:	60a2                	ld	ra,8(sp)
    80206dda:	6402                	ld	s0,0(sp)
    80206ddc:	0141                	addi	sp,sp,16
    80206dde:	8082                	ret
    80206de0:	00003517          	auipc	a0,0x3
    80206de4:	f2850513          	addi	a0,a0,-216 # 80209d08 <digits+0x988>
    80206de8:	ffff9097          	auipc	ra,0xffff9
    80206dec:	35c080e7          	jalr	860(ra) # 80200144 <panic>
    80206df0:	00003517          	auipc	a0,0x3
    80206df4:	f3050513          	addi	a0,a0,-208 # 80209d20 <digits+0x9a0>
    80206df8:	ffff9097          	auipc	ra,0xffff9
    80206dfc:	34c080e7          	jalr	844(ra) # 80200144 <panic>

0000000080206e00 <virtio_disk_init>:
    80206e00:	1141                	addi	sp,sp,-16
    80206e02:	e406                	sd	ra,8(sp)
    80206e04:	e022                	sd	s0,0(sp)
    80206e06:	0800                	addi	s0,sp,16
    80206e08:	00003597          	auipc	a1,0x3
    80206e0c:	f3058593          	addi	a1,a1,-208 # 80209d38 <digits+0x9b8>
    80206e10:	0001e517          	auipc	a0,0x1e
    80206e14:	29850513          	addi	a0,a0,664 # 802250a8 <disk+0x20a8>
    80206e18:	ffffa097          	auipc	ra,0xffffa
    80206e1c:	86a080e7          	jalr	-1942(ra) # 80200682 <initlock>
    80206e20:	03f107b7          	lui	a5,0x3f10
    80206e24:	0785                	addi	a5,a5,1 # 3f10001 <_entry-0x7c2effff>
    80206e26:	07b2                	slli	a5,a5,0xc
    80206e28:	4398                	lw	a4,0(a5)
    80206e2a:	2701                	sext.w	a4,a4
    80206e2c:	747277b7          	lui	a5,0x74727
    80206e30:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    80206e34:	12f71163          	bne	a4,a5,80206f56 <virtio_disk_init+0x156>
    80206e38:	00003797          	auipc	a5,0x3
    80206e3c:	f887b783          	ld	a5,-120(a5) # 80209dc0 <digits+0xa40>
    80206e40:	439c                	lw	a5,0(a5)
    80206e42:	2781                	sext.w	a5,a5
    80206e44:	4705                	li	a4,1
    80206e46:	10e79863          	bne	a5,a4,80206f56 <virtio_disk_init+0x156>
    80206e4a:	00003797          	auipc	a5,0x3
    80206e4e:	f7e7b783          	ld	a5,-130(a5) # 80209dc8 <digits+0xa48>
    80206e52:	439c                	lw	a5,0(a5)
    80206e54:	2781                	sext.w	a5,a5
    80206e56:	4709                	li	a4,2
    80206e58:	0ee79f63          	bne	a5,a4,80206f56 <virtio_disk_init+0x156>
    80206e5c:	00003797          	auipc	a5,0x3
    80206e60:	f747b783          	ld	a5,-140(a5) # 80209dd0 <digits+0xa50>
    80206e64:	4398                	lw	a4,0(a5)
    80206e66:	2701                	sext.w	a4,a4
    80206e68:	554d47b7          	lui	a5,0x554d4
    80206e6c:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    80206e70:	0ef71363          	bne	a4,a5,80206f56 <virtio_disk_init+0x156>
    80206e74:	00003797          	auipc	a5,0x3
    80206e78:	f647b783          	ld	a5,-156(a5) # 80209dd8 <digits+0xa58>
    80206e7c:	4705                	li	a4,1
    80206e7e:	c398                	sw	a4,0(a5)
    80206e80:	470d                	li	a4,3
    80206e82:	c398                	sw	a4,0(a5)
    80206e84:	00003717          	auipc	a4,0x3
    80206e88:	f5c73703          	ld	a4,-164(a4) # 80209de0 <digits+0xa60>
    80206e8c:	4318                	lw	a4,0(a4)
    80206e8e:	c7ffe6b7          	lui	a3,0xc7ffe
    80206e92:	75f68693          	addi	a3,a3,1887 # ffffffffc7ffe75f <ebss_clear+0xffffffff47dd875f>
    80206e96:	8f75                	and	a4,a4,a3
    80206e98:	00003697          	auipc	a3,0x3
    80206e9c:	f506b683          	ld	a3,-176(a3) # 80209de8 <digits+0xa68>
    80206ea0:	c298                	sw	a4,0(a3)
    80206ea2:	472d                	li	a4,11
    80206ea4:	c398                	sw	a4,0(a5)
    80206ea6:	473d                	li	a4,15
    80206ea8:	c398                	sw	a4,0(a5)
    80206eaa:	00003797          	auipc	a5,0x3
    80206eae:	f467b783          	ld	a5,-186(a5) # 80209df0 <digits+0xa70>
    80206eb2:	6705                	lui	a4,0x1
    80206eb4:	c398                	sw	a4,0(a5)
    80206eb6:	00003797          	auipc	a5,0x3
    80206eba:	f427b783          	ld	a5,-190(a5) # 80209df8 <digits+0xa78>
    80206ebe:	0007a023          	sw	zero,0(a5)
    80206ec2:	00003797          	auipc	a5,0x3
    80206ec6:	f3e7b783          	ld	a5,-194(a5) # 80209e00 <digits+0xa80>
    80206eca:	439c                	lw	a5,0(a5)
    80206ecc:	2781                	sext.w	a5,a5
    80206ece:	cfc1                	beqz	a5,80206f66 <virtio_disk_init+0x166>
    80206ed0:	471d                	li	a4,7
    80206ed2:	0af77263          	bgeu	a4,a5,80206f76 <virtio_disk_init+0x176>
    80206ed6:	00003797          	auipc	a5,0x3
    80206eda:	f327b783          	ld	a5,-206(a5) # 80209e08 <digits+0xa88>
    80206ede:	4721                	li	a4,8
    80206ee0:	c398                	sw	a4,0(a5)
    80206ee2:	6609                	lui	a2,0x2
    80206ee4:	4581                	li	a1,0
    80206ee6:	0001c517          	auipc	a0,0x1c
    80206eea:	11a50513          	addi	a0,a0,282 # 80223000 <disk>
    80206eee:	ffffa097          	auipc	ra,0xffffa
    80206ef2:	874080e7          	jalr	-1932(ra) # 80200762 <memset>
    80206ef6:	0001c717          	auipc	a4,0x1c
    80206efa:	10a70713          	addi	a4,a4,266 # 80223000 <disk>
    80206efe:	00c75793          	srli	a5,a4,0xc
    80206f02:	2781                	sext.w	a5,a5
    80206f04:	00003697          	auipc	a3,0x3
    80206f08:	f0c6b683          	ld	a3,-244(a3) # 80209e10 <digits+0xa90>
    80206f0c:	c29c                	sw	a5,0(a3)
    80206f0e:	0001e797          	auipc	a5,0x1e
    80206f12:	0f278793          	addi	a5,a5,242 # 80225000 <disk+0x2000>
    80206f16:	e398                	sd	a4,0(a5)
    80206f18:	0001c717          	auipc	a4,0x1c
    80206f1c:	16870713          	addi	a4,a4,360 # 80223080 <disk+0x80>
    80206f20:	e798                	sd	a4,8(a5)
    80206f22:	0001d717          	auipc	a4,0x1d
    80206f26:	0de70713          	addi	a4,a4,222 # 80224000 <disk+0x1000>
    80206f2a:	eb98                	sd	a4,16(a5)
    80206f2c:	4705                	li	a4,1
    80206f2e:	00e78c23          	sb	a4,24(a5)
    80206f32:	00e78ca3          	sb	a4,25(a5)
    80206f36:	00e78d23          	sb	a4,26(a5)
    80206f3a:	00e78da3          	sb	a4,27(a5)
    80206f3e:	00e78e23          	sb	a4,28(a5)
    80206f42:	00e78ea3          	sb	a4,29(a5)
    80206f46:	00e78f23          	sb	a4,30(a5)
    80206f4a:	00e78fa3          	sb	a4,31(a5)
    80206f4e:	60a2                	ld	ra,8(sp)
    80206f50:	6402                	ld	s0,0(sp)
    80206f52:	0141                	addi	sp,sp,16
    80206f54:	8082                	ret
    80206f56:	00003517          	auipc	a0,0x3
    80206f5a:	df250513          	addi	a0,a0,-526 # 80209d48 <digits+0x9c8>
    80206f5e:	ffff9097          	auipc	ra,0xffff9
    80206f62:	1e6080e7          	jalr	486(ra) # 80200144 <panic>
    80206f66:	00003517          	auipc	a0,0x3
    80206f6a:	e0250513          	addi	a0,a0,-510 # 80209d68 <digits+0x9e8>
    80206f6e:	ffff9097          	auipc	ra,0xffff9
    80206f72:	1d6080e7          	jalr	470(ra) # 80200144 <panic>
    80206f76:	00003517          	auipc	a0,0x3
    80206f7a:	e1250513          	addi	a0,a0,-494 # 80209d88 <digits+0xa08>
    80206f7e:	ffff9097          	auipc	ra,0xffff9
    80206f82:	1c6080e7          	jalr	454(ra) # 80200144 <panic>

0000000080206f86 <virtio_disk_rw>:
    80206f86:	7119                	addi	sp,sp,-128
    80206f88:	fc86                	sd	ra,120(sp)
    80206f8a:	f8a2                	sd	s0,112(sp)
    80206f8c:	f4a6                	sd	s1,104(sp)
    80206f8e:	f0ca                	sd	s2,96(sp)
    80206f90:	ecce                	sd	s3,88(sp)
    80206f92:	e8d2                	sd	s4,80(sp)
    80206f94:	e4d6                	sd	s5,72(sp)
    80206f96:	e0da                	sd	s6,64(sp)
    80206f98:	fc5e                	sd	s7,56(sp)
    80206f9a:	f862                	sd	s8,48(sp)
    80206f9c:	f466                	sd	s9,40(sp)
    80206f9e:	f06a                	sd	s10,32(sp)
    80206fa0:	0100                	addi	s0,sp,128
    80206fa2:	8a2a                	mv	s4,a0
    80206fa4:	8c2e                	mv	s8,a1
    80206fa6:	00c56c83          	lwu	s9,12(a0)
    80206faa:	0001e517          	auipc	a0,0x1e
    80206fae:	0fe50513          	addi	a0,a0,254 # 802250a8 <disk+0x20a8>
    80206fb2:	ffff9097          	auipc	ra,0xffff9
    80206fb6:	714080e7          	jalr	1812(ra) # 802006c6 <acquire>
    80206fba:	4901                	li	s2,0
    80206fbc:	44a1                	li	s1,8
    80206fbe:	0001cb97          	auipc	s7,0x1c
    80206fc2:	042b8b93          	addi	s7,s7,66 # 80223000 <disk>
    80206fc6:	6b09                	lui	s6,0x2
    80206fc8:	4a8d                	li	s5,3
    80206fca:	a0b5                	j	80207036 <virtio_disk_rw+0xb0>
    80206fcc:	00fb8733          	add	a4,s7,a5
    80206fd0:	975a                	add	a4,a4,s6
    80206fd2:	00070c23          	sb	zero,24(a4)
    80206fd6:	c11c                	sw	a5,0(a0)
    80206fd8:	0207c563          	bltz	a5,80207002 <virtio_disk_rw+0x7c>
    80206fdc:	2605                	addiw	a2,a2,1 # 2001 <_entry-0x801fdfff>
    80206fde:	0591                	addi	a1,a1,4
    80206fe0:	19560e63          	beq	a2,s5,8020717c <virtio_disk_rw+0x1f6>
    80206fe4:	852e                	mv	a0,a1
    80206fe6:	0001e717          	auipc	a4,0x1e
    80206fea:	03270713          	addi	a4,a4,50 # 80225018 <disk+0x2018>
    80206fee:	87ca                	mv	a5,s2
    80206ff0:	00074683          	lbu	a3,0(a4)
    80206ff4:	fee1                	bnez	a3,80206fcc <virtio_disk_rw+0x46>
    80206ff6:	2785                	addiw	a5,a5,1
    80206ff8:	0705                	addi	a4,a4,1
    80206ffa:	fe979be3          	bne	a5,s1,80206ff0 <virtio_disk_rw+0x6a>
    80206ffe:	57fd                	li	a5,-1
    80207000:	c11c                	sw	a5,0(a0)
    80207002:	00c05e63          	blez	a2,8020701e <virtio_disk_rw+0x98>
    80207006:	060a                	slli	a2,a2,0x2
    80207008:	01360d33          	add	s10,a2,s3
    8020700c:	0009a503          	lw	a0,0(s3)
    80207010:	00000097          	auipc	ra,0x0
    80207014:	d70080e7          	jalr	-656(ra) # 80206d80 <free_desc>
    80207018:	0991                	addi	s3,s3,4
    8020701a:	ffa999e3          	bne	s3,s10,8020700c <virtio_disk_rw+0x86>
    8020701e:	0001e597          	auipc	a1,0x1e
    80207022:	08a58593          	addi	a1,a1,138 # 802250a8 <disk+0x20a8>
    80207026:	0001e517          	auipc	a0,0x1e
    8020702a:	ff250513          	addi	a0,a0,-14 # 80225018 <disk+0x2018>
    8020702e:	ffffb097          	auipc	ra,0xffffb
    80207032:	292080e7          	jalr	658(ra) # 802022c0 <sleep>
    80207036:	f9040993          	addi	s3,s0,-112
    8020703a:	85ce                	mv	a1,s3
    8020703c:	864a                	mv	a2,s2
    8020703e:	b75d                	j	80206fe4 <virtio_disk_rw+0x5e>
    80207040:	0001e717          	auipc	a4,0x1e
    80207044:	fc073703          	ld	a4,-64(a4) # 80225000 <disk+0x2000>
    80207048:	973e                	add	a4,a4,a5
    8020704a:	00071623          	sh	zero,12(a4)
    8020704e:	0001c517          	auipc	a0,0x1c
    80207052:	fb250513          	addi	a0,a0,-78 # 80223000 <disk>
    80207056:	0001e717          	auipc	a4,0x1e
    8020705a:	faa70713          	addi	a4,a4,-86 # 80225000 <disk+0x2000>
    8020705e:	6314                	ld	a3,0(a4)
    80207060:	96be                	add	a3,a3,a5
    80207062:	00c6d603          	lhu	a2,12(a3)
    80207066:	00166613          	ori	a2,a2,1
    8020706a:	00c69623          	sh	a2,12(a3)
    8020706e:	f9842683          	lw	a3,-104(s0)
    80207072:	6310                	ld	a2,0(a4)
    80207074:	97b2                	add	a5,a5,a2
    80207076:	00d79723          	sh	a3,14(a5)
    8020707a:	20048613          	addi	a2,s1,512
    8020707e:	0612                	slli	a2,a2,0x4
    80207080:	962a                	add	a2,a2,a0
    80207082:	02060823          	sb	zero,48(a2)
    80207086:	00469793          	slli	a5,a3,0x4
    8020708a:	630c                	ld	a1,0(a4)
    8020708c:	95be                	add	a1,a1,a5
    8020708e:	6689                	lui	a3,0x2
    80207090:	03068693          	addi	a3,a3,48 # 2030 <_entry-0x801fdfd0>
    80207094:	96ca                	add	a3,a3,s2
    80207096:	96aa                	add	a3,a3,a0
    80207098:	e194                	sd	a3,0(a1)
    8020709a:	6314                	ld	a3,0(a4)
    8020709c:	96be                	add	a3,a3,a5
    8020709e:	4585                	li	a1,1
    802070a0:	c68c                	sw	a1,8(a3)
    802070a2:	6314                	ld	a3,0(a4)
    802070a4:	96be                	add	a3,a3,a5
    802070a6:	4509                	li	a0,2
    802070a8:	00a69623          	sh	a0,12(a3)
    802070ac:	6314                	ld	a3,0(a4)
    802070ae:	97b6                	add	a5,a5,a3
    802070b0:	00079723          	sh	zero,14(a5)
    802070b4:	00ba2223          	sw	a1,4(s4)
    802070b8:	03463423          	sd	s4,40(a2)
    802070bc:	6714                	ld	a3,8(a4)
    802070be:	0026d783          	lhu	a5,2(a3)
    802070c2:	8b9d                	andi	a5,a5,7
    802070c4:	0789                	addi	a5,a5,2
    802070c6:	0786                	slli	a5,a5,0x1
    802070c8:	96be                	add	a3,a3,a5
    802070ca:	00969023          	sh	s1,0(a3)
    802070ce:	0ff0000f          	fence
    802070d2:	6718                	ld	a4,8(a4)
    802070d4:	00275783          	lhu	a5,2(a4)
    802070d8:	2785                	addiw	a5,a5,1
    802070da:	00f71123          	sh	a5,2(a4)
    802070de:	00003797          	auipc	a5,0x3
    802070e2:	d3a7b783          	ld	a5,-710(a5) # 80209e18 <digits+0xa98>
    802070e6:	0007a023          	sw	zero,0(a5)
    802070ea:	004a2783          	lw	a5,4(s4)
    802070ee:	02b79163          	bne	a5,a1,80207110 <virtio_disk_rw+0x18a>
    802070f2:	0001e917          	auipc	s2,0x1e
    802070f6:	fb690913          	addi	s2,s2,-74 # 802250a8 <disk+0x20a8>
    802070fa:	4485                	li	s1,1
    802070fc:	85ca                	mv	a1,s2
    802070fe:	8552                	mv	a0,s4
    80207100:	ffffb097          	auipc	ra,0xffffb
    80207104:	1c0080e7          	jalr	448(ra) # 802022c0 <sleep>
    80207108:	004a2783          	lw	a5,4(s4)
    8020710c:	fe9788e3          	beq	a5,s1,802070fc <virtio_disk_rw+0x176>
    80207110:	f9042483          	lw	s1,-112(s0)
    80207114:	20048713          	addi	a4,s1,512
    80207118:	0712                	slli	a4,a4,0x4
    8020711a:	0001c797          	auipc	a5,0x1c
    8020711e:	ee678793          	addi	a5,a5,-282 # 80223000 <disk>
    80207122:	97ba                	add	a5,a5,a4
    80207124:	0207b423          	sd	zero,40(a5)
    80207128:	0001e917          	auipc	s2,0x1e
    8020712c:	ed890913          	addi	s2,s2,-296 # 80225000 <disk+0x2000>
    80207130:	a019                	j	80207136 <virtio_disk_rw+0x1b0>
    80207132:	00e7d483          	lhu	s1,14(a5)
    80207136:	8526                	mv	a0,s1
    80207138:	00000097          	auipc	ra,0x0
    8020713c:	c48080e7          	jalr	-952(ra) # 80206d80 <free_desc>
    80207140:	0492                	slli	s1,s1,0x4
    80207142:	00093783          	ld	a5,0(s2)
    80207146:	97a6                	add	a5,a5,s1
    80207148:	00c7d703          	lhu	a4,12(a5)
    8020714c:	8b05                	andi	a4,a4,1
    8020714e:	f375                	bnez	a4,80207132 <virtio_disk_rw+0x1ac>
    80207150:	0001e517          	auipc	a0,0x1e
    80207154:	f5850513          	addi	a0,a0,-168 # 802250a8 <disk+0x20a8>
    80207158:	ffff9097          	auipc	ra,0xffff9
    8020715c:	5c2080e7          	jalr	1474(ra) # 8020071a <release>
    80207160:	70e6                	ld	ra,120(sp)
    80207162:	7446                	ld	s0,112(sp)
    80207164:	74a6                	ld	s1,104(sp)
    80207166:	7906                	ld	s2,96(sp)
    80207168:	69e6                	ld	s3,88(sp)
    8020716a:	6a46                	ld	s4,80(sp)
    8020716c:	6aa6                	ld	s5,72(sp)
    8020716e:	6b06                	ld	s6,64(sp)
    80207170:	7be2                	ld	s7,56(sp)
    80207172:	7c42                	ld	s8,48(sp)
    80207174:	7ca2                	ld	s9,40(sp)
    80207176:	7d02                	ld	s10,32(sp)
    80207178:	6109                	addi	sp,sp,128
    8020717a:	8082                	ret
    8020717c:	018037b3          	snez	a5,s8
    80207180:	f8f42023          	sw	a5,-128(s0)
    80207184:	f8042223          	sw	zero,-124(s0)
    80207188:	f9943423          	sd	s9,-120(s0)
    8020718c:	ffffb097          	auipc	ra,0xffffb
    80207190:	8b4080e7          	jalr	-1868(ra) # 80201a40 <myproc>
    80207194:	f9042483          	lw	s1,-112(s0)
    80207198:	00449913          	slli	s2,s1,0x4
    8020719c:	0001e997          	auipc	s3,0x1e
    802071a0:	e6498993          	addi	s3,s3,-412 # 80225000 <disk+0x2000>
    802071a4:	0009ba83          	ld	s5,0(s3)
    802071a8:	9aca                	add	s5,s5,s2
    802071aa:	f8040593          	addi	a1,s0,-128
    802071ae:	6d28                	ld	a0,88(a0)
    802071b0:	ffffa097          	auipc	ra,0xffffa
    802071b4:	a3e080e7          	jalr	-1474(ra) # 80200bee <kwalkaddr>
    802071b8:	00aab023          	sd	a0,0(s5)
    802071bc:	0009b783          	ld	a5,0(s3)
    802071c0:	97ca                	add	a5,a5,s2
    802071c2:	4741                	li	a4,16
    802071c4:	c798                	sw	a4,8(a5)
    802071c6:	0009b783          	ld	a5,0(s3)
    802071ca:	97ca                	add	a5,a5,s2
    802071cc:	4705                	li	a4,1
    802071ce:	00e79623          	sh	a4,12(a5)
    802071d2:	f9442783          	lw	a5,-108(s0)
    802071d6:	0009b703          	ld	a4,0(s3)
    802071da:	974a                	add	a4,a4,s2
    802071dc:	00f71723          	sh	a5,14(a4)
    802071e0:	0792                	slli	a5,a5,0x4
    802071e2:	0009b703          	ld	a4,0(s3)
    802071e6:	973e                	add	a4,a4,a5
    802071e8:	058a0693          	addi	a3,s4,88
    802071ec:	e314                	sd	a3,0(a4)
    802071ee:	0009b703          	ld	a4,0(s3)
    802071f2:	973e                	add	a4,a4,a5
    802071f4:	20000693          	li	a3,512
    802071f8:	c714                	sw	a3,8(a4)
    802071fa:	e40c13e3          	bnez	s8,80207040 <virtio_disk_rw+0xba>
    802071fe:	0001e717          	auipc	a4,0x1e
    80207202:	e0273703          	ld	a4,-510(a4) # 80225000 <disk+0x2000>
    80207206:	973e                	add	a4,a4,a5
    80207208:	4689                	li	a3,2
    8020720a:	00d71623          	sh	a3,12(a4)
    8020720e:	b581                	j	8020704e <virtio_disk_rw+0xc8>

0000000080207210 <virtio_disk_intr>:
    80207210:	1101                	addi	sp,sp,-32
    80207212:	ec06                	sd	ra,24(sp)
    80207214:	e822                	sd	s0,16(sp)
    80207216:	e426                	sd	s1,8(sp)
    80207218:	e04a                	sd	s2,0(sp)
    8020721a:	1000                	addi	s0,sp,32
    8020721c:	0001e517          	auipc	a0,0x1e
    80207220:	e8c50513          	addi	a0,a0,-372 # 802250a8 <disk+0x20a8>
    80207224:	ffff9097          	auipc	ra,0xffff9
    80207228:	4a2080e7          	jalr	1186(ra) # 802006c6 <acquire>
    8020722c:	0001e717          	auipc	a4,0x1e
    80207230:	dd470713          	addi	a4,a4,-556 # 80225000 <disk+0x2000>
    80207234:	02075783          	lhu	a5,32(a4)
    80207238:	6b18                	ld	a4,16(a4)
    8020723a:	00275683          	lhu	a3,2(a4)
    8020723e:	8ebd                	xor	a3,a3,a5
    80207240:	8a9d                	andi	a3,a3,7
    80207242:	cab9                	beqz	a3,80207298 <virtio_disk_intr+0x88>
    80207244:	0001c917          	auipc	s2,0x1c
    80207248:	dbc90913          	addi	s2,s2,-580 # 80223000 <disk>
    8020724c:	0001e497          	auipc	s1,0x1e
    80207250:	db448493          	addi	s1,s1,-588 # 80225000 <disk+0x2000>
    80207254:	078e                	slli	a5,a5,0x3
    80207256:	973e                	add	a4,a4,a5
    80207258:	435c                	lw	a5,4(a4)
    8020725a:	20078713          	addi	a4,a5,512
    8020725e:	0712                	slli	a4,a4,0x4
    80207260:	974a                	add	a4,a4,s2
    80207262:	03074703          	lbu	a4,48(a4)
    80207266:	e335                	bnez	a4,802072ca <virtio_disk_intr+0xba>
    80207268:	20078793          	addi	a5,a5,512
    8020726c:	0792                	slli	a5,a5,0x4
    8020726e:	97ca                	add	a5,a5,s2
    80207270:	7798                	ld	a4,40(a5)
    80207272:	00072223          	sw	zero,4(a4)
    80207276:	7788                	ld	a0,40(a5)
    80207278:	ffffb097          	auipc	ra,0xffffb
    8020727c:	1c4080e7          	jalr	452(ra) # 8020243c <wakeup>
    80207280:	0204d783          	lhu	a5,32(s1)
    80207284:	2785                	addiw	a5,a5,1
    80207286:	8b9d                	andi	a5,a5,7
    80207288:	02f49023          	sh	a5,32(s1)
    8020728c:	6898                	ld	a4,16(s1)
    8020728e:	00275683          	lhu	a3,2(a4)
    80207292:	8a9d                	andi	a3,a3,7
    80207294:	fcf690e3          	bne	a3,a5,80207254 <virtio_disk_intr+0x44>
    80207298:	00003797          	auipc	a5,0x3
    8020729c:	b887b783          	ld	a5,-1144(a5) # 80209e20 <digits+0xaa0>
    802072a0:	439c                	lw	a5,0(a5)
    802072a2:	8b8d                	andi	a5,a5,3
    802072a4:	00003717          	auipc	a4,0x3
    802072a8:	b8473703          	ld	a4,-1148(a4) # 80209e28 <digits+0xaa8>
    802072ac:	c31c                	sw	a5,0(a4)
    802072ae:	0001e517          	auipc	a0,0x1e
    802072b2:	dfa50513          	addi	a0,a0,-518 # 802250a8 <disk+0x20a8>
    802072b6:	ffff9097          	auipc	ra,0xffff9
    802072ba:	464080e7          	jalr	1124(ra) # 8020071a <release>
    802072be:	60e2                	ld	ra,24(sp)
    802072c0:	6442                	ld	s0,16(sp)
    802072c2:	64a2                	ld	s1,8(sp)
    802072c4:	6902                	ld	s2,0(sp)
    802072c6:	6105                	addi	sp,sp,32
    802072c8:	8082                	ret
    802072ca:	00003517          	auipc	a0,0x3
    802072ce:	ade50513          	addi	a0,a0,-1314 # 80209da8 <digits+0xa28>
    802072d2:	ffff9097          	auipc	ra,0xffff9
    802072d6:	e72080e7          	jalr	-398(ra) # 80200144 <panic>
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
