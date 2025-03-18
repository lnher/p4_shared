
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <vmalloc.cold>:

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
       0:	c7 05 c0 a7 00 00 c4 	movl   $0xa7c4,0xa7c0
       7:	a7 00 00 
       a:	c7 05 c4 a7 00 00 c4 	movl   $0xa7c4,0xa7c4
      11:	a7 00 00 
            huge_base.s.size = 0;
      14:	c7 05 c8 a7 00 00 00 	movl   $0x0,0xa7c8
      1b:	00 00 00 
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
      1e:	a1 00 00 00 00       	mov    0x0,%eax
      23:	0f 0b                	ud2    
            base.s.ptr = freep = &base;
      25:	c7 05 cc a7 00 00 d0 	movl   $0xa7d0,0xa7cc
      2c:	a7 00 00 
      2f:	c7 05 d0 a7 00 00 d0 	movl   $0xa7d0,0xa7d0
      36:	a7 00 00 
            base.s.size = 0;
      39:	c7 05 d4 a7 00 00 00 	movl   $0x0,0xa7d4
      40:	00 00 00 
      43:	eb d9                	jmp    1e <vmalloc.cold+0x1e>
      45:	66 90                	xchg   %ax,%ax
      47:	66 90                	xchg   %ax,%ax
      49:	66 90                	xchg   %ax,%ax
      4b:	66 90                	xchg   %ax,%ax
      4d:	66 90                	xchg   %ax,%ax
      4f:	90                   	nop

