
build/interrupts-exceptions/process_table:     file format elf32-littleriscv


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
8000004a:	abe18193          	add	gp,gp,-1346 # 80000b04 <__bss_end>

8000004e <clr_bss>:
8000004e:	ffc18293          	add	t0,gp,-4 # 80000b00 <index>
80000052:	00018313          	mv	t1,gp
80000056:	00628763          	beq	t0,t1,80000064 <do_preinit_arr>

8000005a <clr_bss_loop>:
8000005a:	00028023          	sb	zero,0(t0)
8000005e:	0285                	add	t0,t0,1
80000060:	fe535de3          	bge	t1,t0,8000005a <clr_bss_loop>

80000064 <do_preinit_arr>:
80000064:	dce18413          	add	s0,gp,-562 # 800008d2 <__init_array_end>
80000068:	dce18493          	add	s1,gp,-562 # 800008d2 <__init_array_end>
8000006c:	00940963          	beq	s0,s1,8000007e <do_init_arr>

80000070 <preinit_arr_calls>:
80000070:	00042903          	lw	s2,0(s0)
80000074:	000900e7          	jalr	s2
80000078:	0411                	add	s0,s0,4
8000007a:	fe941be3          	bne	s0,s1,80000070 <preinit_arr_calls>

8000007e <do_init_arr>:
8000007e:	dce18413          	add	s0,gp,-562 # 800008d2 <__init_array_end>
80000082:	dce18493          	add	s1,gp,-562 # 800008d2 <__init_array_end>
80000086:	00940963          	beq	s0,s1,80000098 <enter_main>

8000008a <init_arr_calls>:
8000008a:	00042903          	lw	s2,0(s0)
8000008e:	000900e7          	jalr	s2
80000092:	0411                	add	s0,s0,4
80000094:	fc941ee3          	bne	s0,s1,80000070 <preinit_arr_calls>

80000098 <enter_main>:
80000098:	1be000ef          	jal	80000256 <main>

8000009c <done>:
8000009c:	de818d93          	add	s11,gp,-536 # 800008ec <flag>
800000a0:	000dae03          	lw	t3,0(s11)
800000a4:	dec18d93          	add	s11,gp,-532 # 800008f0 <tohost>
800000a8:	01cda023          	sw	t3,0(s11)

800000ac <__sim_halt>:
800000ac:	a001                	j	800000ac <__sim_halt>

800000ae <reschedule_function>:
800000ae:	ffc18793          	add	a5,gp,-4 # 80000b00 <index>
800000b2:	438c                	lw	a1,0(a5)
800000b4:	4609                	li	a2,2
800000b6:	4681                	li	a3,0
800000b8:	0585                	add	a1,a1,1
800000ba:	c38c                	sw	a1,0(a5)
800000bc:	ff418793          	add	a5,gp,-12 # 80000af8 <time_remaining>
800000c0:	c390                	sw	a2,0(a5)
800000c2:	00001517          	auipc	a0,0x1
800000c6:	83650513          	add	a0,a0,-1994 # 800008f8 <fromhost+0x4>
800000ca:	c3d4                	sw	a3,4(a5)
800000cc:	a3a9                	j	80000616 <print>

800000ce <set_timer>:
800000ce:	fe002783          	lw	a5,-32(zero) # ffffffe0 <__stack_top+0x3fffffe0>
800000d2:	97aa                	add	a5,a5,a0
800000d4:	fef02423          	sw	a5,-24(zero) # ffffffe8 <__stack_top+0x3fffffe8>
800000d8:	8082                	ret
	...

800000dc <meip_handler>:
800000dc:	7139                	add	sp,sp,-64
800000de:	d62a                	sw	a0,44(sp)
800000e0:	00001517          	auipc	a0,0x1
800000e4:	83850513          	add	a0,a0,-1992 # 80000918 <fromhost+0x24>
800000e8:	cc3e                	sw	a5,24(sp)
800000ea:	de06                	sw	ra,60(sp)
800000ec:	dc16                	sw	t0,56(sp)
800000ee:	da1a                	sw	t1,52(sp)
800000f0:	d81e                	sw	t2,48(sp)
800000f2:	d42e                	sw	a1,40(sp)
800000f4:	d232                	sw	a2,36(sp)
800000f6:	d036                	sw	a3,32(sp)
800000f8:	ce3a                	sw	a4,28(sp)
800000fa:	ca42                	sw	a6,20(sp)
800000fc:	c846                	sw	a7,16(sp)
800000fe:	c672                	sw	t3,12(sp)
80000100:	c476                	sw	t4,8(sp)
80000102:	c27a                	sw	t5,4(sp)
80000104:	c07e                	sw	t6,0(sp)
80000106:	2b01                	jal	80000616 <print>
80000108:	4785                	li	a5,1
8000010a:	fef02c23          	sw	a5,-8(zero) # fffffff8 <__stack_top+0x3ffffff8>
8000010e:	08800793          	li	a5,136
80000112:	30479073          	csrw	mie,a5
80000116:	00001517          	auipc	a0,0x1
8000011a:	81650513          	add	a0,a0,-2026 # 8000092c <fromhost+0x38>
8000011e:	29e5                	jal	80000616 <print>
80000120:	50f2                	lw	ra,60(sp)
80000122:	52e2                	lw	t0,56(sp)
80000124:	5352                	lw	t1,52(sp)
80000126:	53c2                	lw	t2,48(sp)
80000128:	5532                	lw	a0,44(sp)
8000012a:	55a2                	lw	a1,40(sp)
8000012c:	5612                	lw	a2,36(sp)
8000012e:	5682                	lw	a3,32(sp)
80000130:	4772                	lw	a4,28(sp)
80000132:	47e2                	lw	a5,24(sp)
80000134:	4852                	lw	a6,20(sp)
80000136:	48c2                	lw	a7,16(sp)
80000138:	4e32                	lw	t3,12(sp)
8000013a:	4ea2                	lw	t4,8(sp)
8000013c:	4f12                	lw	t5,4(sp)
8000013e:	4f82                	lw	t6,0(sp)
80000140:	6121                	add	sp,sp,64
80000142:	30200073          	mret
	...

