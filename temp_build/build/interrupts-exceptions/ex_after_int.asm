
build/interrupts-exceptions/ex_after_int:     file format elf32-littleriscv


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
8000004a:	9b618193          	add	gp,gp,-1610 # 800009fc <__bss_end>

8000004e <clr_bss>:
8000004e:	00018293          	mv	t0,gp
80000052:	00018313          	mv	t1,gp
80000056:	00628763          	beq	t0,t1,80000064 <do_preinit_arr>

8000005a <clr_bss_loop>:
8000005a:	00028023          	sb	zero,0(t0)
8000005e:	0285                	add	t0,t0,1
80000060:	fe535de3          	bge	t1,t0,8000005a <clr_bss_loop>

80000064 <do_preinit_arr>:
80000064:	e0618413          	add	s0,gp,-506 # 80000802 <__init_array_end>
80000068:	e0618493          	add	s1,gp,-506 # 80000802 <__init_array_end>
8000006c:	00940963          	beq	s0,s1,8000007e <do_init_arr>

80000070 <preinit_arr_calls>:
80000070:	00042903          	lw	s2,0(s0)
80000074:	000900e7          	jalr	s2
80000078:	0411                	add	s0,s0,4
8000007a:	fe941be3          	bne	s0,s1,80000070 <preinit_arr_calls>

8000007e <do_init_arr>:
8000007e:	e0618413          	add	s0,gp,-506 # 80000802 <__init_array_end>
80000082:	e0618493          	add	s1,gp,-506 # 80000802 <__init_array_end>
80000086:	00940963          	beq	s0,s1,80000098 <enter_main>

8000008a <init_arr_calls>:
8000008a:	00042903          	lw	s2,0(s0)
8000008e:	000900e7          	jalr	s2
80000092:	0411                	add	s0,s0,4
80000094:	fc941ee3          	bne	s0,s1,80000070 <preinit_arr_calls>

80000098 <enter_main>:
80000098:	0da000ef          	jal	80000172 <main>

8000009c <done>:
8000009c:	e0818d93          	add	s11,gp,-504 # 80000804 <flag>
800000a0:	000dae03          	lw	t3,0(s11)
800000a4:	e0c18d93          	add	s11,gp,-500 # 80000808 <tohost>
800000a8:	01cda023          	sw	t3,0(s11)

800000ac <__sim_halt>:
800000ac:	a001                	j	800000ac <__sim_halt>
	...

800000b0 <exception_handler>:
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
800000d4:	2351                	jal	80000658 <read_exception_context>
800000d6:	0048                	add	a0,sp,4
800000d8:	2be1                	jal	800006b0 <print_exception_context>
800000da:	4511                	li	a0,4
800000dc:	21f9                	jal	800005aa <advance_mepc>
800000de:	e0818713          	add	a4,gp,-504 # 80000804 <flag>
800000e2:	431c                	lw	a5,0(a4)
800000e4:	40f6                	lw	ra,92(sp)
800000e6:	42e6                	lw	t0,88(sp)
800000e8:	17f9                	add	a5,a5,-2
800000ea:	c31c                	sw	a5,0(a4)
800000ec:	4356                	lw	t1,84(sp)
800000ee:	43c6                	lw	t2,80(sp)
800000f0:	4536                	lw	a0,76(sp)
800000f2:	45a6                	lw	a1,72(sp)
800000f4:	4616                	lw	a2,68(sp)
800000f6:	4686                	lw	a3,64(sp)
800000f8:	5772                	lw	a4,60(sp)
800000fa:	57e2                	lw	a5,56(sp)
800000fc:	5852                	lw	a6,52(sp)
800000fe:	58c2                	lw	a7,48(sp)
80000100:	5e32                	lw	t3,44(sp)
80000102:	5ea2                	lw	t4,40(sp)
80000104:	5f12                	lw	t5,36(sp)
80000106:	5f82                	lw	t6,32(sp)
80000108:	6125                	add	sp,sp,96
8000010a:	30200073          	mret
	...

