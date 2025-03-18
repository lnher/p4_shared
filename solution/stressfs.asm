
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <vmalloc.cold>:

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
   0:	c7 05 10 0d 00 00 14 	movl   $0xd14,0xd10
   7:	0d 00 00 
   a:	c7 05 14 0d 00 00 14 	movl   $0xd14,0xd14
  11:	0d 00 00 
            huge_base.s.size = 0;
  14:	c7 05 18 0d 00 00 00 	movl   $0x0,0xd18
  1b:	00 00 00 
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
  1e:	a1 00 00 00 00       	mov    0x0,%eax
  23:	0f 0b                	ud2    
            base.s.ptr = freep = &base;
  25:	c7 05 1c 0d 00 00 20 	movl   $0xd20,0xd1c
  2c:	0d 00 00 
  2f:	c7 05 20 0d 00 00 20 	movl   $0xd20,0xd20
  36:	0d 00 00 
            base.s.size = 0;
  39:	c7 05 24 0d 00 00 00 	movl   $0x0,0xd24
  40:	00 00 00 
  43:	eb d9                	jmp    1e <vmalloc.cold+0x1e>
  45:	66 90                	xchg   %ax,%ax
  47:	66 90                	xchg   %ax,%ax
  49:	66 90                	xchg   %ax,%ax
  4b:	66 90                	xchg   %ax,%ax
  4d:	66 90                	xchg   %ax,%ax
  4f:	90                   	nop