80000148 <mtip_handler>:
80000148:	7139                	add	sp,sp,-64
8000014a:	d62a                	sw	a0,44(sp)
8000014c:	00000517          	auipc	a0,0x0
80000150:	7ec50513          	add	a0,a0,2028 # 80000938 <fromhost+0x44>
80000154:	d42e                	sw	a1,40(sp)
80000156:	d232                	sw	a2,36(sp)
80000158:	d036                	sw	a3,32(sp)
8000015a:	ce3a                	sw	a4,28(sp)
8000015c:	cc3e                	sw	a5,24(sp)
8000015e:	de06                	sw	ra,60(sp)
80000160:	dc16                	sw	t0,56(sp)
80000162:	da1a                	sw	t1,52(sp)
80000164:	d81e                	sw	t2,48(sp)
80000166:	ca42                	sw	a6,20(sp)
80000168:	c846                	sw	a7,16(sp)
8000016a:	c672                	sw	t3,12(sp)
8000016c:	c476                	sw	t4,8(sp)
8000016e:	c27a                	sw	t5,4(sp)
80000170:	c07e                	sw	t6,0(sp)
80000172:	2155                	jal	80000616 <print>
80000174:	ff418693          	add	a3,gp,-12 # 80000af8 <time_remaining>
80000178:	4288                	lw	a0,0(a3)
8000017a:	42cc                	lw	a1,4(a3)
8000017c:	fff50713          	add	a4,a0,-1
80000180:	00153613          	seqz	a2,a0
80000184:	c298                	sw	a4,0(a3)
80000186:	40c587b3          	sub	a5,a1,a2
8000018a:	c2dc                	sw	a5,4(a3)
8000018c:	4298                	lw	a4,0(a3)
8000018e:	42dc                	lw	a5,4(a3)
80000190:	8f5d                	or	a4,a4,a5
80000192:	cf1d                	beqz	a4,800001d0 <mtip_handler+0x88>
80000194:	fe002783          	lw	a5,-32(zero) # ffffffe0 <__stack_top+0x3fffffe0>
80000198:	00000517          	auipc	a0,0x0
8000019c:	79450513          	add	a0,a0,1940 # 8000092c <fromhost+0x38>
800001a0:	3e878793          	add	a5,a5,1000
800001a4:	fef02423          	sw	a5,-24(zero) # ffffffe8 <__stack_top+0x3fffffe8>
800001a8:	21bd                	jal	80000616 <print>
800001aa:	50f2                	lw	ra,60(sp)
800001ac:	52e2                	lw	t0,56(sp)
800001ae:	5352                	lw	t1,52(sp)
800001b0:	53c2                	lw	t2,48(sp)
800001b2:	5532                	lw	a0,44(sp)
800001b4:	55a2                	lw	a1,40(sp)
800001b6:	5612                	lw	a2,36(sp)
800001b8:	5682                	lw	a3,32(sp)
800001ba:	4772                	lw	a4,28(sp)
800001bc:	47e2                	lw	a5,24(sp)
800001be:	4852                	lw	a6,20(sp)
800001c0:	48c2                	lw	a7,16(sp)
800001c2:	4e32                	lw	t3,12(sp)
800001c4:	4ea2                	lw	t4,8(sp)
800001c6:	4f12                	lw	t5,4(sp)
800001c8:	4f82                	lw	t6,0(sp)
800001ca:	6121                	add	sp,sp,64
800001cc:	30200073          	mret
800001d0:	ffc18793          	add	a5,gp,-4 # 80000b00 <index>
800001d4:	438c                	lw	a1,0(a5)
800001d6:	4709                	li	a4,2
800001d8:	c298                	sw	a4,0(a3)
800001da:	0585                	add	a1,a1,1
800001dc:	c38c                	sw	a1,0(a5)
800001de:	00000517          	auipc	a0,0x0
800001e2:	71a50513          	add	a0,a0,1818 # 800008f8 <fromhost+0x4>
800001e6:	4781                	li	a5,0
800001e8:	c2dc                	sw	a5,4(a3)
800001ea:	2135                	jal	80000616 <print>
800001ec:	b765                	j	80000194 <mtip_handler+0x4c>
	...

800001f0 <msip_handler>:
800001f0:	7139                	add	sp,sp,-64
800001f2:	d62a                	sw	a0,44(sp)
800001f4:	00000517          	auipc	a0,0x0
800001f8:	75850513          	add	a0,a0,1880 # 8000094c <fromhost+0x58>
800001fc:	de06                	sw	ra,60(sp)
800001fe:	dc16                	sw	t0,56(sp)
80000200:	da1a                	sw	t1,52(sp)
80000202:	d81e                	sw	t2,48(sp)
80000204:	d42e                	sw	a1,40(sp)
80000206:	d232                	sw	a2,36(sp)
80000208:	d036                	sw	a3,32(sp)
8000020a:	ce3a                	sw	a4,28(sp)
8000020c:	cc3e                	sw	a5,24(sp)
8000020e:	ca42                	sw	a6,20(sp)
80000210:	c846                	sw	a7,16(sp)
80000212:	c672                	sw	t3,12(sp)
80000214:	c476                	sw	t4,8(sp)
80000216:	c27a                	sw	t5,4(sp)
80000218:	c07e                	sw	t6,0(sp)
8000021a:	2ef5                	jal	80000616 <print>
8000021c:	fe002823          	sw	zero,-16(zero) # fffffff0 <__stack_top+0x3ffffff0>
80000220:	ffc1a583          	lw	a1,-4(gp) # 80000b00 <index>
80000224:	00000517          	auipc	a0,0x0
80000228:	70850513          	add	a0,a0,1800 # 8000092c <fromhost+0x38>
8000022c:	26ed                	jal	80000616 <print>
8000022e:	50f2                	lw	ra,60(sp)
80000230:	52e2                	lw	t0,56(sp)
80000232:	5352                	lw	t1,52(sp)
80000234:	53c2                	lw	t2,48(sp)
80000236:	5532                	lw	a0,44(sp)
80000238:	55a2                	lw	a1,40(sp)
8000023a:	5612                	lw	a2,36(sp)
8000023c:	5682                	lw	a3,32(sp)
8000023e:	4772                	lw	a4,28(sp)
80000240:	47e2                	lw	a5,24(sp)
80000242:	4852                	lw	a6,20(sp)
80000244:	48c2                	lw	a7,16(sp)
80000246:	4e32                	lw	t3,12(sp)
80000248:	4ea2                	lw	t4,8(sp)
8000024a:	4f12                	lw	t5,4(sp)
8000024c:	4f82                	lw	t6,0(sp)
8000024e:	6121                	add	sp,sp,64
80000250:	30200073          	mret
	...

