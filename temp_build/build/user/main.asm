
build/user/main:     file format elf32-littleriscv


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
8000003e:	00400117          	auipc	sp,0x400
80000042:	fc210113          	add	sp,sp,-62 # 80400000 <__stack_top>
80000046:	00001197          	auipc	gp,0x1
8000004a:	24618193          	add	gp,gp,582 # 8000128c <__bss_end>

8000004e <clr_bss>:
8000004e:	ffc18293          	add	t0,gp,-4 # 80001288 <index>
80000052:	00018313          	mv	t1,gp
80000056:	00628763          	beq	t0,t1,80000064 <do_preinit_arr>

8000005a <clr_bss_loop>:
8000005a:	00028023          	sb	zero,0(t0)
8000005e:	0285                	add	t0,t0,1
80000060:	fe535de3          	bge	t1,t0,8000005a <clr_bss_loop>

80000064 <do_preinit_arr>:
80000064:	d7418413          	add	s0,gp,-652 # 80001000 <queue>
80000068:	d7418493          	add	s1,gp,-652 # 80001000 <queue>
8000006c:	00940963          	beq	s0,s1,8000007e <do_init_arr>

80000070 <preinit_arr_calls>:
80000070:	00042903          	lw	s2,0(s0)
80000074:	000900e7          	jalr	s2
80000078:	0411                	add	s0,s0,4
8000007a:	fe941be3          	bne	s0,s1,80000070 <preinit_arr_calls>

8000007e <do_init_arr>:
8000007e:	d7418413          	add	s0,gp,-652 # 80001000 <queue>
80000082:	d7418493          	add	s1,gp,-652 # 80001000 <queue>
80000086:	00940963          	beq	s0,s1,80000098 <kernel_boot>

8000008a <init_arr_calls>:
8000008a:	00042903          	lw	s2,0(s0)
8000008e:	000900e7          	jalr	s2
80000092:	0411                	add	s0,s0,4
80000094:	fc941ee3          	bne	s0,s1,80000070 <preinit_arr_calls>

80000098 <kernel_boot>:
80000098:	7175                	add	sp,sp,-144
8000009a:	34011073          	csrw	mscratch,sp
8000009e:	107000ef          	jal	800009a4 <m_mode_boot>

800000a2 <start_s_mode_boot>:
800000a2:	6289                	lui	t0,0x2
800000a4:	80028293          	add	t0,t0,-2048 # 1800 <boot-0x7fffe800>
800000a8:	3002b073          	csrc	mstatus,t0
800000ac:	6285                	lui	t0,0x1
800000ae:	80028293          	add	t0,t0,-2048 # 800 <boot-0x7ffff800>
800000b2:	3002a073          	csrs	mstatus,t0
800000b6:	00000097          	auipc	ra,0x0
800000ba:	01808093          	add	ra,ra,24 # 800000ce <start_main>
800000be:	00001297          	auipc	t0,0x1
800000c2:	8b828293          	add	t0,t0,-1864 # 80000976 <s_mode_boot>
800000c6:	34129073          	csrw	mepc,t0
800000ca:	30200073          	mret

800000ce <start_main>:
800000ce:	10000293          	li	t0,256
800000d2:	1002b073          	csrc	sstatus,t0
800000d6:	00000097          	auipc	ra,0x0
800000da:	01808093          	add	ra,ra,24 # 800000ee <done>
800000de:	00000297          	auipc	t0,0x0
800000e2:	11028293          	add	t0,t0,272 # 800001ee <main>
800000e6:	14129073          	csrw	sepc,t0
800000ea:	10200073          	sret

800000ee <done>:
800000ee:	4e05                	li	t3,1
800000f0:	d8c18d93          	add	s11,gp,-628 # 80001018 <tohost>
800000f4:	01cda023          	sw	t3,0(s11)

800000f8 <__sim_halt>:
800000f8:	a001                	j	800000f8 <__sim_halt>
800000fa:	00000013          	nop
800000fe:	0001                	nop

80000100 <s_mode_trap_return>:
80000100:	08452283          	lw	t0,132(a0)
80000104:	14129073          	csrw	sepc,t0
80000108:	14051073          	csrw	sscratch,a0
8000010c:	00452083          	lw	ra,4(a0)
80000110:	00852103          	lw	sp,8(a0)
80000114:	00c52183          	lw	gp,12(a0)
80000118:	01052203          	lw	tp,16(a0)
8000011c:	01452283          	lw	t0,20(a0)
80000120:	01852303          	lw	t1,24(a0)
80000124:	01c52383          	lw	t2,28(a0)
80000128:	5100                	lw	s0,32(a0)
8000012a:	5144                	lw	s1,36(a0)
8000012c:	554c                	lw	a1,44(a0)
8000012e:	5910                	lw	a2,48(a0)
80000130:	5954                	lw	a3,52(a0)
80000132:	5d18                	lw	a4,56(a0)
80000134:	5d5c                	lw	a5,60(a0)
80000136:	04052803          	lw	a6,64(a0)
8000013a:	04452883          	lw	a7,68(a0)
8000013e:	04852903          	lw	s2,72(a0)
80000142:	04c52983          	lw	s3,76(a0)
80000146:	05052a03          	lw	s4,80(a0)
8000014a:	05452a83          	lw	s5,84(a0)
8000014e:	05852b03          	lw	s6,88(a0)
80000152:	05c52b83          	lw	s7,92(a0)
80000156:	06052c03          	lw	s8,96(a0)
8000015a:	06452c83          	lw	s9,100(a0)
8000015e:	06852d03          	lw	s10,104(a0)
80000162:	06c52d83          	lw	s11,108(a0)
80000166:	07052e03          	lw	t3,112(a0)
8000016a:	07452e83          	lw	t4,116(a0)
8000016e:	07852f03          	lw	t5,120(a0)
80000172:	07c52f83          	lw	t6,124(a0)
80000176:	5508                	lw	a0,40(a0)
80000178:	10200073          	sret
8000017c:	00000013          	nop

