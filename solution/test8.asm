
_test8:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

#include "types.h"
#include "user.h"

int main(int argc, char* argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi

  int original_page_cnt[2];
  int page_cnt[2];
  if(procpgdirinfo(original_page_cnt) == -1) {
   f:	8d 45 d8             	lea    -0x28(%ebp),%eax
int main(int argc, char* argv[]) {
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 34             	sub    $0x34,%esp
  if(procpgdirinfo(original_page_cnt) == -1) {
  17:	50                   	push   %eax
  18:	e8 be 04 00 00       	call   4db <procpgdirinfo>
  1d:	83 c4 10             	add    $0x10,%esp
  20:	83 f8 ff             	cmp    $0xffffffff,%eax
  23:	0f 84 48 01 00 00    	je     171 <main+0x171>
    printf(1,"XV6_TEST_ERROR Error, procpgdirinfo returned -1\n");
  }
  // printf(1, "XV6_TEST_OUTPUT Start of program - base pages:%d huge pages:%d\n", original_page_cnt[0], original_page_cnt[1]);
  char* a = (char *)vmalloc(4194304,VMALLOC_SIZE_HUGE);
  29:	83 ec 08             	sub    $0x8,%esp
  memset(a, 0, 4194304);
  if(procpgdirinfo(page_cnt) == -1) {
  2c:	8d 5d e0             	lea    -0x20(%ebp),%ebx
  char* a = (char *)vmalloc(4194304,VMALLOC_SIZE_HUGE);
  2f:	68 00 00 40 00       	push   $0x400000
  34:	68 00 00 40 00       	push   $0x400000
  39:	e8 92 0a 00 00       	call   ad0 <vmalloc>
  memset(a, 0, 4194304);
  3e:	83 c4 0c             	add    $0xc,%esp
  41:	68 00 00 40 00       	push   $0x400000
  char* a = (char *)vmalloc(4194304,VMALLOC_SIZE_HUGE);
  46:	89 c7                	mov    %eax,%edi
  memset(a, 0, 4194304);
  48:	6a 00                	push   $0x0
  4a:	50                   	push   %eax
  4b:	e8 50 02 00 00       	call   2a0 <memset>
  if(procpgdirinfo(page_cnt) == -1) {
  50:	89 1c 24             	mov    %ebx,(%esp)
  53:	e8 83 04 00 00       	call   4db <procpgdirinfo>
  58:	83 c4 10             	add    $0x10,%esp
  5b:	83 f8 ff             	cmp    $0xffffffff,%eax
  5e:	0f 84 62 01 00 00    	je     1c6 <main+0x1c6>
    printf(1,"XV6_TEST_ERROR XV6_TEST_ERROR Error, procpgdirinfo returned -1\n");
  }
  printf(1, "XV6_TEST_OUTPUT After first vmalloc huge, 4 MB - program base pages:%d huge pages:%d\n", page_cnt[0] - original_page_cnt[0], page_cnt[1] - original_page_cnt[1]);
  64:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  67:	2b 45 dc             	sub    -0x24(%ebp),%eax
  6a:	50                   	push   %eax
  6b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  6e:	2b 45 d8             	sub    -0x28(%ebp),%eax
  71:	50                   	push   %eax
  72:	68 3c 0c 00 00       	push   $0xc3c
  77:	6a 01                	push   $0x1
  79:	e8 32 05 00 00       	call   5b0 <printf>

  char* b = (char *)vmalloc(100, VMALLOC_SIZE_BASE);
  7e:	5e                   	pop    %esi
  7f:	58                   	pop    %eax
  80:	68 00 10 00 00       	push   $0x1000
  85:	6a 64                	push   $0x64
  87:	e8 44 0a 00 00       	call   ad0 <vmalloc>
  memset(b, 0, 100);
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	6a 64                	push   $0x64
  char* b = (char *)vmalloc(100, VMALLOC_SIZE_BASE);
  91:	89 c6                	mov    %eax,%esi
  memset(b, 0, 100);
  93:	6a 00                	push   $0x0
  95:	50                   	push   %eax
  96:	e8 05 02 00 00       	call   2a0 <memset>
  if(procpgdirinfo(page_cnt) == -1) {
  9b:	89 1c 24             	mov    %ebx,(%esp)
  9e:	e8 38 04 00 00       	call   4db <procpgdirinfo>
  a3:	83 c4 10             	add    $0x10,%esp
  a6:	83 f8 ff             	cmp    $0xffffffff,%eax
  a9:	0f 84 01 01 00 00    	je     1b0 <main+0x1b0>
    printf(1,"XV6_TEST_ERROR Error, procpgdirinfo returned -1\n");
  }
  printf(1, "XV6_TEST_OUTPUT After second vmalloc, 100 bytes - program base pages:%d huge pages:%d\n", page_cnt[0] - original_page_cnt[0], page_cnt[1] - original_page_cnt[1]);
  af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  b2:	2b 45 dc             	sub    -0x24(%ebp),%eax
  b5:	50                   	push   %eax
  b6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  b9:	2b 45 d8             	sub    -0x28(%ebp),%eax
  bc:	50                   	push   %eax
  bd:	68 94 0c 00 00       	push   $0xc94
  c2:	6a 01                	push   $0x1
  c4:	e8 e7 04 00 00       	call   5b0 <printf>

  char* c = (char *)vmalloc(5000, VMALLOC_SIZE_BASE);
  c9:	58                   	pop    %eax
  ca:	5a                   	pop    %edx
  cb:	68 00 10 00 00       	push   $0x1000
  d0:	68 88 13 00 00       	push   $0x1388
  d5:	e8 f6 09 00 00       	call   ad0 <vmalloc>
  memset(c, 0, 5000);
  da:	83 c4 0c             	add    $0xc,%esp
  dd:	68 88 13 00 00       	push   $0x1388
  e2:	6a 00                	push   $0x0
  e4:	50                   	push   %eax
  char* c = (char *)vmalloc(5000, VMALLOC_SIZE_BASE);
  e5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(c, 0, 5000);
  e8:	e8 b3 01 00 00       	call   2a0 <memset>
  if(procpgdirinfo(page_cnt) == -1) {
  ed:	89 1c 24             	mov    %ebx,(%esp)
  f0:	e8 e6 03 00 00       	call   4db <procpgdirinfo>
  f5:	83 c4 10             	add    $0x10,%esp
  f8:	83 f8 ff             	cmp    $0xffffffff,%eax
  fb:	0f 84 99 00 00 00    	je     19a <main+0x19a>
    printf(1,"XV6_TEST_ERROR Error, procpgdirinfo returned -1\n");
  }
  printf(1, "XV6_TEST_OUTPUT After third vmalloc, 5000 bytes - program base pages:%d huge pages:%d\n", page_cnt[0] - original_page_cnt[0], page_cnt[1] - original_page_cnt[1]);
 101:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 104:	2b 45 dc             	sub    -0x24(%ebp),%eax
 107:	50                   	push   %eax
 108:	8b 45 e0             	mov    -0x20(%ebp),%eax
 10b:	2b 45 d8             	sub    -0x28(%ebp),%eax
 10e:	50                   	push   %eax
 10f:	68 ec 0c 00 00       	push   $0xcec
 114:	6a 01                	push   $0x1
 116:	e8 95 04 00 00       	call   5b0 <printf>

  printf(1, "XV6_TEST_OUTPUT Freeing vmalloc allocations\n");
 11b:	5a                   	pop    %edx
 11c:	59                   	pop    %ecx
 11d:	68 44 0d 00 00       	push   $0xd44
 122:	6a 01                	push   $0x1
 124:	e8 87 04 00 00       	call   5b0 <printf>
  vfree(a);
 129:	89 3c 24             	mov    %edi,(%esp)
 12c:	e8 ef 09 00 00       	call   b20 <vfree>
  vfree(b);
 131:	89 34 24             	mov    %esi,(%esp)
 134:	e8 e7 09 00 00       	call   b20 <vfree>
  vfree(c);
 139:	5e                   	pop    %esi
 13a:	ff 75 d4             	push   -0x2c(%ebp)
 13d:	e8 de 09 00 00       	call   b20 <vfree>
  if(procpgdirinfo(page_cnt) == -1) {
 142:	89 1c 24             	mov    %ebx,(%esp)
 145:	e8 91 03 00 00       	call   4db <procpgdirinfo>
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	83 f8 ff             	cmp    $0xffffffff,%eax
 150:	74 35                	je     187 <main+0x187>
    printf(1,"Error, procpgdirinfo returned -1\n");
  }
  printf(1, "XV6_TEST_OUTPUT After freeing data - program base pages:%d huge pages:%d\n", page_cnt[0] - original_page_cnt[0], page_cnt[1] - original_page_cnt[1]);
 152:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 155:	2b 45 dc             	sub    -0x24(%ebp),%eax
 158:	50                   	push   %eax
 159:	8b 45 e0             	mov    -0x20(%ebp),%eax
 15c:	2b 45 d8             	sub    -0x28(%ebp),%eax
 15f:	50                   	push   %eax
 160:	68 98 0d 00 00       	push   $0xd98
 165:	6a 01                	push   $0x1
 167:	e8 44 04 00 00       	call   5b0 <printf>
    exit();
 16c:	e8 c2 02 00 00       	call   433 <exit>
    printf(1,"XV6_TEST_ERROR Error, procpgdirinfo returned -1\n");
 171:	50                   	push   %eax
 172:	50                   	push   %eax
 173:	68 c8 0b 00 00       	push   $0xbc8
 178:	6a 01                	push   $0x1
 17a:	e8 31 04 00 00       	call   5b0 <printf>
 17f:	83 c4 10             	add    $0x10,%esp
 182:	e9 a2 fe ff ff       	jmp    29 <main+0x29>
    printf(1,"Error, procpgdirinfo returned -1\n");
 187:	50                   	push   %eax
 188:	50                   	push   %eax
 189:	68 74 0d 00 00       	push   $0xd74
 18e:	6a 01                	push   $0x1
 190:	e8 1b 04 00 00       	call   5b0 <printf>
 195:	83 c4 10             	add    $0x10,%esp
 198:	eb b8                	jmp    152 <main+0x152>
    printf(1,"XV6_TEST_ERROR Error, procpgdirinfo returned -1\n");
 19a:	50                   	push   %eax
 19b:	50                   	push   %eax
 19c:	68 c8 0b 00 00       	push   $0xbc8
 1a1:	6a 01                	push   $0x1
 1a3:	e8 08 04 00 00       	call   5b0 <printf>
 1a8:	83 c4 10             	add    $0x10,%esp
 1ab:	e9 51 ff ff ff       	jmp    101 <main+0x101>
    printf(1,"XV6_TEST_ERROR Error, procpgdirinfo returned -1\n");
 1b0:	51                   	push   %ecx
 1b1:	51                   	push   %ecx
 1b2:	68 c8 0b 00 00       	push   $0xbc8
 1b7:	6a 01                	push   $0x1
 1b9:	e8 f2 03 00 00       	call   5b0 <printf>
 1be:	83 c4 10             	add    $0x10,%esp
 1c1:	e9 e9 fe ff ff       	jmp    af <main+0xaf>
    printf(1,"XV6_TEST_ERROR XV6_TEST_ERROR Error, procpgdirinfo returned -1\n");
 1c6:	50                   	push   %eax
 1c7:	50                   	push   %eax
 1c8:	68 fc 0b 00 00       	push   $0xbfc
 1cd:	6a 01                	push   $0x1
 1cf:	e8 dc 03 00 00       	call   5b0 <printf>
 1d4:	83 c4 10             	add    $0x10,%esp
 1d7:	e9 88 fe ff ff       	jmp    64 <main+0x64>
 1dc:	66 90                	xchg   %ax,%ax
 1de:	66 90                	xchg   %ax,%ax

000001e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1e0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1e1:	31 c0                	xor    %eax,%eax
{
 1e3:	89 e5                	mov    %esp,%ebp
 1e5:	53                   	push   %ebx
 1e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1f7:	83 c0 01             	add    $0x1,%eax
 1fa:	84 d2                	test   %dl,%dl
 1fc:	75 f2                	jne    1f0 <strcpy+0x10>
    ;
  return os;
}
 1fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 201:	89 c8                	mov    %ecx,%eax
 203:	c9                   	leave  
 204:	c3                   	ret    
 205:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 55 08             	mov    0x8(%ebp),%edx
 217:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 21a:	0f b6 02             	movzbl (%edx),%eax
 21d:	84 c0                	test   %al,%al
 21f:	75 17                	jne    238 <strcmp+0x28>
 221:	eb 3a                	jmp    25d <strcmp+0x4d>
 223:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 227:	90                   	nop
 228:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 22c:	83 c2 01             	add    $0x1,%edx
 22f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 232:	84 c0                	test   %al,%al
 234:	74 1a                	je     250 <strcmp+0x40>
    p++, q++;
 236:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 238:	0f b6 19             	movzbl (%ecx),%ebx
 23b:	38 c3                	cmp    %al,%bl
 23d:	74 e9                	je     228 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 23f:	29 d8                	sub    %ebx,%eax
}
 241:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 244:	c9                   	leave  
 245:	c3                   	ret    
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 250:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 254:	31 c0                	xor    %eax,%eax
 256:	29 d8                	sub    %ebx,%eax
}
 258:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 25b:	c9                   	leave  
 25c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 25d:	0f b6 19             	movzbl (%ecx),%ebx
 260:	31 c0                	xor    %eax,%eax
 262:	eb db                	jmp    23f <strcmp+0x2f>
 264:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <strlen>:

uint
strlen(const char *s)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 276:	80 3a 00             	cmpb   $0x0,(%edx)
 279:	74 15                	je     290 <strlen+0x20>
 27b:	31 c0                	xor    %eax,%eax
 27d:	8d 76 00             	lea    0x0(%esi),%esi
 280:	83 c0 01             	add    $0x1,%eax
 283:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 287:	89 c1                	mov    %eax,%ecx
 289:	75 f5                	jne    280 <strlen+0x10>
    ;
  return n;
}
 28b:	89 c8                	mov    %ecx,%eax
 28d:	5d                   	pop    %ebp
 28e:	c3                   	ret    
 28f:	90                   	nop
  for(n = 0; s[n]; n++)
 290:	31 c9                	xor    %ecx,%ecx
}
 292:	5d                   	pop    %ebp
 293:	89 c8                	mov    %ecx,%eax
 295:	c3                   	ret    
 296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29d:	8d 76 00             	lea    0x0(%esi),%esi