80000256 <main>:
80000256:	1141                	add	sp,sp,-16
80000258:	c606                	sw	ra,12(sp)
8000025a:	0ff00793          	li	a5,255
8000025e:	fe002623          	sw	zero,-20(zero) # ffffffec <__stack_top+0x3fffffec>
80000262:	6585                	lui	a1,0x1
80000264:	fef02423          	sw	a5,-24(zero) # ffffffe8 <__stack_top+0x3fffffe8>
80000268:	88858593          	add	a1,a1,-1912 # 888 <boot-0x7ffff778>
8000026c:	00000517          	auipc	a0,0x0
80000270:	62450513          	add	a0,a0,1572 # 80000890 <vector_table>
80000274:	211d                	jal	8000069a <setup_interrupt_m_vectored>
80000276:	290d                	jal	800006a8 <enable_interrupts_m>
80000278:	4785                	li	a5,1
8000027a:	fef02823          	sw	a5,-16(zero) # fffffff0 <__stack_top+0x3ffffff0>
8000027e:	6741                	lui	a4,0x10
80000280:	fef02a23          	sw	a5,-12(zero) # fffffff4 <__stack_top+0x3ffffff4>
80000284:	1779                	add	a4,a4,-2 # fffe <boot-0x7fff0002>
80000286:	fe002783          	lw	a5,-32(zero) # ffffffe0 <__stack_top+0x3fffffe0>
8000028a:	fef77ee3          	bgeu	a4,a5,80000286 <main+0x30>
8000028e:	40b2                	lw	ra,12(sp)
80000290:	4501                	li	a0,0
80000292:	0141                	add	sp,sp,16
80000294:	8082                	ret

80000296 <print_string>:
80000296:	00054783          	lbu	a5,0(a0)
8000029a:	cb81                	beqz	a5,800002aa <print_string+0x14>
8000029c:	0505                	add	a0,a0,1
8000029e:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
800002a2:	00054783          	lbu	a5,0(a0)
800002a6:	0505                	add	a0,a0,1
800002a8:	fbfd                	bnez	a5,8000029e <print_string+0x8>
800002aa:	8082                	ret

