
build/u-mode/u-mode:     file format elf32-littleriscv


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
8000004a:	98a18193          	add	gp,gp,-1654 # 800009d0 <__bss_end>

8000004e <clr_bss>:
8000004e:	00018293          	mv	t0,gp
80000052:	00018313          	mv	t1,gp
80000056:	00628763          	beq	t0,t1,80000064 <do_preinit_arr>

8000005a <clr_bss_loop>:
8000005a:	00028023          	sb	zero,0(t0)
8000005e:	0285                	add	t0,t0,1
80000060:	fe535de3          	bge	t1,t0,8000005a <clr_bss_loop>

80000064 <do_preinit_arr>:
80000064:	e2218413          	add	s0,gp,-478 # 800007f2 <__init_array_end>
80000068:	e2218493          	add	s1,gp,-478 # 800007f2 <__init_array_end>
8000006c:	00940963          	beq	s0,s1,8000007e <do_init_arr>

80000070 <preinit_arr_calls>:
80000070:	00042903          	lw	s2,0(s0)
80000074:	000900e7          	jalr	s2
80000078:	0411                	add	s0,s0,4
8000007a:	fe941be3          	bne	s0,s1,80000070 <preinit_arr_calls>

8000007e <do_init_arr>:
8000007e:	e2218413          	add	s0,gp,-478 # 800007f2 <__init_array_end>
80000082:	e2218493          	add	s1,gp,-478 # 800007f2 <__init_array_end>
80000086:	00940963          	beq	s0,s1,80000098 <enter_main>

8000008a <init_arr_calls>:
8000008a:	00042903          	lw	s2,0(s0)
8000008e:	000900e7          	jalr	s2
80000092:	0411                	add	s0,s0,4
80000094:	fc941ee3          	bne	s0,s1,80000070 <preinit_arr_calls>

80000098 <enter_main>:
80000098:	0b6000ef          	jal	8000014e <main>

8000009c <done>:
8000009c:	e2418d93          	add	s11,gp,-476 # 800007f4 <flag>
800000a0:	000dae03          	lw	t3,0(s11)
800000a4:	e2818d93          	add	s11,gp,-472 # 800007f8 <tohost>
800000a8:	01cda023          	sw	t3,0(s11)

800000ac <__sim_halt>:
800000ac:	a001                	j	800000ac <__sim_halt>

800000ae <user_main>:
800000ae:	1141                	add	sp,sp,-16
800000b0:	00000517          	auipc	a0,0x0
800000b4:	75050513          	add	a0,a0,1872 # 80000800 <fromhost+0x4>
800000b8:	c606                	sw	ra,12(sp)
800000ba:	2149                	jal	8000053c <print>
800000bc:	e201a223          	sw	zero,-476(gp) # 800007f4 <flag>
800000c0:	30200073          	mret
800000c4:	300027f3          	csrr	a5,mstatus
800000c8:	10500073          	wfi
800000cc:	00000073          	ecall

800000d0 <handler>:
800000d0:	711d                	add	sp,sp,-96
800000d2:	c6aa                	sw	a0,76(sp)
800000d4:	0048                	add	a0,sp,4
800000d6:	de3a                	sw	a4,60(sp)
800000d8:	dc3e                	sw	a5,56(sp)
800000da:	ce86                	sw	ra,92(sp)
800000dc:	cc96                	sw	t0,88(sp)
800000de:	ca9a                	sw	t1,84(sp)
800000e0:	c89e                	sw	t2,80(sp)
800000e2:	c4ae                	sw	a1,72(sp)
800000e4:	c2b2                	sw	a2,68(sp)
800000e6:	c0b6                	sw	a3,64(sp)
800000e8:	da42                	sw	a6,52(sp)
800000ea:	d846                	sw	a7,48(sp)
800000ec:	d672                	sw	t3,44(sp)
800000ee:	d476                	sw	t4,40(sp)
800000f0:	d27a                	sw	t5,36(sp)
800000f2:	d07e                	sw	t6,32(sp)
800000f4:	23b1                	jal	80000640 <read_exception_context>
800000f6:	0048                	add	a0,sp,4
800000f8:	2345                	jal	80000698 <print_exception_context>
800000fa:	4732                	lw	a4,12(sp)
800000fc:	47a1                	li	a5,8
800000fe:	02f70c63          	beq	a4,a5,80000136 <handler+0x66>
80000102:	4511                	li	a0,4
80000104:	2179                	jal	80000592 <advance_mepc>
80000106:	e2418713          	add	a4,gp,-476 # 800007f4 <flag>
8000010a:	431c                	lw	a5,0(a4)
8000010c:	17fd                	add	a5,a5,-1
8000010e:	c31c                	sw	a5,0(a4)
80000110:	40f6                	lw	ra,92(sp)
80000112:	42e6                	lw	t0,88(sp)
80000114:	4356                	lw	t1,84(sp)
80000116:	43c6                	lw	t2,80(sp)
80000118:	4536                	lw	a0,76(sp)
8000011a:	45a6                	lw	a1,72(sp)
8000011c:	4616                	lw	a2,68(sp)
8000011e:	4686                	lw	a3,64(sp)
80000120:	5772                	lw	a4,60(sp)
80000122:	57e2                	lw	a5,56(sp)
80000124:	5852                	lw	a6,52(sp)
80000126:	58c2                	lw	a7,48(sp)
80000128:	5e32                	lw	t3,44(sp)
8000012a:	5ea2                	lw	t4,40(sp)
8000012c:	5f12                	lw	t5,36(sp)
8000012e:	5f82                	lw	t6,32(sp)
80000130:	6125                	add	sp,sp,96
80000132:	30200073          	mret
80000136:	6789                	lui	a5,0x2
80000138:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
8000013c:	3007a073          	csrs	mstatus,a5
80000140:	00000517          	auipc	a0,0x0
80000144:	f5c50513          	add	a0,a0,-164 # 8000009c <done>
80000148:	2999                	jal	8000059e <set_mepc>
8000014a:	b7d9                	j	80000110 <handler+0x40>
	...

