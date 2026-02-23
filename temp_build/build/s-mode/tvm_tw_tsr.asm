
build/s-mode/tvm_tw_tsr:     file format elf32-littleriscv


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
8000004a:	9ca18193          	add	gp,gp,-1590 # 80000a10 <__bss_end>

8000004e <clr_bss>:
8000004e:	00018293          	mv	t0,gp
80000052:	00018313          	mv	t1,gp
80000056:	00628763          	beq	t0,t1,80000064 <do_preinit_arr>

8000005a <clr_bss_loop>:
8000005a:	00028023          	sb	zero,0(t0)
8000005e:	0285                	add	t0,t0,1
80000060:	fe535de3          	bge	t1,t0,8000005a <clr_bss_loop>

80000064 <do_preinit_arr>:
80000064:	e1218413          	add	s0,gp,-494 # 80000822 <__init_array_end>
80000068:	e1218493          	add	s1,gp,-494 # 80000822 <__init_array_end>
8000006c:	00940963          	beq	s0,s1,8000007e <do_init_arr>

80000070 <preinit_arr_calls>:
80000070:	00042903          	lw	s2,0(s0)
80000074:	000900e7          	jalr	s2
80000078:	0411                	add	s0,s0,4
8000007a:	fe941be3          	bne	s0,s1,80000070 <preinit_arr_calls>

8000007e <do_init_arr>:
8000007e:	e1218413          	add	s0,gp,-494 # 80000822 <__init_array_end>
80000082:	e1218493          	add	s1,gp,-494 # 80000822 <__init_array_end>
80000086:	00940963          	beq	s0,s1,80000098 <enter_main>

8000008a <init_arr_calls>:
8000008a:	00042903          	lw	s2,0(s0)
8000008e:	000900e7          	jalr	s2
80000092:	0411                	add	s0,s0,4
80000094:	fc941ee3          	bne	s0,s1,80000070 <preinit_arr_calls>

80000098 <enter_main>:
80000098:	0d2000ef          	jal	8000016a <main>

8000009c <done>:
8000009c:	e1418d93          	add	s11,gp,-492 # 80000824 <flag>
800000a0:	000dae03          	lw	t3,0(s11)
800000a4:	e1818d93          	add	s11,gp,-488 # 80000828 <tohost>
800000a8:	01cda023          	sw	t3,0(s11)

800000ac <__sim_halt>:
800000ac:	a001                	j	800000ac <__sim_halt>
	...

800000b0 <handler>:
800000b0:	711d                	add	sp,sp,-96
800000b2:	c6aa                	sw	a0,76(sp)
800000b4:	0048                	add	a0,sp,4
800000b6:	ce86                	sw	ra,92(sp)
800000b8:	cc96                	sw	t0,88(sp)
800000ba:	ca9a                	sw	t1,84(sp)
800000bc:	c89e                	sw	t2,80(sp)
800000be:	c4ae                	sw	a1,72(sp)
800000c0:	c2b2                	sw	a2,68(sp)
800000c2:	c0b6                	sw	a3,64(sp)
800000c4:	de3a                	sw	a4,60(sp)
800000c6:	dc3e                	sw	a5,56(sp)
800000c8:	da42                	sw	a6,52(sp)
800000ca:	d846                	sw	a7,48(sp)
800000cc:	d672                	sw	t3,44(sp)
800000ce:	d476                	sw	t4,40(sp)
800000d0:	d27a                	sw	t5,36(sp)
800000d2:	d07e                	sw	t6,32(sp)
800000d4:	2b59                	jal	8000066a <read_exception_context>
800000d6:	0048                	add	a0,sp,4
800000d8:	23ed                	jal	800006c2 <print_exception_context>
800000da:	180025f3          	csrr	a1,satp
800000de:	00000517          	auipc	a0,0x0
800000e2:	75250513          	add	a0,a0,1874 # 80000830 <fromhost+0x4>
800000e6:	2141                	jal	80000566 <print>
800000e8:	00000517          	auipc	a0,0x0
800000ec:	75450513          	add	a0,a0,1876 # 8000083c <fromhost+0x10>
800000f0:	299d                	jal	80000566 <print>
800000f2:	4732                	lw	a4,12(sp)
800000f4:	47a5                	li	a5,9
800000f6:	02f70e63          	beq	a4,a5,80000132 <handler+0x82>
800000fa:	4511                	li	a0,4
800000fc:	21c1                	jal	800005bc <advance_mepc>
800000fe:	e1418713          	add	a4,gp,-492 # 80000824 <flag>
80000102:	431c                	lw	a5,0(a4)
80000104:	17fd                	add	a5,a5,-1
80000106:	c31c                	sw	a5,0(a4)
80000108:	30200073          	mret
8000010c:	40f6                	lw	ra,92(sp)
8000010e:	42e6                	lw	t0,88(sp)
80000110:	4356                	lw	t1,84(sp)
80000112:	43c6                	lw	t2,80(sp)
80000114:	4536                	lw	a0,76(sp)
80000116:	45a6                	lw	a1,72(sp)
80000118:	4616                	lw	a2,68(sp)
8000011a:	4686                	lw	a3,64(sp)
8000011c:	5772                	lw	a4,60(sp)
8000011e:	57e2                	lw	a5,56(sp)
80000120:	5852                	lw	a6,52(sp)
80000122:	58c2                	lw	a7,48(sp)
80000124:	5e32                	lw	t3,44(sp)
80000126:	5ea2                	lw	t4,40(sp)
80000128:	5f12                	lw	t5,36(sp)
8000012a:	5f82                	lw	t6,32(sp)
8000012c:	6125                	add	sp,sp,96
8000012e:	30200073          	mret
80000132:	6789                	lui	a5,0x2
80000134:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
80000138:	3007a073          	csrs	mstatus,a5
8000013c:	00000517          	auipc	a0,0x0
80000140:	f6050513          	add	a0,a0,-160 # 8000009c <done>
80000144:	2151                	jal	800005c8 <set_mepc>
80000146:	b7c9                	j	80000108 <handler+0x58>
80000148:	0000                	unimp
	...

