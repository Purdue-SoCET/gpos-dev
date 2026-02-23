
build/interrupts-exceptions/int_during_ret:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <boot>:
80000000:	4081                	li	ra,0
80000002:	4101                	li	sp,0
80000004:	4181                	li	gp,0
80000006:	4201                	li	tp,0
80000008:	4281                	li	t0,0
8000000a:	4301                	li	t1,0
8000000c:	4381                	li	t2,0
8000000e:	4401                	li	s0,0
80000010:	4481                	li	s1,0
80000012:	4501                	li	a0,0
80000014:	4581                	li	a1,0
80000016:	4601                	li	a2,0
80000018:	4681                	li	a3,0
8000001a:	4701                	li	a4,0
8000001c:	4781                	li	a5,0
8000001e:	4801                	li	a6,0
80000020:	4881                	li	a7,0
80000022:	4901                	li	s2,0
80000024:	4981                	li	s3,0
80000026:	4a01                	li	s4,0
80000028:	4a81                	li	s5,0
8000002a:	4b01                	li	s6,0
8000002c:	4b81                	li	s7,0
8000002e:	4c01                	li	s8,0
80000030:	4c81                	li	s9,0
80000032:	4d01                	li	s10,0
80000034:	4d81                	li	s11,0
80000036:	4e01                	li	t3,0
80000038:	4e81                	li	t4,0
8000003a:	4f01                	li	t5,0
8000003c:	4f81                	li	t6,0
8000003e:	40000117          	auipc	sp,0x40000
80000042:	fc210113          	add	sp,sp,-62 # c0000000 <__stack_top>
80000046:	00001197          	auipc	gp,0x1
8000004a:	96a18193          	add	gp,gp,-1686 # 800009b0 <__bss_end>

8000004e <clr_bss>:
8000004e:	00018293          	mv	t0,gp
80000052:	00018313          	mv	t1,gp
80000056:	00628763          	beq	t0,t1,80000064 <do_preinit_arr>

8000005a <clr_bss_loop>:
8000005a:	00028023          	sb	zero,0(t0)
8000005e:	0285                	add	t0,t0,1
80000060:	fe535de3          	bge	t1,t0,8000005a <clr_bss_loop>

80000064 <do_preinit_arr>:
80000064:	df218413          	add	s0,gp,-526 # 800007a2 <__init_array_end>
80000068:	df218493          	add	s1,gp,-526 # 800007a2 <__init_array_end>
8000006c:	00940963          	beq	s0,s1,8000007e <do_init_arr>

80000070 <preinit_arr_calls>:
80000070:	00042903          	lw	s2,0(s0)
80000074:	000900e7          	jalr	s2
80000078:	0411                	add	s0,s0,4
8000007a:	fe941be3          	bne	s0,s1,80000070 <preinit_arr_calls>

8000007e <do_init_arr>:
8000007e:	df218413          	add	s0,gp,-526 # 800007a2 <__init_array_end>
80000082:	df218493          	add	s1,gp,-526 # 800007a2 <__init_array_end>
80000086:	00940963          	beq	s0,s1,80000098 <enter_main>

8000008a <init_arr_calls>:
8000008a:	00042903          	lw	s2,0(s0)
8000008e:	000900e7          	jalr	s2
80000092:	0411                	add	s0,s0,4
80000094:	fc941ee3          	bne	s0,s1,80000070 <preinit_arr_calls>

80000098 <enter_main>:
80000098:	092000ef          	jal	8000012a <main>

8000009c <done>:
8000009c:	df418d93          	add	s11,gp,-524 # 800007a4 <flag>
800000a0:	000dae03          	lw	t3,0(s11)
800000a4:	df818d93          	add	s11,gp,-520 # 800007a8 <tohost>
800000a8:	01cda023          	sw	t3,0(s11)

800000ac <__sim_halt>:
800000ac:	a001                	j	800000ac <__sim_halt>
	...

