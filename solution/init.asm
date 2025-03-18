
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <vmalloc.cold>:

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
   0:	c7 05 e8 0c 00 00 ec 	movl   $0xcec,0xce8
   7:	0c 00 00 
   a:	c7 05 ec 0c 00 00 ec 	movl   $0xcec,0xcec
  11:	0c 00 00 
            huge_base.s.size = 0;
  14:	c7 05 f0 0c 00 00 00 	movl   $0x0,0xcf0
  1b:	00 00 00 
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
  1e:	a1 00 00 00 00       	mov    0x0,%eax
  23:	0f 0b                	ud2    
            base.s.ptr = freep = &base;
  25:	c7 05 f4 0c 00 00 f8 	movl   $0xcf8,0xcf4
  2c:	0c 00 00 
  2f:	c7 05 f8 0c 00 00 f8 	movl   $0xcf8,0xcf8
  36:	0c 00 00 
            base.s.size = 0;
  39:	c7 05 fc 0c 00 00 00 	movl   $0x0,0xcfc
  40:	00 00 00 
  43:	eb d9                	jmp    1e <vmalloc.cold+0x1e>
  45:	66 90                	xchg   %ax,%ax
  47:	66 90                	xchg   %ax,%ax
  49:	66 90                	xchg   %ax,%ax
  4b:	66 90                	xchg   %ax,%ax
  4d:	66 90                	xchg   %ax,%ax
  4f:	90                   	nop

