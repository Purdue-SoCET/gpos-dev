
build/u-mode/csr:     file format elf32-littleriscv


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
8000004a:	ada18193          	add	gp,gp,-1318 # 80000b20 <__bss_end>

8000004e <clr_bss>:
8000004e:	00018293          	mv	t0,gp
80000052:	00018313          	mv	t1,gp
80000056:	00628763          	beq	t0,t1,80000064 <do_preinit_arr>

8000005a <clr_bss_loop>:
8000005a:	00028023          	sb	zero,0(t0)
8000005e:	0285                	add	t0,t0,1
80000060:	fe535de3          	bge	t1,t0,8000005a <clr_bss_loop>

80000064 <do_preinit_arr>:
80000064:	d3218413          	add	s0,gp,-718 # 80000852 <__init_array_end>
80000068:	d3218493          	add	s1,gp,-718 # 80000852 <__init_array_end>
8000006c:	00940963          	beq	s0,s1,8000007e <do_init_arr>

80000070 <preinit_arr_calls>:
80000070:	00042903          	lw	s2,0(s0)
80000074:	000900e7          	jalr	s2
80000078:	0411                	add	s0,s0,4
8000007a:	fe941be3          	bne	s0,s1,80000070 <preinit_arr_calls>

8000007e <do_init_arr>:
8000007e:	d3218413          	add	s0,gp,-718 # 80000852 <__init_array_end>
80000082:	d3218493          	add	s1,gp,-718 # 80000852 <__init_array_end>
80000086:	00940963          	beq	s0,s1,80000098 <enter_main>

8000008a <init_arr_calls>:
8000008a:	00042903          	lw	s2,0(s0)
8000008e:	000900e7          	jalr	s2
80000092:	0411                	add	s0,s0,4
80000094:	fc941ee3          	bne	s0,s1,80000070 <preinit_arr_calls>

80000098 <enter_main>:
80000098:	0a2000ef          	jal	8000013a <main>

8000009c <done>:
8000009c:	d3418d93          	add	s11,gp,-716 # 80000854 <flag>
800000a0:	000dae03          	lw	t3,0(s11)
800000a4:	d3818d93          	add	s11,gp,-712 # 80000858 <tohost>
800000a8:	01cda023          	sw	t3,0(s11)

800000ac <__sim_halt>:
800000ac:	a001                	j	800000ac <__sim_halt>

800000ae <user_main>:
800000ae:	c00027f3          	rdcycle	a5
800000b2:	c01027f3          	rdtime	a5
800000b6:	00000073          	ecall
	...

800000bc <handler>:
800000bc:	711d                	add	sp,sp,-96
800000be:	c6aa                	sw	a0,76(sp)
800000c0:	0048                	add	a0,sp,4
800000c2:	de3a                	sw	a4,60(sp)
800000c4:	dc3e                	sw	a5,56(sp)
800000c6:	ce86                	sw	ra,92(sp)
800000c8:	cc96                	sw	t0,88(sp)
800000ca:	ca9a                	sw	t1,84(sp)
800000cc:	c89e                	sw	t2,80(sp)
800000ce:	c4ae                	sw	a1,72(sp)
800000d0:	c2b2                	sw	a2,68(sp)
800000d2:	c0b6                	sw	a3,64(sp)
800000d4:	da42                	sw	a6,52(sp)
800000d6:	d846                	sw	a7,48(sp)
800000d8:	d672                	sw	t3,44(sp)
800000da:	d476                	sw	t4,40(sp)
800000dc:	d27a                	sw	t5,36(sp)
800000de:	d07e                	sw	t6,32(sp)
800000e0:	2b7d                	jal	8000069e <read_exception_context>
800000e2:	0048                	add	a0,sp,4
800000e4:	2d09                	jal	800006f6 <print_exception_context>
800000e6:	4732                	lw	a4,12(sp)
800000e8:	47a1                	li	a5,8
800000ea:	02f70c63          	beq	a4,a5,80000122 <handler+0x66>
800000ee:	4511                	li	a0,4
800000f0:	2301                	jal	800005f0 <advance_mepc>
800000f2:	d3418713          	add	a4,gp,-716 # 80000854 <flag>
800000f6:	431c                	lw	a5,0(a4)
800000f8:	17fd                	add	a5,a5,-1
800000fa:	c31c                	sw	a5,0(a4)
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
80000122:	6789                	lui	a5,0x2
80000124:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
80000128:	3007a073          	csrs	mstatus,a5
8000012c:	00000517          	auipc	a0,0x0
80000130:	f7050513          	add	a0,a0,-144 # 8000009c <done>
80000134:	21e1                	jal	800005fc <set_mepc>
80000136:	b7d9                	j	800000fc <handler+0x40>
	...

