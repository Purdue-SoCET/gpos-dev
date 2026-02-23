
build/s-mode/csr:     file format elf32-littleriscv


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
8000004a:	a3618193          	add	gp,gp,-1482 # 80000a7c <__bss_end>

8000004e <clr_bss>:
8000004e:	00018293          	mv	t0,gp
80000052:	00018313          	mv	t1,gp
80000056:	00628763          	beq	t0,t1,80000064 <do_preinit_arr>

8000005a <clr_bss_loop>:
8000005a:	00028023          	sb	zero,0(t0)
8000005e:	0285                	add	t0,t0,1
80000060:	fe535de3          	bge	t1,t0,8000005a <clr_bss_loop>

80000064 <do_preinit_arr>:
80000064:	e2618413          	add	s0,gp,-474 # 800008a2 <__init_array_end>
80000068:	e2618493          	add	s1,gp,-474 # 800008a2 <__init_array_end>
8000006c:	00940963          	beq	s0,s1,8000007e <do_init_arr>

80000070 <preinit_arr_calls>:
80000070:	00042903          	lw	s2,0(s0)
80000074:	000900e7          	jalr	s2
80000078:	0411                	add	s0,s0,4
8000007a:	fe941be3          	bne	s0,s1,80000070 <preinit_arr_calls>

8000007e <do_init_arr>:
8000007e:	e2618413          	add	s0,gp,-474 # 800008a2 <__init_array_end>
80000082:	e2618493          	add	s1,gp,-474 # 800008a2 <__init_array_end>
80000086:	00940963          	beq	s0,s1,80000098 <enter_main>

8000008a <init_arr_calls>:
8000008a:	00042903          	lw	s2,0(s0)
8000008e:	000900e7          	jalr	s2
80000092:	0411                	add	s0,s0,4
80000094:	fc941ee3          	bne	s0,s1,80000070 <preinit_arr_calls>

80000098 <enter_main>:
80000098:	122000ef          	jal	800001ba <main>

8000009c <done>:
8000009c:	e2818d93          	add	s11,gp,-472 # 800008a4 <flag>
800000a0:	000dae03          	lw	t3,0(s11)
800000a4:	e2c18d93          	add	s11,gp,-468 # 800008a8 <tohost>
800000a8:	01cda023          	sw	t3,0(s11)

800000ac <__sim_halt>:
800000ac:	a001                	j	800000ac <__sim_halt>
	...

800000b0 <s_mode_handler>:
800000b0:	711d                	add	sp,sp,-96
800000b2:	c6aa                	sw	a0,76(sp)
800000b4:	0048                	add	a0,sp,4
800000b6:	de3a                	sw	a4,60(sp)
800000b8:	dc3e                	sw	a5,56(sp)
800000ba:	ce86                	sw	ra,92(sp)
800000bc:	cc96                	sw	t0,88(sp)
800000be:	ca9a                	sw	t1,84(sp)
800000c0:	c89e                	sw	t2,80(sp)
800000c2:	c4ae                	sw	a1,72(sp)
800000c4:	c2b2                	sw	a2,68(sp)
800000c6:	c0b6                	sw	a3,64(sp)
800000c8:	da42                	sw	a6,52(sp)
800000ca:	d846                	sw	a7,48(sp)
800000cc:	d672                	sw	t3,44(sp)
800000ce:	d476                	sw	t4,40(sp)
800000d0:	d27a                	sw	t5,36(sp)
800000d2:	d07e                	sw	t6,32(sp)
800000d4:	2591                	jal	80000718 <read_exception_context_s>
800000d6:	0048                	add	a0,sp,4
800000d8:	25b5                	jal	80000744 <print_exception_context>
800000da:	4732                	lw	a4,12(sp)
800000dc:	47a1                	li	a5,8
800000de:	02f70e63          	beq	a4,a5,8000011a <s_mode_handler+0x6a>
800000e2:	4511                	li	a0,4
800000e4:	23b5                	jal	80000650 <advance_sepc>
800000e6:	e2818713          	add	a4,gp,-472 # 800008a4 <flag>
800000ea:	431c                	lw	a5,0(a4)
800000ec:	17fd                	add	a5,a5,-1
800000ee:	c31c                	sw	a5,0(a4)
800000f0:	10200073          	sret
800000f4:	40f6                	lw	ra,92(sp)
800000f6:	42e6                	lw	t0,88(sp)
800000f8:	4356                	lw	t1,84(sp)
800000fa:	43c6                	lw	t2,80(sp)
800000fc:	4536                	lw	a0,76(sp)
800000fe:	45a6                	lw	a1,72(sp)
80000100:	4616                	lw	a2,68(sp)
80000102:	4686                	lw	a3,64(sp)
80000104:	5772                	lw	a4,60(sp)
80000106:	57e2                	lw	a5,56(sp)
80000108:	5852                	lw	a6,52(sp)
8000010a:	58c2                	lw	a7,48(sp)
8000010c:	5e32                	lw	t3,44(sp)
8000010e:	5ea2                	lw	t4,40(sp)
80000110:	5f12                	lw	t5,36(sp)
80000112:	5f82                	lw	t6,32(sp)
80000114:	6125                	add	sp,sp,96
80000116:	30200073          	mret
8000011a:	10000793          	li	a5,256
8000011e:	1007a073          	csrs	sstatus,a5
80000122:	00000517          	auipc	a0,0x0
80000126:	f7a50513          	add	a0,a0,-134 # 8000009c <done>
8000012a:	2b0d                	jal	8000065c <set_sepc>
8000012c:	b7d1                	j	800000f0 <s_mode_handler+0x40>