8000014c <supervisor_main>:
8000014c:	800107b7          	lui	a5,0x80010
80000150:	17fd                	add	a5,a5,-1 # 8000ffff <__bss_end+0xf5ef>
80000152:	18079073          	csrw	satp,a5
80000156:	180027f3          	csrr	a5,satp
8000015a:	12000073          	sfence.vma
8000015e:	10500073          	wfi
80000162:	10200073          	sret
80000166:	00000073          	ecall

8000016a <main>:
8000016a:	1141                	add	sp,sp,-16
8000016c:	c606                	sw	ra,12(sp)
8000016e:	c422                	sw	s0,8(sp)
80000170:	21d9                	jal	80000636 <require_supervisor_mode>
80000172:	00000797          	auipc	a5,0x0
80000176:	f3e78793          	add	a5,a5,-194 # 800000b0 <handler>
8000017a:	30579073          	csrw	mtvec,a5
8000017e:	007017b7          	lui	a5,0x701
80000182:	80878793          	add	a5,a5,-2040 # 700808 <boot-0x7f8ff7f8>
80000186:	3007a073          	csrs	mstatus,a5
8000018a:	e1418413          	add	s0,gp,-492 # 80000824 <flag>
8000018e:	00245793          	srl	a5,s0,0x2
80000192:	3b079073          	csrw	pmpaddr0,a5
80000196:	3b002773          	csrr	a4,pmpaddr0
8000019a:	02e78363          	beq	a5,a4,800001c0 <main+0x56>
8000019e:	00000517          	auipc	a0,0x0
800001a2:	6a650513          	add	a0,a0,1702 # 80000844 <fromhost+0x18>
800001a6:	26c1                	jal	80000566 <print>
800001a8:	6789                	lui	a5,0x2
800001aa:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
800001ae:	3007a073          	csrs	mstatus,a5
800001b2:	00000517          	auipc	a0,0x0
800001b6:	eea50513          	add	a0,a0,-278 # 8000009c <done>
800001ba:	2139                	jal	800005c8 <set_mepc>
800001bc:	30200073          	mret
800001c0:	200027b7          	lui	a5,0x20002
800001c4:	17fd                	add	a5,a5,-1 # 20001fff <boot-0x5fffe001>
800001c6:	3b179073          	csrw	pmpaddr1,a5
800001ca:	6789                	lui	a5,0x2
800001cc:	f1178793          	add	a5,a5,-239 # 1f11 <boot-0x7fffe0ef>
800001d0:	3a079073          	csrw	pmpcfg0,a5
800001d4:	4799                	li	a5,6
800001d6:	00000517          	auipc	a0,0x0
800001da:	f7650513          	add	a0,a0,-138 # 8000014c <supervisor_main>
800001de:	c01c                	sw	a5,0(s0)
800001e0:	26e5                	jal	800005c8 <set_mepc>
800001e2:	30200073          	mret

800001e6 <print_string>:
800001e6:	00054783          	lbu	a5,0(a0)
800001ea:	cb81                	beqz	a5,800001fa <print_string+0x14>
800001ec:	0505                	add	a0,a0,1
800001ee:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
800001f2:	00054783          	lbu	a5,0(a0)
800001f6:	0505                	add	a0,a0,1
800001f8:	fbfd                	bnez	a5,800001ee <print_string+0x8>
800001fa:	8082                	ret