80000180 <s_mode_trap_entry>:
80000180:	14011173          	csrrw	sp,sscratch,sp
80000184:	140022f3          	csrr	t0,sscratch
80000188:	c416                	sw	t0,8(sp)
8000018a:	14011073          	csrw	sscratch,sp
8000018e:	c206                	sw	ra,4(sp)
80000190:	c60e                	sw	gp,12(sp)
80000192:	c812                	sw	tp,16(sp)
80000194:	ca16                	sw	t0,20(sp)
80000196:	cc1a                	sw	t1,24(sp)
80000198:	ce1e                	sw	t2,28(sp)
8000019a:	d022                	sw	s0,32(sp)
8000019c:	d226                	sw	s1,36(sp)
8000019e:	d42a                	sw	a0,40(sp)
800001a0:	d62e                	sw	a1,44(sp)
800001a2:	d832                	sw	a2,48(sp)
800001a4:	da36                	sw	a3,52(sp)
800001a6:	dc3a                	sw	a4,56(sp)
800001a8:	de3e                	sw	a5,60(sp)
800001aa:	c0c2                	sw	a6,64(sp)
800001ac:	c2c6                	sw	a7,68(sp)
800001ae:	c4ca                	sw	s2,72(sp)
800001b0:	c6ce                	sw	s3,76(sp)
800001b2:	c8d2                	sw	s4,80(sp)
800001b4:	cad6                	sw	s5,84(sp)
800001b6:	ccda                	sw	s6,88(sp)
800001b8:	cede                	sw	s7,92(sp)
800001ba:	d0e2                	sw	s8,96(sp)
800001bc:	d2e6                	sw	s9,100(sp)
800001be:	d4ea                	sw	s10,104(sp)
800001c0:	d6ee                	sw	s11,108(sp)
800001c2:	d8f2                	sw	t3,112(sp)
800001c4:	daf6                	sw	t4,116(sp)
800001c6:	dcfa                	sw	t5,120(sp)
800001c8:	defe                	sw	t6,124(sp)
800001ca:	100022f3          	csrr	t0,sstatus
800001ce:	c116                	sw	t0,128(sp)
800001d0:	141022f3          	csrr	t0,sepc
800001d4:	c316                	sw	t0,132(sp)
800001d6:	143022f3          	csrr	t0,stval
800001da:	c516                	sw	t0,136(sp)
800001dc:	142022f3          	csrr	t0,scause
800001e0:	c716                	sw	t0,140(sp)
800001e2:	850a                	mv	a0,sp
800001e4:	73c0006f          	j	80000920 <s_mode_trap_handler>
800001e8:	0000                	unimp
800001ea:	0000                	unimp
	...

800001ee <main>:
800001ee:	1101                	add	sp,sp,-32
800001f0:	00001517          	auipc	a0,0x1
800001f4:	e3050513          	add	a0,a0,-464 # 80001020 <fromhost+0x4>
800001f8:	ce06                	sw	ra,28(sp)
800001fa:	2e41                	jal	8000058a <print>
800001fc:	4785                	li	a5,1
800001fe:	c63e                	sw	a5,12(sp)
80000200:	47b2                	lw	a5,12(sp)
80000202:	fffd                	bnez	a5,80000200 <main+0x12>
80000204:	40f2                	lw	ra,28(sp)
80000206:	6105                	add	sp,sp,32
80000208:	8082                	ret

8000020a <print_string>:
8000020a:	00054783          	lbu	a5,0(a0)
8000020e:	cb81                	beqz	a5,8000021e <print_string+0x14>
80000210:	0505                	add	a0,a0,1
80000212:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x7fbffffc>
80000216:	00054783          	lbu	a5,0(a0)
8000021a:	0505                	add	a0,a0,1
8000021c:	fbfd                	bnez	a5,80000212 <print_string+0x8>
8000021e:	8082                	ret

