
build/interrupts-exceptions/bus_fault:     file format elf32-littleriscv


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
8000004a:	a0618193          	add	gp,gp,-1530 # 80000a4c <__bss_end>

8000004e <clr_bss>:
8000004e:	ffc18293          	add	t0,gp,-4 # 80000a48 <return_addr>
80000052:	00018313          	mv	t1,gp
80000056:	00628763          	beq	t0,t1,80000064 <do_preinit_arr>

8000005a <clr_bss_loop>:
8000005a:	00028023          	sb	zero,0(t0)
8000005e:	0285                	add	t0,t0,1
80000060:	fe535de3          	bge	t1,t0,8000005a <clr_bss_loop>

80000064 <do_preinit_arr>:
80000064:	dd618413          	add	s0,gp,-554 # 80000822 <__init_array_end>
80000068:	dd618493          	add	s1,gp,-554 # 80000822 <__init_array_end>
8000006c:	00940963          	beq	s0,s1,8000007e <do_init_arr>

80000070 <preinit_arr_calls>:
80000070:	00042903          	lw	s2,0(s0)
80000074:	000900e7          	jalr	s2
80000078:	0411                	add	s0,s0,4
8000007a:	fe941be3          	bne	s0,s1,80000070 <preinit_arr_calls>

8000007e <do_init_arr>:
8000007e:	dd618413          	add	s0,gp,-554 # 80000822 <__init_array_end>
80000082:	dd618493          	add	s1,gp,-554 # 80000822 <__init_array_end>
80000086:	00940963          	beq	s0,s1,80000098 <enter_main>

8000008a <init_arr_calls>:
8000008a:	00042903          	lw	s2,0(s0)
8000008e:	000900e7          	jalr	s2
80000092:	0411                	add	s0,s0,4
80000094:	fc941ee3          	bne	s0,s1,80000070 <preinit_arr_calls>

80000098 <enter_main>:
80000098:	0b4000ef          	jal	8000014c <main>

8000009c <done>:
8000009c:	dd818d93          	add	s11,gp,-552 # 80000824 <flag>
800000a0:	000dae03          	lw	t3,0(s11)
800000a4:	ddc18d93          	add	s11,gp,-548 # 80000828 <tohost>
800000a8:	01cda023          	sw	t3,0(s11)

800000ac <__sim_halt>:
800000ac:	a001                	j	800000ac <__sim_halt>
	...

800000b0 <exception_handler>:
800000b0:	711d                	add	sp,sp,-96
800000b2:	c6aa                	sw	a0,76(sp)
800000b4:	00000517          	auipc	a0,0x0
800000b8:	77c50513          	add	a0,a0,1916 # 80000830 <fromhost+0x4>
800000bc:	ce86                	sw	ra,92(sp)
800000be:	cc96                	sw	t0,88(sp)
800000c0:	ca9a                	sw	t1,84(sp)
800000c2:	c89e                	sw	t2,80(sp)
800000c4:	c4ae                	sw	a1,72(sp)
800000c6:	c2b2                	sw	a2,68(sp)
800000c8:	c0b6                	sw	a3,64(sp)
800000ca:	de3a                	sw	a4,60(sp)
800000cc:	dc3e                	sw	a5,56(sp)
800000ce:	da42                	sw	a6,52(sp)
800000d0:	d846                	sw	a7,48(sp)
800000d2:	d672                	sw	t3,44(sp)
800000d4:	d476                	sw	t4,40(sp)
800000d6:	d27a                	sw	t5,36(sp)
800000d8:	d07e                	sw	t6,32(sp)
800000da:	2951                	jal	8000056e <print>
800000dc:	0048                	add	a0,sp,4
800000de:	2b51                	jal	80000672 <read_exception_context>
800000e0:	4632                	lw	a2,12(sp)
800000e2:	dd818713          	add	a4,gp,-552 # 80000824 <flag>
800000e6:	4314                	lw	a3,0(a4)
800000e8:	4785                	li	a5,1
800000ea:	00c797b3          	sll	a5,a5,a2
800000ee:	fff7c793          	not	a5,a5
800000f2:	8ff5                	and	a5,a5,a3
800000f4:	ffc1a503          	lw	a0,-4(gp) # 80000a48 <return_addr>
800000f8:	c31c                	sw	a5,0(a4)
800000fa:	29d9                	jal	800005d0 <set_mepc>
800000fc:	40f6                	lw	ra,92(sp)
800000fe:	42e6                	lw	t0,88(sp)
80000100:	4356                	lw	t1,84(sp)
80000102:	43c6                	lw	t2,80(sp)
80000104:	4536                	lw	a0,76(sp)
80000106:	45a6                	lw	a1,72(sp)
80000108:	4616                	lw	a2,68(sp)
8000010a:	4686                	lw	a3,64(sp)
8000010c:	5772                	lw	a4,60(sp)
8000010e:	57e2                	lw	a5,56(sp)
80000110:	5852                	lw	a6,52(sp)
80000112:	58c2                	lw	a7,48(sp)
80000114:	5e32                	lw	t3,44(sp)
80000116:	5ea2                	lw	t4,40(sp)
80000118:	5f12                	lw	t5,36(sp)
8000011a:	5f82                	lw	t6,32(sp)
8000011c:	6125                	add	sp,sp,96
8000011e:	30200073          	mret
	...

