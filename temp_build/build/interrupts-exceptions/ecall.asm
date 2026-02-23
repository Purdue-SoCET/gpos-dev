
build/interrupts-exceptions/ecall:     file format elf32-littleriscv


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
8000004a:	93618193          	add	gp,gp,-1738 # 8000097c <__bss_end>

8000004e <clr_bss>:
8000004e:	00018293          	mv	t0,gp
80000052:	00018313          	mv	t1,gp
80000056:	00628763          	beq	t0,t1,80000064 <do_preinit_arr>

8000005a <clr_bss_loop>:
8000005a:	00028023          	sb	zero,0(t0)
8000005e:	0285                	add	t0,t0,1
80000060:	fe535de3          	bge	t1,t0,8000005a <clr_bss_loop>

80000064 <do_preinit_arr>:
80000064:	e0618413          	add	s0,gp,-506 # 80000782 <__init_array_end>
80000068:	e0618493          	add	s1,gp,-506 # 80000782 <__init_array_end>
8000006c:	00940963          	beq	s0,s1,8000007e <do_init_arr>

80000070 <preinit_arr_calls>:
80000070:	00042903          	lw	s2,0(s0)
80000074:	000900e7          	jalr	s2
80000078:	0411                	add	s0,s0,4
8000007a:	fe941be3          	bne	s0,s1,80000070 <preinit_arr_calls>

8000007e <do_init_arr>:
8000007e:	e0618413          	add	s0,gp,-506 # 80000782 <__init_array_end>
80000082:	e0618493          	add	s1,gp,-506 # 80000782 <__init_array_end>
80000086:	00940963          	beq	s0,s1,80000098 <enter_main>

8000008a <init_arr_calls>:
8000008a:	00042903          	lw	s2,0(s0)
8000008e:	000900e7          	jalr	s2
80000092:	0411                	add	s0,s0,4
80000094:	fc941ee3          	bne	s0,s1,80000070 <preinit_arr_calls>

80000098 <enter_main>:
80000098:	076000ef          	jal	8000010e <main>

8000009c <done>:
8000009c:	e0818d93          	add	s11,gp,-504 # 80000784 <flag>
800000a0:	000dae03          	lw	t3,0(s11)
800000a4:	e0c18d93          	add	s11,gp,-500 # 80000788 <tohost>
800000a8:	01cda023          	sw	t3,0(s11)

800000ac <__sim_halt>:
800000ac:	a001                	j	800000ac <__sim_halt>
	...

800000b0 <exception_handler>:
800000b0:	7139                	add	sp,sp,-64
800000b2:	d62a                	sw	a0,44(sp)
800000b4:	4511                	li	a0,4
800000b6:	ce3a                	sw	a4,28(sp)
800000b8:	cc3e                	sw	a5,24(sp)
800000ba:	de06                	sw	ra,60(sp)
800000bc:	dc16                	sw	t0,56(sp)
800000be:	da1a                	sw	t1,52(sp)
800000c0:	d81e                	sw	t2,48(sp)
800000c2:	d42e                	sw	a1,40(sp)
800000c4:	d232                	sw	a2,36(sp)
800000c6:	d036                	sw	a3,32(sp)
800000c8:	ca42                	sw	a6,20(sp)
800000ca:	c846                	sw	a7,16(sp)
800000cc:	c672                	sw	t3,12(sp)
800000ce:	c476                	sw	t4,8(sp)
800000d0:	c27a                	sw	t5,4(sp)
800000d2:	c07e                	sw	t6,0(sp)
800000d4:	2999                	jal	8000052a <advance_mepc>
800000d6:	00000517          	auipc	a0,0x0
800000da:	6ba50513          	add	a0,a0,1722 # 80000790 <fromhost+0x4>
800000de:	2edd                	jal	800004d4 <print>
800000e0:	4785                	li	a5,1
800000e2:	e0f1a423          	sw	a5,-504(gp) # 80000784 <flag>
800000e6:	50f2                	lw	ra,60(sp)
800000e8:	52e2                	lw	t0,56(sp)
800000ea:	5352                	lw	t1,52(sp)
800000ec:	53c2                	lw	t2,48(sp)
800000ee:	5532                	lw	a0,44(sp)
800000f0:	55a2                	lw	a1,40(sp)
800000f2:	5612                	lw	a2,36(sp)
800000f4:	5682                	lw	a3,32(sp)
800000f6:	4772                	lw	a4,28(sp)
800000f8:	47e2                	lw	a5,24(sp)
800000fa:	4852                	lw	a6,20(sp)
800000fc:	48c2                	lw	a7,16(sp)
800000fe:	4e32                	lw	t3,12(sp)
80000100:	4ea2                	lw	t4,8(sp)
80000102:	4f12                	lw	t5,4(sp)
80000104:	4f82                	lw	t6,0(sp)
80000106:	6121                	add	sp,sp,64
80000108:	30200073          	mret
	...