8000014e <main>:
8000014e:	1141                	add	sp,sp,-16
80000150:	4581                	li	a1,0
80000152:	00000517          	auipc	a0,0x0
80000156:	f7e50513          	add	a0,a0,-130 # 800000d0 <handler>
8000015a:	c422                	sw	s0,8(sp)
8000015c:	c606                	sw	ra,12(sp)
8000015e:	e2418413          	add	s0,gp,-476 # 800007f4 <flag>
80000162:	2991                	jal	800005b6 <setup_interrupts_m>
80000164:	00245793          	srl	a5,s0,0x2
80000168:	3b079073          	csrw	pmpaddr0,a5
8000016c:	3b002773          	csrr	a4,pmpaddr0
80000170:	02e78363          	beq	a5,a4,80000196 <main+0x48>
80000174:	00000517          	auipc	a0,0x0
80000178:	69050513          	add	a0,a0,1680 # 80000804 <fromhost+0x8>
8000017c:	26c1                	jal	8000053c <print>
8000017e:	6789                	lui	a5,0x2
80000180:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
80000184:	3007a073          	csrs	mstatus,a5
80000188:	00000517          	auipc	a0,0x0
8000018c:	f1450513          	add	a0,a0,-236 # 8000009c <done>
80000190:	2139                	jal	8000059e <set_mepc>
80000192:	30200073          	mret
80000196:	200027b7          	lui	a5,0x20002
8000019a:	17fd                	add	a5,a5,-1 # 20001fff <boot-0x5fffe001>
8000019c:	3b179073          	csrw	pmpaddr1,a5
800001a0:	6789                	lui	a5,0x2
800001a2:	f1178793          	add	a5,a5,-239 # 1f11 <boot-0x7fffe0ef>
800001a6:	3a079073          	csrw	pmpcfg0,a5
800001aa:	4799                	li	a5,6
800001ac:	00000517          	auipc	a0,0x0
800001b0:	f0250513          	add	a0,a0,-254 # 800000ae <user_main>
800001b4:	c01c                	sw	a5,0(s0)
800001b6:	26e5                	jal	8000059e <set_mepc>
800001b8:	30200073          	mret

800001bc <print_string>:
800001bc:	00054783          	lbu	a5,0(a0)
800001c0:	cb81                	beqz	a5,800001d0 <print_string+0x14>
800001c2:	0505                	add	a0,a0,1
800001c4:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
800001c8:	00054783          	lbu	a5,0(a0)
800001cc:	0505                	add	a0,a0,1
800001ce:	fbfd                	bnez	a5,800001c4 <print_string+0x8>
800001d0:	8082                	ret

