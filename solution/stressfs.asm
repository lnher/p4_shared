
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   7:	b8 30 00 00 00       	mov    $0x30,%eax
{
   c:	ff 71 fc             	push   -0x4(%ecx)
   f:	55                   	push   %ebp
  10:	89 e5                	mov    %esp,%ebp
  12:	57                   	push   %edi
  13:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  14:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1a:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1b:	31 db                	xor    %ebx,%ebx
{
  1d:	51                   	push   %ecx
  1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  2b:	68 28 0b 00 00       	push   $0xb28
  30:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  32:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  39:	74 72 65 
  3c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  43:	73 66 73 
  printf(1, "stressfs starting\n");
  46:	e8 c5 04 00 00       	call   510 <printf>
  memset(data, 'a', sizeof(data));
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 00 02 00 00       	push   $0x200
  53:	6a 61                	push   $0x61
  55:	56                   	push   %esi
  56:	e8 a5 01 00 00       	call   200 <memset>
  5b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  5e:	e8 28 03 00 00       	call   38b <fork>
  63:	85 c0                	test   %eax,%eax
  65:	0f 8f bf 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6b:	83 c3 01             	add    $0x1,%ebx
  6e:	83 fb 04             	cmp    $0x4,%ebx
  71:	75 eb                	jne    5e <main+0x5e>
  73:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  78:	83 ec 04             	sub    $0x4,%esp
  7b:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  7c:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  81:	68 3b 0b 00 00       	push   $0xb3b
  86:	6a 01                	push   $0x1
  88:	e8 83 04 00 00       	call   510 <printf>
  path[8] += i;
  8d:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
  8f:	5f                   	pop    %edi
  path[8] += i;
  90:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  96:	58                   	pop    %eax
  97:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  9d:	68 02 02 00 00       	push   $0x202
  a2:	50                   	push   %eax
  a3:	e8 2b 03 00 00       	call   3d3 <open>
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  ad:	8d 76 00             	lea    0x0(%esi),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	68 00 02 00 00       	push   $0x200
  b8:	56                   	push   %esi
  b9:	57                   	push   %edi
  ba:	e8 f4 02 00 00       	call   3b3 <write>
  for(i = 0; i < 20; i++)
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	83 eb 01             	sub    $0x1,%ebx
  c5:	75 e9                	jne    b0 <main+0xb0>
  close(fd);
  c7:	83 ec 0c             	sub    $0xc,%esp
  ca:	57                   	push   %edi
  cb:	e8 eb 02 00 00       	call   3bb <close>

  printf(1, "read\n");
  d0:	58                   	pop    %eax
  d1:	5a                   	pop    %edx
  d2:	68 45 0b 00 00       	push   $0xb45
  d7:	6a 01                	push   $0x1
  d9:	e8 32 04 00 00       	call   510 <printf>

  fd = open(path, O_RDONLY);
  de:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  e4:	59                   	pop    %ecx
  e5:	5b                   	pop    %ebx
  e6:	6a 00                	push   $0x0
  e8:	bb 14 00 00 00       	mov    $0x14,%ebx
  ed:	50                   	push   %eax
  ee:	e8 e0 02 00 00       	call   3d3 <open>
  f3:	83 c4 10             	add    $0x10,%esp
  f6:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
  f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ff:	90                   	nop
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 9c 02 00 00       	call   3ab <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 9b 02 00 00       	call   3bb <close>

  wait();
 120:	e8 76 02 00 00       	call   39b <wait>

  exit();
 125:	e8 69 02 00 00       	call   393 <exit>
  path[8] += i;
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 47 ff ff ff       	jmp    78 <main+0x78>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 141:	31 c0                	xor    %eax,%eax
{
 143:	89 e5                	mov    %esp,%ebp
 145:	53                   	push   %ebx
 146:	8b 4d 08             	mov    0x8(%ebp),%ecx
 149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 157:	83 c0 01             	add    $0x1,%eax
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 161:	89 c8                	mov    %ecx,%eax
 163:	c9                   	leave  
 164:	c3                   	ret    
 165:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 55 08             	mov    0x8(%ebp),%edx
 177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 17a:	0f b6 02             	movzbl (%edx),%eax
 17d:	84 c0                	test   %al,%al
 17f:	75 17                	jne    198 <strcmp+0x28>
 181:	eb 3a                	jmp    1bd <strcmp+0x4d>
 183:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 187:	90                   	nop
 188:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 18c:	83 c2 01             	add    $0x1,%edx
 18f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 192:	84 c0                	test   %al,%al
 194:	74 1a                	je     1b0 <strcmp+0x40>
    p++, q++;
 196:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 198:	0f b6 19             	movzbl (%ecx),%ebx
 19b:	38 c3                	cmp    %al,%bl
 19d:	74 e9                	je     188 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 19f:	29 d8                	sub    %ebx,%eax
}
 1a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a4:	c9                   	leave  
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1b4:	31 c0                	xor    %eax,%eax
 1b6:	29 d8                	sub    %ebx,%eax
}
 1b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1bb:	c9                   	leave  
 1bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1bd:	0f b6 19             	movzbl (%ecx),%ebx
 1c0:	31 c0                	xor    %eax,%eax
 1c2:	eb db                	jmp    19f <strcmp+0x2f>
 1c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1d6:	80 3a 00             	cmpb   $0x0,(%edx)
 1d9:	74 15                	je     1f0 <strlen+0x20>
 1db:	31 c0                	xor    %eax,%eax
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	83 c0 01             	add    $0x1,%eax
 1e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1e7:	89 c1                	mov    %eax,%ecx
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
 1eb:	89 c8                	mov    %ecx,%eax
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    
 1ef:	90                   	nop
  for(n = 0; s[n]; n++)
 1f0:	31 c9                	xor    %ecx,%ecx
}
 1f2:	5d                   	pop    %ebp
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	8b 7d fc             	mov    -0x4(%ebp),%edi
 215:	89 d0                	mov    %edx,%eax
 217:	c9                   	leave  
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	75 12                	jne    243 <strchr+0x23>
 231:	eb 1d                	jmp    250 <strchr+0x30>
 233:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 237:	90                   	nop
 238:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 23c:	83 c0 01             	add    $0x1,%eax
 23f:	84 d2                	test   %dl,%dl
 241:	74 0d                	je     250 <strchr+0x30>
    if(*s == c)
 243:	38 d1                	cmp    %dl,%cl
 245:	75 f1                	jne    238 <strchr+0x18>
      return (char*)s;
  return 0;
}
 247:	5d                   	pop    %ebp
 248:	c3                   	ret    
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 250:	31 c0                	xor    %eax,%eax
}
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    
 254:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 265:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 268:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 269:	31 db                	xor    %ebx,%ebx
{
 26b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 26e:	eb 27                	jmp    297 <gets+0x37>
    cc = read(0, &c, 1);
 270:	83 ec 04             	sub    $0x4,%esp
 273:	6a 01                	push   $0x1
 275:	57                   	push   %edi
 276:	6a 00                	push   $0x0
 278:	e8 2e 01 00 00       	call   3ab <read>
    if(cc < 1)
 27d:	83 c4 10             	add    $0x10,%esp
 280:	85 c0                	test   %eax,%eax
 282:	7e 1d                	jle    2a1 <gets+0x41>
      break;
    buf[i++] = c;
 284:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 288:	8b 55 08             	mov    0x8(%ebp),%edx
 28b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 28f:	3c 0a                	cmp    $0xa,%al
 291:	74 1d                	je     2b0 <gets+0x50>
 293:	3c 0d                	cmp    $0xd,%al
 295:	74 19                	je     2b0 <gets+0x50>
  for(i=0; i+1 < max; ){
 297:	89 de                	mov    %ebx,%esi
 299:	83 c3 01             	add    $0x1,%ebx
 29c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29f:	7c cf                	jl     270 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ab:	5b                   	pop    %ebx
 2ac:	5e                   	pop    %esi
 2ad:	5f                   	pop    %edi
 2ae:	5d                   	pop    %ebp
 2af:	c3                   	ret    
  buf[i] = '\0';
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	89 de                	mov    %ebx,%esi
 2b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bc:	5b                   	pop    %ebx
 2bd:	5e                   	pop    %esi
 2be:	5f                   	pop    %edi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	push   0x8(%ebp)
 2dd:	e8 f1 00 00 00       	call   3d3 <open>
  if(fd < 0)
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	push   0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 f4 00 00 00       	call   3eb <fstat>
  close(fd);
 2f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2fa:	89 c6                	mov    %eax,%esi
  close(fd);
 2fc:	e8 ba 00 00 00       	call   3bb <close>
  return r;
 301:	83 c4 10             	add    $0x10,%esp
}
 304:	8d 65 f8             	lea    -0x8(%ebp),%esp
 307:	89 f0                	mov    %esi,%eax
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 310:	be ff ff ff ff       	mov    $0xffffffff,%esi
 315:	eb ed                	jmp    304 <stat+0x34>
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax

00000320 <atoi>:

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	0f be 02             	movsbl (%edx),%eax
 32a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 32d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 330:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 335:	77 1e                	ja     355 <atoi+0x35>
 337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 340:	83 c2 01             	add    $0x1,%edx
 343:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 346:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 34a:	0f be 02             	movsbl (%edx),%eax
 34d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
  return n;
}
 355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 358:	89 c8                	mov    %ecx,%eax
 35a:	c9                   	leave  
 35b:	c3                   	ret    
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	8b 45 10             	mov    0x10(%ebp),%eax
 367:	8b 55 08             	mov    0x8(%ebp),%edx
 36a:	56                   	push   %esi
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36e:	85 c0                	test   %eax,%eax
 370:	7e 13                	jle    385 <memmove+0x25>
 372:	01 d0                	add    %edx,%eax
  dst = vdst;
 374:	89 d7                	mov    %edx,%edi
 376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 381:	39 f8                	cmp    %edi,%eax
 383:	75 fb                	jne    380 <memmove+0x20>
  return vdst;
}
 385:	5e                   	pop    %esi
 386:	89 d0                	mov    %edx,%eax
 388:	5f                   	pop    %edi
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret    

