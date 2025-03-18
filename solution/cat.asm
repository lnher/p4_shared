
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <vmalloc.cold>:

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
   0:	c7 05 20 0f 00 00 24 	movl   $0xf24,0xf20
   7:	0f 00 00 
   a:	c7 05 24 0f 00 00 24 	movl   $0xf24,0xf24
  11:	0f 00 00 
            huge_base.s.size = 0;
  14:	c7 05 28 0f 00 00 00 	movl   $0x0,0xf28
  1b:	00 00 00 
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
  1e:	a1 00 00 00 00       	mov    0x0,%eax
  23:	0f 0b                	ud2    
            base.s.ptr = freep = &base;
  25:	c7 05 2c 0f 00 00 30 	movl   $0xf30,0xf2c
  2c:	0f 00 00 
  2f:	c7 05 30 0f 00 00 30 	movl   $0xf30,0xf30
  36:	0f 00 00 
            base.s.size = 0;
  39:	c7 05 34 0f 00 00 00 	movl   $0x0,0xf34
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
  77:	7e 54                	jle    cd <main+0x7d>
  79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  80:	83 ec 08             	sub    $0x8,%esp
  83:	6a 00                	push   $0x0
  85:	ff 33                	push   (%ebx)
  87:	e8 67 03 00 00       	call   3f3 <open>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	89 c7                	mov    %eax,%edi
  91:	85 c0                	test   %eax,%eax
  93:	78 24                	js     b9 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  95:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  98:	83 c6 01             	add    $0x1,%esi
  9b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  9e:	50                   	push   %eax
  9f:	e8 3c 00 00 00       	call   e0 <cat>
    close(fd);
  a4:	89 3c 24             	mov    %edi,(%esp)
  a7:	e8 2f 03 00 00       	call   3db <close>
  for(i = 1; i < argc; i++){
  ac:	83 c4 10             	add    $0x10,%esp
  af:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  b2:	75 cc                	jne    80 <main+0x30>
  }
  exit();
  b4:	e8 fa 02 00 00       	call   3b3 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  b9:	50                   	push   %eax
  ba:	ff 33                	push   (%ebx)
  bc:	68 57 09 00 00       	push   $0x957
  c1:	6a 01                	push   $0x1
  c3:	e8 68 04 00 00       	call   530 <printf>
      exit();
  c8:	e8 e6 02 00 00       	call   3b3 <exit>
    cat(0);
  cd:	83 ec 0c             	sub    $0xc,%esp
  d0:	6a 00                	push   $0x0
  d2:	e8 09 00 00 00       	call   e0 <cat>
    exit();
  d7:	e8 d7 02 00 00       	call   3b3 <exit>
  dc:	66 90                	xchg   %ax,%ax
  de:	66 90                	xchg   %ax,%ax

000000e0 <cat>:
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	56                   	push   %esi
  e4:	8b 75 08             	mov    0x8(%ebp),%esi
  e7:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  e8:	eb 1d                	jmp    107 <cat+0x27>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  f0:	83 ec 04             	sub    $0x4,%esp
  f3:	53                   	push   %ebx
  f4:	68 20 0d 00 00       	push   $0xd20
  f9:	6a 01                	push   $0x1
  fb:	e8 d3 02 00 00       	call   3d3 <write>
 100:	83 c4 10             	add    $0x10,%esp
 103:	39 d8                	cmp    %ebx,%eax
 105:	75 25                	jne    12c <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
 107:	83 ec 04             	sub    $0x4,%esp
 10a:	68 00 02 00 00       	push   $0x200
 10f:	68 20 0d 00 00       	push   $0xd20
 114:	56                   	push   %esi
 115:	e8 b1 02 00 00       	call   3cb <read>
 11a:	83 c4 10             	add    $0x10,%esp
 11d:	89 c3                	mov    %eax,%ebx
 11f:	85 c0                	test   %eax,%eax
 121:	7f cd                	jg     f0 <cat+0x10>
  if(n < 0){
 123:	75 1b                	jne    140 <cat+0x60>
}
 125:	8d 65 f8             	lea    -0x8(%ebp),%esp
 128:	5b                   	pop    %ebx
 129:	5e                   	pop    %esi
 12a:	5d                   	pop    %ebp
 12b:	c3                   	ret    
      printf(1, "cat: write error\n");
 12c:	83 ec 08             	sub    $0x8,%esp
 12f:	68 34 09 00 00       	push   $0x934
 134:	6a 01                	push   $0x1
 136:	e8 f5 03 00 00       	call   530 <printf>
      exit();
 13b:	e8 73 02 00 00       	call   3b3 <exit>
    printf(1, "cat: read error\n");
 140:	50                   	push   %eax
 141:	50                   	push   %eax
 142:	68 46 09 00 00       	push   $0x946
 147:	6a 01                	push   $0x1
 149:	e8 e2 03 00 00       	call   530 <printf>
    exit();
 14e:	e8 60 02 00 00       	call   3b3 <exit>
 153:	66 90                	xchg   %ax,%ax
 155:	66 90                	xchg   %ax,%ax
 157:	66 90                	xchg   %ax,%ax
 159:	66 90                	xchg   %ax,%ax
 15b:	66 90                	xchg   %ax,%ax
 15d:	66 90                	xchg   %ax,%ax
 15f:	90                   	nop

