
_mkdir:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	bf 01 00 00 00       	mov    $0x1,%edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 59 04             	mov    0x4(%ecx),%ebx
  1c:	8b 31                	mov    (%ecx),%esi
  1e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
  21:	83 fe 01             	cmp    $0x1,%esi
  24:	7e 3e                	jle    64 <main+0x64>
  26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	push   (%ebx)
  35:	e8 01 03 00 00       	call   33b <mkdir>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	78 0f                	js     50 <main+0x50>
  for(i = 1; i < argc; i++){
  41:	83 c7 01             	add    $0x1,%edi
  44:	83 c3 04             	add    $0x4,%ebx
  47:	39 fe                	cmp    %edi,%esi
  49:	75 e5                	jne    30 <main+0x30>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  4b:	e8 83 02 00 00       	call   2d3 <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  50:	50                   	push   %eax
  51:	ff 33                	push   (%ebx)
  53:	68 1f 0a 00 00       	push   $0xa1f
  58:	6a 02                	push   $0x2
  5a:	e8 f1 03 00 00       	call   450 <printf>
      break;
  5f:	83 c4 10             	add    $0x10,%esp
  62:	eb e7                	jmp    4b <main+0x4b>
    printf(2, "Usage: mkdir files...\n");
  64:	52                   	push   %edx
  65:	52                   	push   %edx
  66:	68 08 0a 00 00       	push   $0xa08
  6b:	6a 02                	push   $0x2
  6d:	e8 de 03 00 00       	call   450 <printf>
    exit();
  72:	e8 5c 02 00 00       	call   2d3 <exit>
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

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
 3d9:	0f b6 92 9c 0a 00 00 	movzbl 0xa9c(%edx),%edx
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
 4c9:	ff 24 85 44 0a 00 00 	jmp    *0xa44(,%eax,4)
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
 5d8:	ba 3b 0a 00 00       	mov    $0xa3b,%edx
        while(*s != 0){
 5dd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5e0:	b8 28 00 00 00       	mov    $0x28,%eax
 5e5:	89 d3                	mov    %edx,%ebx
 5e7:	e9 74 ff ff ff       	jmp    560 <printf+0x110>
 5ec:	66 90                	xchg   %ax,%ax
 5ee:	66 90                	xchg   %ax,%ax

000005f0 <normalfree>:
  }
}

void
normalfree(void *ap)
{
 5f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f1:	a1 ec 0e 00 00       	mov    0xeec,%eax
{
 5f6:	89 e5                	mov    %esp,%ebp
 5f8:	57                   	push   %edi
 5f9:	56                   	push   %esi
 5fa:	53                   	push   %ebx
 5fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 608:	89 c2                	mov    %eax,%edx
 60a:	8b 00                	mov    (%eax),%eax
 60c:	39 ca                	cmp    %ecx,%edx
 60e:	73 30                	jae    640 <normalfree+0x50>
 610:	39 c1                	cmp    %eax,%ecx
 612:	72 04                	jb     618 <normalfree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 614:	39 c2                	cmp    %eax,%edx
 616:	72 f0                	jb     608 <normalfree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 618:	8b 73 fc             	mov    -0x4(%ebx),%esi
 61b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 61e:	39 f8                	cmp    %edi,%eax
 620:	74 30                	je     652 <normalfree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 622:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 625:	8b 42 04             	mov    0x4(%edx),%eax
 628:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 62b:	39 f1                	cmp    %esi,%ecx
 62d:	74 3a                	je     669 <normalfree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 62f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 631:	5b                   	pop    %ebx
  freep = p;
 632:	89 15 ec 0e 00 00    	mov    %edx,0xeec
}
 638:	5e                   	pop    %esi
 639:	5f                   	pop    %edi
 63a:	5d                   	pop    %ebp
 63b:	c3                   	ret    
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 640:	39 c2                	cmp    %eax,%edx
 642:	72 c4                	jb     608 <normalfree+0x18>
 644:	39 c1                	cmp    %eax,%ecx
 646:	73 c0                	jae    608 <normalfree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 648:	8b 73 fc             	mov    -0x4(%ebx),%esi
 64b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 64e:	39 f8                	cmp    %edi,%eax
 650:	75 d0                	jne    622 <normalfree+0x32>
    bp->s.size += p->s.ptr->s.size;
 652:	03 70 04             	add    0x4(%eax),%esi
 655:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 658:	8b 02                	mov    (%edx),%eax
 65a:	8b 00                	mov    (%eax),%eax
 65c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 65f:	8b 42 04             	mov    0x4(%edx),%eax
 662:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 665:	39 f1                	cmp    %esi,%ecx
 667:	75 c6                	jne    62f <normalfree+0x3f>
    p->s.size += bp->s.size;
 669:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 66c:	89 15 ec 0e 00 00    	mov    %edx,0xeec
    p->s.size += bp->s.size;
 672:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 675:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 678:	89 0a                	mov    %ecx,(%edx)
}
 67a:	5b                   	pop    %ebx
 67b:	5e                   	pop    %esi
 67c:	5f                   	pop    %edi
 67d:	5d                   	pop    %ebp
 67e:	c3                   	ret    
 67f:	90                   	nop

