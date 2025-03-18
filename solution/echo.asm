
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <vmalloc.cold>:

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
   0:	c7 05 20 0c 00 00 24 	movl   $0xc24,0xc20
   7:	0c 00 00 
   a:	c7 05 24 0c 00 00 24 	movl   $0xc24,0xc24
  11:	0c 00 00 
            huge_base.s.size = 0;
  14:	c7 05 28 0c 00 00 00 	movl   $0x0,0xc28
  1b:	00 00 00 
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
  1e:	a1 00 00 00 00       	mov    0x0,%eax
  23:	0f 0b                	ud2    
            base.s.ptr = freep = &base;
  25:	c7 05 2c 0c 00 00 30 	movl   $0xc30,0xc2c
  2c:	0c 00 00 
  2f:	c7 05 30 0c 00 00 30 	movl   $0xc30,0xc30
  36:	0c 00 00 
            base.s.size = 0;
  39:	c7 05 34 0c 00 00 00 	movl   $0x0,0xc34
  40:	00 00 00 
  43:	eb d9                	jmp    1e <vmalloc.cold+0x1e>
  45:	66 90                	xchg   %ax,%ax
  47:	66 90                	xchg   %ax,%ax
  49:	66 90                	xchg   %ax,%ax
  4b:	66 90                	xchg   %ax,%ax
  4d:	66 90                	xchg   %ax,%ax
  4f:	90                   	nop

00000050 <main>:
#include "stat.h"
#include "user.h"

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
  61:	83 ec 08             	sub    $0x8,%esp
  64:	8b 31                	mov    (%ecx),%esi
  66:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  69:	83 fe 01             	cmp    $0x1,%esi
  6c:	7e 47                	jle    b5 <main+0x65>
  6e:	bb 01 00 00 00       	mov    $0x1,%ebx
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  73:	83 c3 01             	add    $0x1,%ebx
  76:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  7a:	39 f3                	cmp    %esi,%ebx
  7c:	74 22                	je     a0 <main+0x50>
  7e:	66 90                	xchg   %ax,%ax
  80:	68 94 08 00 00       	push   $0x894
  85:	83 c3 01             	add    $0x1,%ebx
  88:	50                   	push   %eax
  89:	68 96 08 00 00       	push   $0x896
  8e:	6a 01                	push   $0x1
  90:	e8 fb 03 00 00       	call   490 <printf>
  95:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  99:	83 c4 10             	add    $0x10,%esp
  9c:	39 f3                	cmp    %esi,%ebx
  9e:	75 e0                	jne    80 <main+0x30>
  a0:	68 9b 08 00 00       	push   $0x89b
  a5:	50                   	push   %eax
  a6:	68 96 08 00 00       	push   $0x896
  ab:	6a 01                	push   $0x1
  ad:	e8 de 03 00 00       	call   490 <printf>
  b2:	83 c4 10             	add    $0x10,%esp
  exit();
  b5:	e8 59 02 00 00       	call   313 <exit>
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c1:	31 c0                	xor    %eax,%eax
{
  c3:	89 e5                	mov    %esp,%ebp
  c5:	53                   	push   %ebx
  c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  d7:	83 c0 01             	add    $0x1,%eax
  da:	84 d2                	test   %dl,%dl
  dc:	75 f2                	jne    d0 <strcpy+0x10>
    ;
  return os;
}
  de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e1:	89 c8                	mov    %ecx,%eax
  e3:	c9                   	leave  
  e4:	c3                   	ret    
  e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	53                   	push   %ebx
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
  f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  fa:	0f b6 02             	movzbl (%edx),%eax
  fd:	84 c0                	test   %al,%al
  ff:	75 17                	jne    118 <strcmp+0x28>
 101:	eb 3a                	jmp    13d <strcmp+0x4d>
 103:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 107:	90                   	nop
 108:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 10c:	83 c2 01             	add    $0x1,%edx
 10f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 112:	84 c0                	test   %al,%al
 114:	74 1a                	je     130 <strcmp+0x40>
    p++, q++;
 116:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 118:	0f b6 19             	movzbl (%ecx),%ebx
 11b:	38 c3                	cmp    %al,%bl
 11d:	74 e9                	je     108 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 11f:	29 d8                	sub    %ebx,%eax
}
 121:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 124:	c9                   	leave  
 125:	c3                   	ret    
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 130:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 134:	31 c0                	xor    %eax,%eax
 136:	29 d8                	sub    %ebx,%eax
}
 138:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13b:	c9                   	leave  
 13c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 13d:	0f b6 19             	movzbl (%ecx),%ebx
 140:	31 c0                	xor    %eax,%eax
 142:	eb db                	jmp    11f <strcmp+0x2f>
 144:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <strlen>:

uint
strlen(const char *s)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 156:	80 3a 00             	cmpb   $0x0,(%edx)
 159:	74 15                	je     170 <strlen+0x20>
 15b:	31 c0                	xor    %eax,%eax
 15d:	8d 76 00             	lea    0x0(%esi),%esi
 160:	83 c0 01             	add    $0x1,%eax
 163:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 167:	89 c1                	mov    %eax,%ecx
 169:	75 f5                	jne    160 <strlen+0x10>
    ;
  return n;
}
 16b:	89 c8                	mov    %ecx,%eax
 16d:	5d                   	pop    %ebp
 16e:	c3                   	ret    
 16f:	90                   	nop
  for(n = 0; s[n]; n++)
 170:	31 c9                	xor    %ecx,%ecx
}
 172:	5d                   	pop    %ebp
 173:	89 c8                	mov    %ecx,%eax
 175:	c3                   	ret    
 176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17d:	8d 76 00             	lea    0x0(%esi),%esi

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 18d:	89 d7                	mov    %edx,%edi
 18f:	fc                   	cld    
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	8b 7d fc             	mov    -0x4(%ebp),%edi
 195:	89 d0                	mov    %edx,%eax
 197:	c9                   	leave  
 198:	c3                   	ret    
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strchr>:

char*
strchr(const char *s, char c)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	84 d2                	test   %dl,%dl
 1af:	75 12                	jne    1c3 <strchr+0x23>
 1b1:	eb 1d                	jmp    1d0 <strchr+0x30>
 1b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b7:	90                   	nop
 1b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1bc:	83 c0 01             	add    $0x1,%eax
 1bf:	84 d2                	test   %dl,%dl
 1c1:	74 0d                	je     1d0 <strchr+0x30>
    if(*s == c)
 1c3:	38 d1                	cmp    %dl,%cl
 1c5:	75 f1                	jne    1b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1c7:	5d                   	pop    %ebp
 1c8:	c3                   	ret    
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1d0:	31 c0                	xor    %eax,%eax
}
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    
 1d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1df:	90                   	nop

000001e0 <gets>:

char*
gets(char *buf, int max)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 1e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1e9:	31 db                	xor    %ebx,%ebx
{
 1eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ee:	eb 27                	jmp    217 <gets+0x37>
    cc = read(0, &c, 1);
 1f0:	83 ec 04             	sub    $0x4,%esp
 1f3:	6a 01                	push   $0x1
 1f5:	57                   	push   %edi
 1f6:	6a 00                	push   $0x0
 1f8:	e8 2e 01 00 00       	call   32b <read>
    if(cc < 1)
 1fd:	83 c4 10             	add    $0x10,%esp
 200:	85 c0                	test   %eax,%eax
 202:	7e 1d                	jle    221 <gets+0x41>
      break;
    buf[i++] = c;
 204:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 208:	8b 55 08             	mov    0x8(%ebp),%edx
 20b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 20f:	3c 0a                	cmp    $0xa,%al
 211:	74 1d                	je     230 <gets+0x50>
 213:	3c 0d                	cmp    $0xd,%al
 215:	74 19                	je     230 <gets+0x50>
  for(i=0; i+1 < max; ){
 217:	89 de                	mov    %ebx,%esi
 219:	83 c3 01             	add    $0x1,%ebx
 21c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 21f:	7c cf                	jl     1f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 221:	8b 45 08             	mov    0x8(%ebp),%eax
 224:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 228:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22b:	5b                   	pop    %ebx
 22c:	5e                   	pop    %esi
 22d:	5f                   	pop    %edi
 22e:	5d                   	pop    %ebp
 22f:	c3                   	ret    
  buf[i] = '\0';
 230:	8b 45 08             	mov    0x8(%ebp),%eax
 233:	89 de                	mov    %ebx,%esi
 235:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 239:	8d 65 f4             	lea    -0xc(%ebp),%esp
 23c:	5b                   	pop    %ebx
 23d:	5e                   	pop    %esi
 23e:	5f                   	pop    %edi
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
 241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 248:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24f:	90                   	nop

00000250 <stat>:

int
stat(const char *n, struct stat *st)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	56                   	push   %esi
 254:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 255:	83 ec 08             	sub    $0x8,%esp
 258:	6a 00                	push   $0x0
 25a:	ff 75 08             	push   0x8(%ebp)
 25d:	e8 f1 00 00 00       	call   353 <open>
  if(fd < 0)
 262:	83 c4 10             	add    $0x10,%esp
 265:	85 c0                	test   %eax,%eax
 267:	78 27                	js     290 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 269:	83 ec 08             	sub    $0x8,%esp
 26c:	ff 75 0c             	push   0xc(%ebp)
 26f:	89 c3                	mov    %eax,%ebx
 271:	50                   	push   %eax
 272:	e8 f4 00 00 00       	call   36b <fstat>
  close(fd);
 277:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 27a:	89 c6                	mov    %eax,%esi
  close(fd);
 27c:	e8 ba 00 00 00       	call   33b <close>
  return r;
 281:	83 c4 10             	add    $0x10,%esp
}
 284:	8d 65 f8             	lea    -0x8(%ebp),%esp
 287:	89 f0                	mov    %esi,%eax
 289:	5b                   	pop    %ebx
 28a:	5e                   	pop    %esi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 290:	be ff ff ff ff       	mov    $0xffffffff,%esi
 295:	eb ed                	jmp    284 <stat+0x34>
 297:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29e:	66 90                	xchg   %ax,%ax

000002a0 <atoi>:

int
atoi(const char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2a7:	0f be 02             	movsbl (%edx),%eax
 2aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2b5:	77 1e                	ja     2d5 <atoi+0x35>
 2b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2be:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2c0:	83 c2 01             	add    $0x1,%edx
 2c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ca:	0f be 02             	movsbl (%edx),%eax
 2cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2d0:	80 fb 09             	cmp    $0x9,%bl
 2d3:	76 eb                	jbe    2c0 <atoi+0x20>
  return n;
}
 2d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d8:	89 c8                	mov    %ecx,%eax
 2da:	c9                   	leave  
 2db:	c3                   	ret    
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	8b 45 10             	mov    0x10(%ebp),%eax
 2e7:	8b 55 08             	mov    0x8(%ebp),%edx
 2ea:	56                   	push   %esi
 2eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ee:	85 c0                	test   %eax,%eax
 2f0:	7e 13                	jle    305 <memmove+0x25>
 2f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2f4:	89 d7                	mov    %edx,%edi
 2f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 300:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 301:	39 f8                	cmp    %edi,%eax
 303:	75 fb                	jne    300 <memmove+0x20>
  return vdst;
}
 305:	5e                   	pop    %esi
 306:	89 d0                	mov    %edx,%eax
 308:	5f                   	pop    %edi
 309:	5d                   	pop    %ebp
 30a:	c3                   	ret    

0000030b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 30b:	b8 01 00 00 00       	mov    $0x1,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <exit>:
SYSCALL(exit)
 313:	b8 02 00 00 00       	mov    $0x2,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <wait>:
SYSCALL(wait)
 31b:	b8 03 00 00 00       	mov    $0x3,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <pipe>:
SYSCALL(pipe)
 323:	b8 04 00 00 00       	mov    $0x4,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <read>:
SYSCALL(read)
 32b:	b8 05 00 00 00       	mov    $0x5,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <write>:
SYSCALL(write)
 333:	b8 10 00 00 00       	mov    $0x10,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <close>:
SYSCALL(close)
 33b:	b8 15 00 00 00       	mov    $0x15,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <kill>:
SYSCALL(kill)
 343:	b8 06 00 00 00       	mov    $0x6,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <exec>:
SYSCALL(exec)
 34b:	b8 07 00 00 00       	mov    $0x7,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <open>:
SYSCALL(open)
 353:	b8 0f 00 00 00       	mov    $0xf,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <mknod>:
SYSCALL(mknod)
 35b:	b8 11 00 00 00       	mov    $0x11,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <unlink>:
SYSCALL(unlink)
 363:	b8 12 00 00 00       	mov    $0x12,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <fstat>:
SYSCALL(fstat)
 36b:	b8 08 00 00 00       	mov    $0x8,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <link>:
SYSCALL(link)
 373:	b8 13 00 00 00       	mov    $0x13,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <mkdir>:
SYSCALL(mkdir)
 37b:	b8 14 00 00 00       	mov    $0x14,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <chdir>:
SYSCALL(chdir)
 383:	b8 09 00 00 00       	mov    $0x9,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <dup>:
SYSCALL(dup)
 38b:	b8 0a 00 00 00       	mov    $0xa,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <getpid>:
SYSCALL(getpid)
 393:	b8 0b 00 00 00       	mov    $0xb,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <sbrk>:
SYSCALL(sbrk)
 39b:	b8 0c 00 00 00       	mov    $0xc,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <sleep>:
SYSCALL(sleep)
 3a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <uptime>:
SYSCALL(uptime)
 3ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <printhugepde>:
SYSCALL(printhugepde)
 3b3:	b8 16 00 00 00       	mov    $0x16,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 3bb:	b8 17 00 00 00       	mov    $0x17,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <setthp>:
SYSCALL(setthp)
 3c3:	b8 18 00 00 00       	mov    $0x18,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <getthp>:
 3cb:	b8 19 00 00 00       	mov    $0x19,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    
 3d3:	66 90                	xchg   %ax,%ax
 3d5:	66 90                	xchg   %ax,%ax
 3d7:	66 90                	xchg   %ax,%ax
 3d9:	66 90                	xchg   %ax,%ax
 3db:	66 90                	xchg   %ax,%ax
 3dd:	66 90                	xchg   %ax,%ax
 3df:	90                   	nop

000003e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 3c             	sub    $0x3c,%esp
 3e9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3ec:	89 d1                	mov    %edx,%ecx
{
 3ee:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 3f1:	85 d2                	test   %edx,%edx
 3f3:	0f 89 7f 00 00 00    	jns    478 <printint+0x98>
 3f9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3fd:	74 79                	je     478 <printint+0x98>
    neg = 1;
 3ff:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 406:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 408:	31 db                	xor    %ebx,%ebx
 40a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 40d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 410:	89 c8                	mov    %ecx,%eax
 412:	31 d2                	xor    %edx,%edx
 414:	89 cf                	mov    %ecx,%edi
 416:	f7 75 c4             	divl   -0x3c(%ebp)
 419:	0f b6 92 fc 08 00 00 	movzbl 0x8fc(%edx),%edx
 420:	89 45 c0             	mov    %eax,-0x40(%ebp)
 423:	89 d8                	mov    %ebx,%eax
 425:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 428:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 42b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 42e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 431:	76 dd                	jbe    410 <printint+0x30>
  if(neg)
 433:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 436:	85 c9                	test   %ecx,%ecx
 438:	74 0c                	je     446 <printint+0x66>
    buf[i++] = '-';
 43a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 43f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 441:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 446:	8b 7d b8             	mov    -0x48(%ebp),%edi
 449:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 44d:	eb 07                	jmp    456 <printint+0x76>
 44f:	90                   	nop
    putc(fd, buf[i]);
 450:	0f b6 13             	movzbl (%ebx),%edx
 453:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 456:	83 ec 04             	sub    $0x4,%esp
 459:	88 55 d7             	mov    %dl,-0x29(%ebp)
 45c:	6a 01                	push   $0x1
 45e:	56                   	push   %esi
 45f:	57                   	push   %edi
 460:	e8 ce fe ff ff       	call   333 <write>
  while(--i >= 0)
 465:	83 c4 10             	add    $0x10,%esp
 468:	39 de                	cmp    %ebx,%esi
 46a:	75 e4                	jne    450 <printint+0x70>
}
 46c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 46f:	5b                   	pop    %ebx
 470:	5e                   	pop    %esi
 471:	5f                   	pop    %edi
 472:	5d                   	pop    %ebp
 473:	c3                   	ret    
 474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 478:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 47f:	eb 87                	jmp    408 <printint+0x28>
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 488:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop

00000490 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
 495:	53                   	push   %ebx
 496:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 499:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 49c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 49f:	0f b6 13             	movzbl (%ebx),%edx
 4a2:	84 d2                	test   %dl,%dl
 4a4:	74 6a                	je     510 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 4a6:	8d 45 10             	lea    0x10(%ebp),%eax
 4a9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4ac:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4af:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 4b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4b4:	eb 36                	jmp    4ec <printf+0x5c>
 4b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
 4c0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4c3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 4c8:	83 f8 25             	cmp    $0x25,%eax
 4cb:	74 15                	je     4e2 <printf+0x52>
  write(fd, &c, 1);
 4cd:	83 ec 04             	sub    $0x4,%esp
 4d0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4d3:	6a 01                	push   $0x1
 4d5:	57                   	push   %edi
 4d6:	56                   	push   %esi
 4d7:	e8 57 fe ff ff       	call   333 <write>
 4dc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 4df:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4e2:	0f b6 13             	movzbl (%ebx),%edx
 4e5:	83 c3 01             	add    $0x1,%ebx
 4e8:	84 d2                	test   %dl,%dl
 4ea:	74 24                	je     510 <printf+0x80>
    c = fmt[i] & 0xff;
 4ec:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4ef:	85 c9                	test   %ecx,%ecx
 4f1:	74 cd                	je     4c0 <printf+0x30>
      }
    } else if(state == '%'){
 4f3:	83 f9 25             	cmp    $0x25,%ecx
 4f6:	75 ea                	jne    4e2 <printf+0x52>
      if(c == 'd'){
 4f8:	83 f8 25             	cmp    $0x25,%eax
 4fb:	0f 84 07 01 00 00    	je     608 <printf+0x178>
 501:	83 e8 63             	sub    $0x63,%eax
 504:	83 f8 15             	cmp    $0x15,%eax
 507:	77 17                	ja     520 <printf+0x90>
 509:	ff 24 85 a4 08 00 00 	jmp    *0x8a4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 510:	8d 65 f4             	lea    -0xc(%ebp),%esp
 513:	5b                   	pop    %ebx
 514:	5e                   	pop    %esi
 515:	5f                   	pop    %edi
 516:	5d                   	pop    %ebp
 517:	c3                   	ret    
 518:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51f:	90                   	nop
  write(fd, &c, 1);
 520:	83 ec 04             	sub    $0x4,%esp
 523:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 526:	6a 01                	push   $0x1
 528:	57                   	push   %edi
 529:	56                   	push   %esi
 52a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 52e:	e8 00 fe ff ff       	call   333 <write>
        putc(fd, c);
 533:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 537:	83 c4 0c             	add    $0xc,%esp
 53a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 53d:	6a 01                	push   $0x1
 53f:	57                   	push   %edi
 540:	56                   	push   %esi
 541:	e8 ed fd ff ff       	call   333 <write>
        putc(fd, c);
 546:	83 c4 10             	add    $0x10,%esp
      state = 0;
 549:	31 c9                	xor    %ecx,%ecx
 54b:	eb 95                	jmp    4e2 <printf+0x52>
 54d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 550:	83 ec 0c             	sub    $0xc,%esp
 553:	b9 10 00 00 00       	mov    $0x10,%ecx
 558:	6a 00                	push   $0x0
 55a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 55d:	8b 10                	mov    (%eax),%edx
 55f:	89 f0                	mov    %esi,%eax
 561:	e8 7a fe ff ff       	call   3e0 <printint>
        ap++;
 566:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 56a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 56d:	31 c9                	xor    %ecx,%ecx
 56f:	e9 6e ff ff ff       	jmp    4e2 <printf+0x52>
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 578:	8b 45 d0             	mov    -0x30(%ebp),%eax
 57b:	8b 10                	mov    (%eax),%edx
        ap++;
 57d:	83 c0 04             	add    $0x4,%eax
 580:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 583:	85 d2                	test   %edx,%edx
 585:	0f 84 8d 00 00 00    	je     618 <printf+0x188>
        while(*s != 0){
 58b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 58e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 590:	84 c0                	test   %al,%al
 592:	0f 84 4a ff ff ff    	je     4e2 <printf+0x52>
 598:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 59b:	89 d3                	mov    %edx,%ebx
 59d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5a3:	83 c3 01             	add    $0x1,%ebx
 5a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5a9:	6a 01                	push   $0x1
 5ab:	57                   	push   %edi
 5ac:	56                   	push   %esi
 5ad:	e8 81 fd ff ff       	call   333 <write>
        while(*s != 0){
 5b2:	0f b6 03             	movzbl (%ebx),%eax
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	84 c0                	test   %al,%al
 5ba:	75 e4                	jne    5a0 <printf+0x110>
      state = 0;
 5bc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 5bf:	31 c9                	xor    %ecx,%ecx
 5c1:	e9 1c ff ff ff       	jmp    4e2 <printf+0x52>
 5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5d0:	83 ec 0c             	sub    $0xc,%esp
 5d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5d8:	6a 01                	push   $0x1
 5da:	e9 7b ff ff ff       	jmp    55a <printf+0xca>
 5df:	90                   	nop
        putc(fd, *ap);
 5e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 5e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5e6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5e8:	6a 01                	push   $0x1
 5ea:	57                   	push   %edi
 5eb:	56                   	push   %esi
        putc(fd, *ap);
 5ec:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5ef:	e8 3f fd ff ff       	call   333 <write>
        ap++;
 5f4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5f8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5fb:	31 c9                	xor    %ecx,%ecx
 5fd:	e9 e0 fe ff ff       	jmp    4e2 <printf+0x52>
 602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 608:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 60b:	83 ec 04             	sub    $0x4,%esp
 60e:	e9 2a ff ff ff       	jmp    53d <printf+0xad>
 613:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 617:	90                   	nop
          s = "(null)";
 618:	ba 9d 08 00 00       	mov    $0x89d,%edx
        while(*s != 0){
 61d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 620:	b8 28 00 00 00       	mov    $0x28,%eax
 625:	89 d3                	mov    %edx,%ebx
 627:	e9 74 ff ff ff       	jmp    5a0 <printf+0x110>
 62c:	66 90                	xchg   %ax,%ax
 62e:	66 90                	xchg   %ax,%ax

00000630 <vfree>:
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	83 ec 04             	sub    $0x4,%esp
 639:	8b 5d 08             	mov    0x8(%ebp),%ebx
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
 63c:	8b 45 0c             	mov    0xc(%ebp),%eax
    bp = ((Header*)ap) - 1;
 63f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    if (use_huge_pages) {
 642:	85 c0                	test   %eax,%eax
 644:	0f 84 96 00 00 00    	je     6e0 <vfree+0xb0>
        freepptr = &huge_freep;
 64a:	a1 20 0c 00 00       	mov    0xc20,%eax
 64f:	bf 20 0c 00 00       	mov    $0xc20,%edi
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 658:	89 c2                	mov    %eax,%edx
 65a:	8b 00                	mov    (%eax),%eax
 65c:	39 ca                	cmp    %ecx,%edx
 65e:	73 38                	jae    698 <vfree+0x68>
 660:	39 c1                	cmp    %eax,%ecx
 662:	72 04                	jb     668 <vfree+0x38>
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 664:	39 c2                	cmp    %eax,%edx
 666:	72 f0                	jb     658 <vfree+0x28>
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
 668:	8b 73 fc             	mov    -0x4(%ebx),%esi
 66b:	89 7d f0             	mov    %edi,-0x10(%ebp)
 66e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 671:	39 f8                	cmp    %edi,%eax
 673:	74 38                	je     6ad <vfree+0x7d>
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
 675:	89 43 f8             	mov    %eax,-0x8(%ebx)
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
 678:	8b 42 04             	mov    0x4(%edx),%eax
 67b:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 67e:	39 f1                	cmp    %esi,%ecx
 680:	74 42                	je     6c4 <vfree+0x94>
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
 682:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 685:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 687:	89 10                	mov    %edx,(%eax)
}
 689:	83 c4 04             	add    $0x4,%esp
 68c:	5b                   	pop    %ebx
 68d:	5e                   	pop    %esi
 68e:	5f                   	pop    %edi
 68f:	5d                   	pop    %ebp
 690:	c3                   	ret    
 691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 698:	39 c2                	cmp    %eax,%edx
 69a:	72 bc                	jb     658 <vfree+0x28>
 69c:	39 c1                	cmp    %eax,%ecx
 69e:	73 b8                	jae    658 <vfree+0x28>
    if (bp + bp->s.size == p->s.ptr) {
 6a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6a3:	89 7d f0             	mov    %edi,-0x10(%ebp)
 6a6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6a9:	39 f8                	cmp    %edi,%eax
 6ab:	75 c8                	jne    675 <vfree+0x45>
        bp->s.size += p->s.ptr->s.size;
 6ad:	03 70 04             	add    0x4(%eax),%esi
 6b0:	89 73 fc             	mov    %esi,-0x4(%ebx)
        bp->s.ptr = p->s.ptr->s.ptr;
 6b3:	8b 02                	mov    (%edx),%eax
 6b5:	8b 00                	mov    (%eax),%eax
 6b7:	89 43 f8             	mov    %eax,-0x8(%ebx)
    if (p + p->s.size == bp) {
 6ba:	8b 42 04             	mov    0x4(%edx),%eax
 6bd:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6c0:	39 f1                	cmp    %esi,%ecx
 6c2:	75 be                	jne    682 <vfree+0x52>
        p->s.size += bp->s.size;
 6c4:	03 43 fc             	add    -0x4(%ebx),%eax
 6c7:	89 42 04             	mov    %eax,0x4(%edx)
    *freepptr = p;
 6ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 6cd:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6d0:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 6d2:	89 10                	mov    %edx,(%eax)
}
 6d4:	83 c4 04             	add    $0x4,%esp
 6d7:	5b                   	pop    %ebx
 6d8:	5e                   	pop    %esi
 6d9:	5f                   	pop    %edi
 6da:	5d                   	pop    %ebp
 6db:	c3                   	ret    
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        freepptr = &freep;
 6e0:	a1 2c 0c 00 00       	mov    0xc2c,%eax
 6e5:	bf 2c 0c 00 00       	mov    $0xc2c,%edi
    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 6ea:	e9 69 ff ff ff       	jmp    658 <vfree+0x28>
 6ef:	90                   	nop

000006f0 <vmalloc>:
void* vmalloc(uint nbytes, int use_huge_pages) {
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 1c             	sub    $0x1c,%esp
 6f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (use_huge_pages) {
 6fc:	85 db                	test   %ebx,%ebx
 6fe:	0f 84 0c 01 00 00    	je     810 <vmalloc+0x120>
        if ((prevp = huge_freep) == 0) {
 704:	8b 15 20 0c 00 00    	mov    0xc20,%edx
 70a:	85 d2                	test   %edx,%edx
 70c:	0f 84 ee f8 ff ff    	je     0 <vmalloc.cold>
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 712:	8b 45 08             	mov    0x8(%ebp),%eax
 715:	8d 78 07             	lea    0x7(%eax),%edi
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 718:	8b 02                	mov    (%edx),%eax
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 71a:	c1 ef 03             	shr    $0x3,%edi
        if (p->s.size >= nunits) {
 71d:	8b 48 04             	mov    0x4(%eax),%ecx
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 720:	83 c7 01             	add    $0x1,%edi
        if (p->s.size >= nunits) {
 723:	39 f9                	cmp    %edi,%ecx
 725:	0f 83 c5 00 00 00    	jae    7f0 <vmalloc+0x100>
 72b:	be 00 10 00 00       	mov    $0x1000,%esi
 730:	ba 00 00 40 00       	mov    $0x400000,%edx
 735:	39 f7                	cmp    %esi,%edi
 737:	0f 43 f7             	cmovae %edi,%esi
 73a:	39 d7                	cmp    %edx,%edi
 73c:	0f 43 d7             	cmovae %edi,%edx
  p = sbrk(nu * sizeof(Header));
 73f:	8d 0c f5 00 00 00 00 	lea    0x0(,%esi,8),%ecx
 746:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 749:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
 750:	89 55 dc             	mov    %edx,-0x24(%ebp)
 753:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 756:	eb 15                	jmp    76d <vmalloc+0x7d>
 758:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75f:	90                   	nop
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 760:	8b 02                	mov    (%edx),%eax
        if (p->s.size >= nunits) {
 762:	8b 48 04             	mov    0x4(%eax),%ecx
 765:	39 f9                	cmp    %edi,%ecx
 767:	0f 83 83 00 00 00    	jae    7f0 <vmalloc+0x100>
        if (p == freep) {
 76d:	89 c2                	mov    %eax,%edx
 76f:	39 05 2c 0c 00 00    	cmp    %eax,0xc2c
 775:	75 e9                	jne    760 <vmalloc+0x70>
  if(use_huge_pages){
 777:	85 db                	test   %ebx,%ebx
 779:	74 45                	je     7c0 <vmalloc+0xd0>
  p = sbrk(nu * sizeof(Header));
 77b:	83 ec 0c             	sub    $0xc,%esp
 77e:	ff 75 e0             	push   -0x20(%ebp)
 781:	e8 15 fc ff ff       	call   39b <sbrk>
  if(p == (char*)-1)
 786:	83 c4 10             	add    $0x10,%esp
 789:	83 f8 ff             	cmp    $0xffffffff,%eax
 78c:	74 20                	je     7ae <vmalloc+0xbe>
  hp->s.size = nu;
 78e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  vfree((void*)(hp + 1), use_huge_pages);
 791:	83 ec 08             	sub    $0x8,%esp
 794:	83 c0 08             	add    $0x8,%eax
  hp->s.size = nu;
 797:	89 48 fc             	mov    %ecx,-0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 79a:	53                   	push   %ebx
 79b:	50                   	push   %eax
 79c:	e8 8f fe ff ff       	call   630 <vfree>
  return use_huge_pages ? huge_freep : freep;
 7a1:	8b 15 20 0c 00 00    	mov    0xc20,%edx
 7a7:	83 c4 10             	add    $0x10,%esp
            if (p == 0) {
 7aa:	85 d2                	test   %edx,%edx
 7ac:	75 b2                	jne    760 <vmalloc+0x70>
}
 7ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
                return 0;
 7b1:	31 c0                	xor    %eax,%eax
}
 7b3:	5b                   	pop    %ebx
 7b4:	5e                   	pop    %esi
 7b5:	5f                   	pop    %edi
 7b6:	5d                   	pop    %ebp
 7b7:	c3                   	ret    
 7b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bf:	90                   	nop
  p = sbrk(nu * sizeof(Header));
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	ff 75 e4             	push   -0x1c(%ebp)
 7c6:	e8 d0 fb ff ff       	call   39b <sbrk>
  if(p == (char*)-1)
 7cb:	83 c4 10             	add    $0x10,%esp
 7ce:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d1:	74 db                	je     7ae <vmalloc+0xbe>
  hp->s.size = nu;
 7d3:	89 70 04             	mov    %esi,0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 7d6:	83 ec 08             	sub    $0x8,%esp
 7d9:	83 c0 08             	add    $0x8,%eax
 7dc:	6a 00                	push   $0x0
 7de:	50                   	push   %eax
 7df:	e8 4c fe ff ff       	call   630 <vfree>
  return use_huge_pages ? huge_freep : freep;
 7e4:	8b 15 2c 0c 00 00    	mov    0xc2c,%edx
 7ea:	83 c4 10             	add    $0x10,%esp
 7ed:	eb bb                	jmp    7aa <vmalloc+0xba>
 7ef:	90                   	nop
            if (p->s.size == nunits) {
 7f0:	39 cf                	cmp    %ecx,%edi
 7f2:	74 34                	je     828 <vmalloc+0x138>
                p->s.size -= nunits;
 7f4:	29 f9                	sub    %edi,%ecx
 7f6:	89 48 04             	mov    %ecx,0x4(%eax)
                p += p->s.size;
 7f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
                p->s.size = nunits;
 7fc:	89 78 04             	mov    %edi,0x4(%eax)
            freep = prevp;
 7ff:	89 15 2c 0c 00 00    	mov    %edx,0xc2c
}
 805:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return (void*)(p + 1);
 808:	83 c0 08             	add    $0x8,%eax
}
 80b:	5b                   	pop    %ebx
 80c:	5e                   	pop    %esi
 80d:	5f                   	pop    %edi
 80e:	5d                   	pop    %ebp
 80f:	c3                   	ret    
        if ((prevp = freep) == 0) {
 810:	8b 15 2c 0c 00 00    	mov    0xc2c,%edx
 816:	85 d2                	test   %edx,%edx
 818:	0f 85 f4 fe ff ff    	jne    712 <vmalloc+0x22>
 81e:	e9 02 f8 ff ff       	jmp    25 <vmalloc.cold+0x25>
 823:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 827:	90                   	nop
                prevp->s.ptr = p->s.ptr;
 828:	8b 08                	mov    (%eax),%ecx
 82a:	89 0a                	mov    %ecx,(%edx)
 82c:	eb d1                	jmp    7ff <vmalloc+0x10f>
 82e:	66 90                	xchg   %ax,%ax

00000830 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	53                   	push   %ebx
 834:	83 ec 04             	sub    $0x4,%esp
 837:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 83a:	e8 8c fb ff ff       	call   3cb <getthp>


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
 83f:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 845:	76 19                	jbe    860 <malloc+0x30>
 847:	85 c0                	test   %eax,%eax
 849:	74 15                	je     860 <malloc+0x30>
    return vmalloc(nbytes, 1); // use the huge pages
 84b:	83 ec 08             	sub    $0x8,%esp
 84e:	6a 01                	push   $0x1
 850:	53                   	push   %ebx
 851:	e8 9a fe ff ff       	call   6f0 <vmalloc>
  }
  else{
    return vmalloc(nbytes, 0);
  }
}
 856:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 1); // use the huge pages
 859:	83 c4 10             	add    $0x10,%esp
}
 85c:	c9                   	leave  
 85d:	c3                   	ret    
 85e:	66 90                	xchg   %ax,%ax
    return vmalloc(nbytes, 0);
 860:	83 ec 08             	sub    $0x8,%esp
 863:	6a 00                	push   $0x0
 865:	53                   	push   %ebx
 866:	e8 85 fe ff ff       	call   6f0 <vmalloc>
}
 86b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 0);
 86e:	83 c4 10             	add    $0x10,%esp
}
 871:	c9                   	leave  
 872:	c3                   	ret    
 873:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000880 <free>:

void free(void * ap){
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
  vfree(ap, 0);
 883:	6a 00                	push   $0x0
 885:	ff 75 08             	push   0x8(%ebp)
 888:	e8 a3 fd ff ff       	call   630 <vfree>
}
 88d:	58                   	pop    %eax
 88e:	5a                   	pop    %edx
 88f:	c9                   	leave  
 890:	c3                   	ret    