800000b0 <exception_handler>:
800000b0:	7139                	add	sp,sp,-64
800000b2:	cc3e                	sw	a5,24(sp)
800000b4:	de06                	sw	ra,60(sp)
800000b6:	dc16                	sw	t0,56(sp)
800000b8:	da1a                	sw	t1,52(sp)
800000ba:	d81e                	sw	t2,48(sp)
800000bc:	d62a                	sw	a0,44(sp)
800000be:	d42e                	sw	a1,40(sp)
800000c0:	d232                	sw	a2,36(sp)
800000c2:	d036                	sw	a3,32(sp)
800000c4:	ce3a                	sw	a4,28(sp)
800000c6:	ca42                	sw	a6,20(sp)
800000c8:	c846                	sw	a7,16(sp)
800000ca:	c672                	sw	t3,12(sp)
800000cc:	c476                	sw	t4,8(sp)
800000ce:	c27a                	sw	t5,4(sp)
800000d0:	c07e                	sw	t6,0(sp)
800000d2:	4781                	li	a5,0
800000d4:	30479073          	csrw	mie,a5
800000d8:	00000517          	auipc	a0,0x0
800000dc:	6d850513          	add	a0,a0,1752 # 800007b0 <fromhost+0x4>
800000e0:	2909                	jal	800004f2 <print>
800000e2:	4785                	li	a5,1
800000e4:	def1aa23          	sw	a5,-524(gp) # 800007a4 <flag>
800000e8:	50f2                	lw	ra,60(sp)
800000ea:	52e2                	lw	t0,56(sp)
800000ec:	5352                	lw	t1,52(sp)
800000ee:	53c2                	lw	t2,48(sp)
800000f0:	5532                	lw	a0,44(sp)
800000f2:	55a2                	lw	a1,40(sp)
800000f4:	5612                	lw	a2,36(sp)
800000f6:	5682                	lw	a3,32(sp)
800000f8:	4772                	lw	a4,28(sp)
800000fa:	47e2                	lw	a5,24(sp)
800000fc:	4852                	lw	a6,20(sp)
800000fe:	48c2                	lw	a7,16(sp)
80000100:	4e32                	lw	t3,12(sp)
80000102:	4ea2                	lw	t4,8(sp)
80000104:	4f12                	lw	t5,4(sp)
80000106:	4f82                	lw	t6,0(sp)
80000108:	6121                	add	sp,sp,64
8000010a:	30200073          	mret
	...

80000110 <foo>:
80000110:	df418793          	add	a5,gp,-524 # 800007a4 <flag>
80000114:	0ff00313          	li	t1,255
80000118:	30046073          	csrs	mstatus,8
8000011c:	00008067          	ret
80000120:	0067a023          	sw	t1,0(a5)
80000124:	00008067          	ret
	...

8000012a <main>:
8000012a:	1141                	add	sp,sp,-16
8000012c:	c606                	sw	ra,12(sp)
8000012e:	14800793          	li	a5,328
80000132:	fe002623          	sw	zero,-20(zero) # ffffffec <__stack_top+0x3fffffec>
80000136:	fef02423          	sw	a5,-24(zero) # ffffffe8 <__stack_top+0x3fffffe8>
8000013a:	08000593          	li	a1,128
8000013e:	00000517          	auipc	a0,0x0
80000142:	f7250513          	add	a0,a0,-142 # 800000b0 <exception_handler>
80000146:	211d                	jal	8000056c <setup_interrupts_m>
80000148:	37e1                	jal	80000110 <foo>
8000014a:	df41a703          	lw	a4,-524(gp) # 800007a4 <flag>
8000014e:	4785                	li	a5,1
80000150:	00f70b63          	beq	a4,a5,80000166 <main+0x3c>
80000154:	00000517          	auipc	a0,0x0
80000158:	69450513          	add	a0,a0,1684 # 800007e8 <fromhost+0x3c>
8000015c:	23e5                	jal	80000744 <test_fail>
8000015e:	40b2                	lw	ra,12(sp)
80000160:	4501                	li	a0,0
80000162:	0141                	add	sp,sp,16
80000164:	8082                	ret
80000166:	00000517          	auipc	a0,0x0
8000016a:	66250513          	add	a0,a0,1634 # 800007c8 <fromhost+0x1c>
8000016e:	2b6d                	jal	80000728 <test_pass>
80000170:	b7fd                	j	8000015e <main+0x34>

80000172 <print_string>:
80000172:	00054783          	lbu	a5,0(a0)
80000176:	cb81                	beqz	a5,80000186 <print_string+0x14>
80000178:	0505                	add	a0,a0,1
8000017a:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
8000017e:	00054783          	lbu	a5,0(a0)
80000182:	0505                	add	a0,a0,1
80000184:	fbfd                	bnez	a5,8000017a <print_string+0x8>
80000186:	8082                	ret