800001fc <vformat>:
800001fc:	00054683          	lbu	a3,0(a0)
80000200:	ce85                	beqz	a3,80000238 <vformat+0x3c>
80000202:	4781                	li	a5,0
80000204:	4801                	li	a6,0
80000206:	4881                	li	a7,0
80000208:	872e                	mv	a4,a1
8000020a:	02500e13          	li	t3,37
8000020e:	03f00e93          	li	t4,63
80000212:	4fd9                	li	t6,22
80000214:	f9418f13          	add	t5,gp,-108 # 800009a4 <fromhost+0x178>
80000218:	833a                	mv	t1,a4
8000021a:	03c68263          	beq	a3,t3,8000023e <vformat+0x42>
8000021e:	0805                	add	a6,a6,1
80000220:	00d70023          	sb	a3,0(a4)
80000224:	01058733          	add	a4,a1,a6
80000228:	0785                	add	a5,a5,1
8000022a:	00f506b3          	add	a3,a0,a5
8000022e:	0006c683          	lbu	a3,0(a3)
80000232:	88be                	mv	a7,a5
80000234:	f2f5                	bnez	a3,80000218 <vformat+0x1c>
80000236:	85ba                	mv	a1,a4
80000238:	00058023          	sb	zero,0(a1)
8000023c:	8082                	ret
8000023e:	98aa                	add	a7,a7,a0
80000240:	0018c683          	lbu	a3,1(a7)
80000244:	2a068263          	beqz	a3,800004e8 <vformat+0x2ec>
80000248:	2dc68463          	beq	a3,t3,80000510 <vformat+0x314>
8000024c:	f9e68693          	add	a3,a3,-98
80000250:	0ff6f693          	zext.b	a3,a3
80000254:	2cdfe563          	bltu	t6,a3,8000051e <vformat+0x322>
80000258:	7139                	add	sp,sp,-64
8000025a:	de22                	sw	s0,60(sp)
8000025c:	dc26                	sw	s1,56(sp)
8000025e:	da4a                	sw	s2,52(sp)
80000260:	d84e                	sw	s3,48(sp)
80000262:	d652                	sw	s4,44(sp)
80000264:	068a                	sll	a3,a3,0x2
80000266:	96fa                	add	a3,a3,t5
80000268:	4294                	lw	a3,0(a3)
8000026a:	96fa                	add	a3,a3,t5
8000026c:	8682                	jr	a3
8000026e:	98aa                	add	a7,a7,a0
80000270:	0018c683          	lbu	a3,1(a7)
80000274:	1e068563          	beqz	a3,8000045e <vformat+0x262>
80000278:	21c68163          	beq	a3,t3,8000047a <vformat+0x27e>
8000027c:	f9e68693          	add	a3,a3,-98
80000280:	0ff6f693          	zext.b	a3,a3
80000284:	fedff0e3          	bgeu	t6,a3,80000264 <vformat+0x68>
80000288:	03f00893          	li	a7,63
8000028c:	00280693          	add	a3,a6,2
80000290:	01170023          	sb	a7,0(a4)
80000294:	011700a3          	sb	a7,1(a4)
80000298:	080d                	add	a6,a6,3
8000029a:	00d58733          	add	a4,a1,a3
8000029e:	01170023          	sb	a7,0(a4)
800002a2:	01058733          	add	a4,a1,a6
800002a6:	0785                	add	a5,a5,1
800002a8:	0785                	add	a5,a5,1
800002aa:	00f506b3          	add	a3,a0,a5
800002ae:	0006c683          	lbu	a3,0(a3)
800002b2:	88be                	mv	a7,a5
800002b4:	c285                	beqz	a3,800002d4 <vformat+0xd8>
800002b6:	833a                	mv	t1,a4
800002b8:	fbc68be3          	beq	a3,t3,8000026e <vformat+0x72>
800002bc:	0785                	add	a5,a5,1
800002be:	00d70023          	sb	a3,0(a4)
800002c2:	00f506b3          	add	a3,a0,a5
800002c6:	0006c683          	lbu	a3,0(a3)
800002ca:	0805                	add	a6,a6,1
800002cc:	01058733          	add	a4,a1,a6
800002d0:	88be                	mv	a7,a5
800002d2:	f2f5                	bnez	a3,800002b6 <vformat+0xba>
800002d4:	00070023          	sb	zero,0(a4)
800002d8:	5472                	lw	s0,60(sp)
800002da:	54e2                	lw	s1,56(sp)
800002dc:	5952                	lw	s2,52(sp)
800002de:	59c2                	lw	s3,48(sp)
800002e0:	5a32                	lw	s4,44(sp)
800002e2:	6121                	add	sp,sp,64
800002e4:	8082                	ret
800002e6:	00062303          	lw	t1,0(a2)
800002ea:	03000693          	li	a3,48
800002ee:	07800893          	li	a7,120
800002f2:	0809                	add	a6,a6,2
800002f4:	00d70023          	sb	a3,0(a4)
800002f8:	011700a3          	sb	a7,1(a4)
800002fc:	0611                	add	a2,a2,4
800002fe:	010583b3          	add	t2,a1,a6
80000302:	18030263          	beqz	t1,80000486 <vformat+0x28a>
80000306:	4881                	li	a7,0
80000308:	868a                	mv	a3,sp
8000030a:	ff018293          	add	t0,gp,-16 # 80000a00 <table>
8000030e:	00f37713          	and	a4,t1,15
80000312:	9716                	add	a4,a4,t0
80000314:	00074483          	lbu	s1,0(a4)
80000318:	8746                	mv	a4,a7
8000031a:	0885                	add	a7,a7,1
8000031c:	01168433          	add	s0,a3,a7
80000320:	fe940fa3          	sb	s1,-1(s0)
80000324:	00435313          	srl	t1,t1,0x4
80000328:	fe0313e3          	bnez	t1,8000030e <vformat+0x112>
8000032c:	9736                	add	a4,a4,a3
8000032e:	831e                	mv	t1,t2
80000330:	00074383          	lbu	t2,0(a4)
80000334:	82ba                	mv	t0,a4
80000336:	0305                	add	t1,t1,1
80000338:	fe730fa3          	sb	t2,-1(t1)
8000033c:	177d                	add	a4,a4,-1
8000033e:	fe5699e3          	bne	a3,t0,80000330 <vformat+0x134>
80000342:	9846                	add	a6,a6,a7
80000344:	01058733          	add	a4,a1,a6
80000348:	bfb9                	j	800002a6 <vformat+0xaa>
8000034a:	00062383          	lw	t2,0(a2)
8000034e:	0611                	add	a2,a2,4
80000350:	1a038a63          	beqz	t2,80000504 <vformat+0x308>
80000354:	4301                	li	t1,0
80000356:	868a                	mv	a3,sp
80000358:	ff018293          	add	t0,gp,-16 # 80000a00 <table>
8000035c:	44a9                	li	s1,10
8000035e:	4a25                	li	s4,9
80000360:	0293f433          	remu	s0,t2,s1
80000364:	889a                	mv	a7,t1
80000366:	0305                	add	t1,t1,1
80000368:	006689b3          	add	s3,a3,t1
8000036c:	891e                	mv	s2,t2
8000036e:	9416                	add	s0,s0,t0
80000370:	00044403          	lbu	s0,0(s0)
80000374:	0293d3b3          	divu	t2,t2,s1
80000378:	fe898fa3          	sb	s0,-1(s3)
8000037c:	ff2a62e3          	bltu	s4,s2,80000360 <vformat+0x164>
80000380:	98b6                	add	a7,a7,a3
80000382:	0008c383          	lbu	t2,0(a7)
80000386:	82c6                	mv	t0,a7
80000388:	0705                	add	a4,a4,1
8000038a:	fe770fa3          	sb	t2,-1(a4)
8000038e:	18fd                	add	a7,a7,-1
80000390:	fe5699e3          	bne	a3,t0,80000382 <vformat+0x186>
80000394:	981a                	add	a6,a6,t1
80000396:	01058733          	add	a4,a1,a6
8000039a:	b731                	j	800002a6 <vformat+0xaa>
8000039c:	00062283          	lw	t0,0(a2)
800003a0:	0611                	add	a2,a2,4
800003a2:	0002c883          	lbu	a7,0(t0)
800003a6:	f00880e3          	beqz	a7,800002a6 <vformat+0xaa>
800003aa:	4681                	li	a3,0
800003ac:	00d70333          	add	t1,a4,a3
800003b0:	0685                	add	a3,a3,1
800003b2:	01130023          	sb	a7,0(t1)
800003b6:	00d288b3          	add	a7,t0,a3
800003ba:	0008c883          	lbu	a7,0(a7)
800003be:	fe0897e3          	bnez	a7,800003ac <vformat+0x1b0>
800003c2:	9836                	add	a6,a6,a3
800003c4:	01058733          	add	a4,a1,a6
800003c8:	bdf9                	j	800002a6 <vformat+0xaa>
800003ca:	00062883          	lw	a7,0(a2)
800003ce:	0611                	add	a2,a2,4
800003d0:	0c08c263          	bltz	a7,80000494 <vformat+0x298>
800003d4:	0c089963          	bnez	a7,800004a6 <vformat+0x2aa>
800003d8:	03000693          	li	a3,48
800003dc:	00d70023          	sb	a3,0(a4)
800003e0:	4385                	li	t2,1
800003e2:	981e                	add	a6,a6,t2
800003e4:	01058733          	add	a4,a1,a6
800003e8:	bd7d                	j	800002a6 <vformat+0xaa>
800003ea:	4214                	lw	a3,0(a2)
800003ec:	0805                	add	a6,a6,1
800003ee:	0611                	add	a2,a2,4
800003f0:	00d70023          	sb	a3,0(a4)
800003f4:	01058733          	add	a4,a1,a6
800003f8:	b57d                	j	800002a6 <vformat+0xaa>
800003fa:	00062303          	lw	t1,0(a2)
800003fe:	03000693          	li	a3,48
80000402:	06200893          	li	a7,98
80000406:	0809                	add	a6,a6,2
80000408:	00d70023          	sb	a3,0(a4)
8000040c:	011700a3          	sb	a7,1(a4)
80000410:	0611                	add	a2,a2,4
80000412:	010583b3          	add	t2,a1,a6
80000416:	06030863          	beqz	t1,80000486 <vformat+0x28a>
8000041a:	4881                	li	a7,0
8000041c:	868a                	mv	a3,sp
8000041e:	ff018293          	add	t0,gp,-16 # 80000a00 <table>
80000422:	00137713          	and	a4,t1,1
80000426:	9716                	add	a4,a4,t0
80000428:	00074483          	lbu	s1,0(a4)
8000042c:	8746                	mv	a4,a7
8000042e:	0885                	add	a7,a7,1
80000430:	01168433          	add	s0,a3,a7
80000434:	fe940fa3          	sb	s1,-1(s0)
80000438:	00135313          	srl	t1,t1,0x1
8000043c:	fe0313e3          	bnez	t1,80000422 <vformat+0x226>
80000440:	9736                	add	a4,a4,a3
80000442:	831e                	mv	t1,t2
80000444:	00074383          	lbu	t2,0(a4)
80000448:	82ba                	mv	t0,a4
8000044a:	0305                	add	t1,t1,1
8000044c:	fe730fa3          	sb	t2,-1(t1)
80000450:	177d                	add	a4,a4,-1
80000452:	fe5699e3          	bne	a3,t0,80000444 <vformat+0x248>
80000456:	9846                	add	a6,a6,a7
80000458:	01058733          	add	a4,a1,a6
8000045c:	b5a9                	j	800002a6 <vformat+0xaa>
8000045e:	00280693          	add	a3,a6,2
80000462:	01d70023          	sb	t4,0(a4)
80000466:	01d700a3          	sb	t4,1(a4)
8000046a:	080d                	add	a6,a6,3
8000046c:	00d58733          	add	a4,a1,a3
80000470:	01d70023          	sb	t4,0(a4)
80000474:	01058733          	add	a4,a1,a6
80000478:	bd05                	j	800002a8 <vformat+0xac>
8000047a:	0805                	add	a6,a6,1
8000047c:	01c70023          	sb	t3,0(a4)
80000480:	01058733          	add	a4,a1,a6
80000484:	b50d                	j	800002a6 <vformat+0xaa>
80000486:	4885                	li	a7,1
80000488:	9846                	add	a6,a6,a7
8000048a:	00d38023          	sb	a3,0(t2)
8000048e:	01058733          	add	a4,a1,a6
80000492:	bd11                	j	800002a6 <vformat+0xaa>
80000494:	0805                	add	a6,a6,1
80000496:	02d00693          	li	a3,45
8000049a:	00d70023          	sb	a3,0(a4)
8000049e:	411008b3          	neg	a7,a7
800004a2:	01058333          	add	t1,a1,a6
800004a6:	4381                	li	t2,0
800004a8:	868a                	mv	a3,sp
800004aa:	ff018293          	add	t0,gp,-16 # 80000a00 <table>
800004ae:	44a9                	li	s1,10
800004b0:	4a25                	li	s4,9
800004b2:	0298f433          	remu	s0,a7,s1
800004b6:	871e                	mv	a4,t2
800004b8:	0385                	add	t2,t2,1
800004ba:	007689b3          	add	s3,a3,t2
800004be:	8946                	mv	s2,a7
800004c0:	9416                	add	s0,s0,t0
800004c2:	00044403          	lbu	s0,0(s0)
800004c6:	0298d8b3          	divu	a7,a7,s1
800004ca:	fe898fa3          	sb	s0,-1(s3)
800004ce:	ff2a62e3          	bltu	s4,s2,800004b2 <vformat+0x2b6>
800004d2:	9736                	add	a4,a4,a3
800004d4:	00074283          	lbu	t0,0(a4)
800004d8:	88ba                	mv	a7,a4
800004da:	0305                	add	t1,t1,1
800004dc:	fe530fa3          	sb	t0,-1(t1)
800004e0:	177d                	add	a4,a4,-1
800004e2:	ff1699e3          	bne	a3,a7,800004d4 <vformat+0x2d8>
800004e6:	bdf5                	j	800003e2 <vformat+0x1e6>
800004e8:	00280693          	add	a3,a6,2
800004ec:	01d70023          	sb	t4,0(a4)
800004f0:	01d700a3          	sb	t4,1(a4)
800004f4:	080d                	add	a6,a6,3
800004f6:	00d58733          	add	a4,a1,a3
800004fa:	01d70023          	sb	t4,0(a4)
800004fe:	01058733          	add	a4,a1,a6
80000502:	b31d                	j	80000228 <vformat+0x2c>
80000504:	03000693          	li	a3,48
80000508:	00d70023          	sb	a3,0(a4)
8000050c:	4305                	li	t1,1
8000050e:	b559                	j	80000394 <vformat+0x198>
80000510:	0805                	add	a6,a6,1
80000512:	01c70023          	sb	t3,0(a4)
80000516:	0785                	add	a5,a5,1
80000518:	01058733          	add	a4,a1,a6
8000051c:	b331                	j	80000228 <vformat+0x2c>
8000051e:	03f00893          	li	a7,63
80000522:	00280693          	add	a3,a6,2
80000526:	01170023          	sb	a7,0(a4)
8000052a:	011700a3          	sb	a7,1(a4)
8000052e:	080d                	add	a6,a6,3
80000530:	00d58733          	add	a4,a1,a3
80000534:	01170023          	sb	a7,0(a4)
80000538:	0785                	add	a5,a5,1
8000053a:	01058733          	add	a4,a1,a6
8000053e:	b1ed                	j	80000228 <vformat+0x2c>

