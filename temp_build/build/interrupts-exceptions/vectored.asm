
build/interrupts-exceptions/vectored:     file format elf32-littleriscv


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
8000004a:	95e18193          	add	gp,gp,-1698 # 800009a4 <__bss_end>

8000004e <clr_bss>:
8000004e:	00018293          	mv	t0,gp
80000052:	00018313          	mv	t1,gp
80000056:	00628763          	beq	t0,t1,80000064 <do_preinit_arr>

8000005a <clr_bss_loop>:
8000005a:	00028023          	sb	zero,0(t0)
8000005e:	0285                	add	t0,t0,1
80000060:	fe535de3          	bge	t1,t0,8000005a <clr_bss_loop>

80000064 <do_preinit_arr>:
80000064:	e0e18413          	add	s0,gp,-498 # 800007b2 <__init_array_end>
80000068:	e0e18493          	add	s1,gp,-498 # 800007b2 <__init_array_end>
8000006c:	00940963          	beq	s0,s1,8000007e <do_init_arr>

80000070 <preinit_arr_calls>:
80000070:	00042903          	lw	s2,0(s0)
80000074:	000900e7          	jalr	s2
80000078:	0411                	add	s0,s0,4
8000007a:	fe941be3          	bne	s0,s1,80000070 <preinit_arr_calls>

8000007e <do_init_arr>:
8000007e:	e0e18413          	add	s0,gp,-498 # 800007b2 <__init_array_end>
80000082:	e0e18493          	add	s1,gp,-498 # 800007b2 <__init_array_end>
80000086:	00940963          	beq	s0,s1,80000098 <enter_main>

8000008a <init_arr_calls>:
8000008a:	00042903          	lw	s2,0(s0)
8000008e:	000900e7          	jalr	s2
80000092:	0411                	add	s0,s0,4
80000094:	fc941ee3          	bne	s0,s1,80000070 <preinit_arr_calls>

80000098 <enter_main>:
80000098:	08a000ef          	jal	80000122 <main>

8000009c <done>:
8000009c:	e1018d93          	add	s11,gp,-496 # 800007b4 <flag>
800000a0:	000dae03          	lw	t3,0(s11)
800000a4:	e1418d93          	add	s11,gp,-492 # 800007b8 <tohost>
800000a8:	01cda023          	sw	t3,0(s11)

800000ac <__sim_halt>:
800000ac:	a001                	j	800000ac <__sim_halt>
	...

800000b0 <meip_handler>:
800000b0:	1141                	add	sp,sp,-16
800000b2:	c63a                	sw	a4,12(sp)
800000b4:	e1018713          	add	a4,gp,-496 # 800007b4 <flag>
800000b8:	c43e                	sw	a5,8(sp)
800000ba:	431c                	lw	a5,0(a4)
800000bc:	17c9                	add	a5,a5,-14
800000be:	c31c                	sw	a5,0(a4)
800000c0:	4785                	li	a5,1
800000c2:	fef02c23          	sw	a5,-8(zero) # fffffff8 <__stack_top+0x3ffffff8>
800000c6:	08800793          	li	a5,136
800000ca:	30479073          	csrw	mie,a5
800000ce:	4732                	lw	a4,12(sp)
800000d0:	47a2                	lw	a5,8(sp)
800000d2:	0141                	add	sp,sp,16
800000d4:	30200073          	mret
800000d8:	0000                	unimp
	...

800000dc <mtip_handler>:
800000dc:	1141                	add	sp,sp,-16
800000de:	c63a                	sw	a4,12(sp)
800000e0:	e1018713          	add	a4,gp,-496 # 800007b4 <flag>
800000e4:	c43e                	sw	a5,8(sp)
800000e6:	431c                	lw	a5,0(a4)
800000e8:	f2078793          	add	a5,a5,-224
800000ec:	c31c                	sw	a5,0(a4)
800000ee:	0ff00793          	li	a5,255
800000f2:	fef02623          	sw	a5,-20(zero) # ffffffec <__stack_top+0x3fffffec>
800000f6:	4732                	lw	a4,12(sp)
800000f8:	47a2                	lw	a5,8(sp)
800000fa:	0141                	add	sp,sp,16
800000fc:	30200073          	mret
80000100:	0000                	unimp
	...

80000104 <msip_handler>:
80000104:	1141                	add	sp,sp,-16
80000106:	c63a                	sw	a4,12(sp)
80000108:	e1018713          	add	a4,gp,-496 # 800007b4 <flag>
8000010c:	c43e                	sw	a5,8(sp)
8000010e:	431c                	lw	a5,0(a4)
80000110:	17c1                	add	a5,a5,-16
80000112:	c31c                	sw	a5,0(a4)
80000114:	fe002823          	sw	zero,-16(zero) # fffffff0 <__stack_top+0x3ffffff0>
80000118:	4732                	lw	a4,12(sp)
8000011a:	47a2                	lw	a5,8(sp)
8000011c:	0141                	add	sp,sp,16
8000011e:	30200073          	mret