80000124 <trigger_fault>:
80000124:	ffc18293          	add	t0,gp,-4 # 80000a48 <return_addr>
80000128:	0012a023          	sw	ra,0(t0)
8000012c:	4301                	li	t1,0
8000012e:	00650663          	beq	a0,t1,8000013a <trigger_fault+0x16>
80000132:	4305                	li	t1,1
80000134:	00650663          	beq	a0,t1,80000140 <trigger_fault+0x1c>
80000138:	a039                	j	80000146 <trigger_fault+0x22>
8000013a:	00002003          	lw	zero,0(zero) # 0 <boot-0x80000000>
8000013e:	8082                	ret
80000140:	00002023          	sw	zero,0(zero) # 0 <boot-0x80000000>
80000144:	8082                	ret
80000146:	00000067          	jr	zero # 0 <boot-0x80000000>
8000014a:	8082                	ret

8000014c <main>:
8000014c:	1141                	add	sp,sp,-16
8000014e:	0a300793          	li	a5,163
80000152:	c606                	sw	ra,12(sp)
80000154:	4581                	li	a1,0
80000156:	c422                	sw	s0,8(sp)
80000158:	00000517          	auipc	a0,0x0
8000015c:	f5850513          	add	a0,a0,-168 # 800000b0 <exception_handler>
80000160:	dd818413          	add	s0,gp,-552 # 80000824 <flag>
80000164:	c01c                	sw	a5,0(s0)
80000166:	2149                	jal	800005e8 <setup_interrupts_m>
80000168:	4501                	li	a0,0
8000016a:	3f6d                	jal	80000124 <trigger_fault>
8000016c:	4505                	li	a0,1
8000016e:	3f5d                	jal	80000124 <trigger_fault>
80000170:	4509                	li	a0,2
80000172:	3f4d                	jal	80000124 <trigger_fault>
80000174:	4018                	lw	a4,0(s0)
80000176:	4785                	li	a5,1
80000178:	06f70563          	beq	a4,a5,800001e2 <main+0x96>
8000017c:	00000517          	auipc	a0,0x0
80000180:	6f850513          	add	a0,a0,1784 # 80000874 <fromhost+0x48>
80000184:	2d3d                	jal	800007c2 <test_fail>
80000186:	401c                	lw	a5,0(s0)
80000188:	00001597          	auipc	a1,0x1
8000018c:	84c58593          	add	a1,a1,-1972 # 800009d4 <fromhost+0x1a8>
80000190:	0207f793          	and	a5,a5,32
80000194:	c789                	beqz	a5,8000019e <main+0x52>
80000196:	00000597          	auipc	a1,0x0
8000019a:	6b258593          	add	a1,a1,1714 # 80000848 <fromhost+0x1c>
8000019e:	401c                	lw	a5,0(s0)
800001a0:	00001617          	auipc	a2,0x1
800001a4:	83460613          	add	a2,a2,-1996 # 800009d4 <fromhost+0x1a8>
800001a8:	0807f793          	and	a5,a5,128
800001ac:	c789                	beqz	a5,800001b6 <main+0x6a>
800001ae:	00000617          	auipc	a2,0x0
800001b2:	6a260613          	add	a2,a2,1698 # 80000850 <fromhost+0x24>
800001b6:	401c                	lw	a5,0(s0)
800001b8:	00001697          	auipc	a3,0x1
800001bc:	81c68693          	add	a3,a3,-2020 # 800009d4 <fromhost+0x1a8>
800001c0:	8b89                	and	a5,a5,2
800001c2:	eb99                	bnez	a5,800001d8 <main+0x8c>
800001c4:	00000517          	auipc	a0,0x0
800001c8:	6c850513          	add	a0,a0,1736 # 8000088c <fromhost+0x60>
800001cc:	264d                	jal	8000056e <print>
800001ce:	40b2                	lw	ra,12(sp)
800001d0:	4422                	lw	s0,8(sp)
800001d2:	4501                	li	a0,0
800001d4:	0141                	add	sp,sp,16
800001d6:	8082                	ret
800001d8:	00000697          	auipc	a3,0x0
800001dc:	68068693          	add	a3,a3,1664 # 80000858 <fromhost+0x2c>
800001e0:	b7d5                	j	800001c4 <main+0x78>
800001e2:	00000517          	auipc	a0,0x0
800001e6:	67e50513          	add	a0,a0,1662 # 80000860 <fromhost+0x34>
800001ea:	2b75                	jal	800007a6 <test_pass>
800001ec:	b7cd                	j	800001ce <main+0x82>

800001ee <print_string>:
800001ee:	00054783          	lbu	a5,0(a0)
800001f2:	cb81                	beqz	a5,80000202 <print_string+0x14>
800001f4:	0505                	add	a0,a0,1
800001f6:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
800001fa:	00054783          	lbu	a5,0(a0)
800001fe:	0505                	add	a0,a0,1
80000200:	fbfd                	bnez	a5,800001f6 <print_string+0x8>
80000202:	8082                	ret