80000540 <vprint>:
80000540:	7175                	add	sp,sp,-144
80000542:	862e                	mv	a2,a1
80000544:	858a                	mv	a1,sp
80000546:	c706                	sw	ra,140(sp)
80000548:	3955                	jal	800001fc <vformat>
8000054a:	00014783          	lbu	a5,0(sp)
8000054e:	cb89                	beqz	a5,80000560 <vprint+0x20>
80000550:	00110713          	add	a4,sp,1
80000554:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
80000558:	00074783          	lbu	a5,0(a4)
8000055c:	0705                	add	a4,a4,1
8000055e:	fbfd                	bnez	a5,80000554 <vprint+0x14>
80000560:	40ba                	lw	ra,140(sp)
80000562:	6149                	add	sp,sp,144
80000564:	8082                	ret

80000566 <print>:
80000566:	7139                	add	sp,sp,-64
80000568:	02410313          	add	t1,sp,36
8000056c:	d22e                	sw	a1,36(sp)
8000056e:	859a                	mv	a1,t1
80000570:	ce06                	sw	ra,28(sp)
80000572:	d432                	sw	a2,40(sp)
80000574:	d636                	sw	a3,44(sp)
80000576:	d83a                	sw	a4,48(sp)
80000578:	da3e                	sw	a5,52(sp)
8000057a:	dc42                	sw	a6,56(sp)
8000057c:	de46                	sw	a7,60(sp)
8000057e:	c61a                	sw	t1,12(sp)
80000580:	37c1                	jal	80000540 <vprint>
80000582:	40f2                	lw	ra,28(sp)
80000584:	6121                	add	sp,sp,64
80000586:	8082                	ret