8000012e <user_main>:
8000012e:	c00027f3          	rdcycle	a5
80000132:	c01027f3          	rdtime	a5
80000136:	00000073          	ecall
	...

8000013c <m_mode_handler>:
8000013c:	711d                	add	sp,sp,-96
8000013e:	c6aa                	sw	a0,76(sp)
80000140:	0048                	add	a0,sp,4
80000142:	de3a                	sw	a4,60(sp)
80000144:	dc3e                	sw	a5,56(sp)
80000146:	ce86                	sw	ra,92(sp)
80000148:	cc96                	sw	t0,88(sp)
8000014a:	ca9a                	sw	t1,84(sp)
8000014c:	c89e                	sw	t2,80(sp)
8000014e:	c4ae                	sw	a1,72(sp)
80000150:	c2b2                	sw	a2,68(sp)
80000152:	c0b6                	sw	a3,64(sp)
80000154:	da42                	sw	a6,52(sp)
80000156:	d846                	sw	a7,48(sp)
80000158:	d672                	sw	t3,44(sp)
8000015a:	d476                	sw	t4,40(sp)
8000015c:	d27a                	sw	t5,36(sp)
8000015e:	d07e                	sw	t6,32(sp)
80000160:	2371                	jal	800006ec <read_exception_context>
80000162:	0048                	add	a0,sp,4
80000164:	23c5                	jal	80000744 <print_exception_context>
80000166:	4732                	lw	a4,12(sp)
80000168:	47a5                	li	a5,9
8000016a:	02f70c63          	beq	a4,a5,800001a2 <m_mode_handler+0x66>
8000016e:	4511                	li	a0,4
80000170:	21f9                	jal	8000063e <advance_mepc>
80000172:	e2818713          	add	a4,gp,-472 # 800008a4 <flag>
80000176:	431c                	lw	a5,0(a4)
80000178:	17fd                	add	a5,a5,-1
8000017a:	c31c                	sw	a5,0(a4)
8000017c:	40f6                	lw	ra,92(sp)
8000017e:	42e6                	lw	t0,88(sp)
80000180:	4356                	lw	t1,84(sp)
80000182:	43c6                	lw	t2,80(sp)
80000184:	4536                	lw	a0,76(sp)
80000186:	45a6                	lw	a1,72(sp)
80000188:	4616                	lw	a2,68(sp)
8000018a:	4686                	lw	a3,64(sp)
8000018c:	5772                	lw	a4,60(sp)
8000018e:	57e2                	lw	a5,56(sp)
80000190:	5852                	lw	a6,52(sp)
80000192:	58c2                	lw	a7,48(sp)
80000194:	5e32                	lw	t3,44(sp)
80000196:	5ea2                	lw	t4,40(sp)
80000198:	5f12                	lw	t5,36(sp)
8000019a:	5f82                	lw	t6,32(sp)
8000019c:	6125                	add	sp,sp,96
8000019e:	30200073          	mret
800001a2:	6789                	lui	a5,0x2
800001a4:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
800001a8:	3007a073          	csrs	mstatus,a5
800001ac:	00000517          	auipc	a0,0x0
800001b0:	ef050513          	add	a0,a0,-272 # 8000009c <done>
800001b4:	2959                	jal	8000064a <set_mepc>
800001b6:	b7d9                	j	8000017c <m_mode_handler+0x40>
	...

800001ba <main>:
800001ba:	1141                	add	sp,sp,-16
800001bc:	c606                	sw	ra,12(sp)
800001be:	c422                	sw	s0,8(sp)
800001c0:	29e5                	jal	800006b8 <require_supervisor_mode>
800001c2:	00000797          	auipc	a5,0x0
800001c6:	f7a78793          	add	a5,a5,-134 # 8000013c <m_mode_handler>
800001ca:	30579073          	csrw	mtvec,a5
800001ce:	47a1                	li	a5,8
800001d0:	3007a073          	csrs	mstatus,a5
800001d4:	00000717          	auipc	a4,0x0
800001d8:	edc70713          	add	a4,a4,-292 # 800000b0 <s_mode_handler>
800001dc:	10571073          	csrw	stvec,a4
800001e0:	1007a073          	csrs	sstatus,a5
800001e4:	e2818413          	add	s0,gp,-472 # 800008a4 <flag>
800001e8:	00245793          	srl	a5,s0,0x2
800001ec:	3b079073          	csrw	pmpaddr0,a5
800001f0:	3b002773          	csrr	a4,pmpaddr0
800001f4:	02e78363          	beq	a5,a4,8000021a <main+0x60>
800001f8:	00000517          	auipc	a0,0x0
800001fc:	6b850513          	add	a0,a0,1720 # 800008b0 <fromhost+0x4>
80000200:	26e5                	jal	800005e8 <print>
80000202:	6789                	lui	a5,0x2
80000204:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
80000208:	3007a073          	csrs	mstatus,a5
8000020c:	00000517          	auipc	a0,0x0
80000210:	e9050513          	add	a0,a0,-368 # 8000009c <done>
80000214:	291d                	jal	8000064a <set_mepc>
80000216:	30200073          	mret
8000021a:	57fd                	li	a5,-1
8000021c:	3b179073          	csrw	pmpaddr1,a5
80000220:	6789                	lui	a5,0x2
80000222:	f1778793          	add	a5,a5,-233 # 1f17 <boot-0x7fffe0e9>
80000226:	3a079073          	csrw	pmpcfg0,a5
8000022a:	4795                	li	a5,5
8000022c:	c01c                	sw	a5,0(s0)
8000022e:	4781                	li	a5,0
80000230:	b0079073          	csrw	mcycle,a5
80000234:	b0002773          	csrr	a4,mcycle
80000238:	0001                	nop
8000023a:	0001                	nop
8000023c:	0001                	nop
8000023e:	c00027f3          	rdcycle	a5
80000242:	46f5                	li	a3,29
80000244:	8f99                	sub	a5,a5,a4
80000246:	00f6e563          	bltu	a3,a5,80000250 <main+0x96>
8000024a:	401c                	lw	a5,0(s0)
8000024c:	17fd                	add	a5,a5,-1
8000024e:	c01c                	sw	a5,0(s0)
80000250:	c0071073          	csrw	cycle,a4
80000254:	57fd                	li	a5,-1
80000256:	30279073          	csrw	medeleg,a5
8000025a:	00000517          	auipc	a0,0x0
8000025e:	ed450513          	add	a0,a0,-300 # 8000012e <user_main>
80000262:	2eed                	jal	8000065c <set_sepc>
80000264:	10200073          	sret