8000013a <main>:
8000013a:	1141                	add	sp,sp,-16
8000013c:	c606                	sw	ra,12(sp)
8000013e:	c422                	sw	s0,8(sp)
80000140:	2329                	jal	8000064a <check_supervisor_mode_available>
80000142:	cd4d                	beqz	a0,800001fc <main+0xc2>
80000144:	00000517          	auipc	a0,0x0
80000148:	71c50513          	add	a0,a0,1820 # 80000860 <fromhost+0x4>
8000014c:	21b9                	jal	8000059a <print>
8000014e:	00000517          	auipc	a0,0x0
80000152:	72a50513          	add	a0,a0,1834 # 80000878 <fromhost+0x1c>
80000156:	2191                	jal	8000059a <print>
80000158:	00000517          	auipc	a0,0x0
8000015c:	75450513          	add	a0,a0,1876 # 800008ac <fromhost+0x50>
80000160:	292d                	jal	8000059a <print>
80000162:	d3418413          	add	s0,gp,-716 # 80000854 <flag>
80000166:	4795                	li	a5,5
80000168:	c01c                	sw	a5,0(s0)
8000016a:	400c                	lw	a1,0(s0)
8000016c:	00000517          	auipc	a0,0x0
80000170:	7d450513          	add	a0,a0,2004 # 80000940 <fromhost+0xe4>
80000174:	211d                	jal	8000059a <print>
80000176:	4581                	li	a1,0
80000178:	00000517          	auipc	a0,0x0
8000017c:	f4450513          	add	a0,a0,-188 # 800000bc <handler>
80000180:	2951                	jal	80000614 <setup_interrupts_m>
80000182:	00245793          	srl	a5,s0,0x2
80000186:	3b079073          	csrw	pmpaddr0,a5
8000018a:	3b002773          	csrr	a4,pmpaddr0
8000018e:	02e78363          	beq	a5,a4,800001b4 <main+0x7a>
80000192:	00000517          	auipc	a0,0x0
80000196:	7c250513          	add	a0,a0,1986 # 80000954 <fromhost+0xf8>
8000019a:	2101                	jal	8000059a <print>
8000019c:	6789                	lui	a5,0x2
8000019e:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
800001a2:	3007a073          	csrs	mstatus,a5
800001a6:	00000517          	auipc	a0,0x0
800001aa:	ef650513          	add	a0,a0,-266 # 8000009c <done>
800001ae:	21b9                	jal	800005fc <set_mepc>
800001b0:	30200073          	mret
800001b4:	200027b7          	lui	a5,0x20002
800001b8:	17fd                	add	a5,a5,-1 # 20001fff <boot-0x5fffe001>
800001ba:	3b179073          	csrw	pmpaddr1,a5
800001be:	6789                	lui	a5,0x2
800001c0:	f1178793          	add	a5,a5,-239 # 1f11 <boot-0x7fffe0ef>
800001c4:	3a079073          	csrw	pmpcfg0,a5
800001c8:	4781                	li	a5,0
800001ca:	b0079073          	csrw	mcycle,a5
800001ce:	b0002773          	csrr	a4,mcycle
800001d2:	0001                	nop
800001d4:	0001                	nop
800001d6:	0001                	nop
800001d8:	c00027f3          	rdcycle	a5
800001dc:	46f5                	li	a3,29
800001de:	8f99                	sub	a5,a5,a4
800001e0:	00f6e563          	bltu	a3,a5,800001ea <main+0xb0>
800001e4:	401c                	lw	a5,0(s0)
800001e6:	17fd                	add	a5,a5,-1
800001e8:	c01c                	sw	a5,0(s0)
800001ea:	c0071073          	csrw	cycle,a4
800001ee:	00000517          	auipc	a0,0x0
800001f2:	ec050513          	add	a0,a0,-320 # 800000ae <user_main>
800001f6:	2119                	jal	800005fc <set_mepc>
800001f8:	30200073          	mret
800001fc:	00000517          	auipc	a0,0x0
80000200:	6f050513          	add	a0,a0,1776 # 800008ec <fromhost+0x90>
80000204:	2e59                	jal	8000059a <print>
80000206:	00000517          	auipc	a0,0x0
8000020a:	70250513          	add	a0,a0,1794 # 80000908 <fromhost+0xac>
8000020e:	2671                	jal	8000059a <print>
80000210:	d3418413          	add	s0,gp,-716 # 80000854 <flag>
80000214:	478d                	li	a5,3
80000216:	c01c                	sw	a5,0(s0)
80000218:	bf89                	j	8000016a <main+0x30>

8000021a <print_string>:
8000021a:	00054783          	lbu	a5,0(a0)
8000021e:	cb81                	beqz	a5,8000022e <print_string+0x14>
80000220:	0505                	add	a0,a0,1
80000222:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
80000226:	00054783          	lbu	a5,0(a0)
8000022a:	0505                	add	a0,a0,1
8000022c:	fbfd                	bnez	a5,80000222 <print_string+0x8>
8000022e:	8082                	ret

