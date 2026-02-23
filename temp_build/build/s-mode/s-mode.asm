
build/s-mode/s-mode:     file format elf32-littleriscv


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
8000004a:	a0a18193          	add	gp,gp,-1526 # 80000a50 <__bss_end>

8000004e <clr_bss>:
8000004e:	00018293          	mv	t0,gp
80000052:	00018313          	mv	t1,gp
80000056:	00628763          	beq	t0,t1,80000064 <do_preinit_arr>

8000005a <clr_bss_loop>:
8000005a:	00028023          	sb	zero,0(t0)
8000005e:	0285                	add	t0,t0,1
80000060:	fe535de3          	bge	t1,t0,8000005a <clr_bss_loop>

80000064 <do_preinit_arr>:
80000064:	e2218413          	add	s0,gp,-478 # 80000872 <__init_array_end>
80000068:	e2218493          	add	s1,gp,-478 # 80000872 <__init_array_end>
8000006c:	00940963          	beq	s0,s1,8000007e <do_init_arr>

80000070 <preinit_arr_calls>:
80000070:	00042903          	lw	s2,0(s0)
80000074:	000900e7          	jalr	s2
80000078:	0411                	add	s0,s0,4
8000007a:	fe941be3          	bne	s0,s1,80000070 <preinit_arr_calls>

8000007e <do_init_arr>:
8000007e:	e2218413          	add	s0,gp,-478 # 80000872 <__init_array_end>
80000082:	e2218493          	add	s1,gp,-478 # 80000872 <__init_array_end>
80000086:	00940963          	beq	s0,s1,80000098 <enter_main>

8000008a <init_arr_calls>:
8000008a:	00042903          	lw	s2,0(s0)
8000008e:	000900e7          	jalr	s2
80000092:	0411                	add	s0,s0,4
80000094:	fc941ee3          	bne	s0,s1,80000070 <preinit_arr_calls>

80000098 <enter_main>:
80000098:	11e000ef          	jal	800001b6 <main>

8000009c <done>:
8000009c:	e2418d93          	add	s11,gp,-476 # 80000874 <flag>
800000a0:	000dae03          	lw	t3,0(s11)
800000a4:	e2818d93          	add	s11,gp,-472 # 80000878 <tohost>
800000a8:	01cda023          	sw	t3,0(s11)

800000ac <__sim_halt>:
800000ac:	a001                	j	800000ac <__sim_halt>
	...

800000b0 <m_mode_handler>:
800000b0:	711d                	add	sp,sp,-96
800000b2:	c6aa                	sw	a0,76(sp)
800000b4:	0048                	add	a0,sp,4
800000b6:	dc3e                	sw	a5,56(sp)
800000b8:	ce86                	sw	ra,92(sp)
800000ba:	cc96                	sw	t0,88(sp)
800000bc:	ca9a                	sw	t1,84(sp)
800000be:	c89e                	sw	t2,80(sp)
800000c0:	c4ae                	sw	a1,72(sp)
800000c2:	c2b2                	sw	a2,68(sp)
800000c4:	c0b6                	sw	a3,64(sp)
800000c6:	de3a                	sw	a4,60(sp)
800000c8:	da42                	sw	a6,52(sp)
800000ca:	d846                	sw	a7,48(sp)
800000cc:	d672                	sw	t3,44(sp)
800000ce:	d476                	sw	t4,40(sp)
800000d0:	d27a                	sw	t5,36(sp)
800000d2:	d07e                	sw	t6,32(sp)
800000d4:	2bc5                	jal	800006c4 <read_exception_context>
800000d6:	0048                	add	a0,sp,4
800000d8:	2591                	jal	8000071c <print_exception_context>
800000da:	10000793          	li	a5,256
800000de:	1007a073          	csrs	sstatus,a5
800000e2:	00000517          	auipc	a0,0x0
800000e6:	fba50513          	add	a0,a0,-70 # 8000009c <done>
800000ea:	23a9                	jal	80000634 <set_sepc>
800000ec:	e2418713          	add	a4,gp,-476 # 80000874 <flag>
800000f0:	431c                	lw	a5,0(a4)
800000f2:	4511                	li	a0,4
800000f4:	17fd                	add	a5,a5,-1
800000f6:	c31c                	sw	a5,0(a4)
800000f8:	2b39                	jal	80000616 <advance_mepc>
800000fa:	30200073          	mret
800000fe:	40f6                	lw	ra,92(sp)
80000100:	42e6                	lw	t0,88(sp)
80000102:	4356                	lw	t1,84(sp)
80000104:	43c6                	lw	t2,80(sp)
80000106:	4536                	lw	a0,76(sp)
80000108:	45a6                	lw	a1,72(sp)
8000010a:	4616                	lw	a2,68(sp)
8000010c:	4686                	lw	a3,64(sp)
8000010e:	5772                	lw	a4,60(sp)
80000110:	57e2                	lw	a5,56(sp)
80000112:	5852                	lw	a6,52(sp)
80000114:	58c2                	lw	a7,48(sp)
80000116:	5e32                	lw	t3,44(sp)
80000118:	5ea2                	lw	t4,40(sp)
8000011a:	5f12                	lw	t5,36(sp)
8000011c:	5f82                	lw	t6,32(sp)
8000011e:	6125                	add	sp,sp,96
80000120:	30200073          	mret
80000124:	0000                	unimp
	...

