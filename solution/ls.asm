
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <vmalloc.cold>:

    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;

    if (use_huge_pages) {
        if ((prevp = huge_freep) == 0) {
            huge_base.s.ptr = huge_freep = &huge_base;
   0:	c7 05 c0 0f 00 00 c4 	movl   $0xfc4,0xfc0
   7:	0f 00 00 
   a:	c7 05 c4 0f 00 00 c4 	movl   $0xfc4,0xfc4
  11:	0f 00 00 
            huge_base.s.size = 0;
  14:	c7 05 c8 0f 00 00 00 	movl   $0x0,0xfc8
  1b:	00 00 00 
        //freepptr = &freep;
    }

    //prevp = *freepptr;
    
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
  1e:	a1 00 00 00 00       	mov    0x0,%eax
  23:	0f 0b                	ud2    
            base.s.ptr = freep = &base;
  25:	c7 05 cc 0f 00 00 d0 	movl   $0xfd0,0xfcc
  2c:	0f 00 00 
  2f:	c7 05 d0 0f 00 00 d0 	movl   $0xfd0,0xfd0
  36:	0f 00 00 
            base.s.size = 0;
  39:	c7 05 d4 0f 00 00 00 	movl   $0x0,0xfd4
  40:	00 00 00 
  43:	eb d9                	jmp    1e <vmalloc.cold+0x1e>
  45:	66 90                	xchg   %ax,%ax
  47:	66 90                	xchg   %ax,%ax
  49:	66 90                	xchg   %ax,%ax
  4b:	66 90                	xchg   %ax,%ax
  4d:	66 90                	xchg   %ax,%ax
  4f:	90                   	nop

00000050 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
  50:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  54:	83 e4 f0             	and    $0xfffffff0,%esp
  57:	ff 71 fc             	push   -0x4(%ecx)
  5a:	55                   	push   %ebp
  5b:	89 e5                	mov    %esp,%ebp
  5d:	57                   	push   %edi
  5e:	56                   	push   %esi
  5f:	53                   	push   %ebx
  60:	bb 01 00 00 00       	mov    $0x1,%ebx
  65:	51                   	push   %ecx
  66:	83 ec 08             	sub    $0x8,%esp
  69:	8b 31                	mov    (%ecx),%esi
  6b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  6e:	83 fe 01             	cmp    $0x1,%esi
  71:	7e 1f                	jle    92 <main+0x42>
  73:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  77:	90                   	nop
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  78:	83 ec 0c             	sub    $0xc,%esp
  7b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  7e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  81:	e8 ca 00 00 00       	call   150 <ls>
  for(i=1; i<argc; i++)
  86:	83 c4 10             	add    $0x10,%esp
  89:	39 de                	cmp    %ebx,%esi
  8b:	75 eb                	jne    78 <main+0x28>
  exit();
  8d:	e8 51 05 00 00       	call   5e3 <exit>
    ls(".");
  92:	83 ec 0c             	sub    $0xc,%esp
  95:	68 ac 0b 00 00       	push   $0xbac
  9a:	e8 b1 00 00 00       	call   150 <ls>
    exit();
  9f:	e8 3f 05 00 00       	call   5e3 <exit>
  a4:	66 90                	xchg   %ax,%ax
  a6:	66 90                	xchg   %ax,%ax
  a8:	66 90                	xchg   %ax,%ax
  aa:	66 90                	xchg   %ax,%ax
  ac:	66 90                	xchg   %ax,%ax
  ae:	66 90                	xchg   %ax,%ax

000000b0 <fmtname>:
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	56                   	push   %esi
  b4:	53                   	push   %ebx
  b5:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	56                   	push   %esi
  bc:	e8 5f 03 00 00       	call   420 <strlen>
  c1:	83 c4 10             	add    $0x10,%esp
  c4:	01 f0                	add    %esi,%eax
  c6:	89 c3                	mov    %eax,%ebx
  c8:	73 0f                	jae    d9 <fmtname+0x29>
  ca:	eb 12                	jmp    de <fmtname+0x2e>
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  d0:	8d 43 ff             	lea    -0x1(%ebx),%eax
  d3:	39 c6                	cmp    %eax,%esi
  d5:	77 0a                	ja     e1 <fmtname+0x31>
  d7:	89 c3                	mov    %eax,%ebx
  d9:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  dc:	75 f2                	jne    d0 <fmtname+0x20>
  p++;
  de:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  e1:	83 ec 0c             	sub    $0xc,%esp
  e4:	53                   	push   %ebx
  e5:	e8 36 03 00 00       	call   420 <strlen>
  ea:	83 c4 10             	add    $0x10,%esp
  ed:	83 f8 0d             	cmp    $0xd,%eax
  f0:	77 4a                	ja     13c <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  f2:	83 ec 0c             	sub    $0xc,%esp
  f5:	53                   	push   %ebx
  f6:	e8 25 03 00 00       	call   420 <strlen>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	50                   	push   %eax
  ff:	53                   	push   %ebx
 100:	68 b0 0f 00 00       	push   $0xfb0
 105:	e8 a6 04 00 00       	call   5b0 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 10a:	89 1c 24             	mov    %ebx,(%esp)
 10d:	e8 0e 03 00 00       	call   420 <strlen>
 112:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
 115:	bb b0 0f 00 00       	mov    $0xfb0,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 11a:	89 c6                	mov    %eax,%esi
 11c:	e8 ff 02 00 00       	call   420 <strlen>
 121:	ba 0e 00 00 00       	mov    $0xe,%edx
 126:	83 c4 0c             	add    $0xc,%esp
 129:	29 f2                	sub    %esi,%edx
 12b:	05 b0 0f 00 00       	add    $0xfb0,%eax
 130:	52                   	push   %edx
 131:	6a 20                	push   $0x20
 133:	50                   	push   %eax
 134:	e8 17 03 00 00       	call   450 <memset>
  return buf;
 139:	83 c4 10             	add    $0x10,%esp
}
 13c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 13f:	89 d8                	mov    %ebx,%eax
 141:	5b                   	pop    %ebx
 142:	5e                   	pop    %esi
 143:	5d                   	pop    %ebp
 144:	c3                   	ret    
 145:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <ls>:
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	56                   	push   %esi
 155:	53                   	push   %ebx
 156:	81 ec 64 02 00 00    	sub    $0x264,%esp
 15c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 15f:	6a 00                	push   $0x0
 161:	57                   	push   %edi
 162:	e8 bc 04 00 00       	call   623 <open>
 167:	83 c4 10             	add    $0x10,%esp
 16a:	85 c0                	test   %eax,%eax
 16c:	0f 88 9e 01 00 00    	js     310 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 172:	83 ec 08             	sub    $0x8,%esp
 175:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 17b:	89 c3                	mov    %eax,%ebx
 17d:	56                   	push   %esi
 17e:	50                   	push   %eax
 17f:	e8 b7 04 00 00       	call   63b <fstat>
 184:	83 c4 10             	add    $0x10,%esp
 187:	85 c0                	test   %eax,%eax
 189:	0f 88 c1 01 00 00    	js     350 <ls+0x200>
  switch(st.type){
 18f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 196:	66 83 f8 01          	cmp    $0x1,%ax
 19a:	74 64                	je     200 <ls+0xb0>
 19c:	66 83 f8 02          	cmp    $0x2,%ax
 1a0:	74 1e                	je     1c0 <ls+0x70>
  close(fd);
 1a2:	83 ec 0c             	sub    $0xc,%esp
 1a5:	53                   	push   %ebx
 1a6:	e8 60 04 00 00       	call   60b <close>
 1ab:	83 c4 10             	add    $0x10,%esp
}
 1ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b1:	5b                   	pop    %ebx
 1b2:	5e                   	pop    %esi
 1b3:	5f                   	pop    %edi
 1b4:	5d                   	pop    %ebp
 1b5:	c3                   	ret    
 1b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 1c0:	83 ec 0c             	sub    $0xc,%esp
 1c3:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 1c9:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 1cf:	57                   	push   %edi
 1d0:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 1d6:	e8 d5 fe ff ff       	call   b0 <fmtname>
 1db:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 1e1:	59                   	pop    %ecx
 1e2:	5f                   	pop    %edi
 1e3:	52                   	push   %edx
 1e4:	56                   	push   %esi
 1e5:	6a 02                	push   $0x2
 1e7:	50                   	push   %eax
 1e8:	68 8c 0b 00 00       	push   $0xb8c
 1ed:	6a 01                	push   $0x1
 1ef:	e8 6c 05 00 00       	call   760 <printf>
    break;
 1f4:	83 c4 20             	add    $0x20,%esp
 1f7:	eb a9                	jmp    1a2 <ls+0x52>
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 200:	83 ec 0c             	sub    $0xc,%esp
 203:	57                   	push   %edi
 204:	e8 17 02 00 00       	call   420 <strlen>
 209:	83 c4 10             	add    $0x10,%esp
 20c:	83 c0 10             	add    $0x10,%eax
 20f:	3d 00 02 00 00       	cmp    $0x200,%eax
 214:	0f 87 16 01 00 00    	ja     330 <ls+0x1e0>
    strcpy(buf, path);
 21a:	83 ec 08             	sub    $0x8,%esp
 21d:	57                   	push   %edi
 21e:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 224:	57                   	push   %edi
 225:	e8 66 01 00 00       	call   390 <strcpy>
    p = buf+strlen(buf);
 22a:	89 3c 24             	mov    %edi,(%esp)
 22d:	e8 ee 01 00 00       	call   420 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 232:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 235:	01 f8                	add    %edi,%eax
    *p++ = '/';
 237:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 23a:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 240:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 246:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 250:	83 ec 04             	sub    $0x4,%esp
 253:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 259:	6a 10                	push   $0x10
 25b:	50                   	push   %eax
 25c:	53                   	push   %ebx
 25d:	e8 99 03 00 00       	call   5fb <read>
 262:	83 c4 10             	add    $0x10,%esp
 265:	83 f8 10             	cmp    $0x10,%eax
 268:	0f 85 34 ff ff ff    	jne    1a2 <ls+0x52>
      if(de.inum == 0)
 26e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 275:	00 
 276:	74 d8                	je     250 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 278:	83 ec 04             	sub    $0x4,%esp
 27b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 281:	6a 0e                	push   $0xe
 283:	50                   	push   %eax
 284:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 28a:	e8 21 03 00 00       	call   5b0 <memmove>
      p[DIRSIZ] = 0;
 28f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 295:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 299:	58                   	pop    %eax
 29a:	5a                   	pop    %edx
 29b:	56                   	push   %esi
 29c:	57                   	push   %edi
 29d:	e8 7e 02 00 00       	call   520 <stat>
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	85 c0                	test   %eax,%eax
 2a7:	0f 88 cb 00 00 00    	js     378 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 2ad:	83 ec 0c             	sub    $0xc,%esp
 2b0:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 2b6:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 2bc:	57                   	push   %edi
 2bd:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 2c4:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 2ca:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 2d0:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 2d6:	e8 d5 fd ff ff       	call   b0 <fmtname>
 2db:	5a                   	pop    %edx
 2dc:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 2e2:	59                   	pop    %ecx
 2e3:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 2e9:	51                   	push   %ecx
 2ea:	52                   	push   %edx
 2eb:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 2f1:	50                   	push   %eax
 2f2:	68 8c 0b 00 00       	push   $0xb8c
 2f7:	6a 01                	push   $0x1
 2f9:	e8 62 04 00 00       	call   760 <printf>
 2fe:	83 c4 20             	add    $0x20,%esp
 301:	e9 4a ff ff ff       	jmp    250 <ls+0x100>
 306:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 310:	83 ec 04             	sub    $0x4,%esp
 313:	57                   	push   %edi
 314:	68 64 0b 00 00       	push   $0xb64
 319:	6a 02                	push   $0x2
 31b:	e8 40 04 00 00       	call   760 <printf>
    return;
 320:	83 c4 10             	add    $0x10,%esp
}
 323:	8d 65 f4             	lea    -0xc(%ebp),%esp
 326:	5b                   	pop    %ebx
 327:	5e                   	pop    %esi
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret    
 32b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop
      printf(1, "ls: path too long\n");
 330:	83 ec 08             	sub    $0x8,%esp
 333:	68 99 0b 00 00       	push   $0xb99
 338:	6a 01                	push   $0x1
 33a:	e8 21 04 00 00       	call   760 <printf>
      break;
 33f:	83 c4 10             	add    $0x10,%esp
 342:	e9 5b fe ff ff       	jmp    1a2 <ls+0x52>
 347:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34e:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 350:	83 ec 04             	sub    $0x4,%esp
 353:	57                   	push   %edi
 354:	68 78 0b 00 00       	push   $0xb78
 359:	6a 02                	push   $0x2
 35b:	e8 00 04 00 00       	call   760 <printf>
    close(fd);
 360:	89 1c 24             	mov    %ebx,(%esp)
 363:	e8 a3 02 00 00       	call   60b <close>
    return;
 368:	83 c4 10             	add    $0x10,%esp
}
 36b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36e:	5b                   	pop    %ebx
 36f:	5e                   	pop    %esi
 370:	5f                   	pop    %edi
 371:	5d                   	pop    %ebp
 372:	c3                   	ret    
 373:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 377:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 378:	83 ec 04             	sub    $0x4,%esp
 37b:	57                   	push   %edi
 37c:	68 78 0b 00 00       	push   $0xb78
 381:	6a 01                	push   $0x1
 383:	e8 d8 03 00 00       	call   760 <printf>
        continue;
 388:	83 c4 10             	add    $0x10,%esp
 38b:	e9 c0 fe ff ff       	jmp    250 <ls+0x100>