80000188 <vformat>:
80000188:	00054683          	lbu	a3,0(a0)
8000018c:	ce85                	beqz	a3,800001c4 <vformat+0x3c>
8000018e:	4781                	li	a5,0
80000190:	4801                	li	a6,0
80000192:	4881                	li	a7,0
80000194:	872e                	mv	a4,a1
80000196:	02500e13          	li	t3,37
8000019a:	03f00e93          	li	t4,63
8000019e:	4fd9                	li	t6,22
800001a0:	f9418f13          	add	t5,gp,-108 # 80000944 <fromhost+0x198>
800001a4:	833a                	mv	t1,a4
800001a6:	03c68263          	beq	a3,t3,800001ca <vformat+0x42>
800001aa:	0805                	add	a6,a6,1
800001ac:	00d70023          	sb	a3,0(a4)
800001b0:	01058733          	add	a4,a1,a6
800001b4:	0785                	add	a5,a5,1
800001b6:	00f506b3          	add	a3,a0,a5
800001ba:	0006c683          	lbu	a3,0(a3)
800001be:	88be                	mv	a7,a5
800001c0:	f2f5                	bnez	a3,800001a4 <vformat+0x1c>
800001c2:	85ba                	mv	a1,a4
800001c4:	00058023          	sb	zero,0(a1)
800001c8:	8082                	ret
800001ca:	98aa                	add	a7,a7,a0
800001cc:	0018c683          	lbu	a3,1(a7)
800001d0:	2a068263          	beqz	a3,80000474 <vformat+0x2ec>
800001d4:	2dc68463          	beq	a3,t3,8000049c <vformat+0x314>
800001d8:	f9e68693          	add	a3,a3,-98
800001dc:	0ff6f693          	zext.b	a3,a3
800001e0:	2cdfe563          	bltu	t6,a3,800004aa <vformat+0x322>
800001e4:	7139                	add	sp,sp,-64
800001e6:	de22                	sw	s0,60(sp)
800001e8:	dc26                	sw	s1,56(sp)
800001ea:	da4a                	sw	s2,52(sp)
800001ec:	d84e                	sw	s3,48(sp)
800001ee:	d652                	sw	s4,44(sp)
800001f0:	068a                	sll	a3,a3,0x2
800001f2:	96fa                	add	a3,a3,t5
800001f4:	4294                	lw	a3,0(a3)
800001f6:	96fa                	add	a3,a3,t5
800001f8:	8682                	jr	a3
800001fa:	98aa                	add	a7,a7,a0
800001fc:	0018c683          	lbu	a3,1(a7)
80000200:	1e068563          	beqz	a3,800003ea <vformat+0x262>
80000204:	21c68163          	beq	a3,t3,80000406 <vformat+0x27e>
80000208:	f9e68693          	add	a3,a3,-98
8000020c:	0ff6f693          	zext.b	a3,a3
80000210:	fedff0e3          	bgeu	t6,a3,800001f0 <vformat+0x68>
80000214:	03f00893          	li	a7,63
80000218:	00280693          	add	a3,a6,2
8000021c:	01170023          	sb	a7,0(a4)
80000220:	011700a3          	sb	a7,1(a4)
80000224:	080d                	add	a6,a6,3
80000226:	00d58733          	add	a4,a1,a3
8000022a:	01170023          	sb	a7,0(a4)
8000022e:	01058733          	add	a4,a1,a6
80000232:	0785                	add	a5,a5,1
80000234:	0785                	add	a5,a5,1
80000236:	00f506b3          	add	a3,a0,a5
8000023a:	0006c683          	lbu	a3,0(a3)
8000023e:	88be                	mv	a7,a5
80000240:	c285                	beqz	a3,80000260 <vformat+0xd8>
80000242:	833a                	mv	t1,a4
80000244:	fbc68be3          	beq	a3,t3,800001fa <vformat+0x72>
80000248:	0785                	add	a5,a5,1
8000024a:	00d70023          	sb	a3,0(a4)
8000024e:	00f506b3          	add	a3,a0,a5
80000252:	0006c683          	lbu	a3,0(a3)
80000256:	0805                	add	a6,a6,1
80000258:	01058733          	add	a4,a1,a6
8000025c:	88be                	mv	a7,a5
8000025e:	f2f5                	bnez	a3,80000242 <vformat+0xba>
80000260:	00070023          	sb	zero,0(a4)
80000264:	5472                	lw	s0,60(sp)
80000266:	54e2                	lw	s1,56(sp)
80000268:	5952                	lw	s2,52(sp)
8000026a:	59c2                	lw	s3,48(sp)
8000026c:	5a32                	lw	s4,44(sp)
8000026e:	6121                	add	sp,sp,64
80000270:	8082                	ret
80000272:	00062303          	lw	t1,0(a2)
80000276:	03000693          	li	a3,48
8000027a:	07800893          	li	a7,120
8000027e:	0809                	add	a6,a6,2
80000280:	00d70023          	sb	a3,0(a4)
80000284:	011700a3          	sb	a7,1(a4)
80000288:	0611                	add	a2,a2,4
8000028a:	010583b3          	add	t2,a1,a6
8000028e:	18030263          	beqz	t1,80000412 <vformat+0x28a>
80000292:	4881                	li	a7,0
80000294:	868a                	mv	a3,sp
80000296:	ff018293          	add	t0,gp,-16 # 800009a0 <table>
8000029a:	00f37713          	and	a4,t1,15
8000029e:	9716                	add	a4,a4,t0
800002a0:	00074483          	lbu	s1,0(a4)
800002a4:	8746                	mv	a4,a7
800002a6:	0885                	add	a7,a7,1
800002a8:	01168433          	add	s0,a3,a7
800002ac:	fe940fa3          	sb	s1,-1(s0)
800002b0:	00435313          	srl	t1,t1,0x4
800002b4:	fe0313e3          	bnez	t1,8000029a <vformat+0x112>
800002b8:	9736                	add	a4,a4,a3
800002ba:	831e                	mv	t1,t2
800002bc:	00074383          	lbu	t2,0(a4)
800002c0:	82ba                	mv	t0,a4
800002c2:	0305                	add	t1,t1,1
800002c4:	fe730fa3          	sb	t2,-1(t1)
800002c8:	177d                	add	a4,a4,-1
800002ca:	fe5699e3          	bne	a3,t0,800002bc <vformat+0x134>
800002ce:	9846                	add	a6,a6,a7
800002d0:	01058733          	add	a4,a1,a6
800002d4:	bfb9                	j	80000232 <vformat+0xaa>
800002d6:	00062383          	lw	t2,0(a2)
800002da:	0611                	add	a2,a2,4
800002dc:	1a038a63          	beqz	t2,80000490 <vformat+0x308>
800002e0:	4301                	li	t1,0
800002e2:	868a                	mv	a3,sp
800002e4:	ff018293          	add	t0,gp,-16 # 800009a0 <table>
800002e8:	44a9                	li	s1,10
800002ea:	4a25                	li	s4,9
800002ec:	0293f433          	remu	s0,t2,s1
800002f0:	889a                	mv	a7,t1
800002f2:	0305                	add	t1,t1,1
800002f4:	006689b3          	add	s3,a3,t1
800002f8:	891e                	mv	s2,t2
800002fa:	9416                	add	s0,s0,t0
800002fc:	00044403          	lbu	s0,0(s0)
80000300:	0293d3b3          	divu	t2,t2,s1
80000304:	fe898fa3          	sb	s0,-1(s3)
80000308:	ff2a62e3          	bltu	s4,s2,800002ec <vformat+0x164>
8000030c:	98b6                	add	a7,a7,a3
8000030e:	0008c383          	lbu	t2,0(a7)
80000312:	82c6                	mv	t0,a7
80000314:	0705                	add	a4,a4,1
80000316:	fe770fa3          	sb	t2,-1(a4)
8000031a:	18fd                	add	a7,a7,-1
8000031c:	fe5699e3          	bne	a3,t0,8000030e <vformat+0x186>
80000320:	981a                	add	a6,a6,t1
80000322:	01058733          	add	a4,a1,a6
80000326:	b731                	j	80000232 <vformat+0xaa>
80000328:	00062283          	lw	t0,0(a2)
8000032c:	0611                	add	a2,a2,4
8000032e:	0002c883          	lbu	a7,0(t0)
80000332:	f00880e3          	beqz	a7,80000232 <vformat+0xaa>
80000336:	4681                	li	a3,0
80000338:	00d70333          	add	t1,a4,a3
8000033c:	0685                	add	a3,a3,1
8000033e:	01130023          	sb	a7,0(t1)
80000342:	00d288b3          	add	a7,t0,a3
80000346:	0008c883          	lbu	a7,0(a7)
8000034a:	fe0897e3          	bnez	a7,80000338 <vformat+0x1b0>
8000034e:	9836                	add	a6,a6,a3
80000350:	01058733          	add	a4,a1,a6
80000354:	bdf9                	j	80000232 <vformat+0xaa>
80000356:	00062883          	lw	a7,0(a2)
8000035a:	0611                	add	a2,a2,4
8000035c:	0c08c263          	bltz	a7,80000420 <vformat+0x298>
80000360:	0c089963          	bnez	a7,80000432 <vformat+0x2aa>
80000364:	03000693          	li	a3,48
80000368:	00d70023          	sb	a3,0(a4)
8000036c:	4385                	li	t2,1
8000036e:	981e                	add	a6,a6,t2
80000370:	01058733          	add	a4,a1,a6
80000374:	bd7d                	j	80000232 <vformat+0xaa>
80000376:	4214                	lw	a3,0(a2)
80000378:	0805                	add	a6,a6,1
8000037a:	0611                	add	a2,a2,4
8000037c:	00d70023          	sb	a3,0(a4)
80000380:	01058733          	add	a4,a1,a6
80000384:	b57d                	j	80000232 <vformat+0xaa>
80000386:	00062303          	lw	t1,0(a2)
8000038a:	03000693          	li	a3,48
8000038e:	06200893          	li	a7,98
80000392:	0809                	add	a6,a6,2
80000394:	00d70023          	sb	a3,0(a4)
80000398:	011700a3          	sb	a7,1(a4)
8000039c:	0611                	add	a2,a2,4
8000039e:	010583b3          	add	t2,a1,a6
800003a2:	06030863          	beqz	t1,80000412 <vformat+0x28a>
800003a6:	4881                	li	a7,0
800003a8:	868a                	mv	a3,sp
800003aa:	ff018293          	add	t0,gp,-16 # 800009a0 <table>
800003ae:	00137713          	and	a4,t1,1
800003b2:	9716                	add	a4,a4,t0
800003b4:	00074483          	lbu	s1,0(a4)
800003b8:	8746                	mv	a4,a7
800003ba:	0885                	add	a7,a7,1
800003bc:	01168433          	add	s0,a3,a7
800003c0:	fe940fa3          	sb	s1,-1(s0)
800003c4:	00135313          	srl	t1,t1,0x1
800003c8:	fe0313e3          	bnez	t1,800003ae <vformat+0x226>
800003cc:	9736                	add	a4,a4,a3
800003ce:	831e                	mv	t1,t2
800003d0:	00074383          	lbu	t2,0(a4)
800003d4:	82ba                	mv	t0,a4
800003d6:	0305                	add	t1,t1,1
800003d8:	fe730fa3          	sb	t2,-1(t1)
800003dc:	177d                	add	a4,a4,-1
800003de:	fe5699e3          	bne	a3,t0,800003d0 <vformat+0x248>
800003e2:	9846                	add	a6,a6,a7
800003e4:	01058733          	add	a4,a1,a6
800003e8:	b5a9                	j	80000232 <vformat+0xaa>
800003ea:	00280693          	add	a3,a6,2
800003ee:	01d70023          	sb	t4,0(a4)
800003f2:	01d700a3          	sb	t4,1(a4)
800003f6:	080d                	add	a6,a6,3
800003f8:	00d58733          	add	a4,a1,a3
800003fc:	01d70023          	sb	t4,0(a4)
80000400:	01058733          	add	a4,a1,a6
80000404:	bd05                	j	80000234 <vformat+0xac>
80000406:	0805                	add	a6,a6,1
80000408:	01c70023          	sb	t3,0(a4)
8000040c:	01058733          	add	a4,a1,a6
80000410:	b50d                	j	80000232 <vformat+0xaa>
80000412:	4885                	li	a7,1
80000414:	9846                	add	a6,a6,a7
80000416:	00d38023          	sb	a3,0(t2)
8000041a:	01058733          	add	a4,a1,a6
8000041e:	bd11                	j	80000232 <vformat+0xaa>
80000420:	0805                	add	a6,a6,1
80000422:	02d00693          	li	a3,45
80000426:	00d70023          	sb	a3,0(a4)
8000042a:	411008b3          	neg	a7,a7
8000042e:	01058333          	add	t1,a1,a6
80000432:	4381                	li	t2,0
80000434:	868a                	mv	a3,sp
80000436:	ff018293          	add	t0,gp,-16 # 800009a0 <table>
8000043a:	44a9                	li	s1,10
8000043c:	4a25                	li	s4,9
8000043e:	0298f433          	remu	s0,a7,s1
80000442:	871e                	mv	a4,t2
80000444:	0385                	add	t2,t2,1
80000446:	007689b3          	add	s3,a3,t2
8000044a:	8946                	mv	s2,a7
8000044c:	9416                	add	s0,s0,t0
8000044e:	00044403          	lbu	s0,0(s0)
80000452:	0298d8b3          	divu	a7,a7,s1
80000456:	fe898fa3          	sb	s0,-1(s3)
8000045a:	ff2a62e3          	bltu	s4,s2,8000043e <vformat+0x2b6>
8000045e:	9736                	add	a4,a4,a3
80000460:	00074283          	lbu	t0,0(a4)
80000464:	88ba                	mv	a7,a4
80000466:	0305                	add	t1,t1,1
80000468:	fe530fa3          	sb	t0,-1(t1)
8000046c:	177d                	add	a4,a4,-1
8000046e:	ff1699e3          	bne	a3,a7,80000460 <vformat+0x2d8>
80000472:	bdf5                	j	8000036e <vformat+0x1e6>
80000474:	00280693          	add	a3,a6,2
80000478:	01d70023          	sb	t4,0(a4)
8000047c:	01d700a3          	sb	t4,1(a4)
80000480:	080d                	add	a6,a6,3
80000482:	00d58733          	add	a4,a1,a3
80000486:	01d70023          	sb	t4,0(a4)
8000048a:	01058733          	add	a4,a1,a6
8000048e:	b31d                	j	800001b4 <vformat+0x2c>
80000490:	03000693          	li	a3,48
80000494:	00d70023          	sb	a3,0(a4)
80000498:	4305                	li	t1,1
8000049a:	b559                	j	80000320 <vformat+0x198>
8000049c:	0805                	add	a6,a6,1
8000049e:	01c70023          	sb	t3,0(a4)
800004a2:	0785                	add	a5,a5,1
800004a4:	01058733          	add	a4,a1,a6
800004a8:	b331                	j	800001b4 <vformat+0x2c>
800004aa:	03f00893          	li	a7,63
800004ae:	00280693          	add	a3,a6,2
800004b2:	01170023          	sb	a7,0(a4)
800004b6:	011700a3          	sb	a7,1(a4)
800004ba:	080d                	add	a6,a6,3
800004bc:	00d58733          	add	a4,a1,a3
800004c0:	01170023          	sb	a7,0(a4)
800004c4:	0785                	add	a5,a5,1
800004c6:	01058733          	add	a4,a1,a6
800004ca:	b1ed                	j	800001b4 <vformat+0x2c>

