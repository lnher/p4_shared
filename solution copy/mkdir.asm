
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
  53:	68 0f 0a 00 00       	push   $0xa0f
  58:	6a 02                	push   $0x2
  5a:	e8 f1 03 00 00       	call   450 <printf>
      break;
  5f:	83 c4 10             	add    $0x10,%esp
  62:	eb e7                	jmp    4b <main+0x4b>
    printf(2, "Usage: mkdir files...\n");
  64:	52                   	push   %edx
  65:	52                   	push   %edx
  66:	68 f8 09 00 00       	push   $0x9f8
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
 3d9:	0f b6 92 8c 0a 00 00 	movzbl 0xa8c(%edx),%edx
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
 4c9:	ff 24 85 34 0a 00 00 	jmp    *0xa34(,%eax,4)
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
 5d8:	ba 2b 0a 00 00       	mov    $0xa2b,%edx
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
 5f1:	a1 dc 0e 00 00       	mov    0xedc,%eax
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
 632:	89 15 dc 0e 00 00    	mov    %edx,0xedc
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
 66c:	89 15 dc 0e 00 00    	mov    %edx,0xedc
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
 681:	a1 d0 0e 00 00       	mov    0xed0,%eax
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
 6c2:	89 15 d0 0e 00 00    	mov    %edx,0xed0
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
 6fc:	89 15 d0 0e 00 00    	mov    %edx,0xed0
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
 714:	83 ec 04             	sub    $0x4,%esp
  if(use_huge_pages){
 717:	85 d2                	test   %edx,%edx
 719:	74 45                	je     760 <morecore+0x50>
    if(nu < HUGE_PAGE_SIZE)
 71b:	b9 00 00 40 00       	mov    $0x400000,%ecx
 720:	39 c8                	cmp    %ecx,%eax
 722:	0f 43 c8             	cmovae %eax,%ecx
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 725:	83 ec 08             	sub    $0x8,%esp
 728:	52                   	push   %edx
 729:	8d 04 cd 00 00 00 00 	lea    0x0(,%ecx,8),%eax
 730:	89 cb                	mov    %ecx,%ebx
 732:	50                   	push   %eax
 733:	e8 23 fc ff ff       	call   35b <sbrk>
  if(p == (char*)-1)
 738:	83 c4 10             	add    $0x10,%esp
 73b:	83 f8 ff             	cmp    $0xffffffff,%eax
 73e:	74 68                	je     7a8 <morecore+0x98>
  hp->s.size = nu;
 740:	89 58 04             	mov    %ebx,0x4(%eax)

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
  if(use_huge_pages) {
    hugefree(ap);
 743:	83 ec 0c             	sub    $0xc,%esp
  vfree((void*)(hp + 1), use_huge_pages);
 746:	83 c0 08             	add    $0x8,%eax
    hugefree(ap);
 749:	50                   	push   %eax
 74a:	e8 31 ff ff ff       	call   680 <hugefree>
    return huge_freep;
 74f:	a1 d0 0e 00 00       	mov    0xed0,%eax
}
 754:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return huge_freep;
 757:	83 c4 10             	add    $0x10,%esp
}
 75a:	c9                   	leave  
 75b:	c3                   	ret    
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(nu < 4096)
 760:	ba 00 10 00 00       	mov    $0x1000,%edx
 765:	39 d0                	cmp    %edx,%eax
 767:	89 d3                	mov    %edx,%ebx
 769:	0f 43 d8             	cmovae %eax,%ebx
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 76c:	83 ec 08             	sub    $0x8,%esp
 76f:	6a 00                	push   $0x0
 771:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 778:	50                   	push   %eax
 779:	e8 dd fb ff ff       	call   35b <sbrk>
  if(p == (char*)-1)
 77e:	83 c4 10             	add    $0x10,%esp
 781:	83 f8 ff             	cmp    $0xffffffff,%eax
 784:	74 22                	je     7a8 <morecore+0x98>
  hp->s.size = nu;
 786:	89 58 04             	mov    %ebx,0x4(%eax)
  }
  else {
    normalfree(ap);
 789:	83 ec 0c             	sub    $0xc,%esp
  vfree((void*)(hp + 1), use_huge_pages);
 78c:	83 c0 08             	add    $0x8,%eax
    normalfree(ap);
 78f:	50                   	push   %eax
 790:	e8 5b fe ff ff       	call   5f0 <normalfree>
    return freep;
 795:	a1 dc 0e 00 00       	mov    0xedc,%eax
}
 79a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return freep;
 79d:	83 c4 10             	add    $0x10,%esp
}
 7a0:	c9                   	leave  
 7a1:	c3                   	ret    
 7a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 7a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 7ab:	31 c0                	xor    %eax,%eax
}
 7ad:	c9                   	leave  
 7ae:	c3                   	ret    
 7af:	90                   	nop