800001d2 <vformat>:
800001d2:	00054683          	lbu	a3,0(a0)
800001d6:	ce85                	beqz	a3,8000020e <vformat+0x3c>
800001d8:	4781                	li	a5,0
800001da:	4801                	li	a6,0
800001dc:	4881                	li	a7,0
800001de:	872e                	mv	a4,a1
800001e0:	02500e13          	li	t3,37
800001e4:	03f00e93          	li	t4,63
800001e8:	4fd9                	li	t6,22
800001ea:	f9418f13          	add	t5,gp,-108 # 80000964 <fromhost+0x168>
800001ee:	833a                	mv	t1,a4
800001f0:	03c68263          	beq	a3,t3,80000214 <vformat+0x42>
800001f4:	0805                	add	a6,a6,1
800001f6:	00d70023          	sb	a3,0(a4)
800001fa:	01058733          	add	a4,a1,a6
800001fe:	0785                	add	a5,a5,1
80000200:	00f506b3          	add	a3,a0,a5
80000204:	0006c683          	lbu	a3,0(a3)
80000208:	88be                	mv	a7,a5
8000020a:	f2f5                	bnez	a3,800001ee <vformat+0x1c>
8000020c:	85ba                	mv	a1,a4
8000020e:	00058023          	sb	zero,0(a1)
80000212:	8082                	ret
80000214:	98aa                	add	a7,a7,a0
80000216:	0018c683          	lbu	a3,1(a7)
8000021a:	2a068263          	beqz	a3,800004be <vformat+0x2ec>
8000021e:	2dc68463          	beq	a3,t3,800004e6 <vformat+0x314>
80000222:	f9e68693          	add	a3,a3,-98
80000226:	0ff6f693          	zext.b	a3,a3
8000022a:	2cdfe563          	bltu	t6,a3,800004f4 <vformat+0x322>
8000022e:	7139                	add	sp,sp,-64
80000230:	de22                	sw	s0,60(sp)
80000232:	dc26                	sw	s1,56(sp)
80000234:	da4a                	sw	s2,52(sp)
80000236:	d84e                	sw	s3,48(sp)
80000238:	d652                	sw	s4,44(sp)
8000023a:	068a                	sll	a3,a3,0x2
8000023c:	96fa                	add	a3,a3,t5
8000023e:	4294                	lw	a3,0(a3)
80000240:	96fa                	add	a3,a3,t5
80000242:	8682                	jr	a3
80000244:	98aa                	add	a7,a7,a0
80000246:	0018c683          	lbu	a3,1(a7)
8000024a:	1e068563          	beqz	a3,80000434 <vformat+0x262>
8000024e:	21c68163          	beq	a3,t3,80000450 <vformat+0x27e>
80000252:	f9e68693          	add	a3,a3,-98
80000256:	0ff6f693          	zext.b	a3,a3
8000025a:	fedff0e3          	bgeu	t6,a3,8000023a <vformat+0x68>
8000025e:	03f00893          	li	a7,63
80000262:	00280693          	add	a3,a6,2
80000266:	01170023          	sb	a7,0(a4)
8000026a:	011700a3          	sb	a7,1(a4)
8000026e:	080d                	add	a6,a6,3
80000270:	00d58733          	add	a4,a1,a3
80000274:	01170023          	sb	a7,0(a4)
80000278:	01058733          	add	a4,a1,a6
8000027c:	0785                	add	a5,a5,1
8000027e:	0785                	add	a5,a5,1
80000280:	00f506b3          	add	a3,a0,a5
80000284:	0006c683          	lbu	a3,0(a3)
80000288:	88be                	mv	a7,a5
8000028a:	c285                	beqz	a3,800002aa <vformat+0xd8>
8000028c:	833a                	mv	t1,a4
8000028e:	fbc68be3          	beq	a3,t3,80000244 <vformat+0x72>
80000292:	0785                	add	a5,a5,1
80000294:	00d70023          	sb	a3,0(a4)
80000298:	00f506b3          	add	a3,a0,a5
8000029c:	0006c683          	lbu	a3,0(a3)
800002a0:	0805                	add	a6,a6,1
800002a2:	01058733          	add	a4,a1,a6
800002a6:	88be                	mv	a7,a5
800002a8:	f2f5                	bnez	a3,8000028c <vformat+0xba>
800002aa:	00070023          	sb	zero,0(a4)
800002ae:	5472                	lw	s0,60(sp)
800002b0:	54e2                	lw	s1,56(sp)
800002b2:	5952                	lw	s2,52(sp)
800002b4:	59c2                	lw	s3,48(sp)
800002b6:	5a32                	lw	s4,44(sp)
800002b8:	6121                	add	sp,sp,64
800002ba:	8082                	ret
800002bc:	00062303          	lw	t1,0(a2)
800002c0:	03000693          	li	a3,48
800002c4:	07800893          	li	a7,120
800002c8:	0809                	add	a6,a6,2
800002ca:	00d70023          	sb	a3,0(a4)
800002ce:	011700a3          	sb	a7,1(a4)
800002d2:	0611                	add	a2,a2,4
800002d4:	010583b3          	add	t2,a1,a6
800002d8:	18030263          	beqz	t1,8000045c <vformat+0x28a>
800002dc:	4881                	li	a7,0
800002de:	868a                	mv	a3,sp
800002e0:	ff018293          	add	t0,gp,-16 # 800009c0 <table>
800002e4:	00f37713          	and	a4,t1,15
800002e8:	9716                	add	a4,a4,t0
800002ea:	00074483          	lbu	s1,0(a4)
800002ee:	8746                	mv	a4,a7
800002f0:	0885                	add	a7,a7,1
800002f2:	01168433          	add	s0,a3,a7
800002f6:	fe940fa3          	sb	s1,-1(s0)
800002fa:	00435313          	srl	t1,t1,0x4
800002fe:	fe0313e3          	bnez	t1,800002e4 <vformat+0x112>
80000302:	9736                	add	a4,a4,a3
80000304:	831e                	mv	t1,t2
80000306:	00074383          	lbu	t2,0(a4)
8000030a:	82ba                	mv	t0,a4
8000030c:	0305                	add	t1,t1,1
8000030e:	fe730fa3          	sb	t2,-1(t1)
80000312:	177d                	add	a4,a4,-1
80000314:	fe5699e3          	bne	a3,t0,80000306 <vformat+0x134>
80000318:	9846                	add	a6,a6,a7
8000031a:	01058733          	add	a4,a1,a6
8000031e:	bfb9                	j	8000027c <vformat+0xaa>
80000320:	00062383          	lw	t2,0(a2)
80000324:	0611                	add	a2,a2,4
80000326:	1a038a63          	beqz	t2,800004da <vformat+0x308>
8000032a:	4301                	li	t1,0
8000032c:	868a                	mv	a3,sp
8000032e:	ff018293          	add	t0,gp,-16 # 800009c0 <table>
80000332:	44a9                	li	s1,10
80000334:	4a25                	li	s4,9
80000336:	0293f433          	remu	s0,t2,s1
8000033a:	889a                	mv	a7,t1
8000033c:	0305                	add	t1,t1,1
8000033e:	006689b3          	add	s3,a3,t1
80000342:	891e                	mv	s2,t2
80000344:	9416                	add	s0,s0,t0
80000346:	00044403          	lbu	s0,0(s0)
8000034a:	0293d3b3          	divu	t2,t2,s1
8000034e:	fe898fa3          	sb	s0,-1(s3)
80000352:	ff2a62e3          	bltu	s4,s2,80000336 <vformat+0x164>
80000356:	98b6                	add	a7,a7,a3
80000358:	0008c383          	lbu	t2,0(a7)
8000035c:	82c6                	mv	t0,a7
8000035e:	0705                	add	a4,a4,1
80000360:	fe770fa3          	sb	t2,-1(a4)
80000364:	18fd                	add	a7,a7,-1
80000366:	fe5699e3          	bne	a3,t0,80000358 <vformat+0x186>
8000036a:	981a                	add	a6,a6,t1
8000036c:	01058733          	add	a4,a1,a6
80000370:	b731                	j	8000027c <vformat+0xaa>
80000372:	00062283          	lw	t0,0(a2)
80000376:	0611                	add	a2,a2,4
80000378:	0002c883          	lbu	a7,0(t0)
8000037c:	f00880e3          	beqz	a7,8000027c <vformat+0xaa>
80000380:	4681                	li	a3,0
80000382:	00d70333          	add	t1,a4,a3
80000386:	0685                	add	a3,a3,1
80000388:	01130023          	sb	a7,0(t1)
8000038c:	00d288b3          	add	a7,t0,a3
80000390:	0008c883          	lbu	a7,0(a7)
80000394:	fe0897e3          	bnez	a7,80000382 <vformat+0x1b0>
80000398:	9836                	add	a6,a6,a3
8000039a:	01058733          	add	a4,a1,a6
8000039e:	bdf9                	j	8000027c <vformat+0xaa>
800003a0:	00062883          	lw	a7,0(a2)
800003a4:	0611                	add	a2,a2,4
800003a6:	0c08c263          	bltz	a7,8000046a <vformat+0x298>
800003aa:	0c089963          	bnez	a7,8000047c <vformat+0x2aa>
800003ae:	03000693          	li	a3,48
800003b2:	00d70023          	sb	a3,0(a4)
800003b6:	4385                	li	t2,1
800003b8:	981e                	add	a6,a6,t2
800003ba:	01058733          	add	a4,a1,a6
800003be:	bd7d                	j	8000027c <vformat+0xaa>
800003c0:	4214                	lw	a3,0(a2)
800003c2:	0805                	add	a6,a6,1
800003c4:	0611                	add	a2,a2,4
800003c6:	00d70023          	sb	a3,0(a4)
800003ca:	01058733          	add	a4,a1,a6
800003ce:	b57d                	j	8000027c <vformat+0xaa>
800003d0:	00062303          	lw	t1,0(a2)
800003d4:	03000693          	li	a3,48
800003d8:	06200893          	li	a7,98
800003dc:	0809                	add	a6,a6,2
800003de:	00d70023          	sb	a3,0(a4)
800003e2:	011700a3          	sb	a7,1(a4)
800003e6:	0611                	add	a2,a2,4
800003e8:	010583b3          	add	t2,a1,a6
800003ec:	06030863          	beqz	t1,8000045c <vformat+0x28a>
800003f0:	4881                	li	a7,0
800003f2:	868a                	mv	a3,sp
800003f4:	ff018293          	add	t0,gp,-16 # 800009c0 <table>
800003f8:	00137713          	and	a4,t1,1
800003fc:	9716                	add	a4,a4,t0
800003fe:	00074483          	lbu	s1,0(a4)
80000402:	8746                	mv	a4,a7
80000404:	0885                	add	a7,a7,1
80000406:	01168433          	add	s0,a3,a7
8000040a:	fe940fa3          	sb	s1,-1(s0)
8000040e:	00135313          	srl	t1,t1,0x1
80000412:	fe0313e3          	bnez	t1,800003f8 <vformat+0x226>
80000416:	9736                	add	a4,a4,a3
80000418:	831e                	mv	t1,t2
8000041a:	00074383          	lbu	t2,0(a4)
8000041e:	82ba                	mv	t0,a4
80000420:	0305                	add	t1,t1,1
80000422:	fe730fa3          	sb	t2,-1(t1)
80000426:	177d                	add	a4,a4,-1
80000428:	fe5699e3          	bne	a3,t0,8000041a <vformat+0x248>
8000042c:	9846                	add	a6,a6,a7
8000042e:	01058733          	add	a4,a1,a6
80000432:	b5a9                	j	8000027c <vformat+0xaa>
80000434:	00280693          	add	a3,a6,2
80000438:	01d70023          	sb	t4,0(a4)
8000043c:	01d700a3          	sb	t4,1(a4)
80000440:	080d                	add	a6,a6,3
80000442:	00d58733          	add	a4,a1,a3
80000446:	01d70023          	sb	t4,0(a4)
8000044a:	01058733          	add	a4,a1,a6
8000044e:	bd05                	j	8000027e <vformat+0xac>
80000450:	0805                	add	a6,a6,1
80000452:	01c70023          	sb	t3,0(a4)
80000456:	01058733          	add	a4,a1,a6
8000045a:	b50d                	j	8000027c <vformat+0xaa>
8000045c:	4885                	li	a7,1
8000045e:	9846                	add	a6,a6,a7
80000460:	00d38023          	sb	a3,0(t2)
80000464:	01058733          	add	a4,a1,a6
80000468:	bd11                	j	8000027c <vformat+0xaa>
8000046a:	0805                	add	a6,a6,1
8000046c:	02d00693          	li	a3,45
80000470:	00d70023          	sb	a3,0(a4)
80000474:	411008b3          	neg	a7,a7
80000478:	01058333          	add	t1,a1,a6
8000047c:	4381                	li	t2,0
8000047e:	868a                	mv	a3,sp
80000480:	ff018293          	add	t0,gp,-16 # 800009c0 <table>
80000484:	44a9                	li	s1,10
80000486:	4a25                	li	s4,9
80000488:	0298f433          	remu	s0,a7,s1
8000048c:	871e                	mv	a4,t2
8000048e:	0385                	add	t2,t2,1
80000490:	007689b3          	add	s3,a3,t2
80000494:	8946                	mv	s2,a7
80000496:	9416                	add	s0,s0,t0
80000498:	00044403          	lbu	s0,0(s0)
8000049c:	0298d8b3          	divu	a7,a7,s1
800004a0:	fe898fa3          	sb	s0,-1(s3)
800004a4:	ff2a62e3          	bltu	s4,s2,80000488 <vformat+0x2b6>
800004a8:	9736                	add	a4,a4,a3
800004aa:	00074283          	lbu	t0,0(a4)
800004ae:	88ba                	mv	a7,a4
800004b0:	0305                	add	t1,t1,1
800004b2:	fe530fa3          	sb	t0,-1(t1)
800004b6:	177d                	add	a4,a4,-1
800004b8:	ff1699e3          	bne	a3,a7,800004aa <vformat+0x2d8>
800004bc:	bdf5                	j	800003b8 <vformat+0x1e6>
800004be:	00280693          	add	a3,a6,2
800004c2:	01d70023          	sb	t4,0(a4)
800004c6:	01d700a3          	sb	t4,1(a4)
800004ca:	080d                	add	a6,a6,3
800004cc:	00d58733          	add	a4,a1,a3
800004d0:	01d70023          	sb	t4,0(a4)
800004d4:	01058733          	add	a4,a1,a6
800004d8:	b31d                	j	800001fe <vformat+0x2c>
800004da:	03000693          	li	a3,48
800004de:	00d70023          	sb	a3,0(a4)
800004e2:	4305                	li	t1,1
800004e4:	b559                	j	8000036a <vformat+0x198>
800004e6:	0805                	add	a6,a6,1
800004e8:	01c70023          	sb	t3,0(a4)
800004ec:	0785                	add	a5,a5,1
800004ee:	01058733          	add	a4,a1,a6
800004f2:	b331                	j	800001fe <vformat+0x2c>
800004f4:	03f00893          	li	a7,63
800004f8:	00280693          	add	a3,a6,2
800004fc:	01170023          	sb	a7,0(a4)
80000500:	011700a3          	sb	a7,1(a4)
80000504:	080d                	add	a6,a6,3
80000506:	00d58733          	add	a4,a1,a3
8000050a:	01170023          	sb	a7,0(a4)
8000050e:	0785                	add	a5,a5,1
80000510:	01058733          	add	a4,a1,a6
80000514:	b1ed                	j	800001fe <vformat+0x2c>