80000110 <mtip_handler>:
80000110:	711d                	add	sp,sp,-96
80000112:	c6aa                	sw	a0,76(sp)
80000114:	0048                	add	a0,sp,4
80000116:	de3a                	sw	a4,60(sp)
80000118:	dc3e                	sw	a5,56(sp)
8000011a:	ce86                	sw	ra,92(sp)
8000011c:	cc96                	sw	t0,88(sp)
8000011e:	ca9a                	sw	t1,84(sp)
80000120:	c89e                	sw	t2,80(sp)
80000122:	c4ae                	sw	a1,72(sp)
80000124:	c2b2                	sw	a2,68(sp)
80000126:	c0b6                	sw	a3,64(sp)
80000128:	da42                	sw	a6,52(sp)
8000012a:	d846                	sw	a7,48(sp)
8000012c:	d672                	sw	t3,44(sp)
8000012e:	d476                	sw	t4,40(sp)
80000130:	d27a                	sw	t5,36(sp)
80000132:	d07e                	sw	t6,32(sp)
80000134:	2315                	jal	80000658 <read_exception_context>
80000136:	0048                	add	a0,sp,4
80000138:	2ba5                	jal	800006b0 <print_exception_context>
8000013a:	e0818713          	add	a4,gp,-504 # 80000804 <flag>
8000013e:	431c                	lw	a5,0(a4)
80000140:	40f6                	lw	ra,92(sp)
80000142:	42e6                	lw	t0,88(sp)
80000144:	17fd                	add	a5,a5,-1
80000146:	c31c                	sw	a5,0(a4)
80000148:	0ff00793          	li	a5,255
8000014c:	fef02623          	sw	a5,-20(zero) # ffffffec <__stack_top+0x3fffffec>
80000150:	4356                	lw	t1,84(sp)
80000152:	43c6                	lw	t2,80(sp)
80000154:	4536                	lw	a0,76(sp)
80000156:	45a6                	lw	a1,72(sp)
80000158:	4616                	lw	a2,68(sp)
8000015a:	4686                	lw	a3,64(sp)
8000015c:	5772                	lw	a4,60(sp)
8000015e:	57e2                	lw	a5,56(sp)
80000160:	5852                	lw	a6,52(sp)
80000162:	58c2                	lw	a7,48(sp)
80000164:	5e32                	lw	t3,44(sp)
80000166:	5ea2                	lw	t4,40(sp)
80000168:	5f12                	lw	t5,36(sp)
8000016a:	5f82                	lw	t6,32(sp)
8000016c:	6125                	add	sp,sp,96
8000016e:	30200073          	mret

80000172 <main>:
80000172:	1141                	add	sp,sp,-16
80000174:	c606                	sw	ra,12(sp)
80000176:	c422                	sw	s0,8(sp)
80000178:	fe002623          	sw	zero,-20(zero) # ffffffec <__stack_top+0x3fffffec>
8000017c:	0ff00793          	li	a5,255
80000180:	fef02423          	sw	a5,-24(zero) # ffffffe8 <__stack_top+0x3fffffe8>
80000184:	08000593          	li	a1,128
80000188:	4791                	li	a5,4
8000018a:	00000517          	auipc	a0,0x0
8000018e:	63650513          	add	a0,a0,1590 # 800007c0 <vector_table>
80000192:	e0818413          	add	s0,gp,-504 # 80000804 <flag>
80000196:	c01c                	sw	a5,0(s0)
80000198:	2181                	jal	800005d8 <setup_interrupt_m_vectored>
8000019a:	21b1                	jal	800005e6 <enable_interrupts_m>
8000019c:	0fe00713          	li	a4,254
800001a0:	fe002783          	lw	a5,-32(zero) # ffffffe0 <__stack_top+0x3fffffe0>
800001a4:	fef77ee3          	bgeu	a4,a5,800001a0 <main+0x2e>
800001a8:	00000073          	ecall
800001ac:	4018                	lw	a4,0(s0)
800001ae:	4785                	li	a5,1
800001b0:	00f70c63          	beq	a4,a5,800001c8 <main+0x56>
800001b4:	00000517          	auipc	a0,0x0
800001b8:	68050513          	add	a0,a0,1664 # 80000834 <fromhost+0x28>
800001bc:	23e5                	jal	800007a4 <test_fail>
800001be:	40b2                	lw	ra,12(sp)
800001c0:	4422                	lw	s0,8(sp)
800001c2:	4501                	li	a0,0
800001c4:	0141                	add	sp,sp,16
800001c6:	8082                	ret
800001c8:	00000517          	auipc	a0,0x0
800001cc:	64850513          	add	a0,a0,1608 # 80000810 <fromhost+0x4>
800001d0:	2b65                	jal	80000788 <test_pass>
800001d2:	b7f5                	j	800001be <main+0x4c>

800001d4 <print_string>:
800001d4:	00054783          	lbu	a5,0(a0)
800001d8:	cb81                	beqz	a5,800001e8 <print_string+0x14>
800001da:	0505                	add	a0,a0,1
800001dc:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
800001e0:	00054783          	lbu	a5,0(a0)
800001e4:	0505                	add	a0,a0,1
800001e6:	fbfd                	bnez	a5,800001dc <print_string+0x8>
800001e8:	8082                	ret

