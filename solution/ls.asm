
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 1f                	jle    42 <main+0x42>
  23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  27:	90                   	nop
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  31:	e8 ca 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  36:	83 c4 10             	add    $0x10,%esp
  39:	39 de                	cmp    %ebx,%esi
  3b:	75 eb                	jne    28 <main+0x28>
  exit();
  3d:	e8 51 05 00 00       	call   593 <exit>
    ls(".");
  42:	83 ec 0c             	sub    $0xc,%esp
  45:	68 70 0d 00 00       	push   $0xd70
  4a:	e8 b1 00 00 00       	call   100 <ls>
    exit();
  4f:	e8 3f 05 00 00       	call   593 <exit>
  54:	66 90                	xchg   %ax,%ax
  56:	66 90                	xchg   %ax,%ax
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 5f 03 00 00       	call   3d0 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 c6                	cmp    %eax,%esi
  85:	77 0a                	ja     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  p++;
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 36 03 00 00       	call   3d0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 25 03 00 00       	call   3d0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 68 12 00 00       	push   $0x1268
  b5:	e8 a6 04 00 00       	call   560 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 0e 03 00 00       	call   3d0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb 68 12 00 00       	mov    $0x1268,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 ff 02 00 00       	call   3d0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 68 12 00 00       	add    $0x1268,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 17 03 00 00       	call   400 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <ls>:
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	81 ec 64 02 00 00    	sub    $0x264,%esp
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 bc 04 00 00       	call   5d3 <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 9e 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 122:	83 ec 08             	sub    $0x8,%esp
 125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12b:	89 c3                	mov    %eax,%ebx
 12d:	56                   	push   %esi
 12e:	50                   	push   %eax
 12f:	e8 b7 04 00 00       	call   5eb <fstat>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	0f 88 c1 01 00 00    	js     300 <ls+0x200>
  switch(st.type){
 13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 146:	66 83 f8 01          	cmp    $0x1,%ax
 14a:	74 64                	je     1b0 <ls+0xb0>
 14c:	66 83 f8 02          	cmp    $0x2,%ax
 150:	74 1e                	je     170 <ls+0x70>
  close(fd);
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	53                   	push   %ebx
 156:	e8 60 04 00 00       	call   5bb <close>
 15b:	83 c4 10             	add    $0x10,%esp
}
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 17f:	57                   	push   %edi
 180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 186:	e8 d5 fe ff ff       	call   60 <fmtname>
 18b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 191:	59                   	pop    %ecx
 192:	5f                   	pop    %edi
 193:	52                   	push   %edx
 194:	56                   	push   %esi
 195:	6a 02                	push   $0x2
 197:	50                   	push   %eax
 198:	68 50 0d 00 00       	push   $0xd50
 19d:	6a 01                	push   $0x1
 19f:	e8 6c 05 00 00       	call   710 <printf>
    break;
 1a4:	83 c4 20             	add    $0x20,%esp
 1a7:	eb a9                	jmp    152 <ls+0x52>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 17 02 00 00       	call   3d0 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 16 01 00 00    	ja     2e0 <ls+0x1e0>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 66 01 00 00       	call   340 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 ee 01 00 00       	call   3d0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 99 03 00 00       	call   5ab <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 34 ff ff ff    	jne    152 <ls+0x52>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 23a:	e8 21 03 00 00       	call   560 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 7e 02 00 00       	call   4d0 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 cb 00 00 00    	js     328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	83 ec 0c             	sub    $0xc,%esp
 260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 26c:	57                   	push   %edi
 26d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 27a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	5a                   	pop    %edx
 28c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 292:	59                   	pop    %ecx
 293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 299:	51                   	push   %ecx
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 50 0d 00 00       	push   $0xd50
 2a7:	6a 01                	push   $0x1
 2a9:	e8 62 04 00 00       	call   710 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 28 0d 00 00       	push   $0xd28
 2c9:	6a 02                	push   $0x2
 2cb:	e8 40 04 00 00       	call   710 <printf>
    return;
 2d0:	83 c4 10             	add    $0x10,%esp
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 5d 0d 00 00       	push   $0xd5d
 2e8:	6a 01                	push   $0x1
 2ea:	e8 21 04 00 00       	call   710 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 5b fe ff ff       	jmp    152 <ls+0x52>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 3c 0d 00 00       	push   $0xd3c
 309:	6a 02                	push   $0x2
 30b:	e8 00 04 00 00       	call   710 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 a3 02 00 00       	call   5bb <close>
    return;
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	57                   	push   %edi
 32c:	68 3c 0d 00 00       	push   $0xd3c
 331:	6a 01                	push   $0x1
 333:	e8 d8 03 00 00       	call   710 <printf>
        continue;
 338:	83 c4 10             	add    $0x10,%esp
 33b:	e9 c0 fe ff ff       	jmp    200 <ls+0x100>

00000340 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 340:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 341:	31 c0                	xor    %eax,%eax
{
 343:	89 e5                	mov    %esp,%ebp
 345:	53                   	push   %ebx
 346:	8b 4d 08             	mov    0x8(%ebp),%ecx
 349:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 357:	83 c0 01             	add    $0x1,%eax
 35a:	84 d2                	test   %dl,%dl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 361:	89 c8                	mov    %ecx,%eax
 363:	c9                   	leave  
 364:	c3                   	ret    
 365:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 55 08             	mov    0x8(%ebp),%edx
 377:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 37a:	0f b6 02             	movzbl (%edx),%eax
 37d:	84 c0                	test   %al,%al
 37f:	75 17                	jne    398 <strcmp+0x28>
 381:	eb 3a                	jmp    3bd <strcmp+0x4d>
 383:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 387:	90                   	nop
 388:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 38c:	83 c2 01             	add    $0x1,%edx
 38f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 392:	84 c0                	test   %al,%al
 394:	74 1a                	je     3b0 <strcmp+0x40>
    p++, q++;
 396:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 398:	0f b6 19             	movzbl (%ecx),%ebx
 39b:	38 c3                	cmp    %al,%bl
 39d:	74 e9                	je     388 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 39f:	29 d8                	sub    %ebx,%eax
}
 3a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a4:	c9                   	leave  
 3a5:	c3                   	ret    
 3a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 3b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3b4:	31 c0                	xor    %eax,%eax
 3b6:	29 d8                	sub    %ebx,%eax
}
 3b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3bb:	c9                   	leave  
 3bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 3bd:	0f b6 19             	movzbl (%ecx),%ebx
 3c0:	31 c0                	xor    %eax,%eax
 3c2:	eb db                	jmp    39f <strcmp+0x2f>
 3c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <strlen>:

uint
strlen(const char *s)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3d6:	80 3a 00             	cmpb   $0x0,(%edx)
 3d9:	74 15                	je     3f0 <strlen+0x20>
 3db:	31 c0                	xor    %eax,%eax
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
 3e0:	83 c0 01             	add    $0x1,%eax
 3e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3e7:	89 c1                	mov    %eax,%ecx
 3e9:	75 f5                	jne    3e0 <strlen+0x10>
    ;
  return n;
}
 3eb:	89 c8                	mov    %ecx,%eax
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret    
 3ef:	90                   	nop
  for(n = 0; s[n]; n++)
 3f0:	31 c9                	xor    %ecx,%ecx
}
 3f2:	5d                   	pop    %ebp
 3f3:	89 c8                	mov    %ecx,%eax
 3f5:	c3                   	ret    
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 407:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40a:	8b 45 0c             	mov    0xc(%ebp),%eax
 40d:	89 d7                	mov    %edx,%edi
 40f:	fc                   	cld    
 410:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 412:	8b 7d fc             	mov    -0x4(%ebp),%edi
 415:	89 d0                	mov    %edx,%eax
 417:	c9                   	leave  
 418:	c3                   	ret    
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 45 08             	mov    0x8(%ebp),%eax
 426:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 42a:	0f b6 10             	movzbl (%eax),%edx
 42d:	84 d2                	test   %dl,%dl
 42f:	75 12                	jne    443 <strchr+0x23>
 431:	eb 1d                	jmp    450 <strchr+0x30>
 433:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 437:	90                   	nop
 438:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 43c:	83 c0 01             	add    $0x1,%eax
 43f:	84 d2                	test   %dl,%dl
 441:	74 0d                	je     450 <strchr+0x30>
    if(*s == c)
 443:	38 d1                	cmp    %dl,%cl
 445:	75 f1                	jne    438 <strchr+0x18>
      return (char*)s;
  return 0;
}
 447:	5d                   	pop    %ebp
 448:	c3                   	ret    
 449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 450:	31 c0                	xor    %eax,%eax
}
 452:	5d                   	pop    %ebp
 453:	c3                   	ret    
 454:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 45f:	90                   	nop

00000460 <gets>:

char*
gets(char *buf, int max)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 465:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 468:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 469:	31 db                	xor    %ebx,%ebx
{
 46b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 46e:	eb 27                	jmp    497 <gets+0x37>
    cc = read(0, &c, 1);
 470:	83 ec 04             	sub    $0x4,%esp
 473:	6a 01                	push   $0x1
 475:	57                   	push   %edi
 476:	6a 00                	push   $0x0
 478:	e8 2e 01 00 00       	call   5ab <read>
    if(cc < 1)
 47d:	83 c4 10             	add    $0x10,%esp
 480:	85 c0                	test   %eax,%eax
 482:	7e 1d                	jle    4a1 <gets+0x41>
      break;
    buf[i++] = c;
 484:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 488:	8b 55 08             	mov    0x8(%ebp),%edx
 48b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 48f:	3c 0a                	cmp    $0xa,%al
 491:	74 1d                	je     4b0 <gets+0x50>
 493:	3c 0d                	cmp    $0xd,%al
 495:	74 19                	je     4b0 <gets+0x50>
  for(i=0; i+1 < max; ){
 497:	89 de                	mov    %ebx,%esi
 499:	83 c3 01             	add    $0x1,%ebx
 49c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 49f:	7c cf                	jl     470 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 4a1:	8b 45 08             	mov    0x8(%ebp),%eax
 4a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 4a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ab:	5b                   	pop    %ebx
 4ac:	5e                   	pop    %esi
 4ad:	5f                   	pop    %edi
 4ae:	5d                   	pop    %ebp
 4af:	c3                   	ret    
  buf[i] = '\0';
 4b0:	8b 45 08             	mov    0x8(%ebp),%eax
 4b3:	89 de                	mov    %ebx,%esi
 4b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 4b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bc:	5b                   	pop    %ebx
 4bd:	5e                   	pop    %esi
 4be:	5f                   	pop    %edi
 4bf:	5d                   	pop    %ebp
 4c0:	c3                   	ret    
 4c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cf:	90                   	nop

000004d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	56                   	push   %esi
 4d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d5:	83 ec 08             	sub    $0x8,%esp
 4d8:	6a 00                	push   $0x0
 4da:	ff 75 08             	push   0x8(%ebp)
 4dd:	e8 f1 00 00 00       	call   5d3 <open>
  if(fd < 0)
 4e2:	83 c4 10             	add    $0x10,%esp
 4e5:	85 c0                	test   %eax,%eax
 4e7:	78 27                	js     510 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	ff 75 0c             	push   0xc(%ebp)
 4ef:	89 c3                	mov    %eax,%ebx
 4f1:	50                   	push   %eax
 4f2:	e8 f4 00 00 00       	call   5eb <fstat>
  close(fd);
 4f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4fa:	89 c6                	mov    %eax,%esi
  close(fd);
 4fc:	e8 ba 00 00 00       	call   5bb <close>
  return r;
 501:	83 c4 10             	add    $0x10,%esp
}
 504:	8d 65 f8             	lea    -0x8(%ebp),%esp
 507:	89 f0                	mov    %esi,%eax
 509:	5b                   	pop    %ebx
 50a:	5e                   	pop    %esi
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    
 50d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 510:	be ff ff ff ff       	mov    $0xffffffff,%esi
 515:	eb ed                	jmp    504 <stat+0x34>
 517:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51e:	66 90                	xchg   %ax,%ax

00000520 <atoi>:

int
atoi(const char *s)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	53                   	push   %ebx
 524:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 527:	0f be 02             	movsbl (%edx),%eax
 52a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 52d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 530:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 535:	77 1e                	ja     555 <atoi+0x35>
 537:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 540:	83 c2 01             	add    $0x1,%edx
 543:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 546:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 54a:	0f be 02             	movsbl (%edx),%eax
 54d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 550:	80 fb 09             	cmp    $0x9,%bl
 553:	76 eb                	jbe    540 <atoi+0x20>
  return n;
}
 555:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 558:	89 c8                	mov    %ecx,%eax
 55a:	c9                   	leave  
 55b:	c3                   	ret    
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000560 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	8b 45 10             	mov    0x10(%ebp),%eax
 567:	8b 55 08             	mov    0x8(%ebp),%edx
 56a:	56                   	push   %esi
 56b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 56e:	85 c0                	test   %eax,%eax
 570:	7e 13                	jle    585 <memmove+0x25>
 572:	01 d0                	add    %edx,%eax
  dst = vdst;
 574:	89 d7                	mov    %edx,%edi
 576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 580:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 581:	39 f8                	cmp    %edi,%eax
 583:	75 fb                	jne    580 <memmove+0x20>
  return vdst;
}
 585:	5e                   	pop    %esi
 586:	89 d0                	mov    %edx,%eax
 588:	5f                   	pop    %edi
 589:	5d                   	pop    %ebp
 58a:	c3                   	ret    

