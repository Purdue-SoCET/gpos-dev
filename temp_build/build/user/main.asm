
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
8000009e:	103000ef          	jal	800009a0 <m_mode_boot>

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
800000c2:	8b628293          	add	t0,t0,-1866 # 80000974 <s_mode_boot>
800000c6:	34129073          	csrw	mepc,t0
800000ca:	30200073          	mret

800000ce <start_main>:
800000ce:	10000293          	li	t0,256
800000d2:	1002b073          	csrc	sstatus,t0
800000d6:	00000097          	auipc	ra,0x0
800000da:	01808093          	add	ra,ra,24 # 800000ee <done>
800000de:	00000297          	auipc	t0,0x0
800000e2:	11428293          	add	t0,t0,276 # 800001f2 <main>
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
80000108:	00452083          	lw	ra,4(a0)
8000010c:	00852103          	lw	sp,8(a0)
80000110:	00c52183          	lw	gp,12(a0)
80000114:	01052203          	lw	tp,16(a0)
80000118:	01452283          	lw	t0,20(a0)
8000011c:	01852303          	lw	t1,24(a0)
80000120:	01c52383          	lw	t2,28(a0)
80000124:	5100                	lw	s0,32(a0)
80000126:	5144                	lw	s1,36(a0)
80000128:	554c                	lw	a1,44(a0)
8000012a:	5910                	lw	a2,48(a0)
8000012c:	5954                	lw	a3,52(a0)
8000012e:	5d18                	lw	a4,56(a0)
80000130:	5d5c                	lw	a5,60(a0)
80000132:	04052803          	lw	a6,64(a0)
80000136:	04452883          	lw	a7,68(a0)
8000013a:	04852903          	lw	s2,72(a0)
8000013e:	04c52983          	lw	s3,76(a0)
80000142:	05052a03          	lw	s4,80(a0)
80000146:	05452a83          	lw	s5,84(a0)
8000014a:	05852b03          	lw	s6,88(a0)
8000014e:	05c52b83          	lw	s7,92(a0)
80000152:	06052c03          	lw	s8,96(a0)
80000156:	06452c83          	lw	s9,100(a0)
8000015a:	06852d03          	lw	s10,104(a0)
8000015e:	06c52d83          	lw	s11,108(a0)
80000162:	07052e03          	lw	t3,112(a0)
80000166:	07452e83          	lw	t4,116(a0)
8000016a:	07852f03          	lw	t5,120(a0)
8000016e:	07c52f83          	lw	t6,124(a0)
80000172:	5508                	lw	a0,40(a0)
80000174:	14011073          	csrw	sscratch,sp
80000178:	10200073          	sret
8000017c:	00000013          	nop

80000180 <s_mode_trap_entry>:
80000180:	14011173          	csrrw	sp,sscratch,sp
80000184:	c206                	sw	ra,4(sp)
80000186:	c40a                	sw	sp,8(sp)
80000188:	c60e                	sw	gp,12(sp)
8000018a:	c812                	sw	tp,16(sp)
8000018c:	ca16                	sw	t0,20(sp)
8000018e:	cc1a                	sw	t1,24(sp)
80000190:	ce1e                	sw	t2,28(sp)
80000192:	d022                	sw	s0,32(sp)
80000194:	d226                	sw	s1,36(sp)
80000196:	d42a                	sw	a0,40(sp)
80000198:	d62e                	sw	a1,44(sp)
8000019a:	d832                	sw	a2,48(sp)
8000019c:	da36                	sw	a3,52(sp)
8000019e:	dc3a                	sw	a4,56(sp)
800001a0:	de3e                	sw	a5,60(sp)
800001a2:	c0c2                	sw	a6,64(sp)
800001a4:	c2c6                	sw	a7,68(sp)
800001a6:	c4ca                	sw	s2,72(sp)
800001a8:	c6ce                	sw	s3,76(sp)
800001aa:	c8d2                	sw	s4,80(sp)
800001ac:	cad6                	sw	s5,84(sp)
800001ae:	ccda                	sw	s6,88(sp)
800001b0:	cede                	sw	s7,92(sp)
800001b2:	d0e2                	sw	s8,96(sp)
800001b4:	d2e6                	sw	s9,100(sp)
800001b6:	d4ea                	sw	s10,104(sp)
800001b8:	d6ee                	sw	s11,108(sp)
800001ba:	d8f2                	sw	t3,112(sp)
800001bc:	daf6                	sw	t4,116(sp)
800001be:	dcfa                	sw	t5,120(sp)
800001c0:	defe                	sw	t6,124(sp)
800001c2:	100022f3          	csrr	t0,sstatus
800001c6:	c116                	sw	t0,128(sp)
800001c8:	141022f3          	csrr	t0,sepc
800001cc:	c316                	sw	t0,132(sp)
800001ce:	143022f3          	csrr	t0,stval
800001d2:	c516                	sw	t0,136(sp)
800001d4:	850a                	mv	a0,sp
800001d6:	142022f3          	csrr	t0,scause
800001da:	0002c563          	bltz	t0,800001e4 <trap_is_interrupt>

800001de <trap_is_exception>:
800001de:	c716                	sw	t0,140(sp)
800001e0:	2919                	jal	800005f6 <s_mode_exception_handler>
800001e2:	bf39                	j	80000100 <s_mode_trap_return>

800001e4 <trap_is_interrupt>:
800001e4:	0286                	sll	t0,t0,0x1
800001e6:	0012d293          	srl	t0,t0,0x1
800001ea:	c716                	sw	t0,140(sp)
800001ec:	2ee5                	jal	800005e4 <s_mode_interrupt_handler>
800001ee:	bf09                	j	80000100 <s_mode_trap_return>
	...

800001f2 <main>:
800001f2:	1101                	add	sp,sp,-32
800001f4:	00001517          	auipc	a0,0x1
800001f8:	e2c50513          	add	a0,a0,-468 # 80001020 <fromhost+0x4>
800001fc:	ce06                	sw	ra,28(sp)
800001fe:	2e41                	jal	8000058e <print>
80000200:	4785                	li	a5,1
80000202:	c63e                	sw	a5,12(sp)
80000204:	47b2                	lw	a5,12(sp)
80000206:	fffd                	bnez	a5,80000204 <main+0x12>
80000208:	40f2                	lw	ra,28(sp)
8000020a:	6105                	add	sp,sp,32
8000020c:	8082                	ret

8000020e <print_string>:
8000020e:	00054783          	lbu	a5,0(a0)
80000212:	cb81                	beqz	a5,80000222 <print_string+0x14>
80000214:	0505                	add	a0,a0,1
80000216:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x7fbffffc>
8000021a:	00054783          	lbu	a5,0(a0)
8000021e:	0505                	add	a0,a0,1
80000220:	fbfd                	bnez	a5,80000216 <print_string+0x8>
80000222:	8082                	ret