80000230 <vformat>:
80000230:	00054683          	lbu	a3,0(a0)
80000234:	ce85                	beqz	a3,8000026c <vformat+0x3c>
80000236:	4781                	li	a5,0
80000238:	4801                	li	a6,0
8000023a:	4881                	li	a7,0
8000023c:	872e                	mv	a4,a1
8000023e:	02500e13          	li	t3,37
80000242:	03f00e93          	li	t4,63
80000246:	4fd9                	li	t6,22
80000248:	f9418f13          	add	t5,gp,-108 # 80000ab4 <fromhost+0x258>
8000024c:	833a                	mv	t1,a4
8000024e:	03c68263          	beq	a3,t3,80000272 <vformat+0x42>
80000252:	0805                	add	a6,a6,1
80000254:	00d70023          	sb	a3,0(a4)
80000258:	01058733          	add	a4,a1,a6
8000025c:	0785                	add	a5,a5,1
8000025e:	00f506b3          	add	a3,a0,a5
80000262:	0006c683          	lbu	a3,0(a3)
80000266:	88be                	mv	a7,a5
80000268:	f2f5                	bnez	a3,8000024c <vformat+0x1c>
8000026a:	85ba                	mv	a1,a4
8000026c:	00058023          	sb	zero,0(a1)
80000270:	8082                	ret
80000272:	98aa                	add	a7,a7,a0
80000274:	0018c683          	lbu	a3,1(a7)
80000278:	2a068263          	beqz	a3,8000051c <vformat+0x2ec>
8000027c:	2dc68463          	beq	a3,t3,80000544 <vformat+0x314>
80000280:	f9e68693          	add	a3,a3,-98
80000284:	0ff6f693          	zext.b	a3,a3
80000288:	2cdfe563          	bltu	t6,a3,80000552 <vformat+0x322>
8000028c:	7139                	add	sp,sp,-64
8000028e:	de22                	sw	s0,60(sp)
80000290:	dc26                	sw	s1,56(sp)
80000292:	da4a                	sw	s2,52(sp)
80000294:	d84e                	sw	s3,48(sp)
80000296:	d652                	sw	s4,44(sp)
80000298:	068a                	sll	a3,a3,0x2
8000029a:	96fa                	add	a3,a3,t5
8000029c:	4294                	lw	a3,0(a3)
8000029e:	96fa                	add	a3,a3,t5
800002a0:	8682                	jr	a3
800002a2:	98aa                	add	a7,a7,a0
800002a4:	0018c683          	lbu	a3,1(a7)
800002a8:	1e068563          	beqz	a3,80000492 <vformat+0x262>
800002ac:	21c68163          	beq	a3,t3,800004ae <vformat+0x27e>
800002b0:	f9e68693          	add	a3,a3,-98
800002b4:	0ff6f693          	zext.b	a3,a3
800002b8:	fedff0e3          	bgeu	t6,a3,80000298 <vformat+0x68>
800002bc:	03f00893          	li	a7,63
800002c0:	00280693          	add	a3,a6,2
800002c4:	01170023          	sb	a7,0(a4)
800002c8:	011700a3          	sb	a7,1(a4)
800002cc:	080d                	add	a6,a6,3
800002ce:	00d58733          	add	a4,a1,a3
800002d2:	01170023          	sb	a7,0(a4)
800002d6:	01058733          	add	a4,a1,a6
800002da:	0785                	add	a5,a5,1
800002dc:	0785                	add	a5,a5,1
800002de:	00f506b3          	add	a3,a0,a5
800002e2:	0006c683          	lbu	a3,0(a3)
800002e6:	88be                	mv	a7,a5
800002e8:	c285                	beqz	a3,80000308 <vformat+0xd8>
800002ea:	833a                	mv	t1,a4
800002ec:	fbc68be3          	beq	a3,t3,800002a2 <vformat+0x72>
800002f0:	0785                	add	a5,a5,1
800002f2:	00d70023          	sb	a3,0(a4)
800002f6:	00f506b3          	add	a3,a0,a5
800002fa:	0006c683          	lbu	a3,0(a3)
800002fe:	0805                	add	a6,a6,1
80000300:	01058733          	add	a4,a1,a6
80000304:	88be                	mv	a7,a5
80000306:	f2f5                	bnez	a3,800002ea <vformat+0xba>
80000308:	00070023          	sb	zero,0(a4)
8000030c:	5472                	lw	s0,60(sp)
8000030e:	54e2                	lw	s1,56(sp)
80000310:	5952                	lw	s2,52(sp)
80000312:	59c2                	lw	s3,48(sp)
80000314:	5a32                	lw	s4,44(sp)
80000316:	6121                	add	sp,sp,64
80000318:	8082                	ret
8000031a:	00062303          	lw	t1,0(a2)
8000031e:	03000693          	li	a3,48
80000322:	07800893          	li	a7,120
80000326:	0809                	add	a6,a6,2
80000328:	00d70023          	sb	a3,0(a4)
8000032c:	011700a3          	sb	a7,1(a4)
80000330:	0611                	add	a2,a2,4
80000332:	010583b3          	add	t2,a1,a6
80000336:	18030263          	beqz	t1,800004ba <vformat+0x28a>
8000033a:	4881                	li	a7,0
8000033c:	868a                	mv	a3,sp
8000033e:	ff018293          	add	t0,gp,-16 # 80000b10 <table>
80000342:	00f37713          	and	a4,t1,15
80000346:	9716                	add	a4,a4,t0
80000348:	00074483          	lbu	s1,0(a4)
8000034c:	8746                	mv	a4,a7
8000034e:	0885                	add	a7,a7,1
80000350:	01168433          	add	s0,a3,a7
80000354:	fe940fa3          	sb	s1,-1(s0)
80000358:	00435313          	srl	t1,t1,0x4
8000035c:	fe0313e3          	bnez	t1,80000342 <vformat+0x112>
80000360:	9736                	add	a4,a4,a3
80000362:	831e                	mv	t1,t2
80000364:	00074383          	lbu	t2,0(a4)
80000368:	82ba                	mv	t0,a4
8000036a:	0305                	add	t1,t1,1
8000036c:	fe730fa3          	sb	t2,-1(t1)
80000370:	177d                	add	a4,a4,-1
80000372:	fe5699e3          	bne	a3,t0,80000364 <vformat+0x134>
80000376:	9846                	add	a6,a6,a7
80000378:	01058733          	add	a4,a1,a6
8000037c:	bfb9                	j	800002da <vformat+0xaa>
8000037e:	00062383          	lw	t2,0(a2)
80000382:	0611                	add	a2,a2,4
80000384:	1a038a63          	beqz	t2,80000538 <vformat+0x308>
80000388:	4301                	li	t1,0
8000038a:	868a                	mv	a3,sp
8000038c:	ff018293          	add	t0,gp,-16 # 80000b10 <table>
80000390:	44a9                	li	s1,10
80000392:	4a25                	li	s4,9
80000394:	0293f433          	remu	s0,t2,s1
80000398:	889a                	mv	a7,t1
8000039a:	0305                	add	t1,t1,1
8000039c:	006689b3          	add	s3,a3,t1
800003a0:	891e                	mv	s2,t2
800003a2:	9416                	add	s0,s0,t0
800003a4:	00044403          	lbu	s0,0(s0)
800003a8:	0293d3b3          	divu	t2,t2,s1
800003ac:	fe898fa3          	sb	s0,-1(s3)
800003b0:	ff2a62e3          	bltu	s4,s2,80000394 <vformat+0x164>
800003b4:	98b6                	add	a7,a7,a3
800003b6:	0008c383          	lbu	t2,0(a7)
800003ba:	82c6                	mv	t0,a7
800003bc:	0705                	add	a4,a4,1
800003be:	fe770fa3          	sb	t2,-1(a4)
800003c2:	18fd                	add	a7,a7,-1
800003c4:	fe5699e3          	bne	a3,t0,800003b6 <vformat+0x186>
800003c8:	981a                	add	a6,a6,t1
800003ca:	01058733          	add	a4,a1,a6
800003ce:	b731                	j	800002da <vformat+0xaa>
800003d0:	00062283          	lw	t0,0(a2)
800003d4:	0611                	add	a2,a2,4
800003d6:	0002c883          	lbu	a7,0(t0)
800003da:	f00880e3          	beqz	a7,800002da <vformat+0xaa>
800003de:	4681                	li	a3,0
800003e0:	00d70333          	add	t1,a4,a3
800003e4:	0685                	add	a3,a3,1
800003e6:	01130023          	sb	a7,0(t1)
800003ea:	00d288b3          	add	a7,t0,a3
800003ee:	0008c883          	lbu	a7,0(a7)
800003f2:	fe0897e3          	bnez	a7,800003e0 <vformat+0x1b0>
800003f6:	9836                	add	a6,a6,a3
800003f8:	01058733          	add	a4,a1,a6
800003fc:	bdf9                	j	800002da <vformat+0xaa>
800003fe:	00062883          	lw	a7,0(a2)
80000402:	0611                	add	a2,a2,4
80000404:	0c08c263          	bltz	a7,800004c8 <vformat+0x298>
80000408:	0c089963          	bnez	a7,800004da <vformat+0x2aa>
8000040c:	03000693          	li	a3,48
80000410:	00d70023          	sb	a3,0(a4)
80000414:	4385                	li	t2,1
80000416:	981e                	add	a6,a6,t2
80000418:	01058733          	add	a4,a1,a6
8000041c:	bd7d                	j	800002da <vformat+0xaa>
8000041e:	4214                	lw	a3,0(a2)
80000420:	0805                	add	a6,a6,1
80000422:	0611                	add	a2,a2,4
80000424:	00d70023          	sb	a3,0(a4)
80000428:	01058733          	add	a4,a1,a6
8000042c:	b57d                	j	800002da <vformat+0xaa>
8000042e:	00062303          	lw	t1,0(a2)
80000432:	03000693          	li	a3,48
80000436:	06200893          	li	a7,98
8000043a:	0809                	add	a6,a6,2
8000043c:	00d70023          	sb	a3,0(a4)
80000440:	011700a3          	sb	a7,1(a4)
80000444:	0611                	add	a2,a2,4
80000446:	010583b3          	add	t2,a1,a6
8000044a:	06030863          	beqz	t1,800004ba <vformat+0x28a>
8000044e:	4881                	li	a7,0
80000450:	868a                	mv	a3,sp
80000452:	ff018293          	add	t0,gp,-16 # 80000b10 <table>
80000456:	00137713          	and	a4,t1,1
8000045a:	9716                	add	a4,a4,t0
8000045c:	00074483          	lbu	s1,0(a4)
80000460:	8746                	mv	a4,a7
80000462:	0885                	add	a7,a7,1
80000464:	01168433          	add	s0,a3,a7
80000468:	fe940fa3          	sb	s1,-1(s0)
8000046c:	00135313          	srl	t1,t1,0x1
80000470:	fe0313e3          	bnez	t1,80000456 <vformat+0x226>
80000474:	9736                	add	a4,a4,a3
80000476:	831e                	mv	t1,t2
80000478:	00074383          	lbu	t2,0(a4)
8000047c:	82ba                	mv	t0,a4
8000047e:	0305                	add	t1,t1,1
80000480:	fe730fa3          	sb	t2,-1(t1)
80000484:	177d                	add	a4,a4,-1
80000486:	fe5699e3          	bne	a3,t0,80000478 <vformat+0x248>
8000048a:	9846                	add	a6,a6,a7
8000048c:	01058733          	add	a4,a1,a6
80000490:	b5a9                	j	800002da <vformat+0xaa>
80000492:	00280693          	add	a3,a6,2
80000496:	01d70023          	sb	t4,0(a4)
8000049a:	01d700a3          	sb	t4,1(a4)
8000049e:	080d                	add	a6,a6,3
800004a0:	00d58733          	add	a4,a1,a3
800004a4:	01d70023          	sb	t4,0(a4)
800004a8:	01058733          	add	a4,a1,a6
800004ac:	bd05                	j	800002dc <vformat+0xac>
800004ae:	0805                	add	a6,a6,1
800004b0:	01c70023          	sb	t3,0(a4)
800004b4:	01058733          	add	a4,a1,a6
800004b8:	b50d                	j	800002da <vformat+0xaa>
800004ba:	4885                	li	a7,1
800004bc:	9846                	add	a6,a6,a7
800004be:	00d38023          	sb	a3,0(t2)
800004c2:	01058733          	add	a4,a1,a6
800004c6:	bd11                	j	800002da <vformat+0xaa>
800004c8:	0805                	add	a6,a6,1
800004ca:	02d00693          	li	a3,45
800004ce:	00d70023          	sb	a3,0(a4)
800004d2:	411008b3          	neg	a7,a7
800004d6:	01058333          	add	t1,a1,a6
800004da:	4381                	li	t2,0
800004dc:	868a                	mv	a3,sp
800004de:	ff018293          	add	t0,gp,-16 # 80000b10 <table>
800004e2:	44a9                	li	s1,10
800004e4:	4a25                	li	s4,9
800004e6:	0298f433          	remu	s0,a7,s1
800004ea:	871e                	mv	a4,t2
800004ec:	0385                	add	t2,t2,1
800004ee:	007689b3          	add	s3,a3,t2
800004f2:	8946                	mv	s2,a7
800004f4:	9416                	add	s0,s0,t0
800004f6:	00044403          	lbu	s0,0(s0)
800004fa:	0298d8b3          	divu	a7,a7,s1
800004fe:	fe898fa3          	sb	s0,-1(s3)
80000502:	ff2a62e3          	bltu	s4,s2,800004e6 <vformat+0x2b6>
80000506:	9736                	add	a4,a4,a3
80000508:	00074283          	lbu	t0,0(a4)
8000050c:	88ba                	mv	a7,a4
8000050e:	0305                	add	t1,t1,1
80000510:	fe530fa3          	sb	t0,-1(t1)
80000514:	177d                	add	a4,a4,-1
80000516:	ff1699e3          	bne	a3,a7,80000508 <vformat+0x2d8>
8000051a:	bdf5                	j	80000416 <vformat+0x1e6>
8000051c:	00280693          	add	a3,a6,2
80000520:	01d70023          	sb	t4,0(a4)
80000524:	01d700a3          	sb	t4,1(a4)
80000528:	080d                	add	a6,a6,3
8000052a:	00d58733          	add	a4,a1,a3
8000052e:	01d70023          	sb	t4,0(a4)
80000532:	01058733          	add	a4,a1,a6
80000536:	b31d                	j	8000025c <vformat+0x2c>
80000538:	03000693          	li	a3,48
8000053c:	00d70023          	sb	a3,0(a4)
80000540:	4305                	li	t1,1
80000542:	b559                	j	800003c8 <vformat+0x198>
80000544:	0805                	add	a6,a6,1
80000546:	01c70023          	sb	t3,0(a4)
8000054a:	0785                	add	a5,a5,1
8000054c:	01058733          	add	a4,a1,a6
80000550:	b331                	j	8000025c <vformat+0x2c>
80000552:	03f00893          	li	a7,63
80000556:	00280693          	add	a3,a6,2
8000055a:	01170023          	sb	a7,0(a4)
8000055e:	011700a3          	sb	a7,1(a4)
80000562:	080d                	add	a6,a6,3
80000564:	00d58733          	add	a4,a1,a3
80000568:	01170023          	sb	a7,0(a4)
8000056c:	0785                	add	a5,a5,1
8000056e:	01058733          	add	a4,a1,a6
80000572:	b1ed                	j	8000025c <vformat+0x2c>