00000160 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 161:	31 c0                	xor    %eax,%eax
{
 163:	89 e5                	mov    %esp,%ebp
 165:	53                   	push   %ebx
 166:	8b 4d 08             	mov    0x8(%ebp),%ecx
 169:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 170:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 174:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 177:	83 c0 01             	add    $0x1,%eax
 17a:	84 d2                	test   %dl,%dl
 17c:	75 f2                	jne    170 <strcpy+0x10>
    ;
  return os;
}
 17e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 181:	89 c8                	mov    %ecx,%eax
 183:	c9                   	leave  
 184:	c3                   	ret    
 185:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	8b 55 08             	mov    0x8(%ebp),%edx
 197:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 19a:	0f b6 02             	movzbl (%edx),%eax
 19d:	84 c0                	test   %al,%al
 19f:	75 17                	jne    1b8 <strcmp+0x28>
 1a1:	eb 3a                	jmp    1dd <strcmp+0x4d>
 1a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a7:	90                   	nop
 1a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1ac:	83 c2 01             	add    $0x1,%edx
 1af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1b2:	84 c0                	test   %al,%al
 1b4:	74 1a                	je     1d0 <strcmp+0x40>
    p++, q++;
 1b6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 1b8:	0f b6 19             	movzbl (%ecx),%ebx
 1bb:	38 c3                	cmp    %al,%bl
 1bd:	74 e9                	je     1a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1bf:	29 d8                	sub    %ebx,%eax
}
 1c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c4:	c9                   	leave  
 1c5:	c3                   	ret    
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1d4:	31 c0                	xor    %eax,%eax
 1d6:	29 d8                	sub    %ebx,%eax
}
 1d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1db:	c9                   	leave  
 1dc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1dd:	0f b6 19             	movzbl (%ecx),%ebx
 1e0:	31 c0                	xor    %eax,%eax
 1e2:	eb db                	jmp    1bf <strcmp+0x2f>
 1e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <strlen>:

uint
strlen(const char *s)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1f6:	80 3a 00             	cmpb   $0x0,(%edx)
 1f9:	74 15                	je     210 <strlen+0x20>
 1fb:	31 c0                	xor    %eax,%eax
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
 200:	83 c0 01             	add    $0x1,%eax
 203:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 207:	89 c1                	mov    %eax,%ecx
 209:	75 f5                	jne    200 <strlen+0x10>
    ;
  return n;
}
 20b:	89 c8                	mov    %ecx,%eax
 20d:	5d                   	pop    %ebp
 20e:	c3                   	ret    
 20f:	90                   	nop
  for(n = 0; s[n]; n++)
 210:	31 c9                	xor    %ecx,%ecx
}
 212:	5d                   	pop    %ebp
 213:	89 c8                	mov    %ecx,%eax
 215:	c3                   	ret    
 216:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21d:	8d 76 00             	lea    0x0(%esi),%esi

00000220 <memset>:

void*
memset(void *dst, int c, uint n)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 227:	8b 4d 10             	mov    0x10(%ebp),%ecx
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 d7                	mov    %edx,%edi
 22f:	fc                   	cld    
 230:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 232:	8b 7d fc             	mov    -0x4(%ebp),%edi
 235:	89 d0                	mov    %edx,%eax
 237:	c9                   	leave  
 238:	c3                   	ret    
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000240 <strchr>:

char*
strchr(const char *s, char c)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 45 08             	mov    0x8(%ebp),%eax
 246:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 24a:	0f b6 10             	movzbl (%eax),%edx
 24d:	84 d2                	test   %dl,%dl
 24f:	75 12                	jne    263 <strchr+0x23>
 251:	eb 1d                	jmp    270 <strchr+0x30>
 253:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 257:	90                   	nop
 258:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 25c:	83 c0 01             	add    $0x1,%eax
 25f:	84 d2                	test   %dl,%dl
 261:	74 0d                	je     270 <strchr+0x30>
    if(*s == c)
 263:	38 d1                	cmp    %dl,%cl
 265:	75 f1                	jne    258 <strchr+0x18>
      return (char*)s;
  return 0;
}
 267:	5d                   	pop    %ebp
 268:	c3                   	ret    
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 270:	31 c0                	xor    %eax,%eax
}
 272:	5d                   	pop    %ebp
 273:	c3                   	ret    
 274:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <gets>:

char*
gets(char *buf, int max)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 285:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 288:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 289:	31 db                	xor    %ebx,%ebx
{
 28b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 28e:	eb 27                	jmp    2b7 <gets+0x37>
    cc = read(0, &c, 1);
 290:	83 ec 04             	sub    $0x4,%esp
 293:	6a 01                	push   $0x1
 295:	57                   	push   %edi
 296:	6a 00                	push   $0x0
 298:	e8 2e 01 00 00       	call   3cb <read>
    if(cc < 1)
 29d:	83 c4 10             	add    $0x10,%esp
 2a0:	85 c0                	test   %eax,%eax
 2a2:	7e 1d                	jle    2c1 <gets+0x41>
      break;
    buf[i++] = c;
 2a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2a8:	8b 55 08             	mov    0x8(%ebp),%edx
 2ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2af:	3c 0a                	cmp    $0xa,%al
 2b1:	74 1d                	je     2d0 <gets+0x50>
 2b3:	3c 0d                	cmp    $0xd,%al
 2b5:	74 19                	je     2d0 <gets+0x50>
  for(i=0; i+1 < max; ){
 2b7:	89 de                	mov    %ebx,%esi
 2b9:	83 c3 01             	add    $0x1,%ebx
 2bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2bf:	7c cf                	jl     290 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2c1:	8b 45 08             	mov    0x8(%ebp),%eax
 2c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2cb:	5b                   	pop    %ebx
 2cc:	5e                   	pop    %esi
 2cd:	5f                   	pop    %edi
 2ce:	5d                   	pop    %ebp
 2cf:	c3                   	ret    
  buf[i] = '\0';
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
 2d3:	89 de                	mov    %ebx,%esi
 2d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2dc:	5b                   	pop    %ebx
 2dd:	5e                   	pop    %esi
 2de:	5f                   	pop    %edi
 2df:	5d                   	pop    %ebp
 2e0:	c3                   	ret    
 2e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ef:	90                   	nop

000002f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f5:	83 ec 08             	sub    $0x8,%esp
 2f8:	6a 00                	push   $0x0
 2fa:	ff 75 08             	push   0x8(%ebp)
 2fd:	e8 f1 00 00 00       	call   3f3 <open>
  if(fd < 0)
 302:	83 c4 10             	add    $0x10,%esp
 305:	85 c0                	test   %eax,%eax
 307:	78 27                	js     330 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 309:	83 ec 08             	sub    $0x8,%esp
 30c:	ff 75 0c             	push   0xc(%ebp)
 30f:	89 c3                	mov    %eax,%ebx
 311:	50                   	push   %eax
 312:	e8 f4 00 00 00       	call   40b <fstat>
  close(fd);
 317:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 31a:	89 c6                	mov    %eax,%esi
  close(fd);
 31c:	e8 ba 00 00 00       	call   3db <close>
  return r;
 321:	83 c4 10             	add    $0x10,%esp
}
 324:	8d 65 f8             	lea    -0x8(%ebp),%esp
 327:	89 f0                	mov    %esi,%eax
 329:	5b                   	pop    %ebx
 32a:	5e                   	pop    %esi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 330:	be ff ff ff ff       	mov    $0xffffffff,%esi
 335:	eb ed                	jmp    324 <stat+0x34>
 337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33e:	66 90                	xchg   %ax,%ax

00000340 <atoi>:

int
atoi(const char *s)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	53                   	push   %ebx
 344:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 347:	0f be 02             	movsbl (%edx),%eax
 34a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 34d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 350:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 355:	77 1e                	ja     375 <atoi+0x35>
 357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 360:	83 c2 01             	add    $0x1,%edx
 363:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 366:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 36a:	0f be 02             	movsbl (%edx),%eax
 36d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 370:	80 fb 09             	cmp    $0x9,%bl
 373:	76 eb                	jbe    360 <atoi+0x20>
  return n;
}
 375:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 378:	89 c8                	mov    %ecx,%eax
 37a:	c9                   	leave  
 37b:	c3                   	ret    
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	8b 45 10             	mov    0x10(%ebp),%eax
 387:	8b 55 08             	mov    0x8(%ebp),%edx
 38a:	56                   	push   %esi
 38b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 38e:	85 c0                	test   %eax,%eax
 390:	7e 13                	jle    3a5 <memmove+0x25>
 392:	01 d0                	add    %edx,%eax
  dst = vdst;
 394:	89 d7                	mov    %edx,%edi
 396:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3a1:	39 f8                	cmp    %edi,%eax
 3a3:	75 fb                	jne    3a0 <memmove+0x20>
  return vdst;
}
 3a5:	5e                   	pop    %esi
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    

000003ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ab:	b8 01 00 00 00       	mov    $0x1,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <exit>:
SYSCALL(exit)
 3b3:	b8 02 00 00 00       	mov    $0x2,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <wait>:
SYSCALL(wait)
 3bb:	b8 03 00 00 00       	mov    $0x3,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <pipe>:
SYSCALL(pipe)
 3c3:	b8 04 00 00 00       	mov    $0x4,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <read>:
SYSCALL(read)
 3cb:	b8 05 00 00 00       	mov    $0x5,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <write>:
SYSCALL(write)
 3d3:	b8 10 00 00 00       	mov    $0x10,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <close>:
SYSCALL(close)
 3db:	b8 15 00 00 00       	mov    $0x15,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <kill>:
SYSCALL(kill)
 3e3:	b8 06 00 00 00       	mov    $0x6,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <exec>:
SYSCALL(exec)
 3eb:	b8 07 00 00 00       	mov    $0x7,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <open>:
SYSCALL(open)
 3f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <mknod>:
SYSCALL(mknod)
 3fb:	b8 11 00 00 00       	mov    $0x11,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <unlink>:
SYSCALL(unlink)
 403:	b8 12 00 00 00       	mov    $0x12,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <fstat>:
SYSCALL(fstat)
 40b:	b8 08 00 00 00       	mov    $0x8,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <link>:
SYSCALL(link)
 413:	b8 13 00 00 00       	mov    $0x13,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <mkdir>:
SYSCALL(mkdir)
 41b:	b8 14 00 00 00       	mov    $0x14,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <chdir>:
SYSCALL(chdir)
 423:	b8 09 00 00 00       	mov    $0x9,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <dup>:
SYSCALL(dup)
 42b:	b8 0a 00 00 00       	mov    $0xa,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <getpid>:
SYSCALL(getpid)
 433:	b8 0b 00 00 00       	mov    $0xb,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <sbrk>:
SYSCALL(sbrk)
 43b:	b8 0c 00 00 00       	mov    $0xc,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <sleep>:
SYSCALL(sleep)
 443:	b8 0d 00 00 00       	mov    $0xd,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <uptime>:
SYSCALL(uptime)
 44b:	b8 0e 00 00 00       	mov    $0xe,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <printhugepde>:
SYSCALL(printhugepde)
 453:	b8 16 00 00 00       	mov    $0x16,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 45b:	b8 17 00 00 00       	mov    $0x17,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <setthp>:
SYSCALL(setthp)
 463:	b8 18 00 00 00       	mov    $0x18,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <getthp>:
 46b:	b8 19 00 00 00       	mov    $0x19,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    
 473:	66 90                	xchg   %ax,%ax
 475:	66 90                	xchg   %ax,%ax
 477:	66 90                	xchg   %ax,%ax
 479:	66 90                	xchg   %ax,%ax
 47b:	66 90                	xchg   %ax,%ax
 47d:	66 90                	xchg   %ax,%ax
 47f:	90                   	nop

00000480 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 3c             	sub    $0x3c,%esp
 489:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 48c:	89 d1                	mov    %edx,%ecx
{
 48e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 491:	85 d2                	test   %edx,%edx
 493:	0f 89 7f 00 00 00    	jns    518 <printint+0x98>
 499:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 49d:	74 79                	je     518 <printint+0x98>
    neg = 1;
 49f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4a8:	31 db                	xor    %ebx,%ebx
 4aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4b0:	89 c8                	mov    %ecx,%eax
 4b2:	31 d2                	xor    %edx,%edx
 4b4:	89 cf                	mov    %ecx,%edi
 4b6:	f7 75 c4             	divl   -0x3c(%ebp)
 4b9:	0f b6 92 cc 09 00 00 	movzbl 0x9cc(%edx),%edx
 4c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4c3:	89 d8                	mov    %ebx,%eax
 4c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4d1:	76 dd                	jbe    4b0 <printint+0x30>
  if(neg)
 4d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4d6:	85 c9                	test   %ecx,%ecx
 4d8:	74 0c                	je     4e6 <printint+0x66>
    buf[i++] = '-';
 4da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4ed:	eb 07                	jmp    4f6 <printint+0x76>
 4ef:	90                   	nop
    putc(fd, buf[i]);
 4f0:	0f b6 13             	movzbl (%ebx),%edx
 4f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4f6:	83 ec 04             	sub    $0x4,%esp
 4f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4fc:	6a 01                	push   $0x1
 4fe:	56                   	push   %esi
 4ff:	57                   	push   %edi
 500:	e8 ce fe ff ff       	call   3d3 <write>
  while(--i >= 0)
 505:	83 c4 10             	add    $0x10,%esp
 508:	39 de                	cmp    %ebx,%esi
 50a:	75 e4                	jne    4f0 <printint+0x70>
}
 50c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50f:	5b                   	pop    %ebx
 510:	5e                   	pop    %esi
 511:	5f                   	pop    %edi
 512:	5d                   	pop    %ebp
 513:	c3                   	ret    
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 518:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 51f:	eb 87                	jmp    4a8 <printint+0x28>
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 528:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop

00000530 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 539:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 53c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 53f:	0f b6 13             	movzbl (%ebx),%edx
 542:	84 d2                	test   %dl,%dl
 544:	74 6a                	je     5b0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 546:	8d 45 10             	lea    0x10(%ebp),%eax
 549:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 54c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 54f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 551:	89 45 d0             	mov    %eax,-0x30(%ebp)
 554:	eb 36                	jmp    58c <printf+0x5c>
 556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
 560:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 563:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 568:	83 f8 25             	cmp    $0x25,%eax
 56b:	74 15                	je     582 <printf+0x52>
  write(fd, &c, 1);
 56d:	83 ec 04             	sub    $0x4,%esp
 570:	88 55 e7             	mov    %dl,-0x19(%ebp)
 573:	6a 01                	push   $0x1
 575:	57                   	push   %edi
 576:	56                   	push   %esi
 577:	e8 57 fe ff ff       	call   3d3 <write>
 57c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 57f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 582:	0f b6 13             	movzbl (%ebx),%edx
 585:	83 c3 01             	add    $0x1,%ebx
 588:	84 d2                	test   %dl,%dl
 58a:	74 24                	je     5b0 <printf+0x80>
    c = fmt[i] & 0xff;
 58c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 58f:	85 c9                	test   %ecx,%ecx
 591:	74 cd                	je     560 <printf+0x30>
      }
    } else if(state == '%'){
 593:	83 f9 25             	cmp    $0x25,%ecx
 596:	75 ea                	jne    582 <printf+0x52>
      if(c == 'd'){
 598:	83 f8 25             	cmp    $0x25,%eax
 59b:	0f 84 07 01 00 00    	je     6a8 <printf+0x178>
 5a1:	83 e8 63             	sub    $0x63,%eax
 5a4:	83 f8 15             	cmp    $0x15,%eax
 5a7:	77 17                	ja     5c0 <printf+0x90>
 5a9:	ff 24 85 74 09 00 00 	jmp    *0x974(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b3:	5b                   	pop    %ebx
 5b4:	5e                   	pop    %esi
 5b5:	5f                   	pop    %edi
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    
 5b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop
  write(fd, &c, 1);
 5c0:	83 ec 04             	sub    $0x4,%esp
 5c3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 5c6:	6a 01                	push   $0x1
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ce:	e8 00 fe ff ff       	call   3d3 <write>
        putc(fd, c);
 5d3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 5d7:	83 c4 0c             	add    $0xc,%esp
 5da:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5dd:	6a 01                	push   $0x1
 5df:	57                   	push   %edi
 5e0:	56                   	push   %esi
 5e1:	e8 ed fd ff ff       	call   3d3 <write>
        putc(fd, c);
 5e6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5e9:	31 c9                	xor    %ecx,%ecx
 5eb:	eb 95                	jmp    582 <printf+0x52>
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5f8:	6a 00                	push   $0x0
 5fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5fd:	8b 10                	mov    (%eax),%edx
 5ff:	89 f0                	mov    %esi,%eax
 601:	e8 7a fe ff ff       	call   480 <printint>
        ap++;
 606:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 60a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60d:	31 c9                	xor    %ecx,%ecx
 60f:	e9 6e ff ff ff       	jmp    582 <printf+0x52>
 614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 618:	8b 45 d0             	mov    -0x30(%ebp),%eax
 61b:	8b 10                	mov    (%eax),%edx
        ap++;
 61d:	83 c0 04             	add    $0x4,%eax
 620:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 623:	85 d2                	test   %edx,%edx
 625:	0f 84 8d 00 00 00    	je     6b8 <printf+0x188>
        while(*s != 0){
 62b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 62e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 630:	84 c0                	test   %al,%al
 632:	0f 84 4a ff ff ff    	je     582 <printf+0x52>
 638:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 63b:	89 d3                	mov    %edx,%ebx
 63d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
          s++;
 643:	83 c3 01             	add    $0x1,%ebx
 646:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 649:	6a 01                	push   $0x1
 64b:	57                   	push   %edi
 64c:	56                   	push   %esi
 64d:	e8 81 fd ff ff       	call   3d3 <write>
        while(*s != 0){
 652:	0f b6 03             	movzbl (%ebx),%eax
 655:	83 c4 10             	add    $0x10,%esp
 658:	84 c0                	test   %al,%al
 65a:	75 e4                	jne    640 <printf+0x110>
      state = 0;
 65c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 65f:	31 c9                	xor    %ecx,%ecx
 661:	e9 1c ff ff ff       	jmp    582 <printf+0x52>
 666:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 670:	83 ec 0c             	sub    $0xc,%esp
 673:	b9 0a 00 00 00       	mov    $0xa,%ecx
 678:	6a 01                	push   $0x1
 67a:	e9 7b ff ff ff       	jmp    5fa <printf+0xca>
 67f:	90                   	nop
        putc(fd, *ap);
 680:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 683:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 686:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 688:	6a 01                	push   $0x1
 68a:	57                   	push   %edi
 68b:	56                   	push   %esi
        putc(fd, *ap);
 68c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 68f:	e8 3f fd ff ff       	call   3d3 <write>
        ap++;
 694:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 698:	83 c4 10             	add    $0x10,%esp
      state = 0;
 69b:	31 c9                	xor    %ecx,%ecx
 69d:	e9 e0 fe ff ff       	jmp    582 <printf+0x52>
 6a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 6a8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6ab:	83 ec 04             	sub    $0x4,%esp
 6ae:	e9 2a ff ff ff       	jmp    5dd <printf+0xad>
 6b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6b7:	90                   	nop
          s = "(null)";
 6b8:	ba 6c 09 00 00       	mov    $0x96c,%edx
        while(*s != 0){
 6bd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6c0:	b8 28 00 00 00       	mov    $0x28,%eax
 6c5:	89 d3                	mov    %edx,%ebx
 6c7:	e9 74 ff ff ff       	jmp    640 <printf+0x110>
 6cc:	66 90                	xchg   %ax,%ax
 6ce:	66 90                	xchg   %ax,%ax

000006d0 <vfree>:
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 04             	sub    $0x4,%esp
 6d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
 6dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    bp = ((Header*)ap) - 1;
 6df:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    if (use_huge_pages) {
 6e2:	85 c0                	test   %eax,%eax
 6e4:	0f 84 96 00 00 00    	je     780 <vfree+0xb0>
        freepptr = &huge_freep;
 6ea:	a1 20 0f 00 00       	mov    0xf20,%eax
 6ef:	bf 20 0f 00 00       	mov    $0xf20,%edi
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 6f8:	89 c2                	mov    %eax,%edx
 6fa:	8b 00                	mov    (%eax),%eax
 6fc:	39 ca                	cmp    %ecx,%edx
 6fe:	73 38                	jae    738 <vfree+0x68>
 700:	39 c1                	cmp    %eax,%ecx
 702:	72 04                	jb     708 <vfree+0x38>
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 704:	39 c2                	cmp    %eax,%edx
 706:	72 f0                	jb     6f8 <vfree+0x28>
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
 708:	8b 73 fc             	mov    -0x4(%ebx),%esi
 70b:	89 7d f0             	mov    %edi,-0x10(%ebp)
 70e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 711:	39 f8                	cmp    %edi,%eax
 713:	74 38                	je     74d <vfree+0x7d>
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
 715:	89 43 f8             	mov    %eax,-0x8(%ebx)
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
 718:	8b 42 04             	mov    0x4(%edx),%eax
 71b:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 71e:	39 f1                	cmp    %esi,%ecx
 720:	74 42                	je     764 <vfree+0x94>
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
 722:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 725:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 727:	89 10                	mov    %edx,(%eax)
}
 729:	83 c4 04             	add    $0x4,%esp
 72c:	5b                   	pop    %ebx
 72d:	5e                   	pop    %esi
 72e:	5f                   	pop    %edi
 72f:	5d                   	pop    %ebp
 730:	c3                   	ret    
 731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 738:	39 c2                	cmp    %eax,%edx
 73a:	72 bc                	jb     6f8 <vfree+0x28>
 73c:	39 c1                	cmp    %eax,%ecx
 73e:	73 b8                	jae    6f8 <vfree+0x28>
    if (bp + bp->s.size == p->s.ptr) {
 740:	8b 73 fc             	mov    -0x4(%ebx),%esi
 743:	89 7d f0             	mov    %edi,-0x10(%ebp)
 746:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 749:	39 f8                	cmp    %edi,%eax
 74b:	75 c8                	jne    715 <vfree+0x45>
        bp->s.size += p->s.ptr->s.size;
 74d:	03 70 04             	add    0x4(%eax),%esi
 750:	89 73 fc             	mov    %esi,-0x4(%ebx)
        bp->s.ptr = p->s.ptr->s.ptr;
 753:	8b 02                	mov    (%edx),%eax
 755:	8b 00                	mov    (%eax),%eax
 757:	89 43 f8             	mov    %eax,-0x8(%ebx)
    if (p + p->s.size == bp) {
 75a:	8b 42 04             	mov    0x4(%edx),%eax
 75d:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 760:	39 f1                	cmp    %esi,%ecx
 762:	75 be                	jne    722 <vfree+0x52>
        p->s.size += bp->s.size;
 764:	03 43 fc             	add    -0x4(%ebx),%eax
 767:	89 42 04             	mov    %eax,0x4(%edx)
    *freepptr = p;
 76a:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 76d:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 770:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 772:	89 10                	mov    %edx,(%eax)
}
 774:	83 c4 04             	add    $0x4,%esp
 777:	5b                   	pop    %ebx
 778:	5e                   	pop    %esi
 779:	5f                   	pop    %edi
 77a:	5d                   	pop    %ebp
 77b:	c3                   	ret    
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        freepptr = &freep;
 780:	a1 2c 0f 00 00       	mov    0xf2c,%eax
 785:	bf 2c 0f 00 00       	mov    $0xf2c,%edi
    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 78a:	e9 69 ff ff ff       	jmp    6f8 <vfree+0x28>
 78f:	90                   	nop

00000790 <vmalloc>:
void* vmalloc(uint nbytes, int use_huge_pages) {
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 1c             	sub    $0x1c,%esp
 799:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (use_huge_pages) {
 79c:	85 db                	test   %ebx,%ebx
 79e:	0f 84 0c 01 00 00    	je     8b0 <vmalloc+0x120>
        if ((prevp = huge_freep) == 0) {
 7a4:	8b 15 20 0f 00 00    	mov    0xf20,%edx
 7aa:	85 d2                	test   %edx,%edx
 7ac:	0f 84 4e f8 ff ff    	je     0 <vmalloc.cold>
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 7b2:	8b 45 08             	mov    0x8(%ebp),%eax
 7b5:	8d 78 07             	lea    0x7(%eax),%edi
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 7b8:	8b 02                	mov    (%edx),%eax
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 7ba:	c1 ef 03             	shr    $0x3,%edi
        if (p->s.size >= nunits) {
 7bd:	8b 48 04             	mov    0x4(%eax),%ecx
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 7c0:	83 c7 01             	add    $0x1,%edi
        if (p->s.size >= nunits) {
 7c3:	39 f9                	cmp    %edi,%ecx
 7c5:	0f 83 c5 00 00 00    	jae    890 <vmalloc+0x100>
 7cb:	be 00 10 00 00       	mov    $0x1000,%esi
 7d0:	ba 00 00 40 00       	mov    $0x400000,%edx
 7d5:	39 f7                	cmp    %esi,%edi
 7d7:	0f 43 f7             	cmovae %edi,%esi
 7da:	39 d7                	cmp    %edx,%edi
 7dc:	0f 43 d7             	cmovae %edi,%edx
  p = sbrk(nu * sizeof(Header));
 7df:	8d 0c f5 00 00 00 00 	lea    0x0(,%esi,8),%ecx
 7e6:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 7e9:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
 7f0:	89 55 dc             	mov    %edx,-0x24(%ebp)
 7f3:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 7f6:	eb 15                	jmp    80d <vmalloc+0x7d>
 7f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ff:	90                   	nop
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 800:	8b 02                	mov    (%edx),%eax
        if (p->s.size >= nunits) {
 802:	8b 48 04             	mov    0x4(%eax),%ecx
 805:	39 f9                	cmp    %edi,%ecx
 807:	0f 83 83 00 00 00    	jae    890 <vmalloc+0x100>
        if (p == freep) {
 80d:	89 c2                	mov    %eax,%edx
 80f:	39 05 2c 0f 00 00    	cmp    %eax,0xf2c
 815:	75 e9                	jne    800 <vmalloc+0x70>
  if(use_huge_pages){
 817:	85 db                	test   %ebx,%ebx
 819:	74 45                	je     860 <vmalloc+0xd0>
  p = sbrk(nu * sizeof(Header));
 81b:	83 ec 0c             	sub    $0xc,%esp
 81e:	ff 75 e0             	push   -0x20(%ebp)
 821:	e8 15 fc ff ff       	call   43b <sbrk>
  if(p == (char*)-1)
 826:	83 c4 10             	add    $0x10,%esp
 829:	83 f8 ff             	cmp    $0xffffffff,%eax
 82c:	74 20                	je     84e <vmalloc+0xbe>
  hp->s.size = nu;
 82e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  vfree((void*)(hp + 1), use_huge_pages);
 831:	83 ec 08             	sub    $0x8,%esp
 834:	83 c0 08             	add    $0x8,%eax
  hp->s.size = nu;
 837:	89 48 fc             	mov    %ecx,-0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 83a:	53                   	push   %ebx
 83b:	50                   	push   %eax
 83c:	e8 8f fe ff ff       	call   6d0 <vfree>
  return use_huge_pages ? huge_freep : freep;
 841:	8b 15 20 0f 00 00    	mov    0xf20,%edx
 847:	83 c4 10             	add    $0x10,%esp
            if (p == 0) {
 84a:	85 d2                	test   %edx,%edx
 84c:	75 b2                	jne    800 <vmalloc+0x70>
}
 84e:	8d 65 f4             	lea    -0xc(%ebp),%esp
                return 0;
 851:	31 c0                	xor    %eax,%eax
}
 853:	5b                   	pop    %ebx
 854:	5e                   	pop    %esi
 855:	5f                   	pop    %edi
 856:	5d                   	pop    %ebp
 857:	c3                   	ret    
 858:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85f:	90                   	nop
  p = sbrk(nu * sizeof(Header));
 860:	83 ec 0c             	sub    $0xc,%esp
 863:	ff 75 e4             	push   -0x1c(%ebp)
 866:	e8 d0 fb ff ff       	call   43b <sbrk>
  if(p == (char*)-1)
 86b:	83 c4 10             	add    $0x10,%esp
 86e:	83 f8 ff             	cmp    $0xffffffff,%eax
 871:	74 db                	je     84e <vmalloc+0xbe>
  hp->s.size = nu;
 873:	89 70 04             	mov    %esi,0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 876:	83 ec 08             	sub    $0x8,%esp
 879:	83 c0 08             	add    $0x8,%eax
 87c:	6a 00                	push   $0x0
 87e:	50                   	push   %eax
 87f:	e8 4c fe ff ff       	call   6d0 <vfree>
  return use_huge_pages ? huge_freep : freep;
 884:	8b 15 2c 0f 00 00    	mov    0xf2c,%edx
 88a:	83 c4 10             	add    $0x10,%esp
 88d:	eb bb                	jmp    84a <vmalloc+0xba>
 88f:	90                   	nop
            if (p->s.size == nunits) {
 890:	39 cf                	cmp    %ecx,%edi
 892:	74 34                	je     8c8 <vmalloc+0x138>
                p->s.size -= nunits;
 894:	29 f9                	sub    %edi,%ecx
 896:	89 48 04             	mov    %ecx,0x4(%eax)
                p += p->s.size;
 899:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
                p->s.size = nunits;
 89c:	89 78 04             	mov    %edi,0x4(%eax)
            freep = prevp;
 89f:	89 15 2c 0f 00 00    	mov    %edx,0xf2c
}
 8a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return (void*)(p + 1);
 8a8:	83 c0 08             	add    $0x8,%eax
}
 8ab:	5b                   	pop    %ebx
 8ac:	5e                   	pop    %esi
 8ad:	5f                   	pop    %edi
 8ae:	5d                   	pop    %ebp
 8af:	c3                   	ret    
        if ((prevp = freep) == 0) {
 8b0:	8b 15 2c 0f 00 00    	mov    0xf2c,%edx
 8b6:	85 d2                	test   %edx,%edx
 8b8:	0f 85 f4 fe ff ff    	jne    7b2 <vmalloc+0x22>
 8be:	e9 62 f7 ff ff       	jmp    25 <vmalloc.cold+0x25>
 8c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8c7:	90                   	nop
                prevp->s.ptr = p->s.ptr;
 8c8:	8b 08                	mov    (%eax),%ecx
 8ca:	89 0a                	mov    %ecx,(%edx)
 8cc:	eb d1                	jmp    89f <vmalloc+0x10f>
 8ce:	66 90                	xchg   %ax,%ax

000008d0 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	53                   	push   %ebx
 8d4:	83 ec 04             	sub    $0x4,%esp
 8d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 8da:	e8 8c fb ff ff       	call   46b <getthp>


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
 8df:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 8e5:	76 19                	jbe    900 <malloc+0x30>
 8e7:	85 c0                	test   %eax,%eax
 8e9:	74 15                	je     900 <malloc+0x30>
    return vmalloc(nbytes, 1); // use the huge pages
 8eb:	83 ec 08             	sub    $0x8,%esp
 8ee:	6a 01                	push   $0x1
 8f0:	53                   	push   %ebx
 8f1:	e8 9a fe ff ff       	call   790 <vmalloc>
  }
  else{
    return vmalloc(nbytes, 0);
  }
}
 8f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 1); // use the huge pages
 8f9:	83 c4 10             	add    $0x10,%esp
}
 8fc:	c9                   	leave  
 8fd:	c3                   	ret    
 8fe:	66 90                	xchg   %ax,%ax
    return vmalloc(nbytes, 0);
 900:	83 ec 08             	sub    $0x8,%esp
 903:	6a 00                	push   $0x0
 905:	53                   	push   %ebx
 906:	e8 85 fe ff ff       	call   790 <vmalloc>
}
 90b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 0);
 90e:	83 c4 10             	add    $0x10,%esp
}
 911:	c9                   	leave  
 912:	c3                   	ret    
 913:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000920 <free>:

void free(void * ap){
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
  vfree(ap, 0);
 923:	6a 00                	push   $0x0
 925:	ff 75 08             	push   0x8(%ebp)
 928:	e8 a3 fd ff ff       	call   6d0 <vfree>
}
 92d:	58                   	pop    %eax
 92e:	5a                   	pop    %edx
 92f:	c9                   	leave  
 930:	c3                   	ret    