00000390 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 390:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 391:	31 c0                	xor    %eax,%eax
{
 393:	89 e5                	mov    %esp,%ebp
 395:	53                   	push   %ebx
 396:	8b 4d 08             	mov    0x8(%ebp),%ecx
 399:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 3a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 3a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 3a7:	83 c0 01             	add    $0x1,%eax
 3aa:	84 d2                	test   %dl,%dl
 3ac:	75 f2                	jne    3a0 <strcpy+0x10>
    ;
  return os;
}
 3ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b1:	89 c8                	mov    %ecx,%eax
 3b3:	c9                   	leave  
 3b4:	c3                   	ret    
 3b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	53                   	push   %ebx
 3c4:	8b 55 08             	mov    0x8(%ebp),%edx
 3c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3ca:	0f b6 02             	movzbl (%edx),%eax
 3cd:	84 c0                	test   %al,%al
 3cf:	75 17                	jne    3e8 <strcmp+0x28>
 3d1:	eb 3a                	jmp    40d <strcmp+0x4d>
 3d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3d7:	90                   	nop
 3d8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 3dc:	83 c2 01             	add    $0x1,%edx
 3df:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3e2:	84 c0                	test   %al,%al
 3e4:	74 1a                	je     400 <strcmp+0x40>
    p++, q++;
 3e6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 3e8:	0f b6 19             	movzbl (%ecx),%ebx
 3eb:	38 c3                	cmp    %al,%bl
 3ed:	74 e9                	je     3d8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 3ef:	29 d8                	sub    %ebx,%eax
}
 3f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3f4:	c9                   	leave  
 3f5:	c3                   	ret    
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 400:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 404:	31 c0                	xor    %eax,%eax
 406:	29 d8                	sub    %ebx,%eax
}
 408:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 40b:	c9                   	leave  
 40c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 40d:	0f b6 19             	movzbl (%ecx),%ebx
 410:	31 c0                	xor    %eax,%eax
 412:	eb db                	jmp    3ef <strcmp+0x2f>
 414:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <strlen>:

uint
strlen(const char *s)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 426:	80 3a 00             	cmpb   $0x0,(%edx)
 429:	74 15                	je     440 <strlen+0x20>
 42b:	31 c0                	xor    %eax,%eax
 42d:	8d 76 00             	lea    0x0(%esi),%esi
 430:	83 c0 01             	add    $0x1,%eax
 433:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 437:	89 c1                	mov    %eax,%ecx
 439:	75 f5                	jne    430 <strlen+0x10>
    ;
  return n;
}
 43b:	89 c8                	mov    %ecx,%eax
 43d:	5d                   	pop    %ebp
 43e:	c3                   	ret    
 43f:	90                   	nop
  for(n = 0; s[n]; n++)
 440:	31 c9                	xor    %ecx,%ecx
}
 442:	5d                   	pop    %ebp
 443:	89 c8                	mov    %ecx,%eax
 445:	c3                   	ret    
 446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44d:	8d 76 00             	lea    0x0(%esi),%esi

00000450 <memset>:

void*
memset(void *dst, int c, uint n)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 457:	8b 4d 10             	mov    0x10(%ebp),%ecx
 45a:	8b 45 0c             	mov    0xc(%ebp),%eax
 45d:	89 d7                	mov    %edx,%edi
 45f:	fc                   	cld    
 460:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 462:	8b 7d fc             	mov    -0x4(%ebp),%edi
 465:	89 d0                	mov    %edx,%eax
 467:	c9                   	leave  
 468:	c3                   	ret    
 469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000470 <strchr>:

char*
strchr(const char *s, char c)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	8b 45 08             	mov    0x8(%ebp),%eax
 476:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 47a:	0f b6 10             	movzbl (%eax),%edx
 47d:	84 d2                	test   %dl,%dl
 47f:	75 12                	jne    493 <strchr+0x23>
 481:	eb 1d                	jmp    4a0 <strchr+0x30>
 483:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 487:	90                   	nop
 488:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 48c:	83 c0 01             	add    $0x1,%eax
 48f:	84 d2                	test   %dl,%dl
 491:	74 0d                	je     4a0 <strchr+0x30>
    if(*s == c)
 493:	38 d1                	cmp    %dl,%cl
 495:	75 f1                	jne    488 <strchr+0x18>
      return (char*)s;
  return 0;
}
 497:	5d                   	pop    %ebp
 498:	c3                   	ret    
 499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4a0:	31 c0                	xor    %eax,%eax
}
 4a2:	5d                   	pop    %ebp
 4a3:	c3                   	ret    
 4a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop

000004b0 <gets>:

char*
gets(char *buf, int max)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 4b5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 4b8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 4b9:	31 db                	xor    %ebx,%ebx
{
 4bb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 4be:	eb 27                	jmp    4e7 <gets+0x37>
    cc = read(0, &c, 1);
 4c0:	83 ec 04             	sub    $0x4,%esp
 4c3:	6a 01                	push   $0x1
 4c5:	57                   	push   %edi
 4c6:	6a 00                	push   $0x0
 4c8:	e8 2e 01 00 00       	call   5fb <read>
    if(cc < 1)
 4cd:	83 c4 10             	add    $0x10,%esp
 4d0:	85 c0                	test   %eax,%eax
 4d2:	7e 1d                	jle    4f1 <gets+0x41>
      break;
    buf[i++] = c;
 4d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4d8:	8b 55 08             	mov    0x8(%ebp),%edx
 4db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 4df:	3c 0a                	cmp    $0xa,%al
 4e1:	74 1d                	je     500 <gets+0x50>
 4e3:	3c 0d                	cmp    $0xd,%al
 4e5:	74 19                	je     500 <gets+0x50>
  for(i=0; i+1 < max; ){
 4e7:	89 de                	mov    %ebx,%esi
 4e9:	83 c3 01             	add    $0x1,%ebx
 4ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4ef:	7c cf                	jl     4c0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 4f1:	8b 45 08             	mov    0x8(%ebp),%eax
 4f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 4f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4fb:	5b                   	pop    %ebx
 4fc:	5e                   	pop    %esi
 4fd:	5f                   	pop    %edi
 4fe:	5d                   	pop    %ebp
 4ff:	c3                   	ret    
  buf[i] = '\0';
 500:	8b 45 08             	mov    0x8(%ebp),%eax
 503:	89 de                	mov    %ebx,%esi
 505:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 509:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50c:	5b                   	pop    %ebx
 50d:	5e                   	pop    %esi
 50e:	5f                   	pop    %edi
 50f:	5d                   	pop    %ebp
 510:	c3                   	ret    
 511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 518:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51f:	90                   	nop

00000520 <stat>:

int
stat(const char *n, struct stat *st)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	56                   	push   %esi
 524:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 525:	83 ec 08             	sub    $0x8,%esp
 528:	6a 00                	push   $0x0
 52a:	ff 75 08             	push   0x8(%ebp)
 52d:	e8 f1 00 00 00       	call   623 <open>
  if(fd < 0)
 532:	83 c4 10             	add    $0x10,%esp
 535:	85 c0                	test   %eax,%eax
 537:	78 27                	js     560 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 539:	83 ec 08             	sub    $0x8,%esp
 53c:	ff 75 0c             	push   0xc(%ebp)
 53f:	89 c3                	mov    %eax,%ebx
 541:	50                   	push   %eax
 542:	e8 f4 00 00 00       	call   63b <fstat>
  close(fd);
 547:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 54a:	89 c6                	mov    %eax,%esi
  close(fd);
 54c:	e8 ba 00 00 00       	call   60b <close>
  return r;
 551:	83 c4 10             	add    $0x10,%esp
}
 554:	8d 65 f8             	lea    -0x8(%ebp),%esp
 557:	89 f0                	mov    %esi,%eax
 559:	5b                   	pop    %ebx
 55a:	5e                   	pop    %esi
 55b:	5d                   	pop    %ebp
 55c:	c3                   	ret    
 55d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 560:	be ff ff ff ff       	mov    $0xffffffff,%esi
 565:	eb ed                	jmp    554 <stat+0x34>
 567:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56e:	66 90                	xchg   %ax,%ax

00000570 <atoi>:

int
atoi(const char *s)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	53                   	push   %ebx
 574:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 577:	0f be 02             	movsbl (%edx),%eax
 57a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 57d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 580:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 585:	77 1e                	ja     5a5 <atoi+0x35>
 587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 590:	83 c2 01             	add    $0x1,%edx
 593:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 596:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 59a:	0f be 02             	movsbl (%edx),%eax
 59d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5a0:	80 fb 09             	cmp    $0x9,%bl
 5a3:	76 eb                	jbe    590 <atoi+0x20>
  return n;
}
 5a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5a8:	89 c8                	mov    %ecx,%eax
 5aa:	c9                   	leave  
 5ab:	c3                   	ret    
 5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	8b 45 10             	mov    0x10(%ebp),%eax
 5b7:	8b 55 08             	mov    0x8(%ebp),%edx
 5ba:	56                   	push   %esi
 5bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5be:	85 c0                	test   %eax,%eax
 5c0:	7e 13                	jle    5d5 <memmove+0x25>
 5c2:	01 d0                	add    %edx,%eax
  dst = vdst;
 5c4:	89 d7                	mov    %edx,%edi
 5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 5d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 5d1:	39 f8                	cmp    %edi,%eax
 5d3:	75 fb                	jne    5d0 <memmove+0x20>
  return vdst;
}
 5d5:	5e                   	pop    %esi
 5d6:	89 d0                	mov    %edx,%eax
 5d8:	5f                   	pop    %edi
 5d9:	5d                   	pop    %ebp
 5da:	c3                   	ret    

000005db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5db:	b8 01 00 00 00       	mov    $0x1,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <exit>:
SYSCALL(exit)
 5e3:	b8 02 00 00 00       	mov    $0x2,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <wait>:
SYSCALL(wait)
 5eb:	b8 03 00 00 00       	mov    $0x3,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <pipe>:
SYSCALL(pipe)
 5f3:	b8 04 00 00 00       	mov    $0x4,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <read>:
SYSCALL(read)
 5fb:	b8 05 00 00 00       	mov    $0x5,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <write>:
SYSCALL(write)
 603:	b8 10 00 00 00       	mov    $0x10,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <close>:
SYSCALL(close)
 60b:	b8 15 00 00 00       	mov    $0x15,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <kill>:
SYSCALL(kill)
 613:	b8 06 00 00 00       	mov    $0x6,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <exec>:
SYSCALL(exec)
 61b:	b8 07 00 00 00       	mov    $0x7,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <open>:
SYSCALL(open)
 623:	b8 0f 00 00 00       	mov    $0xf,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <mknod>:
SYSCALL(mknod)
 62b:	b8 11 00 00 00       	mov    $0x11,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <unlink>:
SYSCALL(unlink)
 633:	b8 12 00 00 00       	mov    $0x12,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <fstat>:
SYSCALL(fstat)
 63b:	b8 08 00 00 00       	mov    $0x8,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <link>:
SYSCALL(link)
 643:	b8 13 00 00 00       	mov    $0x13,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <mkdir>:
SYSCALL(mkdir)
 64b:	b8 14 00 00 00       	mov    $0x14,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <chdir>:
SYSCALL(chdir)
 653:	b8 09 00 00 00       	mov    $0x9,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <dup>:
SYSCALL(dup)
 65b:	b8 0a 00 00 00       	mov    $0xa,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <getpid>:
SYSCALL(getpid)
 663:	b8 0b 00 00 00       	mov    $0xb,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <sbrk>:
SYSCALL(sbrk)
 66b:	b8 0c 00 00 00       	mov    $0xc,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <sleep>:
SYSCALL(sleep)
 673:	b8 0d 00 00 00       	mov    $0xd,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <uptime>:
SYSCALL(uptime)
 67b:	b8 0e 00 00 00       	mov    $0xe,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <printhugepde>:
SYSCALL(printhugepde)
 683:	b8 16 00 00 00       	mov    $0x16,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <procpgdirinfo>:
SYSCALL(procpgdirinfo)
 68b:	b8 17 00 00 00       	mov    $0x17,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <setthp>:
SYSCALL(setthp)
 693:	b8 18 00 00 00       	mov    $0x18,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <getthp>:
 69b:	b8 19 00 00 00       	mov    $0x19,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    
 6a3:	66 90                	xchg   %ax,%ax
 6a5:	66 90                	xchg   %ax,%ax
 6a7:	66 90                	xchg   %ax,%ax
 6a9:	66 90                	xchg   %ax,%ax
 6ab:	66 90                	xchg   %ax,%ax
 6ad:	66 90                	xchg   %ax,%ax
 6af:	90                   	nop

000006b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 3c             	sub    $0x3c,%esp
 6b9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 6bc:	89 d1                	mov    %edx,%ecx
{
 6be:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 6c1:	85 d2                	test   %edx,%edx
 6c3:	0f 89 7f 00 00 00    	jns    748 <printint+0x98>
 6c9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6cd:	74 79                	je     748 <printint+0x98>
    neg = 1;
 6cf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 6d6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 6d8:	31 db                	xor    %ebx,%ebx
 6da:	8d 75 d7             	lea    -0x29(%ebp),%esi
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 6e0:	89 c8                	mov    %ecx,%eax
 6e2:	31 d2                	xor    %edx,%edx
 6e4:	89 cf                	mov    %ecx,%edi
 6e6:	f7 75 c4             	divl   -0x3c(%ebp)
 6e9:	0f b6 92 10 0c 00 00 	movzbl 0xc10(%edx),%edx
 6f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6f3:	89 d8                	mov    %ebx,%eax
 6f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 6f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 6fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6fe:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 701:	76 dd                	jbe    6e0 <printint+0x30>
  if(neg)
 703:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 706:	85 c9                	test   %ecx,%ecx
 708:	74 0c                	je     716 <printint+0x66>
    buf[i++] = '-';
 70a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 70f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 711:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 716:	8b 7d b8             	mov    -0x48(%ebp),%edi
 719:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 71d:	eb 07                	jmp    726 <printint+0x76>
 71f:	90                   	nop
    putc(fd, buf[i]);
 720:	0f b6 13             	movzbl (%ebx),%edx
 723:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 726:	83 ec 04             	sub    $0x4,%esp
 729:	88 55 d7             	mov    %dl,-0x29(%ebp)
 72c:	6a 01                	push   $0x1
 72e:	56                   	push   %esi
 72f:	57                   	push   %edi
 730:	e8 ce fe ff ff       	call   603 <write>
  while(--i >= 0)
 735:	83 c4 10             	add    $0x10,%esp
 738:	39 de                	cmp    %ebx,%esi
 73a:	75 e4                	jne    720 <printint+0x70>
}
 73c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 73f:	5b                   	pop    %ebx
 740:	5e                   	pop    %esi
 741:	5f                   	pop    %edi
 742:	5d                   	pop    %ebp
 743:	c3                   	ret    
 744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 748:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 74f:	eb 87                	jmp    6d8 <printint+0x28>
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 758:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 75f:	90                   	nop