80000224 <vformat>:
80000224:	00054683          	lbu	a3,0(a0)
80000228:	ce85                	beqz	a3,80000260 <vformat+0x3c>
8000022a:	4781                	li	a5,0
8000022c:	4801                	li	a6,0
8000022e:	4881                	li	a7,0
80000230:	872e                	mv	a4,a1
80000232:	02500e13          	li	t3,37
80000236:	03f00e93          	li	t4,63
8000023a:	4fd9                	li	t6,22
8000023c:	f8818f13          	add	t5,gp,-120 # 80001214 <fromhost+0x1f8>
80000240:	833a                	mv	t1,a4
80000242:	03c68263          	beq	a3,t3,80000266 <vformat+0x42>
80000246:	0805                	add	a6,a6,1
80000248:	00d70023          	sb	a3,0(a4)
8000024c:	01058733          	add	a4,a1,a6
80000250:	0785                	add	a5,a5,1
80000252:	00f506b3          	add	a3,a0,a5
80000256:	0006c683          	lbu	a3,0(a3)
8000025a:	88be                	mv	a7,a5
8000025c:	f2f5                	bnez	a3,80000240 <vformat+0x1c>
8000025e:	85ba                	mv	a1,a4
80000260:	00058023          	sb	zero,0(a1)
80000264:	8082                	ret
80000266:	98aa                	add	a7,a7,a0
80000268:	0018c683          	lbu	a3,1(a7)
8000026c:	2a068263          	beqz	a3,80000510 <vformat+0x2ec>
80000270:	2dc68463          	beq	a3,t3,80000538 <vformat+0x314>
80000274:	f9e68693          	add	a3,a3,-98
80000278:	0ff6f693          	zext.b	a3,a3
8000027c:	2cdfe563          	bltu	t6,a3,80000546 <vformat+0x322>
80000280:	7139                	add	sp,sp,-64
80000282:	de22                	sw	s0,60(sp)
80000284:	dc26                	sw	s1,56(sp)
80000286:	da4a                	sw	s2,52(sp)
80000288:	d84e                	sw	s3,48(sp)
8000028a:	d652                	sw	s4,44(sp)
8000028c:	068a                	sll	a3,a3,0x2
8000028e:	96fa                	add	a3,a3,t5
80000290:	4294                	lw	a3,0(a3)
80000292:	96fa                	add	a3,a3,t5
80000294:	8682                	jr	a3
80000296:	98aa                	add	a7,a7,a0
80000298:	0018c683          	lbu	a3,1(a7)
8000029c:	1e068563          	beqz	a3,80000486 <vformat+0x262>
800002a0:	21c68163          	beq	a3,t3,800004a2 <vformat+0x27e>
800002a4:	f9e68693          	add	a3,a3,-98
800002a8:	0ff6f693          	zext.b	a3,a3
800002ac:	fedff0e3          	bgeu	t6,a3,8000028c <vformat+0x68>
800002b0:	03f00893          	li	a7,63
800002b4:	00280693          	add	a3,a6,2
800002b8:	01170023          	sb	a7,0(a4)
800002bc:	011700a3          	sb	a7,1(a4)
800002c0:	080d                	add	a6,a6,3
800002c2:	00d58733          	add	a4,a1,a3
800002c6:	01170023          	sb	a7,0(a4)
800002ca:	01058733          	add	a4,a1,a6
800002ce:	0785                	add	a5,a5,1
800002d0:	0785                	add	a5,a5,1
800002d2:	00f506b3          	add	a3,a0,a5
800002d6:	0006c683          	lbu	a3,0(a3)
800002da:	88be                	mv	a7,a5
800002dc:	c285                	beqz	a3,800002fc <vformat+0xd8>
800002de:	833a                	mv	t1,a4
800002e0:	fbc68be3          	beq	a3,t3,80000296 <vformat+0x72>
800002e4:	0785                	add	a5,a5,1
800002e6:	00d70023          	sb	a3,0(a4)
800002ea:	00f506b3          	add	a3,a0,a5
800002ee:	0006c683          	lbu	a3,0(a3)
800002f2:	0805                	add	a6,a6,1
800002f4:	01058733          	add	a4,a1,a6
800002f8:	88be                	mv	a7,a5
800002fa:	f2f5                	bnez	a3,800002de <vformat+0xba>
800002fc:	00070023          	sb	zero,0(a4)
80000300:	5472                	lw	s0,60(sp)
80000302:	54e2                	lw	s1,56(sp)
80000304:	5952                	lw	s2,52(sp)
80000306:	59c2                	lw	s3,48(sp)
80000308:	5a32                	lw	s4,44(sp)
8000030a:	6121                	add	sp,sp,64
8000030c:	8082                	ret
8000030e:	00062303          	lw	t1,0(a2)
80000312:	03000693          	li	a3,48
80000316:	07800893          	li	a7,120
8000031a:	0809                	add	a6,a6,2
8000031c:	00d70023          	sb	a3,0(a4)
80000320:	011700a3          	sb	a7,1(a4)
80000324:	0611                	add	a2,a2,4
80000326:	010583b3          	add	t2,a1,a6
8000032a:	18030263          	beqz	t1,800004ae <vformat+0x28a>
8000032e:	4881                	li	a7,0
80000330:	868a                	mv	a3,sp
80000332:	fe418293          	add	t0,gp,-28 # 80001270 <table>
80000336:	00f37713          	and	a4,t1,15
8000033a:	9716                	add	a4,a4,t0
8000033c:	00074483          	lbu	s1,0(a4)
80000340:	8746                	mv	a4,a7
80000342:	0885                	add	a7,a7,1
80000344:	01168433          	add	s0,a3,a7
80000348:	fe940fa3          	sb	s1,-1(s0)
8000034c:	00435313          	srl	t1,t1,0x4
80000350:	fe0313e3          	bnez	t1,80000336 <vformat+0x112>
80000354:	9736                	add	a4,a4,a3
80000356:	831e                	mv	t1,t2
80000358:	00074383          	lbu	t2,0(a4)
8000035c:	82ba                	mv	t0,a4
8000035e:	0305                	add	t1,t1,1
80000360:	fe730fa3          	sb	t2,-1(t1)
80000364:	177d                	add	a4,a4,-1
80000366:	fe5699e3          	bne	a3,t0,80000358 <vformat+0x134>
8000036a:	9846                	add	a6,a6,a7
8000036c:	01058733          	add	a4,a1,a6
80000370:	bfb9                	j	800002ce <vformat+0xaa>
80000372:	00062383          	lw	t2,0(a2)
80000376:	0611                	add	a2,a2,4
80000378:	1a038a63          	beqz	t2,8000052c <vformat+0x308>
8000037c:	4301                	li	t1,0
8000037e:	868a                	mv	a3,sp
80000380:	fe418293          	add	t0,gp,-28 # 80001270 <table>
80000384:	44a9                	li	s1,10
80000386:	4a25                	li	s4,9
80000388:	0293f433          	remu	s0,t2,s1
8000038c:	889a                	mv	a7,t1
8000038e:	0305                	add	t1,t1,1
80000390:	006689b3          	add	s3,a3,t1
80000394:	891e                	mv	s2,t2
80000396:	9416                	add	s0,s0,t0
80000398:	00044403          	lbu	s0,0(s0)
8000039c:	0293d3b3          	divu	t2,t2,s1
800003a0:	fe898fa3          	sb	s0,-1(s3)
800003a4:	ff2a62e3          	bltu	s4,s2,80000388 <vformat+0x164>
800003a8:	98b6                	add	a7,a7,a3
800003aa:	0008c383          	lbu	t2,0(a7)
800003ae:	82c6                	mv	t0,a7
800003b0:	0705                	add	a4,a4,1
800003b2:	fe770fa3          	sb	t2,-1(a4)
800003b6:	18fd                	add	a7,a7,-1
800003b8:	fe5699e3          	bne	a3,t0,800003aa <vformat+0x186>
800003bc:	981a                	add	a6,a6,t1
800003be:	01058733          	add	a4,a1,a6
800003c2:	b731                	j	800002ce <vformat+0xaa>
800003c4:	00062283          	lw	t0,0(a2)
800003c8:	0611                	add	a2,a2,4
800003ca:	0002c883          	lbu	a7,0(t0)
800003ce:	f00880e3          	beqz	a7,800002ce <vformat+0xaa>
800003d2:	4681                	li	a3,0
800003d4:	00d70333          	add	t1,a4,a3
800003d8:	0685                	add	a3,a3,1
800003da:	01130023          	sb	a7,0(t1)
800003de:	00d288b3          	add	a7,t0,a3
800003e2:	0008c883          	lbu	a7,0(a7)
800003e6:	fe0897e3          	bnez	a7,800003d4 <vformat+0x1b0>
800003ea:	9836                	add	a6,a6,a3
800003ec:	01058733          	add	a4,a1,a6
800003f0:	bdf9                	j	800002ce <vformat+0xaa>
800003f2:	00062883          	lw	a7,0(a2)
800003f6:	0611                	add	a2,a2,4
800003f8:	0c08c263          	bltz	a7,800004bc <vformat+0x298>
800003fc:	0c089963          	bnez	a7,800004ce <vformat+0x2aa>
80000400:	03000693          	li	a3,48
80000404:	00d70023          	sb	a3,0(a4)
80000408:	4385                	li	t2,1
8000040a:	981e                	add	a6,a6,t2
8000040c:	01058733          	add	a4,a1,a6
80000410:	bd7d                	j	800002ce <vformat+0xaa>
80000412:	4214                	lw	a3,0(a2)
80000414:	0805                	add	a6,a6,1
80000416:	0611                	add	a2,a2,4
80000418:	00d70023          	sb	a3,0(a4)
8000041c:	01058733          	add	a4,a1,a6
80000420:	b57d                	j	800002ce <vformat+0xaa>
80000422:	00062303          	lw	t1,0(a2)
80000426:	03000693          	li	a3,48
8000042a:	06200893          	li	a7,98
8000042e:	0809                	add	a6,a6,2
80000430:	00d70023          	sb	a3,0(a4)
80000434:	011700a3          	sb	a7,1(a4)
80000438:	0611                	add	a2,a2,4
8000043a:	010583b3          	add	t2,a1,a6
8000043e:	06030863          	beqz	t1,800004ae <vformat+0x28a>
80000442:	4881                	li	a7,0
80000444:	868a                	mv	a3,sp
80000446:	fe418293          	add	t0,gp,-28 # 80001270 <table>
8000044a:	00137713          	and	a4,t1,1
8000044e:	9716                	add	a4,a4,t0
80000450:	00074483          	lbu	s1,0(a4)
80000454:	8746                	mv	a4,a7
80000456:	0885                	add	a7,a7,1
80000458:	01168433          	add	s0,a3,a7
8000045c:	fe940fa3          	sb	s1,-1(s0)
80000460:	00135313          	srl	t1,t1,0x1
80000464:	fe0313e3          	bnez	t1,8000044a <vformat+0x226>
80000468:	9736                	add	a4,a4,a3
8000046a:	831e                	mv	t1,t2
8000046c:	00074383          	lbu	t2,0(a4)
80000470:	82ba                	mv	t0,a4
80000472:	0305                	add	t1,t1,1
80000474:	fe730fa3          	sb	t2,-1(t1)
80000478:	177d                	add	a4,a4,-1
8000047a:	fe5699e3          	bne	a3,t0,8000046c <vformat+0x248>
8000047e:	9846                	add	a6,a6,a7
80000480:	01058733          	add	a4,a1,a6
80000484:	b5a9                	j	800002ce <vformat+0xaa>
80000486:	00280693          	add	a3,a6,2
8000048a:	01d70023          	sb	t4,0(a4)
8000048e:	01d700a3          	sb	t4,1(a4)
80000492:	080d                	add	a6,a6,3
80000494:	00d58733          	add	a4,a1,a3
80000498:	01d70023          	sb	t4,0(a4)
8000049c:	01058733          	add	a4,a1,a6
800004a0:	bd05                	j	800002d0 <vformat+0xac>
800004a2:	0805                	add	a6,a6,1
800004a4:	01c70023          	sb	t3,0(a4)
800004a8:	01058733          	add	a4,a1,a6
800004ac:	b50d                	j	800002ce <vformat+0xaa>
800004ae:	4885                	li	a7,1
800004b0:	9846                	add	a6,a6,a7
800004b2:	00d38023          	sb	a3,0(t2)
800004b6:	01058733          	add	a4,a1,a6
800004ba:	bd11                	j	800002ce <vformat+0xaa>
800004bc:	0805                	add	a6,a6,1
800004be:	02d00693          	li	a3,45
800004c2:	00d70023          	sb	a3,0(a4)
800004c6:	411008b3          	neg	a7,a7
800004ca:	01058333          	add	t1,a1,a6
800004ce:	4381                	li	t2,0
800004d0:	868a                	mv	a3,sp
800004d2:	fe418293          	add	t0,gp,-28 # 80001270 <table>
800004d6:	44a9                	li	s1,10
800004d8:	4a25                	li	s4,9
800004da:	0298f433          	remu	s0,a7,s1
800004de:	871e                	mv	a4,t2
800004e0:	0385                	add	t2,t2,1
800004e2:	007689b3          	add	s3,a3,t2
800004e6:	8946                	mv	s2,a7
800004e8:	9416                	add	s0,s0,t0
800004ea:	00044403          	lbu	s0,0(s0)
800004ee:	0298d8b3          	divu	a7,a7,s1
800004f2:	fe898fa3          	sb	s0,-1(s3)
800004f6:	ff2a62e3          	bltu	s4,s2,800004da <vformat+0x2b6>
800004fa:	9736                	add	a4,a4,a3
800004fc:	00074283          	lbu	t0,0(a4)
80000500:	88ba                	mv	a7,a4
80000502:	0305                	add	t1,t1,1
80000504:	fe530fa3          	sb	t0,-1(t1)
80000508:	177d                	add	a4,a4,-1
8000050a:	ff1699e3          	bne	a3,a7,800004fc <vformat+0x2d8>
8000050e:	bdf5                	j	8000040a <vformat+0x1e6>
80000510:	00280693          	add	a3,a6,2
80000514:	01d70023          	sb	t4,0(a4)
80000518:	01d700a3          	sb	t4,1(a4)
8000051c:	080d                	add	a6,a6,3
8000051e:	00d58733          	add	a4,a1,a3
80000522:	01d70023          	sb	t4,0(a4)
80000526:	01058733          	add	a4,a1,a6
8000052a:	b31d                	j	80000250 <vformat+0x2c>
8000052c:	03000693          	li	a3,48
80000530:	00d70023          	sb	a3,0(a4)
80000534:	4305                	li	t1,1
80000536:	b559                	j	800003bc <vformat+0x198>
80000538:	0805                	add	a6,a6,1
8000053a:	01c70023          	sb	t3,0(a4)
8000053e:	0785                	add	a5,a5,1
80000540:	01058733          	add	a4,a1,a6
80000544:	b331                	j	80000250 <vformat+0x2c>
80000546:	03f00893          	li	a7,63
8000054a:	00280693          	add	a3,a6,2
8000054e:	01170023          	sb	a7,0(a4)
80000552:	011700a3          	sb	a7,1(a4)
80000556:	080d                	add	a6,a6,3
80000558:	00d58733          	add	a4,a1,a3
8000055c:	01170023          	sb	a7,0(a4)
80000560:	0785                	add	a5,a5,1
80000562:	01058733          	add	a4,a1,a6
80000566:	b1ed                	j	80000250 <vformat+0x2c>