80000588 <format>:
80000588:	7139                	add	sp,sp,-64
8000058a:	02810313          	add	t1,sp,40
8000058e:	d432                	sw	a2,40(sp)
80000590:	861a                	mv	a2,t1
80000592:	ce06                	sw	ra,28(sp)
80000594:	d636                	sw	a3,44(sp)
80000596:	d83a                	sw	a4,48(sp)
80000598:	da3e                	sw	a5,52(sp)
8000059a:	dc42                	sw	a6,56(sp)
8000059c:	de46                	sw	a7,60(sp)
8000059e:	c61a                	sw	t1,12(sp)
800005a0:	39b1                	jal	800001fc <vformat>
800005a2:	40f2                	lw	ra,28(sp)
800005a4:	6121                	add	sp,sp,64
800005a6:	8082                	ret

800005a8 <dprint>:
800005a8:	1101                	add	sp,sp,-32
800005aa:	c22e                	sw	a1,4(sp)
800005ac:	c432                	sw	a2,8(sp)
800005ae:	c636                	sw	a3,12(sp)
800005b0:	c83a                	sw	a4,16(sp)
800005b2:	ca3e                	sw	a5,20(sp)
800005b4:	cc42                	sw	a6,24(sp)
800005b6:	ce46                	sw	a7,28(sp)
800005b8:	6105                	add	sp,sp,32
800005ba:	8082                	ret