000002a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ad:	89 d7                	mov    %edx,%edi
 2af:	fc                   	cld    
 2b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2b5:	89 d0                	mov    %edx,%eax
 2b7:	c9                   	leave  
 2b8:	c3                   	ret    
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002c0 <strchr>:

char*
strchr(const char *s, char c)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
 2c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ca:	0f b6 10             	movzbl (%eax),%edx
 2cd:	84 d2                	test   %dl,%dl
 2cf:	75 12                	jne    2e3 <strchr+0x23>
 2d1:	eb 1d                	jmp    2f0 <strchr+0x30>
 2d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d7:	90                   	nop
 2d8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2dc:	83 c0 01             	add    $0x1,%eax
 2df:	84 d2                	test   %dl,%dl
 2e1:	74 0d                	je     2f0 <strchr+0x30>
    if(*s == c)
 2e3:	38 d1                	cmp    %dl,%cl
 2e5:	75 f1                	jne    2d8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2e7:	5d                   	pop    %ebp
 2e8:	c3                   	ret    
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2f0:	31 c0                	xor    %eax,%eax
}
 2f2:	5d                   	pop    %ebp
 2f3:	c3                   	ret    
 2f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop

00000300 <gets>:

char*
gets(char *buf, int max)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 305:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 308:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 309:	31 db                	xor    %ebx,%ebx
{
 30b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 30e:	eb 27                	jmp    337 <gets+0x37>
    cc = read(0, &c, 1);
 310:	83 ec 04             	sub    $0x4,%esp
 313:	6a 01                	push   $0x1
 315:	57                   	push   %edi
 316:	6a 00                	push   $0x0
 318:	e8 2e 01 00 00       	call   44b <read>
    if(cc < 1)
 31d:	83 c4 10             	add    $0x10,%esp
 320:	85 c0                	test   %eax,%eax
 322:	7e 1d                	jle    341 <gets+0x41>
      break;
    buf[i++] = c;
 324:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 328:	8b 55 08             	mov    0x8(%ebp),%edx
 32b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 32f:	3c 0a                	cmp    $0xa,%al
 331:	74 1d                	je     350 <gets+0x50>
 333:	3c 0d                	cmp    $0xd,%al
 335:	74 19                	je     350 <gets+0x50>
  for(i=0; i+1 < max; ){
 337:	89 de                	mov    %ebx,%esi
 339:	83 c3 01             	add    $0x1,%ebx
 33c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 33f:	7c cf                	jl     310 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 341:	8b 45 08             	mov    0x8(%ebp),%eax
 344:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 348:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34b:	5b                   	pop    %ebx
 34c:	5e                   	pop    %esi
 34d:	5f                   	pop    %edi
 34e:	5d                   	pop    %ebp
 34f:	c3                   	ret    
  buf[i] = '\0';
 350:	8b 45 08             	mov    0x8(%ebp),%eax
 353:	89 de                	mov    %ebx,%esi
 355:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 359:	8d 65 f4             	lea    -0xc(%ebp),%esp
 35c:	5b                   	pop    %ebx
 35d:	5e                   	pop    %esi
 35e:	5f                   	pop    %edi
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    
 361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 368:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <stat>:

int
stat(const char *n, struct stat *st)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 375:	83 ec 08             	sub    $0x8,%esp
 378:	6a 00                	push   $0x0
 37a:	ff 75 08             	push   0x8(%ebp)
 37d:	e8 f1 00 00 00       	call   473 <open>
  if(fd < 0)
 382:	83 c4 10             	add    $0x10,%esp
 385:	85 c0                	test   %eax,%eax
 387:	78 27                	js     3b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 389:	83 ec 08             	sub    $0x8,%esp
 38c:	ff 75 0c             	push   0xc(%ebp)
 38f:	89 c3                	mov    %eax,%ebx
 391:	50                   	push   %eax
 392:	e8 f4 00 00 00       	call   48b <fstat>
  close(fd);
 397:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 39a:	89 c6                	mov    %eax,%esi
  close(fd);
 39c:	e8 ba 00 00 00       	call   45b <close>
  return r;
 3a1:	83 c4 10             	add    $0x10,%esp
}
 3a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3a7:	89 f0                	mov    %esi,%eax
 3a9:	5b                   	pop    %ebx
 3aa:	5e                   	pop    %esi
 3ab:	5d                   	pop    %ebp
 3ac:	c3                   	ret    
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3b5:	eb ed                	jmp    3a4 <stat+0x34>
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax

000003c0 <atoi>:

int
atoi(const char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	53                   	push   %ebx
 3c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3c7:	0f be 02             	movsbl (%edx),%eax
 3ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3d5:	77 1e                	ja     3f5 <atoi+0x35>
 3d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3de:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3e0:	83 c2 01             	add    $0x1,%edx
 3e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ea:	0f be 02             	movsbl (%edx),%eax
 3ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3f0:	80 fb 09             	cmp    $0x9,%bl
 3f3:	76 eb                	jbe    3e0 <atoi+0x20>
  return n;
}
 3f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3f8:	89 c8                	mov    %ecx,%eax
 3fa:	c9                   	leave  
 3fb:	c3                   	ret    
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000400 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	8b 45 10             	mov    0x10(%ebp),%eax
 407:	8b 55 08             	mov    0x8(%ebp),%edx
 40a:	56                   	push   %esi
 40b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 40e:	85 c0                	test   %eax,%eax
 410:	7e 13                	jle    425 <memmove+0x25>
 412:	01 d0                	add    %edx,%eax
  dst = vdst;
 414:	89 d7                	mov    %edx,%edi
 416:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 420:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 421:	39 f8                	cmp    %edi,%eax
 423:	75 fb                	jne    420 <memmove+0x20>
  return vdst;
}
 425:	5e                   	pop    %esi
 426:	89 d0                	mov    %edx,%eax
 428:	5f                   	pop    %edi
 429:	5d                   	pop    %ebp
 42a:	c3                   	ret    