80000516 <vprint>:
80000516:	7175                	add	sp,sp,-144
80000518:	862e                	mv	a2,a1
8000051a:	858a                	mv	a1,sp
8000051c:	c706                	sw	ra,140(sp)
8000051e:	3955                	jal	800001d2 <vformat>
80000520:	00014783          	lbu	a5,0(sp)
80000524:	cb89                	beqz	a5,80000536 <vprint+0x20>
80000526:	00110713          	add	a4,sp,1
8000052a:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
8000052e:	00074783          	lbu	a5,0(a4)
80000532:	0705                	add	a4,a4,1
80000534:	fbfd                	bnez	a5,8000052a <vprint+0x14>
80000536:	40ba                	lw	ra,140(sp)
80000538:	6149                	add	sp,sp,144
8000053a:	8082                	ret

8000053c <print>:
8000053c:	7139                	add	sp,sp,-64
8000053e:	02410313          	add	t1,sp,36
80000542:	d22e                	sw	a1,36(sp)
80000544:	859a                	mv	a1,t1
80000546:	ce06                	sw	ra,28(sp)
80000548:	d432                	sw	a2,40(sp)
8000054a:	d636                	sw	a3,44(sp)
8000054c:	d83a                	sw	a4,48(sp)
8000054e:	da3e                	sw	a5,52(sp)
80000550:	dc42                	sw	a6,56(sp)
80000552:	de46                	sw	a7,60(sp)
80000554:	c61a                	sw	t1,12(sp)
80000556:	37c1                	jal	80000516 <vprint>
80000558:	40f2                	lw	ra,28(sp)
8000055a:	6121                	add	sp,sp,64
8000055c:	8082                	ret