8000010e <main>:
8000010e:	1141                	add	sp,sp,-16
80000110:	4581                	li	a1,0
80000112:	00000517          	auipc	a0,0x0
80000116:	f9e50513          	add	a0,a0,-98 # 800000b0 <exception_handler>
8000011a:	c606                	sw	ra,12(sp)
8000011c:	290d                	jal	8000054e <setup_interrupts_m>
8000011e:	00000517          	auipc	a0,0x0
80000122:	68a50513          	add	a0,a0,1674 # 800007a8 <fromhost+0x1c>
80000126:	267d                	jal	800004d4 <print>
80000128:	00000073          	ecall
8000012c:	e081a703          	lw	a4,-504(gp) # 80000784 <flag>
80000130:	4785                	li	a5,1
80000132:	00f70b63          	beq	a4,a5,80000148 <main+0x3a>
80000136:	00000517          	auipc	a0,0x0
8000013a:	69a50513          	add	a0,a0,1690 # 800007d0 <fromhost+0x44>
8000013e:	23dd                	jal	80000724 <test_fail>
80000140:	40b2                	lw	ra,12(sp)
80000142:	4501                	li	a0,0
80000144:	0141                	add	sp,sp,16
80000146:	8082                	ret
80000148:	00000517          	auipc	a0,0x0
8000014c:	67850513          	add	a0,a0,1656 # 800007c0 <fromhost+0x34>
80000150:	2b65                	jal	80000708 <test_pass>
80000152:	b7fd                	j	80000140 <main+0x32>

80000154 <print_string>:
80000154:	00054783          	lbu	a5,0(a0)
80000158:	cb81                	beqz	a5,80000168 <print_string+0x14>
8000015a:	0505                	add	a0,a0,1
8000015c:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
80000160:	00054783          	lbu	a5,0(a0)
80000164:	0505                	add	a0,a0,1
80000166:	fbfd                	bnez	a5,8000015c <print_string+0x8>
80000168:	8082                	ret