800001ea <vformat>:
800001ea:	00054683          	lbu	a3,0(a0)
800001ee:	ce85                	beqz	a3,80000226 <vformat+0x3c>
800001f0:	4781                	li	a5,0
800001f2:	4801                	li	a6,0
800001f4:	4881                	li	a7,0
800001f6:	872e                	mv	a4,a1
800001f8:	02500e13          	li	t3,37
800001fc:	03f00e93          	li	t4,63
80000200:	4fd9                	li	t6,22
80000202:	f9418f13          	add	t5,gp,-108 # 80000990 <fromhost+0x184>
80000206:	833a                	mv	t1,a4
80000208:	03c68263          	beq	a3,t3,8000022c <vformat+0x42>
8000020c:	0805                	add	a6,a6,1
8000020e:	00d70023          	sb	a3,0(a4)
80000212:	01058733          	add	a4,a1,a6
80000216:	0785                	add	a5,a5,1
80000218:	00f506b3          	add	a3,a0,a5
8000021c:	0006c683          	lbu	a3,0(a3)
80000220:	88be                	mv	a7,a5
80000222:	f2f5                	bnez	a3,80000206 <vformat+0x1c>
80000224:	85ba                	mv	a1,a4
80000226:	00058023          	sb	zero,0(a1)
8000022a:	8082                	ret
8000022c:	98aa                	add	a7,a7,a0
8000022e:	0018c683          	lbu	a3,1(a7)
80000232:	2a068263          	beqz	a3,800004d6 <vformat+0x2ec>
80000236:	2dc68463          	beq	a3,t3,800004fe <vformat+0x314>
8000023a:	f9e68693          	add	a3,a3,-98
8000023e:	0ff6f693          	zext.b	a3,a3
80000242:	2cdfe563          	bltu	t6,a3,8000050c <vformat+0x322>
80000246:	7139                	add	sp,sp,-64
80000248:	de22                	sw	s0,60(sp)
8000024a:	dc26                	sw	s1,56(sp)
8000024c:	da4a                	sw	s2,52(sp)
8000024e:	d84e                	sw	s3,48(sp)
80000250:	d652                	sw	s4,44(sp)
80000252:	068a                	sll	a3,a3,0x2
80000254:	96fa                	add	a3,a3,t5
80000256:	4294                	lw	a3,0(a3)
80000258:	96fa                	add	a3,a3,t5
8000025a:	8682                	jr	a3
8000025c:	98aa                	add	a7,a7,a0
8000025e:	0018c683          	lbu	a3,1(a7)
80000262:	1e068563          	beqz	a3,8000044c <vformat+0x262>
80000266:	21c68163          	beq	a3,t3,80000468 <vformat+0x27e>
8000026a:	f9e68693          	add	a3,a3,-98
8000026e:	0ff6f693          	zext.b	a3,a3
80000272:	fedff0e3          	bgeu	t6,a3,80000252 <vformat+0x68>
80000276:	03f00893          	li	a7,63
8000027a:	00280693          	add	a3,a6,2
8000027e:	01170023          	sb	a7,0(a4)
80000282:	011700a3          	sb	a7,1(a4)
80000286:	080d                	add	a6,a6,3
80000288:	00d58733          	add	a4,a1,a3
8000028c:	01170023          	sb	a7,0(a4)
80000290:	01058733          	add	a4,a1,a6
80000294:	0785                	add	a5,a5,1
80000296:	0785                	add	a5,a5,1
80000298:	00f506b3          	add	a3,a0,a5
8000029c:	0006c683          	lbu	a3,0(a3)
800002a0:	88be                	mv	a7,a5
800002a2:	c285                	beqz	a3,800002c2 <vformat+0xd8>
800002a4:	833a                	mv	t1,a4
800002a6:	fbc68be3          	beq	a3,t3,8000025c <vformat+0x72>
800002aa:	0785                	add	a5,a5,1
800002ac:	00d70023          	sb	a3,0(a4)
800002b0:	00f506b3          	add	a3,a0,a5
800002b4:	0006c683          	lbu	a3,0(a3)
800002b8:	0805                	add	a6,a6,1
800002ba:	01058733          	add	a4,a1,a6
800002be:	88be                	mv	a7,a5
800002c0:	f2f5                	bnez	a3,800002a4 <vformat+0xba>
800002c2:	00070023          	sb	zero,0(a4)
800002c6:	5472                	lw	s0,60(sp)
800002c8:	54e2                	lw	s1,56(sp)
800002ca:	5952                	lw	s2,52(sp)
800002cc:	59c2                	lw	s3,48(sp)
800002ce:	5a32                	lw	s4,44(sp)
800002d0:	6121                	add	sp,sp,64
800002d2:	8082                	ret
800002d4:	00062303          	lw	t1,0(a2)
800002d8:	03000693          	li	a3,48
800002dc:	07800893          	li	a7,120
800002e0:	0809                	add	a6,a6,2
800002e2:	00d70023          	sb	a3,0(a4)
800002e6:	011700a3          	sb	a7,1(a4)
800002ea:	0611                	add	a2,a2,4
800002ec:	010583b3          	add	t2,a1,a6
800002f0:	18030263          	beqz	t1,80000474 <vformat+0x28a>
800002f4:	4881                	li	a7,0
800002f6:	868a                	mv	a3,sp
800002f8:	ff018293          	add	t0,gp,-16 # 800009ec <table>
800002fc:	00f37713          	and	a4,t1,15
80000300:	9716                	add	a4,a4,t0
80000302:	00074483          	lbu	s1,0(a4)
80000306:	8746                	mv	a4,a7
80000308:	0885                	add	a7,a7,1
8000030a:	01168433          	add	s0,a3,a7
8000030e:	fe940fa3          	sb	s1,-1(s0)
80000312:	00435313          	srl	t1,t1,0x4
80000316:	fe0313e3          	bnez	t1,800002fc <vformat+0x112>
8000031a:	9736                	add	a4,a4,a3
8000031c:	831e                	mv	t1,t2
8000031e:	00074383          	lbu	t2,0(a4)
80000322:	82ba                	mv	t0,a4
80000324:	0305                	add	t1,t1,1
80000326:	fe730fa3          	sb	t2,-1(t1)
8000032a:	177d                	add	a4,a4,-1
8000032c:	fe5699e3          	bne	a3,t0,8000031e <vformat+0x134>
80000330:	9846                	add	a6,a6,a7
80000332:	01058733          	add	a4,a1,a6
80000336:	bfb9                	j	80000294 <vformat+0xaa>
80000338:	00062383          	lw	t2,0(a2)
8000033c:	0611                	add	a2,a2,4
8000033e:	1a038a63          	beqz	t2,800004f2 <vformat+0x308>
80000342:	4301                	li	t1,0
80000344:	868a                	mv	a3,sp
80000346:	ff018293          	add	t0,gp,-16 # 800009ec <table>
8000034a:	44a9                	li	s1,10
8000034c:	4a25                	li	s4,9
8000034e:	0293f433          	remu	s0,t2,s1
80000352:	889a                	mv	a7,t1
80000354:	0305                	add	t1,t1,1
80000356:	006689b3          	add	s3,a3,t1
8000035a:	891e                	mv	s2,t2
8000035c:	9416                	add	s0,s0,t0
8000035e:	00044403          	lbu	s0,0(s0)
80000362:	0293d3b3          	divu	t2,t2,s1
80000366:	fe898fa3          	sb	s0,-1(s3)
8000036a:	ff2a62e3          	bltu	s4,s2,8000034e <vformat+0x164>
8000036e:	98b6                	add	a7,a7,a3
80000370:	0008c383          	lbu	t2,0(a7)
80000374:	82c6                	mv	t0,a7
80000376:	0705                	add	a4,a4,1
80000378:	fe770fa3          	sb	t2,-1(a4)
8000037c:	18fd                	add	a7,a7,-1
8000037e:	fe5699e3          	bne	a3,t0,80000370 <vformat+0x186>
80000382:	981a                	add	a6,a6,t1
80000384:	01058733          	add	a4,a1,a6
80000388:	b731                	j	80000294 <vformat+0xaa>
8000038a:	00062283          	lw	t0,0(a2)
8000038e:	0611                	add	a2,a2,4
80000390:	0002c883          	lbu	a7,0(t0)
80000394:	f00880e3          	beqz	a7,80000294 <vformat+0xaa>
80000398:	4681                	li	a3,0
8000039a:	00d70333          	add	t1,a4,a3
8000039e:	0685                	add	a3,a3,1
800003a0:	01130023          	sb	a7,0(t1)
800003a4:	00d288b3          	add	a7,t0,a3
800003a8:	0008c883          	lbu	a7,0(a7)
800003ac:	fe0897e3          	bnez	a7,8000039a <vformat+0x1b0>
800003b0:	9836                	add	a6,a6,a3
800003b2:	01058733          	add	a4,a1,a6
800003b6:	bdf9                	j	80000294 <vformat+0xaa>
800003b8:	00062883          	lw	a7,0(a2)
800003bc:	0611                	add	a2,a2,4
800003be:	0c08c263          	bltz	a7,80000482 <vformat+0x298>
800003c2:	0c089963          	bnez	a7,80000494 <vformat+0x2aa>
800003c6:	03000693          	li	a3,48
800003ca:	00d70023          	sb	a3,0(a4)
800003ce:	4385                	li	t2,1
800003d0:	981e                	add	a6,a6,t2
800003d2:	01058733          	add	a4,a1,a6
800003d6:	bd7d                	j	80000294 <vformat+0xaa>
800003d8:	4214                	lw	a3,0(a2)
800003da:	0805                	add	a6,a6,1
800003dc:	0611                	add	a2,a2,4
800003de:	00d70023          	sb	a3,0(a4)
800003e2:	01058733          	add	a4,a1,a6
800003e6:	b57d                	j	80000294 <vformat+0xaa>
800003e8:	00062303          	lw	t1,0(a2)
800003ec:	03000693          	li	a3,48
800003f0:	06200893          	li	a7,98
800003f4:	0809                	add	a6,a6,2
800003f6:	00d70023          	sb	a3,0(a4)
800003fa:	011700a3          	sb	a7,1(a4)
800003fe:	0611                	add	a2,a2,4
80000400:	010583b3          	add	t2,a1,a6
80000404:	06030863          	beqz	t1,80000474 <vformat+0x28a>
80000408:	4881                	li	a7,0
8000040a:	868a                	mv	a3,sp
8000040c:	ff018293          	add	t0,gp,-16 # 800009ec <table>
80000410:	00137713          	and	a4,t1,1
80000414:	9716                	add	a4,a4,t0
80000416:	00074483          	lbu	s1,0(a4)
8000041a:	8746                	mv	a4,a7
8000041c:	0885                	add	a7,a7,1
8000041e:	01168433          	add	s0,a3,a7
80000422:	fe940fa3          	sb	s1,-1(s0)
80000426:	00135313          	srl	t1,t1,0x1
8000042a:	fe0313e3          	bnez	t1,80000410 <vformat+0x226>
8000042e:	9736                	add	a4,a4,a3
80000430:	831e                	mv	t1,t2
80000432:	00074383          	lbu	t2,0(a4)
80000436:	82ba                	mv	t0,a4
80000438:	0305                	add	t1,t1,1
8000043a:	fe730fa3          	sb	t2,-1(t1)
8000043e:	177d                	add	a4,a4,-1
80000440:	fe5699e3          	bne	a3,t0,80000432 <vformat+0x248>
80000444:	9846                	add	a6,a6,a7
80000446:	01058733          	add	a4,a1,a6
8000044a:	b5a9                	j	80000294 <vformat+0xaa>
8000044c:	00280693          	add	a3,a6,2
80000450:	01d70023          	sb	t4,0(a4)
80000454:	01d700a3          	sb	t4,1(a4)
80000458:	080d                	add	a6,a6,3
8000045a:	00d58733          	add	a4,a1,a3
8000045e:	01d70023          	sb	t4,0(a4)
80000462:	01058733          	add	a4,a1,a6
80000466:	bd05                	j	80000296 <vformat+0xac>
80000468:	0805                	add	a6,a6,1
8000046a:	01c70023          	sb	t3,0(a4)
8000046e:	01058733          	add	a4,a1,a6
80000472:	b50d                	j	80000294 <vformat+0xaa>
80000474:	4885                	li	a7,1
80000476:	9846                	add	a6,a6,a7
80000478:	00d38023          	sb	a3,0(t2)
8000047c:	01058733          	add	a4,a1,a6
80000480:	bd11                	j	80000294 <vformat+0xaa>
80000482:	0805                	add	a6,a6,1
80000484:	02d00693          	li	a3,45
80000488:	00d70023          	sb	a3,0(a4)
8000048c:	411008b3          	neg	a7,a7
80000490:	01058333          	add	t1,a1,a6
80000494:	4381                	li	t2,0
80000496:	868a                	mv	a3,sp
80000498:	ff018293          	add	t0,gp,-16 # 800009ec <table>
8000049c:	44a9                	li	s1,10
8000049e:	4a25                	li	s4,9
800004a0:	0298f433          	remu	s0,a7,s1
800004a4:	871e                	mv	a4,t2
800004a6:	0385                	add	t2,t2,1
800004a8:	007689b3          	add	s3,a3,t2
800004ac:	8946                	mv	s2,a7
800004ae:	9416                	add	s0,s0,t0
800004b0:	00044403          	lbu	s0,0(s0)
800004b4:	0298d8b3          	divu	a7,a7,s1
800004b8:	fe898fa3          	sb	s0,-1(s3)
800004bc:	ff2a62e3          	bltu	s4,s2,800004a0 <vformat+0x2b6>
800004c0:	9736                	add	a4,a4,a3
800004c2:	00074283          	lbu	t0,0(a4)
800004c6:	88ba                	mv	a7,a4
800004c8:	0305                	add	t1,t1,1
800004ca:	fe530fa3          	sb	t0,-1(t1)
800004ce:	177d                	add	a4,a4,-1
800004d0:	ff1699e3          	bne	a3,a7,800004c2 <vformat+0x2d8>
800004d4:	bdf5                	j	800003d0 <vformat+0x1e6>
800004d6:	00280693          	add	a3,a6,2
800004da:	01d70023          	sb	t4,0(a4)
800004de:	01d700a3          	sb	t4,1(a4)
800004e2:	080d                	add	a6,a6,3
800004e4:	00d58733          	add	a4,a1,a3
800004e8:	01d70023          	sb	t4,0(a4)
800004ec:	01058733          	add	a4,a1,a6
800004f0:	b31d                	j	80000216 <vformat+0x2c>
800004f2:	03000693          	li	a3,48
800004f6:	00d70023          	sb	a3,0(a4)
800004fa:	4305                	li	t1,1
800004fc:	b559                	j	80000382 <vformat+0x198>
800004fe:	0805                	add	a6,a6,1
80000500:	01c70023          	sb	t3,0(a4)
80000504:	0785                	add	a5,a5,1
80000506:	01058733          	add	a4,a1,a6
8000050a:	b331                	j	80000216 <vformat+0x2c>
8000050c:	03f00893          	li	a7,63
80000510:	00280693          	add	a3,a6,2
80000514:	01170023          	sb	a7,0(a4)
80000518:	011700a3          	sb	a7,1(a4)
8000051c:	080d                	add	a6,a6,3
8000051e:	00d58733          	add	a4,a1,a3
80000522:	01170023          	sb	a7,0(a4)
80000526:	0785                	add	a5,a5,1
80000528:	01058733          	add	a4,a1,a6
8000052c:	b1ed                	j	80000216 <vformat+0x2c>