800004cc <vprint>:
800004cc:	7175                	add	sp,sp,-144
800004ce:	862e                	mv	a2,a1
800004d0:	858a                	mv	a1,sp
800004d2:	c706                	sw	ra,140(sp)
800004d4:	3955                	jal	80000188 <vformat>
800004d6:	00014783          	lbu	a5,0(sp)
800004da:	cb89                	beqz	a5,800004ec <vprint+0x20>
800004dc:	00110713          	add	a4,sp,1
800004e0:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
800004e4:	00074783          	lbu	a5,0(a4)
800004e8:	0705                	add	a4,a4,1
800004ea:	fbfd                	bnez	a5,800004e0 <vprint+0x14>
800004ec:	40ba                	lw	ra,140(sp)
800004ee:	6149                	add	sp,sp,144
800004f0:	8082                	ret

800004f2 <print>:
800004f2:	7139                	add	sp,sp,-64
800004f4:	02410313          	add	t1,sp,36
800004f8:	d22e                	sw	a1,36(sp)
800004fa:	859a                	mv	a1,t1
800004fc:	ce06                	sw	ra,28(sp)
800004fe:	d432                	sw	a2,40(sp)
80000500:	d636                	sw	a3,44(sp)
80000502:	d83a                	sw	a4,48(sp)
80000504:	da3e                	sw	a5,52(sp)
80000506:	dc42                	sw	a6,56(sp)
80000508:	de46                	sw	a7,60(sp)
8000050a:	c61a                	sw	t1,12(sp)
8000050c:	37c1                	jal	800004cc <vprint>
8000050e:	40f2                	lw	ra,28(sp)
80000510:	6121                	add	sp,sp,64
80000512:	8082                	ret