80000128 <s_mode_handler>:
80000128:	711d                	add	sp,sp,-96
8000012a:	c6aa                	sw	a0,76(sp)
8000012c:	0048                	add	a0,sp,4
8000012e:	de3a                	sw	a4,60(sp)
80000130:	dc3e                	sw	a5,56(sp)
80000132:	ce86                	sw	ra,92(sp)
80000134:	cc96                	sw	t0,88(sp)
80000136:	ca9a                	sw	t1,84(sp)
80000138:	c89e                	sw	t2,80(sp)
8000013a:	c4ae                	sw	a1,72(sp)
8000013c:	c2b2                	sw	a2,68(sp)
8000013e:	c0b6                	sw	a3,64(sp)
80000140:	da42                	sw	a6,52(sp)
80000142:	d846                	sw	a7,48(sp)
80000144:	d672                	sw	t3,44(sp)
80000146:	d476                	sw	t4,40(sp)
80000148:	d27a                	sw	t5,36(sp)
8000014a:	d07e                	sw	t6,32(sp)
8000014c:	2355                	jal	800006f0 <read_exception_context_s>
8000014e:	0048                	add	a0,sp,4
80000150:	23f1                	jal	8000071c <print_exception_context>
80000152:	4732                	lw	a4,12(sp)
80000154:	47a1                	li	a5,8
80000156:	02f71963          	bne	a4,a5,80000188 <s_mode_handler+0x60>
8000015a:	00000073          	ecall
8000015e:	10200073          	sret
80000162:	40f6                	lw	ra,92(sp)
80000164:	42e6                	lw	t0,88(sp)
80000166:	4356                	lw	t1,84(sp)
80000168:	43c6                	lw	t2,80(sp)
8000016a:	4536                	lw	a0,76(sp)
8000016c:	45a6                	lw	a1,72(sp)
8000016e:	4616                	lw	a2,68(sp)
80000170:	4686                	lw	a3,64(sp)
80000172:	5772                	lw	a4,60(sp)
80000174:	57e2                	lw	a5,56(sp)
80000176:	5852                	lw	a6,52(sp)
80000178:	58c2                	lw	a7,48(sp)
8000017a:	5e32                	lw	t3,44(sp)
8000017c:	5ea2                	lw	t4,40(sp)
8000017e:	5f12                	lw	t5,36(sp)
80000180:	5f82                	lw	t6,32(sp)
80000182:	6125                	add	sp,sp,96
80000184:	30200073          	mret
80000188:	4511                	li	a0,4
8000018a:	2979                	jal	80000628 <advance_sepc>
8000018c:	e2418713          	add	a4,gp,-476 # 80000874 <flag>
80000190:	431c                	lw	a5,0(a4)
80000192:	17fd                	add	a5,a5,-1
80000194:	c31c                	sw	a5,0(a4)
80000196:	b7e1                	j	8000015e <s_mode_handler+0x36>

80000198 <user_main>:
80000198:	1141                	add	sp,sp,-16
8000019a:	00000517          	auipc	a0,0x0
8000019e:	6e650513          	add	a0,a0,1766 # 80000880 <fromhost+0x4>
800001a2:	c606                	sw	ra,12(sp)
800001a4:	2931                	jal	800005c0 <print>
800001a6:	10200073          	sret
800001aa:	300027f3          	csrr	a5,mstatus
800001ae:	10500073          	wfi
800001b2:	00000073          	ecall

800001b6 <main>:
800001b6:	1141                	add	sp,sp,-16
800001b8:	c606                	sw	ra,12(sp)
800001ba:	c422                	sw	s0,8(sp)
800001bc:	29d1                	jal	80000690 <require_supervisor_mode>
800001be:	00000797          	auipc	a5,0x0
800001c2:	ef278793          	add	a5,a5,-270 # 800000b0 <m_mode_handler>
800001c6:	30579073          	csrw	mtvec,a5
800001ca:	47a1                	li	a5,8
800001cc:	3007a073          	csrs	mstatus,a5
800001d0:	00000717          	auipc	a4,0x0
800001d4:	f5870713          	add	a4,a4,-168 # 80000128 <s_mode_handler>
800001d8:	10571073          	csrw	stvec,a4
800001dc:	1007a073          	csrs	sstatus,a5
800001e0:	e2418413          	add	s0,gp,-476 # 80000874 <flag>
800001e4:	00245793          	srl	a5,s0,0x2
800001e8:	3b079073          	csrw	pmpaddr0,a5
800001ec:	3b002773          	csrr	a4,pmpaddr0
800001f0:	02e78363          	beq	a5,a4,80000216 <main+0x60>
800001f4:	00000517          	auipc	a0,0x0
800001f8:	69050513          	add	a0,a0,1680 # 80000884 <fromhost+0x8>
800001fc:	26d1                	jal	800005c0 <print>
800001fe:	6789                	lui	a5,0x2
80000200:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
80000204:	3007a073          	csrs	mstatus,a5
80000208:	00000517          	auipc	a0,0x0
8000020c:	e9450513          	add	a0,a0,-364 # 8000009c <done>
80000210:	2909                	jal	80000622 <set_mepc>
80000212:	30200073          	mret
80000216:	57fd                	li	a5,-1
80000218:	3b179073          	csrw	pmpaddr1,a5
8000021c:	6789                	lui	a5,0x2
8000021e:	f1778793          	add	a5,a5,-233 # 1f17 <boot-0x7fffe0e9>
80000222:	3a079073          	csrw	pmpcfg0,a5
80000226:	4795                	li	a5,5
80000228:	c01c                	sw	a5,0(s0)
8000022a:	dff00793          	li	a5,-513
8000022e:	30279073          	csrw	medeleg,a5
80000232:	00000517          	auipc	a0,0x0
80000236:	f6650513          	add	a0,a0,-154 # 80000198 <user_main>
8000023a:	2eed                	jal	80000634 <set_sepc>
8000023c:	10200073          	sret