80000204 <vformat>:
80000204:	00054683          	lbu	a3,0(a0)
80000208:	ce85                	beqz	a3,80000240 <vformat+0x3c>
8000020a:	4781                	li	a5,0
8000020c:	4801                	li	a6,0
8000020e:	4881                	li	a7,0
80000210:	872e                	mv	a4,a1
80000212:	02500e13          	li	t3,37
80000216:	03f00e93          	li	t4,63
8000021a:	4fd9                	li	t6,22
8000021c:	f9018f13          	add	t5,gp,-112 # 800009dc <fromhost+0x1b0>
80000220:	833a                	mv	t1,a4
80000222:	03c68263          	beq	a3,t3,80000246 <vformat+0x42>
80000226:	0805                	add	a6,a6,1
80000228:	00d70023          	sb	a3,0(a4)
8000022c:	01058733          	add	a4,a1,a6
80000230:	0785                	add	a5,a5,1
80000232:	00f506b3          	add	a3,a0,a5
80000236:	0006c683          	lbu	a3,0(a3)
8000023a:	88be                	mv	a7,a5
8000023c:	f2f5                	bnez	a3,80000220 <vformat+0x1c>
8000023e:	85ba                	mv	a1,a4
80000240:	00058023          	sb	zero,0(a1)
80000244:	8082                	ret
80000246:	98aa                	add	a7,a7,a0
80000248:	0018c683          	lbu	a3,1(a7)
8000024c:	2a068263          	beqz	a3,800004f0 <vformat+0x2ec>
80000250:	2dc68463          	beq	a3,t3,80000518 <vformat+0x314>
80000254:	f9e68693          	add	a3,a3,-98
80000258:	0ff6f693          	zext.b	a3,a3
8000025c:	2cdfe563          	bltu	t6,a3,80000526 <vformat+0x322>
80000260:	7139                	add	sp,sp,-64
80000262:	de22                	sw	s0,60(sp)
80000264:	dc26                	sw	s1,56(sp)
80000266:	da4a                	sw	s2,52(sp)
80000268:	d84e                	sw	s3,48(sp)
8000026a:	d652                	sw	s4,44(sp)
8000026c:	068a                	sll	a3,a3,0x2
8000026e:	96fa                	add	a3,a3,t5
80000270:	4294                	lw	a3,0(a3)
80000272:	96fa                	add	a3,a3,t5
80000274:	8682                	jr	a3
80000276:	98aa                	add	a7,a7,a0
80000278:	0018c683          	lbu	a3,1(a7)
8000027c:	1e068563          	beqz	a3,80000466 <vformat+0x262>
80000280:	21c68163          	beq	a3,t3,80000482 <vformat+0x27e>
80000284:	f9e68693          	add	a3,a3,-98
80000288:	0ff6f693          	zext.b	a3,a3
8000028c:	fedff0e3          	bgeu	t6,a3,8000026c <vformat+0x68>
80000290:	03f00893          	li	a7,63
80000294:	00280693          	add	a3,a6,2
80000298:	01170023          	sb	a7,0(a4)
8000029c:	011700a3          	sb	a7,1(a4)
800002a0:	080d                	add	a6,a6,3
800002a2:	00d58733          	add	a4,a1,a3
800002a6:	01170023          	sb	a7,0(a4)
800002aa:	01058733          	add	a4,a1,a6
800002ae:	0785                	add	a5,a5,1
800002b0:	0785                	add	a5,a5,1
800002b2:	00f506b3          	add	a3,a0,a5
800002b6:	0006c683          	lbu	a3,0(a3)
800002ba:	88be                	mv	a7,a5
800002bc:	c285                	beqz	a3,800002dc <vformat+0xd8>
800002be:	833a                	mv	t1,a4
800002c0:	fbc68be3          	beq	a3,t3,80000276 <vformat+0x72>
800002c4:	0785                	add	a5,a5,1
800002c6:	00d70023          	sb	a3,0(a4)
800002ca:	00f506b3          	add	a3,a0,a5
800002ce:	0006c683          	lbu	a3,0(a3)
800002d2:	0805                	add	a6,a6,1
800002d4:	01058733          	add	a4,a1,a6
800002d8:	88be                	mv	a7,a5
800002da:	f2f5                	bnez	a3,800002be <vformat+0xba>
800002dc:	00070023          	sb	zero,0(a4)
800002e0:	5472                	lw	s0,60(sp)
800002e2:	54e2                	lw	s1,56(sp)
800002e4:	5952                	lw	s2,52(sp)
800002e6:	59c2                	lw	s3,48(sp)
800002e8:	5a32                	lw	s4,44(sp)
800002ea:	6121                	add	sp,sp,64
800002ec:	8082                	ret
800002ee:	00062303          	lw	t1,0(a2)
800002f2:	03000693          	li	a3,48
800002f6:	07800893          	li	a7,120
800002fa:	0809                	add	a6,a6,2
800002fc:	00d70023          	sb	a3,0(a4)
80000300:	011700a3          	sb	a7,1(a4)
80000304:	0611                	add	a2,a2,4
80000306:	010583b3          	add	t2,a1,a6
8000030a:	18030263          	beqz	t1,8000048e <vformat+0x28a>
8000030e:	4881                	li	a7,0
80000310:	868a                	mv	a3,sp
80000312:	fec18293          	add	t0,gp,-20 # 80000a38 <table>
80000316:	00f37713          	and	a4,t1,15
8000031a:	9716                	add	a4,a4,t0
8000031c:	00074483          	lbu	s1,0(a4)
80000320:	8746                	mv	a4,a7
80000322:	0885                	add	a7,a7,1
80000324:	01168433          	add	s0,a3,a7
80000328:	fe940fa3          	sb	s1,-1(s0)
8000032c:	00435313          	srl	t1,t1,0x4
80000330:	fe0313e3          	bnez	t1,80000316 <vformat+0x112>
80000334:	9736                	add	a4,a4,a3
80000336:	831e                	mv	t1,t2
80000338:	00074383          	lbu	t2,0(a4)
8000033c:	82ba                	mv	t0,a4
8000033e:	0305                	add	t1,t1,1
80000340:	fe730fa3          	sb	t2,-1(t1)
80000344:	177d                	add	a4,a4,-1
80000346:	fe5699e3          	bne	a3,t0,80000338 <vformat+0x134>
8000034a:	9846                	add	a6,a6,a7
8000034c:	01058733          	add	a4,a1,a6
80000350:	bfb9                	j	800002ae <vformat+0xaa>
80000352:	00062383          	lw	t2,0(a2)
80000356:	0611                	add	a2,a2,4
80000358:	1a038a63          	beqz	t2,8000050c <vformat+0x308>
8000035c:	4301                	li	t1,0
8000035e:	868a                	mv	a3,sp
80000360:	fec18293          	add	t0,gp,-20 # 80000a38 <table>
80000364:	44a9                	li	s1,10
80000366:	4a25                	li	s4,9
80000368:	0293f433          	remu	s0,t2,s1
8000036c:	889a                	mv	a7,t1
8000036e:	0305                	add	t1,t1,1
80000370:	006689b3          	add	s3,a3,t1
80000374:	891e                	mv	s2,t2
80000376:	9416                	add	s0,s0,t0
80000378:	00044403          	lbu	s0,0(s0)
8000037c:	0293d3b3          	divu	t2,t2,s1
80000380:	fe898fa3          	sb	s0,-1(s3)
80000384:	ff2a62e3          	bltu	s4,s2,80000368 <vformat+0x164>
80000388:	98b6                	add	a7,a7,a3
8000038a:	0008c383          	lbu	t2,0(a7)
8000038e:	82c6                	mv	t0,a7
80000390:	0705                	add	a4,a4,1
80000392:	fe770fa3          	sb	t2,-1(a4)
80000396:	18fd                	add	a7,a7,-1
80000398:	fe5699e3          	bne	a3,t0,8000038a <vformat+0x186>
8000039c:	981a                	add	a6,a6,t1
8000039e:	01058733          	add	a4,a1,a6
800003a2:	b731                	j	800002ae <vformat+0xaa>
800003a4:	00062283          	lw	t0,0(a2)
800003a8:	0611                	add	a2,a2,4
800003aa:	0002c883          	lbu	a7,0(t0)
800003ae:	f00880e3          	beqz	a7,800002ae <vformat+0xaa>
800003b2:	4681                	li	a3,0
800003b4:	00d70333          	add	t1,a4,a3
800003b8:	0685                	add	a3,a3,1
800003ba:	01130023          	sb	a7,0(t1)
800003be:	00d288b3          	add	a7,t0,a3
800003c2:	0008c883          	lbu	a7,0(a7)
800003c6:	fe0897e3          	bnez	a7,800003b4 <vformat+0x1b0>
800003ca:	9836                	add	a6,a6,a3
800003cc:	01058733          	add	a4,a1,a6
800003d0:	bdf9                	j	800002ae <vformat+0xaa>
800003d2:	00062883          	lw	a7,0(a2)
800003d6:	0611                	add	a2,a2,4
800003d8:	0c08c263          	bltz	a7,8000049c <vformat+0x298>
800003dc:	0c089963          	bnez	a7,800004ae <vformat+0x2aa>
800003e0:	03000693          	li	a3,48
800003e4:	00d70023          	sb	a3,0(a4)
800003e8:	4385                	li	t2,1
800003ea:	981e                	add	a6,a6,t2
800003ec:	01058733          	add	a4,a1,a6
800003f0:	bd7d                	j	800002ae <vformat+0xaa>
800003f2:	4214                	lw	a3,0(a2)
800003f4:	0805                	add	a6,a6,1
800003f6:	0611                	add	a2,a2,4
800003f8:	00d70023          	sb	a3,0(a4)
800003fc:	01058733          	add	a4,a1,a6
80000400:	b57d                	j	800002ae <vformat+0xaa>
80000402:	00062303          	lw	t1,0(a2)
80000406:	03000693          	li	a3,48
8000040a:	06200893          	li	a7,98
8000040e:	0809                	add	a6,a6,2
80000410:	00d70023          	sb	a3,0(a4)
80000414:	011700a3          	sb	a7,1(a4)
80000418:	0611                	add	a2,a2,4
8000041a:	010583b3          	add	t2,a1,a6
8000041e:	06030863          	beqz	t1,8000048e <vformat+0x28a>
80000422:	4881                	li	a7,0
80000424:	868a                	mv	a3,sp
80000426:	fec18293          	add	t0,gp,-20 # 80000a38 <table>
8000042a:	00137713          	and	a4,t1,1
8000042e:	9716                	add	a4,a4,t0
80000430:	00074483          	lbu	s1,0(a4)
80000434:	8746                	mv	a4,a7
80000436:	0885                	add	a7,a7,1
80000438:	01168433          	add	s0,a3,a7
8000043c:	fe940fa3          	sb	s1,-1(s0)
80000440:	00135313          	srl	t1,t1,0x1
80000444:	fe0313e3          	bnez	t1,8000042a <vformat+0x226>
80000448:	9736                	add	a4,a4,a3
8000044a:	831e                	mv	t1,t2
8000044c:	00074383          	lbu	t2,0(a4)
80000450:	82ba                	mv	t0,a4
80000452:	0305                	add	t1,t1,1
80000454:	fe730fa3          	sb	t2,-1(t1)
80000458:	177d                	add	a4,a4,-1
8000045a:	fe5699e3          	bne	a3,t0,8000044c <vformat+0x248>
8000045e:	9846                	add	a6,a6,a7
80000460:	01058733          	add	a4,a1,a6
80000464:	b5a9                	j	800002ae <vformat+0xaa>
80000466:	00280693          	add	a3,a6,2
8000046a:	01d70023          	sb	t4,0(a4)
8000046e:	01d700a3          	sb	t4,1(a4)
80000472:	080d                	add	a6,a6,3
80000474:	00d58733          	add	a4,a1,a3
80000478:	01d70023          	sb	t4,0(a4)
8000047c:	01058733          	add	a4,a1,a6
80000480:	bd05                	j	800002b0 <vformat+0xac>
80000482:	0805                	add	a6,a6,1
80000484:	01c70023          	sb	t3,0(a4)
80000488:	01058733          	add	a4,a1,a6
8000048c:	b50d                	j	800002ae <vformat+0xaa>
8000048e:	4885                	li	a7,1
80000490:	9846                	add	a6,a6,a7
80000492:	00d38023          	sb	a3,0(t2)
80000496:	01058733          	add	a4,a1,a6
8000049a:	bd11                	j	800002ae <vformat+0xaa>
8000049c:	0805                	add	a6,a6,1
8000049e:	02d00693          	li	a3,45
800004a2:	00d70023          	sb	a3,0(a4)
800004a6:	411008b3          	neg	a7,a7
800004aa:	01058333          	add	t1,a1,a6
800004ae:	4381                	li	t2,0
800004b0:	868a                	mv	a3,sp
800004b2:	fec18293          	add	t0,gp,-20 # 80000a38 <table>
800004b6:	44a9                	li	s1,10
800004b8:	4a25                	li	s4,9
800004ba:	0298f433          	remu	s0,a7,s1
800004be:	871e                	mv	a4,t2
800004c0:	0385                	add	t2,t2,1
800004c2:	007689b3          	add	s3,a3,t2
800004c6:	8946                	mv	s2,a7
800004c8:	9416                	add	s0,s0,t0
800004ca:	00044403          	lbu	s0,0(s0)
800004ce:	0298d8b3          	divu	a7,a7,s1
800004d2:	fe898fa3          	sb	s0,-1(s3)
800004d6:	ff2a62e3          	bltu	s4,s2,800004ba <vformat+0x2b6>
800004da:	9736                	add	a4,a4,a3
800004dc:	00074283          	lbu	t0,0(a4)
800004e0:	88ba                	mv	a7,a4
800004e2:	0305                	add	t1,t1,1
800004e4:	fe530fa3          	sb	t0,-1(t1)
800004e8:	177d                	add	a4,a4,-1
800004ea:	ff1699e3          	bne	a3,a7,800004dc <vformat+0x2d8>
800004ee:	bdf5                	j	800003ea <vformat+0x1e6>
800004f0:	00280693          	add	a3,a6,2
800004f4:	01d70023          	sb	t4,0(a4)
800004f8:	01d700a3          	sb	t4,1(a4)
800004fc:	080d                	add	a6,a6,3
800004fe:	00d58733          	add	a4,a1,a3
80000502:	01d70023          	sb	t4,0(a4)
80000506:	01058733          	add	a4,a1,a6
8000050a:	b31d                	j	80000230 <vformat+0x2c>
8000050c:	03000693          	li	a3,48
80000510:	00d70023          	sb	a3,0(a4)
80000514:	4305                	li	t1,1
80000516:	b559                	j	8000039c <vformat+0x198>
80000518:	0805                	add	a6,a6,1
8000051a:	01c70023          	sb	t3,0(a4)
8000051e:	0785                	add	a5,a5,1
80000520:	01058733          	add	a4,a1,a6
80000524:	b331                	j	80000230 <vformat+0x2c>
80000526:	03f00893          	li	a7,63
8000052a:	00280693          	add	a3,a6,2
8000052e:	01170023          	sb	a7,0(a4)
80000532:	011700a3          	sb	a7,1(a4)
80000536:	080d                	add	a6,a6,3
80000538:	00d58733          	add	a4,a1,a3
8000053c:	01170023          	sb	a7,0(a4)
80000540:	0785                	add	a5,a5,1
80000542:	01058733          	add	a4,a1,a6
80000546:	b1ed                	j	80000230 <vformat+0x2c>