80000268 <print_string>:
80000268:	00054783          	lbu	a5,0(a0)
8000026c:	cb81                	beqz	a5,8000027c <print_string+0x14>
8000026e:	0505                	add	a0,a0,1
80000270:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
80000274:	00054783          	lbu	a5,0(a0)
80000278:	0505                	add	a0,a0,1
8000027a:	fbfd                	bnez	a5,80000270 <print_string+0x8>
8000027c:	8082                	ret

8000027e <vformat>:
8000027e:	00054683          	lbu	a3,0(a0)
80000282:	ce85                	beqz	a3,800002ba <vformat+0x3c>
80000284:	4781                	li	a5,0
80000286:	4801                	li	a6,0
80000288:	4881                	li	a7,0
8000028a:	872e                	mv	a4,a1
8000028c:	02500e13          	li	t3,37
80000290:	03f00e93          	li	t4,63
80000294:	4fd9                	li	t6,22
80000296:	f9418f13          	add	t5,gp,-108 # 80000a10 <fromhost+0x164>
8000029a:	833a                	mv	t1,a4
8000029c:	03c68263          	beq	a3,t3,800002c0 <vformat+0x42>
800002a0:	0805                	add	a6,a6,1
800002a2:	00d70023          	sb	a3,0(a4)
800002a6:	01058733          	add	a4,a1,a6
800002aa:	0785                	add	a5,a5,1
800002ac:	00f506b3          	add	a3,a0,a5
800002b0:	0006c683          	lbu	a3,0(a3)
800002b4:	88be                	mv	a7,a5
800002b6:	f2f5                	bnez	a3,8000029a <vformat+0x1c>
800002b8:	85ba                	mv	a1,a4
800002ba:	00058023          	sb	zero,0(a1)
800002be:	8082                	ret
800002c0:	98aa                	add	a7,a7,a0
800002c2:	0018c683          	lbu	a3,1(a7)
800002c6:	2a068263          	beqz	a3,8000056a <vformat+0x2ec>
800002ca:	2dc68463          	beq	a3,t3,80000592 <vformat+0x314>
800002ce:	f9e68693          	add	a3,a3,-98
800002d2:	0ff6f693          	zext.b	a3,a3
800002d6:	2cdfe563          	bltu	t6,a3,800005a0 <vformat+0x322>
800002da:	7139                	add	sp,sp,-64
800002dc:	de22                	sw	s0,60(sp)
800002de:	dc26                	sw	s1,56(sp)
800002e0:	da4a                	sw	s2,52(sp)
800002e2:	d84e                	sw	s3,48(sp)
800002e4:	d652                	sw	s4,44(sp)
800002e6:	068a                	sll	a3,a3,0x2
800002e8:	96fa                	add	a3,a3,t5
800002ea:	4294                	lw	a3,0(a3)
800002ec:	96fa                	add	a3,a3,t5
800002ee:	8682                	jr	a3
800002f0:	98aa                	add	a7,a7,a0
800002f2:	0018c683          	lbu	a3,1(a7)
800002f6:	1e068563          	beqz	a3,800004e0 <vformat+0x262>
800002fa:	21c68163          	beq	a3,t3,800004fc <vformat+0x27e>
800002fe:	f9e68693          	add	a3,a3,-98
80000302:	0ff6f693          	zext.b	a3,a3
80000306:	fedff0e3          	bgeu	t6,a3,800002e6 <vformat+0x68>
8000030a:	03f00893          	li	a7,63
8000030e:	00280693          	add	a3,a6,2
80000312:	01170023          	sb	a7,0(a4)
80000316:	011700a3          	sb	a7,1(a4)
8000031a:	080d                	add	a6,a6,3
8000031c:	00d58733          	add	a4,a1,a3
80000320:	01170023          	sb	a7,0(a4)
80000324:	01058733          	add	a4,a1,a6
80000328:	0785                	add	a5,a5,1
8000032a:	0785                	add	a5,a5,1
8000032c:	00f506b3          	add	a3,a0,a5
80000330:	0006c683          	lbu	a3,0(a3)
80000334:	88be                	mv	a7,a5
80000336:	c285                	beqz	a3,80000356 <vformat+0xd8>
80000338:	833a                	mv	t1,a4
8000033a:	fbc68be3          	beq	a3,t3,800002f0 <vformat+0x72>
8000033e:	0785                	add	a5,a5,1
80000340:	00d70023          	sb	a3,0(a4)
80000344:	00f506b3          	add	a3,a0,a5
80000348:	0006c683          	lbu	a3,0(a3)
8000034c:	0805                	add	a6,a6,1
8000034e:	01058733          	add	a4,a1,a6
80000352:	88be                	mv	a7,a5
80000354:	f2f5                	bnez	a3,80000338 <vformat+0xba>
80000356:	00070023          	sb	zero,0(a4)
8000035a:	5472                	lw	s0,60(sp)
8000035c:	54e2                	lw	s1,56(sp)
8000035e:	5952                	lw	s2,52(sp)
80000360:	59c2                	lw	s3,48(sp)
80000362:	5a32                	lw	s4,44(sp)
80000364:	6121                	add	sp,sp,64
80000366:	8082                	ret
80000368:	00062303          	lw	t1,0(a2)
8000036c:	03000693          	li	a3,48
80000370:	07800893          	li	a7,120
80000374:	0809                	add	a6,a6,2
80000376:	00d70023          	sb	a3,0(a4)
8000037a:	011700a3          	sb	a7,1(a4)
8000037e:	0611                	add	a2,a2,4
80000380:	010583b3          	add	t2,a1,a6
80000384:	18030263          	beqz	t1,80000508 <vformat+0x28a>
80000388:	4881                	li	a7,0
8000038a:	868a                	mv	a3,sp
8000038c:	ff018293          	add	t0,gp,-16 # 80000a6c <table>
80000390:	00f37713          	and	a4,t1,15
80000394:	9716                	add	a4,a4,t0
80000396:	00074483          	lbu	s1,0(a4)
8000039a:	8746                	mv	a4,a7
8000039c:	0885                	add	a7,a7,1
8000039e:	01168433          	add	s0,a3,a7
800003a2:	fe940fa3          	sb	s1,-1(s0)
800003a6:	00435313          	srl	t1,t1,0x4
800003aa:	fe0313e3          	bnez	t1,80000390 <vformat+0x112>
800003ae:	9736                	add	a4,a4,a3
800003b0:	831e                	mv	t1,t2
800003b2:	00074383          	lbu	t2,0(a4)
800003b6:	82ba                	mv	t0,a4
800003b8:	0305                	add	t1,t1,1
800003ba:	fe730fa3          	sb	t2,-1(t1)
800003be:	177d                	add	a4,a4,-1
800003c0:	fe5699e3          	bne	a3,t0,800003b2 <vformat+0x134>
800003c4:	9846                	add	a6,a6,a7
800003c6:	01058733          	add	a4,a1,a6
800003ca:	bfb9                	j	80000328 <vformat+0xaa>
800003cc:	00062383          	lw	t2,0(a2)
800003d0:	0611                	add	a2,a2,4
800003d2:	1a038a63          	beqz	t2,80000586 <vformat+0x308>
800003d6:	4301                	li	t1,0
800003d8:	868a                	mv	a3,sp
800003da:	ff018293          	add	t0,gp,-16 # 80000a6c <table>
800003de:	44a9                	li	s1,10
800003e0:	4a25                	li	s4,9
800003e2:	0293f433          	remu	s0,t2,s1
800003e6:	889a                	mv	a7,t1
800003e8:	0305                	add	t1,t1,1
800003ea:	006689b3          	add	s3,a3,t1
800003ee:	891e                	mv	s2,t2
800003f0:	9416                	add	s0,s0,t0
800003f2:	00044403          	lbu	s0,0(s0)
800003f6:	0293d3b3          	divu	t2,t2,s1
800003fa:	fe898fa3          	sb	s0,-1(s3)
800003fe:	ff2a62e3          	bltu	s4,s2,800003e2 <vformat+0x164>
80000402:	98b6                	add	a7,a7,a3
80000404:	0008c383          	lbu	t2,0(a7)
80000408:	82c6                	mv	t0,a7
8000040a:	0705                	add	a4,a4,1
8000040c:	fe770fa3          	sb	t2,-1(a4)
80000410:	18fd                	add	a7,a7,-1
80000412:	fe5699e3          	bne	a3,t0,80000404 <vformat+0x186>
80000416:	981a                	add	a6,a6,t1
80000418:	01058733          	add	a4,a1,a6
8000041c:	b731                	j	80000328 <vformat+0xaa>
8000041e:	00062283          	lw	t0,0(a2)
80000422:	0611                	add	a2,a2,4
80000424:	0002c883          	lbu	a7,0(t0)
80000428:	f00880e3          	beqz	a7,80000328 <vformat+0xaa>
8000042c:	4681                	li	a3,0
8000042e:	00d70333          	add	t1,a4,a3
80000432:	0685                	add	a3,a3,1
80000434:	01130023          	sb	a7,0(t1)
80000438:	00d288b3          	add	a7,t0,a3
8000043c:	0008c883          	lbu	a7,0(a7)
80000440:	fe0897e3          	bnez	a7,8000042e <vformat+0x1b0>
80000444:	9836                	add	a6,a6,a3
80000446:	01058733          	add	a4,a1,a6
8000044a:	bdf9                	j	80000328 <vformat+0xaa>
8000044c:	00062883          	lw	a7,0(a2)
80000450:	0611                	add	a2,a2,4
80000452:	0c08c263          	bltz	a7,80000516 <vformat+0x298>
80000456:	0c089963          	bnez	a7,80000528 <vformat+0x2aa>
8000045a:	03000693          	li	a3,48
8000045e:	00d70023          	sb	a3,0(a4)
80000462:	4385                	li	t2,1
80000464:	981e                	add	a6,a6,t2
80000466:	01058733          	add	a4,a1,a6
8000046a:	bd7d                	j	80000328 <vformat+0xaa>
8000046c:	4214                	lw	a3,0(a2)
8000046e:	0805                	add	a6,a6,1
80000470:	0611                	add	a2,a2,4
80000472:	00d70023          	sb	a3,0(a4)
80000476:	01058733          	add	a4,a1,a6
8000047a:	b57d                	j	80000328 <vformat+0xaa>
8000047c:	00062303          	lw	t1,0(a2)
80000480:	03000693          	li	a3,48
80000484:	06200893          	li	a7,98
80000488:	0809                	add	a6,a6,2
8000048a:	00d70023          	sb	a3,0(a4)
8000048e:	011700a3          	sb	a7,1(a4)
80000492:	0611                	add	a2,a2,4
80000494:	010583b3          	add	t2,a1,a6
80000498:	06030863          	beqz	t1,80000508 <vformat+0x28a>
8000049c:	4881                	li	a7,0
8000049e:	868a                	mv	a3,sp
800004a0:	ff018293          	add	t0,gp,-16 # 80000a6c <table>
800004a4:	00137713          	and	a4,t1,1
800004a8:	9716                	add	a4,a4,t0
800004aa:	00074483          	lbu	s1,0(a4)
800004ae:	8746                	mv	a4,a7
800004b0:	0885                	add	a7,a7,1
800004b2:	01168433          	add	s0,a3,a7
800004b6:	fe940fa3          	sb	s1,-1(s0)
800004ba:	00135313          	srl	t1,t1,0x1
800004be:	fe0313e3          	bnez	t1,800004a4 <vformat+0x226>
800004c2:	9736                	add	a4,a4,a3
800004c4:	831e                	mv	t1,t2
800004c6:	00074383          	lbu	t2,0(a4)
800004ca:	82ba                	mv	t0,a4
800004cc:	0305                	add	t1,t1,1
800004ce:	fe730fa3          	sb	t2,-1(t1)
800004d2:	177d                	add	a4,a4,-1
800004d4:	fe5699e3          	bne	a3,t0,800004c6 <vformat+0x248>
800004d8:	9846                	add	a6,a6,a7
800004da:	01058733          	add	a4,a1,a6
800004de:	b5a9                	j	80000328 <vformat+0xaa>
800004e0:	00280693          	add	a3,a6,2
800004e4:	01d70023          	sb	t4,0(a4)
800004e8:	01d700a3          	sb	t4,1(a4)
800004ec:	080d                	add	a6,a6,3
800004ee:	00d58733          	add	a4,a1,a3
800004f2:	01d70023          	sb	t4,0(a4)
800004f6:	01058733          	add	a4,a1,a6
800004fa:	bd05                	j	8000032a <vformat+0xac>
800004fc:	0805                	add	a6,a6,1
800004fe:	01c70023          	sb	t3,0(a4)
80000502:	01058733          	add	a4,a1,a6
80000506:	b50d                	j	80000328 <vformat+0xaa>
80000508:	4885                	li	a7,1
8000050a:	9846                	add	a6,a6,a7
8000050c:	00d38023          	sb	a3,0(t2)
80000510:	01058733          	add	a4,a1,a6
80000514:	bd11                	j	80000328 <vformat+0xaa>
80000516:	0805                	add	a6,a6,1
80000518:	02d00693          	li	a3,45
8000051c:	00d70023          	sb	a3,0(a4)
80000520:	411008b3          	neg	a7,a7
80000524:	01058333          	add	t1,a1,a6
80000528:	4381                	li	t2,0
8000052a:	868a                	mv	a3,sp
8000052c:	ff018293          	add	t0,gp,-16 # 80000a6c <table>
80000530:	44a9                	li	s1,10
80000532:	4a25                	li	s4,9
80000534:	0298f433          	remu	s0,a7,s1
80000538:	871e                	mv	a4,t2
8000053a:	0385                	add	t2,t2,1
8000053c:	007689b3          	add	s3,a3,t2
80000540:	8946                	mv	s2,a7
80000542:	9416                	add	s0,s0,t0
80000544:	00044403          	lbu	s0,0(s0)
80000548:	0298d8b3          	divu	a7,a7,s1
8000054c:	fe898fa3          	sb	s0,-1(s3)
80000550:	ff2a62e3          	bltu	s4,s2,80000534 <vformat+0x2b6>
80000554:	9736                	add	a4,a4,a3
80000556:	00074283          	lbu	t0,0(a4)
8000055a:	88ba                	mv	a7,a4
8000055c:	0305                	add	t1,t1,1
8000055e:	fe530fa3          	sb	t0,-1(t1)
80000562:	177d                	add	a4,a4,-1
80000564:	ff1699e3          	bne	a3,a7,80000556 <vformat+0x2d8>
80000568:	bdf5                	j	80000464 <vformat+0x1e6>
8000056a:	00280693          	add	a3,a6,2
8000056e:	01d70023          	sb	t4,0(a4)
80000572:	01d700a3          	sb	t4,1(a4)
80000576:	080d                	add	a6,a6,3
80000578:	00d58733          	add	a4,a1,a3
8000057c:	01d70023          	sb	t4,0(a4)
80000580:	01058733          	add	a4,a1,a6
80000584:	b31d                	j	800002aa <vformat+0x2c>
80000586:	03000693          	li	a3,48
8000058a:	00d70023          	sb	a3,0(a4)
8000058e:	4305                	li	t1,1
80000590:	b559                	j	80000416 <vformat+0x198>
80000592:	0805                	add	a6,a6,1
80000594:	01c70023          	sb	t3,0(a4)
80000598:	0785                	add	a5,a5,1
8000059a:	01058733          	add	a4,a1,a6
8000059e:	b331                	j	800002aa <vformat+0x2c>
800005a0:	03f00893          	li	a7,63
800005a4:	00280693          	add	a3,a6,2
800005a8:	01170023          	sb	a7,0(a4)
800005ac:	011700a3          	sb	a7,1(a4)
800005b0:	080d                	add	a6,a6,3
800005b2:	00d58733          	add	a4,a1,a3
800005b6:	01170023          	sb	a7,0(a4)
800005ba:	0785                	add	a5,a5,1
800005bc:	01058733          	add	a4,a1,a6
800005c0:	b1ed                	j	800002aa <vformat+0x2c>