00000050 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
  50:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  54:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
  57:	b8 30 00 00 00       	mov    $0x30,%eax
{
  5c:	ff 71 fc             	push   -0x4(%ecx)
  5f:	55                   	push   %ebp
  60:	89 e5                	mov    %esp,%ebp
  62:	57                   	push   %edi
  63:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  64:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  6a:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  6b:	31 db                	xor    %ebx,%ebx
{
  6d:	51                   	push   %ecx
  6e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  74:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  7b:	68 64 09 00 00       	push   $0x964
  80:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  82:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  89:	74 72 65 
  8c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  93:	73 66 73 
  printf(1, "stressfs starting\n");
  96:	e8 c5 04 00 00       	call   560 <printf>
  memset(data, 'a', sizeof(data));
  9b:	83 c4 0c             	add    $0xc,%esp
  9e:	68 00 02 00 00       	push   $0x200
  a3:	6a 61                	push   $0x61
  a5:	56                   	push   %esi
  a6:	e8 a5 01 00 00       	call   250 <memset>
  ab:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  ae:	e8 28 03 00 00       	call   3db <fork>
  b3:	85 c0                	test   %eax,%eax
  b5:	0f 8f bf 00 00 00    	jg     17a <main+0x12a>
  for(i = 0; i < 4; i++)
  bb:	83 c3 01             	add    $0x1,%ebx
  be:	83 fb 04             	cmp    $0x4,%ebx
  c1:	75 eb                	jne    ae <main+0x5e>
  c3:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  c8:	83 ec 04             	sub    $0x4,%esp
  cb:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  cc:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  d1:	68 77 09 00 00       	push   $0x977
  d6:	6a 01                	push   $0x1
  d8:	e8 83 04 00 00       	call   560 <printf>
  path[8] += i;
  dd:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
  df:	5f                   	pop    %edi
  path[8] += i;
  e0:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  e6:	58                   	pop    %eax
  e7:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  ed:	68 02 02 00 00       	push   $0x202
  f2:	50                   	push   %eax
  f3:	e8 2b 03 00 00       	call   423 <open>
  f8:	83 c4 10             	add    $0x10,%esp
  fb:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  fd:	8d 76 00             	lea    0x0(%esi),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 f4 02 00 00       	call   403 <write>
  for(i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0xb0>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 eb 02 00 00       	call   40b <close>

  printf(1, "read\n");
 120:	58                   	pop    %eax
 121:	5a                   	pop    %edx
 122:	68 81 09 00 00       	push   $0x981
 127:	6a 01                	push   $0x1
 129:	e8 32 04 00 00       	call   560 <printf>

  fd = open(path, O_RDONLY);
 12e:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
 134:	59                   	pop    %ecx
 135:	5b                   	pop    %ebx
 136:	6a 00                	push   $0x0
 138:	bb 14 00 00 00       	mov    $0x14,%ebx
 13d:	50                   	push   %eax
 13e:	e8 e0 02 00 00       	call   423 <open>
 143:	83 c4 10             	add    $0x10,%esp
 146:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
 148:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop
    read(fd, data, sizeof(data));
 150:	83 ec 04             	sub    $0x4,%esp
 153:	68 00 02 00 00       	push   $0x200
 158:	56                   	push   %esi
 159:	57                   	push   %edi
 15a:	e8 9c 02 00 00       	call   3fb <read>
  for (i = 0; i < 20; i++)
 15f:	83 c4 10             	add    $0x10,%esp
 162:	83 eb 01             	sub    $0x1,%ebx
 165:	75 e9                	jne    150 <main+0x100>
  close(fd);
 167:	83 ec 0c             	sub    $0xc,%esp
 16a:	57                   	push   %edi
 16b:	e8 9b 02 00 00       	call   40b <close>

  wait();
 170:	e8 76 02 00 00       	call   3eb <wait>

  exit();
 175:	e8 69 02 00 00       	call   3e3 <exit>
  path[8] += i;
 17a:	89 df                	mov    %ebx,%edi
 17c:	e9 47 ff ff ff       	jmp    c8 <main+0x78>
 181:	66 90                	xchg   %ax,%ax
 183:	66 90                	xchg   %ax,%ax
 185:	66 90                	xchg   %ax,%ax
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 190:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 191:	31 c0                	xor    %eax,%eax
{
 193:	89 e5                	mov    %esp,%ebp
 195:	53                   	push   %ebx
 196:	8b 4d 08             	mov    0x8(%ebp),%ecx
 199:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1a7:	83 c0 01             	add    $0x1,%eax
 1aa:	84 d2                	test   %dl,%dl
 1ac:	75 f2                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1b1:	89 c8                	mov    %ecx,%eax
 1b3:	c9                   	leave  
 1b4:	c3                   	ret    
 1b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
 1c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ca:	0f b6 02             	movzbl (%edx),%eax
 1cd:	84 c0                	test   %al,%al
 1cf:	75 17                	jne    1e8 <strcmp+0x28>
 1d1:	eb 3a                	jmp    20d <strcmp+0x4d>
 1d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d7:	90                   	nop
 1d8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1dc:	83 c2 01             	add    $0x1,%edx
 1df:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1e2:	84 c0                	test   %al,%al
 1e4:	74 1a                	je     200 <strcmp+0x40>
    p++, q++;
 1e6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 1e8:	0f b6 19             	movzbl (%ecx),%ebx
 1eb:	38 c3                	cmp    %al,%bl
 1ed:	74 e9                	je     1d8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1ef:	29 d8                	sub    %ebx,%eax
}
 1f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 200:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 204:	31 c0                	xor    %eax,%eax
 206:	29 d8                	sub    %ebx,%eax
}
 208:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 20b:	c9                   	leave  
 20c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 20d:	0f b6 19             	movzbl (%ecx),%ebx
 210:	31 c0                	xor    %eax,%eax
 212:	eb db                	jmp    1ef <strcmp+0x2f>
 214:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop

00000220 <strlen>:

uint
strlen(const char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 226:	80 3a 00             	cmpb   $0x0,(%edx)
 229:	74 15                	je     240 <strlen+0x20>
 22b:	31 c0                	xor    %eax,%eax
 22d:	8d 76 00             	lea    0x0(%esi),%esi
 230:	83 c0 01             	add    $0x1,%eax
 233:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 237:	89 c1                	mov    %eax,%ecx
 239:	75 f5                	jne    230 <strlen+0x10>
    ;
  return n;
}
 23b:	89 c8                	mov    %ecx,%eax
 23d:	5d                   	pop    %ebp
 23e:	c3                   	ret    
 23f:	90                   	nop
  for(n = 0; s[n]; n++)
 240:	31 c9                	xor    %ecx,%ecx
}
 242:	5d                   	pop    %ebp
 243:	89 c8                	mov    %ecx,%eax
 245:	c3                   	ret    
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 257:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	89 d7                	mov    %edx,%edi
 25f:	fc                   	cld    
 260:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 262:	8b 7d fc             	mov    -0x4(%ebp),%edi
 265:	89 d0                	mov    %edx,%eax
 267:	c9                   	leave  
 268:	c3                   	ret    
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27a:	0f b6 10             	movzbl (%eax),%edx
 27d:	84 d2                	test   %dl,%dl
 27f:	75 12                	jne    293 <strchr+0x23>
 281:	eb 1d                	jmp    2a0 <strchr+0x30>
 283:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 287:	90                   	nop
 288:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 28c:	83 c0 01             	add    $0x1,%eax
 28f:	84 d2                	test   %dl,%dl
 291:	74 0d                	je     2a0 <strchr+0x30>
    if(*s == c)
 293:	38 d1                	cmp    %dl,%cl
 295:	75 f1                	jne    288 <strchr+0x18>
      return (char*)s;
  return 0;
}
 297:	5d                   	pop    %ebp
 298:	c3                   	ret    
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2a0:	31 c0                	xor    %eax,%eax
}
 2a2:	5d                   	pop    %ebp
 2a3:	c3                   	ret    
 2a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2b5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2b8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2b9:	31 db                	xor    %ebx,%ebx
{
 2bb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2be:	eb 27                	jmp    2e7 <gets+0x37>
    cc = read(0, &c, 1);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	6a 01                	push   $0x1
 2c5:	57                   	push   %edi
 2c6:	6a 00                	push   $0x0
 2c8:	e8 2e 01 00 00       	call   3fb <read>
    if(cc < 1)
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7e 1d                	jle    2f1 <gets+0x41>
      break;
    buf[i++] = c;
 2d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2d8:	8b 55 08             	mov    0x8(%ebp),%edx
 2db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2df:	3c 0a                	cmp    $0xa,%al
 2e1:	74 1d                	je     300 <gets+0x50>
 2e3:	3c 0d                	cmp    $0xd,%al
 2e5:	74 19                	je     300 <gets+0x50>
  for(i=0; i+1 < max; ){
 2e7:	89 de                	mov    %ebx,%esi
 2e9:	83 c3 01             	add    $0x1,%ebx
 2ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ef:	7c cf                	jl     2c0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fb:	5b                   	pop    %ebx
 2fc:	5e                   	pop    %esi
 2fd:	5f                   	pop    %edi
 2fe:	5d                   	pop    %ebp
 2ff:	c3                   	ret    
  buf[i] = '\0';
 300:	8b 45 08             	mov    0x8(%ebp),%eax
 303:	89 de                	mov    %ebx,%esi
 305:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 309:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30c:	5b                   	pop    %ebx
 30d:	5e                   	pop    %esi
 30e:	5f                   	pop    %edi
 30f:	5d                   	pop    %ebp
 310:	c3                   	ret    
 311:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 318:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop

00000320 <stat>:

int
stat(const char *n, struct stat *st)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 325:	83 ec 08             	sub    $0x8,%esp
 328:	6a 00                	push   $0x0
 32a:	ff 75 08             	push   0x8(%ebp)
 32d:	e8 f1 00 00 00       	call   423 <open>
  if(fd < 0)
 332:	83 c4 10             	add    $0x10,%esp
 335:	85 c0                	test   %eax,%eax
 337:	78 27                	js     360 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	ff 75 0c             	push   0xc(%ebp)
 33f:	89 c3                	mov    %eax,%ebx
 341:	50                   	push   %eax
 342:	e8 f4 00 00 00       	call   43b <fstat>
  close(fd);
 347:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 34a:	89 c6                	mov    %eax,%esi
  close(fd);
 34c:	e8 ba 00 00 00       	call   40b <close>
  return r;
 351:	83 c4 10             	add    $0x10,%esp
}
 354:	8d 65 f8             	lea    -0x8(%ebp),%esp
 357:	89 f0                	mov    %esi,%eax
 359:	5b                   	pop    %ebx
 35a:	5e                   	pop    %esi
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    
 35d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 360:	be ff ff ff ff       	mov    $0xffffffff,%esi
 365:	eb ed                	jmp    354 <stat+0x34>
 367:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36e:	66 90                	xchg   %ax,%ax

00000370 <atoi>:

int
atoi(const char *s)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 377:	0f be 02             	movsbl (%edx),%eax
 37a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 37d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 380:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 385:	77 1e                	ja     3a5 <atoi+0x35>
 387:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 390:	83 c2 01             	add    $0x1,%edx
 393:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 396:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 39a:	0f be 02             	movsbl (%edx),%eax
 39d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3a0:	80 fb 09             	cmp    $0x9,%bl
 3a3:	76 eb                	jbe    390 <atoi+0x20>
  return n;
}
 3a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a8:	89 c8                	mov    %ecx,%eax
 3aa:	c9                   	leave  
 3ab:	c3                   	ret    
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	8b 45 10             	mov    0x10(%ebp),%eax
 3b7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ba:	56                   	push   %esi
 3bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3be:	85 c0                	test   %eax,%eax
 3c0:	7e 13                	jle    3d5 <memmove+0x25>
 3c2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3c4:	89 d7                	mov    %edx,%edi
 3c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3d1:	39 f8                	cmp    %edi,%eax
 3d3:	75 fb                	jne    3d0 <memmove+0x20>
  return vdst;
}
 3d5:	5e                   	pop    %esi
 3d6:	89 d0                	mov    %edx,%eax
 3d8:	5f                   	pop    %edi
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3db:	b8 01 00 00 00       	mov    $0x1,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <exit>:
SYSCALL(exit)
 3e3:	b8 02 00 00 00       	mov    $0x2,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <wait>:
SYSCALL(wait)
 3eb:	b8 03 00 00 00       	mov    $0x3,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <pipe>:
SYSCALL(pipe)
 3f3:	b8 04 00 00 00       	mov    $0x4,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <read>:
SYSCALL(read)
 3fb:	b8 05 00 00 00       	mov    $0x5,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <write>:
SYSCALL(write)
 403:	b8 10 00 00 00       	mov    $0x10,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <close>:
SYSCALL(close)
 40b:	b8 15 00 00 00       	mov    $0x15,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <kill>:
SYSCALL(kill)
 413:	b8 06 00 00 00       	mov    $0x6,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <exec>:
SYSCALL(exec)
 41b:	b8 07 00 00 00       	mov    $0x7,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <open>:
SYSCALL(open)
 423:	b8 0f 00 00 00       	mov    $0xf,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <mknod>:
SYSCALL(mknod)
 42b:	b8 11 00 00 00       	mov    $0x11,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <unlink>:
SYSCALL(unlink)
 433:	b8 12 00 00 00       	mov    $0x12,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <fstat>:
SYSCALL(fstat)
 43b:	b8 08 00 00 00       	mov    $0x8,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <link>:
SYSCALL(link)
 443:	b8 13 00 00 00       	mov    $0x13,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <mkdir>:
SYSCALL(mkdir)
 44b:	b8 14 00 00 00       	mov    $0x14,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <chdir>:
SYSCALL(chdir)
 453:	b8 09 00 00 00       	mov    $0x9,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <dup>:
SYSCALL(dup)
 45b:	b8 0a 00 00 00       	mov    $0xa,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <getpid>:
SYSCALL(getpid)
 463:	b8 0b 00 00 00       	mov    $0xb,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <sbrk>:
SYSCALL(sbrk)
 46b:	b8 0c 00 00 00       	mov    $0xc,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <sleep>:
SYSCALL(sleep)
 473:	b8 0d 00 00 00       	mov    $0xd,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <uptime>:
SYSCALL(uptime)
 47b:	b8 0e 00 00 00       	mov    $0xe,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <printhugepde>:
SYSCALL(printhugepde)
 483:	b8 16 00 00 00       	mov    $0x16,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 48b:	b8 17 00 00 00       	mov    $0x17,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <setthp>:
SYSCALL(setthp)
 493:	b8 18 00 00 00       	mov    $0x18,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <getthp>:
 49b:	b8 19 00 00 00       	mov    $0x19,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    
 4a3:	66 90                	xchg   %ax,%ax
 4a5:	66 90                	xchg   %ax,%ax
 4a7:	66 90                	xchg   %ax,%ax
 4a9:	66 90                	xchg   %ax,%ax
 4ab:	66 90                	xchg   %ax,%ax
 4ad:	66 90                	xchg   %ax,%ax
 4af:	90                   	nop

000004b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	83 ec 3c             	sub    $0x3c,%esp
 4b9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4bc:	89 d1                	mov    %edx,%ecx
{
 4be:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4c1:	85 d2                	test   %edx,%edx
 4c3:	0f 89 7f 00 00 00    	jns    548 <printint+0x98>
 4c9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4cd:	74 79                	je     548 <printint+0x98>
    neg = 1;
 4cf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4d6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4d8:	31 db                	xor    %ebx,%ebx
 4da:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4e0:	89 c8                	mov    %ecx,%eax
 4e2:	31 d2                	xor    %edx,%edx
 4e4:	89 cf                	mov    %ecx,%edi
 4e6:	f7 75 c4             	divl   -0x3c(%ebp)
 4e9:	0f b6 92 e8 09 00 00 	movzbl 0x9e8(%edx),%edx
 4f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4f3:	89 d8                	mov    %ebx,%eax
 4f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4fe:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 501:	76 dd                	jbe    4e0 <printint+0x30>
  if(neg)
 503:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 506:	85 c9                	test   %ecx,%ecx
 508:	74 0c                	je     516 <printint+0x66>
    buf[i++] = '-';
 50a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 50f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 511:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 516:	8b 7d b8             	mov    -0x48(%ebp),%edi
 519:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 51d:	eb 07                	jmp    526 <printint+0x76>
 51f:	90                   	nop
    putc(fd, buf[i]);
 520:	0f b6 13             	movzbl (%ebx),%edx
 523:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 526:	83 ec 04             	sub    $0x4,%esp
 529:	88 55 d7             	mov    %dl,-0x29(%ebp)
 52c:	6a 01                	push   $0x1
 52e:	56                   	push   %esi
 52f:	57                   	push   %edi
 530:	e8 ce fe ff ff       	call   403 <write>
  while(--i >= 0)
 535:	83 c4 10             	add    $0x10,%esp
 538:	39 de                	cmp    %ebx,%esi
 53a:	75 e4                	jne    520 <printint+0x70>
}
 53c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53f:	5b                   	pop    %ebx
 540:	5e                   	pop    %esi
 541:	5f                   	pop    %edi
 542:	5d                   	pop    %ebp
 543:	c3                   	ret    
 544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 548:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 54f:	eb 87                	jmp    4d8 <printint+0x28>
 551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 558:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55f:	90                   	nop