80000574 <vprint>:
80000574:	7175                	add	sp,sp,-144
80000576:	862e                	mv	a2,a1
80000578:	858a                	mv	a1,sp
8000057a:	c706                	sw	ra,140(sp)
8000057c:	3955                	jal	80000230 <vformat>
8000057e:	00014783          	lbu	a5,0(sp)
80000582:	cb89                	beqz	a5,80000594 <vprint+0x20>
80000584:	00110713          	add	a4,sp,1
80000588:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
8000058c:	00074783          	lbu	a5,0(a4)
80000590:	0705                	add	a4,a4,1
80000592:	fbfd                	bnez	a5,80000588 <vprint+0x14>
80000594:	40ba                	lw	ra,140(sp)
80000596:	6149                	add	sp,sp,144
80000598:	8082                	ret

8000059a <print>:
8000059a:	7139                	add	sp,sp,-64
8000059c:	02410313          	add	t1,sp,36
800005a0:	d22e                	sw	a1,36(sp)
800005a2:	859a                	mv	a1,t1
800005a4:	ce06                	sw	ra,28(sp)
800005a6:	d432                	sw	a2,40(sp)
800005a8:	d636                	sw	a3,44(sp)
800005aa:	d83a                	sw	a4,48(sp)
800005ac:	da3e                	sw	a5,52(sp)
800005ae:	dc42                	sw	a6,56(sp)
800005b0:	de46                	sw	a7,60(sp)
800005b2:	c61a                	sw	t1,12(sp)
800005b4:	37c1                	jal	80000574 <vprint>
800005b6:	40f2                	lw	ra,28(sp)
800005b8:	6121                	add	sp,sp,64
800005ba:	8082                	ret

