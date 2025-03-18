
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <vmalloc.cold>:

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
   0:	c7 05 cc 0b 00 00 d0 	movl   $0xbd0,0xbcc
   7:	0b 00 00 
   a:	c7 05 d0 0b 00 00 d0 	movl   $0xbd0,0xbd0
  11:	0b 00 00 
            huge_base.s.size = 0;
  14:	c7 05 d4 0b 00 00 00 	movl   $0x0,0xbd4
  1b:	00 00 00 
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
  1e:	a1 00 00 00 00       	mov    0x0,%eax
  23:	0f 0b                	ud2    
            base.s.ptr = freep = &base;
  25:	c7 05 d8 0b 00 00 dc 	movl   $0xbdc,0xbd8
  2c:	0b 00 00 
  2f:	c7 05 dc 0b 00 00 dc 	movl   $0xbdc,0xbdc
  36:	0b 00 00 
            base.s.size = 0;
  39:	c7 05 e0 0b 00 00 00 	movl   $0x0,0xbe0
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
main(void)
{
  50:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  54:	83 e4 f0             	and    $0xfffffff0,%esp
  57:	ff 71 fc             	push   -0x4(%ecx)
  5a:	55                   	push   %ebp
  5b:	89 e5                	mov    %esp,%ebp
  5d:	51                   	push   %ecx
  5e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  61:	e8 65 02 00 00       	call   2cb <fork>
  66:	85 c0                	test   %eax,%eax
  68:	7e 0d                	jle    77 <main+0x27>
    sleep(5);  // Let child exit before parent.
  6a:	83 ec 0c             	sub    $0xc,%esp
  6d:	6a 05                	push   $0x5
  6f:	e8 ef 02 00 00       	call   363 <sleep>
  74:	83 c4 10             	add    $0x10,%esp
  exit();
  77:	e8 57 02 00 00       	call   2d3 <exit>
  7c:	66 90                	xchg   %ax,%ax
  7e:	66 90                	xchg   %ax,%ax

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  80:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  81:	31 c0                	xor    %eax,%eax
{
  83:	89 e5                	mov    %esp,%ebp
  85:	53                   	push   %ebx
  86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  90:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  94:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  97:	83 c0 01             	add    $0x1,%eax
  9a:	84 d2                	test   %dl,%dl
  9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  9e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  a1:	89 c8                	mov    %ecx,%eax
  a3:	c9                   	leave  
  a4:	c3                   	ret    
  a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 55 08             	mov    0x8(%ebp),%edx
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ba:	0f b6 02             	movzbl (%edx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	75 17                	jne    d8 <strcmp+0x28>
  c1:	eb 3a                	jmp    fd <strcmp+0x4d>
  c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c7:	90                   	nop
  c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  cc:	83 c2 01             	add    $0x1,%edx
  cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  d2:	84 c0                	test   %al,%al
  d4:	74 1a                	je     f0 <strcmp+0x40>
    p++, q++;
  d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  d8:	0f b6 19             	movzbl (%ecx),%ebx
  db:	38 c3                	cmp    %al,%bl
  dd:	74 e9                	je     c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  df:	29 d8                	sub    %ebx,%eax
}
  e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e4:	c9                   	leave  
  e5:	c3                   	ret    
  e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  f4:	31 c0                	xor    %eax,%eax
  f6:	29 d8                	sub    %ebx,%eax
}
  f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  fb:	c9                   	leave  
  fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  fd:	0f b6 19             	movzbl (%ecx),%ebx
 100:	31 c0                	xor    %eax,%eax
 102:	eb db                	jmp    df <strcmp+0x2f>
 104:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 10f:	90                   	nop

00000110 <strlen>:

uint
strlen(const char *s)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 116:	80 3a 00             	cmpb   $0x0,(%edx)
 119:	74 15                	je     130 <strlen+0x20>
 11b:	31 c0                	xor    %eax,%eax
 11d:	8d 76 00             	lea    0x0(%esi),%esi
 120:	83 c0 01             	add    $0x1,%eax
 123:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 127:	89 c1                	mov    %eax,%ecx
 129:	75 f5                	jne    120 <strlen+0x10>
    ;
  return n;
}
 12b:	89 c8                	mov    %ecx,%eax
 12d:	5d                   	pop    %ebp
 12e:	c3                   	ret    
 12f:	90                   	nop
  for(n = 0; s[n]; n++)
 130:	31 c9                	xor    %ecx,%ecx
}
 132:	5d                   	pop    %ebp
 133:	89 c8                	mov    %ecx,%eax
 135:	c3                   	ret    
 136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13d:	8d 76 00             	lea    0x0(%esi),%esi