00000560 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 569:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 56c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 56f:	0f b6 13             	movzbl (%ebx),%edx
 572:	84 d2                	test   %dl,%dl
 574:	74 6a                	je     5e0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 576:	8d 45 10             	lea    0x10(%ebp),%eax
 579:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 57c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 57f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 581:	89 45 d0             	mov    %eax,-0x30(%ebp)
 584:	eb 36                	jmp    5bc <printf+0x5c>
 586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi
 590:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 593:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 598:	83 f8 25             	cmp    $0x25,%eax
 59b:	74 15                	je     5b2 <printf+0x52>
  write(fd, &c, 1);
 59d:	83 ec 04             	sub    $0x4,%esp
 5a0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5a3:	6a 01                	push   $0x1
 5a5:	57                   	push   %edi
 5a6:	56                   	push   %esi
 5a7:	e8 57 fe ff ff       	call   403 <write>
 5ac:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5af:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5b2:	0f b6 13             	movzbl (%ebx),%edx
 5b5:	83 c3 01             	add    $0x1,%ebx
 5b8:	84 d2                	test   %dl,%dl
 5ba:	74 24                	je     5e0 <printf+0x80>
    c = fmt[i] & 0xff;
 5bc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5bf:	85 c9                	test   %ecx,%ecx
 5c1:	74 cd                	je     590 <printf+0x30>
      }
    } else if(state == '%'){
 5c3:	83 f9 25             	cmp    $0x25,%ecx
 5c6:	75 ea                	jne    5b2 <printf+0x52>
      if(c == 'd'){
 5c8:	83 f8 25             	cmp    $0x25,%eax
 5cb:	0f 84 07 01 00 00    	je     6d8 <printf+0x178>
 5d1:	83 e8 63             	sub    $0x63,%eax
 5d4:	83 f8 15             	cmp    $0x15,%eax
 5d7:	77 17                	ja     5f0 <printf+0x90>
 5d9:	ff 24 85 90 09 00 00 	jmp    *0x990(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e3:	5b                   	pop    %ebx
 5e4:	5e                   	pop    %esi
 5e5:	5f                   	pop    %edi
 5e6:	5d                   	pop    %ebp
 5e7:	c3                   	ret    
 5e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ef:	90                   	nop
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
 5f3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 5f6:	6a 01                	push   $0x1
 5f8:	57                   	push   %edi
 5f9:	56                   	push   %esi
 5fa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5fe:	e8 00 fe ff ff       	call   403 <write>
        putc(fd, c);
 603:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 607:	83 c4 0c             	add    $0xc,%esp
 60a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 60d:	6a 01                	push   $0x1
 60f:	57                   	push   %edi
 610:	56                   	push   %esi
 611:	e8 ed fd ff ff       	call   403 <write>
        putc(fd, c);
 616:	83 c4 10             	add    $0x10,%esp
      state = 0;
 619:	31 c9                	xor    %ecx,%ecx
 61b:	eb 95                	jmp    5b2 <printf+0x52>
 61d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	b9 10 00 00 00       	mov    $0x10,%ecx
 628:	6a 00                	push   $0x0
 62a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 62d:	8b 10                	mov    (%eax),%edx
 62f:	89 f0                	mov    %esi,%eax
 631:	e8 7a fe ff ff       	call   4b0 <printint>
        ap++;
 636:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 63a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 63d:	31 c9                	xor    %ecx,%ecx
 63f:	e9 6e ff ff ff       	jmp    5b2 <printf+0x52>
 644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 648:	8b 45 d0             	mov    -0x30(%ebp),%eax
 64b:	8b 10                	mov    (%eax),%edx
        ap++;
 64d:	83 c0 04             	add    $0x4,%eax
 650:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 653:	85 d2                	test   %edx,%edx
 655:	0f 84 8d 00 00 00    	je     6e8 <printf+0x188>
        while(*s != 0){
 65b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 65e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 660:	84 c0                	test   %al,%al
 662:	0f 84 4a ff ff ff    	je     5b2 <printf+0x52>
 668:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 66b:	89 d3                	mov    %edx,%ebx
 66d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
          s++;
 673:	83 c3 01             	add    $0x1,%ebx
 676:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 679:	6a 01                	push   $0x1
 67b:	57                   	push   %edi
 67c:	56                   	push   %esi
 67d:	e8 81 fd ff ff       	call   403 <write>
        while(*s != 0){
 682:	0f b6 03             	movzbl (%ebx),%eax
 685:	83 c4 10             	add    $0x10,%esp
 688:	84 c0                	test   %al,%al
 68a:	75 e4                	jne    670 <printf+0x110>
      state = 0;
 68c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 68f:	31 c9                	xor    %ecx,%ecx
 691:	e9 1c ff ff ff       	jmp    5b2 <printf+0x52>
 696:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6a0:	83 ec 0c             	sub    $0xc,%esp
 6a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6a8:	6a 01                	push   $0x1
 6aa:	e9 7b ff ff ff       	jmp    62a <printf+0xca>
 6af:	90                   	nop
        putc(fd, *ap);
 6b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 6b3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6b6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6b8:	6a 01                	push   $0x1
 6ba:	57                   	push   %edi
 6bb:	56                   	push   %esi
        putc(fd, *ap);
 6bc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6bf:	e8 3f fd ff ff       	call   403 <write>
        ap++;
 6c4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6c8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6cb:	31 c9                	xor    %ecx,%ecx
 6cd:	e9 e0 fe ff ff       	jmp    5b2 <printf+0x52>
 6d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 6d8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6db:	83 ec 04             	sub    $0x4,%esp
 6de:	e9 2a ff ff ff       	jmp    60d <printf+0xad>
 6e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6e7:	90                   	nop
          s = "(null)";
 6e8:	ba 87 09 00 00       	mov    $0x987,%edx
        while(*s != 0){
 6ed:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6f0:	b8 28 00 00 00       	mov    $0x28,%eax
 6f5:	89 d3                	mov    %edx,%ebx
 6f7:	e9 74 ff ff ff       	jmp    670 <printf+0x110>
 6fc:	66 90                	xchg   %ax,%ax
 6fe:	66 90                	xchg   %ax,%ax

00000700 <vfree>:
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 04             	sub    $0x4,%esp
 709:	8b 5d 08             	mov    0x8(%ebp),%ebx
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
 70c:	8b 45 0c             	mov    0xc(%ebp),%eax
    bp = ((Header*)ap) - 1;
 70f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    if (use_huge_pages) {
 712:	85 c0                	test   %eax,%eax
 714:	0f 84 96 00 00 00    	je     7b0 <vfree+0xb0>
        freepptr = &huge_freep;
 71a:	a1 10 0d 00 00       	mov    0xd10,%eax
 71f:	bf 10 0d 00 00       	mov    $0xd10,%edi
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 728:	89 c2                	mov    %eax,%edx
 72a:	8b 00                	mov    (%eax),%eax
 72c:	39 ca                	cmp    %ecx,%edx
 72e:	73 38                	jae    768 <vfree+0x68>
 730:	39 c1                	cmp    %eax,%ecx
 732:	72 04                	jb     738 <vfree+0x38>
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 734:	39 c2                	cmp    %eax,%edx
 736:	72 f0                	jb     728 <vfree+0x28>
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
 738:	8b 73 fc             	mov    -0x4(%ebx),%esi
 73b:	89 7d f0             	mov    %edi,-0x10(%ebp)
 73e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 741:	39 f8                	cmp    %edi,%eax
 743:	74 38                	je     77d <vfree+0x7d>
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
 745:	89 43 f8             	mov    %eax,-0x8(%ebx)
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
 748:	8b 42 04             	mov    0x4(%edx),%eax
 74b:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 74e:	39 f1                	cmp    %esi,%ecx
 750:	74 42                	je     794 <vfree+0x94>
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
 752:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 755:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 757:	89 10                	mov    %edx,(%eax)
}
 759:	83 c4 04             	add    $0x4,%esp
 75c:	5b                   	pop    %ebx
 75d:	5e                   	pop    %esi
 75e:	5f                   	pop    %edi
 75f:	5d                   	pop    %ebp
 760:	c3                   	ret    
 761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 768:	39 c2                	cmp    %eax,%edx
 76a:	72 bc                	jb     728 <vfree+0x28>
 76c:	39 c1                	cmp    %eax,%ecx
 76e:	73 b8                	jae    728 <vfree+0x28>
    if (bp + bp->s.size == p->s.ptr) {
 770:	8b 73 fc             	mov    -0x4(%ebx),%esi
 773:	89 7d f0             	mov    %edi,-0x10(%ebp)
 776:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 779:	39 f8                	cmp    %edi,%eax
 77b:	75 c8                	jne    745 <vfree+0x45>
        bp->s.size += p->s.ptr->s.size;
 77d:	03 70 04             	add    0x4(%eax),%esi
 780:	89 73 fc             	mov    %esi,-0x4(%ebx)
        bp->s.ptr = p->s.ptr->s.ptr;
 783:	8b 02                	mov    (%edx),%eax
 785:	8b 00                	mov    (%eax),%eax
 787:	89 43 f8             	mov    %eax,-0x8(%ebx)
    if (p + p->s.size == bp) {
 78a:	8b 42 04             	mov    0x4(%edx),%eax
 78d:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 790:	39 f1                	cmp    %esi,%ecx
 792:	75 be                	jne    752 <vfree+0x52>
        p->s.size += bp->s.size;
 794:	03 43 fc             	add    -0x4(%ebx),%eax
 797:	89 42 04             	mov    %eax,0x4(%edx)
    *freepptr = p;
 79a:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 79d:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7a0:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 7a2:	89 10                	mov    %edx,(%eax)
}
 7a4:	83 c4 04             	add    $0x4,%esp
 7a7:	5b                   	pop    %ebx
 7a8:	5e                   	pop    %esi
 7a9:	5f                   	pop    %edi
 7aa:	5d                   	pop    %ebp
 7ab:	c3                   	ret    
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        freepptr = &freep;
 7b0:	a1 1c 0d 00 00       	mov    0xd1c,%eax
 7b5:	bf 1c 0d 00 00       	mov    $0xd1c,%edi
    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 7ba:	e9 69 ff ff ff       	jmp    728 <vfree+0x28>
 7bf:	90                   	nop

000007c0 <vmalloc>:
void* vmalloc(uint nbytes, int use_huge_pages) {
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 1c             	sub    $0x1c,%esp
 7c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (use_huge_pages) {
 7cc:	85 db                	test   %ebx,%ebx
 7ce:	0f 84 0c 01 00 00    	je     8e0 <vmalloc+0x120>
        if ((prevp = huge_freep) == 0) {
 7d4:	8b 15 10 0d 00 00    	mov    0xd10,%edx
 7da:	85 d2                	test   %edx,%edx
 7dc:	0f 84 1e f8 ff ff    	je     0 <vmalloc.cold>
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 7e2:	8b 45 08             	mov    0x8(%ebp),%eax
 7e5:	8d 78 07             	lea    0x7(%eax),%edi
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 7e8:	8b 02                	mov    (%edx),%eax
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 7ea:	c1 ef 03             	shr    $0x3,%edi
        if (p->s.size >= nunits) {
 7ed:	8b 48 04             	mov    0x4(%eax),%ecx
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 7f0:	83 c7 01             	add    $0x1,%edi
        if (p->s.size >= nunits) {
 7f3:	39 f9                	cmp    %edi,%ecx
 7f5:	0f 83 c5 00 00 00    	jae    8c0 <vmalloc+0x100>
 7fb:	be 00 10 00 00       	mov    $0x1000,%esi
 800:	ba 00 00 40 00       	mov    $0x400000,%edx
 805:	39 f7                	cmp    %esi,%edi
 807:	0f 43 f7             	cmovae %edi,%esi
 80a:	39 d7                	cmp    %edx,%edi
 80c:	0f 43 d7             	cmovae %edi,%edx
  p = sbrk(nu * sizeof(Header));
 80f:	8d 0c f5 00 00 00 00 	lea    0x0(,%esi,8),%ecx
 816:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 819:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
 820:	89 55 dc             	mov    %edx,-0x24(%ebp)
 823:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 826:	eb 15                	jmp    83d <vmalloc+0x7d>
 828:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82f:	90                   	nop
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 830:	8b 02                	mov    (%edx),%eax
        if (p->s.size >= nunits) {
 832:	8b 48 04             	mov    0x4(%eax),%ecx
 835:	39 f9                	cmp    %edi,%ecx
 837:	0f 83 83 00 00 00    	jae    8c0 <vmalloc+0x100>
        if (p == freep) {
 83d:	89 c2                	mov    %eax,%edx
 83f:	39 05 1c 0d 00 00    	cmp    %eax,0xd1c
 845:	75 e9                	jne    830 <vmalloc+0x70>
  if(use_huge_pages){
 847:	85 db                	test   %ebx,%ebx
 849:	74 45                	je     890 <vmalloc+0xd0>
  p = sbrk(nu * sizeof(Header));
 84b:	83 ec 0c             	sub    $0xc,%esp
 84e:	ff 75 e0             	push   -0x20(%ebp)
 851:	e8 15 fc ff ff       	call   46b <sbrk>
  if(p == (char*)-1)
 856:	83 c4 10             	add    $0x10,%esp
 859:	83 f8 ff             	cmp    $0xffffffff,%eax
 85c:	74 20                	je     87e <vmalloc+0xbe>
  hp->s.size = nu;
 85e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  vfree((void*)(hp + 1), use_huge_pages);
 861:	83 ec 08             	sub    $0x8,%esp
 864:	83 c0 08             	add    $0x8,%eax
  hp->s.size = nu;
 867:	89 48 fc             	mov    %ecx,-0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 86a:	53                   	push   %ebx
 86b:	50                   	push   %eax
 86c:	e8 8f fe ff ff       	call   700 <vfree>
  return use_huge_pages ? huge_freep : freep;
 871:	8b 15 10 0d 00 00    	mov    0xd10,%edx
 877:	83 c4 10             	add    $0x10,%esp
            if (p == 0) {
 87a:	85 d2                	test   %edx,%edx
 87c:	75 b2                	jne    830 <vmalloc+0x70>
}
 87e:	8d 65 f4             	lea    -0xc(%ebp),%esp
                return 0;
 881:	31 c0                	xor    %eax,%eax
}
 883:	5b                   	pop    %ebx
 884:	5e                   	pop    %esi
 885:	5f                   	pop    %edi
 886:	5d                   	pop    %ebp
 887:	c3                   	ret    
 888:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 88f:	90                   	nop
  p = sbrk(nu * sizeof(Header));
 890:	83 ec 0c             	sub    $0xc,%esp
 893:	ff 75 e4             	push   -0x1c(%ebp)
 896:	e8 d0 fb ff ff       	call   46b <sbrk>
  if(p == (char*)-1)
 89b:	83 c4 10             	add    $0x10,%esp
 89e:	83 f8 ff             	cmp    $0xffffffff,%eax
 8a1:	74 db                	je     87e <vmalloc+0xbe>
  hp->s.size = nu;
 8a3:	89 70 04             	mov    %esi,0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 8a6:	83 ec 08             	sub    $0x8,%esp
 8a9:	83 c0 08             	add    $0x8,%eax
 8ac:	6a 00                	push   $0x0
 8ae:	50                   	push   %eax
 8af:	e8 4c fe ff ff       	call   700 <vfree>
  return use_huge_pages ? huge_freep : freep;
 8b4:	8b 15 1c 0d 00 00    	mov    0xd1c,%edx
 8ba:	83 c4 10             	add    $0x10,%esp
 8bd:	eb bb                	jmp    87a <vmalloc+0xba>
 8bf:	90                   	nop
            if (p->s.size == nunits) {
 8c0:	39 cf                	cmp    %ecx,%edi
 8c2:	74 34                	je     8f8 <vmalloc+0x138>
                p->s.size -= nunits;
 8c4:	29 f9                	sub    %edi,%ecx
 8c6:	89 48 04             	mov    %ecx,0x4(%eax)
                p += p->s.size;
 8c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
                p->s.size = nunits;
 8cc:	89 78 04             	mov    %edi,0x4(%eax)
            freep = prevp;
 8cf:	89 15 1c 0d 00 00    	mov    %edx,0xd1c
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
        if ((prevp = freep) == 0) {
 8e0:	8b 15 1c 0d 00 00    	mov    0xd1c,%edx
 8e6:	85 d2                	test   %edx,%edx
 8e8:	0f 85 f4 fe ff ff    	jne    7e2 <vmalloc+0x22>
 8ee:	e9 32 f7 ff ff       	jmp    25 <vmalloc.cold+0x25>
 8f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8f7:	90                   	nop
                prevp->s.ptr = p->s.ptr;
 8f8:	8b 08                	mov    (%eax),%ecx
 8fa:	89 0a                	mov    %ecx,(%edx)
 8fc:	eb d1                	jmp    8cf <vmalloc+0x10f>
 8fe:	66 90                	xchg   %ax,%ax

00000900 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	53                   	push   %ebx
 904:	83 ec 04             	sub    $0x4,%esp
 907:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 90a:	e8 8c fb ff ff       	call   49b <getthp>


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
 90f:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 915:	76 19                	jbe    930 <malloc+0x30>
 917:	85 c0                	test   %eax,%eax
 919:	74 15                	je     930 <malloc+0x30>
    return vmalloc(nbytes, 1); // use the huge pages
 91b:	83 ec 08             	sub    $0x8,%esp
 91e:	6a 01                	push   $0x1
 920:	53                   	push   %ebx
 921:	e8 9a fe ff ff       	call   7c0 <vmalloc>
  }
  else{
    return vmalloc(nbytes, 0);
  }
}
 926:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 1); // use the huge pages
 929:	83 c4 10             	add    $0x10,%esp
}
 92c:	c9                   	leave  
 92d:	c3                   	ret    
 92e:	66 90                	xchg   %ax,%ax
    return vmalloc(nbytes, 0);
 930:	83 ec 08             	sub    $0x8,%esp
 933:	6a 00                	push   $0x0
 935:	53                   	push   %ebx
 936:	e8 85 fe ff ff       	call   7c0 <vmalloc>
}
 93b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 0);
 93e:	83 c4 10             	add    $0x10,%esp
}
 941:	c9                   	leave  
 942:	c3                   	ret    
 943:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000950 <free>:

void free(void * ap){
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
  vfree(ap, 0);
 953:	6a 00                	push   $0x0
 955:	ff 75 08             	push   0x8(%ebp)
 958:	e8 a3 fd ff ff       	call   700 <vfree>
}
 95d:	58                   	pop    %eax
 95e:	5a                   	pop    %edx
 95f:	c9                   	leave  
 960:	c3                   	ret    