800002ac <vformat>:
800002ac:	00054683          	lbu	a3,0(a0)
800002b0:	ce85                	beqz	a3,800002e8 <vformat+0x3c>
800002b2:	4781                	li	a5,0
800002b4:	4801                	li	a6,0
800002b6:	4881                	li	a7,0
800002b8:	872e                	mv	a4,a1
800002ba:	02500e13          	li	t3,37
800002be:	03f00e93          	li	t4,63
800002c2:	4fd9                	li	t6,22
800002c4:	f8818f13          	add	t5,gp,-120 # 80000a8c <fromhost+0x198>
800002c8:	833a                	mv	t1,a4
800002ca:	03c68263          	beq	a3,t3,800002ee <vformat+0x42>
800002ce:	0805                	add	a6,a6,1
800002d0:	00d70023          	sb	a3,0(a4)
800002d4:	01058733          	add	a4,a1,a6
800002d8:	0785                	add	a5,a5,1
800002da:	00f506b3          	add	a3,a0,a5
800002de:	0006c683          	lbu	a3,0(a3)
800002e2:	88be                	mv	a7,a5
800002e4:	f2f5                	bnez	a3,800002c8 <vformat+0x1c>
800002e6:	85ba                	mv	a1,a4
800002e8:	00058023          	sb	zero,0(a1)
800002ec:	8082                	ret
800002ee:	98aa                	add	a7,a7,a0
800002f0:	0018c683          	lbu	a3,1(a7)
800002f4:	2a068263          	beqz	a3,80000598 <vformat+0x2ec>
800002f8:	2dc68463          	beq	a3,t3,800005c0 <vformat+0x314>
800002fc:	f9e68693          	add	a3,a3,-98
80000300:	0ff6f693          	zext.b	a3,a3
80000304:	2cdfe563          	bltu	t6,a3,800005ce <vformat+0x322>
80000308:	7139                	add	sp,sp,-64
8000030a:	de22                	sw	s0,60(sp)
8000030c:	dc26                	sw	s1,56(sp)
8000030e:	da4a                	sw	s2,52(sp)
80000310:	d84e                	sw	s3,48(sp)
80000312:	d652                	sw	s4,44(sp)
80000314:	068a                	sll	a3,a3,0x2
80000316:	96fa                	add	a3,a3,t5
80000318:	4294                	lw	a3,0(a3)
8000031a:	96fa                	add	a3,a3,t5
8000031c:	8682                	jr	a3
8000031e:	98aa                	add	a7,a7,a0
80000320:	0018c683          	lbu	a3,1(a7)
80000324:	1e068563          	beqz	a3,8000050e <vformat+0x262>
80000328:	21c68163          	beq	a3,t3,8000052a <vformat+0x27e>
8000032c:	f9e68693          	add	a3,a3,-98
80000330:	0ff6f693          	zext.b	a3,a3
80000334:	fedff0e3          	bgeu	t6,a3,80000314 <vformat+0x68>
80000338:	03f00893          	li	a7,63
8000033c:	00280693          	add	a3,a6,2
80000340:	01170023          	sb	a7,0(a4)
80000344:	011700a3          	sb	a7,1(a4)
80000348:	080d                	add	a6,a6,3
8000034a:	00d58733          	add	a4,a1,a3
8000034e:	01170023          	sb	a7,0(a4)
80000352:	01058733          	add	a4,a1,a6
80000356:	0785                	add	a5,a5,1
80000358:	0785                	add	a5,a5,1
8000035a:	00f506b3          	add	a3,a0,a5
8000035e:	0006c683          	lbu	a3,0(a3)
80000362:	88be                	mv	a7,a5
80000364:	c285                	beqz	a3,80000384 <vformat+0xd8>
80000366:	833a                	mv	t1,a4
80000368:	fbc68be3          	beq	a3,t3,8000031e <vformat+0x72>
8000036c:	0785                	add	a5,a5,1
8000036e:	00d70023          	sb	a3,0(a4)
80000372:	00f506b3          	add	a3,a0,a5
80000376:	0006c683          	lbu	a3,0(a3)
8000037a:	0805                	add	a6,a6,1
8000037c:	01058733          	add	a4,a1,a6
80000380:	88be                	mv	a7,a5
80000382:	f2f5                	bnez	a3,80000366 <vformat+0xba>
80000384:	00070023          	sb	zero,0(a4)
80000388:	5472                	lw	s0,60(sp)
8000038a:	54e2                	lw	s1,56(sp)
8000038c:	5952                	lw	s2,52(sp)
8000038e:	59c2                	lw	s3,48(sp)
80000390:	5a32                	lw	s4,44(sp)
80000392:	6121                	add	sp,sp,64
80000394:	8082                	ret
80000396:	00062303          	lw	t1,0(a2)
8000039a:	03000693          	li	a3,48
8000039e:	07800893          	li	a7,120
800003a2:	0809                	add	a6,a6,2
800003a4:	00d70023          	sb	a3,0(a4)
800003a8:	011700a3          	sb	a7,1(a4)
800003ac:	0611                	add	a2,a2,4
800003ae:	010583b3          	add	t2,a1,a6
800003b2:	18030263          	beqz	t1,80000536 <vformat+0x28a>
800003b6:	4881                	li	a7,0
800003b8:	868a                	mv	a3,sp
800003ba:	fe418293          	add	t0,gp,-28 # 80000ae8 <table>
800003be:	00f37713          	and	a4,t1,15
800003c2:	9716                	add	a4,a4,t0
800003c4:	00074483          	lbu	s1,0(a4)
800003c8:	8746                	mv	a4,a7
800003ca:	0885                	add	a7,a7,1
800003cc:	01168433          	add	s0,a3,a7
800003d0:	fe940fa3          	sb	s1,-1(s0)
800003d4:	00435313          	srl	t1,t1,0x4
800003d8:	fe0313e3          	bnez	t1,800003be <vformat+0x112>
800003dc:	9736                	add	a4,a4,a3
800003de:	831e                	mv	t1,t2
800003e0:	00074383          	lbu	t2,0(a4)
800003e4:	82ba                	mv	t0,a4
800003e6:	0305                	add	t1,t1,1
800003e8:	fe730fa3          	sb	t2,-1(t1)
800003ec:	177d                	add	a4,a4,-1
800003ee:	fe5699e3          	bne	a3,t0,800003e0 <vformat+0x134>
800003f2:	9846                	add	a6,a6,a7
800003f4:	01058733          	add	a4,a1,a6
800003f8:	bfb9                	j	80000356 <vformat+0xaa>
800003fa:	00062383          	lw	t2,0(a2)
800003fe:	0611                	add	a2,a2,4
80000400:	1a038a63          	beqz	t2,800005b4 <vformat+0x308>
80000404:	4301                	li	t1,0
80000406:	868a                	mv	a3,sp
80000408:	fe418293          	add	t0,gp,-28 # 80000ae8 <table>
8000040c:	44a9                	li	s1,10
8000040e:	4a25                	li	s4,9
80000410:	0293f433          	remu	s0,t2,s1
80000414:	889a                	mv	a7,t1
80000416:	0305                	add	t1,t1,1
80000418:	006689b3          	add	s3,a3,t1
8000041c:	891e                	mv	s2,t2
8000041e:	9416                	add	s0,s0,t0
80000420:	00044403          	lbu	s0,0(s0)
80000424:	0293d3b3          	divu	t2,t2,s1
80000428:	fe898fa3          	sb	s0,-1(s3)
8000042c:	ff2a62e3          	bltu	s4,s2,80000410 <vformat+0x164>
80000430:	98b6                	add	a7,a7,a3
80000432:	0008c383          	lbu	t2,0(a7)
80000436:	82c6                	mv	t0,a7
80000438:	0705                	add	a4,a4,1
8000043a:	fe770fa3          	sb	t2,-1(a4)
8000043e:	18fd                	add	a7,a7,-1
80000440:	fe5699e3          	bne	a3,t0,80000432 <vformat+0x186>
80000444:	981a                	add	a6,a6,t1
80000446:	01058733          	add	a4,a1,a6
8000044a:	b731                	j	80000356 <vformat+0xaa>
8000044c:	00062283          	lw	t0,0(a2)
80000450:	0611                	add	a2,a2,4
80000452:	0002c883          	lbu	a7,0(t0)
80000456:	f00880e3          	beqz	a7,80000356 <vformat+0xaa>
8000045a:	4681                	li	a3,0
8000045c:	00d70333          	add	t1,a4,a3
80000460:	0685                	add	a3,a3,1
80000462:	01130023          	sb	a7,0(t1)
80000466:	00d288b3          	add	a7,t0,a3
8000046a:	0008c883          	lbu	a7,0(a7)
8000046e:	fe0897e3          	bnez	a7,8000045c <vformat+0x1b0>
80000472:	9836                	add	a6,a6,a3
80000474:	01058733          	add	a4,a1,a6
80000478:	bdf9                	j	80000356 <vformat+0xaa>
8000047a:	00062883          	lw	a7,0(a2)
8000047e:	0611                	add	a2,a2,4
80000480:	0c08c263          	bltz	a7,80000544 <vformat+0x298>
80000484:	0c089963          	bnez	a7,80000556 <vformat+0x2aa>
80000488:	03000693          	li	a3,48
8000048c:	00d70023          	sb	a3,0(a4)
80000490:	4385                	li	t2,1
80000492:	981e                	add	a6,a6,t2
80000494:	01058733          	add	a4,a1,a6
80000498:	bd7d                	j	80000356 <vformat+0xaa>
8000049a:	4214                	lw	a3,0(a2)
8000049c:	0805                	add	a6,a6,1
8000049e:	0611                	add	a2,a2,4
800004a0:	00d70023          	sb	a3,0(a4)
800004a4:	01058733          	add	a4,a1,a6
800004a8:	b57d                	j	80000356 <vformat+0xaa>
800004aa:	00062303          	lw	t1,0(a2)
800004ae:	03000693          	li	a3,48
800004b2:	06200893          	li	a7,98
800004b6:	0809                	add	a6,a6,2
800004b8:	00d70023          	sb	a3,0(a4)
800004bc:	011700a3          	sb	a7,1(a4)
800004c0:	0611                	add	a2,a2,4
800004c2:	010583b3          	add	t2,a1,a6
800004c6:	06030863          	beqz	t1,80000536 <vformat+0x28a>
800004ca:	4881                	li	a7,0
800004cc:	868a                	mv	a3,sp
800004ce:	fe418293          	add	t0,gp,-28 # 80000ae8 <table>
800004d2:	00137713          	and	a4,t1,1
800004d6:	9716                	add	a4,a4,t0
800004d8:	00074483          	lbu	s1,0(a4)
800004dc:	8746                	mv	a4,a7
800004de:	0885                	add	a7,a7,1
800004e0:	01168433          	add	s0,a3,a7
800004e4:	fe940fa3          	sb	s1,-1(s0)
800004e8:	00135313          	srl	t1,t1,0x1
800004ec:	fe0313e3          	bnez	t1,800004d2 <vformat+0x226>
800004f0:	9736                	add	a4,a4,a3
800004f2:	831e                	mv	t1,t2
800004f4:	00074383          	lbu	t2,0(a4)
800004f8:	82ba                	mv	t0,a4
800004fa:	0305                	add	t1,t1,1
800004fc:	fe730fa3          	sb	t2,-1(t1)
80000500:	177d                	add	a4,a4,-1
80000502:	fe5699e3          	bne	a3,t0,800004f4 <vformat+0x248>
80000506:	9846                	add	a6,a6,a7
80000508:	01058733          	add	a4,a1,a6
8000050c:	b5a9                	j	80000356 <vformat+0xaa>
8000050e:	00280693          	add	a3,a6,2
80000512:	01d70023          	sb	t4,0(a4)
80000516:	01d700a3          	sb	t4,1(a4)
8000051a:	080d                	add	a6,a6,3
8000051c:	00d58733          	add	a4,a1,a3
80000520:	01d70023          	sb	t4,0(a4)
80000524:	01058733          	add	a4,a1,a6
80000528:	bd05                	j	80000358 <vformat+0xac>
8000052a:	0805                	add	a6,a6,1
8000052c:	01c70023          	sb	t3,0(a4)
80000530:	01058733          	add	a4,a1,a6
80000534:	b50d                	j	80000356 <vformat+0xaa>
80000536:	4885                	li	a7,1
80000538:	9846                	add	a6,a6,a7
8000053a:	00d38023          	sb	a3,0(t2)
8000053e:	01058733          	add	a4,a1,a6
80000542:	bd11                	j	80000356 <vformat+0xaa>
80000544:	0805                	add	a6,a6,1
80000546:	02d00693          	li	a3,45
8000054a:	00d70023          	sb	a3,0(a4)
8000054e:	411008b3          	neg	a7,a7
80000552:	01058333          	add	t1,a1,a6
80000556:	4381                	li	t2,0
80000558:	868a                	mv	a3,sp
8000055a:	fe418293          	add	t0,gp,-28 # 80000ae8 <table>
8000055e:	44a9                	li	s1,10
80000560:	4a25                	li	s4,9
80000562:	0298f433          	remu	s0,a7,s1
80000566:	871e                	mv	a4,t2
80000568:	0385                	add	t2,t2,1
8000056a:	007689b3          	add	s3,a3,t2
8000056e:	8946                	mv	s2,a7
80000570:	9416                	add	s0,s0,t0
80000572:	00044403          	lbu	s0,0(s0)
80000576:	0298d8b3          	divu	a7,a7,s1
8000057a:	fe898fa3          	sb	s0,-1(s3)
8000057e:	ff2a62e3          	bltu	s4,s2,80000562 <vformat+0x2b6>
80000582:	9736                	add	a4,a4,a3
80000584:	00074283          	lbu	t0,0(a4)
80000588:	88ba                	mv	a7,a4
8000058a:	0305                	add	t1,t1,1
8000058c:	fe530fa3          	sb	t0,-1(t1)
80000590:	177d                	add	a4,a4,-1
80000592:	ff1699e3          	bne	a3,a7,80000584 <vformat+0x2d8>
80000596:	bdf5                	j	80000492 <vformat+0x1e6>
80000598:	00280693          	add	a3,a6,2
8000059c:	01d70023          	sb	t4,0(a4)
800005a0:	01d700a3          	sb	t4,1(a4)
800005a4:	080d                	add	a6,a6,3
800005a6:	00d58733          	add	a4,a1,a3
800005aa:	01d70023          	sb	t4,0(a4)
800005ae:	01058733          	add	a4,a1,a6
800005b2:	b31d                	j	800002d8 <vformat+0x2c>
800005b4:	03000693          	li	a3,48
800005b8:	00d70023          	sb	a3,0(a4)
800005bc:	4305                	li	t1,1
800005be:	b559                	j	80000444 <vformat+0x198>
800005c0:	0805                	add	a6,a6,1
800005c2:	01c70023          	sb	t3,0(a4)
800005c6:	0785                	add	a5,a5,1
800005c8:	01058733          	add	a4,a1,a6
800005cc:	b331                	j	800002d8 <vformat+0x2c>
800005ce:	03f00893          	li	a7,63
800005d2:	00280693          	add	a3,a6,2
800005d6:	01170023          	sb	a7,0(a4)
800005da:	011700a3          	sb	a7,1(a4)
800005de:	080d                	add	a6,a6,3
800005e0:	00d58733          	add	a4,a1,a3
800005e4:	01170023          	sb	a7,0(a4)
800005e8:	0785                	add	a5,a5,1
800005ea:	01058733          	add	a4,a1,a6
800005ee:	b1ed                	j	800002d8 <vformat+0x2c>