80000240 <print_string>:
80000240:	00054783          	lbu	a5,0(a0)
80000244:	cb81                	beqz	a5,80000254 <print_string+0x14>
80000246:	0505                	add	a0,a0,1
80000248:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
8000024c:	00054783          	lbu	a5,0(a0)
80000250:	0505                	add	a0,a0,1
80000252:	fbfd                	bnez	a5,80000248 <print_string+0x8>
80000254:	8082                	ret

80000256 <vformat>:
80000256:	00054683          	lbu	a3,0(a0)
8000025a:	ce85                	beqz	a3,80000292 <vformat+0x3c>
8000025c:	4781                	li	a5,0
8000025e:	4801                	li	a6,0
80000260:	4881                	li	a7,0
80000262:	872e                	mv	a4,a1
80000264:	02500e13          	li	t3,37
80000268:	03f00e93          	li	t4,63
8000026c:	4fd9                	li	t6,22
8000026e:	f9418f13          	add	t5,gp,-108 # 800009e4 <fromhost+0x168>
80000272:	833a                	mv	t1,a4
80000274:	03c68263          	beq	a3,t3,80000298 <vformat+0x42>
80000278:	0805                	add	a6,a6,1
8000027a:	00d70023          	sb	a3,0(a4)
8000027e:	01058733          	add	a4,a1,a6
80000282:	0785                	add	a5,a5,1
80000284:	00f506b3          	add	a3,a0,a5
80000288:	0006c683          	lbu	a3,0(a3)
8000028c:	88be                	mv	a7,a5
8000028e:	f2f5                	bnez	a3,80000272 <vformat+0x1c>
80000290:	85ba                	mv	a1,a4
80000292:	00058023          	sb	zero,0(a1)
80000296:	8082                	ret
80000298:	98aa                	add	a7,a7,a0
8000029a:	0018c683          	lbu	a3,1(a7)
8000029e:	2a068263          	beqz	a3,80000542 <vformat+0x2ec>
800002a2:	2dc68463          	beq	a3,t3,8000056a <vformat+0x314>
800002a6:	f9e68693          	add	a3,a3,-98
800002aa:	0ff6f693          	zext.b	a3,a3
800002ae:	2cdfe563          	bltu	t6,a3,80000578 <vformat+0x322>
800002b2:	7139                	add	sp,sp,-64
800002b4:	de22                	sw	s0,60(sp)
800002b6:	dc26                	sw	s1,56(sp)
800002b8:	da4a                	sw	s2,52(sp)
800002ba:	d84e                	sw	s3,48(sp)
800002bc:	d652                	sw	s4,44(sp)
800002be:	068a                	sll	a3,a3,0x2
800002c0:	96fa                	add	a3,a3,t5
800002c2:	4294                	lw	a3,0(a3)
800002c4:	96fa                	add	a3,a3,t5
800002c6:	8682                	jr	a3
800002c8:	98aa                	add	a7,a7,a0
800002ca:	0018c683          	lbu	a3,1(a7)
800002ce:	1e068563          	beqz	a3,800004b8 <vformat+0x262>
800002d2:	21c68163          	beq	a3,t3,800004d4 <vformat+0x27e>
800002d6:	f9e68693          	add	a3,a3,-98
800002da:	0ff6f693          	zext.b	a3,a3
800002de:	fedff0e3          	bgeu	t6,a3,800002be <vformat+0x68>
800002e2:	03f00893          	li	a7,63
800002e6:	00280693          	add	a3,a6,2
800002ea:	01170023          	sb	a7,0(a4)
800002ee:	011700a3          	sb	a7,1(a4)
800002f2:	080d                	add	a6,a6,3
800002f4:	00d58733          	add	a4,a1,a3
800002f8:	01170023          	sb	a7,0(a4)
800002fc:	01058733          	add	a4,a1,a6
80000300:	0785                	add	a5,a5,1
80000302:	0785                	add	a5,a5,1
80000304:	00f506b3          	add	a3,a0,a5
80000308:	0006c683          	lbu	a3,0(a3)
8000030c:	88be                	mv	a7,a5
8000030e:	c285                	beqz	a3,8000032e <vformat+0xd8>
80000310:	833a                	mv	t1,a4
80000312:	fbc68be3          	beq	a3,t3,800002c8 <vformat+0x72>
80000316:	0785                	add	a5,a5,1
80000318:	00d70023          	sb	a3,0(a4)
8000031c:	00f506b3          	add	a3,a0,a5
80000320:	0006c683          	lbu	a3,0(a3)
80000324:	0805                	add	a6,a6,1
80000326:	01058733          	add	a4,a1,a6
8000032a:	88be                	mv	a7,a5
8000032c:	f2f5                	bnez	a3,80000310 <vformat+0xba>
8000032e:	00070023          	sb	zero,0(a4)
80000332:	5472                	lw	s0,60(sp)
80000334:	54e2                	lw	s1,56(sp)
80000336:	5952                	lw	s2,52(sp)
80000338:	59c2                	lw	s3,48(sp)
8000033a:	5a32                	lw	s4,44(sp)
8000033c:	6121                	add	sp,sp,64
8000033e:	8082                	ret
80000340:	00062303          	lw	t1,0(a2)
80000344:	03000693          	li	a3,48
80000348:	07800893          	li	a7,120
8000034c:	0809                	add	a6,a6,2
8000034e:	00d70023          	sb	a3,0(a4)
80000352:	011700a3          	sb	a7,1(a4)
80000356:	0611                	add	a2,a2,4
80000358:	010583b3          	add	t2,a1,a6
8000035c:	18030263          	beqz	t1,800004e0 <vformat+0x28a>
80000360:	4881                	li	a7,0
80000362:	868a                	mv	a3,sp
80000364:	ff018293          	add	t0,gp,-16 # 80000a40 <table>
80000368:	00f37713          	and	a4,t1,15
8000036c:	9716                	add	a4,a4,t0
8000036e:	00074483          	lbu	s1,0(a4)
80000372:	8746                	mv	a4,a7
80000374:	0885                	add	a7,a7,1
80000376:	01168433          	add	s0,a3,a7
8000037a:	fe940fa3          	sb	s1,-1(s0)
8000037e:	00435313          	srl	t1,t1,0x4
80000382:	fe0313e3          	bnez	t1,80000368 <vformat+0x112>
80000386:	9736                	add	a4,a4,a3
80000388:	831e                	mv	t1,t2
8000038a:	00074383          	lbu	t2,0(a4)
8000038e:	82ba                	mv	t0,a4
80000390:	0305                	add	t1,t1,1
80000392:	fe730fa3          	sb	t2,-1(t1)
80000396:	177d                	add	a4,a4,-1
80000398:	fe5699e3          	bne	a3,t0,8000038a <vformat+0x134>
8000039c:	9846                	add	a6,a6,a7
8000039e:	01058733          	add	a4,a1,a6
800003a2:	bfb9                	j	80000300 <vformat+0xaa>
800003a4:	00062383          	lw	t2,0(a2)
800003a8:	0611                	add	a2,a2,4
800003aa:	1a038a63          	beqz	t2,8000055e <vformat+0x308>
800003ae:	4301                	li	t1,0
800003b0:	868a                	mv	a3,sp
800003b2:	ff018293          	add	t0,gp,-16 # 80000a40 <table>
800003b6:	44a9                	li	s1,10
800003b8:	4a25                	li	s4,9
800003ba:	0293f433          	remu	s0,t2,s1
800003be:	889a                	mv	a7,t1
800003c0:	0305                	add	t1,t1,1
800003c2:	006689b3          	add	s3,a3,t1
800003c6:	891e                	mv	s2,t2
800003c8:	9416                	add	s0,s0,t0
800003ca:	00044403          	lbu	s0,0(s0)
800003ce:	0293d3b3          	divu	t2,t2,s1
800003d2:	fe898fa3          	sb	s0,-1(s3)
800003d6:	ff2a62e3          	bltu	s4,s2,800003ba <vformat+0x164>
800003da:	98b6                	add	a7,a7,a3
800003dc:	0008c383          	lbu	t2,0(a7)
800003e0:	82c6                	mv	t0,a7
800003e2:	0705                	add	a4,a4,1
800003e4:	fe770fa3          	sb	t2,-1(a4)
800003e8:	18fd                	add	a7,a7,-1
800003ea:	fe5699e3          	bne	a3,t0,800003dc <vformat+0x186>
800003ee:	981a                	add	a6,a6,t1
800003f0:	01058733          	add	a4,a1,a6
800003f4:	b731                	j	80000300 <vformat+0xaa>
800003f6:	00062283          	lw	t0,0(a2)
800003fa:	0611                	add	a2,a2,4
800003fc:	0002c883          	lbu	a7,0(t0)
80000400:	f00880e3          	beqz	a7,80000300 <vformat+0xaa>
80000404:	4681                	li	a3,0
80000406:	00d70333          	add	t1,a4,a3
8000040a:	0685                	add	a3,a3,1
8000040c:	01130023          	sb	a7,0(t1)
80000410:	00d288b3          	add	a7,t0,a3
80000414:	0008c883          	lbu	a7,0(a7)
80000418:	fe0897e3          	bnez	a7,80000406 <vformat+0x1b0>
8000041c:	9836                	add	a6,a6,a3
8000041e:	01058733          	add	a4,a1,a6
80000422:	bdf9                	j	80000300 <vformat+0xaa>
80000424:	00062883          	lw	a7,0(a2)
80000428:	0611                	add	a2,a2,4
8000042a:	0c08c263          	bltz	a7,800004ee <vformat+0x298>
8000042e:	0c089963          	bnez	a7,80000500 <vformat+0x2aa>
80000432:	03000693          	li	a3,48
80000436:	00d70023          	sb	a3,0(a4)
8000043a:	4385                	li	t2,1
8000043c:	981e                	add	a6,a6,t2
8000043e:	01058733          	add	a4,a1,a6
80000442:	bd7d                	j	80000300 <vformat+0xaa>
80000444:	4214                	lw	a3,0(a2)
80000446:	0805                	add	a6,a6,1
80000448:	0611                	add	a2,a2,4
8000044a:	00d70023          	sb	a3,0(a4)
8000044e:	01058733          	add	a4,a1,a6
80000452:	b57d                	j	80000300 <vformat+0xaa>
80000454:	00062303          	lw	t1,0(a2)
80000458:	03000693          	li	a3,48
8000045c:	06200893          	li	a7,98
80000460:	0809                	add	a6,a6,2
80000462:	00d70023          	sb	a3,0(a4)
80000466:	011700a3          	sb	a7,1(a4)
8000046a:	0611                	add	a2,a2,4
8000046c:	010583b3          	add	t2,a1,a6
80000470:	06030863          	beqz	t1,800004e0 <vformat+0x28a>
80000474:	4881                	li	a7,0
80000476:	868a                	mv	a3,sp
80000478:	ff018293          	add	t0,gp,-16 # 80000a40 <table>
8000047c:	00137713          	and	a4,t1,1
80000480:	9716                	add	a4,a4,t0
80000482:	00074483          	lbu	s1,0(a4)
80000486:	8746                	mv	a4,a7
80000488:	0885                	add	a7,a7,1
8000048a:	01168433          	add	s0,a3,a7
8000048e:	fe940fa3          	sb	s1,-1(s0)
80000492:	00135313          	srl	t1,t1,0x1
80000496:	fe0313e3          	bnez	t1,8000047c <vformat+0x226>
8000049a:	9736                	add	a4,a4,a3
8000049c:	831e                	mv	t1,t2
8000049e:	00074383          	lbu	t2,0(a4)
800004a2:	82ba                	mv	t0,a4
800004a4:	0305                	add	t1,t1,1
800004a6:	fe730fa3          	sb	t2,-1(t1)
800004aa:	177d                	add	a4,a4,-1
800004ac:	fe5699e3          	bne	a3,t0,8000049e <vformat+0x248>
800004b0:	9846                	add	a6,a6,a7
800004b2:	01058733          	add	a4,a1,a6
800004b6:	b5a9                	j	80000300 <vformat+0xaa>
800004b8:	00280693          	add	a3,a6,2
800004bc:	01d70023          	sb	t4,0(a4)
800004c0:	01d700a3          	sb	t4,1(a4)
800004c4:	080d                	add	a6,a6,3
800004c6:	00d58733          	add	a4,a1,a3
800004ca:	01d70023          	sb	t4,0(a4)
800004ce:	01058733          	add	a4,a1,a6
800004d2:	bd05                	j	80000302 <vformat+0xac>
800004d4:	0805                	add	a6,a6,1
800004d6:	01c70023          	sb	t3,0(a4)
800004da:	01058733          	add	a4,a1,a6
800004de:	b50d                	j	80000300 <vformat+0xaa>
800004e0:	4885                	li	a7,1
800004e2:	9846                	add	a6,a6,a7
800004e4:	00d38023          	sb	a3,0(t2)
800004e8:	01058733          	add	a4,a1,a6
800004ec:	bd11                	j	80000300 <vformat+0xaa>
800004ee:	0805                	add	a6,a6,1
800004f0:	02d00693          	li	a3,45
800004f4:	00d70023          	sb	a3,0(a4)
800004f8:	411008b3          	neg	a7,a7
800004fc:	01058333          	add	t1,a1,a6
80000500:	4381                	li	t2,0
80000502:	868a                	mv	a3,sp
80000504:	ff018293          	add	t0,gp,-16 # 80000a40 <table>
80000508:	44a9                	li	s1,10
8000050a:	4a25                	li	s4,9
8000050c:	0298f433          	remu	s0,a7,s1
80000510:	871e                	mv	a4,t2
80000512:	0385                	add	t2,t2,1
80000514:	007689b3          	add	s3,a3,t2
80000518:	8946                	mv	s2,a7
8000051a:	9416                	add	s0,s0,t0
8000051c:	00044403          	lbu	s0,0(s0)
80000520:	0298d8b3          	divu	a7,a7,s1
80000524:	fe898fa3          	sb	s0,-1(s3)
80000528:	ff2a62e3          	bltu	s4,s2,8000050c <vformat+0x2b6>
8000052c:	9736                	add	a4,a4,a3
8000052e:	00074283          	lbu	t0,0(a4)
80000532:	88ba                	mv	a7,a4
80000534:	0305                	add	t1,t1,1
80000536:	fe530fa3          	sb	t0,-1(t1)
8000053a:	177d                	add	a4,a4,-1
8000053c:	ff1699e3          	bne	a3,a7,8000052e <vformat+0x2d8>
80000540:	bdf5                	j	8000043c <vformat+0x1e6>
80000542:	00280693          	add	a3,a6,2
80000546:	01d70023          	sb	t4,0(a4)
8000054a:	01d700a3          	sb	t4,1(a4)
8000054e:	080d                	add	a6,a6,3
80000550:	00d58733          	add	a4,a1,a3
80000554:	01d70023          	sb	t4,0(a4)
80000558:	01058733          	add	a4,a1,a6
8000055c:	b31d                	j	80000282 <vformat+0x2c>
8000055e:	03000693          	li	a3,48
80000562:	00d70023          	sb	a3,0(a4)
80000566:	4305                	li	t1,1
80000568:	b559                	j	800003ee <vformat+0x198>
8000056a:	0805                	add	a6,a6,1
8000056c:	01c70023          	sb	t3,0(a4)
80000570:	0785                	add	a5,a5,1
80000572:	01058733          	add	a4,a1,a6
80000576:	b331                	j	80000282 <vformat+0x2c>
80000578:	03f00893          	li	a7,63
8000057c:	00280693          	add	a3,a6,2
80000580:	01170023          	sb	a7,0(a4)
80000584:	011700a3          	sb	a7,1(a4)
80000588:	080d                	add	a6,a6,3
8000058a:	00d58733          	add	a4,a1,a3
8000058e:	01170023          	sb	a7,0(a4)
80000592:	0785                	add	a5,a5,1
80000594:	01058733          	add	a4,a1,a6
80000598:	b1ed                	j	80000282 <vformat+0x2c>