00000760 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 769:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 76c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 76f:	0f b6 13             	movzbl (%ebx),%edx
 772:	84 d2                	test   %dl,%dl
 774:	74 6a                	je     7e0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 776:	8d 45 10             	lea    0x10(%ebp),%eax
 779:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 77c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 77f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 781:	89 45 d0             	mov    %eax,-0x30(%ebp)
 784:	eb 36                	jmp    7bc <printf+0x5c>
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi
 790:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 793:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 798:	83 f8 25             	cmp    $0x25,%eax
 79b:	74 15                	je     7b2 <printf+0x52>
  write(fd, &c, 1);
 79d:	83 ec 04             	sub    $0x4,%esp
 7a0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7a3:	6a 01                	push   $0x1
 7a5:	57                   	push   %edi
 7a6:	56                   	push   %esi
 7a7:	e8 57 fe ff ff       	call   603 <write>
 7ac:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 7af:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7b2:	0f b6 13             	movzbl (%ebx),%edx
 7b5:	83 c3 01             	add    $0x1,%ebx
 7b8:	84 d2                	test   %dl,%dl
 7ba:	74 24                	je     7e0 <printf+0x80>
    c = fmt[i] & 0xff;
 7bc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 7bf:	85 c9                	test   %ecx,%ecx
 7c1:	74 cd                	je     790 <printf+0x30>
      }
    } else if(state == '%'){
 7c3:	83 f9 25             	cmp    $0x25,%ecx
 7c6:	75 ea                	jne    7b2 <printf+0x52>
      if(c == 'd'){
 7c8:	83 f8 25             	cmp    $0x25,%eax
 7cb:	0f 84 07 01 00 00    	je     8d8 <printf+0x178>
 7d1:	83 e8 63             	sub    $0x63,%eax
 7d4:	83 f8 15             	cmp    $0x15,%eax
 7d7:	77 17                	ja     7f0 <printf+0x90>
 7d9:	ff 24 85 b8 0b 00 00 	jmp    *0xbb8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7e3:	5b                   	pop    %ebx
 7e4:	5e                   	pop    %esi
 7e5:	5f                   	pop    %edi
 7e6:	5d                   	pop    %ebp
 7e7:	c3                   	ret    
 7e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ef:	90                   	nop
  write(fd, &c, 1);
 7f0:	83 ec 04             	sub    $0x4,%esp
 7f3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 7f6:	6a 01                	push   $0x1
 7f8:	57                   	push   %edi
 7f9:	56                   	push   %esi
 7fa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7fe:	e8 00 fe ff ff       	call   603 <write>
        putc(fd, c);
 803:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 807:	83 c4 0c             	add    $0xc,%esp
 80a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 80d:	6a 01                	push   $0x1
 80f:	57                   	push   %edi
 810:	56                   	push   %esi
 811:	e8 ed fd ff ff       	call   603 <write>
        putc(fd, c);
 816:	83 c4 10             	add    $0x10,%esp
      state = 0;
 819:	31 c9                	xor    %ecx,%ecx
 81b:	eb 95                	jmp    7b2 <printf+0x52>
 81d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 820:	83 ec 0c             	sub    $0xc,%esp
 823:	b9 10 00 00 00       	mov    $0x10,%ecx
 828:	6a 00                	push   $0x0
 82a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 82d:	8b 10                	mov    (%eax),%edx
 82f:	89 f0                	mov    %esi,%eax
 831:	e8 7a fe ff ff       	call   6b0 <printint>
        ap++;
 836:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 83a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 83d:	31 c9                	xor    %ecx,%ecx
 83f:	e9 6e ff ff ff       	jmp    7b2 <printf+0x52>
 844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 848:	8b 45 d0             	mov    -0x30(%ebp),%eax
 84b:	8b 10                	mov    (%eax),%edx
        ap++;
 84d:	83 c0 04             	add    $0x4,%eax
 850:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 853:	85 d2                	test   %edx,%edx
 855:	0f 84 8d 00 00 00    	je     8e8 <printf+0x188>
        while(*s != 0){
 85b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 85e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 860:	84 c0                	test   %al,%al
 862:	0f 84 4a ff ff ff    	je     7b2 <printf+0x52>
 868:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 86b:	89 d3                	mov    %edx,%ebx
 86d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 870:	83 ec 04             	sub    $0x4,%esp
          s++;
 873:	83 c3 01             	add    $0x1,%ebx
 876:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 879:	6a 01                	push   $0x1
 87b:	57                   	push   %edi
 87c:	56                   	push   %esi
 87d:	e8 81 fd ff ff       	call   603 <write>
        while(*s != 0){
 882:	0f b6 03             	movzbl (%ebx),%eax
 885:	83 c4 10             	add    $0x10,%esp
 888:	84 c0                	test   %al,%al
 88a:	75 e4                	jne    870 <printf+0x110>
      state = 0;
 88c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 88f:	31 c9                	xor    %ecx,%ecx
 891:	e9 1c ff ff ff       	jmp    7b2 <printf+0x52>
 896:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 89d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 8a0:	83 ec 0c             	sub    $0xc,%esp
 8a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8a8:	6a 01                	push   $0x1
 8aa:	e9 7b ff ff ff       	jmp    82a <printf+0xca>
 8af:	90                   	nop
        putc(fd, *ap);
 8b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 8b3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 8b6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 8b8:	6a 01                	push   $0x1
 8ba:	57                   	push   %edi
 8bb:	56                   	push   %esi
        putc(fd, *ap);
 8bc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8bf:	e8 3f fd ff ff       	call   603 <write>
        ap++;
 8c4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 8c8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8cb:	31 c9                	xor    %ecx,%ecx
 8cd:	e9 e0 fe ff ff       	jmp    7b2 <printf+0x52>
 8d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 8d8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 8db:	83 ec 04             	sub    $0x4,%esp
 8de:	e9 2a ff ff ff       	jmp    80d <printf+0xad>
 8e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8e7:	90                   	nop
          s = "(null)";
 8e8:	ba ae 0b 00 00       	mov    $0xbae,%edx
        while(*s != 0){
 8ed:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8f0:	b8 28 00 00 00       	mov    $0x28,%eax
 8f5:	89 d3                	mov    %edx,%ebx
 8f7:	e9 74 ff ff ff       	jmp    870 <printf+0x110>
 8fc:	66 90                	xchg   %ax,%ax
 8fe:	66 90                	xchg   %ax,%ax

00000900 <vfree>:
        } 
    }
}

// vfree: free a block allocated by vmalloc
void vfree(void *ap, int use_huge_pages) {
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	57                   	push   %edi
 904:	56                   	push   %esi
 905:	53                   	push   %ebx
 906:	83 ec 04             	sub    $0x4,%esp
 909:	8b 5d 08             	mov    0x8(%ebp),%ebx
    Header *bp, *p;
    Header **freepptr;

    bp = ((Header*)ap) - 1;

    if (use_huge_pages) {
 90c:	8b 45 0c             	mov    0xc(%ebp),%eax
    bp = ((Header*)ap) - 1;
 90f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    if (use_huge_pages) {
 912:	85 c0                	test   %eax,%eax
 914:	0f 84 96 00 00 00    	je     9b0 <vfree+0xb0>
        freepptr = &huge_freep;
 91a:	a1 c0 0f 00 00       	mov    0xfc0,%eax
 91f:	bf c0 0f 00 00       	mov    $0xfc0,%edi
 924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else {
        freepptr = &freep;
    }

    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 928:	89 c2                	mov    %eax,%edx
 92a:	8b 00                	mov    (%eax),%eax
 92c:	39 ca                	cmp    %ecx,%edx
 92e:	73 38                	jae    968 <vfree+0x68>
 930:	39 c1                	cmp    %eax,%ecx
 932:	72 04                	jb     938 <vfree+0x38>
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 934:	39 c2                	cmp    %eax,%edx
 936:	72 f0                	jb     928 <vfree+0x28>
            break;
        }
    }

    if (bp + bp->s.size == p->s.ptr) {
 938:	8b 73 fc             	mov    -0x4(%ebx),%esi
 93b:	89 7d f0             	mov    %edi,-0x10(%ebp)
 93e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 941:	39 f8                	cmp    %edi,%eax
 943:	74 38                	je     97d <vfree+0x7d>
        bp->s.size += p->s.ptr->s.size;
        bp->s.ptr = p->s.ptr->s.ptr;
 945:	89 43 f8             	mov    %eax,-0x8(%ebx)
    } else {
        bp->s.ptr = p->s.ptr;
    }

    if (p + p->s.size == bp) {
 948:	8b 42 04             	mov    0x4(%edx),%eax
 94b:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 94e:	39 f1                	cmp    %esi,%ecx
 950:	74 42                	je     994 <vfree+0x94>
        p->s.ptr = bp->s.ptr;
    } else {
        p->s.ptr = bp;
    }

    *freepptr = p;
 952:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 955:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 957:	89 10                	mov    %edx,(%eax)
}
 959:	83 c4 04             	add    $0x4,%esp
 95c:	5b                   	pop    %ebx
 95d:	5e                   	pop    %esi
 95e:	5f                   	pop    %edi
 95f:	5d                   	pop    %ebp
 960:	c3                   	ret    
 961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (p >= p->s.ptr && (bp > p || bp < p->s.ptr)) {
 968:	39 c2                	cmp    %eax,%edx
 96a:	72 bc                	jb     928 <vfree+0x28>
 96c:	39 c1                	cmp    %eax,%ecx
 96e:	73 b8                	jae    928 <vfree+0x28>
    if (bp + bp->s.size == p->s.ptr) {
 970:	8b 73 fc             	mov    -0x4(%ebx),%esi
 973:	89 7d f0             	mov    %edi,-0x10(%ebp)
 976:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 979:	39 f8                	cmp    %edi,%eax
 97b:	75 c8                	jne    945 <vfree+0x45>
        bp->s.size += p->s.ptr->s.size;
 97d:	03 70 04             	add    0x4(%eax),%esi
 980:	89 73 fc             	mov    %esi,-0x4(%ebx)
        bp->s.ptr = p->s.ptr->s.ptr;
 983:	8b 02                	mov    (%edx),%eax
 985:	8b 00                	mov    (%eax),%eax
 987:	89 43 f8             	mov    %eax,-0x8(%ebx)
    if (p + p->s.size == bp) {
 98a:	8b 42 04             	mov    0x4(%edx),%eax
 98d:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 990:	39 f1                	cmp    %esi,%ecx
 992:	75 be                	jne    952 <vfree+0x52>
        p->s.size += bp->s.size;
 994:	03 43 fc             	add    -0x4(%ebx),%eax
 997:	89 42 04             	mov    %eax,0x4(%edx)
    *freepptr = p;
 99a:	8b 45 f0             	mov    -0x10(%ebp),%eax
        p->s.ptr = bp->s.ptr;
 99d:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9a0:	89 0a                	mov    %ecx,(%edx)
    *freepptr = p;
 9a2:	89 10                	mov    %edx,(%eax)
}
 9a4:	83 c4 04             	add    $0x4,%esp
 9a7:	5b                   	pop    %ebx
 9a8:	5e                   	pop    %esi
 9a9:	5f                   	pop    %edi
 9aa:	5d                   	pop    %ebp
 9ab:	c3                   	ret    
 9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        freepptr = &freep;
 9b0:	a1 cc 0f 00 00       	mov    0xfcc,%eax
 9b5:	bf cc 0f 00 00       	mov    $0xfcc,%edi
    for (p = *freepptr; !(bp > p && bp < p->s.ptr); p = p->s.ptr) {
 9ba:	e9 69 ff ff ff       	jmp    928 <vfree+0x28>
 9bf:	90                   	nop

000009c0 <vmalloc>:
void* vmalloc(uint nbytes, int use_huge_pages) {
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	57                   	push   %edi
 9c4:	56                   	push   %esi
 9c5:	53                   	push   %ebx
 9c6:	83 ec 1c             	sub    $0x1c,%esp
 9c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (use_huge_pages) {
 9cc:	85 db                	test   %ebx,%ebx
 9ce:	0f 84 0c 01 00 00    	je     ae0 <vmalloc+0x120>
        if ((prevp = huge_freep) == 0) {
 9d4:	8b 15 c0 0f 00 00    	mov    0xfc0,%edx
 9da:	85 d2                	test   %edx,%edx
 9dc:	0f 84 1e f6 ff ff    	je     0 <vmalloc.cold>
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 9e2:	8b 45 08             	mov    0x8(%ebp),%eax
 9e5:	8d 78 07             	lea    0x7(%eax),%edi
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 9e8:	8b 02                	mov    (%edx),%eax
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 9ea:	c1 ef 03             	shr    $0x3,%edi
        if (p->s.size >= nunits) {
 9ed:	8b 48 04             	mov    0x4(%eax),%ecx
    nunits = (nbytes + sizeof(Header) - 1) / sizeof(Header) + 1;
 9f0:	83 c7 01             	add    $0x1,%edi
        if (p->s.size >= nunits) {
 9f3:	39 f9                	cmp    %edi,%ecx
 9f5:	0f 83 c5 00 00 00    	jae    ac0 <vmalloc+0x100>
 9fb:	be 00 10 00 00       	mov    $0x1000,%esi
 a00:	ba 00 00 40 00       	mov    $0x400000,%edx
 a05:	39 f7                	cmp    %esi,%edi
 a07:	0f 43 f7             	cmovae %edi,%esi
 a0a:	39 d7                	cmp    %edx,%edi
 a0c:	0f 43 d7             	cmovae %edi,%edx
  p = sbrk(nu * sizeof(Header));
 a0f:	8d 0c f5 00 00 00 00 	lea    0x0(,%esi,8),%ecx
 a16:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 a19:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
 a20:	89 55 dc             	mov    %edx,-0x24(%ebp)
 a23:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 a26:	eb 15                	jmp    a3d <vmalloc+0x7d>
 a28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a2f:	90                   	nop
    for (p = prevp->s.ptr; ;prevp = p, p = p->s.ptr) {
 a30:	8b 02                	mov    (%edx),%eax
        if (p->s.size >= nunits) {
 a32:	8b 48 04             	mov    0x4(%eax),%ecx
 a35:	39 f9                	cmp    %edi,%ecx
 a37:	0f 83 83 00 00 00    	jae    ac0 <vmalloc+0x100>
        if (p == freep) {
 a3d:	89 c2                	mov    %eax,%edx
 a3f:	39 05 cc 0f 00 00    	cmp    %eax,0xfcc
 a45:	75 e9                	jne    a30 <vmalloc+0x70>
  if(use_huge_pages){
 a47:	85 db                	test   %ebx,%ebx
 a49:	74 45                	je     a90 <vmalloc+0xd0>
  p = sbrk(nu * sizeof(Header));
 a4b:	83 ec 0c             	sub    $0xc,%esp
 a4e:	ff 75 e0             	push   -0x20(%ebp)
 a51:	e8 15 fc ff ff       	call   66b <sbrk>
  if(p == (char*)-1)
 a56:	83 c4 10             	add    $0x10,%esp
 a59:	83 f8 ff             	cmp    $0xffffffff,%eax
 a5c:	74 20                	je     a7e <vmalloc+0xbe>
  hp->s.size = nu;
 a5e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  vfree((void*)(hp + 1), use_huge_pages);
 a61:	83 ec 08             	sub    $0x8,%esp
 a64:	83 c0 08             	add    $0x8,%eax
  hp->s.size = nu;
 a67:	89 48 fc             	mov    %ecx,-0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 a6a:	53                   	push   %ebx
 a6b:	50                   	push   %eax
 a6c:	e8 8f fe ff ff       	call   900 <vfree>
  return use_huge_pages ? huge_freep : freep;
 a71:	8b 15 c0 0f 00 00    	mov    0xfc0,%edx
 a77:	83 c4 10             	add    $0x10,%esp
            if (p == 0) {
 a7a:	85 d2                	test   %edx,%edx
 a7c:	75 b2                	jne    a30 <vmalloc+0x70>
}
 a7e:	8d 65 f4             	lea    -0xc(%ebp),%esp
                return 0;
 a81:	31 c0                	xor    %eax,%eax
}
 a83:	5b                   	pop    %ebx
 a84:	5e                   	pop    %esi
 a85:	5f                   	pop    %edi
 a86:	5d                   	pop    %ebp
 a87:	c3                   	ret    
 a88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a8f:	90                   	nop
  p = sbrk(nu * sizeof(Header));
 a90:	83 ec 0c             	sub    $0xc,%esp
 a93:	ff 75 e4             	push   -0x1c(%ebp)
 a96:	e8 d0 fb ff ff       	call   66b <sbrk>
  if(p == (char*)-1)
 a9b:	83 c4 10             	add    $0x10,%esp
 a9e:	83 f8 ff             	cmp    $0xffffffff,%eax
 aa1:	74 db                	je     a7e <vmalloc+0xbe>
  hp->s.size = nu;
 aa3:	89 70 04             	mov    %esi,0x4(%eax)
  vfree((void*)(hp + 1), use_huge_pages);
 aa6:	83 ec 08             	sub    $0x8,%esp
 aa9:	83 c0 08             	add    $0x8,%eax
 aac:	6a 00                	push   $0x0
 aae:	50                   	push   %eax
 aaf:	e8 4c fe ff ff       	call   900 <vfree>
  return use_huge_pages ? huge_freep : freep;
 ab4:	8b 15 cc 0f 00 00    	mov    0xfcc,%edx
 aba:	83 c4 10             	add    $0x10,%esp
 abd:	eb bb                	jmp    a7a <vmalloc+0xba>
 abf:	90                   	nop
            if (p->s.size == nunits) {
 ac0:	39 cf                	cmp    %ecx,%edi
 ac2:	74 34                	je     af8 <vmalloc+0x138>
                p->s.size -= nunits;
 ac4:	29 f9                	sub    %edi,%ecx
 ac6:	89 48 04             	mov    %ecx,0x4(%eax)
                p += p->s.size;
 ac9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
                p->s.size = nunits;
 acc:	89 78 04             	mov    %edi,0x4(%eax)
            freep = prevp;
 acf:	89 15 cc 0f 00 00    	mov    %edx,0xfcc
}
 ad5:	8d 65 f4             	lea    -0xc(%ebp),%esp
            return (void*)(p + 1);
 ad8:	83 c0 08             	add    $0x8,%eax
}
 adb:	5b                   	pop    %ebx
 adc:	5e                   	pop    %esi
 add:	5f                   	pop    %edi
 ade:	5d                   	pop    %ebp
 adf:	c3                   	ret    
        if ((prevp = freep) == 0) {
 ae0:	8b 15 cc 0f 00 00    	mov    0xfcc,%edx
 ae6:	85 d2                	test   %edx,%edx
 ae8:	0f 85 f4 fe ff ff    	jne    9e2 <vmalloc+0x22>
 aee:	e9 32 f5 ff ff       	jmp    25 <vmalloc.cold+0x25>
 af3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 af7:	90                   	nop
                prevp->s.ptr = p->s.ptr;
 af8:	8b 08                	mov    (%eax),%ecx
 afa:	89 0a                	mov    %ecx,(%edx)
 afc:	eb d1                	jmp    acf <vmalloc+0x10f>
 afe:	66 90                	xchg   %ax,%ax

00000b00 <malloc>:

// redefine malloc and free to call vmalloc and vfree (with base flag)
void* malloc(uint nbytes){
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	53                   	push   %ebx
 b04:	83 ec 04             	sub    $0x4,%esp
 b07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int thp = getthp();
 b0a:	e8 8c fb ff ff       	call   69b <getthp>


  if(nbytes >= 0x100000 && thp != 0) { // only use huge pages if THP is active
 b0f:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
 b15:	76 19                	jbe    b30 <malloc+0x30>
 b17:	85 c0                	test   %eax,%eax
 b19:	74 15                	je     b30 <malloc+0x30>
    return vmalloc(nbytes, 1); // use the huge pages
 b1b:	83 ec 08             	sub    $0x8,%esp
 b1e:	6a 01                	push   $0x1
 b20:	53                   	push   %ebx
 b21:	e8 9a fe ff ff       	call   9c0 <vmalloc>
  }
  else{
    return vmalloc(nbytes, 0);
  }
}
 b26:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 1); // use the huge pages
 b29:	83 c4 10             	add    $0x10,%esp
}
 b2c:	c9                   	leave  
 b2d:	c3                   	ret    
 b2e:	66 90                	xchg   %ax,%ax
    return vmalloc(nbytes, 0);
 b30:	83 ec 08             	sub    $0x8,%esp
 b33:	6a 00                	push   $0x0
 b35:	53                   	push   %ebx
 b36:	e8 85 fe ff ff       	call   9c0 <vmalloc>
}
 b3b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return vmalloc(nbytes, 0);
 b3e:	83 c4 10             	add    $0x10,%esp
}
 b41:	c9                   	leave  
 b42:	c3                   	ret    
 b43:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b50 <free>:

void free(void * ap){
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
  vfree(ap, 0);
 b53:	6a 00                	push   $0x0
 b55:	ff 75 08             	push   0x8(%ebp)
 b58:	e8 a3 fd ff ff       	call   900 <vfree>
}
 b5d:	58                   	pop    %eax
 b5e:	5a                   	pop    %edx
 b5f:	c9                   	leave  
 b60:	c3                   	ret    