8000016a <vformat>:
8000016a:	00054683          	lbu	a3,0(a0)
8000016e:	ce85                	beqz	a3,800001a6 <vformat+0x3c>
80000170:	4781                	li	a5,0
80000172:	4801                	li	a6,0
80000174:	4881                	li	a7,0
80000176:	872e                	mv	a4,a1
80000178:	02500e13          	li	t3,37
8000017c:	03f00e93          	li	t4,63
80000180:	4fd9                	li	t6,22
80000182:	f9418f13          	add	t5,gp,-108 # 80000910 <fromhost+0x184>
80000186:	833a                	mv	t1,a4
80000188:	03c68263          	beq	a3,t3,800001ac <vformat+0x42>
8000018c:	0805                	add	a6,a6,1
8000018e:	00d70023          	sb	a3,0(a4)
80000192:	01058733          	add	a4,a1,a6
80000196:	0785                	add	a5,a5,1
80000198:	00f506b3          	add	a3,a0,a5
8000019c:	0006c683          	lbu	a3,0(a3)
800001a0:	88be                	mv	a7,a5
800001a2:	f2f5                	bnez	a3,80000186 <vformat+0x1c>
800001a4:	85ba                	mv	a1,a4
800001a6:	00058023          	sb	zero,0(a1)
800001aa:	8082                	ret
800001ac:	98aa                	add	a7,a7,a0
800001ae:	0018c683          	lbu	a3,1(a7)
800001b2:	2a068263          	beqz	a3,80000456 <vformat+0x2ec>
800001b6:	2dc68463          	beq	a3,t3,8000047e <vformat+0x314>
800001ba:	f9e68693          	add	a3,a3,-98
800001be:	0ff6f693          	zext.b	a3,a3
800001c2:	2cdfe563          	bltu	t6,a3,8000048c <vformat+0x322>
800001c6:	7139                	add	sp,sp,-64
800001c8:	de22                	sw	s0,60(sp)
800001ca:	dc26                	sw	s1,56(sp)
800001cc:	da4a                	sw	s2,52(sp)
800001ce:	d84e                	sw	s3,48(sp)
800001d0:	d652                	sw	s4,44(sp)
800001d2:	068a                	sll	a3,a3,0x2
800001d4:	96fa                	add	a3,a3,t5
800001d6:	4294                	lw	a3,0(a3)
800001d8:	96fa                	add	a3,a3,t5
800001da:	8682                	jr	a3
800001dc:	98aa                	add	a7,a7,a0
800001de:	0018c683          	lbu	a3,1(a7)
800001e2:	1e068563          	beqz	a3,800003cc <vformat+0x262>
800001e6:	21c68163          	beq	a3,t3,800003e8 <vformat+0x27e>
800001ea:	f9e68693          	add	a3,a3,-98
800001ee:	0ff6f693          	zext.b	a3,a3
800001f2:	fedff0e3          	bgeu	t6,a3,800001d2 <vformat+0x68>
800001f6:	03f00893          	li	a7,63
800001fa:	00280693          	add	a3,a6,2
800001fe:	01170023          	sb	a7,0(a4)
80000202:	011700a3          	sb	a7,1(a4)
80000206:	080d                	add	a6,a6,3
80000208:	00d58733          	add	a4,a1,a3
8000020c:	01170023          	sb	a7,0(a4)
80000210:	01058733          	add	a4,a1,a6
80000214:	0785                	add	a5,a5,1
80000216:	0785                	add	a5,a5,1
80000218:	00f506b3          	add	a3,a0,a5
8000021c:	0006c683          	lbu	a3,0(a3)
80000220:	88be                	mv	a7,a5
80000222:	c285                	beqz	a3,80000242 <vformat+0xd8>
80000224:	833a                	mv	t1,a4
80000226:	fbc68be3          	beq	a3,t3,800001dc <vformat+0x72>
8000022a:	0785                	add	a5,a5,1
8000022c:	00d70023          	sb	a3,0(a4)
80000230:	00f506b3          	add	a3,a0,a5
80000234:	0006c683          	lbu	a3,0(a3)
80000238:	0805                	add	a6,a6,1
8000023a:	01058733          	add	a4,a1,a6
8000023e:	88be                	mv	a7,a5
80000240:	f2f5                	bnez	a3,80000224 <vformat+0xba>
80000242:	00070023          	sb	zero,0(a4)
80000246:	5472                	lw	s0,60(sp)
80000248:	54e2                	lw	s1,56(sp)
8000024a:	5952                	lw	s2,52(sp)
8000024c:	59c2                	lw	s3,48(sp)
8000024e:	5a32                	lw	s4,44(sp)
80000250:	6121                	add	sp,sp,64
80000252:	8082                	ret
80000254:	00062303          	lw	t1,0(a2)
80000258:	03000693          	li	a3,48
8000025c:	07800893          	li	a7,120
80000260:	0809                	add	a6,a6,2
80000262:	00d70023          	sb	a3,0(a4)
80000266:	011700a3          	sb	a7,1(a4)
8000026a:	0611                	add	a2,a2,4
8000026c:	010583b3          	add	t2,a1,a6
80000270:	18030263          	beqz	t1,800003f4 <vformat+0x28a>
80000274:	4881                	li	a7,0
80000276:	868a                	mv	a3,sp
80000278:	ff018293          	add	t0,gp,-16 # 8000096c <table>
8000027c:	00f37713          	and	a4,t1,15
80000280:	9716                	add	a4,a4,t0
80000282:	00074483          	lbu	s1,0(a4)
80000286:	8746                	mv	a4,a7
80000288:	0885                	add	a7,a7,1
8000028a:	01168433          	add	s0,a3,a7
8000028e:	fe940fa3          	sb	s1,-1(s0)
80000292:	00435313          	srl	t1,t1,0x4
80000296:	fe0313e3          	bnez	t1,8000027c <vformat+0x112>
8000029a:	9736                	add	a4,a4,a3
8000029c:	831e                	mv	t1,t2
8000029e:	00074383          	lbu	t2,0(a4)
800002a2:	82ba                	mv	t0,a4
800002a4:	0305                	add	t1,t1,1
800002a6:	fe730fa3          	sb	t2,-1(t1)
800002aa:	177d                	add	a4,a4,-1
800002ac:	fe5699e3          	bne	a3,t0,8000029e <vformat+0x134>
800002b0:	9846                	add	a6,a6,a7
800002b2:	01058733          	add	a4,a1,a6
800002b6:	bfb9                	j	80000214 <vformat+0xaa>
800002b8:	00062383          	lw	t2,0(a2)
800002bc:	0611                	add	a2,a2,4
800002be:	1a038a63          	beqz	t2,80000472 <vformat+0x308>
800002c2:	4301                	li	t1,0
800002c4:	868a                	mv	a3,sp
800002c6:	ff018293          	add	t0,gp,-16 # 8000096c <table>
800002ca:	44a9                	li	s1,10
800002cc:	4a25                	li	s4,9
800002ce:	0293f433          	remu	s0,t2,s1
800002d2:	889a                	mv	a7,t1
800002d4:	0305                	add	t1,t1,1
800002d6:	006689b3          	add	s3,a3,t1
800002da:	891e                	mv	s2,t2
800002dc:	9416                	add	s0,s0,t0
800002de:	00044403          	lbu	s0,0(s0)
800002e2:	0293d3b3          	divu	t2,t2,s1
800002e6:	fe898fa3          	sb	s0,-1(s3)
800002ea:	ff2a62e3          	bltu	s4,s2,800002ce <vformat+0x164>
800002ee:	98b6                	add	a7,a7,a3
800002f0:	0008c383          	lbu	t2,0(a7)
800002f4:	82c6                	mv	t0,a7
800002f6:	0705                	add	a4,a4,1
800002f8:	fe770fa3          	sb	t2,-1(a4)
800002fc:	18fd                	add	a7,a7,-1
800002fe:	fe5699e3          	bne	a3,t0,800002f0 <vformat+0x186>
80000302:	981a                	add	a6,a6,t1
80000304:	01058733          	add	a4,a1,a6
80000308:	b731                	j	80000214 <vformat+0xaa>
8000030a:	00062283          	lw	t0,0(a2)
8000030e:	0611                	add	a2,a2,4
80000310:	0002c883          	lbu	a7,0(t0)
80000314:	f00880e3          	beqz	a7,80000214 <vformat+0xaa>
80000318:	4681                	li	a3,0
8000031a:	00d70333          	add	t1,a4,a3
8000031e:	0685                	add	a3,a3,1
80000320:	01130023          	sb	a7,0(t1)
80000324:	00d288b3          	add	a7,t0,a3
80000328:	0008c883          	lbu	a7,0(a7)
8000032c:	fe0897e3          	bnez	a7,8000031a <vformat+0x1b0>
80000330:	9836                	add	a6,a6,a3
80000332:	01058733          	add	a4,a1,a6
80000336:	bdf9                	j	80000214 <vformat+0xaa>
80000338:	00062883          	lw	a7,0(a2)
8000033c:	0611                	add	a2,a2,4
8000033e:	0c08c263          	bltz	a7,80000402 <vformat+0x298>
80000342:	0c089963          	bnez	a7,80000414 <vformat+0x2aa>
80000346:	03000693          	li	a3,48
8000034a:	00d70023          	sb	a3,0(a4)
8000034e:	4385                	li	t2,1
80000350:	981e                	add	a6,a6,t2
80000352:	01058733          	add	a4,a1,a6
80000356:	bd7d                	j	80000214 <vformat+0xaa>
80000358:	4214                	lw	a3,0(a2)
8000035a:	0805                	add	a6,a6,1
8000035c:	0611                	add	a2,a2,4
8000035e:	00d70023          	sb	a3,0(a4)
80000362:	01058733          	add	a4,a1,a6
80000366:	b57d                	j	80000214 <vformat+0xaa>
80000368:	00062303          	lw	t1,0(a2)
8000036c:	03000693          	li	a3,48
80000370:	06200893          	li	a7,98
80000374:	0809                	add	a6,a6,2
80000376:	00d70023          	sb	a3,0(a4)
8000037a:	011700a3          	sb	a7,1(a4)
8000037e:	0611                	add	a2,a2,4
80000380:	010583b3          	add	t2,a1,a6
80000384:	06030863          	beqz	t1,800003f4 <vformat+0x28a>
80000388:	4881                	li	a7,0
8000038a:	868a                	mv	a3,sp
8000038c:	ff018293          	add	t0,gp,-16 # 8000096c <table>
80000390:	00137713          	and	a4,t1,1
80000394:	9716                	add	a4,a4,t0
80000396:	00074483          	lbu	s1,0(a4)
8000039a:	8746                	mv	a4,a7
8000039c:	0885                	add	a7,a7,1
8000039e:	01168433          	add	s0,a3,a7
800003a2:	fe940fa3          	sb	s1,-1(s0)
800003a6:	00135313          	srl	t1,t1,0x1
800003aa:	fe0313e3          	bnez	t1,80000390 <vformat+0x226>
800003ae:	9736                	add	a4,a4,a3
800003b0:	831e                	mv	t1,t2
800003b2:	00074383          	lbu	t2,0(a4)
800003b6:	82ba                	mv	t0,a4
800003b8:	0305                	add	t1,t1,1
800003ba:	fe730fa3          	sb	t2,-1(t1)
800003be:	177d                	add	a4,a4,-1
800003c0:	fe5699e3          	bne	a3,t0,800003b2 <vformat+0x248>
800003c4:	9846                	add	a6,a6,a7
800003c6:	01058733          	add	a4,a1,a6
800003ca:	b5a9                	j	80000214 <vformat+0xaa>
800003cc:	00280693          	add	a3,a6,2
800003d0:	01d70023          	sb	t4,0(a4)
800003d4:	01d700a3          	sb	t4,1(a4)
800003d8:	080d                	add	a6,a6,3
800003da:	00d58733          	add	a4,a1,a3
800003de:	01d70023          	sb	t4,0(a4)
800003e2:	01058733          	add	a4,a1,a6
800003e6:	bd05                	j	80000216 <vformat+0xac>
800003e8:	0805                	add	a6,a6,1
800003ea:	01c70023          	sb	t3,0(a4)
800003ee:	01058733          	add	a4,a1,a6
800003f2:	b50d                	j	80000214 <vformat+0xaa>
800003f4:	4885                	li	a7,1
800003f6:	9846                	add	a6,a6,a7
800003f8:	00d38023          	sb	a3,0(t2)
800003fc:	01058733          	add	a4,a1,a6
80000400:	bd11                	j	80000214 <vformat+0xaa>
80000402:	0805                	add	a6,a6,1
80000404:	02d00693          	li	a3,45
80000408:	00d70023          	sb	a3,0(a4)
8000040c:	411008b3          	neg	a7,a7
80000410:	01058333          	add	t1,a1,a6
80000414:	4381                	li	t2,0
80000416:	868a                	mv	a3,sp
80000418:	ff018293          	add	t0,gp,-16 # 8000096c <table>
8000041c:	44a9                	li	s1,10
8000041e:	4a25                	li	s4,9
80000420:	0298f433          	remu	s0,a7,s1
80000424:	871e                	mv	a4,t2
80000426:	0385                	add	t2,t2,1
80000428:	007689b3          	add	s3,a3,t2
8000042c:	8946                	mv	s2,a7
8000042e:	9416                	add	s0,s0,t0
80000430:	00044403          	lbu	s0,0(s0)
80000434:	0298d8b3          	divu	a7,a7,s1
80000438:	fe898fa3          	sb	s0,-1(s3)
8000043c:	ff2a62e3          	bltu	s4,s2,80000420 <vformat+0x2b6>
80000440:	9736                	add	a4,a4,a3
80000442:	00074283          	lbu	t0,0(a4)
80000446:	88ba                	mv	a7,a4
80000448:	0305                	add	t1,t1,1
8000044a:	fe530fa3          	sb	t0,-1(t1)
8000044e:	177d                	add	a4,a4,-1
80000450:	ff1699e3          	bne	a3,a7,80000442 <vformat+0x2d8>
80000454:	bdf5                	j	80000350 <vformat+0x1e6>
80000456:	00280693          	add	a3,a6,2
8000045a:	01d70023          	sb	t4,0(a4)
8000045e:	01d700a3          	sb	t4,1(a4)
80000462:	080d                	add	a6,a6,3
80000464:	00d58733          	add	a4,a1,a3
80000468:	01d70023          	sb	t4,0(a4)
8000046c:	01058733          	add	a4,a1,a6
80000470:	b31d                	j	80000196 <vformat+0x2c>
80000472:	03000693          	li	a3,48
80000476:	00d70023          	sb	a3,0(a4)
8000047a:	4305                	li	t1,1
8000047c:	b559                	j	80000302 <vformat+0x198>
8000047e:	0805                	add	a6,a6,1
80000480:	01c70023          	sb	t3,0(a4)
80000484:	0785                	add	a5,a5,1
80000486:	01058733          	add	a4,a1,a6
8000048a:	b331                	j	80000196 <vformat+0x2c>
8000048c:	03f00893          	li	a7,63
80000490:	00280693          	add	a3,a6,2
80000494:	01170023          	sb	a7,0(a4)
80000498:	011700a3          	sb	a7,1(a4)
8000049c:	080d                	add	a6,a6,3
8000049e:	00d58733          	add	a4,a1,a3
800004a2:	01170023          	sb	a7,0(a4)
800004a6:	0785                	add	a5,a5,1
800004a8:	01058733          	add	a4,a1,a6
800004ac:	b1ed                	j	80000196 <vformat+0x2c>