8000059a <vprint>:
8000059a:	7175                	add	sp,sp,-144
8000059c:	862e                	mv	a2,a1
8000059e:	858a                	mv	a1,sp
800005a0:	c706                	sw	ra,140(sp)
800005a2:	3955                	jal	80000256 <vformat>
800005a4:	00014783          	lbu	a5,0(sp)
800005a8:	cb89                	beqz	a5,800005ba <vprint+0x20>
800005aa:	00110713          	add	a4,sp,1
800005ae:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
800005b2:	00074783          	lbu	a5,0(a4)
800005b6:	0705                	add	a4,a4,1
800005b8:	fbfd                	bnez	a5,800005ae <vprint+0x14>
800005ba:	40ba                	lw	ra,140(sp)
800005bc:	6149                	add	sp,sp,144
800005be:	8082                	ret

800005c0 <print>:
800005c0:	7139                	add	sp,sp,-64
800005c2:	02410313          	add	t1,sp,36
800005c6:	d22e                	sw	a1,36(sp)
800005c8:	859a                	mv	a1,t1
800005ca:	ce06                	sw	ra,28(sp)
800005cc:	d432                	sw	a2,40(sp)
800005ce:	d636                	sw	a3,44(sp)
800005d0:	d83a                	sw	a4,48(sp)
800005d2:	da3e                	sw	a5,52(sp)
800005d4:	dc42                	sw	a6,56(sp)
800005d6:	de46                	sw	a7,60(sp)
800005d8:	c61a                	sw	t1,12(sp)
800005da:	37c1                	jal	8000059a <vprint>
800005dc:	40f2                	lw	ra,28(sp)
800005de:	6121                	add	sp,sp,64
800005e0:	8082                	ret