800005c2 <vprint>:
800005c2:	7175                	add	sp,sp,-144
800005c4:	862e                	mv	a2,a1
800005c6:	858a                	mv	a1,sp
800005c8:	c706                	sw	ra,140(sp)
800005ca:	3955                	jal	8000027e <vformat>
800005cc:	00014783          	lbu	a5,0(sp)
800005d0:	cb89                	beqz	a5,800005e2 <vprint+0x20>
800005d2:	00110713          	add	a4,sp,1
800005d6:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
800005da:	00074783          	lbu	a5,0(a4)
800005de:	0705                	add	a4,a4,1
800005e0:	fbfd                	bnez	a5,800005d6 <vprint+0x14>
800005e2:	40ba                	lw	ra,140(sp)
800005e4:	6149                	add	sp,sp,144
800005e6:	8082                	ret

800005e8 <print>:
800005e8:	7139                	add	sp,sp,-64
800005ea:	02410313          	add	t1,sp,36
800005ee:	d22e                	sw	a1,36(sp)
800005f0:	859a                	mv	a1,t1
800005f2:	ce06                	sw	ra,28(sp)
800005f4:	d432                	sw	a2,40(sp)
800005f6:	d636                	sw	a3,44(sp)
800005f8:	d83a                	sw	a4,48(sp)
800005fa:	da3e                	sw	a5,52(sp)
800005fc:	dc42                	sw	a6,56(sp)
800005fe:	de46                	sw	a7,60(sp)
80000600:	c61a                	sw	t1,12(sp)
80000602:	37c1                	jal	800005c2 <vprint>
80000604:	40f2                	lw	ra,28(sp)
80000606:	6121                	add	sp,sp,64
80000608:	8082                	ret