800004ae <vprint>:
800004ae:	7175                	add	sp,sp,-144
800004b0:	862e                	mv	a2,a1
800004b2:	858a                	mv	a1,sp
800004b4:	c706                	sw	ra,140(sp)
800004b6:	3955                	jal	8000016a <vformat>
800004b8:	00014783          	lbu	a5,0(sp)
800004bc:	cb89                	beqz	a5,800004ce <vprint+0x20>
800004be:	00110713          	add	a4,sp,1
800004c2:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
800004c6:	00074783          	lbu	a5,0(a4)
800004ca:	0705                	add	a4,a4,1
800004cc:	fbfd                	bnez	a5,800004c2 <vprint+0x14>
800004ce:	40ba                	lw	ra,140(sp)
800004d0:	6149                	add	sp,sp,144
800004d2:	8082                	ret

800004d4 <print>:
800004d4:	7139                	add	sp,sp,-64
800004d6:	02410313          	add	t1,sp,36
800004da:	d22e                	sw	a1,36(sp)
800004dc:	859a                	mv	a1,t1
800004de:	ce06                	sw	ra,28(sp)
800004e0:	d432                	sw	a2,40(sp)
800004e2:	d636                	sw	a3,44(sp)
800004e4:	d83a                	sw	a4,48(sp)
800004e6:	da3e                	sw	a5,52(sp)
800004e8:	dc42                	sw	a6,56(sp)
800004ea:	de46                	sw	a7,60(sp)
800004ec:	c61a                	sw	t1,12(sp)
800004ee:	37c1                	jal	800004ae <vprint>
800004f0:	40f2                	lw	ra,28(sp)
800004f2:	6121                	add	sp,sp,64
800004f4:	8082                	ret