80000568 <vprint>:
80000568:	7175                	add	sp,sp,-144
8000056a:	862e                	mv	a2,a1
8000056c:	858a                	mv	a1,sp
8000056e:	c706                	sw	ra,140(sp)
80000570:	3955                	jal	80000224 <vformat>
80000572:	00014783          	lbu	a5,0(sp)
80000576:	cb89                	beqz	a5,80000588 <vprint+0x20>
80000578:	00110713          	add	a4,sp,1
8000057c:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x7fbffffc>
80000580:	00074783          	lbu	a5,0(a4)
80000584:	0705                	add	a4,a4,1
80000586:	fbfd                	bnez	a5,8000057c <vprint+0x14>
80000588:	40ba                	lw	ra,140(sp)
8000058a:	6149                	add	sp,sp,144
8000058c:	8082                	ret

8000058e <print>:
8000058e:	7139                	add	sp,sp,-64
80000590:	02410313          	add	t1,sp,36
80000594:	d22e                	sw	a1,36(sp)
80000596:	859a                	mv	a1,t1
80000598:	ce06                	sw	ra,28(sp)
8000059a:	d432                	sw	a2,40(sp)
8000059c:	d636                	sw	a3,44(sp)
8000059e:	d83a                	sw	a4,48(sp)
800005a0:	da3e                	sw	a5,52(sp)
800005a2:	dc42                	sw	a6,56(sp)
800005a4:	de46                	sw	a7,60(sp)
800005a6:	c61a                	sw	t1,12(sp)
800005a8:	37c1                	jal	80000568 <vprint>
800005aa:	40f2                	lw	ra,28(sp)
800005ac:	6121                	add	sp,sp,64
800005ae:	8082                	ret