8000060a <format>:
8000060a:	7139                	add	sp,sp,-64
8000060c:	02810313          	add	t1,sp,40
80000610:	d432                	sw	a2,40(sp)
80000612:	861a                	mv	a2,t1
80000614:	ce06                	sw	ra,28(sp)
80000616:	d636                	sw	a3,44(sp)
80000618:	d83a                	sw	a4,48(sp)
8000061a:	da3e                	sw	a5,52(sp)
8000061c:	dc42                	sw	a6,56(sp)
8000061e:	de46                	sw	a7,60(sp)
80000620:	c61a                	sw	t1,12(sp)
80000622:	39b1                	jal	8000027e <vformat>
80000624:	40f2                	lw	ra,28(sp)
80000626:	6121                	add	sp,sp,64
80000628:	8082                	ret

8000062a <dprint>:
8000062a:	1101                	add	sp,sp,-32
8000062c:	c22e                	sw	a1,4(sp)
8000062e:	c432                	sw	a2,8(sp)
80000630:	c636                	sw	a3,12(sp)
80000632:	c83a                	sw	a4,16(sp)
80000634:	ca3e                	sw	a5,20(sp)
80000636:	cc42                	sw	a6,24(sp)
80000638:	ce46                	sw	a7,28(sp)
8000063a:	6105                	add	sp,sp,32
8000063c:	8082                	ret

