
_ln:     file format elf32-i386


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
  if(argc != 3){
   a:	83 39 03             	cmpl   $0x3,(%ecx)
{
   d:	55                   	push   %ebp
   e:	89 e5                	mov    %esp,%ebp
  10:	53                   	push   %ebx
  11:	51                   	push   %ecx
  12:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  15:	74 13                	je     2a <main+0x2a>
    printf(2, "Usage: ln old new\n");
  17:	52                   	push   %edx
  18:	52                   	push   %edx
  19:	68 e8 09 00 00       	push   $0x9e8
  1e:	6a 02                	push   $0x2
  20:	e8 0b 04 00 00       	call   430 <printf>
    exit();
  25:	e8 89 02 00 00       	call   2b3 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2a:	50                   	push   %eax
  2b:	50                   	push   %eax
  2c:	ff 73 08             	push   0x8(%ebx)
  2f:	ff 73 04             	push   0x4(%ebx)
  32:	e8 dc 02 00 00       	call   313 <link>
  37:	83 c4 10             	add    $0x10,%esp
  3a:	85 c0                	test   %eax,%eax
  3c:	78 05                	js     43 <main+0x43>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  3e:	e8 70 02 00 00       	call   2b3 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  43:	ff 73 08             	push   0x8(%ebx)
  46:	ff 73 04             	push   0x4(%ebx)
  49:	68 fb 09 00 00       	push   $0x9fb
  4e:	6a 02                	push   $0x2
  50:	e8 db 03 00 00       	call   430 <printf>
  55:	83 c4 10             	add    $0x10,%esp
  58:	eb e4                	jmp    3e <main+0x3e>
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 c0                	xor    %eax,%eax
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  81:	89 c8                	mov    %ecx,%eax
  83:	c9                   	leave  
  84:	c3                   	ret    
  85:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 17                	jne    b8 <strcmp+0x28>
  a1:	eb 3a                	jmp    dd <strcmp+0x4d>
  a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a7:	90                   	nop
  a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  ac:	83 c2 01             	add    $0x1,%edx
  af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  b2:	84 c0                	test   %al,%al
  b4:	74 1a                	je     d0 <strcmp+0x40>
    p++, q++;
  b6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  b8:	0f b6 19             	movzbl (%ecx),%ebx
  bb:	38 c3                	cmp    %al,%bl
  bd:	74 e9                	je     a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  bf:	29 d8                	sub    %ebx,%eax
}
  c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c4:	c9                   	leave  
  c5:	c3                   	ret    
  c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  d4:	31 c0                	xor    %eax,%eax
  d6:	29 d8                	sub    %ebx,%eax
}
  d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  db:	c9                   	leave  
  dc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  dd:	0f b6 19             	movzbl (%ecx),%ebx
  e0:	31 c0                	xor    %eax,%eax
  e2:	eb db                	jmp    bf <strcmp+0x2f>
  e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ef:	90                   	nop

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 3a 00             	cmpb   $0x0,(%edx)
  f9:	74 15                	je     110 <strlen+0x20>
  fb:	31 c0                	xor    %eax,%eax
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c0 01             	add    $0x1,%eax
 103:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 107:	89 c1                	mov    %eax,%ecx
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	89 c8                	mov    %ecx,%eax
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    
 10f:	90                   	nop
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret    
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	8b 7d fc             	mov    -0x4(%ebp),%edi
 135:	89 d0                	mov    %edx,%eax
 137:	c9                   	leave  
 138:	c3                   	ret    
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 12                	jne    163 <strchr+0x23>
 151:	eb 1d                	jmp    170 <strchr+0x30>
 153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 157:	90                   	nop
 158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 15c:	83 c0 01             	add    $0x1,%eax
 15f:	84 d2                	test   %dl,%dl
 161:	74 0d                	je     170 <strchr+0x30>
    if(*s == c)
 163:	38 d1                	cmp    %dl,%cl
 165:	75 f1                	jne    158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 185:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 189:	31 db                	xor    %ebx,%ebx
{
 18b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 18e:	eb 27                	jmp    1b7 <gets+0x37>
    cc = read(0, &c, 1);
 190:	83 ec 04             	sub    $0x4,%esp
 193:	6a 01                	push   $0x1
 195:	57                   	push   %edi
 196:	6a 00                	push   $0x0
 198:	e8 2e 01 00 00       	call   2cb <read>
    if(cc < 1)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	85 c0                	test   %eax,%eax
 1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
 1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
 1ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1af:	3c 0a                	cmp    $0xa,%al
 1b1:	74 1d                	je     1d0 <gets+0x50>
 1b3:	3c 0d                	cmp    $0xd,%al
 1b5:	74 19                	je     1d0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1b7:	89 de                	mov    %ebx,%esi
 1b9:	83 c3 01             	add    $0x1,%ebx
 1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bf:	7c cf                	jl     190 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1c1:	8b 45 08             	mov    0x8(%ebp),%eax
 1c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cb:	5b                   	pop    %ebx
 1cc:	5e                   	pop    %esi
 1cd:	5f                   	pop    %edi
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    
  buf[i] = '\0';
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	89 de                	mov    %ebx,%esi
 1d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1dc:	5b                   	pop    %ebx
 1dd:	5e                   	pop    %esi
 1de:	5f                   	pop    %edi
 1df:	5d                   	pop    %ebp
 1e0:	c3                   	ret    
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	push   0x8(%ebp)
 1fd:	e8 f1 00 00 00       	call   2f3 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	push   0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f4 00 00 00       	call   30b <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 ba 00 00 00       	call   2db <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 02             	movsbl (%edx),%eax
 24a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 24d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 255:	77 1e                	ja     275 <atoi+0x35>
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 260:	83 c2 01             	add    $0x1,%edx
 263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 26a:	0f be 02             	movsbl (%edx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 278:	89 c8                	mov    %ecx,%eax
 27a:	c9                   	leave  
 27b:	c3                   	ret    
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 45 10             	mov    0x10(%ebp),%eax
 287:	8b 55 08             	mov    0x8(%ebp),%edx
 28a:	56                   	push   %esi
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 c0                	test   %eax,%eax
 290:	7e 13                	jle    2a5 <memmove+0x25>
 292:	01 d0                	add    %edx,%eax
  dst = vdst;
 294:	89 d7                	mov    %edx,%edi
 296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2a1:	39 f8                	cmp    %edi,%eax
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
  return vdst;
}
 2a5:	5e                   	pop    %esi
 2a6:	89 d0                	mov    %edx,%eax
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret    

000002ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ab:	b8 01 00 00 00       	mov    $0x1,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <exit>:
SYSCALL(exit)
 2b3:	b8 02 00 00 00       	mov    $0x2,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <wait>:
SYSCALL(wait)
 2bb:	b8 03 00 00 00       	mov    $0x3,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <pipe>:
SYSCALL(pipe)
 2c3:	b8 04 00 00 00       	mov    $0x4,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <read>:
SYSCALL(read)
 2cb:	b8 05 00 00 00       	mov    $0x5,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <write>:
SYSCALL(write)
 2d3:	b8 10 00 00 00       	mov    $0x10,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <close>:
SYSCALL(close)
 2db:	b8 15 00 00 00       	mov    $0x15,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <kill>:
SYSCALL(kill)
 2e3:	b8 06 00 00 00       	mov    $0x6,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <exec>:
SYSCALL(exec)
 2eb:	b8 07 00 00 00       	mov    $0x7,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <open>:
SYSCALL(open)
 2f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <mknod>:
SYSCALL(mknod)
 2fb:	b8 11 00 00 00       	mov    $0x11,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <unlink>:
SYSCALL(unlink)
 303:	b8 12 00 00 00       	mov    $0x12,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <fstat>:
SYSCALL(fstat)
 30b:	b8 08 00 00 00       	mov    $0x8,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <link>:
SYSCALL(link)
 313:	b8 13 00 00 00       	mov    $0x13,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <mkdir>:
SYSCALL(mkdir)
 31b:	b8 14 00 00 00       	mov    $0x14,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <chdir>:
SYSCALL(chdir)
 323:	b8 09 00 00 00       	mov    $0x9,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <dup>:
SYSCALL(dup)
 32b:	b8 0a 00 00 00       	mov    $0xa,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <getpid>:
SYSCALL(getpid)
 333:	b8 0b 00 00 00       	mov    $0xb,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <sbrk>:
SYSCALL(sbrk)
 33b:	b8 0c 00 00 00       	mov    $0xc,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <sleep>:
SYSCALL(sleep)
 343:	b8 0d 00 00 00       	mov    $0xd,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <uptime>:
SYSCALL(uptime)
 34b:	b8 0e 00 00 00       	mov    $0xe,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <printhugepde>:
SYSCALL(printhugepde)
 353:	b8 16 00 00 00       	mov    $0x16,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 35b:	b8 17 00 00 00       	mov    $0x17,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <setthp>:
SYSCALL(setthp)
 363:	b8 18 00 00 00       	mov    $0x18,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <getthp>:
 36b:	b8 19 00 00 00       	mov    $0x19,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    
 373:	66 90                	xchg   %ax,%ax
 375:	66 90                	xchg   %ax,%ax
 377:	66 90                	xchg   %ax,%ax
 379:	66 90                	xchg   %ax,%ax
 37b:	66 90                	xchg   %ax,%ax
 37d:	66 90                	xchg   %ax,%ax
 37f:	90                   	nop

00000380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	53                   	push   %ebx
 386:	83 ec 3c             	sub    $0x3c,%esp
 389:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 38c:	89 d1                	mov    %edx,%ecx
{
 38e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 391:	85 d2                	test   %edx,%edx
 393:	0f 89 7f 00 00 00    	jns    418 <printint+0x98>
 399:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 39d:	74 79                	je     418 <printint+0x98>
    neg = 1;
 39f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 3a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 3a8:	31 db                	xor    %ebx,%ebx
 3aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3b0:	89 c8                	mov    %ecx,%eax
 3b2:	31 d2                	xor    %edx,%edx
 3b4:	89 cf                	mov    %ecx,%edi
 3b6:	f7 75 c4             	divl   -0x3c(%ebp)
 3b9:	0f b6 92 70 0a 00 00 	movzbl 0xa70(%edx),%edx
 3c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3c3:	89 d8                	mov    %ebx,%eax
 3c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3d1:	76 dd                	jbe    3b0 <printint+0x30>
  if(neg)
 3d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3d6:	85 c9                	test   %ecx,%ecx
 3d8:	74 0c                	je     3e6 <printint+0x66>
    buf[i++] = '-';
 3da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 3e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3ed:	eb 07                	jmp    3f6 <printint+0x76>
 3ef:	90                   	nop
    putc(fd, buf[i]);
 3f0:	0f b6 13             	movzbl (%ebx),%edx
 3f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3f6:	83 ec 04             	sub    $0x4,%esp
 3f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3fc:	6a 01                	push   $0x1
 3fe:	56                   	push   %esi
 3ff:	57                   	push   %edi
 400:	e8 ce fe ff ff       	call   2d3 <write>
  while(--i >= 0)
 405:	83 c4 10             	add    $0x10,%esp
 408:	39 de                	cmp    %ebx,%esi
 40a:	75 e4                	jne    3f0 <printint+0x70>
}
 40c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40f:	5b                   	pop    %ebx
 410:	5e                   	pop    %esi
 411:	5f                   	pop    %edi
 412:	5d                   	pop    %ebp
 413:	c3                   	ret    
 414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 418:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 41f:	eb 87                	jmp    3a8 <printint+0x28>
 421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 428:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop

00000430 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 439:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 43c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 43f:	0f b6 13             	movzbl (%ebx),%edx
 442:	84 d2                	test   %dl,%dl
 444:	74 6a                	je     4b0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 446:	8d 45 10             	lea    0x10(%ebp),%eax
 449:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 44c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 44f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 451:	89 45 d0             	mov    %eax,-0x30(%ebp)
 454:	eb 36                	jmp    48c <printf+0x5c>
 456:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45d:	8d 76 00             	lea    0x0(%esi),%esi
 460:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 463:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 468:	83 f8 25             	cmp    $0x25,%eax
 46b:	74 15                	je     482 <printf+0x52>
  write(fd, &c, 1);
 46d:	83 ec 04             	sub    $0x4,%esp
 470:	88 55 e7             	mov    %dl,-0x19(%ebp)
 473:	6a 01                	push   $0x1
 475:	57                   	push   %edi
 476:	56                   	push   %esi
 477:	e8 57 fe ff ff       	call   2d3 <write>
 47c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 47f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 482:	0f b6 13             	movzbl (%ebx),%edx
 485:	83 c3 01             	add    $0x1,%ebx
 488:	84 d2                	test   %dl,%dl
 48a:	74 24                	je     4b0 <printf+0x80>
    c = fmt[i] & 0xff;
 48c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 48f:	85 c9                	test   %ecx,%ecx
 491:	74 cd                	je     460 <printf+0x30>
      }
    } else if(state == '%'){
 493:	83 f9 25             	cmp    $0x25,%ecx
 496:	75 ea                	jne    482 <printf+0x52>
      if(c == 'd'){
 498:	83 f8 25             	cmp    $0x25,%eax
 49b:	0f 84 07 01 00 00    	je     5a8 <printf+0x178>
 4a1:	83 e8 63             	sub    $0x63,%eax
 4a4:	83 f8 15             	cmp    $0x15,%eax
 4a7:	77 17                	ja     4c0 <printf+0x90>
 4a9:	ff 24 85 18 0a 00 00 	jmp    *0xa18(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b3:	5b                   	pop    %ebx
 4b4:	5e                   	pop    %esi
 4b5:	5f                   	pop    %edi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    
 4b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bf:	90                   	nop
  write(fd, &c, 1);
 4c0:	83 ec 04             	sub    $0x4,%esp
 4c3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 4c6:	6a 01                	push   $0x1
 4c8:	57                   	push   %edi
 4c9:	56                   	push   %esi
 4ca:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4ce:	e8 00 fe ff ff       	call   2d3 <write>
        putc(fd, c);
 4d3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 4d7:	83 c4 0c             	add    $0xc,%esp
 4da:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4dd:	6a 01                	push   $0x1
 4df:	57                   	push   %edi
 4e0:	56                   	push   %esi
 4e1:	e8 ed fd ff ff       	call   2d3 <write>
        putc(fd, c);
 4e6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4e9:	31 c9                	xor    %ecx,%ecx
 4eb:	eb 95                	jmp    482 <printf+0x52>
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4f0:	83 ec 0c             	sub    $0xc,%esp
 4f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4f8:	6a 00                	push   $0x0
 4fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4fd:	8b 10                	mov    (%eax),%edx
 4ff:	89 f0                	mov    %esi,%eax
 501:	e8 7a fe ff ff       	call   380 <printint>
        ap++;
 506:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 50a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 50d:	31 c9                	xor    %ecx,%ecx
 50f:	e9 6e ff ff ff       	jmp    482 <printf+0x52>
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 518:	8b 45 d0             	mov    -0x30(%ebp),%eax
 51b:	8b 10                	mov    (%eax),%edx
        ap++;
 51d:	83 c0 04             	add    $0x4,%eax
 520:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 523:	85 d2                	test   %edx,%edx
 525:	0f 84 8d 00 00 00    	je     5b8 <printf+0x188>
        while(*s != 0){
 52b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 52e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 530:	84 c0                	test   %al,%al
 532:	0f 84 4a ff ff ff    	je     482 <printf+0x52>
 538:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 53b:	89 d3                	mov    %edx,%ebx
 53d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 540:	83 ec 04             	sub    $0x4,%esp
          s++;
 543:	83 c3 01             	add    $0x1,%ebx
 546:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 549:	6a 01                	push   $0x1
 54b:	57                   	push   %edi
 54c:	56                   	push   %esi
 54d:	e8 81 fd ff ff       	call   2d3 <write>
        while(*s != 0){
 552:	0f b6 03             	movzbl (%ebx),%eax
 555:	83 c4 10             	add    $0x10,%esp
 558:	84 c0                	test   %al,%al
 55a:	75 e4                	jne    540 <printf+0x110>
      state = 0;
 55c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 55f:	31 c9                	xor    %ecx,%ecx
 561:	e9 1c ff ff ff       	jmp    482 <printf+0x52>
 566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 570:	83 ec 0c             	sub    $0xc,%esp
 573:	b9 0a 00 00 00       	mov    $0xa,%ecx
 578:	6a 01                	push   $0x1
 57a:	e9 7b ff ff ff       	jmp    4fa <printf+0xca>
 57f:	90                   	nop
        putc(fd, *ap);
 580:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 583:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 586:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 588:	6a 01                	push   $0x1
 58a:	57                   	push   %edi
 58b:	56                   	push   %esi
        putc(fd, *ap);
 58c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 58f:	e8 3f fd ff ff       	call   2d3 <write>
        ap++;
 594:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 598:	83 c4 10             	add    $0x10,%esp
      state = 0;
 59b:	31 c9                	xor    %ecx,%ecx
 59d:	e9 e0 fe ff ff       	jmp    482 <printf+0x52>
 5a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 5a8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5ab:	83 ec 04             	sub    $0x4,%esp
 5ae:	e9 2a ff ff ff       	jmp    4dd <printf+0xad>
 5b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5b7:	90                   	nop
          s = "(null)";
 5b8:	ba 0f 0a 00 00       	mov    $0xa0f,%edx
        while(*s != 0){
 5bd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5c0:	b8 28 00 00 00       	mov    $0x28,%eax
 5c5:	89 d3                	mov    %edx,%ebx
 5c7:	e9 74 ff ff ff       	jmp    540 <printf+0x110>
 5cc:	66 90                	xchg   %ax,%ax
 5ce:	66 90                	xchg   %ax,%ax

000005d0 <normalfree>:
  }
}

void
normalfree(void *ap)
{
 5d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d1:	a1 b4 0e 00 00       	mov    0xeb4,%eax
{
 5d6:	89 e5                	mov    %esp,%ebp
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	53                   	push   %ebx
 5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e8:	89 c2                	mov    %eax,%edx
 5ea:	8b 00                	mov    (%eax),%eax
 5ec:	39 ca                	cmp    %ecx,%edx
 5ee:	73 30                	jae    620 <normalfree+0x50>
 5f0:	39 c1                	cmp    %eax,%ecx
 5f2:	72 04                	jb     5f8 <normalfree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f4:	39 c2                	cmp    %eax,%edx
 5f6:	72 f0                	jb     5e8 <normalfree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5fe:	39 f8                	cmp    %edi,%eax
 600:	74 30                	je     632 <normalfree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 602:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 605:	8b 42 04             	mov    0x4(%edx),%eax
 608:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 60b:	39 f1                	cmp    %esi,%ecx
 60d:	74 3a                	je     649 <normalfree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 60f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 611:	5b                   	pop    %ebx
  freep = p;
 612:	89 15 b4 0e 00 00    	mov    %edx,0xeb4
}
 618:	5e                   	pop    %esi
 619:	5f                   	pop    %edi
 61a:	5d                   	pop    %ebp
 61b:	c3                   	ret    
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 620:	39 c2                	cmp    %eax,%edx
 622:	72 c4                	jb     5e8 <normalfree+0x18>
 624:	39 c1                	cmp    %eax,%ecx
 626:	73 c0                	jae    5e8 <normalfree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 628:	8b 73 fc             	mov    -0x4(%ebx),%esi
 62b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 62e:	39 f8                	cmp    %edi,%eax
 630:	75 d0                	jne    602 <normalfree+0x32>
    bp->s.size += p->s.ptr->s.size;
 632:	03 70 04             	add    0x4(%eax),%esi
 635:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 638:	8b 02                	mov    (%edx),%eax
 63a:	8b 00                	mov    (%eax),%eax
 63c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 63f:	8b 42 04             	mov    0x4(%edx),%eax
 642:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 645:	39 f1                	cmp    %esi,%ecx
 647:	75 c6                	jne    60f <normalfree+0x3f>
    p->s.size += bp->s.size;
 649:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 64c:	89 15 b4 0e 00 00    	mov    %edx,0xeb4
    p->s.size += bp->s.size;
 652:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 655:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 658:	89 0a                	mov    %ecx,(%edx)
}
 65a:	5b                   	pop    %ebx
 65b:	5e                   	pop    %esi
 65c:	5f                   	pop    %edi
 65d:	5d                   	pop    %ebp
 65e:	c3                   	ret    
 65f:	90                   	nop

00000660 <hugefree>:

void
hugefree(void *ap)
{
 660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	a1 a8 0e 00 00       	mov    0xea8,%eax
{
 666:	89 e5                	mov    %esp,%ebp
 668:	57                   	push   %edi
 669:	56                   	push   %esi
 66a:	53                   	push   %ebx
 66b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 66e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 678:	89 c2                	mov    %eax,%edx
 67a:	8b 00                	mov    (%eax),%eax
 67c:	39 ca                	cmp    %ecx,%edx
 67e:	73 30                	jae    6b0 <hugefree+0x50>
 680:	39 c1                	cmp    %eax,%ecx
 682:	72 04                	jb     688 <hugefree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 684:	39 c2                	cmp    %eax,%edx
 686:	72 f0                	jb     678 <hugefree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 688:	8b 73 fc             	mov    -0x4(%ebx),%esi
 68b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68e:	39 f8                	cmp    %edi,%eax
 690:	74 30                	je     6c2 <hugefree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 692:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 695:	8b 42 04             	mov    0x4(%edx),%eax
 698:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 69b:	39 f1                	cmp    %esi,%ecx
 69d:	74 3a                	je     6d9 <hugefree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 69f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  huge_freep = p;
}
 6a1:	5b                   	pop    %ebx
  huge_freep = p;
 6a2:	89 15 a8 0e 00 00    	mov    %edx,0xea8
}
 6a8:	5e                   	pop    %esi
 6a9:	5f                   	pop    %edi
 6aa:	5d                   	pop    %ebp
 6ab:	c3                   	ret    
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b0:	39 c2                	cmp    %eax,%edx
 6b2:	72 c4                	jb     678 <hugefree+0x18>
 6b4:	39 c1                	cmp    %eax,%ecx
 6b6:	73 c0                	jae    678 <hugefree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 6b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6be:	39 f8                	cmp    %edi,%eax
 6c0:	75 d0                	jne    692 <hugefree+0x32>
    bp->s.size += p->s.ptr->s.size;
 6c2:	03 70 04             	add    0x4(%eax),%esi
 6c5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c8:	8b 02                	mov    (%edx),%eax
 6ca:	8b 00                	mov    (%eax),%eax
 6cc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6cf:	8b 42 04             	mov    0x4(%edx),%eax
 6d2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6d5:	39 f1                	cmp    %esi,%ecx
 6d7:	75 c6                	jne    69f <hugefree+0x3f>
    p->s.size += bp->s.size;
 6d9:	03 43 fc             	add    -0x4(%ebx),%eax
  huge_freep = p;
 6dc:	89 15 a8 0e 00 00    	mov    %edx,0xea8
    p->s.size += bp->s.size;
 6e2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6e5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6e8:	89 0a                	mov    %ecx,(%edx)
}
 6ea:	5b                   	pop    %ebx
 6eb:	5e                   	pop    %esi
 6ec:	5f                   	pop    %edi
 6ed:	5d                   	pop    %ebp
 6ee:	c3                   	ret    
 6ef:	90                   	nop

000006f0 <morecore>:
static Header* morecore(uint nu, int use_huge_pages) {
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	53                   	push   %ebx
 6f4:	89 c3                	mov    %eax,%ebx
 6f6:	83 ec 04             	sub    $0x4,%esp
  if(use_huge_pages){
 6f9:	85 d2                	test   %edx,%edx
 6fb:	74 43                	je     740 <morecore+0x50>
    if(nu < HUGE_PAGE_SIZE)
 6fd:	3d ff ff 3f 00       	cmp    $0x3fffff,%eax
 702:	76 7c                	jbe    780 <morecore+0x90>
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 704:	8d 04 c5 00 00 00 00 	lea    0x0(,%eax,8),%eax
 70b:	83 ec 08             	sub    $0x8,%esp
 70e:	52                   	push   %edx
 70f:	50                   	push   %eax
 710:	e8 26 fc ff ff       	call   33b <sbrk>
  if(p == (char*)-1)
 715:	83 c4 10             	add    $0x10,%esp
 718:	83 f8 ff             	cmp    $0xffffffff,%eax
 71b:	74 73                	je     790 <morecore+0xa0>
  hp->s.size = nu;
 71d:	89 58 04             	mov    %ebx,0x4(%eax)

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
  if(use_huge_pages) {
    hugefree(ap);
 720:	83 ec 0c             	sub    $0xc,%esp
  vfree((void*)(hp + 1), use_huge_pages);
 723:	83 c0 08             	add    $0x8,%eax
    hugefree(ap);
 726:	50                   	push   %eax
 727:	e8 34 ff ff ff       	call   660 <hugefree>
    return huge_freep;
 72c:	a1 a8 0e 00 00       	mov    0xea8,%eax
}
 731:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return huge_freep;
 734:	83 c4 10             	add    $0x10,%esp
}
 737:	c9                   	leave  
 738:	c3                   	ret    
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(nu < 4096)
 740:	b8 00 10 00 00       	mov    $0x1000,%eax
 745:	39 c3                	cmp    %eax,%ebx
 747:	0f 42 d8             	cmovb  %eax,%ebx
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 74a:	83 ec 08             	sub    $0x8,%esp
 74d:	6a 00                	push   $0x0
 74f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 756:	50                   	push   %eax
 757:	e8 df fb ff ff       	call   33b <sbrk>
  if(p == (char*)-1)
 75c:	83 c4 10             	add    $0x10,%esp
 75f:	83 f8 ff             	cmp    $0xffffffff,%eax
 762:	74 2c                	je     790 <morecore+0xa0>
  hp->s.size = nu;
 764:	89 58 04             	mov    %ebx,0x4(%eax)
  }
  else {
    normalfree(ap);
 767:	83 ec 0c             	sub    $0xc,%esp
  vfree((void*)(hp + 1), use_huge_pages);
 76a:	83 c0 08             	add    $0x8,%eax
    normalfree(ap);
 76d:	50                   	push   %eax
 76e:	e8 5d fe ff ff       	call   5d0 <normalfree>
    return freep;
 773:	a1 b4 0e 00 00       	mov    0xeb4,%eax
}
 778:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return freep;
 77b:	83 c4 10             	add    $0x10,%esp
}
 77e:	c9                   	leave  
 77f:	c3                   	ret    
 780:	b8 00 80 00 00       	mov    $0x8000,%eax
      nu = 4096;
 785:	bb 00 10 00 00       	mov    $0x1000,%ebx
 78a:	e9 7c ff ff ff       	jmp    70b <morecore+0x1b>
 78f:	90                   	nop
}
 790:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 793:	31 c0                	xor    %eax,%eax
}
 795:	c9                   	leave  
 796:	c3                   	ret    
 797:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79e:	66 90                	xchg   %ax,%ax