800005bc <advance_mepc>:
800005bc:	341027f3          	csrr	a5,mepc
800005c0:	953e                	add	a0,a0,a5
800005c2:	34151073          	csrw	mepc,a0
800005c6:	8082                	ret

800005c8 <set_mepc>:
800005c8:	34151073          	csrw	mepc,a0
800005cc:	8082                	ret

800005ce <advance_sepc>:
800005ce:	141027f3          	csrr	a5,sepc
800005d2:	953e                	add	a0,a0,a5
800005d4:	14151073          	csrw	sepc,a0
800005d8:	8082                	ret

800005da <set_sepc>:
800005da:	14151073          	csrw	sepc,a0
800005de:	8082                	ret

800005e0 <setup_interrupts_m>:
800005e0:	30551073          	csrw	mtvec,a0
800005e4:	30459073          	csrw	mie,a1
800005e8:	8082                	ret

800005ea <setup_interrupt_m_vectored>:
800005ea:	00156513          	or	a0,a0,1
800005ee:	30551073          	csrw	mtvec,a0
800005f2:	30459073          	csrw	mie,a1
800005f6:	8082                	ret

800005f8 <enable_interrupts_m>:
800005f8:	47a1                	li	a5,8
800005fa:	3007a073          	csrs	mstatus,a5
800005fe:	8082                	ret

80000600 <disable_interrupts_m>:
80000600:	47a1                	li	a5,8
80000602:	3007b073          	csrc	mstatus,a5
80000606:	8082                	ret

80000608 <enable_interrupts_save_m>:
80000608:	30051073          	csrw	mstatus,a0
8000060c:	8082                	ret

8000060e <disable_interrupts_save_m>:
8000060e:	4521                	li	a0,8
80000610:	30053573          	csrrc	a0,mstatus,a0
80000614:	8082                	ret

80000616 <check_supervisor_mode_available>:
80000616:	6785                	lui	a5,0x1
80000618:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
8000061c:	3007a573          	csrrs	a0,mstatus,a5
80000620:	30051573          	csrrw	a0,mstatus,a0
80000624:	6789                	lui	a5,0x2
80000626:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
8000062a:	8d7d                	and	a0,a0,a5
8000062c:	80050513          	add	a0,a0,-2048
80000630:	00153513          	seqz	a0,a0
80000634:	8082                	ret