80000122 <main>:
80000122:	1141                	add	sp,sp,-16
80000124:	c606                	sw	ra,12(sp)
80000126:	0ff00793          	li	a5,255
8000012a:	fe002623          	sw	zero,-20(zero) # ffffffec <__stack_top+0x3fffffec>
8000012e:	6585                	lui	a1,0x1
80000130:	fef02423          	sw	a5,-24(zero) # ffffffe8 <__stack_top+0x3fffffe8>
80000134:	88858593          	add	a1,a1,-1912 # 888 <boot-0x7ffff778>
80000138:	00000517          	auipc	a0,0x0
8000013c:	63850513          	add	a0,a0,1592 # 80000770 <vector_table>
80000140:	2199                	jal	80000586 <setup_interrupt_m_vectored>
80000142:	2989                	jal	80000594 <enable_interrupts_m>
80000144:	4785                	li	a5,1
80000146:	fef02823          	sw	a5,-16(zero) # fffffff0 <__stack_top+0x3ffffff0>
8000014a:	fef02a23          	sw	a5,-12(zero) # fffffff4 <__stack_top+0x3ffffff4>
8000014e:	0fe00713          	li	a4,254
80000152:	fe002783          	lw	a5,-32(zero) # ffffffe0 <__stack_top+0x3fffffe0>
80000156:	fef77ee3          	bgeu	a4,a5,80000152 <main+0x30>
8000015a:	e101a703          	lw	a4,-496(gp) # 800007b4 <flag>
8000015e:	4785                	li	a5,1
80000160:	00f70b63          	beq	a4,a5,80000176 <main+0x54>
80000164:	00000517          	auipc	a0,0x0
80000168:	67c50513          	add	a0,a0,1660 # 800007e0 <fromhost+0x24>
8000016c:	23e5                	jal	80000754 <test_fail>
8000016e:	40b2                	lw	ra,12(sp)
80000170:	4501                	li	a0,0
80000172:	0141                	add	sp,sp,16
80000174:	8082                	ret
80000176:	00000517          	auipc	a0,0x0
8000017a:	64a50513          	add	a0,a0,1610 # 800007c0 <fromhost+0x4>
8000017e:	2b6d                	jal	80000738 <test_pass>
80000180:	b7fd                	j	8000016e <main+0x4c>

80000182 <print_string>:
80000182:	00054783          	lbu	a5,0(a0)
80000186:	cb81                	beqz	a5,80000196 <print_string+0x14>
80000188:	0505                	add	a0,a0,1
8000018a:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
8000018e:	00054783          	lbu	a5,0(a0)
80000192:	0505                	add	a0,a0,1
80000194:	fbfd                	bnez	a5,8000018a <print_string+0x8>
80000196:	8082                	ret