00000140 <memset>:

void*
memset(void *dst, int c, uint n)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 147:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14a:	8b 45 0c             	mov    0xc(%ebp),%eax
 14d:	89 d7                	mov    %edx,%edi
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 152:	8b 7d fc             	mov    -0x4(%ebp),%edi
 155:	89 d0                	mov    %edx,%eax
 157:	c9                   	leave  
 158:	c3                   	ret    
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000160 <strchr>:

char*
strchr(const char *s, char c)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 16a:	0f b6 10             	movzbl (%eax),%edx
 16d:	84 d2                	test   %dl,%dl
 16f:	75 12                	jne    183 <strchr+0x23>
 171:	eb 1d                	jmp    190 <strchr+0x30>
 173:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 177:	90                   	nop
 178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 17c:	83 c0 01             	add    $0x1,%eax
 17f:	84 d2                	test   %dl,%dl
 181:	74 0d                	je     190 <strchr+0x30>
    if(*s == c)
 183:	38 d1                	cmp    %dl,%cl
 185:	75 f1                	jne    178 <strchr+0x18>
      return (char*)s;
  return 0;
}
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 190:	31 c0                	xor    %eax,%eax
}
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    
 194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop

000001a0 <gets>:

char*
gets(char *buf, int max)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 1a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1a9:	31 db                	xor    %ebx,%ebx
{
 1ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ae:	eb 27                	jmp    1d7 <gets+0x37>
    cc = read(0, &c, 1);
 1b0:	83 ec 04             	sub    $0x4,%esp
 1b3:	6a 01                	push   $0x1
 1b5:	57                   	push   %edi
 1b6:	6a 00                	push   $0x0
 1b8:	e8 2e 01 00 00       	call   2eb <read>
    if(cc < 1)
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	85 c0                	test   %eax,%eax
 1c2:	7e 1d                	jle    1e1 <gets+0x41>
      break;
    buf[i++] = c;
 1c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1c8:	8b 55 08             	mov    0x8(%ebp),%edx
 1cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1cf:	3c 0a                	cmp    $0xa,%al
 1d1:	74 1d                	je     1f0 <gets+0x50>
 1d3:	3c 0d                	cmp    $0xd,%al
 1d5:	74 19                	je     1f0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1d7:	89 de                	mov    %ebx,%esi
 1d9:	83 c3 01             	add    $0x1,%ebx
 1dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1df:	7c cf                	jl     1b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1eb:	5b                   	pop    %ebx
 1ec:	5e                   	pop    %esi
 1ed:	5f                   	pop    %edi
 1ee:	5d                   	pop    %ebp
 1ef:	c3                   	ret    
  buf[i] = '\0';
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	89 de                	mov    %ebx,%esi
 1f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fc:	5b                   	pop    %ebx
 1fd:	5e                   	pop    %esi
 1fe:	5f                   	pop    %edi
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <stat>:

int
stat(const char *n, struct stat *st)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 215:	83 ec 08             	sub    $0x8,%esp
 218:	6a 00                	push   $0x0
 21a:	ff 75 08             	push   0x8(%ebp)
 21d:	e8 f1 00 00 00       	call   313 <open>
  if(fd < 0)
 222:	83 c4 10             	add    $0x10,%esp
 225:	85 c0                	test   %eax,%eax
 227:	78 27                	js     250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 229:	83 ec 08             	sub    $0x8,%esp
 22c:	ff 75 0c             	push   0xc(%ebp)
 22f:	89 c3                	mov    %eax,%ebx
 231:	50                   	push   %eax
 232:	e8 f4 00 00 00       	call   32b <fstat>
  close(fd);
 237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	e8 ba 00 00 00       	call   2fb <close>
  return r;
 241:	83 c4 10             	add    $0x10,%esp
}
 244:	8d 65 f8             	lea    -0x8(%ebp),%esp
 247:	89 f0                	mov    %esi,%eax
 249:	5b                   	pop    %ebx
 24a:	5e                   	pop    %esi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb ed                	jmp    244 <stat+0x34>
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 267:	0f be 02             	movsbl (%edx),%eax
 26a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 26d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 270:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 275:	77 1e                	ja     295 <atoi+0x35>
 277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 280:	83 c2 01             	add    $0x1,%edx
 283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 28a:	0f be 02             	movsbl (%edx),%eax
 28d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
  return n;
}
 295:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 298:	89 c8                	mov    %ecx,%eax
 29a:	c9                   	leave  
 29b:	c3                   	ret    
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	8b 45 10             	mov    0x10(%ebp),%eax
 2a7:	8b 55 08             	mov    0x8(%ebp),%edx
 2aa:	56                   	push   %esi
 2ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ae:	85 c0                	test   %eax,%eax
 2b0:	7e 13                	jle    2c5 <memmove+0x25>
 2b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2b4:	89 d7                	mov    %edx,%edi
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2c1:	39 f8                	cmp    %edi,%eax
 2c3:	75 fb                	jne    2c0 <memmove+0x20>
  return vdst;
}
 2c5:	5e                   	pop    %esi
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret    