0000058b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 58b:	b8 01 00 00 00       	mov    $0x1,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <exit>:
SYSCALL(exit)
 593:	b8 02 00 00 00       	mov    $0x2,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <wait>:
SYSCALL(wait)
 59b:	b8 03 00 00 00       	mov    $0x3,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <pipe>:
SYSCALL(pipe)
 5a3:	b8 04 00 00 00       	mov    $0x4,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <read>:
SYSCALL(read)
 5ab:	b8 05 00 00 00       	mov    $0x5,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <write>:
SYSCALL(write)
 5b3:	b8 10 00 00 00       	mov    $0x10,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <close>:
SYSCALL(close)
 5bb:	b8 15 00 00 00       	mov    $0x15,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <kill>:
SYSCALL(kill)
 5c3:	b8 06 00 00 00       	mov    $0x6,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <exec>:
SYSCALL(exec)
 5cb:	b8 07 00 00 00       	mov    $0x7,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <open>:
SYSCALL(open)
 5d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <mknod>:
SYSCALL(mknod)
 5db:	b8 11 00 00 00       	mov    $0x11,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <unlink>:
SYSCALL(unlink)
 5e3:	b8 12 00 00 00       	mov    $0x12,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <fstat>:
SYSCALL(fstat)
 5eb:	b8 08 00 00 00       	mov    $0x8,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <link>:
SYSCALL(link)
 5f3:	b8 13 00 00 00       	mov    $0x13,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <mkdir>:
SYSCALL(mkdir)
 5fb:	b8 14 00 00 00       	mov    $0x14,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <chdir>:
SYSCALL(chdir)
 603:	b8 09 00 00 00       	mov    $0x9,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <dup>:
SYSCALL(dup)
 60b:	b8 0a 00 00 00       	mov    $0xa,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <getpid>:
SYSCALL(getpid)
 613:	b8 0b 00 00 00       	mov    $0xb,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <sbrk>:
SYSCALL(sbrk)
 61b:	b8 0c 00 00 00       	mov    $0xc,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <sleep>:
SYSCALL(sleep)
 623:	b8 0d 00 00 00       	mov    $0xd,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <uptime>:
SYSCALL(uptime)
 62b:	b8 0e 00 00 00       	mov    $0xe,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <printhugepde>:
SYSCALL(printhugepde)
 633:	b8 16 00 00 00       	mov    $0x16,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 63b:	b8 17 00 00 00       	mov    $0x17,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <setthp>:
SYSCALL(setthp)
 643:	b8 18 00 00 00       	mov    $0x18,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <getthp>:
 64b:	b8 19 00 00 00       	mov    $0x19,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    
 653:	66 90                	xchg   %ax,%ax
 655:	66 90                	xchg   %ax,%ax
 657:	66 90                	xchg   %ax,%ax
 659:	66 90                	xchg   %ax,%ax
 65b:	66 90                	xchg   %ax,%ax
 65d:	66 90                	xchg   %ax,%ax
 65f:	90                   	nop

00000660 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 3c             	sub    $0x3c,%esp
 669:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 66c:	89 d1                	mov    %edx,%ecx
{
 66e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 671:	85 d2                	test   %edx,%edx
 673:	0f 89 7f 00 00 00    	jns    6f8 <printint+0x98>
 679:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 67d:	74 79                	je     6f8 <printint+0x98>
    neg = 1;
 67f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 686:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 688:	31 db                	xor    %ebx,%ebx
 68a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 68d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 690:	89 c8                	mov    %ecx,%eax
 692:	31 d2                	xor    %edx,%edx
 694:	89 cf                	mov    %ecx,%edi
 696:	f7 75 c4             	divl   -0x3c(%ebp)
 699:	0f b6 92 d4 0d 00 00 	movzbl 0xdd4(%edx),%edx
 6a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6a3:	89 d8                	mov    %ebx,%eax
 6a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 6a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 6ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 6b1:	76 dd                	jbe    690 <printint+0x30>
  if(neg)
 6b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 6b6:	85 c9                	test   %ecx,%ecx
 6b8:	74 0c                	je     6c6 <printint+0x66>
    buf[i++] = '-';
 6ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 6bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 6c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 6c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 6c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6cd:	eb 07                	jmp    6d6 <printint+0x76>
 6cf:	90                   	nop
    putc(fd, buf[i]);
 6d0:	0f b6 13             	movzbl (%ebx),%edx
 6d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6d6:	83 ec 04             	sub    $0x4,%esp
 6d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6dc:	6a 01                	push   $0x1
 6de:	56                   	push   %esi
 6df:	57                   	push   %edi
 6e0:	e8 ce fe ff ff       	call   5b3 <write>
  while(--i >= 0)
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	39 de                	cmp    %ebx,%esi
 6ea:	75 e4                	jne    6d0 <printint+0x70>
}
 6ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ef:	5b                   	pop    %ebx
 6f0:	5e                   	pop    %esi
 6f1:	5f                   	pop    %edi
 6f2:	5d                   	pop    %ebp
 6f3:	c3                   	ret    
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6ff:	eb 87                	jmp    688 <printint+0x28>
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 708:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop

00000710 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	53                   	push   %ebx
 716:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 719:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 71c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 71f:	0f b6 13             	movzbl (%ebx),%edx
 722:	84 d2                	test   %dl,%dl
 724:	74 6a                	je     790 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 726:	8d 45 10             	lea    0x10(%ebp),%eax
 729:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 72c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 72f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 731:	89 45 d0             	mov    %eax,-0x30(%ebp)
 734:	eb 36                	jmp    76c <printf+0x5c>
 736:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73d:	8d 76 00             	lea    0x0(%esi),%esi
 740:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 743:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 748:	83 f8 25             	cmp    $0x25,%eax
 74b:	74 15                	je     762 <printf+0x52>
  write(fd, &c, 1);
 74d:	83 ec 04             	sub    $0x4,%esp
 750:	88 55 e7             	mov    %dl,-0x19(%ebp)
 753:	6a 01                	push   $0x1
 755:	57                   	push   %edi
 756:	56                   	push   %esi
 757:	e8 57 fe ff ff       	call   5b3 <write>
 75c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 75f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 762:	0f b6 13             	movzbl (%ebx),%edx
 765:	83 c3 01             	add    $0x1,%ebx
 768:	84 d2                	test   %dl,%dl
 76a:	74 24                	je     790 <printf+0x80>
    c = fmt[i] & 0xff;
 76c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 76f:	85 c9                	test   %ecx,%ecx
 771:	74 cd                	je     740 <printf+0x30>
      }
    } else if(state == '%'){
 773:	83 f9 25             	cmp    $0x25,%ecx
 776:	75 ea                	jne    762 <printf+0x52>
      if(c == 'd'){
 778:	83 f8 25             	cmp    $0x25,%eax
 77b:	0f 84 07 01 00 00    	je     888 <printf+0x178>
 781:	83 e8 63             	sub    $0x63,%eax
 784:	83 f8 15             	cmp    $0x15,%eax
 787:	77 17                	ja     7a0 <printf+0x90>
 789:	ff 24 85 7c 0d 00 00 	jmp    *0xd7c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 790:	8d 65 f4             	lea    -0xc(%ebp),%esp
 793:	5b                   	pop    %ebx
 794:	5e                   	pop    %esi
 795:	5f                   	pop    %edi
 796:	5d                   	pop    %ebp
 797:	c3                   	ret    
 798:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
  write(fd, &c, 1);
 7a0:	83 ec 04             	sub    $0x4,%esp
 7a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 7a6:	6a 01                	push   $0x1
 7a8:	57                   	push   %edi
 7a9:	56                   	push   %esi
 7aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7ae:	e8 00 fe ff ff       	call   5b3 <write>
        putc(fd, c);
 7b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 7b7:	83 c4 0c             	add    $0xc,%esp
 7ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7bd:	6a 01                	push   $0x1
 7bf:	57                   	push   %edi
 7c0:	56                   	push   %esi
 7c1:	e8 ed fd ff ff       	call   5b3 <write>
        putc(fd, c);
 7c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7c9:	31 c9                	xor    %ecx,%ecx
 7cb:	eb 95                	jmp    762 <printf+0x52>
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7d0:	83 ec 0c             	sub    $0xc,%esp
 7d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7d8:	6a 00                	push   $0x0
 7da:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7dd:	8b 10                	mov    (%eax),%edx
 7df:	89 f0                	mov    %esi,%eax
 7e1:	e8 7a fe ff ff       	call   660 <printint>
        ap++;
 7e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ed:	31 c9                	xor    %ecx,%ecx
 7ef:	e9 6e ff ff ff       	jmp    762 <printf+0x52>
 7f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 7f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7fb:	8b 10                	mov    (%eax),%edx
        ap++;
 7fd:	83 c0 04             	add    $0x4,%eax
 800:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 803:	85 d2                	test   %edx,%edx
 805:	0f 84 8d 00 00 00    	je     898 <printf+0x188>
        while(*s != 0){
 80b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 80e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 810:	84 c0                	test   %al,%al
 812:	0f 84 4a ff ff ff    	je     762 <printf+0x52>
 818:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 81b:	89 d3                	mov    %edx,%ebx
 81d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 820:	83 ec 04             	sub    $0x4,%esp
          s++;
 823:	83 c3 01             	add    $0x1,%ebx
 826:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 829:	6a 01                	push   $0x1
 82b:	57                   	push   %edi
 82c:	56                   	push   %esi
 82d:	e8 81 fd ff ff       	call   5b3 <write>
        while(*s != 0){
 832:	0f b6 03             	movzbl (%ebx),%eax
 835:	83 c4 10             	add    $0x10,%esp
 838:	84 c0                	test   %al,%al
 83a:	75 e4                	jne    820 <printf+0x110>
      state = 0;
 83c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 83f:	31 c9                	xor    %ecx,%ecx
 841:	e9 1c ff ff ff       	jmp    762 <printf+0x52>
 846:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 850:	83 ec 0c             	sub    $0xc,%esp
 853:	b9 0a 00 00 00       	mov    $0xa,%ecx
 858:	6a 01                	push   $0x1
 85a:	e9 7b ff ff ff       	jmp    7da <printf+0xca>
 85f:	90                   	nop
        putc(fd, *ap);
 860:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 863:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 866:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 868:	6a 01                	push   $0x1
 86a:	57                   	push   %edi
 86b:	56                   	push   %esi
        putc(fd, *ap);
 86c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 86f:	e8 3f fd ff ff       	call   5b3 <write>
        ap++;
 874:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 878:	83 c4 10             	add    $0x10,%esp
      state = 0;
 87b:	31 c9                	xor    %ecx,%ecx
 87d:	e9 e0 fe ff ff       	jmp    762 <printf+0x52>
 882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 888:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 88b:	83 ec 04             	sub    $0x4,%esp
 88e:	e9 2a ff ff ff       	jmp    7bd <printf+0xad>
 893:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 897:	90                   	nop
          s = "(null)";
 898:	ba 72 0d 00 00       	mov    $0xd72,%edx
        while(*s != 0){
 89d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8a0:	b8 28 00 00 00       	mov    $0x28,%eax
 8a5:	89 d3                	mov    %edx,%ebx
 8a7:	e9 74 ff ff ff       	jmp    820 <printf+0x110>
 8ac:	66 90                	xchg   %ax,%ax
 8ae:	66 90                	xchg   %ax,%ax

000008b0 <normalfree>:
  }
}

void
normalfree(void *ap)
{
 8b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b1:	a1 84 12 00 00       	mov    0x1284,%eax
{
 8b6:	89 e5                	mov    %esp,%ebp
 8b8:	57                   	push   %edi
 8b9:	56                   	push   %esi
 8ba:	53                   	push   %ebx
 8bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8c8:	89 c2                	mov    %eax,%edx
 8ca:	8b 00                	mov    (%eax),%eax
 8cc:	39 ca                	cmp    %ecx,%edx
 8ce:	73 30                	jae    900 <normalfree+0x50>
 8d0:	39 c1                	cmp    %eax,%ecx
 8d2:	72 04                	jb     8d8 <normalfree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d4:	39 c2                	cmp    %eax,%edx
 8d6:	72 f0                	jb     8c8 <normalfree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8de:	39 f8                	cmp    %edi,%eax
 8e0:	74 30                	je     912 <normalfree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 8e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8e5:	8b 42 04             	mov    0x4(%edx),%eax
 8e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8eb:	39 f1                	cmp    %esi,%ecx
 8ed:	74 3a                	je     929 <normalfree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 8ef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8f1:	5b                   	pop    %ebx
  freep = p;
 8f2:	89 15 84 12 00 00    	mov    %edx,0x1284
}
 8f8:	5e                   	pop    %esi
 8f9:	5f                   	pop    %edi
 8fa:	5d                   	pop    %ebp
 8fb:	c3                   	ret    
 8fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 900:	39 c2                	cmp    %eax,%edx
 902:	72 c4                	jb     8c8 <normalfree+0x18>
 904:	39 c1                	cmp    %eax,%ecx
 906:	73 c0                	jae    8c8 <normalfree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 908:	8b 73 fc             	mov    -0x4(%ebx),%esi
 90b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 90e:	39 f8                	cmp    %edi,%eax
 910:	75 d0                	jne    8e2 <normalfree+0x32>
    bp->s.size += p->s.ptr->s.size;
 912:	03 70 04             	add    0x4(%eax),%esi
 915:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 918:	8b 02                	mov    (%edx),%eax
 91a:	8b 00                	mov    (%eax),%eax
 91c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 91f:	8b 42 04             	mov    0x4(%edx),%eax
 922:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 925:	39 f1                	cmp    %esi,%ecx
 927:	75 c6                	jne    8ef <normalfree+0x3f>
    p->s.size += bp->s.size;
 929:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 92c:	89 15 84 12 00 00    	mov    %edx,0x1284
    p->s.size += bp->s.size;
 932:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 935:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 938:	89 0a                	mov    %ecx,(%edx)
}
 93a:	5b                   	pop    %ebx
 93b:	5e                   	pop    %esi
 93c:	5f                   	pop    %edi
 93d:	5d                   	pop    %ebp
 93e:	c3                   	ret    
 93f:	90                   	nop

00000940 <hugefree>:

void
hugefree(void *ap)
{
 940:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 941:	a1 78 12 00 00       	mov    0x1278,%eax
{
 946:	89 e5                	mov    %esp,%ebp
 948:	57                   	push   %edi
 949:	56                   	push   %esi
 94a:	53                   	push   %ebx
 94b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 94e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = huge_freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 958:	89 c2                	mov    %eax,%edx
 95a:	8b 00                	mov    (%eax),%eax
 95c:	39 ca                	cmp    %ecx,%edx
 95e:	73 30                	jae    990 <hugefree+0x50>
 960:	39 c1                	cmp    %eax,%ecx
 962:	72 04                	jb     968 <hugefree+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 964:	39 c2                	cmp    %eax,%edx
 966:	72 f0                	jb     958 <hugefree+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 968:	8b 73 fc             	mov    -0x4(%ebx),%esi
 96b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 96e:	39 f8                	cmp    %edi,%eax
 970:	74 30                	je     9a2 <hugefree+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 972:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 975:	8b 42 04             	mov    0x4(%edx),%eax
 978:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 97b:	39 f1                	cmp    %esi,%ecx
 97d:	74 3a                	je     9b9 <hugefree+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 97f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  huge_freep = p;
}
 981:	5b                   	pop    %ebx
  huge_freep = p;
 982:	89 15 78 12 00 00    	mov    %edx,0x1278
}
 988:	5e                   	pop    %esi
 989:	5f                   	pop    %edi
 98a:	5d                   	pop    %ebp
 98b:	c3                   	ret    
 98c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 990:	39 c2                	cmp    %eax,%edx
 992:	72 c4                	jb     958 <hugefree+0x18>
 994:	39 c1                	cmp    %eax,%ecx
 996:	73 c0                	jae    958 <hugefree+0x18>
  if(bp + bp->s.size == p->s.ptr){
 998:	8b 73 fc             	mov    -0x4(%ebx),%esi
 99b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 99e:	39 f8                	cmp    %edi,%eax
 9a0:	75 d0                	jne    972 <hugefree+0x32>
    bp->s.size += p->s.ptr->s.size;
 9a2:	03 70 04             	add    0x4(%eax),%esi
 9a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9a8:	8b 02                	mov    (%edx),%eax
 9aa:	8b 00                	mov    (%eax),%eax
 9ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 9af:	8b 42 04             	mov    0x4(%edx),%eax
 9b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9b5:	39 f1                	cmp    %esi,%ecx
 9b7:	75 c6                	jne    97f <hugefree+0x3f>
    p->s.size += bp->s.size;
 9b9:	03 43 fc             	add    -0x4(%ebx),%eax
  huge_freep = p;
 9bc:	89 15 78 12 00 00    	mov    %edx,0x1278
    p->s.size += bp->s.size;
 9c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 9c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9c8:	89 0a                	mov    %ecx,(%edx)
}
 9ca:	5b                   	pop    %ebx
 9cb:	5e                   	pop    %esi
 9cc:	5f                   	pop    %edi
 9cd:	5d                   	pop    %ebp
 9ce:	c3                   	ret    
 9cf:	90                   	nop

000009d0 <hugemalloc>:
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	57                   	push   %edi
 9d4:	56                   	push   %esi
 9d5:	53                   	push   %ebx
 9d6:	83 ec 1c             	sub    $0x1c,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = huge_freep) == 0){
 9dc:	8b 3d 78 12 00 00    	mov    0x1278,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e2:	8d 70 07             	lea    0x7(%eax),%esi
 9e5:	c1 ee 03             	shr    $0x3,%esi
 9e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = huge_freep) == 0){
 9eb:	85 ff                	test   %edi,%edi
 9ed:	0f 84 cd 00 00 00    	je     ac0 <hugemalloc+0xf0>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 9f5:	8b 4a 04             	mov    0x4(%edx),%ecx
 9f8:	39 f1                	cmp    %esi,%ecx
 9fa:	0f 83 96 00 00 00    	jae    a96 <hugemalloc+0xc6>
 a00:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 a05:	89 f9                	mov    %edi,%ecx
 a07:	39 de                	cmp    %ebx,%esi
 a09:	0f 43 de             	cmovae %esi,%ebx
 a0c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a13:	89 df                	mov    %ebx,%edi
 a15:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 a18:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a1b:	eb 14                	jmp    a31 <hugemalloc+0x61>
 a1d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a20:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a22:	8b 48 04             	mov    0x4(%eax),%ecx
 a25:	39 f1                	cmp    %esi,%ecx
 a27:	73 77                	jae    aa0 <hugemalloc+0xd0>
    if(p == huge_freep)
 a29:	8b 0d 78 12 00 00    	mov    0x1278,%ecx
 a2f:	89 c2                	mov    %eax,%edx
 a31:	39 d1                	cmp    %edx,%ecx
 a33:	75 eb                	jne    a20 <hugemalloc+0x50>
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 a35:	83 ec 08             	sub    $0x8,%esp
 a38:	53                   	push   %ebx
 a39:	ff 75 e4             	push   -0x1c(%ebp)
 a3c:	e8 da fb ff ff       	call   61b <sbrk>
  if(p == (char*)-1)
 a41:	83 c4 10             	add    $0x10,%esp
 a44:	83 f8 ff             	cmp    $0xffffffff,%eax
 a47:	74 31                	je     a7a <hugemalloc+0xaa>
  hp->s.size = nu;
 a49:	89 78 04             	mov    %edi,0x4(%eax)
  vfree((void*)(hp + 1));
 a4c:	8d 50 08             	lea    0x8(%eax),%edx

// vfree: free a block allocated by vmalloc
void vfree(void *ap) {
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 a4f:	2d f8 ff ff 1d       	sub    $0x1dfffff8,%eax
 a54:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 a59:	77 2d                	ja     a88 <hugemalloc+0xb8>
    hugefree(ap);
 a5b:	83 ec 0c             	sub    $0xc,%esp
 a5e:	52                   	push   %edx
 a5f:	e8 dc fe ff ff       	call   940 <hugefree>
 a64:	83 c4 10             	add    $0x10,%esp
    return huge_freep;
 a67:	8b 15 78 12 00 00    	mov    0x1278,%edx
 a6d:	85 db                	test   %ebx,%ebx
 a6f:	0f 44 15 84 12 00 00 	cmove  0x1284,%edx
      if((p = morecore(nunits, use_huge_pages)) == 0)
 a76:	85 d2                	test   %edx,%edx
 a78:	75 a6                	jne    a20 <hugemalloc+0x50>
}
 a7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a7d:	31 c0                	xor    %eax,%eax
}
 a7f:	5b                   	pop    %ebx
 a80:	5e                   	pop    %esi
 a81:	5f                   	pop    %edi
 a82:	5d                   	pop    %ebp
 a83:	c3                   	ret    
 a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
  else {
    normalfree(ap);
 a88:	83 ec 0c             	sub    $0xc,%esp
 a8b:	52                   	push   %edx
 a8c:	e8 1f fe ff ff       	call   8b0 <normalfree>
 a91:	83 c4 10             	add    $0x10,%esp
 a94:	eb d1                	jmp    a67 <hugemalloc+0x97>
    if(p->s.size >= nunits){
 a96:	89 d0                	mov    %edx,%eax
 a98:	89 fa                	mov    %edi,%edx
 a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 aa0:	39 ce                	cmp    %ecx,%esi
 aa2:	74 4c                	je     af0 <hugemalloc+0x120>
        p->s.size -= nunits;
 aa4:	29 f1                	sub    %esi,%ecx
 aa6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 aa9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 aac:	89 70 04             	mov    %esi,0x4(%eax)
      huge_freep = prevp;
 aaf:	89 15 78 12 00 00    	mov    %edx,0x1278
}
 ab5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 ab8:	83 c0 08             	add    $0x8,%eax
}
 abb:	5b                   	pop    %ebx
 abc:	5e                   	pop    %esi
 abd:	5f                   	pop    %edi
 abe:	5d                   	pop    %ebp
 abf:	c3                   	ret    
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 ac0:	c7 05 78 12 00 00 7c 	movl   $0x127c,0x1278
 ac7:	12 00 00 
    huge_base.s.size = 0;
 aca:	bf 7c 12 00 00       	mov    $0x127c,%edi
    huge_base.s.ptr = huge_freep = prevp = &huge_base;
 acf:	c7 05 7c 12 00 00 7c 	movl   $0x127c,0x127c
 ad6:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad9:	89 fa                	mov    %edi,%edx
    huge_base.s.size = 0;
 adb:	c7 05 80 12 00 00 00 	movl   $0x0,0x1280
 ae2:	00 00 00 
    if(p->s.size >= nunits){
 ae5:	e9 16 ff ff ff       	jmp    a00 <hugemalloc+0x30>
 aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 af0:	8b 08                	mov    (%eax),%ecx
 af2:	89 0a                	mov    %ecx,(%edx)
 af4:	eb b9                	jmp    aaf <hugemalloc+0xdf>
 af6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 afd:	8d 76 00             	lea    0x0(%esi),%esi

00000b00 <normalmalloc>:
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	57                   	push   %edi
 b04:	56                   	push   %esi
 b05:	53                   	push   %ebx
 b06:	83 ec 1c             	sub    $0x1c,%esp
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b09:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b0c:	8b 3d 84 12 00 00    	mov    0x1284,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b12:	8d 70 07             	lea    0x7(%eax),%esi
 b15:	c1 ee 03             	shr    $0x3,%esi
 b18:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b1b:	85 ff                	test   %edi,%edi
 b1d:	0f 84 cd 00 00 00    	je     bf0 <normalmalloc+0xf0>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b23:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 b25:	8b 4a 04             	mov    0x4(%edx),%ecx
 b28:	39 f1                	cmp    %esi,%ecx
 b2a:	0f 83 96 00 00 00    	jae    bc6 <normalmalloc+0xc6>
 b30:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 b35:	89 f9                	mov    %edi,%ecx
 b37:	39 de                	cmp    %ebx,%esi
 b39:	0f 43 de             	cmovae %esi,%ebx
 b3c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 b43:	89 df                	mov    %ebx,%edi
 b45:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 b48:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 b4b:	eb 14                	jmp    b61 <normalmalloc+0x61>
 b4d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b50:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b52:	8b 48 04             	mov    0x4(%eax),%ecx
 b55:	39 f1                	cmp    %esi,%ecx
 b57:	73 77                	jae    bd0 <normalmalloc+0xd0>
    if(p == freep) {
 b59:	8b 0d 84 12 00 00    	mov    0x1284,%ecx
 b5f:	89 c2                	mov    %eax,%edx
 b61:	39 d1                	cmp    %edx,%ecx
 b63:	75 eb                	jne    b50 <normalmalloc+0x50>
  p = sbrk(nu * sizeof(Header), use_huge_pages);
 b65:	83 ec 08             	sub    $0x8,%esp
 b68:	53                   	push   %ebx
 b69:	ff 75 e4             	push   -0x1c(%ebp)
 b6c:	e8 aa fa ff ff       	call   61b <sbrk>
  if(p == (char*)-1)
 b71:	83 c4 10             	add    $0x10,%esp
 b74:	83 f8 ff             	cmp    $0xffffffff,%eax
 b77:	74 31                	je     baa <normalmalloc+0xaa>
  hp->s.size = nu;
 b79:	89 78 04             	mov    %edi,0x4(%eax)
  vfree((void*)(hp + 1));
 b7c:	8d 50 08             	lea    0x8(%eax),%edx
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 b7f:	2d f8 ff ff 1d       	sub    $0x1dfffff8,%eax
 b84:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 b89:	77 2d                	ja     bb8 <normalmalloc+0xb8>
    hugefree(ap);
 b8b:	83 ec 0c             	sub    $0xc,%esp
 b8e:	52                   	push   %edx
 b8f:	e8 ac fd ff ff       	call   940 <hugefree>
 b94:	83 c4 10             	add    $0x10,%esp
    return huge_freep;
 b97:	8b 15 78 12 00 00    	mov    0x1278,%edx
 b9d:	85 db                	test   %ebx,%ebx
 b9f:	0f 44 15 84 12 00 00 	cmove  0x1284,%edx
      if((p = morecore(nunits, use_huge_pages)) == 0) {
 ba6:	85 d2                	test   %edx,%edx
 ba8:	75 a6                	jne    b50 <normalmalloc+0x50>
}
 baa:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 bad:	31 c0                	xor    %eax,%eax
}
 baf:	5b                   	pop    %ebx
 bb0:	5e                   	pop    %esi
 bb1:	5f                   	pop    %edi
 bb2:	5d                   	pop    %ebp
 bb3:	c3                   	ret    
 bb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    normalfree(ap);
 bb8:	83 ec 0c             	sub    $0xc,%esp
 bbb:	52                   	push   %edx
 bbc:	e8 ef fc ff ff       	call   8b0 <normalfree>
 bc1:	83 c4 10             	add    $0x10,%esp
 bc4:	eb d1                	jmp    b97 <normalmalloc+0x97>
    if(p->s.size >= nunits){
 bc6:	89 d0                	mov    %edx,%eax
 bc8:	89 fa                	mov    %edi,%edx
 bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 bd0:	39 ce                	cmp    %ecx,%esi
 bd2:	74 4c                	je     c20 <normalmalloc+0x120>
        p->s.size -= nunits;
 bd4:	29 f1                	sub    %esi,%ecx
 bd6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 bd9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 bdc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 bdf:	89 15 84 12 00 00    	mov    %edx,0x1284
}
 be5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 be8:	83 c0 08             	add    $0x8,%eax
}
 beb:	5b                   	pop    %ebx
 bec:	5e                   	pop    %esi
 bed:	5f                   	pop    %edi
 bee:	5d                   	pop    %ebp
 bef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 bf0:	c7 05 84 12 00 00 88 	movl   $0x1288,0x1284
 bf7:	12 00 00 
    base.s.size = 0;
 bfa:	bf 88 12 00 00       	mov    $0x1288,%edi
    base.s.ptr = freep = prevp = &base;
 bff:	c7 05 88 12 00 00 88 	movl   $0x1288,0x1288
 c06:	12 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c09:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 c0b:	c7 05 8c 12 00 00 00 	movl   $0x0,0x128c
 c12:	00 00 00 
    if(p->s.size >= nunits){
 c15:	e9 16 ff ff ff       	jmp    b30 <normalmalloc+0x30>
 c1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c20:	8b 08                	mov    (%eax),%ecx
 c22:	89 0a                	mov    %ecx,(%edx)
 c24:	eb b9                	jmp    bdf <normalmalloc+0xdf>
 c26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c2d:	8d 76 00             	lea    0x0(%esi),%esi

00000c30 <vmalloc>:
void* vmalloc(uint nbytes, int pagesize) {
 c30:	55                   	push   %ebp
 c31:	89 e5                	mov    %esp,%ebp
 c33:	83 ec 08             	sub    $0x8,%esp
 c36:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(pagesize == VMALLOC_SIZE_BASE) {
 c39:	3d 00 10 00 00       	cmp    $0x1000,%eax
 c3e:	74 18                	je     c58 <vmalloc+0x28>
  else if (pagesize == VMALLOC_SIZE_HUGE) {
 c40:	3d 00 00 40 00       	cmp    $0x400000,%eax
 c45:	75 1e                	jne    c65 <vmalloc+0x35>
    return hugemalloc(nbytes, use_huge_pages);
 c47:	c7 45 0c 01 00 00 00 	movl   $0x1,0xc(%ebp)
}
 c4e:	c9                   	leave  
    return hugemalloc(nbytes, use_huge_pages);
 c4f:	e9 7c fd ff ff       	jmp    9d0 <hugemalloc>
 c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return normalmalloc(nbytes, use_huge_pages);
 c58:	c7 45 0c 00 00 00 00 	movl   $0x0,0xc(%ebp)
}
 c5f:	c9                   	leave  
    return normalmalloc(nbytes, use_huge_pages);
 c60:	e9 9b fe ff ff       	jmp    b00 <normalmalloc>
    printf(1, "Please pass VMALLOC_SIZE_BASE or VMALLOC_SIZE_HUGE as flag.\n");
 c65:	50                   	push   %eax
 c66:	50                   	push   %eax
 c67:	68 e8 0d 00 00       	push   $0xde8
 c6c:	6a 01                	push   $0x1
 c6e:	e8 9d fa ff ff       	call   710 <printf>
    exit();
 c73:	e8 1b f9 ff ff       	call   593 <exit>
 c78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c7f:	90                   	nop

00000c80 <vfree>:
void vfree(void *ap) {
 c80:	55                   	push   %ebp
 c81:	89 e5                	mov    %esp,%ebp
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 c83:	8b 45 08             	mov    0x8(%ebp),%eax
 c86:	2d 00 00 00 1e       	sub    $0x1e000000,%eax
 c8b:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 c90:	77 0e                	ja     ca0 <vfree+0x20>
  }
}
 c92:	5d                   	pop    %ebp
    hugefree(ap);
 c93:	e9 a8 fc ff ff       	jmp    940 <hugefree>
 c98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c9f:	90                   	nop
}
 ca0:	5d                   	pop    %ebp
    normalfree(ap);
 ca1:	e9 0a fc ff ff       	jmp    8b0 <normalfree>
 ca6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 cad:	8d 76 00             	lea    0x0(%esi),%esi