800005f0 <vprint>:
800005f0:	7175                	add	sp,sp,-144
800005f2:	862e                	mv	a2,a1
800005f4:	858a                	mv	a1,sp
800005f6:	c706                	sw	ra,140(sp)
800005f8:	3955                	jal	800002ac <vformat>
800005fa:	00014783          	lbu	a5,0(sp)
800005fe:	cb89                	beqz	a5,80000610 <vprint+0x20>
80000600:	00110713          	add	a4,sp,1
80000604:	fef02e23          	sw	a5,-4(zero) # fffffffc <__stack_top+0x3ffffffc>
80000608:	00074783          	lbu	a5,0(a4)
8000060c:	0705                	add	a4,a4,1
8000060e:	fbfd                	bnez	a5,80000604 <vprint+0x14>
80000610:	40ba                	lw	ra,140(sp)
80000612:	6149                	add	sp,sp,144
80000614:	8082                	ret

80000616 <print>:
80000616:	7139                	add	sp,sp,-64
80000618:	02410313          	add	t1,sp,36
8000061c:	d22e                	sw	a1,36(sp)
8000061e:	859a                	mv	a1,t1
80000620:	ce06                	sw	ra,28(sp)
80000622:	d432                	sw	a2,40(sp)
80000624:	d636                	sw	a3,44(sp)
80000626:	d83a                	sw	a4,48(sp)
80000628:	da3e                	sw	a5,52(sp)
8000062a:	dc42                	sw	a6,56(sp)
8000062c:	de46                	sw	a7,60(sp)
8000062e:	c61a                	sw	t1,12(sp)
80000630:	37c1                	jal	800005f0 <vprint>
80000632:	40f2                	lw	ra,28(sp)
80000634:	6121                	add	sp,sp,64
80000636:	8082                	ret