800005bc <format>:
800005bc:	7139                	add	sp,sp,-64
800005be:	02810313          	add	t1,sp,40
800005c2:	d432                	sw	a2,40(sp)
800005c4:	861a                	mv	a2,t1
800005c6:	ce06                	sw	ra,28(sp)
800005c8:	d636                	sw	a3,44(sp)
800005ca:	d83a                	sw	a4,48(sp)
800005cc:	da3e                	sw	a5,52(sp)
800005ce:	dc42                	sw	a6,56(sp)
800005d0:	de46                	sw	a7,60(sp)
800005d2:	c61a                	sw	t1,12(sp)
800005d4:	39b1                	jal	80000230 <vformat>
800005d6:	40f2                	lw	ra,28(sp)
800005d8:	6121                	add	sp,sp,64
800005da:	8082                	ret

800005dc <dprint>:
800005dc:	1101                	add	sp,sp,-32
800005de:	c22e                	sw	a1,4(sp)
800005e0:	c432                	sw	a2,8(sp)
800005e2:	c636                	sw	a3,12(sp)
800005e4:	c83a                	sw	a4,16(sp)
800005e6:	ca3e                	sw	a5,20(sp)
800005e8:	cc42                	sw	a6,24(sp)
800005ea:	ce46                	sw	a7,28(sp)
800005ec:	6105                	add	sp,sp,32
800005ee:	8082                	ret