80000514 <format>:
80000514:	7139                	add	sp,sp,-64
80000516:	02810313          	add	t1,sp,40
8000051a:	d432                	sw	a2,40(sp)
8000051c:	861a                	mv	a2,t1
8000051e:	ce06                	sw	ra,28(sp)
80000520:	d636                	sw	a3,44(sp)
80000522:	d83a                	sw	a4,48(sp)
80000524:	da3e                	sw	a5,52(sp)
80000526:	dc42                	sw	a6,56(sp)
80000528:	de46                	sw	a7,60(sp)
8000052a:	c61a                	sw	t1,12(sp)
8000052c:	39b1                	jal	80000188 <vformat>
8000052e:	40f2                	lw	ra,28(sp)
80000530:	6121                	add	sp,sp,64
80000532:	8082                	ret

80000534 <dprint>:
80000534:	1101                	add	sp,sp,-32
80000536:	c22e                	sw	a1,4(sp)
80000538:	c432                	sw	a2,8(sp)
8000053a:	c636                	sw	a3,12(sp)
8000053c:	c83a                	sw	a4,16(sp)
8000053e:	ca3e                	sw	a5,20(sp)
80000540:	cc42                	sw	a6,24(sp)
80000542:	ce46                	sw	a7,28(sp)
80000544:	6105                	add	sp,sp,32
80000546:	8082                	ret