8000052e <vprint>:
8000052e:	7175                	add	sp,sp,-144
80000530:	862e                	mv	a2,a1
80000532:	858a                	mv	a1,sp
80000534:	c706                	sw	ra,140(sp)
80000536:	3955                	jal	800001ea <vformat>
80000538:	00014783          	lbu	a5,0(sp)
8000053c:	cb89                	beqz	a5,8000054e <vprint+0x20>
8000053e:	00110713          	add	a4,sp,1
80000542:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
80000546:	00074783          	lbu	a5,0(a4)
8000054a:	0705                	add	a4,a4,1
8000054c:	fbfd                	bnez	a5,80000542 <vprint+0x14>
8000054e:	40ba                	lw	ra,140(sp)
80000550:	6149                	add	sp,sp,144
80000552:	8082                	ret

80000554 <print>:
80000554:	7139                	add	sp,sp,-64
80000556:	02410313          	add	t1,sp,36
8000055a:	d22e                	sw	a1,36(sp)
8000055c:	859a                	mv	a1,t1
8000055e:	ce06                	sw	ra,28(sp)
80000560:	d432                	sw	a2,40(sp)
80000562:	d636                	sw	a3,44(sp)
80000564:	d83a                	sw	a4,48(sp)
80000566:	da3e                	sw	a5,52(sp)
80000568:	dc42                	sw	a6,56(sp)
8000056a:	de46                	sw	a7,60(sp)
8000056c:	c61a                	sw	t1,12(sp)
8000056e:	37c1                	jal	8000052e <vprint>
80000570:	40f2                	lw	ra,28(sp)
80000572:	6121                	add	sp,sp,64
80000574:	8082                	ret

