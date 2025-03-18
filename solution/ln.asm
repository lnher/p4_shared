
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <vmalloc.cold>:

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
   0:	c7 05 28 0c 00 00 2c 	movl   $0xc2c,0xc28
   7:	0c 00 00 
   a:	c7 05 2c 0c 00 00 2c 	movl   $0xc2c,0xc2c
  11:	0c 00 00 
            huge_base.s.size = 0;
  14:	c7 05 30 0c 00 00 00 	movl   $0x0,0xc30
  1b:	00 00 00 
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
  1e:	a1 00 00 00 00       	mov    0x0,%eax
  23:	0f 0b                	ud2    
            base.s.ptr = freep = &base;
  25:	c7 05 34 0c 00 00 38 	movl   $0xc38,0xc34
  2c:	0c 00 00 
  2f:	c7 05 38 0c 00 00 38 	movl   $0xc38,0xc38
  36:	0c 00 00 
            base.s.size = 0;
  39:	c7 05 3c 0c 00 00 00 	movl   $0x0,0xc3c
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
  if(argc != 3){
  5a:	83 39 03             	cmpl   $0x3,(%ecx)
{
  5d:	55                   	push   %ebp
  5e:	89 e5                	mov    %esp,%ebp
  60:	53                   	push   %ebx
  61:	51                   	push   %ecx
  62:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  65:	74 13                	je     7a <main+0x2a>
    printf(2, "Usage: ln old new\n");
  67:	52                   	push   %edx
  68:	52                   	push   %edx
  69:	68 84 08 00 00       	push   $0x884
  6e:	6a 02                	push   $0x2
  70:	e8 0b 04 00 00       	call   480 <printf>
    exit();
  75:	e8 89 02 00 00       	call   303 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  7a:	50                   	push   %eax
  7b:	50                   	push   %eax
  7c:	ff 73 08             	push   0x8(%ebx)
  7f:	ff 73 04             	push   0x4(%ebx)
  82:	e8 dc 02 00 00       	call   363 <link>
  87:	83 c4 10             	add    $0x10,%esp
  8a:	85 c0                	test   %eax,%eax
  8c:	78 05                	js     93 <main+0x43>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  8e:	e8 70 02 00 00       	call   303 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  93:	ff 73 08             	push   0x8(%ebx)
  96:	ff 73 04             	push   0x4(%ebx)
  99:	68 97 08 00 00       	push   $0x897
  9e:	6a 02                	push   $0x2
  a0:	e8 db 03 00 00       	call   480 <printf>
  a5:	83 c4 10             	add    $0x10,%esp
  a8:	eb e4                	jmp    8e <main+0x3e>
  aa:	66 90                	xchg   %ax,%ax
  ac:	66 90                	xchg   %ax,%ax
  ae:	66 90                	xchg   %ax,%ax

000000b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  b0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  b1:	31 c0                	xor    %eax,%eax
{
  b3:	89 e5                	mov    %esp,%ebp
  b5:	53                   	push   %ebx
  b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  c0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  c4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  c7:	83 c0 01             	add    $0x1,%eax
  ca:	84 d2                	test   %dl,%dl
  cc:	75 f2                	jne    c0 <strcpy+0x10>
    ;
  return os;
}
  ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d1:	89 c8                	mov    %ecx,%eax
  d3:	c9                   	leave  
  d4:	c3                   	ret    
  d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	53                   	push   %ebx
  e4:	8b 55 08             	mov    0x8(%ebp),%edx
  e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ea:	0f b6 02             	movzbl (%edx),%eax
  ed:	84 c0                	test   %al,%al
  ef:	75 17                	jne    108 <strcmp+0x28>
  f1:	eb 3a                	jmp    12d <strcmp+0x4d>
  f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f7:	90                   	nop
  f8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  fc:	83 c2 01             	add    $0x1,%edx
  ff:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 102:	84 c0                	test   %al,%al
 104:	74 1a                	je     120 <strcmp+0x40>
    p++, q++;
 106:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 108:	0f b6 19             	movzbl (%ecx),%ebx
 10b:	38 c3                	cmp    %al,%bl
 10d:	74 e9                	je     f8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 10f:	29 d8                	sub    %ebx,%eax
}
 111:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 114:	c9                   	leave  
 115:	c3                   	ret    
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 120:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 124:	31 c0                	xor    %eax,%eax
 126:	29 d8                	sub    %ebx,%eax
}
 128:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 12b:	c9                   	leave  
 12c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 12d:	0f b6 19             	movzbl (%ecx),%ebx
 130:	31 c0                	xor    %eax,%eax
 132:	eb db                	jmp    10f <strcmp+0x2f>
 134:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 13f:	90                   	nop