800005b0 <format>:
800005b0:	7139                	add	sp,sp,-64
800005b2:	02810313          	add	t1,sp,40
800005b6:	d432                	sw	a2,40(sp)
800005b8:	861a                	mv	a2,t1
800005ba:	ce06                	sw	ra,28(sp)
800005bc:	d636                	sw	a3,44(sp)
800005be:	d83a                	sw	a4,48(sp)
800005c0:	da3e                	sw	a5,52(sp)
800005c2:	dc42                	sw	a6,56(sp)
800005c4:	de46                	sw	a7,60(sp)
800005c6:	c61a                	sw	t1,12(sp)
800005c8:	39b1                	jal	80000224 <vformat>
800005ca:	40f2                	lw	ra,28(sp)
800005cc:	6121                	add	sp,sp,64
800005ce:	8082                	ret

800005d0 <dprint>:
800005d0:	1101                	add	sp,sp,-32
800005d2:	c22e                	sw	a1,4(sp)
800005d4:	c432                	sw	a2,8(sp)
800005d6:	c636                	sw	a3,12(sp)
800005d8:	c83a                	sw	a4,16(sp)
800005da:	ca3e                	sw	a5,20(sp)
800005dc:	cc42                	sw	a6,24(sp)
800005de:	ce46                	sw	a7,28(sp)
800005e0:	6105                	add	sp,sp,32
800005e2:	8082                	ret

800005e4 <s_mode_interrupt_handler>:
800005e4:	08c52703          	lw	a4,140(a0)
800005e8:	4795                	li	a5,5
800005ea:	00f71363          	bne	a4,a5,800005f0 <s_mode_interrupt_handler+0xc>
800005ee:	a01d                	j	80000614 <clk_handler>
800005f0:	1141                	add	sp,sp,-16
800005f2:	c606                	sw	ra,12(sp)
800005f4:	2c91                	jal	80000848 <default_handler>

800005f6 <s_mode_exception_handler>:
800005f6:	08c52783          	lw	a5,140(a0)
800005fa:	4735                	li	a4,13
800005fc:	00f75663          	bge	a4,a5,80000608 <s_mode_exception_handler+0x12>
80000600:	473d                	li	a4,15
80000602:	00e79663          	bne	a5,a4,8000060e <s_mode_exception_handler+0x18>
80000606:	8082                	ret
80000608:	472d                	li	a4,11
8000060a:	fef74ee3          	blt	a4,a5,80000606 <s_mode_exception_handler+0x10>
8000060e:	1141                	add	sp,sp,-16
80000610:	c606                	sw	ra,12(sp)
80000612:	2c1d                	jal	80000848 <default_handler>