80000576 <format>:
80000576:	7139                	add	sp,sp,-64
80000578:	02810313          	add	t1,sp,40
8000057c:	d432                	sw	a2,40(sp)
8000057e:	861a                	mv	a2,t1
80000580:	ce06                	sw	ra,28(sp)
80000582:	d636                	sw	a3,44(sp)
80000584:	d83a                	sw	a4,48(sp)
80000586:	da3e                	sw	a5,52(sp)
80000588:	dc42                	sw	a6,56(sp)
8000058a:	de46                	sw	a7,60(sp)
8000058c:	c61a                	sw	t1,12(sp)
8000058e:	39b1                	jal	800001ea <vformat>
80000590:	40f2                	lw	ra,28(sp)
80000592:	6121                	add	sp,sp,64
80000594:	8082                	ret

80000596 <dprint>:
80000596:	1101                	add	sp,sp,-32
80000598:	c22e                	sw	a1,4(sp)
8000059a:	c432                	sw	a2,8(sp)
8000059c:	c636                	sw	a3,12(sp)
8000059e:	c83a                	sw	a4,16(sp)
800005a0:	ca3e                	sw	a5,20(sp)
800005a2:	cc42                	sw	a6,24(sp)
800005a4:	ce46                	sw	a7,28(sp)
800005a6:	6105                	add	sp,sp,32
800005a8:	8082                	ret