8000055e <format>:
8000055e:	7139                	add	sp,sp,-64
80000560:	02810313          	add	t1,sp,40
80000564:	d432                	sw	a2,40(sp)
80000566:	861a                	mv	a2,t1
80000568:	ce06                	sw	ra,28(sp)
8000056a:	d636                	sw	a3,44(sp)
8000056c:	d83a                	sw	a4,48(sp)
8000056e:	da3e                	sw	a5,52(sp)
80000570:	dc42                	sw	a6,56(sp)
80000572:	de46                	sw	a7,60(sp)
80000574:	c61a                	sw	t1,12(sp)
80000576:	39b1                	jal	800001d2 <vformat>
80000578:	40f2                	lw	ra,28(sp)
8000057a:	6121                	add	sp,sp,64
8000057c:	8082                	ret

8000057e <dprint>:
8000057e:	1101                	add	sp,sp,-32
80000580:	c22e                	sw	a1,4(sp)
80000582:	c432                	sw	a2,8(sp)
80000584:	c636                	sw	a3,12(sp)
80000586:	c83a                	sw	a4,16(sp)
80000588:	ca3e                	sw	a5,20(sp)
8000058a:	cc42                	sw	a6,24(sp)
8000058c:	ce46                	sw	a7,28(sp)
8000058e:	6105                	add	sp,sp,32
80000590:	8082                	ret