800005e2 <format>:
800005e2:	7139                	add	sp,sp,-64
800005e4:	02810313          	add	t1,sp,40
800005e8:	d432                	sw	a2,40(sp)
800005ea:	861a                	mv	a2,t1
800005ec:	ce06                	sw	ra,28(sp)
800005ee:	d636                	sw	a3,44(sp)
800005f0:	d83a                	sw	a4,48(sp)
800005f2:	da3e                	sw	a5,52(sp)
800005f4:	dc42                	sw	a6,56(sp)
800005f6:	de46                	sw	a7,60(sp)
800005f8:	c61a                	sw	t1,12(sp)
800005fa:	39b1                	jal	80000256 <vformat>
800005fc:	40f2                	lw	ra,28(sp)
800005fe:	6121                	add	sp,sp,64
80000600:	8082                	ret

80000602 <dprint>:
80000602:	1101                	add	sp,sp,-32
80000604:	c22e                	sw	a1,4(sp)
80000606:	c432                	sw	a2,8(sp)
80000608:	c636                	sw	a3,12(sp)
8000060a:	c83a                	sw	a4,16(sp)
8000060c:	ca3e                	sw	a5,20(sp)
8000060e:	cc42                	sw	a6,24(sp)
80000610:	ce46                	sw	a7,28(sp)
80000612:	6105                	add	sp,sp,32
80000614:	8082                	ret