800005f0 <advance_mepc>:
800005f0:	341027f3          	csrr	a5,mepc
800005f4:	953e                	add	a0,a0,a5
800005f6:	34151073          	csrw	mepc,a0
800005fa:	8082                	ret

800005fc <set_mepc>:
800005fc:	34151073          	csrw	mepc,a0
80000600:	8082                	ret

80000602 <advance_sepc>:
80000602:	141027f3          	csrr	a5,sepc
80000606:	953e                	add	a0,a0,a5
80000608:	14151073          	csrw	sepc,a0
8000060c:	8082                	ret

8000060e <set_sepc>:
8000060e:	14151073          	csrw	sepc,a0
80000612:	8082                	ret

80000614 <setup_interrupts_m>:
80000614:	30551073          	csrw	mtvec,a0
80000618:	30459073          	csrw	mie,a1
8000061c:	8082                	ret

8000061e <setup_interrupt_m_vectored>:
8000061e:	00156513          	or	a0,a0,1
80000622:	30551073          	csrw	mtvec,a0
80000626:	30459073          	csrw	mie,a1
8000062a:	8082                	ret

8000062c <enable_interrupts_m>:
8000062c:	47a1                	li	a5,8
8000062e:	3007a073          	csrs	mstatus,a5
80000632:	8082                	ret

80000634 <disable_interrupts_m>:
80000634:	47a1                	li	a5,8
80000636:	3007b073          	csrc	mstatus,a5
8000063a:	8082                	ret

8000063c <enable_interrupts_save_m>:
8000063c:	30051073          	csrw	mstatus,a0
80000640:	8082                	ret

80000642 <disable_interrupts_save_m>:
80000642:	4521                	li	a0,8
80000644:	30053573          	csrrc	a0,mstatus,a0
80000648:	8082                	ret

8000064a <check_supervisor_mode_available>:
8000064a:	6785                	lui	a5,0x1
8000064c:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
80000650:	3007a573          	csrrs	a0,mstatus,a5
80000654:	30051573          	csrrw	a0,mstatus,a0
80000658:	6789                	lui	a5,0x2
8000065a:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
8000065e:	8d7d                	and	a0,a0,a5
80000660:	80050513          	add	a0,a0,-2048
80000664:	00153513          	seqz	a0,a0
80000668:	8082                	ret