800004f6 <format>:
800004f6:	7139                	add	sp,sp,-64
800004f8:	02810313          	add	t1,sp,40
800004fc:	d432                	sw	a2,40(sp)
800004fe:	861a                	mv	a2,t1
80000500:	ce06                	sw	ra,28(sp)
80000502:	d636                	sw	a3,44(sp)
80000504:	d83a                	sw	a4,48(sp)
80000506:	da3e                	sw	a5,52(sp)
80000508:	dc42                	sw	a6,56(sp)
8000050a:	de46                	sw	a7,60(sp)
8000050c:	c61a                	sw	t1,12(sp)
8000050e:	39b1                	jal	8000016a <vformat>
80000510:	40f2                	lw	ra,28(sp)
80000512:	6121                	add	sp,sp,64
80000514:	8082                	ret

80000516 <dprint>:
80000516:	1101                	add	sp,sp,-32
80000518:	c22e                	sw	a1,4(sp)
8000051a:	c432                	sw	a2,8(sp)
8000051c:	c636                	sw	a3,12(sp)
8000051e:	c83a                	sw	a4,16(sp)
80000520:	ca3e                	sw	a5,20(sp)
80000522:	cc42                	sw	a6,24(sp)
80000524:	ce46                	sw	a7,28(sp)
80000526:	6105                	add	sp,sp,32
80000528:	8082                	ret

