
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <vmalloc.cold>:

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
       0:	c7 05 04 1c 00 00 08 	movl   $0x1c08,0x1c04
       7:	1c 00 00 
       a:	c7 05 08 1c 00 00 08 	movl   $0x1c08,0x1c08
      11:	1c 00 00 
            huge_base.s.size = 0;
      14:	c7 05 0c 1c 00 00 00 	movl   $0x0,0x1c0c
      1b:	00 00 00 
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
      1e:	a1 00 00 00 00       	mov    0x0,%eax
      23:	0f 0b                	ud2    
            base.s.ptr = freep = &base;
      25:	c7 05 10 1c 00 00 14 	movl   $0x1c14,0x1c10
      2c:	1c 00 00 
      2f:	c7 05 14 1c 00 00 14 	movl   $0x1c14,0x1c14
      36:	1c 00 00 
            base.s.size = 0;
      39:	c7 05 18 1c 00 00 00 	movl   $0x0,0x1c18
      40:	00 00 00 
      43:	eb d9                	jmp    1e <vmalloc.cold+0x1e>
      45:	66 90                	xchg   %ax,%ax
      47:	66 90                	xchg   %ax,%ax
      49:	66 90                	xchg   %ax,%ax
      4b:	66 90                	xchg   %ax,%ax
      4d:	66 90                	xchg   %ax,%ax
      4f:	90                   	nop

00000050 <main>:
  return 0;
}