80000638 <format>:
80000638:	7139                	add	sp,sp,-64
8000063a:	02810313          	add	t1,sp,40
8000063e:	d432                	sw	a2,40(sp)
80000640:	861a                	mv	a2,t1
80000642:	ce06                	sw	ra,28(sp)
80000644:	d636                	sw	a3,44(sp)
80000646:	d83a                	sw	a4,48(sp)
80000648:	da3e                	sw	a5,52(sp)
8000064a:	dc42                	sw	a6,56(sp)
8000064c:	de46                	sw	a7,60(sp)
8000064e:	c61a                	sw	t1,12(sp)
80000650:	39b1                	jal	800002ac <vformat>
80000652:	40f2                	lw	ra,28(sp)
80000654:	6121                	add	sp,sp,64
80000656:	8082                	ret

80000658 <dprint>:
80000658:	1101                	add	sp,sp,-32
8000065a:	c22e                	sw	a1,4(sp)
8000065c:	c432                	sw	a2,8(sp)
8000065e:	c636                	sw	a3,12(sp)
80000660:	c83a                	sw	a4,16(sp)
80000662:	ca3e                	sw	a5,20(sp)
80000664:	cc42                	sw	a6,24(sp)
80000666:	ce46                	sw	a7,28(sp)
80000668:	6105                	add	sp,sp,32
8000066a:	8082                	ret

8000066c <advance_mepc>:
8000066c:	341027f3          	csrr	a5,mepc
80000670:	953e                	add	a0,a0,a5
80000672:	34151073          	csrw	mepc,a0
80000676:	8082                	ret

80000678 <set_mepc>:
80000678:	34151073          	csrw	mepc,a0
8000067c:	8082                	ret

8000067e <advance_sepc>:
8000067e:	141027f3          	csrr	a5,sepc
80000682:	953e                	add	a0,a0,a5
80000684:	14151073          	csrw	sepc,a0
80000688:	8082                	ret

8000068a <set_sepc>:
8000068a:	14151073          	csrw	sepc,a0
8000068e:	8082                	ret

80000690 <setup_interrupts_m>:
80000690:	30551073          	csrw	mtvec,a0
80000694:	30459073          	csrw	mie,a1
80000698:	8082                	ret

8000069a <setup_interrupt_m_vectored>:
8000069a:	00156513          	or	a0,a0,1
8000069e:	30551073          	csrw	mtvec,a0
800006a2:	30459073          	csrw	mie,a1
800006a6:	8082                	ret

800006a8 <enable_interrupts_m>:
800006a8:	47a1                	li	a5,8
800006aa:	3007a073          	csrs	mstatus,a5
800006ae:	8082                	ret

800006b0 <disable_interrupts_m>:
800006b0:	47a1                	li	a5,8
800006b2:	3007b073          	csrc	mstatus,a5
800006b6:	8082                	ret