8000063e <advance_mepc>:
8000063e:	341027f3          	csrr	a5,mepc
80000642:	953e                	add	a0,a0,a5
80000644:	34151073          	csrw	mepc,a0
80000648:	8082                	ret

8000064a <set_mepc>:
8000064a:	34151073          	csrw	mepc,a0
8000064e:	8082                	ret

80000650 <advance_sepc>:
80000650:	141027f3          	csrr	a5,sepc
80000654:	953e                	add	a0,a0,a5
80000656:	14151073          	csrw	sepc,a0
8000065a:	8082                	ret

8000065c <set_sepc>:
8000065c:	14151073          	csrw	sepc,a0
80000660:	8082                	ret

80000662 <setup_interrupts_m>:
80000662:	30551073          	csrw	mtvec,a0
80000666:	30459073          	csrw	mie,a1
8000066a:	8082                	ret

8000066c <setup_interrupt_m_vectored>:
8000066c:	00156513          	or	a0,a0,1
80000670:	30551073          	csrw	mtvec,a0
80000674:	30459073          	csrw	mie,a1
80000678:	8082                	ret

8000067a <enable_interrupts_m>:
8000067a:	47a1                	li	a5,8
8000067c:	3007a073          	csrs	mstatus,a5
80000680:	8082                	ret

80000682 <disable_interrupts_m>:
80000682:	47a1                	li	a5,8
80000684:	3007b073          	csrc	mstatus,a5
80000688:	8082                	ret

8000068a <enable_interrupts_save_m>:
8000068a:	30051073          	csrw	mstatus,a0
8000068e:	8082                	ret

80000690 <disable_interrupts_save_m>:
80000690:	4521                	li	a0,8
80000692:	30053573          	csrrc	a0,mstatus,a0
80000696:	8082                	ret