00000050 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
  50:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  54:	83 e4 f0             	and    $0xfffffff0,%esp
  57:	ff 71 fc             	push   -0x4(%ecx)
  5a:	55                   	push   %ebp
  5b:	89 e5                	mov    %esp,%ebp
  5d:	53                   	push   %ebx
  5e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  5f:	83 ec 08             	sub    $0x8,%esp
  62:	6a 02                	push   $0x2
  64:	68 14 09 00 00       	push   $0x914
  69:	e8 65 03 00 00       	call   3d3 <open>
  6e:	83 c4 10             	add    $0x10,%esp
  71:	85 c0                	test   %eax,%eax
  73:	0f 88 9f 00 00 00    	js     118 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  79:	83 ec 0c             	sub    $0xc,%esp
  7c:	6a 00                	push   $0x0
  7e:	e8 88 03 00 00       	call   40b <dup>
  dup(0);  // stderr
  83:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  8a:	e8 7c 03 00 00       	call   40b <dup>
  8f:	83 c4 10             	add    $0x10,%esp
  92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 1c 09 00 00       	push   $0x91c
  a0:	6a 01                	push   $0x1
  a2:	e8 69 04 00 00       	call   510 <printf>
    pid = fork();
  a7:	e8 df 02 00 00       	call   38b <fork>
    if(pid < 0){
  ac:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  af:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  b1:	85 c0                	test   %eax,%eax
  b3:	78 2c                	js     e1 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  b5:	74 3d                	je     f4 <main+0xa4>
  b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  be:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  c0:	e8 d6 02 00 00       	call   39b <wait>
  c5:	85 c0                	test   %eax,%eax
  c7:	78 cf                	js     98 <main+0x48>
  c9:	39 c3                	cmp    %eax,%ebx
  cb:	74 cb                	je     98 <main+0x48>
      printf(1, "zombie!\n");
  cd:	83 ec 08             	sub    $0x8,%esp
  d0:	68 5b 09 00 00       	push   $0x95b
  d5:	6a 01                	push   $0x1
  d7:	e8 34 04 00 00       	call   510 <printf>
  dc:	83 c4 10             	add    $0x10,%esp
  df:	eb df                	jmp    c0 <main+0x70>
      printf(1, "init: fork failed\n");
  e1:	53                   	push   %ebx
  e2:	53                   	push   %ebx
  e3:	68 2f 09 00 00       	push   $0x92f
  e8:	6a 01                	push   $0x1
  ea:	e8 21 04 00 00       	call   510 <printf>
      exit();
  ef:	e8 9f 02 00 00       	call   393 <exit>
      exec("sh", argv);
  f4:	50                   	push   %eax
  f5:	50                   	push   %eax
  f6:	68 e0 0c 00 00       	push   $0xce0
  fb:	68 42 09 00 00       	push   $0x942
 100:	e8 c6 02 00 00       	call   3cb <exec>
      printf(1, "init: exec sh failed\n");
 105:	5a                   	pop    %edx
 106:	59                   	pop    %ecx
 107:	68 45 09 00 00       	push   $0x945
 10c:	6a 01                	push   $0x1
 10e:	e8 fd 03 00 00       	call   510 <printf>
      exit();
 113:	e8 7b 02 00 00       	call   393 <exit>
    mknod("console", 1, 1);
 118:	50                   	push   %eax
 119:	6a 01                	push   $0x1
 11b:	6a 01                	push   $0x1
 11d:	68 14 09 00 00       	push   $0x914
 122:	e8 b4 02 00 00       	call   3db <mknod>
    open("console", O_RDWR);
 127:	58                   	pop    %eax
 128:	5a                   	pop    %edx
 129:	6a 02                	push   $0x2
 12b:	68 14 09 00 00       	push   $0x914
 130:	e8 9e 02 00 00       	call   3d3 <open>
 135:	83 c4 10             	add    $0x10,%esp
 138:	e9 3c ff ff ff       	jmp    79 <main+0x29>
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 141:	31 c0                	xor    %eax,%eax
{
 143:	89 e5                	mov    %esp,%ebp
 145:	53                   	push   %ebx
 146:	8b 4d 08             	mov    0x8(%ebp),%ecx
 149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 157:	83 c0 01             	add    $0x1,%eax
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 161:	89 c8                	mov    %ecx,%eax
 163:	c9                   	leave  
 164:	c3                   	ret    
 165:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 55 08             	mov    0x8(%ebp),%edx
 177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 17a:	0f b6 02             	movzbl (%edx),%eax
 17d:	84 c0                	test   %al,%al
 17f:	75 17                	jne    198 <strcmp+0x28>
 181:	eb 3a                	jmp    1bd <strcmp+0x4d>
 183:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 187:	90                   	nop
 188:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 18c:	83 c2 01             	add    $0x1,%edx
 18f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 192:	84 c0                	test   %al,%al
 194:	74 1a                	je     1b0 <strcmp+0x40>
    p++, q++;
 196:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 198:	0f b6 19             	movzbl (%ecx),%ebx
 19b:	38 c3                	cmp    %al,%bl
 19d:	74 e9                	je     188 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 19f:	29 d8                	sub    %ebx,%eax
}
 1a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a4:	c9                   	leave  
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1b4:	31 c0                	xor    %eax,%eax
 1b6:	29 d8                	sub    %ebx,%eax
}
 1b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1bb:	c9                   	leave  
 1bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1bd:	0f b6 19             	movzbl (%ecx),%ebx
 1c0:	31 c0                	xor    %eax,%eax
 1c2:	eb db                	jmp    19f <strcmp+0x2f>
 1c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1d6:	80 3a 00             	cmpb   $0x0,(%edx)
 1d9:	74 15                	je     1f0 <strlen+0x20>
 1db:	31 c0                	xor    %eax,%eax
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	83 c0 01             	add    $0x1,%eax
 1e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1e7:	89 c1                	mov    %eax,%ecx
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
 1eb:	89 c8                	mov    %ecx,%eax
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    
 1ef:	90                   	nop
  for(n = 0; s[n]; n++)
 1f0:	31 c9                	xor    %ecx,%ecx
}
 1f2:	5d                   	pop    %ebp
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	8b 7d fc             	mov    -0x4(%ebp),%edi
 215:	89 d0                	mov    %edx,%eax
 217:	c9                   	leave  
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	75 12                	jne    243 <strchr+0x23>
 231:	eb 1d                	jmp    250 <strchr+0x30>
 233:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 237:	90                   	nop
 238:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 23c:	83 c0 01             	add    $0x1,%eax
 23f:	84 d2                	test   %dl,%dl
 241:	74 0d                	je     250 <strchr+0x30>
    if(*s == c)
 243:	38 d1                	cmp    %dl,%cl
 245:	75 f1                	jne    238 <strchr+0x18>
      return (char*)s;
  return 0;
}
 247:	5d                   	pop    %ebp
 248:	c3                   	ret    
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 250:	31 c0                	xor    %eax,%eax
}
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    
 254:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 265:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 268:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 269:	31 db                	xor    %ebx,%ebx
{
 26b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 26e:	eb 27                	jmp    297 <gets+0x37>
    cc = read(0, &c, 1);
 270:	83 ec 04             	sub    $0x4,%esp
 273:	6a 01                	push   $0x1
 275:	57                   	push   %edi
 276:	6a 00                	push   $0x0
 278:	e8 2e 01 00 00       	call   3ab <read>
    if(cc < 1)
 27d:	83 c4 10             	add    $0x10,%esp
 280:	85 c0                	test   %eax,%eax
 282:	7e 1d                	jle    2a1 <gets+0x41>
      break;
    buf[i++] = c;
 284:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 288:	8b 55 08             	mov    0x8(%ebp),%edx
 28b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 28f:	3c 0a                	cmp    $0xa,%al
 291:	74 1d                	je     2b0 <gets+0x50>
 293:	3c 0d                	cmp    $0xd,%al
 295:	74 19                	je     2b0 <gets+0x50>
  for(i=0; i+1 < max; ){
 297:	89 de                	mov    %ebx,%esi
 299:	83 c3 01             	add    $0x1,%ebx
 29c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29f:	7c cf                	jl     270 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ab:	5b                   	pop    %ebx
 2ac:	5e                   	pop    %esi
 2ad:	5f                   	pop    %edi
 2ae:	5d                   	pop    %ebp
 2af:	c3                   	ret    
  buf[i] = '\0';
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	89 de                	mov    %ebx,%esi
 2b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bc:	5b                   	pop    %ebx
 2bd:	5e                   	pop    %esi
 2be:	5f                   	pop    %edi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	push   0x8(%ebp)
 2dd:	e8 f1 00 00 00       	call   3d3 <open>
  if(fd < 0)
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	push   0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 f4 00 00 00       	call   3eb <fstat>
  close(fd);
 2f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2fa:	89 c6                	mov    %eax,%esi
  close(fd);
 2fc:	e8 ba 00 00 00       	call   3bb <close>
  return r;
 301:	83 c4 10             	add    $0x10,%esp
}
 304:	8d 65 f8             	lea    -0x8(%ebp),%esp
 307:	89 f0                	mov    %esi,%eax
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 310:	be ff ff ff ff       	mov    $0xffffffff,%esi
 315:	eb ed                	jmp    304 <stat+0x34>
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax

00000320 <atoi>:

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	0f be 02             	movsbl (%edx),%eax
 32a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 32d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 330:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 335:	77 1e                	ja     355 <atoi+0x35>
 337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 340:	83 c2 01             	add    $0x1,%edx
 343:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 346:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 34a:	0f be 02             	movsbl (%edx),%eax
 34d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
  return n;
}
 355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 358:	89 c8                	mov    %ecx,%eax
 35a:	c9                   	leave  
 35b:	c3                   	ret    
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	8b 45 10             	mov    0x10(%ebp),%eax
 367:	8b 55 08             	mov    0x8(%ebp),%edx
 36a:	56                   	push   %esi
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36e:	85 c0                	test   %eax,%eax
 370:	7e 13                	jle    385 <memmove+0x25>
 372:	01 d0                	add    %edx,%eax
  dst = vdst;
 374:	89 d7                	mov    %edx,%edi
 376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 381:	39 f8                	cmp    %edi,%eax
 383:	75 fb                	jne    380 <memmove+0x20>
  return vdst;
}
 385:	5e                   	pop    %esi
 386:	89 d0                	mov    %edx,%eax
 388:	5f                   	pop    %edi
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret    