000007b0 <normalmalloc>:
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 0c             	sub    $0xc,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7bc:	8b 3d dc 0e 00 00    	mov    0xedc,%edi
{
 7c2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c5:	8d 70 07             	lea    0x7(%eax),%esi
 7c8:	c1 ee 03             	shr    $0x3,%esi
 7cb:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7ce:	85 ff                	test   %edi,%edi
 7d0:	74 5e                	je     830 <normalmalloc+0x80>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d2:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 7d4:	8b 48 04             	mov    0x4(%eax),%ecx
 7d7:	39 ce                	cmp    %ecx,%esi
 7d9:	77 16                	ja     7f1 <normalmalloc+0x41>
 7db:	eb 2d                	jmp    80a <normalmalloc+0x5a>
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 7e2:	8b 4a 04             	mov    0x4(%edx),%ecx
 7e5:	39 f1                	cmp    %esi,%ecx
 7e7:	73 27                	jae    810 <normalmalloc+0x60>
    if(p == freep) {
 7e9:	8b 3d dc 0e 00 00    	mov    0xedc,%edi
 7ef:	89 d0                	mov    %edx,%eax
 7f1:	39 c7                	cmp    %eax,%edi
 7f3:	75 eb                	jne    7e0 <normalmalloc+0x30>
      if((p = morecore(nunits, use_huge_pages)) == 0) {
 7f5:	89 da                	mov    %ebx,%edx
 7f7:	89 f0                	mov    %esi,%eax
 7f9:	e8 12 ff ff ff       	call   710 <morecore>
 7fe:	85 c0                	test   %eax,%eax
 800:	75 de                	jne    7e0 <normalmalloc+0x30>
}
 802:	83 c4 0c             	add    $0xc,%esp
 805:	5b                   	pop    %ebx
 806:	5e                   	pop    %esi
 807:	5f                   	pop    %edi
 808:	5d                   	pop    %ebp
 809:	c3                   	ret    
    if(p->s.size >= nunits){
 80a:	89 c2                	mov    %eax,%edx
 80c:	89 f8                	mov    %edi,%eax
 80e:	66 90                	xchg   %ax,%ax
      if(p->s.size == nunits)
 810:	39 ce                	cmp    %ecx,%esi
 812:	74 4c                	je     860 <normalmalloc+0xb0>
        p->s.size -= nunits;
 814:	29 f1                	sub    %esi,%ecx
 816:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 819:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 81c:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 81f:	a3 dc 0e 00 00       	mov    %eax,0xedc
}
 824:	83 c4 0c             	add    $0xc,%esp
      return (void*)(p + 1);
 827:	8d 42 08             	lea    0x8(%edx),%eax
}
 82a:	5b                   	pop    %ebx
 82b:	5e                   	pop    %esi
 82c:	5f                   	pop    %edi
 82d:	5d                   	pop    %ebp
 82e:	c3                   	ret    
 82f:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 dc 0e 00 00 e0 	movl   $0xee0,0xedc
 837:	0e 00 00 
    base.s.size = 0;
 83a:	bf e0 0e 00 00       	mov    $0xee0,%edi
    base.s.ptr = freep = prevp = &base;
 83f:	c7 05 e0 0e 00 00 e0 	movl   $0xee0,0xee0
 846:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 849:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 84b:	c7 05 e4 0e 00 00 00 	movl   $0x0,0xee4
 852:	00 00 00 
    if(p->s.size >= nunits){
 855:	eb 9a                	jmp    7f1 <normalmalloc+0x41>
 857:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85e:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 860:	8b 0a                	mov    (%edx),%ecx
 862:	89 08                	mov    %ecx,(%eax)
 864:	eb b9                	jmp    81f <normalmalloc+0x6f>
 866:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 86d:	8d 76 00             	lea    0x0(%esi),%esi

00000870 <hugemalloc>:
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	57                   	push   %edi
 874:	56                   	push   %esi
 875:	53                   	push   %ebx
 876:	83 ec 0c             	sub    $0xc,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 879:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = huge_freep) == 0){
 87c:	8b 3d d0 0e 00 00    	mov    0xed0,%edi
{
 882:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 885:	8d 70 07             	lea    0x7(%eax),%esi
 888:	c1 ee 03             	shr    $0x3,%esi
 88b:	83 c6 01             	add    $0x1,%esi
  if((prevp = huge_freep) == 0){
 88e:	85 ff                	test   %edi,%edi
 890:	74 5e                	je     8f0 <hugemalloc+0x80>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 892:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 894:	8b 48 04             	mov    0x4(%eax),%ecx
 897:	39 ce                	cmp    %ecx,%esi
 899:	77 16                	ja     8b1 <hugemalloc+0x41>
 89b:	eb 2d                	jmp    8ca <hugemalloc+0x5a>
 89d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 8a2:	8b 4a 04             	mov    0x4(%edx),%ecx
 8a5:	39 f1                	cmp    %esi,%ecx
 8a7:	73 27                	jae    8d0 <hugemalloc+0x60>
    if(p == huge_freep)
 8a9:	8b 3d d0 0e 00 00    	mov    0xed0,%edi
 8af:	89 d0                	mov    %edx,%eax
 8b1:	39 c7                	cmp    %eax,%edi
 8b3:	75 eb                	jne    8a0 <hugemalloc+0x30>
      if((p = morecore(nunits, use_huge_pages)) == 0)
 8b5:	89 da                	mov    %ebx,%edx
 8b7:	89 f0                	mov    %esi,%eax
 8b9:	e8 52 fe ff ff       	call   710 <morecore>
 8be:	85 c0                	test   %eax,%eax
 8c0:	75 de                	jne    8a0 <hugemalloc+0x30>
}
 8c2:	83 c4 0c             	add    $0xc,%esp
 8c5:	5b                   	pop    %ebx
 8c6:	5e                   	pop    %esi
 8c7:	5f                   	pop    %edi
 8c8:	5d                   	pop    %ebp
 8c9:	c3                   	ret    
    if(p->s.size >= nunits){
 8ca:	89 c2                	mov    %eax,%edx
 8cc:	89 f8                	mov    %edi,%eax
 8ce:	66 90                	xchg   %ax,%ax
      if(p->s.size == nunits)
 8d0:	39 ce                	cmp    %ecx,%esi
 8d2:	74 4c                	je     920 <hugemalloc+0xb0>
        p->s.size -= nunits;
 8d4:	29 f1                	sub    %esi,%ecx
 8d6:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 8d9:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 8dc:	89 72 04             	mov    %esi,0x4(%edx)
      huge_freep = prevp;
 8df:	a3 d0 0e 00 00       	mov    %eax,0xed0
}
 8e4:	83 c4 0c             	add    $0xc,%esp
      return (void*)(p + 1);
 8e7:	8d 42 08             	lea    0x8(%edx),%eax
}
 8ea:	5b                   	pop    %ebx
 8eb:	5e                   	pop    %esi
 8ec:	5f                   	pop    %edi
 8ed:	5d                   	pop    %ebp
 8ee:	c3                   	ret    
 8ef:	90                   	nop
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 8f0:	c7 05 d0 0e 00 00 d4 	movl   $0xed4,0xed0
 8f7:	0e 00 00 
    huge_base.s.size = 0;
 8fa:	bf d4 0e 00 00       	mov    $0xed4,%edi
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 8ff:	c7 05 d4 0e 00 00 d4 	movl   $0xed4,0xed4
 906:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 909:	89 f8                	mov    %edi,%eax
    huge_base.s.size = 0;
 90b:	c7 05 d8 0e 00 00 00 	movl   $0x0,0xed8
 912:	00 00 00 
    if(p->s.size >= nunits){
 915:	eb 9a                	jmp    8b1 <hugemalloc+0x41>
 917:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91e:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 920:	8b 0a                	mov    (%edx),%ecx
 922:	89 08                	mov    %ecx,(%eax)
 924:	eb b9                	jmp    8df <hugemalloc+0x6f>
 926:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 92d:	8d 76 00             	lea    0x0(%esi),%esi

00000930 <vmalloc>:
void* vmalloc(uint nbytes, int pagesize) {
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	83 ec 08             	sub    $0x8,%esp
 936:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(pagesize == VMALLOC_SIZE_BASE) {
 939:	3d 00 10 00 00       	cmp    $0x1000,%eax
 93e:	74 18                	je     958 <vmalloc+0x28>
  else if (pagesize == VMALLOC_SIZE_HUGE) {
 940:	3d 00 00 40 00       	cmp    $0x400000,%eax
 945:	75 1e                	jne    965 <vmalloc+0x35>
    return hugemalloc(nbytes, use_huge_pages);
 947:	c7 45 0c 01 00 00 00 	movl   $0x1,0xc(%ebp)
}
 94e:	c9                   	leave  
    return hugemalloc(nbytes, use_huge_pages);
 94f:	e9 1c ff ff ff       	jmp    870 <hugemalloc>
 954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return normalmalloc(nbytes, use_huge_pages);
 958:	c7 45 0c 00 00 00 00 	movl   $0x0,0xc(%ebp)
}
 95f:	c9                   	leave  
    return normalmalloc(nbytes, use_huge_pages);
 960:	e9 4b fe ff ff       	jmp    7b0 <normalmalloc>
    printf(1, "Please pass VMALLOC_SIZE_BASE or VMALLOC_SIZE_HUGE as flag.\n");
 965:	50                   	push   %eax
 966:	50                   	push   %eax
 967:	68 a0 0a 00 00       	push   $0xaa0
 96c:	6a 01                	push   $0x1
 96e:	e8 dd fa ff ff       	call   450 <printf>
    exit();
 973:	e8 5b f9 ff ff       	call   2d3 <exit>
 978:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97f:	90                   	nop

00000980 <vfree>:
void vfree(void *ap, int use_huge_pages) {
 980:	55                   	push   %ebp
 981:	89 e5                	mov    %esp,%ebp
  if(use_huge_pages) {
 983:	8b 45 0c             	mov    0xc(%ebp),%eax
 986:	85 c0                	test   %eax,%eax
 988:	74 06                	je     990 <vfree+0x10>
  }
}
 98a:	5d                   	pop    %ebp
    hugefree(ap);
 98b:	e9 f0 fc ff ff       	jmp    680 <hugefree>
}
 990:	5d                   	pop    %ebp
    normalfree(ap);
 991:	e9 5a fc ff ff       	jmp    5f0 <normalfree>
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
 9aa:	e8 dc f9 ff ff       	call   38b <getthp>

  if(nbytes >= 1048576 && thp != 0) { // only use huge pages if THP is active
 9af:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 9b5:	76 19                	jbe    9d0 <malloc+0x30>
 9b7:	85 c0                	test   %eax,%eax
 9b9:	74 15                	je     9d0 <malloc+0x30>
    return hugemalloc(nbytes, use_huge_pages);
 9bb:	83 ec 08             	sub    $0x8,%esp
 9be:	6a 01                	push   $0x1
 9c0:	53                   	push   %ebx
 9c1:	e8 aa fe ff ff       	call   870 <hugemalloc>
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
 9d6:	e8 d5 fd ff ff       	call   7b0 <normalmalloc>
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
    normalfree(ap);
 9f0:	e9 fb fb ff ff       	jmp    5f0 <normalfree>
