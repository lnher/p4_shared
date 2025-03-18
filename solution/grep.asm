
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <vmalloc.cold>:

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
   0:	c7 05 40 14 00 00 44 	movl   $0x1444,0x1440
   7:	14 00 00 
   a:	c7 05 44 14 00 00 44 	movl   $0x1444,0x1444
  11:	14 00 00 
            huge_base.s.size = 0;
  14:	c7 05 48 14 00 00 00 	movl   $0x0,0x1448
  1b:	00 00 00 
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
  1e:	a1 00 00 00 00       	mov    0x0,%eax
  23:	0f 0b                	ud2    
            base.s.ptr = freep = &base;
  25:	c7 05 4c 14 00 00 50 	movl   $0x1450,0x144c
  2c:	14 00 00 
  2f:	c7 05 50 14 00 00 50 	movl   $0x1450,0x1450
  36:	14 00 00 
            base.s.size = 0;
  39:	c7 05 54 14 00 00 00 	movl   $0x0,0x1454
  40:	00 00 00 
  43:	eb d9                	jmp    1e <vmalloc.cold+0x1e>
  45:	66 90                	xchg   %ax,%ax
  47:	66 90                	xchg   %ax,%ax
  49:	66 90                	xchg   %ax,%ax
  4b:	66 90                	xchg   %ax,%ax
  4d:	66 90                	xchg   %ax,%ax
  4f:	90                   	nop

00000050 <main>:
  }
}

int
main(int argc, char *argv[])
{
  50:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  54:	83 e4 f0             	and    $0xfffffff0,%esp
  57:	ff 71 fc             	push   -0x4(%ecx)
  5a:	55                   	push   %ebp
  5b:	89 e5                	mov    %esp,%ebp
  5d:	57                   	push   %edi
  5e:	56                   	push   %esi
  5f:	53                   	push   %ebx
  60:	51                   	push   %ecx
  61:	83 ec 18             	sub    $0x18,%esp
  64:	8b 01                	mov    (%ecx),%eax
  66:	8b 59 04             	mov    0x4(%ecx),%ebx
  69:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  6c:	83 f8 01             	cmp    $0x1,%eax
  6f:	7e 6f                	jle    e0 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  71:	8b 43 04             	mov    0x4(%ebx),%eax
  74:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  77:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  7b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  80:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  83:	75 2d                	jne    b2 <main+0x62>
  85:	eb 6c                	jmp    f3 <main+0xa3>
  87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8e:	66 90                	xchg   %ax,%ax
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  90:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  93:	83 c6 01             	add    $0x1,%esi
  96:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  99:	50                   	push   %eax
  9a:	ff 75 e0             	push   -0x20(%ebp)
  9d:	e8 7e 01 00 00       	call   220 <grep>
    close(fd);
  a2:	89 3c 24             	mov    %edi,(%esp)
  a5:	e8 91 05 00 00       	call   63b <close>
  for(i = 2; i < argc; i++){
  aa:	83 c4 10             	add    $0x10,%esp
  ad:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  b0:	7e 29                	jle    db <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
  b2:	83 ec 08             	sub    $0x8,%esp
  b5:	6a 00                	push   $0x0
  b7:	ff 33                	push   (%ebx)
  b9:	e8 95 05 00 00       	call   653 <open>
  be:	83 c4 10             	add    $0x10,%esp
  c1:	89 c7                	mov    %eax,%edi
  c3:	85 c0                	test   %eax,%eax
  c5:	79 c9                	jns    90 <main+0x40>
      printf(1, "grep: cannot open %s\n", argv[i]);
  c7:	50                   	push   %eax
  c8:	ff 33                	push   (%ebx)
  ca:	68 b4 0b 00 00       	push   $0xbb4
  cf:	6a 01                	push   $0x1
  d1:	e8 ba 06 00 00       	call   790 <printf>
      exit();
  d6:	e8 38 05 00 00       	call   613 <exit>
  }
  exit();
  db:	e8 33 05 00 00       	call   613 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  e0:	51                   	push   %ecx
  e1:	51                   	push   %ecx
  e2:	68 94 0b 00 00       	push   $0xb94
  e7:	6a 02                	push   $0x2
  e9:	e8 a2 06 00 00       	call   790 <printf>
    exit();
  ee:	e8 20 05 00 00       	call   613 <exit>
    grep(pattern, 0);
  f3:	52                   	push   %edx
  f4:	52                   	push   %edx
  f5:	6a 00                	push   $0x0
  f7:	50                   	push   %eax
  f8:	e8 23 01 00 00       	call   220 <grep>
    exit();
  fd:	e8 11 05 00 00       	call   613 <exit>
 102:	66 90                	xchg   %ax,%ax
 104:	66 90                	xchg   %ax,%ax
 106:	66 90                	xchg   %ax,%ax
 108:	66 90                	xchg   %ax,%ax
 10a:	66 90                	xchg   %ax,%ax
 10c:	66 90                	xchg   %ax,%ax
 10e:	66 90                	xchg   %ax,%ax

00000110 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	56                   	push   %esi
 115:	53                   	push   %ebx
 116:	83 ec 0c             	sub    $0xc,%esp
 119:	8b 75 08             	mov    0x8(%ebp),%esi
 11c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
 11f:	0f b6 06             	movzbl (%esi),%eax
 122:	84 c0                	test   %al,%al
 124:	75 2d                	jne    153 <matchhere+0x43>
 126:	e9 7d 00 00 00       	jmp    1a8 <matchhere+0x98>
 12b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 12f:	90                   	nop
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
 130:	0f b6 0f             	movzbl (%edi),%ecx
  if(re[0] == '$' && re[1] == '\0')
 133:	80 fb 24             	cmp    $0x24,%bl
 136:	75 04                	jne    13c <matchhere+0x2c>
 138:	84 c0                	test   %al,%al
 13a:	74 79                	je     1b5 <matchhere+0xa5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 13c:	84 c9                	test   %cl,%cl
 13e:	74 58                	je     198 <matchhere+0x88>
 140:	38 d9                	cmp    %bl,%cl
 142:	74 05                	je     149 <matchhere+0x39>
 144:	80 fb 2e             	cmp    $0x2e,%bl
 147:	75 4f                	jne    198 <matchhere+0x88>
    return matchhere(re+1, text+1);
 149:	83 c7 01             	add    $0x1,%edi
 14c:	83 c6 01             	add    $0x1,%esi
  if(re[0] == '\0')
 14f:	84 c0                	test   %al,%al
 151:	74 55                	je     1a8 <matchhere+0x98>
  if(re[1] == '*')
 153:	0f be d8             	movsbl %al,%ebx
 156:	0f b6 46 01          	movzbl 0x1(%esi),%eax
 15a:	3c 2a                	cmp    $0x2a,%al
 15c:	75 d2                	jne    130 <matchhere+0x20>
    return matchstar(re[0], re+2, text);
 15e:	83 c6 02             	add    $0x2,%esi
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
 161:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 168:	83 ec 08             	sub    $0x8,%esp
 16b:	57                   	push   %edi
 16c:	56                   	push   %esi
 16d:	e8 9e ff ff ff       	call   110 <matchhere>
 172:	83 c4 10             	add    $0x10,%esp
 175:	85 c0                	test   %eax,%eax
 177:	75 2f                	jne    1a8 <matchhere+0x98>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
 179:	0f be 17             	movsbl (%edi),%edx
 17c:	84 d2                	test   %dl,%dl
 17e:	74 0c                	je     18c <matchhere+0x7c>
 180:	83 c7 01             	add    $0x1,%edi
 183:	83 fb 2e             	cmp    $0x2e,%ebx
 186:	74 e0                	je     168 <matchhere+0x58>
 188:	39 da                	cmp    %ebx,%edx
 18a:	74 dc                	je     168 <matchhere+0x58>
}
 18c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 18f:	5b                   	pop    %ebx
 190:	5e                   	pop    %esi
 191:	5f                   	pop    %edi
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    
 194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 198:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 19b:	31 c0                	xor    %eax,%eax
}
 19d:	5b                   	pop    %ebx
 19e:	5e                   	pop    %esi
 19f:	5f                   	pop    %edi
 1a0:	5d                   	pop    %ebp
 1a1:	c3                   	ret    
 1a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 1;
 1ab:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1b0:	5b                   	pop    %ebx
 1b1:	5e                   	pop    %esi
 1b2:	5f                   	pop    %edi
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    
    return *text == '\0';
 1b5:	31 c0                	xor    %eax,%eax
 1b7:	84 c9                	test   %cl,%cl
 1b9:	0f 94 c0             	sete   %al
 1bc:	eb ce                	jmp    18c <matchhere+0x7c>
 1be:	66 90                	xchg   %ax,%ax