00000cb0 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 cb0:	55                   	push   %ebp
 cb1:	89 e5                	mov    %esp,%ebp
 cb3:	53                   	push   %ebx
 cb4:	83 ec 04             	sub    $0x4,%esp
 cb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 cba:	e8 8c f9 ff ff       	call   64b <getthp>

  if(nbytes >= 1048576 && thp != 0) { // only use huge pages if THP is active
 cbf:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 cc5:	76 19                	jbe    ce0 <malloc+0x30>
 cc7:	85 c0                	test   %eax,%eax
 cc9:	74 15                	je     ce0 <malloc+0x30>
    return hugemalloc(nbytes, use_huge_pages);
 ccb:	83 ec 08             	sub    $0x8,%esp
 cce:	6a 01                	push   $0x1
 cd0:	53                   	push   %ebx
 cd1:	e8 fa fc ff ff       	call   9d0 <hugemalloc>
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
  }
  else{
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
  }
}
 cd6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_HUGE); // use the huge pages
 cd9:	83 c4 10             	add    $0x10,%esp
}
 cdc:	c9                   	leave  
 cdd:	c3                   	ret    
 cde:	66 90                	xchg   %ax,%ax
    return normalmalloc(nbytes, use_huge_pages);
 ce0:	83 ec 08             	sub    $0x8,%esp
 ce3:	6a 00                	push   $0x0
 ce5:	53                   	push   %ebx
 ce6:	e8 15 fe ff ff       	call   b00 <normalmalloc>
}
 ceb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, VMALLOC_SIZE_BASE);
 cee:	83 c4 10             	add    $0x10,%esp
}
 cf1:	c9                   	leave  
 cf2:	c3                   	ret    
 cf3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000d00 <free>:

void free(void * ap){
 d00:	55                   	push   %ebp
 d01:	89 e5                	mov    %esp,%ebp
  if((((uint)ap) < HUGE_PAGE_END) && (((uint)ap) >= HUGE_PAGE_START)) {
 d03:	8b 45 08             	mov    0x8(%ebp),%eax
 d06:	2d 00 00 00 1e       	sub    $0x1e000000,%eax
 d0b:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
 d10:	77 0e                	ja     d20 <free+0x20>
  vfree(ap);
}
 d12:	5d                   	pop    %ebp
    hugefree(ap);
 d13:	e9 28 fc ff ff       	jmp    940 <hugefree>
 d18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 d1f:	90                   	nop
}
 d20:	5d                   	pop    %ebp
    normalfree(ap);
 d21:	e9 8a fb ff ff       	jmp    8b0 <normalfree>