80000548 <vprint>:
80000548:	7175                	add	sp,sp,-144
8000054a:	862e                	mv	a2,a1
8000054c:	858a                	mv	a1,sp
8000054e:	c706                	sw	ra,140(sp)
80000550:	3955                	jal	80000204 <vformat>
80000552:	00014783          	lbu	a5,0(sp)
80000556:	cb89                	beqz	a5,80000568 <vprint+0x20>
80000558:	00110713          	add	a4,sp,1
8000055c:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
80000560:	00074783          	lbu	a5,0(a4)
80000564:	0705                	add	a4,a4,1
80000566:	fbfd                	bnez	a5,8000055c <vprint+0x14>
80000568:	40ba                	lw	ra,140(sp)
8000056a:	6149                	add	sp,sp,144
8000056c:	8082                	ret

8000056e <print>:
8000056e:	7139                	add	sp,sp,-64
80000570:	02410313          	add	t1,sp,36
80000574:	d22e                	sw	a1,36(sp)
80000576:	859a                	mv	a1,t1
80000578:	ce06                	sw	ra,28(sp)
8000057a:	d432                	sw	a2,40(sp)
8000057c:	d636                	sw	a3,44(sp)
8000057e:	d83a                	sw	a4,48(sp)
80000580:	da3e                	sw	a5,52(sp)
80000582:	dc42                	sw	a6,56(sp)
80000584:	de46                	sw	a7,60(sp)
80000586:	c61a                	sw	t1,12(sp)
80000588:	37c1                	jal	80000548 <vprint>
8000058a:	40f2                	lw	ra,28(sp)
8000058c:	6121                	add	sp,sp,64
8000058e:	8082                	ret

