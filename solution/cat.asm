
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7e 54                	jle    7d <main+0x7d>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	push   (%ebx)
  37:	e8 67 03 00 00       	call   3a3 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 2f 03 00 00       	call   38b <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 fa 02 00 00       	call   363 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	push   (%ebx)
  6c:	68 bb 0a 00 00       	push   $0xabb
  71:	6a 01                	push   $0x1
  73:	e8 68 04 00 00       	call   4e0 <printf>
      exit();
  78:	e8 e6 02 00 00       	call   363 <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 d7 02 00 00       	call   363 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	8b 75 08             	mov    0x8(%ebp),%esi
  97:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  98:	eb 1d                	jmp    b7 <cat+0x27>
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 a0 0f 00 00       	push   $0xfa0
  a9:	6a 01                	push   $0x1
  ab:	e8 d3 02 00 00       	call   383 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 a0 0f 00 00       	push   $0xfa0
  c4:	56                   	push   %esi
  c5:	e8 b1 02 00 00       	call   37b <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
  if(n < 0){
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret    
      printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 98 0a 00 00       	push   $0xa98
  e4:	6a 01                	push   $0x1
  e6:	e8 f5 03 00 00       	call   4e0 <printf>
      exit();
  eb:	e8 73 02 00 00       	call   363 <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 aa 0a 00 00       	push   $0xaaa
  f7:	6a 01                	push   $0x1
  f9:	e8 e2 03 00 00       	call   4e0 <printf>
    exit();
  fe:	e8 60 02 00 00       	call   363 <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 110:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 111:	31 c0                	xor    %eax,%eax
{
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	8b 4d 08             	mov    0x8(%ebp),%ecx
 119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 127:	83 c0 01             	add    $0x1,%eax
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 131:	89 c8                	mov    %ecx,%eax
 133:	c9                   	leave  
 134:	c3                   	ret    
 135:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 55 08             	mov    0x8(%ebp),%edx
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 14a:	0f b6 02             	movzbl (%edx),%eax
 14d:	84 c0                	test   %al,%al
 14f:	75 17                	jne    168 <strcmp+0x28>
 151:	eb 3a                	jmp    18d <strcmp+0x4d>
 153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 157:	90                   	nop
 158:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 15c:	83 c2 01             	add    $0x1,%edx
 15f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 162:	84 c0                	test   %al,%al
 164:	74 1a                	je     180 <strcmp+0x40>
    p++, q++;
 166:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 168:	0f b6 19             	movzbl (%ecx),%ebx
 16b:	38 c3                	cmp    %al,%bl
 16d:	74 e9                	je     158 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 16f:	29 d8                	sub    %ebx,%eax
}
 171:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 174:	c9                   	leave  
 175:	c3                   	ret    
 176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 180:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 184:	31 c0                	xor    %eax,%eax
 186:	29 d8                	sub    %ebx,%eax
}
 188:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 18b:	c9                   	leave  
 18c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 18d:	0f b6 19             	movzbl (%ecx),%ebx
 190:	31 c0                	xor    %eax,%eax
 192:	eb db                	jmp    16f <strcmp+0x2f>
 194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop

000001a0 <strlen>:

uint
strlen(const char *s)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1a6:	80 3a 00             	cmpb   $0x0,(%edx)
 1a9:	74 15                	je     1c0 <strlen+0x20>
 1ab:	31 c0                	xor    %eax,%eax
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	83 c0 01             	add    $0x1,%eax
 1b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1b7:	89 c1                	mov    %eax,%ecx
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	89 c8                	mov    %ecx,%eax
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret    
 1bf:	90                   	nop
  for(n = 0; s[n]; n++)
 1c0:	31 c9                	xor    %ecx,%ecx
}
 1c2:	5d                   	pop    %ebp
 1c3:	89 c8                	mov    %ecx,%eax
 1c5:	c3                   	ret    
 1c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld    
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1e5:	89 d0                	mov    %edx,%eax
 1e7:	c9                   	leave  
 1e8:	c3                   	ret    
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	75 12                	jne    213 <strchr+0x23>
 201:	eb 1d                	jmp    220 <strchr+0x30>
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
 208:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 20c:	83 c0 01             	add    $0x1,%eax
 20f:	84 d2                	test   %dl,%dl
 211:	74 0d                	je     220 <strchr+0x30>
    if(*s == c)
 213:	38 d1                	cmp    %dl,%cl
 215:	75 f1                	jne    208 <strchr+0x18>
      return (char*)s;
  return 0;
}
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 220:	31 c0                	xor    %eax,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    
 224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 235:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 238:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 239:	31 db                	xor    %ebx,%ebx
{
 23b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 23e:	eb 27                	jmp    267 <gets+0x37>
    cc = read(0, &c, 1);
 240:	83 ec 04             	sub    $0x4,%esp
 243:	6a 01                	push   $0x1
 245:	57                   	push   %edi
 246:	6a 00                	push   $0x0
 248:	e8 2e 01 00 00       	call   37b <read>
    if(cc < 1)
 24d:	83 c4 10             	add    $0x10,%esp
 250:	85 c0                	test   %eax,%eax
 252:	7e 1d                	jle    271 <gets+0x41>
      break;
    buf[i++] = c;
 254:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 258:	8b 55 08             	mov    0x8(%ebp),%edx
 25b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 25f:	3c 0a                	cmp    $0xa,%al
 261:	74 1d                	je     280 <gets+0x50>
 263:	3c 0d                	cmp    $0xd,%al
 265:	74 19                	je     280 <gets+0x50>
  for(i=0; i+1 < max; ){
 267:	89 de                	mov    %ebx,%esi
 269:	83 c3 01             	add    $0x1,%ebx
 26c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 26f:	7c cf                	jl     240 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 278:	8d 65 f4             	lea    -0xc(%ebp),%esp
 27b:	5b                   	pop    %ebx
 27c:	5e                   	pop    %esi
 27d:	5f                   	pop    %edi
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    
  buf[i] = '\0';
 280:	8b 45 08             	mov    0x8(%ebp),%eax
 283:	89 de                	mov    %ebx,%esi
 285:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 289:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28c:	5b                   	pop    %ebx
 28d:	5e                   	pop    %esi
 28e:	5f                   	pop    %edi
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret    
 291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 298:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop

000002a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a5:	83 ec 08             	sub    $0x8,%esp
 2a8:	6a 00                	push   $0x0
 2aa:	ff 75 08             	push   0x8(%ebp)
 2ad:	e8 f1 00 00 00       	call   3a3 <open>
  if(fd < 0)
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	85 c0                	test   %eax,%eax
 2b7:	78 27                	js     2e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	ff 75 0c             	push   0xc(%ebp)
 2bf:	89 c3                	mov    %eax,%ebx
 2c1:	50                   	push   %eax
 2c2:	e8 f4 00 00 00       	call   3bb <fstat>
  close(fd);
 2c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ca:	89 c6                	mov    %eax,%esi
  close(fd);
 2cc:	e8 ba 00 00 00       	call   38b <close>
  return r;
 2d1:	83 c4 10             	add    $0x10,%esp
}
 2d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d7:	89 f0                	mov    %esi,%eax
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2e5:	eb ed                	jmp    2d4 <stat+0x34>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f7:	0f be 02             	movsbl (%edx),%eax
 2fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 300:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 305:	77 1e                	ja     325 <atoi+0x35>
 307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 310:	83 c2 01             	add    $0x1,%edx
 313:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 316:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 31a:	0f be 02             	movsbl (%edx),%eax
 31d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 320:	80 fb 09             	cmp    $0x9,%bl
 323:	76 eb                	jbe    310 <atoi+0x20>
  return n;
}
 325:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 328:	89 c8                	mov    %ecx,%eax
 32a:	c9                   	leave  
 32b:	c3                   	ret    
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	8b 45 10             	mov    0x10(%ebp),%eax
 337:	8b 55 08             	mov    0x8(%ebp),%edx
 33a:	56                   	push   %esi
 33b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 33e:	85 c0                	test   %eax,%eax
 340:	7e 13                	jle    355 <memmove+0x25>
 342:	01 d0                	add    %edx,%eax
  dst = vdst;
 344:	89 d7                	mov    %edx,%edi
 346:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 350:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 351:	39 f8                	cmp    %edi,%eax
 353:	75 fb                	jne    350 <memmove+0x20>
  return vdst;
}
 355:	5e                   	pop    %esi
 356:	89 d0                	mov    %edx,%eax
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    

0000035b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35b:	b8 01 00 00 00       	mov    $0x1,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <exit>:
SYSCALL(exit)
 363:	b8 02 00 00 00       	mov    $0x2,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <wait>:
SYSCALL(wait)
 36b:	b8 03 00 00 00       	mov    $0x3,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <pipe>:
SYSCALL(pipe)
 373:	b8 04 00 00 00       	mov    $0x4,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <read>:
SYSCALL(read)
 37b:	b8 05 00 00 00       	mov    $0x5,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <write>:
SYSCALL(write)
 383:	b8 10 00 00 00       	mov    $0x10,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <close>:
SYSCALL(close)
 38b:	b8 15 00 00 00       	mov    $0x15,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <kill>:
SYSCALL(kill)
 393:	b8 06 00 00 00       	mov    $0x6,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <exec>:
SYSCALL(exec)
 39b:	b8 07 00 00 00       	mov    $0x7,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <open>:
SYSCALL(open)
 3a3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <mknod>:
SYSCALL(mknod)
 3ab:	b8 11 00 00 00       	mov    $0x11,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <unlink>:
SYSCALL(unlink)
 3b3:	b8 12 00 00 00       	mov    $0x12,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <fstat>:
SYSCALL(fstat)
 3bb:	b8 08 00 00 00       	mov    $0x8,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <link>:
SYSCALL(link)
 3c3:	b8 13 00 00 00       	mov    $0x13,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <mkdir>:
SYSCALL(mkdir)
 3cb:	b8 14 00 00 00       	mov    $0x14,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <chdir>:
SYSCALL(chdir)
 3d3:	b8 09 00 00 00       	mov    $0x9,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <dup>:
SYSCALL(dup)
 3db:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <getpid>:
SYSCALL(getpid)
 3e3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <sbrk>:
SYSCALL(sbrk)
 3eb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <sleep>:
SYSCALL(sleep)
 3f3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <uptime>:
SYSCALL(uptime)
 3fb:	b8 0e 00 00 00       	mov    $0xe,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <printhugepde>:
SYSCALL(printhugepde)
 403:	b8 16 00 00 00       	mov    $0x16,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 40b:	b8 17 00 00 00       	mov    $0x17,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <setthp>:
SYSCALL(setthp)
 413:	b8 18 00 00 00       	mov    $0x18,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <getthp>:
SYSCALL(getthp)
 41b:	b8 19 00 00 00       	mov    $0x19,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <setusehugepages>:
 423:	b8 1a 00 00 00       	mov    $0x1a,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    
 42b:	66 90                	xchg   %ax,%ax
 42d:	66 90                	xchg   %ax,%ax
 42f:	90                   	nop

00000430 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 3c             	sub    $0x3c,%esp
 439:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 43c:	89 d1                	mov    %edx,%ecx
{
 43e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 441:	85 d2                	test   %edx,%edx
 443:	0f 89 7f 00 00 00    	jns    4c8 <printint+0x98>
 449:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 44d:	74 79                	je     4c8 <printint+0x98>
    neg = 1;
 44f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 456:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 458:	31 db                	xor    %ebx,%ebx
 45a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 45d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 460:	89 c8                	mov    %ecx,%eax
 462:	31 d2                	xor    %edx,%edx
 464:	89 cf                	mov    %ecx,%edi
 466:	f7 75 c4             	divl   -0x3c(%ebp)
 469:	0f b6 92 30 0b 00 00 	movzbl 0xb30(%edx),%edx
 470:	89 45 c0             	mov    %eax,-0x40(%ebp)
 473:	89 d8                	mov    %ebx,%eax
 475:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 478:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 47b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 47e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 481:	76 dd                	jbe    460 <printint+0x30>
  if(neg)
 483:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 486:	85 c9                	test   %ecx,%ecx
 488:	74 0c                	je     496 <printint+0x66>
    buf[i++] = '-';
 48a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 48f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 491:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 496:	8b 7d b8             	mov    -0x48(%ebp),%edi
 499:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 49d:	eb 07                	jmp    4a6 <printint+0x76>
 49f:	90                   	nop
    putc(fd, buf[i]);
 4a0:	0f b6 13             	movzbl (%ebx),%edx
 4a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4a6:	83 ec 04             	sub    $0x4,%esp
 4a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4ac:	6a 01                	push   $0x1
 4ae:	56                   	push   %esi
 4af:	57                   	push   %edi
 4b0:	e8 ce fe ff ff       	call   383 <write>
  while(--i >= 0)
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	39 de                	cmp    %ebx,%esi
 4ba:	75 e4                	jne    4a0 <printint+0x70>
}
 4bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bf:	5b                   	pop    %ebx
 4c0:	5e                   	pop    %esi
 4c1:	5f                   	pop    %edi
 4c2:	5d                   	pop    %ebp
 4c3:	c3                   	ret    
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4cf:	eb 87                	jmp    458 <printint+0x28>
 4d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop

000004e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 4ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 4ef:	0f b6 13             	movzbl (%ebx),%edx
 4f2:	84 d2                	test   %dl,%dl
 4f4:	74 6a                	je     560 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 4f6:	8d 45 10             	lea    0x10(%ebp),%eax
 4f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4ff:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 501:	89 45 d0             	mov    %eax,-0x30(%ebp)
 504:	eb 36                	jmp    53c <printf+0x5c>
 506:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50d:	8d 76 00             	lea    0x0(%esi),%esi
 510:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 513:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 518:	83 f8 25             	cmp    $0x25,%eax
 51b:	74 15                	je     532 <printf+0x52>
  write(fd, &c, 1);
 51d:	83 ec 04             	sub    $0x4,%esp
 520:	88 55 e7             	mov    %dl,-0x19(%ebp)
 523:	6a 01                	push   $0x1
 525:	57                   	push   %edi
 526:	56                   	push   %esi
 527:	e8 57 fe ff ff       	call   383 <write>
 52c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 52f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 532:	0f b6 13             	movzbl (%ebx),%edx
 535:	83 c3 01             	add    $0x1,%ebx
 538:	84 d2                	test   %dl,%dl
 53a:	74 24                	je     560 <printf+0x80>
    c = fmt[i] & 0xff;
 53c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 53f:	85 c9                	test   %ecx,%ecx
 541:	74 cd                	je     510 <printf+0x30>
      }
    } else if(state == '%'){
 543:	83 f9 25             	cmp    $0x25,%ecx
 546:	75 ea                	jne    532 <printf+0x52>
      if(c == 'd'){
 548:	83 f8 25             	cmp    $0x25,%eax
 54b:	0f 84 07 01 00 00    	je     658 <printf+0x178>
 551:	83 e8 63             	sub    $0x63,%eax
 554:	83 f8 15             	cmp    $0x15,%eax
 557:	77 17                	ja     570 <printf+0x90>
 559:	ff 24 85 d8 0a 00 00 	jmp    *0xad8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 560:	8d 65 f4             	lea    -0xc(%ebp),%esp
 563:	5b                   	pop    %ebx
 564:	5e                   	pop    %esi
 565:	5f                   	pop    %edi
 566:	5d                   	pop    %ebp
 567:	c3                   	ret    
 568:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
 573:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 576:	6a 01                	push   $0x1
 578:	57                   	push   %edi
 579:	56                   	push   %esi
 57a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 57e:	e8 00 fe ff ff       	call   383 <write>
        putc(fd, c);
 583:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 587:	83 c4 0c             	add    $0xc,%esp
 58a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 58d:	6a 01                	push   $0x1
 58f:	57                   	push   %edi
 590:	56                   	push   %esi
 591:	e8 ed fd ff ff       	call   383 <write>
        putc(fd, c);
 596:	83 c4 10             	add    $0x10,%esp
      state = 0;
 599:	31 c9                	xor    %ecx,%ecx
 59b:	eb 95                	jmp    532 <printf+0x52>
 59d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5a0:	83 ec 0c             	sub    $0xc,%esp
 5a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5a8:	6a 00                	push   $0x0
 5aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5ad:	8b 10                	mov    (%eax),%edx
 5af:	89 f0                	mov    %esi,%eax
 5b1:	e8 7a fe ff ff       	call   430 <printint>
        ap++;
 5b6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5ba:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5bd:	31 c9                	xor    %ecx,%ecx
 5bf:	e9 6e ff ff ff       	jmp    532 <printf+0x52>
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5cb:	8b 10                	mov    (%eax),%edx
        ap++;
 5cd:	83 c0 04             	add    $0x4,%eax
 5d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5d3:	85 d2                	test   %edx,%edx
 5d5:	0f 84 8d 00 00 00    	je     668 <printf+0x188>
        while(*s != 0){
 5db:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 5de:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 5e0:	84 c0                	test   %al,%al
 5e2:	0f 84 4a ff ff ff    	je     532 <printf+0x52>
 5e8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5eb:	89 d3                	mov    %edx,%ebx
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5f3:	83 c3 01             	add    $0x1,%ebx
 5f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5f9:	6a 01                	push   $0x1
 5fb:	57                   	push   %edi
 5fc:	56                   	push   %esi
 5fd:	e8 81 fd ff ff       	call   383 <write>
        while(*s != 0){
 602:	0f b6 03             	movzbl (%ebx),%eax
 605:	83 c4 10             	add    $0x10,%esp
 608:	84 c0                	test   %al,%al
 60a:	75 e4                	jne    5f0 <printf+0x110>
      state = 0;
 60c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 60f:	31 c9                	xor    %ecx,%ecx
 611:	e9 1c ff ff ff       	jmp    532 <printf+0x52>
 616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	b9 0a 00 00 00       	mov    $0xa,%ecx
 628:	6a 01                	push   $0x1
 62a:	e9 7b ff ff ff       	jmp    5aa <printf+0xca>
 62f:	90                   	nop
        putc(fd, *ap);
 630:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 633:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 636:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 638:	6a 01                	push   $0x1
 63a:	57                   	push   %edi
 63b:	56                   	push   %esi
        putc(fd, *ap);
 63c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 63f:	e8 3f fd ff ff       	call   383 <write>
        ap++;
 644:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 648:	83 c4 10             	add    $0x10,%esp
      state = 0;
 64b:	31 c9                	xor    %ecx,%ecx
 64d:	e9 e0 fe ff ff       	jmp    532 <printf+0x52>
 652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 658:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 65b:	83 ec 04             	sub    $0x4,%esp
 65e:	e9 2a ff ff ff       	jmp    58d <printf+0xad>
 663:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 667:	90                   	nop
          s = "(null)";
 668:	ba d0 0a 00 00       	mov    $0xad0,%edx
        while(*s != 0){
 66d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 670:	b8 28 00 00 00       	mov    $0x28,%eax
 675:	89 d3                	mov    %edx,%ebx
 677:	e9 74 ff ff ff       	jmp    5f0 <printf+0x110>
 67c:	66 90                	xchg   %ax,%ax
 67e:	66 90                	xchg   %ax,%ax

00000680 <normalfree>:
  }
}

void
normalfree(void *ap)
{
 680:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 681:	a1 ac 11 00 00       	mov    0x11ac,%eax
{
 686:	89 e5                	mov    %esp,%ebp
 688:	57                   	push   %edi
 689:	56                   	push   %esi
 68a:	53                   	push   %ebx
 68b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 68e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 698:	89 c2                	mov    %eax,%edx
 69a:	8b 00                	mov    (%eax),%eax
 69c:	39 ca                	cmp    %ecx,%edx
 69e:	73 30                	jae    6d0 <normalfree+0x50>
 6a0:	39 c1                	cmp    %eax,%ecx
 6a2:	72 04                	jb     6a8 <normalfree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a4:	39 c2                	cmp    %eax,%edx
 6a6:	72 f0                	jb     698 <normalfree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ae:	39 f8                	cmp    %edi,%eax
 6b0:	74 30                	je     6e2 <normalfree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6b5:	8b 42 04             	mov    0x4(%edx),%eax
 6b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6bb:	39 f1                	cmp    %esi,%ecx
 6bd:	74 3a                	je     6f9 <normalfree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6c1:	5b                   	pop    %ebx
  freep = p;
 6c2:	89 15 ac 11 00 00    	mov    %edx,0x11ac
}
 6c8:	5e                   	pop    %esi
 6c9:	5f                   	pop    %edi
 6ca:	5d                   	pop    %ebp
 6cb:	c3                   	ret    
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d0:	39 c2                	cmp    %eax,%edx
 6d2:	72 c4                	jb     698 <normalfree+0x18>
 6d4:	39 c1                	cmp    %eax,%ecx
 6d6:	73 c0                	jae    698 <normalfree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 6d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6de:	39 f8                	cmp    %edi,%eax
 6e0:	75 d0                	jne    6b2 <normalfree+0x32>
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
 6f7:	75 c6                	jne    6bf <normalfree+0x3f>
    p->s.size += bp->s.size;
 6f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6fc:	89 15 ac 11 00 00    	mov    %edx,0x11ac
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

00000710 <hugefree>:

void
hugefree(void *ap)
{
 710:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	a1 a0 11 00 00       	mov    0x11a0,%eax
{
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 71e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 728:	89 c2                	mov    %eax,%edx
 72a:	8b 00                	mov    (%eax),%eax
 72c:	39 ca                	cmp    %ecx,%edx
 72e:	73 30                	jae    760 <hugefree+0x50>
 730:	39 c1                	cmp    %eax,%ecx
 732:	72 04                	jb     738 <hugefree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 734:	39 c2                	cmp    %eax,%edx
 736:	72 f0                	jb     728 <hugefree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 738:	8b 73 fc             	mov    -0x4(%ebx),%esi
 73b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73e:	39 f8                	cmp    %edi,%eax
 740:	74 30                	je     772 <hugefree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 742:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 745:	8b 42 04             	mov    0x4(%edx),%eax
 748:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 74b:	39 f1                	cmp    %esi,%ecx
 74d:	74 3a                	je     789 <hugefree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 74f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  huge_freep = p;
}
 751:	5b                   	pop    %ebx
  huge_freep = p;
 752:	89 15 a0 11 00 00    	mov    %edx,0x11a0
}
 758:	5e                   	pop    %esi
 759:	5f                   	pop    %edi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 760:	39 c2                	cmp    %eax,%edx
 762:	72 c4                	jb     728 <hugefree+0x18>
 764:	39 c1                	cmp    %eax,%ecx
 766:	73 c0                	jae    728 <hugefree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 768:	8b 73 fc             	mov    -0x4(%ebx),%esi
 76b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 76e:	39 f8                	cmp    %edi,%eax
 770:	75 d0                	jne    742 <hugefree+0x32>
    bp->s.size += p->s.ptr->s.size;
 772:	03 70 04             	add    0x4(%eax),%esi
 775:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 778:	8b 02                	mov    (%edx),%eax
 77a:	8b 00                	mov    (%eax),%eax
 77c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 77f:	8b 42 04             	mov    0x4(%edx),%eax
 782:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 785:	39 f1                	cmp    %esi,%ecx
 787:	75 c6                	jne    74f <hugefree+0x3f>
    p->s.size += bp->s.size;
 789:	03 43 fc             	add    -0x4(%ebx),%eax
  huge_freep = p;
 78c:	89 15 a0 11 00 00    	mov    %edx,0x11a0
    p->s.size += bp->s.size;
 792:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 795:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 798:	89 0a                	mov    %ecx,(%edx)
}
 79a:	5b                   	pop    %ebx
 79b:	5e                   	pop    %esi
 79c:	5f                   	pop    %edi
 79d:	5d                   	pop    %ebp
 79e:	c3                   	ret    
 79f:	90                   	nop

000007a0 <morecore>:
static Header* morecore(uint nu, int use_huge_pages) {
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	53                   	push   %ebx
 7a4:	83 ec 04             	sub    $0x4,%esp
  if(use_huge_pages){
 7a7:	85 d2                	test   %edx,%edx
 7a9:	74 4d                	je     7f8 <morecore+0x58>
    if(nu < HUGE_PAGE_SIZE)
 7ab:	b9 00 00 40 00       	mov    $0x400000,%ecx
 7b0:	39 c8                	cmp    %ecx,%eax
 7b2:	0f 43 c8             	cmovae %eax,%ecx
  setusehugepages(use_huge_pages);
 7b5:	83 ec 0c             	sub    $0xc,%esp
 7b8:	52                   	push   %edx
 7b9:	89 cb                	mov    %ecx,%ebx
 7bb:	e8 63 fc ff ff       	call   423 <setusehugepages>
  p = sbrk(nu * sizeof(Header));
 7c0:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7c7:	89 04 24             	mov    %eax,(%esp)
 7ca:	e8 1c fc ff ff       	call   3eb <sbrk>
  if(p == (char*)-1)
 7cf:	83 c4 10             	add    $0x10,%esp
 7d2:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d5:	74 71                	je     848 <morecore+0xa8>
  hp->s.size = nu;
 7d7:	89 58 04             	mov    %ebx,0x4(%eax)

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
  if(use_huge_pages) {
    hugefree(ap);
 7da:	83 ec 0c             	sub    $0xc,%esp
  vfree((void*)(hp + 1), use_huge_pages);
 7dd:	83 c0 08             	add    $0x8,%eax
    hugefree(ap);
 7e0:	50                   	push   %eax
 7e1:	e8 2a ff ff ff       	call   710 <hugefree>
    return huge_freep;
 7e6:	a1 a0 11 00 00       	mov    0x11a0,%eax
}
 7eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return huge_freep;
 7ee:	83 c4 10             	add    $0x10,%esp
}
 7f1:	c9                   	leave  
 7f2:	c3                   	ret    
 7f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7f7:	90                   	nop
    if(nu < 4096)
 7f8:	ba 00 10 00 00       	mov    $0x1000,%edx
 7fd:	39 d0                	cmp    %edx,%eax
 7ff:	89 d3                	mov    %edx,%ebx
 801:	0f 43 d8             	cmovae %eax,%ebx
  setusehugepages(use_huge_pages);
 804:	83 ec 0c             	sub    $0xc,%esp
 807:	6a 00                	push   $0x0
 809:	e8 15 fc ff ff       	call   423 <setusehugepages>
  p = sbrk(nu * sizeof(Header));
 80e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 815:	89 04 24             	mov    %eax,(%esp)
 818:	e8 ce fb ff ff       	call   3eb <sbrk>
  if(p == (char*)-1)
 81d:	83 c4 10             	add    $0x10,%esp
 820:	83 f8 ff             	cmp    $0xffffffff,%eax
 823:	74 23                	je     848 <morecore+0xa8>
  hp->s.size = nu;
 825:	89 58 04             	mov    %ebx,0x4(%eax)
  }
  else {
    normalfree(ap);
 828:	83 ec 0c             	sub    $0xc,%esp
  vfree((void*)(hp + 1), use_huge_pages);
 82b:	83 c0 08             	add    $0x8,%eax
    normalfree(ap);
 82e:	50                   	push   %eax
 82f:	e8 4c fe ff ff       	call   680 <normalfree>
    return freep;
 834:	a1 ac 11 00 00       	mov    0x11ac,%eax
}
 839:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return freep;
 83c:	83 c4 10             	add    $0x10,%esp
}
 83f:	c9                   	leave  
 840:	c3                   	ret    
 841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 848:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
 84b:	31 c0                	xor    %eax,%eax
}
 84d:	c9                   	leave  
 84e:	c3                   	ret    
 84f:	90                   	nop

00000850 <normalmalloc>:
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
 856:	83 ec 0c             	sub    $0xc,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 859:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 85c:	8b 3d ac 11 00 00    	mov    0x11ac,%edi
{
 862:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 865:	8d 70 07             	lea    0x7(%eax),%esi
 868:	c1 ee 03             	shr    $0x3,%esi
 86b:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 86e:	85 ff                	test   %edi,%edi
 870:	74 5e                	je     8d0 <normalmalloc+0x80>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 872:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 874:	8b 48 04             	mov    0x4(%eax),%ecx
 877:	39 ce                	cmp    %ecx,%esi
 879:	77 16                	ja     891 <normalmalloc+0x41>
 87b:	eb 2d                	jmp    8aa <normalmalloc+0x5a>
 87d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 880:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 882:	8b 4a 04             	mov    0x4(%edx),%ecx
 885:	39 f1                	cmp    %esi,%ecx
 887:	73 27                	jae    8b0 <normalmalloc+0x60>
    if(p == freep)
 889:	8b 3d ac 11 00 00    	mov    0x11ac,%edi
 88f:	89 d0                	mov    %edx,%eax
 891:	39 c7                	cmp    %eax,%edi
 893:	75 eb                	jne    880 <normalmalloc+0x30>
      if((p = morecore(nunits, use_huge_pages)) == 0)
 895:	89 da                	mov    %ebx,%edx
 897:	89 f0                	mov    %esi,%eax
 899:	e8 02 ff ff ff       	call   7a0 <morecore>
 89e:	85 c0                	test   %eax,%eax
 8a0:	75 de                	jne    880 <normalmalloc+0x30>
}
 8a2:	83 c4 0c             	add    $0xc,%esp
 8a5:	5b                   	pop    %ebx
 8a6:	5e                   	pop    %esi
 8a7:	5f                   	pop    %edi
 8a8:	5d                   	pop    %ebp
 8a9:	c3                   	ret    
    if(p->s.size >= nunits){
 8aa:	89 c2                	mov    %eax,%edx
 8ac:	89 f8                	mov    %edi,%eax
 8ae:	66 90                	xchg   %ax,%ax
      if(p->s.size == nunits)
 8b0:	39 ce                	cmp    %ecx,%esi
 8b2:	74 4c                	je     900 <normalmalloc+0xb0>
        p->s.size -= nunits;
 8b4:	29 f1                	sub    %esi,%ecx
 8b6:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 8b9:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 8bc:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 8bf:	a3 ac 11 00 00       	mov    %eax,0x11ac
}
 8c4:	83 c4 0c             	add    $0xc,%esp
      return (void*)(p + 1);
 8c7:	8d 42 08             	lea    0x8(%edx),%eax
}
 8ca:	5b                   	pop    %ebx
 8cb:	5e                   	pop    %esi
 8cc:	5f                   	pop    %edi
 8cd:	5d                   	pop    %ebp
 8ce:	c3                   	ret    
 8cf:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 8d0:	c7 05 ac 11 00 00 b0 	movl   $0x11b0,0x11ac
 8d7:	11 00 00 
    base.s.size = 0;
 8da:	bf b0 11 00 00       	mov    $0x11b0,%edi
    base.s.ptr = freep = prevp = &base;
 8df:	c7 05 b0 11 00 00 b0 	movl   $0x11b0,0x11b0
 8e6:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 8eb:	c7 05 b4 11 00 00 00 	movl   $0x0,0x11b4
 8f2:	00 00 00 
    if(p->s.size >= nunits){
 8f5:	eb 9a                	jmp    891 <normalmalloc+0x41>
 8f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8fe:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 900:	8b 0a                	mov    (%edx),%ecx
 902:	89 08                	mov    %ecx,(%eax)
 904:	eb b9                	jmp    8bf <normalmalloc+0x6f>
 906:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90d:	8d 76 00             	lea    0x0(%esi),%esi

00000910 <hugemalloc>:
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	57                   	push   %edi
 914:	56                   	push   %esi
 915:	53                   	push   %ebx
 916:	83 ec 0c             	sub    $0xc,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 919:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = huge_freep) == 0){
 91c:	8b 3d a0 11 00 00    	mov    0x11a0,%edi
{
 922:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 925:	8d 70 07             	lea    0x7(%eax),%esi
 928:	c1 ee 03             	shr    $0x3,%esi
 92b:	83 c6 01             	add    $0x1,%esi
  if((prevp = huge_freep) == 0){
 92e:	85 ff                	test   %edi,%edi
 930:	74 5e                	je     990 <hugemalloc+0x80>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 932:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 934:	8b 48 04             	mov    0x4(%eax),%ecx
 937:	39 ce                	cmp    %ecx,%esi
 939:	77 16                	ja     951 <hugemalloc+0x41>
 93b:	eb 2d                	jmp    96a <hugemalloc+0x5a>
 93d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 940:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 942:	8b 4a 04             	mov    0x4(%edx),%ecx
 945:	39 f1                	cmp    %esi,%ecx
 947:	73 27                	jae    970 <hugemalloc+0x60>
    if(p == huge_freep)
 949:	8b 3d a0 11 00 00    	mov    0x11a0,%edi
 94f:	89 d0                	mov    %edx,%eax
 951:	39 c7                	cmp    %eax,%edi
 953:	75 eb                	jne    940 <hugemalloc+0x30>
      if((p = morecore(nunits, use_huge_pages)) == 0)
 955:	89 da                	mov    %ebx,%edx
 957:	89 f0                	mov    %esi,%eax
 959:	e8 42 fe ff ff       	call   7a0 <morecore>
 95e:	85 c0                	test   %eax,%eax
 960:	75 de                	jne    940 <hugemalloc+0x30>
}
 962:	83 c4 0c             	add    $0xc,%esp
 965:	5b                   	pop    %ebx
 966:	5e                   	pop    %esi
 967:	5f                   	pop    %edi
 968:	5d                   	pop    %ebp
 969:	c3                   	ret    
    if(p->s.size >= nunits){
 96a:	89 c2                	mov    %eax,%edx
 96c:	89 f8                	mov    %edi,%eax
 96e:	66 90                	xchg   %ax,%ax
      if(p->s.size == nunits)
 970:	39 ce                	cmp    %ecx,%esi
 972:	74 4c                	je     9c0 <hugemalloc+0xb0>
        p->s.size -= nunits;
 974:	29 f1                	sub    %esi,%ecx
 976:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 979:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 97c:	89 72 04             	mov    %esi,0x4(%edx)
      huge_freep = prevp;
 97f:	a3 a0 11 00 00       	mov    %eax,0x11a0
}
 984:	83 c4 0c             	add    $0xc,%esp
      return (void*)(p + 1);
 987:	8d 42 08             	lea    0x8(%edx),%eax
}
 98a:	5b                   	pop    %ebx
 98b:	5e                   	pop    %esi
 98c:	5f                   	pop    %edi
 98d:	5d                   	pop    %ebp
 98e:	c3                   	ret    
 98f:	90                   	nop
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 990:	c7 05 a0 11 00 00 a4 	movl   $0x11a4,0x11a0
 997:	11 00 00 
    huge_base.s.size = 0;
 99a:	bf a4 11 00 00       	mov    $0x11a4,%edi
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 99f:	c7 05 a4 11 00 00 a4 	movl   $0x11a4,0x11a4
 9a6:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a9:	89 f8                	mov    %edi,%eax
    huge_base.s.size = 0;
 9ab:	c7 05 a8 11 00 00 00 	movl   $0x0,0x11a8
 9b2:	00 00 00 
    if(p->s.size >= nunits){
 9b5:	eb 9a                	jmp    951 <hugemalloc+0x41>
 9b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9be:	66 90                	xchg   %ax,%ax
        prevp->s.ptr = p->s.ptr;
 9c0:	8b 0a                	mov    (%edx),%ecx
 9c2:	89 08                	mov    %ecx,(%eax)
 9c4:	eb b9                	jmp    97f <hugemalloc+0x6f>
 9c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9cd:	8d 76 00             	lea    0x0(%esi),%esi

000009d0 <vmalloc>:
void* vmalloc(uint nbytes, int pagesize) {
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	83 ec 08             	sub    $0x8,%esp
 9d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(pagesize == VMALLOC_SIZE_BASE) {
 9d9:	3d 00 10 00 00       	cmp    $0x1000,%eax
 9de:	74 18                	je     9f8 <vmalloc+0x28>
  else if (pagesize == VMALLOC_SIZE_HUGE) {
 9e0:	3d 00 00 40 00       	cmp    $0x400000,%eax
 9e5:	75 1e                	jne    a05 <vmalloc+0x35>
    return hugemalloc(nbytes, use_huge_pages);
 9e7:	c7 45 0c 01 00 00 00 	movl   $0x1,0xc(%ebp)
}
 9ee:	c9                   	leave  
    return hugemalloc(nbytes, use_huge_pages);
 9ef:	e9 1c ff ff ff       	jmp    910 <hugemalloc>
 9f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return normalmalloc(nbytes, use_huge_pages);
 9f8:	c7 45 0c 00 00 00 00 	movl   $0x0,0xc(%ebp)
}
 9ff:	c9                   	leave  
    return normalmalloc(nbytes, use_huge_pages);
 a00:	e9 4b fe ff ff       	jmp    850 <normalmalloc>
    printf(1, "Please pass VMALLOC_SIZE_BASE or VMALLOC_SIZE_HUGE as flag.\n");
 a05:	50                   	push   %eax
 a06:	50                   	push   %eax
 a07:	68 44 0b 00 00       	push   $0xb44
 a0c:	6a 01                	push   $0x1
 a0e:	e8 cd fa ff ff       	call   4e0 <printf>
    exit();
 a13:	e8 4b f9 ff ff       	call   363 <exit>
 a18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a1f:	90                   	nop

00000a20 <vfree>:
void vfree(void *ap, int use_huge_pages) {
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
  if(use_huge_pages) {
 a23:	8b 45 0c             	mov    0xc(%ebp),%eax
 a26:	85 c0                	test   %eax,%eax
 a28:	74 06                	je     a30 <vfree+0x10>
  }
}
 a2a:	5d                   	pop    %ebp
    hugefree(ap);
 a2b:	e9 e0 fc ff ff       	jmp    710 <hugefree>
}
 a30:	5d                   	pop    %ebp
    normalfree(ap);
 a31:	e9 4a fc ff ff       	jmp    680 <normalfree>
 a36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a3d:	8d 76 00             	lea    0x0(%esi),%esi

00000a40 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
 a43:	53                   	push   %ebx
 a44:	83 ec 04             	sub    $0x4,%esp
 a47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 a4a:	e8 cc f9 ff ff       	call   41b <getthp>

  if(nbytes >= 1048576 && thp != 0) { // only use huge pages if THP is active
 a4f:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 a55:	76 19                	jbe    a70 <malloc+0x30>
 a57:	85 c0                	test   %eax,%eax
 a59:	74 15                	je     a70 <malloc+0x30>
    return hugemalloc(nbytes, use_huge_pages);
 a5b:	83 ec 08             	sub    $0x8,%esp
 a5e:	6a 01                	push   $0x1
 a60:	53                   	push   %ebx
 a61:	e8 aa fe ff ff       	call   910 <hugemalloc>
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
  }
  else{
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
  }
}
 a66:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
 a69:	83 c4 10             	add    $0x10,%esp
}
 a6c:	c9                   	leave  
 a6d:	c3                   	ret    
 a6e:	66 90                	xchg   %ax,%ax
    return normalmalloc(nbytes, use_huge_pages);
 a70:	83 ec 08             	sub    $0x8,%esp
 a73:	6a 00                	push   $0x0
 a75:	53                   	push   %ebx
 a76:	e8 d5 fd ff ff       	call   850 <normalmalloc>
}
 a7b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
 a7e:	83 c4 10             	add    $0x10,%esp
}
 a81:	c9                   	leave  
 a82:	c3                   	ret    
 a83:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a90 <free>:
    normalfree(ap);
 a90:	e9 eb fb ff ff       	jmp    680 <normalfree>