80000698 <check_supervisor_mode_available>:
80000698:	6785                	lui	a5,0x1
8000069a:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
8000069e:	3007a573          	csrrs	a0,mstatus,a5
800006a2:	30051573          	csrrw	a0,mstatus,a0
800006a6:	6789                	lui	a5,0x2
800006a8:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
800006ac:	8d7d                	and	a0,a0,a5
800006ae:	80050513          	add	a0,a0,-2048
800006b2:	00153513          	seqz	a0,a0
800006b6:	8082                	ret

800006b8 <require_supervisor_mode>:
800006b8:	6785                	lui	a5,0x1
800006ba:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
800006be:	3007a7f3          	csrrs	a5,mstatus,a5
800006c2:	300797f3          	csrrw	a5,mstatus,a5
800006c6:	6709                	lui	a4,0x2
800006c8:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
800006cc:	8ff9                	and	a5,a5,a4
800006ce:	80078793          	add	a5,a5,-2048
800006d2:	e391                	bnez	a5,800006d6 <require_supervisor_mode+0x1e>
800006d4:	8082                	ret
800006d6:	1141                	add	sp,sp,-16
800006d8:	00000517          	auipc	a0,0x0
800006dc:	20c50513          	add	a0,a0,524 # 800008e4 <fromhost+0x38>
800006e0:	c606                	sw	ra,12(sp)
800006e2:	3719                	jal	800005e8 <print>
800006e4:	57fd                	li	a5,-1
800006e6:	e2f1a423          	sw	a5,-472(gp) # 800008a4 <flag>
800006ea:	3a4d                	jal	8000009c <done>

800006ec <read_exception_context>:
800006ec:	c00027f3          	rdcycle	a5
800006f0:	c55c                	sw	a5,12(a0)
800006f2:	c01027f3          	rdtime	a5
800006f6:	c91c                	sw	a5,16(a0)
800006f8:	342027f3          	csrr	a5,mcause
800006fc:	c51c                	sw	a5,8(a0)
800006fe:	341027f3          	csrr	a5,mepc
80000702:	c11c                	sw	a5,0(a0)
80000704:	343027f3          	csrr	a5,mtval
80000708:	c15c                	sw	a5,4(a0)
8000070a:	c03027f3          	csrr	a5,hpmcounter3
8000070e:	c95c                	sw	a5,20(a0)
80000710:	c04027f3          	csrr	a5,hpmcounter4
80000714:	cd1c                	sw	a5,24(a0)
80000716:	8082                	ret

80000718 <read_exception_context_s>:
80000718:	c00027f3          	rdcycle	a5
8000071c:	c55c                	sw	a5,12(a0)
8000071e:	c01027f3          	rdtime	a5
80000722:	c91c                	sw	a5,16(a0)
80000724:	142027f3          	csrr	a5,scause
80000728:	c51c                	sw	a5,8(a0)
8000072a:	141027f3          	csrr	a5,sepc
8000072e:	c11c                	sw	a5,0(a0)
80000730:	143027f3          	csrr	a5,stval
80000734:	c15c                	sw	a5,4(a0)
80000736:	c03027f3          	csrr	a5,hpmcounter3
8000073a:	c95c                	sw	a5,20(a0)
8000073c:	c04027f3          	csrr	a5,hpmcounter4
80000740:	cd1c                	sw	a5,24(a0)
80000742:	8082                	ret

80000744 <print_exception_context>:
80000744:	1141                	add	sp,sp,-16
80000746:	c422                	sw	s0,8(sp)
80000748:	842a                	mv	s0,a0
8000074a:	00000517          	auipc	a0,0x0
8000074e:	1be50513          	add	a0,a0,446 # 80000908 <fromhost+0x5c>
80000752:	c606                	sw	ra,12(sp)
80000754:	3d51                	jal	800005e8 <print>
80000756:	440c                	lw	a1,8(s0)
80000758:	00000517          	auipc	a0,0x0
8000075c:	1c850513          	add	a0,a0,456 # 80000920 <fromhost+0x74>
80000760:	3561                	jal	800005e8 <print>
80000762:	400c                	lw	a1,0(s0)
80000764:	00000517          	auipc	a0,0x0
80000768:	1cc50513          	add	a0,a0,460 # 80000930 <fromhost+0x84>
8000076c:	3db5                	jal	800005e8 <print>
8000076e:	404c                	lw	a1,4(s0)
80000770:	00000517          	auipc	a0,0x0
80000774:	1d050513          	add	a0,a0,464 # 80000940 <fromhost+0x94>
80000778:	3d85                	jal	800005e8 <print>
8000077a:	444c                	lw	a1,12(s0)
8000077c:	00000517          	auipc	a0,0x0
80000780:	1d450513          	add	a0,a0,468 # 80000950 <fromhost+0xa4>
80000784:	3595                	jal	800005e8 <print>
80000786:	480c                	lw	a1,16(s0)
80000788:	00000517          	auipc	a0,0x0
8000078c:	1d850513          	add	a0,a0,472 # 80000960 <fromhost+0xb4>
80000790:	3da1                	jal	800005e8 <print>
80000792:	484c                	lw	a1,20(s0)
80000794:	00000517          	auipc	a0,0x0
80000798:	1dc50513          	add	a0,a0,476 # 80000970 <fromhost+0xc4>
8000079c:	35b1                	jal	800005e8 <print>
8000079e:	4c0c                	lw	a1,24(s0)
800007a0:	4422                	lw	s0,8(sp)
800007a2:	40b2                	lw	ra,12(sp)
800007a4:	00000517          	auipc	a0,0x0
800007a8:	1dc50513          	add	a0,a0,476 # 80000980 <fromhost+0xd4>
800007ac:	0141                	add	sp,sp,16
800007ae:	bd2d                	j	800005e8 <print>