8000052a <advance_mepc>:
8000052a:	341027f3          	csrr	a5,mepc
8000052e:	953e                	add	a0,a0,a5
80000530:	34151073          	csrw	mepc,a0
80000534:	8082                	ret

80000536 <set_mepc>:
80000536:	34151073          	csrw	mepc,a0
8000053a:	8082                	ret

8000053c <advance_sepc>:
8000053c:	141027f3          	csrr	a5,sepc
80000540:	953e                	add	a0,a0,a5
80000542:	14151073          	csrw	sepc,a0
80000546:	8082                	ret

80000548 <set_sepc>:
80000548:	14151073          	csrw	sepc,a0
8000054c:	8082                	ret

8000054e <setup_interrupts_m>:
8000054e:	30551073          	csrw	mtvec,a0
80000552:	30459073          	csrw	mie,a1
80000556:	8082                	ret

80000558 <setup_interrupt_m_vectored>:
80000558:	00156513          	or	a0,a0,1
8000055c:	30551073          	csrw	mtvec,a0
80000560:	30459073          	csrw	mie,a1
80000564:	8082                	ret

80000566 <enable_interrupts_m>:
80000566:	47a1                	li	a5,8
80000568:	3007a073          	csrs	mstatus,a5
8000056c:	8082                	ret

8000056e <disable_interrupts_m>:
8000056e:	47a1                	li	a5,8
80000570:	3007b073          	csrc	mstatus,a5
80000574:	8082                	ret

80000576 <enable_interrupts_save_m>:
80000576:	30051073          	csrw	mstatus,a0
8000057a:	8082                	ret

8000057c <disable_interrupts_save_m>:
8000057c:	4521                	li	a0,8
8000057e:	30053573          	csrrc	a0,mstatus,a0
80000582:	8082                	ret

80000584 <check_supervisor_mode_available>:
80000584:	6785                	lui	a5,0x1
80000586:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
8000058a:	3007a573          	csrrs	a0,mstatus,a5
8000058e:	30051573          	csrrw	a0,mstatus,a0
80000592:	6789                	lui	a5,0x2
80000594:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
80000598:	8d7d                	and	a0,a0,a5
8000059a:	80050513          	add	a0,a0,-2048
8000059e:	00153513          	seqz	a0,a0
800005a2:	8082                	ret

800005a4 <require_supervisor_mode>:
800005a4:	6785                	lui	a5,0x1
800005a6:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
800005aa:	3007a7f3          	csrrs	a5,mstatus,a5
800005ae:	300797f3          	csrrw	a5,mstatus,a5
800005b2:	6709                	lui	a4,0x2
800005b4:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
800005b8:	8ff9                	and	a5,a5,a4
800005ba:	80078793          	add	a5,a5,-2048
800005be:	e391                	bnez	a5,800005c2 <require_supervisor_mode+0x1e>
800005c0:	8082                	ret
800005c2:	1141                	add	sp,sp,-16
800005c4:	00000517          	auipc	a0,0x0
800005c8:	22050513          	add	a0,a0,544 # 800007e4 <fromhost+0x58>
800005cc:	c606                	sw	ra,12(sp)
800005ce:	3719                	jal	800004d4 <print>
800005d0:	57fd                	li	a5,-1
800005d2:	e0f1a423          	sw	a5,-504(gp) # 80000784 <flag>
800005d6:	34d9                	jal	8000009c <done>