80000548 <advance_mepc>:
80000548:	341027f3          	csrr	a5,mepc
8000054c:	953e                	add	a0,a0,a5
8000054e:	34151073          	csrw	mepc,a0
80000552:	8082                	ret

80000554 <set_mepc>:
80000554:	34151073          	csrw	mepc,a0
80000558:	8082                	ret

8000055a <advance_sepc>:
8000055a:	141027f3          	csrr	a5,sepc
8000055e:	953e                	add	a0,a0,a5
80000560:	14151073          	csrw	sepc,a0
80000564:	8082                	ret

80000566 <set_sepc>:
80000566:	14151073          	csrw	sepc,a0
8000056a:	8082                	ret

8000056c <setup_interrupts_m>:
8000056c:	30551073          	csrw	mtvec,a0
80000570:	30459073          	csrw	mie,a1
80000574:	8082                	ret

80000576 <setup_interrupt_m_vectored>:
80000576:	00156513          	or	a0,a0,1
8000057a:	30551073          	csrw	mtvec,a0
8000057e:	30459073          	csrw	mie,a1
80000582:	8082                	ret

80000584 <enable_interrupts_m>:
80000584:	47a1                	li	a5,8
80000586:	3007a073          	csrs	mstatus,a5
8000058a:	8082                	ret

8000058c <disable_interrupts_m>:
8000058c:	47a1                	li	a5,8
8000058e:	3007b073          	csrc	mstatus,a5
80000592:	8082                	ret

80000594 <enable_interrupts_save_m>:
80000594:	30051073          	csrw	mstatus,a0
80000598:	8082                	ret

8000059a <disable_interrupts_save_m>:
8000059a:	4521                	li	a0,8
8000059c:	30053573          	csrrc	a0,mstatus,a0
800005a0:	8082                	ret

800005a2 <check_supervisor_mode_available>:
800005a2:	6785                	lui	a5,0x1
800005a4:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
800005a8:	3007a573          	csrrs	a0,mstatus,a5
800005ac:	30051573          	csrrw	a0,mstatus,a0
800005b0:	6789                	lui	a5,0x2
800005b2:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
800005b6:	8d7d                	and	a0,a0,a5
800005b8:	80050513          	add	a0,a0,-2048
800005bc:	00153513          	seqz	a0,a0
800005c0:	8082                	ret

800005c2 <require_supervisor_mode>:
800005c2:	6785                	lui	a5,0x1
800005c4:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
800005c8:	3007a7f3          	csrrs	a5,mstatus,a5
800005cc:	300797f3          	csrrw	a5,mstatus,a5
800005d0:	6709                	lui	a4,0x2
800005d2:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
800005d6:	8ff9                	and	a5,a5,a4
800005d8:	80078793          	add	a5,a5,-2048
800005dc:	e391                	bnez	a5,800005e0 <require_supervisor_mode+0x1e>
800005de:	8082                	ret
800005e0:	1141                	add	sp,sp,-16
800005e2:	00000517          	auipc	a0,0x0
800005e6:	23650513          	add	a0,a0,566 # 80000818 <fromhost+0x6c>
800005ea:	c606                	sw	ra,12(sp)
800005ec:	3719                	jal	800004f2 <print>
800005ee:	57fd                	li	a5,-1
800005f0:	def1aa23          	sw	a5,-524(gp) # 800007a4 <flag>
800005f4:	3465                	jal	8000009c <done>