800006b8 <enable_interrupts_save_m>:
800006b8:	30051073          	csrw	mstatus,a0
800006bc:	8082                	ret

800006be <disable_interrupts_save_m>:
800006be:	4521                	li	a0,8
800006c0:	30053573          	csrrc	a0,mstatus,a0
800006c4:	8082                	ret

800006c6 <check_supervisor_mode_available>:
800006c6:	6785                	lui	a5,0x1
800006c8:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
800006cc:	3007a573          	csrrs	a0,mstatus,a5
800006d0:	30051573          	csrrw	a0,mstatus,a0
800006d4:	6789                	lui	a5,0x2
800006d6:	80078793          	add	a5,a5,-2048 # 1800 <boot-0x7fffe800>
800006da:	8d7d                	and	a0,a0,a5
800006dc:	80050513          	add	a0,a0,-2048
800006e0:	00153513          	seqz	a0,a0
800006e4:	8082                	ret

800006e6 <require_supervisor_mode>:
800006e6:	6785                	lui	a5,0x1
800006e8:	80078793          	add	a5,a5,-2048 # 800 <boot-0x7ffff800>
800006ec:	3007a7f3          	csrrs	a5,mstatus,a5
800006f0:	300797f3          	csrrw	a5,mstatus,a5
800006f4:	6709                	lui	a4,0x2
800006f6:	80070713          	add	a4,a4,-2048 # 1800 <boot-0x7fffe800>
800006fa:	8ff9                	and	a5,a5,a4
800006fc:	80078793          	add	a5,a5,-2048
80000700:	e391                	bnez	a5,80000704 <require_supervisor_mode+0x1e>
80000702:	8082                	ret
80000704:	1141                	add	sp,sp,-16
80000706:	00000517          	auipc	a0,0x0
8000070a:	25a50513          	add	a0,a0,602 # 80000960 <fromhost+0x6c>
8000070e:	c606                	sw	ra,12(sp)
80000710:	3719                	jal	80000616 <print>
80000712:	57fd                	li	a5,-1
80000714:	def1a423          	sw	a5,-536(gp) # 800008ec <flag>
80000718:	3251                	jal	8000009c <done>

8000071a <read_exception_context>:
8000071a:	c00027f3          	rdcycle	a5
8000071e:	c55c                	sw	a5,12(a0)
80000720:	c01027f3          	rdtime	a5
80000724:	c91c                	sw	a5,16(a0)
80000726:	342027f3          	csrr	a5,mcause
8000072a:	c51c                	sw	a5,8(a0)
8000072c:	341027f3          	csrr	a5,mepc
80000730:	c11c                	sw	a5,0(a0)
80000732:	343027f3          	csrr	a5,mtval
80000736:	c15c                	sw	a5,4(a0)
80000738:	c03027f3          	csrr	a5,hpmcounter3
8000073c:	c95c                	sw	a5,20(a0)
8000073e:	c04027f3          	csrr	a5,hpmcounter4
80000742:	cd1c                	sw	a5,24(a0)
80000744:	8082                	ret

80000746 <read_exception_context_s>:
80000746:	c00027f3          	rdcycle	a5
8000074a:	c55c                	sw	a5,12(a0)
8000074c:	c01027f3          	rdtime	a5
80000750:	c91c                	sw	a5,16(a0)
80000752:	142027f3          	csrr	a5,scause
80000756:	c51c                	sw	a5,8(a0)
80000758:	141027f3          	csrr	a5,sepc
8000075c:	c11c                	sw	a5,0(a0)
8000075e:	143027f3          	csrr	a5,stval
80000762:	c15c                	sw	a5,4(a0)
80000764:	c03027f3          	csrr	a5,hpmcounter3
80000768:	c95c                	sw	a5,20(a0)
8000076a:	c04027f3          	csrr	a5,hpmcounter4
8000076e:	cd1c                	sw	a5,24(a0)
80000770:	8082                	ret

80000772 <print_exception_context>:
80000772:	1141                	add	sp,sp,-16
80000774:	c422                	sw	s0,8(sp)
80000776:	842a                	mv	s0,a0
80000778:	00000517          	auipc	a0,0x0
8000077c:	20c50513          	add	a0,a0,524 # 80000984 <fromhost+0x90>
80000780:	c606                	sw	ra,12(sp)
80000782:	3d51                	jal	80000616 <print>
80000784:	440c                	lw	a1,8(s0)
80000786:	00000517          	auipc	a0,0x0
8000078a:	21650513          	add	a0,a0,534 # 8000099c <fromhost+0xa8>
8000078e:	3561                	jal	80000616 <print>
80000790:	400c                	lw	a1,0(s0)
80000792:	00000517          	auipc	a0,0x0
80000796:	21a50513          	add	a0,a0,538 # 800009ac <fromhost+0xb8>
8000079a:	3db5                	jal	80000616 <print>
8000079c:	404c                	lw	a1,4(s0)
8000079e:	00000517          	auipc	a0,0x0
800007a2:	21e50513          	add	a0,a0,542 # 800009bc <fromhost+0xc8>
800007a6:	3d85                	jal	80000616 <print>
800007a8:	444c                	lw	a1,12(s0)
800007aa:	00000517          	auipc	a0,0x0
800007ae:	22250513          	add	a0,a0,546 # 800009cc <fromhost+0xd8>
800007b2:	3595                	jal	80000616 <print>
800007b4:	480c                	lw	a1,16(s0)
800007b6:	00000517          	auipc	a0,0x0
800007ba:	22650513          	add	a0,a0,550 # 800009dc <fromhost+0xe8>
800007be:	3da1                	jal	80000616 <print>
800007c0:	484c                	lw	a1,20(s0)
800007c2:	00000517          	auipc	a0,0x0
800007c6:	22a50513          	add	a0,a0,554 # 800009ec <fromhost+0xf8>
800007ca:	35b1                	jal	80000616 <print>
800007cc:	4c0c                	lw	a1,24(s0)
800007ce:	4422                	lw	s0,8(sp)
800007d0:	40b2                	lw	ra,12(sp)
800007d2:	00000517          	auipc	a0,0x0
800007d6:	22a50513          	add	a0,a0,554 # 800009fc <fromhost+0x108>
800007da:	0141                	add	sp,sp,16
800007dc:	bd2d                	j	80000616 <print>
	...