80000616 <advance_mepc>:
80000616:	341027f3          	csrr	a5,mepc
8000061a:	953e                	add	a0,a0,a5
8000061c:	34151073          	csrw	mepc,a0
80000620:	8082                	ret

80000622 <set_mepc>:
80000622:	34151073          	csrw	mepc,a0
80000626:	8082                	ret

80000628 <advance_sepc>:
80000628:	141027f3          	csrr	a5,sepc
8000062c:	953e                	add	a0,a0,a5
8000062e:	14151073          	csrw	sepc,a0
80000632:	8082                	ret

80000634 <set_sepc>:
80000634:	14151073          	csrw	sepc,a0
80000638:	8082                	ret

8000063a <setup_interrupts_m>:
8000063a:	30551073          	csrw	mtvec,a0
8000063e:	30459073          	csrw	mie,a1
80000642:	8082                	ret

80000644 <setup_interrupt_m_vectored>:
80000644:	00156513          	or	a0,a0,1
80000648:	30551073          	csrw	mtvec,a0
8000064c:	30459073          	csrw	mie,a1
80000650:	8082                	ret

80000652 <enable_interrupts_m>:
80000652:	47a1                	li	a5,8
80000654:	3007a073          	csrs	mstatus,a5
80000658:	8082                	ret

8000065a <disable_interrupts_m>:
8000065a:	47a1                	li	a5,8
8000065c:	3007b073          	csrc	mstatus,a5
80000660:	8082                	ret

80000662 <enable_interrupts_save_m>:
80000662:	30051073          	csrw	mstatus,a0
80000666:	8082                	ret

80000668 <disable_interrupts_save_m>:
80000668:	4521                	li	a0,8
8000066a:	30053573          	csrrc	a0,mstatus,a0
8000066e:	8082                	ret

80000670 <check_supervisor_mode_available>:
80000670:	6785                	lui	a5,0x1
80000672:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
80000676:	3007a573          	csrrs	a0,mstatus,a5
8000067a:	30051573          	csrrw	a0,mstatus,a0
8000067e:	6789                	lui	a5,0x2
80000680:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
80000684:	8d7d                	and	a0,a0,a5
80000686:	80050513          	add	a0,a0,-2048
8000068a:	00153513          	seqz	a0,a0
8000068e:	8082                	ret