000002cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2cb:	b8 01 00 00 00       	mov    $0x1,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <exit>:
SYSCALL(exit)
 2d3:	b8 02 00 00 00       	mov    $0x2,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <wait>:
SYSCALL(wait)
 2db:	b8 03 00 00 00       	mov    $0x3,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <pipe>:
SYSCALL(pipe)
 2e3:	b8 04 00 00 00       	mov    $0x4,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <read>:
SYSCALL(read)
 2eb:	b8 05 00 00 00       	mov    $0x5,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <write>:
SYSCALL(write)
 2f3:	b8 10 00 00 00       	mov    $0x10,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <close>:
SYSCALL(close)
 2fb:	b8 15 00 00 00       	mov    $0x15,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <kill>:
SYSCALL(kill)
 303:	b8 06 00 00 00       	mov    $0x6,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <exec>:
SYSCALL(exec)
 30b:	b8 07 00 00 00       	mov    $0x7,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <open>:
SYSCALL(open)
 313:	b8 0f 00 00 00       	mov    $0xf,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <mknod>:
SYSCALL(mknod)
 31b:	b8 11 00 00 00       	mov    $0x11,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <unlink>:
SYSCALL(unlink)
 323:	b8 12 00 00 00       	mov    $0x12,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <fstat>:
SYSCALL(fstat)
 32b:	b8 08 00 00 00       	mov    $0x8,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <link>:
SYSCALL(link)
 333:	b8 13 00 00 00       	mov    $0x13,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <mkdir>:
SYSCALL(mkdir)
 33b:	b8 14 00 00 00       	mov    $0x14,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <chdir>:
SYSCALL(chdir)
 343:	b8 09 00 00 00       	mov    $0x9,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <dup>:
SYSCALL(dup)
 34b:	b8 0a 00 00 00       	mov    $0xa,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <getpid>:
SYSCALL(getpid)
 353:	b8 0b 00 00 00       	mov    $0xb,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <sbrk>:
SYSCALL(sbrk)
 35b:	b8 0c 00 00 00       	mov    $0xc,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <sleep>:
SYSCALL(sleep)
 363:	b8 0d 00 00 00       	mov    $0xd,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <uptime>:
SYSCALL(uptime)
 36b:	b8 0e 00 00 00       	mov    $0xe,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <printhugepde>:
SYSCALL(printhugepde)
 373:	b8 16 00 00 00       	mov    $0x16,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 37b:	b8 17 00 00 00       	mov    $0x17,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <setthp>:
SYSCALL(setthp)
 383:	b8 18 00 00 00       	mov    $0x18,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <getthp>:
 38b:	b8 19 00 00 00       	mov    $0x19,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    
 393:	66 90                	xchg   %ax,%ax
 395:	66 90                	xchg   %ax,%ax
 397:	66 90                	xchg   %ax,%ax
 399:	66 90                	xchg   %ax,%ax
 39b:	66 90                	xchg   %ax,%ax
 39d:	66 90                	xchg   %ax,%ax
 39f:	90                   	nop