000001c0 <match>:
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	53                   	push   %ebx
 1c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 1c8:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
 1cb:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 1ce:	75 11                	jne    1e1 <match+0x21>
 1d0:	eb 2e                	jmp    200 <match+0x40>
 1d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1d8:	83 c6 01             	add    $0x1,%esi
 1db:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 1df:	74 16                	je     1f7 <match+0x37>
    if(matchhere(re, text))
 1e1:	83 ec 08             	sub    $0x8,%esp
 1e4:	56                   	push   %esi
 1e5:	53                   	push   %ebx
 1e6:	e8 25 ff ff ff       	call   110 <matchhere>
 1eb:	83 c4 10             	add    $0x10,%esp
 1ee:	85 c0                	test   %eax,%eax
 1f0:	74 e6                	je     1d8 <match+0x18>
      return 1;
 1f2:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1fa:	5b                   	pop    %ebx
 1fb:	5e                   	pop    %esi
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    
 1fe:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 200:	83 c3 01             	add    $0x1,%ebx
 203:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 206:	8d 65 f8             	lea    -0x8(%ebp),%esp
 209:	5b                   	pop    %ebx
 20a:	5e                   	pop    %esi
 20b:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 20c:	e9 ff fe ff ff       	jmp    110 <matchhere>
 211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 218:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop

00000220 <grep>:
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
 225:	53                   	push   %ebx
 226:	83 ec 1c             	sub    $0x1c,%esp
 229:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 22c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    return matchhere(re+1, text);
 233:	8d 47 01             	lea    0x1(%edi),%eax
 236:	89 45 d8             	mov    %eax,-0x28(%ebp)
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 240:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 243:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 248:	83 ec 04             	sub    $0x4,%esp
 24b:	29 c8                	sub    %ecx,%eax
 24d:	50                   	push   %eax
 24e:	8d 81 40 10 00 00    	lea    0x1040(%ecx),%eax
 254:	50                   	push   %eax
 255:	ff 75 0c             	push   0xc(%ebp)
 258:	e8 ce 03 00 00       	call   62b <read>
 25d:	83 c4 10             	add    $0x10,%esp
 260:	85 c0                	test   %eax,%eax
 262:	0f 8e e5 00 00 00    	jle    34d <grep+0x12d>
    m += n;
 268:	01 45 dc             	add    %eax,-0x24(%ebp)
 26b:	8b 4d dc             	mov    -0x24(%ebp),%ecx
    p = buf;
 26e:	c7 45 e4 40 10 00 00 	movl   $0x1040,-0x1c(%ebp)
    buf[m] = '\0';
 275:	c6 81 40 10 00 00 00 	movb   $0x0,0x1040(%ecx)
    while((q = strchr(p, '\n')) != 0){
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 280:	83 ec 08             	sub    $0x8,%esp
 283:	6a 0a                	push   $0xa
 285:	ff 75 e4             	push   -0x1c(%ebp)
 288:	e8 13 02 00 00       	call   4a0 <strchr>
 28d:	83 c4 10             	add    $0x10,%esp
 290:	89 c3                	mov    %eax,%ebx
 292:	85 c0                	test   %eax,%eax
 294:	74 72                	je     308 <grep+0xe8>
      *q = 0;
 296:	c6 03 00             	movb   $0x0,(%ebx)
        write(1, p, q+1 - p);
 299:	8d 43 01             	lea    0x1(%ebx),%eax
  if(re[0] == '^')
 29c:	80 3f 5e             	cmpb   $0x5e,(%edi)
        write(1, p, q+1 - p);
 29f:	89 45 e0             	mov    %eax,-0x20(%ebp)
 2a2:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  if(re[0] == '^')
 2a5:	75 12                	jne    2b9 <grep+0x99>
 2a7:	eb 47                	jmp    2f0 <grep+0xd0>
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }while(*text++ != '\0');
 2b0:	83 c6 01             	add    $0x1,%esi
 2b3:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 2b7:	74 2b                	je     2e4 <grep+0xc4>
    if(matchhere(re, text))
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	56                   	push   %esi
 2bd:	57                   	push   %edi
 2be:	e8 4d fe ff ff       	call   110 <matchhere>
 2c3:	83 c4 10             	add    $0x10,%esp
 2c6:	85 c0                	test   %eax,%eax
 2c8:	74 e6                	je     2b0 <grep+0x90>
        write(1, p, q+1 - p);
 2ca:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2cd:	8b 45 e0             	mov    -0x20(%ebp),%eax
 2d0:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2d3:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 2d6:	29 d0                	sub    %edx,%eax
 2d8:	50                   	push   %eax
 2d9:	52                   	push   %edx
 2da:	6a 01                	push   $0x1
 2dc:	e8 52 03 00 00       	call   633 <write>
 2e1:	83 c4 10             	add    $0x10,%esp
      p = q+1;
 2e4:	8b 45 e0             	mov    -0x20(%ebp),%eax
 2e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2ea:	eb 94                	jmp    280 <grep+0x60>
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
 2f0:	83 ec 08             	sub    $0x8,%esp
 2f3:	56                   	push   %esi
 2f4:	ff 75 d8             	push   -0x28(%ebp)
 2f7:	e8 14 fe ff ff       	call   110 <matchhere>
 2fc:	83 c4 10             	add    $0x10,%esp
      if(match(pattern, p)){
 2ff:	85 c0                	test   %eax,%eax
 301:	74 e1                	je     2e4 <grep+0xc4>
 303:	eb c5                	jmp    2ca <grep+0xaa>
 305:	8d 76 00             	lea    0x0(%esi),%esi
    if(p == buf)
 308:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 30b:	81 fa 40 10 00 00    	cmp    $0x1040,%edx
 311:	74 2e                	je     341 <grep+0x121>
    if(m > 0){
 313:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 316:	85 c9                	test   %ecx,%ecx
 318:	0f 8e 22 ff ff ff    	jle    240 <grep+0x20>
      m -= p - buf;
 31e:	89 d0                	mov    %edx,%eax
      memmove(buf, p, m);
 320:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 323:	2d 40 10 00 00       	sub    $0x1040,%eax
 328:	29 c1                	sub    %eax,%ecx
      memmove(buf, p, m);
 32a:	51                   	push   %ecx
 32b:	52                   	push   %edx
 32c:	68 40 10 00 00       	push   $0x1040
      m -= p - buf;
 331:	89 4d dc             	mov    %ecx,-0x24(%ebp)
      memmove(buf, p, m);
 334:	e8 a7 02 00 00       	call   5e0 <memmove>
 339:	83 c4 10             	add    $0x10,%esp
 33c:	e9 ff fe ff ff       	jmp    240 <grep+0x20>
      m = 0;
 341:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 348:	e9 f3 fe ff ff       	jmp    240 <grep+0x20>
}
 34d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 350:	5b                   	pop    %ebx
 351:	5e                   	pop    %esi
 352:	5f                   	pop    %edi
 353:	5d                   	pop    %ebp
 354:	c3                   	ret    
 355:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <matchstar>:
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	83 ec 0c             	sub    $0xc,%esp
 369:	8b 5d 08             	mov    0x8(%ebp),%ebx
 36c:	8b 75 0c             	mov    0xc(%ebp),%esi
 36f:	8b 7d 10             	mov    0x10(%ebp),%edi
 372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(matchhere(re, text))
 378:	83 ec 08             	sub    $0x8,%esp
 37b:	57                   	push   %edi
 37c:	56                   	push   %esi
 37d:	e8 8e fd ff ff       	call   110 <matchhere>
 382:	83 c4 10             	add    $0x10,%esp
 385:	85 c0                	test   %eax,%eax
 387:	75 1f                	jne    3a8 <matchstar+0x48>
  }while(*text!='\0' && (*text++==c || c=='.'));
 389:	0f be 17             	movsbl (%edi),%edx
 38c:	84 d2                	test   %dl,%dl
 38e:	74 0c                	je     39c <matchstar+0x3c>
 390:	83 c7 01             	add    $0x1,%edi
 393:	39 da                	cmp    %ebx,%edx
 395:	74 e1                	je     378 <matchstar+0x18>
 397:	83 fb 2e             	cmp    $0x2e,%ebx
 39a:	74 dc                	je     378 <matchstar+0x18>
}
 39c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 39f:	5b                   	pop    %ebx
 3a0:	5e                   	pop    %esi
 3a1:	5f                   	pop    %edi
 3a2:	5d                   	pop    %ebp
 3a3:	c3                   	ret    
 3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
 3ab:	b8 01 00 00 00       	mov    $0x1,%eax
}
 3b0:	5b                   	pop    %ebx
 3b1:	5e                   	pop    %esi
 3b2:	5f                   	pop    %edi
 3b3:	5d                   	pop    %ebp
 3b4:	c3                   	ret    
 3b5:	66 90                	xchg   %ax,%ax
 3b7:	66 90                	xchg   %ax,%ax
 3b9:	66 90                	xchg   %ax,%ax
 3bb:	66 90                	xchg   %ax,%ax
 3bd:	66 90                	xchg   %ax,%ax
 3bf:	90                   	nop

000003c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 3c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3c1:	31 c0                	xor    %eax,%eax
{
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	53                   	push   %ebx
 3c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 3d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 3d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 3d7:	83 c0 01             	add    $0x1,%eax
 3da:	84 d2                	test   %dl,%dl
 3dc:	75 f2                	jne    3d0 <strcpy+0x10>
    ;
  return os;
}
 3de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e1:	89 c8                	mov    %ecx,%eax
 3e3:	c9                   	leave  
 3e4:	c3                   	ret    
 3e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	53                   	push   %ebx
 3f4:	8b 55 08             	mov    0x8(%ebp),%edx
 3f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3fa:	0f b6 02             	movzbl (%edx),%eax
 3fd:	84 c0                	test   %al,%al
 3ff:	75 17                	jne    418 <strcmp+0x28>
 401:	eb 3a                	jmp    43d <strcmp+0x4d>
 403:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 407:	90                   	nop
 408:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 40c:	83 c2 01             	add    $0x1,%edx
 40f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 412:	84 c0                	test   %al,%al
 414:	74 1a                	je     430 <strcmp+0x40>
    p++, q++;
 416:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 418:	0f b6 19             	movzbl (%ecx),%ebx
 41b:	38 c3                	cmp    %al,%bl
 41d:	74 e9                	je     408 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 41f:	29 d8                	sub    %ebx,%eax
}
 421:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 424:	c9                   	leave  
 425:	c3                   	ret    
 426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 430:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 434:	31 c0                	xor    %eax,%eax
 436:	29 d8                	sub    %ebx,%eax
}
 438:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 43b:	c9                   	leave  
 43c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 43d:	0f b6 19             	movzbl (%ecx),%ebx
 440:	31 c0                	xor    %eax,%eax
 442:	eb db                	jmp    41f <strcmp+0x2f>
 444:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop

00000450 <strlen>:

uint
strlen(const char *s)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 456:	80 3a 00             	cmpb   $0x0,(%edx)
 459:	74 15                	je     470 <strlen+0x20>
 45b:	31 c0                	xor    %eax,%eax
 45d:	8d 76 00             	lea    0x0(%esi),%esi
 460:	83 c0 01             	add    $0x1,%eax
 463:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 467:	89 c1                	mov    %eax,%ecx
 469:	75 f5                	jne    460 <strlen+0x10>
    ;
  return n;
}
 46b:	89 c8                	mov    %ecx,%eax
 46d:	5d                   	pop    %ebp
 46e:	c3                   	ret    
 46f:	90                   	nop
  for(n = 0; s[n]; n++)
 470:	31 c9                	xor    %ecx,%ecx
}
 472:	5d                   	pop    %ebp
 473:	89 c8                	mov    %ecx,%eax
 475:	c3                   	ret    
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi

00000480 <memset>:

void*
memset(void *dst, int c, uint n)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 487:	8b 4d 10             	mov    0x10(%ebp),%ecx
 48a:	8b 45 0c             	mov    0xc(%ebp),%eax
 48d:	89 d7                	mov    %edx,%edi
 48f:	fc                   	cld    
 490:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 492:	8b 7d fc             	mov    -0x4(%ebp),%edi
 495:	89 d0                	mov    %edx,%eax
 497:	c9                   	leave  
 498:	c3                   	ret    
 499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004a0 <strchr>:

char*
strchr(const char *s, char c)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
 4a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4aa:	0f b6 10             	movzbl (%eax),%edx
 4ad:	84 d2                	test   %dl,%dl
 4af:	75 12                	jne    4c3 <strchr+0x23>
 4b1:	eb 1d                	jmp    4d0 <strchr+0x30>
 4b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b7:	90                   	nop
 4b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 4bc:	83 c0 01             	add    $0x1,%eax
 4bf:	84 d2                	test   %dl,%dl
 4c1:	74 0d                	je     4d0 <strchr+0x30>
    if(*s == c)
 4c3:	38 d1                	cmp    %dl,%cl
 4c5:	75 f1                	jne    4b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 4c7:	5d                   	pop    %ebp
 4c8:	c3                   	ret    
 4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4d0:	31 c0                	xor    %eax,%eax
}
 4d2:	5d                   	pop    %ebp
 4d3:	c3                   	ret    
 4d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop

000004e0 <gets>:

char*
gets(char *buf, int max)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 4e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 4e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 4e9:	31 db                	xor    %ebx,%ebx
{
 4eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 4ee:	eb 27                	jmp    517 <gets+0x37>
    cc = read(0, &c, 1);
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	6a 01                	push   $0x1
 4f5:	57                   	push   %edi
 4f6:	6a 00                	push   $0x0
 4f8:	e8 2e 01 00 00       	call   62b <read>
    if(cc < 1)
 4fd:	83 c4 10             	add    $0x10,%esp
 500:	85 c0                	test   %eax,%eax
 502:	7e 1d                	jle    521 <gets+0x41>
      break;
    buf[i++] = c;
 504:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 508:	8b 55 08             	mov    0x8(%ebp),%edx
 50b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 50f:	3c 0a                	cmp    $0xa,%al
 511:	74 1d                	je     530 <gets+0x50>
 513:	3c 0d                	cmp    $0xd,%al
 515:	74 19                	je     530 <gets+0x50>
  for(i=0; i+1 < max; ){
 517:	89 de                	mov    %ebx,%esi
 519:	83 c3 01             	add    $0x1,%ebx
 51c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 51f:	7c cf                	jl     4f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 521:	8b 45 08             	mov    0x8(%ebp),%eax
 524:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 528:	8d 65 f4             	lea    -0xc(%ebp),%esp
 52b:	5b                   	pop    %ebx
 52c:	5e                   	pop    %esi
 52d:	5f                   	pop    %edi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    
  buf[i] = '\0';
 530:	8b 45 08             	mov    0x8(%ebp),%eax
 533:	89 de                	mov    %ebx,%esi
 535:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 539:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53c:	5b                   	pop    %ebx
 53d:	5e                   	pop    %esi
 53e:	5f                   	pop    %edi
 53f:	5d                   	pop    %ebp
 540:	c3                   	ret    
 541:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 548:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop

00000550 <stat>:

int
stat(const char *n, struct stat *st)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	56                   	push   %esi
 554:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 555:	83 ec 08             	sub    $0x8,%esp
 558:	6a 00                	push   $0x0
 55a:	ff 75 08             	push   0x8(%ebp)
 55d:	e8 f1 00 00 00       	call   653 <open>
  if(fd < 0)
 562:	83 c4 10             	add    $0x10,%esp
 565:	85 c0                	test   %eax,%eax
 567:	78 27                	js     590 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 569:	83 ec 08             	sub    $0x8,%esp
 56c:	ff 75 0c             	push   0xc(%ebp)
 56f:	89 c3                	mov    %eax,%ebx
 571:	50                   	push   %eax
 572:	e8 f4 00 00 00       	call   66b <fstat>
  close(fd);
 577:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 57a:	89 c6                	mov    %eax,%esi
  close(fd);
 57c:	e8 ba 00 00 00       	call   63b <close>
  return r;
 581:	83 c4 10             	add    $0x10,%esp
}
 584:	8d 65 f8             	lea    -0x8(%ebp),%esp
 587:	89 f0                	mov    %esi,%eax
 589:	5b                   	pop    %ebx
 58a:	5e                   	pop    %esi
 58b:	5d                   	pop    %ebp
 58c:	c3                   	ret    
 58d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 590:	be ff ff ff ff       	mov    $0xffffffff,%esi
 595:	eb ed                	jmp    584 <stat+0x34>
 597:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59e:	66 90                	xchg   %ax,%ax

000005a0 <atoi>:

int
atoi(const char *s)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	53                   	push   %ebx
 5a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5a7:	0f be 02             	movsbl (%edx),%eax
 5aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 5ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 5b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 5b5:	77 1e                	ja     5d5 <atoi+0x35>
 5b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5be:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 5c0:	83 c2 01             	add    $0x1,%edx
 5c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 5c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 5ca:	0f be 02             	movsbl (%edx),%eax
 5cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5d0:	80 fb 09             	cmp    $0x9,%bl
 5d3:	76 eb                	jbe    5c0 <atoi+0x20>
  return n;
}
 5d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5d8:	89 c8                	mov    %ecx,%eax
 5da:	c9                   	leave  
 5db:	c3                   	ret    
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	8b 45 10             	mov    0x10(%ebp),%eax
 5e7:	8b 55 08             	mov    0x8(%ebp),%edx
 5ea:	56                   	push   %esi
 5eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5ee:	85 c0                	test   %eax,%eax
 5f0:	7e 13                	jle    605 <memmove+0x25>
 5f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 5f4:	89 d7                	mov    %edx,%edi
 5f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 600:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 601:	39 f8                	cmp    %edi,%eax
 603:	75 fb                	jne    600 <memmove+0x20>
  return vdst;
}
 605:	5e                   	pop    %esi
 606:	89 d0                	mov    %edx,%eax
 608:	5f                   	pop    %edi
 609:	5d                   	pop    %ebp
 60a:	c3                   	ret    