80000220 <vformat>:
80000220:	00054683          	lbu	a3,0(a0)
80000224:	ce85                	beqz	a3,8000025c <vformat+0x3c>
80000226:	4781                	li	a5,0
80000228:	4801                	li	a6,0
8000022a:	4881                	li	a7,0
8000022c:	872e                	mv	a4,a1
8000022e:	02500e13          	li	t3,37
80000232:	03f00e93          	li	t4,63
80000236:	4fd9                	li	t6,22
80000238:	f8818f13          	add	t5,gp,-120 # 80001214 <fromhost+0x1f8>
8000023c:	833a                	mv	t1,a4
8000023e:	03c68263          	beq	a3,t3,80000262 <vformat+0x42>
80000242:	0805                	add	a6,a6,1
80000244:	00d70023          	sb	a3,0(a4)
80000248:	01058733          	add	a4,a1,a6
8000024c:	0785                	add	a5,a5,1
8000024e:	00f506b3          	add	a3,a0,a5
80000252:	0006c683          	lbu	a3,0(a3)
80000256:	88be                	mv	a7,a5
80000258:	f2f5                	bnez	a3,8000023c <vformat+0x1c>
8000025a:	85ba                	mv	a1,a4
8000025c:	00058023          	sb	zero,0(a1)
80000260:	8082                	ret
80000262:	98aa                	add	a7,a7,a0
80000264:	0018c683          	lbu	a3,1(a7)
80000268:	2a068263          	beqz	a3,8000050c <vformat+0x2ec>
8000026c:	2dc68463          	beq	a3,t3,80000534 <vformat+0x314>
80000270:	f9e68693          	add	a3,a3,-98
80000274:	0ff6f693          	zext.b	a3,a3
80000278:	2cdfe563          	bltu	t6,a3,80000542 <vformat+0x322>
8000027c:	7139                	add	sp,sp,-64
8000027e:	de22                	sw	s0,60(sp)
80000280:	dc26                	sw	s1,56(sp)
80000282:	da4a                	sw	s2,52(sp)
80000284:	d84e                	sw	s3,48(sp)
80000286:	d652                	sw	s4,44(sp)
80000288:	068a                	sll	a3,a3,0x2
8000028a:	96fa                	add	a3,a3,t5
8000028c:	4294                	lw	a3,0(a3)
8000028e:	96fa                	add	a3,a3,t5
80000290:	8682                	jr	a3
80000292:	98aa                	add	a7,a7,a0
80000294:	0018c683          	lbu	a3,1(a7)
80000298:	1e068563          	beqz	a3,80000482 <vformat+0x262>
8000029c:	21c68163          	beq	a3,t3,8000049e <vformat+0x27e>
800002a0:	f9e68693          	add	a3,a3,-98
800002a4:	0ff6f693          	zext.b	a3,a3
800002a8:	fedff0e3          	bgeu	t6,a3,80000288 <vformat+0x68>
800002ac:	03f00893          	li	a7,63
800002b0:	00280693          	add	a3,a6,2
800002b4:	01170023          	sb	a7,0(a4)
800002b8:	011700a3          	sb	a7,1(a4)
800002bc:	080d                	add	a6,a6,3
800002be:	00d58733          	add	a4,a1,a3
800002c2:	01170023          	sb	a7,0(a4)
800002c6:	01058733          	add	a4,a1,a6
800002ca:	0785                	add	a5,a5,1
800002cc:	0785                	add	a5,a5,1
800002ce:	00f506b3          	add	a3,a0,a5
800002d2:	0006c683          	lbu	a3,0(a3)
800002d6:	88be                	mv	a7,a5
800002d8:	c285                	beqz	a3,800002f8 <vformat+0xd8>
800002da:	833a                	mv	t1,a4
800002dc:	fbc68be3          	beq	a3,t3,80000292 <vformat+0x72>
800002e0:	0785                	add	a5,a5,1
800002e2:	00d70023          	sb	a3,0(a4)
800002e6:	00f506b3          	add	a3,a0,a5
800002ea:	0006c683          	lbu	a3,0(a3)
800002ee:	0805                	add	a6,a6,1
800002f0:	01058733          	add	a4,a1,a6
800002f4:	88be                	mv	a7,a5
800002f6:	f2f5                	bnez	a3,800002da <vformat+0xba>
800002f8:	00070023          	sb	zero,0(a4)
800002fc:	5472                	lw	s0,60(sp)
800002fe:	54e2                	lw	s1,56(sp)
80000300:	5952                	lw	s2,52(sp)
80000302:	59c2                	lw	s3,48(sp)
80000304:	5a32                	lw	s4,44(sp)
80000306:	6121                	add	sp,sp,64
80000308:	8082                	ret
8000030a:	00062303          	lw	t1,0(a2)
8000030e:	03000693          	li	a3,48
80000312:	07800893          	li	a7,120
80000316:	0809                	add	a6,a6,2
80000318:	00d70023          	sb	a3,0(a4)
8000031c:	011700a3          	sb	a7,1(a4)
80000320:	0611                	add	a2,a2,4
80000322:	010583b3          	add	t2,a1,a6
80000326:	18030263          	beqz	t1,800004aa <vformat+0x28a>
8000032a:	4881                	li	a7,0
8000032c:	868a                	mv	a3,sp
8000032e:	fe418293          	add	t0,gp,-28 # 80001270 <table>
80000332:	00f37713          	and	a4,t1,15
80000336:	9716                	add	a4,a4,t0
80000338:	00074483          	lbu	s1,0(a4)
8000033c:	8746                	mv	a4,a7
8000033e:	0885                	add	a7,a7,1
80000340:	01168433          	add	s0,a3,a7
80000344:	fe940fa3          	sb	s1,-1(s0)
80000348:	00435313          	srl	t1,t1,0x4
8000034c:	fe0313e3          	bnez	t1,80000332 <vformat+0x112>
80000350:	9736                	add	a4,a4,a3
80000352:	831e                	mv	t1,t2
80000354:	00074383          	lbu	t2,0(a4)
80000358:	82ba                	mv	t0,a4
8000035a:	0305                	add	t1,t1,1
8000035c:	fe730fa3          	sb	t2,-1(t1)
80000360:	177d                	add	a4,a4,-1
80000362:	fe5699e3          	bne	a3,t0,80000354 <vformat+0x134>
80000366:	9846                	add	a6,a6,a7
80000368:	01058733          	add	a4,a1,a6
8000036c:	bfb9                	j	800002ca <vformat+0xaa>
8000036e:	00062383          	lw	t2,0(a2)
80000372:	0611                	add	a2,a2,4
80000374:	1a038a63          	beqz	t2,80000528 <vformat+0x308>
80000378:	4301                	li	t1,0
8000037a:	868a                	mv	a3,sp
8000037c:	fe418293          	add	t0,gp,-28 # 80001270 <table>
80000380:	44a9                	li	s1,10
80000382:	4a25                	li	s4,9
80000384:	0293f433          	remu	s0,t2,s1
80000388:	889a                	mv	a7,t1
8000038a:	0305                	add	t1,t1,1
8000038c:	006689b3          	add	s3,a3,t1
80000390:	891e                	mv	s2,t2
80000392:	9416                	add	s0,s0,t0
80000394:	00044403          	lbu	s0,0(s0)
80000398:	0293d3b3          	divu	t2,t2,s1
8000039c:	fe898fa3          	sb	s0,-1(s3)
800003a0:	ff2a62e3          	bltu	s4,s2,80000384 <vformat+0x164>
800003a4:	98b6                	add	a7,a7,a3
800003a6:	0008c383          	lbu	t2,0(a7)
800003aa:	82c6                	mv	t0,a7
800003ac:	0705                	add	a4,a4,1
800003ae:	fe770fa3          	sb	t2,-1(a4)
800003b2:	18fd                	add	a7,a7,-1
800003b4:	fe5699e3          	bne	a3,t0,800003a6 <vformat+0x186>
800003b8:	981a                	add	a6,a6,t1
800003ba:	01058733          	add	a4,a1,a6
800003be:	b731                	j	800002ca <vformat+0xaa>
800003c0:	00062283          	lw	t0,0(a2)
800003c4:	0611                	add	a2,a2,4
800003c6:	0002c883          	lbu	a7,0(t0)
800003ca:	f00880e3          	beqz	a7,800002ca <vformat+0xaa>
800003ce:	4681                	li	a3,0
800003d0:	00d70333          	add	t1,a4,a3
800003d4:	0685                	add	a3,a3,1
800003d6:	01130023          	sb	a7,0(t1)
800003da:	00d288b3          	add	a7,t0,a3
800003de:	0008c883          	lbu	a7,0(a7)
800003e2:	fe0897e3          	bnez	a7,800003d0 <vformat+0x1b0>
800003e6:	9836                	add	a6,a6,a3
800003e8:	01058733          	add	a4,a1,a6
800003ec:	bdf9                	j	800002ca <vformat+0xaa>
800003ee:	00062883          	lw	a7,0(a2)
800003f2:	0611                	add	a2,a2,4
800003f4:	0c08c263          	bltz	a7,800004b8 <vformat+0x298>
800003f8:	0c089963          	bnez	a7,800004ca <vformat+0x2aa>
800003fc:	03000693          	li	a3,48
80000400:	00d70023          	sb	a3,0(a4)
80000404:	4385                	li	t2,1
80000406:	981e                	add	a6,a6,t2
80000408:	01058733          	add	a4,a1,a6
8000040c:	bd7d                	j	800002ca <vformat+0xaa>
8000040e:	4214                	lw	a3,0(a2)
80000410:	0805                	add	a6,a6,1
80000412:	0611                	add	a2,a2,4
80000414:	00d70023          	sb	a3,0(a4)
80000418:	01058733          	add	a4,a1,a6
8000041c:	b57d                	j	800002ca <vformat+0xaa>
8000041e:	00062303          	lw	t1,0(a2)
80000422:	03000693          	li	a3,48
80000426:	06200893          	li	a7,98
8000042a:	0809                	add	a6,a6,2
8000042c:	00d70023          	sb	a3,0(a4)
80000430:	011700a3          	sb	a7,1(a4)
80000434:	0611                	add	a2,a2,4
80000436:	010583b3          	add	t2,a1,a6
8000043a:	06030863          	beqz	t1,800004aa <vformat+0x28a>
8000043e:	4881                	li	a7,0
80000440:	868a                	mv	a3,sp
80000442:	fe418293          	add	t0,gp,-28 # 80001270 <table>
80000446:	00137713          	and	a4,t1,1
8000044a:	9716                	add	a4,a4,t0
8000044c:	00074483          	lbu	s1,0(a4)
80000450:	8746                	mv	a4,a7
80000452:	0885                	add	a7,a7,1
80000454:	01168433          	add	s0,a3,a7
80000458:	fe940fa3          	sb	s1,-1(s0)
8000045c:	00135313          	srl	t1,t1,0x1
80000460:	fe0313e3          	bnez	t1,80000446 <vformat+0x226>
80000464:	9736                	add	a4,a4,a3
80000466:	831e                	mv	t1,t2
80000468:	00074383          	lbu	t2,0(a4)
8000046c:	82ba                	mv	t0,a4
8000046e:	0305                	add	t1,t1,1
80000470:	fe730fa3          	sb	t2,-1(t1)
80000474:	177d                	add	a4,a4,-1
80000476:	fe5699e3          	bne	a3,t0,80000468 <vformat+0x248>
8000047a:	9846                	add	a6,a6,a7
8000047c:	01058733          	add	a4,a1,a6
80000480:	b5a9                	j	800002ca <vformat+0xaa>
80000482:	00280693          	add	a3,a6,2
80000486:	01d70023          	sb	t4,0(a4)
8000048a:	01d700a3          	sb	t4,1(a4)
8000048e:	080d                	add	a6,a6,3
80000490:	00d58733          	add	a4,a1,a3
80000494:	01d70023          	sb	t4,0(a4)
80000498:	01058733          	add	a4,a1,a6
8000049c:	bd05                	j	800002cc <vformat+0xac>
8000049e:	0805                	add	a6,a6,1
800004a0:	01c70023          	sb	t3,0(a4)
800004a4:	01058733          	add	a4,a1,a6
800004a8:	b50d                	j	800002ca <vformat+0xaa>
800004aa:	4885                	li	a7,1
800004ac:	9846                	add	a6,a6,a7
800004ae:	00d38023          	sb	a3,0(t2)
800004b2:	01058733          	add	a4,a1,a6
800004b6:	bd11                	j	800002ca <vformat+0xaa>
800004b8:	0805                	add	a6,a6,1
800004ba:	02d00693          	li	a3,45
800004be:	00d70023          	sb	a3,0(a4)
800004c2:	411008b3          	neg	a7,a7
800004c6:	01058333          	add	t1,a1,a6
800004ca:	4381                	li	t2,0
800004cc:	868a                	mv	a3,sp
800004ce:	fe418293          	add	t0,gp,-28 # 80001270 <table>
800004d2:	44a9                	li	s1,10
800004d4:	4a25                	li	s4,9
800004d6:	0298f433          	remu	s0,a7,s1
800004da:	871e                	mv	a4,t2
800004dc:	0385                	add	t2,t2,1
800004de:	007689b3          	add	s3,a3,t2
800004e2:	8946                	mv	s2,a7
800004e4:	9416                	add	s0,s0,t0
800004e6:	00044403          	lbu	s0,0(s0)
800004ea:	0298d8b3          	divu	a7,a7,s1
800004ee:	fe898fa3          	sb	s0,-1(s3)
800004f2:	ff2a62e3          	bltu	s4,s2,800004d6 <vformat+0x2b6>
800004f6:	9736                	add	a4,a4,a3
800004f8:	00074283          	lbu	t0,0(a4)
800004fc:	88ba                	mv	a7,a4
800004fe:	0305                	add	t1,t1,1
80000500:	fe530fa3          	sb	t0,-1(t1)
80000504:	177d                	add	a4,a4,-1
80000506:	ff1699e3          	bne	a3,a7,800004f8 <vformat+0x2d8>
8000050a:	bdf5                	j	80000406 <vformat+0x1e6>
8000050c:	00280693          	add	a3,a6,2
80000510:	01d70023          	sb	t4,0(a4)
80000514:	01d700a3          	sb	t4,1(a4)
80000518:	080d                	add	a6,a6,3
8000051a:	00d58733          	add	a4,a1,a3
8000051e:	01d70023          	sb	t4,0(a4)
80000522:	01058733          	add	a4,a1,a6
80000526:	b31d                	j	8000024c <vformat+0x2c>
80000528:	03000693          	li	a3,48
8000052c:	00d70023          	sb	a3,0(a4)
80000530:	4305                	li	t1,1
80000532:	b559                	j	800003b8 <vformat+0x198>
80000534:	0805                	add	a6,a6,1
80000536:	01c70023          	sb	t3,0(a4)
8000053a:	0785                	add	a5,a5,1
8000053c:	01058733          	add	a4,a1,a6
80000540:	b331                	j	8000024c <vformat+0x2c>
80000542:	03f00893          	li	a7,63
80000546:	00280693          	add	a3,a6,2
8000054a:	01170023          	sb	a7,0(a4)
8000054e:	011700a3          	sb	a7,1(a4)
80000552:	080d                	add	a6,a6,3
80000554:	00d58733          	add	a4,a1,a3
80000558:	01170023          	sb	a7,0(a4)
8000055c:	0785                	add	a5,a5,1
8000055e:	01058733          	add	a4,a1,a6
80000562:	b1ed                	j	8000024c <vformat+0x2c>