80000590 <format>:
80000590:	7139                	add	sp,sp,-64
80000592:	02810313          	add	t1,sp,40
80000596:	d432                	sw	a2,40(sp)
80000598:	861a                	mv	a2,t1
8000059a:	ce06                	sw	ra,28(sp)
8000059c:	d636                	sw	a3,44(sp)
8000059e:	d83a                	sw	a4,48(sp)
800005a0:	da3e                	sw	a5,52(sp)
800005a2:	dc42                	sw	a6,56(sp)
800005a4:	de46                	sw	a7,60(sp)
800005a6:	c61a                	sw	t1,12(sp)
800005a8:	39b1                	jal	80000204 <vformat>
800005aa:	40f2                	lw	ra,28(sp)
800005ac:	6121                	add	sp,sp,64
800005ae:	8082                	ret

800005b0 <dprint>:
800005b0:	1101                	add	sp,sp,-32
800005b2:	c22e                	sw	a1,4(sp)
800005b4:	c432                	sw	a2,8(sp)
800005b6:	c636                	sw	a3,12(sp)
800005b8:	c83a                	sw	a4,16(sp)
800005ba:	ca3e                	sw	a5,20(sp)
800005bc:	cc42                	sw	a6,24(sp)
800005be:	ce46                	sw	a7,28(sp)
800005c0:	6105                	add	sp,sp,32
800005c2:	8082                	ret