80000198 <vformat>:
80000198:	00054683          	lbu	a3,0(a0)
8000019c:	ce85                	beqz	a3,800001d4 <vformat+0x3c>
8000019e:	4781                	li	a5,0
800001a0:	4801                	li	a6,0
800001a2:	4881                	li	a7,0
800001a4:	872e                	mv	a4,a1
800001a6:	02500e13          	li	t3,37
800001aa:	03f00e93          	li	t4,63
800001ae:	4fd9                	li	t6,22
800001b0:	f9418f13          	add	t5,gp,-108 # 80000938 <fromhost+0x17c>
800001b4:	833a                	mv	t1,a4
800001b6:	03c68263          	beq	a3,t3,800001da <vformat+0x42>
800001ba:	0805                	add	a6,a6,1
800001bc:	00d70023          	sb	a3,0(a4)
800001c0:	01058733          	add	a4,a1,a6
800001c4:	0785                	add	a5,a5,1
800001c6:	00f506b3          	add	a3,a0,a5
800001ca:	0006c683          	lbu	a3,0(a3)
800001ce:	88be                	mv	a7,a5
800001d0:	f2f5                	bnez	a3,800001b4 <vformat+0x1c>
800001d2:	85ba                	mv	a1,a4
800001d4:	00058023          	sb	zero,0(a1)
800001d8:	8082                	ret
800001da:	98aa                	add	a7,a7,a0
800001dc:	0018c683          	lbu	a3,1(a7)
800001e0:	2a068263          	beqz	a3,80000484 <vformat+0x2ec>
800001e4:	2dc68463          	beq	a3,t3,800004ac <vformat+0x314>
800001e8:	f9e68693          	add	a3,a3,-98
800001ec:	0ff6f693          	zext.b	a3,a3
800001f0:	2cdfe563          	bltu	t6,a3,800004ba <vformat+0x322>
800001f4:	7139                	add	sp,sp,-64
800001f6:	de22                	sw	s0,60(sp)
800001f8:	dc26                	sw	s1,56(sp)
800001fa:	da4a                	sw	s2,52(sp)
800001fc:	d84e                	sw	s3,48(sp)
800001fe:	d652                	sw	s4,44(sp)
80000200:	068a                	sll	a3,a3,0x2
80000202:	96fa                	add	a3,a3,t5
80000204:	4294                	lw	a3,0(a3)
80000206:	96fa                	add	a3,a3,t5
80000208:	8682                	jr	a3
8000020a:	98aa                	add	a7,a7,a0
8000020c:	0018c683          	lbu	a3,1(a7)
80000210:	1e068563          	beqz	a3,800003fa <vformat+0x262>
80000214:	21c68163          	beq	a3,t3,80000416 <vformat+0x27e>
80000218:	f9e68693          	add	a3,a3,-98
8000021c:	0ff6f693          	zext.b	a3,a3
80000220:	fedff0e3          	bgeu	t6,a3,80000200 <vformat+0x68>
80000224:	03f00893          	li	a7,63
80000228:	00280693          	add	a3,a6,2
8000022c:	01170023          	sb	a7,0(a4)
80000230:	011700a3          	sb	a7,1(a4)
80000234:	080d                	add	a6,a6,3
80000236:	00d58733          	add	a4,a1,a3
8000023a:	01170023          	sb	a7,0(a4)
8000023e:	01058733          	add	a4,a1,a6
80000242:	0785                	add	a5,a5,1
80000244:	0785                	add	a5,a5,1
80000246:	00f506b3          	add	a3,a0,a5
8000024a:	0006c683          	lbu	a3,0(a3)
8000024e:	88be                	mv	a7,a5
80000250:	c285                	beqz	a3,80000270 <vformat+0xd8>
80000252:	833a                	mv	t1,a4
80000254:	fbc68be3          	beq	a3,t3,8000020a <vformat+0x72>
80000258:	0785                	add	a5,a5,1
8000025a:	00d70023          	sb	a3,0(a4)
8000025e:	00f506b3          	add	a3,a0,a5
80000262:	0006c683          	lbu	a3,0(a3)
80000266:	0805                	add	a6,a6,1
80000268:	01058733          	add	a4,a1,a6
8000026c:	88be                	mv	a7,a5
8000026e:	f2f5                	bnez	a3,80000252 <vformat+0xba>
80000270:	00070023          	sb	zero,0(a4)
80000274:	5472                	lw	s0,60(sp)
80000276:	54e2                	lw	s1,56(sp)
80000278:	5952                	lw	s2,52(sp)
8000027a:	59c2                	lw	s3,48(sp)
8000027c:	5a32                	lw	s4,44(sp)
8000027e:	6121                	add	sp,sp,64
80000280:	8082                	ret
80000282:	00062303          	lw	t1,0(a2)
80000286:	03000693          	li	a3,48
8000028a:	07800893          	li	a7,120
8000028e:	0809                	add	a6,a6,2
80000290:	00d70023          	sb	a3,0(a4)
80000294:	011700a3          	sb	a7,1(a4)
80000298:	0611                	add	a2,a2,4
8000029a:	010583b3          	add	t2,a1,a6
8000029e:	18030263          	beqz	t1,80000422 <vformat+0x28a>
800002a2:	4881                	li	a7,0
800002a4:	868a                	mv	a3,sp
800002a6:	ff018293          	add	t0,gp,-16 # 80000994 <table>
800002aa:	00f37713          	and	a4,t1,15
800002ae:	9716                	add	a4,a4,t0
800002b0:	00074483          	lbu	s1,0(a4)
800002b4:	8746                	mv	a4,a7
800002b6:	0885                	add	a7,a7,1
800002b8:	01168433          	add	s0,a3,a7
800002bc:	fe940fa3          	sb	s1,-1(s0)
800002c0:	00435313          	srl	t1,t1,0x4
800002c4:	fe0313e3          	bnez	t1,800002aa <vformat+0x112>
800002c8:	9736                	add	a4,a4,a3
800002ca:	831e                	mv	t1,t2
800002cc:	00074383          	lbu	t2,0(a4)
800002d0:	82ba                	mv	t0,a4
800002d2:	0305                	add	t1,t1,1
800002d4:	fe730fa3          	sb	t2,-1(t1)
800002d8:	177d                	add	a4,a4,-1
800002da:	fe5699e3          	bne	a3,t0,800002cc <vformat+0x134>
800002de:	9846                	add	a6,a6,a7
800002e0:	01058733          	add	a4,a1,a6
800002e4:	bfb9                	j	80000242 <vformat+0xaa>
800002e6:	00062383          	lw	t2,0(a2)
800002ea:	0611                	add	a2,a2,4
800002ec:	1a038a63          	beqz	t2,800004a0 <vformat+0x308>
800002f0:	4301                	li	t1,0
800002f2:	868a                	mv	a3,sp
800002f4:	ff018293          	add	t0,gp,-16 # 80000994 <table>
800002f8:	44a9                	li	s1,10
800002fa:	4a25                	li	s4,9
800002fc:	0293f433          	remu	s0,t2,s1
80000300:	889a                	mv	a7,t1
80000302:	0305                	add	t1,t1,1
80000304:	006689b3          	add	s3,a3,t1
80000308:	891e                	mv	s2,t2
8000030a:	9416                	add	s0,s0,t0
8000030c:	00044403          	lbu	s0,0(s0)
80000310:	0293d3b3          	divu	t2,t2,s1
80000314:	fe898fa3          	sb	s0,-1(s3)
80000318:	ff2a62e3          	bltu	s4,s2,800002fc <vformat+0x164>
8000031c:	98b6                	add	a7,a7,a3
8000031e:	0008c383          	lbu	t2,0(a7)
80000322:	82c6                	mv	t0,a7
80000324:	0705                	add	a4,a4,1
80000326:	fe770fa3          	sb	t2,-1(a4)
8000032a:	18fd                	add	a7,a7,-1
8000032c:	fe5699e3          	bne	a3,t0,8000031e <vformat+0x186>
80000330:	981a                	add	a6,a6,t1
80000332:	01058733          	add	a4,a1,a6
80000336:	b731                	j	80000242 <vformat+0xaa>
80000338:	00062283          	lw	t0,0(a2)
8000033c:	0611                	add	a2,a2,4
8000033e:	0002c883          	lbu	a7,0(t0)
80000342:	f00880e3          	beqz	a7,80000242 <vformat+0xaa>
80000346:	4681                	li	a3,0
80000348:	00d70333          	add	t1,a4,a3
8000034c:	0685                	add	a3,a3,1
8000034e:	01130023          	sb	a7,0(t1)
80000352:	00d288b3          	add	a7,t0,a3
80000356:	0008c883          	lbu	a7,0(a7)
8000035a:	fe0897e3          	bnez	a7,80000348 <vformat+0x1b0>
8000035e:	9836                	add	a6,a6,a3
80000360:	01058733          	add	a4,a1,a6
80000364:	bdf9                	j	80000242 <vformat+0xaa>
80000366:	00062883          	lw	a7,0(a2)
8000036a:	0611                	add	a2,a2,4
8000036c:	0c08c263          	bltz	a7,80000430 <vformat+0x298>
80000370:	0c089963          	bnez	a7,80000442 <vformat+0x2aa>
80000374:	03000693          	li	a3,48
80000378:	00d70023          	sb	a3,0(a4)
8000037c:	4385                	li	t2,1
8000037e:	981e                	add	a6,a6,t2
80000380:	01058733          	add	a4,a1,a6
80000384:	bd7d                	j	80000242 <vformat+0xaa>
80000386:	4214                	lw	a3,0(a2)
80000388:	0805                	add	a6,a6,1
8000038a:	0611                	add	a2,a2,4
8000038c:	00d70023          	sb	a3,0(a4)
80000390:	01058733          	add	a4,a1,a6
80000394:	b57d                	j	80000242 <vformat+0xaa>
80000396:	00062303          	lw	t1,0(a2)
8000039a:	03000693          	li	a3,48
8000039e:	06200893          	li	a7,98
800003a2:	0809                	add	a6,a6,2
800003a4:	00d70023          	sb	a3,0(a4)
800003a8:	011700a3          	sb	a7,1(a4)
800003ac:	0611                	add	a2,a2,4
800003ae:	010583b3          	add	t2,a1,a6
800003b2:	06030863          	beqz	t1,80000422 <vformat+0x28a>
800003b6:	4881                	li	a7,0
800003b8:	868a                	mv	a3,sp
800003ba:	ff018293          	add	t0,gp,-16 # 80000994 <table>
800003be:	00137713          	and	a4,t1,1
800003c2:	9716                	add	a4,a4,t0
800003c4:	00074483          	lbu	s1,0(a4)
800003c8:	8746                	mv	a4,a7
800003ca:	0885                	add	a7,a7,1
800003cc:	01168433          	add	s0,a3,a7
800003d0:	fe940fa3          	sb	s1,-1(s0)
800003d4:	00135313          	srl	t1,t1,0x1
800003d8:	fe0313e3          	bnez	t1,800003be <vformat+0x226>
800003dc:	9736                	add	a4,a4,a3
800003de:	831e                	mv	t1,t2
800003e0:	00074383          	lbu	t2,0(a4)
800003e4:	82ba                	mv	t0,a4
800003e6:	0305                	add	t1,t1,1
800003e8:	fe730fa3          	sb	t2,-1(t1)
800003ec:	177d                	add	a4,a4,-1
800003ee:	fe5699e3          	bne	a3,t0,800003e0 <vformat+0x248>
800003f2:	9846                	add	a6,a6,a7
800003f4:	01058733          	add	a4,a1,a6
800003f8:	b5a9                	j	80000242 <vformat+0xaa>
800003fa:	00280693          	add	a3,a6,2
800003fe:	01d70023          	sb	t4,0(a4)
80000402:	01d700a3          	sb	t4,1(a4)
80000406:	080d                	add	a6,a6,3
80000408:	00d58733          	add	a4,a1,a3
8000040c:	01d70023          	sb	t4,0(a4)
80000410:	01058733          	add	a4,a1,a6
80000414:	bd05                	j	80000244 <vformat+0xac>
80000416:	0805                	add	a6,a6,1
80000418:	01c70023          	sb	t3,0(a4)
8000041c:	01058733          	add	a4,a1,a6
80000420:	b50d                	j	80000242 <vformat+0xaa>
80000422:	4885                	li	a7,1
80000424:	9846                	add	a6,a6,a7
80000426:	00d38023          	sb	a3,0(t2)
8000042a:	01058733          	add	a4,a1,a6
8000042e:	bd11                	j	80000242 <vformat+0xaa>
80000430:	0805                	add	a6,a6,1
80000432:	02d00693          	li	a3,45
80000436:	00d70023          	sb	a3,0(a4)
8000043a:	411008b3          	neg	a7,a7
8000043e:	01058333          	add	t1,a1,a6
80000442:	4381                	li	t2,0
80000444:	868a                	mv	a3,sp
80000446:	ff018293          	add	t0,gp,-16 # 80000994 <table>
8000044a:	44a9                	li	s1,10
8000044c:	4a25                	li	s4,9
8000044e:	0298f433          	remu	s0,a7,s1
80000452:	871e                	mv	a4,t2
80000454:	0385                	add	t2,t2,1
80000456:	007689b3          	add	s3,a3,t2
8000045a:	8946                	mv	s2,a7
8000045c:	9416                	add	s0,s0,t0
8000045e:	00044403          	lbu	s0,0(s0)
80000462:	0298d8b3          	divu	a7,a7,s1
80000466:	fe898fa3          	sb	s0,-1(s3)
8000046a:	ff2a62e3          	bltu	s4,s2,8000044e <vformat+0x2b6>
8000046e:	9736                	add	a4,a4,a3
80000470:	00074283          	lbu	t0,0(a4)
80000474:	88ba                	mv	a7,a4
80000476:	0305                	add	t1,t1,1
80000478:	fe530fa3          	sb	t0,-1(t1)
8000047c:	177d                	add	a4,a4,-1
8000047e:	ff1699e3          	bne	a3,a7,80000470 <vformat+0x2d8>
80000482:	bdf5                	j	8000037e <vformat+0x1e6>
80000484:	00280693          	add	a3,a6,2
80000488:	01d70023          	sb	t4,0(a4)
8000048c:	01d700a3          	sb	t4,1(a4)
80000490:	080d                	add	a6,a6,3
80000492:	00d58733          	add	a4,a1,a3
80000496:	01d70023          	sb	t4,0(a4)
8000049a:	01058733          	add	a4,a1,a6
8000049e:	b31d                	j	800001c4 <vformat+0x2c>
800004a0:	03000693          	li	a3,48
800004a4:	00d70023          	sb	a3,0(a4)
800004a8:	4305                	li	t1,1
800004aa:	b559                	j	80000330 <vformat+0x198>
800004ac:	0805                	add	a6,a6,1
800004ae:	01c70023          	sb	t3,0(a4)
800004b2:	0785                	add	a5,a5,1
800004b4:	01058733          	add	a4,a1,a6
800004b8:	b331                	j	800001c4 <vformat+0x2c>
800004ba:	03f00893          	li	a7,63
800004be:	00280693          	add	a3,a6,2
800004c2:	01170023          	sb	a7,0(a4)
800004c6:	011700a3          	sb	a7,1(a4)
800004ca:	080d                	add	a6,a6,3
800004cc:	00d58733          	add	a4,a1,a3
800004d0:	01170023          	sb	a7,0(a4)
800004d4:	0785                	add	a5,a5,1
800004d6:	01058733          	add	a4,a1,a6
800004da:	b1ed                	j	800001c4 <vformat+0x2c>