80000592 <advance_mepc>:
80000592:	341027f3          	csrr	a5,mepc
80000596:	953e                	add	a0,a0,a5
80000598:	34151073          	csrw	mepc,a0
8000059c:	8082                	ret

8000059e <set_mepc>:
8000059e:	34151073          	csrw	mepc,a0
800005a2:	8082                	ret

800005a4 <advance_sepc>:
800005a4:	141027f3          	csrr	a5,sepc
800005a8:	953e                	add	a0,a0,a5
800005aa:	14151073          	csrw	sepc,a0
800005ae:	8082                	ret

800005b0 <set_sepc>:
800005b0:	14151073          	csrw	sepc,a0
800005b4:	8082                	ret

800005b6 <setup_interrupts_m>:
800005b6:	30551073          	csrw	mtvec,a0
800005ba:	30459073          	csrw	mie,a1
800005be:	8082                	ret

800005c0 <setup_interrupt_m_vectored>:
800005c0:	00156513          	or	a0,a0,1
800005c4:	30551073          	csrw	mtvec,a0
800005c8:	30459073          	csrw	mie,a1
800005cc:	8082                	ret

800005ce <enable_interrupts_m>:
800005ce:	47a1                	li	a5,8
800005d0:	3007a073          	csrs	mstatus,a5
800005d4:	8082                	ret

800005d6 <disable_interrupts_m>:
800005d6:	47a1                	li	a5,8
800005d8:	3007b073          	csrc	mstatus,a5
800005dc:	8082                	ret

800005de <enable_interrupts_save_m>:
800005de:	30051073          	csrw	mstatus,a0
800005e2:	8082                	ret

800005e4 <disable_interrupts_save_m>:
800005e4:	4521                	li	a0,8
800005e6:	30053573          	csrrc	a0,mstatus,a0
800005ea:	8082                	ret

800005ec <check_supervisor_mode_available>:
800005ec:	6785                	lui	a5,0x1
800005ee:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
800005f2:	3007a573          	csrrs	a0,mstatus,a5
800005f6:	30051573          	csrrw	a0,mstatus,a0
800005fa:	6789                	lui	a5,0x2
800005fc:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
80000600:	8d7d                	and	a0,a0,a5
80000602:	80050513          	add	a0,a0,-2048
80000606:	00153513          	seqz	a0,a0
8000060a:	8082                	ret

