
_rm:     file format elf32-i386


Disassembly of section .text:

00000000 <vmalloc.cold>:

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
   0:	c7 05 58 0c 00 00 5c 	movl   $0xc5c,0xc58
   7:	0c 00 00 
   a:	c7 05 5c 0c 00 00 5c 	movl   $0xc5c,0xc5c
  11:	0c 00 00 
            huge_base.s.size = 0;
  14:	c7 05 60 0c 00 00 00 	movl   $0x0,0xc60
  1b:	00 00 00 
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
  1e:	a1 00 00 00 00       	mov    0x0,%eax
  23:	0f 0b                	ud2    
            base.s.ptr = freep = &base;
  25:	c7 05 64 0c 00 00 68 	movl   $0xc68,0xc64
  2c:	0c 00 00 
  2f:	c7 05 68 0c 00 00 68 	movl   $0xc68,0xc68
  36:	0c 00 00 
            base.s.size = 0;
  39:	c7 05 6c 0c 00 00 00 	movl   $0x0,0xc6c
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
  5e:	bf 01 00 00 00       	mov    $0x1,%edi
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	51                   	push   %ecx
  66:	83 ec 08             	sub    $0x8,%esp
  69:	8b 59 04             	mov    0x4(%ecx),%ebx
  6c:	8b 31                	mov    (%ecx),%esi
  6e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
  71:	83 fe 01             	cmp    $0x1,%esi
  74:	7e 3e                	jle    b4 <main+0x64>
  76:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  7d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
  80:	83 ec 0c             	sub    $0xc,%esp
  83:	ff 33                	push   (%ebx)
  85:	e8 e9 02 00 00       	call   373 <unlink>
  8a:	83 c4 10             	add    $0x10,%esp
  8d:	85 c0                	test   %eax,%eax
  8f:	78 0f                	js     a0 <main+0x50>
  for(i = 1; i < argc; i++){
  91:	83 c7 01             	add    $0x1,%edi
  94:	83 c3 04             	add    $0x4,%ebx
  97:	39 fe                	cmp    %edi,%esi
  99:	75 e5                	jne    80 <main+0x30>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
  9b:	e8 83 02 00 00       	call   323 <exit>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  a0:	50                   	push   %eax
  a1:	ff 33                	push   (%ebx)
  a3:	68 b8 08 00 00       	push   $0x8b8
  a8:	6a 02                	push   $0x2
  aa:	e8 f1 03 00 00       	call   4a0 <printf>
      break;
  af:	83 c4 10             	add    $0x10,%esp
  b2:	eb e7                	jmp    9b <main+0x4b>
    printf(2, "Usage: rm files...\n");
  b4:	52                   	push   %edx
  b5:	52                   	push   %edx
  b6:	68 a4 08 00 00       	push   $0x8a4
  bb:	6a 02                	push   $0x2
  bd:	e8 de 03 00 00       	call   4a0 <printf>
    exit();
  c2:	e8 5c 02 00 00       	call   323 <exit>
  c7:	66 90                	xchg   %ax,%ax
  c9:	66 90                	xchg   %ax,%ax
  cb:	66 90                	xchg   %ax,%ax
  cd:	66 90                	xchg   %ax,%ax
  cf:	90                   	nop

000000d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  d0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  d1:	31 c0                	xor    %eax,%eax
{
  d3:	89 e5                	mov    %esp,%ebp
  d5:	53                   	push   %ebx
  d6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  e0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  e4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  e7:	83 c0 01             	add    $0x1,%eax
  ea:	84 d2                	test   %dl,%dl
  ec:	75 f2                	jne    e0 <strcpy+0x10>
    ;
  return os;
}
  ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  f1:	89 c8                	mov    %ecx,%eax
  f3:	c9                   	leave  
  f4:	c3                   	ret    
  f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	53                   	push   %ebx
 104:	8b 55 08             	mov    0x8(%ebp),%edx
 107:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 10a:	0f b6 02             	movzbl (%edx),%eax
 10d:	84 c0                	test   %al,%al
 10f:	75 17                	jne    128 <strcmp+0x28>
 111:	eb 3a                	jmp    14d <strcmp+0x4d>
 113:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 117:	90                   	nop
 118:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 11c:	83 c2 01             	add    $0x1,%edx
 11f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 122:	84 c0                	test   %al,%al
 124:	74 1a                	je     140 <strcmp+0x40>
    p++, q++;
 126:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 128:	0f b6 19             	movzbl (%ecx),%ebx
 12b:	38 c3                	cmp    %al,%bl
 12d:	74 e9                	je     118 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 12f:	29 d8                	sub    %ebx,%eax
}
 131:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 134:	c9                   	leave  
 135:	c3                   	ret    
 136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 140:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 144:	31 c0                	xor    %eax,%eax
 146:	29 d8                	sub    %ebx,%eax
}
 148:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 14b:	c9                   	leave  
 14c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 14d:	0f b6 19             	movzbl (%ecx),%ebx
 150:	31 c0                	xor    %eax,%eax
 152:	eb db                	jmp    12f <strcmp+0x2f>
 154:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 15f:	90                   	nop