0000042b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 42b:	b8 01 00 00 00       	mov    $0x1,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <exit>:
SYSCALL(exit)
 433:	b8 02 00 00 00       	mov    $0x2,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <wait>:
SYSCALL(wait)
 43b:	b8 03 00 00 00       	mov    $0x3,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <pipe>:
SYSCALL(pipe)
 443:	b8 04 00 00 00       	mov    $0x4,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <read>:
SYSCALL(read)
 44b:	b8 05 00 00 00       	mov    $0x5,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <write>:
SYSCALL(write)
 453:	b8 10 00 00 00       	mov    $0x10,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <close>:
SYSCALL(close)
 45b:	b8 15 00 00 00       	mov    $0x15,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <kill>:
SYSCALL(kill)
 463:	b8 06 00 00 00       	mov    $0x6,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <exec>:
SYSCALL(exec)
 46b:	b8 07 00 00 00       	mov    $0x7,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <open>:
SYSCALL(open)
 473:	b8 0f 00 00 00       	mov    $0xf,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <mknod>:
SYSCALL(mknod)
 47b:	b8 11 00 00 00       	mov    $0x11,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <unlink>:
SYSCALL(unlink)
 483:	b8 12 00 00 00       	mov    $0x12,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <fstat>:
SYSCALL(fstat)
 48b:	b8 08 00 00 00       	mov    $0x8,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <link>:
SYSCALL(link)
 493:	b8 13 00 00 00       	mov    $0x13,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <mkdir>:
SYSCALL(mkdir)
 49b:	b8 14 00 00 00       	mov    $0x14,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <chdir>:
SYSCALL(chdir)
 4a3:	b8 09 00 00 00       	mov    $0x9,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <dup>:
SYSCALL(dup)
 4ab:	b8 0a 00 00 00       	mov    $0xa,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <getpid>:
SYSCALL(getpid)
 4b3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <sbrk>:
SYSCALL(sbrk)
 4bb:	b8 0c 00 00 00       	mov    $0xc,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <sleep>:
SYSCALL(sleep)
 4c3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <uptime>:
SYSCALL(uptime)
 4cb:	b8 0e 00 00 00       	mov    $0xe,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <printhugepde>:
SYSCALL(printhugepde)
 4d3:	b8 16 00 00 00       	mov    $0x16,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 4db:	b8 17 00 00 00       	mov    $0x17,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <setthp>:
SYSCALL(setthp)
 4e3:	b8 18 00 00 00       	mov    $0x18,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <getthp>:
 4eb:	b8 19 00 00 00       	mov    $0x19,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    
 4f3:	66 90                	xchg   %ax,%ax
 4f5:	66 90                	xchg   %ax,%ax
 4f7:	66 90                	xchg   %ax,%ax
 4f9:	66 90                	xchg   %ax,%ax
 4fb:	66 90                	xchg   %ax,%ax
 4fd:	66 90                	xchg   %ax,%ax
 4ff:	90                   	nop

00000500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 3c             	sub    $0x3c,%esp
 509:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 50c:	89 d1                	mov    %edx,%ecx
{
 50e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 511:	85 d2                	test   %edx,%edx
 513:	0f 89 7f 00 00 00    	jns    598 <printint+0x98>
 519:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 51d:	74 79                	je     598 <printint+0x98>
    neg = 1;
 51f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 526:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 528:	31 db                	xor    %ebx,%ebx
 52a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 52d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 530:	89 c8                	mov    %ecx,%eax
 532:	31 d2                	xor    %edx,%edx
 534:	89 cf                	mov    %ecx,%edi
 536:	f7 75 c4             	divl   -0x3c(%ebp)
 539:	0f b6 92 44 0e 00 00 	movzbl 0xe44(%edx),%edx
 540:	89 45 c0             	mov    %eax,-0x40(%ebp)
 543:	89 d8                	mov    %ebx,%eax
 545:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 548:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 54b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 54e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 551:	76 dd                	jbe    530 <printint+0x30>
  if(neg)
 553:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 556:	85 c9                	test   %ecx,%ecx
 558:	74 0c                	je     566 <printint+0x66>
    buf[i++] = '-';
 55a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 55f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 561:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 566:	8b 7d b8             	mov    -0x48(%ebp),%edi
 569:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 56d:	eb 07                	jmp    576 <printint+0x76>
 56f:	90                   	nop
    putc(fd, buf[i]);
 570:	0f b6 13             	movzbl (%ebx),%edx
 573:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 576:	83 ec 04             	sub    $0x4,%esp
 579:	88 55 d7             	mov    %dl,-0x29(%ebp)
 57c:	6a 01                	push   $0x1
 57e:	56                   	push   %esi
 57f:	57                   	push   %edi
 580:	e8 ce fe ff ff       	call   453 <write>
  while(--i >= 0)
 585:	83 c4 10             	add    $0x10,%esp
 588:	39 de                	cmp    %ebx,%esi
 58a:	75 e4                	jne    570 <printint+0x70>
}
 58c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58f:	5b                   	pop    %ebx
 590:	5e                   	pop    %esi
 591:	5f                   	pop    %edi
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 598:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 59f:	eb 87                	jmp    528 <printint+0x28>
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop

000005b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	56                   	push   %esi
 5b5:	53                   	push   %ebx
 5b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5bc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5bf:	0f b6 13             	movzbl (%ebx),%edx
 5c2:	84 d2                	test   %dl,%dl
 5c4:	74 6a                	je     630 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5c6:	8d 45 10             	lea    0x10(%ebp),%eax
 5c9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5cc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5cf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d4:	eb 36                	jmp    60c <printf+0x5c>
 5d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
 5e0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5e3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5e8:	83 f8 25             	cmp    $0x25,%eax
 5eb:	74 15                	je     602 <printf+0x52>
  write(fd, &c, 1);
 5ed:	83 ec 04             	sub    $0x4,%esp
 5f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5f3:	6a 01                	push   $0x1
 5f5:	57                   	push   %edi
 5f6:	56                   	push   %esi
 5f7:	e8 57 fe ff ff       	call   453 <write>
 5fc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5ff:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 602:	0f b6 13             	movzbl (%ebx),%edx
 605:	83 c3 01             	add    $0x1,%ebx
 608:	84 d2                	test   %dl,%dl
 60a:	74 24                	je     630 <printf+0x80>
    c = fmt[i] & 0xff;
 60c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 60f:	85 c9                	test   %ecx,%ecx
 611:	74 cd                	je     5e0 <printf+0x30>
      }
    } else if(state == '%'){
 613:	83 f9 25             	cmp    $0x25,%ecx
 616:	75 ea                	jne    602 <printf+0x52>
      if(c == 'd'){
 618:	83 f8 25             	cmp    $0x25,%eax
 61b:	0f 84 07 01 00 00    	je     728 <printf+0x178>
 621:	83 e8 63             	sub    $0x63,%eax
 624:	83 f8 15             	cmp    $0x15,%eax
 627:	77 17                	ja     640 <printf+0x90>
 629:	ff 24 85 ec 0d 00 00 	jmp    *0xdec(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 630:	8d 65 f4             	lea    -0xc(%ebp),%esp
 633:	5b                   	pop    %ebx
 634:	5e                   	pop    %esi
 635:	5f                   	pop    %edi
 636:	5d                   	pop    %ebp
 637:	c3                   	ret    
 638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
 643:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 646:	6a 01                	push   $0x1
 648:	57                   	push   %edi
 649:	56                   	push   %esi
 64a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 64e:	e8 00 fe ff ff       	call   453 <write>
        putc(fd, c);
 653:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 657:	83 c4 0c             	add    $0xc,%esp
 65a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 65d:	6a 01                	push   $0x1
 65f:	57                   	push   %edi
 660:	56                   	push   %esi
 661:	e8 ed fd ff ff       	call   453 <write>
        putc(fd, c);
 666:	83 c4 10             	add    $0x10,%esp
      state = 0;
 669:	31 c9                	xor    %ecx,%ecx
 66b:	eb 95                	jmp    602 <printf+0x52>
 66d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 670:	83 ec 0c             	sub    $0xc,%esp
 673:	b9 10 00 00 00       	mov    $0x10,%ecx
 678:	6a 00                	push   $0x0
 67a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 67d:	8b 10                	mov    (%eax),%edx
 67f:	89 f0                	mov    %esi,%eax
 681:	e8 7a fe ff ff       	call   500 <printint>
        ap++;
 686:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 68a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 68d:	31 c9                	xor    %ecx,%ecx
 68f:	e9 6e ff ff ff       	jmp    602 <printf+0x52>
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 698:	8b 45 d0             	mov    -0x30(%ebp),%eax
 69b:	8b 10                	mov    (%eax),%edx
        ap++;
 69d:	83 c0 04             	add    $0x4,%eax
 6a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6a3:	85 d2                	test   %edx,%edx
 6a5:	0f 84 8d 00 00 00    	je     738 <printf+0x188>
        while(*s != 0){
 6ab:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6ae:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6b0:	84 c0                	test   %al,%al
 6b2:	0f 84 4a ff ff ff    	je     602 <printf+0x52>
 6b8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6bb:	89 d3                	mov    %edx,%ebx
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6c3:	83 c3 01             	add    $0x1,%ebx
 6c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6c9:	6a 01                	push   $0x1
 6cb:	57                   	push   %edi
 6cc:	56                   	push   %esi
 6cd:	e8 81 fd ff ff       	call   453 <write>
        while(*s != 0){
 6d2:	0f b6 03             	movzbl (%ebx),%eax
 6d5:	83 c4 10             	add    $0x10,%esp
 6d8:	84 c0                	test   %al,%al
 6da:	75 e4                	jne    6c0 <printf+0x110>
      state = 0;
 6dc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6df:	31 c9                	xor    %ecx,%ecx
 6e1:	e9 1c ff ff ff       	jmp    602 <printf+0x52>
 6e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6f0:	83 ec 0c             	sub    $0xc,%esp
 6f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f8:	6a 01                	push   $0x1
 6fa:	e9 7b ff ff ff       	jmp    67a <printf+0xca>
 6ff:	90                   	nop
        putc(fd, *ap);
 700:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 703:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 706:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 708:	6a 01                	push   $0x1
 70a:	57                   	push   %edi
 70b:	56                   	push   %esi
        putc(fd, *ap);
 70c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 70f:	e8 3f fd ff ff       	call   453 <write>
        ap++;
 714:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 718:	83 c4 10             	add    $0x10,%esp
      state = 0;
 71b:	31 c9                	xor    %ecx,%ecx
 71d:	e9 e0 fe ff ff       	jmp    602 <printf+0x52>
 722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 728:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 72b:	83 ec 04             	sub    $0x4,%esp
 72e:	e9 2a ff ff ff       	jmp    65d <printf+0xad>
 733:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 737:	90                   	nop
          s = "(null)";
 738:	ba e2 0d 00 00       	mov    $0xde2,%edx
        while(*s != 0){
 73d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 740:	b8 28 00 00 00       	mov    $0x28,%eax
 745:	89 d3                	mov    %edx,%ebx
 747:	e9 74 ff ff ff       	jmp    6c0 <printf+0x110>
 74c:	66 90                	xchg   %ax,%ax
 74e:	66 90                	xchg   %ax,%ax

00000750 <normalfree>:
  }
}

void
normalfree(void *ap)
{
 750:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	a1 68 12 00 00       	mov    0x1268,%eax
{
 756:	89 e5                	mov    %esp,%ebp
 758:	57                   	push   %edi
 759:	56                   	push   %esi
 75a:	53                   	push   %ebx
 75b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 75e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 768:	89 c2                	mov    %eax,%edx
 76a:	8b 00                	mov    (%eax),%eax
 76c:	39 ca                	cmp    %ecx,%edx
 76e:	73 30                	jae    7a0 <normalfree+0x50>
 770:	39 c1                	cmp    %eax,%ecx
 772:	72 04                	jb     778 <normalfree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 774:	39 c2                	cmp    %eax,%edx
 776:	72 f0                	jb     768 <normalfree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 778:	8b 73 fc             	mov    -0x4(%ebx),%esi
 77b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77e:	39 f8                	cmp    %edi,%eax
 780:	74 30                	je     7b2 <normalfree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 782:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 785:	8b 42 04             	mov    0x4(%edx),%eax
 788:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 78b:	39 f1                	cmp    %esi,%ecx
 78d:	74 3a                	je     7c9 <normalfree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 78f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 791:	5b                   	pop    %ebx
  freep = p;
 792:	89 15 68 12 00 00    	mov    %edx,0x1268
}
 798:	5e                   	pop    %esi
 799:	5f                   	pop    %edi
 79a:	5d                   	pop    %ebp
 79b:	c3                   	ret    
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a0:	39 c2                	cmp    %eax,%edx
 7a2:	72 c4                	jb     768 <normalfree+0x18>
 7a4:	39 c1                	cmp    %eax,%ecx
 7a6:	73 c0                	jae    768 <normalfree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ae:	39 f8                	cmp    %edi,%eax
 7b0:	75 d0                	jne    782 <normalfree+0x32>
    bp->s.size += p->s.ptr->s.size;
 7b2:	03 70 04             	add    0x4(%eax),%esi
 7b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b8:	8b 02                	mov    (%edx),%eax
 7ba:	8b 00                	mov    (%eax),%eax
 7bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bf:	8b 42 04             	mov    0x4(%edx),%eax
 7c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7c5:	39 f1                	cmp    %esi,%ecx
 7c7:	75 c6                	jne    78f <normalfree+0x3f>
    p->s.size += bp->s.size;
 7c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7cc:	89 15 68 12 00 00    	mov    %edx,0x1268
    p->s.size += bp->s.size;
 7d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7d5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7d8:	89 0a                	mov    %ecx,(%edx)
}
 7da:	5b                   	pop    %ebx
 7db:	5e                   	pop    %esi
 7dc:	5f                   	pop    %edi
 7dd:	5d                   	pop    %ebp
 7de:	c3                   	ret    
 7df:	90                   	nop

000007e0 <hugefree>:

void
hugefree(void *ap)
{
 7e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e1:	a1 5c 12 00 00       	mov    0x125c,%eax
{
 7e6:	89 e5                	mov    %esp,%ebp
 7e8:	57                   	push   %edi
 7e9:	56                   	push   %esi
 7ea:	53                   	push   %ebx
 7eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7f8:	89 c2                	mov    %eax,%edx
 7fa:	8b 00                	mov    (%eax),%eax
 7fc:	39 ca                	cmp    %ecx,%edx
 7fe:	73 30                	jae    830 <hugefree+0x50>
 800:	39 c1                	cmp    %eax,%ecx
 802:	72 04                	jb     808 <hugefree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 804:	39 c2                	cmp    %eax,%edx
 806:	72 f0                	jb     7f8 <hugefree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 808:	8b 73 fc             	mov    -0x4(%ebx),%esi
 80b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 80e:	39 f8                	cmp    %edi,%eax
 810:	74 30                	je     842 <hugefree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 812:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 815:	8b 42 04             	mov    0x4(%edx),%eax
 818:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 81b:	39 f1                	cmp    %esi,%ecx
 81d:	74 3a                	je     859 <hugefree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 81f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  huge_freep = p;
}
 821:	5b                   	pop    %ebx
  huge_freep = p;
 822:	89 15 5c 12 00 00    	mov    %edx,0x125c
}
 828:	5e                   	pop    %esi
 829:	5f                   	pop    %edi
 82a:	5d                   	pop    %ebp
 82b:	c3                   	ret    
 82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 830:	39 c2                	cmp    %eax,%edx
 832:	72 c4                	jb     7f8 <hugefree+0x18>
 834:	39 c1                	cmp    %eax,%ecx
 836:	73 c0                	jae    7f8 <hugefree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 838:	8b 73 fc             	mov    -0x4(%ebx),%esi
 83b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 83e:	39 f8                	cmp    %edi,%eax
 840:	75 d0                	jne    812 <hugefree+0x32>
    bp->s.size += p->s.ptr->s.size;
 842:	03 70 04             	add    0x4(%eax),%esi
 845:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 848:	8b 02                	mov    (%edx),%eax
 84a:	8b 00                	mov    (%eax),%eax
 84c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 84f:	8b 42 04             	mov    0x4(%edx),%eax
 852:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 855:	39 f1                	cmp    %esi,%ecx
 857:	75 c6                	jne    81f <hugefree+0x3f>
    p->s.size += bp->s.size;
 859:	03 43 fc             	add    -0x4(%ebx),%eax
  huge_freep = p;
 85c:	89 15 5c 12 00 00    	mov    %edx,0x125c
    p->s.size += bp->s.size;
 862:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 865:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 868:	89 0a                	mov    %ecx,(%edx)
}
 86a:	5b                   	pop    %ebx
 86b:	5e                   	pop    %esi
 86c:	5f                   	pop    %edi
 86d:	5d                   	pop    %ebp
 86e:	c3                   	ret    
 86f:	90                   	nop

00000870 <hugemalloc>:
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	57                   	push   %edi
 874:	56                   	push   %esi
 875:	53                   	push   %ebx
 876:	83 ec 1c             	sub    $0x1c,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 879:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = huge_freep) == 0){
 87c:	8b 3d 5c 12 00 00    	mov    0x125c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 882:	8d 70 07             	lea    0x7(%eax),%esi
 885:	c1 ee 03             	shr    $0x3,%esi
 888:	83 c6 01             	add    $0x1,%esi
  if((prevp = huge_freep) == 0){
 88b:	85 ff                	test   %edi,%edi
 88d:	0f 84 cd 00 00 00    	je     960 <hugemalloc+0xf0>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 893:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 895:	8b 4a 04             	mov    0x4(%edx),%ecx
 898:	39 f1                	cmp    %esi,%ecx
 89a:	0f 83 96 00 00 00    	jae    936 <hugemalloc+0xc6>
 8a0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 8a5:	89 f9                	mov    %edi,%ecx
 8a7:	39 de                	cmp    %ebx,%esi
 8a9:	0f 43 de             	cmovae %esi,%ebx
 8ac:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8b3:	89 df                	mov    %ebx,%edi
 8b5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8bb:	eb 14                	jmp    8d1 <hugemalloc+0x61>
 8bd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8c2:	8b 48 04             	mov    0x4(%eax),%ecx
 8c5:	39 f1                	cmp    %esi,%ecx
 8c7:	73 77                	jae    940 <hugemalloc+0xd0>
    if(p == huge_freep)
 8c9:	8b 0d 5c 12 00 00    	mov    0x125c,%ecx
 8cf:	89 c2                	mov    %eax,%edx
 8d1:	39 d1                	cmp    %edx,%ecx
 8d3:	75 eb                	jne    8c0 <hugemalloc+0x50>
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 8d5:	83 ec 08             	sub    $0x8,%esp
 8d8:	53                   	push   %ebx
 8d9:	ff 75 e4             	push   -0x1c(%ebp)
 8dc:	e8 da fb ff ff       	call   4bb <sbrk>
  if(p == (char*)-1)
 8e1:	83 c4 10             	add    $0x10,%esp
 8e4:	83 f8 ff             	cmp    $0xffffffff,%eax
 8e7:	74 31                	je     91a <hugemalloc+0xaa>
  hp->s.size = nu;
 8e9:	89 78 04             	mov    %edi,0x4(%eax)
  vfree((void*)(hp + 1));
 8ec:	8d 50 08             	lea    0x8(%eax),%edx

// vfree: free a block allocated by vmalloc
void vfree(void *ap) {
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 8ef:	2d f8 ff ff 1d       	sub    $0x1dfffff8,%eax
 8f4:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 8f9:	77 2d                	ja     928 <hugemalloc+0xb8>
    hugefree(ap);
 8fb:	83 ec 0c             	sub    $0xc,%esp
 8fe:	52                   	push   %edx
 8ff:	e8 dc fe ff ff       	call   7e0 <hugefree>
 904:	83 c4 10             	add    $0x10,%esp
    return huge_freep;
 907:	8b 15 5c 12 00 00    	mov    0x125c,%edx
 90d:	85 db                	test   %ebx,%ebx
 90f:	0f 44 15 68 12 00 00 	cmove  0x1268,%edx
      if((p = morecore(nunits, use_huge_pages)) == 0)
 916:	85 d2                	test   %edx,%edx
 918:	75 a6                	jne    8c0 <hugemalloc+0x50>
}
 91a:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 91d:	31 c0                	xor    %eax,%eax
}
 91f:	5b                   	pop    %ebx
 920:	5e                   	pop    %esi
 921:	5f                   	pop    %edi
 922:	5d                   	pop    %ebp
 923:	c3                   	ret    
 924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
  else {
    normalfree(ap);
 928:	83 ec 0c             	sub    $0xc,%esp
 92b:	52                   	push   %edx
 92c:	e8 1f fe ff ff       	call   750 <normalfree>
 931:	83 c4 10             	add    $0x10,%esp
 934:	eb d1                	jmp    907 <hugemalloc+0x97>
    if(p->s.size >= nunits){
 936:	89 d0                	mov    %edx,%eax
 938:	89 fa                	mov    %edi,%edx
 93a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 940:	39 ce                	cmp    %ecx,%esi
 942:	74 4c                	je     990 <hugemalloc+0x120>
        p->s.size -= nunits;
 944:	29 f1                	sub    %esi,%ecx
 946:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 949:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 94c:	89 70 04             	mov    %esi,0x4(%eax)
      huge_freep = prevp;
 94f:	89 15 5c 12 00 00    	mov    %edx,0x125c
}
 955:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 958:	83 c0 08             	add    $0x8,%eax
}
 95b:	5b                   	pop    %ebx
 95c:	5e                   	pop    %esi
 95d:	5f                   	pop    %edi
 95e:	5d                   	pop    %ebp
 95f:	c3                   	ret    
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 960:	c7 05 5c 12 00 00 60 	movl   $0x1260,0x125c
 967:	12 00 00 
    huge_base.s.size = 0;
 96a:	bf 60 12 00 00       	mov    $0x1260,%edi
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 96f:	c7 05 60 12 00 00 60 	movl   $0x1260,0x1260
 976:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 979:	89 fa                	mov    %edi,%edx
    huge_base.s.size = 0;
 97b:	c7 05 64 12 00 00 00 	movl   $0x0,0x1264
 982:	00 00 00 
    if(p->s.size >= nunits){
 985:	e9 16 ff ff ff       	jmp    8a0 <hugemalloc+0x30>
 98a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 990:	8b 08                	mov    (%eax),%ecx
 992:	89 0a                	mov    %ecx,(%edx)
 994:	eb b9                	jmp    94f <hugemalloc+0xdf>
 996:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 99d:	8d 76 00             	lea    0x0(%esi),%esi

000009a0 <normalmalloc>:
{
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
 9a3:	57                   	push   %edi
 9a4:	56                   	push   %esi
 9a5:	53                   	push   %ebx
 9a6:	83 ec 1c             	sub    $0x1c,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9ac:	8b 3d 68 12 00 00    	mov    0x1268,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9b2:	8d 70 07             	lea    0x7(%eax),%esi
 9b5:	c1 ee 03             	shr    $0x3,%esi
 9b8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 9bb:	85 ff                	test   %edi,%edi
 9bd:	0f 84 cd 00 00 00    	je     a90 <normalmalloc+0xf0>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 9c5:	8b 4a 04             	mov    0x4(%edx),%ecx
 9c8:	39 f1                	cmp    %esi,%ecx
 9ca:	0f 83 96 00 00 00    	jae    a66 <normalmalloc+0xc6>
 9d0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 9d5:	89 f9                	mov    %edi,%ecx
 9d7:	39 de                	cmp    %ebx,%esi
 9d9:	0f 43 de             	cmovae %esi,%ebx
 9dc:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9e3:	89 df                	mov    %ebx,%edi
 9e5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 9e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 9eb:	eb 14                	jmp    a01 <normalmalloc+0x61>
 9ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9f2:	8b 48 04             	mov    0x4(%eax),%ecx
 9f5:	39 f1                	cmp    %esi,%ecx
 9f7:	73 77                	jae    a70 <normalmalloc+0xd0>
    if(p == freep) {
 9f9:	8b 0d 68 12 00 00    	mov    0x1268,%ecx
 9ff:	89 c2                	mov    %eax,%edx
 a01:	39 d1                	cmp    %edx,%ecx
 a03:	75 eb                	jne    9f0 <normalmalloc+0x50>
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 a05:	83 ec 08             	sub    $0x8,%esp
 a08:	53                   	push   %ebx
 a09:	ff 75 e4             	push   -0x1c(%ebp)
 a0c:	e8 aa fa ff ff       	call   4bb <sbrk>
  if(p == (char*)-1)
 a11:	83 c4 10             	add    $0x10,%esp
 a14:	83 f8 ff             	cmp    $0xffffffff,%eax
 a17:	74 31                	je     a4a <normalmalloc+0xaa>
  hp->s.size = nu;
 a19:	89 78 04             	mov    %edi,0x4(%eax)
  vfree((void*)(hp + 1));
 a1c:	8d 50 08             	lea    0x8(%eax),%edx
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 a1f:	2d f8 ff ff 1d       	sub    $0x1dfffff8,%eax
 a24:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 a29:	77 2d                	ja     a58 <normalmalloc+0xb8>
    hugefree(ap);
 a2b:	83 ec 0c             	sub    $0xc,%esp
 a2e:	52                   	push   %edx
 a2f:	e8 ac fd ff ff       	call   7e0 <hugefree>
 a34:	83 c4 10             	add    $0x10,%esp
    return huge_freep;
 a37:	8b 15 5c 12 00 00    	mov    0x125c,%edx
 a3d:	85 db                	test   %ebx,%ebx
 a3f:	0f 44 15 68 12 00 00 	cmove  0x1268,%edx
      if((p = morecore(nunits, use_huge_pages)) == 0) {
 a46:	85 d2                	test   %edx,%edx
 a48:	75 a6                	jne    9f0 <normalmalloc+0x50>
}
 a4a:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a4d:	31 c0                	xor    %eax,%eax
}
 a4f:	5b                   	pop    %ebx
 a50:	5e                   	pop    %esi
 a51:	5f                   	pop    %edi
 a52:	5d                   	pop    %ebp
 a53:	c3                   	ret    
 a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    normalfree(ap);
 a58:	83 ec 0c             	sub    $0xc,%esp
 a5b:	52                   	push   %edx
 a5c:	e8 ef fc ff ff       	call   750 <normalfree>
 a61:	83 c4 10             	add    $0x10,%esp
 a64:	eb d1                	jmp    a37 <normalmalloc+0x97>
    if(p->s.size >= nunits){
 a66:	89 d0                	mov    %edx,%eax
 a68:	89 fa                	mov    %edi,%edx
 a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a70:	39 ce                	cmp    %ecx,%esi
 a72:	74 4c                	je     ac0 <normalmalloc+0x120>
        p->s.size -= nunits;
 a74:	29 f1                	sub    %esi,%ecx
 a76:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a79:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a7c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 a7f:	89 15 68 12 00 00    	mov    %edx,0x1268
}
 a85:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a88:	83 c0 08             	add    $0x8,%eax
}
 a8b:	5b                   	pop    %ebx
 a8c:	5e                   	pop    %esi
 a8d:	5f                   	pop    %edi
 a8e:	5d                   	pop    %ebp
 a8f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 a90:	c7 05 68 12 00 00 6c 	movl   $0x126c,0x1268
 a97:	12 00 00 
    base.s.size = 0;
 a9a:	bf 6c 12 00 00       	mov    $0x126c,%edi
    base.s.ptr = freep = prevp = &base;
 a9f:	c7 05 6c 12 00 00 6c 	movl   $0x126c,0x126c
 aa6:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 aab:	c7 05 70 12 00 00 00 	movl   $0x0,0x1270
 ab2:	00 00 00 
    if(p->s.size >= nunits){
 ab5:	e9 16 ff ff ff       	jmp    9d0 <normalmalloc+0x30>
 aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ac0:	8b 08                	mov    (%eax),%ecx
 ac2:	89 0a                	mov    %ecx,(%edx)
 ac4:	eb b9                	jmp    a7f <normalmalloc+0xdf>
 ac6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 acd:	8d 76 00             	lea    0x0(%esi),%esi

00000ad0 <vmalloc>:
void* vmalloc(uint nbytes, int pagesize) {
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
 ad3:	83 ec 08             	sub    $0x8,%esp
 ad6:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(pagesize == VMALLOC_SIZE_BASE) {
 ad9:	3d 00 10 00 00       	cmp    $0x1000,%eax
 ade:	74 18                	je     af8 <vmalloc+0x28>
  else if (pagesize == VMALLOC_SIZE_HUGE) {
 ae0:	3d 00 00 40 00       	cmp    $0x400000,%eax
 ae5:	75 1e                	jne    b05 <vmalloc+0x35>
    return hugemalloc(nbytes, use_huge_pages);
 ae7:	c7 45 0c 01 00 00 00 	movl   $0x1,0xc(%ebp)
}
 aee:	c9                   	leave  
    return hugemalloc(nbytes, use_huge_pages);
 aef:	e9 7c fd ff ff       	jmp    870 <hugemalloc>
 af4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return normalmalloc(nbytes, use_huge_pages);
 af8:	c7 45 0c 00 00 00 00 	movl   $0x0,0xc(%ebp)
}
 aff:	c9                   	leave  
    return normalmalloc(nbytes, use_huge_pages);
 b00:	e9 9b fe ff ff       	jmp    9a0 <normalmalloc>
    printf(1, "Please pass VMALLOC_SIZE_BASE or VMALLOC_SIZE_HUGE as flag.\n");
 b05:	50                   	push   %eax
 b06:	50                   	push   %eax
 b07:	68 58 0e 00 00       	push   $0xe58
 b0c:	6a 01                	push   $0x1
 b0e:	e8 9d fa ff ff       	call   5b0 <printf>
    exit();
 b13:	e8 1b f9 ff ff       	call   433 <exit>
 b18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b1f:	90                   	nop

00000b20 <vfree>:
void vfree(void *ap) {
 b20:	55                   	push   %ebp
 b21:	89 e5                	mov    %esp,%ebp
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 b23:	8b 45 08             	mov    0x8(%ebp),%eax
 b26:	2d 00 00 00 1e       	sub    $0x1e000000,%eax
 b2b:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 b30:	77 0e                	ja     b40 <vfree+0x20>
  }
}
 b32:	5d                   	pop    %ebp
    hugefree(ap);
 b33:	e9 a8 fc ff ff       	jmp    7e0 <hugefree>
 b38:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b3f:	90                   	nop
}
 b40:	5d                   	pop    %ebp
    normalfree(ap);
 b41:	e9 0a fc ff ff       	jmp    750 <normalfree>
 b46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b4d:	8d 76 00             	lea    0x0(%esi),%esi

00000b50 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	53                   	push   %ebx
 b54:	83 ec 04             	sub    $0x4,%esp
 b57:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 b5a:	e8 8c f9 ff ff       	call   4eb <getthp>

  if(nbytes >= 1048576 && thp != 0) { // only use huge pages if THP is active
 b5f:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 b65:	76 19                	jbe    b80 <malloc+0x30>
 b67:	85 c0                	test   %eax,%eax
 b69:	74 15                	je     b80 <malloc+0x30>
    return hugemalloc(nbytes, use_huge_pages);
 b6b:	83 ec 08             	sub    $0x8,%esp
 b6e:	6a 01                	push   $0x1
 b70:	53                   	push   %ebx
 b71:	e8 fa fc ff ff       	call   870 <hugemalloc>
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
  }
  else{
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
  }
}
 b76:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
 b79:	83 c4 10             	add    $0x10,%esp
}
 b7c:	c9                   	leave  
 b7d:	c3                   	ret    
 b7e:	66 90                	xchg   %ax,%ax
    return normalmalloc(nbytes, use_huge_pages);
 b80:	83 ec 08             	sub    $0x8,%esp
 b83:	6a 00                	push   $0x0
 b85:	53                   	push   %ebx
 b86:	e8 15 fe ff ff       	call   9a0 <normalmalloc>
}
 b8b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
 b8e:	83 c4 10             	add    $0x10,%esp
}
 b91:	c9                   	leave  
 b92:	c3                   	ret    
 b93:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ba0 <free>:

void free(void * ap){
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 ba3:	8b 45 08             	mov    0x8(%ebp),%eax
 ba6:	2d 00 00 00 1e       	sub    $0x1e000000,%eax
 bab:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 bb0:	77 0e                	ja     bc0 <free+0x20>
  vfree(ap);
}
 bb2:	5d                   	pop    %ebp
    hugefree(ap);
 bb3:	e9 28 fc ff ff       	jmp    7e0 <hugefree>
 bb8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 bbf:	90                   	nop
}
 bc0:	5d                   	pop    %ebp
    normalfree(ap);
 bc1:	e9 8a fb ff ff       	jmp    750 <normalfree>