800005c4 <advance_mepc>:
800005c4:	341027f3          	csrr	a5,mepc
800005c8:	953e                	add	a0,a0,a5
800005ca:	34151073          	csrw	mepc,a0
800005ce:	8082                	ret

800005d0 <set_mepc>:
800005d0:	34151073          	csrw	mepc,a0
800005d4:	8082                	ret

800005d6 <advance_sepc>:
800005d6:	141027f3          	csrr	a5,sepc
800005da:	953e                	add	a0,a0,a5
800005dc:	14151073          	csrw	sepc,a0
800005e0:	8082                	ret

800005e2 <set_sepc>:
800005e2:	14151073          	csrw	sepc,a0
800005e6:	8082                	ret

800005e8 <setup_interrupts_m>:
800005e8:	30551073          	csrw	mtvec,a0
800005ec:	30459073          	csrw	mie,a1
800005f0:	8082                	ret

800005f2 <setup_interrupt_m_vectored>:
800005f2:	00156513          	or	a0,a0,1
800005f6:	30551073          	csrw	mtvec,a0
800005fa:	30459073          	csrw	mie,a1
800005fe:	8082                	ret

80000600 <enable_interrupts_m>:
80000600:	47a1                	li	a5,8
80000602:	3007a073          	csrs	mstatus,a5
80000606:	8082                	ret

80000608 <disable_interrupts_m>:
80000608:	47a1                	li	a5,8
8000060a:	3007b073          	csrc	mstatus,a5
8000060e:	8082                	ret

80000610 <enable_interrupts_save_m>:
80000610:	30051073          	csrw	mstatus,a0
80000614:	8082                	ret

80000616 <disable_interrupts_save_m>:
80000616:	4521                	li	a0,8
80000618:	30053573          	csrrc	a0,mstatus,a0
8000061c:	8082                	ret

8000061e <check_supervisor_mode_available>:
8000061e:	6785                	lui	a5,0x1
80000620:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
80000624:	3007a573          	csrrs	a0,mstatus,a5
80000628:	30051573          	csrrw	a0,mstatus,a0
8000062c:	6789                	lui	a5,0x2
8000062e:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
80000632:	8d7d                	and	a0,a0,a5
80000634:	80050513          	add	a0,a0,-2048
80000638:	00153513          	seqz	a0,a0
8000063c:	8082                	ret