00000160 <strlen>:

uint
strlen(const char *s)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 166:	80 3a 00             	cmpb   $0x0,(%edx)
 169:	74 15                	je     180 <strlen+0x20>
 16b:	31 c0                	xor    %eax,%eax
 16d:	8d 76 00             	lea    0x0(%esi),%esi
 170:	83 c0 01             	add    $0x1,%eax
 173:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 177:	89 c1                	mov    %eax,%ecx
 179:	75 f5                	jne    170 <strlen+0x10>
    ;
  return n;
}
 17b:	89 c8                	mov    %ecx,%eax
 17d:	5d                   	pop    %ebp
 17e:	c3                   	ret    
 17f:	90                   	nop
  for(n = 0; s[n]; n++)
 180:	31 c9                	xor    %ecx,%ecx
}
 182:	5d                   	pop    %ebp
 183:	89 c8                	mov    %ecx,%eax
 185:	c3                   	ret    
 186:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18d:	8d 76 00             	lea    0x0(%esi),%esi

00000190 <memset>:

void*
memset(void *dst, int c, uint n)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 197:	8b 4d 10             	mov    0x10(%ebp),%ecx
 19a:	8b 45 0c             	mov    0xc(%ebp),%eax
 19d:	89 d7                	mov    %edx,%edi
 19f:	fc                   	cld    
 1a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1a2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1a5:	89 d0                	mov    %edx,%eax
 1a7:	c9                   	leave  
 1a8:	c3                   	ret    
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001b0 <strchr>:

char*
strchr(const char *s, char c)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ba:	0f b6 10             	movzbl (%eax),%edx
 1bd:	84 d2                	test   %dl,%dl
 1bf:	75 12                	jne    1d3 <strchr+0x23>
 1c1:	eb 1d                	jmp    1e0 <strchr+0x30>
 1c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c7:	90                   	nop
 1c8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1cc:	83 c0 01             	add    $0x1,%eax
 1cf:	84 d2                	test   %dl,%dl
 1d1:	74 0d                	je     1e0 <strchr+0x30>
    if(*s == c)
 1d3:	38 d1                	cmp    %dl,%cl
 1d5:	75 f1                	jne    1c8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1d7:	5d                   	pop    %ebp
 1d8:	c3                   	ret    
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1e0:	31 c0                	xor    %eax,%eax
}
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    
 1e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <gets>:

char*
gets(char *buf, int max)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1f5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 1f8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1f9:	31 db                	xor    %ebx,%ebx
{
 1fb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1fe:	eb 27                	jmp    227 <gets+0x37>
    cc = read(0, &c, 1);
 200:	83 ec 04             	sub    $0x4,%esp
 203:	6a 01                	push   $0x1
 205:	57                   	push   %edi
 206:	6a 00                	push   $0x0
 208:	e8 2e 01 00 00       	call   33b <read>
    if(cc < 1)
 20d:	83 c4 10             	add    $0x10,%esp
 210:	85 c0                	test   %eax,%eax
 212:	7e 1d                	jle    231 <gets+0x41>
      break;
    buf[i++] = c;
 214:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 218:	8b 55 08             	mov    0x8(%ebp),%edx
 21b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 21f:	3c 0a                	cmp    $0xa,%al
 221:	74 1d                	je     240 <gets+0x50>
 223:	3c 0d                	cmp    $0xd,%al
 225:	74 19                	je     240 <gets+0x50>
  for(i=0; i+1 < max; ){
 227:	89 de                	mov    %ebx,%esi
 229:	83 c3 01             	add    $0x1,%ebx
 22c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 22f:	7c cf                	jl     200 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 231:	8b 45 08             	mov    0x8(%ebp),%eax
 234:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 238:	8d 65 f4             	lea    -0xc(%ebp),%esp
 23b:	5b                   	pop    %ebx
 23c:	5e                   	pop    %esi
 23d:	5f                   	pop    %edi
 23e:	5d                   	pop    %ebp
 23f:	c3                   	ret    
  buf[i] = '\0';
 240:	8b 45 08             	mov    0x8(%ebp),%eax
 243:	89 de                	mov    %ebx,%esi
 245:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 249:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24c:	5b                   	pop    %ebx
 24d:	5e                   	pop    %esi
 24e:	5f                   	pop    %edi
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 258:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop

00000260 <stat>:

int
stat(const char *n, struct stat *st)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	56                   	push   %esi
 264:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 265:	83 ec 08             	sub    $0x8,%esp
 268:	6a 00                	push   $0x0
 26a:	ff 75 08             	push   0x8(%ebp)
 26d:	e8 f1 00 00 00       	call   363 <open>
  if(fd < 0)
 272:	83 c4 10             	add    $0x10,%esp
 275:	85 c0                	test   %eax,%eax
 277:	78 27                	js     2a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 279:	83 ec 08             	sub    $0x8,%esp
 27c:	ff 75 0c             	push   0xc(%ebp)
 27f:	89 c3                	mov    %eax,%ebx
 281:	50                   	push   %eax
 282:	e8 f4 00 00 00       	call   37b <fstat>
  close(fd);
 287:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 28a:	89 c6                	mov    %eax,%esi
  close(fd);
 28c:	e8 ba 00 00 00       	call   34b <close>
  return r;
 291:	83 c4 10             	add    $0x10,%esp
}
 294:	8d 65 f8             	lea    -0x8(%ebp),%esp
 297:	89 f0                	mov    %esi,%eax
 299:	5b                   	pop    %ebx
 29a:	5e                   	pop    %esi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret    
 29d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2a5:	eb ed                	jmp    294 <stat+0x34>
 2a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ae:	66 90                	xchg   %ax,%ax

000002b0 <atoi>:

int
atoi(const char *s)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2b7:	0f be 02             	movsbl (%edx),%eax
 2ba:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2bd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2c0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2c5:	77 1e                	ja     2e5 <atoi+0x35>
 2c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ce:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2d0:	83 c2 01             	add    $0x1,%edx
 2d3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2d6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2da:	0f be 02             	movsbl (%edx),%eax
 2dd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2e0:	80 fb 09             	cmp    $0x9,%bl
 2e3:	76 eb                	jbe    2d0 <atoi+0x20>
  return n;
}
 2e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e8:	89 c8                	mov    %ecx,%eax
 2ea:	c9                   	leave  
 2eb:	c3                   	ret    
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	8b 45 10             	mov    0x10(%ebp),%eax
 2f7:	8b 55 08             	mov    0x8(%ebp),%edx
 2fa:	56                   	push   %esi
 2fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2fe:	85 c0                	test   %eax,%eax
 300:	7e 13                	jle    315 <memmove+0x25>
 302:	01 d0                	add    %edx,%eax
  dst = vdst;
 304:	89 d7                	mov    %edx,%edi
 306:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 310:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 311:	39 f8                	cmp    %edi,%eax
 313:	75 fb                	jne    310 <memmove+0x20>
  return vdst;
}
 315:	5e                   	pop    %esi
 316:	89 d0                	mov    %edx,%eax
 318:	5f                   	pop    %edi
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret    

0000031b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 31b:	b8 01 00 00 00       	mov    $0x1,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <exit>:
SYSCALL(exit)
 323:	b8 02 00 00 00       	mov    $0x2,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <wait>:
SYSCALL(wait)
 32b:	b8 03 00 00 00       	mov    $0x3,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <pipe>:
SYSCALL(pipe)
 333:	b8 04 00 00 00       	mov    $0x4,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <read>:
SYSCALL(read)
 33b:	b8 05 00 00 00       	mov    $0x5,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <write>:
SYSCALL(write)
 343:	b8 10 00 00 00       	mov    $0x10,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <close>:
SYSCALL(close)
 34b:	b8 15 00 00 00       	mov    $0x15,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <kill>:
SYSCALL(kill)
 353:	b8 06 00 00 00       	mov    $0x6,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <exec>:
SYSCALL(exec)
 35b:	b8 07 00 00 00       	mov    $0x7,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <open>:
SYSCALL(open)
 363:	b8 0f 00 00 00       	mov    $0xf,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <mknod>:
SYSCALL(mknod)
 36b:	b8 11 00 00 00       	mov    $0x11,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <unlink>:
SYSCALL(unlink)
 373:	b8 12 00 00 00       	mov    $0x12,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <fstat>:
SYSCALL(fstat)
 37b:	b8 08 00 00 00       	mov    $0x8,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <link>:
SYSCALL(link)
 383:	b8 13 00 00 00       	mov    $0x13,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <mkdir>:
SYSCALL(mkdir)
 38b:	b8 14 00 00 00       	mov    $0x14,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <chdir>:
SYSCALL(chdir)
 393:	b8 09 00 00 00       	mov    $0x9,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <dup>:
SYSCALL(dup)
 39b:	b8 0a 00 00 00       	mov    $0xa,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <getpid>:
SYSCALL(getpid)
 3a3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <sbrk>:
SYSCALL(sbrk)
 3ab:	b8 0c 00 00 00       	mov    $0xc,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <sleep>:
SYSCALL(sleep)
 3b3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <uptime>:
SYSCALL(uptime)
 3bb:	b8 0e 00 00 00       	mov    $0xe,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <printhugepde>:
SYSCALL(printhugepde)
 3c3:	b8 16 00 00 00       	mov    $0x16,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 3cb:	b8 17 00 00 00       	mov    $0x17,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <setthp>:
SYSCALL(setthp)
 3d3:	b8 18 00 00 00       	mov    $0x18,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <getthp>:
 3db:	b8 19 00 00 00       	mov    $0x19,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    
 3e3:	66 90                	xchg   %ax,%ax
 3e5:	66 90                	xchg   %ax,%ax
 3e7:	66 90                	xchg   %ax,%ax
 3e9:	66 90                	xchg   %ax,%ax
 3eb:	66 90                	xchg   %ax,%ax
 3ed:	66 90                	xchg   %ax,%ax
 3ef:	90                   	nop