800004dc <vprint>:
800004dc:	7175                	add	sp,sp,-144
800004de:	862e                	mv	a2,a1
800004e0:	858a                	mv	a1,sp
800004e2:	c706                	sw	ra,140(sp)
800004e4:	3955                	jal	80000198 <vformat>
800004e6:	00014783          	lbu	a5,0(sp)
800004ea:	cb89                	beqz	a5,800004fc <vprint+0x20>
800004ec:	00110713          	add	a4,sp,1
800004f0:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
800004f4:	00074783          	lbu	a5,0(a4)
800004f8:	0705                	add	a4,a4,1
800004fa:	fbfd                	bnez	a5,800004f0 <vprint+0x14>
800004fc:	40ba                	lw	ra,140(sp)
800004fe:	6149                	add	sp,sp,144
80000500:	8082                	ret

80000502 <print>:
80000502:	7139                	add	sp,sp,-64
80000504:	02410313          	add	t1,sp,36
80000508:	d22e                	sw	a1,36(sp)
8000050a:	859a                	mv	a1,t1
8000050c:	ce06                	sw	ra,28(sp)
8000050e:	d432                	sw	a2,40(sp)
80000510:	d636                	sw	a3,44(sp)
80000512:	d83a                	sw	a4,48(sp)
80000514:	da3e                	sw	a5,52(sp)
80000516:	dc42                	sw	a6,56(sp)
80000518:	de46                	sw	a7,60(sp)
8000051a:	c61a                	sw	t1,12(sp)
8000051c:	37c1                	jal	800004dc <vprint>
8000051e:	40f2                	lw	ra,28(sp)
80000520:	6121                	add	sp,sp,64
80000522:	8082                	ret