80000690 <require_supervisor_mode>:
80000690:	6785                	lui	a5,0x1
80000692:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
80000696:	3007a7f3          	csrrs	a5,mstatus,a5
8000069a:	300797f3          	csrrw	a5,mstatus,a5
8000069e:	6709                	lui	a4,0x2
800006a0:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
800006a4:	8ff9                	and	a5,a5,a4
800006a6:	80078793          	add	a5,a5,-2048
800006aa:	e391                	bnez	a5,800006ae <require_supervisor_mode+0x1e>
800006ac:	8082                	ret
800006ae:	1141                	add	sp,sp,-16
800006b0:	00000517          	auipc	a0,0x0
800006b4:	20850513          	add	a0,a0,520 # 800008b8 <fromhost+0x3c>
800006b8:	c606                	sw	ra,12(sp)
800006ba:	3719                	jal	800005c0 <print>
800006bc:	57fd                	li	a5,-1
800006be:	e2f1a223          	sw	a5,-476(gp) # 80000874 <flag>
800006c2:	3ae9                	jal	8000009c <done>

800006c4 <read_exception_context>:
800006c4:	c00027f3          	rdcycle	a5
800006c8:	c55c                	sw	a5,12(a0)
800006ca:	c01027f3          	rdtime	a5
800006ce:	c91c                	sw	a5,16(a0)
800006d0:	342027f3          	csrr	a5,mcause
800006d4:	c51c                	sw	a5,8(a0)
800006d6:	341027f3          	csrr	a5,mepc
800006da:	c11c                	sw	a5,0(a0)
800006dc:	343027f3          	csrr	a5,mtval
800006e0:	c15c                	sw	a5,4(a0)
800006e2:	c03027f3          	csrr	a5,hpmcounter3
800006e6:	c95c                	sw	a5,20(a0)
800006e8:	c04027f3          	csrr	a5,hpmcounter4
800006ec:	cd1c                	sw	a5,24(a0)
800006ee:	8082                	ret

800006f0 <read_exception_context_s>:
800006f0:	c00027f3          	rdcycle	a5
800006f4:	c55c                	sw	a5,12(a0)
800006f6:	c01027f3          	rdtime	a5
800006fa:	c91c                	sw	a5,16(a0)
800006fc:	142027f3          	csrr	a5,scause
80000700:	c51c                	sw	a5,8(a0)
80000702:	141027f3          	csrr	a5,sepc
80000706:	c11c                	sw	a5,0(a0)
80000708:	143027f3          	csrr	a5,stval
8000070c:	c15c                	sw	a5,4(a0)
8000070e:	c03027f3          	csrr	a5,hpmcounter3
80000712:	c95c                	sw	a5,20(a0)
80000714:	c04027f3          	csrr	a5,hpmcounter4
80000718:	cd1c                	sw	a5,24(a0)
8000071a:	8082                	ret

8000071c <print_exception_context>:
8000071c:	1141                	add	sp,sp,-16
8000071e:	c422                	sw	s0,8(sp)
80000720:	842a                	mv	s0,a0
80000722:	00000517          	auipc	a0,0x0
80000726:	1ba50513          	add	a0,a0,442 # 800008dc <fromhost+0x60>
8000072a:	c606                	sw	ra,12(sp)
8000072c:	3d51                	jal	800005c0 <print>
8000072e:	440c                	lw	a1,8(s0)
80000730:	00000517          	auipc	a0,0x0
80000734:	1c450513          	add	a0,a0,452 # 800008f4 <fromhost+0x78>
80000738:	3561                	jal	800005c0 <print>
8000073a:	400c                	lw	a1,0(s0)
8000073c:	00000517          	auipc	a0,0x0
80000740:	1c850513          	add	a0,a0,456 # 80000904 <fromhost+0x88>
80000744:	3db5                	jal	800005c0 <print>
80000746:	404c                	lw	a1,4(s0)
80000748:	00000517          	auipc	a0,0x0
8000074c:	1cc50513          	add	a0,a0,460 # 80000914 <fromhost+0x98>
80000750:	3d85                	jal	800005c0 <print>
80000752:	444c                	lw	a1,12(s0)
80000754:	00000517          	auipc	a0,0x0
80000758:	1d050513          	add	a0,a0,464 # 80000924 <fromhost+0xa8>
8000075c:	3595                	jal	800005c0 <print>
8000075e:	480c                	lw	a1,16(s0)
80000760:	00000517          	auipc	a0,0x0
80000764:	1d450513          	add	a0,a0,468 # 80000934 <fromhost+0xb8>
80000768:	3da1                	jal	800005c0 <print>
8000076a:	484c                	lw	a1,20(s0)
8000076c:	00000517          	auipc	a0,0x0
80000770:	1d850513          	add	a0,a0,472 # 80000944 <fromhost+0xc8>
80000774:	35b1                	jal	800005c0 <print>
80000776:	4c0c                	lw	a1,24(s0)
80000778:	4422                	lw	s0,8(sp)
8000077a:	40b2                	lw	ra,12(sp)
8000077c:	00000517          	auipc	a0,0x0
80000780:	1d850513          	add	a0,a0,472 # 80000954 <fromhost+0xd8>
80000784:	0141                	add	sp,sp,16
80000786:	bd2d                	j	800005c0 <print>