8000063e <require_supervisor_mode>:
8000063e:	6785                	lui	a5,0x1
80000640:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
80000644:	3007a7f3          	csrrs	a5,mstatus,a5
80000648:	300797f3          	csrrw	a5,mstatus,a5
8000064c:	6709                	lui	a4,0x2
8000064e:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
80000652:	8ff9                	and	a5,a5,a4
80000654:	80078793          	add	a5,a5,-2048
80000658:	e391                	bnez	a5,8000065c <require_supervisor_mode+0x1e>
8000065a:	8082                	ret
8000065c:	1141                	add	sp,sp,-16
8000065e:	00000517          	auipc	a0,0x0
80000662:	25250513          	add	a0,a0,594 # 800008b0 <fromhost+0x84>
80000666:	c606                	sw	ra,12(sp)
80000668:	3719                	jal	8000056e <print>
8000066a:	57fd                	li	a5,-1
8000066c:	dcf1ac23          	sw	a5,-552(gp) # 80000824 <flag>
80000670:	3435                	jal	8000009c <done>

80000672 <read_exception_context>:
80000672:	c00027f3          	rdcycle	a5
80000676:	c55c                	sw	a5,12(a0)
80000678:	c01027f3          	rdtime	a5
8000067c:	c91c                	sw	a5,16(a0)
8000067e:	342027f3          	csrr	a5,mcause
80000682:	c51c                	sw	a5,8(a0)
80000684:	341027f3          	csrr	a5,mepc
80000688:	c11c                	sw	a5,0(a0)
8000068a:	343027f3          	csrr	a5,mtval
8000068e:	c15c                	sw	a5,4(a0)
80000690:	c03027f3          	csrr	a5,hpmcounter3
80000694:	c95c                	sw	a5,20(a0)
80000696:	c04027f3          	csrr	a5,hpmcounter4
8000069a:	cd1c                	sw	a5,24(a0)
8000069c:	8082                	ret

8000069e <read_exception_context_s>:
8000069e:	c00027f3          	rdcycle	a5
800006a2:	c55c                	sw	a5,12(a0)
800006a4:	c01027f3          	rdtime	a5
800006a8:	c91c                	sw	a5,16(a0)
800006aa:	142027f3          	csrr	a5,scause
800006ae:	c51c                	sw	a5,8(a0)
800006b0:	141027f3          	csrr	a5,sepc
800006b4:	c11c                	sw	a5,0(a0)
800006b6:	143027f3          	csrr	a5,stval
800006ba:	c15c                	sw	a5,4(a0)
800006bc:	c03027f3          	csrr	a5,hpmcounter3
800006c0:	c95c                	sw	a5,20(a0)
800006c2:	c04027f3          	csrr	a5,hpmcounter4
800006c6:	cd1c                	sw	a5,24(a0)
800006c8:	8082                	ret

800006ca <print_exception_context>:
800006ca:	1141                	add	sp,sp,-16
800006cc:	c422                	sw	s0,8(sp)
800006ce:	842a                	mv	s0,a0
800006d0:	00000517          	auipc	a0,0x0
800006d4:	20450513          	add	a0,a0,516 # 800008d4 <fromhost+0xa8>
800006d8:	c606                	sw	ra,12(sp)
800006da:	3d51                	jal	8000056e <print>
800006dc:	440c                	lw	a1,8(s0)
800006de:	00000517          	auipc	a0,0x0
800006e2:	20e50513          	add	a0,a0,526 # 800008ec <fromhost+0xc0>
800006e6:	3561                	jal	8000056e <print>
800006e8:	400c                	lw	a1,0(s0)
800006ea:	00000517          	auipc	a0,0x0
800006ee:	21250513          	add	a0,a0,530 # 800008fc <fromhost+0xd0>
800006f2:	3db5                	jal	8000056e <print>
800006f4:	404c                	lw	a1,4(s0)
800006f6:	00000517          	auipc	a0,0x0
800006fa:	21650513          	add	a0,a0,534 # 8000090c <fromhost+0xe0>
800006fe:	3d85                	jal	8000056e <print>
80000700:	444c                	lw	a1,12(s0)
80000702:	00000517          	auipc	a0,0x0
80000706:	21a50513          	add	a0,a0,538 # 8000091c <fromhost+0xf0>
8000070a:	3595                	jal	8000056e <print>
8000070c:	480c                	lw	a1,16(s0)
8000070e:	00000517          	auipc	a0,0x0
80000712:	21e50513          	add	a0,a0,542 # 8000092c <fromhost+0x100>
80000716:	3da1                	jal	8000056e <print>
80000718:	484c                	lw	a1,20(s0)
8000071a:	00000517          	auipc	a0,0x0
8000071e:	22250513          	add	a0,a0,546 # 8000093c <fromhost+0x110>
80000722:	35b1                	jal	8000056e <print>
80000724:	4c0c                	lw	a1,24(s0)
80000726:	4422                	lw	s0,8(sp)
80000728:	40b2                	lw	ra,12(sp)
8000072a:	00000517          	auipc	a0,0x0
8000072e:	22250513          	add	a0,a0,546 # 8000094c <fromhost+0x120>
80000732:	0141                	add	sp,sp,16
80000734:	bd2d                	j	8000056e <print>
	...