80000524 <format>:
80000524:	7139                	add	sp,sp,-64
80000526:	02810313          	add	t1,sp,40
8000052a:	d432                	sw	a2,40(sp)
8000052c:	861a                	mv	a2,t1
8000052e:	ce06                	sw	ra,28(sp)
80000530:	d636                	sw	a3,44(sp)
80000532:	d83a                	sw	a4,48(sp)
80000534:	da3e                	sw	a5,52(sp)
80000536:	dc42                	sw	a6,56(sp)
80000538:	de46                	sw	a7,60(sp)
8000053a:	c61a                	sw	t1,12(sp)
8000053c:	39b1                	jal	80000198 <vformat>
8000053e:	40f2                	lw	ra,28(sp)
80000540:	6121                	add	sp,sp,64
80000542:	8082                	ret

80000544 <dprint>:
80000544:	1101                	add	sp,sp,-32
80000546:	c22e                	sw	a1,4(sp)
80000548:	c432                	sw	a2,8(sp)
8000054a:	c636                	sw	a3,12(sp)
8000054c:	c83a                	sw	a4,16(sp)
8000054e:	ca3e                	sw	a5,20(sp)
80000550:	cc42                	sw	a6,24(sp)
80000552:	ce46                	sw	a7,28(sp)
80000554:	6105                	add	sp,sp,32
80000556:	8082                	ret