000003f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 3c             	sub    $0x3c,%esp
 3f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3fc:	89 d1                	mov    %edx,%ecx
{
 3fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 401:	85 d2                	test   %edx,%edx
 403:	0f 89 7f 00 00 00    	jns    488 <printint+0x98>
 409:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 40d:	74 79                	je     488 <printint+0x98>
    neg = 1;
 40f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 416:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 418:	31 db                	xor    %ebx,%ebx
 41a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 41d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 420:	89 c8                	mov    %ecx,%eax
 422:	31 d2                	xor    %edx,%edx
 424:	89 cf                	mov    %ecx,%edi
 426:	f7 75 c4             	divl   -0x3c(%ebp)
 429:	0f b6 92 30 09 00 00 	movzbl 0x930(%edx),%edx
 430:	89 45 c0             	mov    %eax,-0x40(%ebp)
 433:	89 d8                	mov    %ebx,%eax
 435:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 438:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 43b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 43e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 441:	76 dd                	jbe    420 <printint+0x30>
  if(neg)
 443:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 446:	85 c9                	test   %ecx,%ecx
 448:	74 0c                	je     456 <printint+0x66>
    buf[i++] = '-';
 44a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 44f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 451:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 456:	8b 7d b8             	mov    -0x48(%ebp),%edi
 459:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 45d:	eb 07                	jmp    466 <printint+0x76>
 45f:	90                   	nop
    putc(fd, buf[i]);
 460:	0f b6 13             	movzbl (%ebx),%edx
 463:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 466:	83 ec 04             	sub    $0x4,%esp
 469:	88 55 d7             	mov    %dl,-0x29(%ebp)
 46c:	6a 01                	push   $0x1
 46e:	56                   	push   %esi
 46f:	57                   	push   %edi
 470:	e8 ce fe ff ff       	call   343 <write>
  while(--i >= 0)
 475:	83 c4 10             	add    $0x10,%esp
 478:	39 de                	cmp    %ebx,%esi
 47a:	75 e4                	jne    460 <printint+0x70>
}
 47c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47f:	5b                   	pop    %ebx
 480:	5e                   	pop    %esi
 481:	5f                   	pop    %edi
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 488:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 48f:	eb 87                	jmp    418 <printint+0x28>
 491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 4ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 4af:	0f b6 13             	movzbl (%ebx),%edx
 4b2:	84 d2                	test   %dl,%dl
 4b4:	74 6a                	je     520 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 4b6:	8d 45 10             	lea    0x10(%ebp),%eax
 4b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4bf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 4c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c4:	eb 36                	jmp    4fc <printf+0x5c>
 4c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
 4d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4d3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 4d8:	83 f8 25             	cmp    $0x25,%eax
 4db:	74 15                	je     4f2 <printf+0x52>
  write(fd, &c, 1);
 4dd:	83 ec 04             	sub    $0x4,%esp
 4e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4e3:	6a 01                	push   $0x1
 4e5:	57                   	push   %edi
 4e6:	56                   	push   %esi
 4e7:	e8 57 fe ff ff       	call   343 <write>
 4ec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 4ef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4f2:	0f b6 13             	movzbl (%ebx),%edx
 4f5:	83 c3 01             	add    $0x1,%ebx
 4f8:	84 d2                	test   %dl,%dl
 4fa:	74 24                	je     520 <printf+0x80>
    c = fmt[i] & 0xff;
 4fc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4ff:	85 c9                	test   %ecx,%ecx
 501:	74 cd                	je     4d0 <printf+0x30>
      }
    } else if(state == '%'){
 503:	83 f9 25             	cmp    $0x25,%ecx
 506:	75 ea                	jne    4f2 <printf+0x52>
      if(c == 'd'){
 508:	83 f8 25             	cmp    $0x25,%eax
 50b:	0f 84 07 01 00 00    	je     618 <printf+0x178>
 511:	83 e8 63             	sub    $0x63,%eax
 514:	83 f8 15             	cmp    $0x15,%eax
 517:	77 17                	ja     530 <printf+0x90>
 519:	ff 24 85 d8 08 00 00 	jmp    *0x8d8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 520:	8d 65 f4             	lea    -0xc(%ebp),%esp
 523:	5b                   	pop    %ebx
 524:	5e                   	pop    %esi
 525:	5f                   	pop    %edi
 526:	5d                   	pop    %ebp
 527:	c3                   	ret    
 528:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 536:	6a 01                	push   $0x1
 538:	57                   	push   %edi
 539:	56                   	push   %esi
 53a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 53e:	e8 00 fe ff ff       	call   343 <write>
        putc(fd, c);
 543:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 547:	83 c4 0c             	add    $0xc,%esp
 54a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 54d:	6a 01                	push   $0x1
 54f:	57                   	push   %edi
 550:	56                   	push   %esi
 551:	e8 ed fd ff ff       	call   343 <write>
        putc(fd, c);
 556:	83 c4 10             	add    $0x10,%esp
      state = 0;
 559:	31 c9                	xor    %ecx,%ecx
 55b:	eb 95                	jmp    4f2 <printf+0x52>
 55d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 560:	83 ec 0c             	sub    $0xc,%esp
 563:	b9 10 00 00 00       	mov    $0x10,%ecx
 568:	6a 00                	push   $0x0
 56a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 56d:	8b 10                	mov    (%eax),%edx
 56f:	89 f0                	mov    %esi,%eax
 571:	e8 7a fe ff ff       	call   3f0 <printint>
        ap++;
 576:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 57a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 57d:	31 c9                	xor    %ecx,%ecx
 57f:	e9 6e ff ff ff       	jmp    4f2 <printf+0x52>
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 588:	8b 45 d0             	mov    -0x30(%ebp),%eax
 58b:	8b 10                	mov    (%eax),%edx
        ap++;
 58d:	83 c0 04             	add    $0x4,%eax
 590:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 593:	85 d2                	test   %edx,%edx
 595:	0f 84 8d 00 00 00    	je     628 <printf+0x188>
        while(*s != 0){
 59b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 59e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 5a0:	84 c0                	test   %al,%al
 5a2:	0f 84 4a ff ff ff    	je     4f2 <printf+0x52>
 5a8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5ab:	89 d3                	mov    %edx,%ebx
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5b3:	83 c3 01             	add    $0x1,%ebx
 5b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5b9:	6a 01                	push   $0x1
 5bb:	57                   	push   %edi
 5bc:	56                   	push   %esi
 5bd:	e8 81 fd ff ff       	call   343 <write>
        while(*s != 0){
 5c2:	0f b6 03             	movzbl (%ebx),%eax
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	84 c0                	test   %al,%al
 5ca:	75 e4                	jne    5b0 <printf+0x110>
      state = 0;
 5cc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 5cf:	31 c9                	xor    %ecx,%ecx
 5d1:	e9 1c ff ff ff       	jmp    4f2 <printf+0x52>
 5d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5e8:	6a 01                	push   $0x1
 5ea:	e9 7b ff ff ff       	jmp    56a <printf+0xca>
 5ef:	90                   	nop
        putc(fd, *ap);
 5f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 5f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5f6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5f8:	6a 01                	push   $0x1
 5fa:	57                   	push   %edi
 5fb:	56                   	push   %esi
        putc(fd, *ap);
 5fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5ff:	e8 3f fd ff ff       	call   343 <write>
        ap++;
 604:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 608:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60b:	31 c9                	xor    %ecx,%ecx
 60d:	e9 e0 fe ff ff       	jmp    4f2 <printf+0x52>
 612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 618:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 61b:	83 ec 04             	sub    $0x4,%esp
 61e:	e9 2a ff ff ff       	jmp    54d <printf+0xad>
 623:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 627:	90                   	nop
          s = "(null)";
 628:	ba d1 08 00 00       	mov    $0x8d1,%edx
        while(*s != 0){
 62d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 630:	b8 28 00 00 00       	mov    $0x28,%eax
 635:	89 d3                	mov    %edx,%ebx
 637:	e9 74 ff ff ff       	jmp    5b0 <printf+0x110>
 63c:	66 90                	xchg   %ax,%ax
 63e:	66 90                	xchg   %ax,%ax

00000640 <vfree>:
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	83 ec 04             	sub    $0x4,%esp
 649:	8b 5d 08             	mov    0x8(%ebp),%ebx
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
 64c:	8b 45 0c             	mov    0xc(%ebp),%eax
    bp = ((Header*)ap) - 1;
 64f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    if (use_huge_pages) {
 652:	85 c0                	test   %eax,%eax
 654:	0f 84 96 00 00 00    	je     6f0 <vfree+0xb0>
        freepptr = &huge_freep;
 65a:	a1 58 0c 00 00       	mov    0xc58,%eax
 65f:	bf 58 0c 00 00       	mov    $0xc58,%edi
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 668:	89 c2                	mov    %eax,%edx
 66a:	8b 00                	mov    (%eax),%eax
 66c:	39 ca                	cmp    %ecx,%edx
 66e:	73 38                	jae    6a8 <vfree+0x68>
 670:	39 c1                	cmp    %eax,%ecx
 672:	72 04                	jb     678 <vfree+0x38>
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 674:	39 c2                	cmp    %eax,%edx
 676:	72 f0                	jb     668 <vfree+0x28>
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
 678:	8b 73 fc             	mov    -0x4(%ebx),%esi
 67b:	89 7d f0             	mov    %edi,-0x10(%ebp)
 67e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 681:	39 f8                	cmp    %edi,%eax
 683:	74 38                	je     6bd <vfree+0x7d>
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
 685:	89 43 f8             	mov    %eax,-0x8(%ebx)
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
 688:	8b 42 04             	mov    0x4(%edx),%eax
 68b:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 68e:	39 f1                	cmp    %esi,%ecx
 690:	74 42                	je     6d4 <vfree+0x94>
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
 692:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 695:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 697:	89 10                	mov    %edx,(%eax)
}
 699:	83 c4 04             	add    $0x4,%esp
 69c:	5b                   	pop    %ebx
 69d:	5e                   	pop    %esi
 69e:	5f                   	pop    %edi
 69f:	5d                   	pop    %ebp
 6a0:	c3                   	ret    
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 6a8:	39 c2                	cmp    %eax,%edx
 6aa:	72 bc                	jb     668 <vfree+0x28>
 6ac:	39 c1                	cmp    %eax,%ecx
 6ae:	73 b8                	jae    668 <vfree+0x28>
    if (bp + bp->s.size == p->s.ptr) {
 6b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6b3:	89 7d f0             	mov    %edi,-0x10(%ebp)
 6b6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6b9:	39 f8                	cmp    %edi,%eax
 6bb:	75 c8                	jne    685 <vfree+0x45>
        bp->s.size += p->s.ptr->s.size;
 6bd:	03 70 04             	add    0x4(%eax),%esi
 6c0:	89 73 fc             	mov    %esi,-0x4(%ebx)
        bp->s.ptr = p->s.ptr->s.ptr;
 6c3:	8b 02                	mov    (%edx),%eax
 6c5:	8b 00                	mov    (%eax),%eax
 6c7:	89 43 f8             	mov    %eax,-0x8(%ebx)
    if (p + p->s.size == bp) {
 6ca:	8b 42 04             	mov    0x4(%edx),%eax
 6cd:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6d0:	39 f1                	cmp    %esi,%ecx
 6d2:	75 be                	jne    692 <vfree+0x52>
        p->s.size += bp->s.size;
 6d4:	03 43 fc             	add    -0x4(%ebx),%eax
 6d7:	89 42 04             	mov    %eax,0x4(%edx)
    *freepptr = p;
 6da:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 6dd:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6e0:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 6e2:	89 10                	mov    %edx,(%eax)
}
 6e4:	83 c4 04             	add    $0x4,%esp
 6e7:	5b                   	pop    %ebx
 6e8:	5e                   	pop    %esi
 6e9:	5f                   	pop    %edi
 6ea:	5d                   	pop    %ebp
 6eb:	c3                   	ret    
 6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        freepptr = &freep;
 6f0:	a1 64 0c 00 00       	mov    0xc64,%eax
 6f5:	bf 64 0c 00 00       	mov    $0xc64,%edi
    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 6fa:	e9 69 ff ff ff       	jmp    668 <vfree+0x28>
 6ff:	90                   	nop

00000700 <vmalloc>:
void* vmalloc(uint nbytes, int use_huge_pages) {
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 1c             	sub    $0x1c,%esp
 709:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (use_huge_pages) {
 70c:	85 db                	test   %ebx,%ebx
 70e:	0f 84 0c 01 00 00    	je     820 <vmalloc+0x120>
        if ((prevp = huge_freep) == 0) {
 714:	8b 15 58 0c 00 00    	mov    0xc58,%edx
 71a:	85 d2                	test   %edx,%edx
 71c:	0f 84 de f8 ff ff    	je     0 <vmalloc.cold>
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 722:	8b 45 08             	mov    0x8(%ebp),%eax
 725:	8d 78 07             	lea    0x7(%eax),%edi
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 728:	8b 02                	mov    (%edx),%eax
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 72a:	c1 ef 03             	shr    $0x3,%edi
        if (p->s.size >= nunits) {
 72d:	8b 48 04             	mov    0x4(%eax),%ecx
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 730:	83 c7 01             	add    $0x1,%edi
        if (p->s.size >= nunits) {
 733:	39 f9                	cmp    %edi,%ecx
 735:	0f 83 c5 00 00 00    	jae    800 <vmalloc+0x100>
 73b:	be 00 10 00 00       	mov    $0x1000,%esi
 740:	ba 00 00 40 00       	mov    $0x400000,%edx
 745:	39 f7                	cmp    %esi,%edi
 747:	0f 43 f7             	cmovae %edi,%esi
 74a:	39 d7                	cmp    %edx,%edi
 74c:	0f 43 d7             	cmovae %edi,%edx
  p = sbrk(nu * sizeof(Header));
 74f:	8d 0c f5 00 00 00 00 	lea    0x0(,%esi,8),%ecx
 756:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 759:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
 760:	89 55 dc             	mov    %edx,-0x24(%ebp)
 763:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 766:	eb 15                	jmp    77d <vmalloc+0x7d>
 768:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76f:	90                   	nop
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 770:	8b 02                	mov    (%edx),%eax
        if (p->s.size >= nunits) {
 772:	8b 48 04             	mov    0x4(%eax),%ecx
 775:	39 f9                	cmp    %edi,%ecx
 777:	0f 83 83 00 00 00    	jae    800 <vmalloc+0x100>
        if (p == freep) {
 77d:	89 c2                	mov    %eax,%edx
 77f:	39 05 64 0c 00 00    	cmp    %eax,0xc64
 785:	75 e9                	jne    770 <vmalloc+0x70>
  if(use_huge_pages){
 787:	85 db                	test   %ebx,%ebx
 789:	74 45                	je     7d0 <vmalloc+0xd0>
  p = sbrk(nu * sizeof(Header));
 78b:	83 ec 0c             	sub    $0xc,%esp
 78e:	ff 75 e0             	push   -0x20(%ebp)
 791:	e8 15 fc ff ff       	call   3ab <sbrk>
  if(p == (char*)-1)
 796:	83 c4 10             	add    $0x10,%esp
 799:	83 f8 ff             	cmp    $0xffffffff,%eax
 79c:	74 20                	je     7be <vmalloc+0xbe>
  hp->s.size = nu;
 79e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  vfree((void*)(hp + 1), use_huge_pages);
 7a1:	83 ec 08             	sub    $0x8,%esp
 7a4:	83 c0 08             	add    $0x8,%eax
  hp->s.size = nu;
 7a7:	89 48 fc             	mov    %ecx,-0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 7aa:	53                   	push   %ebx
 7ab:	50                   	push   %eax
 7ac:	e8 8f fe ff ff       	call   640 <vfree>
  return use_huge_pages ? huge_freep : freep;
 7b1:	8b 15 58 0c 00 00    	mov    0xc58,%edx
 7b7:	83 c4 10             	add    $0x10,%esp
            if (p == 0) {
 7ba:	85 d2                	test   %edx,%edx
 7bc:	75 b2                	jne    770 <vmalloc+0x70>
}
 7be:	8d 65 f4             	lea    -0xc(%ebp),%esp
                return 0;
 7c1:	31 c0                	xor    %eax,%eax
}
 7c3:	5b                   	pop    %ebx
 7c4:	5e                   	pop    %esi
 7c5:	5f                   	pop    %edi
 7c6:	5d                   	pop    %ebp
 7c7:	c3                   	ret    
 7c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7cf:	90                   	nop
  p = sbrk(nu * sizeof(Header));
 7d0:	83 ec 0c             	sub    $0xc,%esp
 7d3:	ff 75 e4             	push   -0x1c(%ebp)
 7d6:	e8 d0 fb ff ff       	call   3ab <sbrk>
  if(p == (char*)-1)
 7db:	83 c4 10             	add    $0x10,%esp
 7de:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e1:	74 db                	je     7be <vmalloc+0xbe>
  hp->s.size = nu;
 7e3:	89 70 04             	mov    %esi,0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 7e6:	83 ec 08             	sub    $0x8,%esp
 7e9:	83 c0 08             	add    $0x8,%eax
 7ec:	6a 00                	push   $0x0
 7ee:	50                   	push   %eax
 7ef:	e8 4c fe ff ff       	call   640 <vfree>
  return use_huge_pages ? huge_freep : freep;
 7f4:	8b 15 64 0c 00 00    	mov    0xc64,%edx
 7fa:	83 c4 10             	add    $0x10,%esp
 7fd:	eb bb                	jmp    7ba <vmalloc+0xba>
 7ff:	90                   	nop
            if (p->s.size == nunits) {
 800:	39 cf                	cmp    %ecx,%edi
 802:	74 34                	je     838 <vmalloc+0x138>
                p->s.size -= nunits;
 804:	29 f9                	sub    %edi,%ecx
 806:	89 48 04             	mov    %ecx,0x4(%eax)
                p += p->s.size;
 809:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
                p->s.size = nunits;
 80c:	89 78 04             	mov    %edi,0x4(%eax)
            freep = prevp;
 80f:	89 15 64 0c 00 00    	mov    %edx,0xc64
}
 815:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return (void*)(p + 1);
 818:	83 c0 08             	add    $0x8,%eax
}
 81b:	5b                   	pop    %ebx
 81c:	5e                   	pop    %esi
 81d:	5f                   	pop    %edi
 81e:	5d                   	pop    %ebp
 81f:	c3                   	ret    
        if ((prevp = freep) == 0) {
 820:	8b 15 64 0c 00 00    	mov    0xc64,%edx
 826:	85 d2                	test   %edx,%edx
 828:	0f 85 f4 fe ff ff    	jne    722 <vmalloc+0x22>
 82e:	e9 f2 f7 ff ff       	jmp    25 <vmalloc.cold+0x25>
 833:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 837:	90                   	nop
                prevp->s.ptr = p->s.ptr;
 838:	8b 08                	mov    (%eax),%ecx
 83a:	89 0a                	mov    %ecx,(%edx)
 83c:	eb d1                	jmp    80f <vmalloc+0x10f>
 83e:	66 90                	xchg   %ax,%ax

00000840 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	53                   	push   %ebx
 844:	83 ec 04             	sub    $0x4,%esp
 847:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 84a:	e8 8c fb ff ff       	call   3db <getthp>


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
 84f:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 855:	76 19                	jbe    870 <malloc+0x30>
 857:	85 c0                	test   %eax,%eax
 859:	74 15                	je     870 <malloc+0x30>
    return vmalloc(nbytes, 1); // use the huge pages
 85b:	83 ec 08             	sub    $0x8,%esp
 85e:	6a 01                	push   $0x1
 860:	53                   	push   %ebx
 861:	e8 9a fe ff ff       	call   700 <vmalloc>
  }
  else{
    return vmalloc(nbytes, 0);
  }
}
 866:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 1); // use the huge pages
 869:	83 c4 10             	add    $0x10,%esp
}
 86c:	c9                   	leave  
 86d:	c3                   	ret    
 86e:	66 90                	xchg   %ax,%ax
    return vmalloc(nbytes, 0);
 870:	83 ec 08             	sub    $0x8,%esp
 873:	6a 00                	push   $0x0
 875:	53                   	push   %ebx
 876:	e8 85 fe ff ff       	call   700 <vmalloc>
}
 87b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 0);
 87e:	83 c4 10             	add    $0x10,%esp
}
 881:	c9                   	leave  
 882:	c3                   	ret    
 883:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000890 <free>:

void free(void * ap){
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
  vfree(ap, 0);
 893:	6a 00                	push   $0x0
 895:	ff 75 08             	push   0x8(%ebp)
 898:	e8 a3 fd ff ff       	call   640 <vfree>
}
 89d:	58                   	pop    %eax
 89e:	5a                   	pop    %edx
 89f:	c9                   	leave  
 8a0:	c3                   	ret    
