
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <vmalloc.cold>:

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
   0:	c7 05 a0 0f 00 00 a4 	movl   $0xfa4,0xfa0
   7:	0f 00 00 
   a:	c7 05 a4 0f 00 00 a4 	movl   $0xfa4,0xfa4
  11:	0f 00 00 
            huge_base.s.size = 0;
  14:	c7 05 a8 0f 00 00 00 	movl   $0x0,0xfa8
  1b:	00 00 00 
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
  1e:	a1 00 00 00 00       	mov    0x0,%eax
  23:	0f 0b                	ud2    
            base.s.ptr = freep = &base;
  25:	c7 05 ac 0f 00 00 b0 	movl   $0xfb0,0xfac
  2c:	0f 00 00 
  2f:	c7 05 b0 0f 00 00 b0 	movl   $0xfb0,0xfb0
  36:	0f 00 00 
            base.s.size = 0;
  39:	c7 05 b4 0f 00 00 00 	movl   $0x0,0xfb4
  40:	00 00 00 
  43:	eb d9                	jmp    1e <vmalloc.cold+0x1e>
  45:	66 90                	xchg   %ax,%ax
  47:	66 90                	xchg   %ax,%ax
  49:	66 90                	xchg   %ax,%ax
  4b:	66 90                	xchg   %ax,%ax
  4d:	66 90                	xchg   %ax,%ax
  4f:	90                   	nop