int
main(void)
{
      50:	8d 4c 24 04          	lea    0x4(%esp),%ecx
      54:	83 e4 f0             	and    $0xfffffff0,%esp
      57:	ff 71 fc             	push   -0x4(%ecx)
      5a:	55                   	push   %ebp
      5b:	89 e5                	mov    %esp,%ebp
      5d:	51                   	push   %ecx
      5e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      61:	eb 0e                	jmp    71 <main+0x21>
      63:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      67:	90                   	nop
    if(fd >= 3){
      68:	83 f8 02             	cmp    $0x2,%eax
      6b:	0f 8f 91 00 00 00    	jg     102 <main+0xb2>
  while((fd = open("console", O_RDWR)) >= 0){
      71:	83 ec 08             	sub    $0x8,%esp
      74:	6a 02                	push   $0x2
      76:	68 95 14 00 00       	push   $0x1495
      7b:	e8 33 0e 00 00       	call   eb3 <open>
      80:	83 c4 10             	add    $0x10,%esp
      83:	85 c0                	test   %eax,%eax
      85:	79 e1                	jns    68 <main+0x18>
      87:	eb 2e                	jmp    b7 <main+0x67>
      89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      90:	80 3d a2 1b 00 00 20 	cmpb   $0x20,0x1ba2
      97:	0f 84 88 00 00 00    	je     125 <main+0xd5>
      9d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      a0:	e8 c6 0d 00 00       	call   e6b <fork>
  if(pid == -1)
      a5:	83 f8 ff             	cmp    $0xffffffff,%eax
      a8:	0f 84 c1 00 00 00    	je     16f <main+0x11f>
    if(fork1() == 0)
      ae:	85 c0                	test   %eax,%eax
      b0:	74 5e                	je     110 <main+0xc0>
    wait();
      b2:	e8 c4 0d 00 00       	call   e7b <wait>
  printf(2, "$ ");
      b7:	83 ec 08             	sub    $0x8,%esp
      ba:	68 f4 13 00 00       	push   $0x13f4
      bf:	6a 02                	push   $0x2
      c1:	e8 2a 0f 00 00       	call   ff0 <printf>
  memset(buf, 0, nbuf);
      c6:	83 c4 0c             	add    $0xc,%esp
      c9:	6a 64                	push   $0x64
      cb:	6a 00                	push   $0x0
      cd:	68 a0 1b 00 00       	push   $0x1ba0
      d2:	e8 09 0c 00 00       	call   ce0 <memset>
  gets(buf, nbuf);
      d7:	58                   	pop    %eax
      d8:	5a                   	pop    %edx
      d9:	6a 64                	push   $0x64
      db:	68 a0 1b 00 00       	push   $0x1ba0
      e0:	e8 5b 0c 00 00       	call   d40 <gets>
  if(buf[0] == 0) // EOF
      e5:	0f b6 05 a0 1b 00 00 	movzbl 0x1ba0,%eax
      ec:	83 c4 10             	add    $0x10,%esp
      ef:	84 c0                	test   %al,%al
      f1:	74 77                	je     16a <main+0x11a>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      f3:	3c 63                	cmp    $0x63,%al
      f5:	75 a9                	jne    a0 <main+0x50>
      f7:	80 3d a1 1b 00 00 64 	cmpb   $0x64,0x1ba1
      fe:	75 a0                	jne    a0 <main+0x50>
     100:	eb 8e                	jmp    90 <main+0x40>
      close(fd);
     102:	83 ec 0c             	sub    $0xc,%esp
     105:	50                   	push   %eax
     106:	e8 90 0d 00 00       	call   e9b <close>
      break;
     10b:	83 c4 10             	add    $0x10,%esp
     10e:	eb a7                	jmp    b7 <main+0x67>
      runcmd(parsecmd(buf));
     110:	83 ec 0c             	sub    $0xc,%esp
     113:	68 a0 1b 00 00       	push   $0x1ba0
     118:	e8 93 0a 00 00       	call   bb0 <parsecmd>
     11d:	89 04 24             	mov    %eax,(%esp)
     120:	e8 db 00 00 00       	call   200 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
     125:	83 ec 0c             	sub    $0xc,%esp
     128:	68 a0 1b 00 00       	push   $0x1ba0
     12d:	e8 7e 0b 00 00       	call   cb0 <strlen>
      if(chdir(buf+3) < 0)
     132:	c7 04 24 a3 1b 00 00 	movl   $0x1ba3,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
     139:	c6 80 9f 1b 00 00 00 	movb   $0x0,0x1b9f(%eax)
      if(chdir(buf+3) < 0)
     140:	e8 9e 0d 00 00       	call   ee3 <chdir>
     145:	83 c4 10             	add    $0x10,%esp
     148:	85 c0                	test   %eax,%eax
     14a:	0f 89 67 ff ff ff    	jns    b7 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
     150:	51                   	push   %ecx
     151:	68 a3 1b 00 00       	push   $0x1ba3
     156:	68 9d 14 00 00       	push   $0x149d
     15b:	6a 02                	push   $0x2
     15d:	e8 8e 0e 00 00       	call   ff0 <printf>
     162:	83 c4 10             	add    $0x10,%esp
     165:	e9 4d ff ff ff       	jmp    b7 <main+0x67>
  exit();
     16a:	e8 04 0d 00 00       	call   e73 <exit>
    panic("fork");
     16f:	83 ec 0c             	sub    $0xc,%esp
     172:	68 f7 13 00 00       	push   $0x13f7
     177:	e8 44 00 00 00       	call   1c0 <panic>
     17c:	66 90                	xchg   %ax,%ax
     17e:	66 90                	xchg   %ax,%ax

00000180 <getcmd>:
{
     180:	55                   	push   %ebp
     181:	89 e5                	mov    %esp,%ebp
     183:	56                   	push   %esi
     184:	53                   	push   %ebx
     185:	8b 75 0c             	mov    0xc(%ebp),%esi
     188:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     18b:	83 ec 08             	sub    $0x8,%esp
     18e:	68 f4 13 00 00       	push   $0x13f4
     193:	6a 02                	push   $0x2
     195:	e8 56 0e 00 00       	call   ff0 <printf>
  memset(buf, 0, nbuf);
     19a:	83 c4 0c             	add    $0xc,%esp
     19d:	56                   	push   %esi
     19e:	6a 00                	push   $0x0
     1a0:	53                   	push   %ebx
     1a1:	e8 3a 0b 00 00       	call   ce0 <memset>
  gets(buf, nbuf);
     1a6:	58                   	pop    %eax
     1a7:	5a                   	pop    %edx
     1a8:	56                   	push   %esi
     1a9:	53                   	push   %ebx
     1aa:	e8 91 0b 00 00       	call   d40 <gets>
  if(buf[0] == 0) // EOF
     1af:	83 c4 10             	add    $0x10,%esp
     1b2:	80 3b 01             	cmpb   $0x1,(%ebx)
     1b5:	19 c0                	sbb    %eax,%eax
}
     1b7:	8d 65 f8             	lea    -0x8(%ebp),%esp
     1ba:	5b                   	pop    %ebx
     1bb:	5e                   	pop    %esi
     1bc:	5d                   	pop    %ebp
     1bd:	c3                   	ret    
     1be:	66 90                	xchg   %ax,%ax

000001c0 <panic>:
{
     1c0:	55                   	push   %ebp
     1c1:	89 e5                	mov    %esp,%ebp
     1c3:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     1c6:	ff 75 08             	push   0x8(%ebp)
     1c9:	68 91 14 00 00       	push   $0x1491
     1ce:	6a 02                	push   $0x2
     1d0:	e8 1b 0e 00 00       	call   ff0 <printf>
  exit();
     1d5:	e8 99 0c 00 00       	call   e73 <exit>
     1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001e0 <fork1>:
{
     1e0:	55                   	push   %ebp
     1e1:	89 e5                	mov    %esp,%ebp
     1e3:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     1e6:	e8 80 0c 00 00       	call   e6b <fork>
  if(pid == -1)
     1eb:	83 f8 ff             	cmp    $0xffffffff,%eax
     1ee:	74 02                	je     1f2 <fork1+0x12>
  return pid;
}
     1f0:	c9                   	leave  
     1f1:	c3                   	ret    
    panic("fork");
     1f2:	83 ec 0c             	sub    $0xc,%esp
     1f5:	68 f7 13 00 00       	push   $0x13f7
     1fa:	e8 c1 ff ff ff       	call   1c0 <panic>
     1ff:	90                   	nop

00000200 <runcmd>:
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	53                   	push   %ebx
     204:	83 ec 14             	sub    $0x14,%esp
     207:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     20a:	85 db                	test   %ebx,%ebx
     20c:	74 42                	je     250 <runcmd+0x50>
  switch(cmd->type){
     20e:	83 3b 05             	cmpl   $0x5,(%ebx)
     211:	0f 87 e3 00 00 00    	ja     2fa <runcmd+0xfa>
     217:	8b 03                	mov    (%ebx),%eax
     219:	ff 24 85 ac 14 00 00 	jmp    *0x14ac(,%eax,4)
    if(ecmd->argv[0] == 0)
     220:	8b 43 04             	mov    0x4(%ebx),%eax
     223:	85 c0                	test   %eax,%eax
     225:	74 29                	je     250 <runcmd+0x50>
    exec(ecmd->argv[0], ecmd->argv);
     227:	8d 53 04             	lea    0x4(%ebx),%edx
     22a:	51                   	push   %ecx
     22b:	51                   	push   %ecx
     22c:	52                   	push   %edx
     22d:	50                   	push   %eax
     22e:	e8 78 0c 00 00       	call   eab <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     233:	83 c4 0c             	add    $0xc,%esp
     236:	ff 73 04             	push   0x4(%ebx)
     239:	68 03 14 00 00       	push   $0x1403
     23e:	6a 02                	push   $0x2
     240:	e8 ab 0d 00 00       	call   ff0 <printf>
    break;
     245:	83 c4 10             	add    $0x10,%esp
     248:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     24f:	90                   	nop
    exit();
     250:	e8 1e 0c 00 00       	call   e73 <exit>
    if(fork1() == 0)
     255:	e8 86 ff ff ff       	call   1e0 <fork1>
     25a:	85 c0                	test   %eax,%eax
     25c:	75 f2                	jne    250 <runcmd+0x50>
     25e:	e9 8c 00 00 00       	jmp    2ef <runcmd+0xef>
    if(pipe(p) < 0)
     263:	83 ec 0c             	sub    $0xc,%esp
     266:	8d 45 f0             	lea    -0x10(%ebp),%eax
     269:	50                   	push   %eax
     26a:	e8 14 0c 00 00       	call   e83 <pipe>
     26f:	83 c4 10             	add    $0x10,%esp
     272:	85 c0                	test   %eax,%eax
     274:	0f 88 a2 00 00 00    	js     31c <runcmd+0x11c>
    if(fork1() == 0){
     27a:	e8 61 ff ff ff       	call   1e0 <fork1>
     27f:	85 c0                	test   %eax,%eax
     281:	0f 84 a2 00 00 00    	je     329 <runcmd+0x129>
    if(fork1() == 0){
     287:	e8 54 ff ff ff       	call   1e0 <fork1>
     28c:	85 c0                	test   %eax,%eax
     28e:	0f 84 c3 00 00 00    	je     357 <runcmd+0x157>
    close(p[0]);
     294:	83 ec 0c             	sub    $0xc,%esp
     297:	ff 75 f0             	push   -0x10(%ebp)
     29a:	e8 fc 0b 00 00       	call   e9b <close>
    close(p[1]);
     29f:	58                   	pop    %eax
     2a0:	ff 75 f4             	push   -0xc(%ebp)
     2a3:	e8 f3 0b 00 00       	call   e9b <close>
    wait();
     2a8:	e8 ce 0b 00 00       	call   e7b <wait>
    wait();
     2ad:	e8 c9 0b 00 00       	call   e7b <wait>
    break;
     2b2:	83 c4 10             	add    $0x10,%esp
     2b5:	eb 99                	jmp    250 <runcmd+0x50>
    if(fork1() == 0)
     2b7:	e8 24 ff ff ff       	call   1e0 <fork1>
     2bc:	85 c0                	test   %eax,%eax
     2be:	74 2f                	je     2ef <runcmd+0xef>
    wait();
     2c0:	e8 b6 0b 00 00       	call   e7b <wait>
    runcmd(lcmd->right);
     2c5:	83 ec 0c             	sub    $0xc,%esp
     2c8:	ff 73 08             	push   0x8(%ebx)
     2cb:	e8 30 ff ff ff       	call   200 <runcmd>
    close(rcmd->fd);
     2d0:	83 ec 0c             	sub    $0xc,%esp
     2d3:	ff 73 14             	push   0x14(%ebx)
     2d6:	e8 c0 0b 00 00       	call   e9b <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     2db:	58                   	pop    %eax
     2dc:	5a                   	pop    %edx
     2dd:	ff 73 10             	push   0x10(%ebx)
     2e0:	ff 73 08             	push   0x8(%ebx)
     2e3:	e8 cb 0b 00 00       	call   eb3 <open>
     2e8:	83 c4 10             	add    $0x10,%esp
     2eb:	85 c0                	test   %eax,%eax
     2ed:	78 18                	js     307 <runcmd+0x107>
      runcmd(bcmd->cmd);
     2ef:	83 ec 0c             	sub    $0xc,%esp
     2f2:	ff 73 04             	push   0x4(%ebx)
     2f5:	e8 06 ff ff ff       	call   200 <runcmd>
    panic("runcmd");
     2fa:	83 ec 0c             	sub    $0xc,%esp
     2fd:	68 fc 13 00 00       	push   $0x13fc
     302:	e8 b9 fe ff ff       	call   1c0 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     307:	51                   	push   %ecx
     308:	ff 73 08             	push   0x8(%ebx)
     30b:	68 13 14 00 00       	push   $0x1413
     310:	6a 02                	push   $0x2
     312:	e8 d9 0c 00 00       	call   ff0 <printf>
      exit();
     317:	e8 57 0b 00 00       	call   e73 <exit>
      panic("pipe");
     31c:	83 ec 0c             	sub    $0xc,%esp
     31f:	68 23 14 00 00       	push   $0x1423
     324:	e8 97 fe ff ff       	call   1c0 <panic>
      close(1);
     329:	83 ec 0c             	sub    $0xc,%esp
     32c:	6a 01                	push   $0x1
     32e:	e8 68 0b 00 00       	call   e9b <close>
      dup(p[1]);
     333:	58                   	pop    %eax
     334:	ff 75 f4             	push   -0xc(%ebp)
     337:	e8 af 0b 00 00       	call   eeb <dup>
      close(p[0]);
     33c:	58                   	pop    %eax
     33d:	ff 75 f0             	push   -0x10(%ebp)
     340:	e8 56 0b 00 00       	call   e9b <close>
      close(p[1]);
     345:	58                   	pop    %eax
     346:	ff 75 f4             	push   -0xc(%ebp)
     349:	e8 4d 0b 00 00       	call   e9b <close>
      runcmd(pcmd->left);
     34e:	5a                   	pop    %edx
     34f:	ff 73 04             	push   0x4(%ebx)
     352:	e8 a9 fe ff ff       	call   200 <runcmd>
      close(0);
     357:	83 ec 0c             	sub    $0xc,%esp
     35a:	6a 00                	push   $0x0
     35c:	e8 3a 0b 00 00       	call   e9b <close>
      dup(p[0]);
     361:	5a                   	pop    %edx
     362:	ff 75 f0             	push   -0x10(%ebp)
     365:	e8 81 0b 00 00       	call   eeb <dup>
      close(p[0]);
     36a:	59                   	pop    %ecx
     36b:	ff 75 f0             	push   -0x10(%ebp)
     36e:	e8 28 0b 00 00       	call   e9b <close>
      close(p[1]);
     373:	58                   	pop    %eax
     374:	ff 75 f4             	push   -0xc(%ebp)
     377:	e8 1f 0b 00 00       	call   e9b <close>
      runcmd(pcmd->right);
     37c:	58                   	pop    %eax
     37d:	ff 73 08             	push   0x8(%ebx)
     380:	e8 7b fe ff ff       	call   200 <runcmd>
     385:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000390 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     390:	55                   	push   %ebp
     391:	89 e5                	mov    %esp,%ebp
     393:	53                   	push   %ebx
     394:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     397:	6a 54                	push   $0x54
     399:	e8 f2 0f 00 00       	call   1390 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     39e:	83 c4 0c             	add    $0xc,%esp
     3a1:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     3a3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3a5:	6a 00                	push   $0x0
     3a7:	50                   	push   %eax
     3a8:	e8 33 09 00 00       	call   ce0 <memset>
  cmd->type = EXEC;
     3ad:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     3b3:	89 d8                	mov    %ebx,%eax
     3b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3b8:	c9                   	leave  
     3b9:	c3                   	ret    
     3ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003c0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	53                   	push   %ebx
     3c4:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c7:	6a 18                	push   $0x18
     3c9:	e8 c2 0f 00 00       	call   1390 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ce:	83 c4 0c             	add    $0xc,%esp
     3d1:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     3d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3d5:	6a 00                	push   $0x0
     3d7:	50                   	push   %eax
     3d8:	e8 03 09 00 00       	call   ce0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     3dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     3e0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     3e6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     3e9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ec:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     3ef:	8b 45 10             	mov    0x10(%ebp),%eax
     3f2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3f5:	8b 45 14             	mov    0x14(%ebp),%eax
     3f8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3fb:	8b 45 18             	mov    0x18(%ebp),%eax
     3fe:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     401:	89 d8                	mov    %ebx,%eax
     403:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     406:	c9                   	leave  
     407:	c3                   	ret    
     408:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     40f:	90                   	nop

00000410 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	53                   	push   %ebx
     414:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     417:	6a 0c                	push   $0xc
     419:	e8 72 0f 00 00       	call   1390 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     41e:	83 c4 0c             	add    $0xc,%esp
     421:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     423:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     425:	6a 00                	push   $0x0
     427:	50                   	push   %eax
     428:	e8 b3 08 00 00       	call   ce0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     42d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     430:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     436:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     439:	8b 45 0c             	mov    0xc(%ebp),%eax
     43c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     43f:	89 d8                	mov    %ebx,%eax
     441:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     444:	c9                   	leave  
     445:	c3                   	ret    
     446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     44d:	8d 76 00             	lea    0x0(%esi),%esi

00000450 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	53                   	push   %ebx
     454:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     457:	6a 0c                	push   $0xc
     459:	e8 32 0f 00 00       	call   1390 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     45e:	83 c4 0c             	add    $0xc,%esp
     461:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     463:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     465:	6a 00                	push   $0x0
     467:	50                   	push   %eax
     468:	e8 73 08 00 00       	call   ce0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     46d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     470:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     476:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     479:	8b 45 0c             	mov    0xc(%ebp),%eax
     47c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     47f:	89 d8                	mov    %ebx,%eax
     481:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     484:	c9                   	leave  
     485:	c3                   	ret    
     486:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     48d:	8d 76 00             	lea    0x0(%esi),%esi

00000490 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     490:	55                   	push   %ebp
     491:	89 e5                	mov    %esp,%ebp
     493:	53                   	push   %ebx
     494:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     497:	6a 08                	push   $0x8
     499:	e8 f2 0e 00 00       	call   1390 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     49e:	83 c4 0c             	add    $0xc,%esp
     4a1:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     4a3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4a5:	6a 00                	push   $0x0
     4a7:	50                   	push   %eax
     4a8:	e8 33 08 00 00       	call   ce0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     4ad:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     4b0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     4b6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     4b9:	89 d8                	mov    %ebx,%eax
     4bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4be:	c9                   	leave  
     4bf:	c3                   	ret    

000004c0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     4c0:	55                   	push   %ebp
     4c1:	89 e5                	mov    %esp,%ebp
     4c3:	57                   	push   %edi
     4c4:	56                   	push   %esi
     4c5:	53                   	push   %ebx
     4c6:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     4c9:	8b 45 08             	mov    0x8(%ebp),%eax
{
     4cc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     4cf:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     4d2:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     4d4:	39 df                	cmp    %ebx,%edi
     4d6:	72 0f                	jb     4e7 <gettoken+0x27>
     4d8:	eb 25                	jmp    4ff <gettoken+0x3f>
     4da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     4e0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     4e3:	39 fb                	cmp    %edi,%ebx
     4e5:	74 18                	je     4ff <gettoken+0x3f>
     4e7:	0f be 07             	movsbl (%edi),%eax
     4ea:	83 ec 08             	sub    $0x8,%esp
     4ed:	50                   	push   %eax
     4ee:	68 88 1b 00 00       	push   $0x1b88
     4f3:	e8 08 08 00 00       	call   d00 <strchr>
     4f8:	83 c4 10             	add    $0x10,%esp
     4fb:	85 c0                	test   %eax,%eax
     4fd:	75 e1                	jne    4e0 <gettoken+0x20>
  if(q)
     4ff:	85 f6                	test   %esi,%esi
     501:	74 02                	je     505 <gettoken+0x45>
    *q = s;
     503:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     505:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     508:	3c 3c                	cmp    $0x3c,%al
     50a:	0f 8f d0 00 00 00    	jg     5e0 <gettoken+0x120>
     510:	3c 3a                	cmp    $0x3a,%al
     512:	0f 8f b4 00 00 00    	jg     5cc <gettoken+0x10c>
     518:	84 c0                	test   %al,%al
     51a:	75 44                	jne    560 <gettoken+0xa0>
     51c:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     51e:	8b 55 14             	mov    0x14(%ebp),%edx
     521:	85 d2                	test   %edx,%edx
     523:	74 05                	je     52a <gettoken+0x6a>
    *eq = s;
     525:	8b 45 14             	mov    0x14(%ebp),%eax
     528:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     52a:	39 df                	cmp    %ebx,%edi
     52c:	72 09                	jb     537 <gettoken+0x77>
     52e:	eb 1f                	jmp    54f <gettoken+0x8f>
    s++;
     530:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     533:	39 fb                	cmp    %edi,%ebx
     535:	74 18                	je     54f <gettoken+0x8f>
     537:	0f be 07             	movsbl (%edi),%eax
     53a:	83 ec 08             	sub    $0x8,%esp
     53d:	50                   	push   %eax
     53e:	68 88 1b 00 00       	push   $0x1b88
     543:	e8 b8 07 00 00       	call   d00 <strchr>
     548:	83 c4 10             	add    $0x10,%esp
     54b:	85 c0                	test   %eax,%eax
     54d:	75 e1                	jne    530 <gettoken+0x70>
  *ps = s;
     54f:	8b 45 08             	mov    0x8(%ebp),%eax
     552:	89 38                	mov    %edi,(%eax)
  return ret;
}
     554:	8d 65 f4             	lea    -0xc(%ebp),%esp
     557:	89 f0                	mov    %esi,%eax
     559:	5b                   	pop    %ebx
     55a:	5e                   	pop    %esi
     55b:	5f                   	pop    %edi
     55c:	5d                   	pop    %ebp
     55d:	c3                   	ret    
     55e:	66 90                	xchg   %ax,%ax
  switch(*s){
     560:	79 5e                	jns    5c0 <gettoken+0x100>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     562:	39 fb                	cmp    %edi,%ebx
     564:	77 34                	ja     59a <gettoken+0xda>
  if(eq)
     566:	8b 45 14             	mov    0x14(%ebp),%eax
     569:	be 61 00 00 00       	mov    $0x61,%esi
     56e:	85 c0                	test   %eax,%eax
     570:	75 b3                	jne    525 <gettoken+0x65>
     572:	eb db                	jmp    54f <gettoken+0x8f>
     574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     578:	0f be 07             	movsbl (%edi),%eax
     57b:	83 ec 08             	sub    $0x8,%esp
     57e:	50                   	push   %eax
     57f:	68 80 1b 00 00       	push   $0x1b80
     584:	e8 77 07 00 00       	call   d00 <strchr>
     589:	83 c4 10             	add    $0x10,%esp
     58c:	85 c0                	test   %eax,%eax
     58e:	75 22                	jne    5b2 <gettoken+0xf2>
      s++;
     590:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     593:	39 fb                	cmp    %edi,%ebx
     595:	74 cf                	je     566 <gettoken+0xa6>
     597:	0f b6 07             	movzbl (%edi),%eax
     59a:	83 ec 08             	sub    $0x8,%esp
     59d:	0f be f0             	movsbl %al,%esi
     5a0:	56                   	push   %esi
     5a1:	68 88 1b 00 00       	push   $0x1b88
     5a6:	e8 55 07 00 00       	call   d00 <strchr>
     5ab:	83 c4 10             	add    $0x10,%esp
     5ae:	85 c0                	test   %eax,%eax
     5b0:	74 c6                	je     578 <gettoken+0xb8>
    ret = 'a';
     5b2:	be 61 00 00 00       	mov    $0x61,%esi
     5b7:	e9 62 ff ff ff       	jmp    51e <gettoken+0x5e>
     5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     5c0:	3c 26                	cmp    $0x26,%al
     5c2:	74 08                	je     5cc <gettoken+0x10c>
     5c4:	8d 48 d8             	lea    -0x28(%eax),%ecx
     5c7:	80 f9 01             	cmp    $0x1,%cl
     5ca:	77 96                	ja     562 <gettoken+0xa2>
  ret = *s;
     5cc:	0f be f0             	movsbl %al,%esi
    s++;
     5cf:	83 c7 01             	add    $0x1,%edi
    break;
     5d2:	e9 47 ff ff ff       	jmp    51e <gettoken+0x5e>
     5d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5de:	66 90                	xchg   %ax,%ax
  switch(*s){
     5e0:	3c 3e                	cmp    $0x3e,%al
     5e2:	75 1c                	jne    600 <gettoken+0x140>
    if(*s == '>'){
     5e4:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
    s++;
     5e8:	8d 47 01             	lea    0x1(%edi),%eax
    if(*s == '>'){
     5eb:	74 1c                	je     609 <gettoken+0x149>
    s++;
     5ed:	89 c7                	mov    %eax,%edi
     5ef:	be 3e 00 00 00       	mov    $0x3e,%esi
     5f4:	e9 25 ff ff ff       	jmp    51e <gettoken+0x5e>
     5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     600:	3c 7c                	cmp    $0x7c,%al
     602:	74 c8                	je     5cc <gettoken+0x10c>
     604:	e9 59 ff ff ff       	jmp    562 <gettoken+0xa2>
      s++;
     609:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     60c:	be 2b 00 00 00       	mov    $0x2b,%esi
     611:	e9 08 ff ff ff       	jmp    51e <gettoken+0x5e>
     616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     61d:	8d 76 00             	lea    0x0(%esi),%esi

00000620 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     620:	55                   	push   %ebp
     621:	89 e5                	mov    %esp,%ebp
     623:	57                   	push   %edi
     624:	56                   	push   %esi
     625:	53                   	push   %ebx
     626:	83 ec 0c             	sub    $0xc,%esp
     629:	8b 7d 08             	mov    0x8(%ebp),%edi
     62c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     62f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     631:	39 f3                	cmp    %esi,%ebx
     633:	72 12                	jb     647 <peek+0x27>
     635:	eb 28                	jmp    65f <peek+0x3f>
     637:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     63e:	66 90                	xchg   %ax,%ax
    s++;
     640:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     643:	39 de                	cmp    %ebx,%esi
     645:	74 18                	je     65f <peek+0x3f>
     647:	0f be 03             	movsbl (%ebx),%eax
     64a:	83 ec 08             	sub    $0x8,%esp
     64d:	50                   	push   %eax
     64e:	68 88 1b 00 00       	push   $0x1b88
     653:	e8 a8 06 00 00       	call   d00 <strchr>
     658:	83 c4 10             	add    $0x10,%esp
     65b:	85 c0                	test   %eax,%eax
     65d:	75 e1                	jne    640 <peek+0x20>
  *ps = s;
     65f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     661:	0f be 03             	movsbl (%ebx),%eax
     664:	31 d2                	xor    %edx,%edx
     666:	84 c0                	test   %al,%al
     668:	75 0e                	jne    678 <peek+0x58>
}
     66a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     66d:	89 d0                	mov    %edx,%eax
     66f:	5b                   	pop    %ebx
     670:	5e                   	pop    %esi
     671:	5f                   	pop    %edi
     672:	5d                   	pop    %ebp
     673:	c3                   	ret    
     674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     678:	83 ec 08             	sub    $0x8,%esp
     67b:	50                   	push   %eax
     67c:	ff 75 10             	push   0x10(%ebp)
     67f:	e8 7c 06 00 00       	call   d00 <strchr>
     684:	83 c4 10             	add    $0x10,%esp
     687:	31 d2                	xor    %edx,%edx
     689:	85 c0                	test   %eax,%eax
     68b:	0f 95 c2             	setne  %dl
}
     68e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     691:	5b                   	pop    %ebx
     692:	89 d0                	mov    %edx,%eax
     694:	5e                   	pop    %esi
     695:	5f                   	pop    %edi
     696:	5d                   	pop    %ebp
     697:	c3                   	ret    
     698:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     69f:	90                   	nop

000006a0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     6a0:	55                   	push   %ebp
     6a1:	89 e5                	mov    %esp,%ebp
     6a3:	57                   	push   %edi
     6a4:	56                   	push   %esi
     6a5:	53                   	push   %ebx
     6a6:	83 ec 2c             	sub    $0x2c,%esp
     6a9:	8b 75 0c             	mov    0xc(%ebp),%esi
     6ac:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     6af:	90                   	nop
     6b0:	83 ec 04             	sub    $0x4,%esp
     6b3:	68 45 14 00 00       	push   $0x1445
     6b8:	53                   	push   %ebx
     6b9:	56                   	push   %esi
     6ba:	e8 61 ff ff ff       	call   620 <peek>
     6bf:	83 c4 10             	add    $0x10,%esp
     6c2:	85 c0                	test   %eax,%eax
     6c4:	0f 84 f6 00 00 00    	je     7c0 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     6ca:	6a 00                	push   $0x0
     6cc:	6a 00                	push   $0x0
     6ce:	53                   	push   %ebx
     6cf:	56                   	push   %esi
     6d0:	e8 eb fd ff ff       	call   4c0 <gettoken>
     6d5:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     6d7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     6da:	50                   	push   %eax
     6db:	8d 45 e0             	lea    -0x20(%ebp),%eax
     6de:	50                   	push   %eax
     6df:	53                   	push   %ebx
     6e0:	56                   	push   %esi
     6e1:	e8 da fd ff ff       	call   4c0 <gettoken>
     6e6:	83 c4 20             	add    $0x20,%esp
     6e9:	83 f8 61             	cmp    $0x61,%eax
     6ec:	0f 85 d9 00 00 00    	jne    7cb <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     6f2:	83 ff 3c             	cmp    $0x3c,%edi
     6f5:	74 69                	je     760 <parseredirs+0xc0>
     6f7:	83 ff 3e             	cmp    $0x3e,%edi
     6fa:	74 05                	je     701 <parseredirs+0x61>
     6fc:	83 ff 2b             	cmp    $0x2b,%edi
     6ff:	75 af                	jne    6b0 <parseredirs+0x10>
  cmd = malloc(sizeof(*cmd));
     701:	83 ec 0c             	sub    $0xc,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     704:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     707:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     70a:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     70c:	89 55 d0             	mov    %edx,-0x30(%ebp)
     70f:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     712:	e8 79 0c 00 00       	call   1390 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     717:	83 c4 0c             	add    $0xc,%esp
     71a:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     71c:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     71e:	6a 00                	push   $0x0
     720:	50                   	push   %eax
     721:	e8 ba 05 00 00       	call   ce0 <memset>
  cmd->type = REDIR;
     726:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     72c:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     72f:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     732:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     735:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     738:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     73b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     73e:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     745:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     748:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     74f:	89 7d 08             	mov    %edi,0x8(%ebp)
     752:	e9 59 ff ff ff       	jmp    6b0 <parseredirs+0x10>
     757:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     75e:	66 90                	xchg   %ax,%ax
  cmd = malloc(sizeof(*cmd));
     760:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     763:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     766:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     769:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     76b:	89 55 d0             	mov    %edx,-0x30(%ebp)
     76e:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     771:	e8 1a 0c 00 00       	call   1390 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     776:	83 c4 0c             	add    $0xc,%esp
     779:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     77b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     77d:	6a 00                	push   $0x0
     77f:	50                   	push   %eax
     780:	e8 5b 05 00 00       	call   ce0 <memset>
  cmd->cmd = subcmd;
     785:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     788:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     78b:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     78e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     791:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     797:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     79a:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     79d:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     7a0:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     7a3:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     7aa:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     7b1:	e9 fa fe ff ff       	jmp    6b0 <parseredirs+0x10>
     7b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7bd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     7c0:	8b 45 08             	mov    0x8(%ebp),%eax
     7c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7c6:	5b                   	pop    %ebx
     7c7:	5e                   	pop    %esi
     7c8:	5f                   	pop    %edi
     7c9:	5d                   	pop    %ebp
     7ca:	c3                   	ret    
      panic("missing file for redirection");
     7cb:	83 ec 0c             	sub    $0xc,%esp
     7ce:	68 28 14 00 00       	push   $0x1428
     7d3:	e8 e8 f9 ff ff       	call   1c0 <panic>
     7d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7df:	90                   	nop

000007e0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     7e0:	55                   	push   %ebp
     7e1:	89 e5                	mov    %esp,%ebp
     7e3:	57                   	push   %edi
     7e4:	56                   	push   %esi
     7e5:	53                   	push   %ebx
     7e6:	83 ec 30             	sub    $0x30,%esp
     7e9:	8b 75 08             	mov    0x8(%ebp),%esi
     7ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     7ef:	68 48 14 00 00       	push   $0x1448
     7f4:	57                   	push   %edi
     7f5:	56                   	push   %esi
     7f6:	e8 25 fe ff ff       	call   620 <peek>
     7fb:	83 c4 10             	add    $0x10,%esp
     7fe:	85 c0                	test   %eax,%eax
     800:	0f 85 aa 00 00 00    	jne    8b0 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     806:	83 ec 0c             	sub    $0xc,%esp
     809:	89 c3                	mov    %eax,%ebx
     80b:	6a 54                	push   $0x54
     80d:	e8 7e 0b 00 00       	call   1390 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     812:	83 c4 0c             	add    $0xc,%esp
     815:	6a 54                	push   $0x54
     817:	6a 00                	push   $0x0
     819:	50                   	push   %eax
     81a:	89 45 d0             	mov    %eax,-0x30(%ebp)
     81d:	e8 be 04 00 00       	call   ce0 <memset>
  cmd->type = EXEC;
     822:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     825:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     828:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     82e:	57                   	push   %edi
     82f:	56                   	push   %esi
     830:	50                   	push   %eax
     831:	e8 6a fe ff ff       	call   6a0 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     836:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     839:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     83c:	eb 15                	jmp    853 <parseexec+0x73>
     83e:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     840:	83 ec 04             	sub    $0x4,%esp
     843:	57                   	push   %edi
     844:	56                   	push   %esi
     845:	ff 75 d4             	push   -0x2c(%ebp)
     848:	e8 53 fe ff ff       	call   6a0 <parseredirs>
     84d:	83 c4 10             	add    $0x10,%esp
     850:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     853:	83 ec 04             	sub    $0x4,%esp
     856:	68 5f 14 00 00       	push   $0x145f
     85b:	57                   	push   %edi
     85c:	56                   	push   %esi
     85d:	e8 be fd ff ff       	call   620 <peek>
     862:	83 c4 10             	add    $0x10,%esp
     865:	85 c0                	test   %eax,%eax
     867:	75 5f                	jne    8c8 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     869:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     86c:	50                   	push   %eax
     86d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     870:	50                   	push   %eax
     871:	57                   	push   %edi
     872:	56                   	push   %esi
     873:	e8 48 fc ff ff       	call   4c0 <gettoken>
     878:	83 c4 10             	add    $0x10,%esp
     87b:	85 c0                	test   %eax,%eax
     87d:	74 49                	je     8c8 <parseexec+0xe8>
    if(tok != 'a')
     87f:	83 f8 61             	cmp    $0x61,%eax
     882:	75 62                	jne    8e6 <parseexec+0x106>
    cmd->argv[argc] = q;
     884:	8b 45 e0             	mov    -0x20(%ebp),%eax
     887:	8b 55 d0             	mov    -0x30(%ebp),%edx
     88a:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     88e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     891:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     895:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     898:	83 fb 0a             	cmp    $0xa,%ebx
     89b:	75 a3                	jne    840 <parseexec+0x60>
      panic("too many args");
     89d:	83 ec 0c             	sub    $0xc,%esp
     8a0:	68 51 14 00 00       	push   $0x1451
     8a5:	e8 16 f9 ff ff       	call   1c0 <panic>
     8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     8b0:	89 7d 0c             	mov    %edi,0xc(%ebp)
     8b3:	89 75 08             	mov    %esi,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     8b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8b9:	5b                   	pop    %ebx
     8ba:	5e                   	pop    %esi
     8bb:	5f                   	pop    %edi
     8bc:	5d                   	pop    %ebp
    return parseblock(ps, es);
     8bd:	e9 ae 01 00 00       	jmp    a70 <parseblock>
     8c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     8c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     8cb:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
     8d2:	00 
  cmd->eargv[argc] = 0;
     8d3:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
     8da:	00 
}
     8db:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     8de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e1:	5b                   	pop    %ebx
     8e2:	5e                   	pop    %esi
     8e3:	5f                   	pop    %edi
     8e4:	5d                   	pop    %ebp
     8e5:	c3                   	ret    
      panic("syntax");
     8e6:	83 ec 0c             	sub    $0xc,%esp
     8e9:	68 4a 14 00 00       	push   $0x144a
     8ee:	e8 cd f8 ff ff       	call   1c0 <panic>
     8f3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000900 <parsepipe>:
{
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	57                   	push   %edi
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	83 ec 14             	sub    $0x14,%esp
     909:	8b 75 08             	mov    0x8(%ebp),%esi
     90c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     90f:	57                   	push   %edi
     910:	56                   	push   %esi
     911:	e8 ca fe ff ff       	call   7e0 <parseexec>
  if(peek(ps, es, "|")){
     916:	83 c4 0c             	add    $0xc,%esp
     919:	68 64 14 00 00       	push   $0x1464
  cmd = parseexec(ps, es);
     91e:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     920:	57                   	push   %edi
     921:	56                   	push   %esi
     922:	e8 f9 fc ff ff       	call   620 <peek>
     927:	83 c4 10             	add    $0x10,%esp
     92a:	85 c0                	test   %eax,%eax
     92c:	75 12                	jne    940 <parsepipe+0x40>
}
     92e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     931:	89 d8                	mov    %ebx,%eax
     933:	5b                   	pop    %ebx
     934:	5e                   	pop    %esi
     935:	5f                   	pop    %edi
     936:	5d                   	pop    %ebp
     937:	c3                   	ret    
     938:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     93f:	90                   	nop
    gettoken(ps, es, 0, 0);
     940:	6a 00                	push   $0x0
     942:	6a 00                	push   $0x0
     944:	57                   	push   %edi
     945:	56                   	push   %esi
     946:	e8 75 fb ff ff       	call   4c0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     94b:	58                   	pop    %eax
     94c:	5a                   	pop    %edx
     94d:	57                   	push   %edi
     94e:	56                   	push   %esi
     94f:	e8 ac ff ff ff       	call   900 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     954:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     95b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     95d:	e8 2e 0a 00 00       	call   1390 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     962:	83 c4 0c             	add    $0xc,%esp
     965:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     967:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     969:	6a 00                	push   $0x0
     96b:	50                   	push   %eax
     96c:	e8 6f 03 00 00       	call   ce0 <memset>
  cmd->left = left;
     971:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     974:	83 c4 10             	add    $0x10,%esp
     977:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     979:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     97f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     981:	89 7e 08             	mov    %edi,0x8(%esi)
}
     984:	8d 65 f4             	lea    -0xc(%ebp),%esp
     987:	5b                   	pop    %ebx
     988:	5e                   	pop    %esi
     989:	5f                   	pop    %edi
     98a:	5d                   	pop    %ebp
     98b:	c3                   	ret    
     98c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000990 <parseline>:
{
     990:	55                   	push   %ebp
     991:	89 e5                	mov    %esp,%ebp
     993:	57                   	push   %edi
     994:	56                   	push   %esi
     995:	53                   	push   %ebx
     996:	83 ec 24             	sub    $0x24,%esp
     999:	8b 75 08             	mov    0x8(%ebp),%esi
     99c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     99f:	57                   	push   %edi
     9a0:	56                   	push   %esi
     9a1:	e8 5a ff ff ff       	call   900 <parsepipe>
  while(peek(ps, es, "&")){
     9a6:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     9a9:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     9ab:	eb 3b                	jmp    9e8 <parseline+0x58>
     9ad:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     9b0:	6a 00                	push   $0x0
     9b2:	6a 00                	push   $0x0
     9b4:	57                   	push   %edi
     9b5:	56                   	push   %esi
     9b6:	e8 05 fb ff ff       	call   4c0 <gettoken>
  cmd = malloc(sizeof(*cmd));
     9bb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     9c2:	e8 c9 09 00 00       	call   1390 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9c7:	83 c4 0c             	add    $0xc,%esp
     9ca:	6a 08                	push   $0x8
     9cc:	6a 00                	push   $0x0
     9ce:	50                   	push   %eax
     9cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     9d2:	e8 09 03 00 00       	call   ce0 <memset>
  cmd->type = BACK;
     9d7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     9da:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     9dd:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     9e3:	89 5a 04             	mov    %ebx,0x4(%edx)
     9e6:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     9e8:	83 ec 04             	sub    $0x4,%esp
     9eb:	68 66 14 00 00       	push   $0x1466
     9f0:	57                   	push   %edi
     9f1:	56                   	push   %esi
     9f2:	e8 29 fc ff ff       	call   620 <peek>
     9f7:	83 c4 10             	add    $0x10,%esp
     9fa:	85 c0                	test   %eax,%eax
     9fc:	75 b2                	jne    9b0 <parseline+0x20>
  if(peek(ps, es, ";")){
     9fe:	83 ec 04             	sub    $0x4,%esp
     a01:	68 62 14 00 00       	push   $0x1462
     a06:	57                   	push   %edi
     a07:	56                   	push   %esi
     a08:	e8 13 fc ff ff       	call   620 <peek>
     a0d:	83 c4 10             	add    $0x10,%esp
     a10:	85 c0                	test   %eax,%eax
     a12:	75 0c                	jne    a20 <parseline+0x90>
}
     a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a17:	89 d8                	mov    %ebx,%eax
     a19:	5b                   	pop    %ebx
     a1a:	5e                   	pop    %esi
     a1b:	5f                   	pop    %edi
     a1c:	5d                   	pop    %ebp
     a1d:	c3                   	ret    
     a1e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     a20:	6a 00                	push   $0x0
     a22:	6a 00                	push   $0x0
     a24:	57                   	push   %edi
     a25:	56                   	push   %esi
     a26:	e8 95 fa ff ff       	call   4c0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     a2b:	58                   	pop    %eax
     a2c:	5a                   	pop    %edx
     a2d:	57                   	push   %edi
     a2e:	56                   	push   %esi
     a2f:	e8 5c ff ff ff       	call   990 <parseline>
  cmd = malloc(sizeof(*cmd));
     a34:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     a3b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     a3d:	e8 4e 09 00 00       	call   1390 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     a42:	83 c4 0c             	add    $0xc,%esp
     a45:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     a47:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     a49:	6a 00                	push   $0x0
     a4b:	50                   	push   %eax
     a4c:	e8 8f 02 00 00       	call   ce0 <memset>
  cmd->left = left;
     a51:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     a54:	83 c4 10             	add    $0x10,%esp
     a57:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     a59:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     a5f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     a61:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a64:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a67:	5b                   	pop    %ebx
     a68:	5e                   	pop    %esi
     a69:	5f                   	pop    %edi
     a6a:	5d                   	pop    %ebp
     a6b:	c3                   	ret    
     a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a70 <parseblock>:
{
     a70:	55                   	push   %ebp
     a71:	89 e5                	mov    %esp,%ebp
     a73:	57                   	push   %edi
     a74:	56                   	push   %esi
     a75:	53                   	push   %ebx
     a76:	83 ec 10             	sub    $0x10,%esp
     a79:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a7c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     a7f:	68 48 14 00 00       	push   $0x1448
     a84:	56                   	push   %esi
     a85:	53                   	push   %ebx
     a86:	e8 95 fb ff ff       	call   620 <peek>
     a8b:	83 c4 10             	add    $0x10,%esp
     a8e:	85 c0                	test   %eax,%eax
     a90:	74 4a                	je     adc <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     a92:	6a 00                	push   $0x0
     a94:	6a 00                	push   $0x0
     a96:	56                   	push   %esi
     a97:	53                   	push   %ebx
     a98:	e8 23 fa ff ff       	call   4c0 <gettoken>
  cmd = parseline(ps, es);
     a9d:	58                   	pop    %eax
     a9e:	5a                   	pop    %edx
     a9f:	56                   	push   %esi
     aa0:	53                   	push   %ebx
     aa1:	e8 ea fe ff ff       	call   990 <parseline>
  if(!peek(ps, es, ")"))
     aa6:	83 c4 0c             	add    $0xc,%esp
     aa9:	68 84 14 00 00       	push   $0x1484
  cmd = parseline(ps, es);
     aae:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     ab0:	56                   	push   %esi
     ab1:	53                   	push   %ebx
     ab2:	e8 69 fb ff ff       	call   620 <peek>
     ab7:	83 c4 10             	add    $0x10,%esp
     aba:	85 c0                	test   %eax,%eax
     abc:	74 2b                	je     ae9 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     abe:	6a 00                	push   $0x0
     ac0:	6a 00                	push   $0x0
     ac2:	56                   	push   %esi
     ac3:	53                   	push   %ebx
     ac4:	e8 f7 f9 ff ff       	call   4c0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     ac9:	83 c4 0c             	add    $0xc,%esp
     acc:	56                   	push   %esi
     acd:	53                   	push   %ebx
     ace:	57                   	push   %edi
     acf:	e8 cc fb ff ff       	call   6a0 <parseredirs>
}
     ad4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ad7:	5b                   	pop    %ebx
     ad8:	5e                   	pop    %esi
     ad9:	5f                   	pop    %edi
     ada:	5d                   	pop    %ebp
     adb:	c3                   	ret    
    panic("parseblock");
     adc:	83 ec 0c             	sub    $0xc,%esp
     adf:	68 68 14 00 00       	push   $0x1468
     ae4:	e8 d7 f6 ff ff       	call   1c0 <panic>
    panic("syntax - missing )");
     ae9:	83 ec 0c             	sub    $0xc,%esp
     aec:	68 73 14 00 00       	push   $0x1473
     af1:	e8 ca f6 ff ff       	call   1c0 <panic>
     af6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     afd:	8d 76 00             	lea    0x0(%esi),%esi

00000b00 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     b00:	55                   	push   %ebp
     b01:	89 e5                	mov    %esp,%ebp
     b03:	53                   	push   %ebx
     b04:	83 ec 04             	sub    $0x4,%esp
     b07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     b0a:	85 db                	test   %ebx,%ebx
     b0c:	0f 84 8e 00 00 00    	je     ba0 <nulterminate+0xa0>
    return 0;

  switch(cmd->type){
     b12:	83 3b 05             	cmpl   $0x5,(%ebx)
     b15:	77 61                	ja     b78 <nulterminate+0x78>
     b17:	8b 03                	mov    (%ebx),%eax
     b19:	ff 24 85 c4 14 00 00 	jmp    *0x14c4(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     b20:	83 ec 0c             	sub    $0xc,%esp
     b23:	ff 73 04             	push   0x4(%ebx)
     b26:	e8 d5 ff ff ff       	call   b00 <nulterminate>
    nulterminate(lcmd->right);
     b2b:	58                   	pop    %eax
     b2c:	ff 73 08             	push   0x8(%ebx)
     b2f:	e8 cc ff ff ff       	call   b00 <nulterminate>
    break;
     b34:	83 c4 10             	add    $0x10,%esp
     b37:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     b39:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b3c:	c9                   	leave  
     b3d:	c3                   	ret    
     b3e:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     b40:	83 ec 0c             	sub    $0xc,%esp
     b43:	ff 73 04             	push   0x4(%ebx)
     b46:	e8 b5 ff ff ff       	call   b00 <nulterminate>
    break;
     b4b:	89 d8                	mov    %ebx,%eax
     b4d:	83 c4 10             	add    $0x10,%esp
}
     b50:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b53:	c9                   	leave  
     b54:	c3                   	ret    
     b55:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     b58:	8b 4b 04             	mov    0x4(%ebx),%ecx
     b5b:	8d 43 08             	lea    0x8(%ebx),%eax
     b5e:	85 c9                	test   %ecx,%ecx
     b60:	74 16                	je     b78 <nulterminate+0x78>
     b62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     b68:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     b6b:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     b6e:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     b71:	8b 50 fc             	mov    -0x4(%eax),%edx
     b74:	85 d2                	test   %edx,%edx
     b76:	75 f0                	jne    b68 <nulterminate+0x68>
  switch(cmd->type){
     b78:	89 d8                	mov    %ebx,%eax
}
     b7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b7d:	c9                   	leave  
     b7e:	c3                   	ret    
     b7f:	90                   	nop
    nulterminate(rcmd->cmd);
     b80:	83 ec 0c             	sub    $0xc,%esp
     b83:	ff 73 04             	push   0x4(%ebx)
     b86:	e8 75 ff ff ff       	call   b00 <nulterminate>
    *rcmd->efile = 0;
     b8b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     b8e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     b91:	c6 00 00             	movb   $0x0,(%eax)
    break;
     b94:	89 d8                	mov    %ebx,%eax
}
     b96:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b99:	c9                   	leave  
     b9a:	c3                   	ret    
     b9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b9f:	90                   	nop
    return 0;
     ba0:	31 c0                	xor    %eax,%eax
     ba2:	eb 95                	jmp    b39 <nulterminate+0x39>
     ba4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     baf:	90                   	nop

00000bb0 <parsecmd>:
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	57                   	push   %edi
     bb4:	56                   	push   %esi
  cmd = parseline(&s, es);
     bb5:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     bb8:	53                   	push   %ebx
     bb9:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     bbc:	8b 5d 08             	mov    0x8(%ebp),%ebx
     bbf:	53                   	push   %ebx
     bc0:	e8 eb 00 00 00       	call   cb0 <strlen>
  cmd = parseline(&s, es);
     bc5:	59                   	pop    %ecx
     bc6:	5e                   	pop    %esi
  es = s + strlen(s);
     bc7:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     bc9:	53                   	push   %ebx
     bca:	57                   	push   %edi
     bcb:	e8 c0 fd ff ff       	call   990 <parseline>
  peek(&s, es, "");
     bd0:	83 c4 0c             	add    $0xc,%esp
     bd3:	68 12 14 00 00       	push   $0x1412
  cmd = parseline(&s, es);
     bd8:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     bda:	53                   	push   %ebx
     bdb:	57                   	push   %edi
     bdc:	e8 3f fa ff ff       	call   620 <peek>
  if(s != es){
     be1:	8b 45 08             	mov    0x8(%ebp),%eax
     be4:	83 c4 10             	add    $0x10,%esp
     be7:	39 d8                	cmp    %ebx,%eax
     be9:	75 13                	jne    bfe <parsecmd+0x4e>
  nulterminate(cmd);
     beb:	83 ec 0c             	sub    $0xc,%esp
     bee:	56                   	push   %esi
     bef:	e8 0c ff ff ff       	call   b00 <nulterminate>
}
     bf4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bf7:	89 f0                	mov    %esi,%eax
     bf9:	5b                   	pop    %ebx
     bfa:	5e                   	pop    %esi
     bfb:	5f                   	pop    %edi
     bfc:	5d                   	pop    %ebp
     bfd:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     bfe:	52                   	push   %edx
     bff:	50                   	push   %eax
     c00:	68 86 14 00 00       	push   $0x1486
     c05:	6a 02                	push   $0x2
     c07:	e8 e4 03 00 00       	call   ff0 <printf>
    panic("syntax");
     c0c:	c7 04 24 4a 14 00 00 	movl   $0x144a,(%esp)
     c13:	e8 a8 f5 ff ff       	call   1c0 <panic>
     c18:	66 90                	xchg   %ax,%ax
     c1a:	66 90                	xchg   %ax,%ax
     c1c:	66 90                	xchg   %ax,%ax
     c1e:	66 90                	xchg   %ax,%ax

00000c20 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     c20:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     c21:	31 c0                	xor    %eax,%eax
{
     c23:	89 e5                	mov    %esp,%ebp
     c25:	53                   	push   %ebx
     c26:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c29:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     c30:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     c34:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     c37:	83 c0 01             	add    $0x1,%eax
     c3a:	84 d2                	test   %dl,%dl
     c3c:	75 f2                	jne    c30 <strcpy+0x10>
    ;
  return os;
}
     c3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c41:	89 c8                	mov    %ecx,%eax
     c43:	c9                   	leave  
     c44:	c3                   	ret    
     c45:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c50 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c50:	55                   	push   %ebp
     c51:	89 e5                	mov    %esp,%ebp
     c53:	53                   	push   %ebx
     c54:	8b 55 08             	mov    0x8(%ebp),%edx
     c57:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     c5a:	0f b6 02             	movzbl (%edx),%eax
     c5d:	84 c0                	test   %al,%al
     c5f:	75 17                	jne    c78 <strcmp+0x28>
     c61:	eb 3a                	jmp    c9d <strcmp+0x4d>
     c63:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c67:	90                   	nop
     c68:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     c6c:	83 c2 01             	add    $0x1,%edx
     c6f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     c72:	84 c0                	test   %al,%al
     c74:	74 1a                	je     c90 <strcmp+0x40>
    p++, q++;
     c76:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     c78:	0f b6 19             	movzbl (%ecx),%ebx
     c7b:	38 c3                	cmp    %al,%bl
     c7d:	74 e9                	je     c68 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     c7f:	29 d8                	sub    %ebx,%eax
}
     c81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c84:	c9                   	leave  
     c85:	c3                   	ret    
     c86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c8d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     c90:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     c94:	31 c0                	xor    %eax,%eax
     c96:	29 d8                	sub    %ebx,%eax
}
     c98:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c9b:	c9                   	leave  
     c9c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
     c9d:	0f b6 19             	movzbl (%ecx),%ebx
     ca0:	31 c0                	xor    %eax,%eax
     ca2:	eb db                	jmp    c7f <strcmp+0x2f>
     ca4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     caf:	90                   	nop

00000cb0 <strlen>:

uint
strlen(const char *s)
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     cb6:	80 3a 00             	cmpb   $0x0,(%edx)
     cb9:	74 15                	je     cd0 <strlen+0x20>
     cbb:	31 c0                	xor    %eax,%eax
     cbd:	8d 76 00             	lea    0x0(%esi),%esi
     cc0:	83 c0 01             	add    $0x1,%eax
     cc3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     cc7:	89 c1                	mov    %eax,%ecx
     cc9:	75 f5                	jne    cc0 <strlen+0x10>
    ;
  return n;
}
     ccb:	89 c8                	mov    %ecx,%eax
     ccd:	5d                   	pop    %ebp
     cce:	c3                   	ret    
     ccf:	90                   	nop
  for(n = 0; s[n]; n++)
     cd0:	31 c9                	xor    %ecx,%ecx
}
     cd2:	5d                   	pop    %ebp
     cd3:	89 c8                	mov    %ecx,%eax
     cd5:	c3                   	ret    
     cd6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cdd:	8d 76 00             	lea    0x0(%esi),%esi

00000ce0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	57                   	push   %edi
     ce4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     ce7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     cea:	8b 45 0c             	mov    0xc(%ebp),%eax
     ced:	89 d7                	mov    %edx,%edi
     cef:	fc                   	cld    
     cf0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     cf2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     cf5:	89 d0                	mov    %edx,%eax
     cf7:	c9                   	leave  
     cf8:	c3                   	ret    
     cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d00 <strchr>:

char*
strchr(const char *s, char c)
{
     d00:	55                   	push   %ebp
     d01:	89 e5                	mov    %esp,%ebp
     d03:	8b 45 08             	mov    0x8(%ebp),%eax
     d06:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     d0a:	0f b6 10             	movzbl (%eax),%edx
     d0d:	84 d2                	test   %dl,%dl
     d0f:	75 12                	jne    d23 <strchr+0x23>
     d11:	eb 1d                	jmp    d30 <strchr+0x30>
     d13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d17:	90                   	nop
     d18:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     d1c:	83 c0 01             	add    $0x1,%eax
     d1f:	84 d2                	test   %dl,%dl
     d21:	74 0d                	je     d30 <strchr+0x30>
    if(*s == c)
     d23:	38 d1                	cmp    %dl,%cl
     d25:	75 f1                	jne    d18 <strchr+0x18>
      return (char*)s;
  return 0;
}
     d27:	5d                   	pop    %ebp
     d28:	c3                   	ret    
     d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     d30:	31 c0                	xor    %eax,%eax
}
     d32:	5d                   	pop    %ebp
     d33:	c3                   	ret    
     d34:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d3f:	90                   	nop

00000d40 <gets>:

char*
gets(char *buf, int max)
{
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	57                   	push   %edi
     d44:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     d45:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
     d48:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     d49:	31 db                	xor    %ebx,%ebx
{
     d4b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     d4e:	eb 27                	jmp    d77 <gets+0x37>
    cc = read(0, &c, 1);
     d50:	83 ec 04             	sub    $0x4,%esp
     d53:	6a 01                	push   $0x1
     d55:	57                   	push   %edi
     d56:	6a 00                	push   $0x0
     d58:	e8 2e 01 00 00       	call   e8b <read>
    if(cc < 1)
     d5d:	83 c4 10             	add    $0x10,%esp
     d60:	85 c0                	test   %eax,%eax
     d62:	7e 1d                	jle    d81 <gets+0x41>
      break;
    buf[i++] = c;
     d64:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     d68:	8b 55 08             	mov    0x8(%ebp),%edx
     d6b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     d6f:	3c 0a                	cmp    $0xa,%al
     d71:	74 1d                	je     d90 <gets+0x50>
     d73:	3c 0d                	cmp    $0xd,%al
     d75:	74 19                	je     d90 <gets+0x50>
  for(i=0; i+1 < max; ){
     d77:	89 de                	mov    %ebx,%esi
     d79:	83 c3 01             	add    $0x1,%ebx
     d7c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d7f:	7c cf                	jl     d50 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     d81:	8b 45 08             	mov    0x8(%ebp),%eax
     d84:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     d88:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d8b:	5b                   	pop    %ebx
     d8c:	5e                   	pop    %esi
     d8d:	5f                   	pop    %edi
     d8e:	5d                   	pop    %ebp
     d8f:	c3                   	ret    
  buf[i] = '\0';
     d90:	8b 45 08             	mov    0x8(%ebp),%eax
     d93:	89 de                	mov    %ebx,%esi
     d95:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
     d99:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d9c:	5b                   	pop    %ebx
     d9d:	5e                   	pop    %esi
     d9e:	5f                   	pop    %edi
     d9f:	5d                   	pop    %ebp
     da0:	c3                   	ret    
     da1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     da8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     daf:	90                   	nop

00000db0 <stat>:

int
stat(const char *n, struct stat *st)
{
     db0:	55                   	push   %ebp
     db1:	89 e5                	mov    %esp,%ebp
     db3:	56                   	push   %esi
     db4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     db5:	83 ec 08             	sub    $0x8,%esp
     db8:	6a 00                	push   $0x0
     dba:	ff 75 08             	push   0x8(%ebp)
     dbd:	e8 f1 00 00 00       	call   eb3 <open>
  if(fd < 0)
     dc2:	83 c4 10             	add    $0x10,%esp
     dc5:	85 c0                	test   %eax,%eax
     dc7:	78 27                	js     df0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     dc9:	83 ec 08             	sub    $0x8,%esp
     dcc:	ff 75 0c             	push   0xc(%ebp)
     dcf:	89 c3                	mov    %eax,%ebx
     dd1:	50                   	push   %eax
     dd2:	e8 f4 00 00 00       	call   ecb <fstat>
  close(fd);
     dd7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     dda:	89 c6                	mov    %eax,%esi
  close(fd);
     ddc:	e8 ba 00 00 00       	call   e9b <close>
  return r;
     de1:	83 c4 10             	add    $0x10,%esp
}
     de4:	8d 65 f8             	lea    -0x8(%ebp),%esp
     de7:	89 f0                	mov    %esi,%eax
     de9:	5b                   	pop    %ebx
     dea:	5e                   	pop    %esi
     deb:	5d                   	pop    %ebp
     dec:	c3                   	ret    
     ded:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     df0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     df5:	eb ed                	jmp    de4 <stat+0x34>
     df7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dfe:	66 90                	xchg   %ax,%ax

00000e00 <atoi>:

int
atoi(const char *s)
{
     e00:	55                   	push   %ebp
     e01:	89 e5                	mov    %esp,%ebp
     e03:	53                   	push   %ebx
     e04:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     e07:	0f be 02             	movsbl (%edx),%eax
     e0a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     e0d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     e10:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     e15:	77 1e                	ja     e35 <atoi+0x35>
     e17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e1e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     e20:	83 c2 01             	add    $0x1,%edx
     e23:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     e26:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     e2a:	0f be 02             	movsbl (%edx),%eax
     e2d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     e30:	80 fb 09             	cmp    $0x9,%bl
     e33:	76 eb                	jbe    e20 <atoi+0x20>
  return n;
}
     e35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e38:	89 c8                	mov    %ecx,%eax
     e3a:	c9                   	leave  
     e3b:	c3                   	ret    
     e3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e40 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	8b 45 10             	mov    0x10(%ebp),%eax
     e47:	8b 55 08             	mov    0x8(%ebp),%edx
     e4a:	56                   	push   %esi
     e4b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     e4e:	85 c0                	test   %eax,%eax
     e50:	7e 13                	jle    e65 <memmove+0x25>
     e52:	01 d0                	add    %edx,%eax
  dst = vdst;
     e54:	89 d7                	mov    %edx,%edi
     e56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e5d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     e60:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     e61:	39 f8                	cmp    %edi,%eax
     e63:	75 fb                	jne    e60 <memmove+0x20>
  return vdst;
}
     e65:	5e                   	pop    %esi
     e66:	89 d0                	mov    %edx,%eax
     e68:	5f                   	pop    %edi
     e69:	5d                   	pop    %ebp
     e6a:	c3                   	ret    

00000e6b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     e6b:	b8 01 00 00 00       	mov    $0x1,%eax
     e70:	cd 40                	int    $0x40
     e72:	c3                   	ret    

00000e73 <exit>:
SYSCALL(exit)
     e73:	b8 02 00 00 00       	mov    $0x2,%eax
     e78:	cd 40                	int    $0x40
     e7a:	c3                   	ret    

00000e7b <wait>:
SYSCALL(wait)
     e7b:	b8 03 00 00 00       	mov    $0x3,%eax
     e80:	cd 40                	int    $0x40
     e82:	c3                   	ret    

00000e83 <pipe>:
SYSCALL(pipe)
     e83:	b8 04 00 00 00       	mov    $0x4,%eax
     e88:	cd 40                	int    $0x40
     e8a:	c3                   	ret    

00000e8b <read>:
SYSCALL(read)
     e8b:	b8 05 00 00 00       	mov    $0x5,%eax
     e90:	cd 40                	int    $0x40
     e92:	c3                   	ret    

00000e93 <write>:
SYSCALL(write)
     e93:	b8 10 00 00 00       	mov    $0x10,%eax
     e98:	cd 40                	int    $0x40
     e9a:	c3                   	ret    

00000e9b <close>:
SYSCALL(close)
     e9b:	b8 15 00 00 00       	mov    $0x15,%eax
     ea0:	cd 40                	int    $0x40
     ea2:	c3                   	ret    

00000ea3 <kill>:
SYSCALL(kill)
     ea3:	b8 06 00 00 00       	mov    $0x6,%eax
     ea8:	cd 40                	int    $0x40
     eaa:	c3                   	ret    

00000eab <exec>:
SYSCALL(exec)
     eab:	b8 07 00 00 00       	mov    $0x7,%eax
     eb0:	cd 40                	int    $0x40
     eb2:	c3                   	ret    

00000eb3 <open>:
SYSCALL(open)
     eb3:	b8 0f 00 00 00       	mov    $0xf,%eax
     eb8:	cd 40                	int    $0x40
     eba:	c3                   	ret    

00000ebb <mknod>:
SYSCALL(mknod)
     ebb:	b8 11 00 00 00       	mov    $0x11,%eax
     ec0:	cd 40                	int    $0x40
     ec2:	c3                   	ret    

00000ec3 <unlink>:
SYSCALL(unlink)
     ec3:	b8 12 00 00 00       	mov    $0x12,%eax
     ec8:	cd 40                	int    $0x40
     eca:	c3                   	ret    

00000ecb <fstat>:
SYSCALL(fstat)
     ecb:	b8 08 00 00 00       	mov    $0x8,%eax
     ed0:	cd 40                	int    $0x40
     ed2:	c3                   	ret    

00000ed3 <link>:
SYSCALL(link)
     ed3:	b8 13 00 00 00       	mov    $0x13,%eax
     ed8:	cd 40                	int    $0x40
     eda:	c3                   	ret    

00000edb <mkdir>:
SYSCALL(mkdir)
     edb:	b8 14 00 00 00       	mov    $0x14,%eax
     ee0:	cd 40                	int    $0x40
     ee2:	c3                   	ret    

00000ee3 <chdir>:
SYSCALL(chdir)
     ee3:	b8 09 00 00 00       	mov    $0x9,%eax
     ee8:	cd 40                	int    $0x40
     eea:	c3                   	ret    

00000eeb <dup>:
SYSCALL(dup)
     eeb:	b8 0a 00 00 00       	mov    $0xa,%eax
     ef0:	cd 40                	int    $0x40
     ef2:	c3                   	ret    

00000ef3 <getpid>:
SYSCALL(getpid)
     ef3:	b8 0b 00 00 00       	mov    $0xb,%eax
     ef8:	cd 40                	int    $0x40
     efa:	c3                   	ret    

00000efb <sbrk>:
SYSCALL(sbrk)
     efb:	b8 0c 00 00 00       	mov    $0xc,%eax
     f00:	cd 40                	int    $0x40
     f02:	c3                   	ret    

00000f03 <sleep>:
SYSCALL(sleep)
     f03:	b8 0d 00 00 00       	mov    $0xd,%eax
     f08:	cd 40                	int    $0x40
     f0a:	c3                   	ret    

00000f0b <uptime>:
SYSCALL(uptime)
     f0b:	b8 0e 00 00 00       	mov    $0xe,%eax
     f10:	cd 40                	int    $0x40
     f12:	c3                   	ret    

00000f13 <printhugepde>:
SYSCALL(printhugepde)
     f13:	b8 16 00 00 00       	mov    $0x16,%eax
     f18:	cd 40                	int    $0x40
     f1a:	c3                   	ret    

00000f1b <procpgdirinfo>:
SYSCALL(procpgdirinfo)
     f1b:	b8 17 00 00 00       	mov    $0x17,%eax
     f20:	cd 40                	int    $0x40
     f22:	c3                   	ret    

00000f23 <setthp>:
SYSCALL(setthp)
     f23:	b8 18 00 00 00       	mov    $0x18,%eax
     f28:	cd 40                	int    $0x40
     f2a:	c3                   	ret    

00000f2b <getthp>:
     f2b:	b8 19 00 00 00       	mov    $0x19,%eax
     f30:	cd 40                	int    $0x40
     f32:	c3                   	ret    
     f33:	66 90                	xchg   %ax,%ax
     f35:	66 90                	xchg   %ax,%ax
     f37:	66 90                	xchg   %ax,%ax
     f39:	66 90                	xchg   %ax,%ax
     f3b:	66 90                	xchg   %ax,%ax
     f3d:	66 90                	xchg   %ax,%ax
     f3f:	90                   	nop

00000f40 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     f40:	55                   	push   %ebp
     f41:	89 e5                	mov    %esp,%ebp
     f43:	57                   	push   %edi
     f44:	56                   	push   %esi
     f45:	53                   	push   %ebx
     f46:	83 ec 3c             	sub    $0x3c,%esp
     f49:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     f4c:	89 d1                	mov    %edx,%ecx
{
     f4e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
     f51:	85 d2                	test   %edx,%edx
     f53:	0f 89 7f 00 00 00    	jns    fd8 <printint+0x98>
     f59:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     f5d:	74 79                	je     fd8 <printint+0x98>
    neg = 1;
     f5f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
     f66:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     f68:	31 db                	xor    %ebx,%ebx
     f6a:	8d 75 d7             	lea    -0x29(%ebp),%esi
     f6d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     f70:	89 c8                	mov    %ecx,%eax
     f72:	31 d2                	xor    %edx,%edx
     f74:	89 cf                	mov    %ecx,%edi
     f76:	f7 75 c4             	divl   -0x3c(%ebp)
     f79:	0f b6 92 3c 15 00 00 	movzbl 0x153c(%edx),%edx
     f80:	89 45 c0             	mov    %eax,-0x40(%ebp)
     f83:	89 d8                	mov    %ebx,%eax
     f85:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
     f88:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
     f8b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     f8e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
     f91:	76 dd                	jbe    f70 <printint+0x30>
  if(neg)
     f93:	8b 4d bc             	mov    -0x44(%ebp),%ecx
     f96:	85 c9                	test   %ecx,%ecx
     f98:	74 0c                	je     fa6 <printint+0x66>
    buf[i++] = '-';
     f9a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
     f9f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
     fa1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
     fa6:	8b 7d b8             	mov    -0x48(%ebp),%edi
     fa9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
     fad:	eb 07                	jmp    fb6 <printint+0x76>
     faf:	90                   	nop
    putc(fd, buf[i]);
     fb0:	0f b6 13             	movzbl (%ebx),%edx
     fb3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
     fb6:	83 ec 04             	sub    $0x4,%esp
     fb9:	88 55 d7             	mov    %dl,-0x29(%ebp)
     fbc:	6a 01                	push   $0x1
     fbe:	56                   	push   %esi
     fbf:	57                   	push   %edi
     fc0:	e8 ce fe ff ff       	call   e93 <write>
  while(--i >= 0)
     fc5:	83 c4 10             	add    $0x10,%esp
     fc8:	39 de                	cmp    %ebx,%esi
     fca:	75 e4                	jne    fb0 <printint+0x70>
}
     fcc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fcf:	5b                   	pop    %ebx
     fd0:	5e                   	pop    %esi
     fd1:	5f                   	pop    %edi
     fd2:	5d                   	pop    %ebp
     fd3:	c3                   	ret    
     fd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     fd8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
     fdf:	eb 87                	jmp    f68 <printint+0x28>
     fe1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fe8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fef:	90                   	nop

00000ff0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     ff0:	55                   	push   %ebp
     ff1:	89 e5                	mov    %esp,%ebp
     ff3:	57                   	push   %edi
     ff4:	56                   	push   %esi
     ff5:	53                   	push   %ebx
     ff6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     ff9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
     ffc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
     fff:	0f b6 13             	movzbl (%ebx),%edx
    1002:	84 d2                	test   %dl,%dl
    1004:	74 6a                	je     1070 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1006:	8d 45 10             	lea    0x10(%ebp),%eax
    1009:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    100c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    100f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1011:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1014:	eb 36                	jmp    104c <printf+0x5c>
    1016:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    101d:	8d 76 00             	lea    0x0(%esi),%esi
    1020:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1023:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1028:	83 f8 25             	cmp    $0x25,%eax
    102b:	74 15                	je     1042 <printf+0x52>
  write(fd, &c, 1);
    102d:	83 ec 04             	sub    $0x4,%esp
    1030:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1033:	6a 01                	push   $0x1
    1035:	57                   	push   %edi
    1036:	56                   	push   %esi
    1037:	e8 57 fe ff ff       	call   e93 <write>
    103c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    103f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1042:	0f b6 13             	movzbl (%ebx),%edx
    1045:	83 c3 01             	add    $0x1,%ebx
    1048:	84 d2                	test   %dl,%dl
    104a:	74 24                	je     1070 <printf+0x80>
    c = fmt[i] & 0xff;
    104c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    104f:	85 c9                	test   %ecx,%ecx
    1051:	74 cd                	je     1020 <printf+0x30>
      }
    } else if(state == '%'){
    1053:	83 f9 25             	cmp    $0x25,%ecx
    1056:	75 ea                	jne    1042 <printf+0x52>
      if(c == 'd'){
    1058:	83 f8 25             	cmp    $0x25,%eax
    105b:	0f 84 07 01 00 00    	je     1168 <printf+0x178>
    1061:	83 e8 63             	sub    $0x63,%eax
    1064:	83 f8 15             	cmp    $0x15,%eax
    1067:	77 17                	ja     1080 <printf+0x90>
    1069:	ff 24 85 e4 14 00 00 	jmp    *0x14e4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1070:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1073:	5b                   	pop    %ebx
    1074:	5e                   	pop    %esi
    1075:	5f                   	pop    %edi
    1076:	5d                   	pop    %ebp
    1077:	c3                   	ret    
    1078:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    107f:	90                   	nop
  write(fd, &c, 1);
    1080:	83 ec 04             	sub    $0x4,%esp
    1083:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    1086:	6a 01                	push   $0x1
    1088:	57                   	push   %edi
    1089:	56                   	push   %esi
    108a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    108e:	e8 00 fe ff ff       	call   e93 <write>
        putc(fd, c);
    1093:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    1097:	83 c4 0c             	add    $0xc,%esp
    109a:	88 55 e7             	mov    %dl,-0x19(%ebp)
    109d:	6a 01                	push   $0x1
    109f:	57                   	push   %edi
    10a0:	56                   	push   %esi
    10a1:	e8 ed fd ff ff       	call   e93 <write>
        putc(fd, c);
    10a6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    10a9:	31 c9                	xor    %ecx,%ecx
    10ab:	eb 95                	jmp    1042 <printf+0x52>
    10ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    10b0:	83 ec 0c             	sub    $0xc,%esp
    10b3:	b9 10 00 00 00       	mov    $0x10,%ecx
    10b8:	6a 00                	push   $0x0
    10ba:	8b 45 d0             	mov    -0x30(%ebp),%eax
    10bd:	8b 10                	mov    (%eax),%edx
    10bf:	89 f0                	mov    %esi,%eax
    10c1:	e8 7a fe ff ff       	call   f40 <printint>
        ap++;
    10c6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    10ca:	83 c4 10             	add    $0x10,%esp
      state = 0;
    10cd:	31 c9                	xor    %ecx,%ecx
    10cf:	e9 6e ff ff ff       	jmp    1042 <printf+0x52>
    10d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    10d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    10db:	8b 10                	mov    (%eax),%edx
        ap++;
    10dd:	83 c0 04             	add    $0x4,%eax
    10e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    10e3:	85 d2                	test   %edx,%edx
    10e5:	0f 84 8d 00 00 00    	je     1178 <printf+0x188>
        while(*s != 0){
    10eb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    10ee:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    10f0:	84 c0                	test   %al,%al
    10f2:	0f 84 4a ff ff ff    	je     1042 <printf+0x52>
    10f8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    10fb:	89 d3                	mov    %edx,%ebx
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1100:	83 ec 04             	sub    $0x4,%esp
          s++;
    1103:	83 c3 01             	add    $0x1,%ebx
    1106:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1109:	6a 01                	push   $0x1
    110b:	57                   	push   %edi
    110c:	56                   	push   %esi
    110d:	e8 81 fd ff ff       	call   e93 <write>
        while(*s != 0){
    1112:	0f b6 03             	movzbl (%ebx),%eax
    1115:	83 c4 10             	add    $0x10,%esp
    1118:	84 c0                	test   %al,%al
    111a:	75 e4                	jne    1100 <printf+0x110>
      state = 0;
    111c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    111f:	31 c9                	xor    %ecx,%ecx
    1121:	e9 1c ff ff ff       	jmp    1042 <printf+0x52>
    1126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    112d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1130:	83 ec 0c             	sub    $0xc,%esp
    1133:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1138:	6a 01                	push   $0x1
    113a:	e9 7b ff ff ff       	jmp    10ba <printf+0xca>
    113f:	90                   	nop
        putc(fd, *ap);
    1140:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1143:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1146:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1148:	6a 01                	push   $0x1
    114a:	57                   	push   %edi
    114b:	56                   	push   %esi
        putc(fd, *ap);
    114c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    114f:	e8 3f fd ff ff       	call   e93 <write>
        ap++;
    1154:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1158:	83 c4 10             	add    $0x10,%esp
      state = 0;
    115b:	31 c9                	xor    %ecx,%ecx
    115d:	e9 e0 fe ff ff       	jmp    1042 <printf+0x52>
    1162:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1168:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    116b:	83 ec 04             	sub    $0x4,%esp
    116e:	e9 2a ff ff ff       	jmp    109d <printf+0xad>
    1173:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1177:	90                   	nop
          s = "(null)";
    1178:	ba dc 14 00 00       	mov    $0x14dc,%edx
        while(*s != 0){
    117d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1180:	b8 28 00 00 00       	mov    $0x28,%eax
    1185:	89 d3                	mov    %edx,%ebx
    1187:	e9 74 ff ff ff       	jmp    1100 <printf+0x110>
    118c:	66 90                	xchg   %ax,%ax
    118e:	66 90                	xchg   %ax,%ax

00001190 <vfree>:
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	57                   	push   %edi
    1194:	56                   	push   %esi
    1195:	53                   	push   %ebx
    1196:	83 ec 04             	sub    $0x4,%esp
    1199:	8b 5d 08             	mov    0x8(%ebp),%ebx
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
    119c:	8b 45 0c             	mov    0xc(%ebp),%eax
    bp = ((Header*)ap) - 1;
    119f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    if (use_huge_pages) {
    11a2:	85 c0                	test   %eax,%eax
    11a4:	0f 84 96 00 00 00    	je     1240 <vfree+0xb0>
        freepptr = &huge_freep;
    11aa:	a1 04 1c 00 00       	mov    0x1c04,%eax
    11af:	bf 04 1c 00 00       	mov    $0x1c04,%edi
    11b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
    11b8:	89 c2                	mov    %eax,%edx
    11ba:	8b 00                	mov    (%eax),%eax
    11bc:	39 ca                	cmp    %ecx,%edx
    11be:	73 38                	jae    11f8 <vfree+0x68>
    11c0:	39 c1                	cmp    %eax,%ecx
    11c2:	72 04                	jb     11c8 <vfree+0x38>
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
    11c4:	39 c2                	cmp    %eax,%edx
    11c6:	72 f0                	jb     11b8 <vfree+0x28>
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
    11c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    11cb:	89 7d f0             	mov    %edi,-0x10(%ebp)
    11ce:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    11d1:	39 f8                	cmp    %edi,%eax
    11d3:	74 38                	je     120d <vfree+0x7d>
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
    11d5:	89 43 f8             	mov    %eax,-0x8(%ebx)
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
    11d8:	8b 42 04             	mov    0x4(%edx),%eax
    11db:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    11de:	39 f1                	cmp    %esi,%ecx
    11e0:	74 42                	je     1224 <vfree+0x94>
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
    11e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
    11e5:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
    11e7:	89 10                	mov    %edx,(%eax)
}
    11e9:	83 c4 04             	add    $0x4,%esp
    11ec:	5b                   	pop    %ebx
    11ed:	5e                   	pop    %esi
    11ee:	5f                   	pop    %edi
    11ef:	5d                   	pop    %ebp
    11f0:	c3                   	ret    
    11f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
    11f8:	39 c2                	cmp    %eax,%edx
    11fa:	72 bc                	jb     11b8 <vfree+0x28>
    11fc:	39 c1                	cmp    %eax,%ecx
    11fe:	73 b8                	jae    11b8 <vfree+0x28>
    if (bp + bp->s.size == p->s.ptr) {
    1200:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1203:	89 7d f0             	mov    %edi,-0x10(%ebp)
    1206:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1209:	39 f8                	cmp    %edi,%eax
    120b:	75 c8                	jne    11d5 <vfree+0x45>
        bp->s.size += p->s.ptr->s.size;
    120d:	03 70 04             	add    0x4(%eax),%esi
    1210:	89 73 fc             	mov    %esi,-0x4(%ebx)
        bp->s.ptr = p->s.ptr->s.ptr;
    1213:	8b 02                	mov    (%edx),%eax
    1215:	8b 00                	mov    (%eax),%eax
    1217:	89 43 f8             	mov    %eax,-0x8(%ebx)
    if (p + p->s.size == bp) {
    121a:	8b 42 04             	mov    0x4(%edx),%eax
    121d:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1220:	39 f1                	cmp    %esi,%ecx
    1222:	75 be                	jne    11e2 <vfree+0x52>
        p->s.size += bp->s.size;
    1224:	03 43 fc             	add    -0x4(%ebx),%eax
    1227:	89 42 04             	mov    %eax,0x4(%edx)
    *freepptr = p;
    122a:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
    122d:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1230:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
    1232:	89 10                	mov    %edx,(%eax)
}
    1234:	83 c4 04             	add    $0x4,%esp
    1237:	5b                   	pop    %ebx
    1238:	5e                   	pop    %esi
    1239:	5f                   	pop    %edi
    123a:	5d                   	pop    %ebp
    123b:	c3                   	ret    
    123c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        freepptr = &freep;
    1240:	a1 10 1c 00 00       	mov    0x1c10,%eax
    1245:	bf 10 1c 00 00       	mov    $0x1c10,%edi
    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
    124a:	e9 69 ff ff ff       	jmp    11b8 <vfree+0x28>
    124f:	90                   	nop

00001250 <vmalloc>:
void* vmalloc(uint nbytes, int use_huge_pages) {
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	57                   	push   %edi
    1254:	56                   	push   %esi
    1255:	53                   	push   %ebx
    1256:	83 ec 1c             	sub    $0x1c,%esp
    1259:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (use_huge_pages) {
    125c:	85 db                	test   %ebx,%ebx
    125e:	0f 84 0c 01 00 00    	je     1370 <vmalloc+0x120>
        if ((prevp = huge_freep) == 0) {
    1264:	8b 15 04 1c 00 00    	mov    0x1c04,%edx
    126a:	85 d2                	test   %edx,%edx
    126c:	0f 84 8e ed ff ff    	je     0 <vmalloc.cold>
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
    1272:	8b 45 08             	mov    0x8(%ebp),%eax
    1275:	8d 78 07             	lea    0x7(%eax),%edi
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
    1278:	8b 02                	mov    (%edx),%eax
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
    127a:	c1 ef 03             	shr    $0x3,%edi
        if (p->s.size >= nunits) {
    127d:	8b 48 04             	mov    0x4(%eax),%ecx
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
    1280:	83 c7 01             	add    $0x1,%edi
        if (p->s.size >= nunits) {
    1283:	39 f9                	cmp    %edi,%ecx
    1285:	0f 83 c5 00 00 00    	jae    1350 <vmalloc+0x100>
    128b:	be 00 10 00 00       	mov    $0x1000,%esi
    1290:	ba 00 00 40 00       	mov    $0x400000,%edx
    1295:	39 f7                	cmp    %esi,%edi
    1297:	0f 43 f7             	cmovae %edi,%esi
    129a:	39 d7                	cmp    %edx,%edi
    129c:	0f 43 d7             	cmovae %edi,%edx
  p = sbrk(nu * sizeof(Header));
    129f:	8d 0c f5 00 00 00 00 	lea    0x0(,%esi,8),%ecx
    12a6:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    12a9:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
    12b0:	89 55 dc             	mov    %edx,-0x24(%ebp)
    12b3:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    12b6:	eb 15                	jmp    12cd <vmalloc+0x7d>
    12b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12bf:	90                   	nop
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
    12c0:	8b 02                	mov    (%edx),%eax
        if (p->s.size >= nunits) {
    12c2:	8b 48 04             	mov    0x4(%eax),%ecx
    12c5:	39 f9                	cmp    %edi,%ecx
    12c7:	0f 83 83 00 00 00    	jae    1350 <vmalloc+0x100>
        if (p == freep) {
    12cd:	89 c2                	mov    %eax,%edx
    12cf:	39 05 10 1c 00 00    	cmp    %eax,0x1c10
    12d5:	75 e9                	jne    12c0 <vmalloc+0x70>
  if(use_huge_pages){
    12d7:	85 db                	test   %ebx,%ebx
    12d9:	74 45                	je     1320 <vmalloc+0xd0>
  p = sbrk(nu * sizeof(Header));
    12db:	83 ec 0c             	sub    $0xc,%esp
    12de:	ff 75 e0             	push   -0x20(%ebp)
    12e1:	e8 15 fc ff ff       	call   efb <sbrk>
  if(p == (char*)-1)
    12e6:	83 c4 10             	add    $0x10,%esp
    12e9:	83 f8 ff             	cmp    $0xffffffff,%eax
    12ec:	74 20                	je     130e <vmalloc+0xbe>
  hp->s.size = nu;
    12ee:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  vfree((void*)(hp + 1), use_huge_pages);
    12f1:	83 ec 08             	sub    $0x8,%esp
    12f4:	83 c0 08             	add    $0x8,%eax
  hp->s.size = nu;
    12f7:	89 48 fc             	mov    %ecx,-0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
    12fa:	53                   	push   %ebx
    12fb:	50                   	push   %eax
    12fc:	e8 8f fe ff ff       	call   1190 <vfree>
  return use_huge_pages ? huge_freep : freep;
    1301:	8b 15 04 1c 00 00    	mov    0x1c04,%edx
    1307:	83 c4 10             	add    $0x10,%esp
            if (p == 0) {
    130a:	85 d2                	test   %edx,%edx
    130c:	75 b2                	jne    12c0 <vmalloc+0x70>
}
    130e:	8d 65 f4             	lea    -0xc(%ebp),%esp
                return 0;
    1311:	31 c0                	xor    %eax,%eax
}
    1313:	5b                   	pop    %ebx
    1314:	5e                   	pop    %esi
    1315:	5f                   	pop    %edi
    1316:	5d                   	pop    %ebp
    1317:	c3                   	ret    
    1318:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    131f:	90                   	nop
  p = sbrk(nu * sizeof(Header));
    1320:	83 ec 0c             	sub    $0xc,%esp
    1323:	ff 75 e4             	push   -0x1c(%ebp)
    1326:	e8 d0 fb ff ff       	call   efb <sbrk>
  if(p == (char*)-1)
    132b:	83 c4 10             	add    $0x10,%esp
    132e:	83 f8 ff             	cmp    $0xffffffff,%eax
    1331:	74 db                	je     130e <vmalloc+0xbe>
  hp->s.size = nu;
    1333:	89 70 04             	mov    %esi,0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
    1336:	83 ec 08             	sub    $0x8,%esp
    1339:	83 c0 08             	add    $0x8,%eax
    133c:	6a 00                	push   $0x0
    133e:	50                   	push   %eax
    133f:	e8 4c fe ff ff       	call   1190 <vfree>
  return use_huge_pages ? huge_freep : freep;
    1344:	8b 15 10 1c 00 00    	mov    0x1c10,%edx
    134a:	83 c4 10             	add    $0x10,%esp
    134d:	eb bb                	jmp    130a <vmalloc+0xba>
    134f:	90                   	nop
            if (p->s.size == nunits) {
    1350:	39 cf                	cmp    %ecx,%edi
    1352:	74 34                	je     1388 <vmalloc+0x138>
                p->s.size -= nunits;
    1354:	29 f9                	sub    %edi,%ecx
    1356:	89 48 04             	mov    %ecx,0x4(%eax)
                p += p->s.size;
    1359:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
                p->s.size = nunits;
    135c:	89 78 04             	mov    %edi,0x4(%eax)
            freep = prevp;
    135f:	89 15 10 1c 00 00    	mov    %edx,0x1c10
}
    1365:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return (void*)(p + 1);
    1368:	83 c0 08             	add    $0x8,%eax
}
    136b:	5b                   	pop    %ebx
    136c:	5e                   	pop    %esi
    136d:	5f                   	pop    %edi
    136e:	5d                   	pop    %ebp
    136f:	c3                   	ret    
        if ((prevp = freep) == 0) {
    1370:	8b 15 10 1c 00 00    	mov    0x1c10,%edx
    1376:	85 d2                	test   %edx,%edx
    1378:	0f 85 f4 fe ff ff    	jne    1272 <vmalloc+0x22>
    137e:	e9 a2 ec ff ff       	jmp    25 <vmalloc.cold+0x25>
    1383:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1387:	90                   	nop
                prevp->s.ptr = p->s.ptr;
    1388:	8b 08                	mov    (%eax),%ecx
    138a:	89 0a                	mov    %ecx,(%edx)
    138c:	eb d1                	jmp    135f <vmalloc+0x10f>
    138e:	66 90                	xchg   %ax,%ax

00001390 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	53                   	push   %ebx
    1394:	83 ec 04             	sub    $0x4,%esp
    1397:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
    139a:	e8 8c fb ff ff       	call   f2b <getthp>


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
    139f:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
    13a5:	76 19                	jbe    13c0 <malloc+0x30>
    13a7:	85 c0                	test   %eax,%eax
    13a9:	74 15                	je     13c0 <malloc+0x30>
    return vmalloc(nbytes, 1); // use the huge pages
    13ab:	83 ec 08             	sub    $0x8,%esp
    13ae:	6a 01                	push   $0x1
    13b0:	53                   	push   %ebx
    13b1:	e8 9a fe ff ff       	call   1250 <vmalloc>
  }
  else{
    return vmalloc(nbytes, 0);
  }
}
    13b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 1); // use the huge pages
    13b9:	83 c4 10             	add    $0x10,%esp
}
    13bc:	c9                   	leave  
    13bd:	c3                   	ret    
    13be:	66 90                	xchg   %ax,%ax
    return vmalloc(nbytes, 0);
    13c0:	83 ec 08             	sub    $0x8,%esp
    13c3:	6a 00                	push   $0x0
    13c5:	53                   	push   %ebx
    13c6:	e8 85 fe ff ff       	call   1250 <vmalloc>
}
    13cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 0);
    13ce:	83 c4 10             	add    $0x10,%esp
}
    13d1:	c9                   	leave  
    13d2:	c3                   	ret    
    13d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013e0 <free>:

void free(void * ap){
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
  vfree(ap, 0);
    13e3:	6a 00                	push   $0x0
    13e5:	ff 75 08             	push   0x8(%ebp)
    13e8:	e8 a3 fd ff ff       	call   1190 <vfree>
}
    13ed:	58                   	pop    %eax
    13ee:	5a                   	pop    %edx
    13ef:	c9                   	leave  
    13f0:	c3                   	ret    