0000060b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 60b:	b8 01 00 00 00       	mov    $0x1,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <exit>:
SYSCALL(exit)
 613:	b8 02 00 00 00       	mov    $0x2,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <wait>:
SYSCALL(wait)
 61b:	b8 03 00 00 00       	mov    $0x3,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <pipe>:
SYSCALL(pipe)
 623:	b8 04 00 00 00       	mov    $0x4,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <read>:
SYSCALL(read)
 62b:	b8 05 00 00 00       	mov    $0x5,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <write>:
SYSCALL(write)
 633:	b8 10 00 00 00       	mov    $0x10,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <close>:
SYSCALL(close)
 63b:	b8 15 00 00 00       	mov    $0x15,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <kill>:
SYSCALL(kill)
 643:	b8 06 00 00 00       	mov    $0x6,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <exec>:
SYSCALL(exec)
 64b:	b8 07 00 00 00       	mov    $0x7,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <open>:
SYSCALL(open)
 653:	b8 0f 00 00 00       	mov    $0xf,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <mknod>:
SYSCALL(mknod)
 65b:	b8 11 00 00 00       	mov    $0x11,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <unlink>:
SYSCALL(unlink)
 663:	b8 12 00 00 00       	mov    $0x12,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <fstat>:
SYSCALL(fstat)
 66b:	b8 08 00 00 00       	mov    $0x8,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <link>:
SYSCALL(link)
 673:	b8 13 00 00 00       	mov    $0x13,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <mkdir>:
SYSCALL(mkdir)
 67b:	b8 14 00 00 00       	mov    $0x14,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <chdir>:
SYSCALL(chdir)
 683:	b8 09 00 00 00       	mov    $0x9,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <dup>:
SYSCALL(dup)
 68b:	b8 0a 00 00 00       	mov    $0xa,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <getpid>:
SYSCALL(getpid)
 693:	b8 0b 00 00 00       	mov    $0xb,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <sbrk>:
SYSCALL(sbrk)
 69b:	b8 0c 00 00 00       	mov    $0xc,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <sleep>:
SYSCALL(sleep)
 6a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <uptime>:
SYSCALL(uptime)
 6ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <printhugepde>:
SYSCALL(printhugepde)
 6b3:	b8 16 00 00 00       	mov    $0x16,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 6bb:	b8 17 00 00 00       	mov    $0x17,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <setthp>:
SYSCALL(setthp)
 6c3:	b8 18 00 00 00       	mov    $0x18,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <getthp>:
 6cb:	b8 19 00 00 00       	mov    $0x19,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    
 6d3:	66 90                	xchg   %ax,%ax
 6d5:	66 90                	xchg   %ax,%ax
 6d7:	66 90                	xchg   %ax,%ax
 6d9:	66 90                	xchg   %ax,%ax
 6db:	66 90                	xchg   %ax,%ax
 6dd:	66 90                	xchg   %ax,%ax
 6df:	90                   	nop

000006e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 3c             	sub    $0x3c,%esp
 6e9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 6ec:	89 d1                	mov    %edx,%ecx
{
 6ee:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 6f1:	85 d2                	test   %edx,%edx
 6f3:	0f 89 7f 00 00 00    	jns    778 <printint+0x98>
 6f9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6fd:	74 79                	je     778 <printint+0x98>
    neg = 1;
 6ff:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 706:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 708:	31 db                	xor    %ebx,%ebx
 70a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 70d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 710:	89 c8                	mov    %ecx,%eax
 712:	31 d2                	xor    %edx,%edx
 714:	89 cf                	mov    %ecx,%edi
 716:	f7 75 c4             	divl   -0x3c(%ebp)
 719:	0f b6 92 2c 0c 00 00 	movzbl 0xc2c(%edx),%edx
 720:	89 45 c0             	mov    %eax,-0x40(%ebp)
 723:	89 d8                	mov    %ebx,%eax
 725:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 728:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 72b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 72e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 731:	76 dd                	jbe    710 <printint+0x30>
  if(neg)
 733:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 736:	85 c9                	test   %ecx,%ecx
 738:	74 0c                	je     746 <printint+0x66>
    buf[i++] = '-';
 73a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 73f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 741:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 746:	8b 7d b8             	mov    -0x48(%ebp),%edi
 749:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 74d:	eb 07                	jmp    756 <printint+0x76>
 74f:	90                   	nop
    putc(fd, buf[i]);
 750:	0f b6 13             	movzbl (%ebx),%edx
 753:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 756:	83 ec 04             	sub    $0x4,%esp
 759:	88 55 d7             	mov    %dl,-0x29(%ebp)
 75c:	6a 01                	push   $0x1
 75e:	56                   	push   %esi
 75f:	57                   	push   %edi
 760:	e8 ce fe ff ff       	call   633 <write>
  while(--i >= 0)
 765:	83 c4 10             	add    $0x10,%esp
 768:	39 de                	cmp    %ebx,%esi
 76a:	75 e4                	jne    750 <printint+0x70>
}
 76c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 76f:	5b                   	pop    %ebx
 770:	5e                   	pop    %esi
 771:	5f                   	pop    %edi
 772:	5d                   	pop    %ebp
 773:	c3                   	ret    
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 778:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 77f:	eb 87                	jmp    708 <printint+0x28>
 781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78f:	90                   	nop