0000038b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 38b:	b8 01 00 00 00       	mov    $0x1,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <exit>:
SYSCALL(exit)
 393:	b8 02 00 00 00       	mov    $0x2,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <wait>:
SYSCALL(wait)
 39b:	b8 03 00 00 00       	mov    $0x3,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <pipe>:
SYSCALL(pipe)
 3a3:	b8 04 00 00 00       	mov    $0x4,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <read>:
SYSCALL(read)
 3ab:	b8 05 00 00 00       	mov    $0x5,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <write>:
SYSCALL(write)
 3b3:	b8 10 00 00 00       	mov    $0x10,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <close>:
SYSCALL(close)
 3bb:	b8 15 00 00 00       	mov    $0x15,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <kill>:
SYSCALL(kill)
 3c3:	b8 06 00 00 00       	mov    $0x6,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <exec>:
SYSCALL(exec)
 3cb:	b8 07 00 00 00       	mov    $0x7,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <open>:
SYSCALL(open)
 3d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <mknod>:
SYSCALL(mknod)
 3db:	b8 11 00 00 00       	mov    $0x11,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <unlink>:
SYSCALL(unlink)
 3e3:	b8 12 00 00 00       	mov    $0x12,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <fstat>:
SYSCALL(fstat)
 3eb:	b8 08 00 00 00       	mov    $0x8,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <link>:
SYSCALL(link)
 3f3:	b8 13 00 00 00       	mov    $0x13,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <mkdir>:
SYSCALL(mkdir)
 3fb:	b8 14 00 00 00       	mov    $0x14,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <chdir>:
SYSCALL(chdir)
 403:	b8 09 00 00 00       	mov    $0x9,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <dup>:
SYSCALL(dup)
 40b:	b8 0a 00 00 00       	mov    $0xa,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <getpid>:
SYSCALL(getpid)
 413:	b8 0b 00 00 00       	mov    $0xb,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <sbrk>:
SYSCALL(sbrk)
 41b:	b8 0c 00 00 00       	mov    $0xc,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <sleep>:
SYSCALL(sleep)
 423:	b8 0d 00 00 00       	mov    $0xd,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <uptime>:
SYSCALL(uptime)
 42b:	b8 0e 00 00 00       	mov    $0xe,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <printhugepde>:
SYSCALL(printhugepde)
 433:	b8 16 00 00 00       	mov    $0x16,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 43b:	b8 17 00 00 00       	mov    $0x17,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <setthp>:
SYSCALL(setthp)
 443:	b8 18 00 00 00       	mov    $0x18,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <getthp>:
 44b:	b8 19 00 00 00       	mov    $0x19,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    
 453:	66 90                	xchg   %ax,%ax
 455:	66 90                	xchg   %ax,%ax
 457:	66 90                	xchg   %ax,%ax
 459:	66 90                	xchg   %ax,%ax
 45b:	66 90                	xchg   %ax,%ax
 45d:	66 90                	xchg   %ax,%ax
 45f:	90                   	nop

00000460 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	83 ec 3c             	sub    $0x3c,%esp
 469:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 46c:	89 d1                	mov    %edx,%ecx
{
 46e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 471:	85 d2                	test   %edx,%edx
 473:	0f 89 7f 00 00 00    	jns    4f8 <printint+0x98>
 479:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 47d:	74 79                	je     4f8 <printint+0x98>
    neg = 1;
 47f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 486:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 488:	31 db                	xor    %ebx,%ebx
 48a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 48d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 490:	89 c8                	mov    %ecx,%eax
 492:	31 d2                	xor    %edx,%edx
 494:	89 cf                	mov    %ecx,%edi
 496:	f7 75 c4             	divl   -0x3c(%ebp)
 499:	0f b6 92 ac 0b 00 00 	movzbl 0xbac(%edx),%edx
 4a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4a3:	89 d8                	mov    %ebx,%eax
 4a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4b1:	76 dd                	jbe    490 <printint+0x30>
  if(neg)
 4b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4b6:	85 c9                	test   %ecx,%ecx
 4b8:	74 0c                	je     4c6 <printint+0x66>
    buf[i++] = '-';
 4ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4cd:	eb 07                	jmp    4d6 <printint+0x76>
 4cf:	90                   	nop
    putc(fd, buf[i]);
 4d0:	0f b6 13             	movzbl (%ebx),%edx
 4d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4d6:	83 ec 04             	sub    $0x4,%esp
 4d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4dc:	6a 01                	push   $0x1
 4de:	56                   	push   %esi
 4df:	57                   	push   %edi
 4e0:	e8 ce fe ff ff       	call   3b3 <write>
  while(--i >= 0)
 4e5:	83 c4 10             	add    $0x10,%esp
 4e8:	39 de                	cmp    %ebx,%esi
 4ea:	75 e4                	jne    4d0 <printint+0x70>
}
 4ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ef:	5b                   	pop    %ebx
 4f0:	5e                   	pop    %esi
 4f1:	5f                   	pop    %edi
 4f2:	5d                   	pop    %ebp
 4f3:	c3                   	ret    
 4f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4ff:	eb 87                	jmp    488 <printint+0x28>
 501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 508:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop

00000510 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
 516:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 519:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 51c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 51f:	0f b6 13             	movzbl (%ebx),%edx
 522:	84 d2                	test   %dl,%dl
 524:	74 6a                	je     590 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 526:	8d 45 10             	lea    0x10(%ebp),%eax
 529:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 52c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 52f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 531:	89 45 d0             	mov    %eax,-0x30(%ebp)
 534:	eb 36                	jmp    56c <printf+0x5c>
 536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi
 540:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 543:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 548:	83 f8 25             	cmp    $0x25,%eax
 54b:	74 15                	je     562 <printf+0x52>
  write(fd, &c, 1);
 54d:	83 ec 04             	sub    $0x4,%esp
 550:	88 55 e7             	mov    %dl,-0x19(%ebp)
 553:	6a 01                	push   $0x1
 555:	57                   	push   %edi
 556:	56                   	push   %esi
 557:	e8 57 fe ff ff       	call   3b3 <write>
 55c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 55f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 562:	0f b6 13             	movzbl (%ebx),%edx
 565:	83 c3 01             	add    $0x1,%ebx
 568:	84 d2                	test   %dl,%dl
 56a:	74 24                	je     590 <printf+0x80>
    c = fmt[i] & 0xff;
 56c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 56f:	85 c9                	test   %ecx,%ecx
 571:	74 cd                	je     540 <printf+0x30>
      }
    } else if(state == '%'){
 573:	83 f9 25             	cmp    $0x25,%ecx
 576:	75 ea                	jne    562 <printf+0x52>
      if(c == 'd'){
 578:	83 f8 25             	cmp    $0x25,%eax
 57b:	0f 84 07 01 00 00    	je     688 <printf+0x178>
 581:	83 e8 63             	sub    $0x63,%eax
 584:	83 f8 15             	cmp    $0x15,%eax
 587:	77 17                	ja     5a0 <printf+0x90>
 589:	ff 24 85 54 0b 00 00 	jmp    *0xb54(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 590:	8d 65 f4             	lea    -0xc(%ebp),%esp
 593:	5b                   	pop    %ebx
 594:	5e                   	pop    %esi
 595:	5f                   	pop    %edi
 596:	5d                   	pop    %ebp
 597:	c3                   	ret    
 598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop
  write(fd, &c, 1);
 5a0:	83 ec 04             	sub    $0x4,%esp
 5a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 5a6:	6a 01                	push   $0x1
 5a8:	57                   	push   %edi
 5a9:	56                   	push   %esi
 5aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ae:	e8 00 fe ff ff       	call   3b3 <write>
        putc(fd, c);
 5b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 5b7:	83 c4 0c             	add    $0xc,%esp
 5ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5bd:	6a 01                	push   $0x1
 5bf:	57                   	push   %edi
 5c0:	56                   	push   %esi
 5c1:	e8 ed fd ff ff       	call   3b3 <write>
        putc(fd, c);
 5c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5c9:	31 c9                	xor    %ecx,%ecx
 5cb:	eb 95                	jmp    562 <printf+0x52>
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5d0:	83 ec 0c             	sub    $0xc,%esp
 5d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5d8:	6a 00                	push   $0x0
 5da:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5dd:	8b 10                	mov    (%eax),%edx
 5df:	89 f0                	mov    %esi,%eax
 5e1:	e8 7a fe ff ff       	call   460 <printint>
        ap++;
 5e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5ed:	31 c9                	xor    %ecx,%ecx
 5ef:	e9 6e ff ff ff       	jmp    562 <printf+0x52>
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5fb:	8b 10                	mov    (%eax),%edx
        ap++;
 5fd:	83 c0 04             	add    $0x4,%eax
 600:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 603:	85 d2                	test   %edx,%edx
 605:	0f 84 8d 00 00 00    	je     698 <printf+0x188>
        while(*s != 0){
 60b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 60e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 610:	84 c0                	test   %al,%al
 612:	0f 84 4a ff ff ff    	je     562 <printf+0x52>
 618:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 61b:	89 d3                	mov    %edx,%ebx
 61d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 620:	83 ec 04             	sub    $0x4,%esp
          s++;
 623:	83 c3 01             	add    $0x1,%ebx
 626:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 629:	6a 01                	push   $0x1
 62b:	57                   	push   %edi
 62c:	56                   	push   %esi
 62d:	e8 81 fd ff ff       	call   3b3 <write>
        while(*s != 0){
 632:	0f b6 03             	movzbl (%ebx),%eax
 635:	83 c4 10             	add    $0x10,%esp
 638:	84 c0                	test   %al,%al
 63a:	75 e4                	jne    620 <printf+0x110>
      state = 0;
 63c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 63f:	31 c9                	xor    %ecx,%ecx
 641:	e9 1c ff ff ff       	jmp    562 <printf+0x52>
 646:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	b9 0a 00 00 00       	mov    $0xa,%ecx
 658:	6a 01                	push   $0x1
 65a:	e9 7b ff ff ff       	jmp    5da <printf+0xca>
 65f:	90                   	nop
        putc(fd, *ap);
 660:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 663:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 666:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 668:	6a 01                	push   $0x1
 66a:	57                   	push   %edi
 66b:	56                   	push   %esi
        putc(fd, *ap);
 66c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 66f:	e8 3f fd ff ff       	call   3b3 <write>
        ap++;
 674:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 678:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67b:	31 c9                	xor    %ecx,%ecx
 67d:	e9 e0 fe ff ff       	jmp    562 <printf+0x52>
 682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 688:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 68b:	83 ec 04             	sub    $0x4,%esp
 68e:	e9 2a ff ff ff       	jmp    5bd <printf+0xad>
 693:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 697:	90                   	nop
          s = "(null)";
 698:	ba 4b 0b 00 00       	mov    $0xb4b,%edx
        while(*s != 0){
 69d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6a0:	b8 28 00 00 00       	mov    $0x28,%eax
 6a5:	89 d3                	mov    %edx,%ebx
 6a7:	e9 74 ff ff ff       	jmp    620 <printf+0x110>
 6ac:	66 90                	xchg   %ax,%ax
 6ae:	66 90                	xchg   %ax,%ax

000006b0 <normalfree>:
  }
}

void
normalfree(void *ap)
{
 6b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b1:	a1 d4 0f 00 00       	mov    0xfd4,%eax
{
 6b6:	89 e5                	mov    %esp,%ebp
 6b8:	57                   	push   %edi
 6b9:	56                   	push   %esi
 6ba:	53                   	push   %ebx
 6bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6c8:	89 c2                	mov    %eax,%edx
 6ca:	8b 00                	mov    (%eax),%eax
 6cc:	39 ca                	cmp    %ecx,%edx
 6ce:	73 30                	jae    700 <normalfree+0x50>
 6d0:	39 c1                	cmp    %eax,%ecx
 6d2:	72 04                	jb     6d8 <normalfree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d4:	39 c2                	cmp    %eax,%edx
 6d6:	72 f0                	jb     6c8 <normalfree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6de:	39 f8                	cmp    %edi,%eax
 6e0:	74 30                	je     712 <normalfree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6e5:	8b 42 04             	mov    0x4(%edx),%eax
 6e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6eb:	39 f1                	cmp    %esi,%ecx
 6ed:	74 3a                	je     729 <normalfree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6ef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6f1:	5b                   	pop    %ebx
  freep = p;
 6f2:	89 15 d4 0f 00 00    	mov    %edx,0xfd4
}
 6f8:	5e                   	pop    %esi
 6f9:	5f                   	pop    %edi
 6fa:	5d                   	pop    %ebp
 6fb:	c3                   	ret    
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 700:	39 c2                	cmp    %eax,%edx
 702:	72 c4                	jb     6c8 <normalfree+0x18>
 704:	39 c1                	cmp    %eax,%ecx
 706:	73 c0                	jae    6c8 <normalfree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 708:	8b 73 fc             	mov    -0x4(%ebx),%esi
 70b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70e:	39 f8                	cmp    %edi,%eax
 710:	75 d0                	jne    6e2 <normalfree+0x32>
    bp->s.size += p->s.ptr->s.size;
 712:	03 70 04             	add    0x4(%eax),%esi
 715:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 718:	8b 02                	mov    (%edx),%eax
 71a:	8b 00                	mov    (%eax),%eax
 71c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 71f:	8b 42 04             	mov    0x4(%edx),%eax
 722:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 725:	39 f1                	cmp    %esi,%ecx
 727:	75 c6                	jne    6ef <normalfree+0x3f>
    p->s.size += bp->s.size;
 729:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 72c:	89 15 d4 0f 00 00    	mov    %edx,0xfd4
    p->s.size += bp->s.size;
 732:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 735:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 738:	89 0a                	mov    %ecx,(%edx)
}
 73a:	5b                   	pop    %ebx
 73b:	5e                   	pop    %esi
 73c:	5f                   	pop    %edi
 73d:	5d                   	pop    %ebp
 73e:	c3                   	ret    
 73f:	90                   	nop

00000740 <hugefree>:

void
hugefree(void *ap)
{
 740:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	a1 c8 0f 00 00       	mov    0xfc8,%eax
{
 746:	89 e5                	mov    %esp,%ebp
 748:	57                   	push   %edi
 749:	56                   	push   %esi
 74a:	53                   	push   %ebx
 74b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 74e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 758:	89 c2                	mov    %eax,%edx
 75a:	8b 00                	mov    (%eax),%eax
 75c:	39 ca                	cmp    %ecx,%edx
 75e:	73 30                	jae    790 <hugefree+0x50>
 760:	39 c1                	cmp    %eax,%ecx
 762:	72 04                	jb     768 <hugefree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 764:	39 c2                	cmp    %eax,%edx
 766:	72 f0                	jb     758 <hugefree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 768:	8b 73 fc             	mov    -0x4(%ebx),%esi
 76b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 76e:	39 f8                	cmp    %edi,%eax
 770:	74 30                	je     7a2 <hugefree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 772:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 775:	8b 42 04             	mov    0x4(%edx),%eax
 778:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 77b:	39 f1                	cmp    %esi,%ecx
 77d:	74 3a                	je     7b9 <hugefree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 77f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  huge_freep = p;
}
 781:	5b                   	pop    %ebx
  huge_freep = p;
 782:	89 15 c8 0f 00 00    	mov    %edx,0xfc8
}
 788:	5e                   	pop    %esi
 789:	5f                   	pop    %edi
 78a:	5d                   	pop    %ebp
 78b:	c3                   	ret    
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 790:	39 c2                	cmp    %eax,%edx
 792:	72 c4                	jb     758 <hugefree+0x18>
 794:	39 c1                	cmp    %eax,%ecx
 796:	73 c0                	jae    758 <hugefree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 798:	8b 73 fc             	mov    -0x4(%ebx),%esi
 79b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 79e:	39 f8                	cmp    %edi,%eax
 7a0:	75 d0                	jne    772 <hugefree+0x32>
    bp->s.size += p->s.ptr->s.size;
 7a2:	03 70 04             	add    0x4(%eax),%esi
 7a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a8:	8b 02                	mov    (%edx),%eax
 7aa:	8b 00                	mov    (%eax),%eax
 7ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7af:	8b 42 04             	mov    0x4(%edx),%eax
 7b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7b5:	39 f1                	cmp    %esi,%ecx
 7b7:	75 c6                	jne    77f <hugefree+0x3f>
    p->s.size += bp->s.size;
 7b9:	03 43 fc             	add    -0x4(%ebx),%eax
  huge_freep = p;
 7bc:	89 15 c8 0f 00 00    	mov    %edx,0xfc8
    p->s.size += bp->s.size;
 7c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7c8:	89 0a                	mov    %ecx,(%edx)
}
 7ca:	5b                   	pop    %ebx
 7cb:	5e                   	pop    %esi
 7cc:	5f                   	pop    %edi
 7cd:	5d                   	pop    %ebp
 7ce:	c3                   	ret    
 7cf:	90                   	nop

000007d0 <hugemalloc>:
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	83 ec 1c             	sub    $0x1c,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = huge_freep) == 0){
 7dc:	8b 3d c8 0f 00 00    	mov    0xfc8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e2:	8d 70 07             	lea    0x7(%eax),%esi
 7e5:	c1 ee 03             	shr    $0x3,%esi
 7e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = huge_freep) == 0){
 7eb:	85 ff                	test   %edi,%edi
 7ed:	0f 84 cd 00 00 00    	je     8c0 <hugemalloc+0xf0>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7f5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7f8:	39 f1                	cmp    %esi,%ecx
 7fa:	0f 83 96 00 00 00    	jae    896 <hugemalloc+0xc6>
 800:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 805:	89 f9                	mov    %edi,%ecx
 807:	39 de                	cmp    %ebx,%esi
 809:	0f 43 de             	cmovae %esi,%ebx
 80c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 813:	89 df                	mov    %ebx,%edi
 815:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 818:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 81b:	eb 14                	jmp    831 <hugemalloc+0x61>
 81d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 820:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 822:	8b 48 04             	mov    0x4(%eax),%ecx
 825:	39 f1                	cmp    %esi,%ecx
 827:	73 77                	jae    8a0 <hugemalloc+0xd0>
    if(p == huge_freep)
 829:	8b 0d c8 0f 00 00    	mov    0xfc8,%ecx
 82f:	89 c2                	mov    %eax,%edx
 831:	39 d1                	cmp    %edx,%ecx
 833:	75 eb                	jne    820 <hugemalloc+0x50>
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 835:	83 ec 08             	sub    $0x8,%esp
 838:	53                   	push   %ebx
 839:	ff 75 e4             	push   -0x1c(%ebp)
 83c:	e8 da fb ff ff       	call   41b <sbrk>
  if(p == (char*)-1)
 841:	83 c4 10             	add    $0x10,%esp
 844:	83 f8 ff             	cmp    $0xffffffff,%eax
 847:	74 31                	je     87a <hugemalloc+0xaa>
  hp->s.size = nu;
 849:	89 78 04             	mov    %edi,0x4(%eax)
  vfree((void*)(hp + 1));
 84c:	8d 50 08             	lea    0x8(%eax),%edx

// vfree: free a block allocated by vmalloc
void vfree(void *ap) {
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 84f:	2d f8 ff ff 1d       	sub    $0x1dfffff8,%eax
 854:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 859:	77 2d                	ja     888 <hugemalloc+0xb8>
    hugefree(ap);
 85b:	83 ec 0c             	sub    $0xc,%esp
 85e:	52                   	push   %edx
 85f:	e8 dc fe ff ff       	call   740 <hugefree>
 864:	83 c4 10             	add    $0x10,%esp
    return huge_freep;
 867:	8b 15 c8 0f 00 00    	mov    0xfc8,%edx
 86d:	85 db                	test   %ebx,%ebx
 86f:	0f 44 15 d4 0f 00 00 	cmove  0xfd4,%edx
      if((p = morecore(nunits, use_huge_pages)) == 0)
 876:	85 d2                	test   %edx,%edx
 878:	75 a6                	jne    820 <hugemalloc+0x50>
}
 87a:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 87d:	31 c0                	xor    %eax,%eax
}
 87f:	5b                   	pop    %ebx
 880:	5e                   	pop    %esi
 881:	5f                   	pop    %edi
 882:	5d                   	pop    %ebp
 883:	c3                   	ret    
 884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
  else {
    normalfree(ap);
 888:	83 ec 0c             	sub    $0xc,%esp
 88b:	52                   	push   %edx
 88c:	e8 1f fe ff ff       	call   6b0 <normalfree>
 891:	83 c4 10             	add    $0x10,%esp
 894:	eb d1                	jmp    867 <hugemalloc+0x97>
    if(p->s.size >= nunits){
 896:	89 d0                	mov    %edx,%eax
 898:	89 fa                	mov    %edi,%edx
 89a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8a0:	39 ce                	cmp    %ecx,%esi
 8a2:	74 4c                	je     8f0 <hugemalloc+0x120>
        p->s.size -= nunits;
 8a4:	29 f1                	sub    %esi,%ecx
 8a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8ac:	89 70 04             	mov    %esi,0x4(%eax)
      huge_freep = prevp;
 8af:	89 15 c8 0f 00 00    	mov    %edx,0xfc8
}
 8b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8b8:	83 c0 08             	add    $0x8,%eax
}
 8bb:	5b                   	pop    %ebx
 8bc:	5e                   	pop    %esi
 8bd:	5f                   	pop    %edi
 8be:	5d                   	pop    %ebp
 8bf:	c3                   	ret    
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 8c0:	c7 05 c8 0f 00 00 cc 	movl   $0xfcc,0xfc8
 8c7:	0f 00 00 
    huge_base.s.size = 0;
 8ca:	bf cc 0f 00 00       	mov    $0xfcc,%edi
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 8cf:	c7 05 cc 0f 00 00 cc 	movl   $0xfcc,0xfcc
 8d6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d9:	89 fa                	mov    %edi,%edx
    huge_base.s.size = 0;
 8db:	c7 05 d0 0f 00 00 00 	movl   $0x0,0xfd0
 8e2:	00 00 00 
    if(p->s.size >= nunits){
 8e5:	e9 16 ff ff ff       	jmp    800 <hugemalloc+0x30>
 8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8f0:	8b 08                	mov    (%eax),%ecx
 8f2:	89 0a                	mov    %ecx,(%edx)
 8f4:	eb b9                	jmp    8af <hugemalloc+0xdf>
 8f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8fd:	8d 76 00             	lea    0x0(%esi),%esi

00000900 <normalmalloc>:
{
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	57                   	push   %edi
 904:	56                   	push   %esi
 905:	53                   	push   %ebx
 906:	83 ec 1c             	sub    $0x1c,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 909:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 90c:	8b 3d d4 0f 00 00    	mov    0xfd4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 912:	8d 70 07             	lea    0x7(%eax),%esi
 915:	c1 ee 03             	shr    $0x3,%esi
 918:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 91b:	85 ff                	test   %edi,%edi
 91d:	0f 84 cd 00 00 00    	je     9f0 <normalmalloc+0xf0>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 923:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 925:	8b 4a 04             	mov    0x4(%edx),%ecx
 928:	39 f1                	cmp    %esi,%ecx
 92a:	0f 83 96 00 00 00    	jae    9c6 <normalmalloc+0xc6>
 930:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 935:	89 f9                	mov    %edi,%ecx
 937:	39 de                	cmp    %ebx,%esi
 939:	0f 43 de             	cmovae %esi,%ebx
 93c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 943:	89 df                	mov    %ebx,%edi
 945:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 948:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 94b:	eb 14                	jmp    961 <normalmalloc+0x61>
 94d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 950:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 952:	8b 48 04             	mov    0x4(%eax),%ecx
 955:	39 f1                	cmp    %esi,%ecx
 957:	73 77                	jae    9d0 <normalmalloc+0xd0>
    if(p == freep) {
 959:	8b 0d d4 0f 00 00    	mov    0xfd4,%ecx
 95f:	89 c2                	mov    %eax,%edx
 961:	39 d1                	cmp    %edx,%ecx
 963:	75 eb                	jne    950 <normalmalloc+0x50>
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 965:	83 ec 08             	sub    $0x8,%esp
 968:	53                   	push   %ebx
 969:	ff 75 e4             	push   -0x1c(%ebp)
 96c:	e8 aa fa ff ff       	call   41b <sbrk>
  if(p == (char*)-1)
 971:	83 c4 10             	add    $0x10,%esp
 974:	83 f8 ff             	cmp    $0xffffffff,%eax
 977:	74 31                	je     9aa <normalmalloc+0xaa>
  hp->s.size = nu;
 979:	89 78 04             	mov    %edi,0x4(%eax)
  vfree((void*)(hp + 1));
 97c:	8d 50 08             	lea    0x8(%eax),%edx
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 97f:	2d f8 ff ff 1d       	sub    $0x1dfffff8,%eax
 984:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 989:	77 2d                	ja     9b8 <normalmalloc+0xb8>
    hugefree(ap);
 98b:	83 ec 0c             	sub    $0xc,%esp
 98e:	52                   	push   %edx
 98f:	e8 ac fd ff ff       	call   740 <hugefree>
 994:	83 c4 10             	add    $0x10,%esp
    return huge_freep;
 997:	8b 15 c8 0f 00 00    	mov    0xfc8,%edx
 99d:	85 db                	test   %ebx,%ebx
 99f:	0f 44 15 d4 0f 00 00 	cmove  0xfd4,%edx
      if((p = morecore(nunits, use_huge_pages)) == 0) {
 9a6:	85 d2                	test   %edx,%edx
 9a8:	75 a6                	jne    950 <normalmalloc+0x50>
}
 9aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9ad:	31 c0                	xor    %eax,%eax
}
 9af:	5b                   	pop    %ebx
 9b0:	5e                   	pop    %esi
 9b1:	5f                   	pop    %edi
 9b2:	5d                   	pop    %ebp
 9b3:	c3                   	ret    
 9b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    normalfree(ap);
 9b8:	83 ec 0c             	sub    $0xc,%esp
 9bb:	52                   	push   %edx
 9bc:	e8 ef fc ff ff       	call   6b0 <normalfree>
 9c1:	83 c4 10             	add    $0x10,%esp
 9c4:	eb d1                	jmp    997 <normalmalloc+0x97>
    if(p->s.size >= nunits){
 9c6:	89 d0                	mov    %edx,%eax
 9c8:	89 fa                	mov    %edi,%edx
 9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9d0:	39 ce                	cmp    %ecx,%esi
 9d2:	74 4c                	je     a20 <normalmalloc+0x120>
        p->s.size -= nunits;
 9d4:	29 f1                	sub    %esi,%ecx
 9d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9dc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 9df:	89 15 d4 0f 00 00    	mov    %edx,0xfd4
}
 9e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9e8:	83 c0 08             	add    $0x8,%eax
}
 9eb:	5b                   	pop    %ebx
 9ec:	5e                   	pop    %esi
 9ed:	5f                   	pop    %edi
 9ee:	5d                   	pop    %ebp
 9ef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 9f0:	c7 05 d4 0f 00 00 d8 	movl   $0xfd8,0xfd4
 9f7:	0f 00 00 
    base.s.size = 0;
 9fa:	bf d8 0f 00 00       	mov    $0xfd8,%edi
    base.s.ptr = freep = prevp = &base;
 9ff:	c7 05 d8 0f 00 00 d8 	movl   $0xfd8,0xfd8
 a06:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a09:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 a0b:	c7 05 dc 0f 00 00 00 	movl   $0x0,0xfdc
 a12:	00 00 00 
    if(p->s.size >= nunits){
 a15:	e9 16 ff ff ff       	jmp    930 <normalmalloc+0x30>
 a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a20:	8b 08                	mov    (%eax),%ecx
 a22:	89 0a                	mov    %ecx,(%edx)
 a24:	eb b9                	jmp    9df <normalmalloc+0xdf>
 a26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a2d:	8d 76 00             	lea    0x0(%esi),%esi

00000a30 <vmalloc>:
void* vmalloc(uint nbytes, int pagesize) {
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	83 ec 08             	sub    $0x8,%esp
 a36:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(pagesize == VMALLOC_SIZE_BASE) {
 a39:	3d 00 10 00 00       	cmp    $0x1000,%eax
 a3e:	74 18                	je     a58 <vmalloc+0x28>
  else if (pagesize == VMALLOC_SIZE_HUGE) {
 a40:	3d 00 00 40 00       	cmp    $0x400000,%eax
 a45:	75 1e                	jne    a65 <vmalloc+0x35>
    return hugemalloc(nbytes, use_huge_pages);
 a47:	c7 45 0c 01 00 00 00 	movl   $0x1,0xc(%ebp)
}
 a4e:	c9                   	leave  
    return hugemalloc(nbytes, use_huge_pages);
 a4f:	e9 7c fd ff ff       	jmp    7d0 <hugemalloc>
 a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return normalmalloc(nbytes, use_huge_pages);
 a58:	c7 45 0c 00 00 00 00 	movl   $0x0,0xc(%ebp)
}
 a5f:	c9                   	leave  
    return normalmalloc(nbytes, use_huge_pages);
 a60:	e9 9b fe ff ff       	jmp    900 <normalmalloc>
    printf(1, "Please pass VMALLOC_SIZE_BASE or VMALLOC_SIZE_HUGE as flag.\n");
 a65:	50                   	push   %eax
 a66:	50                   	push   %eax
 a67:	68 c0 0b 00 00       	push   $0xbc0
 a6c:	6a 01                	push   $0x1
 a6e:	e8 9d fa ff ff       	call   510 <printf>
    exit();
 a73:	e8 1b f9 ff ff       	call   393 <exit>
 a78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a7f:	90                   	nop

00000a80 <vfree>:
void vfree(void *ap) {
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 a83:	8b 45 08             	mov    0x8(%ebp),%eax
 a86:	2d 00 00 00 1e       	sub    $0x1e000000,%eax
 a8b:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 a90:	77 0e                	ja     aa0 <vfree+0x20>
  }
}
 a92:	5d                   	pop    %ebp
    hugefree(ap);
 a93:	e9 a8 fc ff ff       	jmp    740 <hugefree>
 a98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a9f:	90                   	nop
}
 aa0:	5d                   	pop    %ebp
    normalfree(ap);
 aa1:	e9 0a fc ff ff       	jmp    6b0 <normalfree>
 aa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aad:	8d 76 00             	lea    0x0(%esi),%esi

00000ab0 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	53                   	push   %ebx
 ab4:	83 ec 04             	sub    $0x4,%esp
 ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 aba:	e8 8c f9 ff ff       	call   44b <getthp>

  if(nbytes >= 1048576 && thp != 0) { // only use huge pages if THP is active
 abf:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 ac5:	76 19                	jbe    ae0 <malloc+0x30>
 ac7:	85 c0                	test   %eax,%eax
 ac9:	74 15                	je     ae0 <malloc+0x30>
    return hugemalloc(nbytes, use_huge_pages);
 acb:	83 ec 08             	sub    $0x8,%esp
 ace:	6a 01                	push   $0x1
 ad0:	53                   	push   %ebx
 ad1:	e8 fa fc ff ff       	call   7d0 <hugemalloc>
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
  }
  else{
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
  }
}
 ad6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
 ad9:	83 c4 10             	add    $0x10,%esp
}
 adc:	c9                   	leave  
 add:	c3                   	ret    
 ade:	66 90                	xchg   %ax,%ax
    return normalmalloc(nbytes, use_huge_pages);
 ae0:	83 ec 08             	sub    $0x8,%esp
 ae3:	6a 00                	push   $0x0
 ae5:	53                   	push   %ebx
 ae6:	e8 15 fe ff ff       	call   900 <normalmalloc>
}
 aeb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
 aee:	83 c4 10             	add    $0x10,%esp
}
 af1:	c9                   	leave  
 af2:	c3                   	ret    
 af3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b00 <free>:

void free(void * ap){
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 b03:	8b 45 08             	mov    0x8(%ebp),%eax
 b06:	2d 00 00 00 1e       	sub    $0x1e000000,%eax
 b0b:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 b10:	77 0e                	ja     b20 <free+0x20>
  vfree(ap);
}
 b12:	5d                   	pop    %ebp
    hugefree(ap);
 b13:	e9 28 fc ff ff       	jmp    740 <hugefree>
 b18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b1f:	90                   	nop
}
 b20:	5d                   	pop    %ebp
    normalfree(ap);
 b21:	e9 8a fb ff ff       	jmp    6b0 <normalfree>