80000564 <vprint>:
80000564:	7175                	add	sp,sp,-144
80000566:	862e                	mv	a2,a1
80000568:	858a                	mv	a1,sp
8000056a:	c706                	sw	ra,140(sp)
8000056c:	3955                	jal	80000220 <vformat>
8000056e:	00014783          	lbu	a5,0(sp)
80000572:	cb89                	beqz	a5,80000584 <vprint+0x20>
80000574:	00110713          	add	a4,sp,1
80000578:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x7fbffffc>
8000057c:	00074783          	lbu	a5,0(a4)
80000580:	0705                	add	a4,a4,1
80000582:	fbfd                	bnez	a5,80000578 <vprint+0x14>
80000584:	40ba                	lw	ra,140(sp)
80000586:	6149                	add	sp,sp,144
80000588:	8082                	ret

8000058a <print>:
8000058a:	7139                	add	sp,sp,-64
8000058c:	02410313          	add	t1,sp,36
80000590:	d22e                	sw	a1,36(sp)
80000592:	859a                	mv	a1,t1
80000594:	ce06                	sw	ra,28(sp)
80000596:	d432                	sw	a2,40(sp)
80000598:	d636                	sw	a3,44(sp)
8000059a:	d83a                	sw	a4,48(sp)
8000059c:	da3e                	sw	a5,52(sp)
8000059e:	dc42                	sw	a6,56(sp)
800005a0:	de46                	sw	a7,60(sp)
800005a2:	c61a                	sw	t1,12(sp)
800005a4:	37c1                	jal	80000564 <vprint>
800005a6:	40f2                	lw	ra,28(sp)
800005a8:	6121                	add	sp,sp,64
800005aa:	8082                	ret

800005ac <format>:
800005ac:	7139                	add	sp,sp,-64
800005ae:	02810313          	add	t1,sp,40
800005b2:	d432                	sw	a2,40(sp)
800005b4:	861a                	mv	a2,t1
800005b6:	ce06                	sw	ra,28(sp)
800005b8:	d636                	sw	a3,44(sp)
800005ba:	d83a                	sw	a4,48(sp)
800005bc:	da3e                	sw	a5,52(sp)
800005be:	dc42                	sw	a6,56(sp)
800005c0:	de46                	sw	a7,60(sp)
800005c2:	c61a                	sw	t1,12(sp)
800005c4:	39b1                	jal	80000220 <vformat>
800005c6:	40f2                	lw	ra,28(sp)
800005c8:	6121                	add	sp,sp,64
800005ca:	8082                	ret

800005cc <dprint>:
800005cc:	1101                	add	sp,sp,-32
800005ce:	c22e                	sw	a1,4(sp)
800005d0:	c432                	sw	a2,8(sp)
800005d2:	c636                	sw	a3,12(sp)
800005d4:	c83a                	sw	a4,16(sp)
800005d6:	ca3e                	sw	a5,20(sp)
800005d8:	cc42                	sw	a6,24(sp)
800005da:	ce46                	sw	a7,28(sp)
800005dc:	6105                	add	sp,sp,32
800005de:	8082                	ret