00000680 <hugefree>:

void
hugefree(void *ap)
{
 680:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 681:	a1 e0 0e 00 00       	mov    0xee0,%eax
{
 686:	89 e5                	mov    %esp,%ebp
 688:	57                   	push   %edi
 689:	56                   	push   %esi
 68a:	53                   	push   %ebx
 68b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 68e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 698:	89 c2                	mov    %eax,%edx
 69a:	8b 00                	mov    (%eax),%eax
 69c:	39 ca                	cmp    %ecx,%edx
 69e:	73 30                	jae    6d0 <hugefree+0x50>
 6a0:	39 c1                	cmp    %eax,%ecx
 6a2:	72 04                	jb     6a8 <hugefree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a4:	39 c2                	cmp    %eax,%edx
 6a6:	72 f0                	jb     698 <hugefree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ae:	39 f8                	cmp    %edi,%eax
 6b0:	74 30                	je     6e2 <hugefree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6b5:	8b 42 04             	mov    0x4(%edx),%eax
 6b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6bb:	39 f1                	cmp    %esi,%ecx
 6bd:	74 3a                	je     6f9 <hugefree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  huge_freep = p;
}
 6c1:	5b                   	pop    %ebx
  huge_freep = p;
 6c2:	89 15 e0 0e 00 00    	mov    %edx,0xee0
}
 6c8:	5e                   	pop    %esi
 6c9:	5f                   	pop    %edi
 6ca:	5d                   	pop    %ebp
 6cb:	c3                   	ret    
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d0:	39 c2                	cmp    %eax,%edx
 6d2:	72 c4                	jb     698 <hugefree+0x18>
 6d4:	39 c1                	cmp    %eax,%ecx
 6d6:	73 c0                	jae    698 <hugefree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 6d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6de:	39 f8                	cmp    %edi,%eax
 6e0:	75 d0                	jne    6b2 <hugefree+0x32>
    bp->s.size += p->s.ptr->s.size;
 6e2:	03 70 04             	add    0x4(%eax),%esi
 6e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6e8:	8b 02                	mov    (%edx),%eax
 6ea:	8b 00                	mov    (%eax),%eax
 6ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6ef:	8b 42 04             	mov    0x4(%edx),%eax
 6f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6f5:	39 f1                	cmp    %esi,%ecx
 6f7:	75 c6                	jne    6bf <hugefree+0x3f>
    p->s.size += bp->s.size;
 6f9:	03 43 fc             	add    -0x4(%ebx),%eax
  huge_freep = p;
 6fc:	89 15 e0 0e 00 00    	mov    %edx,0xee0
    p->s.size += bp->s.size;
 702:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 705:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 708:	89 0a                	mov    %ecx,(%edx)
}
 70a:	5b                   	pop    %ebx
 70b:	5e                   	pop    %esi
 70c:	5f                   	pop    %edi
 70d:	5d                   	pop    %ebp
 70e:	c3                   	ret    
 70f:	90                   	nop

