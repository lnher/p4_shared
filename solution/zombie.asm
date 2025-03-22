
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 65 02 00 00       	call   27b <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 ef 02 00 00       	call   313 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 57 02 00 00       	call   283 <exit>
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  30:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  31:	31 c0                	xor    %eax,%eax
{
  33:	89 e5                	mov    %esp,%ebp
  35:	53                   	push   %ebx
  36:	8b 4d 08             	mov    0x8(%ebp),%ecx
  39:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  40:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  44:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  47:	83 c0 01             	add    $0x1,%eax
  4a:	84 d2                	test   %dl,%dl
  4c:	75 f2                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  51:	89 c8                	mov    %ecx,%eax
  53:	c9                   	leave  
  54:	c3                   	ret    
  55:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 55 08             	mov    0x8(%ebp),%edx
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  6a:	0f b6 02             	movzbl (%edx),%eax
  6d:	84 c0                	test   %al,%al
  6f:	75 17                	jne    88 <strcmp+0x28>
  71:	eb 3a                	jmp    ad <strcmp+0x4d>
  73:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  77:	90                   	nop
  78:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  7c:	83 c2 01             	add    $0x1,%edx
  7f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  82:	84 c0                	test   %al,%al
  84:	74 1a                	je     a0 <strcmp+0x40>
    p++, q++;
  86:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  88:	0f b6 19             	movzbl (%ecx),%ebx
  8b:	38 c3                	cmp    %al,%bl
  8d:	74 e9                	je     78 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  8f:	29 d8                	sub    %ebx,%eax
}
  91:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  94:	c9                   	leave  
  95:	c3                   	ret    
  96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  a4:	31 c0                	xor    %eax,%eax
  a6:	29 d8                	sub    %ebx,%eax
}
  a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ab:	c9                   	leave  
  ac:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  ad:	0f b6 19             	movzbl (%ecx),%ebx
  b0:	31 c0                	xor    %eax,%eax
  b2:	eb db                	jmp    8f <strcmp+0x2f>
  b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bf:	90                   	nop

000000c0 <strlen>:

uint
strlen(const char *s)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  c6:	80 3a 00             	cmpb   $0x0,(%edx)
  c9:	74 15                	je     e0 <strlen+0x20>
  cb:	31 c0                	xor    %eax,%eax
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  d0:	83 c0 01             	add    $0x1,%eax
  d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d7:	89 c1                	mov    %eax,%ecx
  d9:	75 f5                	jne    d0 <strlen+0x10>
    ;
  return n;
}
  db:	89 c8                	mov    %ecx,%eax
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret    
  df:	90                   	nop
  for(n = 0; s[n]; n++)
  e0:	31 c9                	xor    %ecx,%ecx
}
  e2:	5d                   	pop    %ebp
  e3:	89 c8                	mov    %ecx,%eax
  e5:	c3                   	ret    
  e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ed:	8d 76 00             	lea    0x0(%esi),%esi

000000f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	89 d7                	mov    %edx,%edi
  ff:	fc                   	cld    
 100:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 102:	8b 7d fc             	mov    -0x4(%ebp),%edi
 105:	89 d0                	mov    %edx,%eax
 107:	c9                   	leave  
 108:	c3                   	ret    
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000110 <strchr>:

char*
strchr(const char *s, char c)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 11a:	0f b6 10             	movzbl (%eax),%edx
 11d:	84 d2                	test   %dl,%dl
 11f:	75 12                	jne    133 <strchr+0x23>
 121:	eb 1d                	jmp    140 <strchr+0x30>
 123:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 127:	90                   	nop
 128:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 12c:	83 c0 01             	add    $0x1,%eax
 12f:	84 d2                	test   %dl,%dl
 131:	74 0d                	je     140 <strchr+0x30>
    if(*s == c)
 133:	38 d1                	cmp    %dl,%cl
 135:	75 f1                	jne    128 <strchr+0x18>
      return (char*)s;
  return 0;
}
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 140:	31 c0                	xor    %eax,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <gets>:

char*
gets(char *buf, int max)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 155:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 158:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 159:	31 db                	xor    %ebx,%ebx
{
 15b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 15e:	eb 27                	jmp    187 <gets+0x37>
    cc = read(0, &c, 1);
 160:	83 ec 04             	sub    $0x4,%esp
 163:	6a 01                	push   $0x1
 165:	57                   	push   %edi
 166:	6a 00                	push   $0x0
 168:	e8 2e 01 00 00       	call   29b <read>
    if(cc < 1)
 16d:	83 c4 10             	add    $0x10,%esp
 170:	85 c0                	test   %eax,%eax
 172:	7e 1d                	jle    191 <gets+0x41>
      break;
    buf[i++] = c;
 174:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 178:	8b 55 08             	mov    0x8(%ebp),%edx
 17b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 17f:	3c 0a                	cmp    $0xa,%al
 181:	74 1d                	je     1a0 <gets+0x50>
 183:	3c 0d                	cmp    $0xd,%al
 185:	74 19                	je     1a0 <gets+0x50>
  for(i=0; i+1 < max; ){
 187:	89 de                	mov    %ebx,%esi
 189:	83 c3 01             	add    $0x1,%ebx
 18c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 18f:	7c cf                	jl     160 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 191:	8b 45 08             	mov    0x8(%ebp),%eax
 194:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 198:	8d 65 f4             	lea    -0xc(%ebp),%esp
 19b:	5b                   	pop    %ebx
 19c:	5e                   	pop    %esi
 19d:	5f                   	pop    %edi
 19e:	5d                   	pop    %ebp
 19f:	c3                   	ret    
  buf[i] = '\0';
 1a0:	8b 45 08             	mov    0x8(%ebp),%eax
 1a3:	89 de                	mov    %ebx,%esi
 1a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ac:	5b                   	pop    %ebx
 1ad:	5e                   	pop    %esi
 1ae:	5f                   	pop    %edi
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bf:	90                   	nop

000001c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c5:	83 ec 08             	sub    $0x8,%esp
 1c8:	6a 00                	push   $0x0
 1ca:	ff 75 08             	push   0x8(%ebp)
 1cd:	e8 f1 00 00 00       	call   2c3 <open>
  if(fd < 0)
 1d2:	83 c4 10             	add    $0x10,%esp
 1d5:	85 c0                	test   %eax,%eax
 1d7:	78 27                	js     200 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	ff 75 0c             	push   0xc(%ebp)
 1df:	89 c3                	mov    %eax,%ebx
 1e1:	50                   	push   %eax
 1e2:	e8 f4 00 00 00       	call   2db <fstat>
  close(fd);
 1e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1ea:	89 c6                	mov    %eax,%esi
  close(fd);
 1ec:	e8 ba 00 00 00       	call   2ab <close>
  return r;
 1f1:	83 c4 10             	add    $0x10,%esp
}
 1f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f7:	89 f0                	mov    %esi,%eax
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 200:	be ff ff ff ff       	mov    $0xffffffff,%esi
 205:	eb ed                	jmp    1f4 <stat+0x34>
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax

00000210 <atoi>:

int
atoi(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 217:	0f be 02             	movsbl (%edx),%eax
 21a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 21d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 220:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 225:	77 1e                	ja     245 <atoi+0x35>
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 230:	83 c2 01             	add    $0x1,%edx
 233:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 236:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 23a:	0f be 02             	movsbl (%edx),%eax
 23d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 240:	80 fb 09             	cmp    $0x9,%bl
 243:	76 eb                	jbe    230 <atoi+0x20>
  return n;
}
 245:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 248:	89 c8                	mov    %ecx,%eax
 24a:	c9                   	leave  
 24b:	c3                   	ret    
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 45 10             	mov    0x10(%ebp),%eax
 257:	8b 55 08             	mov    0x8(%ebp),%edx
 25a:	56                   	push   %esi
 25b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 25e:	85 c0                	test   %eax,%eax
 260:	7e 13                	jle    275 <memmove+0x25>
 262:	01 d0                	add    %edx,%eax
  dst = vdst;
 264:	89 d7                	mov    %edx,%edi
 266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 270:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 271:	39 f8                	cmp    %edi,%eax
 273:	75 fb                	jne    270 <memmove+0x20>
  return vdst;
}
 275:	5e                   	pop    %esi
 276:	89 d0                	mov    %edx,%eax
 278:	5f                   	pop    %edi
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    

0000027b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27b:	b8 01 00 00 00       	mov    $0x1,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <exit>:
SYSCALL(exit)
 283:	b8 02 00 00 00       	mov    $0x2,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <wait>:
SYSCALL(wait)
 28b:	b8 03 00 00 00       	mov    $0x3,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <pipe>:
SYSCALL(pipe)
 293:	b8 04 00 00 00       	mov    $0x4,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <read>:
SYSCALL(read)
 29b:	b8 05 00 00 00       	mov    $0x5,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <write>:
SYSCALL(write)
 2a3:	b8 10 00 00 00       	mov    $0x10,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <close>:
SYSCALL(close)
 2ab:	b8 15 00 00 00       	mov    $0x15,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <kill>:
SYSCALL(kill)
 2b3:	b8 06 00 00 00       	mov    $0x6,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <exec>:
SYSCALL(exec)
 2bb:	b8 07 00 00 00       	mov    $0x7,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <open>:
SYSCALL(open)
 2c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <mknod>:
SYSCALL(mknod)
 2cb:	b8 11 00 00 00       	mov    $0x11,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <unlink>:
SYSCALL(unlink)
 2d3:	b8 12 00 00 00       	mov    $0x12,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <fstat>:
SYSCALL(fstat)
 2db:	b8 08 00 00 00       	mov    $0x8,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <link>:
SYSCALL(link)
 2e3:	b8 13 00 00 00       	mov    $0x13,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <mkdir>:
SYSCALL(mkdir)
 2eb:	b8 14 00 00 00       	mov    $0x14,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <chdir>:
SYSCALL(chdir)
 2f3:	b8 09 00 00 00       	mov    $0x9,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <dup>:
SYSCALL(dup)
 2fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <getpid>:
SYSCALL(getpid)
 303:	b8 0b 00 00 00       	mov    $0xb,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <sbrk>:
SYSCALL(sbrk)
 30b:	b8 0c 00 00 00       	mov    $0xc,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <sleep>:
SYSCALL(sleep)
 313:	b8 0d 00 00 00       	mov    $0xd,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <uptime>:
SYSCALL(uptime)
 31b:	b8 0e 00 00 00       	mov    $0xe,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <printhugepde>:
SYSCALL(printhugepde)
 323:	b8 16 00 00 00       	mov    $0x16,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 32b:	b8 17 00 00 00       	mov    $0x17,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <setthp>:
SYSCALL(setthp)
 333:	b8 18 00 00 00       	mov    $0x18,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <getthp>:
 33b:	b8 19 00 00 00       	mov    $0x19,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    
 343:	66 90                	xchg   %ax,%ax
 345:	66 90                	xchg   %ax,%ax
 347:	66 90                	xchg   %ax,%ax
 349:	66 90                	xchg   %ax,%ax
 34b:	66 90                	xchg   %ax,%ax
 34d:	66 90                	xchg   %ax,%ax
 34f:	90                   	nop

00000350 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	83 ec 3c             	sub    $0x3c,%esp
 359:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 35c:	89 d1                	mov    %edx,%ecx
{
 35e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 361:	85 d2                	test   %edx,%edx
 363:	0f 89 7f 00 00 00    	jns    3e8 <printint+0x98>
 369:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 36d:	74 79                	je     3e8 <printint+0x98>
    neg = 1;
 36f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 376:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 378:	31 db                	xor    %ebx,%ebx
 37a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 380:	89 c8                	mov    %ecx,%eax
 382:	31 d2                	xor    %edx,%edx
 384:	89 cf                	mov    %ecx,%edi
 386:	f7 75 c4             	divl   -0x3c(%ebp)
 389:	0f b6 92 78 0a 00 00 	movzbl 0xa78(%edx),%edx
 390:	89 45 c0             	mov    %eax,-0x40(%ebp)
 393:	89 d8                	mov    %ebx,%eax
 395:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 398:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 39b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 39e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3a1:	76 dd                	jbe    380 <printint+0x30>
  if(neg)
 3a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3a6:	85 c9                	test   %ecx,%ecx
 3a8:	74 0c                	je     3b6 <printint+0x66>
    buf[i++] = '-';
 3aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 3b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3bd:	eb 07                	jmp    3c6 <printint+0x76>
 3bf:	90                   	nop
    putc(fd, buf[i]);
 3c0:	0f b6 13             	movzbl (%ebx),%edx
 3c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3c6:	83 ec 04             	sub    $0x4,%esp
 3c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3cc:	6a 01                	push   $0x1
 3ce:	56                   	push   %esi
 3cf:	57                   	push   %edi
 3d0:	e8 ce fe ff ff       	call   2a3 <write>
  while(--i >= 0)
 3d5:	83 c4 10             	add    $0x10,%esp
 3d8:	39 de                	cmp    %ebx,%esi
 3da:	75 e4                	jne    3c0 <printint+0x70>
}
 3dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3df:	5b                   	pop    %ebx
 3e0:	5e                   	pop    %esi
 3e1:	5f                   	pop    %edi
 3e2:	5d                   	pop    %ebp
 3e3:	c3                   	ret    
 3e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 3ef:	eb 87                	jmp    378 <printint+0x28>
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 409:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 40c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 40f:	0f b6 13             	movzbl (%ebx),%edx
 412:	84 d2                	test   %dl,%dl
 414:	74 6a                	je     480 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 416:	8d 45 10             	lea    0x10(%ebp),%eax
 419:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 41c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 41f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 421:	89 45 d0             	mov    %eax,-0x30(%ebp)
 424:	eb 36                	jmp    45c <printf+0x5c>
 426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42d:	8d 76 00             	lea    0x0(%esi),%esi
 430:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 433:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 438:	83 f8 25             	cmp    $0x25,%eax
 43b:	74 15                	je     452 <printf+0x52>
  write(fd, &c, 1);
 43d:	83 ec 04             	sub    $0x4,%esp
 440:	88 55 e7             	mov    %dl,-0x19(%ebp)
 443:	6a 01                	push   $0x1
 445:	57                   	push   %edi
 446:	56                   	push   %esi
 447:	e8 57 fe ff ff       	call   2a3 <write>
 44c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 44f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 452:	0f b6 13             	movzbl (%ebx),%edx
 455:	83 c3 01             	add    $0x1,%ebx
 458:	84 d2                	test   %dl,%dl
 45a:	74 24                	je     480 <printf+0x80>
    c = fmt[i] & 0xff;
 45c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 45f:	85 c9                	test   %ecx,%ecx
 461:	74 cd                	je     430 <printf+0x30>
      }
    } else if(state == '%'){
 463:	83 f9 25             	cmp    $0x25,%ecx
 466:	75 ea                	jne    452 <printf+0x52>
      if(c == 'd'){
 468:	83 f8 25             	cmp    $0x25,%eax
 46b:	0f 84 07 01 00 00    	je     578 <printf+0x178>
 471:	83 e8 63             	sub    $0x63,%eax
 474:	83 f8 15             	cmp    $0x15,%eax
 477:	77 17                	ja     490 <printf+0x90>
 479:	ff 24 85 20 0a 00 00 	jmp    *0xa20(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 480:	8d 65 f4             	lea    -0xc(%ebp),%esp
 483:	5b                   	pop    %ebx
 484:	5e                   	pop    %esi
 485:	5f                   	pop    %edi
 486:	5d                   	pop    %ebp
 487:	c3                   	ret    
 488:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop
  write(fd, &c, 1);
 490:	83 ec 04             	sub    $0x4,%esp
 493:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 496:	6a 01                	push   $0x1
 498:	57                   	push   %edi
 499:	56                   	push   %esi
 49a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 49e:	e8 00 fe ff ff       	call   2a3 <write>
        putc(fd, c);
 4a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 4a7:	83 c4 0c             	add    $0xc,%esp
 4aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4ad:	6a 01                	push   $0x1
 4af:	57                   	push   %edi
 4b0:	56                   	push   %esi
 4b1:	e8 ed fd ff ff       	call   2a3 <write>
        putc(fd, c);
 4b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4b9:	31 c9                	xor    %ecx,%ecx
 4bb:	eb 95                	jmp    452 <printf+0x52>
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4c0:	83 ec 0c             	sub    $0xc,%esp
 4c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4c8:	6a 00                	push   $0x0
 4ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4cd:	8b 10                	mov    (%eax),%edx
 4cf:	89 f0                	mov    %esi,%eax
 4d1:	e8 7a fe ff ff       	call   350 <printint>
        ap++;
 4d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 4da:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4dd:	31 c9                	xor    %ecx,%ecx
 4df:	e9 6e ff ff ff       	jmp    452 <printf+0x52>
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 4e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4eb:	8b 10                	mov    (%eax),%edx
        ap++;
 4ed:	83 c0 04             	add    $0x4,%eax
 4f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 4f3:	85 d2                	test   %edx,%edx
 4f5:	0f 84 8d 00 00 00    	je     588 <printf+0x188>
        while(*s != 0){
 4fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 4fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 500:	84 c0                	test   %al,%al
 502:	0f 84 4a ff ff ff    	je     452 <printf+0x52>
 508:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 50b:	89 d3                	mov    %edx,%ebx
 50d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 510:	83 ec 04             	sub    $0x4,%esp
          s++;
 513:	83 c3 01             	add    $0x1,%ebx
 516:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 519:	6a 01                	push   $0x1
 51b:	57                   	push   %edi
 51c:	56                   	push   %esi
 51d:	e8 81 fd ff ff       	call   2a3 <write>
        while(*s != 0){
 522:	0f b6 03             	movzbl (%ebx),%eax
 525:	83 c4 10             	add    $0x10,%esp
 528:	84 c0                	test   %al,%al
 52a:	75 e4                	jne    510 <printf+0x110>
      state = 0;
 52c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 52f:	31 c9                	xor    %ecx,%ecx
 531:	e9 1c ff ff ff       	jmp    452 <printf+0x52>
 536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 540:	83 ec 0c             	sub    $0xc,%esp
 543:	b9 0a 00 00 00       	mov    $0xa,%ecx
 548:	6a 01                	push   $0x1
 54a:	e9 7b ff ff ff       	jmp    4ca <printf+0xca>
 54f:	90                   	nop
        putc(fd, *ap);
 550:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 553:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 556:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 558:	6a 01                	push   $0x1
 55a:	57                   	push   %edi
 55b:	56                   	push   %esi
        putc(fd, *ap);
 55c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 55f:	e8 3f fd ff ff       	call   2a3 <write>
        ap++;
 564:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 568:	83 c4 10             	add    $0x10,%esp
      state = 0;
 56b:	31 c9                	xor    %ecx,%ecx
 56d:	e9 e0 fe ff ff       	jmp    452 <printf+0x52>
 572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 578:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 57b:	83 ec 04             	sub    $0x4,%esp
 57e:	e9 2a ff ff ff       	jmp    4ad <printf+0xad>
 583:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 587:	90                   	nop
          s = "(null)";
 588:	ba 18 0a 00 00       	mov    $0xa18,%edx
        while(*s != 0){
 58d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 590:	b8 28 00 00 00       	mov    $0x28,%eax
 595:	89 d3                	mov    %edx,%ebx
 597:	e9 74 ff ff ff       	jmp    510 <printf+0x110>
 59c:	66 90                	xchg   %ax,%ax
 59e:	66 90                	xchg   %ax,%ax

000005a0 <normalfree>:
  }
}

void
normalfree(void *ap)
{
 5a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5a1:	a1 90 0e 00 00       	mov    0xe90,%eax
{
 5a6:	89 e5                	mov    %esp,%ebp
 5a8:	57                   	push   %edi
 5a9:	56                   	push   %esi
 5aa:	53                   	push   %ebx
 5ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5b8:	89 c2                	mov    %eax,%edx
 5ba:	8b 00                	mov    (%eax),%eax
 5bc:	39 ca                	cmp    %ecx,%edx
 5be:	73 30                	jae    5f0 <normalfree+0x50>
 5c0:	39 c1                	cmp    %eax,%ecx
 5c2:	72 04                	jb     5c8 <normalfree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5c4:	39 c2                	cmp    %eax,%edx
 5c6:	72 f0                	jb     5b8 <normalfree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ce:	39 f8                	cmp    %edi,%eax
 5d0:	74 30                	je     602 <normalfree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5d5:	8b 42 04             	mov    0x4(%edx),%eax
 5d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5db:	39 f1                	cmp    %esi,%ecx
 5dd:	74 3a                	je     619 <normalfree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5e1:	5b                   	pop    %ebx
  freep = p;
 5e2:	89 15 90 0e 00 00    	mov    %edx,0xe90
}
 5e8:	5e                   	pop    %esi
 5e9:	5f                   	pop    %edi
 5ea:	5d                   	pop    %ebp
 5eb:	c3                   	ret    
 5ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f0:	39 c2                	cmp    %eax,%edx
 5f2:	72 c4                	jb     5b8 <normalfree+0x18>
 5f4:	39 c1                	cmp    %eax,%ecx
 5f6:	73 c0                	jae    5b8 <normalfree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 5f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5fe:	39 f8                	cmp    %edi,%eax
 600:	75 d0                	jne    5d2 <normalfree+0x32>
    bp->s.size += p->s.ptr->s.size;
 602:	03 70 04             	add    0x4(%eax),%esi
 605:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 608:	8b 02                	mov    (%edx),%eax
 60a:	8b 00                	mov    (%eax),%eax
 60c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 60f:	8b 42 04             	mov    0x4(%edx),%eax
 612:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 615:	39 f1                	cmp    %esi,%ecx
 617:	75 c6                	jne    5df <normalfree+0x3f>
    p->s.size += bp->s.size;
 619:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 61c:	89 15 90 0e 00 00    	mov    %edx,0xe90
    p->s.size += bp->s.size;
 622:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 625:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 628:	89 0a                	mov    %ecx,(%edx)
}
 62a:	5b                   	pop    %ebx
 62b:	5e                   	pop    %esi
 62c:	5f                   	pop    %edi
 62d:	5d                   	pop    %ebp
 62e:	c3                   	ret    
 62f:	90                   	nop

00000630 <hugefree>:

void
hugefree(void *ap)
{
 630:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 631:	a1 84 0e 00 00       	mov    0xe84,%eax
{
 636:	89 e5                	mov    %esp,%ebp
 638:	57                   	push   %edi
 639:	56                   	push   %esi
 63a:	53                   	push   %ebx
 63b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 63e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 648:	89 c2                	mov    %eax,%edx
 64a:	8b 00                	mov    (%eax),%eax
 64c:	39 ca                	cmp    %ecx,%edx
 64e:	73 30                	jae    680 <hugefree+0x50>
 650:	39 c1                	cmp    %eax,%ecx
 652:	72 04                	jb     658 <hugefree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 654:	39 c2                	cmp    %eax,%edx
 656:	72 f0                	jb     648 <hugefree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 658:	8b 73 fc             	mov    -0x4(%ebx),%esi
 65b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 65e:	39 f8                	cmp    %edi,%eax
 660:	74 30                	je     692 <hugefree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 662:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 665:	8b 42 04             	mov    0x4(%edx),%eax
 668:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 66b:	39 f1                	cmp    %esi,%ecx
 66d:	74 3a                	je     6a9 <hugefree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 66f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  huge_freep = p;
}
 671:	5b                   	pop    %ebx
  huge_freep = p;
 672:	89 15 84 0e 00 00    	mov    %edx,0xe84
}
 678:	5e                   	pop    %esi
 679:	5f                   	pop    %edi
 67a:	5d                   	pop    %ebp
 67b:	c3                   	ret    
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 680:	39 c2                	cmp    %eax,%edx
 682:	72 c4                	jb     648 <hugefree+0x18>
 684:	39 c1                	cmp    %eax,%ecx
 686:	73 c0                	jae    648 <hugefree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 688:	8b 73 fc             	mov    -0x4(%ebx),%esi
 68b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68e:	39 f8                	cmp    %edi,%eax
 690:	75 d0                	jne    662 <hugefree+0x32>
    bp->s.size += p->s.ptr->s.size;
 692:	03 70 04             	add    0x4(%eax),%esi
 695:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 698:	8b 02                	mov    (%edx),%eax
 69a:	8b 00                	mov    (%eax),%eax
 69c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 69f:	8b 42 04             	mov    0x4(%edx),%eax
 6a2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6a5:	39 f1                	cmp    %esi,%ecx
 6a7:	75 c6                	jne    66f <hugefree+0x3f>
    p->s.size += bp->s.size;
 6a9:	03 43 fc             	add    -0x4(%ebx),%eax
  huge_freep = p;
 6ac:	89 15 84 0e 00 00    	mov    %edx,0xe84
    p->s.size += bp->s.size;
 6b2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6b5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6b8:	89 0a                	mov    %ecx,(%edx)
}
 6ba:	5b                   	pop    %ebx
 6bb:	5e                   	pop    %esi
 6bc:	5f                   	pop    %edi
 6bd:	5d                   	pop    %ebp
 6be:	c3                   	ret    
 6bf:	90                   	nop

000006c0 <hugemalloc>:
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 1c             	sub    $0x1c,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = huge_freep) == 0){
 6cc:	8b 3d 84 0e 00 00    	mov    0xe84,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d2:	8d 70 07             	lea    0x7(%eax),%esi
 6d5:	c1 ee 03             	shr    $0x3,%esi
 6d8:	83 c6 01             	add    $0x1,%esi
  if((prevp = huge_freep) == 0){
 6db:	85 ff                	test   %edi,%edi
 6dd:	0f 84 cd 00 00 00    	je     7b0 <hugemalloc+0xf0>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 6e5:	8b 4a 04             	mov    0x4(%edx),%ecx
 6e8:	39 f1                	cmp    %esi,%ecx
 6ea:	0f 83 96 00 00 00    	jae    786 <hugemalloc+0xc6>
 6f0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 6f5:	89 f9                	mov    %edi,%ecx
 6f7:	39 de                	cmp    %ebx,%esi
 6f9:	0f 43 de             	cmovae %esi,%ebx
 6fc:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 703:	89 df                	mov    %ebx,%edi
 705:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 708:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 70b:	eb 14                	jmp    721 <hugemalloc+0x61>
 70d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 710:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 712:	8b 48 04             	mov    0x4(%eax),%ecx
 715:	39 f1                	cmp    %esi,%ecx
 717:	73 77                	jae    790 <hugemalloc+0xd0>
    if(p == huge_freep)
 719:	8b 0d 84 0e 00 00    	mov    0xe84,%ecx
 71f:	89 c2                	mov    %eax,%edx
 721:	39 d1                	cmp    %edx,%ecx
 723:	75 eb                	jne    710 <hugemalloc+0x50>
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 725:	83 ec 08             	sub    $0x8,%esp
 728:	53                   	push   %ebx
 729:	ff 75 e4             	push   -0x1c(%ebp)
 72c:	e8 da fb ff ff       	call   30b <sbrk>
  if(p == (char*)-1)
 731:	83 c4 10             	add    $0x10,%esp
 734:	83 f8 ff             	cmp    $0xffffffff,%eax
 737:	74 31                	je     76a <hugemalloc+0xaa>
  hp->s.size = nu;
 739:	89 78 04             	mov    %edi,0x4(%eax)
  vfree((void*)(hp + 1));
 73c:	8d 50 08             	lea    0x8(%eax),%edx

// vfree: free a block allocated by vmalloc
void vfree(void *ap) {
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 73f:	2d f8 ff ff 1d       	sub    $0x1dfffff8,%eax
 744:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 749:	77 2d                	ja     778 <hugemalloc+0xb8>
    hugefree(ap);
 74b:	83 ec 0c             	sub    $0xc,%esp
 74e:	52                   	push   %edx
 74f:	e8 dc fe ff ff       	call   630 <hugefree>
 754:	83 c4 10             	add    $0x10,%esp
    return huge_freep;
 757:	8b 15 84 0e 00 00    	mov    0xe84,%edx
 75d:	85 db                	test   %ebx,%ebx
 75f:	0f 44 15 90 0e 00 00 	cmove  0xe90,%edx
      if((p = morecore(nunits, use_huge_pages)) == 0)
 766:	85 d2                	test   %edx,%edx
 768:	75 a6                	jne    710 <hugemalloc+0x50>
}
 76a:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 76d:	31 c0                	xor    %eax,%eax
}
 76f:	5b                   	pop    %ebx
 770:	5e                   	pop    %esi
 771:	5f                   	pop    %edi
 772:	5d                   	pop    %ebp
 773:	c3                   	ret    
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
  else {
    normalfree(ap);
 778:	83 ec 0c             	sub    $0xc,%esp
 77b:	52                   	push   %edx
 77c:	e8 1f fe ff ff       	call   5a0 <normalfree>
 781:	83 c4 10             	add    $0x10,%esp
 784:	eb d1                	jmp    757 <hugemalloc+0x97>
    if(p->s.size >= nunits){
 786:	89 d0                	mov    %edx,%eax
 788:	89 fa                	mov    %edi,%edx
 78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 790:	39 ce                	cmp    %ecx,%esi
 792:	74 4c                	je     7e0 <hugemalloc+0x120>
        p->s.size -= nunits;
 794:	29 f1                	sub    %esi,%ecx
 796:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 799:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 79c:	89 70 04             	mov    %esi,0x4(%eax)
      huge_freep = prevp;
 79f:	89 15 84 0e 00 00    	mov    %edx,0xe84
}
 7a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7a8:	83 c0 08             	add    $0x8,%eax
}
 7ab:	5b                   	pop    %ebx
 7ac:	5e                   	pop    %esi
 7ad:	5f                   	pop    %edi
 7ae:	5d                   	pop    %ebp
 7af:	c3                   	ret    
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 7b0:	c7 05 84 0e 00 00 88 	movl   $0xe88,0xe84
 7b7:	0e 00 00 
    huge_base.s.size = 0;
 7ba:	bf 88 0e 00 00       	mov    $0xe88,%edi
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 7bf:	c7 05 88 0e 00 00 88 	movl   $0xe88,0xe88
 7c6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c9:	89 fa                	mov    %edi,%edx
    huge_base.s.size = 0;
 7cb:	c7 05 8c 0e 00 00 00 	movl   $0x0,0xe8c
 7d2:	00 00 00 
    if(p->s.size >= nunits){
 7d5:	e9 16 ff ff ff       	jmp    6f0 <hugemalloc+0x30>
 7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7e0:	8b 08                	mov    (%eax),%ecx
 7e2:	89 0a                	mov    %ecx,(%edx)
 7e4:	eb b9                	jmp    79f <hugemalloc+0xdf>
 7e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ed:	8d 76 00             	lea    0x0(%esi),%esi

000007f0 <normalmalloc>:
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 1c             	sub    $0x1c,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7fc:	8b 3d 90 0e 00 00    	mov    0xe90,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	8d 70 07             	lea    0x7(%eax),%esi
 805:	c1 ee 03             	shr    $0x3,%esi
 808:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 80b:	85 ff                	test   %edi,%edi
 80d:	0f 84 cd 00 00 00    	je     8e0 <normalmalloc+0xf0>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 813:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 815:	8b 4a 04             	mov    0x4(%edx),%ecx
 818:	39 f1                	cmp    %esi,%ecx
 81a:	0f 83 96 00 00 00    	jae    8b6 <normalmalloc+0xc6>
 820:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 825:	89 f9                	mov    %edi,%ecx
 827:	39 de                	cmp    %ebx,%esi
 829:	0f 43 de             	cmovae %esi,%ebx
 82c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 833:	89 df                	mov    %ebx,%edi
 835:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 838:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 83b:	eb 14                	jmp    851 <normalmalloc+0x61>
 83d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 840:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 842:	8b 48 04             	mov    0x4(%eax),%ecx
 845:	39 f1                	cmp    %esi,%ecx
 847:	73 77                	jae    8c0 <normalmalloc+0xd0>
    if(p == freep) {
 849:	8b 0d 90 0e 00 00    	mov    0xe90,%ecx
 84f:	89 c2                	mov    %eax,%edx
 851:	39 d1                	cmp    %edx,%ecx
 853:	75 eb                	jne    840 <normalmalloc+0x50>
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 855:	83 ec 08             	sub    $0x8,%esp
 858:	53                   	push   %ebx
 859:	ff 75 e4             	push   -0x1c(%ebp)
 85c:	e8 aa fa ff ff       	call   30b <sbrk>
  if(p == (char*)-1)
 861:	83 c4 10             	add    $0x10,%esp
 864:	83 f8 ff             	cmp    $0xffffffff,%eax
 867:	74 31                	je     89a <normalmalloc+0xaa>
  hp->s.size = nu;
 869:	89 78 04             	mov    %edi,0x4(%eax)
  vfree((void*)(hp + 1));
 86c:	8d 50 08             	lea    0x8(%eax),%edx
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 86f:	2d f8 ff ff 1d       	sub    $0x1dfffff8,%eax
 874:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 879:	77 2d                	ja     8a8 <normalmalloc+0xb8>
    hugefree(ap);
 87b:	83 ec 0c             	sub    $0xc,%esp
 87e:	52                   	push   %edx
 87f:	e8 ac fd ff ff       	call   630 <hugefree>
 884:	83 c4 10             	add    $0x10,%esp
    return huge_freep;
 887:	8b 15 84 0e 00 00    	mov    0xe84,%edx
 88d:	85 db                	test   %ebx,%ebx
 88f:	0f 44 15 90 0e 00 00 	cmove  0xe90,%edx
      if((p = morecore(nunits, use_huge_pages)) == 0) {
 896:	85 d2                	test   %edx,%edx
 898:	75 a6                	jne    840 <normalmalloc+0x50>
}
 89a:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 89d:	31 c0                	xor    %eax,%eax
}
 89f:	5b                   	pop    %ebx
 8a0:	5e                   	pop    %esi
 8a1:	5f                   	pop    %edi
 8a2:	5d                   	pop    %ebp
 8a3:	c3                   	ret    
 8a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    normalfree(ap);
 8a8:	83 ec 0c             	sub    $0xc,%esp
 8ab:	52                   	push   %edx
 8ac:	e8 ef fc ff ff       	call   5a0 <normalfree>
 8b1:	83 c4 10             	add    $0x10,%esp
 8b4:	eb d1                	jmp    887 <normalmalloc+0x97>
    if(p->s.size >= nunits){
 8b6:	89 d0                	mov    %edx,%eax
 8b8:	89 fa                	mov    %edi,%edx
 8ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8c0:	39 ce                	cmp    %ecx,%esi
 8c2:	74 4c                	je     910 <normalmalloc+0x120>
        p->s.size -= nunits;
 8c4:	29 f1                	sub    %esi,%ecx
 8c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8cc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8cf:	89 15 90 0e 00 00    	mov    %edx,0xe90
}
 8d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8d8:	83 c0 08             	add    $0x8,%eax
}
 8db:	5b                   	pop    %ebx
 8dc:	5e                   	pop    %esi
 8dd:	5f                   	pop    %edi
 8de:	5d                   	pop    %ebp
 8df:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8e0:	c7 05 90 0e 00 00 94 	movl   $0xe94,0xe90
 8e7:	0e 00 00 
    base.s.size = 0;
 8ea:	bf 94 0e 00 00       	mov    $0xe94,%edi
    base.s.ptr = freep = prevp = &base;
 8ef:	c7 05 94 0e 00 00 94 	movl   $0xe94,0xe94
 8f6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8fb:	c7 05 98 0e 00 00 00 	movl   $0x0,0xe98
 902:	00 00 00 
    if(p->s.size >= nunits){
 905:	e9 16 ff ff ff       	jmp    820 <normalmalloc+0x30>
 90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 910:	8b 08                	mov    (%eax),%ecx
 912:	89 0a                	mov    %ecx,(%edx)
 914:	eb b9                	jmp    8cf <normalmalloc+0xdf>
 916:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91d:	8d 76 00             	lea    0x0(%esi),%esi

00000920 <vmalloc>:
void* vmalloc(uint nbytes, int pagesize) {
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	83 ec 08             	sub    $0x8,%esp
 926:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(pagesize == VMALLOC_SIZE_BASE) {
 929:	3d 00 10 00 00       	cmp    $0x1000,%eax
 92e:	74 18                	je     948 <vmalloc+0x28>
  else if (pagesize == VMALLOC_SIZE_HUGE) {
 930:	3d 00 00 40 00       	cmp    $0x400000,%eax
 935:	75 1e                	jne    955 <vmalloc+0x35>
    return hugemalloc(nbytes, use_huge_pages);
 937:	c7 45 0c 01 00 00 00 	movl   $0x1,0xc(%ebp)
}
 93e:	c9                   	leave  
    return hugemalloc(nbytes, use_huge_pages);
 93f:	e9 7c fd ff ff       	jmp    6c0 <hugemalloc>
 944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return normalmalloc(nbytes, use_huge_pages);
 948:	c7 45 0c 00 00 00 00 	movl   $0x0,0xc(%ebp)
}
 94f:	c9                   	leave  
    return normalmalloc(nbytes, use_huge_pages);
 950:	e9 9b fe ff ff       	jmp    7f0 <normalmalloc>
    printf(1, "Please pass VMALLOC_SIZE_BASE or VMALLOC_SIZE_HUGE as flag.\n");
 955:	50                   	push   %eax
 956:	50                   	push   %eax
 957:	68 8c 0a 00 00       	push   $0xa8c
 95c:	6a 01                	push   $0x1
 95e:	e8 9d fa ff ff       	call   400 <printf>
    exit();
 963:	e8 1b f9 ff ff       	call   283 <exit>
 968:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 96f:	90                   	nop

00000970 <vfree>:
void vfree(void *ap) {
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 973:	8b 45 08             	mov    0x8(%ebp),%eax
 976:	2d 00 00 00 1e       	sub    $0x1e000000,%eax
 97b:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 980:	77 0e                	ja     990 <vfree+0x20>
  }
}
 982:	5d                   	pop    %ebp
    hugefree(ap);
 983:	e9 a8 fc ff ff       	jmp    630 <hugefree>
 988:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98f:	90                   	nop
}
 990:	5d                   	pop    %ebp
    normalfree(ap);
 991:	e9 0a fc ff ff       	jmp    5a0 <normalfree>
 996:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 99d:	8d 76 00             	lea    0x0(%esi),%esi

000009a0 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
 9a3:	53                   	push   %ebx
 9a4:	83 ec 04             	sub    $0x4,%esp
 9a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 9aa:	e8 8c f9 ff ff       	call   33b <getthp>

  if(nbytes >= 1048576 && thp != 0) { // only use huge pages if THP is active
 9af:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 9b5:	76 19                	jbe    9d0 <malloc+0x30>
 9b7:	85 c0                	test   %eax,%eax
 9b9:	74 15                	je     9d0 <malloc+0x30>
    return hugemalloc(nbytes, use_huge_pages);
 9bb:	83 ec 08             	sub    $0x8,%esp
 9be:	6a 01                	push   $0x1
 9c0:	53                   	push   %ebx
 9c1:	e8 fa fc ff ff       	call   6c0 <hugemalloc>
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
  }
  else{
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
  }
}
 9c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
 9c9:	83 c4 10             	add    $0x10,%esp
}
 9cc:	c9                   	leave  
 9cd:	c3                   	ret    
 9ce:	66 90                	xchg   %ax,%ax
    return normalmalloc(nbytes, use_huge_pages);
 9d0:	83 ec 08             	sub    $0x8,%esp
 9d3:	6a 00                	push   $0x0
 9d5:	53                   	push   %ebx
 9d6:	e8 15 fe ff ff       	call   7f0 <normalmalloc>
}
 9db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
 9de:	83 c4 10             	add    $0x10,%esp
}
 9e1:	c9                   	leave  
 9e2:	c3                   	ret    
 9e3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009f0 <free>:

void free(void * ap){
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 9f3:	8b 45 08             	mov    0x8(%ebp),%eax
 9f6:	2d 00 00 00 1e       	sub    $0x1e000000,%eax
 9fb:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 a00:	77 0e                	ja     a10 <free+0x20>
  vfree(ap);
}
 a02:	5d                   	pop    %ebp
    hugefree(ap);
 a03:	e9 28 fc ff ff       	jmp    630 <hugefree>
 a08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a0f:	90                   	nop
}
 a10:	5d                   	pop    %ebp
    normalfree(ap);
 a11:	e9 8a fb ff ff       	jmp    5a0 <normalfree>