80000636 <require_supervisor_mode>:
80000636:	6785                	lui	a5,0x1
80000638:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
8000063c:	3007a7f3          	csrrs	a5,mstatus,a5
80000640:	300797f3          	csrrw	a5,mstatus,a5
80000644:	6709                	lui	a4,0x2
80000646:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
8000064a:	8ff9                	and	a5,a5,a4
8000064c:	80078793          	add	a5,a5,-2048
80000650:	e391                	bnez	a5,80000654 <require_supervisor_mode+0x1e>
80000652:	8082                	ret
80000654:	1141                	add	sp,sp,-16
80000656:	00000517          	auipc	a0,0x0
8000065a:	22250513          	add	a0,a0,546 # 80000878 <fromhost+0x4c>
8000065e:	c606                	sw	ra,12(sp)
80000660:	3719                	jal	80000566 <print>
80000662:	57fd                	li	a5,-1
80000664:	e0f1aa23          	sw	a5,-492(gp) # 80000824 <flag>
80000668:	3c15                	jal	8000009c <done>

8000066a <read_exception_context>:
8000066a:	c00027f3          	rdcycle	a5
8000066e:	c55c                	sw	a5,12(a0)
80000670:	c01027f3          	rdtime	a5
80000674:	c91c                	sw	a5,16(a0)
80000676:	342027f3          	csrr	a5,mcause
8000067a:	c51c                	sw	a5,8(a0)
8000067c:	341027f3          	csrr	a5,mepc
80000680:	c11c                	sw	a5,0(a0)
80000682:	343027f3          	csrr	a5,mtval
80000686:	c15c                	sw	a5,4(a0)
80000688:	c03027f3          	csrr	a5,hpmcounter3
8000068c:	c95c                	sw	a5,20(a0)
8000068e:	c04027f3          	csrr	a5,hpmcounter4
80000692:	cd1c                	sw	a5,24(a0)
80000694:	8082                	ret

80000696 <read_exception_context_s>:
80000696:	c00027f3          	rdcycle	a5
8000069a:	c55c                	sw	a5,12(a0)
8000069c:	c01027f3          	rdtime	a5
800006a0:	c91c                	sw	a5,16(a0)
800006a2:	142027f3          	csrr	a5,scause
800006a6:	c51c                	sw	a5,8(a0)
800006a8:	141027f3          	csrr	a5,sepc
800006ac:	c11c                	sw	a5,0(a0)
800006ae:	143027f3          	csrr	a5,stval
800006b2:	c15c                	sw	a5,4(a0)
800006b4:	c03027f3          	csrr	a5,hpmcounter3
800006b8:	c95c                	sw	a5,20(a0)
800006ba:	c04027f3          	csrr	a5,hpmcounter4
800006be:	cd1c                	sw	a5,24(a0)
800006c0:	8082                	ret

800006c2 <print_exception_context>:
800006c2:	1141                	add	sp,sp,-16
800006c4:	c422                	sw	s0,8(sp)
800006c6:	842a                	mv	s0,a0
800006c8:	00000517          	auipc	a0,0x0
800006cc:	1d450513          	add	a0,a0,468 # 8000089c <fromhost+0x70>
800006d0:	c606                	sw	ra,12(sp)
800006d2:	3d51                	jal	80000566 <print>
800006d4:	440c                	lw	a1,8(s0)
800006d6:	00000517          	auipc	a0,0x0
800006da:	1de50513          	add	a0,a0,478 # 800008b4 <fromhost+0x88>
800006de:	3561                	jal	80000566 <print>
800006e0:	400c                	lw	a1,0(s0)
800006e2:	00000517          	auipc	a0,0x0
800006e6:	1e250513          	add	a0,a0,482 # 800008c4 <fromhost+0x98>
800006ea:	3db5                	jal	80000566 <print>
800006ec:	404c                	lw	a1,4(s0)
800006ee:	00000517          	auipc	a0,0x0
800006f2:	1e650513          	add	a0,a0,486 # 800008d4 <fromhost+0xa8>
800006f6:	3d85                	jal	80000566 <print>
800006f8:	444c                	lw	a1,12(s0)
800006fa:	00000517          	auipc	a0,0x0
800006fe:	1ea50513          	add	a0,a0,490 # 800008e4 <fromhost+0xb8>
80000702:	3595                	jal	80000566 <print>
80000704:	480c                	lw	a1,16(s0)
80000706:	00000517          	auipc	a0,0x0
8000070a:	1ee50513          	add	a0,a0,494 # 800008f4 <fromhost+0xc8>
8000070e:	3da1                	jal	80000566 <print>
80000710:	484c                	lw	a1,20(s0)
80000712:	00000517          	auipc	a0,0x0
80000716:	1f250513          	add	a0,a0,498 # 80000904 <fromhost+0xd8>
8000071a:	35b1                	jal	80000566 <print>
8000071c:	4c0c                	lw	a1,24(s0)
8000071e:	4422                	lw	s0,8(sp)
80000720:	40b2                	lw	ra,12(sp)
80000722:	00000517          	auipc	a0,0x0
80000726:	1f250513          	add	a0,a0,498 # 80000914 <fromhost+0xe8>
8000072a:	0141                	add	sp,sp,16
8000072c:	bd2d                	j	80000566 <print>
	...