80000558 <advance_mepc>:
80000558:	341027f3          	csrr	a5,mepc
8000055c:	953e                	add	a0,a0,a5
8000055e:	34151073          	csrw	mepc,a0
80000562:	8082                	ret

80000564 <set_mepc>:
80000564:	34151073          	csrw	mepc,a0
80000568:	8082                	ret

8000056a <advance_sepc>:
8000056a:	141027f3          	csrr	a5,sepc
8000056e:	953e                	add	a0,a0,a5
80000570:	14151073          	csrw	sepc,a0
80000574:	8082                	ret

80000576 <set_sepc>:
80000576:	14151073          	csrw	sepc,a0
8000057a:	8082                	ret

8000057c <setup_interrupts_m>:
8000057c:	30551073          	csrw	mtvec,a0
80000580:	30459073          	csrw	mie,a1
80000584:	8082                	ret

80000586 <setup_interrupt_m_vectored>:
80000586:	00156513          	or	a0,a0,1
8000058a:	30551073          	csrw	mtvec,a0
8000058e:	30459073          	csrw	mie,a1
80000592:	8082                	ret

80000594 <enable_interrupts_m>:
80000594:	47a1                	li	a5,8
80000596:	3007a073          	csrs	mstatus,a5
8000059a:	8082                	ret

8000059c <disable_interrupts_m>:
8000059c:	47a1                	li	a5,8
8000059e:	3007b073          	csrc	mstatus,a5
800005a2:	8082                	ret

800005a4 <enable_interrupts_save_m>:
800005a4:	30051073          	csrw	mstatus,a0
800005a8:	8082                	ret

800005aa <disable_interrupts_save_m>:
800005aa:	4521                	li	a0,8
800005ac:	30053573          	csrrc	a0,mstatus,a0
800005b0:	8082                	ret

800005b2 <check_supervisor_mode_available>:
800005b2:	6785                	lui	a5,0x1
800005b4:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
800005b8:	3007a573          	csrrs	a0,mstatus,a5
800005bc:	30051573          	csrrw	a0,mstatus,a0
800005c0:	6789                	lui	a5,0x2
800005c2:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
800005c6:	8d7d                	and	a0,a0,a5
800005c8:	80050513          	add	a0,a0,-2048
800005cc:	00153513          	seqz	a0,a0
800005d0:	8082                	ret

800005d2 <require_supervisor_mode>:
800005d2:	6785                	lui	a5,0x1
800005d4:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
800005d8:	3007a7f3          	csrrs	a5,mstatus,a5
800005dc:	300797f3          	csrrw	a5,mstatus,a5
800005e0:	6709                	lui	a4,0x2
800005e2:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
800005e6:	8ff9                	and	a5,a5,a4
800005e8:	80078793          	add	a5,a5,-2048
800005ec:	e391                	bnez	a5,800005f0 <require_supervisor_mode+0x1e>
800005ee:	8082                	ret
800005f0:	1141                	add	sp,sp,-16
800005f2:	00000517          	auipc	a0,0x0
800005f6:	21a50513          	add	a0,a0,538 # 8000080c <fromhost+0x50>
800005fa:	c606                	sw	ra,12(sp)
800005fc:	3719                	jal	80000502 <print>
800005fe:	57fd                	li	a5,-1
80000600:	e0f1a823          	sw	a5,-496(gp) # 800007b4 <flag>
80000604:	3c61                	jal	8000009c <done>