800005f6 <read_exception_context>:
800005f6:	c00027f3          	rdcycle	a5
800005fa:	c55c                	sw	a5,12(a0)
800005fc:	c01027f3          	rdtime	a5
80000600:	c91c                	sw	a5,16(a0)
80000602:	342027f3          	csrr	a5,mcause
80000606:	c51c                	sw	a5,8(a0)
80000608:	341027f3          	csrr	a5,mepc
8000060c:	c11c                	sw	a5,0(a0)
8000060e:	343027f3          	csrr	a5,mtval
80000612:	c15c                	sw	a5,4(a0)
80000614:	c03027f3          	csrr	a5,hpmcounter3
80000618:	c95c                	sw	a5,20(a0)
8000061a:	c04027f3          	csrr	a5,hpmcounter4
8000061e:	cd1c                	sw	a5,24(a0)
80000620:	8082                	ret

80000622 <read_exception_context_s>:
80000622:	c00027f3          	rdcycle	a5
80000626:	c55c                	sw	a5,12(a0)
80000628:	c01027f3          	rdtime	a5
8000062c:	c91c                	sw	a5,16(a0)
8000062e:	142027f3          	csrr	a5,scause
80000632:	c51c                	sw	a5,8(a0)
80000634:	141027f3          	csrr	a5,sepc
80000638:	c11c                	sw	a5,0(a0)
8000063a:	143027f3          	csrr	a5,stval
8000063e:	c15c                	sw	a5,4(a0)
80000640:	c03027f3          	csrr	a5,hpmcounter3
80000644:	c95c                	sw	a5,20(a0)
80000646:	c04027f3          	csrr	a5,hpmcounter4
8000064a:	cd1c                	sw	a5,24(a0)
8000064c:	8082                	ret

8000064e <print_exception_context>:
8000064e:	1141                	add	sp,sp,-16
80000650:	c422                	sw	s0,8(sp)
80000652:	842a                	mv	s0,a0
80000654:	00000517          	auipc	a0,0x0
80000658:	1e850513          	add	a0,a0,488 # 8000083c <fromhost+0x90>
8000065c:	c606                	sw	ra,12(sp)
8000065e:	3d51                	jal	800004f2 <print>
80000660:	440c                	lw	a1,8(s0)
80000662:	00000517          	auipc	a0,0x0
80000666:	1f250513          	add	a0,a0,498 # 80000854 <fromhost+0xa8>
8000066a:	3561                	jal	800004f2 <print>
8000066c:	400c                	lw	a1,0(s0)
8000066e:	00000517          	auipc	a0,0x0
80000672:	1f650513          	add	a0,a0,502 # 80000864 <fromhost+0xb8>
80000676:	3db5                	jal	800004f2 <print>
80000678:	404c                	lw	a1,4(s0)
8000067a:	00000517          	auipc	a0,0x0
8000067e:	1fa50513          	add	a0,a0,506 # 80000874 <fromhost+0xc8>
80000682:	3d85                	jal	800004f2 <print>
80000684:	444c                	lw	a1,12(s0)
80000686:	00000517          	auipc	a0,0x0
8000068a:	1fe50513          	add	a0,a0,510 # 80000884 <fromhost+0xd8>
8000068e:	3595                	jal	800004f2 <print>
80000690:	480c                	lw	a1,16(s0)
80000692:	00000517          	auipc	a0,0x0
80000696:	20250513          	add	a0,a0,514 # 80000894 <fromhost+0xe8>
8000069a:	3da1                	jal	800004f2 <print>
8000069c:	484c                	lw	a1,20(s0)
8000069e:	00000517          	auipc	a0,0x0
800006a2:	20650513          	add	a0,a0,518 # 800008a4 <fromhost+0xf8>
800006a6:	35b1                	jal	800004f2 <print>
800006a8:	4c0c                	lw	a1,24(s0)
800006aa:	4422                	lw	s0,8(sp)
800006ac:	40b2                	lw	ra,12(sp)
800006ae:	00000517          	auipc	a0,0x0
800006b2:	20650513          	add	a0,a0,518 # 800008b4 <fromhost+0x108>
800006b6:	0141                	add	sp,sp,16
800006b8:	bd2d                	j	800004f2 <print>
	...