00000140 <strlen>:

uint
strlen(const char *s)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 146:	80 3a 00             	cmpb   $0x0,(%edx)
 149:	74 15                	je     160 <strlen+0x20>
 14b:	31 c0                	xor    %eax,%eax
 14d:	8d 76 00             	lea    0x0(%esi),%esi
 150:	83 c0 01             	add    $0x1,%eax
 153:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 157:	89 c1                	mov    %eax,%ecx
 159:	75 f5                	jne    150 <strlen+0x10>
    ;
  return n;
}
 15b:	89 c8                	mov    %ecx,%eax
 15d:	5d                   	pop    %ebp
 15e:	c3                   	ret    
 15f:	90                   	nop
  for(n = 0; s[n]; n++)
 160:	31 c9                	xor    %ecx,%ecx
}
 162:	5d                   	pop    %ebp
 163:	89 c8                	mov    %ecx,%eax
 165:	c3                   	ret    
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi

00000170 <memset>:

void*
memset(void *dst, int c, uint n)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 177:	8b 4d 10             	mov    0x10(%ebp),%ecx
 17a:	8b 45 0c             	mov    0xc(%ebp),%eax
 17d:	89 d7                	mov    %edx,%edi
 17f:	fc                   	cld    
 180:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 182:	8b 7d fc             	mov    -0x4(%ebp),%edi
 185:	89 d0                	mov    %edx,%eax
 187:	c9                   	leave  
 188:	c3                   	ret    
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000190 <strchr>:

char*
strchr(const char *s, char c)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 19a:	0f b6 10             	movzbl (%eax),%edx
 19d:	84 d2                	test   %dl,%dl
 19f:	75 12                	jne    1b3 <strchr+0x23>
 1a1:	eb 1d                	jmp    1c0 <strchr+0x30>
 1a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a7:	90                   	nop
 1a8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ac:	83 c0 01             	add    $0x1,%eax
 1af:	84 d2                	test   %dl,%dl
 1b1:	74 0d                	je     1c0 <strchr+0x30>
    if(*s == c)
 1b3:	38 d1                	cmp    %dl,%cl
 1b5:	75 f1                	jne    1a8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1c0:	31 c0                	xor    %eax,%eax
}
 1c2:	5d                   	pop    %ebp
 1c3:	c3                   	ret    
 1c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <gets>:

char*
gets(char *buf, int max)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1d5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 1d8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1d9:	31 db                	xor    %ebx,%ebx
{
 1db:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1de:	eb 27                	jmp    207 <gets+0x37>
    cc = read(0, &c, 1);
 1e0:	83 ec 04             	sub    $0x4,%esp
 1e3:	6a 01                	push   $0x1
 1e5:	57                   	push   %edi
 1e6:	6a 00                	push   $0x0
 1e8:	e8 2e 01 00 00       	call   31b <read>
    if(cc < 1)
 1ed:	83 c4 10             	add    $0x10,%esp
 1f0:	85 c0                	test   %eax,%eax
 1f2:	7e 1d                	jle    211 <gets+0x41>
      break;
    buf[i++] = c;
 1f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1f8:	8b 55 08             	mov    0x8(%ebp),%edx
 1fb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1ff:	3c 0a                	cmp    $0xa,%al
 201:	74 1d                	je     220 <gets+0x50>
 203:	3c 0d                	cmp    $0xd,%al
 205:	74 19                	je     220 <gets+0x50>
  for(i=0; i+1 < max; ){
 207:	89 de                	mov    %ebx,%esi
 209:	83 c3 01             	add    $0x1,%ebx
 20c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 20f:	7c cf                	jl     1e0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 211:	8b 45 08             	mov    0x8(%ebp),%eax
 214:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 218:	8d 65 f4             	lea    -0xc(%ebp),%esp
 21b:	5b                   	pop    %ebx
 21c:	5e                   	pop    %esi
 21d:	5f                   	pop    %edi
 21e:	5d                   	pop    %ebp
 21f:	c3                   	ret    
  buf[i] = '\0';
 220:	8b 45 08             	mov    0x8(%ebp),%eax
 223:	89 de                	mov    %ebx,%esi
 225:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 229:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22c:	5b                   	pop    %ebx
 22d:	5e                   	pop    %esi
 22e:	5f                   	pop    %edi
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    
 231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 238:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop

00000240 <stat>:

int
stat(const char *n, struct stat *st)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	6a 00                	push   $0x0
 24a:	ff 75 08             	push   0x8(%ebp)
 24d:	e8 f1 00 00 00       	call   343 <open>
  if(fd < 0)
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	78 27                	js     280 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 259:	83 ec 08             	sub    $0x8,%esp
 25c:	ff 75 0c             	push   0xc(%ebp)
 25f:	89 c3                	mov    %eax,%ebx
 261:	50                   	push   %eax
 262:	e8 f4 00 00 00       	call   35b <fstat>
  close(fd);
 267:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 26a:	89 c6                	mov    %eax,%esi
  close(fd);
 26c:	e8 ba 00 00 00       	call   32b <close>
  return r;
 271:	83 c4 10             	add    $0x10,%esp
}
 274:	8d 65 f8             	lea    -0x8(%ebp),%esp
 277:	89 f0                	mov    %esi,%eax
 279:	5b                   	pop    %ebx
 27a:	5e                   	pop    %esi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
 27d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 280:	be ff ff ff ff       	mov    $0xffffffff,%esi
 285:	eb ed                	jmp    274 <stat+0x34>
 287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28e:	66 90                	xchg   %ax,%ax

00000290 <atoi>:

int
atoi(const char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 297:	0f be 02             	movsbl (%edx),%eax
 29a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 29d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2a0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2a5:	77 1e                	ja     2c5 <atoi+0x35>
 2a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ae:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ba:	0f be 02             	movsbl (%edx),%eax
 2bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x20>
  return n;
}
 2c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c8:	89 c8                	mov    %ecx,%eax
 2ca:	c9                   	leave  
 2cb:	c3                   	ret    
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	8b 45 10             	mov    0x10(%ebp),%eax
 2d7:	8b 55 08             	mov    0x8(%ebp),%edx
 2da:	56                   	push   %esi
 2db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2de:	85 c0                	test   %eax,%eax
 2e0:	7e 13                	jle    2f5 <memmove+0x25>
 2e2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2e4:	89 d7                	mov    %edx,%edi
 2e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2f1:	39 f8                	cmp    %edi,%eax
 2f3:	75 fb                	jne    2f0 <memmove+0x20>
  return vdst;
}
 2f5:	5e                   	pop    %esi
 2f6:	89 d0                	mov    %edx,%eax
 2f8:	5f                   	pop    %edi
 2f9:	5d                   	pop    %ebp
 2fa:	c3                   	ret    

000002fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2fb:	b8 01 00 00 00       	mov    $0x1,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <exit>:
SYSCALL(exit)
 303:	b8 02 00 00 00       	mov    $0x2,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <wait>:
SYSCALL(wait)
 30b:	b8 03 00 00 00       	mov    $0x3,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <pipe>:
SYSCALL(pipe)
 313:	b8 04 00 00 00       	mov    $0x4,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <read>:
SYSCALL(read)
 31b:	b8 05 00 00 00       	mov    $0x5,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <write>:
SYSCALL(write)
 323:	b8 10 00 00 00       	mov    $0x10,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <close>:
SYSCALL(close)
 32b:	b8 15 00 00 00       	mov    $0x15,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <kill>:
SYSCALL(kill)
 333:	b8 06 00 00 00       	mov    $0x6,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <exec>:
SYSCALL(exec)
 33b:	b8 07 00 00 00       	mov    $0x7,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <open>:
SYSCALL(open)
 343:	b8 0f 00 00 00       	mov    $0xf,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <mknod>:
SYSCALL(mknod)
 34b:	b8 11 00 00 00       	mov    $0x11,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <unlink>:
SYSCALL(unlink)
 353:	b8 12 00 00 00       	mov    $0x12,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <fstat>:
SYSCALL(fstat)
 35b:	b8 08 00 00 00       	mov    $0x8,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <link>:
SYSCALL(link)
 363:	b8 13 00 00 00       	mov    $0x13,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <mkdir>:
SYSCALL(mkdir)
 36b:	b8 14 00 00 00       	mov    $0x14,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <chdir>:
SYSCALL(chdir)
 373:	b8 09 00 00 00       	mov    $0x9,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <dup>:
SYSCALL(dup)
 37b:	b8 0a 00 00 00       	mov    $0xa,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <getpid>:
SYSCALL(getpid)
 383:	b8 0b 00 00 00       	mov    $0xb,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <sbrk>:
SYSCALL(sbrk)
 38b:	b8 0c 00 00 00       	mov    $0xc,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <sleep>:
SYSCALL(sleep)
 393:	b8 0d 00 00 00       	mov    $0xd,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <uptime>:
SYSCALL(uptime)
 39b:	b8 0e 00 00 00       	mov    $0xe,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <printhugepde>:
SYSCALL(printhugepde)
 3a3:	b8 16 00 00 00       	mov    $0x16,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 3ab:	b8 17 00 00 00       	mov    $0x17,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <setthp>:
SYSCALL(setthp)
 3b3:	b8 18 00 00 00       	mov    $0x18,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <getthp>:
 3bb:	b8 19 00 00 00       	mov    $0x19,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    
 3c3:	66 90                	xchg   %ax,%ax
 3c5:	66 90                	xchg   %ax,%ax
 3c7:	66 90                	xchg   %ax,%ax
 3c9:	66 90                	xchg   %ax,%ax
 3cb:	66 90                	xchg   %ax,%ax
 3cd:	66 90                	xchg   %ax,%ax
 3cf:	90                   	nop

000003d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	53                   	push   %ebx
 3d6:	83 ec 3c             	sub    $0x3c,%esp
 3d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3dc:	89 d1                	mov    %edx,%ecx
{
 3de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 3e1:	85 d2                	test   %edx,%edx
 3e3:	0f 89 7f 00 00 00    	jns    468 <printint+0x98>
 3e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3ed:	74 79                	je     468 <printint+0x98>
    neg = 1;
 3ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 3f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 3f8:	31 db                	xor    %ebx,%ebx
 3fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 400:	89 c8                	mov    %ecx,%eax
 402:	31 d2                	xor    %edx,%edx
 404:	89 cf                	mov    %ecx,%edi
 406:	f7 75 c4             	divl   -0x3c(%ebp)
 409:	0f b6 92 0c 09 00 00 	movzbl 0x90c(%edx),%edx
 410:	89 45 c0             	mov    %eax,-0x40(%ebp)
 413:	89 d8                	mov    %ebx,%eax
 415:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 418:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 41b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 41e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 421:	76 dd                	jbe    400 <printint+0x30>
  if(neg)
 423:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 426:	85 c9                	test   %ecx,%ecx
 428:	74 0c                	je     436 <printint+0x66>
    buf[i++] = '-';
 42a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 42f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 431:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 436:	8b 7d b8             	mov    -0x48(%ebp),%edi
 439:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 43d:	eb 07                	jmp    446 <printint+0x76>
 43f:	90                   	nop
    putc(fd, buf[i]);
 440:	0f b6 13             	movzbl (%ebx),%edx
 443:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 446:	83 ec 04             	sub    $0x4,%esp
 449:	88 55 d7             	mov    %dl,-0x29(%ebp)
 44c:	6a 01                	push   $0x1
 44e:	56                   	push   %esi
 44f:	57                   	push   %edi
 450:	e8 ce fe ff ff       	call   323 <write>
  while(--i >= 0)
 455:	83 c4 10             	add    $0x10,%esp
 458:	39 de                	cmp    %ebx,%esi
 45a:	75 e4                	jne    440 <printint+0x70>
}
 45c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45f:	5b                   	pop    %ebx
 460:	5e                   	pop    %esi
 461:	5f                   	pop    %edi
 462:	5d                   	pop    %ebp
 463:	c3                   	ret    
 464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 468:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 46f:	eb 87                	jmp    3f8 <printint+0x28>
 471:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 478:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop

00000480 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 489:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 48c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 48f:	0f b6 13             	movzbl (%ebx),%edx
 492:	84 d2                	test   %dl,%dl
 494:	74 6a                	je     500 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 496:	8d 45 10             	lea    0x10(%ebp),%eax
 499:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 49c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 49f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 4a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4a4:	eb 36                	jmp    4dc <printf+0x5c>
 4a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
 4b0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4b3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 4b8:	83 f8 25             	cmp    $0x25,%eax
 4bb:	74 15                	je     4d2 <printf+0x52>
  write(fd, &c, 1);
 4bd:	83 ec 04             	sub    $0x4,%esp
 4c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4c3:	6a 01                	push   $0x1
 4c5:	57                   	push   %edi
 4c6:	56                   	push   %esi
 4c7:	e8 57 fe ff ff       	call   323 <write>
 4cc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 4cf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4d2:	0f b6 13             	movzbl (%ebx),%edx
 4d5:	83 c3 01             	add    $0x1,%ebx
 4d8:	84 d2                	test   %dl,%dl
 4da:	74 24                	je     500 <printf+0x80>
    c = fmt[i] & 0xff;
 4dc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4df:	85 c9                	test   %ecx,%ecx
 4e1:	74 cd                	je     4b0 <printf+0x30>
      }
    } else if(state == '%'){
 4e3:	83 f9 25             	cmp    $0x25,%ecx
 4e6:	75 ea                	jne    4d2 <printf+0x52>
      if(c == 'd'){
 4e8:	83 f8 25             	cmp    $0x25,%eax
 4eb:	0f 84 07 01 00 00    	je     5f8 <printf+0x178>
 4f1:	83 e8 63             	sub    $0x63,%eax
 4f4:	83 f8 15             	cmp    $0x15,%eax
 4f7:	77 17                	ja     510 <printf+0x90>
 4f9:	ff 24 85 b4 08 00 00 	jmp    *0x8b4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 500:	8d 65 f4             	lea    -0xc(%ebp),%esp
 503:	5b                   	pop    %ebx
 504:	5e                   	pop    %esi
 505:	5f                   	pop    %edi
 506:	5d                   	pop    %ebp
 507:	c3                   	ret    
 508:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop
  write(fd, &c, 1);
 510:	83 ec 04             	sub    $0x4,%esp
 513:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 516:	6a 01                	push   $0x1
 518:	57                   	push   %edi
 519:	56                   	push   %esi
 51a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 51e:	e8 00 fe ff ff       	call   323 <write>
        putc(fd, c);
 523:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 527:	83 c4 0c             	add    $0xc,%esp
 52a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 52d:	6a 01                	push   $0x1
 52f:	57                   	push   %edi
 530:	56                   	push   %esi
 531:	e8 ed fd ff ff       	call   323 <write>
        putc(fd, c);
 536:	83 c4 10             	add    $0x10,%esp
      state = 0;
 539:	31 c9                	xor    %ecx,%ecx
 53b:	eb 95                	jmp    4d2 <printf+0x52>
 53d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 540:	83 ec 0c             	sub    $0xc,%esp
 543:	b9 10 00 00 00       	mov    $0x10,%ecx
 548:	6a 00                	push   $0x0
 54a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 54d:	8b 10                	mov    (%eax),%edx
 54f:	89 f0                	mov    %esi,%eax
 551:	e8 7a fe ff ff       	call   3d0 <printint>
        ap++;
 556:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 55a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 55d:	31 c9                	xor    %ecx,%ecx
 55f:	e9 6e ff ff ff       	jmp    4d2 <printf+0x52>
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 568:	8b 45 d0             	mov    -0x30(%ebp),%eax
 56b:	8b 10                	mov    (%eax),%edx
        ap++;
 56d:	83 c0 04             	add    $0x4,%eax
 570:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 573:	85 d2                	test   %edx,%edx
 575:	0f 84 8d 00 00 00    	je     608 <printf+0x188>
        while(*s != 0){
 57b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 57e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 580:	84 c0                	test   %al,%al
 582:	0f 84 4a ff ff ff    	je     4d2 <printf+0x52>
 588:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 58b:	89 d3                	mov    %edx,%ebx
 58d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 590:	83 ec 04             	sub    $0x4,%esp
          s++;
 593:	83 c3 01             	add    $0x1,%ebx
 596:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 599:	6a 01                	push   $0x1
 59b:	57                   	push   %edi
 59c:	56                   	push   %esi
 59d:	e8 81 fd ff ff       	call   323 <write>
        while(*s != 0){
 5a2:	0f b6 03             	movzbl (%ebx),%eax
 5a5:	83 c4 10             	add    $0x10,%esp
 5a8:	84 c0                	test   %al,%al
 5aa:	75 e4                	jne    590 <printf+0x110>
      state = 0;
 5ac:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 5af:	31 c9                	xor    %ecx,%ecx
 5b1:	e9 1c ff ff ff       	jmp    4d2 <printf+0x52>
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5c0:	83 ec 0c             	sub    $0xc,%esp
 5c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5c8:	6a 01                	push   $0x1
 5ca:	e9 7b ff ff ff       	jmp    54a <printf+0xca>
 5cf:	90                   	nop
        putc(fd, *ap);
 5d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 5d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5d6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5d8:	6a 01                	push   $0x1
 5da:	57                   	push   %edi
 5db:	56                   	push   %esi
        putc(fd, *ap);
 5dc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5df:	e8 3f fd ff ff       	call   323 <write>
        ap++;
 5e4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5eb:	31 c9                	xor    %ecx,%ecx
 5ed:	e9 e0 fe ff ff       	jmp    4d2 <printf+0x52>
 5f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 5f8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5fb:	83 ec 04             	sub    $0x4,%esp
 5fe:	e9 2a ff ff ff       	jmp    52d <printf+0xad>
 603:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 607:	90                   	nop
          s = "(null)";
 608:	ba ab 08 00 00       	mov    $0x8ab,%edx
        while(*s != 0){
 60d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 610:	b8 28 00 00 00       	mov    $0x28,%eax
 615:	89 d3                	mov    %edx,%ebx
 617:	e9 74 ff ff ff       	jmp    590 <printf+0x110>
 61c:	66 90                	xchg   %ax,%ax
 61e:	66 90                	xchg   %ax,%ax

00000620 <vfree>:
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	83 ec 04             	sub    $0x4,%esp
 629:	8b 5d 08             	mov    0x8(%ebp),%ebx
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
 62c:	8b 45 0c             	mov    0xc(%ebp),%eax
    bp = ((Header*)ap) - 1;
 62f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    if (use_huge_pages) {
 632:	85 c0                	test   %eax,%eax
 634:	0f 84 96 00 00 00    	je     6d0 <vfree+0xb0>
        freepptr = &huge_freep;
 63a:	a1 28 0c 00 00       	mov    0xc28,%eax
 63f:	bf 28 0c 00 00       	mov    $0xc28,%edi
 644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 648:	89 c2                	mov    %eax,%edx
 64a:	8b 00                	mov    (%eax),%eax
 64c:	39 ca                	cmp    %ecx,%edx
 64e:	73 38                	jae    688 <vfree+0x68>
 650:	39 c1                	cmp    %eax,%ecx
 652:	72 04                	jb     658 <vfree+0x38>
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 654:	39 c2                	cmp    %eax,%edx
 656:	72 f0                	jb     648 <vfree+0x28>
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
 658:	8b 73 fc             	mov    -0x4(%ebx),%esi
 65b:	89 7d f0             	mov    %edi,-0x10(%ebp)
 65e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 661:	39 f8                	cmp    %edi,%eax
 663:	74 38                	je     69d <vfree+0x7d>
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
 665:	89 43 f8             	mov    %eax,-0x8(%ebx)
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
 668:	8b 42 04             	mov    0x4(%edx),%eax
 66b:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 66e:	39 f1                	cmp    %esi,%ecx
 670:	74 42                	je     6b4 <vfree+0x94>
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
 672:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 675:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 677:	89 10                	mov    %edx,(%eax)
}
 679:	83 c4 04             	add    $0x4,%esp
 67c:	5b                   	pop    %ebx
 67d:	5e                   	pop    %esi
 67e:	5f                   	pop    %edi
 67f:	5d                   	pop    %ebp
 680:	c3                   	ret    
 681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 688:	39 c2                	cmp    %eax,%edx
 68a:	72 bc                	jb     648 <vfree+0x28>
 68c:	39 c1                	cmp    %eax,%ecx
 68e:	73 b8                	jae    648 <vfree+0x28>
    if (bp + bp->s.size == p->s.ptr) {
 690:	8b 73 fc             	mov    -0x4(%ebx),%esi
 693:	89 7d f0             	mov    %edi,-0x10(%ebp)
 696:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 699:	39 f8                	cmp    %edi,%eax
 69b:	75 c8                	jne    665 <vfree+0x45>
        bp->s.size += p->s.ptr->s.size;
 69d:	03 70 04             	add    0x4(%eax),%esi
 6a0:	89 73 fc             	mov    %esi,-0x4(%ebx)
        bp->s.ptr = p->s.ptr->s.ptr;
 6a3:	8b 02                	mov    (%edx),%eax
 6a5:	8b 00                	mov    (%eax),%eax
 6a7:	89 43 f8             	mov    %eax,-0x8(%ebx)
    if (p + p->s.size == bp) {
 6aa:	8b 42 04             	mov    0x4(%edx),%eax
 6ad:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6b0:	39 f1                	cmp    %esi,%ecx
 6b2:	75 be                	jne    672 <vfree+0x52>
        p->s.size += bp->s.size;
 6b4:	03 43 fc             	add    -0x4(%ebx),%eax
 6b7:	89 42 04             	mov    %eax,0x4(%edx)
    *freepptr = p;
 6ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 6bd:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6c0:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 6c2:	89 10                	mov    %edx,(%eax)
}
 6c4:	83 c4 04             	add    $0x4,%esp
 6c7:	5b                   	pop    %ebx
 6c8:	5e                   	pop    %esi
 6c9:	5f                   	pop    %edi
 6ca:	5d                   	pop    %ebp
 6cb:	c3                   	ret    
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        freepptr = &freep;
 6d0:	a1 34 0c 00 00       	mov    0xc34,%eax
 6d5:	bf 34 0c 00 00       	mov    $0xc34,%edi
    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 6da:	e9 69 ff ff ff       	jmp    648 <vfree+0x28>
 6df:	90                   	nop

000006e0 <vmalloc>:
void* vmalloc(uint nbytes, int use_huge_pages) {
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 1c             	sub    $0x1c,%esp
 6e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (use_huge_pages) {
 6ec:	85 db                	test   %ebx,%ebx
 6ee:	0f 84 0c 01 00 00    	je     800 <vmalloc+0x120>
        if ((prevp = huge_freep) == 0) {
 6f4:	8b 15 28 0c 00 00    	mov    0xc28,%edx
 6fa:	85 d2                	test   %edx,%edx
 6fc:	0f 84 fe f8 ff ff    	je     0 <vmalloc.cold>
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 702:	8b 45 08             	mov    0x8(%ebp),%eax
 705:	8d 78 07             	lea    0x7(%eax),%edi
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 708:	8b 02                	mov    (%edx),%eax
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 70a:	c1 ef 03             	shr    $0x3,%edi
        if (p->s.size >= nunits) {
 70d:	8b 48 04             	mov    0x4(%eax),%ecx
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 710:	83 c7 01             	add    $0x1,%edi
        if (p->s.size >= nunits) {
 713:	39 f9                	cmp    %edi,%ecx
 715:	0f 83 c5 00 00 00    	jae    7e0 <vmalloc+0x100>
 71b:	be 00 10 00 00       	mov    $0x1000,%esi
 720:	ba 00 00 40 00       	mov    $0x400000,%edx
 725:	39 f7                	cmp    %esi,%edi
 727:	0f 43 f7             	cmovae %edi,%esi
 72a:	39 d7                	cmp    %edx,%edi
 72c:	0f 43 d7             	cmovae %edi,%edx
  p = sbrk(nu * sizeof(Header));
 72f:	8d 0c f5 00 00 00 00 	lea    0x0(,%esi,8),%ecx
 736:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 739:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
 740:	89 55 dc             	mov    %edx,-0x24(%ebp)
 743:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 746:	eb 15                	jmp    75d <vmalloc+0x7d>
 748:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74f:	90                   	nop
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 750:	8b 02                	mov    (%edx),%eax
        if (p->s.size >= nunits) {
 752:	8b 48 04             	mov    0x4(%eax),%ecx
 755:	39 f9                	cmp    %edi,%ecx
 757:	0f 83 83 00 00 00    	jae    7e0 <vmalloc+0x100>
        if (p == freep) {
 75d:	89 c2                	mov    %eax,%edx
 75f:	39 05 34 0c 00 00    	cmp    %eax,0xc34
 765:	75 e9                	jne    750 <vmalloc+0x70>
  if(use_huge_pages){
 767:	85 db                	test   %ebx,%ebx
 769:	74 45                	je     7b0 <vmalloc+0xd0>
  p = sbrk(nu * sizeof(Header));
 76b:	83 ec 0c             	sub    $0xc,%esp
 76e:	ff 75 e0             	push   -0x20(%ebp)
 771:	e8 15 fc ff ff       	call   38b <sbrk>
  if(p == (char*)-1)
 776:	83 c4 10             	add    $0x10,%esp
 779:	83 f8 ff             	cmp    $0xffffffff,%eax
 77c:	74 20                	je     79e <vmalloc+0xbe>
  hp->s.size = nu;
 77e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  vfree((void*)(hp + 1), use_huge_pages);
 781:	83 ec 08             	sub    $0x8,%esp
 784:	83 c0 08             	add    $0x8,%eax
  hp->s.size = nu;
 787:	89 48 fc             	mov    %ecx,-0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 78a:	53                   	push   %ebx
 78b:	50                   	push   %eax
 78c:	e8 8f fe ff ff       	call   620 <vfree>
  return use_huge_pages ? huge_freep : freep;
 791:	8b 15 28 0c 00 00    	mov    0xc28,%edx
 797:	83 c4 10             	add    $0x10,%esp
            if (p == 0) {
 79a:	85 d2                	test   %edx,%edx
 79c:	75 b2                	jne    750 <vmalloc+0x70>
}
 79e:	8d 65 f4             	lea    -0xc(%ebp),%esp
                return 0;
 7a1:	31 c0                	xor    %eax,%eax
}
 7a3:	5b                   	pop    %ebx
 7a4:	5e                   	pop    %esi
 7a5:	5f                   	pop    %edi
 7a6:	5d                   	pop    %ebp
 7a7:	c3                   	ret    
 7a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop
  p = sbrk(nu * sizeof(Header));
 7b0:	83 ec 0c             	sub    $0xc,%esp
 7b3:	ff 75 e4             	push   -0x1c(%ebp)
 7b6:	e8 d0 fb ff ff       	call   38b <sbrk>
  if(p == (char*)-1)
 7bb:	83 c4 10             	add    $0x10,%esp
 7be:	83 f8 ff             	cmp    $0xffffffff,%eax
 7c1:	74 db                	je     79e <vmalloc+0xbe>
  hp->s.size = nu;
 7c3:	89 70 04             	mov    %esi,0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 7c6:	83 ec 08             	sub    $0x8,%esp
 7c9:	83 c0 08             	add    $0x8,%eax
 7cc:	6a 00                	push   $0x0
 7ce:	50                   	push   %eax
 7cf:	e8 4c fe ff ff       	call   620 <vfree>
  return use_huge_pages ? huge_freep : freep;
 7d4:	8b 15 34 0c 00 00    	mov    0xc34,%edx
 7da:	83 c4 10             	add    $0x10,%esp
 7dd:	eb bb                	jmp    79a <vmalloc+0xba>
 7df:	90                   	nop
            if (p->s.size == nunits) {
 7e0:	39 cf                	cmp    %ecx,%edi
 7e2:	74 34                	je     818 <vmalloc+0x138>
                p->s.size -= nunits;
 7e4:	29 f9                	sub    %edi,%ecx
 7e6:	89 48 04             	mov    %ecx,0x4(%eax)
                p += p->s.size;
 7e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
                p->s.size = nunits;
 7ec:	89 78 04             	mov    %edi,0x4(%eax)
            freep = prevp;
 7ef:	89 15 34 0c 00 00    	mov    %edx,0xc34
}
 7f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return (void*)(p + 1);
 7f8:	83 c0 08             	add    $0x8,%eax
}
 7fb:	5b                   	pop    %ebx
 7fc:	5e                   	pop    %esi
 7fd:	5f                   	pop    %edi
 7fe:	5d                   	pop    %ebp
 7ff:	c3                   	ret    
        if ((prevp = freep) == 0) {
 800:	8b 15 34 0c 00 00    	mov    0xc34,%edx
 806:	85 d2                	test   %edx,%edx
 808:	0f 85 f4 fe ff ff    	jne    702 <vmalloc+0x22>
 80e:	e9 12 f8 ff ff       	jmp    25 <vmalloc.cold+0x25>
 813:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 817:	90                   	nop
                prevp->s.ptr = p->s.ptr;
 818:	8b 08                	mov    (%eax),%ecx
 81a:	89 0a                	mov    %ecx,(%edx)
 81c:	eb d1                	jmp    7ef <vmalloc+0x10f>
 81e:	66 90                	xchg   %ax,%ax

00000820 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	53                   	push   %ebx
 824:	83 ec 04             	sub    $0x4,%esp
 827:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 82a:	e8 8c fb ff ff       	call   3bb <getthp>


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
 82f:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 835:	76 19                	jbe    850 <malloc+0x30>
 837:	85 c0                	test   %eax,%eax
 839:	74 15                	je     850 <malloc+0x30>
    return vmalloc(nbytes, 1); // use the huge pages
 83b:	83 ec 08             	sub    $0x8,%esp
 83e:	6a 01                	push   $0x1
 840:	53                   	push   %ebx
 841:	e8 9a fe ff ff       	call   6e0 <vmalloc>
  }
  else{
    return vmalloc(nbytes, 0);
  }
}
 846:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 1); // use the huge pages
 849:	83 c4 10             	add    $0x10,%esp
}
 84c:	c9                   	leave  
 84d:	c3                   	ret    
 84e:	66 90                	xchg   %ax,%ax
    return vmalloc(nbytes, 0);
 850:	83 ec 08             	sub    $0x8,%esp
 853:	6a 00                	push   $0x0
 855:	53                   	push   %ebx
 856:	e8 85 fe ff ff       	call   6e0 <vmalloc>
}
 85b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 0);
 85e:	83 c4 10             	add    $0x10,%esp
}
 861:	c9                   	leave  
 862:	c3                   	ret    
 863:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000870 <free>:

void free(void * ap){
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
  vfree(ap, 0);
 873:	6a 00                	push   $0x0
 875:	ff 75 08             	push   0x8(%ebp)
 878:	e8 a3 fd ff ff       	call   620 <vfree>
}
 87d:	58                   	pop    %eax
 87e:	5a                   	pop    %edx
 87f:	c9                   	leave  
 880:	c3                   	ret    