800005e0 <clk_handler>:
800005e0:	7139                	add	sp,sp,-64
800005e2:	cc3e                	sw	a5,24(sp)
800005e4:	ff418793          	add	a5,gp,-12 # 80001280 <time_remaining>
800005e8:	d62a                	sw	a0,44(sp)
800005ea:	4388                	lw	a0,0(a5)
800005ec:	d42e                	sw	a1,40(sp)
800005ee:	43cc                	lw	a1,4(a5)
800005f0:	d232                	sw	a2,36(sp)
800005f2:	d036                	sw	a3,32(sp)
800005f4:	ce3a                	sw	a4,28(sp)
800005f6:	de06                	sw	ra,60(sp)
800005f8:	dc16                	sw	t0,56(sp)
800005fa:	da1a                	sw	t1,52(sp)
800005fc:	d81e                	sw	t2,48(sp)
800005fe:	ca42                	sw	a6,20(sp)
80000600:	c846                	sw	a7,16(sp)
80000602:	c672                	sw	t3,12(sp)
80000604:	c476                	sw	t4,8(sp)
80000606:	c27a                	sw	t5,4(sp)
80000608:	c07e                	sw	t6,0(sp)
8000060a:	00153713          	seqz	a4,a0
8000060e:	fff50613          	add	a2,a0,-1
80000612:	c390                	sw	a2,0(a5)
80000614:	40e586b3          	sub	a3,a1,a4
80000618:	c3d4                	sw	a3,4(a5)
8000061a:	4398                	lw	a4,0(a5)
8000061c:	43dc                	lw	a5,4(a5)
8000061e:	8f5d                	or	a4,a4,a5
80000620:	cb05                	beqz	a4,80000650 <clk_handler+0x70>
80000622:	4581                	li	a1,0
80000624:	03200513          	li	a0,50
80000628:	24e5                	jal	80000910 <sbi_write_timer_offset>
8000062a:	50f2                	lw	ra,60(sp)
8000062c:	52e2                	lw	t0,56(sp)
8000062e:	5352                	lw	t1,52(sp)
80000630:	53c2                	lw	t2,48(sp)
80000632:	5532                	lw	a0,44(sp)
80000634:	55a2                	lw	a1,40(sp)
80000636:	5612                	lw	a2,36(sp)
80000638:	5682                	lw	a3,32(sp)
8000063a:	4772                	lw	a4,28(sp)
8000063c:	47e2                	lw	a5,24(sp)
8000063e:	4852                	lw	a6,20(sp)
80000640:	48c2                	lw	a7,16(sp)
80000642:	4e32                	lw	t3,12(sp)
80000644:	4ea2                	lw	t4,8(sp)
80000646:	4f12                	lw	t5,4(sp)
80000648:	4f82                	lw	t6,0(sp)
8000064a:	6121                	add	sp,sp,64
8000064c:	10200073          	sret
80000650:	2619                	jal	80000956 <reschedule_function>
80000652:	bfc1                	j	80000622 <clk_handler+0x42>
	...

80000656 <advance_mepc>:
80000656:	341027f3          	csrr	a5,mepc
8000065a:	953e                	add	a0,a0,a5
8000065c:	34151073          	csrw	mepc,a0
80000660:	8082                	ret

80000662 <set_mepc>:
80000662:	34151073          	csrw	mepc,a0
80000666:	8082                	ret

80000668 <advance_sepc>:
80000668:	141027f3          	csrr	a5,sepc
8000066c:	953e                	add	a0,a0,a5
8000066e:	14151073          	csrw	sepc,a0
80000672:	8082                	ret

80000674 <set_sepc>:
80000674:	14151073          	csrw	sepc,a0
80000678:	8082                	ret

8000067a <setup_interrupts_m>:
8000067a:	30551073          	csrw	mtvec,a0
8000067e:	30459073          	csrw	mie,a1
80000682:	8082                	ret

80000684 <setup_interrupt_m_vectored>:
80000684:	00156513          	or	a0,a0,1
80000688:	30551073          	csrw	mtvec,a0
8000068c:	30459073          	csrw	mie,a1
80000690:	8082                	ret

80000692 <enable_interrupts_m>:
80000692:	47a1                	li	a5,8
80000694:	3007a073          	csrs	mstatus,a5
80000698:	8082                	ret

8000069a <disable_interrupts_m>:
8000069a:	47a1                	li	a5,8
8000069c:	3007b073          	csrc	mstatus,a5
800006a0:	8082                	ret

800006a2 <enable_interrupts_save_m>:
800006a2:	30051073          	csrw	mstatus,a0
800006a6:	8082                	ret

800006a8 <disable_interrupts_save_m>:
800006a8:	4521                	li	a0,8
800006aa:	30053573          	csrrc	a0,mstatus,a0
800006ae:	8082                	ret

800006b0 <setup_interrupts_s>:
800006b0:	10551073          	csrw	stvec,a0
800006b4:	10459073          	csrw	sie,a1
800006b8:	8082                	ret

800006ba <setup_interrupt_s_vectored>:
800006ba:	00156513          	or	a0,a0,1
800006be:	10551073          	csrw	stvec,a0
800006c2:	10459073          	csrw	sie,a1
800006c6:	8082                	ret

800006c8 <enable_prev_interrupts_s>:
800006c8:	02000793          	li	a5,32
800006cc:	1007a073          	csrs	sstatus,a5
800006d0:	8082                	ret

800006d2 <enable_interrupts_s>:
800006d2:	4789                	li	a5,2
800006d4:	1007a073          	csrs	sstatus,a5
800006d8:	8082                	ret

800006da <disable_interrupts_s>:
800006da:	4789                	li	a5,2
800006dc:	1007b073          	csrc	sstatus,a5
800006e0:	8082                	ret

800006e2 <enable_interrupts_save_s>:
800006e2:	10051073          	csrw	sstatus,a0
800006e6:	8082                	ret

800006e8 <disable_interrupts_save_s>:
800006e8:	4509                	li	a0,2
800006ea:	10053573          	csrrc	a0,sstatus,a0
800006ee:	8082                	ret

800006f0 <delegate_traps_to_s>:
800006f0:	30251073          	csrw	medeleg,a0
800006f4:	30359073          	csrw	mideleg,a1
800006f8:	8082                	ret

800006fa <check_supervisor_mode_available>:
800006fa:	6785                	lui	a5,0x1
800006fc:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
80000700:	3007a573          	csrrs	a0,mstatus,a5
80000704:	30051573          	csrrw	a0,mstatus,a0
80000708:	6789                	lui	a5,0x2
8000070a:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
8000070e:	8d7d                	and	a0,a0,a5
80000710:	80050513          	add	a0,a0,-2048
80000714:	00153513          	seqz	a0,a0
80000718:	8082                	ret