800006bc <default_handler>:
800006bc:	711d                	add	sp,sp,-96
800006be:	c6aa                	sw	a0,76(sp)
800006c0:	0048                	add	a0,sp,4
800006c2:	ce86                	sw	ra,92(sp)
800006c4:	cc96                	sw	t0,88(sp)
800006c6:	ca9a                	sw	t1,84(sp)
800006c8:	c89e                	sw	t2,80(sp)
800006ca:	c4ae                	sw	a1,72(sp)
800006cc:	c2b2                	sw	a2,68(sp)
800006ce:	c0b6                	sw	a3,64(sp)
800006d0:	de3a                	sw	a4,60(sp)
800006d2:	dc3e                	sw	a5,56(sp)
800006d4:	da42                	sw	a6,52(sp)
800006d6:	d846                	sw	a7,48(sp)
800006d8:	d672                	sw	t3,44(sp)
800006da:	d476                	sw	t4,40(sp)
800006dc:	d27a                	sw	t5,36(sp)
800006de:	d07e                	sw	t6,32(sp)
800006e0:	3f19                	jal	800005f6 <read_exception_context>
800006e2:	0048                	add	a0,sp,4
800006e4:	37ad                	jal	8000064e <print_exception_context>
800006e6:	00000517          	auipc	a0,0x0
800006ea:	1de50513          	add	a0,a0,478 # 800008c4 <fromhost+0x118>
800006ee:	3511                	jal	800004f2 <print>
800006f0:	3275                	jal	8000009c <done>

800006f2 <unreachable_handler>:
800006f2:	711d                	add	sp,sp,-96
800006f4:	c6aa                	sw	a0,76(sp)
800006f6:	0048                	add	a0,sp,4
800006f8:	ce86                	sw	ra,92(sp)
800006fa:	cc96                	sw	t0,88(sp)
800006fc:	ca9a                	sw	t1,84(sp)
800006fe:	c89e                	sw	t2,80(sp)
80000700:	c4ae                	sw	a1,72(sp)
80000702:	c2b2                	sw	a2,68(sp)
80000704:	c0b6                	sw	a3,64(sp)
80000706:	de3a                	sw	a4,60(sp)
80000708:	dc3e                	sw	a5,56(sp)
8000070a:	da42                	sw	a6,52(sp)
8000070c:	d846                	sw	a7,48(sp)
8000070e:	d672                	sw	t3,44(sp)
80000710:	d476                	sw	t4,40(sp)
80000712:	d27a                	sw	t5,36(sp)
80000714:	d07e                	sw	t6,32(sp)
80000716:	35c5                	jal	800005f6 <read_exception_context>
80000718:	0048                	add	a0,sp,4
8000071a:	3f15                	jal	8000064e <print_exception_context>
8000071c:	00000517          	auipc	a0,0x0
80000720:	1d450513          	add	a0,a0,468 # 800008f0 <fromhost+0x144>
80000724:	33f9                	jal	800004f2 <print>
80000726:	3a9d                	jal	8000009c <done>

80000728 <test_pass>:
80000728:	1141                	add	sp,sp,-16
8000072a:	85aa                	mv	a1,a0
8000072c:	00000517          	auipc	a0,0x0
80000730:	21450513          	add	a0,a0,532 # 80000940 <fromhost+0x194>
80000734:	c606                	sw	ra,12(sp)
80000736:	3b75                	jal	800004f2 <print>
80000738:	40b2                	lw	ra,12(sp)
8000073a:	4785                	li	a5,1
8000073c:	def1aa23          	sw	a5,-524(gp) # 800007a4 <flag>
80000740:	0141                	add	sp,sp,16
80000742:	8082                	ret

80000744 <test_fail>:
80000744:	1141                	add	sp,sp,-16
80000746:	85aa                	mv	a1,a0
80000748:	00000517          	auipc	a0,0x0
8000074c:	1f850513          	add	a0,a0,504 # 80000940 <fromhost+0x194>
80000750:	c606                	sw	ra,12(sp)
80000752:	3345                	jal	800004f2 <print>
80000754:	40b2                	lw	ra,12(sp)
80000756:	de01aa23          	sw	zero,-524(gp) # 800007a4 <flag>
8000075a:	0141                	add	sp,sp,16
8000075c:	8082                	ret
	...

80000760 <vector_table>:
80000760:	951ff06f          	j	800000b0 <exception_handler>
80000764:	f59ff06f          	j	800006bc <default_handler>
80000768:	f8bff06f          	j	800006f2 <unreachable_handler>
8000076c:	f51ff06f          	j	800006bc <default_handler>
80000770:	f83ff06f          	j	800006f2 <unreachable_handler>
80000774:	f49ff06f          	j	800006bc <default_handler>
80000778:	f7bff06f          	j	800006f2 <unreachable_handler>
8000077c:	f41ff06f          	j	800006bc <default_handler>
80000780:	f73ff06f          	j	800006f2 <unreachable_handler>
80000784:	f39ff06f          	j	800006bc <default_handler>
80000788:	f6bff06f          	j	800006f2 <unreachable_handler>
8000078c:	f31ff06f          	j	800006bc <default_handler>
80000790:	f63ff06f          	j	800006f2 <unreachable_handler>
80000794:	f29ff06f          	j	800006bc <default_handler>
80000798:	f5bff06f          	j	800006f2 <unreachable_handler>
8000079c:	f57ff06f          	j	800006f2 <unreachable_handler>
	...