8000060c <require_supervisor_mode>:
8000060c:	6785                	lui	a5,0x1
8000060e:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
80000612:	3007a7f3          	csrrs	a5,mstatus,a5
80000616:	300797f3          	csrrw	a5,mstatus,a5
8000061a:	6709                	lui	a4,0x2
8000061c:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
80000620:	8ff9                	and	a5,a5,a4
80000622:	80078793          	add	a5,a5,-2048
80000626:	e391                	bnez	a5,8000062a <require_supervisor_mode+0x1e>
80000628:	8082                	ret
8000062a:	1141                	add	sp,sp,-16
8000062c:	00000517          	auipc	a0,0x0
80000630:	20c50513          	add	a0,a0,524 # 80000838 <fromhost+0x3c>
80000634:	c606                	sw	ra,12(sp)
80000636:	3719                	jal	8000053c <print>
80000638:	57fd                	li	a5,-1
8000063a:	e2f1a223          	sw	a5,-476(gp) # 800007f4 <flag>
8000063e:	3cb9                	jal	8000009c <done>

80000640 <read_exception_context>:
80000640:	c00027f3          	rdcycle	a5
80000644:	c55c                	sw	a5,12(a0)
80000646:	c01027f3          	rdtime	a5
8000064a:	c91c                	sw	a5,16(a0)
8000064c:	342027f3          	csrr	a5,mcause
80000650:	c51c                	sw	a5,8(a0)
80000652:	341027f3          	csrr	a5,mepc
80000656:	c11c                	sw	a5,0(a0)
80000658:	343027f3          	csrr	a5,mtval
8000065c:	c15c                	sw	a5,4(a0)
8000065e:	c03027f3          	csrr	a5,hpmcounter3
80000662:	c95c                	sw	a5,20(a0)
80000664:	c04027f3          	csrr	a5,hpmcounter4
80000668:	cd1c                	sw	a5,24(a0)
8000066a:	8082                	ret

8000066c <read_exception_context_s>:
8000066c:	c00027f3          	rdcycle	a5
80000670:	c55c                	sw	a5,12(a0)
80000672:	c01027f3          	rdtime	a5
80000676:	c91c                	sw	a5,16(a0)
80000678:	142027f3          	csrr	a5,scause
8000067c:	c51c                	sw	a5,8(a0)
8000067e:	141027f3          	csrr	a5,sepc
80000682:	c11c                	sw	a5,0(a0)
80000684:	143027f3          	csrr	a5,stval
80000688:	c15c                	sw	a5,4(a0)
8000068a:	c03027f3          	csrr	a5,hpmcounter3
8000068e:	c95c                	sw	a5,20(a0)
80000690:	c04027f3          	csrr	a5,hpmcounter4
80000694:	cd1c                	sw	a5,24(a0)
80000696:	8082                	ret

80000698 <print_exception_context>:
80000698:	1141                	add	sp,sp,-16
8000069a:	c422                	sw	s0,8(sp)
8000069c:	842a                	mv	s0,a0
8000069e:	00000517          	auipc	a0,0x0
800006a2:	1be50513          	add	a0,a0,446 # 8000085c <fromhost+0x60>
800006a6:	c606                	sw	ra,12(sp)
800006a8:	3d51                	jal	8000053c <print>
800006aa:	440c                	lw	a1,8(s0)
800006ac:	00000517          	auipc	a0,0x0
800006b0:	1c850513          	add	a0,a0,456 # 80000874 <fromhost+0x78>
800006b4:	3561                	jal	8000053c <print>
800006b6:	400c                	lw	a1,0(s0)
800006b8:	00000517          	auipc	a0,0x0
800006bc:	1cc50513          	add	a0,a0,460 # 80000884 <fromhost+0x88>
800006c0:	3db5                	jal	8000053c <print>
800006c2:	404c                	lw	a1,4(s0)
800006c4:	00000517          	auipc	a0,0x0
800006c8:	1d050513          	add	a0,a0,464 # 80000894 <fromhost+0x98>
800006cc:	3d85                	jal	8000053c <print>
800006ce:	444c                	lw	a1,12(s0)
800006d0:	00000517          	auipc	a0,0x0
800006d4:	1d450513          	add	a0,a0,468 # 800008a4 <fromhost+0xa8>
800006d8:	3595                	jal	8000053c <print>
800006da:	480c                	lw	a1,16(s0)
800006dc:	00000517          	auipc	a0,0x0
800006e0:	1d850513          	add	a0,a0,472 # 800008b4 <fromhost+0xb8>
800006e4:	3da1                	jal	8000053c <print>
800006e6:	484c                	lw	a1,20(s0)
800006e8:	00000517          	auipc	a0,0x0
800006ec:	1dc50513          	add	a0,a0,476 # 800008c4 <fromhost+0xc8>
800006f0:	35b1                	jal	8000053c <print>
800006f2:	4c0c                	lw	a1,24(s0)
800006f4:	4422                	lw	s0,8(sp)
800006f6:	40b2                	lw	ra,12(sp)
800006f8:	00000517          	auipc	a0,0x0
800006fc:	1dc50513          	add	a0,a0,476 # 800008d4 <fromhost+0xd8>
80000700:	0141                	add	sp,sp,16
80000702:	bd2d                	j	8000053c <print>