000003a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	56                   	push   %esi
 3a5:	53                   	push   %ebx
 3a6:	83 ec 3c             	sub    $0x3c,%esp
 3a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3ac:	89 d1                	mov    %edx,%ecx
{
 3ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 3b1:	85 d2                	test   %edx,%edx
 3b3:	0f 89 7f 00 00 00    	jns    438 <printint+0x98>
 3b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3bd:	74 79                	je     438 <printint+0x98>
    neg = 1;
 3bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 3c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 3c8:	31 db                	xor    %ebx,%ebx
 3ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3d0:	89 c8                	mov    %ecx,%eax
 3d2:	31 d2                	xor    %edx,%edx
 3d4:	89 cf                	mov    %ecx,%edi
 3d6:	f7 75 c4             	divl   -0x3c(%ebp)
 3d9:	0f b6 92 b4 08 00 00 	movzbl 0x8b4(%edx),%edx
 3e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3e3:	89 d8                	mov    %ebx,%eax
 3e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3f1:	76 dd                	jbe    3d0 <printint+0x30>
  if(neg)
 3f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3f6:	85 c9                	test   %ecx,%ecx
 3f8:	74 0c                	je     406 <printint+0x66>
    buf[i++] = '-';
 3fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 401:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 406:	8b 7d b8             	mov    -0x48(%ebp),%edi
 409:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 40d:	eb 07                	jmp    416 <printint+0x76>
 40f:	90                   	nop
    putc(fd, buf[i]);
 410:	0f b6 13             	movzbl (%ebx),%edx
 413:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 416:	83 ec 04             	sub    $0x4,%esp
 419:	88 55 d7             	mov    %dl,-0x29(%ebp)
 41c:	6a 01                	push   $0x1
 41e:	56                   	push   %esi
 41f:	57                   	push   %edi
 420:	e8 ce fe ff ff       	call   2f3 <write>
  while(--i >= 0)
 425:	83 c4 10             	add    $0x10,%esp
 428:	39 de                	cmp    %ebx,%esi
 42a:	75 e4                	jne    410 <printint+0x70>
}
 42c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42f:	5b                   	pop    %ebx
 430:	5e                   	pop    %esi
 431:	5f                   	pop    %edi
 432:	5d                   	pop    %ebp
 433:	c3                   	ret    
 434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 438:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 43f:	eb 87                	jmp    3c8 <printint+0x28>
 441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 448:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop

00000450 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 459:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 45c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 45f:	0f b6 13             	movzbl (%ebx),%edx
 462:	84 d2                	test   %dl,%dl
 464:	74 6a                	je     4d0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 466:	8d 45 10             	lea    0x10(%ebp),%eax
 469:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 46c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 46f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 471:	89 45 d0             	mov    %eax,-0x30(%ebp)
 474:	eb 36                	jmp    4ac <printf+0x5c>
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
 480:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 483:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 488:	83 f8 25             	cmp    $0x25,%eax
 48b:	74 15                	je     4a2 <printf+0x52>
  write(fd, &c, 1);
 48d:	83 ec 04             	sub    $0x4,%esp
 490:	88 55 e7             	mov    %dl,-0x19(%ebp)
 493:	6a 01                	push   $0x1
 495:	57                   	push   %edi
 496:	56                   	push   %esi
 497:	e8 57 fe ff ff       	call   2f3 <write>
 49c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 49f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4a2:	0f b6 13             	movzbl (%ebx),%edx
 4a5:	83 c3 01             	add    $0x1,%ebx
 4a8:	84 d2                	test   %dl,%dl
 4aa:	74 24                	je     4d0 <printf+0x80>
    c = fmt[i] & 0xff;
 4ac:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4af:	85 c9                	test   %ecx,%ecx
 4b1:	74 cd                	je     480 <printf+0x30>
      }
    } else if(state == '%'){
 4b3:	83 f9 25             	cmp    $0x25,%ecx
 4b6:	75 ea                	jne    4a2 <printf+0x52>
      if(c == 'd'){
 4b8:	83 f8 25             	cmp    $0x25,%eax
 4bb:	0f 84 07 01 00 00    	je     5c8 <printf+0x178>
 4c1:	83 e8 63             	sub    $0x63,%eax
 4c4:	83 f8 15             	cmp    $0x15,%eax
 4c7:	77 17                	ja     4e0 <printf+0x90>
 4c9:	ff 24 85 5c 08 00 00 	jmp    *0x85c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d3:	5b                   	pop    %ebx
 4d4:	5e                   	pop    %esi
 4d5:	5f                   	pop    %edi
 4d6:	5d                   	pop    %ebp
 4d7:	c3                   	ret    
 4d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop
  write(fd, &c, 1);
 4e0:	83 ec 04             	sub    $0x4,%esp
 4e3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 4e6:	6a 01                	push   $0x1
 4e8:	57                   	push   %edi
 4e9:	56                   	push   %esi
 4ea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4ee:	e8 00 fe ff ff       	call   2f3 <write>
        putc(fd, c);
 4f3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 4f7:	83 c4 0c             	add    $0xc,%esp
 4fa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4fd:	6a 01                	push   $0x1
 4ff:	57                   	push   %edi
 500:	56                   	push   %esi
 501:	e8 ed fd ff ff       	call   2f3 <write>
        putc(fd, c);
 506:	83 c4 10             	add    $0x10,%esp
      state = 0;
 509:	31 c9                	xor    %ecx,%ecx
 50b:	eb 95                	jmp    4a2 <printf+0x52>
 50d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 510:	83 ec 0c             	sub    $0xc,%esp
 513:	b9 10 00 00 00       	mov    $0x10,%ecx
 518:	6a 00                	push   $0x0
 51a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 51d:	8b 10                	mov    (%eax),%edx
 51f:	89 f0                	mov    %esi,%eax
 521:	e8 7a fe ff ff       	call   3a0 <printint>
        ap++;
 526:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 52a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 52d:	31 c9                	xor    %ecx,%ecx
 52f:	e9 6e ff ff ff       	jmp    4a2 <printf+0x52>
 534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 538:	8b 45 d0             	mov    -0x30(%ebp),%eax
 53b:	8b 10                	mov    (%eax),%edx
        ap++;
 53d:	83 c0 04             	add    $0x4,%eax
 540:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 543:	85 d2                	test   %edx,%edx
 545:	0f 84 8d 00 00 00    	je     5d8 <printf+0x188>
        while(*s != 0){
 54b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 54e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 550:	84 c0                	test   %al,%al
 552:	0f 84 4a ff ff ff    	je     4a2 <printf+0x52>
 558:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 55b:	89 d3                	mov    %edx,%ebx
 55d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 560:	83 ec 04             	sub    $0x4,%esp
          s++;
 563:	83 c3 01             	add    $0x1,%ebx
 566:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 569:	6a 01                	push   $0x1
 56b:	57                   	push   %edi
 56c:	56                   	push   %esi
 56d:	e8 81 fd ff ff       	call   2f3 <write>
        while(*s != 0){
 572:	0f b6 03             	movzbl (%ebx),%eax
 575:	83 c4 10             	add    $0x10,%esp
 578:	84 c0                	test   %al,%al
 57a:	75 e4                	jne    560 <printf+0x110>
      state = 0;
 57c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 57f:	31 c9                	xor    %ecx,%ecx
 581:	e9 1c ff ff ff       	jmp    4a2 <printf+0x52>
 586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 590:	83 ec 0c             	sub    $0xc,%esp
 593:	b9 0a 00 00 00       	mov    $0xa,%ecx
 598:	6a 01                	push   $0x1
 59a:	e9 7b ff ff ff       	jmp    51a <printf+0xca>
 59f:	90                   	nop
        putc(fd, *ap);
 5a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 5a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5a6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5a8:	6a 01                	push   $0x1
 5aa:	57                   	push   %edi
 5ab:	56                   	push   %esi
        putc(fd, *ap);
 5ac:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5af:	e8 3f fd ff ff       	call   2f3 <write>
        ap++;
 5b4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5bb:	31 c9                	xor    %ecx,%ecx
 5bd:	e9 e0 fe ff ff       	jmp    4a2 <printf+0x52>
 5c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 5c8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5cb:	83 ec 04             	sub    $0x4,%esp
 5ce:	e9 2a ff ff ff       	jmp    4fd <printf+0xad>
 5d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5d7:	90                   	nop
          s = "(null)";
 5d8:	ba 54 08 00 00       	mov    $0x854,%edx
        while(*s != 0){
 5dd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5e0:	b8 28 00 00 00       	mov    $0x28,%eax
 5e5:	89 d3                	mov    %edx,%ebx
 5e7:	e9 74 ff ff ff       	jmp    560 <printf+0x110>
 5ec:	66 90                	xchg   %ax,%ax
 5ee:	66 90                	xchg   %ax,%ax

000005f0 <vfree>:
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
 5f4:	56                   	push   %esi
 5f5:	53                   	push   %ebx
 5f6:	83 ec 04             	sub    $0x4,%esp
 5f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
 5fc:	8b 45 0c             	mov    0xc(%ebp),%eax
    bp = ((Header*)ap) - 1;
 5ff:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    if (use_huge_pages) {
 602:	85 c0                	test   %eax,%eax
 604:	0f 84 96 00 00 00    	je     6a0 <vfree+0xb0>
        freepptr = &huge_freep;
 60a:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 60f:	bf cc 0b 00 00       	mov    $0xbcc,%edi
 614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 618:	89 c2                	mov    %eax,%edx
 61a:	8b 00                	mov    (%eax),%eax
 61c:	39 ca                	cmp    %ecx,%edx
 61e:	73 38                	jae    658 <vfree+0x68>
 620:	39 c1                	cmp    %eax,%ecx
 622:	72 04                	jb     628 <vfree+0x38>
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 624:	39 c2                	cmp    %eax,%edx
 626:	72 f0                	jb     618 <vfree+0x28>
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
 628:	8b 73 fc             	mov    -0x4(%ebx),%esi
 62b:	89 7d f0             	mov    %edi,-0x10(%ebp)
 62e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 631:	39 f8                	cmp    %edi,%eax
 633:	74 38                	je     66d <vfree+0x7d>
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
 635:	89 43 f8             	mov    %eax,-0x8(%ebx)
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
 638:	8b 42 04             	mov    0x4(%edx),%eax
 63b:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 63e:	39 f1                	cmp    %esi,%ecx
 640:	74 42                	je     684 <vfree+0x94>
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
 642:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 645:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 647:	89 10                	mov    %edx,(%eax)
}
 649:	83 c4 04             	add    $0x4,%esp
 64c:	5b                   	pop    %ebx
 64d:	5e                   	pop    %esi
 64e:	5f                   	pop    %edi
 64f:	5d                   	pop    %ebp
 650:	c3                   	ret    
 651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 658:	39 c2                	cmp    %eax,%edx
 65a:	72 bc                	jb     618 <vfree+0x28>
 65c:	39 c1                	cmp    %eax,%ecx
 65e:	73 b8                	jae    618 <vfree+0x28>
    if (bp + bp->s.size == p->s.ptr) {
 660:	8b 73 fc             	mov    -0x4(%ebx),%esi
 663:	89 7d f0             	mov    %edi,-0x10(%ebp)
 666:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 669:	39 f8                	cmp    %edi,%eax
 66b:	75 c8                	jne    635 <vfree+0x45>
        bp->s.size += p->s.ptr->s.size;
 66d:	03 70 04             	add    0x4(%eax),%esi
 670:	89 73 fc             	mov    %esi,-0x4(%ebx)
        bp->s.ptr = p->s.ptr->s.ptr;
 673:	8b 02                	mov    (%edx),%eax
 675:	8b 00                	mov    (%eax),%eax
 677:	89 43 f8             	mov    %eax,-0x8(%ebx)
    if (p + p->s.size == bp) {
 67a:	8b 42 04             	mov    0x4(%edx),%eax
 67d:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 680:	39 f1                	cmp    %esi,%ecx
 682:	75 be                	jne    642 <vfree+0x52>
        p->s.size += bp->s.size;
 684:	03 43 fc             	add    -0x4(%ebx),%eax
 687:	89 42 04             	mov    %eax,0x4(%edx)
    *freepptr = p;
 68a:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 68d:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 690:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 692:	89 10                	mov    %edx,(%eax)
}
 694:	83 c4 04             	add    $0x4,%esp
 697:	5b                   	pop    %ebx
 698:	5e                   	pop    %esi
 699:	5f                   	pop    %edi
 69a:	5d                   	pop    %ebp
 69b:	c3                   	ret    
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        freepptr = &freep;
 6a0:	a1 d8 0b 00 00       	mov    0xbd8,%eax
 6a5:	bf d8 0b 00 00       	mov    $0xbd8,%edi
    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 6aa:	e9 69 ff ff ff       	jmp    618 <vfree+0x28>
 6af:	90                   	nop

000006b0 <vmalloc>:
void* vmalloc(uint nbytes, int use_huge_pages) {
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 1c             	sub    $0x1c,%esp
 6b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (use_huge_pages) {
 6bc:	85 db                	test   %ebx,%ebx
 6be:	0f 84 0c 01 00 00    	je     7d0 <vmalloc+0x120>
        if ((prevp = huge_freep) == 0) {
 6c4:	8b 15 cc 0b 00 00    	mov    0xbcc,%edx
 6ca:	85 d2                	test   %edx,%edx
 6cc:	0f 84 2e f9 ff ff    	je     0 <vmalloc.cold>
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 6d2:	8b 45 08             	mov    0x8(%ebp),%eax
 6d5:	8d 78 07             	lea    0x7(%eax),%edi
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 6d8:	8b 02                	mov    (%edx),%eax
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 6da:	c1 ef 03             	shr    $0x3,%edi
        if (p->s.size >= nunits) {
 6dd:	8b 48 04             	mov    0x4(%eax),%ecx
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 6e0:	83 c7 01             	add    $0x1,%edi
        if (p->s.size >= nunits) {
 6e3:	39 f9                	cmp    %edi,%ecx
 6e5:	0f 83 c5 00 00 00    	jae    7b0 <vmalloc+0x100>
 6eb:	be 00 10 00 00       	mov    $0x1000,%esi
 6f0:	ba 00 00 40 00       	mov    $0x400000,%edx
 6f5:	39 f7                	cmp    %esi,%edi
 6f7:	0f 43 f7             	cmovae %edi,%esi
 6fa:	39 d7                	cmp    %edx,%edi
 6fc:	0f 43 d7             	cmovae %edi,%edx
  p = sbrk(nu * sizeof(Header));
 6ff:	8d 0c f5 00 00 00 00 	lea    0x0(,%esi,8),%ecx
 706:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 709:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
 710:	89 55 dc             	mov    %edx,-0x24(%ebp)
 713:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 716:	eb 15                	jmp    72d <vmalloc+0x7d>
 718:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71f:	90                   	nop
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 720:	8b 02                	mov    (%edx),%eax
        if (p->s.size >= nunits) {
 722:	8b 48 04             	mov    0x4(%eax),%ecx
 725:	39 f9                	cmp    %edi,%ecx
 727:	0f 83 83 00 00 00    	jae    7b0 <vmalloc+0x100>
        if (p == freep) {
 72d:	89 c2                	mov    %eax,%edx
 72f:	39 05 d8 0b 00 00    	cmp    %eax,0xbd8
 735:	75 e9                	jne    720 <vmalloc+0x70>
  if(use_huge_pages){
 737:	85 db                	test   %ebx,%ebx
 739:	74 45                	je     780 <vmalloc+0xd0>
  p = sbrk(nu * sizeof(Header));
 73b:	83 ec 0c             	sub    $0xc,%esp
 73e:	ff 75 e0             	push   -0x20(%ebp)
 741:	e8 15 fc ff ff       	call   35b <sbrk>
  if(p == (char*)-1)
 746:	83 c4 10             	add    $0x10,%esp
 749:	83 f8 ff             	cmp    $0xffffffff,%eax
 74c:	74 20                	je     76e <vmalloc+0xbe>
  hp->s.size = nu;
 74e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  vfree((void*)(hp + 1), use_huge_pages);
 751:	83 ec 08             	sub    $0x8,%esp
 754:	83 c0 08             	add    $0x8,%eax
  hp->s.size = nu;
 757:	89 48 fc             	mov    %ecx,-0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 75a:	53                   	push   %ebx
 75b:	50                   	push   %eax
 75c:	e8 8f fe ff ff       	call   5f0 <vfree>
  return use_huge_pages ? huge_freep : freep;
 761:	8b 15 cc 0b 00 00    	mov    0xbcc,%edx
 767:	83 c4 10             	add    $0x10,%esp
            if (p == 0) {
 76a:	85 d2                	test   %edx,%edx
 76c:	75 b2                	jne    720 <vmalloc+0x70>
}
 76e:	8d 65 f4             	lea    -0xc(%ebp),%esp
                return 0;
 771:	31 c0                	xor    %eax,%eax
}
 773:	5b                   	pop    %ebx
 774:	5e                   	pop    %esi
 775:	5f                   	pop    %edi
 776:	5d                   	pop    %ebp
 777:	c3                   	ret    
 778:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77f:	90                   	nop
  p = sbrk(nu * sizeof(Header));
 780:	83 ec 0c             	sub    $0xc,%esp
 783:	ff 75 e4             	push   -0x1c(%ebp)
 786:	e8 d0 fb ff ff       	call   35b <sbrk>
  if(p == (char*)-1)
 78b:	83 c4 10             	add    $0x10,%esp
 78e:	83 f8 ff             	cmp    $0xffffffff,%eax
 791:	74 db                	je     76e <vmalloc+0xbe>
  hp->s.size = nu;
 793:	89 70 04             	mov    %esi,0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 796:	83 ec 08             	sub    $0x8,%esp
 799:	83 c0 08             	add    $0x8,%eax
 79c:	6a 00                	push   $0x0
 79e:	50                   	push   %eax
 79f:	e8 4c fe ff ff       	call   5f0 <vfree>
  return use_huge_pages ? huge_freep : freep;
 7a4:	8b 15 d8 0b 00 00    	mov    0xbd8,%edx
 7aa:	83 c4 10             	add    $0x10,%esp
 7ad:	eb bb                	jmp    76a <vmalloc+0xba>
 7af:	90                   	nop
            if (p->s.size == nunits) {
 7b0:	39 cf                	cmp    %ecx,%edi
 7b2:	74 34                	je     7e8 <vmalloc+0x138>
                p->s.size -= nunits;
 7b4:	29 f9                	sub    %edi,%ecx
 7b6:	89 48 04             	mov    %ecx,0x4(%eax)
                p += p->s.size;
 7b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
                p->s.size = nunits;
 7bc:	89 78 04             	mov    %edi,0x4(%eax)
            freep = prevp;
 7bf:	89 15 d8 0b 00 00    	mov    %edx,0xbd8
}
 7c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return (void*)(p + 1);
 7c8:	83 c0 08             	add    $0x8,%eax
}
 7cb:	5b                   	pop    %ebx
 7cc:	5e                   	pop    %esi
 7cd:	5f                   	pop    %edi
 7ce:	5d                   	pop    %ebp
 7cf:	c3                   	ret    
        if ((prevp = freep) == 0) {
 7d0:	8b 15 d8 0b 00 00    	mov    0xbd8,%edx
 7d6:	85 d2                	test   %edx,%edx
 7d8:	0f 85 f4 fe ff ff    	jne    6d2 <vmalloc+0x22>
 7de:	e9 42 f8 ff ff       	jmp    25 <vmalloc.cold+0x25>
 7e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7e7:	90                   	nop
                prevp->s.ptr = p->s.ptr;
 7e8:	8b 08                	mov    (%eax),%ecx
 7ea:	89 0a                	mov    %ecx,(%edx)
 7ec:	eb d1                	jmp    7bf <vmalloc+0x10f>
 7ee:	66 90                	xchg   %ax,%ax

000007f0 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	53                   	push   %ebx
 7f4:	83 ec 04             	sub    $0x4,%esp
 7f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 7fa:	e8 8c fb ff ff       	call   38b <getthp>


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
 7ff:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 805:	76 19                	jbe    820 <malloc+0x30>
 807:	85 c0                	test   %eax,%eax
 809:	74 15                	je     820 <malloc+0x30>
    return vmalloc(nbytes, 1); // use the huge pages
 80b:	83 ec 08             	sub    $0x8,%esp
 80e:	6a 01                	push   $0x1
 810:	53                   	push   %ebx
 811:	e8 9a fe ff ff       	call   6b0 <vmalloc>
  }
  else{
    return vmalloc(nbytes, 0);
  }
}
 816:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 1); // use the huge pages
 819:	83 c4 10             	add    $0x10,%esp
}
 81c:	c9                   	leave  
 81d:	c3                   	ret    
 81e:	66 90                	xchg   %ax,%ax
    return vmalloc(nbytes, 0);
 820:	83 ec 08             	sub    $0x8,%esp
 823:	6a 00                	push   $0x0
 825:	53                   	push   %ebx
 826:	e8 85 fe ff ff       	call   6b0 <vmalloc>
}
 82b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 0);
 82e:	83 c4 10             	add    $0x10,%esp
}
 831:	c9                   	leave  
 832:	c3                   	ret    
 833:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000840 <free>:

void free(void * ap){
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
  vfree(ap, 0);
 843:	6a 00                	push   $0x0
 845:	ff 75 08             	push   0x8(%ebp)
 848:	e8 a3 fd ff ff       	call   5f0 <vfree>
}
 84d:	58                   	pop    %eax
 84e:	5a                   	pop    %edx
 84f:	c9                   	leave  
 850:	c3                   	ret    