800005d8 <read_exception_context>:
800005d8:	c00027f3          	rdcycle	a5
800005dc:	c55c                	sw	a5,12(a0)
800005de:	c01027f3          	rdtime	a5
800005e2:	c91c                	sw	a5,16(a0)
800005e4:	342027f3          	csrr	a5,mcause
800005e8:	c51c                	sw	a5,8(a0)
800005ea:	341027f3          	csrr	a5,mepc
800005ee:	c11c                	sw	a5,0(a0)
800005f0:	343027f3          	csrr	a5,mtval
800005f4:	c15c                	sw	a5,4(a0)
800005f6:	c03027f3          	csrr	a5,hpmcounter3
800005fa:	c95c                	sw	a5,20(a0)
800005fc:	c04027f3          	csrr	a5,hpmcounter4
80000600:	cd1c                	sw	a5,24(a0)
80000602:	8082                	ret

80000604 <read_exception_context_s>:
80000604:	c00027f3          	rdcycle	a5
80000608:	c55c                	sw	a5,12(a0)
8000060a:	c01027f3          	rdtime	a5
8000060e:	c91c                	sw	a5,16(a0)
80000610:	142027f3          	csrr	a5,scause
80000614:	c51c                	sw	a5,8(a0)
80000616:	141027f3          	csrr	a5,sepc
8000061a:	c11c                	sw	a5,0(a0)
8000061c:	143027f3          	csrr	a5,stval
80000620:	c15c                	sw	a5,4(a0)
80000622:	c03027f3          	csrr	a5,hpmcounter3
80000626:	c95c                	sw	a5,20(a0)
80000628:	c04027f3          	csrr	a5,hpmcounter4
8000062c:	cd1c                	sw	a5,24(a0)
8000062e:	8082                	ret

80000630 <print_exception_context>:
80000630:	1141                	add	sp,sp,-16
80000632:	c422                	sw	s0,8(sp)
80000634:	842a                	mv	s0,a0
80000636:	00000517          	auipc	a0,0x0
8000063a:	1d250513          	add	a0,a0,466 # 80000808 <fromhost+0x7c>
8000063e:	c606                	sw	ra,12(sp)
80000640:	3d51                	jal	800004d4 <print>
80000642:	440c                	lw	a1,8(s0)
80000644:	00000517          	auipc	a0,0x0
80000648:	1dc50513          	add	a0,a0,476 # 80000820 <fromhost+0x94>
8000064c:	3561                	jal	800004d4 <print>
8000064e:	400c                	lw	a1,0(s0)
80000650:	00000517          	auipc	a0,0x0
80000654:	1e050513          	add	a0,a0,480 # 80000830 <fromhost+0xa4>
80000658:	3db5                	jal	800004d4 <print>
8000065a:	404c                	lw	a1,4(s0)
8000065c:	00000517          	auipc	a0,0x0
80000660:	1e450513          	add	a0,a0,484 # 80000840 <fromhost+0xb4>
80000664:	3d85                	jal	800004d4 <print>
80000666:	444c                	lw	a1,12(s0)
80000668:	00000517          	auipc	a0,0x0
8000066c:	1e850513          	add	a0,a0,488 # 80000850 <fromhost+0xc4>
80000670:	3595                	jal	800004d4 <print>
80000672:	480c                	lw	a1,16(s0)
80000674:	00000517          	auipc	a0,0x0
80000678:	1ec50513          	add	a0,a0,492 # 80000860 <fromhost+0xd4>
8000067c:	3da1                	jal	800004d4 <print>
8000067e:	484c                	lw	a1,20(s0)
80000680:	00000517          	auipc	a0,0x0
80000684:	1f050513          	add	a0,a0,496 # 80000870 <fromhost+0xe4>
80000688:	35b1                	jal	800004d4 <print>
8000068a:	4c0c                	lw	a1,24(s0)
8000068c:	4422                	lw	s0,8(sp)
8000068e:	40b2                	lw	ra,12(sp)
80000690:	00000517          	auipc	a0,0x0
80000694:	1f050513          	add	a0,a0,496 # 80000880 <fromhost+0xf4>
80000698:	0141                	add	sp,sp,16
8000069a:	bd2d                	j	800004d4 <print>