800005aa <advance_mepc>:
800005aa:	341027f3          	csrr	a5,mepc
800005ae:	953e                	add	a0,a0,a5
800005b0:	34151073          	csrw	mepc,a0
800005b4:	8082                	ret

800005b6 <set_mepc>:
800005b6:	34151073          	csrw	mepc,a0
800005ba:	8082                	ret

800005bc <advance_sepc>:
800005bc:	141027f3          	csrr	a5,sepc
800005c0:	953e                	add	a0,a0,a5
800005c2:	14151073          	csrw	sepc,a0
800005c6:	8082                	ret

800005c8 <set_sepc>:
800005c8:	14151073          	csrw	sepc,a0
800005cc:	8082                	ret

800005ce <setup_interrupts_m>:
800005ce:	30551073          	csrw	mtvec,a0
800005d2:	30459073          	csrw	mie,a1
800005d6:	8082                	ret

800005d8 <setup_interrupt_m_vectored>:
800005d8:	00156513          	or	a0,a0,1
800005dc:	30551073          	csrw	mtvec,a0
800005e0:	30459073          	csrw	mie,a1
800005e4:	8082                	ret

800005e6 <enable_interrupts_m>:
800005e6:	47a1                	li	a5,8
800005e8:	3007a073          	csrs	mstatus,a5
800005ec:	8082                	ret

800005ee <disable_interrupts_m>:
800005ee:	47a1                	li	a5,8
800005f0:	3007b073          	csrc	mstatus,a5
800005f4:	8082                	ret

800005f6 <enable_interrupts_save_m>:
800005f6:	30051073          	csrw	mstatus,a0
800005fa:	8082                	ret

800005fc <disable_interrupts_save_m>:
800005fc:	4521                	li	a0,8
800005fe:	30053573          	csrrc	a0,mstatus,a0
80000602:	8082                	ret

80000604 <check_supervisor_mode_available>:
80000604:	6785                	lui	a5,0x1
80000606:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
8000060a:	3007a573          	csrrs	a0,mstatus,a5
8000060e:	30051573          	csrrw	a0,mstatus,a0
80000612:	6789                	lui	a5,0x2
80000614:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
80000618:	8d7d                	and	a0,a0,a5
8000061a:	80050513          	add	a0,a0,-2048
8000061e:	00153513          	seqz	a0,a0
80000622:	8082                	ret