00000050 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  5f:	be 01 00 00 00       	mov    $0x1,%esi
  64:	53                   	push   %ebx
  65:	51                   	push   %ecx
  66:	83 ec 18             	sub    $0x18,%esp
  69:	8b 01                	mov    (%ecx),%eax
  6b:	8b 59 04             	mov    0x4(%ecx),%ebx
  6e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  71:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  74:	83 f8 01             	cmp    $0x1,%eax
  77:	7e 56                	jle    cf <main+0x7f>
  79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  80:	83 ec 08             	sub    $0x8,%esp
  83:	6a 00                	push   $0x0
  85:	ff 33                	push   (%ebx)
  87:	e8 d7 03 00 00       	call   463 <open>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	89 c7                	mov    %eax,%edi
  91:	85 c0                	test   %eax,%eax
  93:	78 26                	js     bb <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  95:	83 ec 08             	sub    $0x8,%esp
  98:	ff 33                	push   (%ebx)
  for(i = 1; i < argc; i++){
  9a:	83 c6 01             	add    $0x1,%esi
  9d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  a0:	50                   	push   %eax
  a1:	e8 4a 00 00 00       	call   f0 <wc>
    close(fd);
  a6:	89 3c 24             	mov    %edi,(%esp)
  a9:	e8 9d 03 00 00       	call   44b <close>
  for(i = 1; i < argc; i++){
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  b4:	75 ca                	jne    80 <main+0x30>
  }
  exit();
  b6:	e8 68 03 00 00       	call   423 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  bb:	50                   	push   %eax
  bc:	ff 33                	push   (%ebx)
  be:	68 c7 09 00 00       	push   $0x9c7
  c3:	6a 01                	push   $0x1
  c5:	e8 d6 04 00 00       	call   5a0 <printf>
      exit();
  ca:	e8 54 03 00 00       	call   423 <exit>
    wc(0, "");
  cf:	52                   	push   %edx
  d0:	52                   	push   %edx
  d1:	68 b9 09 00 00       	push   $0x9b9
  d6:	6a 00                	push   $0x0
  d8:	e8 13 00 00 00       	call   f0 <wc>
    exit();
  dd:	e8 41 03 00 00       	call   423 <exit>
  e2:	66 90                	xchg   %ax,%ax
  e4:	66 90                	xchg   %ax,%ax
  e6:	66 90                	xchg   %ax,%ax
  e8:	66 90                	xchg   %ax,%ax
  ea:	66 90                	xchg   %ax,%ax
  ec:	66 90                	xchg   %ax,%ax
  ee:	66 90                	xchg   %ax,%ax

000000f0 <wc>:
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	56                   	push   %esi
  f5:	53                   	push   %ebx
  l = w = c = 0;
  f6:	31 db                	xor    %ebx,%ebx
{
  f8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  fb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
 102:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 109:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
 110:	83 ec 04             	sub    $0x4,%esp
 113:	68 00 02 00 00       	push   $0x200
 118:	68 a0 0d 00 00       	push   $0xda0
 11d:	ff 75 08             	push   0x8(%ebp)
 120:	e8 16 03 00 00       	call   43b <read>
 125:	83 c4 10             	add    $0x10,%esp
 128:	89 c6                	mov    %eax,%esi
 12a:	85 c0                	test   %eax,%eax
 12c:	7e 62                	jle    190 <wc+0xa0>
    for(i=0; i<n; i++){
 12e:	31 ff                	xor    %edi,%edi
 130:	eb 14                	jmp    146 <wc+0x56>
 132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
 138:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
 13f:	83 c7 01             	add    $0x1,%edi
 142:	39 fe                	cmp    %edi,%esi
 144:	74 42                	je     188 <wc+0x98>
      if(buf[i] == '\n')
 146:	0f be 87 a0 0d 00 00 	movsbl 0xda0(%edi),%eax
        l++;
 14d:	31 c9                	xor    %ecx,%ecx
 14f:	3c 0a                	cmp    $0xa,%al
 151:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 154:	83 ec 08             	sub    $0x8,%esp
 157:	50                   	push   %eax
        l++;
 158:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 15a:	68 a4 09 00 00       	push   $0x9a4
 15f:	e8 4c 01 00 00       	call   2b0 <strchr>
 164:	83 c4 10             	add    $0x10,%esp
 167:	85 c0                	test   %eax,%eax
 169:	75 cd                	jne    138 <wc+0x48>
      else if(!inword){
 16b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 16e:	85 d2                	test   %edx,%edx
 170:	75 cd                	jne    13f <wc+0x4f>
    for(i=0; i<n; i++){
 172:	83 c7 01             	add    $0x1,%edi
        w++;
 175:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 179:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 180:	39 fe                	cmp    %edi,%esi
 182:	75 c2                	jne    146 <wc+0x56>
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      c++;
 188:	01 75 dc             	add    %esi,-0x24(%ebp)
 18b:	eb 83                	jmp    110 <wc+0x20>
 18d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 190:	75 24                	jne    1b6 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 192:	83 ec 08             	sub    $0x8,%esp
 195:	ff 75 0c             	push   0xc(%ebp)
 198:	ff 75 dc             	push   -0x24(%ebp)
 19b:	ff 75 e0             	push   -0x20(%ebp)
 19e:	53                   	push   %ebx
 19f:	68 ba 09 00 00       	push   $0x9ba
 1a4:	6a 01                	push   $0x1
 1a6:	e8 f5 03 00 00       	call   5a0 <printf>
}
 1ab:	83 c4 20             	add    $0x20,%esp
 1ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b1:	5b                   	pop    %ebx
 1b2:	5e                   	pop    %esi
 1b3:	5f                   	pop    %edi
 1b4:	5d                   	pop    %ebp
 1b5:	c3                   	ret    
    printf(1, "wc: read error\n");
 1b6:	50                   	push   %eax
 1b7:	50                   	push   %eax
 1b8:	68 aa 09 00 00       	push   $0x9aa
 1bd:	6a 01                	push   $0x1
 1bf:	e8 dc 03 00 00       	call   5a0 <printf>
    exit();
 1c4:	e8 5a 02 00 00       	call   423 <exit>
 1c9:	66 90                	xchg   %ax,%ax
 1cb:	66 90                	xchg   %ax,%ax
 1cd:	66 90                	xchg   %ax,%ax
 1cf:	90                   	nop

000001d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1d0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1d1:	31 c0                	xor    %eax,%eax
{
 1d3:	89 e5                	mov    %esp,%ebp
 1d5:	53                   	push   %ebx
 1d6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1e0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1e4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1e7:	83 c0 01             	add    $0x1,%eax
 1ea:	84 d2                	test   %dl,%dl
 1ec:	75 f2                	jne    1e0 <strcpy+0x10>
    ;
  return os;
}
 1ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f1:	89 c8                	mov    %ecx,%eax
 1f3:	c9                   	leave  
 1f4:	c3                   	ret    
 1f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	53                   	push   %ebx
 204:	8b 55 08             	mov    0x8(%ebp),%edx
 207:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 20a:	0f b6 02             	movzbl (%edx),%eax
 20d:	84 c0                	test   %al,%al
 20f:	75 17                	jne    228 <strcmp+0x28>
 211:	eb 3a                	jmp    24d <strcmp+0x4d>
 213:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 217:	90                   	nop
 218:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 21c:	83 c2 01             	add    $0x1,%edx
 21f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 222:	84 c0                	test   %al,%al
 224:	74 1a                	je     240 <strcmp+0x40>
    p++, q++;
 226:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 228:	0f b6 19             	movzbl (%ecx),%ebx
 22b:	38 c3                	cmp    %al,%bl
 22d:	74 e9                	je     218 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 22f:	29 d8                	sub    %ebx,%eax
}
 231:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 234:	c9                   	leave  
 235:	c3                   	ret    
 236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 240:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 244:	31 c0                	xor    %eax,%eax
 246:	29 d8                	sub    %ebx,%eax
}
 248:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 24b:	c9                   	leave  
 24c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 24d:	0f b6 19             	movzbl (%ecx),%ebx
 250:	31 c0                	xor    %eax,%eax
 252:	eb db                	jmp    22f <strcmp+0x2f>
 254:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop

00000260 <strlen>:

uint
strlen(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 266:	80 3a 00             	cmpb   $0x0,(%edx)
 269:	74 15                	je     280 <strlen+0x20>
 26b:	31 c0                	xor    %eax,%eax
 26d:	8d 76 00             	lea    0x0(%esi),%esi
 270:	83 c0 01             	add    $0x1,%eax
 273:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 277:	89 c1                	mov    %eax,%ecx
 279:	75 f5                	jne    270 <strlen+0x10>
    ;
  return n;
}
 27b:	89 c8                	mov    %ecx,%eax
 27d:	5d                   	pop    %ebp
 27e:	c3                   	ret    
 27f:	90                   	nop
  for(n = 0; s[n]; n++)
 280:	31 c9                	xor    %ecx,%ecx
}
 282:	5d                   	pop    %ebp
 283:	89 c8                	mov    %ecx,%eax
 285:	c3                   	ret    
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi

00000290 <memset>:

void*
memset(void *dst, int c, uint n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 297:	8b 4d 10             	mov    0x10(%ebp),%ecx
 29a:	8b 45 0c             	mov    0xc(%ebp),%eax
 29d:	89 d7                	mov    %edx,%edi
 29f:	fc                   	cld    
 2a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2a2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2a5:	89 d0                	mov    %edx,%eax
 2a7:	c9                   	leave  
 2a8:	c3                   	ret    
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002b0 <strchr>:

char*
strchr(const char *s, char c)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ba:	0f b6 10             	movzbl (%eax),%edx
 2bd:	84 d2                	test   %dl,%dl
 2bf:	75 12                	jne    2d3 <strchr+0x23>
 2c1:	eb 1d                	jmp    2e0 <strchr+0x30>
 2c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c7:	90                   	nop
 2c8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2cc:	83 c0 01             	add    $0x1,%eax
 2cf:	84 d2                	test   %dl,%dl
 2d1:	74 0d                	je     2e0 <strchr+0x30>
    if(*s == c)
 2d3:	38 d1                	cmp    %dl,%cl
 2d5:	75 f1                	jne    2c8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2d7:	5d                   	pop    %ebp
 2d8:	c3                   	ret    
 2d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2e0:	31 c0                	xor    %eax,%eax
}
 2e2:	5d                   	pop    %ebp
 2e3:	c3                   	ret    
 2e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ef:	90                   	nop

000002f0 <gets>:

char*
gets(char *buf, int max)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2f5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2f8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2f9:	31 db                	xor    %ebx,%ebx
{
 2fb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2fe:	eb 27                	jmp    327 <gets+0x37>
    cc = read(0, &c, 1);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	6a 01                	push   $0x1
 305:	57                   	push   %edi
 306:	6a 00                	push   $0x0
 308:	e8 2e 01 00 00       	call   43b <read>
    if(cc < 1)
 30d:	83 c4 10             	add    $0x10,%esp
 310:	85 c0                	test   %eax,%eax
 312:	7e 1d                	jle    331 <gets+0x41>
      break;
    buf[i++] = c;
 314:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 318:	8b 55 08             	mov    0x8(%ebp),%edx
 31b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 31f:	3c 0a                	cmp    $0xa,%al
 321:	74 1d                	je     340 <gets+0x50>
 323:	3c 0d                	cmp    $0xd,%al
 325:	74 19                	je     340 <gets+0x50>
  for(i=0; i+1 < max; ){
 327:	89 de                	mov    %ebx,%esi
 329:	83 c3 01             	add    $0x1,%ebx
 32c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 32f:	7c cf                	jl     300 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 331:	8b 45 08             	mov    0x8(%ebp),%eax
 334:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 338:	8d 65 f4             	lea    -0xc(%ebp),%esp
 33b:	5b                   	pop    %ebx
 33c:	5e                   	pop    %esi
 33d:	5f                   	pop    %edi
 33e:	5d                   	pop    %ebp
 33f:	c3                   	ret    
  buf[i] = '\0';
 340:	8b 45 08             	mov    0x8(%ebp),%eax
 343:	89 de                	mov    %ebx,%esi
 345:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 349:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34c:	5b                   	pop    %ebx
 34d:	5e                   	pop    %esi
 34e:	5f                   	pop    %edi
 34f:	5d                   	pop    %ebp
 350:	c3                   	ret    
 351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 358:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <stat>:

int
stat(const char *n, struct stat *st)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 365:	83 ec 08             	sub    $0x8,%esp
 368:	6a 00                	push   $0x0
 36a:	ff 75 08             	push   0x8(%ebp)
 36d:	e8 f1 00 00 00       	call   463 <open>
  if(fd < 0)
 372:	83 c4 10             	add    $0x10,%esp
 375:	85 c0                	test   %eax,%eax
 377:	78 27                	js     3a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 379:	83 ec 08             	sub    $0x8,%esp
 37c:	ff 75 0c             	push   0xc(%ebp)
 37f:	89 c3                	mov    %eax,%ebx
 381:	50                   	push   %eax
 382:	e8 f4 00 00 00       	call   47b <fstat>
  close(fd);
 387:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 38a:	89 c6                	mov    %eax,%esi
  close(fd);
 38c:	e8 ba 00 00 00       	call   44b <close>
  return r;
 391:	83 c4 10             	add    $0x10,%esp
}
 394:	8d 65 f8             	lea    -0x8(%ebp),%esp
 397:	89 f0                	mov    %esi,%eax
 399:	5b                   	pop    %ebx
 39a:	5e                   	pop    %esi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    
 39d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3a5:	eb ed                	jmp    394 <stat+0x34>
 3a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ae:	66 90                	xchg   %ax,%ax

000003b0 <atoi>:

int
atoi(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b7:	0f be 02             	movsbl (%edx),%eax
 3ba:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3bd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3c0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3c5:	77 1e                	ja     3e5 <atoi+0x35>
 3c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ce:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3d0:	83 c2 01             	add    $0x1,%edx
 3d3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3d6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3da:	0f be 02             	movsbl (%edx),%eax
 3dd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3e0:	80 fb 09             	cmp    $0x9,%bl
 3e3:	76 eb                	jbe    3d0 <atoi+0x20>
  return n;
}
 3e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e8:	89 c8                	mov    %ecx,%eax
 3ea:	c9                   	leave  
 3eb:	c3                   	ret    
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	8b 45 10             	mov    0x10(%ebp),%eax
 3f7:	8b 55 08             	mov    0x8(%ebp),%edx
 3fa:	56                   	push   %esi
 3fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3fe:	85 c0                	test   %eax,%eax
 400:	7e 13                	jle    415 <memmove+0x25>
 402:	01 d0                	add    %edx,%eax
  dst = vdst;
 404:	89 d7                	mov    %edx,%edi
 406:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 410:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 411:	39 f8                	cmp    %edi,%eax
 413:	75 fb                	jne    410 <memmove+0x20>
  return vdst;
}
 415:	5e                   	pop    %esi
 416:	89 d0                	mov    %edx,%eax
 418:	5f                   	pop    %edi
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    

0000041b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 41b:	b8 01 00 00 00       	mov    $0x1,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <exit>:
SYSCALL(exit)
 423:	b8 02 00 00 00       	mov    $0x2,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <wait>:
SYSCALL(wait)
 42b:	b8 03 00 00 00       	mov    $0x3,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <pipe>:
SYSCALL(pipe)
 433:	b8 04 00 00 00       	mov    $0x4,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <read>:
SYSCALL(read)
 43b:	b8 05 00 00 00       	mov    $0x5,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <write>:
SYSCALL(write)
 443:	b8 10 00 00 00       	mov    $0x10,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <close>:
SYSCALL(close)
 44b:	b8 15 00 00 00       	mov    $0x15,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <kill>:
SYSCALL(kill)
 453:	b8 06 00 00 00       	mov    $0x6,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <exec>:
SYSCALL(exec)
 45b:	b8 07 00 00 00       	mov    $0x7,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <open>:
SYSCALL(open)
 463:	b8 0f 00 00 00       	mov    $0xf,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <mknod>:
SYSCALL(mknod)
 46b:	b8 11 00 00 00       	mov    $0x11,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <unlink>:
SYSCALL(unlink)
 473:	b8 12 00 00 00       	mov    $0x12,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <fstat>:
SYSCALL(fstat)
 47b:	b8 08 00 00 00       	mov    $0x8,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <link>:
SYSCALL(link)
 483:	b8 13 00 00 00       	mov    $0x13,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <mkdir>:
SYSCALL(mkdir)
 48b:	b8 14 00 00 00       	mov    $0x14,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <chdir>:
SYSCALL(chdir)
 493:	b8 09 00 00 00       	mov    $0x9,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <dup>:
SYSCALL(dup)
 49b:	b8 0a 00 00 00       	mov    $0xa,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <getpid>:
SYSCALL(getpid)
 4a3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <sbrk>:
SYSCALL(sbrk)
 4ab:	b8 0c 00 00 00       	mov    $0xc,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <sleep>:
SYSCALL(sleep)
 4b3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <uptime>:
SYSCALL(uptime)
 4bb:	b8 0e 00 00 00       	mov    $0xe,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <printhugepde>:
SYSCALL(printhugepde)
 4c3:	b8 16 00 00 00       	mov    $0x16,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 4cb:	b8 17 00 00 00       	mov    $0x17,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <setthp>:
SYSCALL(setthp)
 4d3:	b8 18 00 00 00       	mov    $0x18,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <getthp>:
 4db:	b8 19 00 00 00       	mov    $0x19,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    
 4e3:	66 90                	xchg   %ax,%ax
 4e5:	66 90                	xchg   %ax,%ax
 4e7:	66 90                	xchg   %ax,%ax
 4e9:	66 90                	xchg   %ax,%ax
 4eb:	66 90                	xchg   %ax,%ax
 4ed:	66 90                	xchg   %ax,%ax
 4ef:	90                   	nop

000004f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 3c             	sub    $0x3c,%esp
 4f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4fc:	89 d1                	mov    %edx,%ecx
{
 4fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 501:	85 d2                	test   %edx,%edx
 503:	0f 89 7f 00 00 00    	jns    588 <printint+0x98>
 509:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 50d:	74 79                	je     588 <printint+0x98>
    neg = 1;
 50f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 516:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 518:	31 db                	xor    %ebx,%ebx
 51a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 51d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 520:	89 c8                	mov    %ecx,%eax
 522:	31 d2                	xor    %edx,%edx
 524:	89 cf                	mov    %ecx,%edi
 526:	f7 75 c4             	divl   -0x3c(%ebp)
 529:	0f b6 92 3c 0a 00 00 	movzbl 0xa3c(%edx),%edx
 530:	89 45 c0             	mov    %eax,-0x40(%ebp)
 533:	89 d8                	mov    %ebx,%eax
 535:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 538:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 53b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 53e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 541:	76 dd                	jbe    520 <printint+0x30>
  if(neg)
 543:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 546:	85 c9                	test   %ecx,%ecx
 548:	74 0c                	je     556 <printint+0x66>
    buf[i++] = '-';
 54a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 54f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 551:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 556:	8b 7d b8             	mov    -0x48(%ebp),%edi
 559:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 55d:	eb 07                	jmp    566 <printint+0x76>
 55f:	90                   	nop
    putc(fd, buf[i]);
 560:	0f b6 13             	movzbl (%ebx),%edx
 563:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 566:	83 ec 04             	sub    $0x4,%esp
 569:	88 55 d7             	mov    %dl,-0x29(%ebp)
 56c:	6a 01                	push   $0x1
 56e:	56                   	push   %esi
 56f:	57                   	push   %edi
 570:	e8 ce fe ff ff       	call   443 <write>
  while(--i >= 0)
 575:	83 c4 10             	add    $0x10,%esp
 578:	39 de                	cmp    %ebx,%esi
 57a:	75 e4                	jne    560 <printint+0x70>
}
 57c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57f:	5b                   	pop    %ebx
 580:	5e                   	pop    %esi
 581:	5f                   	pop    %edi
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 588:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 58f:	eb 87                	jmp    518 <printint+0x28>
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5af:	0f b6 13             	movzbl (%ebx),%edx
 5b2:	84 d2                	test   %dl,%dl
 5b4:	74 6a                	je     620 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5b6:	8d 45 10             	lea    0x10(%ebp),%eax
 5b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5bf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5c4:	eb 36                	jmp    5fc <printf+0x5c>
 5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
 5d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5d3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5d8:	83 f8 25             	cmp    $0x25,%eax
 5db:	74 15                	je     5f2 <printf+0x52>
  write(fd, &c, 1);
 5dd:	83 ec 04             	sub    $0x4,%esp
 5e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5e3:	6a 01                	push   $0x1
 5e5:	57                   	push   %edi
 5e6:	56                   	push   %esi
 5e7:	e8 57 fe ff ff       	call   443 <write>
 5ec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5ef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5f2:	0f b6 13             	movzbl (%ebx),%edx
 5f5:	83 c3 01             	add    $0x1,%ebx
 5f8:	84 d2                	test   %dl,%dl
 5fa:	74 24                	je     620 <printf+0x80>
    c = fmt[i] & 0xff;
 5fc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5ff:	85 c9                	test   %ecx,%ecx
 601:	74 cd                	je     5d0 <printf+0x30>
      }
    } else if(state == '%'){
 603:	83 f9 25             	cmp    $0x25,%ecx
 606:	75 ea                	jne    5f2 <printf+0x52>
      if(c == 'd'){
 608:	83 f8 25             	cmp    $0x25,%eax
 60b:	0f 84 07 01 00 00    	je     718 <printf+0x178>
 611:	83 e8 63             	sub    $0x63,%eax
 614:	83 f8 15             	cmp    $0x15,%eax
 617:	77 17                	ja     630 <printf+0x90>
 619:	ff 24 85 e4 09 00 00 	jmp    *0x9e4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 620:	8d 65 f4             	lea    -0xc(%ebp),%esp
 623:	5b                   	pop    %ebx
 624:	5e                   	pop    %esi
 625:	5f                   	pop    %edi
 626:	5d                   	pop    %ebp
 627:	c3                   	ret    
 628:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop
  write(fd, &c, 1);
 630:	83 ec 04             	sub    $0x4,%esp
 633:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 636:	6a 01                	push   $0x1
 638:	57                   	push   %edi
 639:	56                   	push   %esi
 63a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 63e:	e8 00 fe ff ff       	call   443 <write>
        putc(fd, c);
 643:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 647:	83 c4 0c             	add    $0xc,%esp
 64a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 64d:	6a 01                	push   $0x1
 64f:	57                   	push   %edi
 650:	56                   	push   %esi
 651:	e8 ed fd ff ff       	call   443 <write>
        putc(fd, c);
 656:	83 c4 10             	add    $0x10,%esp
      state = 0;
 659:	31 c9                	xor    %ecx,%ecx
 65b:	eb 95                	jmp    5f2 <printf+0x52>
 65d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	b9 10 00 00 00       	mov    $0x10,%ecx
 668:	6a 00                	push   $0x0
 66a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 66d:	8b 10                	mov    (%eax),%edx
 66f:	89 f0                	mov    %esi,%eax
 671:	e8 7a fe ff ff       	call   4f0 <printint>
        ap++;
 676:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 67a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67d:	31 c9                	xor    %ecx,%ecx
 67f:	e9 6e ff ff ff       	jmp    5f2 <printf+0x52>
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 688:	8b 45 d0             	mov    -0x30(%ebp),%eax
 68b:	8b 10                	mov    (%eax),%edx
        ap++;
 68d:	83 c0 04             	add    $0x4,%eax
 690:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 693:	85 d2                	test   %edx,%edx
 695:	0f 84 8d 00 00 00    	je     728 <printf+0x188>
        while(*s != 0){
 69b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 69e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6a0:	84 c0                	test   %al,%al
 6a2:	0f 84 4a ff ff ff    	je     5f2 <printf+0x52>
 6a8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6ab:	89 d3                	mov    %edx,%ebx
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6b3:	83 c3 01             	add    $0x1,%ebx
 6b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6b9:	6a 01                	push   $0x1
 6bb:	57                   	push   %edi
 6bc:	56                   	push   %esi
 6bd:	e8 81 fd ff ff       	call   443 <write>
        while(*s != 0){
 6c2:	0f b6 03             	movzbl (%ebx),%eax
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	84 c0                	test   %al,%al
 6ca:	75 e4                	jne    6b0 <printf+0x110>
      state = 0;
 6cc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6cf:	31 c9                	xor    %ecx,%ecx
 6d1:	e9 1c ff ff ff       	jmp    5f2 <printf+0x52>
 6d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e8:	6a 01                	push   $0x1
 6ea:	e9 7b ff ff ff       	jmp    66a <printf+0xca>
 6ef:	90                   	nop
        putc(fd, *ap);
 6f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 6f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6f6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6f8:	6a 01                	push   $0x1
 6fa:	57                   	push   %edi
 6fb:	56                   	push   %esi
        putc(fd, *ap);
 6fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6ff:	e8 3f fd ff ff       	call   443 <write>
        ap++;
 704:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 708:	83 c4 10             	add    $0x10,%esp
      state = 0;
 70b:	31 c9                	xor    %ecx,%ecx
 70d:	e9 e0 fe ff ff       	jmp    5f2 <printf+0x52>
 712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 718:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 71b:	83 ec 04             	sub    $0x4,%esp
 71e:	e9 2a ff ff ff       	jmp    64d <printf+0xad>
 723:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 727:	90                   	nop
          s = "(null)";
 728:	ba db 09 00 00       	mov    $0x9db,%edx
        while(*s != 0){
 72d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 730:	b8 28 00 00 00       	mov    $0x28,%eax
 735:	89 d3                	mov    %edx,%ebx
 737:	e9 74 ff ff ff       	jmp    6b0 <printf+0x110>
 73c:	66 90                	xchg   %ax,%ax
 73e:	66 90                	xchg   %ax,%ax

00000740 <vfree>:
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	83 ec 04             	sub    $0x4,%esp
 749:	8b 5d 08             	mov    0x8(%ebp),%ebx
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
 74c:	8b 45 0c             	mov    0xc(%ebp),%eax
    bp = ((Header*)ap) - 1;
 74f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    if (use_huge_pages) {
 752:	85 c0                	test   %eax,%eax
 754:	0f 84 96 00 00 00    	je     7f0 <vfree+0xb0>
        freepptr = &huge_freep;
 75a:	a1 a0 0f 00 00       	mov    0xfa0,%eax
 75f:	bf a0 0f 00 00       	mov    $0xfa0,%edi
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 768:	89 c2                	mov    %eax,%edx
 76a:	8b 00                	mov    (%eax),%eax
 76c:	39 ca                	cmp    %ecx,%edx
 76e:	73 38                	jae    7a8 <vfree+0x68>
 770:	39 c1                	cmp    %eax,%ecx
 772:	72 04                	jb     778 <vfree+0x38>
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 774:	39 c2                	cmp    %eax,%edx
 776:	72 f0                	jb     768 <vfree+0x28>
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
 778:	8b 73 fc             	mov    -0x4(%ebx),%esi
 77b:	89 7d f0             	mov    %edi,-0x10(%ebp)
 77e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 781:	39 f8                	cmp    %edi,%eax
 783:	74 38                	je     7bd <vfree+0x7d>
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
 785:	89 43 f8             	mov    %eax,-0x8(%ebx)
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
 788:	8b 42 04             	mov    0x4(%edx),%eax
 78b:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 78e:	39 f1                	cmp    %esi,%ecx
 790:	74 42                	je     7d4 <vfree+0x94>
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
 792:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 795:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 797:	89 10                	mov    %edx,(%eax)
}
 799:	83 c4 04             	add    $0x4,%esp
 79c:	5b                   	pop    %ebx
 79d:	5e                   	pop    %esi
 79e:	5f                   	pop    %edi
 79f:	5d                   	pop    %ebp
 7a0:	c3                   	ret    
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 7a8:	39 c2                	cmp    %eax,%edx
 7aa:	72 bc                	jb     768 <vfree+0x28>
 7ac:	39 c1                	cmp    %eax,%ecx
 7ae:	73 b8                	jae    768 <vfree+0x28>
    if (bp + bp->s.size == p->s.ptr) {
 7b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b3:	89 7d f0             	mov    %edi,-0x10(%ebp)
 7b6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7b9:	39 f8                	cmp    %edi,%eax
 7bb:	75 c8                	jne    785 <vfree+0x45>
        bp->s.size += p->s.ptr->s.size;
 7bd:	03 70 04             	add    0x4(%eax),%esi
 7c0:	89 73 fc             	mov    %esi,-0x4(%ebx)
        bp->s.ptr = p->s.ptr->s.ptr;
 7c3:	8b 02                	mov    (%edx),%eax
 7c5:	8b 00                	mov    (%eax),%eax
 7c7:	89 43 f8             	mov    %eax,-0x8(%ebx)
    if (p + p->s.size == bp) {
 7ca:	8b 42 04             	mov    0x4(%edx),%eax
 7cd:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7d0:	39 f1                	cmp    %esi,%ecx
 7d2:	75 be                	jne    792 <vfree+0x52>
        p->s.size += bp->s.size;
 7d4:	03 43 fc             	add    -0x4(%ebx),%eax
 7d7:	89 42 04             	mov    %eax,0x4(%edx)
    *freepptr = p;
 7da:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 7dd:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7e0:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 7e2:	89 10                	mov    %edx,(%eax)
}
 7e4:	83 c4 04             	add    $0x4,%esp
 7e7:	5b                   	pop    %ebx
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret    
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        freepptr = &freep;
 7f0:	a1 ac 0f 00 00       	mov    0xfac,%eax
 7f5:	bf ac 0f 00 00       	mov    $0xfac,%edi
    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 7fa:	e9 69 ff ff ff       	jmp    768 <vfree+0x28>
 7ff:	90                   	nop

00000800 <vmalloc>:
void* vmalloc(uint nbytes, int use_huge_pages) {
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 1c             	sub    $0x1c,%esp
 809:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (use_huge_pages) {
 80c:	85 db                	test   %ebx,%ebx
 80e:	0f 84 0c 01 00 00    	je     920 <vmalloc+0x120>
        if ((prevp = huge_freep) == 0) {
 814:	8b 15 a0 0f 00 00    	mov    0xfa0,%edx
 81a:	85 d2                	test   %edx,%edx
 81c:	0f 84 de f7 ff ff    	je     0 <vmalloc.cold>
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 822:	8b 45 08             	mov    0x8(%ebp),%eax
 825:	8d 78 07             	lea    0x7(%eax),%edi
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 828:	8b 02                	mov    (%edx),%eax
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 82a:	c1 ef 03             	shr    $0x3,%edi
        if (p->s.size >= nunits) {
 82d:	8b 48 04             	mov    0x4(%eax),%ecx
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 830:	83 c7 01             	add    $0x1,%edi
        if (p->s.size >= nunits) {
 833:	39 f9                	cmp    %edi,%ecx
 835:	0f 83 c5 00 00 00    	jae    900 <vmalloc+0x100>
 83b:	be 00 10 00 00       	mov    $0x1000,%esi
 840:	ba 00 00 40 00       	mov    $0x400000,%edx
 845:	39 f7                	cmp    %esi,%edi
 847:	0f 43 f7             	cmovae %edi,%esi
 84a:	39 d7                	cmp    %edx,%edi
 84c:	0f 43 d7             	cmovae %edi,%edx
  p = sbrk(nu * sizeof(Header));
 84f:	8d 0c f5 00 00 00 00 	lea    0x0(,%esi,8),%ecx
 856:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 859:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
 860:	89 55 dc             	mov    %edx,-0x24(%ebp)
 863:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 866:	eb 15                	jmp    87d <vmalloc+0x7d>
 868:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 86f:	90                   	nop
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 870:	8b 02                	mov    (%edx),%eax
        if (p->s.size >= nunits) {
 872:	8b 48 04             	mov    0x4(%eax),%ecx
 875:	39 f9                	cmp    %edi,%ecx
 877:	0f 83 83 00 00 00    	jae    900 <vmalloc+0x100>
        if (p == freep) {
 87d:	89 c2                	mov    %eax,%edx
 87f:	39 05 ac 0f 00 00    	cmp    %eax,0xfac
 885:	75 e9                	jne    870 <vmalloc+0x70>
  if(use_huge_pages){
 887:	85 db                	test   %ebx,%ebx
 889:	74 45                	je     8d0 <vmalloc+0xd0>
  p = sbrk(nu * sizeof(Header));
 88b:	83 ec 0c             	sub    $0xc,%esp
 88e:	ff 75 e0             	push   -0x20(%ebp)
 891:	e8 15 fc ff ff       	call   4ab <sbrk>
  if(p == (char*)-1)
 896:	83 c4 10             	add    $0x10,%esp
 899:	83 f8 ff             	cmp    $0xffffffff,%eax
 89c:	74 20                	je     8be <vmalloc+0xbe>
  hp->s.size = nu;
 89e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  vfree((void*)(hp + 1), use_huge_pages);
 8a1:	83 ec 08             	sub    $0x8,%esp
 8a4:	83 c0 08             	add    $0x8,%eax
  hp->s.size = nu;
 8a7:	89 48 fc             	mov    %ecx,-0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 8aa:	53                   	push   %ebx
 8ab:	50                   	push   %eax
 8ac:	e8 8f fe ff ff       	call   740 <vfree>
  return use_huge_pages ? huge_freep : freep;
 8b1:	8b 15 a0 0f 00 00    	mov    0xfa0,%edx
 8b7:	83 c4 10             	add    $0x10,%esp
            if (p == 0) {
 8ba:	85 d2                	test   %edx,%edx
 8bc:	75 b2                	jne    870 <vmalloc+0x70>
}
 8be:	8d 65 f4             	lea    -0xc(%ebp),%esp
                return 0;
 8c1:	31 c0                	xor    %eax,%eax
}
 8c3:	5b                   	pop    %ebx
 8c4:	5e                   	pop    %esi
 8c5:	5f                   	pop    %edi
 8c6:	5d                   	pop    %ebp
 8c7:	c3                   	ret    
 8c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8cf:	90                   	nop
  p = sbrk(nu * sizeof(Header));
 8d0:	83 ec 0c             	sub    $0xc,%esp
 8d3:	ff 75 e4             	push   -0x1c(%ebp)
 8d6:	e8 d0 fb ff ff       	call   4ab <sbrk>
  if(p == (char*)-1)
 8db:	83 c4 10             	add    $0x10,%esp
 8de:	83 f8 ff             	cmp    $0xffffffff,%eax
 8e1:	74 db                	je     8be <vmalloc+0xbe>
  hp->s.size = nu;
 8e3:	89 70 04             	mov    %esi,0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 8e6:	83 ec 08             	sub    $0x8,%esp
 8e9:	83 c0 08             	add    $0x8,%eax
 8ec:	6a 00                	push   $0x0
 8ee:	50                   	push   %eax
 8ef:	e8 4c fe ff ff       	call   740 <vfree>
  return use_huge_pages ? huge_freep : freep;
 8f4:	8b 15 ac 0f 00 00    	mov    0xfac,%edx
 8fa:	83 c4 10             	add    $0x10,%esp
 8fd:	eb bb                	jmp    8ba <vmalloc+0xba>
 8ff:	90                   	nop
            if (p->s.size == nunits) {
 900:	39 cf                	cmp    %ecx,%edi
 902:	74 34                	je     938 <vmalloc+0x138>
                p->s.size -= nunits;
 904:	29 f9                	sub    %edi,%ecx
 906:	89 48 04             	mov    %ecx,0x4(%eax)
                p += p->s.size;
 909:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
                p->s.size = nunits;
 90c:	89 78 04             	mov    %edi,0x4(%eax)
            freep = prevp;
 90f:	89 15 ac 0f 00 00    	mov    %edx,0xfac
}
 915:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return (void*)(p + 1);
 918:	83 c0 08             	add    $0x8,%eax
}
 91b:	5b                   	pop    %ebx
 91c:	5e                   	pop    %esi
 91d:	5f                   	pop    %edi
 91e:	5d                   	pop    %ebp
 91f:	c3                   	ret    
        if ((prevp = freep) == 0) {
 920:	8b 15 ac 0f 00 00    	mov    0xfac,%edx
 926:	85 d2                	test   %edx,%edx
 928:	0f 85 f4 fe ff ff    	jne    822 <vmalloc+0x22>
 92e:	e9 f2 f6 ff ff       	jmp    25 <vmalloc.cold+0x25>
 933:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 937:	90                   	nop
                prevp->s.ptr = p->s.ptr;
 938:	8b 08                	mov    (%eax),%ecx
 93a:	89 0a                	mov    %ecx,(%edx)
 93c:	eb d1                	jmp    90f <vmalloc+0x10f>
 93e:	66 90                	xchg   %ax,%ax

00000940 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	53                   	push   %ebx
 944:	83 ec 04             	sub    $0x4,%esp
 947:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 94a:	e8 8c fb ff ff       	call   4db <getthp>


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
 94f:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 955:	76 19                	jbe    970 <malloc+0x30>
 957:	85 c0                	test   %eax,%eax
 959:	74 15                	je     970 <malloc+0x30>
    return vmalloc(nbytes, 1); // use the huge pages
 95b:	83 ec 08             	sub    $0x8,%esp
 95e:	6a 01                	push   $0x1
 960:	53                   	push   %ebx
 961:	e8 9a fe ff ff       	call   800 <vmalloc>
  }
  else{
    return vmalloc(nbytes, 0);
  }
}
 966:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 1); // use the huge pages
 969:	83 c4 10             	add    $0x10,%esp
}
 96c:	c9                   	leave  
 96d:	c3                   	ret    
 96e:	66 90                	xchg   %ax,%ax
    return vmalloc(nbytes, 0);
 970:	83 ec 08             	sub    $0x8,%esp
 973:	6a 00                	push   $0x0
 975:	53                   	push   %ebx
 976:	e8 85 fe ff ff       	call   800 <vmalloc>
}
 97b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 0);
 97e:	83 c4 10             	add    $0x10,%esp
}
 981:	c9                   	leave  
 982:	c3                   	ret    
 983:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000990 <free>:

void free(void * ap){
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
  vfree(ap, 0);
 993:	6a 00                	push   $0x0
 995:	ff 75 08             	push   0x8(%ebp)
 998:	e8 a3 fd ff ff       	call   740 <vfree>
}
 99d:	58                   	pop    %eax
 99e:	5a                   	pop    %edx
 99f:	c9                   	leave  
 9a0:	c3                   	ret    