80000614 <clk_handler>:
80000614:	7139                	add	sp,sp,-64
80000616:	cc3e                	sw	a5,24(sp)
80000618:	ff418793          	add	a5,gp,-12 # 80001280 <time_remaining>
8000061c:	d62a                	sw	a0,44(sp)
8000061e:	4388                	lw	a0,0(a5)
80000620:	d42e                	sw	a1,40(sp)
80000622:	43cc                	lw	a1,4(a5)
80000624:	d232                	sw	a2,36(sp)
80000626:	d036                	sw	a3,32(sp)
80000628:	ce3a                	sw	a4,28(sp)
8000062a:	de06                	sw	ra,60(sp)
8000062c:	dc16                	sw	t0,56(sp)
8000062e:	da1a                	sw	t1,52(sp)
80000630:	d81e                	sw	t2,48(sp)
80000632:	ca42                	sw	a6,20(sp)
80000634:	c846                	sw	a7,16(sp)
80000636:	c672                	sw	t3,12(sp)
80000638:	c476                	sw	t4,8(sp)
8000063a:	c27a                	sw	t5,4(sp)
8000063c:	c07e                	sw	t6,0(sp)
8000063e:	00153713          	seqz	a4,a0
80000642:	fff50613          	add	a2,a0,-1
80000646:	c390                	sw	a2,0(a5)
80000648:	40e586b3          	sub	a3,a1,a4
8000064c:	c3d4                	sw	a3,4(a5)
8000064e:	4398                	lw	a4,0(a5)
80000650:	43dc                	lw	a5,4(a5)
80000652:	8f5d                	or	a4,a4,a5
80000654:	cb05                	beqz	a4,80000684 <clk_handler+0x70>
80000656:	4581                	li	a1,0
80000658:	03200513          	li	a0,50
8000065c:	24e5                	jal	80000944 <sbi_write_timer_offset>
8000065e:	50f2                	lw	ra,60(sp)
80000660:	52e2                	lw	t0,56(sp)
80000662:	5352                	lw	t1,52(sp)
80000664:	53c2                	lw	t2,48(sp)
80000666:	5532                	lw	a0,44(sp)
80000668:	55a2                	lw	a1,40(sp)
8000066a:	5612                	lw	a2,36(sp)
8000066c:	5682                	lw	a3,32(sp)
8000066e:	4772                	lw	a4,28(sp)
80000670:	47e2                	lw	a5,24(sp)
80000672:	4852                	lw	a6,20(sp)
80000674:	48c2                	lw	a7,16(sp)
80000676:	4e32                	lw	t3,12(sp)
80000678:	4ea2                	lw	t4,8(sp)
8000067a:	4f12                	lw	t5,4(sp)
8000067c:	4f82                	lw	t6,0(sp)
8000067e:	6121                	add	sp,sp,64
80000680:	10200073          	sret
80000684:	2cc1                	jal	80000954 <reschedule_function>
80000686:	bfc1                	j	80000656 <clk_handler+0x42>
	...

8000068a <advance_mepc>:
8000068a:	341027f3          	csrr	a5,mepc
8000068e:	953e                	add	a0,a0,a5
80000690:	34151073          	csrw	mepc,a0
80000694:	8082                	ret

80000696 <set_mepc>:
80000696:	34151073          	csrw	mepc,a0
8000069a:	8082                	ret

8000069c <advance_sepc>:
8000069c:	141027f3          	csrr	a5,sepc
800006a0:	953e                	add	a0,a0,a5
800006a2:	14151073          	csrw	sepc,a0
800006a6:	8082                	ret

800006a8 <set_sepc>:
800006a8:	14151073          	csrw	sepc,a0
800006ac:	8082                	ret

800006ae <setup_interrupts_m>:
800006ae:	30551073          	csrw	mtvec,a0
800006b2:	30459073          	csrw	mie,a1
800006b6:	8082                	ret

800006b8 <setup_interrupt_m_vectored>:
800006b8:	00156513          	or	a0,a0,1
800006bc:	30551073          	csrw	mtvec,a0
800006c0:	30459073          	csrw	mie,a1
800006c4:	8082                	ret

800006c6 <enable_interrupts_m>:
800006c6:	47a1                	li	a5,8
800006c8:	3007a073          	csrs	mstatus,a5
800006cc:	8082                	ret

800006ce <disable_interrupts_m>:
800006ce:	47a1                	li	a5,8
800006d0:	3007b073          	csrc	mstatus,a5
800006d4:	8082                	ret

800006d6 <enable_interrupts_save_m>:
800006d6:	30051073          	csrw	mstatus,a0
800006da:	8082                	ret

800006dc <disable_interrupts_save_m>:
800006dc:	4521                	li	a0,8
800006de:	30053573          	csrrc	a0,mstatus,a0
800006e2:	8082                	ret

800006e4 <setup_interrupts_s>:
800006e4:	10551073          	csrw	stvec,a0
800006e8:	10459073          	csrw	sie,a1
800006ec:	8082                	ret

800006ee <setup_interrupt_s_vectored>:
800006ee:	00156513          	or	a0,a0,1
800006f2:	10551073          	csrw	stvec,a0
800006f6:	10459073          	csrw	sie,a1
800006fa:	8082                	ret

800006fc <enable_prev_interrupts_s>:
800006fc:	02000793          	li	a5,32
80000700:	1007a073          	csrs	sstatus,a5
80000704:	8082                	ret

80000706 <enable_interrupts_s>:
80000706:	4789                	li	a5,2
80000708:	1007a073          	csrs	sstatus,a5
8000070c:	8082                	ret

8000070e <disable_interrupts_s>:
8000070e:	4789                	li	a5,2
80000710:	1007b073          	csrc	sstatus,a5
80000714:	8082                	ret

80000716 <enable_interrupts_save_s>:
80000716:	10051073          	csrw	sstatus,a0
8000071a:	8082                	ret

8000071c <disable_interrupts_save_s>:
8000071c:	4509                	li	a0,2
8000071e:	10053573          	csrrc	a0,sstatus,a0
80000722:	8082                	ret

80000724 <delegate_traps_to_s>:
80000724:	30251073          	csrw	medeleg,a0
80000728:	30359073          	csrw	mideleg,a1
8000072c:	8082                	ret

8000072e <check_supervisor_mode_available>:
8000072e:	6785                	lui	a5,0x1
80000730:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
80000734:	3007a573          	csrrs	a0,mstatus,a5
80000738:	30051573          	csrrw	a0,mstatus,a0
8000073c:	6789                	lui	a5,0x2
8000073e:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
80000742:	8d7d                	and	a0,a0,a5
80000744:	80050513          	add	a0,a0,-2048
80000748:	00153513          	seqz	a0,a0
8000074c:	8082                	ret

8000074e <require_supervisor_mode>:
8000074e:	6785                	lui	a5,0x1
80000750:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
80000754:	3007a7f3          	csrrs	a5,mstatus,a5
80000758:	300797f3          	csrrw	a5,mstatus,a5
8000075c:	6709                	lui	a4,0x2
8000075e:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
80000762:	8ff9                	and	a5,a5,a4
80000764:	80078793          	add	a5,a5,-2048
80000768:	e391                	bnez	a5,8000076c <require_supervisor_mode+0x1e>
8000076a:	8082                	ret
8000076c:	1141                	add	sp,sp,-16
8000076e:	00001517          	auipc	a0,0x1
80000772:	8c250513          	add	a0,a0,-1854 # 80001030 <fromhost+0x14>
80000776:	c606                	sw	ra,12(sp)
80000778:	3d19                	jal	8000058e <print>
8000077a:	57fd                	li	a5,-1
8000077c:	d8f1a423          	sw	a5,-632(gp) # 80001014 <flag>
80000780:	32bd                	jal	800000ee <done>