80000738 <default_handler>:
80000738:	711d                	add	sp,sp,-96
8000073a:	c6aa                	sw	a0,76(sp)
8000073c:	0048                	add	a0,sp,4
8000073e:	ce86                	sw	ra,92(sp)
80000740:	cc96                	sw	t0,88(sp)
80000742:	ca9a                	sw	t1,84(sp)
80000744:	c89e                	sw	t2,80(sp)
80000746:	c4ae                	sw	a1,72(sp)
80000748:	c2b2                	sw	a2,68(sp)
8000074a:	c0b6                	sw	a3,64(sp)
8000074c:	de3a                	sw	a4,60(sp)
8000074e:	dc3e                	sw	a5,56(sp)
80000750:	da42                	sw	a6,52(sp)
80000752:	d846                	sw	a7,48(sp)
80000754:	d672                	sw	t3,44(sp)
80000756:	d476                	sw	t4,40(sp)
80000758:	d27a                	sw	t5,36(sp)
8000075a:	d07e                	sw	t6,32(sp)
8000075c:	3f19                	jal	80000672 <read_exception_context>
8000075e:	0048                	add	a0,sp,4
80000760:	37ad                	jal	800006ca <print_exception_context>
80000762:	00000517          	auipc	a0,0x0
80000766:	1fa50513          	add	a0,a0,506 # 8000095c <fromhost+0x130>
8000076a:	3511                	jal	8000056e <print>
8000076c:	3a05                	jal	8000009c <done>

8000076e <unreachable_handler>:
8000076e:	711d                	add	sp,sp,-96
80000770:	c6aa                	sw	a0,76(sp)
80000772:	0048                	add	a0,sp,4
80000774:	ce86                	sw	ra,92(sp)
80000776:	cc96                	sw	t0,88(sp)
80000778:	ca9a                	sw	t1,84(sp)
8000077a:	c89e                	sw	t2,80(sp)
8000077c:	c4ae                	sw	a1,72(sp)
8000077e:	c2b2                	sw	a2,68(sp)
80000780:	c0b6                	sw	a3,64(sp)
80000782:	de3a                	sw	a4,60(sp)
80000784:	dc3e                	sw	a5,56(sp)
80000786:	da42                	sw	a6,52(sp)
80000788:	d846                	sw	a7,48(sp)
8000078a:	d672                	sw	t3,44(sp)
8000078c:	d476                	sw	t4,40(sp)
8000078e:	d27a                	sw	t5,36(sp)
80000790:	d07e                	sw	t6,32(sp)
80000792:	35c5                	jal	80000672 <read_exception_context>
80000794:	0048                	add	a0,sp,4
80000796:	3f15                	jal	800006ca <print_exception_context>
80000798:	00000517          	auipc	a0,0x0
8000079c:	1f050513          	add	a0,a0,496 # 80000988 <fromhost+0x15c>
800007a0:	33f9                	jal	8000056e <print>
800007a2:	8fbff0ef          	jal	8000009c <done>

800007a6 <test_pass>:
800007a6:	1141                	add	sp,sp,-16
800007a8:	85aa                	mv	a1,a0
800007aa:	00000517          	auipc	a0,0x0
800007ae:	22e50513          	add	a0,a0,558 # 800009d8 <fromhost+0x1ac>
800007b2:	c606                	sw	ra,12(sp)
800007b4:	3b6d                	jal	8000056e <print>
800007b6:	40b2                	lw	ra,12(sp)
800007b8:	4785                	li	a5,1
800007ba:	dcf1ac23          	sw	a5,-552(gp) # 80000824 <flag>
800007be:	0141                	add	sp,sp,16
800007c0:	8082                	ret

800007c2 <test_fail>:
800007c2:	1141                	add	sp,sp,-16
800007c4:	85aa                	mv	a1,a0
800007c6:	00000517          	auipc	a0,0x0
800007ca:	21250513          	add	a0,a0,530 # 800009d8 <fromhost+0x1ac>
800007ce:	c606                	sw	ra,12(sp)
800007d0:	3b79                	jal	8000056e <print>
800007d2:	40b2                	lw	ra,12(sp)
800007d4:	dc01ac23          	sw	zero,-552(gp) # 80000824 <flag>
800007d8:	0141                	add	sp,sp,16
800007da:	8082                	ret
800007dc:	0000                	unimp
	...

800007e0 <vector_table>:
800007e0:	8d1ff06f          	j	800000b0 <exception_handler>
800007e4:	f55ff06f          	j	80000738 <default_handler>
800007e8:	f87ff06f          	j	8000076e <unreachable_handler>
800007ec:	f4dff06f          	j	80000738 <default_handler>
800007f0:	f7fff06f          	j	8000076e <unreachable_handler>
800007f4:	f45ff06f          	j	80000738 <default_handler>
800007f8:	f77ff06f          	j	8000076e <unreachable_handler>
800007fc:	f3dff06f          	j	80000738 <default_handler>
80000800:	f6fff06f          	j	8000076e <unreachable_handler>
80000804:	f35ff06f          	j	80000738 <default_handler>
80000808:	f67ff06f          	j	8000076e <unreachable_handler>
8000080c:	f2dff06f          	j	80000738 <default_handler>
80000810:	f5fff06f          	j	8000076e <unreachable_handler>
80000814:	f25ff06f          	j	80000738 <default_handler>
80000818:	f57ff06f          	j	8000076e <unreachable_handler>
8000081c:	f53ff06f          	j	8000076e <unreachable_handler>
	...