800007b0 <default_handler>:
800007b0:	711d                	add	sp,sp,-96
800007b2:	c6aa                	sw	a0,76(sp)
800007b4:	0048                	add	a0,sp,4
800007b6:	ce86                	sw	ra,92(sp)
800007b8:	cc96                	sw	t0,88(sp)
800007ba:	ca9a                	sw	t1,84(sp)
800007bc:	c89e                	sw	t2,80(sp)
800007be:	c4ae                	sw	a1,72(sp)
800007c0:	c2b2                	sw	a2,68(sp)
800007c2:	c0b6                	sw	a3,64(sp)
800007c4:	de3a                	sw	a4,60(sp)
800007c6:	dc3e                	sw	a5,56(sp)
800007c8:	da42                	sw	a6,52(sp)
800007ca:	d846                	sw	a7,48(sp)
800007cc:	d672                	sw	t3,44(sp)
800007ce:	d476                	sw	t4,40(sp)
800007d0:	d27a                	sw	t5,36(sp)
800007d2:	d07e                	sw	t6,32(sp)
800007d4:	3f21                	jal	800006ec <read_exception_context>
800007d6:	0048                	add	a0,sp,4
800007d8:	37b5                	jal	80000744 <print_exception_context>
800007da:	00000517          	auipc	a0,0x0
800007de:	1b650513          	add	a0,a0,438 # 80000990 <fromhost+0xe4>
800007e2:	3519                	jal	800005e8 <print>
800007e4:	8b9ff0ef          	jal	8000009c <done>

800007e8 <unreachable_handler>:
800007e8:	711d                	add	sp,sp,-96
800007ea:	c6aa                	sw	a0,76(sp)
800007ec:	0048                	add	a0,sp,4
800007ee:	ce86                	sw	ra,92(sp)
800007f0:	cc96                	sw	t0,88(sp)
800007f2:	ca9a                	sw	t1,84(sp)
800007f4:	c89e                	sw	t2,80(sp)
800007f6:	c4ae                	sw	a1,72(sp)
800007f8:	c2b2                	sw	a2,68(sp)
800007fa:	c0b6                	sw	a3,64(sp)
800007fc:	de3a                	sw	a4,60(sp)
800007fe:	dc3e                	sw	a5,56(sp)
80000800:	da42                	sw	a6,52(sp)
80000802:	d846                	sw	a7,48(sp)
80000804:	d672                	sw	t3,44(sp)
80000806:	d476                	sw	t4,40(sp)
80000808:	d27a                	sw	t5,36(sp)
8000080a:	d07e                	sw	t6,32(sp)
8000080c:	35c5                	jal	800006ec <read_exception_context>
8000080e:	0048                	add	a0,sp,4
80000810:	3f15                	jal	80000744 <print_exception_context>
80000812:	00000517          	auipc	a0,0x0
80000816:	1aa50513          	add	a0,a0,426 # 800009bc <fromhost+0x110>
8000081a:	33f9                	jal	800005e8 <print>
8000081c:	881ff0ef          	jal	8000009c <done>

80000820 <test_pass>:
80000820:	1141                	add	sp,sp,-16
80000822:	85aa                	mv	a1,a0
80000824:	00000517          	auipc	a0,0x0
80000828:	1e850513          	add	a0,a0,488 # 80000a0c <fromhost+0x160>
8000082c:	c606                	sw	ra,12(sp)
8000082e:	3b6d                	jal	800005e8 <print>
80000830:	40b2                	lw	ra,12(sp)
80000832:	4785                	li	a5,1
80000834:	e2f1a423          	sw	a5,-472(gp) # 800008a4 <flag>
80000838:	0141                	add	sp,sp,16
8000083a:	8082                	ret

8000083c <test_fail>:
8000083c:	1141                	add	sp,sp,-16
8000083e:	85aa                	mv	a1,a0
80000840:	00000517          	auipc	a0,0x0
80000844:	1cc50513          	add	a0,a0,460 # 80000a0c <fromhost+0x160>
80000848:	c606                	sw	ra,12(sp)
8000084a:	3b79                	jal	800005e8 <print>
8000084c:	40b2                	lw	ra,12(sp)
8000084e:	e201a423          	sw	zero,-472(gp) # 800008a4 <flag>
80000852:	0141                	add	sp,sp,16
80000854:	8082                	ret
	...

80000860 <vector_table>:
80000860:	f51ff06f          	j	800007b0 <default_handler>
80000864:	f4dff06f          	j	800007b0 <default_handler>
80000868:	f81ff06f          	j	800007e8 <unreachable_handler>
8000086c:	f45ff06f          	j	800007b0 <default_handler>
80000870:	f79ff06f          	j	800007e8 <unreachable_handler>
80000874:	f3dff06f          	j	800007b0 <default_handler>
80000878:	f71ff06f          	j	800007e8 <unreachable_handler>
8000087c:	f35ff06f          	j	800007b0 <default_handler>
80000880:	f69ff06f          	j	800007e8 <unreachable_handler>
80000884:	f2dff06f          	j	800007b0 <default_handler>
80000888:	f61ff06f          	j	800007e8 <unreachable_handler>
8000088c:	f25ff06f          	j	800007b0 <default_handler>
80000890:	f59ff06f          	j	800007e8 <unreachable_handler>
80000894:	f1dff06f          	j	800007b0 <default_handler>
80000898:	f51ff06f          	j	800007e8 <unreachable_handler>
8000089c:	f4dff06f          	j	800007e8 <unreachable_handler>
	...