8000069c <default_handler>:
8000069c:	711d                	add	sp,sp,-96
8000069e:	c6aa                	sw	a0,76(sp)
800006a0:	0048                	add	a0,sp,4
800006a2:	ce86                	sw	ra,92(sp)
800006a4:	cc96                	sw	t0,88(sp)
800006a6:	ca9a                	sw	t1,84(sp)
800006a8:	c89e                	sw	t2,80(sp)
800006aa:	c4ae                	sw	a1,72(sp)
800006ac:	c2b2                	sw	a2,68(sp)
800006ae:	c0b6                	sw	a3,64(sp)
800006b0:	de3a                	sw	a4,60(sp)
800006b2:	dc3e                	sw	a5,56(sp)
800006b4:	da42                	sw	a6,52(sp)
800006b6:	d846                	sw	a7,48(sp)
800006b8:	d672                	sw	t3,44(sp)
800006ba:	d476                	sw	t4,40(sp)
800006bc:	d27a                	sw	t5,36(sp)
800006be:	d07e                	sw	t6,32(sp)
800006c0:	3f21                	jal	800005d8 <read_exception_context>
800006c2:	0048                	add	a0,sp,4
800006c4:	37b5                	jal	80000630 <print_exception_context>
800006c6:	00000517          	auipc	a0,0x0
800006ca:	1ca50513          	add	a0,a0,458 # 80000890 <fromhost+0x104>
800006ce:	3519                	jal	800004d4 <print>
800006d0:	32f1                	jal	8000009c <done>

800006d2 <unreachable_handler>:
800006d2:	711d                	add	sp,sp,-96
800006d4:	c6aa                	sw	a0,76(sp)
800006d6:	0048                	add	a0,sp,4
800006d8:	ce86                	sw	ra,92(sp)
800006da:	cc96                	sw	t0,88(sp)
800006dc:	ca9a                	sw	t1,84(sp)
800006de:	c89e                	sw	t2,80(sp)
800006e0:	c4ae                	sw	a1,72(sp)
800006e2:	c2b2                	sw	a2,68(sp)
800006e4:	c0b6                	sw	a3,64(sp)
800006e6:	de3a                	sw	a4,60(sp)
800006e8:	dc3e                	sw	a5,56(sp)
800006ea:	da42                	sw	a6,52(sp)
800006ec:	d846                	sw	a7,48(sp)
800006ee:	d672                	sw	t3,44(sp)
800006f0:	d476                	sw	t4,40(sp)
800006f2:	d27a                	sw	t5,36(sp)
800006f4:	d07e                	sw	t6,32(sp)
800006f6:	35cd                	jal	800005d8 <read_exception_context>
800006f8:	0048                	add	a0,sp,4
800006fa:	3f1d                	jal	80000630 <print_exception_context>
800006fc:	00000517          	auipc	a0,0x0
80000700:	1c050513          	add	a0,a0,448 # 800008bc <fromhost+0x130>
80000704:	3bc1                	jal	800004d4 <print>
80000706:	3a59                	jal	8000009c <done>

80000708 <test_pass>:
80000708:	1141                	add	sp,sp,-16
8000070a:	85aa                	mv	a1,a0
8000070c:	00000517          	auipc	a0,0x0
80000710:	20050513          	add	a0,a0,512 # 8000090c <fromhost+0x180>
80000714:	c606                	sw	ra,12(sp)
80000716:	3b7d                	jal	800004d4 <print>
80000718:	40b2                	lw	ra,12(sp)
8000071a:	4785                	li	a5,1
8000071c:	e0f1a423          	sw	a5,-504(gp) # 80000784 <flag>
80000720:	0141                	add	sp,sp,16
80000722:	8082                	ret

80000724 <test_fail>:
80000724:	1141                	add	sp,sp,-16
80000726:	85aa                	mv	a1,a0
80000728:	00000517          	auipc	a0,0x0
8000072c:	1e450513          	add	a0,a0,484 # 8000090c <fromhost+0x180>
80000730:	c606                	sw	ra,12(sp)
80000732:	334d                	jal	800004d4 <print>
80000734:	40b2                	lw	ra,12(sp)
80000736:	e001a423          	sw	zero,-504(gp) # 80000784 <flag>
8000073a:	0141                	add	sp,sp,16
8000073c:	8082                	ret
	...

80000740 <vector_table>:
80000740:	971ff06f          	j	800000b0 <exception_handler>
80000744:	f59ff06f          	j	8000069c <default_handler>
80000748:	f8bff06f          	j	800006d2 <unreachable_handler>
8000074c:	f51ff06f          	j	8000069c <default_handler>
80000750:	f83ff06f          	j	800006d2 <unreachable_handler>
80000754:	f49ff06f          	j	8000069c <default_handler>
80000758:	f7bff06f          	j	800006d2 <unreachable_handler>
8000075c:	f41ff06f          	j	8000069c <default_handler>
80000760:	f73ff06f          	j	800006d2 <unreachable_handler>
80000764:	f39ff06f          	j	8000069c <default_handler>
80000768:	f6bff06f          	j	800006d2 <unreachable_handler>
8000076c:	f31ff06f          	j	8000069c <default_handler>
80000770:	f63ff06f          	j	800006d2 <unreachable_handler>
80000774:	f29ff06f          	j	8000069c <default_handler>
80000778:	f5bff06f          	j	800006d2 <unreachable_handler>
8000077c:	f57ff06f          	j	800006d2 <unreachable_handler>
	...