000007a0 <normalmalloc>:
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 0c             	sub    $0xc,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ac:	8b 3d b4 0e 00 00    	mov    0xeb4,%edi
{
 7b2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b5:	8d 70 07             	lea    0x7(%eax),%esi
 7b8:	c1 ee 03             	shr    $0x3,%esi
 7bb:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7be:	85 ff                	test   %edi,%edi
 7c0:	74 5e                	je     820 <normalmalloc+0x80>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c2:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 7c4:	8b 48 04             	mov    0x4(%eax),%ecx
 7c7:	39 ce                	cmp    %ecx,%esi
 7c9:	77 16                	ja     7e1 <normalmalloc+0x41>
 7cb:	eb 2d                	jmp    7fa <normalmalloc+0x5a>
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 7d2:	8b 4a 04             	mov    0x4(%edx),%ecx
 7d5:	39 f1                	cmp    %esi,%ecx
 7d7:	73 27                	jae    800 <normalmalloc+0x60>
    if(p == freep) {
 7d9:	8b 3d b4 0e 00 00    	mov    0xeb4,%edi
 7df:	89 d0                	mov    %edx,%eax
 7e1:	39 c7                	cmp    %eax,%edi
 7e3:	75 eb                	jne    7d0 <normalmalloc+0x30>
      if((p = morecore(nunits, use_huge_pages)) == 0) {
 7e5:	89 da                	mov    %ebx,%edx
 7e7:	89 f0                	mov    %esi,%eax
 7e9:	e8 02 ff ff ff       	call   6f0 <morecore>
 7ee:	85 c0                	test   %eax,%eax
 7f0:	75 de                	jne    7d0 <normalmalloc+0x30>
}
 7f2:	83 c4 0c             	add    $0xc,%esp
 7f5:	5b                   	pop    %ebx
 7f6:	5e                   	pop    %esi
 7f7:	5f                   	pop    %edi
 7f8:	5d                   	pop    %ebp
 7f9:	c3                   	ret    
    if(p->s.size >= nunits){
 7fa:	89 c2                	mov    %eax,%edx
 7fc:	89 f8                	mov    %edi,%eax
 7fe:	66 90                	xchg   %ax,%ax
      if(p->s.size == nunits)
 800:	39 ce                	cmp    %ecx,%esi
 802:	74 4c                	je     850 <normalmalloc+0xb0>
        p->s.size -= nunits;
 804:	29 f1                	sub    %esi,%ecx
 806:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 809:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 80c:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 80f:	a3 b4 0e 00 00       	mov    %eax,0xeb4
}
 814:	83 c4 0c             	add    $0xc,%esp
      return (void*)(p + 1);
 817:	8d 42 08             	lea    0x8(%edx),%eax
}
 81a:	5b                   	pop    %ebx
 81b:	5e                   	pop    %esi
 81c:	5f                   	pop    %edi
 81d:	5d                   	pop    %ebp
 81e:	c3                   	ret    
 81f:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 820:	c7 05 b4 0e 00 00 b8 	movl   $0xeb8,0xeb4
 827:	0e 00 00 
    base.s.size = 0;
 82a:	bf b8 0e 00 00       	mov    $0xeb8,%edi
    base.s.ptr = freep = prevp = &base;
 82f:	c7 05 b8 0e 00 00 b8 	movl   $0xeb8,0xeb8
 836:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 839:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 83b:	c7 05 bc 0e 00 00 00 	movl   $0x0,0xebc
 842:	00 00 00 
    if(p->s.size >= nunits){
 845:	eb 9a                	jmp    7e1 <normalmalloc+0x41>
 847:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84e:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 850:	8b 0a                	mov    (%edx),%ecx
 852:	89 08                	mov    %ecx,(%eax)
 854:	eb b9                	jmp    80f <normalmalloc+0x6f>
 856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85d:	8d 76 00             	lea    0x0(%esi),%esi

00000860 <hugemalloc>:
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	57                   	push   %edi
 864:	56                   	push   %esi
 865:	53                   	push   %ebx
 866:	83 ec 0c             	sub    $0xc,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 869:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = huge_freep) == 0){
 86c:	8b 3d a8 0e 00 00    	mov    0xea8,%edi
{
 872:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 875:	8d 70 07             	lea    0x7(%eax),%esi
 878:	c1 ee 03             	shr    $0x3,%esi
 87b:	83 c6 01             	add    $0x1,%esi
  if((prevp = huge_freep) == 0){
 87e:	85 ff                	test   %edi,%edi
 880:	74 5e                	je     8e0 <hugemalloc+0x80>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 882:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 884:	8b 48 04             	mov    0x4(%eax),%ecx
 887:	39 ce                	cmp    %ecx,%esi
 889:	77 16                	ja     8a1 <hugemalloc+0x41>
 88b:	eb 2d                	jmp    8ba <hugemalloc+0x5a>
 88d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 890:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 892:	8b 4a 04             	mov    0x4(%edx),%ecx
 895:	39 f1                	cmp    %esi,%ecx
 897:	73 27                	jae    8c0 <hugemalloc+0x60>
    if(p == huge_freep)
 899:	8b 3d a8 0e 00 00    	mov    0xea8,%edi
 89f:	89 d0                	mov    %edx,%eax
 8a1:	39 c7                	cmp    %eax,%edi
 8a3:	75 eb                	jne    890 <hugemalloc+0x30>
      if((p = morecore(nunits, use_huge_pages)) == 0)
 8a5:	89 da                	mov    %ebx,%edx
 8a7:	89 f0                	mov    %esi,%eax
 8a9:	e8 42 fe ff ff       	call   6f0 <morecore>
 8ae:	85 c0                	test   %eax,%eax
 8b0:	75 de                	jne    890 <hugemalloc+0x30>
}
 8b2:	83 c4 0c             	add    $0xc,%esp
 8b5:	5b                   	pop    %ebx
 8b6:	5e                   	pop    %esi
 8b7:	5f                   	pop    %edi
 8b8:	5d                   	pop    %ebp
 8b9:	c3                   	ret    
    if(p->s.size >= nunits){
 8ba:	89 c2                	mov    %eax,%edx
 8bc:	89 f8                	mov    %edi,%eax
 8be:	66 90                	xchg   %ax,%ax
      if(p->s.size == nunits)
 8c0:	39 ce                	cmp    %ecx,%esi
 8c2:	74 4c                	je     910 <hugemalloc+0xb0>
        p->s.size -= nunits;
 8c4:	29 f1                	sub    %esi,%ecx
 8c6:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 8c9:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 8cc:	89 72 04             	mov    %esi,0x4(%edx)
      huge_freep = prevp;
 8cf:	a3 a8 0e 00 00       	mov    %eax,0xea8
}
 8d4:	83 c4 0c             	add    $0xc,%esp
      return (void*)(p + 1);
 8d7:	8d 42 08             	lea    0x8(%edx),%eax
}
 8da:	5b                   	pop    %ebx
 8db:	5e                   	pop    %esi
 8dc:	5f                   	pop    %edi
 8dd:	5d                   	pop    %ebp
 8de:	c3                   	ret    
 8df:	90                   	nop
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 8e0:	c7 05 a8 0e 00 00 ac 	movl   $0xeac,0xea8
 8e7:	0e 00 00 
    huge_base.s.size = 0;
 8ea:	bf ac 0e 00 00       	mov    $0xeac,%edi
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 8ef:	c7 05 ac 0e 00 00 ac 	movl   $0xeac,0xeac
 8f6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f9:	89 f8                	mov    %edi,%eax
    huge_base.s.size = 0;
 8fb:	c7 05 b0 0e 00 00 00 	movl   $0x0,0xeb0
 902:	00 00 00 
    if(p->s.size >= nunits){
 905:	eb 9a                	jmp    8a1 <hugemalloc+0x41>
 907:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90e:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 910:	8b 0a                	mov    (%edx),%ecx
 912:	89 08                	mov    %ecx,(%eax)
 914:	eb b9                	jmp    8cf <hugemalloc+0x6f>
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
 93f:	e9 1c ff ff ff       	jmp    860 <hugemalloc>
 944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return normalmalloc(nbytes, use_huge_pages);
 948:	c7 45 0c 00 00 00 00 	movl   $0x0,0xc(%ebp)
}
 94f:	c9                   	leave  
    return normalmalloc(nbytes, use_huge_pages);
 950:	e9 4b fe ff ff       	jmp    7a0 <normalmalloc>
    printf(1, "Please pass VMALLOC_SIZE_BASE or VMALLOC_SIZE_HUGE as flag.\n");
 955:	50                   	push   %eax
 956:	50                   	push   %eax
 957:	68 84 0a 00 00       	push   $0xa84
 95c:	6a 01                	push   $0x1
 95e:	e8 cd fa ff ff       	call   430 <printf>
    exit();
 963:	e8 4b f9 ff ff       	call   2b3 <exit>
 968:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 96f:	90                   	nop

00000970 <vfree>:
void vfree(void *ap, int use_huge_pages) {
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
  if(use_huge_pages) {
 973:	8b 45 0c             	mov    0xc(%ebp),%eax
 976:	85 c0                	test   %eax,%eax
 978:	74 06                	je     980 <vfree+0x10>
  }
}
 97a:	5d                   	pop    %ebp
    hugefree(ap);
 97b:	e9 e0 fc ff ff       	jmp    660 <hugefree>
}
 980:	5d                   	pop    %ebp
    normalfree(ap);
 981:	e9 4a fc ff ff       	jmp    5d0 <normalfree>
 986:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98d:	8d 76 00             	lea    0x0(%esi),%esi