00000050 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
      50:	8d 4c 24 04          	lea    0x4(%esp),%ecx
      54:	83 e4 f0             	and    $0xfffffff0,%esp
      57:	ff 71 fc             	push   -0x4(%ecx)
      5a:	55                   	push   %ebp
      5b:	89 e5                	mov    %esp,%ebp
      5d:	51                   	push   %ecx
      5e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      61:	68 92 4e 00 00       	push   $0x4e92
      66:	6a 01                	push   $0x1
      68:	e8 33 3a 00 00       	call   3aa0 <printf>

  if(open("usertests.ran", 0) >= 0){
      6d:	59                   	pop    %ecx
      6e:	58                   	pop    %eax
      6f:	6a 00                	push   $0x0
      71:	68 a6 4e 00 00       	push   $0x4ea6
      76:	e8 e8 38 00 00       	call   3963 <open>
      7b:	83 c4 10             	add    $0x10,%esp
      7e:	85 c0                	test   %eax,%eax
      80:	78 13                	js     95 <main+0x45>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      82:	52                   	push   %edx
      83:	52                   	push   %edx
      84:	68 10 56 00 00       	push   $0x5610
      89:	6a 01                	push   $0x1
      8b:	e8 10 3a 00 00       	call   3aa0 <printf>
    exit();
      90:	e8 8e 38 00 00       	call   3923 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      95:	50                   	push   %eax
      96:	50                   	push   %eax
      97:	68 00 02 00 00       	push   $0x200
      9c:	68 a6 4e 00 00       	push   $0x4ea6
      a1:	e8 bd 38 00 00       	call   3963 <open>
      a6:	89 04 24             	mov    %eax,(%esp)
      a9:	e8 9d 38 00 00       	call   394b <close>

  argptest();
      ae:	e8 8d 35 00 00       	call   3640 <argptest>
  createdelete();
      b3:	e8 b8 11 00 00       	call   1270 <createdelete>
  linkunlink();
      b8:	e8 73 1a 00 00       	call   1b30 <linkunlink>
  concreate();
      bd:	e8 6e 17 00 00       	call   1830 <concreate>
  fourfiles();
      c2:	e8 a9 0f 00 00       	call   1070 <fourfiles>
  sharedfd();
      c7:	e8 e4 0d 00 00       	call   eb0 <sharedfd>

  bigargtest();
      cc:	e8 2f 32 00 00       	call   3300 <bigargtest>
  bigwrite();
      d1:	e8 7a 23 00 00       	call   2450 <bigwrite>
  bigargtest();
      d6:	e8 25 32 00 00       	call   3300 <bigargtest>
  bsstest();
      db:	e8 b0 31 00 00       	call   3290 <bsstest>
  sbrktest();
      e0:	e8 ab 2c 00 00       	call   2d90 <sbrktest>
  validatetest();
      e5:	e8 f6 30 00 00       	call   31e0 <validatetest>

  opentest();
      ea:	e8 61 03 00 00       	call   450 <opentest>
  writetest();
      ef:	e8 ec 03 00 00       	call   4e0 <writetest>
  writetest1();
      f4:	e8 c7 05 00 00       	call   6c0 <writetest1>
  createtest();
      f9:	e8 92 07 00 00       	call   890 <createtest>

  openiputtest();
      fe:	e8 4d 02 00 00       	call   350 <openiputtest>
  exitiputtest();
     103:	e8 48 01 00 00       	call   250 <exitiputtest>
  iputtest();
     108:	e8 63 00 00 00       	call   170 <iputtest>

  mem();
     10d:	e8 ce 0c 00 00       	call   de0 <mem>
  pipe1();
     112:	e8 59 09 00 00       	call   a70 <pipe1>
  preempt();
     117:	e8 e4 0a 00 00       	call   c00 <preempt>
  exitwait();
     11c:	e8 3f 0c 00 00       	call   d60 <exitwait>

  rmdot();
     121:	e8 1a 27 00 00       	call   2840 <rmdot>
  fourteen();
     126:	e8 d5 25 00 00       	call   2700 <fourteen>
  bigfile();
     12b:	e8 00 24 00 00       	call   2530 <bigfile>
  subdir();
     130:	e8 3b 1c 00 00       	call   1d70 <subdir>
  linktest();
     135:	e8 e6 14 00 00       	call   1620 <linktest>
  unlinkread();
     13a:	e8 51 13 00 00       	call   1490 <unlinkread>
  dirfile();
     13f:	e8 7c 28 00 00       	call   29c0 <dirfile>
  iref();
     144:	e8 77 2a 00 00       	call   2bc0 <iref>
  forktest();
     149:	e8 92 2b 00 00       	call   2ce0 <forktest>
  bigdir(); // slow
     14e:	e8 ed 1a 00 00       	call   1c40 <bigdir>

  uio();
     153:	e8 78 34 00 00       	call   35d0 <uio>

  exectest();
     158:	e8 c3 08 00 00       	call   a20 <exectest>

  exit();
     15d:	e8 c1 37 00 00       	call   3923 <exit>
     162:	66 90                	xchg   %ax,%ax
     164:	66 90                	xchg   %ax,%ax
     166:	66 90                	xchg   %ax,%ax
     168:	66 90                	xchg   %ax,%ax
     16a:	66 90                	xchg   %ax,%ax
     16c:	66 90                	xchg   %ax,%ax
     16e:	66 90                	xchg   %ax,%ax

00000170 <iputtest>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     176:	68 38 3f 00 00       	push   $0x3f38
     17b:	ff 35 04 60 00 00    	push   0x6004
     181:	e8 1a 39 00 00       	call   3aa0 <printf>
  if(mkdir("iputdir") < 0){
     186:	c7 04 24 cb 3e 00 00 	movl   $0x3ecb,(%esp)
     18d:	e8 f9 37 00 00       	call   398b <mkdir>
     192:	83 c4 10             	add    $0x10,%esp
     195:	85 c0                	test   %eax,%eax
     197:	78 58                	js     1f1 <iputtest+0x81>
  if(chdir("iputdir") < 0){
     199:	83 ec 0c             	sub    $0xc,%esp
     19c:	68 cb 3e 00 00       	push   $0x3ecb
     1a1:	e8 ed 37 00 00       	call   3993 <chdir>
     1a6:	83 c4 10             	add    $0x10,%esp
     1a9:	85 c0                	test   %eax,%eax
     1ab:	0f 88 85 00 00 00    	js     236 <iputtest+0xc6>
  if(unlink("../iputdir") < 0){
     1b1:	83 ec 0c             	sub    $0xc,%esp
     1b4:	68 c8 3e 00 00       	push   $0x3ec8
     1b9:	e8 b5 37 00 00       	call   3973 <unlink>
     1be:	83 c4 10             	add    $0x10,%esp
     1c1:	85 c0                	test   %eax,%eax
     1c3:	78 5a                	js     21f <iputtest+0xaf>
  if(chdir("/") < 0){
     1c5:	83 ec 0c             	sub    $0xc,%esp
     1c8:	68 ed 3e 00 00       	push   $0x3eed
     1cd:	e8 c1 37 00 00       	call   3993 <chdir>
     1d2:	83 c4 10             	add    $0x10,%esp
     1d5:	85 c0                	test   %eax,%eax
     1d7:	78 2f                	js     208 <iputtest+0x98>
  printf(stdout, "iput test ok\n");
     1d9:	83 ec 08             	sub    $0x8,%esp
     1dc:	68 70 3f 00 00       	push   $0x3f70
     1e1:	ff 35 04 60 00 00    	push   0x6004
     1e7:	e8 b4 38 00 00       	call   3aa0 <printf>
}
     1ec:	83 c4 10             	add    $0x10,%esp
     1ef:	c9                   	leave  
     1f0:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     1f1:	50                   	push   %eax
     1f2:	50                   	push   %eax
     1f3:	68 a4 3e 00 00       	push   $0x3ea4
     1f8:	ff 35 04 60 00 00    	push   0x6004
     1fe:	e8 9d 38 00 00       	call   3aa0 <printf>
    exit();
     203:	e8 1b 37 00 00       	call   3923 <exit>
    printf(stdout, "chdir / failed\n");
     208:	50                   	push   %eax
     209:	50                   	push   %eax
     20a:	68 ef 3e 00 00       	push   $0x3eef
     20f:	ff 35 04 60 00 00    	push   0x6004
     215:	e8 86 38 00 00       	call   3aa0 <printf>
    exit();
     21a:	e8 04 37 00 00       	call   3923 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
     21f:	52                   	push   %edx
     220:	52                   	push   %edx
     221:	68 d3 3e 00 00       	push   $0x3ed3
     226:	ff 35 04 60 00 00    	push   0x6004
     22c:	e8 6f 38 00 00       	call   3aa0 <printf>
    exit();
     231:	e8 ed 36 00 00       	call   3923 <exit>
    printf(stdout, "chdir iputdir failed\n");
     236:	51                   	push   %ecx
     237:	51                   	push   %ecx
     238:	68 b2 3e 00 00       	push   $0x3eb2
     23d:	ff 35 04 60 00 00    	push   0x6004
     243:	e8 58 38 00 00       	call   3aa0 <printf>
    exit();
     248:	e8 d6 36 00 00       	call   3923 <exit>
     24d:	8d 76 00             	lea    0x0(%esi),%esi

00000250 <exitiputtest>:
{
     250:	55                   	push   %ebp
     251:	89 e5                	mov    %esp,%ebp
     253:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exitiput test\n");
     256:	68 ff 3e 00 00       	push   $0x3eff
     25b:	ff 35 04 60 00 00    	push   0x6004
     261:	e8 3a 38 00 00       	call   3aa0 <printf>
  pid = fork();
     266:	e8 b0 36 00 00       	call   391b <fork>
  if(pid < 0){
     26b:	83 c4 10             	add    $0x10,%esp
     26e:	85 c0                	test   %eax,%eax
     270:	0f 88 8a 00 00 00    	js     300 <exitiputtest+0xb0>
  if(pid == 0){
     276:	75 50                	jne    2c8 <exitiputtest+0x78>
    if(mkdir("iputdir") < 0){
     278:	83 ec 0c             	sub    $0xc,%esp
     27b:	68 cb 3e 00 00       	push   $0x3ecb
     280:	e8 06 37 00 00       	call   398b <mkdir>
     285:	83 c4 10             	add    $0x10,%esp
     288:	85 c0                	test   %eax,%eax
     28a:	0f 88 87 00 00 00    	js     317 <exitiputtest+0xc7>
    if(chdir("iputdir") < 0){
     290:	83 ec 0c             	sub    $0xc,%esp
     293:	68 cb 3e 00 00       	push   $0x3ecb
     298:	e8 f6 36 00 00       	call   3993 <chdir>
     29d:	83 c4 10             	add    $0x10,%esp
     2a0:	85 c0                	test   %eax,%eax
     2a2:	0f 88 86 00 00 00    	js     32e <exitiputtest+0xde>
    if(unlink("../iputdir") < 0){
     2a8:	83 ec 0c             	sub    $0xc,%esp
     2ab:	68 c8 3e 00 00       	push   $0x3ec8
     2b0:	e8 be 36 00 00       	call   3973 <unlink>
     2b5:	83 c4 10             	add    $0x10,%esp
     2b8:	85 c0                	test   %eax,%eax
     2ba:	78 2c                	js     2e8 <exitiputtest+0x98>
    exit();
     2bc:	e8 62 36 00 00       	call   3923 <exit>
     2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  wait();
     2c8:	e8 5e 36 00 00       	call   392b <wait>
  printf(stdout, "exitiput test ok\n");
     2cd:	83 ec 08             	sub    $0x8,%esp
     2d0:	68 22 3f 00 00       	push   $0x3f22
     2d5:	ff 35 04 60 00 00    	push   0x6004
     2db:	e8 c0 37 00 00       	call   3aa0 <printf>
}
     2e0:	83 c4 10             	add    $0x10,%esp
     2e3:	c9                   	leave  
     2e4:	c3                   	ret    
     2e5:	8d 76 00             	lea    0x0(%esi),%esi
      printf(stdout, "unlink ../iputdir failed\n");
     2e8:	83 ec 08             	sub    $0x8,%esp
     2eb:	68 d3 3e 00 00       	push   $0x3ed3
     2f0:	ff 35 04 60 00 00    	push   0x6004
     2f6:	e8 a5 37 00 00       	call   3aa0 <printf>
      exit();
     2fb:	e8 23 36 00 00       	call   3923 <exit>
    printf(stdout, "fork failed\n");
     300:	51                   	push   %ecx
     301:	51                   	push   %ecx
     302:	68 e5 4d 00 00       	push   $0x4de5
     307:	ff 35 04 60 00 00    	push   0x6004
     30d:	e8 8e 37 00 00       	call   3aa0 <printf>
    exit();
     312:	e8 0c 36 00 00       	call   3923 <exit>
      printf(stdout, "mkdir failed\n");
     317:	52                   	push   %edx
     318:	52                   	push   %edx
     319:	68 a4 3e 00 00       	push   $0x3ea4
     31e:	ff 35 04 60 00 00    	push   0x6004
     324:	e8 77 37 00 00       	call   3aa0 <printf>
      exit();
     329:	e8 f5 35 00 00       	call   3923 <exit>
      printf(stdout, "child chdir failed\n");
     32e:	50                   	push   %eax
     32f:	50                   	push   %eax
     330:	68 0e 3f 00 00       	push   $0x3f0e
     335:	ff 35 04 60 00 00    	push   0x6004
     33b:	e8 60 37 00 00       	call   3aa0 <printf>
      exit();
     340:	e8 de 35 00 00       	call   3923 <exit>
     345:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000350 <openiputtest>:
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "openiput test\n");
     356:	68 34 3f 00 00       	push   $0x3f34
     35b:	ff 35 04 60 00 00    	push   0x6004
     361:	e8 3a 37 00 00       	call   3aa0 <printf>
  if(mkdir("oidir") < 0){
     366:	c7 04 24 43 3f 00 00 	movl   $0x3f43,(%esp)
     36d:	e8 19 36 00 00       	call   398b <mkdir>
     372:	83 c4 10             	add    $0x10,%esp
     375:	85 c0                	test   %eax,%eax
     377:	0f 88 9f 00 00 00    	js     41c <openiputtest+0xcc>
  pid = fork();
     37d:	e8 99 35 00 00       	call   391b <fork>
  if(pid < 0){
     382:	85 c0                	test   %eax,%eax
     384:	78 7f                	js     405 <openiputtest+0xb5>
  if(pid == 0){
     386:	75 38                	jne    3c0 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     388:	83 ec 08             	sub    $0x8,%esp
     38b:	6a 02                	push   $0x2
     38d:	68 43 3f 00 00       	push   $0x3f43
     392:	e8 cc 35 00 00       	call   3963 <open>
    if(fd >= 0){
     397:	83 c4 10             	add    $0x10,%esp
     39a:	85 c0                	test   %eax,%eax
     39c:	78 62                	js     400 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     39e:	83 ec 08             	sub    $0x8,%esp
     3a1:	68 c8 4e 00 00       	push   $0x4ec8
     3a6:	ff 35 04 60 00 00    	push   0x6004
     3ac:	e8 ef 36 00 00       	call   3aa0 <printf>
      exit();
     3b1:	e8 6d 35 00 00       	call   3923 <exit>
     3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3bd:	8d 76 00             	lea    0x0(%esi),%esi
  sleep(1);
     3c0:	83 ec 0c             	sub    $0xc,%esp
     3c3:	6a 01                	push   $0x1
     3c5:	e8 e9 35 00 00       	call   39b3 <sleep>
  if(unlink("oidir") != 0){
     3ca:	c7 04 24 43 3f 00 00 	movl   $0x3f43,(%esp)
     3d1:	e8 9d 35 00 00       	call   3973 <unlink>
     3d6:	83 c4 10             	add    $0x10,%esp
     3d9:	85 c0                	test   %eax,%eax
     3db:	75 56                	jne    433 <openiputtest+0xe3>
  wait();
     3dd:	e8 49 35 00 00       	call   392b <wait>
  printf(stdout, "openiput test ok\n");
     3e2:	83 ec 08             	sub    $0x8,%esp
     3e5:	68 6c 3f 00 00       	push   $0x3f6c
     3ea:	ff 35 04 60 00 00    	push   0x6004
     3f0:	e8 ab 36 00 00       	call   3aa0 <printf>
}
     3f5:	83 c4 10             	add    $0x10,%esp
     3f8:	c9                   	leave  
     3f9:	c3                   	ret    
     3fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
     400:	e8 1e 35 00 00       	call   3923 <exit>
    printf(stdout, "fork failed\n");
     405:	52                   	push   %edx
     406:	52                   	push   %edx
     407:	68 e5 4d 00 00       	push   $0x4de5
     40c:	ff 35 04 60 00 00    	push   0x6004
     412:	e8 89 36 00 00       	call   3aa0 <printf>
    exit();
     417:	e8 07 35 00 00       	call   3923 <exit>
    printf(stdout, "mkdir oidir failed\n");
     41c:	51                   	push   %ecx
     41d:	51                   	push   %ecx
     41e:	68 49 3f 00 00       	push   $0x3f49
     423:	ff 35 04 60 00 00    	push   0x6004
     429:	e8 72 36 00 00       	call   3aa0 <printf>
    exit();
     42e:	e8 f0 34 00 00       	call   3923 <exit>
    printf(stdout, "unlink failed\n");
     433:	50                   	push   %eax
     434:	50                   	push   %eax
     435:	68 5d 3f 00 00       	push   $0x3f5d
     43a:	ff 35 04 60 00 00    	push   0x6004
     440:	e8 5b 36 00 00       	call   3aa0 <printf>
    exit();
     445:	e8 d9 34 00 00       	call   3923 <exit>
     44a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000450 <opentest>:
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "open test\n");
     456:	68 7e 3f 00 00       	push   $0x3f7e
     45b:	ff 35 04 60 00 00    	push   0x6004
     461:	e8 3a 36 00 00       	call   3aa0 <printf>
  fd = open("echo", 0);
     466:	58                   	pop    %eax
     467:	5a                   	pop    %edx
     468:	6a 00                	push   $0x0
     46a:	68 89 3f 00 00       	push   $0x3f89
     46f:	e8 ef 34 00 00       	call   3963 <open>
  if(fd < 0){
     474:	83 c4 10             	add    $0x10,%esp
     477:	85 c0                	test   %eax,%eax
     479:	78 36                	js     4b1 <opentest+0x61>
  close(fd);
     47b:	83 ec 0c             	sub    $0xc,%esp
     47e:	50                   	push   %eax
     47f:	e8 c7 34 00 00       	call   394b <close>
  fd = open("doesnotexist", 0);
     484:	5a                   	pop    %edx
     485:	59                   	pop    %ecx
     486:	6a 00                	push   $0x0
     488:	68 a1 3f 00 00       	push   $0x3fa1
     48d:	e8 d1 34 00 00       	call   3963 <open>
  if(fd >= 0){
     492:	83 c4 10             	add    $0x10,%esp
     495:	85 c0                	test   %eax,%eax
     497:	79 2f                	jns    4c8 <opentest+0x78>
  printf(stdout, "open test ok\n");
     499:	83 ec 08             	sub    $0x8,%esp
     49c:	68 cc 3f 00 00       	push   $0x3fcc
     4a1:	ff 35 04 60 00 00    	push   0x6004
     4a7:	e8 f4 35 00 00       	call   3aa0 <printf>
}
     4ac:	83 c4 10             	add    $0x10,%esp
     4af:	c9                   	leave  
     4b0:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     4b1:	50                   	push   %eax
     4b2:	50                   	push   %eax
     4b3:	68 8e 3f 00 00       	push   $0x3f8e
     4b8:	ff 35 04 60 00 00    	push   0x6004
     4be:	e8 dd 35 00 00       	call   3aa0 <printf>
    exit();
     4c3:	e8 5b 34 00 00       	call   3923 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     4c8:	50                   	push   %eax
     4c9:	50                   	push   %eax
     4ca:	68 ae 3f 00 00       	push   $0x3fae
     4cf:	ff 35 04 60 00 00    	push   0x6004
     4d5:	e8 c6 35 00 00       	call   3aa0 <printf>
    exit();
     4da:	e8 44 34 00 00       	call   3923 <exit>
     4df:	90                   	nop

000004e0 <writetest>:
{
     4e0:	55                   	push   %ebp
     4e1:	89 e5                	mov    %esp,%ebp
     4e3:	56                   	push   %esi
     4e4:	53                   	push   %ebx
  printf(stdout, "small file test\n");
     4e5:	83 ec 08             	sub    $0x8,%esp
     4e8:	68 da 3f 00 00       	push   $0x3fda
     4ed:	ff 35 04 60 00 00    	push   0x6004
     4f3:	e8 a8 35 00 00       	call   3aa0 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     4f8:	58                   	pop    %eax
     4f9:	5a                   	pop    %edx
     4fa:	68 02 02 00 00       	push   $0x202
     4ff:	68 eb 3f 00 00       	push   $0x3feb
     504:	e8 5a 34 00 00       	call   3963 <open>
  if(fd >= 0){
     509:	83 c4 10             	add    $0x10,%esp
     50c:	85 c0                	test   %eax,%eax
     50e:	0f 88 88 01 00 00    	js     69c <writetest+0x1bc>
    printf(stdout, "creat small succeeded; ok\n");
     514:	83 ec 08             	sub    $0x8,%esp
     517:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 100; i++){
     519:	31 db                	xor    %ebx,%ebx
    printf(stdout, "creat small succeeded; ok\n");
     51b:	68 f1 3f 00 00       	push   $0x3ff1
     520:	ff 35 04 60 00 00    	push   0x6004
     526:	e8 75 35 00 00       	call   3aa0 <printf>
     52b:	83 c4 10             	add    $0x10,%esp
     52e:	66 90                	xchg   %ax,%ax
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     530:	83 ec 04             	sub    $0x4,%esp
     533:	6a 0a                	push   $0xa
     535:	68 28 40 00 00       	push   $0x4028
     53a:	56                   	push   %esi
     53b:	e8 03 34 00 00       	call   3943 <write>
     540:	83 c4 10             	add    $0x10,%esp
     543:	83 f8 0a             	cmp    $0xa,%eax
     546:	0f 85 d9 00 00 00    	jne    625 <writetest+0x145>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     54c:	83 ec 04             	sub    $0x4,%esp
     54f:	6a 0a                	push   $0xa
     551:	68 33 40 00 00       	push   $0x4033
     556:	56                   	push   %esi
     557:	e8 e7 33 00 00       	call   3943 <write>
     55c:	83 c4 10             	add    $0x10,%esp
     55f:	83 f8 0a             	cmp    $0xa,%eax
     562:	0f 85 d6 00 00 00    	jne    63e <writetest+0x15e>
  for(i = 0; i < 100; i++){
     568:	83 c3 01             	add    $0x1,%ebx
     56b:	83 fb 64             	cmp    $0x64,%ebx
     56e:	75 c0                	jne    530 <writetest+0x50>
  printf(stdout, "writes ok\n");
     570:	83 ec 08             	sub    $0x8,%esp
     573:	68 3e 40 00 00       	push   $0x403e
     578:	ff 35 04 60 00 00    	push   0x6004
     57e:	e8 1d 35 00 00       	call   3aa0 <printf>
  close(fd);
     583:	89 34 24             	mov    %esi,(%esp)
     586:	e8 c0 33 00 00       	call   394b <close>
  fd = open("small", O_RDONLY);
     58b:	5b                   	pop    %ebx
     58c:	5e                   	pop    %esi
     58d:	6a 00                	push   $0x0
     58f:	68 eb 3f 00 00       	push   $0x3feb
     594:	e8 ca 33 00 00       	call   3963 <open>
  if(fd >= 0){
     599:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_RDONLY);
     59c:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     59e:	85 c0                	test   %eax,%eax
     5a0:	0f 88 b1 00 00 00    	js     657 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     5a6:	83 ec 08             	sub    $0x8,%esp
     5a9:	68 49 40 00 00       	push   $0x4049
     5ae:	ff 35 04 60 00 00    	push   0x6004
     5b4:	e8 e7 34 00 00       	call   3aa0 <printf>
  i = read(fd, buf, 2000);
     5b9:	83 c4 0c             	add    $0xc,%esp
     5bc:	68 d0 07 00 00       	push   $0x7d0
     5c1:	68 40 87 00 00       	push   $0x8740
     5c6:	53                   	push   %ebx
     5c7:	e8 6f 33 00 00       	call   393b <read>
  if(i == 2000){
     5cc:	83 c4 10             	add    $0x10,%esp
     5cf:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     5d4:	0f 85 94 00 00 00    	jne    66e <writetest+0x18e>
    printf(stdout, "read succeeded ok\n");
     5da:	83 ec 08             	sub    $0x8,%esp
     5dd:	68 7d 40 00 00       	push   $0x407d
     5e2:	ff 35 04 60 00 00    	push   0x6004
     5e8:	e8 b3 34 00 00       	call   3aa0 <printf>
  close(fd);
     5ed:	89 1c 24             	mov    %ebx,(%esp)
     5f0:	e8 56 33 00 00       	call   394b <close>
  if(unlink("small") < 0){
     5f5:	c7 04 24 eb 3f 00 00 	movl   $0x3feb,(%esp)
     5fc:	e8 72 33 00 00       	call   3973 <unlink>
     601:	83 c4 10             	add    $0x10,%esp
     604:	85 c0                	test   %eax,%eax
     606:	78 7d                	js     685 <writetest+0x1a5>
  printf(stdout, "small file test ok\n");
     608:	83 ec 08             	sub    $0x8,%esp
     60b:	68 a5 40 00 00       	push   $0x40a5
     610:	ff 35 04 60 00 00    	push   0x6004
     616:	e8 85 34 00 00       	call   3aa0 <printf>
}
     61b:	83 c4 10             	add    $0x10,%esp
     61e:	8d 65 f8             	lea    -0x8(%ebp),%esp
     621:	5b                   	pop    %ebx
     622:	5e                   	pop    %esi
     623:	5d                   	pop    %ebp
     624:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
     625:	83 ec 04             	sub    $0x4,%esp
     628:	53                   	push   %ebx
     629:	68 ec 4e 00 00       	push   $0x4eec
     62e:	ff 35 04 60 00 00    	push   0x6004
     634:	e8 67 34 00 00       	call   3aa0 <printf>
      exit();
     639:	e8 e5 32 00 00       	call   3923 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     63e:	83 ec 04             	sub    $0x4,%esp
     641:	53                   	push   %ebx
     642:	68 10 4f 00 00       	push   $0x4f10
     647:	ff 35 04 60 00 00    	push   0x6004
     64d:	e8 4e 34 00 00       	call   3aa0 <printf>
      exit();
     652:	e8 cc 32 00 00       	call   3923 <exit>
    printf(stdout, "error: open small failed!\n");
     657:	51                   	push   %ecx
     658:	51                   	push   %ecx
     659:	68 62 40 00 00       	push   $0x4062
     65e:	ff 35 04 60 00 00    	push   0x6004
     664:	e8 37 34 00 00       	call   3aa0 <printf>
    exit();
     669:	e8 b5 32 00 00       	call   3923 <exit>
    printf(stdout, "read failed\n");
     66e:	52                   	push   %edx
     66f:	52                   	push   %edx
     670:	68 a9 43 00 00       	push   $0x43a9
     675:	ff 35 04 60 00 00    	push   0x6004
     67b:	e8 20 34 00 00       	call   3aa0 <printf>
    exit();
     680:	e8 9e 32 00 00       	call   3923 <exit>
    printf(stdout, "unlink small failed\n");
     685:	50                   	push   %eax
     686:	50                   	push   %eax
     687:	68 90 40 00 00       	push   $0x4090
     68c:	ff 35 04 60 00 00    	push   0x6004
     692:	e8 09 34 00 00       	call   3aa0 <printf>
    exit();
     697:	e8 87 32 00 00       	call   3923 <exit>
    printf(stdout, "error: creat small failed!\n");
     69c:	50                   	push   %eax
     69d:	50                   	push   %eax
     69e:	68 0c 40 00 00       	push   $0x400c
     6a3:	ff 35 04 60 00 00    	push   0x6004
     6a9:	e8 f2 33 00 00       	call   3aa0 <printf>
    exit();
     6ae:	e8 70 32 00 00       	call   3923 <exit>
     6b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000006c0 <writetest1>:
{
     6c0:	55                   	push   %ebp
     6c1:	89 e5                	mov    %esp,%ebp
     6c3:	56                   	push   %esi
     6c4:	53                   	push   %ebx
  printf(stdout, "big files test\n");
     6c5:	83 ec 08             	sub    $0x8,%esp
     6c8:	68 b9 40 00 00       	push   $0x40b9
     6cd:	ff 35 04 60 00 00    	push   0x6004
     6d3:	e8 c8 33 00 00       	call   3aa0 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     6d8:	58                   	pop    %eax
     6d9:	5a                   	pop    %edx
     6da:	68 02 02 00 00       	push   $0x202
     6df:	68 33 41 00 00       	push   $0x4133
     6e4:	e8 7a 32 00 00       	call   3963 <open>
  if(fd < 0){
     6e9:	83 c4 10             	add    $0x10,%esp
     6ec:	85 c0                	test   %eax,%eax
     6ee:	0f 88 61 01 00 00    	js     855 <writetest1+0x195>
     6f4:	89 c6                	mov    %eax,%esi
  for(i = 0; i < MAXFILE; i++){
     6f6:	31 db                	xor    %ebx,%ebx
     6f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6ff:	90                   	nop
    if(write(fd, buf, 512) != 512){
     700:	83 ec 04             	sub    $0x4,%esp
    ((int*)buf)[0] = i;
     703:	89 1d 40 87 00 00    	mov    %ebx,0x8740
    if(write(fd, buf, 512) != 512){
     709:	68 00 02 00 00       	push   $0x200
     70e:	68 40 87 00 00       	push   $0x8740
     713:	56                   	push   %esi
     714:	e8 2a 32 00 00       	call   3943 <write>
     719:	83 c4 10             	add    $0x10,%esp
     71c:	3d 00 02 00 00       	cmp    $0x200,%eax
     721:	0f 85 b3 00 00 00    	jne    7da <writetest1+0x11a>
  for(i = 0; i < MAXFILE; i++){
     727:	83 c3 01             	add    $0x1,%ebx
     72a:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     730:	75 ce                	jne    700 <writetest1+0x40>
  close(fd);
     732:	83 ec 0c             	sub    $0xc,%esp
     735:	56                   	push   %esi
     736:	e8 10 32 00 00       	call   394b <close>
  fd = open("big", O_RDONLY);
     73b:	5b                   	pop    %ebx
     73c:	5e                   	pop    %esi
     73d:	6a 00                	push   $0x0
     73f:	68 33 41 00 00       	push   $0x4133
     744:	e8 1a 32 00 00       	call   3963 <open>
  if(fd < 0){
     749:	83 c4 10             	add    $0x10,%esp
  fd = open("big", O_RDONLY);
     74c:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
     74e:	85 c0                	test   %eax,%eax
     750:	0f 88 e8 00 00 00    	js     83e <writetest1+0x17e>
  n = 0;
     756:	31 f6                	xor    %esi,%esi
     758:	eb 1d                	jmp    777 <writetest1+0xb7>
     75a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(i != 512){
     760:	3d 00 02 00 00       	cmp    $0x200,%eax
     765:	0f 85 9f 00 00 00    	jne    80a <writetest1+0x14a>
    if(((int*)buf)[0] != n){
     76b:	a1 40 87 00 00       	mov    0x8740,%eax
     770:	39 f0                	cmp    %esi,%eax
     772:	75 7f                	jne    7f3 <writetest1+0x133>
    n++;
     774:	83 c6 01             	add    $0x1,%esi
    i = read(fd, buf, 512);
     777:	83 ec 04             	sub    $0x4,%esp
     77a:	68 00 02 00 00       	push   $0x200
     77f:	68 40 87 00 00       	push   $0x8740
     784:	53                   	push   %ebx
     785:	e8 b1 31 00 00       	call   393b <read>
    if(i == 0){
     78a:	83 c4 10             	add    $0x10,%esp
     78d:	85 c0                	test   %eax,%eax
     78f:	75 cf                	jne    760 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     791:	81 fe 8b 00 00 00    	cmp    $0x8b,%esi
     797:	0f 84 86 00 00 00    	je     823 <writetest1+0x163>
  close(fd);
     79d:	83 ec 0c             	sub    $0xc,%esp
     7a0:	53                   	push   %ebx
     7a1:	e8 a5 31 00 00       	call   394b <close>
  if(unlink("big") < 0){
     7a6:	c7 04 24 33 41 00 00 	movl   $0x4133,(%esp)
     7ad:	e8 c1 31 00 00       	call   3973 <unlink>
     7b2:	83 c4 10             	add    $0x10,%esp
     7b5:	85 c0                	test   %eax,%eax
     7b7:	0f 88 af 00 00 00    	js     86c <writetest1+0x1ac>
  printf(stdout, "big files ok\n");
     7bd:	83 ec 08             	sub    $0x8,%esp
     7c0:	68 5a 41 00 00       	push   $0x415a
     7c5:	ff 35 04 60 00 00    	push   0x6004
     7cb:	e8 d0 32 00 00       	call   3aa0 <printf>
}
     7d0:	83 c4 10             	add    $0x10,%esp
     7d3:	8d 65 f8             	lea    -0x8(%ebp),%esp
     7d6:	5b                   	pop    %ebx
     7d7:	5e                   	pop    %esi
     7d8:	5d                   	pop    %ebp
     7d9:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
     7da:	83 ec 04             	sub    $0x4,%esp
     7dd:	53                   	push   %ebx
     7de:	68 e3 40 00 00       	push   $0x40e3
     7e3:	ff 35 04 60 00 00    	push   0x6004
     7e9:	e8 b2 32 00 00       	call   3aa0 <printf>
      exit();
     7ee:	e8 30 31 00 00       	call   3923 <exit>
      printf(stdout, "read content of block %d is %d\n",
     7f3:	50                   	push   %eax
     7f4:	56                   	push   %esi
     7f5:	68 34 4f 00 00       	push   $0x4f34
     7fa:	ff 35 04 60 00 00    	push   0x6004
     800:	e8 9b 32 00 00       	call   3aa0 <printf>
      exit();
     805:	e8 19 31 00 00       	call   3923 <exit>
      printf(stdout, "read failed %d\n", i);
     80a:	83 ec 04             	sub    $0x4,%esp
     80d:	50                   	push   %eax
     80e:	68 37 41 00 00       	push   $0x4137
     813:	ff 35 04 60 00 00    	push   0x6004
     819:	e8 82 32 00 00       	call   3aa0 <printf>
      exit();
     81e:	e8 00 31 00 00       	call   3923 <exit>
        printf(stdout, "read only %d blocks from big", n);
     823:	52                   	push   %edx
     824:	68 8b 00 00 00       	push   $0x8b
     829:	68 1a 41 00 00       	push   $0x411a
     82e:	ff 35 04 60 00 00    	push   0x6004
     834:	e8 67 32 00 00       	call   3aa0 <printf>
        exit();
     839:	e8 e5 30 00 00       	call   3923 <exit>
    printf(stdout, "error: open big failed!\n");
     83e:	51                   	push   %ecx
     83f:	51                   	push   %ecx
     840:	68 01 41 00 00       	push   $0x4101
     845:	ff 35 04 60 00 00    	push   0x6004
     84b:	e8 50 32 00 00       	call   3aa0 <printf>
    exit();
     850:	e8 ce 30 00 00       	call   3923 <exit>
    printf(stdout, "error: creat big failed!\n");
     855:	50                   	push   %eax
     856:	50                   	push   %eax
     857:	68 c9 40 00 00       	push   $0x40c9
     85c:	ff 35 04 60 00 00    	push   0x6004
     862:	e8 39 32 00 00       	call   3aa0 <printf>
    exit();
     867:	e8 b7 30 00 00       	call   3923 <exit>
    printf(stdout, "unlink big failed\n");
     86c:	50                   	push   %eax
     86d:	50                   	push   %eax
     86e:	68 47 41 00 00       	push   $0x4147
     873:	ff 35 04 60 00 00    	push   0x6004
     879:	e8 22 32 00 00       	call   3aa0 <printf>
    exit();
     87e:	e8 a0 30 00 00       	call   3923 <exit>
     883:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000890 <createtest>:
{
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	53                   	push   %ebx
  name[2] = '\0';
     894:	bb 30 00 00 00       	mov    $0x30,%ebx
{
     899:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "many creates, followed by unlink test\n");
     89c:	68 54 4f 00 00       	push   $0x4f54
     8a1:	ff 35 04 60 00 00    	push   0x6004
     8a7:	e8 f4 31 00 00       	call   3aa0 <printf>
  name[0] = 'a';
     8ac:	c6 05 30 87 00 00 61 	movb   $0x61,0x8730
  name[2] = '\0';
     8b3:	83 c4 10             	add    $0x10,%esp
     8b6:	c6 05 32 87 00 00 00 	movb   $0x0,0x8732
  for(i = 0; i < 52; i++){
     8bd:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open(name, O_CREATE|O_RDWR);
     8c0:	83 ec 08             	sub    $0x8,%esp
    name[1] = '0' + i;
     8c3:	88 1d 31 87 00 00    	mov    %bl,0x8731
  for(i = 0; i < 52; i++){
     8c9:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     8cc:	68 02 02 00 00       	push   $0x202
     8d1:	68 30 87 00 00       	push   $0x8730
     8d6:	e8 88 30 00 00       	call   3963 <open>
    close(fd);
     8db:	89 04 24             	mov    %eax,(%esp)
     8de:	e8 68 30 00 00       	call   394b <close>
  for(i = 0; i < 52; i++){
     8e3:	83 c4 10             	add    $0x10,%esp
     8e6:	80 fb 64             	cmp    $0x64,%bl
     8e9:	75 d5                	jne    8c0 <createtest+0x30>
  name[0] = 'a';
     8eb:	c6 05 30 87 00 00 61 	movb   $0x61,0x8730
  name[2] = '\0';
     8f2:	bb 30 00 00 00       	mov    $0x30,%ebx
     8f7:	c6 05 32 87 00 00 00 	movb   $0x0,0x8732
  for(i = 0; i < 52; i++){
     8fe:	66 90                	xchg   %ax,%ax
    unlink(name);
     900:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + i;
     903:	88 1d 31 87 00 00    	mov    %bl,0x8731
  for(i = 0; i < 52; i++){
     909:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     90c:	68 30 87 00 00       	push   $0x8730
     911:	e8 5d 30 00 00       	call   3973 <unlink>
  for(i = 0; i < 52; i++){
     916:	83 c4 10             	add    $0x10,%esp
     919:	80 fb 64             	cmp    $0x64,%bl
     91c:	75 e2                	jne    900 <createtest+0x70>
  printf(stdout, "many creates, followed by unlink; ok\n");
     91e:	83 ec 08             	sub    $0x8,%esp
     921:	68 7c 4f 00 00       	push   $0x4f7c
     926:	ff 35 04 60 00 00    	push   0x6004
     92c:	e8 6f 31 00 00       	call   3aa0 <printf>
}
     931:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     934:	83 c4 10             	add    $0x10,%esp
     937:	c9                   	leave  
     938:	c3                   	ret    
     939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000940 <dirtest>:
{
     940:	55                   	push   %ebp
     941:	89 e5                	mov    %esp,%ebp
     943:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     946:	68 68 41 00 00       	push   $0x4168
     94b:	ff 35 04 60 00 00    	push   0x6004
     951:	e8 4a 31 00 00       	call   3aa0 <printf>
  if(mkdir("dir0") < 0){
     956:	c7 04 24 74 41 00 00 	movl   $0x4174,(%esp)
     95d:	e8 29 30 00 00       	call   398b <mkdir>
     962:	83 c4 10             	add    $0x10,%esp
     965:	85 c0                	test   %eax,%eax
     967:	78 58                	js     9c1 <dirtest+0x81>
  if(chdir("dir0") < 0){
     969:	83 ec 0c             	sub    $0xc,%esp
     96c:	68 74 41 00 00       	push   $0x4174
     971:	e8 1d 30 00 00       	call   3993 <chdir>
     976:	83 c4 10             	add    $0x10,%esp
     979:	85 c0                	test   %eax,%eax
     97b:	0f 88 85 00 00 00    	js     a06 <dirtest+0xc6>
  if(chdir("..") < 0){
     981:	83 ec 0c             	sub    $0xc,%esp
     984:	68 19 47 00 00       	push   $0x4719
     989:	e8 05 30 00 00       	call   3993 <chdir>
     98e:	83 c4 10             	add    $0x10,%esp
     991:	85 c0                	test   %eax,%eax
     993:	78 5a                	js     9ef <dirtest+0xaf>
  if(unlink("dir0") < 0){
     995:	83 ec 0c             	sub    $0xc,%esp
     998:	68 74 41 00 00       	push   $0x4174
     99d:	e8 d1 2f 00 00       	call   3973 <unlink>
     9a2:	83 c4 10             	add    $0x10,%esp
     9a5:	85 c0                	test   %eax,%eax
     9a7:	78 2f                	js     9d8 <dirtest+0x98>
  printf(stdout, "mkdir test ok\n");
     9a9:	83 ec 08             	sub    $0x8,%esp
     9ac:	68 b1 41 00 00       	push   $0x41b1
     9b1:	ff 35 04 60 00 00    	push   0x6004
     9b7:	e8 e4 30 00 00       	call   3aa0 <printf>
}
     9bc:	83 c4 10             	add    $0x10,%esp
     9bf:	c9                   	leave  
     9c0:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     9c1:	50                   	push   %eax
     9c2:	50                   	push   %eax
     9c3:	68 a4 3e 00 00       	push   $0x3ea4
     9c8:	ff 35 04 60 00 00    	push   0x6004
     9ce:	e8 cd 30 00 00       	call   3aa0 <printf>
    exit();
     9d3:	e8 4b 2f 00 00       	call   3923 <exit>
    printf(stdout, "unlink dir0 failed\n");
     9d8:	50                   	push   %eax
     9d9:	50                   	push   %eax
     9da:	68 9d 41 00 00       	push   $0x419d
     9df:	ff 35 04 60 00 00    	push   0x6004
     9e5:	e8 b6 30 00 00       	call   3aa0 <printf>
    exit();
     9ea:	e8 34 2f 00 00       	call   3923 <exit>
    printf(stdout, "chdir .. failed\n");
     9ef:	52                   	push   %edx
     9f0:	52                   	push   %edx
     9f1:	68 8c 41 00 00       	push   $0x418c
     9f6:	ff 35 04 60 00 00    	push   0x6004
     9fc:	e8 9f 30 00 00       	call   3aa0 <printf>
    exit();
     a01:	e8 1d 2f 00 00       	call   3923 <exit>
    printf(stdout, "chdir dir0 failed\n");
     a06:	51                   	push   %ecx
     a07:	51                   	push   %ecx
     a08:	68 79 41 00 00       	push   $0x4179
     a0d:	ff 35 04 60 00 00    	push   0x6004
     a13:	e8 88 30 00 00       	call   3aa0 <printf>
    exit();
     a18:	e8 06 2f 00 00       	call   3923 <exit>
     a1d:	8d 76 00             	lea    0x0(%esi),%esi

00000a20 <exectest>:
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     a26:	68 c0 41 00 00       	push   $0x41c0
     a2b:	ff 35 04 60 00 00    	push   0x6004
     a31:	e8 6a 30 00 00       	call   3aa0 <printf>
  if(exec("echo", echoargv) < 0){
     a36:	5a                   	pop    %edx
     a37:	59                   	pop    %ecx
     a38:	68 08 60 00 00       	push   $0x6008
     a3d:	68 89 3f 00 00       	push   $0x3f89
     a42:	e8 14 2f 00 00       	call   395b <exec>
     a47:	83 c4 10             	add    $0x10,%esp
     a4a:	85 c0                	test   %eax,%eax
     a4c:	78 02                	js     a50 <exectest+0x30>
}
     a4e:	c9                   	leave  
     a4f:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
     a50:	50                   	push   %eax
     a51:	50                   	push   %eax
     a52:	68 cb 41 00 00       	push   $0x41cb
     a57:	ff 35 04 60 00 00    	push   0x6004
     a5d:	e8 3e 30 00 00       	call   3aa0 <printf>
    exit();
     a62:	e8 bc 2e 00 00       	call   3923 <exit>
     a67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a6e:	66 90                	xchg   %ax,%ax

00000a70 <pipe1>:
{
     a70:	55                   	push   %ebp
     a71:	89 e5                	mov    %esp,%ebp
     a73:	57                   	push   %edi
     a74:	56                   	push   %esi
  if(pipe(fds) != 0){
     a75:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
     a78:	53                   	push   %ebx
     a79:	83 ec 38             	sub    $0x38,%esp
  if(pipe(fds) != 0){
     a7c:	50                   	push   %eax
     a7d:	e8 b1 2e 00 00       	call   3933 <pipe>
     a82:	83 c4 10             	add    $0x10,%esp
     a85:	85 c0                	test   %eax,%eax
     a87:	0f 85 34 01 00 00    	jne    bc1 <pipe1+0x151>
  pid = fork();
     a8d:	e8 89 2e 00 00       	call   391b <fork>
  if(pid == 0){
     a92:	85 c0                	test   %eax,%eax
     a94:	0f 84 85 00 00 00    	je     b1f <pipe1+0xaf>
  } else if(pid > 0){
     a9a:	0f 8e 34 01 00 00    	jle    bd4 <pipe1+0x164>
    close(fds[1]);
     aa0:	83 ec 0c             	sub    $0xc,%esp
     aa3:	ff 75 e4             	push   -0x1c(%ebp)
  seq = 0;
     aa6:	31 db                	xor    %ebx,%ebx
    cc = 1;
     aa8:	be 01 00 00 00       	mov    $0x1,%esi
    close(fds[1]);
     aad:	e8 99 2e 00 00       	call   394b <close>
    total = 0;
     ab2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     ab9:	83 c4 10             	add    $0x10,%esp
     abc:	83 ec 04             	sub    $0x4,%esp
     abf:	56                   	push   %esi
     ac0:	68 40 87 00 00       	push   $0x8740
     ac5:	ff 75 e0             	push   -0x20(%ebp)
     ac8:	e8 6e 2e 00 00       	call   393b <read>
     acd:	83 c4 10             	add    $0x10,%esp
     ad0:	89 c7                	mov    %eax,%edi
     ad2:	85 c0                	test   %eax,%eax
     ad4:	0f 8e a3 00 00 00    	jle    b7d <pipe1+0x10d>
     ada:	8d 0c 1f             	lea    (%edi,%ebx,1),%ecx
      for(i = 0; i < n; i++){
     add:	31 c0                	xor    %eax,%eax
     adf:	90                   	nop
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     ae0:	89 da                	mov    %ebx,%edx
     ae2:	83 c3 01             	add    $0x1,%ebx
     ae5:	38 90 40 87 00 00    	cmp    %dl,0x8740(%eax)
     aeb:	75 18                	jne    b05 <pipe1+0x95>
      for(i = 0; i < n; i++){
     aed:	83 c0 01             	add    $0x1,%eax
     af0:	39 d9                	cmp    %ebx,%ecx
     af2:	75 ec                	jne    ae0 <pipe1+0x70>
      cc = cc * 2;
     af4:	01 f6                	add    %esi,%esi
     af6:	b8 00 20 00 00       	mov    $0x2000,%eax
      total += n;
     afb:	01 7d d4             	add    %edi,-0x2c(%ebp)
     afe:	39 c6                	cmp    %eax,%esi
     b00:	0f 4f f0             	cmovg  %eax,%esi
     b03:	eb b7                	jmp    abc <pipe1+0x4c>
          printf(1, "pipe1 oops 2\n");
     b05:	83 ec 08             	sub    $0x8,%esp
     b08:	68 fa 41 00 00       	push   $0x41fa
     b0d:	6a 01                	push   $0x1
     b0f:	e8 8c 2f 00 00       	call   3aa0 <printf>
     b14:	83 c4 10             	add    $0x10,%esp
}
     b17:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b1a:	5b                   	pop    %ebx
     b1b:	5e                   	pop    %esi
     b1c:	5f                   	pop    %edi
     b1d:	5d                   	pop    %ebp
     b1e:	c3                   	ret    
    close(fds[0]);
     b1f:	83 ec 0c             	sub    $0xc,%esp
     b22:	ff 75 e0             	push   -0x20(%ebp)
  seq = 0;
     b25:	31 db                	xor    %ebx,%ebx
    close(fds[0]);
     b27:	e8 1f 2e 00 00       	call   394b <close>
     b2c:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 1033; i++)
     b2f:	31 c0                	xor    %eax,%eax
     b31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        buf[i] = seq++;
     b38:	8d 14 18             	lea    (%eax,%ebx,1),%edx
      for(i = 0; i < 1033; i++)
     b3b:	83 c0 01             	add    $0x1,%eax
        buf[i] = seq++;
     b3e:	88 90 3f 87 00 00    	mov    %dl,0x873f(%eax)
      for(i = 0; i < 1033; i++)
     b44:	3d 09 04 00 00       	cmp    $0x409,%eax
     b49:	75 ed                	jne    b38 <pipe1+0xc8>
      if(write(fds[1], buf, 1033) != 1033){
     b4b:	83 ec 04             	sub    $0x4,%esp
        buf[i] = seq++;
     b4e:	81 c3 09 04 00 00    	add    $0x409,%ebx
      if(write(fds[1], buf, 1033) != 1033){
     b54:	68 09 04 00 00       	push   $0x409
     b59:	68 40 87 00 00       	push   $0x8740
     b5e:	ff 75 e4             	push   -0x1c(%ebp)
     b61:	e8 dd 2d 00 00       	call   3943 <write>
     b66:	83 c4 10             	add    $0x10,%esp
     b69:	3d 09 04 00 00       	cmp    $0x409,%eax
     b6e:	75 77                	jne    be7 <pipe1+0x177>
    for(n = 0; n < 5; n++){
     b70:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b76:	75 b7                	jne    b2f <pipe1+0xbf>
    exit();
     b78:	e8 a6 2d 00 00       	call   3923 <exit>
    if(total != 5 * 1033){
     b7d:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b84:	75 26                	jne    bac <pipe1+0x13c>
    close(fds[0]);
     b86:	83 ec 0c             	sub    $0xc,%esp
     b89:	ff 75 e0             	push   -0x20(%ebp)
     b8c:	e8 ba 2d 00 00       	call   394b <close>
    wait();
     b91:	e8 95 2d 00 00       	call   392b <wait>
  printf(1, "pipe1 ok\n");
     b96:	5a                   	pop    %edx
     b97:	59                   	pop    %ecx
     b98:	68 1f 42 00 00       	push   $0x421f
     b9d:	6a 01                	push   $0x1
     b9f:	e8 fc 2e 00 00       	call   3aa0 <printf>
     ba4:	83 c4 10             	add    $0x10,%esp
     ba7:	e9 6b ff ff ff       	jmp    b17 <pipe1+0xa7>
      printf(1, "pipe1 oops 3 total %d\n", total);
     bac:	53                   	push   %ebx
     bad:	ff 75 d4             	push   -0x2c(%ebp)
     bb0:	68 08 42 00 00       	push   $0x4208
     bb5:	6a 01                	push   $0x1
     bb7:	e8 e4 2e 00 00       	call   3aa0 <printf>
      exit();
     bbc:	e8 62 2d 00 00       	call   3923 <exit>
    printf(1, "pipe() failed\n");
     bc1:	57                   	push   %edi
     bc2:	57                   	push   %edi
     bc3:	68 dd 41 00 00       	push   $0x41dd
     bc8:	6a 01                	push   $0x1
     bca:	e8 d1 2e 00 00       	call   3aa0 <printf>
    exit();
     bcf:	e8 4f 2d 00 00       	call   3923 <exit>
    printf(1, "fork() failed\n");
     bd4:	50                   	push   %eax
     bd5:	50                   	push   %eax
     bd6:	68 29 42 00 00       	push   $0x4229
     bdb:	6a 01                	push   $0x1
     bdd:	e8 be 2e 00 00       	call   3aa0 <printf>
    exit();
     be2:	e8 3c 2d 00 00       	call   3923 <exit>
        printf(1, "pipe1 oops 1\n");
     be7:	56                   	push   %esi
     be8:	56                   	push   %esi
     be9:	68 ec 41 00 00       	push   $0x41ec
     bee:	6a 01                	push   $0x1
     bf0:	e8 ab 2e 00 00       	call   3aa0 <printf>
        exit();
     bf5:	e8 29 2d 00 00       	call   3923 <exit>
     bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c00 <preempt>:
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	57                   	push   %edi
     c04:	56                   	push   %esi
     c05:	53                   	push   %ebx
     c06:	83 ec 24             	sub    $0x24,%esp
  printf(1, "preempt: ");
     c09:	68 38 42 00 00       	push   $0x4238
     c0e:	6a 01                	push   $0x1
     c10:	e8 8b 2e 00 00       	call   3aa0 <printf>
  pid1 = fork();
     c15:	e8 01 2d 00 00       	call   391b <fork>
  if(pid1 == 0)
     c1a:	83 c4 10             	add    $0x10,%esp
     c1d:	85 c0                	test   %eax,%eax
     c1f:	75 07                	jne    c28 <preempt+0x28>
    for(;;)
     c21:	eb fe                	jmp    c21 <preempt+0x21>
     c23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c27:	90                   	nop
     c28:	89 c3                	mov    %eax,%ebx
  pid2 = fork();
     c2a:	e8 ec 2c 00 00       	call   391b <fork>
     c2f:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     c31:	85 c0                	test   %eax,%eax
     c33:	75 0b                	jne    c40 <preempt+0x40>
    for(;;)
     c35:	eb fe                	jmp    c35 <preempt+0x35>
     c37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c3e:	66 90                	xchg   %ax,%ax
  pipe(pfds);
     c40:	83 ec 0c             	sub    $0xc,%esp
     c43:	8d 45 e0             	lea    -0x20(%ebp),%eax
     c46:	50                   	push   %eax
     c47:	e8 e7 2c 00 00       	call   3933 <pipe>
  pid3 = fork();
     c4c:	e8 ca 2c 00 00       	call   391b <fork>
  if(pid3 == 0){
     c51:	83 c4 10             	add    $0x10,%esp
  pid3 = fork();
     c54:	89 c7                	mov    %eax,%edi
  if(pid3 == 0){
     c56:	85 c0                	test   %eax,%eax
     c58:	75 3e                	jne    c98 <preempt+0x98>
    close(pfds[0]);
     c5a:	83 ec 0c             	sub    $0xc,%esp
     c5d:	ff 75 e0             	push   -0x20(%ebp)
     c60:	e8 e6 2c 00 00       	call   394b <close>
    if(write(pfds[1], "x", 1) != 1)
     c65:	83 c4 0c             	add    $0xc,%esp
     c68:	6a 01                	push   $0x1
     c6a:	68 fd 47 00 00       	push   $0x47fd
     c6f:	ff 75 e4             	push   -0x1c(%ebp)
     c72:	e8 cc 2c 00 00       	call   3943 <write>
     c77:	83 c4 10             	add    $0x10,%esp
     c7a:	83 f8 01             	cmp    $0x1,%eax
     c7d:	0f 85 b8 00 00 00    	jne    d3b <preempt+0x13b>
    close(pfds[1]);
     c83:	83 ec 0c             	sub    $0xc,%esp
     c86:	ff 75 e4             	push   -0x1c(%ebp)
     c89:	e8 bd 2c 00 00       	call   394b <close>
     c8e:	83 c4 10             	add    $0x10,%esp
    for(;;)
     c91:	eb fe                	jmp    c91 <preempt+0x91>
     c93:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c97:	90                   	nop
  close(pfds[1]);
     c98:	83 ec 0c             	sub    $0xc,%esp
     c9b:	ff 75 e4             	push   -0x1c(%ebp)
     c9e:	e8 a8 2c 00 00       	call   394b <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     ca3:	83 c4 0c             	add    $0xc,%esp
     ca6:	68 00 20 00 00       	push   $0x2000
     cab:	68 40 87 00 00       	push   $0x8740
     cb0:	ff 75 e0             	push   -0x20(%ebp)
     cb3:	e8 83 2c 00 00       	call   393b <read>
     cb8:	83 c4 10             	add    $0x10,%esp
     cbb:	83 f8 01             	cmp    $0x1,%eax
     cbe:	75 67                	jne    d27 <preempt+0x127>
  close(pfds[0]);
     cc0:	83 ec 0c             	sub    $0xc,%esp
     cc3:	ff 75 e0             	push   -0x20(%ebp)
     cc6:	e8 80 2c 00 00       	call   394b <close>
  printf(1, "kill... ");
     ccb:	58                   	pop    %eax
     ccc:	5a                   	pop    %edx
     ccd:	68 69 42 00 00       	push   $0x4269
     cd2:	6a 01                	push   $0x1
     cd4:	e8 c7 2d 00 00       	call   3aa0 <printf>
  kill(pid1);
     cd9:	89 1c 24             	mov    %ebx,(%esp)
     cdc:	e8 72 2c 00 00       	call   3953 <kill>
  kill(pid2);
     ce1:	89 34 24             	mov    %esi,(%esp)
     ce4:	e8 6a 2c 00 00       	call   3953 <kill>
  kill(pid3);
     ce9:	89 3c 24             	mov    %edi,(%esp)
     cec:	e8 62 2c 00 00       	call   3953 <kill>
  printf(1, "wait... ");
     cf1:	59                   	pop    %ecx
     cf2:	5b                   	pop    %ebx
     cf3:	68 72 42 00 00       	push   $0x4272
     cf8:	6a 01                	push   $0x1
     cfa:	e8 a1 2d 00 00       	call   3aa0 <printf>
  wait();
     cff:	e8 27 2c 00 00       	call   392b <wait>
  wait();
     d04:	e8 22 2c 00 00       	call   392b <wait>
  wait();
     d09:	e8 1d 2c 00 00       	call   392b <wait>
  printf(1, "preempt ok\n");
     d0e:	5e                   	pop    %esi
     d0f:	5f                   	pop    %edi
     d10:	68 7b 42 00 00       	push   $0x427b
     d15:	6a 01                	push   $0x1
     d17:	e8 84 2d 00 00       	call   3aa0 <printf>
     d1c:	83 c4 10             	add    $0x10,%esp
}
     d1f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d22:	5b                   	pop    %ebx
     d23:	5e                   	pop    %esi
     d24:	5f                   	pop    %edi
     d25:	5d                   	pop    %ebp
     d26:	c3                   	ret    
    printf(1, "preempt read error");
     d27:	83 ec 08             	sub    $0x8,%esp
     d2a:	68 56 42 00 00       	push   $0x4256
     d2f:	6a 01                	push   $0x1
     d31:	e8 6a 2d 00 00       	call   3aa0 <printf>
     d36:	83 c4 10             	add    $0x10,%esp
     d39:	eb e4                	jmp    d1f <preempt+0x11f>
      printf(1, "preempt write error");
     d3b:	83 ec 08             	sub    $0x8,%esp
     d3e:	68 42 42 00 00       	push   $0x4242
     d43:	6a 01                	push   $0x1
     d45:	e8 56 2d 00 00       	call   3aa0 <printf>
     d4a:	83 c4 10             	add    $0x10,%esp
     d4d:	e9 31 ff ff ff       	jmp    c83 <preempt+0x83>
     d52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d60 <exitwait>:
{
     d60:	55                   	push   %ebp
     d61:	89 e5                	mov    %esp,%ebp
     d63:	56                   	push   %esi
     d64:	be 64 00 00 00       	mov    $0x64,%esi
     d69:	53                   	push   %ebx
     d6a:	eb 14                	jmp    d80 <exitwait+0x20>
     d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid){
     d70:	74 68                	je     dda <exitwait+0x7a>
      if(wait() != pid){
     d72:	e8 b4 2b 00 00       	call   392b <wait>
     d77:	39 d8                	cmp    %ebx,%eax
     d79:	75 2d                	jne    da8 <exitwait+0x48>
  for(i = 0; i < 100; i++){
     d7b:	83 ee 01             	sub    $0x1,%esi
     d7e:	74 41                	je     dc1 <exitwait+0x61>
    pid = fork();
     d80:	e8 96 2b 00 00       	call   391b <fork>
     d85:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d87:	85 c0                	test   %eax,%eax
     d89:	79 e5                	jns    d70 <exitwait+0x10>
      printf(1, "fork failed\n");
     d8b:	83 ec 08             	sub    $0x8,%esp
     d8e:	68 e5 4d 00 00       	push   $0x4de5
     d93:	6a 01                	push   $0x1
     d95:	e8 06 2d 00 00       	call   3aa0 <printf>
      return;
     d9a:	83 c4 10             	add    $0x10,%esp
}
     d9d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     da0:	5b                   	pop    %ebx
     da1:	5e                   	pop    %esi
     da2:	5d                   	pop    %ebp
     da3:	c3                   	ret    
     da4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "wait wrong pid\n");
     da8:	83 ec 08             	sub    $0x8,%esp
     dab:	68 87 42 00 00       	push   $0x4287
     db0:	6a 01                	push   $0x1
     db2:	e8 e9 2c 00 00       	call   3aa0 <printf>
        return;
     db7:	83 c4 10             	add    $0x10,%esp
}
     dba:	8d 65 f8             	lea    -0x8(%ebp),%esp
     dbd:	5b                   	pop    %ebx
     dbe:	5e                   	pop    %esi
     dbf:	5d                   	pop    %ebp
     dc0:	c3                   	ret    
  printf(1, "exitwait ok\n");
     dc1:	83 ec 08             	sub    $0x8,%esp
     dc4:	68 97 42 00 00       	push   $0x4297
     dc9:	6a 01                	push   $0x1
     dcb:	e8 d0 2c 00 00       	call   3aa0 <printf>
     dd0:	83 c4 10             	add    $0x10,%esp
}
     dd3:	8d 65 f8             	lea    -0x8(%ebp),%esp
     dd6:	5b                   	pop    %ebx
     dd7:	5e                   	pop    %esi
     dd8:	5d                   	pop    %ebp
     dd9:	c3                   	ret    
      exit();
     dda:	e8 44 2b 00 00       	call   3923 <exit>
     ddf:	90                   	nop

00000de0 <mem>:
{
     de0:	55                   	push   %ebp
     de1:	89 e5                	mov    %esp,%ebp
     de3:	56                   	push   %esi
     de4:	31 f6                	xor    %esi,%esi
     de6:	53                   	push   %ebx
  printf(1, "mem test\n");
     de7:	83 ec 08             	sub    $0x8,%esp
     dea:	68 a4 42 00 00       	push   $0x42a4
     def:	6a 01                	push   $0x1
     df1:	e8 aa 2c 00 00       	call   3aa0 <printf>
  ppid = getpid();
     df6:	e8 a8 2b 00 00       	call   39a3 <getpid>
     dfb:	89 c3                	mov    %eax,%ebx
  if((pid = fork()) == 0){
     dfd:	e8 19 2b 00 00       	call   391b <fork>
     e02:	83 c4 10             	add    $0x10,%esp
     e05:	85 c0                	test   %eax,%eax
     e07:	74 0b                	je     e14 <mem+0x34>
     e09:	e9 8a 00 00 00       	jmp    e98 <mem+0xb8>
     e0e:	66 90                	xchg   %ax,%ax
      *(char**)m2 = m1;
     e10:	89 30                	mov    %esi,(%eax)
     e12:	89 c6                	mov    %eax,%esi
    while((m2 = malloc(10001)) != 0){
     e14:	83 ec 0c             	sub    $0xc,%esp
     e17:	68 11 27 00 00       	push   $0x2711
     e1c:	e8 1f 30 00 00       	call   3e40 <malloc>
     e21:	83 c4 10             	add    $0x10,%esp
     e24:	85 c0                	test   %eax,%eax
     e26:	75 e8                	jne    e10 <mem+0x30>
    while(m1){
     e28:	85 f6                	test   %esi,%esi
     e2a:	74 18                	je     e44 <mem+0x64>
     e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     e30:	89 f0                	mov    %esi,%eax
      free(m1);
     e32:	83 ec 0c             	sub    $0xc,%esp
      m2 = *(char**)m1;
     e35:	8b 36                	mov    (%esi),%esi
      free(m1);
     e37:	50                   	push   %eax
     e38:	e8 53 30 00 00       	call   3e90 <free>
    while(m1){
     e3d:	83 c4 10             	add    $0x10,%esp
     e40:	85 f6                	test   %esi,%esi
     e42:	75 ec                	jne    e30 <mem+0x50>
    m1 = malloc(1024*20);
     e44:	83 ec 0c             	sub    $0xc,%esp
     e47:	68 00 50 00 00       	push   $0x5000
     e4c:	e8 ef 2f 00 00       	call   3e40 <malloc>
    if(m1 == 0){
     e51:	83 c4 10             	add    $0x10,%esp
     e54:	85 c0                	test   %eax,%eax
     e56:	74 20                	je     e78 <mem+0x98>
    free(m1);
     e58:	83 ec 0c             	sub    $0xc,%esp
     e5b:	50                   	push   %eax
     e5c:	e8 2f 30 00 00       	call   3e90 <free>
    printf(1, "mem ok\n");
     e61:	58                   	pop    %eax
     e62:	5a                   	pop    %edx
     e63:	68 c8 42 00 00       	push   $0x42c8
     e68:	6a 01                	push   $0x1
     e6a:	e8 31 2c 00 00       	call   3aa0 <printf>
    exit();
     e6f:	e8 af 2a 00 00       	call   3923 <exit>
     e74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "couldn't allocate mem?!!\n");
     e78:	83 ec 08             	sub    $0x8,%esp
     e7b:	68 ae 42 00 00       	push   $0x42ae
     e80:	6a 01                	push   $0x1
     e82:	e8 19 2c 00 00       	call   3aa0 <printf>
      kill(ppid);
     e87:	89 1c 24             	mov    %ebx,(%esp)
     e8a:	e8 c4 2a 00 00       	call   3953 <kill>
      exit();
     e8f:	e8 8f 2a 00 00       	call   3923 <exit>
     e94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
     e98:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e9b:	5b                   	pop    %ebx
     e9c:	5e                   	pop    %esi
     e9d:	5d                   	pop    %ebp
    wait();
     e9e:	e9 88 2a 00 00       	jmp    392b <wait>
     ea3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     eaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000eb0 <sharedfd>:
{
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	57                   	push   %edi
     eb4:	56                   	push   %esi
     eb5:	53                   	push   %ebx
     eb6:	83 ec 34             	sub    $0x34,%esp
  printf(1, "sharedfd test\n");
     eb9:	68 d0 42 00 00       	push   $0x42d0
     ebe:	6a 01                	push   $0x1
     ec0:	e8 db 2b 00 00       	call   3aa0 <printf>
  unlink("sharedfd");
     ec5:	c7 04 24 df 42 00 00 	movl   $0x42df,(%esp)
     ecc:	e8 a2 2a 00 00       	call   3973 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     ed1:	5b                   	pop    %ebx
     ed2:	5e                   	pop    %esi
     ed3:	68 02 02 00 00       	push   $0x202
     ed8:	68 df 42 00 00       	push   $0x42df
     edd:	e8 81 2a 00 00       	call   3963 <open>
  if(fd < 0){
     ee2:	83 c4 10             	add    $0x10,%esp
     ee5:	85 c0                	test   %eax,%eax
     ee7:	0f 88 2a 01 00 00    	js     1017 <sharedfd+0x167>
     eed:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     eef:	8d 75 de             	lea    -0x22(%ebp),%esi
     ef2:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  pid = fork();
     ef7:	e8 1f 2a 00 00       	call   391b <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     efc:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
     eff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     f02:	19 c0                	sbb    %eax,%eax
     f04:	83 ec 04             	sub    $0x4,%esp
     f07:	83 e0 f3             	and    $0xfffffff3,%eax
     f0a:	6a 0a                	push   $0xa
     f0c:	83 c0 70             	add    $0x70,%eax
     f0f:	50                   	push   %eax
     f10:	56                   	push   %esi
     f11:	e8 7a 28 00 00       	call   3790 <memset>
     f16:	83 c4 10             	add    $0x10,%esp
     f19:	eb 0a                	jmp    f25 <sharedfd+0x75>
     f1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f1f:	90                   	nop
  for(i = 0; i < 1000; i++){
     f20:	83 eb 01             	sub    $0x1,%ebx
     f23:	74 26                	je     f4b <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     f25:	83 ec 04             	sub    $0x4,%esp
     f28:	6a 0a                	push   $0xa
     f2a:	56                   	push   %esi
     f2b:	57                   	push   %edi
     f2c:	e8 12 2a 00 00       	call   3943 <write>
     f31:	83 c4 10             	add    $0x10,%esp
     f34:	83 f8 0a             	cmp    $0xa,%eax
     f37:	74 e7                	je     f20 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     f39:	83 ec 08             	sub    $0x8,%esp
     f3c:	68 d0 4f 00 00       	push   $0x4fd0
     f41:	6a 01                	push   $0x1
     f43:	e8 58 2b 00 00       	call   3aa0 <printf>
      break;
     f48:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
     f4b:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     f4e:	85 c9                	test   %ecx,%ecx
     f50:	0f 84 f5 00 00 00    	je     104b <sharedfd+0x19b>
    wait();
     f56:	e8 d0 29 00 00       	call   392b <wait>
  close(fd);
     f5b:	83 ec 0c             	sub    $0xc,%esp
  nc = np = 0;
     f5e:	31 db                	xor    %ebx,%ebx
  close(fd);
     f60:	57                   	push   %edi
     f61:	8d 7d e8             	lea    -0x18(%ebp),%edi
     f64:	e8 e2 29 00 00       	call   394b <close>
  fd = open("sharedfd", 0);
     f69:	58                   	pop    %eax
     f6a:	5a                   	pop    %edx
     f6b:	6a 00                	push   $0x0
     f6d:	68 df 42 00 00       	push   $0x42df
     f72:	e8 ec 29 00 00       	call   3963 <open>
  if(fd < 0){
     f77:	83 c4 10             	add    $0x10,%esp
  nc = np = 0;
     f7a:	31 d2                	xor    %edx,%edx
  fd = open("sharedfd", 0);
     f7c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     f7f:	85 c0                	test   %eax,%eax
     f81:	0f 88 aa 00 00 00    	js     1031 <sharedfd+0x181>
     f87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f8e:	66 90                	xchg   %ax,%ax
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f90:	83 ec 04             	sub    $0x4,%esp
     f93:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f96:	6a 0a                	push   $0xa
     f98:	56                   	push   %esi
     f99:	ff 75 d0             	push   -0x30(%ebp)
     f9c:	e8 9a 29 00 00       	call   393b <read>
     fa1:	83 c4 10             	add    $0x10,%esp
     fa4:	85 c0                	test   %eax,%eax
     fa6:	7e 28                	jle    fd0 <sharedfd+0x120>
     fa8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     fab:	89 f0                	mov    %esi,%eax
     fad:	eb 13                	jmp    fc2 <sharedfd+0x112>
     faf:	90                   	nop
        np++;
     fb0:	80 f9 70             	cmp    $0x70,%cl
     fb3:	0f 94 c1             	sete   %cl
     fb6:	0f b6 c9             	movzbl %cl,%ecx
     fb9:	01 cb                	add    %ecx,%ebx
    for(i = 0; i < sizeof(buf); i++){
     fbb:	83 c0 01             	add    $0x1,%eax
     fbe:	39 f8                	cmp    %edi,%eax
     fc0:	74 ce                	je     f90 <sharedfd+0xe0>
      if(buf[i] == 'c')
     fc2:	0f b6 08             	movzbl (%eax),%ecx
     fc5:	80 f9 63             	cmp    $0x63,%cl
     fc8:	75 e6                	jne    fb0 <sharedfd+0x100>
        nc++;
     fca:	83 c2 01             	add    $0x1,%edx
      if(buf[i] == 'p')
     fcd:	eb ec                	jmp    fbb <sharedfd+0x10b>
     fcf:	90                   	nop
  close(fd);
     fd0:	83 ec 0c             	sub    $0xc,%esp
     fd3:	ff 75 d0             	push   -0x30(%ebp)
     fd6:	e8 70 29 00 00       	call   394b <close>
  unlink("sharedfd");
     fdb:	c7 04 24 df 42 00 00 	movl   $0x42df,(%esp)
     fe2:	e8 8c 29 00 00       	call   3973 <unlink>
  if(nc == 10000 && np == 10000){
     fe7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     fea:	83 c4 10             	add    $0x10,%esp
     fed:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     ff3:	75 5b                	jne    1050 <sharedfd+0x1a0>
     ff5:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     ffb:	75 53                	jne    1050 <sharedfd+0x1a0>
    printf(1, "sharedfd ok\n");
     ffd:	83 ec 08             	sub    $0x8,%esp
    1000:	68 e8 42 00 00       	push   $0x42e8
    1005:	6a 01                	push   $0x1
    1007:	e8 94 2a 00 00       	call   3aa0 <printf>
    100c:	83 c4 10             	add    $0x10,%esp
}
    100f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1012:	5b                   	pop    %ebx
    1013:	5e                   	pop    %esi
    1014:	5f                   	pop    %edi
    1015:	5d                   	pop    %ebp
    1016:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for writing");
    1017:	83 ec 08             	sub    $0x8,%esp
    101a:	68 a4 4f 00 00       	push   $0x4fa4
    101f:	6a 01                	push   $0x1
    1021:	e8 7a 2a 00 00       	call   3aa0 <printf>
    return;
    1026:	83 c4 10             	add    $0x10,%esp
}
    1029:	8d 65 f4             	lea    -0xc(%ebp),%esp
    102c:	5b                   	pop    %ebx
    102d:	5e                   	pop    %esi
    102e:	5f                   	pop    %edi
    102f:	5d                   	pop    %ebp
    1030:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for reading\n");
    1031:	83 ec 08             	sub    $0x8,%esp
    1034:	68 f0 4f 00 00       	push   $0x4ff0
    1039:	6a 01                	push   $0x1
    103b:	e8 60 2a 00 00       	call   3aa0 <printf>
    return;
    1040:	83 c4 10             	add    $0x10,%esp
}
    1043:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1046:	5b                   	pop    %ebx
    1047:	5e                   	pop    %esi
    1048:	5f                   	pop    %edi
    1049:	5d                   	pop    %ebp
    104a:	c3                   	ret    
    exit();
    104b:	e8 d3 28 00 00       	call   3923 <exit>
    printf(1, "sharedfd oops %d %d\n", nc, np);
    1050:	53                   	push   %ebx
    1051:	52                   	push   %edx
    1052:	68 f5 42 00 00       	push   $0x42f5
    1057:	6a 01                	push   $0x1
    1059:	e8 42 2a 00 00       	call   3aa0 <printf>
    exit();
    105e:	e8 c0 28 00 00       	call   3923 <exit>
    1063:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    106a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001070 <fourfiles>:
{
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	57                   	push   %edi
    1074:	56                   	push   %esi
  printf(1, "fourfiles test\n");
    1075:	be 0a 43 00 00       	mov    $0x430a,%esi
{
    107a:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    107b:	31 db                	xor    %ebx,%ebx
{
    107d:	83 ec 34             	sub    $0x34,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
    1080:	c7 45 d8 0a 43 00 00 	movl   $0x430a,-0x28(%ebp)
  printf(1, "fourfiles test\n");
    1087:	68 10 43 00 00       	push   $0x4310
    108c:	6a 01                	push   $0x1
  char *names[] = { "f0", "f1", "f2", "f3" };
    108e:	c7 45 dc 53 44 00 00 	movl   $0x4453,-0x24(%ebp)
    1095:	c7 45 e0 57 44 00 00 	movl   $0x4457,-0x20(%ebp)
    109c:	c7 45 e4 0d 43 00 00 	movl   $0x430d,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
    10a3:	e8 f8 29 00 00       	call   3aa0 <printf>
    10a8:	83 c4 10             	add    $0x10,%esp
    unlink(fname);
    10ab:	83 ec 0c             	sub    $0xc,%esp
    10ae:	56                   	push   %esi
    10af:	e8 bf 28 00 00       	call   3973 <unlink>
    pid = fork();
    10b4:	e8 62 28 00 00       	call   391b <fork>
    if(pid < 0){
    10b9:	83 c4 10             	add    $0x10,%esp
    10bc:	85 c0                	test   %eax,%eax
    10be:	0f 88 64 01 00 00    	js     1228 <fourfiles+0x1b8>
    if(pid == 0){
    10c4:	0f 84 e9 00 00 00    	je     11b3 <fourfiles+0x143>
  for(pi = 0; pi < 4; pi++){
    10ca:	83 c3 01             	add    $0x1,%ebx
    10cd:	83 fb 04             	cmp    $0x4,%ebx
    10d0:	74 06                	je     10d8 <fourfiles+0x68>
    fname = names[pi];
    10d2:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    10d6:	eb d3                	jmp    10ab <fourfiles+0x3b>
    wait();
    10d8:	e8 4e 28 00 00       	call   392b <wait>
  for(i = 0; i < 2; i++){
    10dd:	31 f6                	xor    %esi,%esi
    wait();
    10df:	e8 47 28 00 00       	call   392b <wait>
    10e4:	e8 42 28 00 00       	call   392b <wait>
    10e9:	e8 3d 28 00 00       	call   392b <wait>
    fname = names[i];
    10ee:	8b 44 b5 d8          	mov    -0x28(%ebp,%esi,4),%eax
    fd = open(fname, 0);
    10f2:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    10f5:	31 db                	xor    %ebx,%ebx
    fd = open(fname, 0);
    10f7:	6a 00                	push   $0x0
    10f9:	50                   	push   %eax
    fname = names[i];
    10fa:	89 45 d0             	mov    %eax,-0x30(%ebp)
    fd = open(fname, 0);
    10fd:	e8 61 28 00 00       	call   3963 <open>
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1102:	83 c4 10             	add    $0x10,%esp
    fd = open(fname, 0);
    1105:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1108:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    110f:	90                   	nop
    1110:	83 ec 04             	sub    $0x4,%esp
    1113:	68 00 20 00 00       	push   $0x2000
    1118:	68 40 87 00 00       	push   $0x8740
    111d:	ff 75 d4             	push   -0x2c(%ebp)
    1120:	e8 16 28 00 00       	call   393b <read>
    1125:	83 c4 10             	add    $0x10,%esp
    1128:	89 c7                	mov    %eax,%edi
    112a:	85 c0                	test   %eax,%eax
    112c:	7e 20                	jle    114e <fourfiles+0xde>
      for(j = 0; j < n; j++){
    112e:	31 c0                	xor    %eax,%eax
        if(buf[j] != '0'+i){
    1130:	83 fe 01             	cmp    $0x1,%esi
    1133:	0f be 88 40 87 00 00 	movsbl 0x8740(%eax),%ecx
    113a:	19 d2                	sbb    %edx,%edx
    113c:	83 c2 31             	add    $0x31,%edx
    113f:	39 d1                	cmp    %edx,%ecx
    1141:	75 5c                	jne    119f <fourfiles+0x12f>
      for(j = 0; j < n; j++){
    1143:	83 c0 01             	add    $0x1,%eax
    1146:	39 c7                	cmp    %eax,%edi
    1148:	75 e6                	jne    1130 <fourfiles+0xc0>
      total += n;
    114a:	01 fb                	add    %edi,%ebx
    114c:	eb c2                	jmp    1110 <fourfiles+0xa0>
    close(fd);
    114e:	83 ec 0c             	sub    $0xc,%esp
    1151:	ff 75 d4             	push   -0x2c(%ebp)
    1154:	e8 f2 27 00 00       	call   394b <close>
    if(total != 12*500){
    1159:	83 c4 10             	add    $0x10,%esp
    115c:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1162:	0f 85 d4 00 00 00    	jne    123c <fourfiles+0x1cc>
    unlink(fname);
    1168:	83 ec 0c             	sub    $0xc,%esp
    116b:	ff 75 d0             	push   -0x30(%ebp)
    116e:	e8 00 28 00 00       	call   3973 <unlink>
  for(i = 0; i < 2; i++){
    1173:	83 c4 10             	add    $0x10,%esp
    1176:	83 fe 01             	cmp    $0x1,%esi
    1179:	75 1a                	jne    1195 <fourfiles+0x125>
  printf(1, "fourfiles ok\n");
    117b:	83 ec 08             	sub    $0x8,%esp
    117e:	68 4e 43 00 00       	push   $0x434e
    1183:	6a 01                	push   $0x1
    1185:	e8 16 29 00 00       	call   3aa0 <printf>
}
    118a:	83 c4 10             	add    $0x10,%esp
    118d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1190:	5b                   	pop    %ebx
    1191:	5e                   	pop    %esi
    1192:	5f                   	pop    %edi
    1193:	5d                   	pop    %ebp
    1194:	c3                   	ret    
    1195:	be 01 00 00 00       	mov    $0x1,%esi
    119a:	e9 4f ff ff ff       	jmp    10ee <fourfiles+0x7e>
          printf(1, "wrong char\n");
    119f:	83 ec 08             	sub    $0x8,%esp
    11a2:	68 31 43 00 00       	push   $0x4331
    11a7:	6a 01                	push   $0x1
    11a9:	e8 f2 28 00 00       	call   3aa0 <printf>
          exit();
    11ae:	e8 70 27 00 00       	call   3923 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    11b3:	83 ec 08             	sub    $0x8,%esp
    11b6:	68 02 02 00 00       	push   $0x202
    11bb:	56                   	push   %esi
    11bc:	e8 a2 27 00 00       	call   3963 <open>
      if(fd < 0){
    11c1:	83 c4 10             	add    $0x10,%esp
      fd = open(fname, O_CREATE | O_RDWR);
    11c4:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    11c6:	85 c0                	test   %eax,%eax
    11c8:	78 45                	js     120f <fourfiles+0x19f>
      memset(buf, '0'+pi, 512);
    11ca:	83 ec 04             	sub    $0x4,%esp
    11cd:	83 c3 30             	add    $0x30,%ebx
    11d0:	68 00 02 00 00       	push   $0x200
    11d5:	53                   	push   %ebx
    11d6:	bb 0c 00 00 00       	mov    $0xc,%ebx
    11db:	68 40 87 00 00       	push   $0x8740
    11e0:	e8 ab 25 00 00       	call   3790 <memset>
    11e5:	83 c4 10             	add    $0x10,%esp
        if((n = write(fd, buf, 500)) != 500){
    11e8:	83 ec 04             	sub    $0x4,%esp
    11eb:	68 f4 01 00 00       	push   $0x1f4
    11f0:	68 40 87 00 00       	push   $0x8740
    11f5:	56                   	push   %esi
    11f6:	e8 48 27 00 00       	call   3943 <write>
    11fb:	83 c4 10             	add    $0x10,%esp
    11fe:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    1203:	75 4a                	jne    124f <fourfiles+0x1df>
      for(i = 0; i < 12; i++){
    1205:	83 eb 01             	sub    $0x1,%ebx
    1208:	75 de                	jne    11e8 <fourfiles+0x178>
      exit();
    120a:	e8 14 27 00 00       	call   3923 <exit>
        printf(1, "create failed\n");
    120f:	51                   	push   %ecx
    1210:	51                   	push   %ecx
    1211:	68 ab 45 00 00       	push   $0x45ab
    1216:	6a 01                	push   $0x1
    1218:	e8 83 28 00 00       	call   3aa0 <printf>
        exit();
    121d:	e8 01 27 00 00       	call   3923 <exit>
    1222:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "fork failed\n");
    1228:	83 ec 08             	sub    $0x8,%esp
    122b:	68 e5 4d 00 00       	push   $0x4de5
    1230:	6a 01                	push   $0x1
    1232:	e8 69 28 00 00       	call   3aa0 <printf>
      exit();
    1237:	e8 e7 26 00 00       	call   3923 <exit>
      printf(1, "wrong length %d\n", total);
    123c:	50                   	push   %eax
    123d:	53                   	push   %ebx
    123e:	68 3d 43 00 00       	push   $0x433d
    1243:	6a 01                	push   $0x1
    1245:	e8 56 28 00 00       	call   3aa0 <printf>
      exit();
    124a:	e8 d4 26 00 00       	call   3923 <exit>
          printf(1, "write failed %d\n", n);
    124f:	52                   	push   %edx
    1250:	50                   	push   %eax
    1251:	68 20 43 00 00       	push   $0x4320
    1256:	6a 01                	push   $0x1
    1258:	e8 43 28 00 00       	call   3aa0 <printf>
          exit();
    125d:	e8 c1 26 00 00       	call   3923 <exit>
    1262:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001270 <createdelete>:
{
    1270:	55                   	push   %ebp
    1271:	89 e5                	mov    %esp,%ebp
    1273:	57                   	push   %edi
    1274:	56                   	push   %esi
    1275:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    1276:	31 db                	xor    %ebx,%ebx
{
    1278:	83 ec 44             	sub    $0x44,%esp
  printf(1, "createdelete test\n");
    127b:	68 5c 43 00 00       	push   $0x435c
    1280:	6a 01                	push   $0x1
    1282:	e8 19 28 00 00       	call   3aa0 <printf>
    1287:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    128a:	e8 8c 26 00 00       	call   391b <fork>
    if(pid < 0){
    128f:	85 c0                	test   %eax,%eax
    1291:	0f 88 c3 01 00 00    	js     145a <createdelete+0x1ea>
    if(pid == 0){
    1297:	0f 84 13 01 00 00    	je     13b0 <createdelete+0x140>
  for(pi = 0; pi < 4; pi++){
    129d:	83 c3 01             	add    $0x1,%ebx
    12a0:	83 fb 04             	cmp    $0x4,%ebx
    12a3:	75 e5                	jne    128a <createdelete+0x1a>
    wait();
    12a5:	e8 81 26 00 00       	call   392b <wait>
  for(i = 0; i < N; i++){
    12aa:	31 f6                	xor    %esi,%esi
    12ac:	8d 7d c8             	lea    -0x38(%ebp),%edi
    wait();
    12af:	e8 77 26 00 00       	call   392b <wait>
    12b4:	e8 72 26 00 00       	call   392b <wait>
    12b9:	e8 6d 26 00 00       	call   392b <wait>
  name[0] = name[1] = name[2] = 0;
    12be:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
  for(i = 0; i < N; i++){
    12c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if((i == 0 || i >= N/2) && fd < 0){
    12c8:	85 f6                	test   %esi,%esi
    12ca:	8d 46 30             	lea    0x30(%esi),%eax
    12cd:	0f 94 c3             	sete   %bl
    12d0:	83 fe 09             	cmp    $0x9,%esi
    12d3:	88 45 c7             	mov    %al,-0x39(%ebp)
    12d6:	0f 9f c0             	setg   %al
    12d9:	09 c3                	or     %eax,%ebx
      } else if((i >= 1 && i < N/2) && fd >= 0){
    12db:	8d 46 ff             	lea    -0x1(%esi),%eax
    12de:	89 45 c0             	mov    %eax,-0x40(%ebp)
      if((i == 0 || i >= N/2) && fd < 0){
    12e1:	88 5d c6             	mov    %bl,-0x3a(%ebp)
    12e4:	bb 70 00 00 00       	mov    $0x70,%ebx
      fd = open(name, 0);
    12e9:	83 ec 08             	sub    $0x8,%esp
      name[1] = '0' + i;
    12ec:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      name[0] = 'p' + pi;
    12f0:	88 5d c8             	mov    %bl,-0x38(%ebp)
      fd = open(name, 0);
    12f3:	6a 00                	push   $0x0
    12f5:	57                   	push   %edi
      name[1] = '0' + i;
    12f6:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    12f9:	e8 65 26 00 00       	call   3963 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    12fe:	83 c4 10             	add    $0x10,%esp
    1301:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    1305:	0f 84 85 00 00 00    	je     1390 <createdelete+0x120>
    130b:	85 c0                	test   %eax,%eax
    130d:	0f 88 32 01 00 00    	js     1445 <createdelete+0x1d5>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1313:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    1317:	76 7b                	jbe    1394 <createdelete+0x124>
        close(fd);
    1319:	83 ec 0c             	sub    $0xc,%esp
    131c:	50                   	push   %eax
    131d:	e8 29 26 00 00       	call   394b <close>
    1322:	83 c4 10             	add    $0x10,%esp
    for(pi = 0; pi < 4; pi++){
    1325:	83 c3 01             	add    $0x1,%ebx
    1328:	80 fb 74             	cmp    $0x74,%bl
    132b:	75 bc                	jne    12e9 <createdelete+0x79>
  for(i = 0; i < N; i++){
    132d:	83 c6 01             	add    $0x1,%esi
    1330:	83 fe 14             	cmp    $0x14,%esi
    1333:	75 93                	jne    12c8 <createdelete+0x58>
    1335:	be 70 00 00 00       	mov    $0x70,%esi
    133a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for(pi = 0; pi < 4; pi++){
    1340:	8d 46 c0             	lea    -0x40(%esi),%eax
      name[0] = 'p' + i;
    1343:	bb 04 00 00 00       	mov    $0x4,%ebx
    1348:	88 45 c7             	mov    %al,-0x39(%ebp)
      unlink(name);
    134b:	83 ec 0c             	sub    $0xc,%esp
      name[0] = 'p' + i;
    134e:	89 f0                	mov    %esi,%eax
      unlink(name);
    1350:	57                   	push   %edi
      name[0] = 'p' + i;
    1351:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    1354:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
    1358:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    135b:	e8 13 26 00 00       	call   3973 <unlink>
    for(pi = 0; pi < 4; pi++){
    1360:	83 c4 10             	add    $0x10,%esp
    1363:	83 eb 01             	sub    $0x1,%ebx
    1366:	75 e3                	jne    134b <createdelete+0xdb>
  for(i = 0; i < N; i++){
    1368:	83 c6 01             	add    $0x1,%esi
    136b:	89 f0                	mov    %esi,%eax
    136d:	3c 84                	cmp    $0x84,%al
    136f:	75 cf                	jne    1340 <createdelete+0xd0>
  printf(1, "createdelete ok\n");
    1371:	83 ec 08             	sub    $0x8,%esp
    1374:	68 6f 43 00 00       	push   $0x436f
    1379:	6a 01                	push   $0x1
    137b:	e8 20 27 00 00       	call   3aa0 <printf>
}
    1380:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1383:	5b                   	pop    %ebx
    1384:	5e                   	pop    %esi
    1385:	5f                   	pop    %edi
    1386:	5d                   	pop    %ebp
    1387:	c3                   	ret    
    1388:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    138f:	90                   	nop
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1390:	85 c0                	test   %eax,%eax
    1392:	78 91                	js     1325 <createdelete+0xb5>
        printf(1, "oops createdelete %s did exist\n", name);
    1394:	50                   	push   %eax
    1395:	57                   	push   %edi
    1396:	68 40 50 00 00       	push   $0x5040
    139b:	6a 01                	push   $0x1
    139d:	e8 fe 26 00 00       	call   3aa0 <printf>
        exit();
    13a2:	e8 7c 25 00 00       	call   3923 <exit>
    13a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ae:	66 90                	xchg   %ax,%ax
      name[0] = 'p' + pi;
    13b0:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    13b3:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    13b7:	be 01 00 00 00       	mov    $0x1,%esi
    13bc:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[0] = 'p' + pi;
    13bf:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[2] = '\0';
    13c2:	31 db                	xor    %ebx,%ebx
    13c4:	eb 15                	jmp    13db <createdelete+0x16b>
    13c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13cd:	8d 76 00             	lea    0x0(%esi),%esi
      for(i = 0; i < N; i++){
    13d0:	83 fe 14             	cmp    $0x14,%esi
    13d3:	74 6b                	je     1440 <createdelete+0x1d0>
    13d5:	83 c3 01             	add    $0x1,%ebx
    13d8:	83 c6 01             	add    $0x1,%esi
        fd = open(name, O_CREATE | O_RDWR);
    13db:	83 ec 08             	sub    $0x8,%esp
        name[1] = '0' + i;
    13de:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    13e1:	68 02 02 00 00       	push   $0x202
    13e6:	57                   	push   %edi
        name[1] = '0' + i;
    13e7:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    13ea:	e8 74 25 00 00       	call   3963 <open>
        if(fd < 0){
    13ef:	83 c4 10             	add    $0x10,%esp
    13f2:	85 c0                	test   %eax,%eax
    13f4:	78 78                	js     146e <createdelete+0x1fe>
        close(fd);
    13f6:	83 ec 0c             	sub    $0xc,%esp
    13f9:	50                   	push   %eax
    13fa:	e8 4c 25 00 00       	call   394b <close>
        if(i > 0 && (i % 2 ) == 0){
    13ff:	83 c4 10             	add    $0x10,%esp
    1402:	85 db                	test   %ebx,%ebx
    1404:	74 cf                	je     13d5 <createdelete+0x165>
    1406:	f6 c3 01             	test   $0x1,%bl
    1409:	75 c5                	jne    13d0 <createdelete+0x160>
          if(unlink(name) < 0){
    140b:	83 ec 0c             	sub    $0xc,%esp
          name[1] = '0' + (i / 2);
    140e:	89 d8                	mov    %ebx,%eax
          if(unlink(name) < 0){
    1410:	57                   	push   %edi
          name[1] = '0' + (i / 2);
    1411:	d1 f8                	sar    %eax
    1413:	83 c0 30             	add    $0x30,%eax
    1416:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1419:	e8 55 25 00 00       	call   3973 <unlink>
    141e:	83 c4 10             	add    $0x10,%esp
    1421:	85 c0                	test   %eax,%eax
    1423:	79 ab                	jns    13d0 <createdelete+0x160>
            printf(1, "unlink failed\n");
    1425:	52                   	push   %edx
    1426:	52                   	push   %edx
    1427:	68 5d 3f 00 00       	push   $0x3f5d
    142c:	6a 01                	push   $0x1
    142e:	e8 6d 26 00 00       	call   3aa0 <printf>
            exit();
    1433:	e8 eb 24 00 00       	call   3923 <exit>
    1438:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    143f:	90                   	nop
      exit();
    1440:	e8 de 24 00 00       	call   3923 <exit>
        printf(1, "oops createdelete %s didn't exist\n", name);
    1445:	83 ec 04             	sub    $0x4,%esp
    1448:	57                   	push   %edi
    1449:	68 1c 50 00 00       	push   $0x501c
    144e:	6a 01                	push   $0x1
    1450:	e8 4b 26 00 00       	call   3aa0 <printf>
        exit();
    1455:	e8 c9 24 00 00       	call   3923 <exit>
      printf(1, "fork failed\n");
    145a:	83 ec 08             	sub    $0x8,%esp
    145d:	68 e5 4d 00 00       	push   $0x4de5
    1462:	6a 01                	push   $0x1
    1464:	e8 37 26 00 00       	call   3aa0 <printf>
      exit();
    1469:	e8 b5 24 00 00       	call   3923 <exit>
          printf(1, "create failed\n");
    146e:	83 ec 08             	sub    $0x8,%esp
    1471:	68 ab 45 00 00       	push   $0x45ab
    1476:	6a 01                	push   $0x1
    1478:	e8 23 26 00 00       	call   3aa0 <printf>
          exit();
    147d:	e8 a1 24 00 00       	call   3923 <exit>
    1482:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001490 <unlinkread>:
{
    1490:	55                   	push   %ebp
    1491:	89 e5                	mov    %esp,%ebp
    1493:	56                   	push   %esi
    1494:	53                   	push   %ebx
  printf(1, "unlinkread test\n");
    1495:	83 ec 08             	sub    $0x8,%esp
    1498:	68 80 43 00 00       	push   $0x4380
    149d:	6a 01                	push   $0x1
    149f:	e8 fc 25 00 00       	call   3aa0 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    14a4:	5b                   	pop    %ebx
    14a5:	5e                   	pop    %esi
    14a6:	68 02 02 00 00       	push   $0x202
    14ab:	68 91 43 00 00       	push   $0x4391
    14b0:	e8 ae 24 00 00       	call   3963 <open>
  if(fd < 0){
    14b5:	83 c4 10             	add    $0x10,%esp
    14b8:	85 c0                	test   %eax,%eax
    14ba:	0f 88 e6 00 00 00    	js     15a6 <unlinkread+0x116>
  write(fd, "hello", 5);
    14c0:	83 ec 04             	sub    $0x4,%esp
    14c3:	89 c3                	mov    %eax,%ebx
    14c5:	6a 05                	push   $0x5
    14c7:	68 b6 43 00 00       	push   $0x43b6
    14cc:	50                   	push   %eax
    14cd:	e8 71 24 00 00       	call   3943 <write>
  close(fd);
    14d2:	89 1c 24             	mov    %ebx,(%esp)
    14d5:	e8 71 24 00 00       	call   394b <close>
  fd = open("unlinkread", O_RDWR);
    14da:	58                   	pop    %eax
    14db:	5a                   	pop    %edx
    14dc:	6a 02                	push   $0x2
    14de:	68 91 43 00 00       	push   $0x4391
    14e3:	e8 7b 24 00 00       	call   3963 <open>
  if(fd < 0){
    14e8:	83 c4 10             	add    $0x10,%esp
  fd = open("unlinkread", O_RDWR);
    14eb:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    14ed:	85 c0                	test   %eax,%eax
    14ef:	0f 88 10 01 00 00    	js     1605 <unlinkread+0x175>
  if(unlink("unlinkread") != 0){
    14f5:	83 ec 0c             	sub    $0xc,%esp
    14f8:	68 91 43 00 00       	push   $0x4391
    14fd:	e8 71 24 00 00       	call   3973 <unlink>
    1502:	83 c4 10             	add    $0x10,%esp
    1505:	85 c0                	test   %eax,%eax
    1507:	0f 85 e5 00 00 00    	jne    15f2 <unlinkread+0x162>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    150d:	83 ec 08             	sub    $0x8,%esp
    1510:	68 02 02 00 00       	push   $0x202
    1515:	68 91 43 00 00       	push   $0x4391
    151a:	e8 44 24 00 00       	call   3963 <open>
  write(fd1, "yyy", 3);
    151f:	83 c4 0c             	add    $0xc,%esp
    1522:	6a 03                	push   $0x3
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1524:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    1526:	68 ee 43 00 00       	push   $0x43ee
    152b:	50                   	push   %eax
    152c:	e8 12 24 00 00       	call   3943 <write>
  close(fd1);
    1531:	89 34 24             	mov    %esi,(%esp)
    1534:	e8 12 24 00 00       	call   394b <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    1539:	83 c4 0c             	add    $0xc,%esp
    153c:	68 00 20 00 00       	push   $0x2000
    1541:	68 40 87 00 00       	push   $0x8740
    1546:	53                   	push   %ebx
    1547:	e8 ef 23 00 00       	call   393b <read>
    154c:	83 c4 10             	add    $0x10,%esp
    154f:	83 f8 05             	cmp    $0x5,%eax
    1552:	0f 85 87 00 00 00    	jne    15df <unlinkread+0x14f>
  if(buf[0] != 'h'){
    1558:	80 3d 40 87 00 00 68 	cmpb   $0x68,0x8740
    155f:	75 6b                	jne    15cc <unlinkread+0x13c>
  if(write(fd, buf, 10) != 10){
    1561:	83 ec 04             	sub    $0x4,%esp
    1564:	6a 0a                	push   $0xa
    1566:	68 40 87 00 00       	push   $0x8740
    156b:	53                   	push   %ebx
    156c:	e8 d2 23 00 00       	call   3943 <write>
    1571:	83 c4 10             	add    $0x10,%esp
    1574:	83 f8 0a             	cmp    $0xa,%eax
    1577:	75 40                	jne    15b9 <unlinkread+0x129>
  close(fd);
    1579:	83 ec 0c             	sub    $0xc,%esp
    157c:	53                   	push   %ebx
    157d:	e8 c9 23 00 00       	call   394b <close>
  unlink("unlinkread");
    1582:	c7 04 24 91 43 00 00 	movl   $0x4391,(%esp)
    1589:	e8 e5 23 00 00       	call   3973 <unlink>
  printf(1, "unlinkread ok\n");
    158e:	58                   	pop    %eax
    158f:	5a                   	pop    %edx
    1590:	68 39 44 00 00       	push   $0x4439
    1595:	6a 01                	push   $0x1
    1597:	e8 04 25 00 00       	call   3aa0 <printf>
}
    159c:	83 c4 10             	add    $0x10,%esp
    159f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    15a2:	5b                   	pop    %ebx
    15a3:	5e                   	pop    %esi
    15a4:	5d                   	pop    %ebp
    15a5:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    15a6:	51                   	push   %ecx
    15a7:	51                   	push   %ecx
    15a8:	68 9c 43 00 00       	push   $0x439c
    15ad:	6a 01                	push   $0x1
    15af:	e8 ec 24 00 00       	call   3aa0 <printf>
    exit();
    15b4:	e8 6a 23 00 00       	call   3923 <exit>
    printf(1, "unlinkread write failed\n");
    15b9:	51                   	push   %ecx
    15ba:	51                   	push   %ecx
    15bb:	68 20 44 00 00       	push   $0x4420
    15c0:	6a 01                	push   $0x1
    15c2:	e8 d9 24 00 00       	call   3aa0 <printf>
    exit();
    15c7:	e8 57 23 00 00       	call   3923 <exit>
    printf(1, "unlinkread wrong data\n");
    15cc:	53                   	push   %ebx
    15cd:	53                   	push   %ebx
    15ce:	68 09 44 00 00       	push   $0x4409
    15d3:	6a 01                	push   $0x1
    15d5:	e8 c6 24 00 00       	call   3aa0 <printf>
    exit();
    15da:	e8 44 23 00 00       	call   3923 <exit>
    printf(1, "unlinkread read failed");
    15df:	56                   	push   %esi
    15e0:	56                   	push   %esi
    15e1:	68 f2 43 00 00       	push   $0x43f2
    15e6:	6a 01                	push   $0x1
    15e8:	e8 b3 24 00 00       	call   3aa0 <printf>
    exit();
    15ed:	e8 31 23 00 00       	call   3923 <exit>
    printf(1, "unlink unlinkread failed\n");
    15f2:	50                   	push   %eax
    15f3:	50                   	push   %eax
    15f4:	68 d4 43 00 00       	push   $0x43d4
    15f9:	6a 01                	push   $0x1
    15fb:	e8 a0 24 00 00       	call   3aa0 <printf>
    exit();
    1600:	e8 1e 23 00 00       	call   3923 <exit>
    printf(1, "open unlinkread failed\n");
    1605:	50                   	push   %eax
    1606:	50                   	push   %eax
    1607:	68 bc 43 00 00       	push   $0x43bc
    160c:	6a 01                	push   $0x1
    160e:	e8 8d 24 00 00       	call   3aa0 <printf>
    exit();
    1613:	e8 0b 23 00 00       	call   3923 <exit>
    1618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    161f:	90                   	nop

00001620 <linktest>:
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	53                   	push   %ebx
    1624:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "linktest\n");
    1627:	68 48 44 00 00       	push   $0x4448
    162c:	6a 01                	push   $0x1
    162e:	e8 6d 24 00 00       	call   3aa0 <printf>
  unlink("lf1");
    1633:	c7 04 24 52 44 00 00 	movl   $0x4452,(%esp)
    163a:	e8 34 23 00 00       	call   3973 <unlink>
  unlink("lf2");
    163f:	c7 04 24 56 44 00 00 	movl   $0x4456,(%esp)
    1646:	e8 28 23 00 00       	call   3973 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    164b:	58                   	pop    %eax
    164c:	5a                   	pop    %edx
    164d:	68 02 02 00 00       	push   $0x202
    1652:	68 52 44 00 00       	push   $0x4452
    1657:	e8 07 23 00 00       	call   3963 <open>
  if(fd < 0){
    165c:	83 c4 10             	add    $0x10,%esp
    165f:	85 c0                	test   %eax,%eax
    1661:	0f 88 1e 01 00 00    	js     1785 <linktest+0x165>
  if(write(fd, "hello", 5) != 5){
    1667:	83 ec 04             	sub    $0x4,%esp
    166a:	89 c3                	mov    %eax,%ebx
    166c:	6a 05                	push   $0x5
    166e:	68 b6 43 00 00       	push   $0x43b6
    1673:	50                   	push   %eax
    1674:	e8 ca 22 00 00       	call   3943 <write>
    1679:	83 c4 10             	add    $0x10,%esp
    167c:	83 f8 05             	cmp    $0x5,%eax
    167f:	0f 85 98 01 00 00    	jne    181d <linktest+0x1fd>
  close(fd);
    1685:	83 ec 0c             	sub    $0xc,%esp
    1688:	53                   	push   %ebx
    1689:	e8 bd 22 00 00       	call   394b <close>
  if(link("lf1", "lf2") < 0){
    168e:	5b                   	pop    %ebx
    168f:	58                   	pop    %eax
    1690:	68 56 44 00 00       	push   $0x4456
    1695:	68 52 44 00 00       	push   $0x4452
    169a:	e8 e4 22 00 00       	call   3983 <link>
    169f:	83 c4 10             	add    $0x10,%esp
    16a2:	85 c0                	test   %eax,%eax
    16a4:	0f 88 60 01 00 00    	js     180a <linktest+0x1ea>
  unlink("lf1");
    16aa:	83 ec 0c             	sub    $0xc,%esp
    16ad:	68 52 44 00 00       	push   $0x4452
    16b2:	e8 bc 22 00 00       	call   3973 <unlink>
  if(open("lf1", 0) >= 0){
    16b7:	58                   	pop    %eax
    16b8:	5a                   	pop    %edx
    16b9:	6a 00                	push   $0x0
    16bb:	68 52 44 00 00       	push   $0x4452
    16c0:	e8 9e 22 00 00       	call   3963 <open>
    16c5:	83 c4 10             	add    $0x10,%esp
    16c8:	85 c0                	test   %eax,%eax
    16ca:	0f 89 27 01 00 00    	jns    17f7 <linktest+0x1d7>
  fd = open("lf2", 0);
    16d0:	83 ec 08             	sub    $0x8,%esp
    16d3:	6a 00                	push   $0x0
    16d5:	68 56 44 00 00       	push   $0x4456
    16da:	e8 84 22 00 00       	call   3963 <open>
  if(fd < 0){
    16df:	83 c4 10             	add    $0x10,%esp
  fd = open("lf2", 0);
    16e2:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    16e4:	85 c0                	test   %eax,%eax
    16e6:	0f 88 f8 00 00 00    	js     17e4 <linktest+0x1c4>
  if(read(fd, buf, sizeof(buf)) != 5){
    16ec:	83 ec 04             	sub    $0x4,%esp
    16ef:	68 00 20 00 00       	push   $0x2000
    16f4:	68 40 87 00 00       	push   $0x8740
    16f9:	50                   	push   %eax
    16fa:	e8 3c 22 00 00       	call   393b <read>
    16ff:	83 c4 10             	add    $0x10,%esp
    1702:	83 f8 05             	cmp    $0x5,%eax
    1705:	0f 85 c6 00 00 00    	jne    17d1 <linktest+0x1b1>
  close(fd);
    170b:	83 ec 0c             	sub    $0xc,%esp
    170e:	53                   	push   %ebx
    170f:	e8 37 22 00 00       	call   394b <close>
  if(link("lf2", "lf2") >= 0){
    1714:	58                   	pop    %eax
    1715:	5a                   	pop    %edx
    1716:	68 56 44 00 00       	push   $0x4456
    171b:	68 56 44 00 00       	push   $0x4456
    1720:	e8 5e 22 00 00       	call   3983 <link>
    1725:	83 c4 10             	add    $0x10,%esp
    1728:	85 c0                	test   %eax,%eax
    172a:	0f 89 8e 00 00 00    	jns    17be <linktest+0x19e>
  unlink("lf2");
    1730:	83 ec 0c             	sub    $0xc,%esp
    1733:	68 56 44 00 00       	push   $0x4456
    1738:	e8 36 22 00 00       	call   3973 <unlink>
  if(link("lf2", "lf1") >= 0){
    173d:	59                   	pop    %ecx
    173e:	5b                   	pop    %ebx
    173f:	68 52 44 00 00       	push   $0x4452
    1744:	68 56 44 00 00       	push   $0x4456
    1749:	e8 35 22 00 00       	call   3983 <link>
    174e:	83 c4 10             	add    $0x10,%esp
    1751:	85 c0                	test   %eax,%eax
    1753:	79 56                	jns    17ab <linktest+0x18b>
  if(link(".", "lf1") >= 0){
    1755:	83 ec 08             	sub    $0x8,%esp
    1758:	68 52 44 00 00       	push   $0x4452
    175d:	68 1a 47 00 00       	push   $0x471a
    1762:	e8 1c 22 00 00       	call   3983 <link>
    1767:	83 c4 10             	add    $0x10,%esp
    176a:	85 c0                	test   %eax,%eax
    176c:	79 2a                	jns    1798 <linktest+0x178>
  printf(1, "linktest ok\n");
    176e:	83 ec 08             	sub    $0x8,%esp
    1771:	68 f0 44 00 00       	push   $0x44f0
    1776:	6a 01                	push   $0x1
    1778:	e8 23 23 00 00       	call   3aa0 <printf>
}
    177d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1780:	83 c4 10             	add    $0x10,%esp
    1783:	c9                   	leave  
    1784:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    1785:	50                   	push   %eax
    1786:	50                   	push   %eax
    1787:	68 5a 44 00 00       	push   $0x445a
    178c:	6a 01                	push   $0x1
    178e:	e8 0d 23 00 00       	call   3aa0 <printf>
    exit();
    1793:	e8 8b 21 00 00       	call   3923 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    1798:	50                   	push   %eax
    1799:	50                   	push   %eax
    179a:	68 d4 44 00 00       	push   $0x44d4
    179f:	6a 01                	push   $0x1
    17a1:	e8 fa 22 00 00       	call   3aa0 <printf>
    exit();
    17a6:	e8 78 21 00 00       	call   3923 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    17ab:	52                   	push   %edx
    17ac:	52                   	push   %edx
    17ad:	68 88 50 00 00       	push   $0x5088
    17b2:	6a 01                	push   $0x1
    17b4:	e8 e7 22 00 00       	call   3aa0 <printf>
    exit();
    17b9:	e8 65 21 00 00       	call   3923 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    17be:	50                   	push   %eax
    17bf:	50                   	push   %eax
    17c0:	68 b6 44 00 00       	push   $0x44b6
    17c5:	6a 01                	push   $0x1
    17c7:	e8 d4 22 00 00       	call   3aa0 <printf>
    exit();
    17cc:	e8 52 21 00 00       	call   3923 <exit>
    printf(1, "read lf2 failed\n");
    17d1:	51                   	push   %ecx
    17d2:	51                   	push   %ecx
    17d3:	68 a5 44 00 00       	push   $0x44a5
    17d8:	6a 01                	push   $0x1
    17da:	e8 c1 22 00 00       	call   3aa0 <printf>
    exit();
    17df:	e8 3f 21 00 00       	call   3923 <exit>
    printf(1, "open lf2 failed\n");
    17e4:	53                   	push   %ebx
    17e5:	53                   	push   %ebx
    17e6:	68 94 44 00 00       	push   $0x4494
    17eb:	6a 01                	push   $0x1
    17ed:	e8 ae 22 00 00       	call   3aa0 <printf>
    exit();
    17f2:	e8 2c 21 00 00       	call   3923 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    17f7:	50                   	push   %eax
    17f8:	50                   	push   %eax
    17f9:	68 60 50 00 00       	push   $0x5060
    17fe:	6a 01                	push   $0x1
    1800:	e8 9b 22 00 00       	call   3aa0 <printf>
    exit();
    1805:	e8 19 21 00 00       	call   3923 <exit>
    printf(1, "link lf1 lf2 failed\n");
    180a:	51                   	push   %ecx
    180b:	51                   	push   %ecx
    180c:	68 7f 44 00 00       	push   $0x447f
    1811:	6a 01                	push   $0x1
    1813:	e8 88 22 00 00       	call   3aa0 <printf>
    exit();
    1818:	e8 06 21 00 00       	call   3923 <exit>
    printf(1, "write lf1 failed\n");
    181d:	50                   	push   %eax
    181e:	50                   	push   %eax
    181f:	68 6d 44 00 00       	push   $0x446d
    1824:	6a 01                	push   $0x1
    1826:	e8 75 22 00 00       	call   3aa0 <printf>
    exit();
    182b:	e8 f3 20 00 00       	call   3923 <exit>

00001830 <concreate>:
{
    1830:	55                   	push   %ebp
    1831:	89 e5                	mov    %esp,%ebp
    1833:	57                   	push   %edi
    1834:	56                   	push   %esi
  for(i = 0; i < 40; i++){
    1835:	31 f6                	xor    %esi,%esi
{
    1837:	53                   	push   %ebx
    1838:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    183b:	83 ec 64             	sub    $0x64,%esp
  printf(1, "concreate test\n");
    183e:	68 fd 44 00 00       	push   $0x44fd
    1843:	6a 01                	push   $0x1
    1845:	e8 56 22 00 00       	call   3aa0 <printf>
  file[0] = 'C';
    184a:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    184e:	83 c4 10             	add    $0x10,%esp
    1851:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
  for(i = 0; i < 40; i++){
    1855:	eb 4c                	jmp    18a3 <concreate+0x73>
    1857:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    185e:	66 90                	xchg   %ax,%ax
    1860:	69 c6 ab aa aa aa    	imul   $0xaaaaaaab,%esi,%eax
    if(pid && (i % 3) == 1){
    1866:	3d ab aa aa aa       	cmp    $0xaaaaaaab,%eax
    186b:	0f 83 af 00 00 00    	jae    1920 <concreate+0xf0>
      fd = open(file, O_CREATE | O_RDWR);
    1871:	83 ec 08             	sub    $0x8,%esp
    1874:	68 02 02 00 00       	push   $0x202
    1879:	53                   	push   %ebx
    187a:	e8 e4 20 00 00       	call   3963 <open>
      if(fd < 0){
    187f:	83 c4 10             	add    $0x10,%esp
    1882:	85 c0                	test   %eax,%eax
    1884:	78 5f                	js     18e5 <concreate+0xb5>
      close(fd);
    1886:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    1889:	83 c6 01             	add    $0x1,%esi
      close(fd);
    188c:	50                   	push   %eax
    188d:	e8 b9 20 00 00       	call   394b <close>
    1892:	83 c4 10             	add    $0x10,%esp
      wait();
    1895:	e8 91 20 00 00       	call   392b <wait>
  for(i = 0; i < 40; i++){
    189a:	83 fe 28             	cmp    $0x28,%esi
    189d:	0f 84 9f 00 00 00    	je     1942 <concreate+0x112>
    unlink(file);
    18a3:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    18a6:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    18a9:	53                   	push   %ebx
    file[1] = '0' + i;
    18aa:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    18ad:	e8 c1 20 00 00       	call   3973 <unlink>
    pid = fork();
    18b2:	e8 64 20 00 00       	call   391b <fork>
    if(pid && (i % 3) == 1){
    18b7:	83 c4 10             	add    $0x10,%esp
    18ba:	85 c0                	test   %eax,%eax
    18bc:	75 a2                	jne    1860 <concreate+0x30>
      link("C0", file);
    18be:	69 f6 cd cc cc cc    	imul   $0xcccccccd,%esi,%esi
    } else if(pid == 0 && (i % 5) == 1){
    18c4:	81 fe cd cc cc cc    	cmp    $0xcccccccd,%esi
    18ca:	73 34                	jae    1900 <concreate+0xd0>
      fd = open(file, O_CREATE | O_RDWR);
    18cc:	83 ec 08             	sub    $0x8,%esp
    18cf:	68 02 02 00 00       	push   $0x202
    18d4:	53                   	push   %ebx
    18d5:	e8 89 20 00 00       	call   3963 <open>
      if(fd < 0){
    18da:	83 c4 10             	add    $0x10,%esp
    18dd:	85 c0                	test   %eax,%eax
    18df:	0f 89 39 02 00 00    	jns    1b1e <concreate+0x2ee>
        printf(1, "concreate create %s failed\n", file);
    18e5:	83 ec 04             	sub    $0x4,%esp
    18e8:	53                   	push   %ebx
    18e9:	68 10 45 00 00       	push   $0x4510
    18ee:	6a 01                	push   $0x1
    18f0:	e8 ab 21 00 00       	call   3aa0 <printf>
        exit();
    18f5:	e8 29 20 00 00       	call   3923 <exit>
    18fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      link("C0", file);
    1900:	83 ec 08             	sub    $0x8,%esp
    1903:	53                   	push   %ebx
    1904:	68 0d 45 00 00       	push   $0x450d
    1909:	e8 75 20 00 00       	call   3983 <link>
    190e:	83 c4 10             	add    $0x10,%esp
      exit();
    1911:	e8 0d 20 00 00       	call   3923 <exit>
    1916:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    191d:	8d 76 00             	lea    0x0(%esi),%esi
      link("C0", file);
    1920:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 40; i++){
    1923:	83 c6 01             	add    $0x1,%esi
      link("C0", file);
    1926:	53                   	push   %ebx
    1927:	68 0d 45 00 00       	push   $0x450d
    192c:	e8 52 20 00 00       	call   3983 <link>
    1931:	83 c4 10             	add    $0x10,%esp
      wait();
    1934:	e8 f2 1f 00 00       	call   392b <wait>
  for(i = 0; i < 40; i++){
    1939:	83 fe 28             	cmp    $0x28,%esi
    193c:	0f 85 61 ff ff ff    	jne    18a3 <concreate+0x73>
  memset(fa, 0, sizeof(fa));
    1942:	83 ec 04             	sub    $0x4,%esp
    1945:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1948:	6a 28                	push   $0x28
    194a:	6a 00                	push   $0x0
    194c:	50                   	push   %eax
    194d:	e8 3e 1e 00 00       	call   3790 <memset>
  fd = open(".", 0);
    1952:	5e                   	pop    %esi
    1953:	5f                   	pop    %edi
    1954:	6a 00                	push   $0x0
    1956:	68 1a 47 00 00       	push   $0x471a
    195b:	8d 7d b0             	lea    -0x50(%ebp),%edi
    195e:	e8 00 20 00 00       	call   3963 <open>
  n = 0;
    1963:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    196a:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    196d:	89 c6                	mov    %eax,%esi
  while(read(fd, &de, sizeof(de)) > 0){
    196f:	90                   	nop
    1970:	83 ec 04             	sub    $0x4,%esp
    1973:	6a 10                	push   $0x10
    1975:	57                   	push   %edi
    1976:	56                   	push   %esi
    1977:	e8 bf 1f 00 00       	call   393b <read>
    197c:	83 c4 10             	add    $0x10,%esp
    197f:	85 c0                	test   %eax,%eax
    1981:	7e 3d                	jle    19c0 <concreate+0x190>
    if(de.inum == 0)
    1983:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1988:	74 e6                	je     1970 <concreate+0x140>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    198a:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    198e:	75 e0                	jne    1970 <concreate+0x140>
    1990:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1994:	75 da                	jne    1970 <concreate+0x140>
      i = de.name[1] - '0';
    1996:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    199a:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    199d:	83 f8 27             	cmp    $0x27,%eax
    19a0:	0f 87 60 01 00 00    	ja     1b06 <concreate+0x2d6>
      if(fa[i]){
    19a6:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    19ab:	0f 85 3d 01 00 00    	jne    1aee <concreate+0x2be>
      n++;
    19b1:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
      fa[i] = 1;
    19b5:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    19ba:	eb b4                	jmp    1970 <concreate+0x140>
    19bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    19c0:	83 ec 0c             	sub    $0xc,%esp
    19c3:	56                   	push   %esi
    19c4:	e8 82 1f 00 00       	call   394b <close>
  if(n != 40){
    19c9:	83 c4 10             	add    $0x10,%esp
    19cc:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    19d0:	0f 85 05 01 00 00    	jne    1adb <concreate+0x2ab>
  for(i = 0; i < 40; i++){
    19d6:	31 f6                	xor    %esi,%esi
    19d8:	eb 4c                	jmp    1a26 <concreate+0x1f6>
    19da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       ((i % 3) == 1 && pid != 0)){
    19e0:	85 ff                	test   %edi,%edi
    19e2:	74 05                	je     19e9 <concreate+0x1b9>
    19e4:	83 f8 01             	cmp    $0x1,%eax
    19e7:	74 6c                	je     1a55 <concreate+0x225>
      unlink(file);
    19e9:	83 ec 0c             	sub    $0xc,%esp
    19ec:	53                   	push   %ebx
    19ed:	e8 81 1f 00 00       	call   3973 <unlink>
      unlink(file);
    19f2:	89 1c 24             	mov    %ebx,(%esp)
    19f5:	e8 79 1f 00 00       	call   3973 <unlink>
      unlink(file);
    19fa:	89 1c 24             	mov    %ebx,(%esp)
    19fd:	e8 71 1f 00 00       	call   3973 <unlink>
      unlink(file);
    1a02:	89 1c 24             	mov    %ebx,(%esp)
    1a05:	e8 69 1f 00 00       	call   3973 <unlink>
    1a0a:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    1a0d:	85 ff                	test   %edi,%edi
    1a0f:	0f 84 fc fe ff ff    	je     1911 <concreate+0xe1>
      wait();
    1a15:	e8 11 1f 00 00       	call   392b <wait>
  for(i = 0; i < 40; i++){
    1a1a:	83 c6 01             	add    $0x1,%esi
    1a1d:	83 fe 28             	cmp    $0x28,%esi
    1a20:	0f 84 8a 00 00 00    	je     1ab0 <concreate+0x280>
    file[1] = '0' + i;
    1a26:	8d 46 30             	lea    0x30(%esi),%eax
    1a29:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    1a2c:	e8 ea 1e 00 00       	call   391b <fork>
    1a31:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1a33:	85 c0                	test   %eax,%eax
    1a35:	0f 88 8c 00 00 00    	js     1ac7 <concreate+0x297>
    if(((i % 3) == 0 && pid == 0) ||
    1a3b:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
    1a40:	f7 e6                	mul    %esi
    1a42:	89 d0                	mov    %edx,%eax
    1a44:	83 e2 fe             	and    $0xfffffffe,%edx
    1a47:	d1 e8                	shr    %eax
    1a49:	01 c2                	add    %eax,%edx
    1a4b:	89 f0                	mov    %esi,%eax
    1a4d:	29 d0                	sub    %edx,%eax
    1a4f:	89 c1                	mov    %eax,%ecx
    1a51:	09 f9                	or     %edi,%ecx
    1a53:	75 8b                	jne    19e0 <concreate+0x1b0>
      close(open(file, 0));
    1a55:	83 ec 08             	sub    $0x8,%esp
    1a58:	6a 00                	push   $0x0
    1a5a:	53                   	push   %ebx
    1a5b:	e8 03 1f 00 00       	call   3963 <open>
    1a60:	89 04 24             	mov    %eax,(%esp)
    1a63:	e8 e3 1e 00 00       	call   394b <close>
      close(open(file, 0));
    1a68:	58                   	pop    %eax
    1a69:	5a                   	pop    %edx
    1a6a:	6a 00                	push   $0x0
    1a6c:	53                   	push   %ebx
    1a6d:	e8 f1 1e 00 00       	call   3963 <open>
    1a72:	89 04 24             	mov    %eax,(%esp)
    1a75:	e8 d1 1e 00 00       	call   394b <close>
      close(open(file, 0));
    1a7a:	59                   	pop    %ecx
    1a7b:	58                   	pop    %eax
    1a7c:	6a 00                	push   $0x0
    1a7e:	53                   	push   %ebx
    1a7f:	e8 df 1e 00 00       	call   3963 <open>
    1a84:	89 04 24             	mov    %eax,(%esp)
    1a87:	e8 bf 1e 00 00       	call   394b <close>
      close(open(file, 0));
    1a8c:	58                   	pop    %eax
    1a8d:	5a                   	pop    %edx
    1a8e:	6a 00                	push   $0x0
    1a90:	53                   	push   %ebx
    1a91:	e8 cd 1e 00 00       	call   3963 <open>
    1a96:	89 04 24             	mov    %eax,(%esp)
    1a99:	e8 ad 1e 00 00       	call   394b <close>
    1a9e:	83 c4 10             	add    $0x10,%esp
    1aa1:	e9 67 ff ff ff       	jmp    1a0d <concreate+0x1dd>
    1aa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1aad:	8d 76 00             	lea    0x0(%esi),%esi
  printf(1, "concreate ok\n");
    1ab0:	83 ec 08             	sub    $0x8,%esp
    1ab3:	68 62 45 00 00       	push   $0x4562
    1ab8:	6a 01                	push   $0x1
    1aba:	e8 e1 1f 00 00       	call   3aa0 <printf>
}
    1abf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1ac2:	5b                   	pop    %ebx
    1ac3:	5e                   	pop    %esi
    1ac4:	5f                   	pop    %edi
    1ac5:	5d                   	pop    %ebp
    1ac6:	c3                   	ret    
      printf(1, "fork failed\n");
    1ac7:	83 ec 08             	sub    $0x8,%esp
    1aca:	68 e5 4d 00 00       	push   $0x4de5
    1acf:	6a 01                	push   $0x1
    1ad1:	e8 ca 1f 00 00       	call   3aa0 <printf>
      exit();
    1ad6:	e8 48 1e 00 00       	call   3923 <exit>
    printf(1, "concreate not enough files in directory listing\n");
    1adb:	51                   	push   %ecx
    1adc:	51                   	push   %ecx
    1add:	68 ac 50 00 00       	push   $0x50ac
    1ae2:	6a 01                	push   $0x1
    1ae4:	e8 b7 1f 00 00       	call   3aa0 <printf>
    exit();
    1ae9:	e8 35 1e 00 00       	call   3923 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    1aee:	83 ec 04             	sub    $0x4,%esp
    1af1:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1af4:	50                   	push   %eax
    1af5:	68 45 45 00 00       	push   $0x4545
    1afa:	6a 01                	push   $0x1
    1afc:	e8 9f 1f 00 00       	call   3aa0 <printf>
        exit();
    1b01:	e8 1d 1e 00 00       	call   3923 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    1b06:	83 ec 04             	sub    $0x4,%esp
    1b09:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1b0c:	50                   	push   %eax
    1b0d:	68 2c 45 00 00       	push   $0x452c
    1b12:	6a 01                	push   $0x1
    1b14:	e8 87 1f 00 00       	call   3aa0 <printf>
        exit();
    1b19:	e8 05 1e 00 00       	call   3923 <exit>
      close(fd);
    1b1e:	83 ec 0c             	sub    $0xc,%esp
    1b21:	50                   	push   %eax
    1b22:	e8 24 1e 00 00       	call   394b <close>
    1b27:	83 c4 10             	add    $0x10,%esp
    1b2a:	e9 e2 fd ff ff       	jmp    1911 <concreate+0xe1>
    1b2f:	90                   	nop

00001b30 <linkunlink>:
{
    1b30:	55                   	push   %ebp
    1b31:	89 e5                	mov    %esp,%ebp
    1b33:	57                   	push   %edi
    1b34:	56                   	push   %esi
    1b35:	53                   	push   %ebx
    1b36:	83 ec 24             	sub    $0x24,%esp
  printf(1, "linkunlink test\n");
    1b39:	68 70 45 00 00       	push   $0x4570
    1b3e:	6a 01                	push   $0x1
    1b40:	e8 5b 1f 00 00       	call   3aa0 <printf>
  unlink("x");
    1b45:	c7 04 24 fd 47 00 00 	movl   $0x47fd,(%esp)
    1b4c:	e8 22 1e 00 00       	call   3973 <unlink>
  pid = fork();
    1b51:	e8 c5 1d 00 00       	call   391b <fork>
  if(pid < 0){
    1b56:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    1b59:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1b5c:	85 c0                	test   %eax,%eax
    1b5e:	0f 88 b6 00 00 00    	js     1c1a <linkunlink+0xea>
  unsigned int x = (pid ? 1 : 97);
    1b64:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1b68:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    1b6d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  unsigned int x = (pid ? 1 : 97);
    1b72:	19 ff                	sbb    %edi,%edi
    1b74:	83 e7 60             	and    $0x60,%edi
    1b77:	83 c7 01             	add    $0x1,%edi
    1b7a:	eb 1e                	jmp    1b9a <linkunlink+0x6a>
    1b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if((x % 3) == 1){
    1b80:	83 f8 01             	cmp    $0x1,%eax
    1b83:	74 7b                	je     1c00 <linkunlink+0xd0>
      unlink("x");
    1b85:	83 ec 0c             	sub    $0xc,%esp
    1b88:	68 fd 47 00 00       	push   $0x47fd
    1b8d:	e8 e1 1d 00 00       	call   3973 <unlink>
    1b92:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1b95:	83 eb 01             	sub    $0x1,%ebx
    1b98:	74 41                	je     1bdb <linkunlink+0xab>
    x = x * 1103515245 + 12345;
    1b9a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1ba0:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1ba6:	89 f8                	mov    %edi,%eax
    1ba8:	f7 e6                	mul    %esi
    1baa:	89 d0                	mov    %edx,%eax
    1bac:	83 e2 fe             	and    $0xfffffffe,%edx
    1baf:	d1 e8                	shr    %eax
    1bb1:	01 c2                	add    %eax,%edx
    1bb3:	89 f8                	mov    %edi,%eax
    1bb5:	29 d0                	sub    %edx,%eax
    1bb7:	75 c7                	jne    1b80 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1bb9:	83 ec 08             	sub    $0x8,%esp
    1bbc:	68 02 02 00 00       	push   $0x202
    1bc1:	68 fd 47 00 00       	push   $0x47fd
    1bc6:	e8 98 1d 00 00       	call   3963 <open>
    1bcb:	89 04 24             	mov    %eax,(%esp)
    1bce:	e8 78 1d 00 00       	call   394b <close>
    1bd3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1bd6:	83 eb 01             	sub    $0x1,%ebx
    1bd9:	75 bf                	jne    1b9a <linkunlink+0x6a>
  if(pid)
    1bdb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1bde:	85 c0                	test   %eax,%eax
    1be0:	74 4b                	je     1c2d <linkunlink+0xfd>
    wait();
    1be2:	e8 44 1d 00 00       	call   392b <wait>
  printf(1, "linkunlink ok\n");
    1be7:	83 ec 08             	sub    $0x8,%esp
    1bea:	68 85 45 00 00       	push   $0x4585
    1bef:	6a 01                	push   $0x1
    1bf1:	e8 aa 1e 00 00       	call   3aa0 <printf>
}
    1bf6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1bf9:	5b                   	pop    %ebx
    1bfa:	5e                   	pop    %esi
    1bfb:	5f                   	pop    %edi
    1bfc:	5d                   	pop    %ebp
    1bfd:	c3                   	ret    
    1bfe:	66 90                	xchg   %ax,%ax
      link("cat", "x");
    1c00:	83 ec 08             	sub    $0x8,%esp
    1c03:	68 fd 47 00 00       	push   $0x47fd
    1c08:	68 81 45 00 00       	push   $0x4581
    1c0d:	e8 71 1d 00 00       	call   3983 <link>
    1c12:	83 c4 10             	add    $0x10,%esp
    1c15:	e9 7b ff ff ff       	jmp    1b95 <linkunlink+0x65>
    printf(1, "fork failed\n");
    1c1a:	52                   	push   %edx
    1c1b:	52                   	push   %edx
    1c1c:	68 e5 4d 00 00       	push   $0x4de5
    1c21:	6a 01                	push   $0x1
    1c23:	e8 78 1e 00 00       	call   3aa0 <printf>
    exit();
    1c28:	e8 f6 1c 00 00       	call   3923 <exit>
    exit();
    1c2d:	e8 f1 1c 00 00       	call   3923 <exit>
    1c32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001c40 <bigdir>:
{
    1c40:	55                   	push   %ebp
    1c41:	89 e5                	mov    %esp,%ebp
    1c43:	57                   	push   %edi
    1c44:	56                   	push   %esi
    1c45:	53                   	push   %ebx
    1c46:	83 ec 24             	sub    $0x24,%esp
  printf(1, "bigdir test\n");
    1c49:	68 94 45 00 00       	push   $0x4594
    1c4e:	6a 01                	push   $0x1
    1c50:	e8 4b 1e 00 00       	call   3aa0 <printf>
  unlink("bd");
    1c55:	c7 04 24 a1 45 00 00 	movl   $0x45a1,(%esp)
    1c5c:	e8 12 1d 00 00       	call   3973 <unlink>
  fd = open("bd", O_CREATE);
    1c61:	5a                   	pop    %edx
    1c62:	59                   	pop    %ecx
    1c63:	68 00 02 00 00       	push   $0x200
    1c68:	68 a1 45 00 00       	push   $0x45a1
    1c6d:	e8 f1 1c 00 00       	call   3963 <open>
  if(fd < 0){
    1c72:	83 c4 10             	add    $0x10,%esp
    1c75:	85 c0                	test   %eax,%eax
    1c77:	0f 88 de 00 00 00    	js     1d5b <bigdir+0x11b>
  close(fd);
    1c7d:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1c80:	31 f6                	xor    %esi,%esi
    1c82:	8d 7d de             	lea    -0x22(%ebp),%edi
  close(fd);
    1c85:	50                   	push   %eax
    1c86:	e8 c0 1c 00 00       	call   394b <close>
    1c8b:	83 c4 10             	add    $0x10,%esp
    1c8e:	66 90                	xchg   %ax,%ax
    name[1] = '0' + (i / 64);
    1c90:	89 f0                	mov    %esi,%eax
    if(link("bd", name) != 0){
    1c92:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'x';
    1c95:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1c99:	c1 f8 06             	sar    $0x6,%eax
    if(link("bd", name) != 0){
    1c9c:	57                   	push   %edi
    name[1] = '0' + (i / 64);
    1c9d:	83 c0 30             	add    $0x30,%eax
    if(link("bd", name) != 0){
    1ca0:	68 a1 45 00 00       	push   $0x45a1
    name[1] = '0' + (i / 64);
    1ca5:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1ca8:	89 f0                	mov    %esi,%eax
    1caa:	83 e0 3f             	and    $0x3f,%eax
    name[3] = '\0';
    1cad:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[2] = '0' + (i % 64);
    1cb1:	83 c0 30             	add    $0x30,%eax
    1cb4:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(link("bd", name) != 0){
    1cb7:	e8 c7 1c 00 00       	call   3983 <link>
    1cbc:	83 c4 10             	add    $0x10,%esp
    1cbf:	89 c3                	mov    %eax,%ebx
    1cc1:	85 c0                	test   %eax,%eax
    1cc3:	75 6e                	jne    1d33 <bigdir+0xf3>
  for(i = 0; i < 500; i++){
    1cc5:	83 c6 01             	add    $0x1,%esi
    1cc8:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1cce:	75 c0                	jne    1c90 <bigdir+0x50>
  unlink("bd");
    1cd0:	83 ec 0c             	sub    $0xc,%esp
    1cd3:	68 a1 45 00 00       	push   $0x45a1
    1cd8:	e8 96 1c 00 00       	call   3973 <unlink>
    1cdd:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + (i / 64);
    1ce0:	89 d8                	mov    %ebx,%eax
    if(unlink(name) != 0){
    1ce2:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'x';
    1ce5:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1ce9:	c1 f8 06             	sar    $0x6,%eax
    if(unlink(name) != 0){
    1cec:	57                   	push   %edi
    name[1] = '0' + (i / 64);
    1ced:	83 c0 30             	add    $0x30,%eax
    name[3] = '\0';
    1cf0:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1cf4:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1cf7:	89 d8                	mov    %ebx,%eax
    1cf9:	83 e0 3f             	and    $0x3f,%eax
    1cfc:	83 c0 30             	add    $0x30,%eax
    1cff:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(unlink(name) != 0){
    1d02:	e8 6c 1c 00 00       	call   3973 <unlink>
    1d07:	83 c4 10             	add    $0x10,%esp
    1d0a:	85 c0                	test   %eax,%eax
    1d0c:	75 39                	jne    1d47 <bigdir+0x107>
  for(i = 0; i < 500; i++){
    1d0e:	83 c3 01             	add    $0x1,%ebx
    1d11:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1d17:	75 c7                	jne    1ce0 <bigdir+0xa0>
  printf(1, "bigdir ok\n");
    1d19:	83 ec 08             	sub    $0x8,%esp
    1d1c:	68 e3 45 00 00       	push   $0x45e3
    1d21:	6a 01                	push   $0x1
    1d23:	e8 78 1d 00 00       	call   3aa0 <printf>
    1d28:	83 c4 10             	add    $0x10,%esp
}
    1d2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1d2e:	5b                   	pop    %ebx
    1d2f:	5e                   	pop    %esi
    1d30:	5f                   	pop    %edi
    1d31:	5d                   	pop    %ebp
    1d32:	c3                   	ret    
      printf(1, "bigdir link failed\n");
    1d33:	83 ec 08             	sub    $0x8,%esp
    1d36:	68 ba 45 00 00       	push   $0x45ba
    1d3b:	6a 01                	push   $0x1
    1d3d:	e8 5e 1d 00 00       	call   3aa0 <printf>
      exit();
    1d42:	e8 dc 1b 00 00       	call   3923 <exit>
      printf(1, "bigdir unlink failed");
    1d47:	83 ec 08             	sub    $0x8,%esp
    1d4a:	68 ce 45 00 00       	push   $0x45ce
    1d4f:	6a 01                	push   $0x1
    1d51:	e8 4a 1d 00 00       	call   3aa0 <printf>
      exit();
    1d56:	e8 c8 1b 00 00       	call   3923 <exit>
    printf(1, "bigdir create failed\n");
    1d5b:	50                   	push   %eax
    1d5c:	50                   	push   %eax
    1d5d:	68 a4 45 00 00       	push   $0x45a4
    1d62:	6a 01                	push   $0x1
    1d64:	e8 37 1d 00 00       	call   3aa0 <printf>
    exit();
    1d69:	e8 b5 1b 00 00       	call   3923 <exit>
    1d6e:	66 90                	xchg   %ax,%ax

00001d70 <subdir>:
{
    1d70:	55                   	push   %ebp
    1d71:	89 e5                	mov    %esp,%ebp
    1d73:	53                   	push   %ebx
    1d74:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "subdir test\n");
    1d77:	68 ee 45 00 00       	push   $0x45ee
    1d7c:	6a 01                	push   $0x1
    1d7e:	e8 1d 1d 00 00       	call   3aa0 <printf>
  unlink("ff");
    1d83:	c7 04 24 77 46 00 00 	movl   $0x4677,(%esp)
    1d8a:	e8 e4 1b 00 00       	call   3973 <unlink>
  if(mkdir("dd") != 0){
    1d8f:	c7 04 24 14 47 00 00 	movl   $0x4714,(%esp)
    1d96:	e8 f0 1b 00 00       	call   398b <mkdir>
    1d9b:	83 c4 10             	add    $0x10,%esp
    1d9e:	85 c0                	test   %eax,%eax
    1da0:	0f 85 b3 05 00 00    	jne    2359 <subdir+0x5e9>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1da6:	83 ec 08             	sub    $0x8,%esp
    1da9:	68 02 02 00 00       	push   $0x202
    1dae:	68 4d 46 00 00       	push   $0x464d
    1db3:	e8 ab 1b 00 00       	call   3963 <open>
  if(fd < 0){
    1db8:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1dbb:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1dbd:	85 c0                	test   %eax,%eax
    1dbf:	0f 88 81 05 00 00    	js     2346 <subdir+0x5d6>
  write(fd, "ff", 2);
    1dc5:	83 ec 04             	sub    $0x4,%esp
    1dc8:	6a 02                	push   $0x2
    1dca:	68 77 46 00 00       	push   $0x4677
    1dcf:	50                   	push   %eax
    1dd0:	e8 6e 1b 00 00       	call   3943 <write>
  close(fd);
    1dd5:	89 1c 24             	mov    %ebx,(%esp)
    1dd8:	e8 6e 1b 00 00       	call   394b <close>
  if(unlink("dd") >= 0){
    1ddd:	c7 04 24 14 47 00 00 	movl   $0x4714,(%esp)
    1de4:	e8 8a 1b 00 00       	call   3973 <unlink>
    1de9:	83 c4 10             	add    $0x10,%esp
    1dec:	85 c0                	test   %eax,%eax
    1dee:	0f 89 3f 05 00 00    	jns    2333 <subdir+0x5c3>
  if(mkdir("/dd/dd") != 0){
    1df4:	83 ec 0c             	sub    $0xc,%esp
    1df7:	68 28 46 00 00       	push   $0x4628
    1dfc:	e8 8a 1b 00 00       	call   398b <mkdir>
    1e01:	83 c4 10             	add    $0x10,%esp
    1e04:	85 c0                	test   %eax,%eax
    1e06:	0f 85 14 05 00 00    	jne    2320 <subdir+0x5b0>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1e0c:	83 ec 08             	sub    $0x8,%esp
    1e0f:	68 02 02 00 00       	push   $0x202
    1e14:	68 4a 46 00 00       	push   $0x464a
    1e19:	e8 45 1b 00 00       	call   3963 <open>
  if(fd < 0){
    1e1e:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1e21:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1e23:	85 c0                	test   %eax,%eax
    1e25:	0f 88 24 04 00 00    	js     224f <subdir+0x4df>
  write(fd, "FF", 2);
    1e2b:	83 ec 04             	sub    $0x4,%esp
    1e2e:	6a 02                	push   $0x2
    1e30:	68 6b 46 00 00       	push   $0x466b
    1e35:	50                   	push   %eax
    1e36:	e8 08 1b 00 00       	call   3943 <write>
  close(fd);
    1e3b:	89 1c 24             	mov    %ebx,(%esp)
    1e3e:	e8 08 1b 00 00       	call   394b <close>
  fd = open("dd/dd/../ff", 0);
    1e43:	58                   	pop    %eax
    1e44:	5a                   	pop    %edx
    1e45:	6a 00                	push   $0x0
    1e47:	68 6e 46 00 00       	push   $0x466e
    1e4c:	e8 12 1b 00 00       	call   3963 <open>
  if(fd < 0){
    1e51:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/../ff", 0);
    1e54:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1e56:	85 c0                	test   %eax,%eax
    1e58:	0f 88 de 03 00 00    	js     223c <subdir+0x4cc>
  cc = read(fd, buf, sizeof(buf));
    1e5e:	83 ec 04             	sub    $0x4,%esp
    1e61:	68 00 20 00 00       	push   $0x2000
    1e66:	68 40 87 00 00       	push   $0x8740
    1e6b:	50                   	push   %eax
    1e6c:	e8 ca 1a 00 00       	call   393b <read>
  if(cc != 2 || buf[0] != 'f'){
    1e71:	83 c4 10             	add    $0x10,%esp
    1e74:	83 f8 02             	cmp    $0x2,%eax
    1e77:	0f 85 3a 03 00 00    	jne    21b7 <subdir+0x447>
    1e7d:	80 3d 40 87 00 00 66 	cmpb   $0x66,0x8740
    1e84:	0f 85 2d 03 00 00    	jne    21b7 <subdir+0x447>
  close(fd);
    1e8a:	83 ec 0c             	sub    $0xc,%esp
    1e8d:	53                   	push   %ebx
    1e8e:	e8 b8 1a 00 00       	call   394b <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e93:	59                   	pop    %ecx
    1e94:	5b                   	pop    %ebx
    1e95:	68 ae 46 00 00       	push   $0x46ae
    1e9a:	68 4a 46 00 00       	push   $0x464a
    1e9f:	e8 df 1a 00 00       	call   3983 <link>
    1ea4:	83 c4 10             	add    $0x10,%esp
    1ea7:	85 c0                	test   %eax,%eax
    1ea9:	0f 85 c6 03 00 00    	jne    2275 <subdir+0x505>
  if(unlink("dd/dd/ff") != 0){
    1eaf:	83 ec 0c             	sub    $0xc,%esp
    1eb2:	68 4a 46 00 00       	push   $0x464a
    1eb7:	e8 b7 1a 00 00       	call   3973 <unlink>
    1ebc:	83 c4 10             	add    $0x10,%esp
    1ebf:	85 c0                	test   %eax,%eax
    1ec1:	0f 85 16 03 00 00    	jne    21dd <subdir+0x46d>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1ec7:	83 ec 08             	sub    $0x8,%esp
    1eca:	6a 00                	push   $0x0
    1ecc:	68 4a 46 00 00       	push   $0x464a
    1ed1:	e8 8d 1a 00 00       	call   3963 <open>
    1ed6:	83 c4 10             	add    $0x10,%esp
    1ed9:	85 c0                	test   %eax,%eax
    1edb:	0f 89 2c 04 00 00    	jns    230d <subdir+0x59d>
  if(chdir("dd") != 0){
    1ee1:	83 ec 0c             	sub    $0xc,%esp
    1ee4:	68 14 47 00 00       	push   $0x4714
    1ee9:	e8 a5 1a 00 00       	call   3993 <chdir>
    1eee:	83 c4 10             	add    $0x10,%esp
    1ef1:	85 c0                	test   %eax,%eax
    1ef3:	0f 85 01 04 00 00    	jne    22fa <subdir+0x58a>
  if(chdir("dd/../../dd") != 0){
    1ef9:	83 ec 0c             	sub    $0xc,%esp
    1efc:	68 e2 46 00 00       	push   $0x46e2
    1f01:	e8 8d 1a 00 00       	call   3993 <chdir>
    1f06:	83 c4 10             	add    $0x10,%esp
    1f09:	85 c0                	test   %eax,%eax
    1f0b:	0f 85 b9 02 00 00    	jne    21ca <subdir+0x45a>
  if(chdir("dd/../../../dd") != 0){
    1f11:	83 ec 0c             	sub    $0xc,%esp
    1f14:	68 08 47 00 00       	push   $0x4708
    1f19:	e8 75 1a 00 00       	call   3993 <chdir>
    1f1e:	83 c4 10             	add    $0x10,%esp
    1f21:	85 c0                	test   %eax,%eax
    1f23:	0f 85 a1 02 00 00    	jne    21ca <subdir+0x45a>
  if(chdir("./..") != 0){
    1f29:	83 ec 0c             	sub    $0xc,%esp
    1f2c:	68 17 47 00 00       	push   $0x4717
    1f31:	e8 5d 1a 00 00       	call   3993 <chdir>
    1f36:	83 c4 10             	add    $0x10,%esp
    1f39:	85 c0                	test   %eax,%eax
    1f3b:	0f 85 21 03 00 00    	jne    2262 <subdir+0x4f2>
  fd = open("dd/dd/ffff", 0);
    1f41:	83 ec 08             	sub    $0x8,%esp
    1f44:	6a 00                	push   $0x0
    1f46:	68 ae 46 00 00       	push   $0x46ae
    1f4b:	e8 13 1a 00 00       	call   3963 <open>
  if(fd < 0){
    1f50:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/ffff", 0);
    1f53:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1f55:	85 c0                	test   %eax,%eax
    1f57:	0f 88 e0 04 00 00    	js     243d <subdir+0x6cd>
  if(read(fd, buf, sizeof(buf)) != 2){
    1f5d:	83 ec 04             	sub    $0x4,%esp
    1f60:	68 00 20 00 00       	push   $0x2000
    1f65:	68 40 87 00 00       	push   $0x8740
    1f6a:	50                   	push   %eax
    1f6b:	e8 cb 19 00 00       	call   393b <read>
    1f70:	83 c4 10             	add    $0x10,%esp
    1f73:	83 f8 02             	cmp    $0x2,%eax
    1f76:	0f 85 ae 04 00 00    	jne    242a <subdir+0x6ba>
  close(fd);
    1f7c:	83 ec 0c             	sub    $0xc,%esp
    1f7f:	53                   	push   %ebx
    1f80:	e8 c6 19 00 00       	call   394b <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f85:	58                   	pop    %eax
    1f86:	5a                   	pop    %edx
    1f87:	6a 00                	push   $0x0
    1f89:	68 4a 46 00 00       	push   $0x464a
    1f8e:	e8 d0 19 00 00       	call   3963 <open>
    1f93:	83 c4 10             	add    $0x10,%esp
    1f96:	85 c0                	test   %eax,%eax
    1f98:	0f 89 65 02 00 00    	jns    2203 <subdir+0x493>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f9e:	83 ec 08             	sub    $0x8,%esp
    1fa1:	68 02 02 00 00       	push   $0x202
    1fa6:	68 62 47 00 00       	push   $0x4762
    1fab:	e8 b3 19 00 00       	call   3963 <open>
    1fb0:	83 c4 10             	add    $0x10,%esp
    1fb3:	85 c0                	test   %eax,%eax
    1fb5:	0f 89 35 02 00 00    	jns    21f0 <subdir+0x480>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1fbb:	83 ec 08             	sub    $0x8,%esp
    1fbe:	68 02 02 00 00       	push   $0x202
    1fc3:	68 87 47 00 00       	push   $0x4787
    1fc8:	e8 96 19 00 00       	call   3963 <open>
    1fcd:	83 c4 10             	add    $0x10,%esp
    1fd0:	85 c0                	test   %eax,%eax
    1fd2:	0f 89 0f 03 00 00    	jns    22e7 <subdir+0x577>
  if(open("dd", O_CREATE) >= 0){
    1fd8:	83 ec 08             	sub    $0x8,%esp
    1fdb:	68 00 02 00 00       	push   $0x200
    1fe0:	68 14 47 00 00       	push   $0x4714
    1fe5:	e8 79 19 00 00       	call   3963 <open>
    1fea:	83 c4 10             	add    $0x10,%esp
    1fed:	85 c0                	test   %eax,%eax
    1fef:	0f 89 df 02 00 00    	jns    22d4 <subdir+0x564>
  if(open("dd", O_RDWR) >= 0){
    1ff5:	83 ec 08             	sub    $0x8,%esp
    1ff8:	6a 02                	push   $0x2
    1ffa:	68 14 47 00 00       	push   $0x4714
    1fff:	e8 5f 19 00 00       	call   3963 <open>
    2004:	83 c4 10             	add    $0x10,%esp
    2007:	85 c0                	test   %eax,%eax
    2009:	0f 89 b2 02 00 00    	jns    22c1 <subdir+0x551>
  if(open("dd", O_WRONLY) >= 0){
    200f:	83 ec 08             	sub    $0x8,%esp
    2012:	6a 01                	push   $0x1
    2014:	68 14 47 00 00       	push   $0x4714
    2019:	e8 45 19 00 00       	call   3963 <open>
    201e:	83 c4 10             	add    $0x10,%esp
    2021:	85 c0                	test   %eax,%eax
    2023:	0f 89 85 02 00 00    	jns    22ae <subdir+0x53e>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2029:	83 ec 08             	sub    $0x8,%esp
    202c:	68 f6 47 00 00       	push   $0x47f6
    2031:	68 62 47 00 00       	push   $0x4762
    2036:	e8 48 19 00 00       	call   3983 <link>
    203b:	83 c4 10             	add    $0x10,%esp
    203e:	85 c0                	test   %eax,%eax
    2040:	0f 84 55 02 00 00    	je     229b <subdir+0x52b>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    2046:	83 ec 08             	sub    $0x8,%esp
    2049:	68 f6 47 00 00       	push   $0x47f6
    204e:	68 87 47 00 00       	push   $0x4787
    2053:	e8 2b 19 00 00       	call   3983 <link>
    2058:	83 c4 10             	add    $0x10,%esp
    205b:	85 c0                	test   %eax,%eax
    205d:	0f 84 25 02 00 00    	je     2288 <subdir+0x518>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2063:	83 ec 08             	sub    $0x8,%esp
    2066:	68 ae 46 00 00       	push   $0x46ae
    206b:	68 4d 46 00 00       	push   $0x464d
    2070:	e8 0e 19 00 00       	call   3983 <link>
    2075:	83 c4 10             	add    $0x10,%esp
    2078:	85 c0                	test   %eax,%eax
    207a:	0f 84 a9 01 00 00    	je     2229 <subdir+0x4b9>
  if(mkdir("dd/ff/ff") == 0){
    2080:	83 ec 0c             	sub    $0xc,%esp
    2083:	68 62 47 00 00       	push   $0x4762
    2088:	e8 fe 18 00 00       	call   398b <mkdir>
    208d:	83 c4 10             	add    $0x10,%esp
    2090:	85 c0                	test   %eax,%eax
    2092:	0f 84 7e 01 00 00    	je     2216 <subdir+0x4a6>
  if(mkdir("dd/xx/ff") == 0){
    2098:	83 ec 0c             	sub    $0xc,%esp
    209b:	68 87 47 00 00       	push   $0x4787
    20a0:	e8 e6 18 00 00       	call   398b <mkdir>
    20a5:	83 c4 10             	add    $0x10,%esp
    20a8:	85 c0                	test   %eax,%eax
    20aa:	0f 84 67 03 00 00    	je     2417 <subdir+0x6a7>
  if(mkdir("dd/dd/ffff") == 0){
    20b0:	83 ec 0c             	sub    $0xc,%esp
    20b3:	68 ae 46 00 00       	push   $0x46ae
    20b8:	e8 ce 18 00 00       	call   398b <mkdir>
    20bd:	83 c4 10             	add    $0x10,%esp
    20c0:	85 c0                	test   %eax,%eax
    20c2:	0f 84 3c 03 00 00    	je     2404 <subdir+0x694>
  if(unlink("dd/xx/ff") == 0){
    20c8:	83 ec 0c             	sub    $0xc,%esp
    20cb:	68 87 47 00 00       	push   $0x4787
    20d0:	e8 9e 18 00 00       	call   3973 <unlink>
    20d5:	83 c4 10             	add    $0x10,%esp
    20d8:	85 c0                	test   %eax,%eax
    20da:	0f 84 11 03 00 00    	je     23f1 <subdir+0x681>
  if(unlink("dd/ff/ff") == 0){
    20e0:	83 ec 0c             	sub    $0xc,%esp
    20e3:	68 62 47 00 00       	push   $0x4762
    20e8:	e8 86 18 00 00       	call   3973 <unlink>
    20ed:	83 c4 10             	add    $0x10,%esp
    20f0:	85 c0                	test   %eax,%eax
    20f2:	0f 84 e6 02 00 00    	je     23de <subdir+0x66e>
  if(chdir("dd/ff") == 0){
    20f8:	83 ec 0c             	sub    $0xc,%esp
    20fb:	68 4d 46 00 00       	push   $0x464d
    2100:	e8 8e 18 00 00       	call   3993 <chdir>
    2105:	83 c4 10             	add    $0x10,%esp
    2108:	85 c0                	test   %eax,%eax
    210a:	0f 84 bb 02 00 00    	je     23cb <subdir+0x65b>
  if(chdir("dd/xx") == 0){
    2110:	83 ec 0c             	sub    $0xc,%esp
    2113:	68 f9 47 00 00       	push   $0x47f9
    2118:	e8 76 18 00 00       	call   3993 <chdir>
    211d:	83 c4 10             	add    $0x10,%esp
    2120:	85 c0                	test   %eax,%eax
    2122:	0f 84 90 02 00 00    	je     23b8 <subdir+0x648>
  if(unlink("dd/dd/ffff") != 0){
    2128:	83 ec 0c             	sub    $0xc,%esp
    212b:	68 ae 46 00 00       	push   $0x46ae
    2130:	e8 3e 18 00 00       	call   3973 <unlink>
    2135:	83 c4 10             	add    $0x10,%esp
    2138:	85 c0                	test   %eax,%eax
    213a:	0f 85 9d 00 00 00    	jne    21dd <subdir+0x46d>
  if(unlink("dd/ff") != 0){
    2140:	83 ec 0c             	sub    $0xc,%esp
    2143:	68 4d 46 00 00       	push   $0x464d
    2148:	e8 26 18 00 00       	call   3973 <unlink>
    214d:	83 c4 10             	add    $0x10,%esp
    2150:	85 c0                	test   %eax,%eax
    2152:	0f 85 4d 02 00 00    	jne    23a5 <subdir+0x635>
  if(unlink("dd") == 0){
    2158:	83 ec 0c             	sub    $0xc,%esp
    215b:	68 14 47 00 00       	push   $0x4714
    2160:	e8 0e 18 00 00       	call   3973 <unlink>
    2165:	83 c4 10             	add    $0x10,%esp
    2168:	85 c0                	test   %eax,%eax
    216a:	0f 84 22 02 00 00    	je     2392 <subdir+0x622>
  if(unlink("dd/dd") < 0){
    2170:	83 ec 0c             	sub    $0xc,%esp
    2173:	68 29 46 00 00       	push   $0x4629
    2178:	e8 f6 17 00 00       	call   3973 <unlink>
    217d:	83 c4 10             	add    $0x10,%esp
    2180:	85 c0                	test   %eax,%eax
    2182:	0f 88 f7 01 00 00    	js     237f <subdir+0x60f>
  if(unlink("dd") < 0){
    2188:	83 ec 0c             	sub    $0xc,%esp
    218b:	68 14 47 00 00       	push   $0x4714
    2190:	e8 de 17 00 00       	call   3973 <unlink>
    2195:	83 c4 10             	add    $0x10,%esp
    2198:	85 c0                	test   %eax,%eax
    219a:	0f 88 cc 01 00 00    	js     236c <subdir+0x5fc>
  printf(1, "subdir ok\n");
    21a0:	83 ec 08             	sub    $0x8,%esp
    21a3:	68 f6 48 00 00       	push   $0x48f6
    21a8:	6a 01                	push   $0x1
    21aa:	e8 f1 18 00 00       	call   3aa0 <printf>
}
    21af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    21b2:	83 c4 10             	add    $0x10,%esp
    21b5:	c9                   	leave  
    21b6:	c3                   	ret    
    printf(1, "dd/dd/../ff wrong content\n");
    21b7:	50                   	push   %eax
    21b8:	50                   	push   %eax
    21b9:	68 93 46 00 00       	push   $0x4693
    21be:	6a 01                	push   $0x1
    21c0:	e8 db 18 00 00       	call   3aa0 <printf>
    exit();
    21c5:	e8 59 17 00 00       	call   3923 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    21ca:	50                   	push   %eax
    21cb:	50                   	push   %eax
    21cc:	68 ee 46 00 00       	push   $0x46ee
    21d1:	6a 01                	push   $0x1
    21d3:	e8 c8 18 00 00       	call   3aa0 <printf>
    exit();
    21d8:	e8 46 17 00 00       	call   3923 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    21dd:	50                   	push   %eax
    21de:	50                   	push   %eax
    21df:	68 b9 46 00 00       	push   $0x46b9
    21e4:	6a 01                	push   $0x1
    21e6:	e8 b5 18 00 00       	call   3aa0 <printf>
    exit();
    21eb:	e8 33 17 00 00       	call   3923 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    21f0:	51                   	push   %ecx
    21f1:	51                   	push   %ecx
    21f2:	68 6b 47 00 00       	push   $0x476b
    21f7:	6a 01                	push   $0x1
    21f9:	e8 a2 18 00 00       	call   3aa0 <printf>
    exit();
    21fe:	e8 20 17 00 00       	call   3923 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2203:	53                   	push   %ebx
    2204:	53                   	push   %ebx
    2205:	68 50 51 00 00       	push   $0x5150
    220a:	6a 01                	push   $0x1
    220c:	e8 8f 18 00 00       	call   3aa0 <printf>
    exit();
    2211:	e8 0d 17 00 00       	call   3923 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2216:	51                   	push   %ecx
    2217:	51                   	push   %ecx
    2218:	68 ff 47 00 00       	push   $0x47ff
    221d:	6a 01                	push   $0x1
    221f:	e8 7c 18 00 00       	call   3aa0 <printf>
    exit();
    2224:	e8 fa 16 00 00       	call   3923 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2229:	53                   	push   %ebx
    222a:	53                   	push   %ebx
    222b:	68 c0 51 00 00       	push   $0x51c0
    2230:	6a 01                	push   $0x1
    2232:	e8 69 18 00 00       	call   3aa0 <printf>
    exit();
    2237:	e8 e7 16 00 00       	call   3923 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    223c:	50                   	push   %eax
    223d:	50                   	push   %eax
    223e:	68 7a 46 00 00       	push   $0x467a
    2243:	6a 01                	push   $0x1
    2245:	e8 56 18 00 00       	call   3aa0 <printf>
    exit();
    224a:	e8 d4 16 00 00       	call   3923 <exit>
    printf(1, "create dd/dd/ff failed\n");
    224f:	51                   	push   %ecx
    2250:	51                   	push   %ecx
    2251:	68 53 46 00 00       	push   $0x4653
    2256:	6a 01                	push   $0x1
    2258:	e8 43 18 00 00       	call   3aa0 <printf>
    exit();
    225d:	e8 c1 16 00 00       	call   3923 <exit>
    printf(1, "chdir ./.. failed\n");
    2262:	50                   	push   %eax
    2263:	50                   	push   %eax
    2264:	68 1c 47 00 00       	push   $0x471c
    2269:	6a 01                	push   $0x1
    226b:	e8 30 18 00 00       	call   3aa0 <printf>
    exit();
    2270:	e8 ae 16 00 00       	call   3923 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2275:	52                   	push   %edx
    2276:	52                   	push   %edx
    2277:	68 08 51 00 00       	push   $0x5108
    227c:	6a 01                	push   $0x1
    227e:	e8 1d 18 00 00       	call   3aa0 <printf>
    exit();
    2283:	e8 9b 16 00 00       	call   3923 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2288:	50                   	push   %eax
    2289:	50                   	push   %eax
    228a:	68 9c 51 00 00       	push   $0x519c
    228f:	6a 01                	push   $0x1
    2291:	e8 0a 18 00 00       	call   3aa0 <printf>
    exit();
    2296:	e8 88 16 00 00       	call   3923 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    229b:	50                   	push   %eax
    229c:	50                   	push   %eax
    229d:	68 78 51 00 00       	push   $0x5178
    22a2:	6a 01                	push   $0x1
    22a4:	e8 f7 17 00 00       	call   3aa0 <printf>
    exit();
    22a9:	e8 75 16 00 00       	call   3923 <exit>
    printf(1, "open dd wronly succeeded!\n");
    22ae:	50                   	push   %eax
    22af:	50                   	push   %eax
    22b0:	68 db 47 00 00       	push   $0x47db
    22b5:	6a 01                	push   $0x1
    22b7:	e8 e4 17 00 00       	call   3aa0 <printf>
    exit();
    22bc:	e8 62 16 00 00       	call   3923 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    22c1:	50                   	push   %eax
    22c2:	50                   	push   %eax
    22c3:	68 c2 47 00 00       	push   $0x47c2
    22c8:	6a 01                	push   $0x1
    22ca:	e8 d1 17 00 00       	call   3aa0 <printf>
    exit();
    22cf:	e8 4f 16 00 00       	call   3923 <exit>
    printf(1, "create dd succeeded!\n");
    22d4:	50                   	push   %eax
    22d5:	50                   	push   %eax
    22d6:	68 ac 47 00 00       	push   $0x47ac
    22db:	6a 01                	push   $0x1
    22dd:	e8 be 17 00 00       	call   3aa0 <printf>
    exit();
    22e2:	e8 3c 16 00 00       	call   3923 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    22e7:	52                   	push   %edx
    22e8:	52                   	push   %edx
    22e9:	68 90 47 00 00       	push   $0x4790
    22ee:	6a 01                	push   $0x1
    22f0:	e8 ab 17 00 00       	call   3aa0 <printf>
    exit();
    22f5:	e8 29 16 00 00       	call   3923 <exit>
    printf(1, "chdir dd failed\n");
    22fa:	50                   	push   %eax
    22fb:	50                   	push   %eax
    22fc:	68 d1 46 00 00       	push   $0x46d1
    2301:	6a 01                	push   $0x1
    2303:	e8 98 17 00 00       	call   3aa0 <printf>
    exit();
    2308:	e8 16 16 00 00       	call   3923 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    230d:	50                   	push   %eax
    230e:	50                   	push   %eax
    230f:	68 2c 51 00 00       	push   $0x512c
    2314:	6a 01                	push   $0x1
    2316:	e8 85 17 00 00       	call   3aa0 <printf>
    exit();
    231b:	e8 03 16 00 00       	call   3923 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    2320:	53                   	push   %ebx
    2321:	53                   	push   %ebx
    2322:	68 2f 46 00 00       	push   $0x462f
    2327:	6a 01                	push   $0x1
    2329:	e8 72 17 00 00       	call   3aa0 <printf>
    exit();
    232e:	e8 f0 15 00 00       	call   3923 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    2333:	50                   	push   %eax
    2334:	50                   	push   %eax
    2335:	68 e0 50 00 00       	push   $0x50e0
    233a:	6a 01                	push   $0x1
    233c:	e8 5f 17 00 00       	call   3aa0 <printf>
    exit();
    2341:	e8 dd 15 00 00       	call   3923 <exit>
    printf(1, "create dd/ff failed\n");
    2346:	50                   	push   %eax
    2347:	50                   	push   %eax
    2348:	68 13 46 00 00       	push   $0x4613
    234d:	6a 01                	push   $0x1
    234f:	e8 4c 17 00 00       	call   3aa0 <printf>
    exit();
    2354:	e8 ca 15 00 00       	call   3923 <exit>
    printf(1, "subdir mkdir dd failed\n");
    2359:	50                   	push   %eax
    235a:	50                   	push   %eax
    235b:	68 fb 45 00 00       	push   $0x45fb
    2360:	6a 01                	push   $0x1
    2362:	e8 39 17 00 00       	call   3aa0 <printf>
    exit();
    2367:	e8 b7 15 00 00       	call   3923 <exit>
    printf(1, "unlink dd failed\n");
    236c:	50                   	push   %eax
    236d:	50                   	push   %eax
    236e:	68 e4 48 00 00       	push   $0x48e4
    2373:	6a 01                	push   $0x1
    2375:	e8 26 17 00 00       	call   3aa0 <printf>
    exit();
    237a:	e8 a4 15 00 00       	call   3923 <exit>
    printf(1, "unlink dd/dd failed\n");
    237f:	52                   	push   %edx
    2380:	52                   	push   %edx
    2381:	68 cf 48 00 00       	push   $0x48cf
    2386:	6a 01                	push   $0x1
    2388:	e8 13 17 00 00       	call   3aa0 <printf>
    exit();
    238d:	e8 91 15 00 00       	call   3923 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    2392:	51                   	push   %ecx
    2393:	51                   	push   %ecx
    2394:	68 e4 51 00 00       	push   $0x51e4
    2399:	6a 01                	push   $0x1
    239b:	e8 00 17 00 00       	call   3aa0 <printf>
    exit();
    23a0:	e8 7e 15 00 00       	call   3923 <exit>
    printf(1, "unlink dd/ff failed\n");
    23a5:	53                   	push   %ebx
    23a6:	53                   	push   %ebx
    23a7:	68 ba 48 00 00       	push   $0x48ba
    23ac:	6a 01                	push   $0x1
    23ae:	e8 ed 16 00 00       	call   3aa0 <printf>
    exit();
    23b3:	e8 6b 15 00 00       	call   3923 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    23b8:	50                   	push   %eax
    23b9:	50                   	push   %eax
    23ba:	68 a2 48 00 00       	push   $0x48a2
    23bf:	6a 01                	push   $0x1
    23c1:	e8 da 16 00 00       	call   3aa0 <printf>
    exit();
    23c6:	e8 58 15 00 00       	call   3923 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    23cb:	50                   	push   %eax
    23cc:	50                   	push   %eax
    23cd:	68 8a 48 00 00       	push   $0x488a
    23d2:	6a 01                	push   $0x1
    23d4:	e8 c7 16 00 00       	call   3aa0 <printf>
    exit();
    23d9:	e8 45 15 00 00       	call   3923 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    23de:	50                   	push   %eax
    23df:	50                   	push   %eax
    23e0:	68 6e 48 00 00       	push   $0x486e
    23e5:	6a 01                	push   $0x1
    23e7:	e8 b4 16 00 00       	call   3aa0 <printf>
    exit();
    23ec:	e8 32 15 00 00       	call   3923 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    23f1:	50                   	push   %eax
    23f2:	50                   	push   %eax
    23f3:	68 52 48 00 00       	push   $0x4852
    23f8:	6a 01                	push   $0x1
    23fa:	e8 a1 16 00 00       	call   3aa0 <printf>
    exit();
    23ff:	e8 1f 15 00 00       	call   3923 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2404:	50                   	push   %eax
    2405:	50                   	push   %eax
    2406:	68 35 48 00 00       	push   $0x4835
    240b:	6a 01                	push   $0x1
    240d:	e8 8e 16 00 00       	call   3aa0 <printf>
    exit();
    2412:	e8 0c 15 00 00       	call   3923 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2417:	52                   	push   %edx
    2418:	52                   	push   %edx
    2419:	68 1a 48 00 00       	push   $0x481a
    241e:	6a 01                	push   $0x1
    2420:	e8 7b 16 00 00       	call   3aa0 <printf>
    exit();
    2425:	e8 f9 14 00 00       	call   3923 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    242a:	51                   	push   %ecx
    242b:	51                   	push   %ecx
    242c:	68 47 47 00 00       	push   $0x4747
    2431:	6a 01                	push   $0x1
    2433:	e8 68 16 00 00       	call   3aa0 <printf>
    exit();
    2438:	e8 e6 14 00 00       	call   3923 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    243d:	53                   	push   %ebx
    243e:	53                   	push   %ebx
    243f:	68 2f 47 00 00       	push   $0x472f
    2444:	6a 01                	push   $0x1
    2446:	e8 55 16 00 00       	call   3aa0 <printf>
    exit();
    244b:	e8 d3 14 00 00       	call   3923 <exit>

00002450 <bigwrite>:
{
    2450:	55                   	push   %ebp
    2451:	89 e5                	mov    %esp,%ebp
    2453:	56                   	push   %esi
    2454:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    2455:	bb f3 01 00 00       	mov    $0x1f3,%ebx
  printf(1, "bigwrite test\n");
    245a:	83 ec 08             	sub    $0x8,%esp
    245d:	68 01 49 00 00       	push   $0x4901
    2462:	6a 01                	push   $0x1
    2464:	e8 37 16 00 00       	call   3aa0 <printf>
  unlink("bigwrite");
    2469:	c7 04 24 10 49 00 00 	movl   $0x4910,(%esp)
    2470:	e8 fe 14 00 00       	call   3973 <unlink>
    2475:	83 c4 10             	add    $0x10,%esp
    2478:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    247f:	90                   	nop
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2480:	83 ec 08             	sub    $0x8,%esp
    2483:	68 02 02 00 00       	push   $0x202
    2488:	68 10 49 00 00       	push   $0x4910
    248d:	e8 d1 14 00 00       	call   3963 <open>
    if(fd < 0){
    2492:	83 c4 10             	add    $0x10,%esp
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2495:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2497:	85 c0                	test   %eax,%eax
    2499:	78 7e                	js     2519 <bigwrite+0xc9>
      int cc = write(fd, buf, sz);
    249b:	83 ec 04             	sub    $0x4,%esp
    249e:	53                   	push   %ebx
    249f:	68 40 87 00 00       	push   $0x8740
    24a4:	50                   	push   %eax
    24a5:	e8 99 14 00 00       	call   3943 <write>
      if(cc != sz){
    24aa:	83 c4 10             	add    $0x10,%esp
    24ad:	39 d8                	cmp    %ebx,%eax
    24af:	75 55                	jne    2506 <bigwrite+0xb6>
      int cc = write(fd, buf, sz);
    24b1:	83 ec 04             	sub    $0x4,%esp
    24b4:	53                   	push   %ebx
    24b5:	68 40 87 00 00       	push   $0x8740
    24ba:	56                   	push   %esi
    24bb:	e8 83 14 00 00       	call   3943 <write>
      if(cc != sz){
    24c0:	83 c4 10             	add    $0x10,%esp
    24c3:	39 d8                	cmp    %ebx,%eax
    24c5:	75 3f                	jne    2506 <bigwrite+0xb6>
    close(fd);
    24c7:	83 ec 0c             	sub    $0xc,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    24ca:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    24d0:	56                   	push   %esi
    24d1:	e8 75 14 00 00       	call   394b <close>
    unlink("bigwrite");
    24d6:	c7 04 24 10 49 00 00 	movl   $0x4910,(%esp)
    24dd:	e8 91 14 00 00       	call   3973 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    24e2:	83 c4 10             	add    $0x10,%esp
    24e5:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    24eb:	75 93                	jne    2480 <bigwrite+0x30>
  printf(1, "bigwrite ok\n");
    24ed:	83 ec 08             	sub    $0x8,%esp
    24f0:	68 43 49 00 00       	push   $0x4943
    24f5:	6a 01                	push   $0x1
    24f7:	e8 a4 15 00 00       	call   3aa0 <printf>
}
    24fc:	83 c4 10             	add    $0x10,%esp
    24ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2502:	5b                   	pop    %ebx
    2503:	5e                   	pop    %esi
    2504:	5d                   	pop    %ebp
    2505:	c3                   	ret    
        printf(1, "write(%d) ret %d\n", sz, cc);
    2506:	50                   	push   %eax
    2507:	53                   	push   %ebx
    2508:	68 31 49 00 00       	push   $0x4931
    250d:	6a 01                	push   $0x1
    250f:	e8 8c 15 00 00       	call   3aa0 <printf>
        exit();
    2514:	e8 0a 14 00 00       	call   3923 <exit>
      printf(1, "cannot create bigwrite\n");
    2519:	83 ec 08             	sub    $0x8,%esp
    251c:	68 19 49 00 00       	push   $0x4919
    2521:	6a 01                	push   $0x1
    2523:	e8 78 15 00 00       	call   3aa0 <printf>
      exit();
    2528:	e8 f6 13 00 00       	call   3923 <exit>
    252d:	8d 76 00             	lea    0x0(%esi),%esi

00002530 <bigfile>:
{
    2530:	55                   	push   %ebp
    2531:	89 e5                	mov    %esp,%ebp
    2533:	57                   	push   %edi
    2534:	56                   	push   %esi
    2535:	53                   	push   %ebx
    2536:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigfile test\n");
    2539:	68 50 49 00 00       	push   $0x4950
    253e:	6a 01                	push   $0x1
    2540:	e8 5b 15 00 00       	call   3aa0 <printf>
  unlink("bigfile");
    2545:	c7 04 24 6c 49 00 00 	movl   $0x496c,(%esp)
    254c:	e8 22 14 00 00       	call   3973 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2551:	58                   	pop    %eax
    2552:	5a                   	pop    %edx
    2553:	68 02 02 00 00       	push   $0x202
    2558:	68 6c 49 00 00       	push   $0x496c
    255d:	e8 01 14 00 00       	call   3963 <open>
  if(fd < 0){
    2562:	83 c4 10             	add    $0x10,%esp
    2565:	85 c0                	test   %eax,%eax
    2567:	0f 88 5e 01 00 00    	js     26cb <bigfile+0x19b>
    256d:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++){
    256f:	31 db                	xor    %ebx,%ebx
    2571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    memset(buf, i, 600);
    2578:	83 ec 04             	sub    $0x4,%esp
    257b:	68 58 02 00 00       	push   $0x258
    2580:	53                   	push   %ebx
    2581:	68 40 87 00 00       	push   $0x8740
    2586:	e8 05 12 00 00       	call   3790 <memset>
    if(write(fd, buf, 600) != 600){
    258b:	83 c4 0c             	add    $0xc,%esp
    258e:	68 58 02 00 00       	push   $0x258
    2593:	68 40 87 00 00       	push   $0x8740
    2598:	56                   	push   %esi
    2599:	e8 a5 13 00 00       	call   3943 <write>
    259e:	83 c4 10             	add    $0x10,%esp
    25a1:	3d 58 02 00 00       	cmp    $0x258,%eax
    25a6:	0f 85 f8 00 00 00    	jne    26a4 <bigfile+0x174>
  for(i = 0; i < 20; i++){
    25ac:	83 c3 01             	add    $0x1,%ebx
    25af:	83 fb 14             	cmp    $0x14,%ebx
    25b2:	75 c4                	jne    2578 <bigfile+0x48>
  close(fd);
    25b4:	83 ec 0c             	sub    $0xc,%esp
    25b7:	56                   	push   %esi
    25b8:	e8 8e 13 00 00       	call   394b <close>
  fd = open("bigfile", 0);
    25bd:	5e                   	pop    %esi
    25be:	5f                   	pop    %edi
    25bf:	6a 00                	push   $0x0
    25c1:	68 6c 49 00 00       	push   $0x496c
    25c6:	e8 98 13 00 00       	call   3963 <open>
  if(fd < 0){
    25cb:	83 c4 10             	add    $0x10,%esp
  fd = open("bigfile", 0);
    25ce:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    25d0:	85 c0                	test   %eax,%eax
    25d2:	0f 88 e0 00 00 00    	js     26b8 <bigfile+0x188>
  total = 0;
    25d8:	31 db                	xor    %ebx,%ebx
  for(i = 0; ; i++){
    25da:	31 ff                	xor    %edi,%edi
    25dc:	eb 30                	jmp    260e <bigfile+0xde>
    25de:	66 90                	xchg   %ax,%ax
    if(cc != 300){
    25e0:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    25e5:	0f 85 91 00 00 00    	jne    267c <bigfile+0x14c>
    if(buf[0] != i/2 || buf[299] != i/2){
    25eb:	89 fa                	mov    %edi,%edx
    25ed:	0f be 05 40 87 00 00 	movsbl 0x8740,%eax
    25f4:	d1 fa                	sar    %edx
    25f6:	39 d0                	cmp    %edx,%eax
    25f8:	75 6e                	jne    2668 <bigfile+0x138>
    25fa:	0f be 15 6b 88 00 00 	movsbl 0x886b,%edx
    2601:	39 d0                	cmp    %edx,%eax
    2603:	75 63                	jne    2668 <bigfile+0x138>
    total += cc;
    2605:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  for(i = 0; ; i++){
    260b:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    260e:	83 ec 04             	sub    $0x4,%esp
    2611:	68 2c 01 00 00       	push   $0x12c
    2616:	68 40 87 00 00       	push   $0x8740
    261b:	56                   	push   %esi
    261c:	e8 1a 13 00 00       	call   393b <read>
    if(cc < 0){
    2621:	83 c4 10             	add    $0x10,%esp
    2624:	85 c0                	test   %eax,%eax
    2626:	78 68                	js     2690 <bigfile+0x160>
    if(cc == 0)
    2628:	75 b6                	jne    25e0 <bigfile+0xb0>
  close(fd);
    262a:	83 ec 0c             	sub    $0xc,%esp
    262d:	56                   	push   %esi
    262e:	e8 18 13 00 00       	call   394b <close>
  if(total != 20*600){
    2633:	83 c4 10             	add    $0x10,%esp
    2636:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    263c:	0f 85 9c 00 00 00    	jne    26de <bigfile+0x1ae>
  unlink("bigfile");
    2642:	83 ec 0c             	sub    $0xc,%esp
    2645:	68 6c 49 00 00       	push   $0x496c
    264a:	e8 24 13 00 00       	call   3973 <unlink>
  printf(1, "bigfile test ok\n");
    264f:	58                   	pop    %eax
    2650:	5a                   	pop    %edx
    2651:	68 fb 49 00 00       	push   $0x49fb
    2656:	6a 01                	push   $0x1
    2658:	e8 43 14 00 00       	call   3aa0 <printf>
}
    265d:	83 c4 10             	add    $0x10,%esp
    2660:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2663:	5b                   	pop    %ebx
    2664:	5e                   	pop    %esi
    2665:	5f                   	pop    %edi
    2666:	5d                   	pop    %ebp
    2667:	c3                   	ret    
      printf(1, "read bigfile wrong data\n");
    2668:	83 ec 08             	sub    $0x8,%esp
    266b:	68 c8 49 00 00       	push   $0x49c8
    2670:	6a 01                	push   $0x1
    2672:	e8 29 14 00 00       	call   3aa0 <printf>
      exit();
    2677:	e8 a7 12 00 00       	call   3923 <exit>
      printf(1, "short read bigfile\n");
    267c:	83 ec 08             	sub    $0x8,%esp
    267f:	68 b4 49 00 00       	push   $0x49b4
    2684:	6a 01                	push   $0x1
    2686:	e8 15 14 00 00       	call   3aa0 <printf>
      exit();
    268b:	e8 93 12 00 00       	call   3923 <exit>
      printf(1, "read bigfile failed\n");
    2690:	83 ec 08             	sub    $0x8,%esp
    2693:	68 9f 49 00 00       	push   $0x499f
    2698:	6a 01                	push   $0x1
    269a:	e8 01 14 00 00       	call   3aa0 <printf>
      exit();
    269f:	e8 7f 12 00 00       	call   3923 <exit>
      printf(1, "write bigfile failed\n");
    26a4:	83 ec 08             	sub    $0x8,%esp
    26a7:	68 74 49 00 00       	push   $0x4974
    26ac:	6a 01                	push   $0x1
    26ae:	e8 ed 13 00 00       	call   3aa0 <printf>
      exit();
    26b3:	e8 6b 12 00 00       	call   3923 <exit>
    printf(1, "cannot open bigfile\n");
    26b8:	53                   	push   %ebx
    26b9:	53                   	push   %ebx
    26ba:	68 8a 49 00 00       	push   $0x498a
    26bf:	6a 01                	push   $0x1
    26c1:	e8 da 13 00 00       	call   3aa0 <printf>
    exit();
    26c6:	e8 58 12 00 00       	call   3923 <exit>
    printf(1, "cannot create bigfile");
    26cb:	50                   	push   %eax
    26cc:	50                   	push   %eax
    26cd:	68 5e 49 00 00       	push   $0x495e
    26d2:	6a 01                	push   $0x1
    26d4:	e8 c7 13 00 00       	call   3aa0 <printf>
    exit();
    26d9:	e8 45 12 00 00       	call   3923 <exit>
    printf(1, "read bigfile wrong total\n");
    26de:	51                   	push   %ecx
    26df:	51                   	push   %ecx
    26e0:	68 e1 49 00 00       	push   $0x49e1
    26e5:	6a 01                	push   $0x1
    26e7:	e8 b4 13 00 00       	call   3aa0 <printf>
    exit();
    26ec:	e8 32 12 00 00       	call   3923 <exit>
    26f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    26f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    26ff:	90                   	nop

00002700 <fourteen>:
{
    2700:	55                   	push   %ebp
    2701:	89 e5                	mov    %esp,%ebp
    2703:	83 ec 10             	sub    $0x10,%esp
  printf(1, "fourteen test\n");
    2706:	68 0c 4a 00 00       	push   $0x4a0c
    270b:	6a 01                	push   $0x1
    270d:	e8 8e 13 00 00       	call   3aa0 <printf>
  if(mkdir("12345678901234") != 0){
    2712:	c7 04 24 47 4a 00 00 	movl   $0x4a47,(%esp)
    2719:	e8 6d 12 00 00       	call   398b <mkdir>
    271e:	83 c4 10             	add    $0x10,%esp
    2721:	85 c0                	test   %eax,%eax
    2723:	0f 85 97 00 00 00    	jne    27c0 <fourteen+0xc0>
  if(mkdir("12345678901234/123456789012345") != 0){
    2729:	83 ec 0c             	sub    $0xc,%esp
    272c:	68 04 52 00 00       	push   $0x5204
    2731:	e8 55 12 00 00       	call   398b <mkdir>
    2736:	83 c4 10             	add    $0x10,%esp
    2739:	85 c0                	test   %eax,%eax
    273b:	0f 85 de 00 00 00    	jne    281f <fourteen+0x11f>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2741:	83 ec 08             	sub    $0x8,%esp
    2744:	68 00 02 00 00       	push   $0x200
    2749:	68 54 52 00 00       	push   $0x5254
    274e:	e8 10 12 00 00       	call   3963 <open>
  if(fd < 0){
    2753:	83 c4 10             	add    $0x10,%esp
    2756:	85 c0                	test   %eax,%eax
    2758:	0f 88 ae 00 00 00    	js     280c <fourteen+0x10c>
  close(fd);
    275e:	83 ec 0c             	sub    $0xc,%esp
    2761:	50                   	push   %eax
    2762:	e8 e4 11 00 00       	call   394b <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2767:	58                   	pop    %eax
    2768:	5a                   	pop    %edx
    2769:	6a 00                	push   $0x0
    276b:	68 c4 52 00 00       	push   $0x52c4
    2770:	e8 ee 11 00 00       	call   3963 <open>
  if(fd < 0){
    2775:	83 c4 10             	add    $0x10,%esp
    2778:	85 c0                	test   %eax,%eax
    277a:	78 7d                	js     27f9 <fourteen+0xf9>
  close(fd);
    277c:	83 ec 0c             	sub    $0xc,%esp
    277f:	50                   	push   %eax
    2780:	e8 c6 11 00 00       	call   394b <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    2785:	c7 04 24 38 4a 00 00 	movl   $0x4a38,(%esp)
    278c:	e8 fa 11 00 00       	call   398b <mkdir>
    2791:	83 c4 10             	add    $0x10,%esp
    2794:	85 c0                	test   %eax,%eax
    2796:	74 4e                	je     27e6 <fourteen+0xe6>
  if(mkdir("123456789012345/12345678901234") == 0){
    2798:	83 ec 0c             	sub    $0xc,%esp
    279b:	68 60 53 00 00       	push   $0x5360
    27a0:	e8 e6 11 00 00       	call   398b <mkdir>
    27a5:	83 c4 10             	add    $0x10,%esp
    27a8:	85 c0                	test   %eax,%eax
    27aa:	74 27                	je     27d3 <fourteen+0xd3>
  printf(1, "fourteen ok\n");
    27ac:	83 ec 08             	sub    $0x8,%esp
    27af:	68 56 4a 00 00       	push   $0x4a56
    27b4:	6a 01                	push   $0x1
    27b6:	e8 e5 12 00 00       	call   3aa0 <printf>
}
    27bb:	83 c4 10             	add    $0x10,%esp
    27be:	c9                   	leave  
    27bf:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    27c0:	50                   	push   %eax
    27c1:	50                   	push   %eax
    27c2:	68 1b 4a 00 00       	push   $0x4a1b
    27c7:	6a 01                	push   $0x1
    27c9:	e8 d2 12 00 00       	call   3aa0 <printf>
    exit();
    27ce:	e8 50 11 00 00       	call   3923 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    27d3:	50                   	push   %eax
    27d4:	50                   	push   %eax
    27d5:	68 80 53 00 00       	push   $0x5380
    27da:	6a 01                	push   $0x1
    27dc:	e8 bf 12 00 00       	call   3aa0 <printf>
    exit();
    27e1:	e8 3d 11 00 00       	call   3923 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    27e6:	52                   	push   %edx
    27e7:	52                   	push   %edx
    27e8:	68 30 53 00 00       	push   $0x5330
    27ed:	6a 01                	push   $0x1
    27ef:	e8 ac 12 00 00       	call   3aa0 <printf>
    exit();
    27f4:	e8 2a 11 00 00       	call   3923 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    27f9:	51                   	push   %ecx
    27fa:	51                   	push   %ecx
    27fb:	68 f4 52 00 00       	push   $0x52f4
    2800:	6a 01                	push   $0x1
    2802:	e8 99 12 00 00       	call   3aa0 <printf>
    exit();
    2807:	e8 17 11 00 00       	call   3923 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    280c:	51                   	push   %ecx
    280d:	51                   	push   %ecx
    280e:	68 84 52 00 00       	push   $0x5284
    2813:	6a 01                	push   $0x1
    2815:	e8 86 12 00 00       	call   3aa0 <printf>
    exit();
    281a:	e8 04 11 00 00       	call   3923 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    281f:	50                   	push   %eax
    2820:	50                   	push   %eax
    2821:	68 24 52 00 00       	push   $0x5224
    2826:	6a 01                	push   $0x1
    2828:	e8 73 12 00 00       	call   3aa0 <printf>
    exit();
    282d:	e8 f1 10 00 00       	call   3923 <exit>
    2832:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002840 <rmdot>:
{
    2840:	55                   	push   %ebp
    2841:	89 e5                	mov    %esp,%ebp
    2843:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    2846:	68 63 4a 00 00       	push   $0x4a63
    284b:	6a 01                	push   $0x1
    284d:	e8 4e 12 00 00       	call   3aa0 <printf>
  if(mkdir("dots") != 0){
    2852:	c7 04 24 6f 4a 00 00 	movl   $0x4a6f,(%esp)
    2859:	e8 2d 11 00 00       	call   398b <mkdir>
    285e:	83 c4 10             	add    $0x10,%esp
    2861:	85 c0                	test   %eax,%eax
    2863:	0f 85 b0 00 00 00    	jne    2919 <rmdot+0xd9>
  if(chdir("dots") != 0){
    2869:	83 ec 0c             	sub    $0xc,%esp
    286c:	68 6f 4a 00 00       	push   $0x4a6f
    2871:	e8 1d 11 00 00       	call   3993 <chdir>
    2876:	83 c4 10             	add    $0x10,%esp
    2879:	85 c0                	test   %eax,%eax
    287b:	0f 85 1d 01 00 00    	jne    299e <rmdot+0x15e>
  if(unlink(".") == 0){
    2881:	83 ec 0c             	sub    $0xc,%esp
    2884:	68 1a 47 00 00       	push   $0x471a
    2889:	e8 e5 10 00 00       	call   3973 <unlink>
    288e:	83 c4 10             	add    $0x10,%esp
    2891:	85 c0                	test   %eax,%eax
    2893:	0f 84 f2 00 00 00    	je     298b <rmdot+0x14b>
  if(unlink("..") == 0){
    2899:	83 ec 0c             	sub    $0xc,%esp
    289c:	68 19 47 00 00       	push   $0x4719
    28a1:	e8 cd 10 00 00       	call   3973 <unlink>
    28a6:	83 c4 10             	add    $0x10,%esp
    28a9:	85 c0                	test   %eax,%eax
    28ab:	0f 84 c7 00 00 00    	je     2978 <rmdot+0x138>
  if(chdir("/") != 0){
    28b1:	83 ec 0c             	sub    $0xc,%esp
    28b4:	68 ed 3e 00 00       	push   $0x3eed
    28b9:	e8 d5 10 00 00       	call   3993 <chdir>
    28be:	83 c4 10             	add    $0x10,%esp
    28c1:	85 c0                	test   %eax,%eax
    28c3:	0f 85 9c 00 00 00    	jne    2965 <rmdot+0x125>
  if(unlink("dots/.") == 0){
    28c9:	83 ec 0c             	sub    $0xc,%esp
    28cc:	68 b7 4a 00 00       	push   $0x4ab7
    28d1:	e8 9d 10 00 00       	call   3973 <unlink>
    28d6:	83 c4 10             	add    $0x10,%esp
    28d9:	85 c0                	test   %eax,%eax
    28db:	74 75                	je     2952 <rmdot+0x112>
  if(unlink("dots/..") == 0){
    28dd:	83 ec 0c             	sub    $0xc,%esp
    28e0:	68 d5 4a 00 00       	push   $0x4ad5
    28e5:	e8 89 10 00 00       	call   3973 <unlink>
    28ea:	83 c4 10             	add    $0x10,%esp
    28ed:	85 c0                	test   %eax,%eax
    28ef:	74 4e                	je     293f <rmdot+0xff>
  if(unlink("dots") != 0){
    28f1:	83 ec 0c             	sub    $0xc,%esp
    28f4:	68 6f 4a 00 00       	push   $0x4a6f
    28f9:	e8 75 10 00 00       	call   3973 <unlink>
    28fe:	83 c4 10             	add    $0x10,%esp
    2901:	85 c0                	test   %eax,%eax
    2903:	75 27                	jne    292c <rmdot+0xec>
  printf(1, "rmdot ok\n");
    2905:	83 ec 08             	sub    $0x8,%esp
    2908:	68 0a 4b 00 00       	push   $0x4b0a
    290d:	6a 01                	push   $0x1
    290f:	e8 8c 11 00 00       	call   3aa0 <printf>
}
    2914:	83 c4 10             	add    $0x10,%esp
    2917:	c9                   	leave  
    2918:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    2919:	50                   	push   %eax
    291a:	50                   	push   %eax
    291b:	68 74 4a 00 00       	push   $0x4a74
    2920:	6a 01                	push   $0x1
    2922:	e8 79 11 00 00       	call   3aa0 <printf>
    exit();
    2927:	e8 f7 0f 00 00       	call   3923 <exit>
    printf(1, "unlink dots failed!\n");
    292c:	50                   	push   %eax
    292d:	50                   	push   %eax
    292e:	68 f5 4a 00 00       	push   $0x4af5
    2933:	6a 01                	push   $0x1
    2935:	e8 66 11 00 00       	call   3aa0 <printf>
    exit();
    293a:	e8 e4 0f 00 00       	call   3923 <exit>
    printf(1, "unlink dots/.. worked!\n");
    293f:	52                   	push   %edx
    2940:	52                   	push   %edx
    2941:	68 dd 4a 00 00       	push   $0x4add
    2946:	6a 01                	push   $0x1
    2948:	e8 53 11 00 00       	call   3aa0 <printf>
    exit();
    294d:	e8 d1 0f 00 00       	call   3923 <exit>
    printf(1, "unlink dots/. worked!\n");
    2952:	51                   	push   %ecx
    2953:	51                   	push   %ecx
    2954:	68 be 4a 00 00       	push   $0x4abe
    2959:	6a 01                	push   $0x1
    295b:	e8 40 11 00 00       	call   3aa0 <printf>
    exit();
    2960:	e8 be 0f 00 00       	call   3923 <exit>
    printf(1, "chdir / failed\n");
    2965:	50                   	push   %eax
    2966:	50                   	push   %eax
    2967:	68 ef 3e 00 00       	push   $0x3eef
    296c:	6a 01                	push   $0x1
    296e:	e8 2d 11 00 00       	call   3aa0 <printf>
    exit();
    2973:	e8 ab 0f 00 00       	call   3923 <exit>
    printf(1, "rm .. worked!\n");
    2978:	50                   	push   %eax
    2979:	50                   	push   %eax
    297a:	68 a8 4a 00 00       	push   $0x4aa8
    297f:	6a 01                	push   $0x1
    2981:	e8 1a 11 00 00       	call   3aa0 <printf>
    exit();
    2986:	e8 98 0f 00 00       	call   3923 <exit>
    printf(1, "rm . worked!\n");
    298b:	50                   	push   %eax
    298c:	50                   	push   %eax
    298d:	68 9a 4a 00 00       	push   $0x4a9a
    2992:	6a 01                	push   $0x1
    2994:	e8 07 11 00 00       	call   3aa0 <printf>
    exit();
    2999:	e8 85 0f 00 00       	call   3923 <exit>
    printf(1, "chdir dots failed\n");
    299e:	50                   	push   %eax
    299f:	50                   	push   %eax
    29a0:	68 87 4a 00 00       	push   $0x4a87
    29a5:	6a 01                	push   $0x1
    29a7:	e8 f4 10 00 00       	call   3aa0 <printf>
    exit();
    29ac:	e8 72 0f 00 00       	call   3923 <exit>
    29b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    29b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    29bf:	90                   	nop

000029c0 <dirfile>:
{
    29c0:	55                   	push   %ebp
    29c1:	89 e5                	mov    %esp,%ebp
    29c3:	53                   	push   %ebx
    29c4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "dir vs file\n");
    29c7:	68 14 4b 00 00       	push   $0x4b14
    29cc:	6a 01                	push   $0x1
    29ce:	e8 cd 10 00 00       	call   3aa0 <printf>
  fd = open("dirfile", O_CREATE);
    29d3:	5b                   	pop    %ebx
    29d4:	58                   	pop    %eax
    29d5:	68 00 02 00 00       	push   $0x200
    29da:	68 21 4b 00 00       	push   $0x4b21
    29df:	e8 7f 0f 00 00       	call   3963 <open>
  if(fd < 0){
    29e4:	83 c4 10             	add    $0x10,%esp
    29e7:	85 c0                	test   %eax,%eax
    29e9:	0f 88 43 01 00 00    	js     2b32 <dirfile+0x172>
  close(fd);
    29ef:	83 ec 0c             	sub    $0xc,%esp
    29f2:	50                   	push   %eax
    29f3:	e8 53 0f 00 00       	call   394b <close>
  if(chdir("dirfile") == 0){
    29f8:	c7 04 24 21 4b 00 00 	movl   $0x4b21,(%esp)
    29ff:	e8 8f 0f 00 00       	call   3993 <chdir>
    2a04:	83 c4 10             	add    $0x10,%esp
    2a07:	85 c0                	test   %eax,%eax
    2a09:	0f 84 10 01 00 00    	je     2b1f <dirfile+0x15f>
  fd = open("dirfile/xx", 0);
    2a0f:	83 ec 08             	sub    $0x8,%esp
    2a12:	6a 00                	push   $0x0
    2a14:	68 5a 4b 00 00       	push   $0x4b5a
    2a19:	e8 45 0f 00 00       	call   3963 <open>
  if(fd >= 0){
    2a1e:	83 c4 10             	add    $0x10,%esp
    2a21:	85 c0                	test   %eax,%eax
    2a23:	0f 89 e3 00 00 00    	jns    2b0c <dirfile+0x14c>
  fd = open("dirfile/xx", O_CREATE);
    2a29:	83 ec 08             	sub    $0x8,%esp
    2a2c:	68 00 02 00 00       	push   $0x200
    2a31:	68 5a 4b 00 00       	push   $0x4b5a
    2a36:	e8 28 0f 00 00       	call   3963 <open>
  if(fd >= 0){
    2a3b:	83 c4 10             	add    $0x10,%esp
    2a3e:	85 c0                	test   %eax,%eax
    2a40:	0f 89 c6 00 00 00    	jns    2b0c <dirfile+0x14c>
  if(mkdir("dirfile/xx") == 0){
    2a46:	83 ec 0c             	sub    $0xc,%esp
    2a49:	68 5a 4b 00 00       	push   $0x4b5a
    2a4e:	e8 38 0f 00 00       	call   398b <mkdir>
    2a53:	83 c4 10             	add    $0x10,%esp
    2a56:	85 c0                	test   %eax,%eax
    2a58:	0f 84 46 01 00 00    	je     2ba4 <dirfile+0x1e4>
  if(unlink("dirfile/xx") == 0){
    2a5e:	83 ec 0c             	sub    $0xc,%esp
    2a61:	68 5a 4b 00 00       	push   $0x4b5a
    2a66:	e8 08 0f 00 00       	call   3973 <unlink>
    2a6b:	83 c4 10             	add    $0x10,%esp
    2a6e:	85 c0                	test   %eax,%eax
    2a70:	0f 84 1b 01 00 00    	je     2b91 <dirfile+0x1d1>
  if(link("README", "dirfile/xx") == 0){
    2a76:	83 ec 08             	sub    $0x8,%esp
    2a79:	68 5a 4b 00 00       	push   $0x4b5a
    2a7e:	68 be 4b 00 00       	push   $0x4bbe
    2a83:	e8 fb 0e 00 00       	call   3983 <link>
    2a88:	83 c4 10             	add    $0x10,%esp
    2a8b:	85 c0                	test   %eax,%eax
    2a8d:	0f 84 eb 00 00 00    	je     2b7e <dirfile+0x1be>
  if(unlink("dirfile") != 0){
    2a93:	83 ec 0c             	sub    $0xc,%esp
    2a96:	68 21 4b 00 00       	push   $0x4b21
    2a9b:	e8 d3 0e 00 00       	call   3973 <unlink>
    2aa0:	83 c4 10             	add    $0x10,%esp
    2aa3:	85 c0                	test   %eax,%eax
    2aa5:	0f 85 c0 00 00 00    	jne    2b6b <dirfile+0x1ab>
  fd = open(".", O_RDWR);
    2aab:	83 ec 08             	sub    $0x8,%esp
    2aae:	6a 02                	push   $0x2
    2ab0:	68 1a 47 00 00       	push   $0x471a
    2ab5:	e8 a9 0e 00 00       	call   3963 <open>
  if(fd >= 0){
    2aba:	83 c4 10             	add    $0x10,%esp
    2abd:	85 c0                	test   %eax,%eax
    2abf:	0f 89 93 00 00 00    	jns    2b58 <dirfile+0x198>
  fd = open(".", 0);
    2ac5:	83 ec 08             	sub    $0x8,%esp
    2ac8:	6a 00                	push   $0x0
    2aca:	68 1a 47 00 00       	push   $0x471a
    2acf:	e8 8f 0e 00 00       	call   3963 <open>
  if(write(fd, "x", 1) > 0){
    2ad4:	83 c4 0c             	add    $0xc,%esp
    2ad7:	6a 01                	push   $0x1
  fd = open(".", 0);
    2ad9:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2adb:	68 fd 47 00 00       	push   $0x47fd
    2ae0:	50                   	push   %eax
    2ae1:	e8 5d 0e 00 00       	call   3943 <write>
    2ae6:	83 c4 10             	add    $0x10,%esp
    2ae9:	85 c0                	test   %eax,%eax
    2aeb:	7f 58                	jg     2b45 <dirfile+0x185>
  close(fd);
    2aed:	83 ec 0c             	sub    $0xc,%esp
    2af0:	53                   	push   %ebx
    2af1:	e8 55 0e 00 00       	call   394b <close>
  printf(1, "dir vs file OK\n");
    2af6:	58                   	pop    %eax
    2af7:	5a                   	pop    %edx
    2af8:	68 f1 4b 00 00       	push   $0x4bf1
    2afd:	6a 01                	push   $0x1
    2aff:	e8 9c 0f 00 00       	call   3aa0 <printf>
}
    2b04:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b07:	83 c4 10             	add    $0x10,%esp
    2b0a:	c9                   	leave  
    2b0b:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    2b0c:	50                   	push   %eax
    2b0d:	50                   	push   %eax
    2b0e:	68 65 4b 00 00       	push   $0x4b65
    2b13:	6a 01                	push   $0x1
    2b15:	e8 86 0f 00 00       	call   3aa0 <printf>
    exit();
    2b1a:	e8 04 0e 00 00       	call   3923 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    2b1f:	52                   	push   %edx
    2b20:	52                   	push   %edx
    2b21:	68 40 4b 00 00       	push   $0x4b40
    2b26:	6a 01                	push   $0x1
    2b28:	e8 73 0f 00 00       	call   3aa0 <printf>
    exit();
    2b2d:	e8 f1 0d 00 00       	call   3923 <exit>
    printf(1, "create dirfile failed\n");
    2b32:	51                   	push   %ecx
    2b33:	51                   	push   %ecx
    2b34:	68 29 4b 00 00       	push   $0x4b29
    2b39:	6a 01                	push   $0x1
    2b3b:	e8 60 0f 00 00       	call   3aa0 <printf>
    exit();
    2b40:	e8 de 0d 00 00       	call   3923 <exit>
    printf(1, "write . succeeded!\n");
    2b45:	51                   	push   %ecx
    2b46:	51                   	push   %ecx
    2b47:	68 dd 4b 00 00       	push   $0x4bdd
    2b4c:	6a 01                	push   $0x1
    2b4e:	e8 4d 0f 00 00       	call   3aa0 <printf>
    exit();
    2b53:	e8 cb 0d 00 00       	call   3923 <exit>
    printf(1, "open . for writing succeeded!\n");
    2b58:	53                   	push   %ebx
    2b59:	53                   	push   %ebx
    2b5a:	68 d4 53 00 00       	push   $0x53d4
    2b5f:	6a 01                	push   $0x1
    2b61:	e8 3a 0f 00 00       	call   3aa0 <printf>
    exit();
    2b66:	e8 b8 0d 00 00       	call   3923 <exit>
    printf(1, "unlink dirfile failed!\n");
    2b6b:	50                   	push   %eax
    2b6c:	50                   	push   %eax
    2b6d:	68 c5 4b 00 00       	push   $0x4bc5
    2b72:	6a 01                	push   $0x1
    2b74:	e8 27 0f 00 00       	call   3aa0 <printf>
    exit();
    2b79:	e8 a5 0d 00 00       	call   3923 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    2b7e:	50                   	push   %eax
    2b7f:	50                   	push   %eax
    2b80:	68 b4 53 00 00       	push   $0x53b4
    2b85:	6a 01                	push   $0x1
    2b87:	e8 14 0f 00 00       	call   3aa0 <printf>
    exit();
    2b8c:	e8 92 0d 00 00       	call   3923 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b91:	50                   	push   %eax
    2b92:	50                   	push   %eax
    2b93:	68 a0 4b 00 00       	push   $0x4ba0
    2b98:	6a 01                	push   $0x1
    2b9a:	e8 01 0f 00 00       	call   3aa0 <printf>
    exit();
    2b9f:	e8 7f 0d 00 00       	call   3923 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2ba4:	50                   	push   %eax
    2ba5:	50                   	push   %eax
    2ba6:	68 83 4b 00 00       	push   $0x4b83
    2bab:	6a 01                	push   $0x1
    2bad:	e8 ee 0e 00 00       	call   3aa0 <printf>
    exit();
    2bb2:	e8 6c 0d 00 00       	call   3923 <exit>
    2bb7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2bbe:	66 90                	xchg   %ax,%ax

00002bc0 <iref>:
{
    2bc0:	55                   	push   %ebp
    2bc1:	89 e5                	mov    %esp,%ebp
    2bc3:	53                   	push   %ebx
  printf(1, "empty file name\n");
    2bc4:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    2bc9:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "empty file name\n");
    2bcc:	68 01 4c 00 00       	push   $0x4c01
    2bd1:	6a 01                	push   $0x1
    2bd3:	e8 c8 0e 00 00       	call   3aa0 <printf>
    2bd8:	83 c4 10             	add    $0x10,%esp
    2bdb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2bdf:	90                   	nop
    if(mkdir("irefd") != 0){
    2be0:	83 ec 0c             	sub    $0xc,%esp
    2be3:	68 12 4c 00 00       	push   $0x4c12
    2be8:	e8 9e 0d 00 00       	call   398b <mkdir>
    2bed:	83 c4 10             	add    $0x10,%esp
    2bf0:	85 c0                	test   %eax,%eax
    2bf2:	0f 85 bb 00 00 00    	jne    2cb3 <iref+0xf3>
    if(chdir("irefd") != 0){
    2bf8:	83 ec 0c             	sub    $0xc,%esp
    2bfb:	68 12 4c 00 00       	push   $0x4c12
    2c00:	e8 8e 0d 00 00       	call   3993 <chdir>
    2c05:	83 c4 10             	add    $0x10,%esp
    2c08:	85 c0                	test   %eax,%eax
    2c0a:	0f 85 b7 00 00 00    	jne    2cc7 <iref+0x107>
    mkdir("");
    2c10:	83 ec 0c             	sub    $0xc,%esp
    2c13:	68 c7 42 00 00       	push   $0x42c7
    2c18:	e8 6e 0d 00 00       	call   398b <mkdir>
    link("README", "");
    2c1d:	59                   	pop    %ecx
    2c1e:	58                   	pop    %eax
    2c1f:	68 c7 42 00 00       	push   $0x42c7
    2c24:	68 be 4b 00 00       	push   $0x4bbe
    2c29:	e8 55 0d 00 00       	call   3983 <link>
    fd = open("", O_CREATE);
    2c2e:	58                   	pop    %eax
    2c2f:	5a                   	pop    %edx
    2c30:	68 00 02 00 00       	push   $0x200
    2c35:	68 c7 42 00 00       	push   $0x42c7
    2c3a:	e8 24 0d 00 00       	call   3963 <open>
    if(fd >= 0)
    2c3f:	83 c4 10             	add    $0x10,%esp
    2c42:	85 c0                	test   %eax,%eax
    2c44:	78 0c                	js     2c52 <iref+0x92>
      close(fd);
    2c46:	83 ec 0c             	sub    $0xc,%esp
    2c49:	50                   	push   %eax
    2c4a:	e8 fc 0c 00 00       	call   394b <close>
    2c4f:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2c52:	83 ec 08             	sub    $0x8,%esp
    2c55:	68 00 02 00 00       	push   $0x200
    2c5a:	68 fc 47 00 00       	push   $0x47fc
    2c5f:	e8 ff 0c 00 00       	call   3963 <open>
    if(fd >= 0)
    2c64:	83 c4 10             	add    $0x10,%esp
    2c67:	85 c0                	test   %eax,%eax
    2c69:	78 0c                	js     2c77 <iref+0xb7>
      close(fd);
    2c6b:	83 ec 0c             	sub    $0xc,%esp
    2c6e:	50                   	push   %eax
    2c6f:	e8 d7 0c 00 00       	call   394b <close>
    2c74:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2c77:	83 ec 0c             	sub    $0xc,%esp
    2c7a:	68 fc 47 00 00       	push   $0x47fc
    2c7f:	e8 ef 0c 00 00       	call   3973 <unlink>
  for(i = 0; i < 50 + 1; i++){
    2c84:	83 c4 10             	add    $0x10,%esp
    2c87:	83 eb 01             	sub    $0x1,%ebx
    2c8a:	0f 85 50 ff ff ff    	jne    2be0 <iref+0x20>
  chdir("/");
    2c90:	83 ec 0c             	sub    $0xc,%esp
    2c93:	68 ed 3e 00 00       	push   $0x3eed
    2c98:	e8 f6 0c 00 00       	call   3993 <chdir>
  printf(1, "empty file name OK\n");
    2c9d:	58                   	pop    %eax
    2c9e:	5a                   	pop    %edx
    2c9f:	68 40 4c 00 00       	push   $0x4c40
    2ca4:	6a 01                	push   $0x1
    2ca6:	e8 f5 0d 00 00       	call   3aa0 <printf>
}
    2cab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cae:	83 c4 10             	add    $0x10,%esp
    2cb1:	c9                   	leave  
    2cb2:	c3                   	ret    
      printf(1, "mkdir irefd failed\n");
    2cb3:	83 ec 08             	sub    $0x8,%esp
    2cb6:	68 18 4c 00 00       	push   $0x4c18
    2cbb:	6a 01                	push   $0x1
    2cbd:	e8 de 0d 00 00       	call   3aa0 <printf>
      exit();
    2cc2:	e8 5c 0c 00 00       	call   3923 <exit>
      printf(1, "chdir irefd failed\n");
    2cc7:	83 ec 08             	sub    $0x8,%esp
    2cca:	68 2c 4c 00 00       	push   $0x4c2c
    2ccf:	6a 01                	push   $0x1
    2cd1:	e8 ca 0d 00 00       	call   3aa0 <printf>
      exit();
    2cd6:	e8 48 0c 00 00       	call   3923 <exit>
    2cdb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2cdf:	90                   	nop

00002ce0 <forktest>:
{
    2ce0:	55                   	push   %ebp
    2ce1:	89 e5                	mov    %esp,%ebp
    2ce3:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    2ce4:	31 db                	xor    %ebx,%ebx
{
    2ce6:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fork test\n");
    2ce9:	68 54 4c 00 00       	push   $0x4c54
    2cee:	6a 01                	push   $0x1
    2cf0:	e8 ab 0d 00 00       	call   3aa0 <printf>
    2cf5:	83 c4 10             	add    $0x10,%esp
    2cf8:	eb 13                	jmp    2d0d <forktest+0x2d>
    2cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid == 0)
    2d00:	74 4a                	je     2d4c <forktest+0x6c>
  for(n=0; n<1000; n++){
    2d02:	83 c3 01             	add    $0x1,%ebx
    2d05:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2d0b:	74 6b                	je     2d78 <forktest+0x98>
    pid = fork();
    2d0d:	e8 09 0c 00 00       	call   391b <fork>
    if(pid < 0)
    2d12:	85 c0                	test   %eax,%eax
    2d14:	79 ea                	jns    2d00 <forktest+0x20>
  for(; n > 0; n--){
    2d16:	85 db                	test   %ebx,%ebx
    2d18:	74 14                	je     2d2e <forktest+0x4e>
    2d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2d20:	e8 06 0c 00 00       	call   392b <wait>
    2d25:	85 c0                	test   %eax,%eax
    2d27:	78 28                	js     2d51 <forktest+0x71>
  for(; n > 0; n--){
    2d29:	83 eb 01             	sub    $0x1,%ebx
    2d2c:	75 f2                	jne    2d20 <forktest+0x40>
  if(wait() != -1){
    2d2e:	e8 f8 0b 00 00       	call   392b <wait>
    2d33:	83 f8 ff             	cmp    $0xffffffff,%eax
    2d36:	75 2d                	jne    2d65 <forktest+0x85>
  printf(1, "fork test OK\n");
    2d38:	83 ec 08             	sub    $0x8,%esp
    2d3b:	68 86 4c 00 00       	push   $0x4c86
    2d40:	6a 01                	push   $0x1
    2d42:	e8 59 0d 00 00       	call   3aa0 <printf>
}
    2d47:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2d4a:	c9                   	leave  
    2d4b:	c3                   	ret    
      exit();
    2d4c:	e8 d2 0b 00 00       	call   3923 <exit>
      printf(1, "wait stopped early\n");
    2d51:	83 ec 08             	sub    $0x8,%esp
    2d54:	68 5f 4c 00 00       	push   $0x4c5f
    2d59:	6a 01                	push   $0x1
    2d5b:	e8 40 0d 00 00       	call   3aa0 <printf>
      exit();
    2d60:	e8 be 0b 00 00       	call   3923 <exit>
    printf(1, "wait got too many\n");
    2d65:	52                   	push   %edx
    2d66:	52                   	push   %edx
    2d67:	68 73 4c 00 00       	push   $0x4c73
    2d6c:	6a 01                	push   $0x1
    2d6e:	e8 2d 0d 00 00       	call   3aa0 <printf>
    exit();
    2d73:	e8 ab 0b 00 00       	call   3923 <exit>
    printf(1, "fork claimed to work 1000 times!\n");
    2d78:	50                   	push   %eax
    2d79:	50                   	push   %eax
    2d7a:	68 f4 53 00 00       	push   $0x53f4
    2d7f:	6a 01                	push   $0x1
    2d81:	e8 1a 0d 00 00       	call   3aa0 <printf>
    exit();
    2d86:	e8 98 0b 00 00       	call   3923 <exit>
    2d8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2d8f:	90                   	nop

00002d90 <sbrktest>:
{
    2d90:	55                   	push   %ebp
    2d91:	89 e5                	mov    %esp,%ebp
    2d93:	57                   	push   %edi
    2d94:	56                   	push   %esi
  for(i = 0; i < 5000; i++){
    2d95:	31 f6                	xor    %esi,%esi
{
    2d97:	53                   	push   %ebx
    2d98:	83 ec 64             	sub    $0x64,%esp
  printf(stdout, "sbrk test\n");
    2d9b:	68 94 4c 00 00       	push   $0x4c94
    2da0:	ff 35 04 60 00 00    	push   0x6004
    2da6:	e8 f5 0c 00 00       	call   3aa0 <printf>
  oldbrk = sbrk(0);
    2dab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2db2:	e8 f4 0b 00 00       	call   39ab <sbrk>
  a = sbrk(0);
    2db7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  oldbrk = sbrk(0);
    2dbe:	89 45 a4             	mov    %eax,-0x5c(%ebp)
  a = sbrk(0);
    2dc1:	e8 e5 0b 00 00       	call   39ab <sbrk>
    2dc6:	83 c4 10             	add    $0x10,%esp
    2dc9:	89 c3                	mov    %eax,%ebx
  for(i = 0; i < 5000; i++){
    2dcb:	eb 05                	jmp    2dd2 <sbrktest+0x42>
    2dcd:	8d 76 00             	lea    0x0(%esi),%esi
    a = b + 1;
    2dd0:	89 c3                	mov    %eax,%ebx
    b = sbrk(1);
    2dd2:	83 ec 0c             	sub    $0xc,%esp
    2dd5:	6a 01                	push   $0x1
    2dd7:	e8 cf 0b 00 00       	call   39ab <sbrk>
    if(b != a){
    2ddc:	83 c4 10             	add    $0x10,%esp
    2ddf:	39 d8                	cmp    %ebx,%eax
    2de1:	0f 85 9c 02 00 00    	jne    3083 <sbrktest+0x2f3>
  for(i = 0; i < 5000; i++){
    2de7:	83 c6 01             	add    $0x1,%esi
    *b = 1;
    2dea:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    2ded:	8d 43 01             	lea    0x1(%ebx),%eax
  for(i = 0; i < 5000; i++){
    2df0:	81 fe 88 13 00 00    	cmp    $0x1388,%esi
    2df6:	75 d8                	jne    2dd0 <sbrktest+0x40>
  pid = fork();
    2df8:	e8 1e 0b 00 00       	call   391b <fork>
    2dfd:	89 c6                	mov    %eax,%esi
  if(pid < 0){
    2dff:	85 c0                	test   %eax,%eax
    2e01:	0f 88 02 03 00 00    	js     3109 <sbrktest+0x379>
  c = sbrk(1);
    2e07:	83 ec 0c             	sub    $0xc,%esp
  if(c != a + 1){
    2e0a:	83 c3 02             	add    $0x2,%ebx
  c = sbrk(1);
    2e0d:	6a 01                	push   $0x1
    2e0f:	e8 97 0b 00 00       	call   39ab <sbrk>
  c = sbrk(1);
    2e14:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e1b:	e8 8b 0b 00 00       	call   39ab <sbrk>
  if(c != a + 1){
    2e20:	83 c4 10             	add    $0x10,%esp
    2e23:	39 c3                	cmp    %eax,%ebx
    2e25:	0f 85 3b 03 00 00    	jne    3166 <sbrktest+0x3d6>
  if(pid == 0)
    2e2b:	85 f6                	test   %esi,%esi
    2e2d:	0f 84 2e 03 00 00    	je     3161 <sbrktest+0x3d1>
  wait();
    2e33:	e8 f3 0a 00 00       	call   392b <wait>
  a = sbrk(0);
    2e38:	83 ec 0c             	sub    $0xc,%esp
    2e3b:	6a 00                	push   $0x0
    2e3d:	e8 69 0b 00 00       	call   39ab <sbrk>
    2e42:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    2e44:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2e49:	29 d8                	sub    %ebx,%eax
  p = sbrk(amt);
    2e4b:	89 04 24             	mov    %eax,(%esp)
    2e4e:	e8 58 0b 00 00       	call   39ab <sbrk>
  if (p != a) {
    2e53:	83 c4 10             	add    $0x10,%esp
    2e56:	39 c3                	cmp    %eax,%ebx
    2e58:	0f 85 94 02 00 00    	jne    30f2 <sbrktest+0x362>
  a = sbrk(0);
    2e5e:	83 ec 0c             	sub    $0xc,%esp
  *lastaddr = 99;
    2e61:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    2e68:	6a 00                	push   $0x0
    2e6a:	e8 3c 0b 00 00       	call   39ab <sbrk>
  c = sbrk(-4096);
    2e6f:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    2e76:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2e78:	e8 2e 0b 00 00       	call   39ab <sbrk>
  if(c == (char*)0xffffffff){
    2e7d:	83 c4 10             	add    $0x10,%esp
    2e80:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e83:	0f 84 22 03 00 00    	je     31ab <sbrktest+0x41b>
  c = sbrk(0);
    2e89:	83 ec 0c             	sub    $0xc,%esp
    2e8c:	6a 00                	push   $0x0
    2e8e:	e8 18 0b 00 00       	call   39ab <sbrk>
  if(c != a - 4096){
    2e93:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2e99:	83 c4 10             	add    $0x10,%esp
    2e9c:	39 d0                	cmp    %edx,%eax
    2e9e:	0f 85 f0 02 00 00    	jne    3194 <sbrktest+0x404>
  a = sbrk(0);
    2ea4:	83 ec 0c             	sub    $0xc,%esp
    2ea7:	6a 00                	push   $0x0
    2ea9:	e8 fd 0a 00 00       	call   39ab <sbrk>
  c = sbrk(4096);
    2eae:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  a = sbrk(0);
    2eb5:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2eb7:	e8 ef 0a 00 00       	call   39ab <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2ebc:	83 c4 10             	add    $0x10,%esp
  c = sbrk(4096);
    2ebf:	89 c6                	mov    %eax,%esi
  if(c != a || sbrk(0) != a + 4096){
    2ec1:	39 c3                	cmp    %eax,%ebx
    2ec3:	0f 85 b4 02 00 00    	jne    317d <sbrktest+0x3ed>
    2ec9:	83 ec 0c             	sub    $0xc,%esp
    2ecc:	6a 00                	push   $0x0
    2ece:	e8 d8 0a 00 00       	call   39ab <sbrk>
    2ed3:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2ed9:	83 c4 10             	add    $0x10,%esp
    2edc:	39 c2                	cmp    %eax,%edx
    2ede:	0f 85 99 02 00 00    	jne    317d <sbrktest+0x3ed>
  if(*lastaddr == 99){
    2ee4:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2eeb:	0f 84 2f 02 00 00    	je     3120 <sbrktest+0x390>
  a = sbrk(0);
    2ef1:	83 ec 0c             	sub    $0xc,%esp
    2ef4:	6a 00                	push   $0x0
    2ef6:	e8 b0 0a 00 00       	call   39ab <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2efb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    2f02:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2f04:	e8 a2 0a 00 00       	call   39ab <sbrk>
    2f09:	89 c2                	mov    %eax,%edx
    2f0b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2f0e:	29 d0                	sub    %edx,%eax
    2f10:	89 04 24             	mov    %eax,(%esp)
    2f13:	e8 93 0a 00 00       	call   39ab <sbrk>
  if(c != a){
    2f18:	83 c4 10             	add    $0x10,%esp
    2f1b:	39 c3                	cmp    %eax,%ebx
    2f1d:	0f 85 b8 01 00 00    	jne    30db <sbrktest+0x34b>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2f23:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2f28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2f2f:	90                   	nop
    ppid = getpid();
    2f30:	e8 6e 0a 00 00       	call   39a3 <getpid>
    2f35:	89 c6                	mov    %eax,%esi
    pid = fork();
    2f37:	e8 df 09 00 00       	call   391b <fork>
    if(pid < 0){
    2f3c:	85 c0                	test   %eax,%eax
    2f3e:	0f 88 5d 01 00 00    	js     30a1 <sbrktest+0x311>
    if(pid == 0){
    2f44:	0f 84 6f 01 00 00    	je     30b9 <sbrktest+0x329>
    wait();
    2f4a:	e8 dc 09 00 00       	call   392b <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2f4f:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    2f55:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2f5b:	75 d3                	jne    2f30 <sbrktest+0x1a0>
  if(pipe(fds) != 0){
    2f5d:	83 ec 0c             	sub    $0xc,%esp
    2f60:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2f63:	50                   	push   %eax
    2f64:	e8 ca 09 00 00       	call   3933 <pipe>
    2f69:	83 c4 10             	add    $0x10,%esp
    2f6c:	85 c0                	test   %eax,%eax
    2f6e:	0f 85 da 01 00 00    	jne    314e <sbrktest+0x3be>
    2f74:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    2f77:	8d 75 e8             	lea    -0x18(%ebp),%esi
    2f7a:	89 df                	mov    %ebx,%edi
    2f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((pids[i] = fork()) == 0){
    2f80:	e8 96 09 00 00       	call   391b <fork>
    2f85:	89 07                	mov    %eax,(%edi)
    2f87:	85 c0                	test   %eax,%eax
    2f89:	0f 84 91 00 00 00    	je     3020 <sbrktest+0x290>
    if(pids[i] != -1)
    2f8f:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f92:	74 14                	je     2fa8 <sbrktest+0x218>
      read(fds[0], &scratch, 1);
    2f94:	83 ec 04             	sub    $0x4,%esp
    2f97:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f9a:	6a 01                	push   $0x1
    2f9c:	50                   	push   %eax
    2f9d:	ff 75 b8             	push   -0x48(%ebp)
    2fa0:	e8 96 09 00 00       	call   393b <read>
    2fa5:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2fa8:	83 c7 04             	add    $0x4,%edi
    2fab:	39 f7                	cmp    %esi,%edi
    2fad:	75 d1                	jne    2f80 <sbrktest+0x1f0>
  c = sbrk(4096);
    2faf:	83 ec 0c             	sub    $0xc,%esp
    2fb2:	68 00 10 00 00       	push   $0x1000
    2fb7:	e8 ef 09 00 00       	call   39ab <sbrk>
    2fbc:	83 c4 10             	add    $0x10,%esp
    2fbf:	89 c7                	mov    %eax,%edi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2fc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(pids[i] == -1)
    2fc8:	8b 03                	mov    (%ebx),%eax
    2fca:	83 f8 ff             	cmp    $0xffffffff,%eax
    2fcd:	74 11                	je     2fe0 <sbrktest+0x250>
    kill(pids[i]);
    2fcf:	83 ec 0c             	sub    $0xc,%esp
    2fd2:	50                   	push   %eax
    2fd3:	e8 7b 09 00 00       	call   3953 <kill>
    wait();
    2fd8:	e8 4e 09 00 00       	call   392b <wait>
    2fdd:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2fe0:	83 c3 04             	add    $0x4,%ebx
    2fe3:	39 de                	cmp    %ebx,%esi
    2fe5:	75 e1                	jne    2fc8 <sbrktest+0x238>
  if(c == (char*)0xffffffff){
    2fe7:	83 ff ff             	cmp    $0xffffffff,%edi
    2fea:	0f 84 47 01 00 00    	je     3137 <sbrktest+0x3a7>
  if(sbrk(0) > oldbrk)
    2ff0:	83 ec 0c             	sub    $0xc,%esp
    2ff3:	6a 00                	push   $0x0
    2ff5:	e8 b1 09 00 00       	call   39ab <sbrk>
    2ffa:	83 c4 10             	add    $0x10,%esp
    2ffd:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    3000:	72 60                	jb     3062 <sbrktest+0x2d2>
  printf(stdout, "sbrk test OK\n");
    3002:	83 ec 08             	sub    $0x8,%esp
    3005:	68 3c 4d 00 00       	push   $0x4d3c
    300a:	ff 35 04 60 00 00    	push   0x6004
    3010:	e8 8b 0a 00 00       	call   3aa0 <printf>
}
    3015:	83 c4 10             	add    $0x10,%esp
    3018:	8d 65 f4             	lea    -0xc(%ebp),%esp
    301b:	5b                   	pop    %ebx
    301c:	5e                   	pop    %esi
    301d:	5f                   	pop    %edi
    301e:	5d                   	pop    %ebp
    301f:	c3                   	ret    
      sbrk(BIG - (uint)sbrk(0));
    3020:	83 ec 0c             	sub    $0xc,%esp
    3023:	6a 00                	push   $0x0
    3025:	e8 81 09 00 00       	call   39ab <sbrk>
    302a:	89 c2                	mov    %eax,%edx
    302c:	b8 00 00 40 06       	mov    $0x6400000,%eax
    3031:	29 d0                	sub    %edx,%eax
    3033:	89 04 24             	mov    %eax,(%esp)
    3036:	e8 70 09 00 00       	call   39ab <sbrk>
      write(fds[1], "x", 1);
    303b:	83 c4 0c             	add    $0xc,%esp
    303e:	6a 01                	push   $0x1
    3040:	68 fd 47 00 00       	push   $0x47fd
    3045:	ff 75 bc             	push   -0x44(%ebp)
    3048:	e8 f6 08 00 00       	call   3943 <write>
    304d:	83 c4 10             	add    $0x10,%esp
      for(;;) sleep(1000);
    3050:	83 ec 0c             	sub    $0xc,%esp
    3053:	68 e8 03 00 00       	push   $0x3e8
    3058:	e8 56 09 00 00       	call   39b3 <sleep>
    305d:	83 c4 10             	add    $0x10,%esp
    3060:	eb ee                	jmp    3050 <sbrktest+0x2c0>
    sbrk(-(sbrk(0) - oldbrk));
    3062:	83 ec 0c             	sub    $0xc,%esp
    3065:	6a 00                	push   $0x0
    3067:	e8 3f 09 00 00       	call   39ab <sbrk>
    306c:	89 c2                	mov    %eax,%edx
    306e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3071:	29 d0                	sub    %edx,%eax
    3073:	89 04 24             	mov    %eax,(%esp)
    3076:	e8 30 09 00 00       	call   39ab <sbrk>
    307b:	83 c4 10             	add    $0x10,%esp
    307e:	e9 7f ff ff ff       	jmp    3002 <sbrktest+0x272>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3083:	83 ec 0c             	sub    $0xc,%esp
    3086:	50                   	push   %eax
    3087:	53                   	push   %ebx
    3088:	56                   	push   %esi
    3089:	68 9f 4c 00 00       	push   $0x4c9f
    308e:	ff 35 04 60 00 00    	push   0x6004
    3094:	e8 07 0a 00 00       	call   3aa0 <printf>
      exit();
    3099:	83 c4 20             	add    $0x20,%esp
    309c:	e8 82 08 00 00       	call   3923 <exit>
      printf(stdout, "fork failed\n");
    30a1:	83 ec 08             	sub    $0x8,%esp
    30a4:	68 e5 4d 00 00       	push   $0x4de5
    30a9:	ff 35 04 60 00 00    	push   0x6004
    30af:	e8 ec 09 00 00       	call   3aa0 <printf>
      exit();
    30b4:	e8 6a 08 00 00       	call   3923 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    30b9:	0f be 03             	movsbl (%ebx),%eax
    30bc:	50                   	push   %eax
    30bd:	53                   	push   %ebx
    30be:	68 08 4d 00 00       	push   $0x4d08
    30c3:	ff 35 04 60 00 00    	push   0x6004
    30c9:	e8 d2 09 00 00       	call   3aa0 <printf>
      kill(ppid);
    30ce:	89 34 24             	mov    %esi,(%esp)
    30d1:	e8 7d 08 00 00       	call   3953 <kill>
      exit();
    30d6:	e8 48 08 00 00       	call   3923 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    30db:	50                   	push   %eax
    30dc:	53                   	push   %ebx
    30dd:	68 e8 54 00 00       	push   $0x54e8
    30e2:	ff 35 04 60 00 00    	push   0x6004
    30e8:	e8 b3 09 00 00       	call   3aa0 <printf>
    exit();
    30ed:	e8 31 08 00 00       	call   3923 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    30f2:	56                   	push   %esi
    30f3:	56                   	push   %esi
    30f4:	68 18 54 00 00       	push   $0x5418
    30f9:	ff 35 04 60 00 00    	push   0x6004
    30ff:	e8 9c 09 00 00       	call   3aa0 <printf>
    exit();
    3104:	e8 1a 08 00 00       	call   3923 <exit>
    printf(stdout, "sbrk test fork failed\n");
    3109:	50                   	push   %eax
    310a:	50                   	push   %eax
    310b:	68 ba 4c 00 00       	push   $0x4cba
    3110:	ff 35 04 60 00 00    	push   0x6004
    3116:	e8 85 09 00 00       	call   3aa0 <printf>
    exit();
    311b:	e8 03 08 00 00       	call   3923 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    3120:	51                   	push   %ecx
    3121:	51                   	push   %ecx
    3122:	68 b8 54 00 00       	push   $0x54b8
    3127:	ff 35 04 60 00 00    	push   0x6004
    312d:	e8 6e 09 00 00       	call   3aa0 <printf>
    exit();
    3132:	e8 ec 07 00 00       	call   3923 <exit>
    printf(stdout, "failed sbrk leaked memory\n");
    3137:	50                   	push   %eax
    3138:	50                   	push   %eax
    3139:	68 21 4d 00 00       	push   $0x4d21
    313e:	ff 35 04 60 00 00    	push   0x6004
    3144:	e8 57 09 00 00       	call   3aa0 <printf>
    exit();
    3149:	e8 d5 07 00 00       	call   3923 <exit>
    printf(1, "pipe() failed\n");
    314e:	52                   	push   %edx
    314f:	52                   	push   %edx
    3150:	68 dd 41 00 00       	push   $0x41dd
    3155:	6a 01                	push   $0x1
    3157:	e8 44 09 00 00       	call   3aa0 <printf>
    exit();
    315c:	e8 c2 07 00 00       	call   3923 <exit>
    exit();
    3161:	e8 bd 07 00 00       	call   3923 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    3166:	57                   	push   %edi
    3167:	57                   	push   %edi
    3168:	68 d1 4c 00 00       	push   $0x4cd1
    316d:	ff 35 04 60 00 00    	push   0x6004
    3173:	e8 28 09 00 00       	call   3aa0 <printf>
    exit();
    3178:	e8 a6 07 00 00       	call   3923 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    317d:	56                   	push   %esi
    317e:	53                   	push   %ebx
    317f:	68 90 54 00 00       	push   $0x5490
    3184:	ff 35 04 60 00 00    	push   0x6004
    318a:	e8 11 09 00 00       	call   3aa0 <printf>
    exit();
    318f:	e8 8f 07 00 00       	call   3923 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3194:	50                   	push   %eax
    3195:	53                   	push   %ebx
    3196:	68 58 54 00 00       	push   $0x5458
    319b:	ff 35 04 60 00 00    	push   0x6004
    31a1:	e8 fa 08 00 00       	call   3aa0 <printf>
    exit();
    31a6:	e8 78 07 00 00       	call   3923 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    31ab:	53                   	push   %ebx
    31ac:	53                   	push   %ebx
    31ad:	68 ed 4c 00 00       	push   $0x4ced
    31b2:	ff 35 04 60 00 00    	push   0x6004
    31b8:	e8 e3 08 00 00       	call   3aa0 <printf>
    exit();
    31bd:	e8 61 07 00 00       	call   3923 <exit>
    31c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    31c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000031d0 <validateint>:
}
    31d0:	c3                   	ret    
    31d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    31d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    31df:	90                   	nop

000031e0 <validatetest>:
{
    31e0:	55                   	push   %ebp
    31e1:	89 e5                	mov    %esp,%ebp
    31e3:	56                   	push   %esi
  for(p = 0; p <= (uint)hi; p += 4096){
    31e4:	31 f6                	xor    %esi,%esi
{
    31e6:	53                   	push   %ebx
  printf(stdout, "validate test\n");
    31e7:	83 ec 08             	sub    $0x8,%esp
    31ea:	68 4a 4d 00 00       	push   $0x4d4a
    31ef:	ff 35 04 60 00 00    	push   0x6004
    31f5:	e8 a6 08 00 00       	call   3aa0 <printf>
    31fa:	83 c4 10             	add    $0x10,%esp
    31fd:	8d 76 00             	lea    0x0(%esi),%esi
    if((pid = fork()) == 0){
    3200:	e8 16 07 00 00       	call   391b <fork>
    3205:	89 c3                	mov    %eax,%ebx
    3207:	85 c0                	test   %eax,%eax
    3209:	74 63                	je     326e <validatetest+0x8e>
    sleep(0);
    320b:	83 ec 0c             	sub    $0xc,%esp
    320e:	6a 00                	push   $0x0
    3210:	e8 9e 07 00 00       	call   39b3 <sleep>
    sleep(0);
    3215:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    321c:	e8 92 07 00 00       	call   39b3 <sleep>
    kill(pid);
    3221:	89 1c 24             	mov    %ebx,(%esp)
    3224:	e8 2a 07 00 00       	call   3953 <kill>
    wait();
    3229:	e8 fd 06 00 00       	call   392b <wait>
    if(link("nosuchfile", (char*)p) != -1){
    322e:	58                   	pop    %eax
    322f:	5a                   	pop    %edx
    3230:	56                   	push   %esi
    3231:	68 59 4d 00 00       	push   $0x4d59
    3236:	e8 48 07 00 00       	call   3983 <link>
    323b:	83 c4 10             	add    $0x10,%esp
    323e:	83 f8 ff             	cmp    $0xffffffff,%eax
    3241:	75 30                	jne    3273 <validatetest+0x93>
  for(p = 0; p <= (uint)hi; p += 4096){
    3243:	81 c6 00 10 00 00    	add    $0x1000,%esi
    3249:	81 fe 00 40 11 00    	cmp    $0x114000,%esi
    324f:	75 af                	jne    3200 <validatetest+0x20>
  printf(stdout, "validate ok\n");
    3251:	83 ec 08             	sub    $0x8,%esp
    3254:	68 7d 4d 00 00       	push   $0x4d7d
    3259:	ff 35 04 60 00 00    	push   0x6004
    325f:	e8 3c 08 00 00       	call   3aa0 <printf>
}
    3264:	83 c4 10             	add    $0x10,%esp
    3267:	8d 65 f8             	lea    -0x8(%ebp),%esp
    326a:	5b                   	pop    %ebx
    326b:	5e                   	pop    %esi
    326c:	5d                   	pop    %ebp
    326d:	c3                   	ret    
      exit();
    326e:	e8 b0 06 00 00       	call   3923 <exit>
      printf(stdout, "link should not succeed\n");
    3273:	83 ec 08             	sub    $0x8,%esp
    3276:	68 64 4d 00 00       	push   $0x4d64
    327b:	ff 35 04 60 00 00    	push   0x6004
    3281:	e8 1a 08 00 00       	call   3aa0 <printf>
      exit();
    3286:	e8 98 06 00 00       	call   3923 <exit>
    328b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    328f:	90                   	nop

00003290 <bsstest>:
{
    3290:	55                   	push   %ebp
    3291:	89 e5                	mov    %esp,%ebp
    3293:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "bss test\n");
    3296:	68 8a 4d 00 00       	push   $0x4d8a
    329b:	ff 35 04 60 00 00    	push   0x6004
    32a1:	e8 fa 07 00 00       	call   3aa0 <printf>
    32a6:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(uninit); i++){
    32a9:	31 c0                	xor    %eax,%eax
    32ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    32af:	90                   	nop
    if(uninit[i] != '\0'){
    32b0:	80 b8 20 60 00 00 00 	cmpb   $0x0,0x6020(%eax)
    32b7:	75 22                	jne    32db <bsstest+0x4b>
  for(i = 0; i < sizeof(uninit); i++){
    32b9:	83 c0 01             	add    $0x1,%eax
    32bc:	3d 10 27 00 00       	cmp    $0x2710,%eax
    32c1:	75 ed                	jne    32b0 <bsstest+0x20>
  printf(stdout, "bss test ok\n");
    32c3:	83 ec 08             	sub    $0x8,%esp
    32c6:	68 a5 4d 00 00       	push   $0x4da5
    32cb:	ff 35 04 60 00 00    	push   0x6004
    32d1:	e8 ca 07 00 00       	call   3aa0 <printf>
}
    32d6:	83 c4 10             	add    $0x10,%esp
    32d9:	c9                   	leave  
    32da:	c3                   	ret    
      printf(stdout, "bss test failed\n");
    32db:	83 ec 08             	sub    $0x8,%esp
    32de:	68 94 4d 00 00       	push   $0x4d94
    32e3:	ff 35 04 60 00 00    	push   0x6004
    32e9:	e8 b2 07 00 00       	call   3aa0 <printf>
      exit();
    32ee:	e8 30 06 00 00       	call   3923 <exit>
    32f3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    32fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003300 <bigargtest>:
{
    3300:	55                   	push   %ebp
    3301:	89 e5                	mov    %esp,%ebp
    3303:	83 ec 14             	sub    $0x14,%esp
  unlink("bigarg-ok");
    3306:	68 b2 4d 00 00       	push   $0x4db2
    330b:	e8 63 06 00 00       	call   3973 <unlink>
  pid = fork();
    3310:	e8 06 06 00 00       	call   391b <fork>
  if(pid == 0){
    3315:	83 c4 10             	add    $0x10,%esp
    3318:	85 c0                	test   %eax,%eax
    331a:	74 44                	je     3360 <bigargtest+0x60>
  } else if(pid < 0){
    331c:	0f 88 c5 00 00 00    	js     33e7 <bigargtest+0xe7>
  wait();
    3322:	e8 04 06 00 00       	call   392b <wait>
  fd = open("bigarg-ok", 0);
    3327:	83 ec 08             	sub    $0x8,%esp
    332a:	6a 00                	push   $0x0
    332c:	68 b2 4d 00 00       	push   $0x4db2
    3331:	e8 2d 06 00 00       	call   3963 <open>
  if(fd < 0){
    3336:	83 c4 10             	add    $0x10,%esp
    3339:	85 c0                	test   %eax,%eax
    333b:	0f 88 8f 00 00 00    	js     33d0 <bigargtest+0xd0>
  close(fd);
    3341:	83 ec 0c             	sub    $0xc,%esp
    3344:	50                   	push   %eax
    3345:	e8 01 06 00 00       	call   394b <close>
  unlink("bigarg-ok");
    334a:	c7 04 24 b2 4d 00 00 	movl   $0x4db2,(%esp)
    3351:	e8 1d 06 00 00       	call   3973 <unlink>
}
    3356:	83 c4 10             	add    $0x10,%esp
    3359:	c9                   	leave  
    335a:	c3                   	ret    
    335b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    335f:	90                   	nop
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3360:	c7 04 85 40 a7 00 00 	movl   $0x550c,0xa740(,%eax,4)
    3367:	0c 55 00 00 
    for(i = 0; i < MAXARG-1; i++)
    336b:	83 c0 01             	add    $0x1,%eax
    336e:	83 f8 1f             	cmp    $0x1f,%eax
    3371:	75 ed                	jne    3360 <bigargtest+0x60>
    printf(stdout, "bigarg test\n");
    3373:	51                   	push   %ecx
    3374:	51                   	push   %ecx
    3375:	68 bc 4d 00 00       	push   $0x4dbc
    337a:	ff 35 04 60 00 00    	push   0x6004
    args[MAXARG-1] = 0;
    3380:	c7 05 bc a7 00 00 00 	movl   $0x0,0xa7bc
    3387:	00 00 00 
    printf(stdout, "bigarg test\n");
    338a:	e8 11 07 00 00       	call   3aa0 <printf>
    exec("echo", args);
    338f:	58                   	pop    %eax
    3390:	5a                   	pop    %edx
    3391:	68 40 a7 00 00       	push   $0xa740
    3396:	68 89 3f 00 00       	push   $0x3f89
    339b:	e8 bb 05 00 00       	call   395b <exec>
    printf(stdout, "bigarg test ok\n");
    33a0:	59                   	pop    %ecx
    33a1:	58                   	pop    %eax
    33a2:	68 c9 4d 00 00       	push   $0x4dc9
    33a7:	ff 35 04 60 00 00    	push   0x6004
    33ad:	e8 ee 06 00 00       	call   3aa0 <printf>
    fd = open("bigarg-ok", O_CREATE);
    33b2:	58                   	pop    %eax
    33b3:	5a                   	pop    %edx
    33b4:	68 00 02 00 00       	push   $0x200
    33b9:	68 b2 4d 00 00       	push   $0x4db2
    33be:	e8 a0 05 00 00       	call   3963 <open>
    close(fd);
    33c3:	89 04 24             	mov    %eax,(%esp)
    33c6:	e8 80 05 00 00       	call   394b <close>
    exit();
    33cb:	e8 53 05 00 00       	call   3923 <exit>
    printf(stdout, "bigarg test failed!\n");
    33d0:	50                   	push   %eax
    33d1:	50                   	push   %eax
    33d2:	68 f2 4d 00 00       	push   $0x4df2
    33d7:	ff 35 04 60 00 00    	push   0x6004
    33dd:	e8 be 06 00 00       	call   3aa0 <printf>
    exit();
    33e2:	e8 3c 05 00 00       	call   3923 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    33e7:	52                   	push   %edx
    33e8:	52                   	push   %edx
    33e9:	68 d9 4d 00 00       	push   $0x4dd9
    33ee:	ff 35 04 60 00 00    	push   0x6004
    33f4:	e8 a7 06 00 00       	call   3aa0 <printf>
    exit();
    33f9:	e8 25 05 00 00       	call   3923 <exit>
    33fe:	66 90                	xchg   %ax,%ax

00003400 <fsfull>:
{
    3400:	55                   	push   %ebp
    3401:	89 e5                	mov    %esp,%ebp
    3403:	57                   	push   %edi
    3404:	56                   	push   %esi
  for(nfiles = 0; ; nfiles++){
    3405:	31 f6                	xor    %esi,%esi
{
    3407:	53                   	push   %ebx
    3408:	83 ec 54             	sub    $0x54,%esp
  printf(1, "fsfull test\n");
    340b:	68 07 4e 00 00       	push   $0x4e07
    3410:	6a 01                	push   $0x1
    3412:	e8 89 06 00 00       	call   3aa0 <printf>
    3417:	83 c4 10             	add    $0x10,%esp
    341a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    3420:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3425:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    printf(1, "writing %s\n", name);
    342a:	83 ec 04             	sub    $0x4,%esp
    name[0] = 'f';
    342d:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    3431:	f7 e6                	mul    %esi
    name[5] = '\0';
    3433:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    3437:	c1 ea 06             	shr    $0x6,%edx
    343a:	8d 42 30             	lea    0x30(%edx),%eax
    343d:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3440:	69 c2 e8 03 00 00    	imul   $0x3e8,%edx,%eax
    3446:	89 f2                	mov    %esi,%edx
    3448:	29 c2                	sub    %eax,%edx
    344a:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    344f:	f7 e2                	mul    %edx
    name[3] = '0' + (nfiles % 100) / 10;
    3451:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3456:	c1 ea 05             	shr    $0x5,%edx
    3459:	83 c2 30             	add    $0x30,%edx
    345c:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    345f:	f7 e6                	mul    %esi
    3461:	c1 ea 05             	shr    $0x5,%edx
    3464:	6b c2 64             	imul   $0x64,%edx,%eax
    3467:	89 f2                	mov    %esi,%edx
    3469:	29 c2                	sub    %eax,%edx
    346b:	89 d0                	mov    %edx,%eax
    346d:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    346f:	89 f0                	mov    %esi,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3471:	c1 ea 03             	shr    $0x3,%edx
    3474:	83 c2 30             	add    $0x30,%edx
    3477:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    347a:	f7 e1                	mul    %ecx
    347c:	89 f0                	mov    %esi,%eax
    347e:	c1 ea 03             	shr    $0x3,%edx
    3481:	8d 14 92             	lea    (%edx,%edx,4),%edx
    3484:	01 d2                	add    %edx,%edx
    3486:	29 d0                	sub    %edx,%eax
    3488:	83 c0 30             	add    $0x30,%eax
    348b:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
    348e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3491:	50                   	push   %eax
    3492:	68 14 4e 00 00       	push   $0x4e14
    3497:	6a 01                	push   $0x1
    3499:	e8 02 06 00 00       	call   3aa0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    349e:	58                   	pop    %eax
    349f:	8d 45 a8             	lea    -0x58(%ebp),%eax
    34a2:	5a                   	pop    %edx
    34a3:	68 02 02 00 00       	push   $0x202
    34a8:	50                   	push   %eax
    34a9:	e8 b5 04 00 00       	call   3963 <open>
    if(fd < 0){
    34ae:	83 c4 10             	add    $0x10,%esp
    int fd = open(name, O_CREATE|O_RDWR);
    34b1:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    34b3:	85 c0                	test   %eax,%eax
    34b5:	78 4f                	js     3506 <fsfull+0x106>
    int total = 0;
    34b7:	31 db                	xor    %ebx,%ebx
    34b9:	eb 07                	jmp    34c2 <fsfull+0xc2>
    34bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    34bf:	90                   	nop
      total += cc;
    34c0:	01 c3                	add    %eax,%ebx
      int cc = write(fd, buf, 512);
    34c2:	83 ec 04             	sub    $0x4,%esp
    34c5:	68 00 02 00 00       	push   $0x200
    34ca:	68 40 87 00 00       	push   $0x8740
    34cf:	57                   	push   %edi
    34d0:	e8 6e 04 00 00       	call   3943 <write>
      if(cc < 512)
    34d5:	83 c4 10             	add    $0x10,%esp
    34d8:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    34dd:	7f e1                	jg     34c0 <fsfull+0xc0>
    printf(1, "wrote %d bytes\n", total);
    34df:	83 ec 04             	sub    $0x4,%esp
    34e2:	53                   	push   %ebx
    34e3:	68 30 4e 00 00       	push   $0x4e30
    34e8:	6a 01                	push   $0x1
    34ea:	e8 b1 05 00 00       	call   3aa0 <printf>
    close(fd);
    34ef:	89 3c 24             	mov    %edi,(%esp)
    34f2:	e8 54 04 00 00       	call   394b <close>
    if(total == 0)
    34f7:	83 c4 10             	add    $0x10,%esp
    34fa:	85 db                	test   %ebx,%ebx
    34fc:	74 1e                	je     351c <fsfull+0x11c>
  for(nfiles = 0; ; nfiles++){
    34fe:	83 c6 01             	add    $0x1,%esi
    3501:	e9 1a ff ff ff       	jmp    3420 <fsfull+0x20>
      printf(1, "open %s failed\n", name);
    3506:	83 ec 04             	sub    $0x4,%esp
    3509:	8d 45 a8             	lea    -0x58(%ebp),%eax
    350c:	50                   	push   %eax
    350d:	68 20 4e 00 00       	push   $0x4e20
    3512:	6a 01                	push   $0x1
    3514:	e8 87 05 00 00       	call   3aa0 <printf>
      break;
    3519:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + nfiles / 1000;
    351c:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    name[2] = '0' + (nfiles % 1000) / 100;
    3521:	bb 1f 85 eb 51       	mov    $0x51eb851f,%ebx
    3526:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    352d:	8d 76 00             	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    3530:	89 f0                	mov    %esi,%eax
    unlink(name);
    3532:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'f';
    3535:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    3539:	f7 e7                	mul    %edi
    name[5] = '\0';
    353b:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    353f:	c1 ea 06             	shr    $0x6,%edx
    3542:	8d 42 30             	lea    0x30(%edx),%eax
    3545:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3548:	69 c2 e8 03 00 00    	imul   $0x3e8,%edx,%eax
    354e:	89 f2                	mov    %esi,%edx
    3550:	29 c2                	sub    %eax,%edx
    3552:	89 d0                	mov    %edx,%eax
    3554:	f7 e3                	mul    %ebx
    name[3] = '0' + (nfiles % 100) / 10;
    3556:	89 f0                	mov    %esi,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3558:	c1 ea 05             	shr    $0x5,%edx
    355b:	83 c2 30             	add    $0x30,%edx
    355e:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3561:	f7 e3                	mul    %ebx
    3563:	c1 ea 05             	shr    $0x5,%edx
    3566:	6b ca 64             	imul   $0x64,%edx,%ecx
    3569:	89 f2                	mov    %esi,%edx
    356b:	29 ca                	sub    %ecx,%edx
    356d:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    3572:	89 d0                	mov    %edx,%eax
    3574:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    3576:	89 f0                	mov    %esi,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3578:	c1 ea 03             	shr    $0x3,%edx
    357b:	83 c2 30             	add    $0x30,%edx
    357e:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3581:	f7 e1                	mul    %ecx
    3583:	89 f0                	mov    %esi,%eax
    nfiles--;
    3585:	83 ee 01             	sub    $0x1,%esi
    name[4] = '0' + (nfiles % 10);
    3588:	c1 ea 03             	shr    $0x3,%edx
    358b:	8d 14 92             	lea    (%edx,%edx,4),%edx
    358e:	01 d2                	add    %edx,%edx
    3590:	29 d0                	sub    %edx,%eax
    3592:	83 c0 30             	add    $0x30,%eax
    3595:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    3598:	8d 45 a8             	lea    -0x58(%ebp),%eax
    359b:	50                   	push   %eax
    359c:	e8 d2 03 00 00       	call   3973 <unlink>
  while(nfiles >= 0){
    35a1:	83 c4 10             	add    $0x10,%esp
    35a4:	83 fe ff             	cmp    $0xffffffff,%esi
    35a7:	75 87                	jne    3530 <fsfull+0x130>
  printf(1, "fsfull test finished\n");
    35a9:	83 ec 08             	sub    $0x8,%esp
    35ac:	68 40 4e 00 00       	push   $0x4e40
    35b1:	6a 01                	push   $0x1
    35b3:	e8 e8 04 00 00       	call   3aa0 <printf>
}
    35b8:	83 c4 10             	add    $0x10,%esp
    35bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    35be:	5b                   	pop    %ebx
    35bf:	5e                   	pop    %esi
    35c0:	5f                   	pop    %edi
    35c1:	5d                   	pop    %ebp
    35c2:	c3                   	ret    
    35c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    35ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000035d0 <uio>:
{
    35d0:	55                   	push   %ebp
    35d1:	89 e5                	mov    %esp,%ebp
    35d3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "uio test\n");
    35d6:	68 56 4e 00 00       	push   $0x4e56
    35db:	6a 01                	push   $0x1
    35dd:	e8 be 04 00 00       	call   3aa0 <printf>
  pid = fork();
    35e2:	e8 34 03 00 00       	call   391b <fork>
  if(pid == 0){
    35e7:	83 c4 10             	add    $0x10,%esp
    35ea:	85 c0                	test   %eax,%eax
    35ec:	74 1b                	je     3609 <uio+0x39>
  } else if(pid < 0){
    35ee:	78 3d                	js     362d <uio+0x5d>
  wait();
    35f0:	e8 36 03 00 00       	call   392b <wait>
  printf(1, "uio test done\n");
    35f5:	83 ec 08             	sub    $0x8,%esp
    35f8:	68 60 4e 00 00       	push   $0x4e60
    35fd:	6a 01                	push   $0x1
    35ff:	e8 9c 04 00 00       	call   3aa0 <printf>
}
    3604:	83 c4 10             	add    $0x10,%esp
    3607:	c9                   	leave  
    3608:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3609:	b8 09 00 00 00       	mov    $0x9,%eax
    360e:	ba 70 00 00 00       	mov    $0x70,%edx
    3613:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    3614:	ba 71 00 00 00       	mov    $0x71,%edx
    3619:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    361a:	52                   	push   %edx
    361b:	52                   	push   %edx
    361c:	68 ec 55 00 00       	push   $0x55ec
    3621:	6a 01                	push   $0x1
    3623:	e8 78 04 00 00       	call   3aa0 <printf>
    exit();
    3628:	e8 f6 02 00 00       	call   3923 <exit>
    printf (1, "fork failed\n");
    362d:	50                   	push   %eax
    362e:	50                   	push   %eax
    362f:	68 e5 4d 00 00       	push   $0x4de5
    3634:	6a 01                	push   $0x1
    3636:	e8 65 04 00 00       	call   3aa0 <printf>
    exit();
    363b:	e8 e3 02 00 00       	call   3923 <exit>

00003640 <argptest>:
{
    3640:	55                   	push   %ebp
    3641:	89 e5                	mov    %esp,%ebp
    3643:	53                   	push   %ebx
    3644:	83 ec 0c             	sub    $0xc,%esp
  fd = open("init", O_RDONLY);
    3647:	6a 00                	push   $0x0
    3649:	68 6f 4e 00 00       	push   $0x4e6f
    364e:	e8 10 03 00 00       	call   3963 <open>
  if (fd < 0) {
    3653:	83 c4 10             	add    $0x10,%esp
    3656:	85 c0                	test   %eax,%eax
    3658:	78 39                	js     3693 <argptest+0x53>
  read(fd, sbrk(0) - 1, -1);
    365a:	83 ec 0c             	sub    $0xc,%esp
    365d:	89 c3                	mov    %eax,%ebx
    365f:	6a 00                	push   $0x0
    3661:	e8 45 03 00 00       	call   39ab <sbrk>
    3666:	83 c4 0c             	add    $0xc,%esp
    3669:	83 e8 01             	sub    $0x1,%eax
    366c:	6a ff                	push   $0xffffffff
    366e:	50                   	push   %eax
    366f:	53                   	push   %ebx
    3670:	e8 c6 02 00 00       	call   393b <read>
  close(fd);
    3675:	89 1c 24             	mov    %ebx,(%esp)
    3678:	e8 ce 02 00 00       	call   394b <close>
  printf(1, "arg test passed\n");
    367d:	58                   	pop    %eax
    367e:	5a                   	pop    %edx
    367f:	68 81 4e 00 00       	push   $0x4e81
    3684:	6a 01                	push   $0x1
    3686:	e8 15 04 00 00       	call   3aa0 <printf>
}
    368b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    368e:	83 c4 10             	add    $0x10,%esp
    3691:	c9                   	leave  
    3692:	c3                   	ret    
    printf(2, "open failed\n");
    3693:	51                   	push   %ecx
    3694:	51                   	push   %ecx
    3695:	68 74 4e 00 00       	push   $0x4e74
    369a:	6a 02                	push   $0x2
    369c:	e8 ff 03 00 00       	call   3aa0 <printf>
    exit();
    36a1:	e8 7d 02 00 00       	call   3923 <exit>
    36a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    36ad:	8d 76 00             	lea    0x0(%esi),%esi

000036b0 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    36b0:	69 05 00 60 00 00 0d 	imul   $0x19660d,0x6000,%eax
    36b7:	66 19 00 
    36ba:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    36bf:	a3 00 60 00 00       	mov    %eax,0x6000
}
    36c4:	c3                   	ret    
    36c5:	66 90                	xchg   %ax,%ax
    36c7:	66 90                	xchg   %ax,%ax
    36c9:	66 90                	xchg   %ax,%ax
    36cb:	66 90                	xchg   %ax,%ax
    36cd:	66 90                	xchg   %ax,%ax
    36cf:	90                   	nop

000036d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    36d0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    36d1:	31 c0                	xor    %eax,%eax
{
    36d3:	89 e5                	mov    %esp,%ebp
    36d5:	53                   	push   %ebx
    36d6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    36d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    36dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
    36e0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    36e4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    36e7:	83 c0 01             	add    $0x1,%eax
    36ea:	84 d2                	test   %dl,%dl
    36ec:	75 f2                	jne    36e0 <strcpy+0x10>
    ;
  return os;
}
    36ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    36f1:	89 c8                	mov    %ecx,%eax
    36f3:	c9                   	leave  
    36f4:	c3                   	ret    
    36f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    36fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003700 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3700:	55                   	push   %ebp
    3701:	89 e5                	mov    %esp,%ebp
    3703:	53                   	push   %ebx
    3704:	8b 55 08             	mov    0x8(%ebp),%edx
    3707:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    370a:	0f b6 02             	movzbl (%edx),%eax
    370d:	84 c0                	test   %al,%al
    370f:	75 17                	jne    3728 <strcmp+0x28>
    3711:	eb 3a                	jmp    374d <strcmp+0x4d>
    3713:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3717:	90                   	nop
    3718:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    371c:	83 c2 01             	add    $0x1,%edx
    371f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
    3722:	84 c0                	test   %al,%al
    3724:	74 1a                	je     3740 <strcmp+0x40>
    p++, q++;
    3726:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
    3728:	0f b6 19             	movzbl (%ecx),%ebx
    372b:	38 c3                	cmp    %al,%bl
    372d:	74 e9                	je     3718 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    372f:	29 d8                	sub    %ebx,%eax
}
    3731:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3734:	c9                   	leave  
    3735:	c3                   	ret    
    3736:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    373d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    3740:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    3744:	31 c0                	xor    %eax,%eax
    3746:	29 d8                	sub    %ebx,%eax
}
    3748:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    374b:	c9                   	leave  
    374c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
    374d:	0f b6 19             	movzbl (%ecx),%ebx
    3750:	31 c0                	xor    %eax,%eax
    3752:	eb db                	jmp    372f <strcmp+0x2f>
    3754:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    375b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    375f:	90                   	nop

00003760 <strlen>:

uint
strlen(const char *s)
{
    3760:	55                   	push   %ebp
    3761:	89 e5                	mov    %esp,%ebp
    3763:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    3766:	80 3a 00             	cmpb   $0x0,(%edx)
    3769:	74 15                	je     3780 <strlen+0x20>
    376b:	31 c0                	xor    %eax,%eax
    376d:	8d 76 00             	lea    0x0(%esi),%esi
    3770:	83 c0 01             	add    $0x1,%eax
    3773:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    3777:	89 c1                	mov    %eax,%ecx
    3779:	75 f5                	jne    3770 <strlen+0x10>
    ;
  return n;
}
    377b:	89 c8                	mov    %ecx,%eax
    377d:	5d                   	pop    %ebp
    377e:	c3                   	ret    
    377f:	90                   	nop
  for(n = 0; s[n]; n++)
    3780:	31 c9                	xor    %ecx,%ecx
}
    3782:	5d                   	pop    %ebp
    3783:	89 c8                	mov    %ecx,%eax
    3785:	c3                   	ret    
    3786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    378d:	8d 76 00             	lea    0x0(%esi),%esi

00003790 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3790:	55                   	push   %ebp
    3791:	89 e5                	mov    %esp,%ebp
    3793:	57                   	push   %edi
    3794:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3797:	8b 4d 10             	mov    0x10(%ebp),%ecx
    379a:	8b 45 0c             	mov    0xc(%ebp),%eax
    379d:	89 d7                	mov    %edx,%edi
    379f:	fc                   	cld    
    37a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    37a2:	8b 7d fc             	mov    -0x4(%ebp),%edi
    37a5:	89 d0                	mov    %edx,%eax
    37a7:	c9                   	leave  
    37a8:	c3                   	ret    
    37a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000037b0 <strchr>:

char*
strchr(const char *s, char c)
{
    37b0:	55                   	push   %ebp
    37b1:	89 e5                	mov    %esp,%ebp
    37b3:	8b 45 08             	mov    0x8(%ebp),%eax
    37b6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    37ba:	0f b6 10             	movzbl (%eax),%edx
    37bd:	84 d2                	test   %dl,%dl
    37bf:	75 12                	jne    37d3 <strchr+0x23>
    37c1:	eb 1d                	jmp    37e0 <strchr+0x30>
    37c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    37c7:	90                   	nop
    37c8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    37cc:	83 c0 01             	add    $0x1,%eax
    37cf:	84 d2                	test   %dl,%dl
    37d1:	74 0d                	je     37e0 <strchr+0x30>
    if(*s == c)
    37d3:	38 d1                	cmp    %dl,%cl
    37d5:	75 f1                	jne    37c8 <strchr+0x18>
      return (char*)s;
  return 0;
}
    37d7:	5d                   	pop    %ebp
    37d8:	c3                   	ret    
    37d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    37e0:	31 c0                	xor    %eax,%eax
}
    37e2:	5d                   	pop    %ebp
    37e3:	c3                   	ret    
    37e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    37eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    37ef:	90                   	nop

000037f0 <gets>:

char*
gets(char *buf, int max)
{
    37f0:	55                   	push   %ebp
    37f1:	89 e5                	mov    %esp,%ebp
    37f3:	57                   	push   %edi
    37f4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    37f5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    37f8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    37f9:	31 db                	xor    %ebx,%ebx
{
    37fb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    37fe:	eb 27                	jmp    3827 <gets+0x37>
    cc = read(0, &c, 1);
    3800:	83 ec 04             	sub    $0x4,%esp
    3803:	6a 01                	push   $0x1
    3805:	57                   	push   %edi
    3806:	6a 00                	push   $0x0
    3808:	e8 2e 01 00 00       	call   393b <read>
    if(cc < 1)
    380d:	83 c4 10             	add    $0x10,%esp
    3810:	85 c0                	test   %eax,%eax
    3812:	7e 1d                	jle    3831 <gets+0x41>
      break;
    buf[i++] = c;
    3814:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3818:	8b 55 08             	mov    0x8(%ebp),%edx
    381b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    381f:	3c 0a                	cmp    $0xa,%al
    3821:	74 1d                	je     3840 <gets+0x50>
    3823:	3c 0d                	cmp    $0xd,%al
    3825:	74 19                	je     3840 <gets+0x50>
  for(i=0; i+1 < max; ){
    3827:	89 de                	mov    %ebx,%esi
    3829:	83 c3 01             	add    $0x1,%ebx
    382c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    382f:	7c cf                	jl     3800 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    3831:	8b 45 08             	mov    0x8(%ebp),%eax
    3834:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3838:	8d 65 f4             	lea    -0xc(%ebp),%esp
    383b:	5b                   	pop    %ebx
    383c:	5e                   	pop    %esi
    383d:	5f                   	pop    %edi
    383e:	5d                   	pop    %ebp
    383f:	c3                   	ret    
  buf[i] = '\0';
    3840:	8b 45 08             	mov    0x8(%ebp),%eax
    3843:	89 de                	mov    %ebx,%esi
    3845:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    3849:	8d 65 f4             	lea    -0xc(%ebp),%esp
    384c:	5b                   	pop    %ebx
    384d:	5e                   	pop    %esi
    384e:	5f                   	pop    %edi
    384f:	5d                   	pop    %ebp
    3850:	c3                   	ret    
    3851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3858:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    385f:	90                   	nop

00003860 <stat>:

int
stat(const char *n, struct stat *st)
{
    3860:	55                   	push   %ebp
    3861:	89 e5                	mov    %esp,%ebp
    3863:	56                   	push   %esi
    3864:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3865:	83 ec 08             	sub    $0x8,%esp
    3868:	6a 00                	push   $0x0
    386a:	ff 75 08             	push   0x8(%ebp)
    386d:	e8 f1 00 00 00       	call   3963 <open>
  if(fd < 0)
    3872:	83 c4 10             	add    $0x10,%esp
    3875:	85 c0                	test   %eax,%eax
    3877:	78 27                	js     38a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    3879:	83 ec 08             	sub    $0x8,%esp
    387c:	ff 75 0c             	push   0xc(%ebp)
    387f:	89 c3                	mov    %eax,%ebx
    3881:	50                   	push   %eax
    3882:	e8 f4 00 00 00       	call   397b <fstat>
  close(fd);
    3887:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    388a:	89 c6                	mov    %eax,%esi
  close(fd);
    388c:	e8 ba 00 00 00       	call   394b <close>
  return r;
    3891:	83 c4 10             	add    $0x10,%esp
}
    3894:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3897:	89 f0                	mov    %esi,%eax
    3899:	5b                   	pop    %ebx
    389a:	5e                   	pop    %esi
    389b:	5d                   	pop    %ebp
    389c:	c3                   	ret    
    389d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    38a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    38a5:	eb ed                	jmp    3894 <stat+0x34>
    38a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    38ae:	66 90                	xchg   %ax,%ax

000038b0 <atoi>:

int
atoi(const char *s)
{
    38b0:	55                   	push   %ebp
    38b1:	89 e5                	mov    %esp,%ebp
    38b3:	53                   	push   %ebx
    38b4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    38b7:	0f be 02             	movsbl (%edx),%eax
    38ba:	8d 48 d0             	lea    -0x30(%eax),%ecx
    38bd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    38c0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    38c5:	77 1e                	ja     38e5 <atoi+0x35>
    38c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    38ce:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    38d0:	83 c2 01             	add    $0x1,%edx
    38d3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    38d6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    38da:	0f be 02             	movsbl (%edx),%eax
    38dd:	8d 58 d0             	lea    -0x30(%eax),%ebx
    38e0:	80 fb 09             	cmp    $0x9,%bl
    38e3:	76 eb                	jbe    38d0 <atoi+0x20>
  return n;
}
    38e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    38e8:	89 c8                	mov    %ecx,%eax
    38ea:	c9                   	leave  
    38eb:	c3                   	ret    
    38ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000038f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    38f0:	55                   	push   %ebp
    38f1:	89 e5                	mov    %esp,%ebp
    38f3:	57                   	push   %edi
    38f4:	8b 45 10             	mov    0x10(%ebp),%eax
    38f7:	8b 55 08             	mov    0x8(%ebp),%edx
    38fa:	56                   	push   %esi
    38fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    38fe:	85 c0                	test   %eax,%eax
    3900:	7e 13                	jle    3915 <memmove+0x25>
    3902:	01 d0                	add    %edx,%eax
  dst = vdst;
    3904:	89 d7                	mov    %edx,%edi
    3906:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    390d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    3910:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    3911:	39 f8                	cmp    %edi,%eax
    3913:	75 fb                	jne    3910 <memmove+0x20>
  return vdst;
}
    3915:	5e                   	pop    %esi
    3916:	89 d0                	mov    %edx,%eax
    3918:	5f                   	pop    %edi
    3919:	5d                   	pop    %ebp
    391a:	c3                   	ret    

0000391b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    391b:	b8 01 00 00 00       	mov    $0x1,%eax
    3920:	cd 40                	int    $0x40
    3922:	c3                   	ret    

00003923 <exit>:
SYSCALL(exit)
    3923:	b8 02 00 00 00       	mov    $0x2,%eax
    3928:	cd 40                	int    $0x40
    392a:	c3                   	ret    

0000392b <wait>:
SYSCALL(wait)
    392b:	b8 03 00 00 00       	mov    $0x3,%eax
    3930:	cd 40                	int    $0x40
    3932:	c3                   	ret    

00003933 <pipe>:
SYSCALL(pipe)
    3933:	b8 04 00 00 00       	mov    $0x4,%eax
    3938:	cd 40                	int    $0x40
    393a:	c3                   	ret    

0000393b <read>:
SYSCALL(read)
    393b:	b8 05 00 00 00       	mov    $0x5,%eax
    3940:	cd 40                	int    $0x40
    3942:	c3                   	ret    

00003943 <write>:
SYSCALL(write)
    3943:	b8 10 00 00 00       	mov    $0x10,%eax
    3948:	cd 40                	int    $0x40
    394a:	c3                   	ret    

0000394b <close>:
SYSCALL(close)
    394b:	b8 15 00 00 00       	mov    $0x15,%eax
    3950:	cd 40                	int    $0x40
    3952:	c3                   	ret    

00003953 <kill>:
SYSCALL(kill)
    3953:	b8 06 00 00 00       	mov    $0x6,%eax
    3958:	cd 40                	int    $0x40
    395a:	c3                   	ret    

0000395b <exec>:
SYSCALL(exec)
    395b:	b8 07 00 00 00       	mov    $0x7,%eax
    3960:	cd 40                	int    $0x40
    3962:	c3                   	ret    

00003963 <open>:
SYSCALL(open)
    3963:	b8 0f 00 00 00       	mov    $0xf,%eax
    3968:	cd 40                	int    $0x40
    396a:	c3                   	ret    

0000396b <mknod>:
SYSCALL(mknod)
    396b:	b8 11 00 00 00       	mov    $0x11,%eax
    3970:	cd 40                	int    $0x40
    3972:	c3                   	ret    

00003973 <unlink>:
SYSCALL(unlink)
    3973:	b8 12 00 00 00       	mov    $0x12,%eax
    3978:	cd 40                	int    $0x40
    397a:	c3                   	ret    

0000397b <fstat>:
SYSCALL(fstat)
    397b:	b8 08 00 00 00       	mov    $0x8,%eax
    3980:	cd 40                	int    $0x40
    3982:	c3                   	ret    

00003983 <link>:
SYSCALL(link)
    3983:	b8 13 00 00 00       	mov    $0x13,%eax
    3988:	cd 40                	int    $0x40
    398a:	c3                   	ret    

0000398b <mkdir>:
SYSCALL(mkdir)
    398b:	b8 14 00 00 00       	mov    $0x14,%eax
    3990:	cd 40                	int    $0x40
    3992:	c3                   	ret    

00003993 <chdir>:
SYSCALL(chdir)
    3993:	b8 09 00 00 00       	mov    $0x9,%eax
    3998:	cd 40                	int    $0x40
    399a:	c3                   	ret    

0000399b <dup>:
SYSCALL(dup)
    399b:	b8 0a 00 00 00       	mov    $0xa,%eax
    39a0:	cd 40                	int    $0x40
    39a2:	c3                   	ret    

000039a3 <getpid>:
SYSCALL(getpid)
    39a3:	b8 0b 00 00 00       	mov    $0xb,%eax
    39a8:	cd 40                	int    $0x40
    39aa:	c3                   	ret    

000039ab <sbrk>:
SYSCALL(sbrk)
    39ab:	b8 0c 00 00 00       	mov    $0xc,%eax
    39b0:	cd 40                	int    $0x40
    39b2:	c3                   	ret    

000039b3 <sleep>:
SYSCALL(sleep)
    39b3:	b8 0d 00 00 00       	mov    $0xd,%eax
    39b8:	cd 40                	int    $0x40
    39ba:	c3                   	ret    

000039bb <uptime>:
SYSCALL(uptime)
    39bb:	b8 0e 00 00 00       	mov    $0xe,%eax
    39c0:	cd 40                	int    $0x40
    39c2:	c3                   	ret    

000039c3 <printhugepde>:
SYSCALL(printhugepde)
    39c3:	b8 16 00 00 00       	mov    $0x16,%eax
    39c8:	cd 40                	int    $0x40
    39ca:	c3                   	ret    

000039cb <procpgdirinfo>:
SYSCALL(procpgdirinfo)
    39cb:	b8 17 00 00 00       	mov    $0x17,%eax
    39d0:	cd 40                	int    $0x40
    39d2:	c3                   	ret    

000039d3 <setthp>:
SYSCALL(setthp)
    39d3:	b8 18 00 00 00       	mov    $0x18,%eax
    39d8:	cd 40                	int    $0x40
    39da:	c3                   	ret    

000039db <getthp>:
    39db:	b8 19 00 00 00       	mov    $0x19,%eax
    39e0:	cd 40                	int    $0x40
    39e2:	c3                   	ret    
    39e3:	66 90                	xchg   %ax,%ax
    39e5:	66 90                	xchg   %ax,%ax
    39e7:	66 90                	xchg   %ax,%ax
    39e9:	66 90                	xchg   %ax,%ax
    39eb:	66 90                	xchg   %ax,%ax
    39ed:	66 90                	xchg   %ax,%ax
    39ef:	90                   	nop

000039f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    39f0:	55                   	push   %ebp
    39f1:	89 e5                	mov    %esp,%ebp
    39f3:	57                   	push   %edi
    39f4:	56                   	push   %esi
    39f5:	53                   	push   %ebx
    39f6:	83 ec 3c             	sub    $0x3c,%esp
    39f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    39fc:	89 d1                	mov    %edx,%ecx
{
    39fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    3a01:	85 d2                	test   %edx,%edx
    3a03:	0f 89 7f 00 00 00    	jns    3a88 <printint+0x98>
    3a09:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    3a0d:	74 79                	je     3a88 <printint+0x98>
    neg = 1;
    3a0f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    3a16:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    3a18:	31 db                	xor    %ebx,%ebx
    3a1a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    3a1d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    3a20:	89 c8                	mov    %ecx,%eax
    3a22:	31 d2                	xor    %edx,%edx
    3a24:	89 cf                	mov    %ecx,%edi
    3a26:	f7 75 c4             	divl   -0x3c(%ebp)
    3a29:	0f b6 92 9c 56 00 00 	movzbl 0x569c(%edx),%edx
    3a30:	89 45 c0             	mov    %eax,-0x40(%ebp)
    3a33:	89 d8                	mov    %ebx,%eax
    3a35:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    3a38:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    3a3b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    3a3e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    3a41:	76 dd                	jbe    3a20 <printint+0x30>
  if(neg)
    3a43:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    3a46:	85 c9                	test   %ecx,%ecx
    3a48:	74 0c                	je     3a56 <printint+0x66>
    buf[i++] = '-';
    3a4a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    3a4f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    3a51:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    3a56:	8b 7d b8             	mov    -0x48(%ebp),%edi
    3a59:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    3a5d:	eb 07                	jmp    3a66 <printint+0x76>
    3a5f:	90                   	nop
    putc(fd, buf[i]);
    3a60:	0f b6 13             	movzbl (%ebx),%edx
    3a63:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    3a66:	83 ec 04             	sub    $0x4,%esp
    3a69:	88 55 d7             	mov    %dl,-0x29(%ebp)
    3a6c:	6a 01                	push   $0x1
    3a6e:	56                   	push   %esi
    3a6f:	57                   	push   %edi
    3a70:	e8 ce fe ff ff       	call   3943 <write>
  while(--i >= 0)
    3a75:	83 c4 10             	add    $0x10,%esp
    3a78:	39 de                	cmp    %ebx,%esi
    3a7a:	75 e4                	jne    3a60 <printint+0x70>
}
    3a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a7f:	5b                   	pop    %ebx
    3a80:	5e                   	pop    %esi
    3a81:	5f                   	pop    %edi
    3a82:	5d                   	pop    %ebp
    3a83:	c3                   	ret    
    3a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    3a88:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    3a8f:	eb 87                	jmp    3a18 <printint+0x28>
    3a91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3a98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3a9f:	90                   	nop

00003aa0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3aa0:	55                   	push   %ebp
    3aa1:	89 e5                	mov    %esp,%ebp
    3aa3:	57                   	push   %edi
    3aa4:	56                   	push   %esi
    3aa5:	53                   	push   %ebx
    3aa6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3aa9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    3aac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    3aaf:	0f b6 13             	movzbl (%ebx),%edx
    3ab2:	84 d2                	test   %dl,%dl
    3ab4:	74 6a                	je     3b20 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    3ab6:	8d 45 10             	lea    0x10(%ebp),%eax
    3ab9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    3abc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    3abf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    3ac1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3ac4:	eb 36                	jmp    3afc <printf+0x5c>
    3ac6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3acd:	8d 76 00             	lea    0x0(%esi),%esi
    3ad0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    3ad3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    3ad8:	83 f8 25             	cmp    $0x25,%eax
    3adb:	74 15                	je     3af2 <printf+0x52>
  write(fd, &c, 1);
    3add:	83 ec 04             	sub    $0x4,%esp
    3ae0:	88 55 e7             	mov    %dl,-0x19(%ebp)
    3ae3:	6a 01                	push   $0x1
    3ae5:	57                   	push   %edi
    3ae6:	56                   	push   %esi
    3ae7:	e8 57 fe ff ff       	call   3943 <write>
    3aec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    3aef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    3af2:	0f b6 13             	movzbl (%ebx),%edx
    3af5:	83 c3 01             	add    $0x1,%ebx
    3af8:	84 d2                	test   %dl,%dl
    3afa:	74 24                	je     3b20 <printf+0x80>
    c = fmt[i] & 0xff;
    3afc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    3aff:	85 c9                	test   %ecx,%ecx
    3b01:	74 cd                	je     3ad0 <printf+0x30>
      }
    } else if(state == '%'){
    3b03:	83 f9 25             	cmp    $0x25,%ecx
    3b06:	75 ea                	jne    3af2 <printf+0x52>
      if(c == 'd'){
    3b08:	83 f8 25             	cmp    $0x25,%eax
    3b0b:	0f 84 07 01 00 00    	je     3c18 <printf+0x178>
    3b11:	83 e8 63             	sub    $0x63,%eax
    3b14:	83 f8 15             	cmp    $0x15,%eax
    3b17:	77 17                	ja     3b30 <printf+0x90>
    3b19:	ff 24 85 44 56 00 00 	jmp    *0x5644(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3b20:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3b23:	5b                   	pop    %ebx
    3b24:	5e                   	pop    %esi
    3b25:	5f                   	pop    %edi
    3b26:	5d                   	pop    %ebp
    3b27:	c3                   	ret    
    3b28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3b2f:	90                   	nop
  write(fd, &c, 1);
    3b30:	83 ec 04             	sub    $0x4,%esp
    3b33:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    3b36:	6a 01                	push   $0x1
    3b38:	57                   	push   %edi
    3b39:	56                   	push   %esi
    3b3a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3b3e:	e8 00 fe ff ff       	call   3943 <write>
        putc(fd, c);
    3b43:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    3b47:	83 c4 0c             	add    $0xc,%esp
    3b4a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    3b4d:	6a 01                	push   $0x1
    3b4f:	57                   	push   %edi
    3b50:	56                   	push   %esi
    3b51:	e8 ed fd ff ff       	call   3943 <write>
        putc(fd, c);
    3b56:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3b59:	31 c9                	xor    %ecx,%ecx
    3b5b:	eb 95                	jmp    3af2 <printf+0x52>
    3b5d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    3b60:	83 ec 0c             	sub    $0xc,%esp
    3b63:	b9 10 00 00 00       	mov    $0x10,%ecx
    3b68:	6a 00                	push   $0x0
    3b6a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3b6d:	8b 10                	mov    (%eax),%edx
    3b6f:	89 f0                	mov    %esi,%eax
    3b71:	e8 7a fe ff ff       	call   39f0 <printint>
        ap++;
    3b76:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    3b7a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3b7d:	31 c9                	xor    %ecx,%ecx
    3b7f:	e9 6e ff ff ff       	jmp    3af2 <printf+0x52>
    3b84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    3b88:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3b8b:	8b 10                	mov    (%eax),%edx
        ap++;
    3b8d:	83 c0 04             	add    $0x4,%eax
    3b90:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    3b93:	85 d2                	test   %edx,%edx
    3b95:	0f 84 8d 00 00 00    	je     3c28 <printf+0x188>
        while(*s != 0){
    3b9b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    3b9e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    3ba0:	84 c0                	test   %al,%al
    3ba2:	0f 84 4a ff ff ff    	je     3af2 <printf+0x52>
    3ba8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    3bab:	89 d3                	mov    %edx,%ebx
    3bad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    3bb0:	83 ec 04             	sub    $0x4,%esp
          s++;
    3bb3:	83 c3 01             	add    $0x1,%ebx
    3bb6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    3bb9:	6a 01                	push   $0x1
    3bbb:	57                   	push   %edi
    3bbc:	56                   	push   %esi
    3bbd:	e8 81 fd ff ff       	call   3943 <write>
        while(*s != 0){
    3bc2:	0f b6 03             	movzbl (%ebx),%eax
    3bc5:	83 c4 10             	add    $0x10,%esp
    3bc8:	84 c0                	test   %al,%al
    3bca:	75 e4                	jne    3bb0 <printf+0x110>
      state = 0;
    3bcc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    3bcf:	31 c9                	xor    %ecx,%ecx
    3bd1:	e9 1c ff ff ff       	jmp    3af2 <printf+0x52>
    3bd6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3bdd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    3be0:	83 ec 0c             	sub    $0xc,%esp
    3be3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3be8:	6a 01                	push   $0x1
    3bea:	e9 7b ff ff ff       	jmp    3b6a <printf+0xca>
    3bef:	90                   	nop
        putc(fd, *ap);
    3bf0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    3bf3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    3bf6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    3bf8:	6a 01                	push   $0x1
    3bfa:	57                   	push   %edi
    3bfb:	56                   	push   %esi
        putc(fd, *ap);
    3bfc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    3bff:	e8 3f fd ff ff       	call   3943 <write>
        ap++;
    3c04:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    3c08:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3c0b:	31 c9                	xor    %ecx,%ecx
    3c0d:	e9 e0 fe ff ff       	jmp    3af2 <printf+0x52>
    3c12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    3c18:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    3c1b:	83 ec 04             	sub    $0x4,%esp
    3c1e:	e9 2a ff ff ff       	jmp    3b4d <printf+0xad>
    3c23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3c27:	90                   	nop
          s = "(null)";
    3c28:	ba 3a 56 00 00       	mov    $0x563a,%edx
        while(*s != 0){
    3c2d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    3c30:	b8 28 00 00 00       	mov    $0x28,%eax
    3c35:	89 d3                	mov    %edx,%ebx
    3c37:	e9 74 ff ff ff       	jmp    3bb0 <printf+0x110>
    3c3c:	66 90                	xchg   %ax,%ax
    3c3e:	66 90                	xchg   %ax,%ax

00003c40 <vfree>:
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
    3c40:	55                   	push   %ebp
    3c41:	89 e5                	mov    %esp,%ebp
    3c43:	57                   	push   %edi
    3c44:	56                   	push   %esi
    3c45:	53                   	push   %ebx
    3c46:	83 ec 04             	sub    $0x4,%esp
    3c49:	8b 5d 08             	mov    0x8(%ebp),%ebx
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
    3c4c:	8b 45 0c             	mov    0xc(%ebp),%eax
    bp = ((Header*)ap) - 1;
    3c4f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    if (use_huge_pages) {
    3c52:	85 c0                	test   %eax,%eax
    3c54:	0f 84 96 00 00 00    	je     3cf0 <vfree+0xb0>
        freepptr = &huge_freep;
    3c5a:	a1 c0 a7 00 00       	mov    0xa7c0,%eax
    3c5f:	bf c0 a7 00 00       	mov    $0xa7c0,%edi
    3c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
    3c68:	89 c2                	mov    %eax,%edx
    3c6a:	8b 00                	mov    (%eax),%eax
    3c6c:	39 ca                	cmp    %ecx,%edx
    3c6e:	73 38                	jae    3ca8 <vfree+0x68>
    3c70:	39 c1                	cmp    %eax,%ecx
    3c72:	72 04                	jb     3c78 <vfree+0x38>
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
    3c74:	39 c2                	cmp    %eax,%edx
    3c76:	72 f0                	jb     3c68 <vfree+0x28>
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
    3c78:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3c7b:	89 7d f0             	mov    %edi,-0x10(%ebp)
    3c7e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3c81:	39 f8                	cmp    %edi,%eax
    3c83:	74 38                	je     3cbd <vfree+0x7d>
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
    3c85:	89 43 f8             	mov    %eax,-0x8(%ebx)
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
    3c88:	8b 42 04             	mov    0x4(%edx),%eax
    3c8b:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    3c8e:	39 f1                	cmp    %esi,%ecx
    3c90:	74 42                	je     3cd4 <vfree+0x94>
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
    3c92:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
    3c95:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
    3c97:	89 10                	mov    %edx,(%eax)
}
    3c99:	83 c4 04             	add    $0x4,%esp
    3c9c:	5b                   	pop    %ebx
    3c9d:	5e                   	pop    %esi
    3c9e:	5f                   	pop    %edi
    3c9f:	5d                   	pop    %ebp
    3ca0:	c3                   	ret    
    3ca1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
    3ca8:	39 c2                	cmp    %eax,%edx
    3caa:	72 bc                	jb     3c68 <vfree+0x28>
    3cac:	39 c1                	cmp    %eax,%ecx
    3cae:	73 b8                	jae    3c68 <vfree+0x28>
    if (bp + bp->s.size == p->s.ptr) {
    3cb0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3cb3:	89 7d f0             	mov    %edi,-0x10(%ebp)
    3cb6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3cb9:	39 f8                	cmp    %edi,%eax
    3cbb:	75 c8                	jne    3c85 <vfree+0x45>
        bp->s.size += p->s.ptr->s.size;
    3cbd:	03 70 04             	add    0x4(%eax),%esi
    3cc0:	89 73 fc             	mov    %esi,-0x4(%ebx)
        bp->s.ptr = p->s.ptr->s.ptr;
    3cc3:	8b 02                	mov    (%edx),%eax
    3cc5:	8b 00                	mov    (%eax),%eax
    3cc7:	89 43 f8             	mov    %eax,-0x8(%ebx)
    if (p + p->s.size == bp) {
    3cca:	8b 42 04             	mov    0x4(%edx),%eax
    3ccd:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    3cd0:	39 f1                	cmp    %esi,%ecx
    3cd2:	75 be                	jne    3c92 <vfree+0x52>
        p->s.size += bp->s.size;
    3cd4:	03 43 fc             	add    -0x4(%ebx),%eax
    3cd7:	89 42 04             	mov    %eax,0x4(%edx)
    *freepptr = p;
    3cda:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
    3cdd:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    3ce0:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
    3ce2:	89 10                	mov    %edx,(%eax)
}
    3ce4:	83 c4 04             	add    $0x4,%esp
    3ce7:	5b                   	pop    %ebx
    3ce8:	5e                   	pop    %esi
    3ce9:	5f                   	pop    %edi
    3cea:	5d                   	pop    %ebp
    3ceb:	c3                   	ret    
    3cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        freepptr = &freep;
    3cf0:	a1 cc a7 00 00       	mov    0xa7cc,%eax
    3cf5:	bf cc a7 00 00       	mov    $0xa7cc,%edi
    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
    3cfa:	e9 69 ff ff ff       	jmp    3c68 <vfree+0x28>
    3cff:	90                   	nop

00003d00 <vmalloc>:
void* vmalloc(uint nbytes, int use_huge_pages) {
    3d00:	55                   	push   %ebp
    3d01:	89 e5                	mov    %esp,%ebp
    3d03:	57                   	push   %edi
    3d04:	56                   	push   %esi
    3d05:	53                   	push   %ebx
    3d06:	83 ec 1c             	sub    $0x1c,%esp
    3d09:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (use_huge_pages) {
    3d0c:	85 db                	test   %ebx,%ebx
    3d0e:	0f 84 0c 01 00 00    	je     3e20 <vmalloc+0x120>
        if ((prevp = huge_freep) == 0) {
    3d14:	8b 15 c0 a7 00 00    	mov    0xa7c0,%edx
    3d1a:	85 d2                	test   %edx,%edx
    3d1c:	0f 84 de c2 ff ff    	je     0 <vmalloc.cold>
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
    3d22:	8b 45 08             	mov    0x8(%ebp),%eax
    3d25:	8d 78 07             	lea    0x7(%eax),%edi
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
    3d28:	8b 02                	mov    (%edx),%eax
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
    3d2a:	c1 ef 03             	shr    $0x3,%edi
        if (p->s.size >= nunits) {
    3d2d:	8b 48 04             	mov    0x4(%eax),%ecx
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
    3d30:	83 c7 01             	add    $0x1,%edi
        if (p->s.size >= nunits) {
    3d33:	39 f9                	cmp    %edi,%ecx
    3d35:	0f 83 c5 00 00 00    	jae    3e00 <vmalloc+0x100>
    3d3b:	be 00 10 00 00       	mov    $0x1000,%esi
    3d40:	ba 00 00 40 00       	mov    $0x400000,%edx
    3d45:	39 f7                	cmp    %esi,%edi
    3d47:	0f 43 f7             	cmovae %edi,%esi
    3d4a:	39 d7                	cmp    %edx,%edi
    3d4c:	0f 43 d7             	cmovae %edi,%edx
  p = sbrk(nu * sizeof(Header));
    3d4f:	8d 0c f5 00 00 00 00 	lea    0x0(,%esi,8),%ecx
    3d56:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    3d59:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
    3d60:	89 55 dc             	mov    %edx,-0x24(%ebp)
    3d63:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    3d66:	eb 15                	jmp    3d7d <vmalloc+0x7d>
    3d68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3d6f:	90                   	nop
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
    3d70:	8b 02                	mov    (%edx),%eax
        if (p->s.size >= nunits) {
    3d72:	8b 48 04             	mov    0x4(%eax),%ecx
    3d75:	39 f9                	cmp    %edi,%ecx
    3d77:	0f 83 83 00 00 00    	jae    3e00 <vmalloc+0x100>
        if (p == freep) {
    3d7d:	89 c2                	mov    %eax,%edx
    3d7f:	39 05 cc a7 00 00    	cmp    %eax,0xa7cc
    3d85:	75 e9                	jne    3d70 <vmalloc+0x70>
  if(use_huge_pages){
    3d87:	85 db                	test   %ebx,%ebx
    3d89:	74 45                	je     3dd0 <vmalloc+0xd0>
  p = sbrk(nu * sizeof(Header));
    3d8b:	83 ec 0c             	sub    $0xc,%esp
    3d8e:	ff 75 e0             	push   -0x20(%ebp)
    3d91:	e8 15 fc ff ff       	call   39ab <sbrk>
  if(p == (char*)-1)
    3d96:	83 c4 10             	add    $0x10,%esp
    3d99:	83 f8 ff             	cmp    $0xffffffff,%eax
    3d9c:	74 20                	je     3dbe <vmalloc+0xbe>
  hp->s.size = nu;
    3d9e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  vfree((void*)(hp + 1), use_huge_pages);
    3da1:	83 ec 08             	sub    $0x8,%esp
    3da4:	83 c0 08             	add    $0x8,%eax
  hp->s.size = nu;
    3da7:	89 48 fc             	mov    %ecx,-0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
    3daa:	53                   	push   %ebx
    3dab:	50                   	push   %eax
    3dac:	e8 8f fe ff ff       	call   3c40 <vfree>
  return use_huge_pages ? huge_freep : freep;
    3db1:	8b 15 c0 a7 00 00    	mov    0xa7c0,%edx
    3db7:	83 c4 10             	add    $0x10,%esp
            if (p == 0) {
    3dba:	85 d2                	test   %edx,%edx
    3dbc:	75 b2                	jne    3d70 <vmalloc+0x70>
}
    3dbe:	8d 65 f4             	lea    -0xc(%ebp),%esp
                return 0;
    3dc1:	31 c0                	xor    %eax,%eax
}
    3dc3:	5b                   	pop    %ebx
    3dc4:	5e                   	pop    %esi
    3dc5:	5f                   	pop    %edi
    3dc6:	5d                   	pop    %ebp
    3dc7:	c3                   	ret    
    3dc8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3dcf:	90                   	nop
  p = sbrk(nu * sizeof(Header));
    3dd0:	83 ec 0c             	sub    $0xc,%esp
    3dd3:	ff 75 e4             	push   -0x1c(%ebp)
    3dd6:	e8 d0 fb ff ff       	call   39ab <sbrk>
  if(p == (char*)-1)
    3ddb:	83 c4 10             	add    $0x10,%esp
    3dde:	83 f8 ff             	cmp    $0xffffffff,%eax
    3de1:	74 db                	je     3dbe <vmalloc+0xbe>
  hp->s.size = nu;
    3de3:	89 70 04             	mov    %esi,0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
    3de6:	83 ec 08             	sub    $0x8,%esp
    3de9:	83 c0 08             	add    $0x8,%eax
    3dec:	6a 00                	push   $0x0
    3dee:	50                   	push   %eax
    3def:	e8 4c fe ff ff       	call   3c40 <vfree>
  return use_huge_pages ? huge_freep : freep;
    3df4:	8b 15 cc a7 00 00    	mov    0xa7cc,%edx
    3dfa:	83 c4 10             	add    $0x10,%esp
    3dfd:	eb bb                	jmp    3dba <vmalloc+0xba>
    3dff:	90                   	nop
            if (p->s.size == nunits) {
    3e00:	39 cf                	cmp    %ecx,%edi
    3e02:	74 34                	je     3e38 <vmalloc+0x138>
                p->s.size -= nunits;
    3e04:	29 f9                	sub    %edi,%ecx
    3e06:	89 48 04             	mov    %ecx,0x4(%eax)
                p += p->s.size;
    3e09:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
                p->s.size = nunits;
    3e0c:	89 78 04             	mov    %edi,0x4(%eax)
            freep = prevp;
    3e0f:	89 15 cc a7 00 00    	mov    %edx,0xa7cc
}
    3e15:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return (void*)(p + 1);
    3e18:	83 c0 08             	add    $0x8,%eax
}
    3e1b:	5b                   	pop    %ebx
    3e1c:	5e                   	pop    %esi
    3e1d:	5f                   	pop    %edi
    3e1e:	5d                   	pop    %ebp
    3e1f:	c3                   	ret    
        if ((prevp = freep) == 0) {
    3e20:	8b 15 cc a7 00 00    	mov    0xa7cc,%edx
    3e26:	85 d2                	test   %edx,%edx
    3e28:	0f 85 f4 fe ff ff    	jne    3d22 <vmalloc+0x22>
    3e2e:	e9 f2 c1 ff ff       	jmp    25 <vmalloc.cold+0x25>
    3e33:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3e37:	90                   	nop
                prevp->s.ptr = p->s.ptr;
    3e38:	8b 08                	mov    (%eax),%ecx
    3e3a:	89 0a                	mov    %ecx,(%edx)
    3e3c:	eb d1                	jmp    3e0f <vmalloc+0x10f>
    3e3e:	66 90                	xchg   %ax,%ax

00003e40 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
    3e40:	55                   	push   %ebp
    3e41:	89 e5                	mov    %esp,%ebp
    3e43:	53                   	push   %ebx
    3e44:	83 ec 04             	sub    $0x4,%esp
    3e47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
    3e4a:	e8 8c fb ff ff       	call   39db <getthp>


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
    3e4f:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
    3e55:	76 19                	jbe    3e70 <malloc+0x30>
    3e57:	85 c0                	test   %eax,%eax
    3e59:	74 15                	je     3e70 <malloc+0x30>
    return vmalloc(nbytes, 1); // use the huge pages
    3e5b:	83 ec 08             	sub    $0x8,%esp
    3e5e:	6a 01                	push   $0x1
    3e60:	53                   	push   %ebx
    3e61:	e8 9a fe ff ff       	call   3d00 <vmalloc>
  }
  else{
    return vmalloc(nbytes, 0);
  }
}
    3e66:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 1); // use the huge pages
    3e69:	83 c4 10             	add    $0x10,%esp
}
    3e6c:	c9                   	leave  
    3e6d:	c3                   	ret    
    3e6e:	66 90                	xchg   %ax,%ax
    return vmalloc(nbytes, 0);
    3e70:	83 ec 08             	sub    $0x8,%esp
    3e73:	6a 00                	push   $0x0
    3e75:	53                   	push   %ebx
    3e76:	e8 85 fe ff ff       	call   3d00 <vmalloc>
}
    3e7b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 0);
    3e7e:	83 c4 10             	add    $0x10,%esp
}
    3e81:	c9                   	leave  
    3e82:	c3                   	ret    
    3e83:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3e8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003e90 <free>:

void free(void * ap){
    3e90:	55                   	push   %ebp
    3e91:	89 e5                	mov    %esp,%ebp
  vfree(ap, 0);
    3e93:	6a 00                	push   $0x0
    3e95:	ff 75 08             	push   0x8(%ebp)
    3e98:	e8 a3 fd ff ff       	call   3c40 <vfree>
}
    3e9d:	58                   	pop    %eax
    3e9e:	5a                   	pop    %edx
    3e9f:	c9                   	leave  
    3ea0:	c3                   	ret    