80000624 <require_supervisor_mode>:
80000624:	6785                	lui	a5,0x1
80000626:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
8000062a:	3007a7f3          	csrrs	a5,mstatus,a5
8000062e:	300797f3          	csrrw	a5,mstatus,a5
80000632:	6709                	lui	a4,0x2
80000634:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
80000638:	8ff9                	and	a5,a5,a4
8000063a:	80078793          	add	a5,a5,-2048
8000063e:	e391                	bnez	a5,80000642 <require_supervisor_mode+0x1e>
80000640:	8082                	ret
80000642:	1141                	add	sp,sp,-16
80000644:	00000517          	auipc	a0,0x0
80000648:	22050513          	add	a0,a0,544 # 80000864 <fromhost+0x58>
8000064c:	c606                	sw	ra,12(sp)
8000064e:	3719                	jal	80000554 <print>
80000650:	57fd                	li	a5,-1
80000652:	e0f1a423          	sw	a5,-504(gp) # 80000804 <flag>
80000656:	3499                	jal	8000009c <done>

80000658 <read_exception_context>:
80000658:	c00027f3          	rdcycle	a5
8000065c:	c55c                	sw	a5,12(a0)
8000065e:	c01027f3          	rdtime	a5
80000662:	c91c                	sw	a5,16(a0)
80000664:	342027f3          	csrr	a5,mcause
80000668:	c51c                	sw	a5,8(a0)
8000066a:	341027f3          	csrr	a5,mepc
8000066e:	c11c                	sw	a5,0(a0)
80000670:	343027f3          	csrr	a5,mtval
80000674:	c15c                	sw	a5,4(a0)
80000676:	c03027f3          	csrr	a5,hpmcounter3
8000067a:	c95c                	sw	a5,20(a0)
8000067c:	c04027f3          	csrr	a5,hpmcounter4
80000680:	cd1c                	sw	a5,24(a0)
80000682:	8082                	ret

80000684 <read_exception_context_s>:
80000684:	c00027f3          	rdcycle	a5
80000688:	c55c                	sw	a5,12(a0)
8000068a:	c01027f3          	rdtime	a5
8000068e:	c91c                	sw	a5,16(a0)
80000690:	142027f3          	csrr	a5,scause
80000694:	c51c                	sw	a5,8(a0)
80000696:	141027f3          	csrr	a5,sepc
8000069a:	c11c                	sw	a5,0(a0)
8000069c:	143027f3          	csrr	a5,stval
800006a0:	c15c                	sw	a5,4(a0)
800006a2:	c03027f3          	csrr	a5,hpmcounter3
800006a6:	c95c                	sw	a5,20(a0)
800006a8:	c04027f3          	csrr	a5,hpmcounter4
800006ac:	cd1c                	sw	a5,24(a0)
800006ae:	8082                	ret

800006b0 <print_exception_context>:
800006b0:	1141                	add	sp,sp,-16
800006b2:	c422                	sw	s0,8(sp)
800006b4:	842a                	mv	s0,a0
800006b6:	00000517          	auipc	a0,0x0
800006ba:	1d250513          	add	a0,a0,466 # 80000888 <fromhost+0x7c>
800006be:	c606                	sw	ra,12(sp)
800006c0:	3d51                	jal	80000554 <print>
800006c2:	440c                	lw	a1,8(s0)
800006c4:	00000517          	auipc	a0,0x0
800006c8:	1dc50513          	add	a0,a0,476 # 800008a0 <fromhost+0x94>
800006cc:	3561                	jal	80000554 <print>
800006ce:	400c                	lw	a1,0(s0)
800006d0:	00000517          	auipc	a0,0x0
800006d4:	1e050513          	add	a0,a0,480 # 800008b0 <fromhost+0xa4>
800006d8:	3db5                	jal	80000554 <print>
800006da:	404c                	lw	a1,4(s0)
800006dc:	00000517          	auipc	a0,0x0
800006e0:	1e450513          	add	a0,a0,484 # 800008c0 <fromhost+0xb4>
800006e4:	3d85                	jal	80000554 <print>
800006e6:	444c                	lw	a1,12(s0)
800006e8:	00000517          	auipc	a0,0x0
800006ec:	1e850513          	add	a0,a0,488 # 800008d0 <fromhost+0xc4>
800006f0:	3595                	jal	80000554 <print>
800006f2:	480c                	lw	a1,16(s0)
800006f4:	00000517          	auipc	a0,0x0
800006f8:	1ec50513          	add	a0,a0,492 # 800008e0 <fromhost+0xd4>
800006fc:	3da1                	jal	80000554 <print>
800006fe:	484c                	lw	a1,20(s0)
80000700:	00000517          	auipc	a0,0x0
80000704:	1f050513          	add	a0,a0,496 # 800008f0 <fromhost+0xe4>
80000708:	35b1                	jal	80000554 <print>
8000070a:	4c0c                	lw	a1,24(s0)
8000070c:	4422                	lw	s0,8(sp)
8000070e:	40b2                	lw	ra,12(sp)
80000710:	00000517          	auipc	a0,0x0
80000714:	1f050513          	add	a0,a0,496 # 80000900 <fromhost+0xf4>
80000718:	0141                	add	sp,sp,16
8000071a:	bd2d                	j	80000554 <print>