80000730 <default_handler>:
80000730:	711d                	add	sp,sp,-96
80000732:	c6aa                	sw	a0,76(sp)
80000734:	0048                	add	a0,sp,4
80000736:	ce86                	sw	ra,92(sp)
80000738:	cc96                	sw	t0,88(sp)
8000073a:	ca9a                	sw	t1,84(sp)
8000073c:	c89e                	sw	t2,80(sp)
8000073e:	c4ae                	sw	a1,72(sp)
80000740:	c2b2                	sw	a2,68(sp)
80000742:	c0b6                	sw	a3,64(sp)
80000744:	de3a                	sw	a4,60(sp)
80000746:	dc3e                	sw	a5,56(sp)
80000748:	da42                	sw	a6,52(sp)
8000074a:	d846                	sw	a7,48(sp)
8000074c:	d672                	sw	t3,44(sp)
8000074e:	d476                	sw	t4,40(sp)
80000750:	d27a                	sw	t5,36(sp)
80000752:	d07e                	sw	t6,32(sp)
80000754:	3f19                	jal	8000066a <read_exception_context>
80000756:	0048                	add	a0,sp,4
80000758:	37ad                	jal	800006c2 <print_exception_context>
8000075a:	00000517          	auipc	a0,0x0
8000075e:	1ca50513          	add	a0,a0,458 # 80000924 <fromhost+0xf8>
80000762:	3511                	jal	80000566 <print>
80000764:	3a25                	jal	8000009c <done>

80000766 <unreachable_handler>:
80000766:	711d                	add	sp,sp,-96
80000768:	c6aa                	sw	a0,76(sp)
8000076a:	0048                	add	a0,sp,4
8000076c:	ce86                	sw	ra,92(sp)
8000076e:	cc96                	sw	t0,88(sp)
80000770:	ca9a                	sw	t1,84(sp)
80000772:	c89e                	sw	t2,80(sp)
80000774:	c4ae                	sw	a1,72(sp)
80000776:	c2b2                	sw	a2,68(sp)
80000778:	c0b6                	sw	a3,64(sp)
8000077a:	de3a                	sw	a4,60(sp)
8000077c:	dc3e                	sw	a5,56(sp)
8000077e:	da42                	sw	a6,52(sp)
80000780:	d846                	sw	a7,48(sp)
80000782:	d672                	sw	t3,44(sp)
80000784:	d476                	sw	t4,40(sp)
80000786:	d27a                	sw	t5,36(sp)
80000788:	d07e                	sw	t6,32(sp)
8000078a:	35c5                	jal	8000066a <read_exception_context>
8000078c:	0048                	add	a0,sp,4
8000078e:	3f15                	jal	800006c2 <print_exception_context>
80000790:	00000517          	auipc	a0,0x0
80000794:	1c050513          	add	a0,a0,448 # 80000950 <fromhost+0x124>
80000798:	33f9                	jal	80000566 <print>
8000079a:	903ff0ef          	jal	8000009c <done>

8000079e <test_pass>:
8000079e:	1141                	add	sp,sp,-16
800007a0:	85aa                	mv	a1,a0
800007a2:	00000517          	auipc	a0,0x0
800007a6:	1fe50513          	add	a0,a0,510 # 800009a0 <fromhost+0x174>
800007aa:	c606                	sw	ra,12(sp)
800007ac:	3b6d                	jal	80000566 <print>
800007ae:	40b2                	lw	ra,12(sp)
800007b0:	4785                	li	a5,1
800007b2:	e0f1aa23          	sw	a5,-492(gp) # 80000824 <flag>
800007b6:	0141                	add	sp,sp,16
800007b8:	8082                	ret

800007ba <test_fail>:
800007ba:	1141                	add	sp,sp,-16
800007bc:	85aa                	mv	a1,a0
800007be:	00000517          	auipc	a0,0x0
800007c2:	1e250513          	add	a0,a0,482 # 800009a0 <fromhost+0x174>
800007c6:	c606                	sw	ra,12(sp)
800007c8:	3b79                	jal	80000566 <print>
800007ca:	40b2                	lw	ra,12(sp)
800007cc:	e001aa23          	sw	zero,-492(gp) # 80000824 <flag>
800007d0:	0141                	add	sp,sp,16
800007d2:	8082                	ret
	...

800007e0 <vector_table>:
800007e0:	f51ff06f          	j	80000730 <default_handler>
800007e4:	f4dff06f          	j	80000730 <default_handler>
800007e8:	f7fff06f          	j	80000766 <unreachable_handler>
800007ec:	f45ff06f          	j	80000730 <default_handler>
800007f0:	f77ff06f          	j	80000766 <unreachable_handler>
800007f4:	f3dff06f          	j	80000730 <default_handler>
800007f8:	f6fff06f          	j	80000766 <unreachable_handler>
800007fc:	f35ff06f          	j	80000730 <default_handler>
80000800:	f67ff06f          	j	80000766 <unreachable_handler>
80000804:	f2dff06f          	j	80000730 <default_handler>
80000808:	f5fff06f          	j	80000766 <unreachable_handler>
8000080c:	f25ff06f          	j	80000730 <default_handler>
80000810:	f57ff06f          	j	80000766 <unreachable_handler>
80000814:	f1dff06f          	j	80000730 <default_handler>
80000818:	f4fff06f          	j	80000766 <unreachable_handler>
8000081c:	f4bff06f          	j	80000766 <unreachable_handler>
	...