00000710 <morecore>:
static Header* morecore(uint nu, int use_huge_pages) {
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	53                   	push   %ebx
 714:	89 c3                	mov    %eax,%ebx
 716:	83 ec 04             	sub    $0x4,%esp
  if(use_huge_pages){
 719:	85 d2                	test   %edx,%edx
 71b:	74 43                	je     760 <morecore+0x50>
    if(nu < HUGE_PAGE_SIZE)
 71d:	3d ff ff 3f 00       	cmp    $0x3fffff,%eax
 722:	76 7c                	jbe    7a0 <morecore+0x90>
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 724:	8d 04 c5 00 00 00 00 	lea    0x0(,%eax,8),%eax
 72b:	83 ec 08             	sub    $0x8,%esp
 72e:	52                   	push   %edx
 72f:	50                   	push   %eax
 730:	e8 26 fc ff ff       	call   35b <sbrk>
  if(p == (char*)-1)
 735:	83 c4 10             	add    $0x10,%esp
 738:	83 f8 ff             	cmp    $0xffffffff,%eax
 73b:	74 73                	je     7b0 <morecore+0xa0>
  hp->s.size = nu;
 73d:	89 58 04             	mov    %ebx,0x4(%eax)

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
  if(use_huge_pages) {
    hugefree(ap);
 740:	83 ec 0c             	sub    $0xc,%esp
  vfree((void*)(hp + 1), use_huge_pages);
 743:	83 c0 08             	add    $0x8,%eax
    hugefree(ap);
 746:	50                   	push   %eax
 747:	e8 34 ff ff ff       	call   680 <hugefree>
    return huge_freep;
 74c:	a1 e0 0e 00 00       	mov    0xee0,%eax
}
 751:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return huge_freep;
 754:	83 c4 10             	add    $0x10,%esp
}
 757:	c9                   	leave  
 758:	c3                   	ret    
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(nu < 4096)
 760:	b8 00 10 00 00       	mov    $0x1000,%eax
 765:	39 c3                	cmp    %eax,%ebx
 767:	0f 42 d8             	cmovb  %eax,%ebx
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 76a:	83 ec 08             	sub    $0x8,%esp
 76d:	6a 00                	push   $0x0
 76f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 776:	50                   	push   %eax
 777:	e8 df fb ff ff       	call   35b <sbrk>
  if(p == (char*)-1)
 77c:	83 c4 10             	add    $0x10,%esp
 77f:	83 f8 ff             	cmp    $0xffffffff,%eax
 782:	74 2c                	je     7b0 <morecore+0xa0>
  hp->s.size = nu;
 784:	89 58 04             	mov    %ebx,0x4(%eax)
  }
  else {
    normalfree(ap);
 787:	83 ec 0c             	sub    $0xc,%esp
  vfree((void*)(hp + 1), use_huge_pages);
 78a:	83 c0 08             	add    $0x8,%eax
    normalfree(ap);
 78d:	50                   	push   %eax
 78e:	e8 5d fe ff ff       	call   5f0 <normalfree>
    return freep;
 793:	a1 ec 0e 00 00       	mov    0xeec,%eax
}
 798:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return freep;
 79b:	83 c4 10             	add    $0x10,%esp
}
 79e:	c9                   	leave  
 79f:	c3                   	ret    
 7a0:	b8 00 80 00 00       	mov    $0x8000,%eax
      nu = 4096;
 7a5:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7aa:	e9 7c ff ff ff       	jmp    72b <morecore+0x1b>
 7af:	90                   	nop
}
 7b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 7b3:	31 c0                	xor    %eax,%eax
}
 7b5:	c9                   	leave  
 7b6:	c3                   	ret    
 7b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7be:	66 90                	xchg   %ax,%ax