8000066a <require_supervisor_mode>:
8000066a:	6785                	lui	a5,0x1
8000066c:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
80000670:	3007a7f3          	csrrs	a5,mstatus,a5
80000674:	300797f3          	csrrw	a5,mstatus,a5
80000678:	6709                	lui	a4,0x2
8000067a:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
8000067e:	8ff9                	and	a5,a5,a4
80000680:	80078793          	add	a5,a5,-2048
80000684:	e391                	bnez	a5,80000688 <require_supervisor_mode+0x1e>
80000686:	8082                	ret
80000688:	1141                	add	sp,sp,-16
8000068a:	00000517          	auipc	a0,0x0
8000068e:	2fe50513          	add	a0,a0,766 # 80000988 <fromhost+0x12c>
80000692:	c606                	sw	ra,12(sp)
80000694:	3719                	jal	8000059a <print>
80000696:	57fd                	li	a5,-1
80000698:	d2f1aa23          	sw	a5,-716(gp) # 80000854 <flag>
8000069c:	3401                	jal	8000009c <done>

8000069e <read_exception_context>:
8000069e:	c00027f3          	rdcycle	a5
800006a2:	c55c                	sw	a5,12(a0)
800006a4:	c01027f3          	rdtime	a5
800006a8:	c91c                	sw	a5,16(a0)
800006aa:	342027f3          	csrr	a5,mcause
800006ae:	c51c                	sw	a5,8(a0)
800006b0:	341027f3          	csrr	a5,mepc
800006b4:	c11c                	sw	a5,0(a0)
800006b6:	343027f3          	csrr	a5,mtval
800006ba:	c15c                	sw	a5,4(a0)
800006bc:	c03027f3          	csrr	a5,hpmcounter3
800006c0:	c95c                	sw	a5,20(a0)
800006c2:	c04027f3          	csrr	a5,hpmcounter4
800006c6:	cd1c                	sw	a5,24(a0)
800006c8:	8082                	ret

800006ca <read_exception_context_s>:
800006ca:	c00027f3          	rdcycle	a5
800006ce:	c55c                	sw	a5,12(a0)
800006d0:	c01027f3          	rdtime	a5
800006d4:	c91c                	sw	a5,16(a0)
800006d6:	142027f3          	csrr	a5,scause
800006da:	c51c                	sw	a5,8(a0)
800006dc:	141027f3          	csrr	a5,sepc
800006e0:	c11c                	sw	a5,0(a0)
800006e2:	143027f3          	csrr	a5,stval
800006e6:	c15c                	sw	a5,4(a0)
800006e8:	c03027f3          	csrr	a5,hpmcounter3
800006ec:	c95c                	sw	a5,20(a0)
800006ee:	c04027f3          	csrr	a5,hpmcounter4
800006f2:	cd1c                	sw	a5,24(a0)
800006f4:	8082                	ret

800006f6 <print_exception_context>:
800006f6:	1141                	add	sp,sp,-16
800006f8:	c422                	sw	s0,8(sp)
800006fa:	842a                	mv	s0,a0
800006fc:	00000517          	auipc	a0,0x0
80000700:	2b050513          	add	a0,a0,688 # 800009ac <fromhost+0x150>
80000704:	c606                	sw	ra,12(sp)
80000706:	3d51                	jal	8000059a <print>
80000708:	440c                	lw	a1,8(s0)
8000070a:	00000517          	auipc	a0,0x0
8000070e:	2ba50513          	add	a0,a0,698 # 800009c4 <fromhost+0x168>
80000712:	3561                	jal	8000059a <print>
80000714:	400c                	lw	a1,0(s0)
80000716:	00000517          	auipc	a0,0x0
8000071a:	2be50513          	add	a0,a0,702 # 800009d4 <fromhost+0x178>
8000071e:	3db5                	jal	8000059a <print>
80000720:	404c                	lw	a1,4(s0)
80000722:	00000517          	auipc	a0,0x0
80000726:	2c250513          	add	a0,a0,706 # 800009e4 <fromhost+0x188>
8000072a:	3d85                	jal	8000059a <print>
8000072c:	444c                	lw	a1,12(s0)
8000072e:	00000517          	auipc	a0,0x0
80000732:	2c650513          	add	a0,a0,710 # 800009f4 <fromhost+0x198>
80000736:	3595                	jal	8000059a <print>
80000738:	480c                	lw	a1,16(s0)
8000073a:	00000517          	auipc	a0,0x0
8000073e:	2ca50513          	add	a0,a0,714 # 80000a04 <fromhost+0x1a8>
80000742:	3da1                	jal	8000059a <print>
80000744:	484c                	lw	a1,20(s0)
80000746:	00000517          	auipc	a0,0x0
8000074a:	2ce50513          	add	a0,a0,718 # 80000a14 <fromhost+0x1b8>
8000074e:	35b1                	jal	8000059a <print>
80000750:	4c0c                	lw	a1,24(s0)
80000752:	4422                	lw	s0,8(sp)
80000754:	40b2                	lw	ra,12(sp)
80000756:	00000517          	auipc	a0,0x0
8000075a:	2ce50513          	add	a0,a0,718 # 80000a24 <fromhost+0x1c8>
8000075e:	0141                	add	sp,sp,16
80000760:	bd2d                	j	8000059a <print>
	...