8000071a <require_supervisor_mode>:
8000071a:	6785                	lui	a5,0x1
8000071c:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
80000720:	3007a7f3          	csrrs	a5,mstatus,a5
80000724:	300797f3          	csrrw	a5,mstatus,a5
80000728:	6709                	lui	a4,0x2
8000072a:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
8000072e:	8ff9                	and	a5,a5,a4
80000730:	80078793          	add	a5,a5,-2048
80000734:	e391                	bnez	a5,80000738 <require_supervisor_mode+0x1e>
80000736:	8082                	ret
80000738:	1141                	add	sp,sp,-16
8000073a:	00001517          	auipc	a0,0x1
8000073e:	8f650513          	add	a0,a0,-1802 # 80001030 <fromhost+0x14>
80000742:	c606                	sw	ra,12(sp)
80000744:	3599                	jal	8000058a <print>
80000746:	57fd                	li	a5,-1
80000748:	d8f1a423          	sw	a5,-632(gp) # 80001014 <flag>
8000074c:	324d                	jal	800000ee <done>

8000074e <read_exception_context>:
8000074e:	c00027f3          	rdcycle	a5
80000752:	c55c                	sw	a5,12(a0)
80000754:	c01027f3          	rdtime	a5
80000758:	c91c                	sw	a5,16(a0)
8000075a:	342027f3          	csrr	a5,mcause
8000075e:	c51c                	sw	a5,8(a0)
80000760:	341027f3          	csrr	a5,mepc
80000764:	c11c                	sw	a5,0(a0)
80000766:	343027f3          	csrr	a5,mtval
8000076a:	c15c                	sw	a5,4(a0)
8000076c:	c03027f3          	csrr	a5,hpmcounter3
80000770:	c95c                	sw	a5,20(a0)
80000772:	c04027f3          	csrr	a5,hpmcounter4
80000776:	cd1c                	sw	a5,24(a0)
80000778:	8082                	ret

8000077a <read_exception_context_s>:
8000077a:	c00027f3          	rdcycle	a5
8000077e:	c55c                	sw	a5,12(a0)
80000780:	c01027f3          	rdtime	a5
80000784:	c91c                	sw	a5,16(a0)
80000786:	142027f3          	csrr	a5,scause
8000078a:	c51c                	sw	a5,8(a0)
8000078c:	141027f3          	csrr	a5,sepc
80000790:	c11c                	sw	a5,0(a0)
80000792:	143027f3          	csrr	a5,stval
80000796:	c15c                	sw	a5,4(a0)
80000798:	c03027f3          	csrr	a5,hpmcounter3
8000079c:	c95c                	sw	a5,20(a0)
8000079e:	c04027f3          	csrr	a5,hpmcounter4
800007a2:	cd1c                	sw	a5,24(a0)
800007a4:	8082                	ret

800007a6 <print_exception_context>:
800007a6:	1141                	add	sp,sp,-16
800007a8:	c422                	sw	s0,8(sp)
800007aa:	842a                	mv	s0,a0
800007ac:	00001517          	auipc	a0,0x1
800007b0:	8a850513          	add	a0,a0,-1880 # 80001054 <fromhost+0x38>
800007b4:	c606                	sw	ra,12(sp)
800007b6:	3bd1                	jal	8000058a <print>
800007b8:	440c                	lw	a1,8(s0)
800007ba:	00001517          	auipc	a0,0x1
800007be:	8b250513          	add	a0,a0,-1870 # 8000106c <fromhost+0x50>
800007c2:	33e1                	jal	8000058a <print>
800007c4:	400c                	lw	a1,0(s0)
800007c6:	00001517          	auipc	a0,0x1
800007ca:	8b650513          	add	a0,a0,-1866 # 8000107c <fromhost+0x60>
800007ce:	3b75                	jal	8000058a <print>
800007d0:	404c                	lw	a1,4(s0)
800007d2:	00001517          	auipc	a0,0x1
800007d6:	8ba50513          	add	a0,a0,-1862 # 8000108c <fromhost+0x70>
800007da:	3b45                	jal	8000058a <print>
800007dc:	444c                	lw	a1,12(s0)
800007de:	00001517          	auipc	a0,0x1
800007e2:	8be50513          	add	a0,a0,-1858 # 8000109c <fromhost+0x80>
800007e6:	3355                	jal	8000058a <print>
800007e8:	480c                	lw	a1,16(s0)
800007ea:	00001517          	auipc	a0,0x1
800007ee:	8c250513          	add	a0,a0,-1854 # 800010ac <fromhost+0x90>
800007f2:	3b61                	jal	8000058a <print>
800007f4:	484c                	lw	a1,20(s0)
800007f6:	00001517          	auipc	a0,0x1
800007fa:	8c650513          	add	a0,a0,-1850 # 800010bc <fromhost+0xa0>
800007fe:	3371                	jal	8000058a <print>
80000800:	4c0c                	lw	a1,24(s0)
80000802:	4422                	lw	s0,8(sp)
80000804:	40b2                	lw	ra,12(sp)
80000806:	00001517          	auipc	a0,0x1
8000080a:	8c650513          	add	a0,a0,-1850 # 800010cc <fromhost+0xb0>
8000080e:	0141                	add	sp,sp,16
80000810:	bbad                	j	8000058a <print>
	...

80000814 <default_handler>:
80000814:	711d                	add	sp,sp,-96
80000816:	c6aa                	sw	a0,76(sp)
80000818:	0048                	add	a0,sp,4
8000081a:	ce86                	sw	ra,92(sp)
8000081c:	cc96                	sw	t0,88(sp)
8000081e:	ca9a                	sw	t1,84(sp)
80000820:	c89e                	sw	t2,80(sp)
80000822:	c4ae                	sw	a1,72(sp)
80000824:	c2b2                	sw	a2,68(sp)
80000826:	c0b6                	sw	a3,64(sp)
80000828:	de3a                	sw	a4,60(sp)
8000082a:	dc3e                	sw	a5,56(sp)
8000082c:	da42                	sw	a6,52(sp)
8000082e:	d846                	sw	a7,48(sp)
80000830:	d672                	sw	t3,44(sp)
80000832:	d476                	sw	t4,40(sp)
80000834:	d27a                	sw	t5,36(sp)
80000836:	d07e                	sw	t6,32(sp)
80000838:	3f19                	jal	8000074e <read_exception_context>
8000083a:	0048                	add	a0,sp,4
8000083c:	37ad                	jal	800007a6 <print_exception_context>
8000083e:	00001517          	auipc	a0,0x1
80000842:	89e50513          	add	a0,a0,-1890 # 800010dc <fromhost+0xc0>
80000846:	3391                	jal	8000058a <print>
80000848:	8a7ff0ef          	jal	800000ee <done>

8000084c <unreachable_handler>:
8000084c:	711d                	add	sp,sp,-96
8000084e:	c6aa                	sw	a0,76(sp)
80000850:	0048                	add	a0,sp,4
80000852:	ce86                	sw	ra,92(sp)
80000854:	cc96                	sw	t0,88(sp)
80000856:	ca9a                	sw	t1,84(sp)
80000858:	c89e                	sw	t2,80(sp)
8000085a:	c4ae                	sw	a1,72(sp)
8000085c:	c2b2                	sw	a2,68(sp)
8000085e:	c0b6                	sw	a3,64(sp)
80000860:	de3a                	sw	a4,60(sp)
80000862:	dc3e                	sw	a5,56(sp)
80000864:	da42                	sw	a6,52(sp)
80000866:	d846                	sw	a7,48(sp)
80000868:	d672                	sw	t3,44(sp)
8000086a:	d476                	sw	t4,40(sp)
8000086c:	d27a                	sw	t5,36(sp)
8000086e:	d07e                	sw	t6,32(sp)
80000870:	3df9                	jal	8000074e <read_exception_context>
80000872:	0048                	add	a0,sp,4
80000874:	3f0d                	jal	800007a6 <print_exception_context>
80000876:	00001517          	auipc	a0,0x1
8000087a:	89250513          	add	a0,a0,-1902 # 80001108 <fromhost+0xec>
8000087e:	3331                	jal	8000058a <print>
80000880:	86fff0ef          	jal	800000ee <done>