000007c0 <normalmalloc>:
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 0c             	sub    $0xc,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7cc:	8b 3d ec 0e 00 00    	mov    0xeec,%edi
{
 7d2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d5:	8d 70 07             	lea    0x7(%eax),%esi
 7d8:	c1 ee 03             	shr    $0x3,%esi
 7db:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7de:	85 ff                	test   %edi,%edi
 7e0:	74 5e                	je     840 <normalmalloc+0x80>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e2:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 7e4:	8b 48 04             	mov    0x4(%eax),%ecx
 7e7:	39 ce                	cmp    %ecx,%esi
 7e9:	77 16                	ja     801 <normalmalloc+0x41>
 7eb:	eb 2d                	jmp    81a <normalmalloc+0x5a>
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 7f2:	8b 4a 04             	mov    0x4(%edx),%ecx
 7f5:	39 f1                	cmp    %esi,%ecx
 7f7:	73 27                	jae    820 <normalmalloc+0x60>
    if(p == freep) {
 7f9:	8b 3d ec 0e 00 00    	mov    0xeec,%edi
 7ff:	89 d0                	mov    %edx,%eax
 801:	39 c7                	cmp    %eax,%edi
 803:	75 eb                	jne    7f0 <normalmalloc+0x30>
      if((p = morecore(nunits, use_huge_pages)) == 0) {
 805:	89 da                	mov    %ebx,%edx
 807:	89 f0                	mov    %esi,%eax
 809:	e8 02 ff ff ff       	call   710 <morecore>
 80e:	85 c0                	test   %eax,%eax
 810:	75 de                	jne    7f0 <normalmalloc+0x30>
}
 812:	83 c4 0c             	add    $0xc,%esp
 815:	5b                   	pop    %ebx
 816:	5e                   	pop    %esi
 817:	5f                   	pop    %edi
 818:	5d                   	pop    %ebp
 819:	c3                   	ret    
    if(p->s.size >= nunits){
 81a:	89 c2                	mov    %eax,%edx
 81c:	89 f8                	mov    %edi,%eax
 81e:	66 90                	xchg   %ax,%ax
      if(p->s.size == nunits)
 820:	39 ce                	cmp    %ecx,%esi
 822:	74 4c                	je     870 <normalmalloc+0xb0>
        p->s.size -= nunits;
 824:	29 f1                	sub    %esi,%ecx
 826:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 829:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 82c:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 82f:	a3 ec 0e 00 00       	mov    %eax,0xeec
}
 834:	83 c4 0c             	add    $0xc,%esp
      return (void*)(p + 1);
 837:	8d 42 08             	lea    0x8(%edx),%eax
}
 83a:	5b                   	pop    %ebx
 83b:	5e                   	pop    %esi
 83c:	5f                   	pop    %edi
 83d:	5d                   	pop    %ebp
 83e:	c3                   	ret    
 83f:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 840:	c7 05 ec 0e 00 00 f0 	movl   $0xef0,0xeec
 847:	0e 00 00 
    base.s.size = 0;
 84a:	bf f0 0e 00 00       	mov    $0xef0,%edi
    base.s.ptr = freep = prevp = &base;
 84f:	c7 05 f0 0e 00 00 f0 	movl   $0xef0,0xef0
 856:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 859:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 85b:	c7 05 f4 0e 00 00 00 	movl   $0x0,0xef4
 862:	00 00 00 
    if(p->s.size >= nunits){
 865:	eb 9a                	jmp    801 <normalmalloc+0x41>
 867:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 86e:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 870:	8b 0a                	mov    (%edx),%ecx
 872:	89 08                	mov    %ecx,(%eax)
 874:	eb b9                	jmp    82f <normalmalloc+0x6f>
 876:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 87d:	8d 76 00             	lea    0x0(%esi),%esi

00000880 <hugemalloc>:
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	57                   	push   %edi
 884:	56                   	push   %esi
 885:	53                   	push   %ebx
 886:	83 ec 0c             	sub    $0xc,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 889:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = huge_freep) == 0){
 88c:	8b 3d e0 0e 00 00    	mov    0xee0,%edi
{
 892:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 895:	8d 70 07             	lea    0x7(%eax),%esi
 898:	c1 ee 03             	shr    $0x3,%esi
 89b:	83 c6 01             	add    $0x1,%esi
  if((prevp = huge_freep) == 0){
 89e:	85 ff                	test   %edi,%edi
 8a0:	74 5e                	je     900 <hugemalloc+0x80>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a2:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 8a4:	8b 48 04             	mov    0x4(%eax),%ecx
 8a7:	39 ce                	cmp    %ecx,%esi
 8a9:	77 16                	ja     8c1 <hugemalloc+0x41>
 8ab:	eb 2d                	jmp    8da <hugemalloc+0x5a>
 8ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 8b2:	8b 4a 04             	mov    0x4(%edx),%ecx
 8b5:	39 f1                	cmp    %esi,%ecx
 8b7:	73 27                	jae    8e0 <hugemalloc+0x60>
    if(p == huge_freep)
 8b9:	8b 3d e0 0e 00 00    	mov    0xee0,%edi
 8bf:	89 d0                	mov    %edx,%eax
 8c1:	39 c7                	cmp    %eax,%edi
 8c3:	75 eb                	jne    8b0 <hugemalloc+0x30>
      if((p = morecore(nunits, use_huge_pages)) == 0)
 8c5:	89 da                	mov    %ebx,%edx
 8c7:	89 f0                	mov    %esi,%eax
 8c9:	e8 42 fe ff ff       	call   710 <morecore>
 8ce:	85 c0                	test   %eax,%eax
 8d0:	75 de                	jne    8b0 <hugemalloc+0x30>
}
 8d2:	83 c4 0c             	add    $0xc,%esp
 8d5:	5b                   	pop    %ebx
 8d6:	5e                   	pop    %esi
 8d7:	5f                   	pop    %edi
 8d8:	5d                   	pop    %ebp
 8d9:	c3                   	ret    
    if(p->s.size >= nunits){
 8da:	89 c2                	mov    %eax,%edx
 8dc:	89 f8                	mov    %edi,%eax
 8de:	66 90                	xchg   %ax,%ax
      if(p->s.size == nunits)
 8e0:	39 ce                	cmp    %ecx,%esi
 8e2:	74 4c                	je     930 <hugemalloc+0xb0>
        p->s.size -= nunits;
 8e4:	29 f1                	sub    %esi,%ecx
 8e6:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 8e9:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 8ec:	89 72 04             	mov    %esi,0x4(%edx)
      huge_freep = prevp;
 8ef:	a3 e0 0e 00 00       	mov    %eax,0xee0
}
 8f4:	83 c4 0c             	add    $0xc,%esp
      return (void*)(p + 1);
 8f7:	8d 42 08             	lea    0x8(%edx),%eax
}
 8fa:	5b                   	pop    %ebx
 8fb:	5e                   	pop    %esi
 8fc:	5f                   	pop    %edi
 8fd:	5d                   	pop    %ebp
 8fe:	c3                   	ret    
 8ff:	90                   	nop
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 900:	c7 05 e0 0e 00 00 e4 	movl   $0xee4,0xee0
 907:	0e 00 00 
    huge_base.s.size = 0;
 90a:	bf e4 0e 00 00       	mov    $0xee4,%edi
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 90f:	c7 05 e4 0e 00 00 e4 	movl   $0xee4,0xee4
 916:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 919:	89 f8                	mov    %edi,%eax
    huge_base.s.size = 0;
 91b:	c7 05 e8 0e 00 00 00 	movl   $0x0,0xee8
 922:	00 00 00 
    if(p->s.size >= nunits){
 925:	eb 9a                	jmp    8c1 <hugemalloc+0x41>
 927:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 92e:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 930:	8b 0a                	mov    (%edx),%ecx
 932:	89 08                	mov    %ecx,(%eax)
 934:	eb b9                	jmp    8ef <hugemalloc+0x6f>
 936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 93d:	8d 76 00             	lea    0x0(%esi),%esi

00000940 <vmalloc>:
void* vmalloc(uint nbytes, int pagesize) {
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	83 ec 08             	sub    $0x8,%esp
 946:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(pagesize == VMALLOC_SIZE_BASE) {
 949:	3d 00 10 00 00       	cmp    $0x1000,%eax
 94e:	74 18                	je     968 <vmalloc+0x28>
  else if (pagesize == VMALLOC_SIZE_HUGE) {
 950:	3d 00 00 40 00       	cmp    $0x400000,%eax
 955:	75 1e                	jne    975 <vmalloc+0x35>
    return hugemalloc(nbytes, use_huge_pages);
 957:	c7 45 0c 01 00 00 00 	movl   $0x1,0xc(%ebp)
}
 95e:	c9                   	leave  
    return hugemalloc(nbytes, use_huge_pages);
 95f:	e9 1c ff ff ff       	jmp    880 <hugemalloc>
 964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return normalmalloc(nbytes, use_huge_pages);
 968:	c7 45 0c 00 00 00 00 	movl   $0x0,0xc(%ebp)
}
 96f:	c9                   	leave  
    return normalmalloc(nbytes, use_huge_pages);
 970:	e9 4b fe ff ff       	jmp    7c0 <normalmalloc>
    printf(1, "Please pass VMALLOC_SIZE_BASE or VMALLOC_SIZE_HUGE as flag.\n");
 975:	50                   	push   %eax
 976:	50                   	push   %eax
 977:	68 b0 0a 00 00       	push   $0xab0
 97c:	6a 01                	push   $0x1
 97e:	e8 cd fa ff ff       	call   450 <printf>
    exit();
 983:	e8 4b f9 ff ff       	call   2d3 <exit>
 988:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98f:	90                   	nop

00000990 <vfree>:
void vfree(void *ap, int use_huge_pages) {
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
  if(use_huge_pages) {
 993:	8b 45 0c             	mov    0xc(%ebp),%eax
 996:	85 c0                	test   %eax,%eax
 998:	74 06                	je     9a0 <vfree+0x10>
  }
}
 99a:	5d                   	pop    %ebp
    hugefree(ap);
 99b:	e9 e0 fc ff ff       	jmp    680 <hugefree>
}
 9a0:	5d                   	pop    %ebp
    normalfree(ap);
 9a1:	e9 4a fc ff ff       	jmp    5f0 <normalfree>
 9a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9ad:	8d 76 00             	lea    0x0(%esi),%esi

000009b0 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
 9b3:	53                   	push   %ebx
 9b4:	83 ec 04             	sub    $0x4,%esp
 9b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 9ba:	e8 cc f9 ff ff       	call   38b <getthp>

  if(nbytes >= 1048576 && thp != 0) { // only use huge pages if THP is active
 9bf:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 9c5:	76 19                	jbe    9e0 <malloc+0x30>
 9c7:	85 c0                	test   %eax,%eax
 9c9:	74 15                	je     9e0 <malloc+0x30>
    return hugemalloc(nbytes, use_huge_pages);
 9cb:	83 ec 08             	sub    $0x8,%esp
 9ce:	6a 01                	push   $0x1
 9d0:	53                   	push   %ebx
 9d1:	e8 aa fe ff ff       	call   880 <hugemalloc>
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
  }
  else{
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
  }
}
 9d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
 9d9:	83 c4 10             	add    $0x10,%esp
}
 9dc:	c9                   	leave  
 9dd:	c3                   	ret    
 9de:	66 90                	xchg   %ax,%ax
    return normalmalloc(nbytes, use_huge_pages);
 9e0:	83 ec 08             	sub    $0x8,%esp
 9e3:	6a 00                	push   $0x0
 9e5:	53                   	push   %ebx
 9e6:	e8 d5 fd ff ff       	call   7c0 <normalmalloc>
}
 9eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
 9ee:	83 c4 10             	add    $0x10,%esp
}
 9f1:	c9                   	leave  
 9f2:	c3                   	ret    
 9f3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a00 <free>:
    normalfree(ap);
 a00:	e9 eb fb ff ff       	jmp    5f0 <normalfree>