0000038b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 38b:	b8 01 00 00 00       	mov    $0x1,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <exit>:
SYSCALL(exit)
 393:	b8 02 00 00 00       	mov    $0x2,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <wait>:
SYSCALL(wait)
 39b:	b8 03 00 00 00       	mov    $0x3,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <pipe>:
SYSCALL(pipe)
 3a3:	b8 04 00 00 00       	mov    $0x4,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <read>:
SYSCALL(read)
 3ab:	b8 05 00 00 00       	mov    $0x5,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <write>:
SYSCALL(write)
 3b3:	b8 10 00 00 00       	mov    $0x10,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <close>:
SYSCALL(close)
 3bb:	b8 15 00 00 00       	mov    $0x15,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <kill>:
SYSCALL(kill)
 3c3:	b8 06 00 00 00       	mov    $0x6,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <exec>:
SYSCALL(exec)
 3cb:	b8 07 00 00 00       	mov    $0x7,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <open>:
SYSCALL(open)
 3d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <mknod>:
SYSCALL(mknod)
 3db:	b8 11 00 00 00       	mov    $0x11,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <unlink>:
SYSCALL(unlink)
 3e3:	b8 12 00 00 00       	mov    $0x12,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <fstat>:
SYSCALL(fstat)
 3eb:	b8 08 00 00 00       	mov    $0x8,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <link>:
SYSCALL(link)
 3f3:	b8 13 00 00 00       	mov    $0x13,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <mkdir>:
SYSCALL(mkdir)
 3fb:	b8 14 00 00 00       	mov    $0x14,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <chdir>:
SYSCALL(chdir)
 403:	b8 09 00 00 00       	mov    $0x9,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <dup>:
SYSCALL(dup)
 40b:	b8 0a 00 00 00       	mov    $0xa,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <getpid>:
SYSCALL(getpid)
 413:	b8 0b 00 00 00       	mov    $0xb,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <sbrk>:
SYSCALL(sbrk)
 41b:	b8 0c 00 00 00       	mov    $0xc,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <sleep>:
SYSCALL(sleep)
 423:	b8 0d 00 00 00       	mov    $0xd,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <uptime>:
SYSCALL(uptime)
 42b:	b8 0e 00 00 00       	mov    $0xe,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <printhugepde>:
SYSCALL(printhugepde)
 433:	b8 16 00 00 00       	mov    $0x16,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 43b:	b8 17 00 00 00       	mov    $0x17,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <setthp>:
SYSCALL(setthp)
 443:	b8 18 00 00 00       	mov    $0x18,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <getthp>:
 44b:	b8 19 00 00 00       	mov    $0x19,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    
 453:	66 90                	xchg   %ax,%ax
 455:	66 90                	xchg   %ax,%ax
 457:	66 90                	xchg   %ax,%ax
 459:	66 90                	xchg   %ax,%ax
 45b:	66 90                	xchg   %ax,%ax
 45d:	66 90                	xchg   %ax,%ax
 45f:	90                   	nop

00000460 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	83 ec 3c             	sub    $0x3c,%esp
 469:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 46c:	89 d1                	mov    %edx,%ecx
{
 46e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 471:	85 d2                	test   %edx,%edx
 473:	0f 89 7f 00 00 00    	jns    4f8 <printint+0x98>
 479:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 47d:	74 79                	je     4f8 <printint+0x98>
    neg = 1;
 47f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 486:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 488:	31 db                	xor    %ebx,%ebx
 48a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 48d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 490:	89 c8                	mov    %ecx,%eax
 492:	31 d2                	xor    %edx,%edx
 494:	89 cf                	mov    %ecx,%edi
 496:	f7 75 c4             	divl   -0x3c(%ebp)
 499:	0f b6 92 c4 09 00 00 	movzbl 0x9c4(%edx),%edx
 4a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4a3:	89 d8                	mov    %ebx,%eax
 4a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4b1:	76 dd                	jbe    490 <printint+0x30>
  if(neg)
 4b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4b6:	85 c9                	test   %ecx,%ecx
 4b8:	74 0c                	je     4c6 <printint+0x66>
    buf[i++] = '-';
 4ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4cd:	eb 07                	jmp    4d6 <printint+0x76>
 4cf:	90                   	nop
    putc(fd, buf[i]);
 4d0:	0f b6 13             	movzbl (%ebx),%edx
 4d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4d6:	83 ec 04             	sub    $0x4,%esp
 4d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4dc:	6a 01                	push   $0x1
 4de:	56                   	push   %esi
 4df:	57                   	push   %edi
 4e0:	e8 ce fe ff ff       	call   3b3 <write>
  while(--i >= 0)
 4e5:	83 c4 10             	add    $0x10,%esp
 4e8:	39 de                	cmp    %ebx,%esi
 4ea:	75 e4                	jne    4d0 <printint+0x70>
}
 4ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ef:	5b                   	pop    %ebx
 4f0:	5e                   	pop    %esi
 4f1:	5f                   	pop    %edi
 4f2:	5d                   	pop    %ebp
 4f3:	c3                   	ret    
 4f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4ff:	eb 87                	jmp    488 <printint+0x28>
 501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 508:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop

00000510 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
 516:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 519:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 51c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 51f:	0f b6 13             	movzbl (%ebx),%edx
 522:	84 d2                	test   %dl,%dl
 524:	74 6a                	je     590 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 526:	8d 45 10             	lea    0x10(%ebp),%eax
 529:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 52c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 52f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 531:	89 45 d0             	mov    %eax,-0x30(%ebp)
 534:	eb 36                	jmp    56c <printf+0x5c>
 536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi
 540:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 543:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 548:	83 f8 25             	cmp    $0x25,%eax
 54b:	74 15                	je     562 <printf+0x52>
  write(fd, &c, 1);
 54d:	83 ec 04             	sub    $0x4,%esp
 550:	88 55 e7             	mov    %dl,-0x19(%ebp)
 553:	6a 01                	push   $0x1
 555:	57                   	push   %edi
 556:	56                   	push   %esi
 557:	e8 57 fe ff ff       	call   3b3 <write>
 55c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 55f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 562:	0f b6 13             	movzbl (%ebx),%edx
 565:	83 c3 01             	add    $0x1,%ebx
 568:	84 d2                	test   %dl,%dl
 56a:	74 24                	je     590 <printf+0x80>
    c = fmt[i] & 0xff;
 56c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 56f:	85 c9                	test   %ecx,%ecx
 571:	74 cd                	je     540 <printf+0x30>
      }
    } else if(state == '%'){
 573:	83 f9 25             	cmp    $0x25,%ecx
 576:	75 ea                	jne    562 <printf+0x52>
      if(c == 'd'){
 578:	83 f8 25             	cmp    $0x25,%eax
 57b:	0f 84 07 01 00 00    	je     688 <printf+0x178>
 581:	83 e8 63             	sub    $0x63,%eax
 584:	83 f8 15             	cmp    $0x15,%eax
 587:	77 17                	ja     5a0 <printf+0x90>
 589:	ff 24 85 6c 09 00 00 	jmp    *0x96c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 590:	8d 65 f4             	lea    -0xc(%ebp),%esp
 593:	5b                   	pop    %ebx
 594:	5e                   	pop    %esi
 595:	5f                   	pop    %edi
 596:	5d                   	pop    %ebp
 597:	c3                   	ret    
 598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop
  write(fd, &c, 1);
 5a0:	83 ec 04             	sub    $0x4,%esp
 5a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 5a6:	6a 01                	push   $0x1
 5a8:	57                   	push   %edi
 5a9:	56                   	push   %esi
 5aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ae:	e8 00 fe ff ff       	call   3b3 <write>
        putc(fd, c);
 5b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 5b7:	83 c4 0c             	add    $0xc,%esp
 5ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5bd:	6a 01                	push   $0x1
 5bf:	57                   	push   %edi
 5c0:	56                   	push   %esi
 5c1:	e8 ed fd ff ff       	call   3b3 <write>
        putc(fd, c);
 5c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5c9:	31 c9                	xor    %ecx,%ecx
 5cb:	eb 95                	jmp    562 <printf+0x52>
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5d0:	83 ec 0c             	sub    $0xc,%esp
 5d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5d8:	6a 00                	push   $0x0
 5da:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5dd:	8b 10                	mov    (%eax),%edx
 5df:	89 f0                	mov    %esi,%eax
 5e1:	e8 7a fe ff ff       	call   460 <printint>
        ap++;
 5e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5ed:	31 c9                	xor    %ecx,%ecx
 5ef:	e9 6e ff ff ff       	jmp    562 <printf+0x52>
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5fb:	8b 10                	mov    (%eax),%edx
        ap++;
 5fd:	83 c0 04             	add    $0x4,%eax
 600:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 603:	85 d2                	test   %edx,%edx
 605:	0f 84 8d 00 00 00    	je     698 <printf+0x188>
        while(*s != 0){
 60b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 60e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 610:	84 c0                	test   %al,%al
 612:	0f 84 4a ff ff ff    	je     562 <printf+0x52>
 618:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 61b:	89 d3                	mov    %edx,%ebx
 61d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 620:	83 ec 04             	sub    $0x4,%esp
          s++;
 623:	83 c3 01             	add    $0x1,%ebx
 626:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 629:	6a 01                	push   $0x1
 62b:	57                   	push   %edi
 62c:	56                   	push   %esi
 62d:	e8 81 fd ff ff       	call   3b3 <write>
        while(*s != 0){
 632:	0f b6 03             	movzbl (%ebx),%eax
 635:	83 c4 10             	add    $0x10,%esp
 638:	84 c0                	test   %al,%al
 63a:	75 e4                	jne    620 <printf+0x110>
      state = 0;
 63c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 63f:	31 c9                	xor    %ecx,%ecx
 641:	e9 1c ff ff ff       	jmp    562 <printf+0x52>
 646:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	b9 0a 00 00 00       	mov    $0xa,%ecx
 658:	6a 01                	push   $0x1
 65a:	e9 7b ff ff ff       	jmp    5da <printf+0xca>
 65f:	90                   	nop
        putc(fd, *ap);
 660:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 663:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 666:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 668:	6a 01                	push   $0x1
 66a:	57                   	push   %edi
 66b:	56                   	push   %esi
        putc(fd, *ap);
 66c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 66f:	e8 3f fd ff ff       	call   3b3 <write>
        ap++;
 674:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 678:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67b:	31 c9                	xor    %ecx,%ecx
 67d:	e9 e0 fe ff ff       	jmp    562 <printf+0x52>
 682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 688:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 68b:	83 ec 04             	sub    $0x4,%esp
 68e:	e9 2a ff ff ff       	jmp    5bd <printf+0xad>
 693:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 697:	90                   	nop
          s = "(null)";
 698:	ba 64 09 00 00       	mov    $0x964,%edx
        while(*s != 0){
 69d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6a0:	b8 28 00 00 00       	mov    $0x28,%eax
 6a5:	89 d3                	mov    %edx,%ebx
 6a7:	e9 74 ff ff ff       	jmp    620 <printf+0x110>
 6ac:	66 90                	xchg   %ax,%ax
 6ae:	66 90                	xchg   %ax,%ax

000006b0 <vfree>:
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 04             	sub    $0x4,%esp
 6b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
 6bc:	8b 45 0c             	mov    0xc(%ebp),%eax
    bp = ((Header*)ap) - 1;
 6bf:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    if (use_huge_pages) {
 6c2:	85 c0                	test   %eax,%eax
 6c4:	0f 84 96 00 00 00    	je     760 <vfree+0xb0>
        freepptr = &huge_freep;
 6ca:	a1 e8 0c 00 00       	mov    0xce8,%eax
 6cf:	bf e8 0c 00 00       	mov    $0xce8,%edi
 6d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 6d8:	89 c2                	mov    %eax,%edx
 6da:	8b 00                	mov    (%eax),%eax
 6dc:	39 ca                	cmp    %ecx,%edx
 6de:	73 38                	jae    718 <vfree+0x68>
 6e0:	39 c1                	cmp    %eax,%ecx
 6e2:	72 04                	jb     6e8 <vfree+0x38>
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 6e4:	39 c2                	cmp    %eax,%edx
 6e6:	72 f0                	jb     6d8 <vfree+0x28>
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
 6e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6eb:	89 7d f0             	mov    %edi,-0x10(%ebp)
 6ee:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6f1:	39 f8                	cmp    %edi,%eax
 6f3:	74 38                	je     72d <vfree+0x7d>
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
 6f5:	89 43 f8             	mov    %eax,-0x8(%ebx)
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
 6f8:	8b 42 04             	mov    0x4(%edx),%eax
 6fb:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6fe:	39 f1                	cmp    %esi,%ecx
 700:	74 42                	je     744 <vfree+0x94>
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
 702:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 705:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 707:	89 10                	mov    %edx,(%eax)
}
 709:	83 c4 04             	add    $0x4,%esp
 70c:	5b                   	pop    %ebx
 70d:	5e                   	pop    %esi
 70e:	5f                   	pop    %edi
 70f:	5d                   	pop    %ebp
 710:	c3                   	ret    
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 718:	39 c2                	cmp    %eax,%edx
 71a:	72 bc                	jb     6d8 <vfree+0x28>
 71c:	39 c1                	cmp    %eax,%ecx
 71e:	73 b8                	jae    6d8 <vfree+0x28>
    if (bp + bp->s.size == p->s.ptr) {
 720:	8b 73 fc             	mov    -0x4(%ebx),%esi
 723:	89 7d f0             	mov    %edi,-0x10(%ebp)
 726:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 729:	39 f8                	cmp    %edi,%eax
 72b:	75 c8                	jne    6f5 <vfree+0x45>
        bp->s.size += p->s.ptr->s.size;
 72d:	03 70 04             	add    0x4(%eax),%esi
 730:	89 73 fc             	mov    %esi,-0x4(%ebx)
        bp->s.ptr = p->s.ptr->s.ptr;
 733:	8b 02                	mov    (%edx),%eax
 735:	8b 00                	mov    (%eax),%eax
 737:	89 43 f8             	mov    %eax,-0x8(%ebx)
    if (p + p->s.size == bp) {
 73a:	8b 42 04             	mov    0x4(%edx),%eax
 73d:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 740:	39 f1                	cmp    %esi,%ecx
 742:	75 be                	jne    702 <vfree+0x52>
        p->s.size += bp->s.size;
 744:	03 43 fc             	add    -0x4(%ebx),%eax
 747:	89 42 04             	mov    %eax,0x4(%edx)
    *freepptr = p;
 74a:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 74d:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 750:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 752:	89 10                	mov    %edx,(%eax)
}
 754:	83 c4 04             	add    $0x4,%esp
 757:	5b                   	pop    %ebx
 758:	5e                   	pop    %esi
 759:	5f                   	pop    %edi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        freepptr = &freep;
 760:	a1 f4 0c 00 00       	mov    0xcf4,%eax
 765:	bf f4 0c 00 00       	mov    $0xcf4,%edi
    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 76a:	e9 69 ff ff ff       	jmp    6d8 <vfree+0x28>
 76f:	90                   	nop

00000770 <vmalloc>:
void* vmalloc(uint nbytes, int use_huge_pages) {
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 1c             	sub    $0x1c,%esp
 779:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (use_huge_pages) {
 77c:	85 db                	test   %ebx,%ebx
 77e:	0f 84 0c 01 00 00    	je     890 <vmalloc+0x120>
        if ((prevp = huge_freep) == 0) {
 784:	8b 15 e8 0c 00 00    	mov    0xce8,%edx
 78a:	85 d2                	test   %edx,%edx
 78c:	0f 84 6e f8 ff ff    	je     0 <vmalloc.cold>
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 792:	8b 45 08             	mov    0x8(%ebp),%eax
 795:	8d 78 07             	lea    0x7(%eax),%edi
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 798:	8b 02                	mov    (%edx),%eax
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 79a:	c1 ef 03             	shr    $0x3,%edi
        if (p->s.size >= nunits) {
 79d:	8b 48 04             	mov    0x4(%eax),%ecx
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 7a0:	83 c7 01             	add    $0x1,%edi
        if (p->s.size >= nunits) {
 7a3:	39 f9                	cmp    %edi,%ecx
 7a5:	0f 83 c5 00 00 00    	jae    870 <vmalloc+0x100>
 7ab:	be 00 10 00 00       	mov    $0x1000,%esi
 7b0:	ba 00 00 40 00       	mov    $0x400000,%edx
 7b5:	39 f7                	cmp    %esi,%edi
 7b7:	0f 43 f7             	cmovae %edi,%esi
 7ba:	39 d7                	cmp    %edx,%edi
 7bc:	0f 43 d7             	cmovae %edi,%edx
  p = sbrk(nu * sizeof(Header));
 7bf:	8d 0c f5 00 00 00 00 	lea    0x0(,%esi,8),%ecx
 7c6:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 7c9:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
 7d0:	89 55 dc             	mov    %edx,-0x24(%ebp)
 7d3:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 7d6:	eb 15                	jmp    7ed <vmalloc+0x7d>
 7d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 7e0:	8b 02                	mov    (%edx),%eax
        if (p->s.size >= nunits) {
 7e2:	8b 48 04             	mov    0x4(%eax),%ecx
 7e5:	39 f9                	cmp    %edi,%ecx
 7e7:	0f 83 83 00 00 00    	jae    870 <vmalloc+0x100>
        if (p == freep) {
 7ed:	89 c2                	mov    %eax,%edx
 7ef:	39 05 f4 0c 00 00    	cmp    %eax,0xcf4
 7f5:	75 e9                	jne    7e0 <vmalloc+0x70>
  if(use_huge_pages){
 7f7:	85 db                	test   %ebx,%ebx
 7f9:	74 45                	je     840 <vmalloc+0xd0>
  p = sbrk(nu * sizeof(Header));
 7fb:	83 ec 0c             	sub    $0xc,%esp
 7fe:	ff 75 e0             	push   -0x20(%ebp)
 801:	e8 15 fc ff ff       	call   41b <sbrk>
  if(p == (char*)-1)
 806:	83 c4 10             	add    $0x10,%esp
 809:	83 f8 ff             	cmp    $0xffffffff,%eax
 80c:	74 20                	je     82e <vmalloc+0xbe>
  hp->s.size = nu;
 80e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  vfree((void*)(hp + 1), use_huge_pages);
 811:	83 ec 08             	sub    $0x8,%esp
 814:	83 c0 08             	add    $0x8,%eax
  hp->s.size = nu;
 817:	89 48 fc             	mov    %ecx,-0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 81a:	53                   	push   %ebx
 81b:	50                   	push   %eax
 81c:	e8 8f fe ff ff       	call   6b0 <vfree>
  return use_huge_pages ? huge_freep : freep;
 821:	8b 15 e8 0c 00 00    	mov    0xce8,%edx
 827:	83 c4 10             	add    $0x10,%esp
            if (p == 0) {
 82a:	85 d2                	test   %edx,%edx
 82c:	75 b2                	jne    7e0 <vmalloc+0x70>
}
 82e:	8d 65 f4             	lea    -0xc(%ebp),%esp
                return 0;
 831:	31 c0                	xor    %eax,%eax
}
 833:	5b                   	pop    %ebx
 834:	5e                   	pop    %esi
 835:	5f                   	pop    %edi
 836:	5d                   	pop    %ebp
 837:	c3                   	ret    
 838:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop
  p = sbrk(nu * sizeof(Header));
 840:	83 ec 0c             	sub    $0xc,%esp
 843:	ff 75 e4             	push   -0x1c(%ebp)
 846:	e8 d0 fb ff ff       	call   41b <sbrk>
  if(p == (char*)-1)
 84b:	83 c4 10             	add    $0x10,%esp
 84e:	83 f8 ff             	cmp    $0xffffffff,%eax
 851:	74 db                	je     82e <vmalloc+0xbe>
  hp->s.size = nu;
 853:	89 70 04             	mov    %esi,0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 856:	83 ec 08             	sub    $0x8,%esp
 859:	83 c0 08             	add    $0x8,%eax
 85c:	6a 00                	push   $0x0
 85e:	50                   	push   %eax
 85f:	e8 4c fe ff ff       	call   6b0 <vfree>
  return use_huge_pages ? huge_freep : freep;
 864:	8b 15 f4 0c 00 00    	mov    0xcf4,%edx
 86a:	83 c4 10             	add    $0x10,%esp
 86d:	eb bb                	jmp    82a <vmalloc+0xba>
 86f:	90                   	nop
            if (p->s.size == nunits) {
 870:	39 cf                	cmp    %ecx,%edi
 872:	74 34                	je     8a8 <vmalloc+0x138>
                p->s.size -= nunits;
 874:	29 f9                	sub    %edi,%ecx
 876:	89 48 04             	mov    %ecx,0x4(%eax)
                p += p->s.size;
 879:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
                p->s.size = nunits;
 87c:	89 78 04             	mov    %edi,0x4(%eax)
            freep = prevp;
 87f:	89 15 f4 0c 00 00    	mov    %edx,0xcf4
}
 885:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return (void*)(p + 1);
 888:	83 c0 08             	add    $0x8,%eax
}
 88b:	5b                   	pop    %ebx
 88c:	5e                   	pop    %esi
 88d:	5f                   	pop    %edi
 88e:	5d                   	pop    %ebp
 88f:	c3                   	ret    
        if ((prevp = freep) == 0) {
 890:	8b 15 f4 0c 00 00    	mov    0xcf4,%edx
 896:	85 d2                	test   %edx,%edx
 898:	0f 85 f4 fe ff ff    	jne    792 <vmalloc+0x22>
 89e:	e9 82 f7 ff ff       	jmp    25 <vmalloc.cold+0x25>
 8a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8a7:	90                   	nop
                prevp->s.ptr = p->s.ptr;
 8a8:	8b 08                	mov    (%eax),%ecx
 8aa:	89 0a                	mov    %ecx,(%edx)
 8ac:	eb d1                	jmp    87f <vmalloc+0x10f>
 8ae:	66 90                	xchg   %ax,%ax

000008b0 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
 8b3:	53                   	push   %ebx
 8b4:	83 ec 04             	sub    $0x4,%esp
 8b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 8ba:	e8 8c fb ff ff       	call   44b <getthp>


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
 8bf:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 8c5:	76 19                	jbe    8e0 <malloc+0x30>
 8c7:	85 c0                	test   %eax,%eax
 8c9:	74 15                	je     8e0 <malloc+0x30>
    return vmalloc(nbytes, 1); // use the huge pages
 8cb:	83 ec 08             	sub    $0x8,%esp
 8ce:	6a 01                	push   $0x1
 8d0:	53                   	push   %ebx
 8d1:	e8 9a fe ff ff       	call   770 <vmalloc>
  }
  else{
    return vmalloc(nbytes, 0);
  }
}
 8d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 1); // use the huge pages
 8d9:	83 c4 10             	add    $0x10,%esp
}
 8dc:	c9                   	leave  
 8dd:	c3                   	ret    
 8de:	66 90                	xchg   %ax,%ax
    return vmalloc(nbytes, 0);
 8e0:	83 ec 08             	sub    $0x8,%esp
 8e3:	6a 00                	push   $0x0
 8e5:	53                   	push   %ebx
 8e6:	e8 85 fe ff ff       	call   770 <vmalloc>
}
 8eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 0);
 8ee:	83 c4 10             	add    $0x10,%esp
}
 8f1:	c9                   	leave  
 8f2:	c3                   	ret    
 8f3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000900 <free>:

void free(void * ap){
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
  vfree(ap, 0);
 903:	6a 00                	push   $0x0
 905:	ff 75 08             	push   0x8(%ebp)
 908:	e8 a3 fd ff ff       	call   6b0 <vfree>
}
 90d:	58                   	pop    %eax
 90e:	5a                   	pop    %edx
 90f:	c9                   	leave  
 910:	c3                   	ret    