800007e0 <default_handler>:
800007e0:	711d                	add	sp,sp,-96
800007e2:	c6aa                	sw	a0,76(sp)
800007e4:	0048                	add	a0,sp,4
800007e6:	ce86                	sw	ra,92(sp)
800007e8:	cc96                	sw	t0,88(sp)
800007ea:	ca9a                	sw	t1,84(sp)
800007ec:	c89e                	sw	t2,80(sp)
800007ee:	c4ae                	sw	a1,72(sp)
800007f0:	c2b2                	sw	a2,68(sp)
800007f2:	c0b6                	sw	a3,64(sp)
800007f4:	de3a                	sw	a4,60(sp)
800007f6:	dc3e                	sw	a5,56(sp)
800007f8:	da42                	sw	a6,52(sp)
800007fa:	d846                	sw	a7,48(sp)
800007fc:	d672                	sw	t3,44(sp)
800007fe:	d476                	sw	t4,40(sp)
80000800:	d27a                	sw	t5,36(sp)
80000802:	d07e                	sw	t6,32(sp)
80000804:	3f19                	jal	8000071a <read_exception_context>
80000806:	0048                	add	a0,sp,4
80000808:	37ad                	jal	80000772 <print_exception_context>
8000080a:	00000517          	auipc	a0,0x0
8000080e:	20250513          	add	a0,a0,514 # 80000a0c <fromhost+0x118>
80000812:	3511                	jal	80000616 <print>
80000814:	889ff0ef          	jal	8000009c <done>

80000818 <unreachable_handler>:
80000818:	711d                	add	sp,sp,-96
8000081a:	c6aa                	sw	a0,76(sp)
8000081c:	0048                	add	a0,sp,4
8000081e:	ce86                	sw	ra,92(sp)
80000820:	cc96                	sw	t0,88(sp)
80000822:	ca9a                	sw	t1,84(sp)
80000824:	c89e                	sw	t2,80(sp)
80000826:	c4ae                	sw	a1,72(sp)
80000828:	c2b2                	sw	a2,68(sp)
8000082a:	c0b6                	sw	a3,64(sp)
8000082c:	de3a                	sw	a4,60(sp)
8000082e:	dc3e                	sw	a5,56(sp)
80000830:	da42                	sw	a6,52(sp)
80000832:	d846                	sw	a7,48(sp)
80000834:	d672                	sw	t3,44(sp)
80000836:	d476                	sw	t4,40(sp)
80000838:	d27a                	sw	t5,36(sp)
8000083a:	d07e                	sw	t6,32(sp)
8000083c:	3df9                	jal	8000071a <read_exception_context>
8000083e:	0048                	add	a0,sp,4
80000840:	3f0d                	jal	80000772 <print_exception_context>
80000842:	00000517          	auipc	a0,0x0
80000846:	1f650513          	add	a0,a0,502 # 80000a38 <fromhost+0x144>
8000084a:	33f1                	jal	80000616 <print>
8000084c:	851ff0ef          	jal	8000009c <done>

80000850 <test_pass>:
80000850:	1141                	add	sp,sp,-16
80000852:	85aa                	mv	a1,a0
80000854:	00000517          	auipc	a0,0x0
80000858:	23450513          	add	a0,a0,564 # 80000a88 <fromhost+0x194>
8000085c:	c606                	sw	ra,12(sp)
8000085e:	3b65                	jal	80000616 <print>
80000860:	40b2                	lw	ra,12(sp)
80000862:	4785                	li	a5,1
80000864:	def1a423          	sw	a5,-536(gp) # 800008ec <flag>
80000868:	0141                	add	sp,sp,16
8000086a:	8082                	ret

8000086c <test_fail>:
8000086c:	1141                	add	sp,sp,-16
8000086e:	85aa                	mv	a1,a0
80000870:	00000517          	auipc	a0,0x0
80000874:	21850513          	add	a0,a0,536 # 80000a88 <fromhost+0x194>
80000878:	c606                	sw	ra,12(sp)
8000087a:	3b71                	jal	80000616 <print>
8000087c:	40b2                	lw	ra,12(sp)
8000087e:	de01a423          	sw	zero,-536(gp) # 800008ec <flag>
80000882:	0141                	add	sp,sp,16
80000884:	8082                	ret
	...

80000890 <vector_table>:
80000890:	f51ff06f          	j	800007e0 <default_handler>
80000894:	f4dff06f          	j	800007e0 <default_handler>
80000898:	f81ff06f          	j	80000818 <unreachable_handler>
8000089c:	955ff06f          	j	800001f0 <msip_handler>
800008a0:	f79ff06f          	j	80000818 <unreachable_handler>
800008a4:	f3dff06f          	j	800007e0 <default_handler>
800008a8:	f71ff06f          	j	80000818 <unreachable_handler>
800008ac:	89dff06f          	j	80000148 <mtip_handler>
800008b0:	f69ff06f          	j	80000818 <unreachable_handler>
800008b4:	f2dff06f          	j	800007e0 <default_handler>
800008b8:	f61ff06f          	j	80000818 <unreachable_handler>
800008bc:	821ff06f          	j	800000dc <meip_handler>
800008c0:	f59ff06f          	j	80000818 <unreachable_handler>
800008c4:	f1dff06f          	j	800007e0 <default_handler>
800008c8:	f51ff06f          	j	80000818 <unreachable_handler>
800008cc:	f4dff06f          	j	80000818 <unreachable_handler>
	...