80000782 <read_exception_context>:
80000782:	c00027f3          	rdcycle	a5
80000786:	c55c                	sw	a5,12(a0)
80000788:	c01027f3          	rdtime	a5
8000078c:	c91c                	sw	a5,16(a0)
8000078e:	342027f3          	csrr	a5,mcause
80000792:	c51c                	sw	a5,8(a0)
80000794:	341027f3          	csrr	a5,mepc
80000798:	c11c                	sw	a5,0(a0)
8000079a:	343027f3          	csrr	a5,mtval
8000079e:	c15c                	sw	a5,4(a0)
800007a0:	c03027f3          	csrr	a5,hpmcounter3
800007a4:	c95c                	sw	a5,20(a0)
800007a6:	c04027f3          	csrr	a5,hpmcounter4
800007aa:	cd1c                	sw	a5,24(a0)
800007ac:	8082                	ret

800007ae <read_exception_context_s>:
800007ae:	c00027f3          	rdcycle	a5
800007b2:	c55c                	sw	a5,12(a0)
800007b4:	c01027f3          	rdtime	a5
800007b8:	c91c                	sw	a5,16(a0)
800007ba:	142027f3          	csrr	a5,scause
800007be:	c51c                	sw	a5,8(a0)
800007c0:	141027f3          	csrr	a5,sepc
800007c4:	c11c                	sw	a5,0(a0)
800007c6:	143027f3          	csrr	a5,stval
800007ca:	c15c                	sw	a5,4(a0)
800007cc:	c03027f3          	csrr	a5,hpmcounter3
800007d0:	c95c                	sw	a5,20(a0)
800007d2:	c04027f3          	csrr	a5,hpmcounter4
800007d6:	cd1c                	sw	a5,24(a0)
800007d8:	8082                	ret

800007da <print_exception_context>:
800007da:	1141                	add	sp,sp,-16
800007dc:	c422                	sw	s0,8(sp)
800007de:	842a                	mv	s0,a0
800007e0:	00001517          	auipc	a0,0x1
800007e4:	87450513          	add	a0,a0,-1932 # 80001054 <fromhost+0x38>
800007e8:	c606                	sw	ra,12(sp)
800007ea:	3355                	jal	8000058e <print>
800007ec:	440c                	lw	a1,8(s0)
800007ee:	00001517          	auipc	a0,0x1
800007f2:	87e50513          	add	a0,a0,-1922 # 8000106c <fromhost+0x50>
800007f6:	3b61                	jal	8000058e <print>
800007f8:	400c                	lw	a1,0(s0)
800007fa:	00001517          	auipc	a0,0x1
800007fe:	88250513          	add	a0,a0,-1918 # 8000107c <fromhost+0x60>
80000802:	3371                	jal	8000058e <print>
80000804:	404c                	lw	a1,4(s0)
80000806:	00001517          	auipc	a0,0x1
8000080a:	88650513          	add	a0,a0,-1914 # 8000108c <fromhost+0x70>
8000080e:	3341                	jal	8000058e <print>
80000810:	444c                	lw	a1,12(s0)
80000812:	00001517          	auipc	a0,0x1
80000816:	88a50513          	add	a0,a0,-1910 # 8000109c <fromhost+0x80>
8000081a:	3b95                	jal	8000058e <print>
8000081c:	480c                	lw	a1,16(s0)
8000081e:	00001517          	auipc	a0,0x1
80000822:	88e50513          	add	a0,a0,-1906 # 800010ac <fromhost+0x90>
80000826:	33a5                	jal	8000058e <print>
80000828:	484c                	lw	a1,20(s0)
8000082a:	00001517          	auipc	a0,0x1
8000082e:	89250513          	add	a0,a0,-1902 # 800010bc <fromhost+0xa0>
80000832:	3bb1                	jal	8000058e <print>
80000834:	4c0c                	lw	a1,24(s0)
80000836:	4422                	lw	s0,8(sp)
80000838:	40b2                	lw	ra,12(sp)
8000083a:	00001517          	auipc	a0,0x1
8000083e:	89250513          	add	a0,a0,-1902 # 800010cc <fromhost+0xb0>
80000842:	0141                	add	sp,sp,16
80000844:	b3a9                	j	8000058e <print>
	...

80000848 <default_handler>:
80000848:	711d                	add	sp,sp,-96
8000084a:	c6aa                	sw	a0,76(sp)
8000084c:	0048                	add	a0,sp,4
8000084e:	ce86                	sw	ra,92(sp)
80000850:	cc96                	sw	t0,88(sp)
80000852:	ca9a                	sw	t1,84(sp)
80000854:	c89e                	sw	t2,80(sp)
80000856:	c4ae                	sw	a1,72(sp)
80000858:	c2b2                	sw	a2,68(sp)
8000085a:	c0b6                	sw	a3,64(sp)
8000085c:	de3a                	sw	a4,60(sp)
8000085e:	dc3e                	sw	a5,56(sp)
80000860:	da42                	sw	a6,52(sp)
80000862:	d846                	sw	a7,48(sp)
80000864:	d672                	sw	t3,44(sp)
80000866:	d476                	sw	t4,40(sp)
80000868:	d27a                	sw	t5,36(sp)
8000086a:	d07e                	sw	t6,32(sp)
8000086c:	3f19                	jal	80000782 <read_exception_context>
8000086e:	0048                	add	a0,sp,4
80000870:	37ad                	jal	800007da <print_exception_context>
80000872:	00001517          	auipc	a0,0x1
80000876:	86a50513          	add	a0,a0,-1942 # 800010dc <fromhost+0xc0>
8000087a:	3b11                	jal	8000058e <print>
8000087c:	873ff0ef          	jal	800000ee <done>

80000880 <unreachable_handler>:
80000880:	711d                	add	sp,sp,-96
80000882:	c6aa                	sw	a0,76(sp)
80000884:	0048                	add	a0,sp,4
80000886:	ce86                	sw	ra,92(sp)
80000888:	cc96                	sw	t0,88(sp)
8000088a:	ca9a                	sw	t1,84(sp)
8000088c:	c89e                	sw	t2,80(sp)
8000088e:	c4ae                	sw	a1,72(sp)
80000890:	c2b2                	sw	a2,68(sp)
80000892:	c0b6                	sw	a3,64(sp)
80000894:	de3a                	sw	a4,60(sp)
80000896:	dc3e                	sw	a5,56(sp)
80000898:	da42                	sw	a6,52(sp)
8000089a:	d846                	sw	a7,48(sp)
8000089c:	d672                	sw	t3,44(sp)
8000089e:	d476                	sw	t4,40(sp)
800008a0:	d27a                	sw	t5,36(sp)
800008a2:	d07e                	sw	t6,32(sp)
800008a4:	3df9                	jal	80000782 <read_exception_context>
800008a6:	0048                	add	a0,sp,4
800008a8:	3f0d                	jal	800007da <print_exception_context>
800008aa:	00001517          	auipc	a0,0x1
800008ae:	85e50513          	add	a0,a0,-1954 # 80001108 <fromhost+0xec>
800008b2:	39f1                	jal	8000058e <print>
800008b4:	83bff0ef          	jal	800000ee <done>