80000884 <ll_write_timer_static>:
80000884:	1141                	add	sp,sp,-16
80000886:	c422                	sw	s0,8(sp)
80000888:	c226                	sw	s1,4(sp)
8000088a:	842e                	mv	s0,a1
8000088c:	84aa                	mv	s1,a0
8000088e:	862e                	mv	a2,a1
80000890:	85aa                	mv	a1,a0
80000892:	00001517          	auipc	a0,0x1
80000896:	8c650513          	add	a0,a0,-1850 # 80001158 <fromhost+0x13c>
8000089a:	c606                	sw	ra,12(sp)
8000089c:	31fd                	jal	8000058a <print>
8000089e:	57b1                	li	a5,-20
800008a0:	577d                	li	a4,-1
800008a2:	c398                	sw	a4,0(a5)
800008a4:	fe902423          	sw	s1,-24(zero) # ffffffe8 <__stack_top+0x7fbfffe8>
800008a8:	40b2                	lw	ra,12(sp)
800008aa:	c380                	sw	s0,0(a5)
800008ac:	4422                	lw	s0,8(sp)
800008ae:	4492                	lw	s1,4(sp)
800008b0:	0141                	add	sp,sp,16
800008b2:	8082                	ret

800008b4 <ll_write_timer_offset>:
800008b4:	1141                	add	sp,sp,-16
800008b6:	c422                	sw	s0,8(sp)
800008b8:	c226                	sw	s1,4(sp)
800008ba:	842a                	mv	s0,a0
800008bc:	84ae                	mv	s1,a1
800008be:	862e                	mv	a2,a1
800008c0:	85aa                	mv	a1,a0
800008c2:	00001517          	auipc	a0,0x1
800008c6:	8be50513          	add	a0,a0,-1858 # 80001180 <fromhost+0x164>
800008ca:	c606                	sw	ra,12(sp)
800008cc:	397d                	jal	8000058a <print>
800008ce:	fe402703          	lw	a4,-28(zero) # ffffffe4 <__stack_top+0x7fbfffe4>
800008d2:	fe002683          	lw	a3,-32(zero) # ffffffe0 <__stack_top+0x7fbfffe0>
800008d6:	fe402783          	lw	a5,-28(zero) # ffffffe4 <__stack_top+0x7fbfffe4>
800008da:	fee79ae3          	bne	a5,a4,800008ce <ll_write_timer_offset+0x1a>
800008de:	577d                	li	a4,-1
800008e0:	9436                	add	s0,s0,a3
800008e2:	fee02623          	sw	a4,-20(zero) # ffffffec <__stack_top+0x7fbfffec>
800008e6:	fe802423          	sw	s0,-24(zero) # ffffffe8 <__stack_top+0x7fbfffe8>
800008ea:	40b2                	lw	ra,12(sp)
800008ec:	00d436b3          	sltu	a3,s0,a3
800008f0:	97a6                	add	a5,a5,s1
800008f2:	4422                	lw	s0,8(sp)
800008f4:	96be                	add	a3,a3,a5
800008f6:	fed02623          	sw	a3,-20(zero) # ffffffec <__stack_top+0x7fbfffec>
800008fa:	4492                	lw	s1,4(sp)
800008fc:	0141                	add	sp,sp,16
800008fe:	8082                	ret

80000900 <sbi_write_timer_static>:
80000900:	87aa                	mv	a5,a0
80000902:	872e                	mv	a4,a1
80000904:	853e                	mv	a0,a5
80000906:	85ba                	mv	a1,a4
80000908:	4805                	li	a6,1
8000090a:	00000073          	ecall
8000090e:	8082                	ret

80000910 <sbi_write_timer_offset>:
80000910:	87aa                	mv	a5,a0
80000912:	872e                	mv	a4,a1
80000914:	853e                	mv	a0,a5
80000916:	85ba                	mv	a1,a4
80000918:	4809                	li	a6,2
8000091a:	00000073          	ecall
8000091e:	8082                	ret

80000920 <s_mode_trap_handler>:
80000920:	08c52783          	lw	a5,140(a0)
80000924:	1101                	add	sp,sp,-32
80000926:	ce06                	sw	ra,28(sp)
80000928:	0007ce63          	bltz	a5,80000944 <s_mode_trap_handler+0x24>
8000092c:	4735                	li	a4,13
8000092e:	00f77663          	bgeu	a4,a5,8000093a <s_mode_trap_handler+0x1a>
80000932:	473d                	li	a4,15
80000934:	00e78663          	beq	a5,a4,80000940 <s_mode_trap_handler+0x20>
80000938:	3df1                	jal	80000814 <default_handler>
8000093a:	472d                	li	a4,11
8000093c:	fef77ee3          	bgeu	a4,a5,80000938 <s_mode_trap_handler+0x18>
80000940:	fc0ff0ef          	jal	80000100 <s_mode_trap_return>
80000944:	0786                	sll	a5,a5,0x1
80000946:	8385                	srl	a5,a5,0x1
80000948:	4715                	li	a4,5
8000094a:	fee79be3          	bne	a5,a4,80000940 <s_mode_trap_handler+0x20>
8000094e:	c62a                	sw	a0,12(sp)
80000950:	3941                	jal	800005e0 <clk_handler>
80000952:	4532                	lw	a0,12(sp)
80000954:	b7f5                	j	80000940 <s_mode_trap_handler+0x20>

80000956 <reschedule_function>:
80000956:	ffc18793          	add	a5,gp,-4 # 80001288 <index>
8000095a:	438c                	lw	a1,0(a5)
8000095c:	4621                	li	a2,8
8000095e:	4681                	li	a3,0
80000960:	0585                	add	a1,a1,1
80000962:	c38c                	sw	a1,0(a5)
80000964:	ff418793          	add	a5,gp,-12 # 80001280 <time_remaining>
80000968:	c390                	sw	a2,0(a5)
8000096a:	00001517          	auipc	a0,0x1
8000096e:	83e50513          	add	a0,a0,-1986 # 800011a8 <fromhost+0x18c>
80000972:	c3d4                	sw	a3,4(a5)
80000974:	b919                	j	8000058a <print>