80000704 <default_handler>:
80000704:	711d                	add	sp,sp,-96
80000706:	c6aa                	sw	a0,76(sp)
80000708:	0048                	add	a0,sp,4
8000070a:	ce86                	sw	ra,92(sp)
8000070c:	cc96                	sw	t0,88(sp)
8000070e:	ca9a                	sw	t1,84(sp)
80000710:	c89e                	sw	t2,80(sp)
80000712:	c4ae                	sw	a1,72(sp)
80000714:	c2b2                	sw	a2,68(sp)
80000716:	c0b6                	sw	a3,64(sp)
80000718:	de3a                	sw	a4,60(sp)
8000071a:	dc3e                	sw	a5,56(sp)
8000071c:	da42                	sw	a6,52(sp)
8000071e:	d846                	sw	a7,48(sp)
80000720:	d672                	sw	t3,44(sp)
80000722:	d476                	sw	t4,40(sp)
80000724:	d27a                	sw	t5,36(sp)
80000726:	d07e                	sw	t6,32(sp)
80000728:	3f21                	jal	80000640 <read_exception_context>
8000072a:	0048                	add	a0,sp,4
8000072c:	37b5                	jal	80000698 <print_exception_context>
8000072e:	00000517          	auipc	a0,0x0
80000732:	1b650513          	add	a0,a0,438 # 800008e4 <fromhost+0xe8>
80000736:	3519                	jal	8000053c <print>
80000738:	3295                	jal	8000009c <done>

8000073a <unreachable_handler>:
8000073a:	711d                	add	sp,sp,-96
8000073c:	c6aa                	sw	a0,76(sp)
8000073e:	0048                	add	a0,sp,4
80000740:	ce86                	sw	ra,92(sp)
80000742:	cc96                	sw	t0,88(sp)
80000744:	ca9a                	sw	t1,84(sp)
80000746:	c89e                	sw	t2,80(sp)
80000748:	c4ae                	sw	a1,72(sp)
8000074a:	c2b2                	sw	a2,68(sp)
8000074c:	c0b6                	sw	a3,64(sp)
8000074e:	de3a                	sw	a4,60(sp)
80000750:	dc3e                	sw	a5,56(sp)
80000752:	da42                	sw	a6,52(sp)
80000754:	d846                	sw	a7,48(sp)
80000756:	d672                	sw	t3,44(sp)
80000758:	d476                	sw	t4,40(sp)
8000075a:	d27a                	sw	t5,36(sp)
8000075c:	d07e                	sw	t6,32(sp)
8000075e:	35cd                	jal	80000640 <read_exception_context>
80000760:	0048                	add	a0,sp,4
80000762:	3f1d                	jal	80000698 <print_exception_context>
80000764:	00000517          	auipc	a0,0x0
80000768:	1ac50513          	add	a0,a0,428 # 80000910 <fromhost+0x114>
8000076c:	3bc1                	jal	8000053c <print>
8000076e:	323d                	jal	8000009c <done>

80000770 <test_pass>:
80000770:	1141                	add	sp,sp,-16
80000772:	85aa                	mv	a1,a0
80000774:	00000517          	auipc	a0,0x0
80000778:	1ec50513          	add	a0,a0,492 # 80000960 <fromhost+0x164>
8000077c:	c606                	sw	ra,12(sp)
8000077e:	3b7d                	jal	8000053c <print>
80000780:	40b2                	lw	ra,12(sp)
80000782:	4785                	li	a5,1
80000784:	e2f1a223          	sw	a5,-476(gp) # 800007f4 <flag>
80000788:	0141                	add	sp,sp,16
8000078a:	8082                	ret

8000078c <test_fail>:
8000078c:	1141                	add	sp,sp,-16
8000078e:	85aa                	mv	a1,a0
80000790:	00000517          	auipc	a0,0x0
80000794:	1d050513          	add	a0,a0,464 # 80000960 <fromhost+0x164>
80000798:	c606                	sw	ra,12(sp)
8000079a:	334d                	jal	8000053c <print>
8000079c:	40b2                	lw	ra,12(sp)
8000079e:	e201a223          	sw	zero,-476(gp) # 800007f4 <flag>
800007a2:	0141                	add	sp,sp,16
800007a4:	8082                	ret
	...

800007b0 <vector_table>:
800007b0:	f55ff06f          	j	80000704 <default_handler>
800007b4:	f51ff06f          	j	80000704 <default_handler>
800007b8:	f83ff06f          	j	8000073a <unreachable_handler>
800007bc:	f49ff06f          	j	80000704 <default_handler>
800007c0:	f7bff06f          	j	8000073a <unreachable_handler>
800007c4:	f41ff06f          	j	80000704 <default_handler>
800007c8:	f73ff06f          	j	8000073a <unreachable_handler>
800007cc:	f39ff06f          	j	80000704 <default_handler>
800007d0:	f6bff06f          	j	8000073a <unreachable_handler>
800007d4:	f31ff06f          	j	80000704 <default_handler>
800007d8:	f63ff06f          	j	8000073a <unreachable_handler>
800007dc:	f29ff06f          	j	80000704 <default_handler>
800007e0:	f5bff06f          	j	8000073a <unreachable_handler>
800007e4:	f21ff06f          	j	80000704 <default_handler>
800007e8:	f53ff06f          	j	8000073a <unreachable_handler>
800007ec:	f4fff06f          	j	8000073a <unreachable_handler>
	...