80000764 <default_handler>:
80000764:	711d                	add	sp,sp,-96
80000766:	c6aa                	sw	a0,76(sp)
80000768:	0048                	add	a0,sp,4
8000076a:	ce86                	sw	ra,92(sp)
8000076c:	cc96                	sw	t0,88(sp)
8000076e:	ca9a                	sw	t1,84(sp)
80000770:	c89e                	sw	t2,80(sp)
80000772:	c4ae                	sw	a1,72(sp)
80000774:	c2b2                	sw	a2,68(sp)
80000776:	c0b6                	sw	a3,64(sp)
80000778:	de3a                	sw	a4,60(sp)
8000077a:	dc3e                	sw	a5,56(sp)
8000077c:	da42                	sw	a6,52(sp)
8000077e:	d846                	sw	a7,48(sp)
80000780:	d672                	sw	t3,44(sp)
80000782:	d476                	sw	t4,40(sp)
80000784:	d27a                	sw	t5,36(sp)
80000786:	d07e                	sw	t6,32(sp)
80000788:	3f19                	jal	8000069e <read_exception_context>
8000078a:	0048                	add	a0,sp,4
8000078c:	37ad                	jal	800006f6 <print_exception_context>
8000078e:	00000517          	auipc	a0,0x0
80000792:	2a650513          	add	a0,a0,678 # 80000a34 <fromhost+0x1d8>
80000796:	3511                	jal	8000059a <print>
80000798:	905ff0ef          	jal	8000009c <done>

8000079c <unreachable_handler>:
8000079c:	711d                	add	sp,sp,-96
8000079e:	c6aa                	sw	a0,76(sp)
800007a0:	0048                	add	a0,sp,4
800007a2:	ce86                	sw	ra,92(sp)
800007a4:	cc96                	sw	t0,88(sp)
800007a6:	ca9a                	sw	t1,84(sp)
800007a8:	c89e                	sw	t2,80(sp)
800007aa:	c4ae                	sw	a1,72(sp)
800007ac:	c2b2                	sw	a2,68(sp)
800007ae:	c0b6                	sw	a3,64(sp)
800007b0:	de3a                	sw	a4,60(sp)
800007b2:	dc3e                	sw	a5,56(sp)
800007b4:	da42                	sw	a6,52(sp)
800007b6:	d846                	sw	a7,48(sp)
800007b8:	d672                	sw	t3,44(sp)
800007ba:	d476                	sw	t4,40(sp)
800007bc:	d27a                	sw	t5,36(sp)
800007be:	d07e                	sw	t6,32(sp)
800007c0:	3df9                	jal	8000069e <read_exception_context>
800007c2:	0048                	add	a0,sp,4
800007c4:	3f0d                	jal	800006f6 <print_exception_context>
800007c6:	00000517          	auipc	a0,0x0
800007ca:	29a50513          	add	a0,a0,666 # 80000a60 <fromhost+0x204>
800007ce:	33f1                	jal	8000059a <print>
800007d0:	8cdff0ef          	jal	8000009c <done>

800007d4 <test_pass>:
800007d4:	1141                	add	sp,sp,-16
800007d6:	85aa                	mv	a1,a0
800007d8:	00000517          	auipc	a0,0x0
800007dc:	2d850513          	add	a0,a0,728 # 80000ab0 <fromhost+0x254>
800007e0:	c606                	sw	ra,12(sp)
800007e2:	3b65                	jal	8000059a <print>
800007e4:	40b2                	lw	ra,12(sp)
800007e6:	4785                	li	a5,1
800007e8:	d2f1aa23          	sw	a5,-716(gp) # 80000854 <flag>
800007ec:	0141                	add	sp,sp,16
800007ee:	8082                	ret

800007f0 <test_fail>:
800007f0:	1141                	add	sp,sp,-16
800007f2:	85aa                	mv	a1,a0
800007f4:	00000517          	auipc	a0,0x0
800007f8:	2bc50513          	add	a0,a0,700 # 80000ab0 <fromhost+0x254>
800007fc:	c606                	sw	ra,12(sp)
800007fe:	3b71                	jal	8000059a <print>
80000800:	40b2                	lw	ra,12(sp)
80000802:	d201aa23          	sw	zero,-716(gp) # 80000854 <flag>
80000806:	0141                	add	sp,sp,16
80000808:	8082                	ret
8000080a:	0000                	unimp
8000080c:	0000                	unimp
	...

80000810 <vector_table>:
80000810:	f55ff06f          	j	80000764 <default_handler>
80000814:	f51ff06f          	j	80000764 <default_handler>
80000818:	f85ff06f          	j	8000079c <unreachable_handler>
8000081c:	f49ff06f          	j	80000764 <default_handler>
80000820:	f7dff06f          	j	8000079c <unreachable_handler>
80000824:	f41ff06f          	j	80000764 <default_handler>
80000828:	f75ff06f          	j	8000079c <unreachable_handler>
8000082c:	f39ff06f          	j	80000764 <default_handler>
80000830:	f6dff06f          	j	8000079c <unreachable_handler>
80000834:	f31ff06f          	j	80000764 <default_handler>
80000838:	f65ff06f          	j	8000079c <unreachable_handler>
8000083c:	f29ff06f          	j	80000764 <default_handler>
80000840:	f5dff06f          	j	8000079c <unreachable_handler>
80000844:	f21ff06f          	j	80000764 <default_handler>
80000848:	f55ff06f          	j	8000079c <unreachable_handler>
8000084c:	f51ff06f          	j	8000079c <unreachable_handler>
	...