8000071c <default_handler>:
8000071c:	711d                	add	sp,sp,-96
8000071e:	c6aa                	sw	a0,76(sp)
80000720:	0048                	add	a0,sp,4
80000722:	ce86                	sw	ra,92(sp)
80000724:	cc96                	sw	t0,88(sp)
80000726:	ca9a                	sw	t1,84(sp)
80000728:	c89e                	sw	t2,80(sp)
8000072a:	c4ae                	sw	a1,72(sp)
8000072c:	c2b2                	sw	a2,68(sp)
8000072e:	c0b6                	sw	a3,64(sp)
80000730:	de3a                	sw	a4,60(sp)
80000732:	dc3e                	sw	a5,56(sp)
80000734:	da42                	sw	a6,52(sp)
80000736:	d846                	sw	a7,48(sp)
80000738:	d672                	sw	t3,44(sp)
8000073a:	d476                	sw	t4,40(sp)
8000073c:	d27a                	sw	t5,36(sp)
8000073e:	d07e                	sw	t6,32(sp)
80000740:	3f21                	jal	80000658 <read_exception_context>
80000742:	0048                	add	a0,sp,4
80000744:	37b5                	jal	800006b0 <print_exception_context>
80000746:	00000517          	auipc	a0,0x0
8000074a:	1ca50513          	add	a0,a0,458 # 80000910 <fromhost+0x104>
8000074e:	3519                	jal	80000554 <print>
80000750:	32b1                	jal	8000009c <done>

80000752 <unreachable_handler>:
80000752:	711d                	add	sp,sp,-96
80000754:	c6aa                	sw	a0,76(sp)
80000756:	0048                	add	a0,sp,4
80000758:	ce86                	sw	ra,92(sp)
8000075a:	cc96                	sw	t0,88(sp)
8000075c:	ca9a                	sw	t1,84(sp)
8000075e:	c89e                	sw	t2,80(sp)
80000760:	c4ae                	sw	a1,72(sp)
80000762:	c2b2                	sw	a2,68(sp)
80000764:	c0b6                	sw	a3,64(sp)
80000766:	de3a                	sw	a4,60(sp)
80000768:	dc3e                	sw	a5,56(sp)
8000076a:	da42                	sw	a6,52(sp)
8000076c:	d846                	sw	a7,48(sp)
8000076e:	d672                	sw	t3,44(sp)
80000770:	d476                	sw	t4,40(sp)
80000772:	d27a                	sw	t5,36(sp)
80000774:	d07e                	sw	t6,32(sp)
80000776:	35cd                	jal	80000658 <read_exception_context>
80000778:	0048                	add	a0,sp,4
8000077a:	3f1d                	jal	800006b0 <print_exception_context>
8000077c:	00000517          	auipc	a0,0x0
80000780:	1c050513          	add	a0,a0,448 # 8000093c <fromhost+0x130>
80000784:	3bc1                	jal	80000554 <print>
80000786:	3a19                	jal	8000009c <done>

80000788 <test_pass>:
80000788:	1141                	add	sp,sp,-16
8000078a:	85aa                	mv	a1,a0
8000078c:	00000517          	auipc	a0,0x0
80000790:	20050513          	add	a0,a0,512 # 8000098c <fromhost+0x180>
80000794:	c606                	sw	ra,12(sp)
80000796:	3b7d                	jal	80000554 <print>
80000798:	40b2                	lw	ra,12(sp)
8000079a:	4785                	li	a5,1
8000079c:	e0f1a423          	sw	a5,-504(gp) # 80000804 <flag>
800007a0:	0141                	add	sp,sp,16
800007a2:	8082                	ret

800007a4 <test_fail>:
800007a4:	1141                	add	sp,sp,-16
800007a6:	85aa                	mv	a1,a0
800007a8:	00000517          	auipc	a0,0x0
800007ac:	1e450513          	add	a0,a0,484 # 8000098c <fromhost+0x180>
800007b0:	c606                	sw	ra,12(sp)
800007b2:	334d                	jal	80000554 <print>
800007b4:	40b2                	lw	ra,12(sp)
800007b6:	e001a423          	sw	zero,-504(gp) # 80000804 <flag>
800007ba:	0141                	add	sp,sp,16
800007bc:	8082                	ret
	...

800007c0 <vector_table>:
800007c0:	8f1ff06f          	j	800000b0 <exception_handler>
800007c4:	f59ff06f          	j	8000071c <default_handler>
800007c8:	f8bff06f          	j	80000752 <unreachable_handler>
800007cc:	f51ff06f          	j	8000071c <default_handler>
800007d0:	f83ff06f          	j	80000752 <unreachable_handler>
800007d4:	f49ff06f          	j	8000071c <default_handler>
800007d8:	f7bff06f          	j	80000752 <unreachable_handler>
800007dc:	935ff06f          	j	80000110 <mtip_handler>
800007e0:	f73ff06f          	j	80000752 <unreachable_handler>
800007e4:	f39ff06f          	j	8000071c <default_handler>
800007e8:	f6bff06f          	j	80000752 <unreachable_handler>
800007ec:	f31ff06f          	j	8000071c <default_handler>
800007f0:	f63ff06f          	j	80000752 <unreachable_handler>
800007f4:	f29ff06f          	j	8000071c <default_handler>
800007f8:	f5bff06f          	j	80000752 <unreachable_handler>
800007fc:	f57ff06f          	j	80000752 <unreachable_handler>
	...