80000606 <read_exception_context>:
80000606:	c00027f3          	rdcycle	a5
8000060a:	c55c                	sw	a5,12(a0)
8000060c:	c01027f3          	rdtime	a5
80000610:	c91c                	sw	a5,16(a0)
80000612:	342027f3          	csrr	a5,mcause
80000616:	c51c                	sw	a5,8(a0)
80000618:	341027f3          	csrr	a5,mepc
8000061c:	c11c                	sw	a5,0(a0)
8000061e:	343027f3          	csrr	a5,mtval
80000622:	c15c                	sw	a5,4(a0)
80000624:	c03027f3          	csrr	a5,hpmcounter3
80000628:	c95c                	sw	a5,20(a0)
8000062a:	c04027f3          	csrr	a5,hpmcounter4
8000062e:	cd1c                	sw	a5,24(a0)
80000630:	8082                	ret

80000632 <read_exception_context_s>:
80000632:	c00027f3          	rdcycle	a5
80000636:	c55c                	sw	a5,12(a0)
80000638:	c01027f3          	rdtime	a5
8000063c:	c91c                	sw	a5,16(a0)
8000063e:	142027f3          	csrr	a5,scause
80000642:	c51c                	sw	a5,8(a0)
80000644:	141027f3          	csrr	a5,sepc
80000648:	c11c                	sw	a5,0(a0)
8000064a:	143027f3          	csrr	a5,stval
8000064e:	c15c                	sw	a5,4(a0)
80000650:	c03027f3          	csrr	a5,hpmcounter3
80000654:	c95c                	sw	a5,20(a0)
80000656:	c04027f3          	csrr	a5,hpmcounter4
8000065a:	cd1c                	sw	a5,24(a0)
8000065c:	8082                	ret

8000065e <print_exception_context>:
8000065e:	1141                	add	sp,sp,-16
80000660:	c422                	sw	s0,8(sp)
80000662:	842a                	mv	s0,a0
80000664:	00000517          	auipc	a0,0x0
80000668:	1cc50513          	add	a0,a0,460 # 80000830 <fromhost+0x74>
8000066c:	c606                	sw	ra,12(sp)
8000066e:	3d51                	jal	80000502 <print>
80000670:	440c                	lw	a1,8(s0)
80000672:	00000517          	auipc	a0,0x0
80000676:	1d650513          	add	a0,a0,470 # 80000848 <fromhost+0x8c>
8000067a:	3561                	jal	80000502 <print>
8000067c:	400c                	lw	a1,0(s0)
8000067e:	00000517          	auipc	a0,0x0
80000682:	1da50513          	add	a0,a0,474 # 80000858 <fromhost+0x9c>
80000686:	3db5                	jal	80000502 <print>
80000688:	404c                	lw	a1,4(s0)
8000068a:	00000517          	auipc	a0,0x0
8000068e:	1de50513          	add	a0,a0,478 # 80000868 <fromhost+0xac>
80000692:	3d85                	jal	80000502 <print>
80000694:	444c                	lw	a1,12(s0)
80000696:	00000517          	auipc	a0,0x0
8000069a:	1e250513          	add	a0,a0,482 # 80000878 <fromhost+0xbc>
8000069e:	3595                	jal	80000502 <print>
800006a0:	480c                	lw	a1,16(s0)
800006a2:	00000517          	auipc	a0,0x0
800006a6:	1e650513          	add	a0,a0,486 # 80000888 <fromhost+0xcc>
800006aa:	3da1                	jal	80000502 <print>
800006ac:	484c                	lw	a1,20(s0)
800006ae:	00000517          	auipc	a0,0x0
800006b2:	1ea50513          	add	a0,a0,490 # 80000898 <fromhost+0xdc>
800006b6:	35b1                	jal	80000502 <print>
800006b8:	4c0c                	lw	a1,24(s0)
800006ba:	4422                	lw	s0,8(sp)
800006bc:	40b2                	lw	ra,12(sp)
800006be:	00000517          	auipc	a0,0x0
800006c2:	1ea50513          	add	a0,a0,490 # 800008a8 <fromhost+0xec>
800006c6:	0141                	add	sp,sp,16
800006c8:	bd2d                	j	80000502 <print>
	...