00000790 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 799:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 79c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 79f:	0f b6 13             	movzbl (%ebx),%edx
 7a2:	84 d2                	test   %dl,%dl
 7a4:	74 6a                	je     810 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 7a6:	8d 45 10             	lea    0x10(%ebp),%eax
 7a9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 7ac:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 7af:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 7b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7b4:	eb 36                	jmp    7ec <printf+0x5c>
 7b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bd:	8d 76 00             	lea    0x0(%esi),%esi
 7c0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7c3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 7c8:	83 f8 25             	cmp    $0x25,%eax
 7cb:	74 15                	je     7e2 <printf+0x52>
  write(fd, &c, 1);
 7cd:	83 ec 04             	sub    $0x4,%esp
 7d0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7d3:	6a 01                	push   $0x1
 7d5:	57                   	push   %edi
 7d6:	56                   	push   %esi
 7d7:	e8 57 fe ff ff       	call   633 <write>
 7dc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 7df:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7e2:	0f b6 13             	movzbl (%ebx),%edx
 7e5:	83 c3 01             	add    $0x1,%ebx
 7e8:	84 d2                	test   %dl,%dl
 7ea:	74 24                	je     810 <printf+0x80>
    c = fmt[i] & 0xff;
 7ec:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 7ef:	85 c9                	test   %ecx,%ecx
 7f1:	74 cd                	je     7c0 <printf+0x30>
      }
    } else if(state == '%'){
 7f3:	83 f9 25             	cmp    $0x25,%ecx
 7f6:	75 ea                	jne    7e2 <printf+0x52>
      if(c == 'd'){
 7f8:	83 f8 25             	cmp    $0x25,%eax
 7fb:	0f 84 07 01 00 00    	je     908 <printf+0x178>
 801:	83 e8 63             	sub    $0x63,%eax
 804:	83 f8 15             	cmp    $0x15,%eax
 807:	77 17                	ja     820 <printf+0x90>
 809:	ff 24 85 d4 0b 00 00 	jmp    *0xbd4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 810:	8d 65 f4             	lea    -0xc(%ebp),%esp
 813:	5b                   	pop    %ebx
 814:	5e                   	pop    %esi
 815:	5f                   	pop    %edi
 816:	5d                   	pop    %ebp
 817:	c3                   	ret    
 818:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81f:	90                   	nop
  write(fd, &c, 1);
 820:	83 ec 04             	sub    $0x4,%esp
 823:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 826:	6a 01                	push   $0x1
 828:	57                   	push   %edi
 829:	56                   	push   %esi
 82a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 82e:	e8 00 fe ff ff       	call   633 <write>
        putc(fd, c);
 833:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 837:	83 c4 0c             	add    $0xc,%esp
 83a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 83d:	6a 01                	push   $0x1
 83f:	57                   	push   %edi
 840:	56                   	push   %esi
 841:	e8 ed fd ff ff       	call   633 <write>
        putc(fd, c);
 846:	83 c4 10             	add    $0x10,%esp
      state = 0;
 849:	31 c9                	xor    %ecx,%ecx
 84b:	eb 95                	jmp    7e2 <printf+0x52>
 84d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 850:	83 ec 0c             	sub    $0xc,%esp
 853:	b9 10 00 00 00       	mov    $0x10,%ecx
 858:	6a 00                	push   $0x0
 85a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 85d:	8b 10                	mov    (%eax),%edx
 85f:	89 f0                	mov    %esi,%eax
 861:	e8 7a fe ff ff       	call   6e0 <printint>
        ap++;
 866:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 86a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 86d:	31 c9                	xor    %ecx,%ecx
 86f:	e9 6e ff ff ff       	jmp    7e2 <printf+0x52>
 874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 878:	8b 45 d0             	mov    -0x30(%ebp),%eax
 87b:	8b 10                	mov    (%eax),%edx
        ap++;
 87d:	83 c0 04             	add    $0x4,%eax
 880:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 883:	85 d2                	test   %edx,%edx
 885:	0f 84 8d 00 00 00    	je     918 <printf+0x188>
        while(*s != 0){
 88b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 88e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 890:	84 c0                	test   %al,%al
 892:	0f 84 4a ff ff ff    	je     7e2 <printf+0x52>
 898:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 89b:	89 d3                	mov    %edx,%ebx
 89d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8a3:	83 c3 01             	add    $0x1,%ebx
 8a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8a9:	6a 01                	push   $0x1
 8ab:	57                   	push   %edi
 8ac:	56                   	push   %esi
 8ad:	e8 81 fd ff ff       	call   633 <write>
        while(*s != 0){
 8b2:	0f b6 03             	movzbl (%ebx),%eax
 8b5:	83 c4 10             	add    $0x10,%esp
 8b8:	84 c0                	test   %al,%al
 8ba:	75 e4                	jne    8a0 <printf+0x110>
      state = 0;
 8bc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 8bf:	31 c9                	xor    %ecx,%ecx
 8c1:	e9 1c ff ff ff       	jmp    7e2 <printf+0x52>
 8c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 8d0:	83 ec 0c             	sub    $0xc,%esp
 8d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8d8:	6a 01                	push   $0x1
 8da:	e9 7b ff ff ff       	jmp    85a <printf+0xca>
 8df:	90                   	nop
        putc(fd, *ap);
 8e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 8e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 8e6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 8e8:	6a 01                	push   $0x1
 8ea:	57                   	push   %edi
 8eb:	56                   	push   %esi
        putc(fd, *ap);
 8ec:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8ef:	e8 3f fd ff ff       	call   633 <write>
        ap++;
 8f4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 8f8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8fb:	31 c9                	xor    %ecx,%ecx
 8fd:	e9 e0 fe ff ff       	jmp    7e2 <printf+0x52>
 902:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 908:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 90b:	83 ec 04             	sub    $0x4,%esp
 90e:	e9 2a ff ff ff       	jmp    83d <printf+0xad>
 913:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 917:	90                   	nop
          s = "(null)";
 918:	ba ca 0b 00 00       	mov    $0xbca,%edx
        while(*s != 0){
 91d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 920:	b8 28 00 00 00       	mov    $0x28,%eax
 925:	89 d3                	mov    %edx,%ebx
 927:	e9 74 ff ff ff       	jmp    8a0 <printf+0x110>
 92c:	66 90                	xchg   %ax,%ax
 92e:	66 90                	xchg   %ax,%ax

00000930 <vfree>:
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	57                   	push   %edi
 934:	56                   	push   %esi
 935:	53                   	push   %ebx
 936:	83 ec 04             	sub    $0x4,%esp
 939:	8b 5d 08             	mov    0x8(%ebp),%ebx
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
 93c:	8b 45 0c             	mov    0xc(%ebp),%eax
    bp = ((Header*)ap) - 1;
 93f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    if (use_huge_pages) {
 942:	85 c0                	test   %eax,%eax
 944:	0f 84 96 00 00 00    	je     9e0 <vfree+0xb0>
        freepptr = &huge_freep;
 94a:	a1 40 14 00 00       	mov    0x1440,%eax
 94f:	bf 40 14 00 00       	mov    $0x1440,%edi
 954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 958:	89 c2                	mov    %eax,%edx
 95a:	8b 00                	mov    (%eax),%eax
 95c:	39 ca                	cmp    %ecx,%edx
 95e:	73 38                	jae    998 <vfree+0x68>
 960:	39 c1                	cmp    %eax,%ecx
 962:	72 04                	jb     968 <vfree+0x38>
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 964:	39 c2                	cmp    %eax,%edx
 966:	72 f0                	jb     958 <vfree+0x28>
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
 968:	8b 73 fc             	mov    -0x4(%ebx),%esi
 96b:	89 7d f0             	mov    %edi,-0x10(%ebp)
 96e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 971:	39 f8                	cmp    %edi,%eax
 973:	74 38                	je     9ad <vfree+0x7d>
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
 975:	89 43 f8             	mov    %eax,-0x8(%ebx)
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
 978:	8b 42 04             	mov    0x4(%edx),%eax
 97b:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 97e:	39 f1                	cmp    %esi,%ecx
 980:	74 42                	je     9c4 <vfree+0x94>
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
 982:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 985:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 987:	89 10                	mov    %edx,(%eax)
}
 989:	83 c4 04             	add    $0x4,%esp
 98c:	5b                   	pop    %ebx
 98d:	5e                   	pop    %esi
 98e:	5f                   	pop    %edi
 98f:	5d                   	pop    %ebp
 990:	c3                   	ret    
 991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 998:	39 c2                	cmp    %eax,%edx
 99a:	72 bc                	jb     958 <vfree+0x28>
 99c:	39 c1                	cmp    %eax,%ecx
 99e:	73 b8                	jae    958 <vfree+0x28>
    if (bp + bp->s.size == p->s.ptr) {
 9a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9a3:	89 7d f0             	mov    %edi,-0x10(%ebp)
 9a6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9a9:	39 f8                	cmp    %edi,%eax
 9ab:	75 c8                	jne    975 <vfree+0x45>
        bp->s.size += p->s.ptr->s.size;
 9ad:	03 70 04             	add    0x4(%eax),%esi
 9b0:	89 73 fc             	mov    %esi,-0x4(%ebx)
        bp->s.ptr = p->s.ptr->s.ptr;
 9b3:	8b 02                	mov    (%edx),%eax
 9b5:	8b 00                	mov    (%eax),%eax
 9b7:	89 43 f8             	mov    %eax,-0x8(%ebx)
    if (p + p->s.size == bp) {
 9ba:	8b 42 04             	mov    0x4(%edx),%eax
 9bd:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9c0:	39 f1                	cmp    %esi,%ecx
 9c2:	75 be                	jne    982 <vfree+0x52>
        p->s.size += bp->s.size;
 9c4:	03 43 fc             	add    -0x4(%ebx),%eax
 9c7:	89 42 04             	mov    %eax,0x4(%edx)
    *freepptr = p;
 9ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 9cd:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9d0:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 9d2:	89 10                	mov    %edx,(%eax)
}
 9d4:	83 c4 04             	add    $0x4,%esp
 9d7:	5b                   	pop    %ebx
 9d8:	5e                   	pop    %esi
 9d9:	5f                   	pop    %edi
 9da:	5d                   	pop    %ebp
 9db:	c3                   	ret    
 9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        freepptr = &freep;
 9e0:	a1 4c 14 00 00       	mov    0x144c,%eax
 9e5:	bf 4c 14 00 00       	mov    $0x144c,%edi
    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 9ea:	e9 69 ff ff ff       	jmp    958 <vfree+0x28>
 9ef:	90                   	nop

000009f0 <vmalloc>:
void* vmalloc(uint nbytes, int use_huge_pages) {
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	57                   	push   %edi
 9f4:	56                   	push   %esi
 9f5:	53                   	push   %ebx
 9f6:	83 ec 1c             	sub    $0x1c,%esp
 9f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (use_huge_pages) {
 9fc:	85 db                	test   %ebx,%ebx
 9fe:	0f 84 0c 01 00 00    	je     b10 <vmalloc+0x120>
        if ((prevp = huge_freep) == 0) {
 a04:	8b 15 40 14 00 00    	mov    0x1440,%edx
 a0a:	85 d2                	test   %edx,%edx
 a0c:	0f 84 ee f5 ff ff    	je     0 <vmalloc.cold>
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 a12:	8b 45 08             	mov    0x8(%ebp),%eax
 a15:	8d 78 07             	lea    0x7(%eax),%edi
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 a18:	8b 02                	mov    (%edx),%eax
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 a1a:	c1 ef 03             	shr    $0x3,%edi
        if (p->s.size >= nunits) {
 a1d:	8b 48 04             	mov    0x4(%eax),%ecx
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 a20:	83 c7 01             	add    $0x1,%edi
        if (p->s.size >= nunits) {
 a23:	39 f9                	cmp    %edi,%ecx
 a25:	0f 83 c5 00 00 00    	jae    af0 <vmalloc+0x100>
 a2b:	be 00 10 00 00       	mov    $0x1000,%esi
 a30:	ba 00 00 40 00       	mov    $0x400000,%edx
 a35:	39 f7                	cmp    %esi,%edi
 a37:	0f 43 f7             	cmovae %edi,%esi
 a3a:	39 d7                	cmp    %edx,%edi
 a3c:	0f 43 d7             	cmovae %edi,%edx
  p = sbrk(nu * sizeof(Header));
 a3f:	8d 0c f5 00 00 00 00 	lea    0x0(,%esi,8),%ecx
 a46:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 a49:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
 a50:	89 55 dc             	mov    %edx,-0x24(%ebp)
 a53:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 a56:	eb 15                	jmp    a6d <vmalloc+0x7d>
 a58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a5f:	90                   	nop
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 a60:	8b 02                	mov    (%edx),%eax
        if (p->s.size >= nunits) {
 a62:	8b 48 04             	mov    0x4(%eax),%ecx
 a65:	39 f9                	cmp    %edi,%ecx
 a67:	0f 83 83 00 00 00    	jae    af0 <vmalloc+0x100>
        if (p == freep) {
 a6d:	89 c2                	mov    %eax,%edx
 a6f:	39 05 4c 14 00 00    	cmp    %eax,0x144c
 a75:	75 e9                	jne    a60 <vmalloc+0x70>
  if(use_huge_pages){
 a77:	85 db                	test   %ebx,%ebx
 a79:	74 45                	je     ac0 <vmalloc+0xd0>
  p = sbrk(nu * sizeof(Header));
 a7b:	83 ec 0c             	sub    $0xc,%esp
 a7e:	ff 75 e0             	push   -0x20(%ebp)
 a81:	e8 15 fc ff ff       	call   69b <sbrk>
  if(p == (char*)-1)
 a86:	83 c4 10             	add    $0x10,%esp
 a89:	83 f8 ff             	cmp    $0xffffffff,%eax
 a8c:	74 20                	je     aae <vmalloc+0xbe>
  hp->s.size = nu;
 a8e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  vfree((void*)(hp + 1), use_huge_pages);
 a91:	83 ec 08             	sub    $0x8,%esp
 a94:	83 c0 08             	add    $0x8,%eax
  hp->s.size = nu;
 a97:	89 48 fc             	mov    %ecx,-0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 a9a:	53                   	push   %ebx
 a9b:	50                   	push   %eax
 a9c:	e8 8f fe ff ff       	call   930 <vfree>
  return use_huge_pages ? huge_freep : freep;
 aa1:	8b 15 40 14 00 00    	mov    0x1440,%edx
 aa7:	83 c4 10             	add    $0x10,%esp
            if (p == 0) {
 aaa:	85 d2                	test   %edx,%edx
 aac:	75 b2                	jne    a60 <vmalloc+0x70>
}
 aae:	8d 65 f4             	lea    -0xc(%ebp),%esp
                return 0;
 ab1:	31 c0                	xor    %eax,%eax
}
 ab3:	5b                   	pop    %ebx
 ab4:	5e                   	pop    %esi
 ab5:	5f                   	pop    %edi
 ab6:	5d                   	pop    %ebp
 ab7:	c3                   	ret    
 ab8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 abf:	90                   	nop
  p = sbrk(nu * sizeof(Header));
 ac0:	83 ec 0c             	sub    $0xc,%esp
 ac3:	ff 75 e4             	push   -0x1c(%ebp)
 ac6:	e8 d0 fb ff ff       	call   69b <sbrk>
  if(p == (char*)-1)
 acb:	83 c4 10             	add    $0x10,%esp
 ace:	83 f8 ff             	cmp    $0xffffffff,%eax
 ad1:	74 db                	je     aae <vmalloc+0xbe>
  hp->s.size = nu;
 ad3:	89 70 04             	mov    %esi,0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 ad6:	83 ec 08             	sub    $0x8,%esp
 ad9:	83 c0 08             	add    $0x8,%eax
 adc:	6a 00                	push   $0x0
 ade:	50                   	push   %eax
 adf:	e8 4c fe ff ff       	call   930 <vfree>
  return use_huge_pages ? huge_freep : freep;
 ae4:	8b 15 4c 14 00 00    	mov    0x144c,%edx
 aea:	83 c4 10             	add    $0x10,%esp
 aed:	eb bb                	jmp    aaa <vmalloc+0xba>
 aef:	90                   	nop
            if (p->s.size == nunits) {
 af0:	39 cf                	cmp    %ecx,%edi
 af2:	74 34                	je     b28 <vmalloc+0x138>
                p->s.size -= nunits;
 af4:	29 f9                	sub    %edi,%ecx
 af6:	89 48 04             	mov    %ecx,0x4(%eax)
                p += p->s.size;
 af9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
                p->s.size = nunits;
 afc:	89 78 04             	mov    %edi,0x4(%eax)
            freep = prevp;
 aff:	89 15 4c 14 00 00    	mov    %edx,0x144c
}
 b05:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return (void*)(p + 1);
 b08:	83 c0 08             	add    $0x8,%eax
}
 b0b:	5b                   	pop    %ebx
 b0c:	5e                   	pop    %esi
 b0d:	5f                   	pop    %edi
 b0e:	5d                   	pop    %ebp
 b0f:	c3                   	ret    
        if ((prevp = freep) == 0) {
 b10:	8b 15 4c 14 00 00    	mov    0x144c,%edx
 b16:	85 d2                	test   %edx,%edx
 b18:	0f 85 f4 fe ff ff    	jne    a12 <vmalloc+0x22>
 b1e:	e9 02 f5 ff ff       	jmp    25 <vmalloc.cold+0x25>
 b23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b27:	90                   	nop
                prevp->s.ptr = p->s.ptr;
 b28:	8b 08                	mov    (%eax),%ecx
 b2a:	89 0a                	mov    %ecx,(%edx)
 b2c:	eb d1                	jmp    aff <vmalloc+0x10f>
 b2e:	66 90                	xchg   %ax,%ax

00000b30 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	53                   	push   %ebx
 b34:	83 ec 04             	sub    $0x4,%esp
 b37:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 b3a:	e8 8c fb ff ff       	call   6cb <getthp>


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
 b3f:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 b45:	76 19                	jbe    b60 <malloc+0x30>
 b47:	85 c0                	test   %eax,%eax
 b49:	74 15                	je     b60 <malloc+0x30>
    return vmalloc(nbytes, 1); // use the huge pages
 b4b:	83 ec 08             	sub    $0x8,%esp
 b4e:	6a 01                	push   $0x1
 b50:	53                   	push   %ebx
 b51:	e8 9a fe ff ff       	call   9f0 <vmalloc>
  }
  else{
    return vmalloc(nbytes, 0);
  }
}
 b56:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 1); // use the huge pages
 b59:	83 c4 10             	add    $0x10,%esp
}
 b5c:	c9                   	leave  
 b5d:	c3                   	ret    
 b5e:	66 90                	xchg   %ax,%ax
    return vmalloc(nbytes, 0);
 b60:	83 ec 08             	sub    $0x8,%esp
 b63:	6a 00                	push   $0x0
 b65:	53                   	push   %ebx
 b66:	e8 85 fe ff ff       	call   9f0 <vmalloc>
}
 b6b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 0);
 b6e:	83 c4 10             	add    $0x10,%esp
}
 b71:	c9                   	leave  
 b72:	c3                   	ret    
 b73:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b80 <free>:

void free(void * ap){
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
  vfree(ap, 0);
 b83:	6a 00                	push   $0x0
 b85:	ff 75 08             	push   0x8(%ebp)
 b88:	e8 a3 fd ff ff       	call   930 <vfree>
}
 b8d:	58                   	pop    %eax
 b8e:	5a                   	pop    %edx
 b8f:	c9                   	leave  
 b90:	c3                   	ret    