00000990 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	53                   	push   %ebx
 994:	83 ec 04             	sub    $0x4,%esp
 997:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 99a:	e8 cc f9 ff ff       	call   36b <getthp>

  if(nbytes >= 1048576 && thp != 0) { // only use huge pages if THP is active
 99f:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 9a5:	76 19                	jbe    9c0 <malloc+0x30>
 9a7:	85 c0                	test   %eax,%eax
 9a9:	74 15                	je     9c0 <malloc+0x30>
    return hugemalloc(nbytes, use_huge_pages);
 9ab:	83 ec 08             	sub    $0x8,%esp
 9ae:	6a 01                	push   $0x1
 9b0:	53                   	push   %ebx
 9b1:	e8 aa fe ff ff       	call   860 <hugemalloc>
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
  }
  else{
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
  }
}
 9b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
 9b9:	83 c4 10             	add    $0x10,%esp
}
 9bc:	c9                   	leave  
 9bd:	c3                   	ret    
 9be:	66 90                	xchg   %ax,%ax
    return normalmalloc(nbytes, use_huge_pages);
 9c0:	83 ec 08             	sub    $0x8,%esp
 9c3:	6a 00                	push   $0x0
 9c5:	53                   	push   %ebx
 9c6:	e8 d5 fd ff ff       	call   7a0 <normalmalloc>
}
 9cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
 9ce:	83 c4 10             	add    $0x10,%esp
}
 9d1:	c9                   	leave  
 9d2:	c3                   	ret    
 9d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009e0 <free>:
    normalfree(ap);
 9e0:	e9 eb fb ff ff       	jmp    5d0 <normalfree>