80000976 <s_mode_boot>:
80000976:	1141                	add	sp,sp,-16
80000978:	00001517          	auipc	a0,0x1
8000097c:	85050513          	add	a0,a0,-1968 # 800011c8 <fromhost+0x1ac>
80000980:	c606                	sw	ra,12(sp)
80000982:	3121                	jal	8000058a <print>
80000984:	02000593          	li	a1,32
80000988:	fffff517          	auipc	a0,0xfffff
8000098c:	7f850513          	add	a0,a0,2040 # 80000180 <s_mode_trap_entry>
80000990:	3305                	jal	800006b0 <setup_interrupts_s>
80000992:	3381                	jal	800006d2 <enable_interrupts_s>
80000994:	3b15                	jal	800006c8 <enable_prev_interrupts_s>
80000996:	40b2                	lw	ra,12(sp)
80000998:	4581                	li	a1,0
8000099a:	7d000513          	li	a0,2000
8000099e:	0141                	add	sp,sp,16
800009a0:	bf85                	j	80000910 <sbi_write_timer_offset>
	...

800009a4 <m_mode_boot>:
800009a4:	6585                	lui	a1,0x1
800009a6:	1141                	add	sp,sp,-16
800009a8:	88858593          	add	a1,a1,-1912 # 888 <boot-0x7ffff778>
800009ac:	00000517          	auipc	a0,0x0
800009b0:	13450513          	add	a0,a0,308 # 80000ae0 <m_mode_table>
800009b4:	c606                	sw	ra,12(sp)
800009b6:	31f9                	jal	80000684 <setup_interrupt_m_vectored>
800009b8:	00001517          	auipc	a0,0x1
800009bc:	82050513          	add	a0,a0,-2016 # 800011d8 <fromhost+0x1bc>
800009c0:	36e9                	jal	8000058a <print>
800009c2:	800007b7          	lui	a5,0x80000
800009c6:	477d                	li	a4,31
800009c8:	17fd                	add	a5,a5,-1 # 7fffffff <boot-0x1>
800009ca:	00000297          	auipc	t0,0x0
800009ce:	01628293          	add	t0,t0,22 # 800009e0 <m_mode_boot+0x3c>
800009d2:	305292f3          	csrrw	t0,mtvec,t0
800009d6:	3b079073          	csrw	pmpaddr0,a5
800009da:	3a071073          	csrw	pmpcfg0,a4
800009de:	0001                	nop
800009e0:	30529073          	csrw	mtvec,t0
800009e4:	317d                	jal	80000692 <enable_interrupts_m>
800009e6:	55fd                	li	a1,-1
800009e8:	dff00513          	li	a0,-513
800009ec:	3311                	jal	800006f0 <delegate_traps_to_s>
800009ee:	00001517          	auipc	a0,0x1
800009f2:	80a50513          	add	a0,a0,-2038 # 800011f8 <fromhost+0x1dc>
800009f6:	3e51                	jal	8000058a <print>
800009f8:	340027f3          	csrr	a5,mscratch
800009fc:	14079073          	csrw	sscratch,a5
80000a00:	40b2                	lw	ra,12(sp)
80000a02:	0141                	add	sp,sp,16
80000a04:	8082                	ret
	...

80000a10 <m_mode_exception_handler>:
80000a10:	ff010113          	add	sp,sp,-16
80000a14:	00112023          	sw	ra,0(sp)
80000a18:	00512223          	sw	t0,4(sp)
80000a1c:	00612423          	sw	t1,8(sp)
80000a20:	00712623          	sw	t2,12(sp)
80000a24:	342022f3          	csrr	t0,mcause
80000a28:	00900313          	li	t1,9
80000a2c:	08629463          	bne	t0,t1,80000ab4 <n_sbi_exception_handler>

80000a30 <sbi_ll_exception_handler>:
80000a30:	fd010113          	add	sp,sp,-48
80000a34:	00b12023          	sw	a1,0(sp)
80000a38:	00c12223          	sw	a2,4(sp)
80000a3c:	00d12423          	sw	a3,8(sp)
80000a40:	00e12623          	sw	a4,12(sp)
80000a44:	00f12823          	sw	a5,16(sp)
80000a48:	01012a23          	sw	a6,20(sp)
80000a4c:	01112c23          	sw	a7,24(sp)

80000a50 <sbi_case_1>:
80000a50:	00100313          	li	t1,1
80000a54:	00681563          	bne	a6,t1,80000a5e <sbi_case_2>
80000a58:	3535                	.insn	2, 0x3535
80000a5a:	0160006f          	j	80000a70 <sbi_handler_end>

80000a5e <sbi_case_2>:
80000a5e:	00200313          	li	t1,2
80000a62:	00681563          	bne	a6,t1,80000a6c <sbi_case_3>
80000a66:	35b9                	.insn	2, 0x35b9
80000a68:	0080006f          	j	80000a70 <sbi_handler_end>

80000a6c <sbi_case_3>:
80000a6c:	0040006f          	j	80000a70 <sbi_handler_end>

80000a70 <sbi_handler_end>:
80000a70:	341022f3          	csrr	t0,mepc
80000a74:	00428293          	add	t0,t0,4
80000a78:	34129073          	csrw	mepc,t0
80000a7c:	00012583          	lw	a1,0(sp)
80000a80:	00412603          	lw	a2,4(sp)
80000a84:	00812683          	lw	a3,8(sp)
80000a88:	00c12703          	lw	a4,12(sp)
80000a8c:	01012783          	lw	a5,16(sp)
80000a90:	01412803          	lw	a6,20(sp)
80000a94:	01812883          	lw	a7,24(sp)
80000a98:	03010113          	add	sp,sp,48
80000a9c:	00012083          	lw	ra,0(sp)
80000aa0:	00412283          	lw	t0,4(sp)
80000aa4:	00812303          	lw	t1,8(sp)
80000aa8:	00c12383          	lw	t2,12(sp)
80000aac:	01010113          	add	sp,sp,16
80000ab0:	30200073          	mret

80000ab4 <n_sbi_exception_handler>:
80000ab4:	00012083          	lw	ra,0(sp)
80000ab8:	00412283          	lw	t0,4(sp)
80000abc:	00812303          	lw	t1,8(sp)
80000ac0:	00c12383          	lw	t2,12(sp)
80000ac4:	01010113          	add	sp,sp,16
80000ac8:	d4dff06f          	j	80000814 <default_handler>
	...

80000ae0 <m_mode_table>:
80000ae0:	f31ff06f          	j	80000a10 <m_mode_exception_handler>
80000ae4:	d69ff06f          	j	8000084c <unreachable_handler>
80000ae8:	d65ff06f          	j	8000084c <unreachable_handler>
80000aec:	d61ff06f          	j	8000084c <unreachable_handler>
80000af0:	d5dff06f          	j	8000084c <unreachable_handler>
80000af4:	d59ff06f          	j	8000084c <unreachable_handler>
80000af8:	d55ff06f          	j	8000084c <unreachable_handler>
80000afc:	d51ff06f          	j	8000084c <unreachable_handler>
80000b00:	d4dff06f          	j	8000084c <unreachable_handler>
80000b04:	d49ff06f          	j	8000084c <unreachable_handler>
80000b08:	d45ff06f          	j	8000084c <unreachable_handler>
80000b0c:	d41ff06f          	j	8000084c <unreachable_handler>
80000b10:	d3dff06f          	j	8000084c <unreachable_handler>
80000b14:	d39ff06f          	j	8000084c <unreachable_handler>
80000b18:	d35ff06f          	j	8000084c <unreachable_handler>
80000b1c:	d31ff06f          	j	8000084c <unreachable_handler>
	...