800008b8 <ll_write_timer_static>:
800008b8:	1141                	add	sp,sp,-16
800008ba:	c422                	sw	s0,8(sp)
800008bc:	c226                	sw	s1,4(sp)
800008be:	842e                	mv	s0,a1
800008c0:	84aa                	mv	s1,a0
800008c2:	862e                	mv	a2,a1
800008c4:	85aa                	mv	a1,a0
800008c6:	00001517          	auipc	a0,0x1
800008ca:	89250513          	add	a0,a0,-1902 # 80001158 <fromhost+0x13c>
800008ce:	c606                	sw	ra,12(sp)
800008d0:	397d                	jal	8000058e <print>
800008d2:	57b1                	li	a5,-20
800008d4:	577d                	li	a4,-1
800008d6:	c398                	sw	a4,0(a5)
800008d8:	fe902423          	sw	s1,-24(zero) # ffffffe8 <__stack_top+0x7fbfffe8>
800008dc:	40b2                	lw	ra,12(sp)
800008de:	c380                	sw	s0,0(a5)
800008e0:	4422                	lw	s0,8(sp)
800008e2:	4492                	lw	s1,4(sp)
800008e4:	0141                	add	sp,sp,16
800008e6:	8082                	ret

800008e8 <ll_write_timer_offset>:
800008e8:	1141                	add	sp,sp,-16
800008ea:	c422                	sw	s0,8(sp)
800008ec:	c226                	sw	s1,4(sp)
800008ee:	842a                	mv	s0,a0
800008f0:	84ae                	mv	s1,a1
800008f2:	862e                	mv	a2,a1
800008f4:	85aa                	mv	a1,a0
800008f6:	00001517          	auipc	a0,0x1
800008fa:	88a50513          	add	a0,a0,-1910 # 80001180 <fromhost+0x164>
800008fe:	c606                	sw	ra,12(sp)
80000900:	3179                	jal	8000058e <print>
80000902:	fe402703          	lw	a4,-28(zero) # ffffffe4 <__stack_top+0x7fbfffe4>
80000906:	fe002683          	lw	a3,-32(zero) # ffffffe0 <__stack_top+0x7fbfffe0>
8000090a:	fe402783          	lw	a5,-28(zero) # ffffffe4 <__stack_top+0x7fbfffe4>
8000090e:	fee79ae3          	bne	a5,a4,80000902 <ll_write_timer_offset+0x1a>
80000912:	577d                	li	a4,-1
80000914:	9436                	add	s0,s0,a3
80000916:	fee02623          	sw	a4,-20(zero) # ffffffec <__stack_top+0x7fbfffec>
8000091a:	fe802423          	sw	s0,-24(zero) # ffffffe8 <__stack_top+0x7fbfffe8>
8000091e:	40b2                	lw	ra,12(sp)
80000920:	00d436b3          	sltu	a3,s0,a3
80000924:	97a6                	add	a5,a5,s1
80000926:	4422                	lw	s0,8(sp)
80000928:	96be                	add	a3,a3,a5
8000092a:	fed02623          	sw	a3,-20(zero) # ffffffec <__stack_top+0x7fbfffec>
8000092e:	4492                	lw	s1,4(sp)
80000930:	0141                	add	sp,sp,16
80000932:	8082                	ret

80000934 <sbi_write_timer_static>:
80000934:	87aa                	mv	a5,a0
80000936:	872e                	mv	a4,a1
80000938:	853e                	mv	a0,a5
8000093a:	85ba                	mv	a1,a4
8000093c:	4805                	li	a6,1
8000093e:	00000073          	ecall
80000942:	8082                	ret

80000944 <sbi_write_timer_offset>:
80000944:	87aa                	mv	a5,a0
80000946:	872e                	mv	a4,a1
80000948:	853e                	mv	a0,a5
8000094a:	85ba                	mv	a1,a4
8000094c:	4809                	li	a6,2
8000094e:	00000073          	ecall
80000952:	8082                	ret

80000954 <reschedule_function>:
80000954:	ffc18793          	add	a5,gp,-4 # 80001288 <index>
80000958:	438c                	lw	a1,0(a5)
8000095a:	4621                	li	a2,8
8000095c:	4681                	li	a3,0
8000095e:	0585                	add	a1,a1,1
80000960:	c38c                	sw	a1,0(a5)
80000962:	ff418793          	add	a5,gp,-12 # 80001280 <time_remaining>
80000966:	c390                	sw	a2,0(a5)
80000968:	00001517          	auipc	a0,0x1
8000096c:	84050513          	add	a0,a0,-1984 # 800011a8 <fromhost+0x18c>
80000970:	c3d4                	sw	a3,4(a5)
80000972:	b931                	j	8000058e <print>

80000974 <s_mode_boot>:
80000974:	1141                	add	sp,sp,-16
80000976:	00001517          	auipc	a0,0x1
8000097a:	85250513          	add	a0,a0,-1966 # 800011c8 <fromhost+0x1ac>
8000097e:	c606                	sw	ra,12(sp)
80000980:	3139                	jal	8000058e <print>
80000982:	02000593          	li	a1,32
80000986:	00000517          	auipc	a0,0x0
8000098a:	18a50513          	add	a0,a0,394 # 80000b10 <s_mode_table>
8000098e:	3385                	jal	800006ee <setup_interrupt_s_vectored>
80000990:	3b9d                	jal	80000706 <enable_interrupts_s>
80000992:	33ad                	jal	800006fc <enable_prev_interrupts_s>
80000994:	40b2                	lw	ra,12(sp)
80000996:	4581                	li	a1,0
80000998:	7d000513          	li	a0,2000
8000099c:	0141                	add	sp,sp,16
8000099e:	b75d                	j	80000944 <sbi_write_timer_offset>