800006cc <default_handler>:
800006cc:	711d                	add	sp,sp,-96
800006ce:	c6aa                	sw	a0,76(sp)
800006d0:	0048                	add	a0,sp,4
800006d2:	ce86                	sw	ra,92(sp)
800006d4:	cc96                	sw	t0,88(sp)
800006d6:	ca9a                	sw	t1,84(sp)
800006d8:	c89e                	sw	t2,80(sp)
800006da:	c4ae                	sw	a1,72(sp)
800006dc:	c2b2                	sw	a2,68(sp)
800006de:	c0b6                	sw	a3,64(sp)
800006e0:	de3a                	sw	a4,60(sp)
800006e2:	dc3e                	sw	a5,56(sp)
800006e4:	da42                	sw	a6,52(sp)
800006e6:	d846                	sw	a7,48(sp)
800006e8:	d672                	sw	t3,44(sp)
800006ea:	d476                	sw	t4,40(sp)
800006ec:	d27a                	sw	t5,36(sp)
800006ee:	d07e                	sw	t6,32(sp)
800006f0:	3f19                	jal	80000606 <read_exception_context>
800006f2:	0048                	add	a0,sp,4
800006f4:	37ad                	jal	8000065e <print_exception_context>
800006f6:	00000517          	auipc	a0,0x0
800006fa:	1c250513          	add	a0,a0,450 # 800008b8 <fromhost+0xfc>
800006fe:	3511                	jal	80000502 <print>
80000700:	3a71                	jal	8000009c <done>

80000702 <unreachable_handler>:
80000702:	711d                	add	sp,sp,-96
80000704:	c6aa                	sw	a0,76(sp)
80000706:	0048                	add	a0,sp,4
80000708:	ce86                	sw	ra,92(sp)
8000070a:	cc96                	sw	t0,88(sp)
8000070c:	ca9a                	sw	t1,84(sp)
8000070e:	c89e                	sw	t2,80(sp)
80000710:	c4ae                	sw	a1,72(sp)
80000712:	c2b2                	sw	a2,68(sp)
80000714:	c0b6                	sw	a3,64(sp)
80000716:	de3a                	sw	a4,60(sp)
80000718:	dc3e                	sw	a5,56(sp)
8000071a:	da42                	sw	a6,52(sp)
8000071c:	d846                	sw	a7,48(sp)
8000071e:	d672                	sw	t3,44(sp)
80000720:	d476                	sw	t4,40(sp)
80000722:	d27a                	sw	t5,36(sp)
80000724:	d07e                	sw	t6,32(sp)
80000726:	35c5                	jal	80000606 <read_exception_context>
80000728:	0048                	add	a0,sp,4
8000072a:	3f15                	jal	8000065e <print_exception_context>
8000072c:	00000517          	auipc	a0,0x0
80000730:	1b850513          	add	a0,a0,440 # 800008e4 <fromhost+0x128>
80000734:	33f9                	jal	80000502 <print>
80000736:	329d                	jal	8000009c <done>

80000738 <test_pass>:
80000738:	1141                	add	sp,sp,-16
8000073a:	85aa                	mv	a1,a0
8000073c:	00000517          	auipc	a0,0x0
80000740:	1f850513          	add	a0,a0,504 # 80000934 <fromhost+0x178>
80000744:	c606                	sw	ra,12(sp)
80000746:	3b75                	jal	80000502 <print>
80000748:	40b2                	lw	ra,12(sp)
8000074a:	4785                	li	a5,1
8000074c:	e0f1a823          	sw	a5,-496(gp) # 800007b4 <flag>
80000750:	0141                	add	sp,sp,16
80000752:	8082                	ret

80000754 <test_fail>:
80000754:	1141                	add	sp,sp,-16
80000756:	85aa                	mv	a1,a0
80000758:	00000517          	auipc	a0,0x0
8000075c:	1dc50513          	add	a0,a0,476 # 80000934 <fromhost+0x178>
80000760:	c606                	sw	ra,12(sp)
80000762:	3345                	jal	80000502 <print>
80000764:	40b2                	lw	ra,12(sp)
80000766:	e001a823          	sw	zero,-496(gp) # 800007b4 <flag>
8000076a:	0141                	add	sp,sp,16
8000076c:	8082                	ret
	...

80000770 <vector_table>:
80000770:	f5dff06f          	j	800006cc <default_handler>
80000774:	f59ff06f          	j	800006cc <default_handler>
80000778:	f8bff06f          	j	80000702 <unreachable_handler>
8000077c:	989ff06f          	j	80000104 <msip_handler>
80000780:	f83ff06f          	j	80000702 <unreachable_handler>
80000784:	f49ff06f          	j	800006cc <default_handler>
80000788:	f7bff06f          	j	80000702 <unreachable_handler>
8000078c:	951ff06f          	j	800000dc <mtip_handler>
80000790:	f73ff06f          	j	80000702 <unreachable_handler>
80000794:	f39ff06f          	j	800006cc <default_handler>
80000798:	f6bff06f          	j	80000702 <unreachable_handler>
8000079c:	915ff06f          	j	800000b0 <meip_handler>
800007a0:	f63ff06f          	j	80000702 <unreachable_handler>
800007a4:	f29ff06f          	j	800006cc <default_handler>
800007a8:	f5bff06f          	j	80000702 <unreachable_handler>
800007ac:	f57ff06f          	j	80000702 <unreachable_handler>
	...