80000788 <default_handler>:
80000788:	711d                	add	sp,sp,-96
8000078a:	c6aa                	sw	a0,76(sp)
8000078c:	0048                	add	a0,sp,4
8000078e:	ce86                	sw	ra,92(sp)
80000790:	cc96                	sw	t0,88(sp)
80000792:	ca9a                	sw	t1,84(sp)
80000794:	c89e                	sw	t2,80(sp)
80000796:	c4ae                	sw	a1,72(sp)
80000798:	c2b2                	sw	a2,68(sp)
8000079a:	c0b6                	sw	a3,64(sp)
8000079c:	de3a                	sw	a4,60(sp)
8000079e:	dc3e                	sw	a5,56(sp)
800007a0:	da42                	sw	a6,52(sp)
800007a2:	d846                	sw	a7,48(sp)
800007a4:	d672                	sw	t3,44(sp)
800007a6:	d476                	sw	t4,40(sp)
800007a8:	d27a                	sw	t5,36(sp)
800007aa:	d07e                	sw	t6,32(sp)
800007ac:	3f21                	jal	800006c4 <read_exception_context>
800007ae:	0048                	add	a0,sp,4
800007b0:	37b5                	jal	8000071c <print_exception_context>
800007b2:	00000517          	auipc	a0,0x0
800007b6:	1b250513          	add	a0,a0,434 # 80000964 <fromhost+0xe8>
800007ba:	3519                	jal	800005c0 <print>
800007bc:	8e1ff0ef          	jal	8000009c <done>

800007c0 <unreachable_handler>:
800007c0:	711d                	add	sp,sp,-96
800007c2:	c6aa                	sw	a0,76(sp)
800007c4:	0048                	add	a0,sp,4
800007c6:	ce86                	sw	ra,92(sp)
800007c8:	cc96                	sw	t0,88(sp)
800007ca:	ca9a                	sw	t1,84(sp)
800007cc:	c89e                	sw	t2,80(sp)
800007ce:	c4ae                	sw	a1,72(sp)
800007d0:	c2b2                	sw	a2,68(sp)
800007d2:	c0b6                	sw	a3,64(sp)
800007d4:	de3a                	sw	a4,60(sp)
800007d6:	dc3e                	sw	a5,56(sp)
800007d8:	da42                	sw	a6,52(sp)
800007da:	d846                	sw	a7,48(sp)
800007dc:	d672                	sw	t3,44(sp)
800007de:	d476                	sw	t4,40(sp)
800007e0:	d27a                	sw	t5,36(sp)
800007e2:	d07e                	sw	t6,32(sp)
800007e4:	35c5                	jal	800006c4 <read_exception_context>
800007e6:	0048                	add	a0,sp,4
800007e8:	3f15                	jal	8000071c <print_exception_context>
800007ea:	00000517          	auipc	a0,0x0
800007ee:	1a650513          	add	a0,a0,422 # 80000990 <fromhost+0x114>
800007f2:	33f9                	jal	800005c0 <print>
800007f4:	8a9ff0ef          	jal	8000009c <done>

800007f8 <test_pass>:
800007f8:	1141                	add	sp,sp,-16
800007fa:	85aa                	mv	a1,a0
800007fc:	00000517          	auipc	a0,0x0
80000800:	1e450513          	add	a0,a0,484 # 800009e0 <fromhost+0x164>
80000804:	c606                	sw	ra,12(sp)
80000806:	3b6d                	jal	800005c0 <print>
80000808:	40b2                	lw	ra,12(sp)
8000080a:	4785                	li	a5,1
8000080c:	e2f1a223          	sw	a5,-476(gp) # 80000874 <flag>
80000810:	0141                	add	sp,sp,16
80000812:	8082                	ret

80000814 <test_fail>:
80000814:	1141                	add	sp,sp,-16
80000816:	85aa                	mv	a1,a0
80000818:	00000517          	auipc	a0,0x0
8000081c:	1c850513          	add	a0,a0,456 # 800009e0 <fromhost+0x164>
80000820:	c606                	sw	ra,12(sp)
80000822:	3b79                	jal	800005c0 <print>
80000824:	40b2                	lw	ra,12(sp)
80000826:	e201a223          	sw	zero,-476(gp) # 80000874 <flag>
8000082a:	0141                	add	sp,sp,16
8000082c:	8082                	ret
	...

80000830 <vector_table>:
80000830:	f59ff06f          	j	80000788 <default_handler>
80000834:	f55ff06f          	j	80000788 <default_handler>
80000838:	f89ff06f          	j	800007c0 <unreachable_handler>
8000083c:	f4dff06f          	j	80000788 <default_handler>
80000840:	f81ff06f          	j	800007c0 <unreachable_handler>
80000844:	f45ff06f          	j	80000788 <default_handler>
80000848:	f79ff06f          	j	800007c0 <unreachable_handler>
8000084c:	f3dff06f          	j	80000788 <default_handler>
80000850:	f71ff06f          	j	800007c0 <unreachable_handler>
80000854:	f35ff06f          	j	80000788 <default_handler>
80000858:	f69ff06f          	j	800007c0 <unreachable_handler>
8000085c:	f2dff06f          	j	80000788 <default_handler>
80000860:	f61ff06f          	j	800007c0 <unreachable_handler>
80000864:	f25ff06f          	j	80000788 <default_handler>
80000868:	f59ff06f          	j	800007c0 <unreachable_handler>
8000086c:	f55ff06f          	j	800007c0 <unreachable_handler>
	...