800009a0 <m_mode_boot>:
800009a0:	6585                	lui	a1,0x1
800009a2:	1141                	add	sp,sp,-16
800009a4:	88858593          	add	a1,a1,-1912 # 888 <boot-0x7ffff778>
800009a8:	00000517          	auipc	a0,0x0
800009ac:	12850513          	add	a0,a0,296 # 80000ad0 <m_mode_table>
800009b0:	c606                	sw	ra,12(sp)
800009b2:	3319                	jal	800006b8 <setup_interrupt_m_vectored>
800009b4:	00001517          	auipc	a0,0x1
800009b8:	82450513          	add	a0,a0,-2012 # 800011d8 <fromhost+0x1bc>
800009bc:	3ec9                	jal	8000058e <print>
800009be:	800007b7          	lui	a5,0x80000
800009c2:	477d                	li	a4,31
800009c4:	17fd                	add	a5,a5,-1 # 7fffffff <boot-0x1>
800009c6:	00000297          	auipc	t0,0x0
800009ca:	01628293          	add	t0,t0,22 # 800009dc <m_mode_boot+0x3c>
800009ce:	305292f3          	csrrw	t0,mtvec,t0
800009d2:	3b079073          	csrw	pmpaddr0,a5
800009d6:	3a071073          	csrw	pmpcfg0,a4
800009da:	0001                	nop
800009dc:	30529073          	csrw	mtvec,t0
800009e0:	31dd                	jal	800006c6 <enable_interrupts_m>
800009e2:	dff00513          	li	a0,-513
800009e6:	55fd                	li	a1,-1
800009e8:	3b35                	jal	80000724 <delegate_traps_to_s>
800009ea:	40b2                	lw	ra,12(sp)
800009ec:	00001517          	auipc	a0,0x1
800009f0:	80c50513          	add	a0,a0,-2036 # 800011f8 <fromhost+0x1dc>
800009f4:	0141                	add	sp,sp,16
800009f6:	be61                	j	8000058e <print>
	...

80000a00 <m_mode_exception_handler>:
80000a00:	ff010113          	add	sp,sp,-16
80000a04:	00112023          	sw	ra,0(sp)
80000a08:	00512223          	sw	t0,4(sp)
80000a0c:	00612423          	sw	t1,8(sp)
80000a10:	00712623          	sw	t2,12(sp)
80000a14:	342022f3          	csrr	t0,mcause
80000a18:	00900313          	li	t1,9
80000a1c:	08629463          	bne	t0,t1,80000aa4 <n_sbi_exception_handler>

80000a20 <sbi_ll_exception_handler>:
80000a20:	fd010113          	add	sp,sp,-48
80000a24:	00b12023          	sw	a1,0(sp)
80000a28:	00c12223          	sw	a2,4(sp)
80000a2c:	00d12423          	sw	a3,8(sp)
80000a30:	00e12623          	sw	a4,12(sp)
80000a34:	00f12823          	sw	a5,16(sp)
80000a38:	01012a23          	sw	a6,20(sp)
80000a3c:	01112c23          	sw	a7,24(sp)

80000a40 <sbi_case_1>:
80000a40:	00100313          	li	t1,1
80000a44:	00681563          	bne	a6,t1,80000a4e <sbi_case_2>
80000a48:	3d85                	.insn	2, 0x3d85
80000a4a:	0160006f          	j	80000a60 <sbi_handler_end>

80000a4e <sbi_case_2>:
80000a4e:	00200313          	li	t1,2
80000a52:	00681563          	bne	a6,t1,80000a5c <sbi_case_3>
80000a56:	3d49                	.insn	2, 0x3d49
80000a58:	0080006f          	j	80000a60 <sbi_handler_end>

80000a5c <sbi_case_3>:
80000a5c:	0040006f          	j	80000a60 <sbi_handler_end>

80000a60 <sbi_handler_end>:
80000a60:	341022f3          	csrr	t0,mepc
80000a64:	00428293          	add	t0,t0,4
80000a68:	34129073          	csrw	mepc,t0
80000a6c:	00012583          	lw	a1,0(sp)
80000a70:	00412603          	lw	a2,4(sp)
80000a74:	00812683          	lw	a3,8(sp)
80000a78:	00c12703          	lw	a4,12(sp)
80000a7c:	01012783          	lw	a5,16(sp)
80000a80:	01412803          	lw	a6,20(sp)
80000a84:	01812883          	lw	a7,24(sp)
80000a88:	03010113          	add	sp,sp,48
80000a8c:	00012083          	lw	ra,0(sp)
80000a90:	00412283          	lw	t0,4(sp)
80000a94:	00812303          	lw	t1,8(sp)
80000a98:	00c12383          	lw	t2,12(sp)
80000a9c:	01010113          	add	sp,sp,16
80000aa0:	30200073          	mret

80000aa4 <n_sbi_exception_handler>:
80000aa4:	00012083          	lw	ra,0(sp)
80000aa8:	00412283          	lw	t0,4(sp)
80000aac:	00812303          	lw	t1,8(sp)
80000ab0:	00c12383          	lw	t2,12(sp)
80000ab4:	01010113          	add	sp,sp,16
80000ab8:	d91ff06f          	j	80000848 <default_handler>
	...

80000ad0 <m_mode_table>:
80000ad0:	f31ff06f          	j	80000a00 <m_mode_exception_handler>
80000ad4:	dadff06f          	j	80000880 <unreachable_handler>
80000ad8:	da9ff06f          	j	80000880 <unreachable_handler>
80000adc:	da5ff06f          	j	80000880 <unreachable_handler>
80000ae0:	da1ff06f          	j	80000880 <unreachable_handler>
80000ae4:	d9dff06f          	j	80000880 <unreachable_handler>
80000ae8:	d99ff06f          	j	80000880 <unreachable_handler>
80000aec:	d95ff06f          	j	80000880 <unreachable_handler>
80000af0:	d91ff06f          	j	80000880 <unreachable_handler>
80000af4:	d8dff06f          	j	80000880 <unreachable_handler>
80000af8:	d89ff06f          	j	80000880 <unreachable_handler>
80000afc:	d85ff06f          	j	80000880 <unreachable_handler>
80000b00:	d81ff06f          	j	80000880 <unreachable_handler>
80000b04:	d7dff06f          	j	80000880 <unreachable_handler>
80000b08:	d79ff06f          	j	80000880 <unreachable_handler>
80000b0c:	d75ff06f          	j	80000880 <unreachable_handler>

80000b10 <s_mode_table>:
80000b10:	d71ff06f          	j	80000880 <unreachable_handler>
80000b14:	d35ff06f          	j	80000848 <default_handler>
80000b18:	d31ff06f          	j	80000848 <default_handler>
80000b1c:	d2dff06f          	j	80000848 <default_handler>
80000b20:	d29ff06f          	j	80000848 <default_handler>
80000b24:	af1ff06f          	j	80000614 <clk_handler>
80000b28:	d21ff06f          	j	80000848 <default_handler>
80000b2c:	d1dff06f          	j	80000848 <default_handler>
80000b30:	d19ff06f          	j	80000848 <default_handler>
80000b34:	d15ff06f          	j	80000848 <default_handler>
80000b38:	d11ff06f          	j	80000848 <default_handler>
80000b3c:	d0dff06f          	j	80000848 <default_handler>
80000b40:	d09ff06f          	j	80000848 <default_handler>
80000b44:	d05ff06f          	j	80000848 <default_handler>
80000b48:	d01ff06f          	j	80000848 <default_handler>
80000b4c:	cfdff06f          	j	80000848 <default_handler>
80000b50:	0000                	.insn	2, 0x
	...
