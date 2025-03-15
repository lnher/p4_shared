
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc d0 55 11 80       	mov    $0x801155d0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 30 32 10 80       	mov    $0x80103230,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb 54 a5 10 80       	mov    $0x8010a554,%ebx
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  initlock(&bcache.lock, "bcache");
8010004c:	68 a0 74 10 80       	push   $0x801074a0
80100051:	68 20 a5 10 80       	push   $0x8010a520
80100056:	e8 45 45 00 00       	call   801045a0 <initlock>
  bcache.head.next = &bcache.head;
8010005b:	83 c4 10             	add    $0x10,%esp
8010005e:	b8 1c ec 10 80       	mov    $0x8010ec1c,%eax
  bcache.head.prev = &bcache.head;
80100063:	c7 05 6c ec 10 80 1c 	movl   $0x8010ec1c,0x8010ec6c
8010006a:	ec 10 80 
  bcache.head.next = &bcache.head;
8010006d:	c7 05 70 ec 10 80 1c 	movl   $0x8010ec1c,0x8010ec70
80100074:	ec 10 80 
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 d3                	mov    %edx,%ebx
    b->next = bcache.head.next;
80100082:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	8d 43 0c             	lea    0xc(%ebx),%eax
    b->prev = &bcache.head;
8010008b:	c7 43 50 1c ec 10 80 	movl   $0x8010ec1c,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 a7 74 10 80       	push   $0x801074a7
80100097:	50                   	push   %eax
80100098:	e8 d3 43 00 00       	call   80104470 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	8d 93 5c 02 00 00    	lea    0x25c(%ebx),%edx
801000a8:	83 c4 10             	add    $0x10,%esp
    bcache.head.next->prev = b;
801000ab:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
801000ae:	89 d8                	mov    %ebx,%eax
801000b0:	89 1d 70 ec 10 80    	mov    %ebx,0x8010ec70
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	81 fb c0 e9 10 80    	cmp    $0x8010e9c0,%ebx
801000bc:	75 c2                	jne    80100080 <binit+0x40>
  }
}
801000be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c1:	c9                   	leave  
801000c2:	c3                   	ret    
801000c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  acquire(&bcache.lock);
801000df:	68 20 a5 10 80       	push   $0x8010a520
801000e4:	e8 87 46 00 00       	call   80104770 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 70 ec 10 80    	mov    0x8010ec70,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010011f:	90                   	nop
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 6c ec 10 80    	mov    0x8010ec6c,%ebx
80100126:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 6e                	jmp    8010019e <bread+0xce>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
80100139:	74 63                	je     8010019e <bread+0xce>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 20 a5 10 80       	push   $0x8010a520
80100162:	e8 a9 45 00 00       	call   80104710 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 3e 43 00 00       	call   801044b0 <acquiresleep>
      return b;
80100172:	83 c4 10             	add    $0x10,%esp
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	74 0e                	je     80100188 <bread+0xb8>
    iderw(b);
  }
  return b;
}
8010017a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010017d:	89 d8                	mov    %ebx,%eax
8010017f:	5b                   	pop    %ebx
80100180:	5e                   	pop    %esi
80100181:	5f                   	pop    %edi
80100182:	5d                   	pop    %ebp
80100183:	c3                   	ret    
80100184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    iderw(b);
80100188:	83 ec 0c             	sub    $0xc,%esp
8010018b:	53                   	push   %ebx
8010018c:	e8 4f 21 00 00       	call   801022e0 <iderw>
80100191:	83 c4 10             	add    $0x10,%esp
}
80100194:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100197:	89 d8                	mov    %ebx,%eax
80100199:	5b                   	pop    %ebx
8010019a:	5e                   	pop    %esi
8010019b:	5f                   	pop    %edi
8010019c:	5d                   	pop    %ebp
8010019d:	c3                   	ret    
  panic("bget: no buffers");
8010019e:	83 ec 0c             	sub    $0xc,%esp
801001a1:	68 ae 74 10 80       	push   $0x801074ae
801001a6:	e8 d5 01 00 00       	call   80100380 <panic>
801001ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801001af:	90                   	nop

801001b0 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001b0:	55                   	push   %ebp
801001b1:	89 e5                	mov    %esp,%ebp
801001b3:	53                   	push   %ebx
801001b4:	83 ec 10             	sub    $0x10,%esp
801001b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001ba:	8d 43 0c             	lea    0xc(%ebx),%eax
801001bd:	50                   	push   %eax
801001be:	e8 8d 43 00 00       	call   80104550 <holdingsleep>
801001c3:	83 c4 10             	add    $0x10,%esp
801001c6:	85 c0                	test   %eax,%eax
801001c8:	74 0f                	je     801001d9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ca:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001cd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001d3:	c9                   	leave  
  iderw(b);
801001d4:	e9 07 21 00 00       	jmp    801022e0 <iderw>
    panic("bwrite");
801001d9:	83 ec 0c             	sub    $0xc,%esp
801001dc:	68 bf 74 10 80       	push   $0x801074bf
801001e1:	e8 9a 01 00 00       	call   80100380 <panic>
801001e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801001ed:	8d 76 00             	lea    0x0(%esi),%esi

801001f0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001f0:	55                   	push   %ebp
801001f1:	89 e5                	mov    %esp,%ebp
801001f3:	56                   	push   %esi
801001f4:	53                   	push   %ebx
801001f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001f8:	8d 73 0c             	lea    0xc(%ebx),%esi
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 4c 43 00 00       	call   80104550 <holdingsleep>
80100204:	83 c4 10             	add    $0x10,%esp
80100207:	85 c0                	test   %eax,%eax
80100209:	74 66                	je     80100271 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
8010020b:	83 ec 0c             	sub    $0xc,%esp
8010020e:	56                   	push   %esi
8010020f:	e8 fc 42 00 00       	call   80104510 <releasesleep>

  acquire(&bcache.lock);
80100214:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010021b:	e8 50 45 00 00       	call   80104770 <acquire>
  b->refcnt--;
80100220:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100223:	83 c4 10             	add    $0x10,%esp
  b->refcnt--;
80100226:	83 e8 01             	sub    $0x1,%eax
80100229:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010022c:	85 c0                	test   %eax,%eax
8010022e:	75 2f                	jne    8010025f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100230:	8b 43 54             	mov    0x54(%ebx),%eax
80100233:	8b 53 50             	mov    0x50(%ebx),%edx
80100236:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100239:	8b 43 50             	mov    0x50(%ebx),%eax
8010023c:	8b 53 54             	mov    0x54(%ebx),%edx
8010023f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100242:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
    b->prev = &bcache.head;
80100247:	c7 43 50 1c ec 10 80 	movl   $0x8010ec1c,0x50(%ebx)
    b->next = bcache.head.next;
8010024e:	89 43 54             	mov    %eax,0x54(%ebx)
    bcache.head.next->prev = b;
80100251:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
80100256:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100259:	89 1d 70 ec 10 80    	mov    %ebx,0x8010ec70
  }
  
  release(&bcache.lock);
8010025f:	c7 45 08 20 a5 10 80 	movl   $0x8010a520,0x8(%ebp)
}
80100266:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100269:	5b                   	pop    %ebx
8010026a:	5e                   	pop    %esi
8010026b:	5d                   	pop    %ebp
  release(&bcache.lock);
8010026c:	e9 9f 44 00 00       	jmp    80104710 <release>
    panic("brelse");
80100271:	83 ec 0c             	sub    $0xc,%esp
80100274:	68 c6 74 10 80       	push   $0x801074c6
80100279:	e8 02 01 00 00       	call   80100380 <panic>
8010027e:	66 90                	xchg   %ax,%ax

80100280 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100280:	55                   	push   %ebp
80100281:	89 e5                	mov    %esp,%ebp
80100283:	57                   	push   %edi
80100284:	56                   	push   %esi
80100285:	53                   	push   %ebx
80100286:	83 ec 18             	sub    $0x18,%esp
80100289:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010028c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010028f:	ff 75 08             	push   0x8(%ebp)
  target = n;
80100292:	89 df                	mov    %ebx,%edi
  iunlock(ip);
80100294:	e8 c7 15 00 00       	call   80101860 <iunlock>
  acquire(&cons.lock);
80100299:	c7 04 24 20 ef 10 80 	movl   $0x8010ef20,(%esp)
801002a0:	e8 cb 44 00 00       	call   80104770 <acquire>
  while(n > 0){
801002a5:	83 c4 10             	add    $0x10,%esp
801002a8:	85 db                	test   %ebx,%ebx
801002aa:	0f 8e 94 00 00 00    	jle    80100344 <consoleread+0xc4>
    while(input.r == input.w){
801002b0:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
801002b5:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801002bb:	74 25                	je     801002e2 <consoleread+0x62>
801002bd:	eb 59                	jmp    80100318 <consoleread+0x98>
801002bf:	90                   	nop
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002c0:	83 ec 08             	sub    $0x8,%esp
801002c3:	68 20 ef 10 80       	push   $0x8010ef20
801002c8:	68 00 ef 10 80       	push   $0x8010ef00
801002cd:	e8 3e 3f 00 00       	call   80104210 <sleep>
    while(input.r == input.w){
801002d2:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
801002d7:	83 c4 10             	add    $0x10,%esp
801002da:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801002e0:	75 36                	jne    80100318 <consoleread+0x98>
      if(myproc()->killed){
801002e2:	e8 59 38 00 00       	call   80103b40 <myproc>
801002e7:	8b 48 28             	mov    0x28(%eax),%ecx
801002ea:	85 c9                	test   %ecx,%ecx
801002ec:	74 d2                	je     801002c0 <consoleread+0x40>
        release(&cons.lock);
801002ee:	83 ec 0c             	sub    $0xc,%esp
801002f1:	68 20 ef 10 80       	push   $0x8010ef20
801002f6:	e8 15 44 00 00       	call   80104710 <release>
        ilock(ip);
801002fb:	5a                   	pop    %edx
801002fc:	ff 75 08             	push   0x8(%ebp)
801002ff:	e8 7c 14 00 00       	call   80101780 <ilock>
        return -1;
80100304:	83 c4 10             	add    $0x10,%esp
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
80100307:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
8010030a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010030f:	5b                   	pop    %ebx
80100310:	5e                   	pop    %esi
80100311:	5f                   	pop    %edi
80100312:	5d                   	pop    %ebp
80100313:	c3                   	ret    
80100314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = input.buf[input.r++ % INPUT_BUF];
80100318:	8d 50 01             	lea    0x1(%eax),%edx
8010031b:	89 15 00 ef 10 80    	mov    %edx,0x8010ef00
80100321:	89 c2                	mov    %eax,%edx
80100323:	83 e2 7f             	and    $0x7f,%edx
80100326:	0f be 8a 80 ee 10 80 	movsbl -0x7fef1180(%edx),%ecx
    if(c == C('D')){  // EOF
8010032d:	80 f9 04             	cmp    $0x4,%cl
80100330:	74 37                	je     80100369 <consoleread+0xe9>
    *dst++ = c;
80100332:	83 c6 01             	add    $0x1,%esi
    --n;
80100335:	83 eb 01             	sub    $0x1,%ebx
    *dst++ = c;
80100338:	88 4e ff             	mov    %cl,-0x1(%esi)
    if(c == '\n')
8010033b:	83 f9 0a             	cmp    $0xa,%ecx
8010033e:	0f 85 64 ff ff ff    	jne    801002a8 <consoleread+0x28>
  release(&cons.lock);
80100344:	83 ec 0c             	sub    $0xc,%esp
80100347:	68 20 ef 10 80       	push   $0x8010ef20
8010034c:	e8 bf 43 00 00       	call   80104710 <release>
  ilock(ip);
80100351:	58                   	pop    %eax
80100352:	ff 75 08             	push   0x8(%ebp)
80100355:	e8 26 14 00 00       	call   80101780 <ilock>
  return target - n;
8010035a:	89 f8                	mov    %edi,%eax
8010035c:	83 c4 10             	add    $0x10,%esp
}
8010035f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return target - n;
80100362:	29 d8                	sub    %ebx,%eax
}
80100364:	5b                   	pop    %ebx
80100365:	5e                   	pop    %esi
80100366:	5f                   	pop    %edi
80100367:	5d                   	pop    %ebp
80100368:	c3                   	ret    
      if(n < target){
80100369:	39 fb                	cmp    %edi,%ebx
8010036b:	73 d7                	jae    80100344 <consoleread+0xc4>
        input.r--;
8010036d:	a3 00 ef 10 80       	mov    %eax,0x8010ef00
80100372:	eb d0                	jmp    80100344 <consoleread+0xc4>
80100374:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010037b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010037f:	90                   	nop

80100380 <panic>:
{
80100380:	55                   	push   %ebp
80100381:	89 e5                	mov    %esp,%ebp
80100383:	56                   	push   %esi
80100384:	53                   	push   %ebx
80100385:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100388:	fa                   	cli    
  cons.locking = 0;
80100389:	c7 05 54 ef 10 80 00 	movl   $0x0,0x8010ef54
80100390:	00 00 00 
  getcallerpcs(&s, pcs);
80100393:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100396:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cprintf("lapicid %d: panic: ", lapicid());
80100399:	e8 22 27 00 00       	call   80102ac0 <lapicid>
8010039e:	83 ec 08             	sub    $0x8,%esp
801003a1:	50                   	push   %eax
801003a2:	68 cd 74 10 80       	push   $0x801074cd
801003a7:	e8 f4 02 00 00       	call   801006a0 <cprintf>
  cprintf(s);
801003ac:	58                   	pop    %eax
801003ad:	ff 75 08             	push   0x8(%ebp)
801003b0:	e8 eb 02 00 00       	call   801006a0 <cprintf>
  cprintf("\n");
801003b5:	c7 04 24 17 7e 10 80 	movl   $0x80107e17,(%esp)
801003bc:	e8 df 02 00 00       	call   801006a0 <cprintf>
  getcallerpcs(&s, pcs);
801003c1:	8d 45 08             	lea    0x8(%ebp),%eax
801003c4:	5a                   	pop    %edx
801003c5:	59                   	pop    %ecx
801003c6:	53                   	push   %ebx
801003c7:	50                   	push   %eax
801003c8:	e8 f3 41 00 00       	call   801045c0 <getcallerpcs>
  for(i=0; i<10; i++)
801003cd:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003d0:	83 ec 08             	sub    $0x8,%esp
801003d3:	ff 33                	push   (%ebx)
  for(i=0; i<10; i++)
801003d5:	83 c3 04             	add    $0x4,%ebx
    cprintf(" %p", pcs[i]);
801003d8:	68 e1 74 10 80       	push   $0x801074e1
801003dd:	e8 be 02 00 00       	call   801006a0 <cprintf>
  for(i=0; i<10; i++)
801003e2:	83 c4 10             	add    $0x10,%esp
801003e5:	39 f3                	cmp    %esi,%ebx
801003e7:	75 e7                	jne    801003d0 <panic+0x50>
  panicked = 1; // freeze other CPU
801003e9:	c7 05 58 ef 10 80 01 	movl   $0x1,0x8010ef58
801003f0:	00 00 00 
  for(;;)
801003f3:	eb fe                	jmp    801003f3 <panic+0x73>
801003f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801003fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100400 <consputc.part.0>:
consputc(int c)
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 1c             	sub    $0x1c,%esp
  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 ea 00 00 00    	je     80100500 <consputc.part.0+0x100>
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 91 5b 00 00       	call   80105fb0 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c8             	movzbl %al,%ecx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	b8 0f 00 00 00       	mov    $0xf,%eax
80100441:	c1 e1 08             	shl    $0x8,%ecx
80100444:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100445:	89 f2                	mov    %esi,%edx
80100447:	ec                   	in     (%dx),%al
  pos |= inb(CRTPORT+1);
80100448:	0f b6 c0             	movzbl %al,%eax
8010044b:	09 c8                	or     %ecx,%eax
  if(c == '\n')
8010044d:	83 fb 0a             	cmp    $0xa,%ebx
80100450:	0f 84 92 00 00 00    	je     801004e8 <consputc.part.0+0xe8>
  else if(c == BACKSPACE){
80100456:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045c:	74 72                	je     801004d0 <consputc.part.0+0xd0>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
8010045e:	0f b6 db             	movzbl %bl,%ebx
80100461:	8d 70 01             	lea    0x1(%eax),%esi
80100464:	80 cf 07             	or     $0x7,%bh
80100467:	66 89 9c 00 00 80 0b 	mov    %bx,-0x7ff48000(%eax,%eax,1)
8010046e:	80 
  if(pos < 0 || pos > 25*80)
8010046f:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
80100475:	0f 8f fb 00 00 00    	jg     80100576 <consputc.part.0+0x176>
  if((pos/80) >= 24){  // Scroll up.
8010047b:	81 fe 7f 07 00 00    	cmp    $0x77f,%esi
80100481:	0f 8f a9 00 00 00    	jg     80100530 <consputc.part.0+0x130>
  outb(CRTPORT+1, pos>>8);
80100487:	89 f0                	mov    %esi,%eax
  crt[pos] = ' ' | 0x0700;
80100489:	8d b4 36 00 80 0b 80 	lea    -0x7ff48000(%esi,%esi,1),%esi
  outb(CRTPORT+1, pos);
80100490:	88 45 e7             	mov    %al,-0x19(%ebp)
  outb(CRTPORT+1, pos>>8);
80100493:	0f b6 fc             	movzbl %ah,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100496:	bb d4 03 00 00       	mov    $0x3d4,%ebx
8010049b:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a0:	89 da                	mov    %ebx,%edx
801004a2:	ee                   	out    %al,(%dx)
801004a3:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801004a8:	89 f8                	mov    %edi,%eax
801004aa:	89 ca                	mov    %ecx,%edx
801004ac:	ee                   	out    %al,(%dx)
801004ad:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b2:	89 da                	mov    %ebx,%edx
801004b4:	ee                   	out    %al,(%dx)
801004b5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
801004b9:	89 ca                	mov    %ecx,%edx
801004bb:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
801004bc:	b8 20 07 00 00       	mov    $0x720,%eax
801004c1:	66 89 06             	mov    %ax,(%esi)
}
801004c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c7:	5b                   	pop    %ebx
801004c8:	5e                   	pop    %esi
801004c9:	5f                   	pop    %edi
801004ca:	5d                   	pop    %ebp
801004cb:	c3                   	ret    
801004cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pos > 0) --pos;
801004d0:	8d 70 ff             	lea    -0x1(%eax),%esi
801004d3:	85 c0                	test   %eax,%eax
801004d5:	75 98                	jne    8010046f <consputc.part.0+0x6f>
801004d7:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
801004db:	be 00 80 0b 80       	mov    $0x800b8000,%esi
801004e0:	31 ff                	xor    %edi,%edi
801004e2:	eb b2                	jmp    80100496 <consputc.part.0+0x96>
801004e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pos += 80 - pos%80;
801004e8:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
801004ed:	f7 e2                	mul    %edx
801004ef:	c1 ea 06             	shr    $0x6,%edx
801004f2:	8d 04 92             	lea    (%edx,%edx,4),%eax
801004f5:	c1 e0 04             	shl    $0x4,%eax
801004f8:	8d 70 50             	lea    0x50(%eax),%esi
801004fb:	e9 6f ff ff ff       	jmp    8010046f <consputc.part.0+0x6f>
    uartputc('\b'); uartputc(' '); uartputc('\b');
80100500:	83 ec 0c             	sub    $0xc,%esp
80100503:	6a 08                	push   $0x8
80100505:	e8 a6 5a 00 00       	call   80105fb0 <uartputc>
8010050a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100511:	e8 9a 5a 00 00       	call   80105fb0 <uartputc>
80100516:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010051d:	e8 8e 5a 00 00       	call   80105fb0 <uartputc>
80100522:	83 c4 10             	add    $0x10,%esp
80100525:	e9 f8 fe ff ff       	jmp    80100422 <consputc.part.0+0x22>
8010052a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100530:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
80100533:	8d 5e b0             	lea    -0x50(%esi),%ebx
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100536:	8d b4 36 60 7f 0b 80 	lea    -0x7ff480a0(%esi,%esi,1),%esi
  outb(CRTPORT+1, pos);
8010053d:	bf 07 00 00 00       	mov    $0x7,%edi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100542:	68 60 0e 00 00       	push   $0xe60
80100547:	68 a0 80 0b 80       	push   $0x800b80a0
8010054c:	68 00 80 0b 80       	push   $0x800b8000
80100551:	e8 7a 43 00 00       	call   801048d0 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100556:	b8 80 07 00 00       	mov    $0x780,%eax
8010055b:	83 c4 0c             	add    $0xc,%esp
8010055e:	29 d8                	sub    %ebx,%eax
80100560:	01 c0                	add    %eax,%eax
80100562:	50                   	push   %eax
80100563:	6a 00                	push   $0x0
80100565:	56                   	push   %esi
80100566:	e8 c5 42 00 00       	call   80104830 <memset>
  outb(CRTPORT+1, pos);
8010056b:	88 5d e7             	mov    %bl,-0x19(%ebp)
8010056e:	83 c4 10             	add    $0x10,%esp
80100571:	e9 20 ff ff ff       	jmp    80100496 <consputc.part.0+0x96>
    panic("pos under/overflow");
80100576:	83 ec 0c             	sub    $0xc,%esp
80100579:	68 e5 74 10 80       	push   $0x801074e5
8010057e:	e8 fd fd ff ff       	call   80100380 <panic>
80100583:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010058a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100590 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100590:	55                   	push   %ebp
80100591:	89 e5                	mov    %esp,%ebp
80100593:	57                   	push   %edi
80100594:	56                   	push   %esi
80100595:	53                   	push   %ebx
80100596:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100599:	ff 75 08             	push   0x8(%ebp)
{
8010059c:	8b 75 10             	mov    0x10(%ebp),%esi
  iunlock(ip);
8010059f:	e8 bc 12 00 00       	call   80101860 <iunlock>
  acquire(&cons.lock);
801005a4:	c7 04 24 20 ef 10 80 	movl   $0x8010ef20,(%esp)
801005ab:	e8 c0 41 00 00       	call   80104770 <acquire>
  for(i = 0; i < n; i++)
801005b0:	83 c4 10             	add    $0x10,%esp
801005b3:	85 f6                	test   %esi,%esi
801005b5:	7e 25                	jle    801005dc <consolewrite+0x4c>
801005b7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801005ba:	8d 3c 33             	lea    (%ebx,%esi,1),%edi
  if(panicked){
801005bd:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
    consputc(buf[i] & 0xff);
801005c3:	0f b6 03             	movzbl (%ebx),%eax
  if(panicked){
801005c6:	85 d2                	test   %edx,%edx
801005c8:	74 06                	je     801005d0 <consolewrite+0x40>
  asm volatile("cli");
801005ca:	fa                   	cli    
    for(;;)
801005cb:	eb fe                	jmp    801005cb <consolewrite+0x3b>
801005cd:	8d 76 00             	lea    0x0(%esi),%esi
801005d0:	e8 2b fe ff ff       	call   80100400 <consputc.part.0>
  for(i = 0; i < n; i++)
801005d5:	83 c3 01             	add    $0x1,%ebx
801005d8:	39 df                	cmp    %ebx,%edi
801005da:	75 e1                	jne    801005bd <consolewrite+0x2d>
  release(&cons.lock);
801005dc:	83 ec 0c             	sub    $0xc,%esp
801005df:	68 20 ef 10 80       	push   $0x8010ef20
801005e4:	e8 27 41 00 00       	call   80104710 <release>
  ilock(ip);
801005e9:	58                   	pop    %eax
801005ea:	ff 75 08             	push   0x8(%ebp)
801005ed:	e8 8e 11 00 00       	call   80101780 <ilock>

  return n;
}
801005f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801005f5:	89 f0                	mov    %esi,%eax
801005f7:	5b                   	pop    %ebx
801005f8:	5e                   	pop    %esi
801005f9:	5f                   	pop    %edi
801005fa:	5d                   	pop    %ebp
801005fb:	c3                   	ret    
801005fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100600 <printint>:
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 2c             	sub    $0x2c,%esp
80100609:	89 55 d4             	mov    %edx,-0x2c(%ebp)
8010060c:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  if(sign && (sign = xx < 0))
8010060f:	85 c9                	test   %ecx,%ecx
80100611:	74 04                	je     80100617 <printint+0x17>
80100613:	85 c0                	test   %eax,%eax
80100615:	78 6d                	js     80100684 <printint+0x84>
    x = xx;
80100617:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
8010061e:	89 c1                	mov    %eax,%ecx
  i = 0;
80100620:	31 db                	xor    %ebx,%ebx
80100622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    buf[i++] = digits[x % base];
80100628:	89 c8                	mov    %ecx,%eax
8010062a:	31 d2                	xor    %edx,%edx
8010062c:	89 de                	mov    %ebx,%esi
8010062e:	89 cf                	mov    %ecx,%edi
80100630:	f7 75 d4             	divl   -0x2c(%ebp)
80100633:	8d 5b 01             	lea    0x1(%ebx),%ebx
80100636:	0f b6 92 10 75 10 80 	movzbl -0x7fef8af0(%edx),%edx
  }while((x /= base) != 0);
8010063d:	89 c1                	mov    %eax,%ecx
    buf[i++] = digits[x % base];
8010063f:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
  }while((x /= base) != 0);
80100643:	3b 7d d4             	cmp    -0x2c(%ebp),%edi
80100646:	73 e0                	jae    80100628 <printint+0x28>
  if(sign)
80100648:	8b 4d d0             	mov    -0x30(%ebp),%ecx
8010064b:	85 c9                	test   %ecx,%ecx
8010064d:	74 0c                	je     8010065b <printint+0x5b>
    buf[i++] = '-';
8010064f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
80100654:	89 de                	mov    %ebx,%esi
    buf[i++] = '-';
80100656:	ba 2d 00 00 00       	mov    $0x2d,%edx
  while(--i >= 0)
8010065b:	8d 5c 35 d7          	lea    -0x29(%ebp,%esi,1),%ebx
8010065f:	0f be c2             	movsbl %dl,%eax
  if(panicked){
80100662:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
80100668:	85 d2                	test   %edx,%edx
8010066a:	74 04                	je     80100670 <printint+0x70>
8010066c:	fa                   	cli    
    for(;;)
8010066d:	eb fe                	jmp    8010066d <printint+0x6d>
8010066f:	90                   	nop
80100670:	e8 8b fd ff ff       	call   80100400 <consputc.part.0>
  while(--i >= 0)
80100675:	8d 45 d7             	lea    -0x29(%ebp),%eax
80100678:	39 c3                	cmp    %eax,%ebx
8010067a:	74 0e                	je     8010068a <printint+0x8a>
    consputc(buf[i]);
8010067c:	0f be 03             	movsbl (%ebx),%eax
8010067f:	83 eb 01             	sub    $0x1,%ebx
80100682:	eb de                	jmp    80100662 <printint+0x62>
    x = -xx;
80100684:	f7 d8                	neg    %eax
80100686:	89 c1                	mov    %eax,%ecx
80100688:	eb 96                	jmp    80100620 <printint+0x20>
}
8010068a:	83 c4 2c             	add    $0x2c,%esp
8010068d:	5b                   	pop    %ebx
8010068e:	5e                   	pop    %esi
8010068f:	5f                   	pop    %edi
80100690:	5d                   	pop    %ebp
80100691:	c3                   	ret    
80100692:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801006a0 <cprintf>:
{
801006a0:	55                   	push   %ebp
801006a1:	89 e5                	mov    %esp,%ebp
801006a3:	57                   	push   %edi
801006a4:	56                   	push   %esi
801006a5:	53                   	push   %ebx
801006a6:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
801006a9:	a1 54 ef 10 80       	mov    0x8010ef54,%eax
801006ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(locking)
801006b1:	85 c0                	test   %eax,%eax
801006b3:	0f 85 27 01 00 00    	jne    801007e0 <cprintf+0x140>
  if (fmt == 0)
801006b9:	8b 75 08             	mov    0x8(%ebp),%esi
801006bc:	85 f6                	test   %esi,%esi
801006be:	0f 84 ac 01 00 00    	je     80100870 <cprintf+0x1d0>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006c4:	0f b6 06             	movzbl (%esi),%eax
  argp = (uint*)(void*)(&fmt + 1);
801006c7:	8d 7d 0c             	lea    0xc(%ebp),%edi
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006ca:	31 db                	xor    %ebx,%ebx
801006cc:	85 c0                	test   %eax,%eax
801006ce:	74 56                	je     80100726 <cprintf+0x86>
    if(c != '%'){
801006d0:	83 f8 25             	cmp    $0x25,%eax
801006d3:	0f 85 cf 00 00 00    	jne    801007a8 <cprintf+0x108>
    c = fmt[++i] & 0xff;
801006d9:	83 c3 01             	add    $0x1,%ebx
801006dc:	0f b6 14 1e          	movzbl (%esi,%ebx,1),%edx
    if(c == 0)
801006e0:	85 d2                	test   %edx,%edx
801006e2:	74 42                	je     80100726 <cprintf+0x86>
    switch(c){
801006e4:	83 fa 70             	cmp    $0x70,%edx
801006e7:	0f 84 90 00 00 00    	je     8010077d <cprintf+0xdd>
801006ed:	7f 51                	jg     80100740 <cprintf+0xa0>
801006ef:	83 fa 25             	cmp    $0x25,%edx
801006f2:	0f 84 c0 00 00 00    	je     801007b8 <cprintf+0x118>
801006f8:	83 fa 64             	cmp    $0x64,%edx
801006fb:	0f 85 f4 00 00 00    	jne    801007f5 <cprintf+0x155>
      printint(*argp++, 10, 1);
80100701:	8d 47 04             	lea    0x4(%edi),%eax
80100704:	b9 01 00 00 00       	mov    $0x1,%ecx
80100709:	ba 0a 00 00 00       	mov    $0xa,%edx
8010070e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100711:	8b 07                	mov    (%edi),%eax
80100713:	e8 e8 fe ff ff       	call   80100600 <printint>
80100718:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
8010071b:	83 c3 01             	add    $0x1,%ebx
8010071e:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
80100722:	85 c0                	test   %eax,%eax
80100724:	75 aa                	jne    801006d0 <cprintf+0x30>
  if(locking)
80100726:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100729:	85 c0                	test   %eax,%eax
8010072b:	0f 85 22 01 00 00    	jne    80100853 <cprintf+0x1b3>
}
80100731:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100734:	5b                   	pop    %ebx
80100735:	5e                   	pop    %esi
80100736:	5f                   	pop    %edi
80100737:	5d                   	pop    %ebp
80100738:	c3                   	ret    
80100739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    switch(c){
80100740:	83 fa 73             	cmp    $0x73,%edx
80100743:	75 33                	jne    80100778 <cprintf+0xd8>
      if((s = (char*)*argp++) == 0)
80100745:	8d 47 04             	lea    0x4(%edi),%eax
80100748:	8b 3f                	mov    (%edi),%edi
8010074a:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010074d:	85 ff                	test   %edi,%edi
8010074f:	0f 84 e3 00 00 00    	je     80100838 <cprintf+0x198>
      for(; *s; s++)
80100755:	0f be 07             	movsbl (%edi),%eax
80100758:	84 c0                	test   %al,%al
8010075a:	0f 84 08 01 00 00    	je     80100868 <cprintf+0x1c8>
  if(panicked){
80100760:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
80100766:	85 d2                	test   %edx,%edx
80100768:	0f 84 b2 00 00 00    	je     80100820 <cprintf+0x180>
8010076e:	fa                   	cli    
    for(;;)
8010076f:	eb fe                	jmp    8010076f <cprintf+0xcf>
80100771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    switch(c){
80100778:	83 fa 78             	cmp    $0x78,%edx
8010077b:	75 78                	jne    801007f5 <cprintf+0x155>
      printint(*argp++, 16, 0);
8010077d:	8d 47 04             	lea    0x4(%edi),%eax
80100780:	31 c9                	xor    %ecx,%ecx
80100782:	ba 10 00 00 00       	mov    $0x10,%edx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100787:	83 c3 01             	add    $0x1,%ebx
      printint(*argp++, 16, 0);
8010078a:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010078d:	8b 07                	mov    (%edi),%eax
8010078f:	e8 6c fe ff ff       	call   80100600 <printint>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100794:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
      printint(*argp++, 16, 0);
80100798:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
8010079b:	85 c0                	test   %eax,%eax
8010079d:	0f 85 2d ff ff ff    	jne    801006d0 <cprintf+0x30>
801007a3:	eb 81                	jmp    80100726 <cprintf+0x86>
801007a5:	8d 76 00             	lea    0x0(%esi),%esi
  if(panicked){
801007a8:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
801007ae:	85 c9                	test   %ecx,%ecx
801007b0:	74 14                	je     801007c6 <cprintf+0x126>
801007b2:	fa                   	cli    
    for(;;)
801007b3:	eb fe                	jmp    801007b3 <cprintf+0x113>
801007b5:	8d 76 00             	lea    0x0(%esi),%esi
  if(panicked){
801007b8:	a1 58 ef 10 80       	mov    0x8010ef58,%eax
801007bd:	85 c0                	test   %eax,%eax
801007bf:	75 6c                	jne    8010082d <cprintf+0x18d>
801007c1:	b8 25 00 00 00       	mov    $0x25,%eax
801007c6:	e8 35 fc ff ff       	call   80100400 <consputc.part.0>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801007cb:	83 c3 01             	add    $0x1,%ebx
801007ce:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801007d2:	85 c0                	test   %eax,%eax
801007d4:	0f 85 f6 fe ff ff    	jne    801006d0 <cprintf+0x30>
801007da:	e9 47 ff ff ff       	jmp    80100726 <cprintf+0x86>
801007df:	90                   	nop
    acquire(&cons.lock);
801007e0:	83 ec 0c             	sub    $0xc,%esp
801007e3:	68 20 ef 10 80       	push   $0x8010ef20
801007e8:	e8 83 3f 00 00       	call   80104770 <acquire>
801007ed:	83 c4 10             	add    $0x10,%esp
801007f0:	e9 c4 fe ff ff       	jmp    801006b9 <cprintf+0x19>
  if(panicked){
801007f5:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
801007fb:	85 c9                	test   %ecx,%ecx
801007fd:	75 31                	jne    80100830 <cprintf+0x190>
801007ff:	b8 25 00 00 00       	mov    $0x25,%eax
80100804:	89 55 e0             	mov    %edx,-0x20(%ebp)
80100807:	e8 f4 fb ff ff       	call   80100400 <consputc.part.0>
8010080c:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
80100812:	85 d2                	test   %edx,%edx
80100814:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100817:	74 2e                	je     80100847 <cprintf+0x1a7>
80100819:	fa                   	cli    
    for(;;)
8010081a:	eb fe                	jmp    8010081a <cprintf+0x17a>
8010081c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100820:	e8 db fb ff ff       	call   80100400 <consputc.part.0>
      for(; *s; s++)
80100825:	83 c7 01             	add    $0x1,%edi
80100828:	e9 28 ff ff ff       	jmp    80100755 <cprintf+0xb5>
8010082d:	fa                   	cli    
    for(;;)
8010082e:	eb fe                	jmp    8010082e <cprintf+0x18e>
80100830:	fa                   	cli    
80100831:	eb fe                	jmp    80100831 <cprintf+0x191>
80100833:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100837:	90                   	nop
        s = "(null)";
80100838:	bf f8 74 10 80       	mov    $0x801074f8,%edi
      for(; *s; s++)
8010083d:	b8 28 00 00 00       	mov    $0x28,%eax
80100842:	e9 19 ff ff ff       	jmp    80100760 <cprintf+0xc0>
80100847:	89 d0                	mov    %edx,%eax
80100849:	e8 b2 fb ff ff       	call   80100400 <consputc.part.0>
8010084e:	e9 c8 fe ff ff       	jmp    8010071b <cprintf+0x7b>
    release(&cons.lock);
80100853:	83 ec 0c             	sub    $0xc,%esp
80100856:	68 20 ef 10 80       	push   $0x8010ef20
8010085b:	e8 b0 3e 00 00       	call   80104710 <release>
80100860:	83 c4 10             	add    $0x10,%esp
}
80100863:	e9 c9 fe ff ff       	jmp    80100731 <cprintf+0x91>
      if((s = (char*)*argp++) == 0)
80100868:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010086b:	e9 ab fe ff ff       	jmp    8010071b <cprintf+0x7b>
    panic("null fmt");
80100870:	83 ec 0c             	sub    $0xc,%esp
80100873:	68 ff 74 10 80       	push   $0x801074ff
80100878:	e8 03 fb ff ff       	call   80100380 <panic>
8010087d:	8d 76 00             	lea    0x0(%esi),%esi

80100880 <consoleintr>:
{
80100880:	55                   	push   %ebp
80100881:	89 e5                	mov    %esp,%ebp
80100883:	57                   	push   %edi
80100884:	56                   	push   %esi
  int c, doprocdump = 0;
80100885:	31 f6                	xor    %esi,%esi
{
80100887:	53                   	push   %ebx
80100888:	83 ec 18             	sub    $0x18,%esp
8010088b:	8b 7d 08             	mov    0x8(%ebp),%edi
  acquire(&cons.lock);
8010088e:	68 20 ef 10 80       	push   $0x8010ef20
80100893:	e8 d8 3e 00 00       	call   80104770 <acquire>
  while((c = getc()) >= 0){
80100898:	83 c4 10             	add    $0x10,%esp
8010089b:	eb 1a                	jmp    801008b7 <consoleintr+0x37>
8010089d:	8d 76 00             	lea    0x0(%esi),%esi
    switch(c){
801008a0:	83 fb 08             	cmp    $0x8,%ebx
801008a3:	0f 84 d7 00 00 00    	je     80100980 <consoleintr+0x100>
801008a9:	83 fb 10             	cmp    $0x10,%ebx
801008ac:	0f 85 32 01 00 00    	jne    801009e4 <consoleintr+0x164>
801008b2:	be 01 00 00 00       	mov    $0x1,%esi
  while((c = getc()) >= 0){
801008b7:	ff d7                	call   *%edi
801008b9:	89 c3                	mov    %eax,%ebx
801008bb:	85 c0                	test   %eax,%eax
801008bd:	0f 88 05 01 00 00    	js     801009c8 <consoleintr+0x148>
    switch(c){
801008c3:	83 fb 15             	cmp    $0x15,%ebx
801008c6:	74 78                	je     80100940 <consoleintr+0xc0>
801008c8:	7e d6                	jle    801008a0 <consoleintr+0x20>
801008ca:	83 fb 7f             	cmp    $0x7f,%ebx
801008cd:	0f 84 ad 00 00 00    	je     80100980 <consoleintr+0x100>
      if(c != 0 && input.e-input.r < INPUT_BUF){
801008d3:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
801008d8:	89 c2                	mov    %eax,%edx
801008da:	2b 15 00 ef 10 80    	sub    0x8010ef00,%edx
801008e0:	83 fa 7f             	cmp    $0x7f,%edx
801008e3:	77 d2                	ja     801008b7 <consoleintr+0x37>
        input.buf[input.e++ % INPUT_BUF] = c;
801008e5:	8d 48 01             	lea    0x1(%eax),%ecx
  if(panicked){
801008e8:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
        input.buf[input.e++ % INPUT_BUF] = c;
801008ee:	83 e0 7f             	and    $0x7f,%eax
801008f1:	89 0d 08 ef 10 80    	mov    %ecx,0x8010ef08
        c = (c == '\r') ? '\n' : c;
801008f7:	83 fb 0d             	cmp    $0xd,%ebx
801008fa:	0f 84 13 01 00 00    	je     80100a13 <consoleintr+0x193>
        input.buf[input.e++ % INPUT_BUF] = c;
80100900:	88 98 80 ee 10 80    	mov    %bl,-0x7fef1180(%eax)
  if(panicked){
80100906:	85 d2                	test   %edx,%edx
80100908:	0f 85 10 01 00 00    	jne    80100a1e <consoleintr+0x19e>
8010090e:	89 d8                	mov    %ebx,%eax
80100910:	e8 eb fa ff ff       	call   80100400 <consputc.part.0>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
80100915:	83 fb 0a             	cmp    $0xa,%ebx
80100918:	0f 84 14 01 00 00    	je     80100a32 <consoleintr+0x1b2>
8010091e:	83 fb 04             	cmp    $0x4,%ebx
80100921:	0f 84 0b 01 00 00    	je     80100a32 <consoleintr+0x1b2>
80100927:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
8010092c:	83 e8 80             	sub    $0xffffff80,%eax
8010092f:	39 05 08 ef 10 80    	cmp    %eax,0x8010ef08
80100935:	75 80                	jne    801008b7 <consoleintr+0x37>
80100937:	e9 fb 00 00 00       	jmp    80100a37 <consoleintr+0x1b7>
8010093c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      while(input.e != input.w &&
80100940:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
80100945:	39 05 04 ef 10 80    	cmp    %eax,0x8010ef04
8010094b:	0f 84 66 ff ff ff    	je     801008b7 <consoleintr+0x37>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100951:	83 e8 01             	sub    $0x1,%eax
80100954:	89 c2                	mov    %eax,%edx
80100956:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100959:	80 ba 80 ee 10 80 0a 	cmpb   $0xa,-0x7fef1180(%edx)
80100960:	0f 84 51 ff ff ff    	je     801008b7 <consoleintr+0x37>
  if(panicked){
80100966:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
        input.e--;
8010096c:	a3 08 ef 10 80       	mov    %eax,0x8010ef08
  if(panicked){
80100971:	85 d2                	test   %edx,%edx
80100973:	74 33                	je     801009a8 <consoleintr+0x128>
80100975:	fa                   	cli    
    for(;;)
80100976:	eb fe                	jmp    80100976 <consoleintr+0xf6>
80100978:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010097f:	90                   	nop
      if(input.e != input.w){
80100980:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
80100985:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
8010098b:	0f 84 26 ff ff ff    	je     801008b7 <consoleintr+0x37>
        input.e--;
80100991:	83 e8 01             	sub    $0x1,%eax
80100994:	a3 08 ef 10 80       	mov    %eax,0x8010ef08
  if(panicked){
80100999:	a1 58 ef 10 80       	mov    0x8010ef58,%eax
8010099e:	85 c0                	test   %eax,%eax
801009a0:	74 56                	je     801009f8 <consoleintr+0x178>
801009a2:	fa                   	cli    
    for(;;)
801009a3:	eb fe                	jmp    801009a3 <consoleintr+0x123>
801009a5:	8d 76 00             	lea    0x0(%esi),%esi
801009a8:	b8 00 01 00 00       	mov    $0x100,%eax
801009ad:	e8 4e fa ff ff       	call   80100400 <consputc.part.0>
      while(input.e != input.w &&
801009b2:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
801009b7:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801009bd:	75 92                	jne    80100951 <consoleintr+0xd1>
801009bf:	e9 f3 fe ff ff       	jmp    801008b7 <consoleintr+0x37>
801009c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&cons.lock);
801009c8:	83 ec 0c             	sub    $0xc,%esp
801009cb:	68 20 ef 10 80       	push   $0x8010ef20
801009d0:	e8 3b 3d 00 00       	call   80104710 <release>
  if(doprocdump) {
801009d5:	83 c4 10             	add    $0x10,%esp
801009d8:	85 f6                	test   %esi,%esi
801009da:	75 2b                	jne    80100a07 <consoleintr+0x187>
}
801009dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801009df:	5b                   	pop    %ebx
801009e0:	5e                   	pop    %esi
801009e1:	5f                   	pop    %edi
801009e2:	5d                   	pop    %ebp
801009e3:	c3                   	ret    
      if(c != 0 && input.e-input.r < INPUT_BUF){
801009e4:	85 db                	test   %ebx,%ebx
801009e6:	0f 84 cb fe ff ff    	je     801008b7 <consoleintr+0x37>
801009ec:	e9 e2 fe ff ff       	jmp    801008d3 <consoleintr+0x53>
801009f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801009f8:	b8 00 01 00 00       	mov    $0x100,%eax
801009fd:	e8 fe f9 ff ff       	call   80100400 <consputc.part.0>
80100a02:	e9 b0 fe ff ff       	jmp    801008b7 <consoleintr+0x37>
}
80100a07:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a0a:	5b                   	pop    %ebx
80100a0b:	5e                   	pop    %esi
80100a0c:	5f                   	pop    %edi
80100a0d:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
80100a0e:	e9 9d 39 00 00       	jmp    801043b0 <procdump>
        input.buf[input.e++ % INPUT_BUF] = c;
80100a13:	c6 80 80 ee 10 80 0a 	movb   $0xa,-0x7fef1180(%eax)
  if(panicked){
80100a1a:	85 d2                	test   %edx,%edx
80100a1c:	74 0a                	je     80100a28 <consoleintr+0x1a8>
80100a1e:	fa                   	cli    
    for(;;)
80100a1f:	eb fe                	jmp    80100a1f <consoleintr+0x19f>
80100a21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100a28:	b8 0a 00 00 00       	mov    $0xa,%eax
80100a2d:	e8 ce f9 ff ff       	call   80100400 <consputc.part.0>
          input.w = input.e;
80100a32:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
          wakeup(&input.r);
80100a37:	83 ec 0c             	sub    $0xc,%esp
          input.w = input.e;
80100a3a:	a3 04 ef 10 80       	mov    %eax,0x8010ef04
          wakeup(&input.r);
80100a3f:	68 00 ef 10 80       	push   $0x8010ef00
80100a44:	e8 87 38 00 00       	call   801042d0 <wakeup>
80100a49:	83 c4 10             	add    $0x10,%esp
80100a4c:	e9 66 fe ff ff       	jmp    801008b7 <consoleintr+0x37>
80100a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100a58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100a5f:	90                   	nop

80100a60 <consoleinit>:

void
consoleinit(void)
{
80100a60:	55                   	push   %ebp
80100a61:	89 e5                	mov    %esp,%ebp
80100a63:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
80100a66:	68 08 75 10 80       	push   $0x80107508
80100a6b:	68 20 ef 10 80       	push   $0x8010ef20
80100a70:	e8 2b 3b 00 00       	call   801045a0 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
80100a75:	58                   	pop    %eax
80100a76:	5a                   	pop    %edx
80100a77:	6a 00                	push   $0x0
80100a79:	6a 01                	push   $0x1
  devsw[CONSOLE].write = consolewrite;
80100a7b:	c7 05 0c f9 10 80 90 	movl   $0x80100590,0x8010f90c
80100a82:	05 10 80 
  devsw[CONSOLE].read = consoleread;
80100a85:	c7 05 08 f9 10 80 80 	movl   $0x80100280,0x8010f908
80100a8c:	02 10 80 
  cons.locking = 1;
80100a8f:	c7 05 54 ef 10 80 01 	movl   $0x1,0x8010ef54
80100a96:	00 00 00 
  ioapicenable(IRQ_KBD, 0);
80100a99:	e8 e2 19 00 00       	call   80102480 <ioapicenable>
}
80100a9e:	83 c4 10             	add    $0x10,%esp
80100aa1:	c9                   	leave  
80100aa2:	c3                   	ret    
80100aa3:	66 90                	xchg   %ax,%ax
80100aa5:	66 90                	xchg   %ax,%ax
80100aa7:	66 90                	xchg   %ax,%ax
80100aa9:	66 90                	xchg   %ax,%ax
80100aab:	66 90                	xchg   %ax,%ax
80100aad:	66 90                	xchg   %ax,%ax
80100aaf:	90                   	nop

80100ab0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
80100ab0:	55                   	push   %ebp
80100ab1:	89 e5                	mov    %esp,%ebp
80100ab3:	57                   	push   %edi
80100ab4:	56                   	push   %esi
80100ab5:	53                   	push   %ebx
80100ab6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
80100abc:	e8 7f 30 00 00       	call   80103b40 <myproc>
80100ac1:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)

  begin_op();
80100ac7:	e8 64 24 00 00       	call   80102f30 <begin_op>

  if((ip = namei(path)) == 0){
80100acc:	83 ec 0c             	sub    $0xc,%esp
80100acf:	ff 75 08             	push   0x8(%ebp)
80100ad2:	e8 c9 15 00 00       	call   801020a0 <namei>
80100ad7:	83 c4 10             	add    $0x10,%esp
80100ada:	85 c0                	test   %eax,%eax
80100adc:	0f 84 02 03 00 00    	je     80100de4 <exec+0x334>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100ae2:	83 ec 0c             	sub    $0xc,%esp
80100ae5:	89 c3                	mov    %eax,%ebx
80100ae7:	50                   	push   %eax
80100ae8:	e8 93 0c 00 00       	call   80101780 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100aed:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100af3:	6a 34                	push   $0x34
80100af5:	6a 00                	push   $0x0
80100af7:	50                   	push   %eax
80100af8:	53                   	push   %ebx
80100af9:	e8 92 0f 00 00       	call   80101a90 <readi>
80100afe:	83 c4 20             	add    $0x20,%esp
80100b01:	83 f8 34             	cmp    $0x34,%eax
80100b04:	74 22                	je     80100b28 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100b06:	83 ec 0c             	sub    $0xc,%esp
80100b09:	53                   	push   %ebx
80100b0a:	e8 01 0f 00 00       	call   80101a10 <iunlockput>
    end_op();
80100b0f:	e8 8c 24 00 00       	call   80102fa0 <end_op>
80100b14:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100b17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100b1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100b1f:	5b                   	pop    %ebx
80100b20:	5e                   	pop    %esi
80100b21:	5f                   	pop    %edi
80100b22:	5d                   	pop    %ebp
80100b23:	c3                   	ret    
80100b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(elf.magic != ELF_MAGIC)
80100b28:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100b2f:	45 4c 46 
80100b32:	75 d2                	jne    80100b06 <exec+0x56>
  if((pgdir = setupkvm()) == 0)
80100b34:	e8 07 66 00 00       	call   80107140 <setupkvm>
80100b39:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100b3f:	85 c0                	test   %eax,%eax
80100b41:	74 c3                	je     80100b06 <exec+0x56>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b43:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100b4a:	00 
80100b4b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100b51:	0f 84 ac 02 00 00    	je     80100e03 <exec+0x353>
  sz = 0;
80100b57:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100b5e:	00 00 00 
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b61:	31 ff                	xor    %edi,%edi
80100b63:	e9 8e 00 00 00       	jmp    80100bf6 <exec+0x146>
80100b68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100b6f:	90                   	nop
    if(ph.type != ELF_PROG_LOAD)
80100b70:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b77:	75 6c                	jne    80100be5 <exec+0x135>
    if(ph.memsz < ph.filesz)
80100b79:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b7f:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b85:	0f 82 87 00 00 00    	jb     80100c12 <exec+0x162>
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100b8b:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b91:	72 7f                	jb     80100c12 <exec+0x162>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100b93:	83 ec 04             	sub    $0x4,%esp
80100b96:	50                   	push   %eax
80100b97:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
80100b9d:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100ba3:	e8 b8 63 00 00       	call   80106f60 <allocuvm>
80100ba8:	83 c4 10             	add    $0x10,%esp
80100bab:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100bb1:	85 c0                	test   %eax,%eax
80100bb3:	74 5d                	je     80100c12 <exec+0x162>
    if(ph.vaddr % PGSIZE != 0)
80100bb5:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100bbb:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100bc0:	75 50                	jne    80100c12 <exec+0x162>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100bc2:	83 ec 0c             	sub    $0xc,%esp
80100bc5:	ff b5 14 ff ff ff    	push   -0xec(%ebp)
80100bcb:	ff b5 08 ff ff ff    	push   -0xf8(%ebp)
80100bd1:	53                   	push   %ebx
80100bd2:	50                   	push   %eax
80100bd3:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100bd9:	e8 92 62 00 00       	call   80106e70 <loaduvm>
80100bde:	83 c4 20             	add    $0x20,%esp
80100be1:	85 c0                	test   %eax,%eax
80100be3:	78 2d                	js     80100c12 <exec+0x162>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100be5:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100bec:	83 c7 01             	add    $0x1,%edi
80100bef:	83 c6 20             	add    $0x20,%esi
80100bf2:	39 f8                	cmp    %edi,%eax
80100bf4:	7e 3a                	jle    80100c30 <exec+0x180>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100bf6:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100bfc:	6a 20                	push   $0x20
80100bfe:	56                   	push   %esi
80100bff:	50                   	push   %eax
80100c00:	53                   	push   %ebx
80100c01:	e8 8a 0e 00 00       	call   80101a90 <readi>
80100c06:	83 c4 10             	add    $0x10,%esp
80100c09:	83 f8 20             	cmp    $0x20,%eax
80100c0c:	0f 84 5e ff ff ff    	je     80100b70 <exec+0xc0>
    freevm(pgdir);
80100c12:	83 ec 0c             	sub    $0xc,%esp
80100c15:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100c1b:	e8 a0 64 00 00       	call   801070c0 <freevm>
  if(ip){
80100c20:	83 c4 10             	add    $0x10,%esp
80100c23:	e9 de fe ff ff       	jmp    80100b06 <exec+0x56>
80100c28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100c2f:	90                   	nop
  sz = PGROUNDUP(sz);
80100c30:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100c36:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100c3c:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100c42:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
  iunlockput(ip);
80100c48:	83 ec 0c             	sub    $0xc,%esp
80100c4b:	53                   	push   %ebx
80100c4c:	e8 bf 0d 00 00       	call   80101a10 <iunlockput>
  end_op();
80100c51:	e8 4a 23 00 00       	call   80102fa0 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100c56:	83 c4 0c             	add    $0xc,%esp
80100c59:	56                   	push   %esi
80100c5a:	57                   	push   %edi
80100c5b:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100c61:	57                   	push   %edi
80100c62:	e8 f9 62 00 00       	call   80106f60 <allocuvm>
80100c67:	83 c4 10             	add    $0x10,%esp
80100c6a:	89 c6                	mov    %eax,%esi
80100c6c:	85 c0                	test   %eax,%eax
80100c6e:	0f 84 94 00 00 00    	je     80100d08 <exec+0x258>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c74:	83 ec 08             	sub    $0x8,%esp
80100c77:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
  for(argc = 0; argv[argc]; argc++) {
80100c7d:	89 f3                	mov    %esi,%ebx
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c7f:	50                   	push   %eax
80100c80:	57                   	push   %edi
  for(argc = 0; argv[argc]; argc++) {
80100c81:	31 ff                	xor    %edi,%edi
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c83:	e8 58 65 00 00       	call   801071e0 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100c88:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c8b:	83 c4 10             	add    $0x10,%esp
80100c8e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c94:	8b 00                	mov    (%eax),%eax
80100c96:	85 c0                	test   %eax,%eax
80100c98:	0f 84 8b 00 00 00    	je     80100d29 <exec+0x279>
80100c9e:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100ca4:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100caa:	eb 23                	jmp    80100ccf <exec+0x21f>
80100cac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100cb0:	8b 45 0c             	mov    0xc(%ebp),%eax
    ustack[3+argc] = sp;
80100cb3:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100cba:	83 c7 01             	add    $0x1,%edi
    ustack[3+argc] = sp;
80100cbd:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
  for(argc = 0; argv[argc]; argc++) {
80100cc3:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100cc6:	85 c0                	test   %eax,%eax
80100cc8:	74 59                	je     80100d23 <exec+0x273>
    if(argc >= MAXARG)
80100cca:	83 ff 20             	cmp    $0x20,%edi
80100ccd:	74 39                	je     80100d08 <exec+0x258>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100ccf:	83 ec 0c             	sub    $0xc,%esp
80100cd2:	50                   	push   %eax
80100cd3:	e8 58 3d 00 00       	call   80104a30 <strlen>
80100cd8:	29 c3                	sub    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cda:	58                   	pop    %eax
80100cdb:	8b 45 0c             	mov    0xc(%ebp),%eax
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100cde:	83 eb 01             	sub    $0x1,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100ce1:	ff 34 b8             	push   (%eax,%edi,4)
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100ce4:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100ce7:	e8 44 3d 00 00       	call   80104a30 <strlen>
80100cec:	83 c0 01             	add    $0x1,%eax
80100cef:	50                   	push   %eax
80100cf0:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cf3:	ff 34 b8             	push   (%eax,%edi,4)
80100cf6:	53                   	push   %ebx
80100cf7:	56                   	push   %esi
80100cf8:	e8 b3 66 00 00       	call   801073b0 <copyout>
80100cfd:	83 c4 20             	add    $0x20,%esp
80100d00:	85 c0                	test   %eax,%eax
80100d02:	79 ac                	jns    80100cb0 <exec+0x200>
80100d04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    freevm(pgdir);
80100d08:	83 ec 0c             	sub    $0xc,%esp
80100d0b:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100d11:	e8 aa 63 00 00       	call   801070c0 <freevm>
80100d16:	83 c4 10             	add    $0x10,%esp
  return -1;
80100d19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100d1e:	e9 f9 fd ff ff       	jmp    80100b1c <exec+0x6c>
80100d23:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d29:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100d30:	89 d9                	mov    %ebx,%ecx
  ustack[3+argc] = 0;
80100d32:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100d39:	00 00 00 00 
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d3d:	29 c1                	sub    %eax,%ecx
  sp -= (3+argc+1) * 4;
80100d3f:	83 c0 0c             	add    $0xc,%eax
  ustack[1] = argc;
80100d42:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  sp -= (3+argc+1) * 4;
80100d48:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100d4a:	50                   	push   %eax
80100d4b:	52                   	push   %edx
80100d4c:	53                   	push   %ebx
80100d4d:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
  ustack[0] = 0xffffffff;  // fake return PC
80100d53:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100d5a:	ff ff ff 
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d5d:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100d63:	e8 48 66 00 00       	call   801073b0 <copyout>
80100d68:	83 c4 10             	add    $0x10,%esp
80100d6b:	85 c0                	test   %eax,%eax
80100d6d:	78 99                	js     80100d08 <exec+0x258>
  for(last=s=path; *s; s++)
80100d6f:	8b 45 08             	mov    0x8(%ebp),%eax
80100d72:	8b 55 08             	mov    0x8(%ebp),%edx
80100d75:	0f b6 00             	movzbl (%eax),%eax
80100d78:	84 c0                	test   %al,%al
80100d7a:	74 13                	je     80100d8f <exec+0x2df>
80100d7c:	89 d1                	mov    %edx,%ecx
80100d7e:	66 90                	xchg   %ax,%ax
      last = s+1;
80100d80:	83 c1 01             	add    $0x1,%ecx
80100d83:	3c 2f                	cmp    $0x2f,%al
  for(last=s=path; *s; s++)
80100d85:	0f b6 01             	movzbl (%ecx),%eax
      last = s+1;
80100d88:	0f 44 d1             	cmove  %ecx,%edx
  for(last=s=path; *s; s++)
80100d8b:	84 c0                	test   %al,%al
80100d8d:	75 f1                	jne    80100d80 <exec+0x2d0>
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100d8f:	8b bd ec fe ff ff    	mov    -0x114(%ebp),%edi
80100d95:	83 ec 04             	sub    $0x4,%esp
80100d98:	6a 10                	push   $0x10
80100d9a:	89 f8                	mov    %edi,%eax
80100d9c:	52                   	push   %edx
80100d9d:	83 c0 70             	add    $0x70,%eax
80100da0:	50                   	push   %eax
80100da1:	e8 4a 3c 00 00       	call   801049f0 <safestrcpy>
  curproc->pgdir = pgdir;
80100da6:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
  oldpgdir = curproc->pgdir;
80100dac:	89 f8                	mov    %edi,%eax
80100dae:	8b 7f 08             	mov    0x8(%edi),%edi
  curproc->sz = sz;
80100db1:	89 30                	mov    %esi,(%eax)
  curproc->pgdir = pgdir;
80100db3:	89 48 08             	mov    %ecx,0x8(%eax)
  curproc->tf->eip = elf.entry;  // main
80100db6:	89 c1                	mov    %eax,%ecx
80100db8:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100dbe:	8b 40 1c             	mov    0x1c(%eax),%eax
80100dc1:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100dc4:	8b 41 1c             	mov    0x1c(%ecx),%eax
80100dc7:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100dca:	89 0c 24             	mov    %ecx,(%esp)
80100dcd:	e8 0e 5f 00 00       	call   80106ce0 <switchuvm>
  freevm(oldpgdir);
80100dd2:	89 3c 24             	mov    %edi,(%esp)
80100dd5:	e8 e6 62 00 00       	call   801070c0 <freevm>
  return 0;
80100dda:	83 c4 10             	add    $0x10,%esp
80100ddd:	31 c0                	xor    %eax,%eax
80100ddf:	e9 38 fd ff ff       	jmp    80100b1c <exec+0x6c>
    end_op();
80100de4:	e8 b7 21 00 00       	call   80102fa0 <end_op>
    cprintf("exec: fail\n");
80100de9:	83 ec 0c             	sub    $0xc,%esp
80100dec:	68 21 75 10 80       	push   $0x80107521
80100df1:	e8 aa f8 ff ff       	call   801006a0 <cprintf>
    return -1;
80100df6:	83 c4 10             	add    $0x10,%esp
80100df9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100dfe:	e9 19 fd ff ff       	jmp    80100b1c <exec+0x6c>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100e03:	be 00 20 00 00       	mov    $0x2000,%esi
80100e08:	31 ff                	xor    %edi,%edi
80100e0a:	e9 39 fe ff ff       	jmp    80100c48 <exec+0x198>
80100e0f:	90                   	nop

80100e10 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100e10:	55                   	push   %ebp
80100e11:	89 e5                	mov    %esp,%ebp
80100e13:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100e16:	68 2d 75 10 80       	push   $0x8010752d
80100e1b:	68 60 ef 10 80       	push   $0x8010ef60
80100e20:	e8 7b 37 00 00       	call   801045a0 <initlock>
}
80100e25:	83 c4 10             	add    $0x10,%esp
80100e28:	c9                   	leave  
80100e29:	c3                   	ret    
80100e2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100e30 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100e34:	bb 94 ef 10 80       	mov    $0x8010ef94,%ebx
{
80100e39:	83 ec 10             	sub    $0x10,%esp
  acquire(&ftable.lock);
80100e3c:	68 60 ef 10 80       	push   $0x8010ef60
80100e41:	e8 2a 39 00 00       	call   80104770 <acquire>
80100e46:	83 c4 10             	add    $0x10,%esp
80100e49:	eb 10                	jmp    80100e5b <filealloc+0x2b>
80100e4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e4f:	90                   	nop
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100e50:	83 c3 18             	add    $0x18,%ebx
80100e53:	81 fb f4 f8 10 80    	cmp    $0x8010f8f4,%ebx
80100e59:	74 25                	je     80100e80 <filealloc+0x50>
    if(f->ref == 0){
80100e5b:	8b 43 04             	mov    0x4(%ebx),%eax
80100e5e:	85 c0                	test   %eax,%eax
80100e60:	75 ee                	jne    80100e50 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100e62:	83 ec 0c             	sub    $0xc,%esp
      f->ref = 1;
80100e65:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100e6c:	68 60 ef 10 80       	push   $0x8010ef60
80100e71:	e8 9a 38 00 00       	call   80104710 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100e76:	89 d8                	mov    %ebx,%eax
      return f;
80100e78:	83 c4 10             	add    $0x10,%esp
}
80100e7b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e7e:	c9                   	leave  
80100e7f:	c3                   	ret    
  release(&ftable.lock);
80100e80:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80100e83:	31 db                	xor    %ebx,%ebx
  release(&ftable.lock);
80100e85:	68 60 ef 10 80       	push   $0x8010ef60
80100e8a:	e8 81 38 00 00       	call   80104710 <release>
}
80100e8f:	89 d8                	mov    %ebx,%eax
  return 0;
80100e91:	83 c4 10             	add    $0x10,%esp
}
80100e94:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e97:	c9                   	leave  
80100e98:	c3                   	ret    
80100e99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100ea0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100ea0:	55                   	push   %ebp
80100ea1:	89 e5                	mov    %esp,%ebp
80100ea3:	53                   	push   %ebx
80100ea4:	83 ec 10             	sub    $0x10,%esp
80100ea7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100eaa:	68 60 ef 10 80       	push   $0x8010ef60
80100eaf:	e8 bc 38 00 00       	call   80104770 <acquire>
  if(f->ref < 1)
80100eb4:	8b 43 04             	mov    0x4(%ebx),%eax
80100eb7:	83 c4 10             	add    $0x10,%esp
80100eba:	85 c0                	test   %eax,%eax
80100ebc:	7e 1a                	jle    80100ed8 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100ebe:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100ec1:	83 ec 0c             	sub    $0xc,%esp
  f->ref++;
80100ec4:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100ec7:	68 60 ef 10 80       	push   $0x8010ef60
80100ecc:	e8 3f 38 00 00       	call   80104710 <release>
  return f;
}
80100ed1:	89 d8                	mov    %ebx,%eax
80100ed3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100ed6:	c9                   	leave  
80100ed7:	c3                   	ret    
    panic("filedup");
80100ed8:	83 ec 0c             	sub    $0xc,%esp
80100edb:	68 34 75 10 80       	push   $0x80107534
80100ee0:	e8 9b f4 ff ff       	call   80100380 <panic>
80100ee5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ef0 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100ef0:	55                   	push   %ebp
80100ef1:	89 e5                	mov    %esp,%ebp
80100ef3:	57                   	push   %edi
80100ef4:	56                   	push   %esi
80100ef5:	53                   	push   %ebx
80100ef6:	83 ec 28             	sub    $0x28,%esp
80100ef9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct file ff;

  acquire(&ftable.lock);
80100efc:	68 60 ef 10 80       	push   $0x8010ef60
80100f01:	e8 6a 38 00 00       	call   80104770 <acquire>
  if(f->ref < 1)
80100f06:	8b 53 04             	mov    0x4(%ebx),%edx
80100f09:	83 c4 10             	add    $0x10,%esp
80100f0c:	85 d2                	test   %edx,%edx
80100f0e:	0f 8e a5 00 00 00    	jle    80100fb9 <fileclose+0xc9>
    panic("fileclose");
  if(--f->ref > 0){
80100f14:	83 ea 01             	sub    $0x1,%edx
80100f17:	89 53 04             	mov    %edx,0x4(%ebx)
80100f1a:	75 44                	jne    80100f60 <fileclose+0x70>
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100f1c:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100f20:	83 ec 0c             	sub    $0xc,%esp
  ff = *f;
80100f23:	8b 3b                	mov    (%ebx),%edi
  f->type = FD_NONE;
80100f25:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  ff = *f;
80100f2b:	8b 73 0c             	mov    0xc(%ebx),%esi
80100f2e:	88 45 e7             	mov    %al,-0x19(%ebp)
80100f31:	8b 43 10             	mov    0x10(%ebx),%eax
  release(&ftable.lock);
80100f34:	68 60 ef 10 80       	push   $0x8010ef60
  ff = *f;
80100f39:	89 45 e0             	mov    %eax,-0x20(%ebp)
  release(&ftable.lock);
80100f3c:	e8 cf 37 00 00       	call   80104710 <release>

  if(ff.type == FD_PIPE)
80100f41:	83 c4 10             	add    $0x10,%esp
80100f44:	83 ff 01             	cmp    $0x1,%edi
80100f47:	74 57                	je     80100fa0 <fileclose+0xb0>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100f49:	83 ff 02             	cmp    $0x2,%edi
80100f4c:	74 2a                	je     80100f78 <fileclose+0x88>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100f4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f51:	5b                   	pop    %ebx
80100f52:	5e                   	pop    %esi
80100f53:	5f                   	pop    %edi
80100f54:	5d                   	pop    %ebp
80100f55:	c3                   	ret    
80100f56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100f5d:	8d 76 00             	lea    0x0(%esi),%esi
    release(&ftable.lock);
80100f60:	c7 45 08 60 ef 10 80 	movl   $0x8010ef60,0x8(%ebp)
}
80100f67:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f6a:	5b                   	pop    %ebx
80100f6b:	5e                   	pop    %esi
80100f6c:	5f                   	pop    %edi
80100f6d:	5d                   	pop    %ebp
    release(&ftable.lock);
80100f6e:	e9 9d 37 00 00       	jmp    80104710 <release>
80100f73:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f77:	90                   	nop
    begin_op();
80100f78:	e8 b3 1f 00 00       	call   80102f30 <begin_op>
    iput(ff.ip);
80100f7d:	83 ec 0c             	sub    $0xc,%esp
80100f80:	ff 75 e0             	push   -0x20(%ebp)
80100f83:	e8 28 09 00 00       	call   801018b0 <iput>
    end_op();
80100f88:	83 c4 10             	add    $0x10,%esp
}
80100f8b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f8e:	5b                   	pop    %ebx
80100f8f:	5e                   	pop    %esi
80100f90:	5f                   	pop    %edi
80100f91:	5d                   	pop    %ebp
    end_op();
80100f92:	e9 09 20 00 00       	jmp    80102fa0 <end_op>
80100f97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100f9e:	66 90                	xchg   %ax,%ax
    pipeclose(ff.pipe, ff.writable);
80100fa0:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100fa4:	83 ec 08             	sub    $0x8,%esp
80100fa7:	53                   	push   %ebx
80100fa8:	56                   	push   %esi
80100fa9:	e8 52 27 00 00       	call   80103700 <pipeclose>
80100fae:	83 c4 10             	add    $0x10,%esp
}
80100fb1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb4:	5b                   	pop    %ebx
80100fb5:	5e                   	pop    %esi
80100fb6:	5f                   	pop    %edi
80100fb7:	5d                   	pop    %ebp
80100fb8:	c3                   	ret    
    panic("fileclose");
80100fb9:	83 ec 0c             	sub    $0xc,%esp
80100fbc:	68 3c 75 10 80       	push   $0x8010753c
80100fc1:	e8 ba f3 ff ff       	call   80100380 <panic>
80100fc6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100fcd:	8d 76 00             	lea    0x0(%esi),%esi

80100fd0 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	53                   	push   %ebx
80100fd4:	83 ec 04             	sub    $0x4,%esp
80100fd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100fda:	83 3b 02             	cmpl   $0x2,(%ebx)
80100fdd:	75 31                	jne    80101010 <filestat+0x40>
    ilock(f->ip);
80100fdf:	83 ec 0c             	sub    $0xc,%esp
80100fe2:	ff 73 10             	push   0x10(%ebx)
80100fe5:	e8 96 07 00 00       	call   80101780 <ilock>
    stati(f->ip, st);
80100fea:	58                   	pop    %eax
80100feb:	5a                   	pop    %edx
80100fec:	ff 75 0c             	push   0xc(%ebp)
80100fef:	ff 73 10             	push   0x10(%ebx)
80100ff2:	e8 69 0a 00 00       	call   80101a60 <stati>
    iunlock(f->ip);
80100ff7:	59                   	pop    %ecx
80100ff8:	ff 73 10             	push   0x10(%ebx)
80100ffb:	e8 60 08 00 00       	call   80101860 <iunlock>
    return 0;
  }
  return -1;
}
80101000:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
80101003:	83 c4 10             	add    $0x10,%esp
80101006:	31 c0                	xor    %eax,%eax
}
80101008:	c9                   	leave  
80101009:	c3                   	ret    
8010100a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101010:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return -1;
80101013:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80101018:	c9                   	leave  
80101019:	c3                   	ret    
8010101a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101020 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80101020:	55                   	push   %ebp
80101021:	89 e5                	mov    %esp,%ebp
80101023:	57                   	push   %edi
80101024:	56                   	push   %esi
80101025:	53                   	push   %ebx
80101026:	83 ec 0c             	sub    $0xc,%esp
80101029:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010102c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010102f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80101032:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80101036:	74 60                	je     80101098 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80101038:	8b 03                	mov    (%ebx),%eax
8010103a:	83 f8 01             	cmp    $0x1,%eax
8010103d:	74 41                	je     80101080 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010103f:	83 f8 02             	cmp    $0x2,%eax
80101042:	75 5b                	jne    8010109f <fileread+0x7f>
    ilock(f->ip);
80101044:	83 ec 0c             	sub    $0xc,%esp
80101047:	ff 73 10             	push   0x10(%ebx)
8010104a:	e8 31 07 00 00       	call   80101780 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
8010104f:	57                   	push   %edi
80101050:	ff 73 14             	push   0x14(%ebx)
80101053:	56                   	push   %esi
80101054:	ff 73 10             	push   0x10(%ebx)
80101057:	e8 34 0a 00 00       	call   80101a90 <readi>
8010105c:	83 c4 20             	add    $0x20,%esp
8010105f:	89 c6                	mov    %eax,%esi
80101061:	85 c0                	test   %eax,%eax
80101063:	7e 03                	jle    80101068 <fileread+0x48>
      f->off += r;
80101065:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80101068:	83 ec 0c             	sub    $0xc,%esp
8010106b:	ff 73 10             	push   0x10(%ebx)
8010106e:	e8 ed 07 00 00       	call   80101860 <iunlock>
    return r;
80101073:	83 c4 10             	add    $0x10,%esp
  }
  panic("fileread");
}
80101076:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101079:	89 f0                	mov    %esi,%eax
8010107b:	5b                   	pop    %ebx
8010107c:	5e                   	pop    %esi
8010107d:	5f                   	pop    %edi
8010107e:	5d                   	pop    %ebp
8010107f:	c3                   	ret    
    return piperead(f->pipe, addr, n);
80101080:	8b 43 0c             	mov    0xc(%ebx),%eax
80101083:	89 45 08             	mov    %eax,0x8(%ebp)
}
80101086:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101089:	5b                   	pop    %ebx
8010108a:	5e                   	pop    %esi
8010108b:	5f                   	pop    %edi
8010108c:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
8010108d:	e9 0e 28 00 00       	jmp    801038a0 <piperead>
80101092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80101098:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010109d:	eb d7                	jmp    80101076 <fileread+0x56>
  panic("fileread");
8010109f:	83 ec 0c             	sub    $0xc,%esp
801010a2:	68 46 75 10 80       	push   $0x80107546
801010a7:	e8 d4 f2 ff ff       	call   80100380 <panic>
801010ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801010b0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
801010b0:	55                   	push   %ebp
801010b1:	89 e5                	mov    %esp,%ebp
801010b3:	57                   	push   %edi
801010b4:	56                   	push   %esi
801010b5:	53                   	push   %ebx
801010b6:	83 ec 1c             	sub    $0x1c,%esp
801010b9:	8b 45 0c             	mov    0xc(%ebp),%eax
801010bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
801010bf:	89 45 dc             	mov    %eax,-0x24(%ebp)
801010c2:	8b 45 10             	mov    0x10(%ebp),%eax
  int r;

  if(f->writable == 0)
801010c5:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
{
801010c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(f->writable == 0)
801010cc:	0f 84 bd 00 00 00    	je     8010118f <filewrite+0xdf>
    return -1;
  if(f->type == FD_PIPE)
801010d2:	8b 03                	mov    (%ebx),%eax
801010d4:	83 f8 01             	cmp    $0x1,%eax
801010d7:	0f 84 bf 00 00 00    	je     8010119c <filewrite+0xec>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
801010dd:	83 f8 02             	cmp    $0x2,%eax
801010e0:	0f 85 c8 00 00 00    	jne    801011ae <filewrite+0xfe>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
801010e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    int i = 0;
801010e9:	31 f6                	xor    %esi,%esi
    while(i < n){
801010eb:	85 c0                	test   %eax,%eax
801010ed:	7f 30                	jg     8010111f <filewrite+0x6f>
801010ef:	e9 94 00 00 00       	jmp    80101188 <filewrite+0xd8>
801010f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
801010f8:	01 43 14             	add    %eax,0x14(%ebx)
      iunlock(f->ip);
801010fb:	83 ec 0c             	sub    $0xc,%esp
801010fe:	ff 73 10             	push   0x10(%ebx)
        f->off += r;
80101101:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101104:	e8 57 07 00 00       	call   80101860 <iunlock>
      end_op();
80101109:	e8 92 1e 00 00       	call   80102fa0 <end_op>

      if(r < 0)
        break;
      if(r != n1)
8010110e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101111:	83 c4 10             	add    $0x10,%esp
80101114:	39 c7                	cmp    %eax,%edi
80101116:	75 5c                	jne    80101174 <filewrite+0xc4>
        panic("short filewrite");
      i += r;
80101118:	01 fe                	add    %edi,%esi
    while(i < n){
8010111a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
8010111d:	7e 69                	jle    80101188 <filewrite+0xd8>
      int n1 = n - i;
8010111f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101122:	b8 00 06 00 00       	mov    $0x600,%eax
80101127:	29 f7                	sub    %esi,%edi
80101129:	39 c7                	cmp    %eax,%edi
8010112b:	0f 4f f8             	cmovg  %eax,%edi
      begin_op();
8010112e:	e8 fd 1d 00 00       	call   80102f30 <begin_op>
      ilock(f->ip);
80101133:	83 ec 0c             	sub    $0xc,%esp
80101136:	ff 73 10             	push   0x10(%ebx)
80101139:	e8 42 06 00 00       	call   80101780 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
8010113e:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101141:	57                   	push   %edi
80101142:	ff 73 14             	push   0x14(%ebx)
80101145:	01 f0                	add    %esi,%eax
80101147:	50                   	push   %eax
80101148:	ff 73 10             	push   0x10(%ebx)
8010114b:	e8 40 0a 00 00       	call   80101b90 <writei>
80101150:	83 c4 20             	add    $0x20,%esp
80101153:	85 c0                	test   %eax,%eax
80101155:	7f a1                	jg     801010f8 <filewrite+0x48>
      iunlock(f->ip);
80101157:	83 ec 0c             	sub    $0xc,%esp
8010115a:	ff 73 10             	push   0x10(%ebx)
8010115d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101160:	e8 fb 06 00 00       	call   80101860 <iunlock>
      end_op();
80101165:	e8 36 1e 00 00       	call   80102fa0 <end_op>
      if(r < 0)
8010116a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010116d:	83 c4 10             	add    $0x10,%esp
80101170:	85 c0                	test   %eax,%eax
80101172:	75 1b                	jne    8010118f <filewrite+0xdf>
        panic("short filewrite");
80101174:	83 ec 0c             	sub    $0xc,%esp
80101177:	68 4f 75 10 80       	push   $0x8010754f
8010117c:	e8 ff f1 ff ff       	call   80100380 <panic>
80101181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
    return i == n ? n : -1;
80101188:	89 f0                	mov    %esi,%eax
8010118a:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
8010118d:	74 05                	je     80101194 <filewrite+0xe4>
8010118f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  panic("filewrite");
}
80101194:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101197:	5b                   	pop    %ebx
80101198:	5e                   	pop    %esi
80101199:	5f                   	pop    %edi
8010119a:	5d                   	pop    %ebp
8010119b:	c3                   	ret    
    return pipewrite(f->pipe, addr, n);
8010119c:	8b 43 0c             	mov    0xc(%ebx),%eax
8010119f:	89 45 08             	mov    %eax,0x8(%ebp)
}
801011a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011a5:	5b                   	pop    %ebx
801011a6:	5e                   	pop    %esi
801011a7:	5f                   	pop    %edi
801011a8:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
801011a9:	e9 f2 25 00 00       	jmp    801037a0 <pipewrite>
  panic("filewrite");
801011ae:	83 ec 0c             	sub    $0xc,%esp
801011b1:	68 55 75 10 80       	push   $0x80107555
801011b6:	e8 c5 f1 ff ff       	call   80100380 <panic>
801011bb:	66 90                	xchg   %ax,%ax
801011bd:	66 90                	xchg   %ax,%ax
801011bf:	90                   	nop

801011c0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801011c0:	55                   	push   %ebp
801011c1:	89 c1                	mov    %eax,%ecx
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
801011c3:	89 d0                	mov    %edx,%eax
801011c5:	c1 e8 0c             	shr    $0xc,%eax
801011c8:	03 05 cc 15 11 80    	add    0x801115cc,%eax
{
801011ce:	89 e5                	mov    %esp,%ebp
801011d0:	56                   	push   %esi
801011d1:	53                   	push   %ebx
801011d2:	89 d3                	mov    %edx,%ebx
  bp = bread(dev, BBLOCK(b, sb));
801011d4:	83 ec 08             	sub    $0x8,%esp
801011d7:	50                   	push   %eax
801011d8:	51                   	push   %ecx
801011d9:	e8 f2 ee ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
801011de:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
801011e0:	c1 fb 03             	sar    $0x3,%ebx
801011e3:	83 c4 10             	add    $0x10,%esp
  bp = bread(dev, BBLOCK(b, sb));
801011e6:	89 c6                	mov    %eax,%esi
  m = 1 << (bi % 8);
801011e8:	83 e1 07             	and    $0x7,%ecx
801011eb:	b8 01 00 00 00       	mov    $0x1,%eax
  if((bp->data[bi/8] & m) == 0)
801011f0:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
  m = 1 << (bi % 8);
801011f6:	d3 e0                	shl    %cl,%eax
  if((bp->data[bi/8] & m) == 0)
801011f8:	0f b6 4c 1e 5c       	movzbl 0x5c(%esi,%ebx,1),%ecx
801011fd:	85 c1                	test   %eax,%ecx
801011ff:	74 23                	je     80101224 <bfree+0x64>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101201:	f7 d0                	not    %eax
  log_write(bp);
80101203:	83 ec 0c             	sub    $0xc,%esp
  bp->data[bi/8] &= ~m;
80101206:	21 c8                	and    %ecx,%eax
80101208:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
  log_write(bp);
8010120c:	56                   	push   %esi
8010120d:	e8 fe 1e 00 00       	call   80103110 <log_write>
  brelse(bp);
80101212:	89 34 24             	mov    %esi,(%esp)
80101215:	e8 d6 ef ff ff       	call   801001f0 <brelse>
}
8010121a:	83 c4 10             	add    $0x10,%esp
8010121d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101220:	5b                   	pop    %ebx
80101221:	5e                   	pop    %esi
80101222:	5d                   	pop    %ebp
80101223:	c3                   	ret    
    panic("freeing free block");
80101224:	83 ec 0c             	sub    $0xc,%esp
80101227:	68 5f 75 10 80       	push   $0x8010755f
8010122c:	e8 4f f1 ff ff       	call   80100380 <panic>
80101231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101238:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010123f:	90                   	nop

80101240 <balloc>:
{
80101240:	55                   	push   %ebp
80101241:	89 e5                	mov    %esp,%ebp
80101243:	57                   	push   %edi
80101244:	56                   	push   %esi
80101245:	53                   	push   %ebx
80101246:	83 ec 1c             	sub    $0x1c,%esp
  for(b = 0; b < sb.size; b += BPB){
80101249:	8b 0d b4 15 11 80    	mov    0x801115b4,%ecx
{
8010124f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
80101252:	85 c9                	test   %ecx,%ecx
80101254:	0f 84 87 00 00 00    	je     801012e1 <balloc+0xa1>
8010125a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101261:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101264:	83 ec 08             	sub    $0x8,%esp
80101267:	89 f0                	mov    %esi,%eax
80101269:	c1 f8 0c             	sar    $0xc,%eax
8010126c:	03 05 cc 15 11 80    	add    0x801115cc,%eax
80101272:	50                   	push   %eax
80101273:	ff 75 d8             	push   -0x28(%ebp)
80101276:	e8 55 ee ff ff       	call   801000d0 <bread>
8010127b:	83 c4 10             	add    $0x10,%esp
8010127e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101281:	a1 b4 15 11 80       	mov    0x801115b4,%eax
80101286:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101289:	31 c0                	xor    %eax,%eax
8010128b:	eb 2f                	jmp    801012bc <balloc+0x7c>
8010128d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101290:	89 c1                	mov    %eax,%ecx
80101292:	bb 01 00 00 00       	mov    $0x1,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101297:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      m = 1 << (bi % 8);
8010129a:	83 e1 07             	and    $0x7,%ecx
8010129d:	d3 e3                	shl    %cl,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010129f:	89 c1                	mov    %eax,%ecx
801012a1:	c1 f9 03             	sar    $0x3,%ecx
801012a4:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
801012a9:	89 fa                	mov    %edi,%edx
801012ab:	85 df                	test   %ebx,%edi
801012ad:	74 41                	je     801012f0 <balloc+0xb0>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801012af:	83 c0 01             	add    $0x1,%eax
801012b2:	83 c6 01             	add    $0x1,%esi
801012b5:	3d 00 10 00 00       	cmp    $0x1000,%eax
801012ba:	74 05                	je     801012c1 <balloc+0x81>
801012bc:	39 75 e0             	cmp    %esi,-0x20(%ebp)
801012bf:	77 cf                	ja     80101290 <balloc+0x50>
    brelse(bp);
801012c1:	83 ec 0c             	sub    $0xc,%esp
801012c4:	ff 75 e4             	push   -0x1c(%ebp)
801012c7:	e8 24 ef ff ff       	call   801001f0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
801012cc:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801012d3:	83 c4 10             	add    $0x10,%esp
801012d6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801012d9:	39 05 b4 15 11 80    	cmp    %eax,0x801115b4
801012df:	77 80                	ja     80101261 <balloc+0x21>
  panic("balloc: out of blocks");
801012e1:	83 ec 0c             	sub    $0xc,%esp
801012e4:	68 72 75 10 80       	push   $0x80107572
801012e9:	e8 92 f0 ff ff       	call   80100380 <panic>
801012ee:	66 90                	xchg   %ax,%ax
        bp->data[bi/8] |= m;  // Mark block in use.
801012f0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801012f3:	83 ec 0c             	sub    $0xc,%esp
        bp->data[bi/8] |= m;  // Mark block in use.
801012f6:	09 da                	or     %ebx,%edx
801012f8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801012fc:	57                   	push   %edi
801012fd:	e8 0e 1e 00 00       	call   80103110 <log_write>
        brelse(bp);
80101302:	89 3c 24             	mov    %edi,(%esp)
80101305:	e8 e6 ee ff ff       	call   801001f0 <brelse>
  bp = bread(dev, bno);
8010130a:	58                   	pop    %eax
8010130b:	5a                   	pop    %edx
8010130c:	56                   	push   %esi
8010130d:	ff 75 d8             	push   -0x28(%ebp)
80101310:	e8 bb ed ff ff       	call   801000d0 <bread>
  memset(bp->data, 0, BSIZE);
80101315:	83 c4 0c             	add    $0xc,%esp
  bp = bread(dev, bno);
80101318:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
8010131a:	8d 40 5c             	lea    0x5c(%eax),%eax
8010131d:	68 00 02 00 00       	push   $0x200
80101322:	6a 00                	push   $0x0
80101324:	50                   	push   %eax
80101325:	e8 06 35 00 00       	call   80104830 <memset>
  log_write(bp);
8010132a:	89 1c 24             	mov    %ebx,(%esp)
8010132d:	e8 de 1d 00 00       	call   80103110 <log_write>
  brelse(bp);
80101332:	89 1c 24             	mov    %ebx,(%esp)
80101335:	e8 b6 ee ff ff       	call   801001f0 <brelse>
}
8010133a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010133d:	89 f0                	mov    %esi,%eax
8010133f:	5b                   	pop    %ebx
80101340:	5e                   	pop    %esi
80101341:	5f                   	pop    %edi
80101342:	5d                   	pop    %ebp
80101343:	c3                   	ret    
80101344:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010134b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010134f:	90                   	nop

80101350 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101350:	55                   	push   %ebp
80101351:	89 e5                	mov    %esp,%ebp
80101353:	57                   	push   %edi
80101354:	89 c7                	mov    %eax,%edi
80101356:	56                   	push   %esi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101357:	31 f6                	xor    %esi,%esi
{
80101359:	53                   	push   %ebx
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010135a:	bb 94 f9 10 80       	mov    $0x8010f994,%ebx
{
8010135f:	83 ec 28             	sub    $0x28,%esp
80101362:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
80101365:	68 60 f9 10 80       	push   $0x8010f960
8010136a:	e8 01 34 00 00       	call   80104770 <acquire>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010136f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  acquire(&icache.lock);
80101372:	83 c4 10             	add    $0x10,%esp
80101375:	eb 1b                	jmp    80101392 <iget+0x42>
80101377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010137e:	66 90                	xchg   %ax,%ax
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101380:	39 3b                	cmp    %edi,(%ebx)
80101382:	74 6c                	je     801013f0 <iget+0xa0>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101384:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010138a:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
80101390:	73 26                	jae    801013b8 <iget+0x68>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101392:	8b 43 08             	mov    0x8(%ebx),%eax
80101395:	85 c0                	test   %eax,%eax
80101397:	7f e7                	jg     80101380 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101399:	85 f6                	test   %esi,%esi
8010139b:	75 e7                	jne    80101384 <iget+0x34>
8010139d:	85 c0                	test   %eax,%eax
8010139f:	75 76                	jne    80101417 <iget+0xc7>
801013a1:	89 de                	mov    %ebx,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801013a3:	81 c3 90 00 00 00    	add    $0x90,%ebx
801013a9:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
801013af:	72 e1                	jb     80101392 <iget+0x42>
801013b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801013b8:	85 f6                	test   %esi,%esi
801013ba:	74 79                	je     80101435 <iget+0xe5>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
801013bc:	83 ec 0c             	sub    $0xc,%esp
  ip->dev = dev;
801013bf:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
801013c1:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
801013c4:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
801013cb:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801013d2:	68 60 f9 10 80       	push   $0x8010f960
801013d7:	e8 34 33 00 00       	call   80104710 <release>

  return ip;
801013dc:	83 c4 10             	add    $0x10,%esp
}
801013df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013e2:	89 f0                	mov    %esi,%eax
801013e4:	5b                   	pop    %ebx
801013e5:	5e                   	pop    %esi
801013e6:	5f                   	pop    %edi
801013e7:	5d                   	pop    %ebp
801013e8:	c3                   	ret    
801013e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801013f0:	39 53 04             	cmp    %edx,0x4(%ebx)
801013f3:	75 8f                	jne    80101384 <iget+0x34>
      release(&icache.lock);
801013f5:	83 ec 0c             	sub    $0xc,%esp
      ip->ref++;
801013f8:	83 c0 01             	add    $0x1,%eax
      return ip;
801013fb:	89 de                	mov    %ebx,%esi
      release(&icache.lock);
801013fd:	68 60 f9 10 80       	push   $0x8010f960
      ip->ref++;
80101402:	89 43 08             	mov    %eax,0x8(%ebx)
      release(&icache.lock);
80101405:	e8 06 33 00 00       	call   80104710 <release>
      return ip;
8010140a:	83 c4 10             	add    $0x10,%esp
}
8010140d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101410:	89 f0                	mov    %esi,%eax
80101412:	5b                   	pop    %ebx
80101413:	5e                   	pop    %esi
80101414:	5f                   	pop    %edi
80101415:	5d                   	pop    %ebp
80101416:	c3                   	ret    
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101417:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010141d:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
80101423:	73 10                	jae    80101435 <iget+0xe5>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101425:	8b 43 08             	mov    0x8(%ebx),%eax
80101428:	85 c0                	test   %eax,%eax
8010142a:	0f 8f 50 ff ff ff    	jg     80101380 <iget+0x30>
80101430:	e9 68 ff ff ff       	jmp    8010139d <iget+0x4d>
    panic("iget: no inodes");
80101435:	83 ec 0c             	sub    $0xc,%esp
80101438:	68 88 75 10 80       	push   $0x80107588
8010143d:	e8 3e ef ff ff       	call   80100380 <panic>
80101442:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101450 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101450:	55                   	push   %ebp
80101451:	89 e5                	mov    %esp,%ebp
80101453:	57                   	push   %edi
80101454:	56                   	push   %esi
80101455:	89 c6                	mov    %eax,%esi
80101457:	53                   	push   %ebx
80101458:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
8010145b:	83 fa 0b             	cmp    $0xb,%edx
8010145e:	0f 86 8c 00 00 00    	jbe    801014f0 <bmap+0xa0>
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101464:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
80101467:	83 fb 7f             	cmp    $0x7f,%ebx
8010146a:	0f 87 a2 00 00 00    	ja     80101512 <bmap+0xc2>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101470:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101476:	85 c0                	test   %eax,%eax
80101478:	74 5e                	je     801014d8 <bmap+0x88>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010147a:	83 ec 08             	sub    $0x8,%esp
8010147d:	50                   	push   %eax
8010147e:	ff 36                	push   (%esi)
80101480:	e8 4b ec ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101485:	83 c4 10             	add    $0x10,%esp
80101488:	8d 5c 98 5c          	lea    0x5c(%eax,%ebx,4),%ebx
    bp = bread(ip->dev, addr);
8010148c:	89 c2                	mov    %eax,%edx
    if((addr = a[bn]) == 0){
8010148e:	8b 3b                	mov    (%ebx),%edi
80101490:	85 ff                	test   %edi,%edi
80101492:	74 1c                	je     801014b0 <bmap+0x60>
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101494:	83 ec 0c             	sub    $0xc,%esp
80101497:	52                   	push   %edx
80101498:	e8 53 ed ff ff       	call   801001f0 <brelse>
8010149d:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
801014a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801014a3:	89 f8                	mov    %edi,%eax
801014a5:	5b                   	pop    %ebx
801014a6:	5e                   	pop    %esi
801014a7:	5f                   	pop    %edi
801014a8:	5d                   	pop    %ebp
801014a9:	c3                   	ret    
801014aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801014b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      a[bn] = addr = balloc(ip->dev);
801014b3:	8b 06                	mov    (%esi),%eax
801014b5:	e8 86 fd ff ff       	call   80101240 <balloc>
      log_write(bp);
801014ba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801014bd:	83 ec 0c             	sub    $0xc,%esp
      a[bn] = addr = balloc(ip->dev);
801014c0:	89 03                	mov    %eax,(%ebx)
801014c2:	89 c7                	mov    %eax,%edi
      log_write(bp);
801014c4:	52                   	push   %edx
801014c5:	e8 46 1c 00 00       	call   80103110 <log_write>
801014ca:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801014cd:	83 c4 10             	add    $0x10,%esp
801014d0:	eb c2                	jmp    80101494 <bmap+0x44>
801014d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801014d8:	8b 06                	mov    (%esi),%eax
801014da:	e8 61 fd ff ff       	call   80101240 <balloc>
801014df:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801014e5:	eb 93                	jmp    8010147a <bmap+0x2a>
801014e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801014ee:	66 90                	xchg   %ax,%ax
    if((addr = ip->addrs[bn]) == 0)
801014f0:	8d 5a 14             	lea    0x14(%edx),%ebx
801014f3:	8b 7c 98 0c          	mov    0xc(%eax,%ebx,4),%edi
801014f7:	85 ff                	test   %edi,%edi
801014f9:	75 a5                	jne    801014a0 <bmap+0x50>
      ip->addrs[bn] = addr = balloc(ip->dev);
801014fb:	8b 00                	mov    (%eax),%eax
801014fd:	e8 3e fd ff ff       	call   80101240 <balloc>
80101502:	89 44 9e 0c          	mov    %eax,0xc(%esi,%ebx,4)
80101506:	89 c7                	mov    %eax,%edi
}
80101508:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010150b:	5b                   	pop    %ebx
8010150c:	89 f8                	mov    %edi,%eax
8010150e:	5e                   	pop    %esi
8010150f:	5f                   	pop    %edi
80101510:	5d                   	pop    %ebp
80101511:	c3                   	ret    
  panic("bmap: out of range");
80101512:	83 ec 0c             	sub    $0xc,%esp
80101515:	68 98 75 10 80       	push   $0x80107598
8010151a:	e8 61 ee ff ff       	call   80100380 <panic>
8010151f:	90                   	nop

80101520 <readsb>:
{
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	56                   	push   %esi
80101524:	53                   	push   %ebx
80101525:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
80101528:	83 ec 08             	sub    $0x8,%esp
8010152b:	6a 01                	push   $0x1
8010152d:	ff 75 08             	push   0x8(%ebp)
80101530:	e8 9b eb ff ff       	call   801000d0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
80101535:	83 c4 0c             	add    $0xc,%esp
  bp = bread(dev, 1);
80101538:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
8010153a:	8d 40 5c             	lea    0x5c(%eax),%eax
8010153d:	6a 1c                	push   $0x1c
8010153f:	50                   	push   %eax
80101540:	56                   	push   %esi
80101541:	e8 8a 33 00 00       	call   801048d0 <memmove>
  brelse(bp);
80101546:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101549:	83 c4 10             	add    $0x10,%esp
}
8010154c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010154f:	5b                   	pop    %ebx
80101550:	5e                   	pop    %esi
80101551:	5d                   	pop    %ebp
  brelse(bp);
80101552:	e9 99 ec ff ff       	jmp    801001f0 <brelse>
80101557:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010155e:	66 90                	xchg   %ax,%ax

80101560 <iinit>:
{
80101560:	55                   	push   %ebp
80101561:	89 e5                	mov    %esp,%ebp
80101563:	53                   	push   %ebx
80101564:	bb a0 f9 10 80       	mov    $0x8010f9a0,%ebx
80101569:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
8010156c:	68 ab 75 10 80       	push   $0x801075ab
80101571:	68 60 f9 10 80       	push   $0x8010f960
80101576:	e8 25 30 00 00       	call   801045a0 <initlock>
  for(i = 0; i < NINODE; i++) {
8010157b:	83 c4 10             	add    $0x10,%esp
8010157e:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
80101580:	83 ec 08             	sub    $0x8,%esp
80101583:	68 b2 75 10 80       	push   $0x801075b2
80101588:	53                   	push   %ebx
  for(i = 0; i < NINODE; i++) {
80101589:	81 c3 90 00 00 00    	add    $0x90,%ebx
    initsleeplock(&icache.inode[i].lock, "inode");
8010158f:	e8 dc 2e 00 00       	call   80104470 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
80101594:	83 c4 10             	add    $0x10,%esp
80101597:	81 fb c0 15 11 80    	cmp    $0x801115c0,%ebx
8010159d:	75 e1                	jne    80101580 <iinit+0x20>
  bp = bread(dev, 1);
8010159f:	83 ec 08             	sub    $0x8,%esp
801015a2:	6a 01                	push   $0x1
801015a4:	ff 75 08             	push   0x8(%ebp)
801015a7:	e8 24 eb ff ff       	call   801000d0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
801015ac:	83 c4 0c             	add    $0xc,%esp
  bp = bread(dev, 1);
801015af:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801015b1:	8d 40 5c             	lea    0x5c(%eax),%eax
801015b4:	6a 1c                	push   $0x1c
801015b6:	50                   	push   %eax
801015b7:	68 b4 15 11 80       	push   $0x801115b4
801015bc:	e8 0f 33 00 00       	call   801048d0 <memmove>
  brelse(bp);
801015c1:	89 1c 24             	mov    %ebx,(%esp)
801015c4:	e8 27 ec ff ff       	call   801001f0 <brelse>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801015c9:	ff 35 cc 15 11 80    	push   0x801115cc
801015cf:	ff 35 c8 15 11 80    	push   0x801115c8
801015d5:	ff 35 c4 15 11 80    	push   0x801115c4
801015db:	ff 35 c0 15 11 80    	push   0x801115c0
801015e1:	ff 35 bc 15 11 80    	push   0x801115bc
801015e7:	ff 35 b8 15 11 80    	push   0x801115b8
801015ed:	ff 35 b4 15 11 80    	push   0x801115b4
801015f3:	68 18 76 10 80       	push   $0x80107618
801015f8:	e8 a3 f0 ff ff       	call   801006a0 <cprintf>
}
801015fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101600:	83 c4 30             	add    $0x30,%esp
80101603:	c9                   	leave  
80101604:	c3                   	ret    
80101605:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010160c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101610 <ialloc>:
{
80101610:	55                   	push   %ebp
80101611:	89 e5                	mov    %esp,%ebp
80101613:	57                   	push   %edi
80101614:	56                   	push   %esi
80101615:	53                   	push   %ebx
80101616:	83 ec 1c             	sub    $0x1c,%esp
80101619:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(inum = 1; inum < sb.ninodes; inum++){
8010161c:	83 3d bc 15 11 80 01 	cmpl   $0x1,0x801115bc
{
80101623:	8b 75 08             	mov    0x8(%ebp),%esi
80101626:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101629:	0f 86 91 00 00 00    	jbe    801016c0 <ialloc+0xb0>
8010162f:	bf 01 00 00 00       	mov    $0x1,%edi
80101634:	eb 21                	jmp    80101657 <ialloc+0x47>
80101636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010163d:	8d 76 00             	lea    0x0(%esi),%esi
    brelse(bp);
80101640:	83 ec 0c             	sub    $0xc,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101643:	83 c7 01             	add    $0x1,%edi
    brelse(bp);
80101646:	53                   	push   %ebx
80101647:	e8 a4 eb ff ff       	call   801001f0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
8010164c:	83 c4 10             	add    $0x10,%esp
8010164f:	3b 3d bc 15 11 80    	cmp    0x801115bc,%edi
80101655:	73 69                	jae    801016c0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101657:	89 f8                	mov    %edi,%eax
80101659:	83 ec 08             	sub    $0x8,%esp
8010165c:	c1 e8 03             	shr    $0x3,%eax
8010165f:	03 05 c8 15 11 80    	add    0x801115c8,%eax
80101665:	50                   	push   %eax
80101666:	56                   	push   %esi
80101667:	e8 64 ea ff ff       	call   801000d0 <bread>
    if(dip->type == 0){  // a free inode
8010166c:	83 c4 10             	add    $0x10,%esp
    bp = bread(dev, IBLOCK(inum, sb));
8010166f:	89 c3                	mov    %eax,%ebx
    dip = (struct dinode*)bp->data + inum%IPB;
80101671:	89 f8                	mov    %edi,%eax
80101673:	83 e0 07             	and    $0x7,%eax
80101676:	c1 e0 06             	shl    $0x6,%eax
80101679:	8d 4c 03 5c          	lea    0x5c(%ebx,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010167d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101681:	75 bd                	jne    80101640 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101683:	83 ec 04             	sub    $0x4,%esp
80101686:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101689:	6a 40                	push   $0x40
8010168b:	6a 00                	push   $0x0
8010168d:	51                   	push   %ecx
8010168e:	e8 9d 31 00 00       	call   80104830 <memset>
      dip->type = type;
80101693:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101697:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010169a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010169d:	89 1c 24             	mov    %ebx,(%esp)
801016a0:	e8 6b 1a 00 00       	call   80103110 <log_write>
      brelse(bp);
801016a5:	89 1c 24             	mov    %ebx,(%esp)
801016a8:	e8 43 eb ff ff       	call   801001f0 <brelse>
      return iget(dev, inum);
801016ad:	83 c4 10             	add    $0x10,%esp
}
801016b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return iget(dev, inum);
801016b3:	89 fa                	mov    %edi,%edx
}
801016b5:	5b                   	pop    %ebx
      return iget(dev, inum);
801016b6:	89 f0                	mov    %esi,%eax
}
801016b8:	5e                   	pop    %esi
801016b9:	5f                   	pop    %edi
801016ba:	5d                   	pop    %ebp
      return iget(dev, inum);
801016bb:	e9 90 fc ff ff       	jmp    80101350 <iget>
  panic("ialloc: no inodes");
801016c0:	83 ec 0c             	sub    $0xc,%esp
801016c3:	68 b8 75 10 80       	push   $0x801075b8
801016c8:	e8 b3 ec ff ff       	call   80100380 <panic>
801016cd:	8d 76 00             	lea    0x0(%esi),%esi

801016d0 <iupdate>:
{
801016d0:	55                   	push   %ebp
801016d1:	89 e5                	mov    %esp,%ebp
801016d3:	56                   	push   %esi
801016d4:	53                   	push   %ebx
801016d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016d8:	8b 43 04             	mov    0x4(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016db:	83 c3 5c             	add    $0x5c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016de:	83 ec 08             	sub    $0x8,%esp
801016e1:	c1 e8 03             	shr    $0x3,%eax
801016e4:	03 05 c8 15 11 80    	add    0x801115c8,%eax
801016ea:	50                   	push   %eax
801016eb:	ff 73 a4             	push   -0x5c(%ebx)
801016ee:	e8 dd e9 ff ff       	call   801000d0 <bread>
  dip->type = ip->type;
801016f3:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016f7:	83 c4 0c             	add    $0xc,%esp
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016fa:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801016fc:	8b 43 a8             	mov    -0x58(%ebx),%eax
801016ff:	83 e0 07             	and    $0x7,%eax
80101702:	c1 e0 06             	shl    $0x6,%eax
80101705:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
80101709:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010170c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101710:	83 c0 0c             	add    $0xc,%eax
  dip->major = ip->major;
80101713:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101717:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010171b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010171f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101723:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101727:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010172a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010172d:	6a 34                	push   $0x34
8010172f:	53                   	push   %ebx
80101730:	50                   	push   %eax
80101731:	e8 9a 31 00 00       	call   801048d0 <memmove>
  log_write(bp);
80101736:	89 34 24             	mov    %esi,(%esp)
80101739:	e8 d2 19 00 00       	call   80103110 <log_write>
  brelse(bp);
8010173e:	89 75 08             	mov    %esi,0x8(%ebp)
80101741:	83 c4 10             	add    $0x10,%esp
}
80101744:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101747:	5b                   	pop    %ebx
80101748:	5e                   	pop    %esi
80101749:	5d                   	pop    %ebp
  brelse(bp);
8010174a:	e9 a1 ea ff ff       	jmp    801001f0 <brelse>
8010174f:	90                   	nop

80101750 <idup>:
{
80101750:	55                   	push   %ebp
80101751:	89 e5                	mov    %esp,%ebp
80101753:	53                   	push   %ebx
80101754:	83 ec 10             	sub    $0x10,%esp
80101757:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010175a:	68 60 f9 10 80       	push   $0x8010f960
8010175f:	e8 0c 30 00 00       	call   80104770 <acquire>
  ip->ref++;
80101764:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101768:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
8010176f:	e8 9c 2f 00 00       	call   80104710 <release>
}
80101774:	89 d8                	mov    %ebx,%eax
80101776:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101779:	c9                   	leave  
8010177a:	c3                   	ret    
8010177b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010177f:	90                   	nop

80101780 <ilock>:
{
80101780:	55                   	push   %ebp
80101781:	89 e5                	mov    %esp,%ebp
80101783:	56                   	push   %esi
80101784:	53                   	push   %ebx
80101785:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
80101788:	85 db                	test   %ebx,%ebx
8010178a:	0f 84 b7 00 00 00    	je     80101847 <ilock+0xc7>
80101790:	8b 53 08             	mov    0x8(%ebx),%edx
80101793:	85 d2                	test   %edx,%edx
80101795:	0f 8e ac 00 00 00    	jle    80101847 <ilock+0xc7>
  acquiresleep(&ip->lock);
8010179b:	83 ec 0c             	sub    $0xc,%esp
8010179e:	8d 43 0c             	lea    0xc(%ebx),%eax
801017a1:	50                   	push   %eax
801017a2:	e8 09 2d 00 00       	call   801044b0 <acquiresleep>
  if(ip->valid == 0){
801017a7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801017aa:	83 c4 10             	add    $0x10,%esp
801017ad:	85 c0                	test   %eax,%eax
801017af:	74 0f                	je     801017c0 <ilock+0x40>
}
801017b1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801017b4:	5b                   	pop    %ebx
801017b5:	5e                   	pop    %esi
801017b6:	5d                   	pop    %ebp
801017b7:	c3                   	ret    
801017b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801017bf:	90                   	nop
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801017c0:	8b 43 04             	mov    0x4(%ebx),%eax
801017c3:	83 ec 08             	sub    $0x8,%esp
801017c6:	c1 e8 03             	shr    $0x3,%eax
801017c9:	03 05 c8 15 11 80    	add    0x801115c8,%eax
801017cf:	50                   	push   %eax
801017d0:	ff 33                	push   (%ebx)
801017d2:	e8 f9 e8 ff ff       	call   801000d0 <bread>
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801017d7:	83 c4 0c             	add    $0xc,%esp
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801017da:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801017dc:	8b 43 04             	mov    0x4(%ebx),%eax
801017df:	83 e0 07             	and    $0x7,%eax
801017e2:	c1 e0 06             	shl    $0x6,%eax
801017e5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801017e9:	0f b7 10             	movzwl (%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801017ec:	83 c0 0c             	add    $0xc,%eax
    ip->type = dip->type;
801017ef:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801017f3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801017f7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801017fb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801017ff:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101803:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101807:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
8010180b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010180e:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101811:	6a 34                	push   $0x34
80101813:	50                   	push   %eax
80101814:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101817:	50                   	push   %eax
80101818:	e8 b3 30 00 00       	call   801048d0 <memmove>
    brelse(bp);
8010181d:	89 34 24             	mov    %esi,(%esp)
80101820:	e8 cb e9 ff ff       	call   801001f0 <brelse>
    if(ip->type == 0)
80101825:	83 c4 10             	add    $0x10,%esp
80101828:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->valid = 1;
8010182d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101834:	0f 85 77 ff ff ff    	jne    801017b1 <ilock+0x31>
      panic("ilock: no type");
8010183a:	83 ec 0c             	sub    $0xc,%esp
8010183d:	68 d0 75 10 80       	push   $0x801075d0
80101842:	e8 39 eb ff ff       	call   80100380 <panic>
    panic("ilock");
80101847:	83 ec 0c             	sub    $0xc,%esp
8010184a:	68 ca 75 10 80       	push   $0x801075ca
8010184f:	e8 2c eb ff ff       	call   80100380 <panic>
80101854:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010185b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010185f:	90                   	nop

80101860 <iunlock>:
{
80101860:	55                   	push   %ebp
80101861:	89 e5                	mov    %esp,%ebp
80101863:	56                   	push   %esi
80101864:	53                   	push   %ebx
80101865:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101868:	85 db                	test   %ebx,%ebx
8010186a:	74 28                	je     80101894 <iunlock+0x34>
8010186c:	83 ec 0c             	sub    $0xc,%esp
8010186f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101872:	56                   	push   %esi
80101873:	e8 d8 2c 00 00       	call   80104550 <holdingsleep>
80101878:	83 c4 10             	add    $0x10,%esp
8010187b:	85 c0                	test   %eax,%eax
8010187d:	74 15                	je     80101894 <iunlock+0x34>
8010187f:	8b 43 08             	mov    0x8(%ebx),%eax
80101882:	85 c0                	test   %eax,%eax
80101884:	7e 0e                	jle    80101894 <iunlock+0x34>
  releasesleep(&ip->lock);
80101886:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101889:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010188c:	5b                   	pop    %ebx
8010188d:	5e                   	pop    %esi
8010188e:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
8010188f:	e9 7c 2c 00 00       	jmp    80104510 <releasesleep>
    panic("iunlock");
80101894:	83 ec 0c             	sub    $0xc,%esp
80101897:	68 df 75 10 80       	push   $0x801075df
8010189c:	e8 df ea ff ff       	call   80100380 <panic>
801018a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018af:	90                   	nop

801018b0 <iput>:
{
801018b0:	55                   	push   %ebp
801018b1:	89 e5                	mov    %esp,%ebp
801018b3:	57                   	push   %edi
801018b4:	56                   	push   %esi
801018b5:	53                   	push   %ebx
801018b6:	83 ec 28             	sub    $0x28,%esp
801018b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquiresleep(&ip->lock);
801018bc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801018bf:	57                   	push   %edi
801018c0:	e8 eb 2b 00 00       	call   801044b0 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801018c5:	8b 53 4c             	mov    0x4c(%ebx),%edx
801018c8:	83 c4 10             	add    $0x10,%esp
801018cb:	85 d2                	test   %edx,%edx
801018cd:	74 07                	je     801018d6 <iput+0x26>
801018cf:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801018d4:	74 32                	je     80101908 <iput+0x58>
  releasesleep(&ip->lock);
801018d6:	83 ec 0c             	sub    $0xc,%esp
801018d9:	57                   	push   %edi
801018da:	e8 31 2c 00 00       	call   80104510 <releasesleep>
  acquire(&icache.lock);
801018df:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
801018e6:	e8 85 2e 00 00       	call   80104770 <acquire>
  ip->ref--;
801018eb:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
  release(&icache.lock);
801018ef:	83 c4 10             	add    $0x10,%esp
801018f2:	c7 45 08 60 f9 10 80 	movl   $0x8010f960,0x8(%ebp)
}
801018f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801018fc:	5b                   	pop    %ebx
801018fd:	5e                   	pop    %esi
801018fe:	5f                   	pop    %edi
801018ff:	5d                   	pop    %ebp
  release(&icache.lock);
80101900:	e9 0b 2e 00 00       	jmp    80104710 <release>
80101905:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
80101908:	83 ec 0c             	sub    $0xc,%esp
8010190b:	68 60 f9 10 80       	push   $0x8010f960
80101910:	e8 5b 2e 00 00       	call   80104770 <acquire>
    int r = ip->ref;
80101915:	8b 73 08             	mov    0x8(%ebx),%esi
    release(&icache.lock);
80101918:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
8010191f:	e8 ec 2d 00 00       	call   80104710 <release>
    if(r == 1){
80101924:	83 c4 10             	add    $0x10,%esp
80101927:	83 fe 01             	cmp    $0x1,%esi
8010192a:	75 aa                	jne    801018d6 <iput+0x26>
8010192c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101932:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101935:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101938:	89 cf                	mov    %ecx,%edi
8010193a:	eb 0b                	jmp    80101947 <iput+0x97>
8010193c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101940:	83 c6 04             	add    $0x4,%esi
80101943:	39 fe                	cmp    %edi,%esi
80101945:	74 19                	je     80101960 <iput+0xb0>
    if(ip->addrs[i]){
80101947:	8b 16                	mov    (%esi),%edx
80101949:	85 d2                	test   %edx,%edx
8010194b:	74 f3                	je     80101940 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010194d:	8b 03                	mov    (%ebx),%eax
8010194f:	e8 6c f8 ff ff       	call   801011c0 <bfree>
      ip->addrs[i] = 0;
80101954:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010195a:	eb e4                	jmp    80101940 <iput+0x90>
8010195c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101960:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80101966:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101969:	85 c0                	test   %eax,%eax
8010196b:	75 2d                	jne    8010199a <iput+0xea>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010196d:	83 ec 0c             	sub    $0xc,%esp
  ip->size = 0;
80101970:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  iupdate(ip);
80101977:	53                   	push   %ebx
80101978:	e8 53 fd ff ff       	call   801016d0 <iupdate>
      ip->type = 0;
8010197d:	31 c0                	xor    %eax,%eax
8010197f:	66 89 43 50          	mov    %ax,0x50(%ebx)
      iupdate(ip);
80101983:	89 1c 24             	mov    %ebx,(%esp)
80101986:	e8 45 fd ff ff       	call   801016d0 <iupdate>
      ip->valid = 0;
8010198b:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
80101992:	83 c4 10             	add    $0x10,%esp
80101995:	e9 3c ff ff ff       	jmp    801018d6 <iput+0x26>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
8010199a:	83 ec 08             	sub    $0x8,%esp
8010199d:	50                   	push   %eax
8010199e:	ff 33                	push   (%ebx)
801019a0:	e8 2b e7 ff ff       	call   801000d0 <bread>
801019a5:	89 7d e0             	mov    %edi,-0x20(%ebp)
801019a8:	83 c4 10             	add    $0x10,%esp
801019ab:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801019b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(j = 0; j < NINDIRECT; j++){
801019b4:	8d 70 5c             	lea    0x5c(%eax),%esi
801019b7:	89 cf                	mov    %ecx,%edi
801019b9:	eb 0c                	jmp    801019c7 <iput+0x117>
801019bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801019bf:	90                   	nop
801019c0:	83 c6 04             	add    $0x4,%esi
801019c3:	39 f7                	cmp    %esi,%edi
801019c5:	74 0f                	je     801019d6 <iput+0x126>
      if(a[j])
801019c7:	8b 16                	mov    (%esi),%edx
801019c9:	85 d2                	test   %edx,%edx
801019cb:	74 f3                	je     801019c0 <iput+0x110>
        bfree(ip->dev, a[j]);
801019cd:	8b 03                	mov    (%ebx),%eax
801019cf:	e8 ec f7 ff ff       	call   801011c0 <bfree>
801019d4:	eb ea                	jmp    801019c0 <iput+0x110>
    brelse(bp);
801019d6:	83 ec 0c             	sub    $0xc,%esp
801019d9:	ff 75 e4             	push   -0x1c(%ebp)
801019dc:	8b 7d e0             	mov    -0x20(%ebp),%edi
801019df:	e8 0c e8 ff ff       	call   801001f0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801019e4:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
801019ea:	8b 03                	mov    (%ebx),%eax
801019ec:	e8 cf f7 ff ff       	call   801011c0 <bfree>
    ip->addrs[NDIRECT] = 0;
801019f1:	83 c4 10             	add    $0x10,%esp
801019f4:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
801019fb:	00 00 00 
801019fe:	e9 6a ff ff ff       	jmp    8010196d <iput+0xbd>
80101a03:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101a10 <iunlockput>:
{
80101a10:	55                   	push   %ebp
80101a11:	89 e5                	mov    %esp,%ebp
80101a13:	56                   	push   %esi
80101a14:	53                   	push   %ebx
80101a15:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101a18:	85 db                	test   %ebx,%ebx
80101a1a:	74 34                	je     80101a50 <iunlockput+0x40>
80101a1c:	83 ec 0c             	sub    $0xc,%esp
80101a1f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101a22:	56                   	push   %esi
80101a23:	e8 28 2b 00 00       	call   80104550 <holdingsleep>
80101a28:	83 c4 10             	add    $0x10,%esp
80101a2b:	85 c0                	test   %eax,%eax
80101a2d:	74 21                	je     80101a50 <iunlockput+0x40>
80101a2f:	8b 43 08             	mov    0x8(%ebx),%eax
80101a32:	85 c0                	test   %eax,%eax
80101a34:	7e 1a                	jle    80101a50 <iunlockput+0x40>
  releasesleep(&ip->lock);
80101a36:	83 ec 0c             	sub    $0xc,%esp
80101a39:	56                   	push   %esi
80101a3a:	e8 d1 2a 00 00       	call   80104510 <releasesleep>
  iput(ip);
80101a3f:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101a42:	83 c4 10             	add    $0x10,%esp
}
80101a45:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101a48:	5b                   	pop    %ebx
80101a49:	5e                   	pop    %esi
80101a4a:	5d                   	pop    %ebp
  iput(ip);
80101a4b:	e9 60 fe ff ff       	jmp    801018b0 <iput>
    panic("iunlock");
80101a50:	83 ec 0c             	sub    $0xc,%esp
80101a53:	68 df 75 10 80       	push   $0x801075df
80101a58:	e8 23 e9 ff ff       	call   80100380 <panic>
80101a5d:	8d 76 00             	lea    0x0(%esi),%esi

80101a60 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101a60:	55                   	push   %ebp
80101a61:	89 e5                	mov    %esp,%ebp
80101a63:	8b 55 08             	mov    0x8(%ebp),%edx
80101a66:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101a69:	8b 0a                	mov    (%edx),%ecx
80101a6b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
80101a6e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101a71:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101a74:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101a78:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
80101a7b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
80101a7f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101a83:	8b 52 58             	mov    0x58(%edx),%edx
80101a86:	89 50 10             	mov    %edx,0x10(%eax)
}
80101a89:	5d                   	pop    %ebp
80101a8a:	c3                   	ret    
80101a8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101a8f:	90                   	nop

80101a90 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101a90:	55                   	push   %ebp
80101a91:	89 e5                	mov    %esp,%ebp
80101a93:	57                   	push   %edi
80101a94:	56                   	push   %esi
80101a95:	53                   	push   %ebx
80101a96:	83 ec 1c             	sub    $0x1c,%esp
80101a99:	8b 7d 0c             	mov    0xc(%ebp),%edi
80101a9c:	8b 45 08             	mov    0x8(%ebp),%eax
80101a9f:	8b 75 10             	mov    0x10(%ebp),%esi
80101aa2:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101aa5:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101aa8:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101aad:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101ab0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  if(ip->type == T_DEV){
80101ab3:	0f 84 a7 00 00 00    	je     80101b60 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101ab9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101abc:	8b 40 58             	mov    0x58(%eax),%eax
80101abf:	39 c6                	cmp    %eax,%esi
80101ac1:	0f 87 ba 00 00 00    	ja     80101b81 <readi+0xf1>
80101ac7:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101aca:	31 c9                	xor    %ecx,%ecx
80101acc:	89 da                	mov    %ebx,%edx
80101ace:	01 f2                	add    %esi,%edx
80101ad0:	0f 92 c1             	setb   %cl
80101ad3:	89 cf                	mov    %ecx,%edi
80101ad5:	0f 82 a6 00 00 00    	jb     80101b81 <readi+0xf1>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101adb:	89 c1                	mov    %eax,%ecx
80101add:	29 f1                	sub    %esi,%ecx
80101adf:	39 d0                	cmp    %edx,%eax
80101ae1:	0f 43 cb             	cmovae %ebx,%ecx
80101ae4:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101ae7:	85 c9                	test   %ecx,%ecx
80101ae9:	74 67                	je     80101b52 <readi+0xc2>
80101aeb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101aef:	90                   	nop
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101af0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101af3:	89 f2                	mov    %esi,%edx
80101af5:	c1 ea 09             	shr    $0x9,%edx
80101af8:	89 d8                	mov    %ebx,%eax
80101afa:	e8 51 f9 ff ff       	call   80101450 <bmap>
80101aff:	83 ec 08             	sub    $0x8,%esp
80101b02:	50                   	push   %eax
80101b03:	ff 33                	push   (%ebx)
80101b05:	e8 c6 e5 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101b0a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101b0d:	b9 00 02 00 00       	mov    $0x200,%ecx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b12:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101b14:	89 f0                	mov    %esi,%eax
80101b16:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b1b:	29 fb                	sub    %edi,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101b1d:	89 55 dc             	mov    %edx,-0x24(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101b20:	29 c1                	sub    %eax,%ecx
    memmove(dst, bp->data + off%BSIZE, m);
80101b22:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101b26:	39 d9                	cmp    %ebx,%ecx
80101b28:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101b2b:	83 c4 0c             	add    $0xc,%esp
80101b2e:	53                   	push   %ebx
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101b2f:	01 df                	add    %ebx,%edi
80101b31:	01 de                	add    %ebx,%esi
    memmove(dst, bp->data + off%BSIZE, m);
80101b33:	50                   	push   %eax
80101b34:	ff 75 e0             	push   -0x20(%ebp)
80101b37:	e8 94 2d 00 00       	call   801048d0 <memmove>
    brelse(bp);
80101b3c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101b3f:	89 14 24             	mov    %edx,(%esp)
80101b42:	e8 a9 e6 ff ff       	call   801001f0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101b47:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101b4a:	83 c4 10             	add    $0x10,%esp
80101b4d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101b50:	77 9e                	ja     80101af0 <readi+0x60>
  }
  return n;
80101b52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101b55:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b58:	5b                   	pop    %ebx
80101b59:	5e                   	pop    %esi
80101b5a:	5f                   	pop    %edi
80101b5b:	5d                   	pop    %ebp
80101b5c:	c3                   	ret    
80101b5d:	8d 76 00             	lea    0x0(%esi),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101b60:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b64:	66 83 f8 09          	cmp    $0x9,%ax
80101b68:	77 17                	ja     80101b81 <readi+0xf1>
80101b6a:	8b 04 c5 00 f9 10 80 	mov    -0x7fef0700(,%eax,8),%eax
80101b71:	85 c0                	test   %eax,%eax
80101b73:	74 0c                	je     80101b81 <readi+0xf1>
    return devsw[ip->major].read(ip, dst, n);
80101b75:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101b78:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b7b:	5b                   	pop    %ebx
80101b7c:	5e                   	pop    %esi
80101b7d:	5f                   	pop    %edi
80101b7e:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101b7f:	ff e0                	jmp    *%eax
      return -1;
80101b81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b86:	eb cd                	jmp    80101b55 <readi+0xc5>
80101b88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b8f:	90                   	nop

80101b90 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101b90:	55                   	push   %ebp
80101b91:	89 e5                	mov    %esp,%ebp
80101b93:	57                   	push   %edi
80101b94:	56                   	push   %esi
80101b95:	53                   	push   %ebx
80101b96:	83 ec 1c             	sub    $0x1c,%esp
80101b99:	8b 45 08             	mov    0x8(%ebp),%eax
80101b9c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101b9f:	8b 55 14             	mov    0x14(%ebp),%edx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101ba2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101ba7:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101baa:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101bad:	8b 75 10             	mov    0x10(%ebp),%esi
80101bb0:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(ip->type == T_DEV){
80101bb3:	0f 84 b7 00 00 00    	je     80101c70 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101bb9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101bbc:	3b 70 58             	cmp    0x58(%eax),%esi
80101bbf:	0f 87 e7 00 00 00    	ja     80101cac <writei+0x11c>
80101bc5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101bc8:	31 d2                	xor    %edx,%edx
80101bca:	89 f8                	mov    %edi,%eax
80101bcc:	01 f0                	add    %esi,%eax
80101bce:	0f 92 c2             	setb   %dl
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101bd1:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101bd6:	0f 87 d0 00 00 00    	ja     80101cac <writei+0x11c>
80101bdc:	85 d2                	test   %edx,%edx
80101bde:	0f 85 c8 00 00 00    	jne    80101cac <writei+0x11c>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101be4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101beb:	85 ff                	test   %edi,%edi
80101bed:	74 72                	je     80101c61 <writei+0xd1>
80101bef:	90                   	nop
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101bf0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101bf3:	89 f2                	mov    %esi,%edx
80101bf5:	c1 ea 09             	shr    $0x9,%edx
80101bf8:	89 f8                	mov    %edi,%eax
80101bfa:	e8 51 f8 ff ff       	call   80101450 <bmap>
80101bff:	83 ec 08             	sub    $0x8,%esp
80101c02:	50                   	push   %eax
80101c03:	ff 37                	push   (%edi)
80101c05:	e8 c6 e4 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101c0a:	b9 00 02 00 00       	mov    $0x200,%ecx
80101c0f:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101c12:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101c15:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101c17:	89 f0                	mov    %esi,%eax
80101c19:	25 ff 01 00 00       	and    $0x1ff,%eax
80101c1e:	29 c1                	sub    %eax,%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101c20:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101c24:	39 d9                	cmp    %ebx,%ecx
80101c26:	0f 46 d9             	cmovbe %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101c29:	83 c4 0c             	add    $0xc,%esp
80101c2c:	53                   	push   %ebx
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101c2d:	01 de                	add    %ebx,%esi
    memmove(bp->data + off%BSIZE, src, m);
80101c2f:	ff 75 dc             	push   -0x24(%ebp)
80101c32:	50                   	push   %eax
80101c33:	e8 98 2c 00 00       	call   801048d0 <memmove>
    log_write(bp);
80101c38:	89 3c 24             	mov    %edi,(%esp)
80101c3b:	e8 d0 14 00 00       	call   80103110 <log_write>
    brelse(bp);
80101c40:	89 3c 24             	mov    %edi,(%esp)
80101c43:	e8 a8 e5 ff ff       	call   801001f0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101c48:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101c4b:	83 c4 10             	add    $0x10,%esp
80101c4e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101c51:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101c54:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101c57:	77 97                	ja     80101bf0 <writei+0x60>
  }

  if(n > 0 && off > ip->size){
80101c59:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101c5c:	3b 70 58             	cmp    0x58(%eax),%esi
80101c5f:	77 37                	ja     80101c98 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101c61:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101c64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c67:	5b                   	pop    %ebx
80101c68:	5e                   	pop    %esi
80101c69:	5f                   	pop    %edi
80101c6a:	5d                   	pop    %ebp
80101c6b:	c3                   	ret    
80101c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101c70:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101c74:	66 83 f8 09          	cmp    $0x9,%ax
80101c78:	77 32                	ja     80101cac <writei+0x11c>
80101c7a:	8b 04 c5 04 f9 10 80 	mov    -0x7fef06fc(,%eax,8),%eax
80101c81:	85 c0                	test   %eax,%eax
80101c83:	74 27                	je     80101cac <writei+0x11c>
    return devsw[ip->major].write(ip, src, n);
80101c85:	89 55 10             	mov    %edx,0x10(%ebp)
}
80101c88:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c8b:	5b                   	pop    %ebx
80101c8c:	5e                   	pop    %esi
80101c8d:	5f                   	pop    %edi
80101c8e:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101c8f:	ff e0                	jmp    *%eax
80101c91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ip->size = off;
80101c98:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101c9b:	83 ec 0c             	sub    $0xc,%esp
    ip->size = off;
80101c9e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101ca1:	50                   	push   %eax
80101ca2:	e8 29 fa ff ff       	call   801016d0 <iupdate>
80101ca7:	83 c4 10             	add    $0x10,%esp
80101caa:	eb b5                	jmp    80101c61 <writei+0xd1>
      return -1;
80101cac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101cb1:	eb b1                	jmp    80101c64 <writei+0xd4>
80101cb3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101cc0 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101cc0:	55                   	push   %ebp
80101cc1:	89 e5                	mov    %esp,%ebp
80101cc3:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101cc6:	6a 0e                	push   $0xe
80101cc8:	ff 75 0c             	push   0xc(%ebp)
80101ccb:	ff 75 08             	push   0x8(%ebp)
80101cce:	e8 6d 2c 00 00       	call   80104940 <strncmp>
}
80101cd3:	c9                   	leave  
80101cd4:	c3                   	ret    
80101cd5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101ce0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101ce0:	55                   	push   %ebp
80101ce1:	89 e5                	mov    %esp,%ebp
80101ce3:	57                   	push   %edi
80101ce4:	56                   	push   %esi
80101ce5:	53                   	push   %ebx
80101ce6:	83 ec 1c             	sub    $0x1c,%esp
80101ce9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101cec:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101cf1:	0f 85 85 00 00 00    	jne    80101d7c <dirlookup+0x9c>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101cf7:	8b 53 58             	mov    0x58(%ebx),%edx
80101cfa:	31 ff                	xor    %edi,%edi
80101cfc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101cff:	85 d2                	test   %edx,%edx
80101d01:	74 3e                	je     80101d41 <dirlookup+0x61>
80101d03:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d07:	90                   	nop
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101d08:	6a 10                	push   $0x10
80101d0a:	57                   	push   %edi
80101d0b:	56                   	push   %esi
80101d0c:	53                   	push   %ebx
80101d0d:	e8 7e fd ff ff       	call   80101a90 <readi>
80101d12:	83 c4 10             	add    $0x10,%esp
80101d15:	83 f8 10             	cmp    $0x10,%eax
80101d18:	75 55                	jne    80101d6f <dirlookup+0x8f>
      panic("dirlookup read");
    if(de.inum == 0)
80101d1a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101d1f:	74 18                	je     80101d39 <dirlookup+0x59>
  return strncmp(s, t, DIRSIZ);
80101d21:	83 ec 04             	sub    $0x4,%esp
80101d24:	8d 45 da             	lea    -0x26(%ebp),%eax
80101d27:	6a 0e                	push   $0xe
80101d29:	50                   	push   %eax
80101d2a:	ff 75 0c             	push   0xc(%ebp)
80101d2d:	e8 0e 2c 00 00       	call   80104940 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101d32:	83 c4 10             	add    $0x10,%esp
80101d35:	85 c0                	test   %eax,%eax
80101d37:	74 17                	je     80101d50 <dirlookup+0x70>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101d39:	83 c7 10             	add    $0x10,%edi
80101d3c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101d3f:	72 c7                	jb     80101d08 <dirlookup+0x28>
      return iget(dp->dev, inum);
    }
  }

  return 0;
}
80101d41:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80101d44:	31 c0                	xor    %eax,%eax
}
80101d46:	5b                   	pop    %ebx
80101d47:	5e                   	pop    %esi
80101d48:	5f                   	pop    %edi
80101d49:	5d                   	pop    %ebp
80101d4a:	c3                   	ret    
80101d4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d4f:	90                   	nop
      if(poff)
80101d50:	8b 45 10             	mov    0x10(%ebp),%eax
80101d53:	85 c0                	test   %eax,%eax
80101d55:	74 05                	je     80101d5c <dirlookup+0x7c>
        *poff = off;
80101d57:	8b 45 10             	mov    0x10(%ebp),%eax
80101d5a:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101d5c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101d60:	8b 03                	mov    (%ebx),%eax
80101d62:	e8 e9 f5 ff ff       	call   80101350 <iget>
}
80101d67:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d6a:	5b                   	pop    %ebx
80101d6b:	5e                   	pop    %esi
80101d6c:	5f                   	pop    %edi
80101d6d:	5d                   	pop    %ebp
80101d6e:	c3                   	ret    
      panic("dirlookup read");
80101d6f:	83 ec 0c             	sub    $0xc,%esp
80101d72:	68 f9 75 10 80       	push   $0x801075f9
80101d77:	e8 04 e6 ff ff       	call   80100380 <panic>
    panic("dirlookup not DIR");
80101d7c:	83 ec 0c             	sub    $0xc,%esp
80101d7f:	68 e7 75 10 80       	push   $0x801075e7
80101d84:	e8 f7 e5 ff ff       	call   80100380 <panic>
80101d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101d90 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101d90:	55                   	push   %ebp
80101d91:	89 e5                	mov    %esp,%ebp
80101d93:	57                   	push   %edi
80101d94:	56                   	push   %esi
80101d95:	53                   	push   %ebx
80101d96:	89 c3                	mov    %eax,%ebx
80101d98:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101d9b:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101d9e:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101da1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  if(*path == '/')
80101da4:	0f 84 64 01 00 00    	je     80101f0e <namex+0x17e>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101daa:	e8 91 1d 00 00       	call   80103b40 <myproc>
  acquire(&icache.lock);
80101daf:	83 ec 0c             	sub    $0xc,%esp
    ip = idup(myproc()->cwd);
80101db2:	8b 70 6c             	mov    0x6c(%eax),%esi
  acquire(&icache.lock);
80101db5:	68 60 f9 10 80       	push   $0x8010f960
80101dba:	e8 b1 29 00 00       	call   80104770 <acquire>
  ip->ref++;
80101dbf:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101dc3:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
80101dca:	e8 41 29 00 00       	call   80104710 <release>
80101dcf:	83 c4 10             	add    $0x10,%esp
80101dd2:	eb 07                	jmp    80101ddb <namex+0x4b>
80101dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101dd8:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101ddb:	0f b6 03             	movzbl (%ebx),%eax
80101dde:	3c 2f                	cmp    $0x2f,%al
80101de0:	74 f6                	je     80101dd8 <namex+0x48>
  if(*path == 0)
80101de2:	84 c0                	test   %al,%al
80101de4:	0f 84 06 01 00 00    	je     80101ef0 <namex+0x160>
  while(*path != '/' && *path != 0)
80101dea:	0f b6 03             	movzbl (%ebx),%eax
80101ded:	84 c0                	test   %al,%al
80101def:	0f 84 10 01 00 00    	je     80101f05 <namex+0x175>
80101df5:	89 df                	mov    %ebx,%edi
80101df7:	3c 2f                	cmp    $0x2f,%al
80101df9:	0f 84 06 01 00 00    	je     80101f05 <namex+0x175>
80101dff:	90                   	nop
80101e00:	0f b6 47 01          	movzbl 0x1(%edi),%eax
    path++;
80101e04:	83 c7 01             	add    $0x1,%edi
  while(*path != '/' && *path != 0)
80101e07:	3c 2f                	cmp    $0x2f,%al
80101e09:	74 04                	je     80101e0f <namex+0x7f>
80101e0b:	84 c0                	test   %al,%al
80101e0d:	75 f1                	jne    80101e00 <namex+0x70>
  len = path - s;
80101e0f:	89 f8                	mov    %edi,%eax
80101e11:	29 d8                	sub    %ebx,%eax
  if(len >= DIRSIZ)
80101e13:	83 f8 0d             	cmp    $0xd,%eax
80101e16:	0f 8e ac 00 00 00    	jle    80101ec8 <namex+0x138>
    memmove(name, s, DIRSIZ);
80101e1c:	83 ec 04             	sub    $0x4,%esp
80101e1f:	6a 0e                	push   $0xe
80101e21:	53                   	push   %ebx
    path++;
80101e22:	89 fb                	mov    %edi,%ebx
    memmove(name, s, DIRSIZ);
80101e24:	ff 75 e4             	push   -0x1c(%ebp)
80101e27:	e8 a4 2a 00 00       	call   801048d0 <memmove>
80101e2c:	83 c4 10             	add    $0x10,%esp
  while(*path == '/')
80101e2f:	80 3f 2f             	cmpb   $0x2f,(%edi)
80101e32:	75 0c                	jne    80101e40 <namex+0xb0>
80101e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101e38:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101e3b:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101e3e:	74 f8                	je     80101e38 <namex+0xa8>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101e40:	83 ec 0c             	sub    $0xc,%esp
80101e43:	56                   	push   %esi
80101e44:	e8 37 f9 ff ff       	call   80101780 <ilock>
    if(ip->type != T_DIR){
80101e49:	83 c4 10             	add    $0x10,%esp
80101e4c:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101e51:	0f 85 cd 00 00 00    	jne    80101f24 <namex+0x194>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101e57:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101e5a:	85 c0                	test   %eax,%eax
80101e5c:	74 09                	je     80101e67 <namex+0xd7>
80101e5e:	80 3b 00             	cmpb   $0x0,(%ebx)
80101e61:	0f 84 22 01 00 00    	je     80101f89 <namex+0x1f9>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101e67:	83 ec 04             	sub    $0x4,%esp
80101e6a:	6a 00                	push   $0x0
80101e6c:	ff 75 e4             	push   -0x1c(%ebp)
80101e6f:	56                   	push   %esi
80101e70:	e8 6b fe ff ff       	call   80101ce0 <dirlookup>
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101e75:	8d 56 0c             	lea    0xc(%esi),%edx
    if((next = dirlookup(ip, name, 0)) == 0){
80101e78:	83 c4 10             	add    $0x10,%esp
80101e7b:	89 c7                	mov    %eax,%edi
80101e7d:	85 c0                	test   %eax,%eax
80101e7f:	0f 84 e1 00 00 00    	je     80101f66 <namex+0x1d6>
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101e85:	83 ec 0c             	sub    $0xc,%esp
80101e88:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101e8b:	52                   	push   %edx
80101e8c:	e8 bf 26 00 00       	call   80104550 <holdingsleep>
80101e91:	83 c4 10             	add    $0x10,%esp
80101e94:	85 c0                	test   %eax,%eax
80101e96:	0f 84 30 01 00 00    	je     80101fcc <namex+0x23c>
80101e9c:	8b 56 08             	mov    0x8(%esi),%edx
80101e9f:	85 d2                	test   %edx,%edx
80101ea1:	0f 8e 25 01 00 00    	jle    80101fcc <namex+0x23c>
  releasesleep(&ip->lock);
80101ea7:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101eaa:	83 ec 0c             	sub    $0xc,%esp
80101ead:	52                   	push   %edx
80101eae:	e8 5d 26 00 00       	call   80104510 <releasesleep>
  iput(ip);
80101eb3:	89 34 24             	mov    %esi,(%esp)
80101eb6:	89 fe                	mov    %edi,%esi
80101eb8:	e8 f3 f9 ff ff       	call   801018b0 <iput>
80101ebd:	83 c4 10             	add    $0x10,%esp
80101ec0:	e9 16 ff ff ff       	jmp    80101ddb <namex+0x4b>
80101ec5:	8d 76 00             	lea    0x0(%esi),%esi
    name[len] = 0;
80101ec8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101ecb:	8d 14 01             	lea    (%ecx,%eax,1),%edx
    memmove(name, s, len);
80101ece:	83 ec 04             	sub    $0x4,%esp
80101ed1:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101ed4:	50                   	push   %eax
80101ed5:	53                   	push   %ebx
    name[len] = 0;
80101ed6:	89 fb                	mov    %edi,%ebx
    memmove(name, s, len);
80101ed8:	ff 75 e4             	push   -0x1c(%ebp)
80101edb:	e8 f0 29 00 00       	call   801048d0 <memmove>
    name[len] = 0;
80101ee0:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101ee3:	83 c4 10             	add    $0x10,%esp
80101ee6:	c6 02 00             	movb   $0x0,(%edx)
80101ee9:	e9 41 ff ff ff       	jmp    80101e2f <namex+0x9f>
80101eee:	66 90                	xchg   %ax,%ax
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101ef0:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101ef3:	85 c0                	test   %eax,%eax
80101ef5:	0f 85 be 00 00 00    	jne    80101fb9 <namex+0x229>
    iput(ip);
    return 0;
  }
  return ip;
}
80101efb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101efe:	89 f0                	mov    %esi,%eax
80101f00:	5b                   	pop    %ebx
80101f01:	5e                   	pop    %esi
80101f02:	5f                   	pop    %edi
80101f03:	5d                   	pop    %ebp
80101f04:	c3                   	ret    
  while(*path != '/' && *path != 0)
80101f05:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101f08:	89 df                	mov    %ebx,%edi
80101f0a:	31 c0                	xor    %eax,%eax
80101f0c:	eb c0                	jmp    80101ece <namex+0x13e>
    ip = iget(ROOTDEV, ROOTINO);
80101f0e:	ba 01 00 00 00       	mov    $0x1,%edx
80101f13:	b8 01 00 00 00       	mov    $0x1,%eax
80101f18:	e8 33 f4 ff ff       	call   80101350 <iget>
80101f1d:	89 c6                	mov    %eax,%esi
80101f1f:	e9 b7 fe ff ff       	jmp    80101ddb <namex+0x4b>
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101f24:	83 ec 0c             	sub    $0xc,%esp
80101f27:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101f2a:	53                   	push   %ebx
80101f2b:	e8 20 26 00 00       	call   80104550 <holdingsleep>
80101f30:	83 c4 10             	add    $0x10,%esp
80101f33:	85 c0                	test   %eax,%eax
80101f35:	0f 84 91 00 00 00    	je     80101fcc <namex+0x23c>
80101f3b:	8b 46 08             	mov    0x8(%esi),%eax
80101f3e:	85 c0                	test   %eax,%eax
80101f40:	0f 8e 86 00 00 00    	jle    80101fcc <namex+0x23c>
  releasesleep(&ip->lock);
80101f46:	83 ec 0c             	sub    $0xc,%esp
80101f49:	53                   	push   %ebx
80101f4a:	e8 c1 25 00 00       	call   80104510 <releasesleep>
  iput(ip);
80101f4f:	89 34 24             	mov    %esi,(%esp)
      return 0;
80101f52:	31 f6                	xor    %esi,%esi
  iput(ip);
80101f54:	e8 57 f9 ff ff       	call   801018b0 <iput>
      return 0;
80101f59:	83 c4 10             	add    $0x10,%esp
}
80101f5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f5f:	89 f0                	mov    %esi,%eax
80101f61:	5b                   	pop    %ebx
80101f62:	5e                   	pop    %esi
80101f63:	5f                   	pop    %edi
80101f64:	5d                   	pop    %ebp
80101f65:	c3                   	ret    
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101f66:	83 ec 0c             	sub    $0xc,%esp
80101f69:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101f6c:	52                   	push   %edx
80101f6d:	e8 de 25 00 00       	call   80104550 <holdingsleep>
80101f72:	83 c4 10             	add    $0x10,%esp
80101f75:	85 c0                	test   %eax,%eax
80101f77:	74 53                	je     80101fcc <namex+0x23c>
80101f79:	8b 4e 08             	mov    0x8(%esi),%ecx
80101f7c:	85 c9                	test   %ecx,%ecx
80101f7e:	7e 4c                	jle    80101fcc <namex+0x23c>
  releasesleep(&ip->lock);
80101f80:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101f83:	83 ec 0c             	sub    $0xc,%esp
80101f86:	52                   	push   %edx
80101f87:	eb c1                	jmp    80101f4a <namex+0x1ba>
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101f89:	83 ec 0c             	sub    $0xc,%esp
80101f8c:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101f8f:	53                   	push   %ebx
80101f90:	e8 bb 25 00 00       	call   80104550 <holdingsleep>
80101f95:	83 c4 10             	add    $0x10,%esp
80101f98:	85 c0                	test   %eax,%eax
80101f9a:	74 30                	je     80101fcc <namex+0x23c>
80101f9c:	8b 7e 08             	mov    0x8(%esi),%edi
80101f9f:	85 ff                	test   %edi,%edi
80101fa1:	7e 29                	jle    80101fcc <namex+0x23c>
  releasesleep(&ip->lock);
80101fa3:	83 ec 0c             	sub    $0xc,%esp
80101fa6:	53                   	push   %ebx
80101fa7:	e8 64 25 00 00       	call   80104510 <releasesleep>
}
80101fac:	83 c4 10             	add    $0x10,%esp
}
80101faf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fb2:	89 f0                	mov    %esi,%eax
80101fb4:	5b                   	pop    %ebx
80101fb5:	5e                   	pop    %esi
80101fb6:	5f                   	pop    %edi
80101fb7:	5d                   	pop    %ebp
80101fb8:	c3                   	ret    
    iput(ip);
80101fb9:	83 ec 0c             	sub    $0xc,%esp
80101fbc:	56                   	push   %esi
    return 0;
80101fbd:	31 f6                	xor    %esi,%esi
    iput(ip);
80101fbf:	e8 ec f8 ff ff       	call   801018b0 <iput>
    return 0;
80101fc4:	83 c4 10             	add    $0x10,%esp
80101fc7:	e9 2f ff ff ff       	jmp    80101efb <namex+0x16b>
    panic("iunlock");
80101fcc:	83 ec 0c             	sub    $0xc,%esp
80101fcf:	68 df 75 10 80       	push   $0x801075df
80101fd4:	e8 a7 e3 ff ff       	call   80100380 <panic>
80101fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101fe0 <dirlink>:
{
80101fe0:	55                   	push   %ebp
80101fe1:	89 e5                	mov    %esp,%ebp
80101fe3:	57                   	push   %edi
80101fe4:	56                   	push   %esi
80101fe5:	53                   	push   %ebx
80101fe6:	83 ec 20             	sub    $0x20,%esp
80101fe9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101fec:	6a 00                	push   $0x0
80101fee:	ff 75 0c             	push   0xc(%ebp)
80101ff1:	53                   	push   %ebx
80101ff2:	e8 e9 fc ff ff       	call   80101ce0 <dirlookup>
80101ff7:	83 c4 10             	add    $0x10,%esp
80101ffa:	85 c0                	test   %eax,%eax
80101ffc:	75 67                	jne    80102065 <dirlink+0x85>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101ffe:	8b 7b 58             	mov    0x58(%ebx),%edi
80102001:	8d 75 d8             	lea    -0x28(%ebp),%esi
80102004:	85 ff                	test   %edi,%edi
80102006:	74 29                	je     80102031 <dirlink+0x51>
80102008:	31 ff                	xor    %edi,%edi
8010200a:	8d 75 d8             	lea    -0x28(%ebp),%esi
8010200d:	eb 09                	jmp    80102018 <dirlink+0x38>
8010200f:	90                   	nop
80102010:	83 c7 10             	add    $0x10,%edi
80102013:	3b 7b 58             	cmp    0x58(%ebx),%edi
80102016:	73 19                	jae    80102031 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80102018:	6a 10                	push   $0x10
8010201a:	57                   	push   %edi
8010201b:	56                   	push   %esi
8010201c:	53                   	push   %ebx
8010201d:	e8 6e fa ff ff       	call   80101a90 <readi>
80102022:	83 c4 10             	add    $0x10,%esp
80102025:	83 f8 10             	cmp    $0x10,%eax
80102028:	75 4e                	jne    80102078 <dirlink+0x98>
    if(de.inum == 0)
8010202a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
8010202f:	75 df                	jne    80102010 <dirlink+0x30>
  strncpy(de.name, name, DIRSIZ);
80102031:	83 ec 04             	sub    $0x4,%esp
80102034:	8d 45 da             	lea    -0x26(%ebp),%eax
80102037:	6a 0e                	push   $0xe
80102039:	ff 75 0c             	push   0xc(%ebp)
8010203c:	50                   	push   %eax
8010203d:	e8 4e 29 00 00       	call   80104990 <strncpy>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80102042:	6a 10                	push   $0x10
  de.inum = inum;
80102044:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80102047:	57                   	push   %edi
80102048:	56                   	push   %esi
80102049:	53                   	push   %ebx
  de.inum = inum;
8010204a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010204e:	e8 3d fb ff ff       	call   80101b90 <writei>
80102053:	83 c4 20             	add    $0x20,%esp
80102056:	83 f8 10             	cmp    $0x10,%eax
80102059:	75 2a                	jne    80102085 <dirlink+0xa5>
  return 0;
8010205b:	31 c0                	xor    %eax,%eax
}
8010205d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102060:	5b                   	pop    %ebx
80102061:	5e                   	pop    %esi
80102062:	5f                   	pop    %edi
80102063:	5d                   	pop    %ebp
80102064:	c3                   	ret    
    iput(ip);
80102065:	83 ec 0c             	sub    $0xc,%esp
80102068:	50                   	push   %eax
80102069:	e8 42 f8 ff ff       	call   801018b0 <iput>
    return -1;
8010206e:	83 c4 10             	add    $0x10,%esp
80102071:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102076:	eb e5                	jmp    8010205d <dirlink+0x7d>
      panic("dirlink read");
80102078:	83 ec 0c             	sub    $0xc,%esp
8010207b:	68 08 76 10 80       	push   $0x80107608
80102080:	e8 fb e2 ff ff       	call   80100380 <panic>
    panic("dirlink");
80102085:	83 ec 0c             	sub    $0xc,%esp
80102088:	68 e6 7b 10 80       	push   $0x80107be6
8010208d:	e8 ee e2 ff ff       	call   80100380 <panic>
80102092:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801020a0 <namei>:

struct inode*
namei(char *path)
{
801020a0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
801020a1:	31 d2                	xor    %edx,%edx
{
801020a3:	89 e5                	mov    %esp,%ebp
801020a5:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
801020a8:	8b 45 08             	mov    0x8(%ebp),%eax
801020ab:	8d 4d ea             	lea    -0x16(%ebp),%ecx
801020ae:	e8 dd fc ff ff       	call   80101d90 <namex>
}
801020b3:	c9                   	leave  
801020b4:	c3                   	ret    
801020b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801020bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020c0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
801020c0:	55                   	push   %ebp
  return namex(path, 1, name);
801020c1:	ba 01 00 00 00       	mov    $0x1,%edx
{
801020c6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
801020c8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801020cb:	8b 45 08             	mov    0x8(%ebp),%eax
}
801020ce:	5d                   	pop    %ebp
  return namex(path, 1, name);
801020cf:	e9 bc fc ff ff       	jmp    80101d90 <namex>
801020d4:	66 90                	xchg   %ax,%ax
801020d6:	66 90                	xchg   %ax,%ax
801020d8:	66 90                	xchg   %ax,%ax
801020da:	66 90                	xchg   %ax,%ax
801020dc:	66 90                	xchg   %ax,%ax
801020de:	66 90                	xchg   %ax,%ax

801020e0 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
801020e0:	55                   	push   %ebp
801020e1:	89 e5                	mov    %esp,%ebp
801020e3:	57                   	push   %edi
801020e4:	56                   	push   %esi
801020e5:	53                   	push   %ebx
801020e6:	83 ec 0c             	sub    $0xc,%esp
  if(b == 0)
801020e9:	85 c0                	test   %eax,%eax
801020eb:	0f 84 b4 00 00 00    	je     801021a5 <idestart+0xc5>
    panic("idestart");
  if(b->blockno >= FSSIZE)
801020f1:	8b 70 08             	mov    0x8(%eax),%esi
801020f4:	89 c3                	mov    %eax,%ebx
801020f6:	81 fe e7 03 00 00    	cmp    $0x3e7,%esi
801020fc:	0f 87 96 00 00 00    	ja     80102198 <idestart+0xb8>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102102:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80102107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010210e:	66 90                	xchg   %ax,%ax
80102110:	89 ca                	mov    %ecx,%edx
80102112:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102113:	83 e0 c0             	and    $0xffffffc0,%eax
80102116:	3c 40                	cmp    $0x40,%al
80102118:	75 f6                	jne    80102110 <idestart+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010211a:	31 ff                	xor    %edi,%edi
8010211c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80102121:	89 f8                	mov    %edi,%eax
80102123:	ee                   	out    %al,(%dx)
80102124:	b8 01 00 00 00       	mov    $0x1,%eax
80102129:	ba f2 01 00 00       	mov    $0x1f2,%edx
8010212e:	ee                   	out    %al,(%dx)
8010212f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80102134:	89 f0                	mov    %esi,%eax
80102136:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80102137:	89 f0                	mov    %esi,%eax
80102139:	ba f4 01 00 00       	mov    $0x1f4,%edx
8010213e:	c1 f8 08             	sar    $0x8,%eax
80102141:	ee                   	out    %al,(%dx)
80102142:	ba f5 01 00 00       	mov    $0x1f5,%edx
80102147:	89 f8                	mov    %edi,%eax
80102149:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
8010214a:	0f b6 43 04          	movzbl 0x4(%ebx),%eax
8010214e:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102153:	c1 e0 04             	shl    $0x4,%eax
80102156:	83 e0 10             	and    $0x10,%eax
80102159:	83 c8 e0             	or     $0xffffffe0,%eax
8010215c:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
8010215d:	f6 03 04             	testb  $0x4,(%ebx)
80102160:	75 16                	jne    80102178 <idestart+0x98>
80102162:	b8 20 00 00 00       	mov    $0x20,%eax
80102167:	89 ca                	mov    %ecx,%edx
80102169:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
8010216a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010216d:	5b                   	pop    %ebx
8010216e:	5e                   	pop    %esi
8010216f:	5f                   	pop    %edi
80102170:	5d                   	pop    %ebp
80102171:	c3                   	ret    
80102172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102178:	b8 30 00 00 00       	mov    $0x30,%eax
8010217d:	89 ca                	mov    %ecx,%edx
8010217f:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
80102180:	b9 80 00 00 00       	mov    $0x80,%ecx
    outsl(0x1f0, b->data, BSIZE/4);
80102185:	8d 73 5c             	lea    0x5c(%ebx),%esi
80102188:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010218d:	fc                   	cld    
8010218e:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80102190:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102193:	5b                   	pop    %ebx
80102194:	5e                   	pop    %esi
80102195:	5f                   	pop    %edi
80102196:	5d                   	pop    %ebp
80102197:	c3                   	ret    
    panic("incorrect blockno");
80102198:	83 ec 0c             	sub    $0xc,%esp
8010219b:	68 74 76 10 80       	push   $0x80107674
801021a0:	e8 db e1 ff ff       	call   80100380 <panic>
    panic("idestart");
801021a5:	83 ec 0c             	sub    $0xc,%esp
801021a8:	68 6b 76 10 80       	push   $0x8010766b
801021ad:	e8 ce e1 ff ff       	call   80100380 <panic>
801021b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801021c0 <ideinit>:
{
801021c0:	55                   	push   %ebp
801021c1:	89 e5                	mov    %esp,%ebp
801021c3:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
801021c6:	68 86 76 10 80       	push   $0x80107686
801021cb:	68 00 16 11 80       	push   $0x80111600
801021d0:	e8 cb 23 00 00       	call   801045a0 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
801021d5:	58                   	pop    %eax
801021d6:	a1 84 17 11 80       	mov    0x80111784,%eax
801021db:	5a                   	pop    %edx
801021dc:	83 e8 01             	sub    $0x1,%eax
801021df:	50                   	push   %eax
801021e0:	6a 0e                	push   $0xe
801021e2:	e8 99 02 00 00       	call   80102480 <ioapicenable>
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801021e7:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801021ea:	ba f7 01 00 00       	mov    $0x1f7,%edx
801021ef:	90                   	nop
801021f0:	ec                   	in     (%dx),%al
801021f1:	83 e0 c0             	and    $0xffffffc0,%eax
801021f4:	3c 40                	cmp    $0x40,%al
801021f6:	75 f8                	jne    801021f0 <ideinit+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801021f8:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
801021fd:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102202:	ee                   	out    %al,(%dx)
80102203:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102208:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010220d:	eb 06                	jmp    80102215 <ideinit+0x55>
8010220f:	90                   	nop
  for(i=0; i<1000; i++){
80102210:	83 e9 01             	sub    $0x1,%ecx
80102213:	74 0f                	je     80102224 <ideinit+0x64>
80102215:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102216:	84 c0                	test   %al,%al
80102218:	74 f6                	je     80102210 <ideinit+0x50>
      havedisk1 = 1;
8010221a:	c7 05 e0 15 11 80 01 	movl   $0x1,0x801115e0
80102221:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102224:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102229:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010222e:	ee                   	out    %al,(%dx)
}
8010222f:	c9                   	leave  
80102230:	c3                   	ret    
80102231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102238:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010223f:	90                   	nop

80102240 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
80102240:	55                   	push   %ebp
80102241:	89 e5                	mov    %esp,%ebp
80102243:	57                   	push   %edi
80102244:	56                   	push   %esi
80102245:	53                   	push   %ebx
80102246:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102249:	68 00 16 11 80       	push   $0x80111600
8010224e:	e8 1d 25 00 00       	call   80104770 <acquire>

  if((b = idequeue) == 0){
80102253:	8b 1d e4 15 11 80    	mov    0x801115e4,%ebx
80102259:	83 c4 10             	add    $0x10,%esp
8010225c:	85 db                	test   %ebx,%ebx
8010225e:	74 63                	je     801022c3 <ideintr+0x83>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80102260:	8b 43 58             	mov    0x58(%ebx),%eax
80102263:	a3 e4 15 11 80       	mov    %eax,0x801115e4

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102268:	8b 33                	mov    (%ebx),%esi
8010226a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102270:	75 2f                	jne    801022a1 <ideintr+0x61>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102272:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010227e:	66 90                	xchg   %ax,%ax
80102280:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102281:	89 c1                	mov    %eax,%ecx
80102283:	83 e1 c0             	and    $0xffffffc0,%ecx
80102286:	80 f9 40             	cmp    $0x40,%cl
80102289:	75 f5                	jne    80102280 <ideintr+0x40>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
8010228b:	a8 21                	test   $0x21,%al
8010228d:	75 12                	jne    801022a1 <ideintr+0x61>
    insl(0x1f0, b->data, BSIZE/4);
8010228f:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
80102292:	b9 80 00 00 00       	mov    $0x80,%ecx
80102297:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010229c:	fc                   	cld    
8010229d:	f3 6d                	rep insl (%dx),%es:(%edi)

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
8010229f:	8b 33                	mov    (%ebx),%esi
  b->flags &= ~B_DIRTY;
801022a1:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
801022a4:	83 ec 0c             	sub    $0xc,%esp
  b->flags &= ~B_DIRTY;
801022a7:	83 ce 02             	or     $0x2,%esi
801022aa:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
801022ac:	53                   	push   %ebx
801022ad:	e8 1e 20 00 00       	call   801042d0 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
801022b2:	a1 e4 15 11 80       	mov    0x801115e4,%eax
801022b7:	83 c4 10             	add    $0x10,%esp
801022ba:	85 c0                	test   %eax,%eax
801022bc:	74 05                	je     801022c3 <ideintr+0x83>
    idestart(idequeue);
801022be:	e8 1d fe ff ff       	call   801020e0 <idestart>
    release(&idelock);
801022c3:	83 ec 0c             	sub    $0xc,%esp
801022c6:	68 00 16 11 80       	push   $0x80111600
801022cb:	e8 40 24 00 00       	call   80104710 <release>

  release(&idelock);
}
801022d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801022d3:	5b                   	pop    %ebx
801022d4:	5e                   	pop    %esi
801022d5:	5f                   	pop    %edi
801022d6:	5d                   	pop    %ebp
801022d7:	c3                   	ret    
801022d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801022df:	90                   	nop

801022e0 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801022e0:	55                   	push   %ebp
801022e1:	89 e5                	mov    %esp,%ebp
801022e3:	53                   	push   %ebx
801022e4:	83 ec 10             	sub    $0x10,%esp
801022e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
801022ea:	8d 43 0c             	lea    0xc(%ebx),%eax
801022ed:	50                   	push   %eax
801022ee:	e8 5d 22 00 00       	call   80104550 <holdingsleep>
801022f3:	83 c4 10             	add    $0x10,%esp
801022f6:	85 c0                	test   %eax,%eax
801022f8:	0f 84 c3 00 00 00    	je     801023c1 <iderw+0xe1>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801022fe:	8b 03                	mov    (%ebx),%eax
80102300:	83 e0 06             	and    $0x6,%eax
80102303:	83 f8 02             	cmp    $0x2,%eax
80102306:	0f 84 a8 00 00 00    	je     801023b4 <iderw+0xd4>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010230c:	8b 53 04             	mov    0x4(%ebx),%edx
8010230f:	85 d2                	test   %edx,%edx
80102311:	74 0d                	je     80102320 <iderw+0x40>
80102313:	a1 e0 15 11 80       	mov    0x801115e0,%eax
80102318:	85 c0                	test   %eax,%eax
8010231a:	0f 84 87 00 00 00    	je     801023a7 <iderw+0xc7>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102320:	83 ec 0c             	sub    $0xc,%esp
80102323:	68 00 16 11 80       	push   $0x80111600
80102328:	e8 43 24 00 00       	call   80104770 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010232d:	a1 e4 15 11 80       	mov    0x801115e4,%eax
  b->qnext = 0;
80102332:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102339:	83 c4 10             	add    $0x10,%esp
8010233c:	85 c0                	test   %eax,%eax
8010233e:	74 60                	je     801023a0 <iderw+0xc0>
80102340:	89 c2                	mov    %eax,%edx
80102342:	8b 40 58             	mov    0x58(%eax),%eax
80102345:	85 c0                	test   %eax,%eax
80102347:	75 f7                	jne    80102340 <iderw+0x60>
80102349:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
8010234c:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
8010234e:	39 1d e4 15 11 80    	cmp    %ebx,0x801115e4
80102354:	74 3a                	je     80102390 <iderw+0xb0>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80102356:	8b 03                	mov    (%ebx),%eax
80102358:	83 e0 06             	and    $0x6,%eax
8010235b:	83 f8 02             	cmp    $0x2,%eax
8010235e:	74 1b                	je     8010237b <iderw+0x9b>
    sleep(b, &idelock);
80102360:	83 ec 08             	sub    $0x8,%esp
80102363:	68 00 16 11 80       	push   $0x80111600
80102368:	53                   	push   %ebx
80102369:	e8 a2 1e 00 00       	call   80104210 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010236e:	8b 03                	mov    (%ebx),%eax
80102370:	83 c4 10             	add    $0x10,%esp
80102373:	83 e0 06             	and    $0x6,%eax
80102376:	83 f8 02             	cmp    $0x2,%eax
80102379:	75 e5                	jne    80102360 <iderw+0x80>
  }


  release(&idelock);
8010237b:	c7 45 08 00 16 11 80 	movl   $0x80111600,0x8(%ebp)
}
80102382:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102385:	c9                   	leave  
  release(&idelock);
80102386:	e9 85 23 00 00       	jmp    80104710 <release>
8010238b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010238f:	90                   	nop
    idestart(b);
80102390:	89 d8                	mov    %ebx,%eax
80102392:	e8 49 fd ff ff       	call   801020e0 <idestart>
80102397:	eb bd                	jmp    80102356 <iderw+0x76>
80102399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801023a0:	ba e4 15 11 80       	mov    $0x801115e4,%edx
801023a5:	eb a5                	jmp    8010234c <iderw+0x6c>
    panic("iderw: ide disk 1 not present");
801023a7:	83 ec 0c             	sub    $0xc,%esp
801023aa:	68 b5 76 10 80       	push   $0x801076b5
801023af:	e8 cc df ff ff       	call   80100380 <panic>
    panic("iderw: nothing to do");
801023b4:	83 ec 0c             	sub    $0xc,%esp
801023b7:	68 a0 76 10 80       	push   $0x801076a0
801023bc:	e8 bf df ff ff       	call   80100380 <panic>
    panic("iderw: buf not locked");
801023c1:	83 ec 0c             	sub    $0xc,%esp
801023c4:	68 8a 76 10 80       	push   $0x8010768a
801023c9:	e8 b2 df ff ff       	call   80100380 <panic>
801023ce:	66 90                	xchg   %ax,%ax

801023d0 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
801023d0:	55                   	push   %ebp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
801023d1:	c7 05 34 16 11 80 00 	movl   $0xfec00000,0x80111634
801023d8:	00 c0 fe 
{
801023db:	89 e5                	mov    %esp,%ebp
801023dd:	56                   	push   %esi
801023de:	53                   	push   %ebx
  ioapic->reg = reg;
801023df:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801023e6:	00 00 00 
  return ioapic->data;
801023e9:	8b 15 34 16 11 80    	mov    0x80111634,%edx
801023ef:	8b 72 10             	mov    0x10(%edx),%esi
  ioapic->reg = reg;
801023f2:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
801023f8:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
801023fe:	0f b6 15 80 17 11 80 	movzbl 0x80111780,%edx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102405:	c1 ee 10             	shr    $0x10,%esi
80102408:	89 f0                	mov    %esi,%eax
8010240a:	0f b6 f0             	movzbl %al,%esi
  return ioapic->data;
8010240d:	8b 41 10             	mov    0x10(%ecx),%eax
  id = ioapicread(REG_ID) >> 24;
80102410:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80102413:	39 c2                	cmp    %eax,%edx
80102415:	74 16                	je     8010242d <ioapicinit+0x5d>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102417:	83 ec 0c             	sub    $0xc,%esp
8010241a:	68 d4 76 10 80       	push   $0x801076d4
8010241f:	e8 7c e2 ff ff       	call   801006a0 <cprintf>
  ioapic->reg = reg;
80102424:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010242a:	83 c4 10             	add    $0x10,%esp
8010242d:	83 c6 21             	add    $0x21,%esi
{
80102430:	ba 10 00 00 00       	mov    $0x10,%edx
80102435:	b8 20 00 00 00       	mov    $0x20,%eax
8010243a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ioapic->reg = reg;
80102440:	89 11                	mov    %edx,(%ecx)

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102442:	89 c3                	mov    %eax,%ebx
  ioapic->data = data;
80102444:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
  for(i = 0; i <= maxintr; i++){
8010244a:	83 c0 01             	add    $0x1,%eax
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
8010244d:	81 cb 00 00 01 00    	or     $0x10000,%ebx
  ioapic->data = data;
80102453:	89 59 10             	mov    %ebx,0x10(%ecx)
  ioapic->reg = reg;
80102456:	8d 5a 01             	lea    0x1(%edx),%ebx
  for(i = 0; i <= maxintr; i++){
80102459:	83 c2 02             	add    $0x2,%edx
  ioapic->reg = reg;
8010245c:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
8010245e:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
80102464:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  for(i = 0; i <= maxintr; i++){
8010246b:	39 f0                	cmp    %esi,%eax
8010246d:	75 d1                	jne    80102440 <ioapicinit+0x70>
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
8010246f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102472:	5b                   	pop    %ebx
80102473:	5e                   	pop    %esi
80102474:	5d                   	pop    %ebp
80102475:	c3                   	ret    
80102476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010247d:	8d 76 00             	lea    0x0(%esi),%esi

80102480 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
80102480:	55                   	push   %ebp
  ioapic->reg = reg;
80102481:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
{
80102487:	89 e5                	mov    %esp,%ebp
80102489:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
8010248c:	8d 50 20             	lea    0x20(%eax),%edx
8010248f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
  ioapic->reg = reg;
80102493:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102495:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010249b:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
8010249e:	89 51 10             	mov    %edx,0x10(%ecx)
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801024a1:	8b 55 0c             	mov    0xc(%ebp),%edx
  ioapic->reg = reg;
801024a4:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801024a6:	a1 34 16 11 80       	mov    0x80111634,%eax
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801024ab:	c1 e2 18             	shl    $0x18,%edx
  ioapic->data = data;
801024ae:	89 50 10             	mov    %edx,0x10(%eax)
}
801024b1:	5d                   	pop    %ebp
801024b2:	c3                   	ret    
801024b3:	66 90                	xchg   %ax,%ax
801024b5:	66 90                	xchg   %ax,%ax
801024b7:	66 90                	xchg   %ax,%ax
801024b9:	66 90                	xchg   %ax,%ax
801024bb:	66 90                	xchg   %ax,%ax
801024bd:	66 90                	xchg   %ax,%ax
801024bf:	90                   	nop

801024c0 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
801024c0:	55                   	push   %ebp
801024c1:	89 e5                	mov    %esp,%ebp
801024c3:	53                   	push   %ebx
801024c4:	83 ec 04             	sub    $0x4,%esp
801024c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
801024ca:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801024d0:	75 76                	jne    80102548 <kfree+0x88>
801024d2:	81 fb d0 55 11 80    	cmp    $0x801155d0,%ebx
801024d8:	72 6e                	jb     80102548 <kfree+0x88>
801024da:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801024e0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801024e5:	77 61                	ja     80102548 <kfree+0x88>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
801024e7:	83 ec 04             	sub    $0x4,%esp
801024ea:	68 00 10 00 00       	push   $0x1000
801024ef:	6a 01                	push   $0x1
801024f1:	53                   	push   %ebx
801024f2:	e8 39 23 00 00       	call   80104830 <memset>

  if(kmem.use_lock)
801024f7:	8b 15 74 16 11 80    	mov    0x80111674,%edx
801024fd:	83 c4 10             	add    $0x10,%esp
80102500:	85 d2                	test   %edx,%edx
80102502:	75 1c                	jne    80102520 <kfree+0x60>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102504:	a1 78 16 11 80       	mov    0x80111678,%eax
80102509:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010250b:	a1 74 16 11 80       	mov    0x80111674,%eax
  kmem.freelist = r;
80102510:	89 1d 78 16 11 80    	mov    %ebx,0x80111678
  if(kmem.use_lock)
80102516:	85 c0                	test   %eax,%eax
80102518:	75 1e                	jne    80102538 <kfree+0x78>
    release(&kmem.lock);
}
8010251a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010251d:	c9                   	leave  
8010251e:	c3                   	ret    
8010251f:	90                   	nop
    acquire(&kmem.lock);
80102520:	83 ec 0c             	sub    $0xc,%esp
80102523:	68 40 16 11 80       	push   $0x80111640
80102528:	e8 43 22 00 00       	call   80104770 <acquire>
8010252d:	83 c4 10             	add    $0x10,%esp
80102530:	eb d2                	jmp    80102504 <kfree+0x44>
80102532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    release(&kmem.lock);
80102538:	c7 45 08 40 16 11 80 	movl   $0x80111640,0x8(%ebp)
}
8010253f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102542:	c9                   	leave  
    release(&kmem.lock);
80102543:	e9 c8 21 00 00       	jmp    80104710 <release>
    panic("kfree");
80102548:	83 ec 0c             	sub    $0xc,%esp
8010254b:	68 06 77 10 80       	push   $0x80107706
80102550:	e8 2b de ff ff       	call   80100380 <panic>
80102555:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010255c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102560 <freerange>:
{
80102560:	55                   	push   %ebp
80102561:	89 e5                	mov    %esp,%ebp
80102563:	56                   	push   %esi
  p = (char*)PGROUNDUP((uint)vstart);
80102564:	8b 45 08             	mov    0x8(%ebp),%eax
{
80102567:	8b 75 0c             	mov    0xc(%ebp),%esi
8010256a:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
8010256b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102571:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102577:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010257d:	39 de                	cmp    %ebx,%esi
8010257f:	72 23                	jb     801025a4 <freerange+0x44>
80102581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102588:	83 ec 0c             	sub    $0xc,%esp
8010258b:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102591:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102597:	50                   	push   %eax
80102598:	e8 23 ff ff ff       	call   801024c0 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010259d:	83 c4 10             	add    $0x10,%esp
801025a0:	39 f3                	cmp    %esi,%ebx
801025a2:	76 e4                	jbe    80102588 <freerange+0x28>
}
801025a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801025a7:	5b                   	pop    %ebx
801025a8:	5e                   	pop    %esi
801025a9:	5d                   	pop    %ebp
801025aa:	c3                   	ret    
801025ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025af:	90                   	nop

801025b0 <kinit1>:
{
801025b0:	55                   	push   %ebp
801025b1:	89 e5                	mov    %esp,%ebp
801025b3:	56                   	push   %esi
801025b4:	53                   	push   %ebx
801025b5:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
801025b8:	83 ec 08             	sub    $0x8,%esp
801025bb:	68 0c 77 10 80       	push   $0x8010770c
801025c0:	68 40 16 11 80       	push   $0x80111640
801025c5:	e8 d6 1f 00 00       	call   801045a0 <initlock>
  p = (char*)PGROUNDUP((uint)vstart);
801025ca:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025cd:	83 c4 10             	add    $0x10,%esp
  kmem.use_lock = 0;
801025d0:	c7 05 74 16 11 80 00 	movl   $0x0,0x80111674
801025d7:	00 00 00 
  p = (char*)PGROUNDUP((uint)vstart);
801025da:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801025e0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025e6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025ec:	39 de                	cmp    %ebx,%esi
801025ee:	72 1c                	jb     8010260c <kinit1+0x5c>
    kfree(p);
801025f0:	83 ec 0c             	sub    $0xc,%esp
801025f3:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801025ff:	50                   	push   %eax
80102600:	e8 bb fe ff ff       	call   801024c0 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102605:	83 c4 10             	add    $0x10,%esp
80102608:	39 de                	cmp    %ebx,%esi
8010260a:	73 e4                	jae    801025f0 <kinit1+0x40>
}
8010260c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010260f:	5b                   	pop    %ebx
80102610:	5e                   	pop    %esi
80102611:	5d                   	pop    %ebp
80102612:	c3                   	ret    
80102613:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010261a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102620 <kalloc>:
char*
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
80102620:	a1 74 16 11 80       	mov    0x80111674,%eax
80102625:	85 c0                	test   %eax,%eax
80102627:	75 1f                	jne    80102648 <kalloc+0x28>
    acquire(&kmem.lock);
  r = kmem.freelist;
80102629:	a1 78 16 11 80       	mov    0x80111678,%eax
  if(r)
8010262e:	85 c0                	test   %eax,%eax
80102630:	74 0e                	je     80102640 <kalloc+0x20>
    kmem.freelist = r->next;
80102632:	8b 10                	mov    (%eax),%edx
80102634:	89 15 78 16 11 80    	mov    %edx,0x80111678
  if(kmem.use_lock)
8010263a:	c3                   	ret    
8010263b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010263f:	90                   	nop
    release(&kmem.lock);
  return (char*)r;
}
80102640:	c3                   	ret    
80102641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
80102648:	55                   	push   %ebp
80102649:	89 e5                	mov    %esp,%ebp
8010264b:	83 ec 24             	sub    $0x24,%esp
    acquire(&kmem.lock);
8010264e:	68 40 16 11 80       	push   $0x80111640
80102653:	e8 18 21 00 00       	call   80104770 <acquire>
  r = kmem.freelist;
80102658:	a1 78 16 11 80       	mov    0x80111678,%eax
  if(kmem.use_lock)
8010265d:	8b 15 74 16 11 80    	mov    0x80111674,%edx
  if(r)
80102663:	83 c4 10             	add    $0x10,%esp
80102666:	85 c0                	test   %eax,%eax
80102668:	74 08                	je     80102672 <kalloc+0x52>
    kmem.freelist = r->next;
8010266a:	8b 08                	mov    (%eax),%ecx
8010266c:	89 0d 78 16 11 80    	mov    %ecx,0x80111678
  if(kmem.use_lock)
80102672:	85 d2                	test   %edx,%edx
80102674:	74 16                	je     8010268c <kalloc+0x6c>
    release(&kmem.lock);
80102676:	83 ec 0c             	sub    $0xc,%esp
80102679:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010267c:	68 40 16 11 80       	push   $0x80111640
80102681:	e8 8a 20 00 00       	call   80104710 <release>
  return (char*)r;
80102686:	8b 45 f4             	mov    -0xc(%ebp),%eax
    release(&kmem.lock);
80102689:	83 c4 10             	add    $0x10,%esp
}
8010268c:	c9                   	leave  
8010268d:	c3                   	ret    
8010268e:	66 90                	xchg   %ax,%ax

80102690 <khugefree>:

// r is a single node of a linked list that holds all free 
// huge pages, hugefreelist is the head of that linked list
//free a huge size page
void khugefree(char *v) 
{
80102690:	55                   	push   %ebp
80102691:	89 e5                	mov    %esp,%ebp
80102693:	53                   	push   %ebx
80102694:	83 ec 04             	sub    $0x4,%esp
80102697:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  // if trying to free something that is not in 4MB chunks or 
  // trying to free something outside of the huge page size range
  // panic
  if((uint)v % HUGE_PAGE_SIZE || V2P(v) < HUGE_PAGE_START || V2P(v) >= HUGE_PAGE_END)
8010269a:	f7 c3 ff ff 3f 00    	test   $0x3fffff,%ebx
801026a0:	75 76                	jne    80102718 <khugefree+0x88>
801026a2:	8d 83 00 00 00 62    	lea    0x62000000(%ebx),%eax
801026a8:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
801026ad:	77 69                	ja     80102718 <khugefree+0x88>
  {
    panic("khugefree");
  }

  // fill memory with junk
  memset(v, 1, HUGE_PAGE_SIZE);
801026af:	83 ec 04             	sub    $0x4,%esp
801026b2:	68 00 00 40 00       	push   $0x400000
801026b7:	6a 01                	push   $0x1
801026b9:	53                   	push   %ebx
801026ba:	e8 71 21 00 00       	call   80104830 <memset>

  if(kmem.use_lock)
801026bf:	8b 15 74 16 11 80    	mov    0x80111674,%edx
801026c5:	83 c4 10             	add    $0x10,%esp
801026c8:	85 d2                	test   %edx,%edx
801026ca:	75 24                	jne    801026f0 <khugefree+0x60>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.hugefreelist;
801026cc:	a1 7c 16 11 80       	mov    0x8011167c,%eax
801026d1:	89 03                	mov    %eax,(%ebx)
  kmem.hugefreelist = r;
  if(kmem.use_lock)
801026d3:	a1 74 16 11 80       	mov    0x80111674,%eax
  kmem.hugefreelist = r;
801026d8:	89 1d 7c 16 11 80    	mov    %ebx,0x8011167c
  if(kmem.use_lock)
801026de:	85 c0                	test   %eax,%eax
801026e0:	75 26                	jne    80102708 <khugefree+0x78>
    release(&kmem.lock);
}
801026e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801026e5:	c9                   	leave  
801026e6:	c3                   	ret    
801026e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026ee:	66 90                	xchg   %ax,%ax
    acquire(&kmem.lock);
801026f0:	83 ec 0c             	sub    $0xc,%esp
801026f3:	68 40 16 11 80       	push   $0x80111640
801026f8:	e8 73 20 00 00       	call   80104770 <acquire>
801026fd:	83 c4 10             	add    $0x10,%esp
80102700:	eb ca                	jmp    801026cc <khugefree+0x3c>
80102702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    release(&kmem.lock);
80102708:	c7 45 08 40 16 11 80 	movl   $0x80111640,0x8(%ebp)
}
8010270f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102712:	c9                   	leave  
    release(&kmem.lock);
80102713:	e9 f8 1f 00 00       	jmp    80104710 <release>
    panic("khugefree");
80102718:	83 ec 0c             	sub    $0xc,%esp
8010271b:	68 11 77 10 80       	push   $0x80107711
80102720:	e8 5b dc ff ff       	call   80100380 <panic>
80102725:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010272c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102730 <kinit2>:
{
80102730:	55                   	push   %ebp
80102731:	89 e5                	mov    %esp,%ebp
80102733:	56                   	push   %esi
  p = (char*)PGROUNDUP((uint)vstart);
80102734:	8b 45 08             	mov    0x8(%ebp),%eax
{
80102737:	8b 75 0c             	mov    0xc(%ebp),%esi
8010273a:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
8010273b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102741:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102747:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010274d:	39 de                	cmp    %ebx,%esi
8010274f:	72 23                	jb     80102774 <kinit2+0x44>
80102751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102758:	83 ec 0c             	sub    $0xc,%esp
8010275b:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102761:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102767:	50                   	push   %eax
80102768:	e8 53 fd ff ff       	call   801024c0 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010276d:	83 c4 10             	add    $0x10,%esp
80102770:	39 de                	cmp    %ebx,%esi
80102772:	73 e4                	jae    80102758 <kinit2+0x28>
{
80102774:	bb 00 00 00 9e       	mov    $0x9e000000,%ebx
80102779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
void freerangehuge(void *vstart, void *vend) 
{
  char *p;
  p = (char*)HUGEPGROUNDUP((uint)vstart);
  for(; p + HUGE_PAGE_SIZE <= (char*)vend; p += HUGE_PAGE_SIZE)
    khugefree(p);
80102780:	83 ec 0c             	sub    $0xc,%esp
80102783:	53                   	push   %ebx
  for(; p + HUGE_PAGE_SIZE <= (char*)vend; p += HUGE_PAGE_SIZE)
80102784:	81 c3 00 00 40 00    	add    $0x400000,%ebx
    khugefree(p);
8010278a:	e8 01 ff ff ff       	call   80102690 <khugefree>
  for(; p + HUGE_PAGE_SIZE <= (char*)vend; p += HUGE_PAGE_SIZE)
8010278f:	83 c4 10             	add    $0x10,%esp
80102792:	81 fb 00 00 00 be    	cmp    $0xbe000000,%ebx
80102798:	75 e6                	jne    80102780 <kinit2+0x50>
  kmem.use_lock = 1;
8010279a:	c7 05 74 16 11 80 01 	movl   $0x1,0x80111674
801027a1:	00 00 00 
}
801027a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801027a7:	5b                   	pop    %ebx
801027a8:	5e                   	pop    %esi
801027a9:	5d                   	pop    %ebp
801027aa:	c3                   	ret    
801027ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027af:	90                   	nop

801027b0 <freerangehuge>:
{
801027b0:	55                   	push   %ebp
801027b1:	89 e5                	mov    %esp,%ebp
801027b3:	56                   	push   %esi
  p = (char*)HUGEPGROUNDUP((uint)vstart);
801027b4:	8b 45 08             	mov    0x8(%ebp),%eax
{
801027b7:	8b 75 0c             	mov    0xc(%ebp),%esi
801027ba:	53                   	push   %ebx
  p = (char*)HUGEPGROUNDUP((uint)vstart);
801027bb:	8d 98 ff ff 3f 00    	lea    0x3fffff(%eax),%ebx
801027c1:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
  for(; p + HUGE_PAGE_SIZE <= (char*)vend; p += HUGE_PAGE_SIZE)
801027c7:	81 c3 00 00 40 00    	add    $0x400000,%ebx
801027cd:	39 de                	cmp    %ebx,%esi
801027cf:	72 23                	jb     801027f4 <freerangehuge+0x44>
801027d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    khugefree(p);
801027d8:	83 ec 0c             	sub    $0xc,%esp
801027db:	8d 83 00 00 c0 ff    	lea    -0x400000(%ebx),%eax
  for(; p + HUGE_PAGE_SIZE <= (char*)vend; p += HUGE_PAGE_SIZE)
801027e1:	81 c3 00 00 40 00    	add    $0x400000,%ebx
    khugefree(p);
801027e7:	50                   	push   %eax
801027e8:	e8 a3 fe ff ff       	call   80102690 <khugefree>
  for(; p + HUGE_PAGE_SIZE <= (char*)vend; p += HUGE_PAGE_SIZE)
801027ed:	83 c4 10             	add    $0x10,%esp
801027f0:	39 f3                	cmp    %esi,%ebx
801027f2:	76 e4                	jbe    801027d8 <freerangehuge+0x28>
}
801027f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801027f7:	5b                   	pop    %ebx
801027f8:	5e                   	pop    %esi
801027f9:	5d                   	pop    %ebp
801027fa:	c3                   	ret    
801027fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027ff:	90                   	nop

80102800 <khugeinit>:

void khugeinit(void *vstart, void *vend) 
{
80102800:	55                   	push   %ebp
80102801:	89 e5                	mov    %esp,%ebp
80102803:	56                   	push   %esi
  p = (char*)HUGEPGROUNDUP((uint)vstart);
80102804:	8b 45 08             	mov    0x8(%ebp),%eax
{
80102807:	8b 75 0c             	mov    0xc(%ebp),%esi
8010280a:	53                   	push   %ebx
  p = (char*)HUGEPGROUNDUP((uint)vstart);
8010280b:	8d 98 ff ff 3f 00    	lea    0x3fffff(%eax),%ebx
80102811:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
  for(; p + HUGE_PAGE_SIZE <= (char*)vend; p += HUGE_PAGE_SIZE)
80102817:	81 c3 00 00 40 00    	add    $0x400000,%ebx
8010281d:	39 de                	cmp    %ebx,%esi
8010281f:	72 23                	jb     80102844 <khugeinit+0x44>
80102821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    khugefree(p);
80102828:	83 ec 0c             	sub    $0xc,%esp
8010282b:	8d 83 00 00 c0 ff    	lea    -0x400000(%ebx),%eax
  for(; p + HUGE_PAGE_SIZE <= (char*)vend; p += HUGE_PAGE_SIZE)
80102831:	81 c3 00 00 40 00    	add    $0x400000,%ebx
    khugefree(p);
80102837:	50                   	push   %eax
80102838:	e8 53 fe ff ff       	call   80102690 <khugefree>
  for(; p + HUGE_PAGE_SIZE <= (char*)vend; p += HUGE_PAGE_SIZE)
8010283d:	83 c4 10             	add    $0x10,%esp
80102840:	39 de                	cmp    %ebx,%esi
80102842:	73 e4                	jae    80102828 <khugeinit+0x28>
  freerangehuge(vstart, vend);
}
80102844:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102847:	5b                   	pop    %ebx
80102848:	5e                   	pop    %esi
80102849:	5d                   	pop    %ebp
8010284a:	c3                   	ret    
8010284b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010284f:	90                   	nop

80102850 <khughalloc>:

char* khughalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
80102850:	a1 74 16 11 80       	mov    0x80111674,%eax
80102855:	85 c0                	test   %eax,%eax
80102857:	75 1f                	jne    80102878 <khughalloc+0x28>
    acquire(&kmem.lock);
  r = kmem.hugefreelist;
80102859:	a1 7c 16 11 80       	mov    0x8011167c,%eax
  if(r)
8010285e:	85 c0                	test   %eax,%eax
80102860:	74 0e                	je     80102870 <khughalloc+0x20>
    kmem.hugefreelist = r->next;
80102862:	8b 10                	mov    (%eax),%edx
80102864:	89 15 7c 16 11 80    	mov    %edx,0x8011167c
  if(kmem.use_lock)
8010286a:	c3                   	ret    
8010286b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010286f:	90                   	nop
    release(&kmem.lock);
  return (char*)r;
}
80102870:	c3                   	ret    
80102871:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
80102878:	55                   	push   %ebp
80102879:	89 e5                	mov    %esp,%ebp
8010287b:	83 ec 24             	sub    $0x24,%esp
    acquire(&kmem.lock);
8010287e:	68 40 16 11 80       	push   $0x80111640
80102883:	e8 e8 1e 00 00       	call   80104770 <acquire>
  r = kmem.hugefreelist;
80102888:	a1 7c 16 11 80       	mov    0x8011167c,%eax
  if(kmem.use_lock)
8010288d:	8b 15 74 16 11 80    	mov    0x80111674,%edx
  if(r)
80102893:	83 c4 10             	add    $0x10,%esp
80102896:	85 c0                	test   %eax,%eax
80102898:	74 08                	je     801028a2 <khughalloc+0x52>
    kmem.hugefreelist = r->next;
8010289a:	8b 08                	mov    (%eax),%ecx
8010289c:	89 0d 7c 16 11 80    	mov    %ecx,0x8011167c
  if(kmem.use_lock)
801028a2:	85 d2                	test   %edx,%edx
801028a4:	74 16                	je     801028bc <khughalloc+0x6c>
    release(&kmem.lock);
801028a6:	83 ec 0c             	sub    $0xc,%esp
801028a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
801028ac:	68 40 16 11 80       	push   $0x80111640
801028b1:	e8 5a 1e 00 00       	call   80104710 <release>
  return (char*)r;
801028b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    release(&kmem.lock);
801028b9:	83 c4 10             	add    $0x10,%esp
}
801028bc:	c9                   	leave  
801028bd:	c3                   	ret    
801028be:	66 90                	xchg   %ax,%ax

801028c0 <kbdgetc>:
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028c0:	ba 64 00 00 00       	mov    $0x64,%edx
801028c5:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
801028c6:	a8 01                	test   $0x1,%al
801028c8:	0f 84 c2 00 00 00    	je     80102990 <kbdgetc+0xd0>
{
801028ce:	55                   	push   %ebp
801028cf:	ba 60 00 00 00       	mov    $0x60,%edx
801028d4:	89 e5                	mov    %esp,%ebp
801028d6:	53                   	push   %ebx
801028d7:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
801028d8:	8b 1d 80 16 11 80    	mov    0x80111680,%ebx
  data = inb(KBDATAP);
801028de:	0f b6 c8             	movzbl %al,%ecx
  if(data == 0xE0){
801028e1:	3c e0                	cmp    $0xe0,%al
801028e3:	74 5b                	je     80102940 <kbdgetc+0x80>
    return 0;
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
801028e5:	89 da                	mov    %ebx,%edx
801028e7:	83 e2 40             	and    $0x40,%edx
  } else if(data & 0x80){
801028ea:	84 c0                	test   %al,%al
801028ec:	78 62                	js     80102950 <kbdgetc+0x90>
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
801028ee:	85 d2                	test   %edx,%edx
801028f0:	74 09                	je     801028fb <kbdgetc+0x3b>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
801028f2:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
801028f5:	83 e3 bf             	and    $0xffffffbf,%ebx
    data |= 0x80;
801028f8:	0f b6 c8             	movzbl %al,%ecx
  }

  shift |= shiftcode[data];
801028fb:	0f b6 91 40 78 10 80 	movzbl -0x7fef87c0(%ecx),%edx
  shift ^= togglecode[data];
80102902:	0f b6 81 40 77 10 80 	movzbl -0x7fef88c0(%ecx),%eax
  shift |= shiftcode[data];
80102909:	09 da                	or     %ebx,%edx
  shift ^= togglecode[data];
8010290b:	31 c2                	xor    %eax,%edx
  c = charcode[shift & (CTL | SHIFT)][data];
8010290d:	89 d0                	mov    %edx,%eax
  shift ^= togglecode[data];
8010290f:	89 15 80 16 11 80    	mov    %edx,0x80111680
  c = charcode[shift & (CTL | SHIFT)][data];
80102915:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
80102918:	83 e2 08             	and    $0x8,%edx
  c = charcode[shift & (CTL | SHIFT)][data];
8010291b:	8b 04 85 20 77 10 80 	mov    -0x7fef88e0(,%eax,4),%eax
80102922:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
  if(shift & CAPSLOCK){
80102926:	74 0b                	je     80102933 <kbdgetc+0x73>
    if('a' <= c && c <= 'z')
80102928:	8d 50 9f             	lea    -0x61(%eax),%edx
8010292b:	83 fa 19             	cmp    $0x19,%edx
8010292e:	77 48                	ja     80102978 <kbdgetc+0xb8>
      c += 'A' - 'a';
80102930:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102933:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102936:	c9                   	leave  
80102937:	c3                   	ret    
80102938:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010293f:	90                   	nop
    shift |= E0ESC;
80102940:	83 cb 40             	or     $0x40,%ebx
    return 0;
80102943:	31 c0                	xor    %eax,%eax
    shift |= E0ESC;
80102945:	89 1d 80 16 11 80    	mov    %ebx,0x80111680
}
8010294b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010294e:	c9                   	leave  
8010294f:	c3                   	ret    
    data = (shift & E0ESC ? data : data & 0x7F);
80102950:	83 e0 7f             	and    $0x7f,%eax
80102953:	85 d2                	test   %edx,%edx
80102955:	0f 44 c8             	cmove  %eax,%ecx
    shift &= ~(shiftcode[data] | E0ESC);
80102958:	0f b6 81 40 78 10 80 	movzbl -0x7fef87c0(%ecx),%eax
8010295f:	83 c8 40             	or     $0x40,%eax
80102962:	0f b6 c0             	movzbl %al,%eax
80102965:	f7 d0                	not    %eax
80102967:	21 d8                	and    %ebx,%eax
}
80102969:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    shift &= ~(shiftcode[data] | E0ESC);
8010296c:	a3 80 16 11 80       	mov    %eax,0x80111680
    return 0;
80102971:	31 c0                	xor    %eax,%eax
}
80102973:	c9                   	leave  
80102974:	c3                   	ret    
80102975:	8d 76 00             	lea    0x0(%esi),%esi
    else if('A' <= c && c <= 'Z')
80102978:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
8010297b:	8d 50 20             	lea    0x20(%eax),%edx
}
8010297e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102981:	c9                   	leave  
      c += 'a' - 'A';
80102982:	83 f9 1a             	cmp    $0x1a,%ecx
80102985:	0f 42 c2             	cmovb  %edx,%eax
}
80102988:	c3                   	ret    
80102989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80102990:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80102995:	c3                   	ret    
80102996:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010299d:	8d 76 00             	lea    0x0(%esi),%esi

801029a0 <kbdintr>:

void
kbdintr(void)
{
801029a0:	55                   	push   %ebp
801029a1:	89 e5                	mov    %esp,%ebp
801029a3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
801029a6:	68 c0 28 10 80       	push   $0x801028c0
801029ab:	e8 d0 de ff ff       	call   80100880 <consoleintr>
}
801029b0:	83 c4 10             	add    $0x10,%esp
801029b3:	c9                   	leave  
801029b4:	c3                   	ret    
801029b5:	66 90                	xchg   %ax,%ax
801029b7:	66 90                	xchg   %ax,%ax
801029b9:	66 90                	xchg   %ax,%ax
801029bb:	66 90                	xchg   %ax,%ax
801029bd:	66 90                	xchg   %ax,%ax
801029bf:	90                   	nop

801029c0 <lapicinit>:
}

void
lapicinit(void)
{
  if(!lapic)
801029c0:	a1 84 16 11 80       	mov    0x80111684,%eax
801029c5:	85 c0                	test   %eax,%eax
801029c7:	0f 84 cb 00 00 00    	je     80102a98 <lapicinit+0xd8>
  lapic[index] = value;
801029cd:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801029d4:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
801029d7:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801029da:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
801029e1:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801029e4:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801029e7:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801029ee:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
801029f1:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801029f4:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801029fb:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
801029fe:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102a01:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
80102a08:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102a0b:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102a0e:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102a15:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102a18:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
80102a1b:	8b 50 30             	mov    0x30(%eax),%edx
80102a1e:	c1 ea 10             	shr    $0x10,%edx
80102a21:	81 e2 fc 00 00 00    	and    $0xfc,%edx
80102a27:	75 77                	jne    80102aa0 <lapicinit+0xe0>
  lapic[index] = value;
80102a29:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102a30:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102a33:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102a36:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102a3d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102a40:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102a43:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102a4a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102a4d:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102a50:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102a57:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102a5a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102a5d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102a64:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102a67:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102a6a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102a71:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102a74:	8b 50 20             	mov    0x20(%eax),%edx
80102a77:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a7e:	66 90                	xchg   %ax,%ax
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102a80:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102a86:	80 e6 10             	and    $0x10,%dh
80102a89:	75 f5                	jne    80102a80 <lapicinit+0xc0>
  lapic[index] = value;
80102a8b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102a92:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102a95:	8b 40 20             	mov    0x20(%eax),%eax
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102a98:	c3                   	ret    
80102a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  lapic[index] = value;
80102aa0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102aa7:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102aaa:	8b 50 20             	mov    0x20(%eax),%edx
}
80102aad:	e9 77 ff ff ff       	jmp    80102a29 <lapicinit+0x69>
80102ab2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102ac0 <lapicid>:

int
lapicid(void)
{
  if (!lapic)
80102ac0:	a1 84 16 11 80       	mov    0x80111684,%eax
80102ac5:	85 c0                	test   %eax,%eax
80102ac7:	74 07                	je     80102ad0 <lapicid+0x10>
    return 0;
  return lapic[ID] >> 24;
80102ac9:	8b 40 20             	mov    0x20(%eax),%eax
80102acc:	c1 e8 18             	shr    $0x18,%eax
80102acf:	c3                   	ret    
    return 0;
80102ad0:	31 c0                	xor    %eax,%eax
}
80102ad2:	c3                   	ret    
80102ad3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102ae0 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102ae0:	a1 84 16 11 80       	mov    0x80111684,%eax
80102ae5:	85 c0                	test   %eax,%eax
80102ae7:	74 0d                	je     80102af6 <lapiceoi+0x16>
  lapic[index] = value;
80102ae9:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102af0:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102af3:	8b 40 20             	mov    0x20(%eax),%eax
    lapicw(EOI, 0);
}
80102af6:	c3                   	ret    
80102af7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102afe:	66 90                	xchg   %ax,%ax

80102b00 <microdelay>:
// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
}
80102b00:	c3                   	ret    
80102b01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102b08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102b0f:	90                   	nop

80102b10 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102b10:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102b11:	b8 0f 00 00 00       	mov    $0xf,%eax
80102b16:	ba 70 00 00 00       	mov    $0x70,%edx
80102b1b:	89 e5                	mov    %esp,%ebp
80102b1d:	53                   	push   %ebx
80102b1e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102b21:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102b24:	ee                   	out    %al,(%dx)
80102b25:	b8 0a 00 00 00       	mov    $0xa,%eax
80102b2a:	ba 71 00 00 00       	mov    $0x71,%edx
80102b2f:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102b30:	31 c0                	xor    %eax,%eax
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
80102b32:	c1 e3 18             	shl    $0x18,%ebx
  wrv[0] = 0;
80102b35:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
80102b3b:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102b3d:	c1 e9 0c             	shr    $0xc,%ecx
  lapicw(ICRHI, apicid<<24);
80102b40:	89 da                	mov    %ebx,%edx
  wrv[1] = addr >> 4;
80102b42:	c1 e8 04             	shr    $0x4,%eax
    lapicw(ICRLO, STARTUP | (addr>>12));
80102b45:	80 cd 06             	or     $0x6,%ch
  wrv[1] = addr >> 4;
80102b48:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapic[index] = value;
80102b4e:	a1 84 16 11 80       	mov    0x80111684,%eax
80102b53:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102b59:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102b5c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102b63:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102b66:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102b69:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102b70:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102b73:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102b76:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102b7c:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102b7f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102b85:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102b88:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102b8e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102b91:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102b97:	8b 40 20             	mov    0x20(%eax),%eax
    microdelay(200);
  }
}
80102b9a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b9d:	c9                   	leave  
80102b9e:	c3                   	ret    
80102b9f:	90                   	nop

80102ba0 <cmostime>:
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void
cmostime(struct rtcdate *r)
{
80102ba0:	55                   	push   %ebp
80102ba1:	b8 0b 00 00 00       	mov    $0xb,%eax
80102ba6:	ba 70 00 00 00       	mov    $0x70,%edx
80102bab:	89 e5                	mov    %esp,%ebp
80102bad:	57                   	push   %edi
80102bae:	56                   	push   %esi
80102baf:	53                   	push   %ebx
80102bb0:	83 ec 4c             	sub    $0x4c,%esp
80102bb3:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102bb4:	ba 71 00 00 00       	mov    $0x71,%edx
80102bb9:	ec                   	in     (%dx),%al
  struct rtcdate t1, t2;
  int sb, bcd;

  sb = cmos_read(CMOS_STATB);

  bcd = (sb & (1 << 2)) == 0;
80102bba:	83 e0 04             	and    $0x4,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102bbd:	bb 70 00 00 00       	mov    $0x70,%ebx
80102bc2:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102bc5:	8d 76 00             	lea    0x0(%esi),%esi
80102bc8:	31 c0                	xor    %eax,%eax
80102bca:	89 da                	mov    %ebx,%edx
80102bcc:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102bcd:	b9 71 00 00 00       	mov    $0x71,%ecx
80102bd2:	89 ca                	mov    %ecx,%edx
80102bd4:	ec                   	in     (%dx),%al
80102bd5:	88 45 b7             	mov    %al,-0x49(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102bd8:	89 da                	mov    %ebx,%edx
80102bda:	b8 02 00 00 00       	mov    $0x2,%eax
80102bdf:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102be0:	89 ca                	mov    %ecx,%edx
80102be2:	ec                   	in     (%dx),%al
80102be3:	88 45 b6             	mov    %al,-0x4a(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102be6:	89 da                	mov    %ebx,%edx
80102be8:	b8 04 00 00 00       	mov    $0x4,%eax
80102bed:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102bee:	89 ca                	mov    %ecx,%edx
80102bf0:	ec                   	in     (%dx),%al
80102bf1:	88 45 b5             	mov    %al,-0x4b(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102bf4:	89 da                	mov    %ebx,%edx
80102bf6:	b8 07 00 00 00       	mov    $0x7,%eax
80102bfb:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102bfc:	89 ca                	mov    %ecx,%edx
80102bfe:	ec                   	in     (%dx),%al
80102bff:	88 45 b4             	mov    %al,-0x4c(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102c02:	89 da                	mov    %ebx,%edx
80102c04:	b8 08 00 00 00       	mov    $0x8,%eax
80102c09:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102c0a:	89 ca                	mov    %ecx,%edx
80102c0c:	ec                   	in     (%dx),%al
80102c0d:	89 c7                	mov    %eax,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102c0f:	89 da                	mov    %ebx,%edx
80102c11:	b8 09 00 00 00       	mov    $0x9,%eax
80102c16:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102c17:	89 ca                	mov    %ecx,%edx
80102c19:	ec                   	in     (%dx),%al
80102c1a:	89 c6                	mov    %eax,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102c1c:	89 da                	mov    %ebx,%edx
80102c1e:	b8 0a 00 00 00       	mov    $0xa,%eax
80102c23:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102c24:	89 ca                	mov    %ecx,%edx
80102c26:	ec                   	in     (%dx),%al

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102c27:	84 c0                	test   %al,%al
80102c29:	78 9d                	js     80102bc8 <cmostime+0x28>
  return inb(CMOS_RETURN);
80102c2b:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
80102c2f:	89 fa                	mov    %edi,%edx
80102c31:	0f b6 fa             	movzbl %dl,%edi
80102c34:	89 f2                	mov    %esi,%edx
80102c36:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102c39:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
80102c3d:	0f b6 f2             	movzbl %dl,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102c40:	89 da                	mov    %ebx,%edx
80102c42:	89 7d c8             	mov    %edi,-0x38(%ebp)
80102c45:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102c48:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
80102c4c:	89 75 cc             	mov    %esi,-0x34(%ebp)
80102c4f:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102c52:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80102c56:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102c59:	31 c0                	xor    %eax,%eax
80102c5b:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102c5c:	89 ca                	mov    %ecx,%edx
80102c5e:	ec                   	in     (%dx),%al
80102c5f:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102c62:	89 da                	mov    %ebx,%edx
80102c64:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102c67:	b8 02 00 00 00       	mov    $0x2,%eax
80102c6c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102c6d:	89 ca                	mov    %ecx,%edx
80102c6f:	ec                   	in     (%dx),%al
80102c70:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102c73:	89 da                	mov    %ebx,%edx
80102c75:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102c78:	b8 04 00 00 00       	mov    $0x4,%eax
80102c7d:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102c7e:	89 ca                	mov    %ecx,%edx
80102c80:	ec                   	in     (%dx),%al
80102c81:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102c84:	89 da                	mov    %ebx,%edx
80102c86:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102c89:	b8 07 00 00 00       	mov    $0x7,%eax
80102c8e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102c8f:	89 ca                	mov    %ecx,%edx
80102c91:	ec                   	in     (%dx),%al
80102c92:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102c95:	89 da                	mov    %ebx,%edx
80102c97:	89 45 dc             	mov    %eax,-0x24(%ebp)
80102c9a:	b8 08 00 00 00       	mov    $0x8,%eax
80102c9f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102ca0:	89 ca                	mov    %ecx,%edx
80102ca2:	ec                   	in     (%dx),%al
80102ca3:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102ca6:	89 da                	mov    %ebx,%edx
80102ca8:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102cab:	b8 09 00 00 00       	mov    $0x9,%eax
80102cb0:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102cb1:	89 ca                	mov    %ecx,%edx
80102cb3:	ec                   	in     (%dx),%al
80102cb4:	0f b6 c0             	movzbl %al,%eax
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102cb7:	83 ec 04             	sub    $0x4,%esp
  return inb(CMOS_RETURN);
80102cba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102cbd:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102cc0:	6a 18                	push   $0x18
80102cc2:	50                   	push   %eax
80102cc3:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102cc6:	50                   	push   %eax
80102cc7:	e8 b4 1b 00 00       	call   80104880 <memcmp>
80102ccc:	83 c4 10             	add    $0x10,%esp
80102ccf:	85 c0                	test   %eax,%eax
80102cd1:	0f 85 f1 fe ff ff    	jne    80102bc8 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
80102cd7:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
80102cdb:	75 78                	jne    80102d55 <cmostime+0x1b5>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
80102cdd:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102ce0:	89 c2                	mov    %eax,%edx
80102ce2:	83 e0 0f             	and    $0xf,%eax
80102ce5:	c1 ea 04             	shr    $0x4,%edx
80102ce8:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102ceb:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102cee:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
80102cf1:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102cf4:	89 c2                	mov    %eax,%edx
80102cf6:	83 e0 0f             	and    $0xf,%eax
80102cf9:	c1 ea 04             	shr    $0x4,%edx
80102cfc:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102cff:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102d02:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102d05:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102d08:	89 c2                	mov    %eax,%edx
80102d0a:	83 e0 0f             	and    $0xf,%eax
80102d0d:	c1 ea 04             	shr    $0x4,%edx
80102d10:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102d13:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102d16:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102d19:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102d1c:	89 c2                	mov    %eax,%edx
80102d1e:	83 e0 0f             	and    $0xf,%eax
80102d21:	c1 ea 04             	shr    $0x4,%edx
80102d24:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102d27:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102d2a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
80102d2d:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102d30:	89 c2                	mov    %eax,%edx
80102d32:	83 e0 0f             	and    $0xf,%eax
80102d35:	c1 ea 04             	shr    $0x4,%edx
80102d38:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102d3b:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102d3e:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
80102d41:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102d44:	89 c2                	mov    %eax,%edx
80102d46:	83 e0 0f             	and    $0xf,%eax
80102d49:	c1 ea 04             	shr    $0x4,%edx
80102d4c:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102d4f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102d52:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102d55:	8b 75 08             	mov    0x8(%ebp),%esi
80102d58:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102d5b:	89 06                	mov    %eax,(%esi)
80102d5d:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102d60:	89 46 04             	mov    %eax,0x4(%esi)
80102d63:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102d66:	89 46 08             	mov    %eax,0x8(%esi)
80102d69:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102d6c:	89 46 0c             	mov    %eax,0xc(%esi)
80102d6f:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102d72:	89 46 10             	mov    %eax,0x10(%esi)
80102d75:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102d78:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
80102d7b:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102d82:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d85:	5b                   	pop    %ebx
80102d86:	5e                   	pop    %esi
80102d87:	5f                   	pop    %edi
80102d88:	5d                   	pop    %ebp
80102d89:	c3                   	ret    
80102d8a:	66 90                	xchg   %ax,%ax
80102d8c:	66 90                	xchg   %ax,%ax
80102d8e:	66 90                	xchg   %ax,%ax

80102d90 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102d90:	8b 0d e8 16 11 80    	mov    0x801116e8,%ecx
80102d96:	85 c9                	test   %ecx,%ecx
80102d98:	0f 8e 8a 00 00 00    	jle    80102e28 <install_trans+0x98>
{
80102d9e:	55                   	push   %ebp
80102d9f:	89 e5                	mov    %esp,%ebp
80102da1:	57                   	push   %edi
  for (tail = 0; tail < log.lh.n; tail++) {
80102da2:	31 ff                	xor    %edi,%edi
{
80102da4:	56                   	push   %esi
80102da5:	53                   	push   %ebx
80102da6:	83 ec 0c             	sub    $0xc,%esp
80102da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102db0:	a1 d4 16 11 80       	mov    0x801116d4,%eax
80102db5:	83 ec 08             	sub    $0x8,%esp
80102db8:	01 f8                	add    %edi,%eax
80102dba:	83 c0 01             	add    $0x1,%eax
80102dbd:	50                   	push   %eax
80102dbe:	ff 35 e4 16 11 80    	push   0x801116e4
80102dc4:	e8 07 d3 ff ff       	call   801000d0 <bread>
80102dc9:	89 c6                	mov    %eax,%esi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102dcb:	58                   	pop    %eax
80102dcc:	5a                   	pop    %edx
80102dcd:	ff 34 bd ec 16 11 80 	push   -0x7feee914(,%edi,4)
80102dd4:	ff 35 e4 16 11 80    	push   0x801116e4
  for (tail = 0; tail < log.lh.n; tail++) {
80102dda:	83 c7 01             	add    $0x1,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102ddd:	e8 ee d2 ff ff       	call   801000d0 <bread>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102de2:	83 c4 0c             	add    $0xc,%esp
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102de5:	89 c3                	mov    %eax,%ebx
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102de7:	8d 46 5c             	lea    0x5c(%esi),%eax
80102dea:	68 00 02 00 00       	push   $0x200
80102def:	50                   	push   %eax
80102df0:	8d 43 5c             	lea    0x5c(%ebx),%eax
80102df3:	50                   	push   %eax
80102df4:	e8 d7 1a 00 00       	call   801048d0 <memmove>
    bwrite(dbuf);  // write dst to disk
80102df9:	89 1c 24             	mov    %ebx,(%esp)
80102dfc:	e8 af d3 ff ff       	call   801001b0 <bwrite>
    brelse(lbuf);
80102e01:	89 34 24             	mov    %esi,(%esp)
80102e04:	e8 e7 d3 ff ff       	call   801001f0 <brelse>
    brelse(dbuf);
80102e09:	89 1c 24             	mov    %ebx,(%esp)
80102e0c:	e8 df d3 ff ff       	call   801001f0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102e11:	83 c4 10             	add    $0x10,%esp
80102e14:	39 3d e8 16 11 80    	cmp    %edi,0x801116e8
80102e1a:	7f 94                	jg     80102db0 <install_trans+0x20>
  }
}
80102e1c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e1f:	5b                   	pop    %ebx
80102e20:	5e                   	pop    %esi
80102e21:	5f                   	pop    %edi
80102e22:	5d                   	pop    %ebp
80102e23:	c3                   	ret    
80102e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102e28:	c3                   	ret    
80102e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102e30 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102e30:	55                   	push   %ebp
80102e31:	89 e5                	mov    %esp,%ebp
80102e33:	53                   	push   %ebx
80102e34:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102e37:	ff 35 d4 16 11 80    	push   0x801116d4
80102e3d:	ff 35 e4 16 11 80    	push   0x801116e4
80102e43:	e8 88 d2 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102e48:	83 c4 10             	add    $0x10,%esp
  struct buf *buf = bread(log.dev, log.start);
80102e4b:	89 c3                	mov    %eax,%ebx
  hb->n = log.lh.n;
80102e4d:	a1 e8 16 11 80       	mov    0x801116e8,%eax
80102e52:	89 43 5c             	mov    %eax,0x5c(%ebx)
  for (i = 0; i < log.lh.n; i++) {
80102e55:	85 c0                	test   %eax,%eax
80102e57:	7e 19                	jle    80102e72 <write_head+0x42>
80102e59:	31 d2                	xor    %edx,%edx
80102e5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102e5f:	90                   	nop
    hb->block[i] = log.lh.block[i];
80102e60:	8b 0c 95 ec 16 11 80 	mov    -0x7feee914(,%edx,4),%ecx
80102e67:	89 4c 93 60          	mov    %ecx,0x60(%ebx,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102e6b:	83 c2 01             	add    $0x1,%edx
80102e6e:	39 d0                	cmp    %edx,%eax
80102e70:	75 ee                	jne    80102e60 <write_head+0x30>
  }
  bwrite(buf);
80102e72:	83 ec 0c             	sub    $0xc,%esp
80102e75:	53                   	push   %ebx
80102e76:	e8 35 d3 ff ff       	call   801001b0 <bwrite>
  brelse(buf);
80102e7b:	89 1c 24             	mov    %ebx,(%esp)
80102e7e:	e8 6d d3 ff ff       	call   801001f0 <brelse>
}
80102e83:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e86:	83 c4 10             	add    $0x10,%esp
80102e89:	c9                   	leave  
80102e8a:	c3                   	ret    
80102e8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102e8f:	90                   	nop

80102e90 <initlog>:
{
80102e90:	55                   	push   %ebp
80102e91:	89 e5                	mov    %esp,%ebp
80102e93:	53                   	push   %ebx
80102e94:	83 ec 2c             	sub    $0x2c,%esp
80102e97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
80102e9a:	68 40 79 10 80       	push   $0x80107940
80102e9f:	68 a0 16 11 80       	push   $0x801116a0
80102ea4:	e8 f7 16 00 00       	call   801045a0 <initlock>
  readsb(dev, &sb);
80102ea9:	58                   	pop    %eax
80102eaa:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102ead:	5a                   	pop    %edx
80102eae:	50                   	push   %eax
80102eaf:	53                   	push   %ebx
80102eb0:	e8 6b e6 ff ff       	call   80101520 <readsb>
  log.start = sb.logstart;
80102eb5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  struct buf *buf = bread(log.dev, log.start);
80102eb8:	59                   	pop    %ecx
  log.dev = dev;
80102eb9:	89 1d e4 16 11 80    	mov    %ebx,0x801116e4
  log.size = sb.nlog;
80102ebf:	8b 55 e8             	mov    -0x18(%ebp),%edx
  log.start = sb.logstart;
80102ec2:	a3 d4 16 11 80       	mov    %eax,0x801116d4
  log.size = sb.nlog;
80102ec7:	89 15 d8 16 11 80    	mov    %edx,0x801116d8
  struct buf *buf = bread(log.dev, log.start);
80102ecd:	5a                   	pop    %edx
80102ece:	50                   	push   %eax
80102ecf:	53                   	push   %ebx
80102ed0:	e8 fb d1 ff ff       	call   801000d0 <bread>
  for (i = 0; i < log.lh.n; i++) {
80102ed5:	83 c4 10             	add    $0x10,%esp
  log.lh.n = lh->n;
80102ed8:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102edb:	89 1d e8 16 11 80    	mov    %ebx,0x801116e8
  for (i = 0; i < log.lh.n; i++) {
80102ee1:	85 db                	test   %ebx,%ebx
80102ee3:	7e 1d                	jle    80102f02 <initlog+0x72>
80102ee5:	31 d2                	xor    %edx,%edx
80102ee7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102eee:	66 90                	xchg   %ax,%ax
    log.lh.block[i] = lh->block[i];
80102ef0:	8b 4c 90 60          	mov    0x60(%eax,%edx,4),%ecx
80102ef4:	89 0c 95 ec 16 11 80 	mov    %ecx,-0x7feee914(,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102efb:	83 c2 01             	add    $0x1,%edx
80102efe:	39 d3                	cmp    %edx,%ebx
80102f00:	75 ee                	jne    80102ef0 <initlog+0x60>
  brelse(buf);
80102f02:	83 ec 0c             	sub    $0xc,%esp
80102f05:	50                   	push   %eax
80102f06:	e8 e5 d2 ff ff       	call   801001f0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102f0b:	e8 80 fe ff ff       	call   80102d90 <install_trans>
  log.lh.n = 0;
80102f10:	c7 05 e8 16 11 80 00 	movl   $0x0,0x801116e8
80102f17:	00 00 00 
  write_head(); // clear the log
80102f1a:	e8 11 ff ff ff       	call   80102e30 <write_head>
}
80102f1f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102f22:	83 c4 10             	add    $0x10,%esp
80102f25:	c9                   	leave  
80102f26:	c3                   	ret    
80102f27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f2e:	66 90                	xchg   %ax,%ax

80102f30 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102f30:	55                   	push   %ebp
80102f31:	89 e5                	mov    %esp,%ebp
80102f33:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102f36:	68 a0 16 11 80       	push   $0x801116a0
80102f3b:	e8 30 18 00 00       	call   80104770 <acquire>
80102f40:	83 c4 10             	add    $0x10,%esp
80102f43:	eb 18                	jmp    80102f5d <begin_op+0x2d>
80102f45:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102f48:	83 ec 08             	sub    $0x8,%esp
80102f4b:	68 a0 16 11 80       	push   $0x801116a0
80102f50:	68 a0 16 11 80       	push   $0x801116a0
80102f55:	e8 b6 12 00 00       	call   80104210 <sleep>
80102f5a:	83 c4 10             	add    $0x10,%esp
    if(log.committing){
80102f5d:	a1 e0 16 11 80       	mov    0x801116e0,%eax
80102f62:	85 c0                	test   %eax,%eax
80102f64:	75 e2                	jne    80102f48 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102f66:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102f6b:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
80102f71:	83 c0 01             	add    $0x1,%eax
80102f74:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102f77:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102f7a:	83 fa 1e             	cmp    $0x1e,%edx
80102f7d:	7f c9                	jg     80102f48 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102f7f:	83 ec 0c             	sub    $0xc,%esp
      log.outstanding += 1;
80102f82:	a3 dc 16 11 80       	mov    %eax,0x801116dc
      release(&log.lock);
80102f87:	68 a0 16 11 80       	push   $0x801116a0
80102f8c:	e8 7f 17 00 00       	call   80104710 <release>
      break;
    }
  }
}
80102f91:	83 c4 10             	add    $0x10,%esp
80102f94:	c9                   	leave  
80102f95:	c3                   	ret    
80102f96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f9d:	8d 76 00             	lea    0x0(%esi),%esi

80102fa0 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102fa0:	55                   	push   %ebp
80102fa1:	89 e5                	mov    %esp,%ebp
80102fa3:	57                   	push   %edi
80102fa4:	56                   	push   %esi
80102fa5:	53                   	push   %ebx
80102fa6:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102fa9:	68 a0 16 11 80       	push   $0x801116a0
80102fae:	e8 bd 17 00 00       	call   80104770 <acquire>
  log.outstanding -= 1;
80102fb3:	a1 dc 16 11 80       	mov    0x801116dc,%eax
  if(log.committing)
80102fb8:	8b 35 e0 16 11 80    	mov    0x801116e0,%esi
80102fbe:	83 c4 10             	add    $0x10,%esp
  log.outstanding -= 1;
80102fc1:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102fc4:	89 1d dc 16 11 80    	mov    %ebx,0x801116dc
  if(log.committing)
80102fca:	85 f6                	test   %esi,%esi
80102fcc:	0f 85 22 01 00 00    	jne    801030f4 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102fd2:	85 db                	test   %ebx,%ebx
80102fd4:	0f 85 f6 00 00 00    	jne    801030d0 <end_op+0x130>
    do_commit = 1;
    log.committing = 1;
80102fda:	c7 05 e0 16 11 80 01 	movl   $0x1,0x801116e0
80102fe1:	00 00 00 
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102fe4:	83 ec 0c             	sub    $0xc,%esp
80102fe7:	68 a0 16 11 80       	push   $0x801116a0
80102fec:	e8 1f 17 00 00       	call   80104710 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102ff1:	8b 0d e8 16 11 80    	mov    0x801116e8,%ecx
80102ff7:	83 c4 10             	add    $0x10,%esp
80102ffa:	85 c9                	test   %ecx,%ecx
80102ffc:	7f 42                	jg     80103040 <end_op+0xa0>
    acquire(&log.lock);
80102ffe:	83 ec 0c             	sub    $0xc,%esp
80103001:	68 a0 16 11 80       	push   $0x801116a0
80103006:	e8 65 17 00 00       	call   80104770 <acquire>
    wakeup(&log);
8010300b:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
    log.committing = 0;
80103012:	c7 05 e0 16 11 80 00 	movl   $0x0,0x801116e0
80103019:	00 00 00 
    wakeup(&log);
8010301c:	e8 af 12 00 00       	call   801042d0 <wakeup>
    release(&log.lock);
80103021:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80103028:	e8 e3 16 00 00       	call   80104710 <release>
8010302d:	83 c4 10             	add    $0x10,%esp
}
80103030:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103033:	5b                   	pop    %ebx
80103034:	5e                   	pop    %esi
80103035:	5f                   	pop    %edi
80103036:	5d                   	pop    %ebp
80103037:	c3                   	ret    
80103038:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010303f:	90                   	nop
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80103040:	a1 d4 16 11 80       	mov    0x801116d4,%eax
80103045:	83 ec 08             	sub    $0x8,%esp
80103048:	01 d8                	add    %ebx,%eax
8010304a:	83 c0 01             	add    $0x1,%eax
8010304d:	50                   	push   %eax
8010304e:	ff 35 e4 16 11 80    	push   0x801116e4
80103054:	e8 77 d0 ff ff       	call   801000d0 <bread>
80103059:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
8010305b:	58                   	pop    %eax
8010305c:	5a                   	pop    %edx
8010305d:	ff 34 9d ec 16 11 80 	push   -0x7feee914(,%ebx,4)
80103064:	ff 35 e4 16 11 80    	push   0x801116e4
  for (tail = 0; tail < log.lh.n; tail++) {
8010306a:	83 c3 01             	add    $0x1,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
8010306d:	e8 5e d0 ff ff       	call   801000d0 <bread>
    memmove(to->data, from->data, BSIZE);
80103072:	83 c4 0c             	add    $0xc,%esp
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80103075:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80103077:	8d 40 5c             	lea    0x5c(%eax),%eax
8010307a:	68 00 02 00 00       	push   $0x200
8010307f:	50                   	push   %eax
80103080:	8d 46 5c             	lea    0x5c(%esi),%eax
80103083:	50                   	push   %eax
80103084:	e8 47 18 00 00       	call   801048d0 <memmove>
    bwrite(to);  // write the log
80103089:	89 34 24             	mov    %esi,(%esp)
8010308c:	e8 1f d1 ff ff       	call   801001b0 <bwrite>
    brelse(from);
80103091:	89 3c 24             	mov    %edi,(%esp)
80103094:	e8 57 d1 ff ff       	call   801001f0 <brelse>
    brelse(to);
80103099:	89 34 24             	mov    %esi,(%esp)
8010309c:	e8 4f d1 ff ff       	call   801001f0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
801030a1:	83 c4 10             	add    $0x10,%esp
801030a4:	3b 1d e8 16 11 80    	cmp    0x801116e8,%ebx
801030aa:	7c 94                	jl     80103040 <end_op+0xa0>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
801030ac:	e8 7f fd ff ff       	call   80102e30 <write_head>
    install_trans(); // Now install writes to home locations
801030b1:	e8 da fc ff ff       	call   80102d90 <install_trans>
    log.lh.n = 0;
801030b6:	c7 05 e8 16 11 80 00 	movl   $0x0,0x801116e8
801030bd:	00 00 00 
    write_head();    // Erase the transaction from the log
801030c0:	e8 6b fd ff ff       	call   80102e30 <write_head>
801030c5:	e9 34 ff ff ff       	jmp    80102ffe <end_op+0x5e>
801030ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    wakeup(&log);
801030d0:	83 ec 0c             	sub    $0xc,%esp
801030d3:	68 a0 16 11 80       	push   $0x801116a0
801030d8:	e8 f3 11 00 00       	call   801042d0 <wakeup>
  release(&log.lock);
801030dd:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
801030e4:	e8 27 16 00 00       	call   80104710 <release>
801030e9:	83 c4 10             	add    $0x10,%esp
}
801030ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030ef:	5b                   	pop    %ebx
801030f0:	5e                   	pop    %esi
801030f1:	5f                   	pop    %edi
801030f2:	5d                   	pop    %ebp
801030f3:	c3                   	ret    
    panic("log.committing");
801030f4:	83 ec 0c             	sub    $0xc,%esp
801030f7:	68 44 79 10 80       	push   $0x80107944
801030fc:	e8 7f d2 ff ff       	call   80100380 <panic>
80103101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103108:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010310f:	90                   	nop

80103110 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80103110:	55                   	push   %ebp
80103111:	89 e5                	mov    %esp,%ebp
80103113:	53                   	push   %ebx
80103114:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80103117:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
{
8010311d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80103120:	83 fa 1d             	cmp    $0x1d,%edx
80103123:	0f 8f 85 00 00 00    	jg     801031ae <log_write+0x9e>
80103129:	a1 d8 16 11 80       	mov    0x801116d8,%eax
8010312e:	83 e8 01             	sub    $0x1,%eax
80103131:	39 c2                	cmp    %eax,%edx
80103133:	7d 79                	jge    801031ae <log_write+0x9e>
    panic("too big a transaction");
  if (log.outstanding < 1)
80103135:	a1 dc 16 11 80       	mov    0x801116dc,%eax
8010313a:	85 c0                	test   %eax,%eax
8010313c:	7e 7d                	jle    801031bb <log_write+0xab>
    panic("log_write outside of trans");

  acquire(&log.lock);
8010313e:	83 ec 0c             	sub    $0xc,%esp
80103141:	68 a0 16 11 80       	push   $0x801116a0
80103146:	e8 25 16 00 00       	call   80104770 <acquire>
  for (i = 0; i < log.lh.n; i++) {
8010314b:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
80103151:	83 c4 10             	add    $0x10,%esp
80103154:	85 d2                	test   %edx,%edx
80103156:	7e 4a                	jle    801031a2 <log_write+0x92>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80103158:	8b 4b 08             	mov    0x8(%ebx),%ecx
  for (i = 0; i < log.lh.n; i++) {
8010315b:	31 c0                	xor    %eax,%eax
8010315d:	eb 08                	jmp    80103167 <log_write+0x57>
8010315f:	90                   	nop
80103160:	83 c0 01             	add    $0x1,%eax
80103163:	39 c2                	cmp    %eax,%edx
80103165:	74 29                	je     80103190 <log_write+0x80>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80103167:	39 0c 85 ec 16 11 80 	cmp    %ecx,-0x7feee914(,%eax,4)
8010316e:	75 f0                	jne    80103160 <log_write+0x50>
      break;
  }
  log.lh.block[i] = b->blockno;
80103170:	89 0c 85 ec 16 11 80 	mov    %ecx,-0x7feee914(,%eax,4)
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
80103177:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
}
8010317a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  release(&log.lock);
8010317d:	c7 45 08 a0 16 11 80 	movl   $0x801116a0,0x8(%ebp)
}
80103184:	c9                   	leave  
  release(&log.lock);
80103185:	e9 86 15 00 00       	jmp    80104710 <release>
8010318a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  log.lh.block[i] = b->blockno;
80103190:	89 0c 95 ec 16 11 80 	mov    %ecx,-0x7feee914(,%edx,4)
    log.lh.n++;
80103197:	83 c2 01             	add    $0x1,%edx
8010319a:	89 15 e8 16 11 80    	mov    %edx,0x801116e8
801031a0:	eb d5                	jmp    80103177 <log_write+0x67>
  log.lh.block[i] = b->blockno;
801031a2:	8b 43 08             	mov    0x8(%ebx),%eax
801031a5:	a3 ec 16 11 80       	mov    %eax,0x801116ec
  if (i == log.lh.n)
801031aa:	75 cb                	jne    80103177 <log_write+0x67>
801031ac:	eb e9                	jmp    80103197 <log_write+0x87>
    panic("too big a transaction");
801031ae:	83 ec 0c             	sub    $0xc,%esp
801031b1:	68 53 79 10 80       	push   $0x80107953
801031b6:	e8 c5 d1 ff ff       	call   80100380 <panic>
    panic("log_write outside of trans");
801031bb:	83 ec 0c             	sub    $0xc,%esp
801031be:	68 69 79 10 80       	push   $0x80107969
801031c3:	e8 b8 d1 ff ff       	call   80100380 <panic>
801031c8:	66 90                	xchg   %ax,%ax
801031ca:	66 90                	xchg   %ax,%ax
801031cc:	66 90                	xchg   %ax,%ax
801031ce:	66 90                	xchg   %ax,%ax

801031d0 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
801031d0:	55                   	push   %ebp
801031d1:	89 e5                	mov    %esp,%ebp
801031d3:	53                   	push   %ebx
801031d4:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
801031d7:	e8 44 09 00 00       	call   80103b20 <cpuid>
801031dc:	89 c3                	mov    %eax,%ebx
801031de:	e8 3d 09 00 00       	call   80103b20 <cpuid>
801031e3:	83 ec 04             	sub    $0x4,%esp
801031e6:	53                   	push   %ebx
801031e7:	50                   	push   %eax
801031e8:	68 84 79 10 80       	push   $0x80107984
801031ed:	e8 ae d4 ff ff       	call   801006a0 <cprintf>
  idtinit();       // load idt register
801031f2:	e8 e9 29 00 00       	call   80105be0 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
801031f7:	e8 c4 08 00 00       	call   80103ac0 <mycpu>
801031fc:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
801031fe:	b8 01 00 00 00       	mov    $0x1,%eax
80103203:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
8010320a:	e8 f1 0b 00 00       	call   80103e00 <scheduler>
8010320f:	90                   	nop

80103210 <mpenter>:
{
80103210:	55                   	push   %ebp
80103211:	89 e5                	mov    %esp,%ebp
80103213:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80103216:	e8 b5 3a 00 00       	call   80106cd0 <switchkvm>
  seginit();
8010321b:	e8 20 3a 00 00       	call   80106c40 <seginit>
  lapicinit();
80103220:	e8 9b f7 ff ff       	call   801029c0 <lapicinit>
  mpmain();
80103225:	e8 a6 ff ff ff       	call   801031d0 <mpmain>
8010322a:	66 90                	xchg   %ax,%ax
8010322c:	66 90                	xchg   %ax,%ax
8010322e:	66 90                	xchg   %ax,%ax

80103230 <main>:
{
80103230:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80103234:	83 e4 f0             	and    $0xfffffff0,%esp
80103237:	ff 71 fc             	push   -0x4(%ecx)
8010323a:	55                   	push   %ebp
8010323b:	89 e5                	mov    %esp,%ebp
8010323d:	53                   	push   %ebx
8010323e:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
8010323f:	83 ec 08             	sub    $0x8,%esp
80103242:	68 00 00 40 80       	push   $0x80400000
80103247:	68 d0 55 11 80       	push   $0x801155d0
8010324c:	e8 5f f3 ff ff       	call   801025b0 <kinit1>
  kvmalloc();      // kernel page table
80103251:	e8 6a 3f 00 00       	call   801071c0 <kvmalloc>
  mpinit();        // detect other processors
80103256:	e8 85 01 00 00       	call   801033e0 <mpinit>
  lapicinit();     // interrupt controller
8010325b:	e8 60 f7 ff ff       	call   801029c0 <lapicinit>
  seginit();       // segment descriptors
80103260:	e8 db 39 00 00       	call   80106c40 <seginit>
  picinit();       // disable pic
80103265:	e8 76 03 00 00       	call   801035e0 <picinit>
  ioapicinit();    // another interrupt controller
8010326a:	e8 61 f1 ff ff       	call   801023d0 <ioapicinit>
  consoleinit();   // console hardware
8010326f:	e8 ec d7 ff ff       	call   80100a60 <consoleinit>
  uartinit();      // serial port
80103274:	e8 57 2c 00 00       	call   80105ed0 <uartinit>
  pinit();         // process table
80103279:	e8 22 08 00 00       	call   80103aa0 <pinit>
  tvinit();        // trap vectors
8010327e:	e8 dd 28 00 00       	call   80105b60 <tvinit>
  binit();         // buffer cache
80103283:	e8 b8 cd ff ff       	call   80100040 <binit>
  fileinit();      // file table
80103288:	e8 83 db ff ff       	call   80100e10 <fileinit>
  ideinit();       // disk 
8010328d:	e8 2e ef ff ff       	call   801021c0 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80103292:	83 c4 0c             	add    $0xc,%esp
80103295:	68 8a 00 00 00       	push   $0x8a
8010329a:	68 8c a4 10 80       	push   $0x8010a48c
8010329f:	68 00 70 00 80       	push   $0x80007000
801032a4:	e8 27 16 00 00       	call   801048d0 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
801032a9:	83 c4 10             	add    $0x10,%esp
801032ac:	69 05 84 17 11 80 b0 	imul   $0xb0,0x80111784,%eax
801032b3:	00 00 00 
801032b6:	05 a0 17 11 80       	add    $0x801117a0,%eax
801032bb:	3d a0 17 11 80       	cmp    $0x801117a0,%eax
801032c0:	76 7e                	jbe    80103340 <main+0x110>
801032c2:	bb a0 17 11 80       	mov    $0x801117a0,%ebx
801032c7:	eb 20                	jmp    801032e9 <main+0xb9>
801032c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801032d0:	69 05 84 17 11 80 b0 	imul   $0xb0,0x80111784,%eax
801032d7:	00 00 00 
801032da:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
801032e0:	05 a0 17 11 80       	add    $0x801117a0,%eax
801032e5:	39 c3                	cmp    %eax,%ebx
801032e7:	73 57                	jae    80103340 <main+0x110>
    if(c == mycpu())  // We've started already.
801032e9:	e8 d2 07 00 00       	call   80103ac0 <mycpu>
801032ee:	39 c3                	cmp    %eax,%ebx
801032f0:	74 de                	je     801032d0 <main+0xa0>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
801032f2:	e8 29 f3 ff ff       	call   80102620 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void(**)(void))(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
801032f7:	83 ec 08             	sub    $0x8,%esp
    *(void(**)(void))(code-8) = mpenter;
801032fa:	c7 05 f8 6f 00 80 10 	movl   $0x80103210,0x80006ff8
80103301:	32 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80103304:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
8010330b:	90 10 00 
    *(void**)(code-4) = stack + KSTACKSIZE;
8010330e:	05 00 10 00 00       	add    $0x1000,%eax
80103313:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    lapicstartap(c->apicid, V2P(code));
80103318:	0f b6 03             	movzbl (%ebx),%eax
8010331b:	68 00 70 00 00       	push   $0x7000
80103320:	50                   	push   %eax
80103321:	e8 ea f7 ff ff       	call   80102b10 <lapicstartap>

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80103326:	83 c4 10             	add    $0x10,%esp
80103329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103330:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80103336:	85 c0                	test   %eax,%eax
80103338:	74 f6                	je     80103330 <main+0x100>
8010333a:	eb 94                	jmp    801032d0 <main+0xa0>
8010333c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80103340:	83 ec 08             	sub    $0x8,%esp
80103343:	68 00 00 00 8e       	push   $0x8e000000
80103348:	68 00 00 40 80       	push   $0x80400000
8010334d:	e8 de f3 ff ff       	call   80102730 <kinit2>
  userinit();      // first user process
80103352:	e8 19 08 00 00       	call   80103b70 <userinit>
  mpmain();        // finish this processor's setup
80103357:	e8 74 fe ff ff       	call   801031d0 <mpmain>
8010335c:	66 90                	xchg   %ax,%ax
8010335e:	66 90                	xchg   %ax,%ax

80103360 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103360:	55                   	push   %ebp
80103361:	89 e5                	mov    %esp,%ebp
80103363:	57                   	push   %edi
80103364:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80103365:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
8010336b:	53                   	push   %ebx
  e = addr+len;
8010336c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
8010336f:	83 ec 0c             	sub    $0xc,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
80103372:	39 de                	cmp    %ebx,%esi
80103374:	72 10                	jb     80103386 <mpsearch1+0x26>
80103376:	eb 50                	jmp    801033c8 <mpsearch1+0x68>
80103378:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010337f:	90                   	nop
80103380:	89 fe                	mov    %edi,%esi
80103382:	39 fb                	cmp    %edi,%ebx
80103384:	76 42                	jbe    801033c8 <mpsearch1+0x68>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103386:	83 ec 04             	sub    $0x4,%esp
80103389:	8d 7e 10             	lea    0x10(%esi),%edi
8010338c:	6a 04                	push   $0x4
8010338e:	68 98 79 10 80       	push   $0x80107998
80103393:	56                   	push   %esi
80103394:	e8 e7 14 00 00       	call   80104880 <memcmp>
80103399:	83 c4 10             	add    $0x10,%esp
8010339c:	85 c0                	test   %eax,%eax
8010339e:	75 e0                	jne    80103380 <mpsearch1+0x20>
801033a0:	89 f2                	mov    %esi,%edx
801033a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    sum += addr[i];
801033a8:	0f b6 0a             	movzbl (%edx),%ecx
  for(i=0; i<len; i++)
801033ab:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
801033ae:	01 c8                	add    %ecx,%eax
  for(i=0; i<len; i++)
801033b0:	39 fa                	cmp    %edi,%edx
801033b2:	75 f4                	jne    801033a8 <mpsearch1+0x48>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801033b4:	84 c0                	test   %al,%al
801033b6:	75 c8                	jne    80103380 <mpsearch1+0x20>
      return (struct mp*)p;
  return 0;
}
801033b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801033bb:	89 f0                	mov    %esi,%eax
801033bd:	5b                   	pop    %ebx
801033be:	5e                   	pop    %esi
801033bf:	5f                   	pop    %edi
801033c0:	5d                   	pop    %ebp
801033c1:	c3                   	ret    
801033c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801033c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801033cb:	31 f6                	xor    %esi,%esi
}
801033cd:	5b                   	pop    %ebx
801033ce:	89 f0                	mov    %esi,%eax
801033d0:	5e                   	pop    %esi
801033d1:	5f                   	pop    %edi
801033d2:	5d                   	pop    %ebp
801033d3:	c3                   	ret    
801033d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801033db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801033df:	90                   	nop

801033e0 <mpinit>:
  return conf;
}

void
mpinit(void)
{
801033e0:	55                   	push   %ebp
801033e1:	89 e5                	mov    %esp,%ebp
801033e3:	57                   	push   %edi
801033e4:	56                   	push   %esi
801033e5:	53                   	push   %ebx
801033e6:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
801033e9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
801033f0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
801033f7:	c1 e0 08             	shl    $0x8,%eax
801033fa:	09 d0                	or     %edx,%eax
801033fc:	c1 e0 04             	shl    $0x4,%eax
801033ff:	75 1b                	jne    8010341c <mpinit+0x3c>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103401:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80103408:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
8010340f:	c1 e0 08             	shl    $0x8,%eax
80103412:	09 d0                	or     %edx,%eax
80103414:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80103417:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
8010341c:	ba 00 04 00 00       	mov    $0x400,%edx
80103421:	e8 3a ff ff ff       	call   80103360 <mpsearch1>
80103426:	89 c3                	mov    %eax,%ebx
80103428:	85 c0                	test   %eax,%eax
8010342a:	0f 84 40 01 00 00    	je     80103570 <mpinit+0x190>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103430:	8b 73 04             	mov    0x4(%ebx),%esi
80103433:	85 f6                	test   %esi,%esi
80103435:	0f 84 25 01 00 00    	je     80103560 <mpinit+0x180>
  if(memcmp(conf, "PCMP", 4) != 0)
8010343b:	83 ec 04             	sub    $0x4,%esp
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010343e:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
80103444:	6a 04                	push   $0x4
80103446:	68 9d 79 10 80       	push   $0x8010799d
8010344b:	50                   	push   %eax
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010344c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
8010344f:	e8 2c 14 00 00       	call   80104880 <memcmp>
80103454:	83 c4 10             	add    $0x10,%esp
80103457:	85 c0                	test   %eax,%eax
80103459:	0f 85 01 01 00 00    	jne    80103560 <mpinit+0x180>
  if(conf->version != 1 && conf->version != 4)
8010345f:	0f b6 86 06 00 00 80 	movzbl -0x7ffffffa(%esi),%eax
80103466:	3c 01                	cmp    $0x1,%al
80103468:	74 08                	je     80103472 <mpinit+0x92>
8010346a:	3c 04                	cmp    $0x4,%al
8010346c:	0f 85 ee 00 00 00    	jne    80103560 <mpinit+0x180>
  if(sum((uchar*)conf, conf->length) != 0)
80103472:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
  for(i=0; i<len; i++)
80103479:	66 85 d2             	test   %dx,%dx
8010347c:	74 22                	je     801034a0 <mpinit+0xc0>
8010347e:	8d 3c 32             	lea    (%edx,%esi,1),%edi
80103481:	89 f0                	mov    %esi,%eax
  sum = 0;
80103483:	31 d2                	xor    %edx,%edx
80103485:	8d 76 00             	lea    0x0(%esi),%esi
    sum += addr[i];
80103488:	0f b6 88 00 00 00 80 	movzbl -0x80000000(%eax),%ecx
  for(i=0; i<len; i++)
8010348f:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
80103492:	01 ca                	add    %ecx,%edx
  for(i=0; i<len; i++)
80103494:	39 c7                	cmp    %eax,%edi
80103496:	75 f0                	jne    80103488 <mpinit+0xa8>
  if(sum((uchar*)conf, conf->length) != 0)
80103498:	84 d2                	test   %dl,%dl
8010349a:	0f 85 c0 00 00 00    	jne    80103560 <mpinit+0x180>
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
801034a0:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
801034a6:	a3 84 16 11 80       	mov    %eax,0x80111684
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801034ab:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
801034b2:	8d 86 2c 00 00 80    	lea    -0x7fffffd4(%esi),%eax
  ismp = 1;
801034b8:	be 01 00 00 00       	mov    $0x1,%esi
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801034bd:	03 55 e4             	add    -0x1c(%ebp),%edx
801034c0:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801034c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034c7:	90                   	nop
801034c8:	39 d0                	cmp    %edx,%eax
801034ca:	73 15                	jae    801034e1 <mpinit+0x101>
    switch(*p){
801034cc:	0f b6 08             	movzbl (%eax),%ecx
801034cf:	80 f9 02             	cmp    $0x2,%cl
801034d2:	74 4c                	je     80103520 <mpinit+0x140>
801034d4:	77 3a                	ja     80103510 <mpinit+0x130>
801034d6:	84 c9                	test   %cl,%cl
801034d8:	74 56                	je     80103530 <mpinit+0x150>
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
801034da:	83 c0 08             	add    $0x8,%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801034dd:	39 d0                	cmp    %edx,%eax
801034df:	72 eb                	jb     801034cc <mpinit+0xec>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
801034e1:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801034e4:	85 f6                	test   %esi,%esi
801034e6:	0f 84 d9 00 00 00    	je     801035c5 <mpinit+0x1e5>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
801034ec:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
801034f0:	74 15                	je     80103507 <mpinit+0x127>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801034f2:	b8 70 00 00 00       	mov    $0x70,%eax
801034f7:	ba 22 00 00 00       	mov    $0x22,%edx
801034fc:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801034fd:	ba 23 00 00 00       	mov    $0x23,%edx
80103502:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80103503:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103506:	ee                   	out    %al,(%dx)
  }
}
80103507:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010350a:	5b                   	pop    %ebx
8010350b:	5e                   	pop    %esi
8010350c:	5f                   	pop    %edi
8010350d:	5d                   	pop    %ebp
8010350e:	c3                   	ret    
8010350f:	90                   	nop
    switch(*p){
80103510:	83 e9 03             	sub    $0x3,%ecx
80103513:	80 f9 01             	cmp    $0x1,%cl
80103516:	76 c2                	jbe    801034da <mpinit+0xfa>
80103518:	31 f6                	xor    %esi,%esi
8010351a:	eb ac                	jmp    801034c8 <mpinit+0xe8>
8010351c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      ioapicid = ioapic->apicno;
80103520:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
      p += sizeof(struct mpioapic);
80103524:	83 c0 08             	add    $0x8,%eax
      ioapicid = ioapic->apicno;
80103527:	88 0d 80 17 11 80    	mov    %cl,0x80111780
      continue;
8010352d:	eb 99                	jmp    801034c8 <mpinit+0xe8>
8010352f:	90                   	nop
      if(ncpu < NCPU) {
80103530:	8b 0d 84 17 11 80    	mov    0x80111784,%ecx
80103536:	83 f9 07             	cmp    $0x7,%ecx
80103539:	7f 19                	jg     80103554 <mpinit+0x174>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
8010353b:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
80103541:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
        ncpu++;
80103545:	83 c1 01             	add    $0x1,%ecx
80103548:	89 0d 84 17 11 80    	mov    %ecx,0x80111784
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
8010354e:	88 9f a0 17 11 80    	mov    %bl,-0x7feee860(%edi)
      p += sizeof(struct mpproc);
80103554:	83 c0 14             	add    $0x14,%eax
      continue;
80103557:	e9 6c ff ff ff       	jmp    801034c8 <mpinit+0xe8>
8010355c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    panic("Expect to run on an SMP");
80103560:	83 ec 0c             	sub    $0xc,%esp
80103563:	68 a2 79 10 80       	push   $0x801079a2
80103568:	e8 13 ce ff ff       	call   80100380 <panic>
8010356d:	8d 76 00             	lea    0x0(%esi),%esi
{
80103570:	bb 00 00 0f 80       	mov    $0x800f0000,%ebx
80103575:	eb 13                	jmp    8010358a <mpinit+0x1aa>
80103577:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010357e:	66 90                	xchg   %ax,%ax
  for(p = addr; p < e; p += sizeof(struct mp))
80103580:	89 f3                	mov    %esi,%ebx
80103582:	81 fe 00 00 10 80    	cmp    $0x80100000,%esi
80103588:	74 d6                	je     80103560 <mpinit+0x180>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
8010358a:	83 ec 04             	sub    $0x4,%esp
8010358d:	8d 73 10             	lea    0x10(%ebx),%esi
80103590:	6a 04                	push   $0x4
80103592:	68 98 79 10 80       	push   $0x80107998
80103597:	53                   	push   %ebx
80103598:	e8 e3 12 00 00       	call   80104880 <memcmp>
8010359d:	83 c4 10             	add    $0x10,%esp
801035a0:	85 c0                	test   %eax,%eax
801035a2:	75 dc                	jne    80103580 <mpinit+0x1a0>
801035a4:	89 da                	mov    %ebx,%edx
801035a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801035ad:	8d 76 00             	lea    0x0(%esi),%esi
    sum += addr[i];
801035b0:	0f b6 0a             	movzbl (%edx),%ecx
  for(i=0; i<len; i++)
801035b3:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
801035b6:	01 c8                	add    %ecx,%eax
  for(i=0; i<len; i++)
801035b8:	39 d6                	cmp    %edx,%esi
801035ba:	75 f4                	jne    801035b0 <mpinit+0x1d0>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801035bc:	84 c0                	test   %al,%al
801035be:	75 c0                	jne    80103580 <mpinit+0x1a0>
801035c0:	e9 6b fe ff ff       	jmp    80103430 <mpinit+0x50>
    panic("Didn't find a suitable machine");
801035c5:	83 ec 0c             	sub    $0xc,%esp
801035c8:	68 bc 79 10 80       	push   $0x801079bc
801035cd:	e8 ae cd ff ff       	call   80100380 <panic>
801035d2:	66 90                	xchg   %ax,%ax
801035d4:	66 90                	xchg   %ax,%ax
801035d6:	66 90                	xchg   %ax,%ax
801035d8:	66 90                	xchg   %ax,%ax
801035da:	66 90                	xchg   %ax,%ax
801035dc:	66 90                	xchg   %ax,%ax
801035de:	66 90                	xchg   %ax,%ax

801035e0 <picinit>:
801035e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801035e5:	ba 21 00 00 00       	mov    $0x21,%edx
801035ea:	ee                   	out    %al,(%dx)
801035eb:	ba a1 00 00 00       	mov    $0xa1,%edx
801035f0:	ee                   	out    %al,(%dx)
picinit(void)
{
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
801035f1:	c3                   	ret    
801035f2:	66 90                	xchg   %ax,%ax
801035f4:	66 90                	xchg   %ax,%ax
801035f6:	66 90                	xchg   %ax,%ax
801035f8:	66 90                	xchg   %ax,%ax
801035fa:	66 90                	xchg   %ax,%ax
801035fc:	66 90                	xchg   %ax,%ax
801035fe:	66 90                	xchg   %ax,%ax

80103600 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103600:	55                   	push   %ebp
80103601:	89 e5                	mov    %esp,%ebp
80103603:	57                   	push   %edi
80103604:	56                   	push   %esi
80103605:	53                   	push   %ebx
80103606:	83 ec 0c             	sub    $0xc,%esp
80103609:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010360c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010360f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103615:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010361b:	e8 10 d8 ff ff       	call   80100e30 <filealloc>
80103620:	89 03                	mov    %eax,(%ebx)
80103622:	85 c0                	test   %eax,%eax
80103624:	0f 84 a8 00 00 00    	je     801036d2 <pipealloc+0xd2>
8010362a:	e8 01 d8 ff ff       	call   80100e30 <filealloc>
8010362f:	89 06                	mov    %eax,(%esi)
80103631:	85 c0                	test   %eax,%eax
80103633:	0f 84 87 00 00 00    	je     801036c0 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103639:	e8 e2 ef ff ff       	call   80102620 <kalloc>
8010363e:	89 c7                	mov    %eax,%edi
80103640:	85 c0                	test   %eax,%eax
80103642:	0f 84 b0 00 00 00    	je     801036f8 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
80103648:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
8010364f:	00 00 00 
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
80103652:	83 ec 08             	sub    $0x8,%esp
  p->writeopen = 1;
80103655:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010365c:	00 00 00 
  p->nwrite = 0;
8010365f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103666:	00 00 00 
  p->nread = 0;
80103669:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103670:	00 00 00 
  initlock(&p->lock, "pipe");
80103673:	68 db 79 10 80       	push   $0x801079db
80103678:	50                   	push   %eax
80103679:	e8 22 0f 00 00       	call   801045a0 <initlock>
  (*f0)->type = FD_PIPE;
8010367e:	8b 03                	mov    (%ebx),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103680:	83 c4 10             	add    $0x10,%esp
  (*f0)->type = FD_PIPE;
80103683:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103689:	8b 03                	mov    (%ebx),%eax
8010368b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010368f:	8b 03                	mov    (%ebx),%eax
80103691:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103695:	8b 03                	mov    (%ebx),%eax
80103697:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010369a:	8b 06                	mov    (%esi),%eax
8010369c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
801036a2:	8b 06                	mov    (%esi),%eax
801036a4:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
801036a8:	8b 06                	mov    (%esi),%eax
801036aa:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
801036ae:	8b 06                	mov    (%esi),%eax
801036b0:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801036b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
801036b6:	31 c0                	xor    %eax,%eax
}
801036b8:	5b                   	pop    %ebx
801036b9:	5e                   	pop    %esi
801036ba:	5f                   	pop    %edi
801036bb:	5d                   	pop    %ebp
801036bc:	c3                   	ret    
801036bd:	8d 76 00             	lea    0x0(%esi),%esi
  if(*f0)
801036c0:	8b 03                	mov    (%ebx),%eax
801036c2:	85 c0                	test   %eax,%eax
801036c4:	74 1e                	je     801036e4 <pipealloc+0xe4>
    fileclose(*f0);
801036c6:	83 ec 0c             	sub    $0xc,%esp
801036c9:	50                   	push   %eax
801036ca:	e8 21 d8 ff ff       	call   80100ef0 <fileclose>
801036cf:	83 c4 10             	add    $0x10,%esp
  if(*f1)
801036d2:	8b 06                	mov    (%esi),%eax
801036d4:	85 c0                	test   %eax,%eax
801036d6:	74 0c                	je     801036e4 <pipealloc+0xe4>
    fileclose(*f1);
801036d8:	83 ec 0c             	sub    $0xc,%esp
801036db:	50                   	push   %eax
801036dc:	e8 0f d8 ff ff       	call   80100ef0 <fileclose>
801036e1:	83 c4 10             	add    $0x10,%esp
}
801036e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return -1;
801036e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801036ec:	5b                   	pop    %ebx
801036ed:	5e                   	pop    %esi
801036ee:	5f                   	pop    %edi
801036ef:	5d                   	pop    %ebp
801036f0:	c3                   	ret    
801036f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(*f0)
801036f8:	8b 03                	mov    (%ebx),%eax
801036fa:	85 c0                	test   %eax,%eax
801036fc:	75 c8                	jne    801036c6 <pipealloc+0xc6>
801036fe:	eb d2                	jmp    801036d2 <pipealloc+0xd2>

80103700 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103700:	55                   	push   %ebp
80103701:	89 e5                	mov    %esp,%ebp
80103703:	56                   	push   %esi
80103704:	53                   	push   %ebx
80103705:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103708:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010370b:	83 ec 0c             	sub    $0xc,%esp
8010370e:	53                   	push   %ebx
8010370f:	e8 5c 10 00 00       	call   80104770 <acquire>
  if(writable){
80103714:	83 c4 10             	add    $0x10,%esp
80103717:	85 f6                	test   %esi,%esi
80103719:	74 65                	je     80103780 <pipeclose+0x80>
    p->writeopen = 0;
    wakeup(&p->nread);
8010371b:	83 ec 0c             	sub    $0xc,%esp
8010371e:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
    p->writeopen = 0;
80103724:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010372b:	00 00 00 
    wakeup(&p->nread);
8010372e:	50                   	push   %eax
8010372f:	e8 9c 0b 00 00       	call   801042d0 <wakeup>
80103734:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103737:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010373d:	85 d2                	test   %edx,%edx
8010373f:	75 0a                	jne    8010374b <pipeclose+0x4b>
80103741:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103747:	85 c0                	test   %eax,%eax
80103749:	74 15                	je     80103760 <pipeclose+0x60>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010374b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010374e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103751:	5b                   	pop    %ebx
80103752:	5e                   	pop    %esi
80103753:	5d                   	pop    %ebp
    release(&p->lock);
80103754:	e9 b7 0f 00 00       	jmp    80104710 <release>
80103759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    release(&p->lock);
80103760:	83 ec 0c             	sub    $0xc,%esp
80103763:	53                   	push   %ebx
80103764:	e8 a7 0f 00 00       	call   80104710 <release>
    kfree((char*)p);
80103769:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010376c:	83 c4 10             	add    $0x10,%esp
}
8010376f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103772:	5b                   	pop    %ebx
80103773:	5e                   	pop    %esi
80103774:	5d                   	pop    %ebp
    kfree((char*)p);
80103775:	e9 46 ed ff ff       	jmp    801024c0 <kfree>
8010377a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    wakeup(&p->nwrite);
80103780:	83 ec 0c             	sub    $0xc,%esp
80103783:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
    p->readopen = 0;
80103789:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103790:	00 00 00 
    wakeup(&p->nwrite);
80103793:	50                   	push   %eax
80103794:	e8 37 0b 00 00       	call   801042d0 <wakeup>
80103799:	83 c4 10             	add    $0x10,%esp
8010379c:	eb 99                	jmp    80103737 <pipeclose+0x37>
8010379e:	66 90                	xchg   %ax,%ax

801037a0 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
801037a0:	55                   	push   %ebp
801037a1:	89 e5                	mov    %esp,%ebp
801037a3:	57                   	push   %edi
801037a4:	56                   	push   %esi
801037a5:	53                   	push   %ebx
801037a6:	83 ec 28             	sub    $0x28,%esp
801037a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
801037ac:	53                   	push   %ebx
801037ad:	e8 be 0f 00 00       	call   80104770 <acquire>
  for(i = 0; i < n; i++){
801037b2:	8b 45 10             	mov    0x10(%ebp),%eax
801037b5:	83 c4 10             	add    $0x10,%esp
801037b8:	85 c0                	test   %eax,%eax
801037ba:	0f 8e c0 00 00 00    	jle    80103880 <pipewrite+0xe0>
801037c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801037c3:	8b 8b 38 02 00 00    	mov    0x238(%ebx),%ecx
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801037c9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801037cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801037d2:	03 45 10             	add    0x10(%ebp),%eax
801037d5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801037d8:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801037de:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801037e4:	89 ca                	mov    %ecx,%edx
801037e6:	05 00 02 00 00       	add    $0x200,%eax
801037eb:	39 c1                	cmp    %eax,%ecx
801037ed:	74 3f                	je     8010382e <pipewrite+0x8e>
801037ef:	eb 67                	jmp    80103858 <pipewrite+0xb8>
801037f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->readopen == 0 || myproc()->killed){
801037f8:	e8 43 03 00 00       	call   80103b40 <myproc>
801037fd:	8b 48 28             	mov    0x28(%eax),%ecx
80103800:	85 c9                	test   %ecx,%ecx
80103802:	75 34                	jne    80103838 <pipewrite+0x98>
      wakeup(&p->nread);
80103804:	83 ec 0c             	sub    $0xc,%esp
80103807:	57                   	push   %edi
80103808:	e8 c3 0a 00 00       	call   801042d0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010380d:	58                   	pop    %eax
8010380e:	5a                   	pop    %edx
8010380f:	53                   	push   %ebx
80103810:	56                   	push   %esi
80103811:	e8 fa 09 00 00       	call   80104210 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103816:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010381c:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
80103822:	83 c4 10             	add    $0x10,%esp
80103825:	05 00 02 00 00       	add    $0x200,%eax
8010382a:	39 c2                	cmp    %eax,%edx
8010382c:	75 2a                	jne    80103858 <pipewrite+0xb8>
      if(p->readopen == 0 || myproc()->killed){
8010382e:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103834:	85 c0                	test   %eax,%eax
80103836:	75 c0                	jne    801037f8 <pipewrite+0x58>
        release(&p->lock);
80103838:	83 ec 0c             	sub    $0xc,%esp
8010383b:	53                   	push   %ebx
8010383c:	e8 cf 0e 00 00       	call   80104710 <release>
        return -1;
80103841:	83 c4 10             	add    $0x10,%esp
80103844:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103849:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010384c:	5b                   	pop    %ebx
8010384d:	5e                   	pop    %esi
8010384e:	5f                   	pop    %edi
8010384f:	5d                   	pop    %ebp
80103850:	c3                   	ret    
80103851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103858:	8b 75 e4             	mov    -0x1c(%ebp),%esi
8010385b:	8d 4a 01             	lea    0x1(%edx),%ecx
8010385e:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103864:	89 8b 38 02 00 00    	mov    %ecx,0x238(%ebx)
8010386a:	0f b6 06             	movzbl (%esi),%eax
  for(i = 0; i < n; i++){
8010386d:	83 c6 01             	add    $0x1,%esi
80103870:	89 75 e4             	mov    %esi,-0x1c(%ebp)
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103873:	88 44 13 34          	mov    %al,0x34(%ebx,%edx,1)
  for(i = 0; i < n; i++){
80103877:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010387a:	0f 85 58 ff ff ff    	jne    801037d8 <pipewrite+0x38>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103880:	83 ec 0c             	sub    $0xc,%esp
80103883:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103889:	50                   	push   %eax
8010388a:	e8 41 0a 00 00       	call   801042d0 <wakeup>
  release(&p->lock);
8010388f:	89 1c 24             	mov    %ebx,(%esp)
80103892:	e8 79 0e 00 00       	call   80104710 <release>
  return n;
80103897:	8b 45 10             	mov    0x10(%ebp),%eax
8010389a:	83 c4 10             	add    $0x10,%esp
8010389d:	eb aa                	jmp    80103849 <pipewrite+0xa9>
8010389f:	90                   	nop

801038a0 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	57                   	push   %edi
801038a4:	56                   	push   %esi
801038a5:	53                   	push   %ebx
801038a6:	83 ec 18             	sub    $0x18,%esp
801038a9:	8b 75 08             	mov    0x8(%ebp),%esi
801038ac:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
801038af:	56                   	push   %esi
801038b0:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801038b6:	e8 b5 0e 00 00       	call   80104770 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801038bb:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
801038c1:	83 c4 10             	add    $0x10,%esp
801038c4:	39 86 38 02 00 00    	cmp    %eax,0x238(%esi)
801038ca:	74 2f                	je     801038fb <piperead+0x5b>
801038cc:	eb 37                	jmp    80103905 <piperead+0x65>
801038ce:	66 90                	xchg   %ax,%ax
    if(myproc()->killed){
801038d0:	e8 6b 02 00 00       	call   80103b40 <myproc>
801038d5:	8b 48 28             	mov    0x28(%eax),%ecx
801038d8:	85 c9                	test   %ecx,%ecx
801038da:	0f 85 80 00 00 00    	jne    80103960 <piperead+0xc0>
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801038e0:	83 ec 08             	sub    $0x8,%esp
801038e3:	56                   	push   %esi
801038e4:	53                   	push   %ebx
801038e5:	e8 26 09 00 00       	call   80104210 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801038ea:	8b 86 38 02 00 00    	mov    0x238(%esi),%eax
801038f0:	83 c4 10             	add    $0x10,%esp
801038f3:	39 86 34 02 00 00    	cmp    %eax,0x234(%esi)
801038f9:	75 0a                	jne    80103905 <piperead+0x65>
801038fb:	8b 86 40 02 00 00    	mov    0x240(%esi),%eax
80103901:	85 c0                	test   %eax,%eax
80103903:	75 cb                	jne    801038d0 <piperead+0x30>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103905:	8b 55 10             	mov    0x10(%ebp),%edx
80103908:	31 db                	xor    %ebx,%ebx
8010390a:	85 d2                	test   %edx,%edx
8010390c:	7f 20                	jg     8010392e <piperead+0x8e>
8010390e:	eb 2c                	jmp    8010393c <piperead+0x9c>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103910:	8d 48 01             	lea    0x1(%eax),%ecx
80103913:	25 ff 01 00 00       	and    $0x1ff,%eax
80103918:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
8010391e:	0f b6 44 06 34       	movzbl 0x34(%esi,%eax,1),%eax
80103923:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103926:	83 c3 01             	add    $0x1,%ebx
80103929:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010392c:	74 0e                	je     8010393c <piperead+0x9c>
    if(p->nread == p->nwrite)
8010392e:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103934:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010393a:	75 d4                	jne    80103910 <piperead+0x70>
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010393c:	83 ec 0c             	sub    $0xc,%esp
8010393f:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103945:	50                   	push   %eax
80103946:	e8 85 09 00 00       	call   801042d0 <wakeup>
  release(&p->lock);
8010394b:	89 34 24             	mov    %esi,(%esp)
8010394e:	e8 bd 0d 00 00       	call   80104710 <release>
  return i;
80103953:	83 c4 10             	add    $0x10,%esp
}
80103956:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103959:	89 d8                	mov    %ebx,%eax
8010395b:	5b                   	pop    %ebx
8010395c:	5e                   	pop    %esi
8010395d:	5f                   	pop    %edi
8010395e:	5d                   	pop    %ebp
8010395f:	c3                   	ret    
      release(&p->lock);
80103960:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103963:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
80103968:	56                   	push   %esi
80103969:	e8 a2 0d 00 00       	call   80104710 <release>
      return -1;
8010396e:	83 c4 10             	add    $0x10,%esp
}
80103971:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103974:	89 d8                	mov    %ebx,%eax
80103976:	5b                   	pop    %ebx
80103977:	5e                   	pop    %esi
80103978:	5f                   	pop    %edi
80103979:	5d                   	pop    %ebp
8010397a:	c3                   	ret    
8010397b:	66 90                	xchg   %ax,%ax
8010397d:	66 90                	xchg   %ax,%ax
8010397f:	90                   	nop

80103980 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103980:	55                   	push   %ebp
80103981:	89 e5                	mov    %esp,%ebp
80103983:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103984:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
{
80103989:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
8010398c:	68 20 1d 11 80       	push   $0x80111d20
80103991:	e8 da 0d 00 00       	call   80104770 <acquire>
80103996:	83 c4 10             	add    $0x10,%esp
80103999:	eb 10                	jmp    801039ab <allocproc+0x2b>
8010399b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010399f:	90                   	nop
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801039a0:	83 eb 80             	sub    $0xffffff80,%ebx
801039a3:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
801039a9:	74 75                	je     80103a20 <allocproc+0xa0>
    if(p->state == UNUSED)
801039ab:	8b 43 10             	mov    0x10(%ebx),%eax
801039ae:	85 c0                	test   %eax,%eax
801039b0:	75 ee                	jne    801039a0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801039b2:	a1 04 a0 10 80       	mov    0x8010a004,%eax

  release(&ptable.lock);
801039b7:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
801039ba:	c7 43 10 01 00 00 00 	movl   $0x1,0x10(%ebx)
  p->pid = nextpid++;
801039c1:	89 43 14             	mov    %eax,0x14(%ebx)
801039c4:	8d 50 01             	lea    0x1(%eax),%edx
  release(&ptable.lock);
801039c7:	68 20 1d 11 80       	push   $0x80111d20
  p->pid = nextpid++;
801039cc:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  release(&ptable.lock);
801039d2:	e8 39 0d 00 00       	call   80104710 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801039d7:	e8 44 ec ff ff       	call   80102620 <kalloc>
801039dc:	83 c4 10             	add    $0x10,%esp
801039df:	89 43 0c             	mov    %eax,0xc(%ebx)
801039e2:	85 c0                	test   %eax,%eax
801039e4:	74 53                	je     80103a39 <allocproc+0xb9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801039e6:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
801039ec:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
801039ef:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
801039f4:	89 53 1c             	mov    %edx,0x1c(%ebx)
  *(uint*)sp = (uint)trapret;
801039f7:	c7 40 14 50 5b 10 80 	movl   $0x80105b50,0x14(%eax)
  p->context = (struct context*)sp;
801039fe:	89 43 20             	mov    %eax,0x20(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103a01:	6a 14                	push   $0x14
80103a03:	6a 00                	push   $0x0
80103a05:	50                   	push   %eax
80103a06:	e8 25 0e 00 00       	call   80104830 <memset>
  p->context->eip = (uint)forkret;
80103a0b:	8b 43 20             	mov    0x20(%ebx),%eax

  return p;
80103a0e:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
80103a11:	c7 40 10 50 3a 10 80 	movl   $0x80103a50,0x10(%eax)
}
80103a18:	89 d8                	mov    %ebx,%eax
80103a1a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a1d:	c9                   	leave  
80103a1e:	c3                   	ret    
80103a1f:	90                   	nop
  release(&ptable.lock);
80103a20:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80103a23:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
80103a25:	68 20 1d 11 80       	push   $0x80111d20
80103a2a:	e8 e1 0c 00 00       	call   80104710 <release>
}
80103a2f:	89 d8                	mov    %ebx,%eax
  return 0;
80103a31:	83 c4 10             	add    $0x10,%esp
}
80103a34:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a37:	c9                   	leave  
80103a38:	c3                   	ret    
    p->state = UNUSED;
80103a39:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    return 0;
80103a40:	31 db                	xor    %ebx,%ebx
}
80103a42:	89 d8                	mov    %ebx,%eax
80103a44:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a47:	c9                   	leave  
80103a48:	c3                   	ret    
80103a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103a50 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103a50:	55                   	push   %ebp
80103a51:	89 e5                	mov    %esp,%ebp
80103a53:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103a56:	68 20 1d 11 80       	push   $0x80111d20
80103a5b:	e8 b0 0c 00 00       	call   80104710 <release>

  if (first) {
80103a60:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103a65:	83 c4 10             	add    $0x10,%esp
80103a68:	85 c0                	test   %eax,%eax
80103a6a:	75 04                	jne    80103a70 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103a6c:	c9                   	leave  
80103a6d:	c3                   	ret    
80103a6e:	66 90                	xchg   %ax,%ax
    first = 0;
80103a70:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
80103a77:	00 00 00 
    iinit(ROOTDEV);
80103a7a:	83 ec 0c             	sub    $0xc,%esp
80103a7d:	6a 01                	push   $0x1
80103a7f:	e8 dc da ff ff       	call   80101560 <iinit>
    initlog(ROOTDEV);
80103a84:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80103a8b:	e8 00 f4 ff ff       	call   80102e90 <initlog>
}
80103a90:	83 c4 10             	add    $0x10,%esp
80103a93:	c9                   	leave  
80103a94:	c3                   	ret    
80103a95:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103aa0 <pinit>:
{
80103aa0:	55                   	push   %ebp
80103aa1:	89 e5                	mov    %esp,%ebp
80103aa3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103aa6:	68 e0 79 10 80       	push   $0x801079e0
80103aab:	68 20 1d 11 80       	push   $0x80111d20
80103ab0:	e8 eb 0a 00 00       	call   801045a0 <initlock>
}
80103ab5:	83 c4 10             	add    $0x10,%esp
80103ab8:	c9                   	leave  
80103ab9:	c3                   	ret    
80103aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103ac0 <mycpu>:
{
80103ac0:	55                   	push   %ebp
80103ac1:	89 e5                	mov    %esp,%ebp
80103ac3:	56                   	push   %esi
80103ac4:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103ac5:	9c                   	pushf  
80103ac6:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103ac7:	f6 c4 02             	test   $0x2,%ah
80103aca:	75 46                	jne    80103b12 <mycpu+0x52>
  apicid = lapicid();
80103acc:	e8 ef ef ff ff       	call   80102ac0 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103ad1:	8b 35 84 17 11 80    	mov    0x80111784,%esi
80103ad7:	85 f6                	test   %esi,%esi
80103ad9:	7e 2a                	jle    80103b05 <mycpu+0x45>
80103adb:	31 d2                	xor    %edx,%edx
80103add:	eb 08                	jmp    80103ae7 <mycpu+0x27>
80103adf:	90                   	nop
80103ae0:	83 c2 01             	add    $0x1,%edx
80103ae3:	39 f2                	cmp    %esi,%edx
80103ae5:	74 1e                	je     80103b05 <mycpu+0x45>
    if (cpus[i].apicid == apicid)
80103ae7:	69 ca b0 00 00 00    	imul   $0xb0,%edx,%ecx
80103aed:	0f b6 99 a0 17 11 80 	movzbl -0x7feee860(%ecx),%ebx
80103af4:	39 c3                	cmp    %eax,%ebx
80103af6:	75 e8                	jne    80103ae0 <mycpu+0x20>
}
80103af8:	8d 65 f8             	lea    -0x8(%ebp),%esp
      return &cpus[i];
80103afb:	8d 81 a0 17 11 80    	lea    -0x7feee860(%ecx),%eax
}
80103b01:	5b                   	pop    %ebx
80103b02:	5e                   	pop    %esi
80103b03:	5d                   	pop    %ebp
80103b04:	c3                   	ret    
  panic("unknown apicid\n");
80103b05:	83 ec 0c             	sub    $0xc,%esp
80103b08:	68 e7 79 10 80       	push   $0x801079e7
80103b0d:	e8 6e c8 ff ff       	call   80100380 <panic>
    panic("mycpu called with interrupts enabled\n");
80103b12:	83 ec 0c             	sub    $0xc,%esp
80103b15:	68 c4 7a 10 80       	push   $0x80107ac4
80103b1a:	e8 61 c8 ff ff       	call   80100380 <panic>
80103b1f:	90                   	nop

80103b20 <cpuid>:
cpuid() {
80103b20:	55                   	push   %ebp
80103b21:	89 e5                	mov    %esp,%ebp
80103b23:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103b26:	e8 95 ff ff ff       	call   80103ac0 <mycpu>
}
80103b2b:	c9                   	leave  
  return mycpu()-cpus;
80103b2c:	2d a0 17 11 80       	sub    $0x801117a0,%eax
80103b31:	c1 f8 04             	sar    $0x4,%eax
80103b34:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
80103b3a:	c3                   	ret    
80103b3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103b3f:	90                   	nop

80103b40 <myproc>:
myproc(void) {
80103b40:	55                   	push   %ebp
80103b41:	89 e5                	mov    %esp,%ebp
80103b43:	53                   	push   %ebx
80103b44:	83 ec 04             	sub    $0x4,%esp
  pushcli();
80103b47:	e8 d4 0a 00 00       	call   80104620 <pushcli>
  c = mycpu();
80103b4c:	e8 6f ff ff ff       	call   80103ac0 <mycpu>
  p = c->proc;
80103b51:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b57:	e8 14 0b 00 00       	call   80104670 <popcli>
}
80103b5c:	89 d8                	mov    %ebx,%eax
80103b5e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103b61:	c9                   	leave  
80103b62:	c3                   	ret    
80103b63:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103b70 <userinit>:
{
80103b70:	55                   	push   %ebp
80103b71:	89 e5                	mov    %esp,%ebp
80103b73:	53                   	push   %ebx
80103b74:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
80103b77:	e8 04 fe ff ff       	call   80103980 <allocproc>
80103b7c:	89 c3                	mov    %eax,%ebx
  initproc = p;
80103b7e:	a3 54 3d 11 80       	mov    %eax,0x80113d54
  if((p->pgdir = setupkvm()) == 0)
80103b83:	e8 b8 35 00 00       	call   80107140 <setupkvm>
80103b88:	89 43 08             	mov    %eax,0x8(%ebx)
80103b8b:	85 c0                	test   %eax,%eax
80103b8d:	0f 84 bd 00 00 00    	je     80103c50 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103b93:	83 ec 04             	sub    $0x4,%esp
80103b96:	68 2c 00 00 00       	push   $0x2c
80103b9b:	68 60 a4 10 80       	push   $0x8010a460
80103ba0:	50                   	push   %eax
80103ba1:	e8 4a 32 00 00       	call   80106df0 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103ba6:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103ba9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
80103baf:	6a 4c                	push   $0x4c
80103bb1:	6a 00                	push   $0x0
80103bb3:	ff 73 1c             	push   0x1c(%ebx)
80103bb6:	e8 75 0c 00 00       	call   80104830 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103bbb:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103bbe:	ba 1b 00 00 00       	mov    $0x1b,%edx
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103bc3:	83 c4 0c             	add    $0xc,%esp
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103bc6:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103bcb:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103bcf:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103bd2:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103bd6:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103bd9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103bdd:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103be1:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103be4:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103be8:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
80103bec:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103bef:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103bf6:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103bf9:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103c00:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103c03:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103c0a:	8d 43 70             	lea    0x70(%ebx),%eax
80103c0d:	6a 10                	push   $0x10
80103c0f:	68 10 7a 10 80       	push   $0x80107a10
80103c14:	50                   	push   %eax
80103c15:	e8 d6 0d 00 00       	call   801049f0 <safestrcpy>
  p->cwd = namei("/");
80103c1a:	c7 04 24 19 7a 10 80 	movl   $0x80107a19,(%esp)
80103c21:	e8 7a e4 ff ff       	call   801020a0 <namei>
80103c26:	89 43 6c             	mov    %eax,0x6c(%ebx)
  acquire(&ptable.lock);
80103c29:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103c30:	e8 3b 0b 00 00       	call   80104770 <acquire>
  p->state = RUNNABLE;
80103c35:	c7 43 10 03 00 00 00 	movl   $0x3,0x10(%ebx)
  release(&ptable.lock);
80103c3c:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103c43:	e8 c8 0a 00 00       	call   80104710 <release>
}
80103c48:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103c4b:	83 c4 10             	add    $0x10,%esp
80103c4e:	c9                   	leave  
80103c4f:	c3                   	ret    
    panic("userinit: out of memory?");
80103c50:	83 ec 0c             	sub    $0xc,%esp
80103c53:	68 f7 79 10 80       	push   $0x801079f7
80103c58:	e8 23 c7 ff ff       	call   80100380 <panic>
80103c5d:	8d 76 00             	lea    0x0(%esi),%esi

80103c60 <growproc>:
{
80103c60:	55                   	push   %ebp
80103c61:	89 e5                	mov    %esp,%ebp
80103c63:	56                   	push   %esi
80103c64:	53                   	push   %ebx
80103c65:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
80103c68:	e8 b3 09 00 00       	call   80104620 <pushcli>
  c = mycpu();
80103c6d:	e8 4e fe ff ff       	call   80103ac0 <mycpu>
  p = c->proc;
80103c72:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103c78:	e8 f3 09 00 00       	call   80104670 <popcli>
  sz = curproc->sz;
80103c7d:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
80103c7f:	85 f6                	test   %esi,%esi
80103c81:	7f 1d                	jg     80103ca0 <growproc+0x40>
  } else if(n < 0){
80103c83:	75 3b                	jne    80103cc0 <growproc+0x60>
  switchuvm(curproc);
80103c85:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
80103c88:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
80103c8a:	53                   	push   %ebx
80103c8b:	e8 50 30 00 00       	call   80106ce0 <switchuvm>
  return 0;
80103c90:	83 c4 10             	add    $0x10,%esp
80103c93:	31 c0                	xor    %eax,%eax
}
80103c95:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103c98:	5b                   	pop    %ebx
80103c99:	5e                   	pop    %esi
80103c9a:	5d                   	pop    %ebp
80103c9b:	c3                   	ret    
80103c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103ca0:	83 ec 04             	sub    $0x4,%esp
80103ca3:	01 c6                	add    %eax,%esi
80103ca5:	56                   	push   %esi
80103ca6:	50                   	push   %eax
80103ca7:	ff 73 08             	push   0x8(%ebx)
80103caa:	e8 b1 32 00 00       	call   80106f60 <allocuvm>
80103caf:	83 c4 10             	add    $0x10,%esp
80103cb2:	85 c0                	test   %eax,%eax
80103cb4:	75 cf                	jne    80103c85 <growproc+0x25>
      return -1;
80103cb6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103cbb:	eb d8                	jmp    80103c95 <growproc+0x35>
80103cbd:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103cc0:	83 ec 04             	sub    $0x4,%esp
80103cc3:	01 c6                	add    %eax,%esi
80103cc5:	56                   	push   %esi
80103cc6:	50                   	push   %eax
80103cc7:	ff 73 08             	push   0x8(%ebx)
80103cca:	e8 c1 33 00 00       	call   80107090 <deallocuvm>
80103ccf:	83 c4 10             	add    $0x10,%esp
80103cd2:	85 c0                	test   %eax,%eax
80103cd4:	75 af                	jne    80103c85 <growproc+0x25>
80103cd6:	eb de                	jmp    80103cb6 <growproc+0x56>
80103cd8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103cdf:	90                   	nop

80103ce0 <fork>:
{
80103ce0:	55                   	push   %ebp
80103ce1:	89 e5                	mov    %esp,%ebp
80103ce3:	57                   	push   %edi
80103ce4:	56                   	push   %esi
80103ce5:	53                   	push   %ebx
80103ce6:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103ce9:	e8 32 09 00 00       	call   80104620 <pushcli>
  c = mycpu();
80103cee:	e8 cd fd ff ff       	call   80103ac0 <mycpu>
  p = c->proc;
80103cf3:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103cf9:	e8 72 09 00 00       	call   80104670 <popcli>
  if((np = allocproc()) == 0){
80103cfe:	e8 7d fc ff ff       	call   80103980 <allocproc>
80103d03:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103d06:	85 c0                	test   %eax,%eax
80103d08:	0f 84 b7 00 00 00    	je     80103dc5 <fork+0xe5>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103d0e:	83 ec 08             	sub    $0x8,%esp
80103d11:	ff 33                	push   (%ebx)
80103d13:	89 c7                	mov    %eax,%edi
80103d15:	ff 73 08             	push   0x8(%ebx)
80103d18:	e8 13 35 00 00       	call   80107230 <copyuvm>
80103d1d:	83 c4 10             	add    $0x10,%esp
80103d20:	89 47 08             	mov    %eax,0x8(%edi)
80103d23:	85 c0                	test   %eax,%eax
80103d25:	0f 84 a1 00 00 00    	je     80103dcc <fork+0xec>
  np->sz = curproc->sz;
80103d2b:	8b 03                	mov    (%ebx),%eax
80103d2d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103d30:	89 01                	mov    %eax,(%ecx)
  *np->tf = *curproc->tf;
80103d32:	8b 79 1c             	mov    0x1c(%ecx),%edi
  np->parent = curproc;
80103d35:	89 c8                	mov    %ecx,%eax
80103d37:	89 59 18             	mov    %ebx,0x18(%ecx)
  *np->tf = *curproc->tf;
80103d3a:	b9 13 00 00 00       	mov    $0x13,%ecx
80103d3f:	8b 73 1c             	mov    0x1c(%ebx),%esi
80103d42:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
80103d44:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103d46:	8b 40 1c             	mov    0x1c(%eax),%eax
80103d49:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
    if(curproc->ofile[i])
80103d50:	8b 44 b3 2c          	mov    0x2c(%ebx,%esi,4),%eax
80103d54:	85 c0                	test   %eax,%eax
80103d56:	74 13                	je     80103d6b <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103d58:	83 ec 0c             	sub    $0xc,%esp
80103d5b:	50                   	push   %eax
80103d5c:	e8 3f d1 ff ff       	call   80100ea0 <filedup>
80103d61:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103d64:	83 c4 10             	add    $0x10,%esp
80103d67:	89 44 b2 2c          	mov    %eax,0x2c(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103d6b:	83 c6 01             	add    $0x1,%esi
80103d6e:	83 fe 10             	cmp    $0x10,%esi
80103d71:	75 dd                	jne    80103d50 <fork+0x70>
  np->cwd = idup(curproc->cwd);
80103d73:	83 ec 0c             	sub    $0xc,%esp
80103d76:	ff 73 6c             	push   0x6c(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103d79:	83 c3 70             	add    $0x70,%ebx
  np->cwd = idup(curproc->cwd);
80103d7c:	e8 cf d9 ff ff       	call   80101750 <idup>
80103d81:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103d84:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103d87:	89 47 6c             	mov    %eax,0x6c(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103d8a:	8d 47 70             	lea    0x70(%edi),%eax
80103d8d:	6a 10                	push   $0x10
80103d8f:	53                   	push   %ebx
80103d90:	50                   	push   %eax
80103d91:	e8 5a 0c 00 00       	call   801049f0 <safestrcpy>
  pid = np->pid;
80103d96:	8b 5f 14             	mov    0x14(%edi),%ebx
  acquire(&ptable.lock);
80103d99:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103da0:	e8 cb 09 00 00       	call   80104770 <acquire>
  np->state = RUNNABLE;
80103da5:	c7 47 10 03 00 00 00 	movl   $0x3,0x10(%edi)
  release(&ptable.lock);
80103dac:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103db3:	e8 58 09 00 00       	call   80104710 <release>
  return pid;
80103db8:	83 c4 10             	add    $0x10,%esp
}
80103dbb:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103dbe:	89 d8                	mov    %ebx,%eax
80103dc0:	5b                   	pop    %ebx
80103dc1:	5e                   	pop    %esi
80103dc2:	5f                   	pop    %edi
80103dc3:	5d                   	pop    %ebp
80103dc4:	c3                   	ret    
    return -1;
80103dc5:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103dca:	eb ef                	jmp    80103dbb <fork+0xdb>
    kfree(np->kstack);
80103dcc:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103dcf:	83 ec 0c             	sub    $0xc,%esp
80103dd2:	ff 73 0c             	push   0xc(%ebx)
80103dd5:	e8 e6 e6 ff ff       	call   801024c0 <kfree>
    np->kstack = 0;
80103dda:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103de1:	83 c4 10             	add    $0x10,%esp
    np->state = UNUSED;
80103de4:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    return -1;
80103deb:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103df0:	eb c9                	jmp    80103dbb <fork+0xdb>
80103df2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103e00 <scheduler>:
{
80103e00:	55                   	push   %ebp
80103e01:	89 e5                	mov    %esp,%ebp
80103e03:	57                   	push   %edi
80103e04:	56                   	push   %esi
80103e05:	53                   	push   %ebx
80103e06:	83 ec 0c             	sub    $0xc,%esp
  struct cpu *c = mycpu();
80103e09:	e8 b2 fc ff ff       	call   80103ac0 <mycpu>
  c->proc = 0;
80103e0e:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103e15:	00 00 00 
  struct cpu *c = mycpu();
80103e18:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103e1a:	8d 78 04             	lea    0x4(%eax),%edi
80103e1d:	8d 76 00             	lea    0x0(%esi),%esi
  asm volatile("sti");
80103e20:	fb                   	sti    
    acquire(&ptable.lock);
80103e21:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e24:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
    acquire(&ptable.lock);
80103e29:	68 20 1d 11 80       	push   $0x80111d20
80103e2e:	e8 3d 09 00 00       	call   80104770 <acquire>
80103e33:	83 c4 10             	add    $0x10,%esp
80103e36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103e3d:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->state != RUNNABLE)
80103e40:	83 7b 10 03          	cmpl   $0x3,0x10(%ebx)
80103e44:	75 33                	jne    80103e79 <scheduler+0x79>
      switchuvm(p);
80103e46:	83 ec 0c             	sub    $0xc,%esp
      c->proc = p;
80103e49:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103e4f:	53                   	push   %ebx
80103e50:	e8 8b 2e 00 00       	call   80106ce0 <switchuvm>
      swtch(&(c->scheduler), p->context);
80103e55:	58                   	pop    %eax
80103e56:	5a                   	pop    %edx
80103e57:	ff 73 20             	push   0x20(%ebx)
80103e5a:	57                   	push   %edi
      p->state = RUNNING;
80103e5b:	c7 43 10 04 00 00 00 	movl   $0x4,0x10(%ebx)
      swtch(&(c->scheduler), p->context);
80103e62:	e8 e4 0b 00 00       	call   80104a4b <swtch>
      switchkvm();
80103e67:	e8 64 2e 00 00       	call   80106cd0 <switchkvm>
      c->proc = 0;
80103e6c:	83 c4 10             	add    $0x10,%esp
80103e6f:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103e76:	00 00 00 
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e79:	83 eb 80             	sub    $0xffffff80,%ebx
80103e7c:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80103e82:	75 bc                	jne    80103e40 <scheduler+0x40>
    release(&ptable.lock);
80103e84:	83 ec 0c             	sub    $0xc,%esp
80103e87:	68 20 1d 11 80       	push   $0x80111d20
80103e8c:	e8 7f 08 00 00       	call   80104710 <release>
    sti();
80103e91:	83 c4 10             	add    $0x10,%esp
80103e94:	eb 8a                	jmp    80103e20 <scheduler+0x20>
80103e96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103e9d:	8d 76 00             	lea    0x0(%esi),%esi

80103ea0 <sched>:
{
80103ea0:	55                   	push   %ebp
80103ea1:	89 e5                	mov    %esp,%ebp
80103ea3:	56                   	push   %esi
80103ea4:	53                   	push   %ebx
  pushcli();
80103ea5:	e8 76 07 00 00       	call   80104620 <pushcli>
  c = mycpu();
80103eaa:	e8 11 fc ff ff       	call   80103ac0 <mycpu>
  p = c->proc;
80103eaf:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103eb5:	e8 b6 07 00 00       	call   80104670 <popcli>
  if(!holding(&ptable.lock))
80103eba:	83 ec 0c             	sub    $0xc,%esp
80103ebd:	68 20 1d 11 80       	push   $0x80111d20
80103ec2:	e8 09 08 00 00       	call   801046d0 <holding>
80103ec7:	83 c4 10             	add    $0x10,%esp
80103eca:	85 c0                	test   %eax,%eax
80103ecc:	74 4f                	je     80103f1d <sched+0x7d>
  if(mycpu()->ncli != 1)
80103ece:	e8 ed fb ff ff       	call   80103ac0 <mycpu>
80103ed3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103eda:	75 68                	jne    80103f44 <sched+0xa4>
  if(p->state == RUNNING)
80103edc:	83 7b 10 04          	cmpl   $0x4,0x10(%ebx)
80103ee0:	74 55                	je     80103f37 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103ee2:	9c                   	pushf  
80103ee3:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103ee4:	f6 c4 02             	test   $0x2,%ah
80103ee7:	75 41                	jne    80103f2a <sched+0x8a>
  intena = mycpu()->intena;
80103ee9:	e8 d2 fb ff ff       	call   80103ac0 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103eee:	83 c3 20             	add    $0x20,%ebx
  intena = mycpu()->intena;
80103ef1:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103ef7:	e8 c4 fb ff ff       	call   80103ac0 <mycpu>
80103efc:	83 ec 08             	sub    $0x8,%esp
80103eff:	ff 70 04             	push   0x4(%eax)
80103f02:	53                   	push   %ebx
80103f03:	e8 43 0b 00 00       	call   80104a4b <swtch>
  mycpu()->intena = intena;
80103f08:	e8 b3 fb ff ff       	call   80103ac0 <mycpu>
}
80103f0d:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103f10:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103f16:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f19:	5b                   	pop    %ebx
80103f1a:	5e                   	pop    %esi
80103f1b:	5d                   	pop    %ebp
80103f1c:	c3                   	ret    
    panic("sched ptable.lock");
80103f1d:	83 ec 0c             	sub    $0xc,%esp
80103f20:	68 1b 7a 10 80       	push   $0x80107a1b
80103f25:	e8 56 c4 ff ff       	call   80100380 <panic>
    panic("sched interruptible");
80103f2a:	83 ec 0c             	sub    $0xc,%esp
80103f2d:	68 47 7a 10 80       	push   $0x80107a47
80103f32:	e8 49 c4 ff ff       	call   80100380 <panic>
    panic("sched running");
80103f37:	83 ec 0c             	sub    $0xc,%esp
80103f3a:	68 39 7a 10 80       	push   $0x80107a39
80103f3f:	e8 3c c4 ff ff       	call   80100380 <panic>
    panic("sched locks");
80103f44:	83 ec 0c             	sub    $0xc,%esp
80103f47:	68 2d 7a 10 80       	push   $0x80107a2d
80103f4c:	e8 2f c4 ff ff       	call   80100380 <panic>
80103f51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103f58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103f5f:	90                   	nop

80103f60 <exit>:
{
80103f60:	55                   	push   %ebp
80103f61:	89 e5                	mov    %esp,%ebp
80103f63:	57                   	push   %edi
80103f64:	56                   	push   %esi
80103f65:	53                   	push   %ebx
80103f66:	83 ec 0c             	sub    $0xc,%esp
  struct proc *curproc = myproc();
80103f69:	e8 d2 fb ff ff       	call   80103b40 <myproc>
  if(curproc == initproc)
80103f6e:	39 05 54 3d 11 80    	cmp    %eax,0x80113d54
80103f74:	0f 84 fd 00 00 00    	je     80104077 <exit+0x117>
80103f7a:	89 c3                	mov    %eax,%ebx
80103f7c:	8d 70 2c             	lea    0x2c(%eax),%esi
80103f7f:	8d 78 6c             	lea    0x6c(%eax),%edi
80103f82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(curproc->ofile[fd]){
80103f88:	8b 06                	mov    (%esi),%eax
80103f8a:	85 c0                	test   %eax,%eax
80103f8c:	74 12                	je     80103fa0 <exit+0x40>
      fileclose(curproc->ofile[fd]);
80103f8e:	83 ec 0c             	sub    $0xc,%esp
80103f91:	50                   	push   %eax
80103f92:	e8 59 cf ff ff       	call   80100ef0 <fileclose>
      curproc->ofile[fd] = 0;
80103f97:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103f9d:	83 c4 10             	add    $0x10,%esp
  for(fd = 0; fd < NOFILE; fd++){
80103fa0:	83 c6 04             	add    $0x4,%esi
80103fa3:	39 f7                	cmp    %esi,%edi
80103fa5:	75 e1                	jne    80103f88 <exit+0x28>
  begin_op();
80103fa7:	e8 84 ef ff ff       	call   80102f30 <begin_op>
  iput(curproc->cwd);
80103fac:	83 ec 0c             	sub    $0xc,%esp
80103faf:	ff 73 6c             	push   0x6c(%ebx)
80103fb2:	e8 f9 d8 ff ff       	call   801018b0 <iput>
  end_op();
80103fb7:	e8 e4 ef ff ff       	call   80102fa0 <end_op>
  curproc->cwd = 0;
80103fbc:	c7 43 6c 00 00 00 00 	movl   $0x0,0x6c(%ebx)
  acquire(&ptable.lock);
80103fc3:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103fca:	e8 a1 07 00 00       	call   80104770 <acquire>
  wakeup1(curproc->parent);
80103fcf:	8b 53 18             	mov    0x18(%ebx),%edx
80103fd2:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103fd5:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103fda:	eb 0e                	jmp    80103fea <exit+0x8a>
80103fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fe0:	83 e8 80             	sub    $0xffffff80,%eax
80103fe3:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103fe8:	74 1c                	je     80104006 <exit+0xa6>
    if(p->state == SLEEPING && p->chan == chan)
80103fea:	83 78 10 02          	cmpl   $0x2,0x10(%eax)
80103fee:	75 f0                	jne    80103fe0 <exit+0x80>
80103ff0:	3b 50 24             	cmp    0x24(%eax),%edx
80103ff3:	75 eb                	jne    80103fe0 <exit+0x80>
      p->state = RUNNABLE;
80103ff5:	c7 40 10 03 00 00 00 	movl   $0x3,0x10(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ffc:	83 e8 80             	sub    $0xffffff80,%eax
80103fff:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80104004:	75 e4                	jne    80103fea <exit+0x8a>
      p->parent = initproc;
80104006:	8b 0d 54 3d 11 80    	mov    0x80113d54,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010400c:	ba 54 1d 11 80       	mov    $0x80111d54,%edx
80104011:	eb 10                	jmp    80104023 <exit+0xc3>
80104013:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104017:	90                   	nop
80104018:	83 ea 80             	sub    $0xffffff80,%edx
8010401b:	81 fa 54 3d 11 80    	cmp    $0x80113d54,%edx
80104021:	74 3b                	je     8010405e <exit+0xfe>
    if(p->parent == curproc){
80104023:	39 5a 18             	cmp    %ebx,0x18(%edx)
80104026:	75 f0                	jne    80104018 <exit+0xb8>
      if(p->state == ZOMBIE)
80104028:	83 7a 10 05          	cmpl   $0x5,0x10(%edx)
      p->parent = initproc;
8010402c:	89 4a 18             	mov    %ecx,0x18(%edx)
      if(p->state == ZOMBIE)
8010402f:	75 e7                	jne    80104018 <exit+0xb8>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104031:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80104036:	eb 12                	jmp    8010404a <exit+0xea>
80104038:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010403f:	90                   	nop
80104040:	83 e8 80             	sub    $0xffffff80,%eax
80104043:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80104048:	74 ce                	je     80104018 <exit+0xb8>
    if(p->state == SLEEPING && p->chan == chan)
8010404a:	83 78 10 02          	cmpl   $0x2,0x10(%eax)
8010404e:	75 f0                	jne    80104040 <exit+0xe0>
80104050:	3b 48 24             	cmp    0x24(%eax),%ecx
80104053:	75 eb                	jne    80104040 <exit+0xe0>
      p->state = RUNNABLE;
80104055:	c7 40 10 03 00 00 00 	movl   $0x3,0x10(%eax)
8010405c:	eb e2                	jmp    80104040 <exit+0xe0>
  curproc->state = ZOMBIE;
8010405e:	c7 43 10 05 00 00 00 	movl   $0x5,0x10(%ebx)
  sched();
80104065:	e8 36 fe ff ff       	call   80103ea0 <sched>
  panic("zombie exit");
8010406a:	83 ec 0c             	sub    $0xc,%esp
8010406d:	68 68 7a 10 80       	push   $0x80107a68
80104072:	e8 09 c3 ff ff       	call   80100380 <panic>
    panic("init exiting");
80104077:	83 ec 0c             	sub    $0xc,%esp
8010407a:	68 5b 7a 10 80       	push   $0x80107a5b
8010407f:	e8 fc c2 ff ff       	call   80100380 <panic>
80104084:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010408b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010408f:	90                   	nop

80104090 <wait>:
{
80104090:	55                   	push   %ebp
80104091:	89 e5                	mov    %esp,%ebp
80104093:	56                   	push   %esi
80104094:	53                   	push   %ebx
  pushcli();
80104095:	e8 86 05 00 00       	call   80104620 <pushcli>
  c = mycpu();
8010409a:	e8 21 fa ff ff       	call   80103ac0 <mycpu>
  p = c->proc;
8010409f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
801040a5:	e8 c6 05 00 00       	call   80104670 <popcli>
  acquire(&ptable.lock);
801040aa:	83 ec 0c             	sub    $0xc,%esp
801040ad:	68 20 1d 11 80       	push   $0x80111d20
801040b2:	e8 b9 06 00 00       	call   80104770 <acquire>
801040b7:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
801040ba:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040bc:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
801040c1:	eb 10                	jmp    801040d3 <wait+0x43>
801040c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801040c7:	90                   	nop
801040c8:	83 eb 80             	sub    $0xffffff80,%ebx
801040cb:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
801040d1:	74 1b                	je     801040ee <wait+0x5e>
      if(p->parent != curproc)
801040d3:	39 73 18             	cmp    %esi,0x18(%ebx)
801040d6:	75 f0                	jne    801040c8 <wait+0x38>
      if(p->state == ZOMBIE){
801040d8:	83 7b 10 05          	cmpl   $0x5,0x10(%ebx)
801040dc:	74 62                	je     80104140 <wait+0xb0>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040de:	83 eb 80             	sub    $0xffffff80,%ebx
      havekids = 1;
801040e1:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040e6:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
801040ec:	75 e5                	jne    801040d3 <wait+0x43>
    if(!havekids || curproc->killed){
801040ee:	85 c0                	test   %eax,%eax
801040f0:	0f 84 a0 00 00 00    	je     80104196 <wait+0x106>
801040f6:	8b 46 28             	mov    0x28(%esi),%eax
801040f9:	85 c0                	test   %eax,%eax
801040fb:	0f 85 95 00 00 00    	jne    80104196 <wait+0x106>
  pushcli();
80104101:	e8 1a 05 00 00       	call   80104620 <pushcli>
  c = mycpu();
80104106:	e8 b5 f9 ff ff       	call   80103ac0 <mycpu>
  p = c->proc;
8010410b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80104111:	e8 5a 05 00 00       	call   80104670 <popcli>
  if(p == 0)
80104116:	85 db                	test   %ebx,%ebx
80104118:	0f 84 8f 00 00 00    	je     801041ad <wait+0x11d>
  p->chan = chan;
8010411e:	89 73 24             	mov    %esi,0x24(%ebx)
  p->state = SLEEPING;
80104121:	c7 43 10 02 00 00 00 	movl   $0x2,0x10(%ebx)
  sched();
80104128:	e8 73 fd ff ff       	call   80103ea0 <sched>
  p->chan = 0;
8010412d:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
}
80104134:	eb 84                	jmp    801040ba <wait+0x2a>
80104136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010413d:	8d 76 00             	lea    0x0(%esi),%esi
        kfree(p->kstack);
80104140:	83 ec 0c             	sub    $0xc,%esp
        pid = p->pid;
80104143:	8b 73 14             	mov    0x14(%ebx),%esi
        kfree(p->kstack);
80104146:	ff 73 0c             	push   0xc(%ebx)
80104149:	e8 72 e3 ff ff       	call   801024c0 <kfree>
        p->kstack = 0;
8010414e:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        freevm(p->pgdir);
80104155:	5a                   	pop    %edx
80104156:	ff 73 08             	push   0x8(%ebx)
80104159:	e8 62 2f 00 00       	call   801070c0 <freevm>
        p->pid = 0;
8010415e:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->parent = 0;
80104165:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
        p->name[0] = 0;
8010416c:	c6 43 70 00          	movb   $0x0,0x70(%ebx)
        p->killed = 0;
80104170:	c7 43 28 00 00 00 00 	movl   $0x0,0x28(%ebx)
        p->state = UNUSED;
80104177:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        release(&ptable.lock);
8010417e:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80104185:	e8 86 05 00 00       	call   80104710 <release>
        return pid;
8010418a:	83 c4 10             	add    $0x10,%esp
}
8010418d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104190:	89 f0                	mov    %esi,%eax
80104192:	5b                   	pop    %ebx
80104193:	5e                   	pop    %esi
80104194:	5d                   	pop    %ebp
80104195:	c3                   	ret    
      release(&ptable.lock);
80104196:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80104199:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
8010419e:	68 20 1d 11 80       	push   $0x80111d20
801041a3:	e8 68 05 00 00       	call   80104710 <release>
      return -1;
801041a8:	83 c4 10             	add    $0x10,%esp
801041ab:	eb e0                	jmp    8010418d <wait+0xfd>
    panic("sleep");
801041ad:	83 ec 0c             	sub    $0xc,%esp
801041b0:	68 74 7a 10 80       	push   $0x80107a74
801041b5:	e8 c6 c1 ff ff       	call   80100380 <panic>
801041ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801041c0 <yield>:
{
801041c0:	55                   	push   %ebp
801041c1:	89 e5                	mov    %esp,%ebp
801041c3:	53                   	push   %ebx
801041c4:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
801041c7:	68 20 1d 11 80       	push   $0x80111d20
801041cc:	e8 9f 05 00 00       	call   80104770 <acquire>
  pushcli();
801041d1:	e8 4a 04 00 00       	call   80104620 <pushcli>
  c = mycpu();
801041d6:	e8 e5 f8 ff ff       	call   80103ac0 <mycpu>
  p = c->proc;
801041db:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801041e1:	e8 8a 04 00 00       	call   80104670 <popcli>
  myproc()->state = RUNNABLE;
801041e6:	c7 43 10 03 00 00 00 	movl   $0x3,0x10(%ebx)
  sched();
801041ed:	e8 ae fc ff ff       	call   80103ea0 <sched>
  release(&ptable.lock);
801041f2:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801041f9:	e8 12 05 00 00       	call   80104710 <release>
}
801041fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104201:	83 c4 10             	add    $0x10,%esp
80104204:	c9                   	leave  
80104205:	c3                   	ret    
80104206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010420d:	8d 76 00             	lea    0x0(%esi),%esi

80104210 <sleep>:
{
80104210:	55                   	push   %ebp
80104211:	89 e5                	mov    %esp,%ebp
80104213:	57                   	push   %edi
80104214:	56                   	push   %esi
80104215:	53                   	push   %ebx
80104216:	83 ec 0c             	sub    $0xc,%esp
80104219:	8b 7d 08             	mov    0x8(%ebp),%edi
8010421c:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
8010421f:	e8 fc 03 00 00       	call   80104620 <pushcli>
  c = mycpu();
80104224:	e8 97 f8 ff ff       	call   80103ac0 <mycpu>
  p = c->proc;
80104229:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
8010422f:	e8 3c 04 00 00       	call   80104670 <popcli>
  if(p == 0)
80104234:	85 db                	test   %ebx,%ebx
80104236:	0f 84 87 00 00 00    	je     801042c3 <sleep+0xb3>
  if(lk == 0)
8010423c:	85 f6                	test   %esi,%esi
8010423e:	74 76                	je     801042b6 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80104240:	81 fe 20 1d 11 80    	cmp    $0x80111d20,%esi
80104246:	74 50                	je     80104298 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80104248:	83 ec 0c             	sub    $0xc,%esp
8010424b:	68 20 1d 11 80       	push   $0x80111d20
80104250:	e8 1b 05 00 00       	call   80104770 <acquire>
    release(lk);
80104255:	89 34 24             	mov    %esi,(%esp)
80104258:	e8 b3 04 00 00       	call   80104710 <release>
  p->chan = chan;
8010425d:	89 7b 24             	mov    %edi,0x24(%ebx)
  p->state = SLEEPING;
80104260:	c7 43 10 02 00 00 00 	movl   $0x2,0x10(%ebx)
  sched();
80104267:	e8 34 fc ff ff       	call   80103ea0 <sched>
  p->chan = 0;
8010426c:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
    release(&ptable.lock);
80104273:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
8010427a:	e8 91 04 00 00       	call   80104710 <release>
    acquire(lk);
8010427f:	89 75 08             	mov    %esi,0x8(%ebp)
80104282:	83 c4 10             	add    $0x10,%esp
}
80104285:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104288:	5b                   	pop    %ebx
80104289:	5e                   	pop    %esi
8010428a:	5f                   	pop    %edi
8010428b:	5d                   	pop    %ebp
    acquire(lk);
8010428c:	e9 df 04 00 00       	jmp    80104770 <acquire>
80104291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80104298:	89 7b 24             	mov    %edi,0x24(%ebx)
  p->state = SLEEPING;
8010429b:	c7 43 10 02 00 00 00 	movl   $0x2,0x10(%ebx)
  sched();
801042a2:	e8 f9 fb ff ff       	call   80103ea0 <sched>
  p->chan = 0;
801042a7:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
}
801042ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
801042b1:	5b                   	pop    %ebx
801042b2:	5e                   	pop    %esi
801042b3:	5f                   	pop    %edi
801042b4:	5d                   	pop    %ebp
801042b5:	c3                   	ret    
    panic("sleep without lk");
801042b6:	83 ec 0c             	sub    $0xc,%esp
801042b9:	68 7a 7a 10 80       	push   $0x80107a7a
801042be:	e8 bd c0 ff ff       	call   80100380 <panic>
    panic("sleep");
801042c3:	83 ec 0c             	sub    $0xc,%esp
801042c6:	68 74 7a 10 80       	push   $0x80107a74
801042cb:	e8 b0 c0 ff ff       	call   80100380 <panic>

801042d0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
801042d0:	55                   	push   %ebp
801042d1:	89 e5                	mov    %esp,%ebp
801042d3:	53                   	push   %ebx
801042d4:	83 ec 10             	sub    $0x10,%esp
801042d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
801042da:	68 20 1d 11 80       	push   $0x80111d20
801042df:	e8 8c 04 00 00       	call   80104770 <acquire>
801042e4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801042e7:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
801042ec:	eb 0c                	jmp    801042fa <wakeup+0x2a>
801042ee:	66 90                	xchg   %ax,%ax
801042f0:	83 e8 80             	sub    $0xffffff80,%eax
801042f3:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
801042f8:	74 1c                	je     80104316 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
801042fa:	83 78 10 02          	cmpl   $0x2,0x10(%eax)
801042fe:	75 f0                	jne    801042f0 <wakeup+0x20>
80104300:	3b 58 24             	cmp    0x24(%eax),%ebx
80104303:	75 eb                	jne    801042f0 <wakeup+0x20>
      p->state = RUNNABLE;
80104305:	c7 40 10 03 00 00 00 	movl   $0x3,0x10(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010430c:	83 e8 80             	sub    $0xffffff80,%eax
8010430f:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80104314:	75 e4                	jne    801042fa <wakeup+0x2a>
  wakeup1(chan);
  release(&ptable.lock);
80104316:	c7 45 08 20 1d 11 80 	movl   $0x80111d20,0x8(%ebp)
}
8010431d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104320:	c9                   	leave  
  release(&ptable.lock);
80104321:	e9 ea 03 00 00       	jmp    80104710 <release>
80104326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010432d:	8d 76 00             	lea    0x0(%esi),%esi

80104330 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104330:	55                   	push   %ebp
80104331:	89 e5                	mov    %esp,%ebp
80104333:	53                   	push   %ebx
80104334:	83 ec 10             	sub    $0x10,%esp
80104337:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010433a:	68 20 1d 11 80       	push   $0x80111d20
8010433f:	e8 2c 04 00 00       	call   80104770 <acquire>
80104344:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104347:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
8010434c:	eb 0c                	jmp    8010435a <kill+0x2a>
8010434e:	66 90                	xchg   %ax,%ax
80104350:	83 e8 80             	sub    $0xffffff80,%eax
80104353:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80104358:	74 36                	je     80104390 <kill+0x60>
    if(p->pid == pid){
8010435a:	39 58 14             	cmp    %ebx,0x14(%eax)
8010435d:	75 f1                	jne    80104350 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010435f:	83 78 10 02          	cmpl   $0x2,0x10(%eax)
      p->killed = 1;
80104363:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
      if(p->state == SLEEPING)
8010436a:	75 07                	jne    80104373 <kill+0x43>
        p->state = RUNNABLE;
8010436c:	c7 40 10 03 00 00 00 	movl   $0x3,0x10(%eax)
      release(&ptable.lock);
80104373:	83 ec 0c             	sub    $0xc,%esp
80104376:	68 20 1d 11 80       	push   $0x80111d20
8010437b:	e8 90 03 00 00       	call   80104710 <release>
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}
80104380:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      return 0;
80104383:	83 c4 10             	add    $0x10,%esp
80104386:	31 c0                	xor    %eax,%eax
}
80104388:	c9                   	leave  
80104389:	c3                   	ret    
8010438a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80104390:	83 ec 0c             	sub    $0xc,%esp
80104393:	68 20 1d 11 80       	push   $0x80111d20
80104398:	e8 73 03 00 00       	call   80104710 <release>
}
8010439d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return -1;
801043a0:	83 c4 10             	add    $0x10,%esp
801043a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801043a8:	c9                   	leave  
801043a9:	c3                   	ret    
801043aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801043b0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
801043b0:	55                   	push   %ebp
801043b1:	89 e5                	mov    %esp,%ebp
801043b3:	57                   	push   %edi
801043b4:	56                   	push   %esi
801043b5:	8d 75 e8             	lea    -0x18(%ebp),%esi
801043b8:	53                   	push   %ebx
801043b9:	bb c4 1d 11 80       	mov    $0x80111dc4,%ebx
801043be:	83 ec 3c             	sub    $0x3c,%esp
801043c1:	eb 24                	jmp    801043e7 <procdump+0x37>
801043c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801043c7:	90                   	nop
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
801043c8:	83 ec 0c             	sub    $0xc,%esp
801043cb:	68 17 7e 10 80       	push   $0x80107e17
801043d0:	e8 cb c2 ff ff       	call   801006a0 <cprintf>
801043d5:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801043d8:	83 eb 80             	sub    $0xffffff80,%ebx
801043db:	81 fb c4 3d 11 80    	cmp    $0x80113dc4,%ebx
801043e1:	0f 84 81 00 00 00    	je     80104468 <procdump+0xb8>
    if(p->state == UNUSED)
801043e7:	8b 43 a0             	mov    -0x60(%ebx),%eax
801043ea:	85 c0                	test   %eax,%eax
801043ec:	74 ea                	je     801043d8 <procdump+0x28>
      state = "???";
801043ee:	ba 8b 7a 10 80       	mov    $0x80107a8b,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801043f3:	83 f8 05             	cmp    $0x5,%eax
801043f6:	77 11                	ja     80104409 <procdump+0x59>
801043f8:	8b 14 85 ec 7a 10 80 	mov    -0x7fef8514(,%eax,4),%edx
      state = "???";
801043ff:	b8 8b 7a 10 80       	mov    $0x80107a8b,%eax
80104404:	85 d2                	test   %edx,%edx
80104406:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104409:	53                   	push   %ebx
8010440a:	52                   	push   %edx
8010440b:	ff 73 a4             	push   -0x5c(%ebx)
8010440e:	68 8f 7a 10 80       	push   $0x80107a8f
80104413:	e8 88 c2 ff ff       	call   801006a0 <cprintf>
    if(p->state == SLEEPING){
80104418:	83 c4 10             	add    $0x10,%esp
8010441b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010441f:	75 a7                	jne    801043c8 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104421:	83 ec 08             	sub    $0x8,%esp
80104424:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104427:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010442a:	50                   	push   %eax
8010442b:	8b 43 b0             	mov    -0x50(%ebx),%eax
8010442e:	8b 40 0c             	mov    0xc(%eax),%eax
80104431:	83 c0 08             	add    $0x8,%eax
80104434:	50                   	push   %eax
80104435:	e8 86 01 00 00       	call   801045c0 <getcallerpcs>
      for(i=0; i<10 && pc[i] != 0; i++)
8010443a:	83 c4 10             	add    $0x10,%esp
8010443d:	8d 76 00             	lea    0x0(%esi),%esi
80104440:	8b 17                	mov    (%edi),%edx
80104442:	85 d2                	test   %edx,%edx
80104444:	74 82                	je     801043c8 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104446:	83 ec 08             	sub    $0x8,%esp
      for(i=0; i<10 && pc[i] != 0; i++)
80104449:	83 c7 04             	add    $0x4,%edi
        cprintf(" %p", pc[i]);
8010444c:	52                   	push   %edx
8010444d:	68 e1 74 10 80       	push   $0x801074e1
80104452:	e8 49 c2 ff ff       	call   801006a0 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
80104457:	83 c4 10             	add    $0x10,%esp
8010445a:	39 fe                	cmp    %edi,%esi
8010445c:	75 e2                	jne    80104440 <procdump+0x90>
8010445e:	e9 65 ff ff ff       	jmp    801043c8 <procdump+0x18>
80104463:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104467:	90                   	nop
  }
}
80104468:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010446b:	5b                   	pop    %ebx
8010446c:	5e                   	pop    %esi
8010446d:	5f                   	pop    %edi
8010446e:	5d                   	pop    %ebp
8010446f:	c3                   	ret    

80104470 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104470:	55                   	push   %ebp
80104471:	89 e5                	mov    %esp,%ebp
80104473:	53                   	push   %ebx
80104474:	83 ec 0c             	sub    $0xc,%esp
80104477:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010447a:	68 04 7b 10 80       	push   $0x80107b04
8010447f:	8d 43 04             	lea    0x4(%ebx),%eax
80104482:	50                   	push   %eax
80104483:	e8 18 01 00 00       	call   801045a0 <initlock>
  lk->name = name;
80104488:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010448b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104491:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
80104494:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
8010449b:	89 43 38             	mov    %eax,0x38(%ebx)
}
8010449e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801044a1:	c9                   	leave  
801044a2:	c3                   	ret    
801044a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801044b0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801044b0:	55                   	push   %ebp
801044b1:	89 e5                	mov    %esp,%ebp
801044b3:	56                   	push   %esi
801044b4:	53                   	push   %ebx
801044b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801044b8:	8d 73 04             	lea    0x4(%ebx),%esi
801044bb:	83 ec 0c             	sub    $0xc,%esp
801044be:	56                   	push   %esi
801044bf:	e8 ac 02 00 00       	call   80104770 <acquire>
  while (lk->locked) {
801044c4:	8b 13                	mov    (%ebx),%edx
801044c6:	83 c4 10             	add    $0x10,%esp
801044c9:	85 d2                	test   %edx,%edx
801044cb:	74 16                	je     801044e3 <acquiresleep+0x33>
801044cd:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
801044d0:	83 ec 08             	sub    $0x8,%esp
801044d3:	56                   	push   %esi
801044d4:	53                   	push   %ebx
801044d5:	e8 36 fd ff ff       	call   80104210 <sleep>
  while (lk->locked) {
801044da:	8b 03                	mov    (%ebx),%eax
801044dc:	83 c4 10             	add    $0x10,%esp
801044df:	85 c0                	test   %eax,%eax
801044e1:	75 ed                	jne    801044d0 <acquiresleep+0x20>
  }
  lk->locked = 1;
801044e3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
801044e9:	e8 52 f6 ff ff       	call   80103b40 <myproc>
801044ee:	8b 40 14             	mov    0x14(%eax),%eax
801044f1:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801044f4:	89 75 08             	mov    %esi,0x8(%ebp)
}
801044f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801044fa:	5b                   	pop    %ebx
801044fb:	5e                   	pop    %esi
801044fc:	5d                   	pop    %ebp
  release(&lk->lk);
801044fd:	e9 0e 02 00 00       	jmp    80104710 <release>
80104502:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104510 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80104510:	55                   	push   %ebp
80104511:	89 e5                	mov    %esp,%ebp
80104513:	56                   	push   %esi
80104514:	53                   	push   %ebx
80104515:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104518:	8d 73 04             	lea    0x4(%ebx),%esi
8010451b:	83 ec 0c             	sub    $0xc,%esp
8010451e:	56                   	push   %esi
8010451f:	e8 4c 02 00 00       	call   80104770 <acquire>
  lk->locked = 0;
80104524:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010452a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104531:	89 1c 24             	mov    %ebx,(%esp)
80104534:	e8 97 fd ff ff       	call   801042d0 <wakeup>
  release(&lk->lk);
80104539:	89 75 08             	mov    %esi,0x8(%ebp)
8010453c:	83 c4 10             	add    $0x10,%esp
}
8010453f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104542:	5b                   	pop    %ebx
80104543:	5e                   	pop    %esi
80104544:	5d                   	pop    %ebp
  release(&lk->lk);
80104545:	e9 c6 01 00 00       	jmp    80104710 <release>
8010454a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104550 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80104550:	55                   	push   %ebp
80104551:	89 e5                	mov    %esp,%ebp
80104553:	57                   	push   %edi
80104554:	31 ff                	xor    %edi,%edi
80104556:	56                   	push   %esi
80104557:	53                   	push   %ebx
80104558:	83 ec 18             	sub    $0x18,%esp
8010455b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
8010455e:	8d 73 04             	lea    0x4(%ebx),%esi
80104561:	56                   	push   %esi
80104562:	e8 09 02 00 00       	call   80104770 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80104567:	8b 03                	mov    (%ebx),%eax
80104569:	83 c4 10             	add    $0x10,%esp
8010456c:	85 c0                	test   %eax,%eax
8010456e:	75 18                	jne    80104588 <holdingsleep+0x38>
  release(&lk->lk);
80104570:	83 ec 0c             	sub    $0xc,%esp
80104573:	56                   	push   %esi
80104574:	e8 97 01 00 00       	call   80104710 <release>
  return r;
}
80104579:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010457c:	89 f8                	mov    %edi,%eax
8010457e:	5b                   	pop    %ebx
8010457f:	5e                   	pop    %esi
80104580:	5f                   	pop    %edi
80104581:	5d                   	pop    %ebp
80104582:	c3                   	ret    
80104583:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104587:	90                   	nop
  r = lk->locked && (lk->pid == myproc()->pid);
80104588:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
8010458b:	e8 b0 f5 ff ff       	call   80103b40 <myproc>
80104590:	39 58 14             	cmp    %ebx,0x14(%eax)
80104593:	0f 94 c0             	sete   %al
80104596:	0f b6 c0             	movzbl %al,%eax
80104599:	89 c7                	mov    %eax,%edi
8010459b:	eb d3                	jmp    80104570 <holdingsleep+0x20>
8010459d:	66 90                	xchg   %ax,%ax
8010459f:	90                   	nop

801045a0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801045a0:	55                   	push   %ebp
801045a1:	89 e5                	mov    %esp,%ebp
801045a3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801045a6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801045a9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
801045af:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
801045b2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801045b9:	5d                   	pop    %ebp
801045ba:	c3                   	ret    
801045bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045bf:	90                   	nop

801045c0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801045c0:	55                   	push   %ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801045c1:	31 d2                	xor    %edx,%edx
{
801045c3:	89 e5                	mov    %esp,%ebp
801045c5:	53                   	push   %ebx
  ebp = (uint*)v - 2;
801045c6:	8b 45 08             	mov    0x8(%ebp),%eax
{
801045c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  ebp = (uint*)v - 2;
801045cc:	83 e8 08             	sub    $0x8,%eax
  for(i = 0; i < 10; i++){
801045cf:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801045d0:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
801045d6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801045dc:	77 1a                	ja     801045f8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801045de:	8b 58 04             	mov    0x4(%eax),%ebx
801045e1:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
801045e4:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
801045e7:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
801045e9:	83 fa 0a             	cmp    $0xa,%edx
801045ec:	75 e2                	jne    801045d0 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801045ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801045f1:	c9                   	leave  
801045f2:	c3                   	ret    
801045f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045f7:	90                   	nop
  for(; i < 10; i++)
801045f8:	8d 04 91             	lea    (%ecx,%edx,4),%eax
801045fb:	8d 51 28             	lea    0x28(%ecx),%edx
801045fe:	66 90                	xchg   %ax,%ax
    pcs[i] = 0;
80104600:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
80104606:	83 c0 04             	add    $0x4,%eax
80104609:	39 d0                	cmp    %edx,%eax
8010460b:	75 f3                	jne    80104600 <getcallerpcs+0x40>
}
8010460d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104610:	c9                   	leave  
80104611:	c3                   	ret    
80104612:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104620 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104620:	55                   	push   %ebp
80104621:	89 e5                	mov    %esp,%ebp
80104623:	53                   	push   %ebx
80104624:	83 ec 04             	sub    $0x4,%esp
80104627:	9c                   	pushf  
80104628:	5b                   	pop    %ebx
  asm volatile("cli");
80104629:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010462a:	e8 91 f4 ff ff       	call   80103ac0 <mycpu>
8010462f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104635:	85 c0                	test   %eax,%eax
80104637:	74 17                	je     80104650 <pushcli+0x30>
    mycpu()->intena = eflags & FL_IF;
  mycpu()->ncli += 1;
80104639:	e8 82 f4 ff ff       	call   80103ac0 <mycpu>
8010463e:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104645:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104648:	c9                   	leave  
80104649:	c3                   	ret    
8010464a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    mycpu()->intena = eflags & FL_IF;
80104650:	e8 6b f4 ff ff       	call   80103ac0 <mycpu>
80104655:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010465b:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
80104661:	eb d6                	jmp    80104639 <pushcli+0x19>
80104663:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010466a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104670 <popcli>:

void
popcli(void)
{
80104670:	55                   	push   %ebp
80104671:	89 e5                	mov    %esp,%ebp
80104673:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104676:	9c                   	pushf  
80104677:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104678:	f6 c4 02             	test   $0x2,%ah
8010467b:	75 35                	jne    801046b2 <popcli+0x42>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010467d:	e8 3e f4 ff ff       	call   80103ac0 <mycpu>
80104682:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104689:	78 34                	js     801046bf <popcli+0x4f>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
8010468b:	e8 30 f4 ff ff       	call   80103ac0 <mycpu>
80104690:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104696:	85 d2                	test   %edx,%edx
80104698:	74 06                	je     801046a0 <popcli+0x30>
    sti();
}
8010469a:	c9                   	leave  
8010469b:	c3                   	ret    
8010469c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(mycpu()->ncli == 0 && mycpu()->intena)
801046a0:	e8 1b f4 ff ff       	call   80103ac0 <mycpu>
801046a5:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801046ab:	85 c0                	test   %eax,%eax
801046ad:	74 eb                	je     8010469a <popcli+0x2a>
  asm volatile("sti");
801046af:	fb                   	sti    
}
801046b0:	c9                   	leave  
801046b1:	c3                   	ret    
    panic("popcli - interruptible");
801046b2:	83 ec 0c             	sub    $0xc,%esp
801046b5:	68 0f 7b 10 80       	push   $0x80107b0f
801046ba:	e8 c1 bc ff ff       	call   80100380 <panic>
    panic("popcli");
801046bf:	83 ec 0c             	sub    $0xc,%esp
801046c2:	68 26 7b 10 80       	push   $0x80107b26
801046c7:	e8 b4 bc ff ff       	call   80100380 <panic>
801046cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801046d0 <holding>:
{
801046d0:	55                   	push   %ebp
801046d1:	89 e5                	mov    %esp,%ebp
801046d3:	56                   	push   %esi
801046d4:	53                   	push   %ebx
801046d5:	8b 75 08             	mov    0x8(%ebp),%esi
801046d8:	31 db                	xor    %ebx,%ebx
  pushcli();
801046da:	e8 41 ff ff ff       	call   80104620 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
801046df:	8b 06                	mov    (%esi),%eax
801046e1:	85 c0                	test   %eax,%eax
801046e3:	75 0b                	jne    801046f0 <holding+0x20>
  popcli();
801046e5:	e8 86 ff ff ff       	call   80104670 <popcli>
}
801046ea:	89 d8                	mov    %ebx,%eax
801046ec:	5b                   	pop    %ebx
801046ed:	5e                   	pop    %esi
801046ee:	5d                   	pop    %ebp
801046ef:	c3                   	ret    
  r = lock->locked && lock->cpu == mycpu();
801046f0:	8b 5e 08             	mov    0x8(%esi),%ebx
801046f3:	e8 c8 f3 ff ff       	call   80103ac0 <mycpu>
801046f8:	39 c3                	cmp    %eax,%ebx
801046fa:	0f 94 c3             	sete   %bl
  popcli();
801046fd:	e8 6e ff ff ff       	call   80104670 <popcli>
  r = lock->locked && lock->cpu == mycpu();
80104702:	0f b6 db             	movzbl %bl,%ebx
}
80104705:	89 d8                	mov    %ebx,%eax
80104707:	5b                   	pop    %ebx
80104708:	5e                   	pop    %esi
80104709:	5d                   	pop    %ebp
8010470a:	c3                   	ret    
8010470b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010470f:	90                   	nop

80104710 <release>:
{
80104710:	55                   	push   %ebp
80104711:	89 e5                	mov    %esp,%ebp
80104713:	56                   	push   %esi
80104714:	53                   	push   %ebx
80104715:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
80104718:	e8 03 ff ff ff       	call   80104620 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
8010471d:	8b 03                	mov    (%ebx),%eax
8010471f:	85 c0                	test   %eax,%eax
80104721:	75 15                	jne    80104738 <release+0x28>
  popcli();
80104723:	e8 48 ff ff ff       	call   80104670 <popcli>
    panic("release");
80104728:	83 ec 0c             	sub    $0xc,%esp
8010472b:	68 2d 7b 10 80       	push   $0x80107b2d
80104730:	e8 4b bc ff ff       	call   80100380 <panic>
80104735:	8d 76 00             	lea    0x0(%esi),%esi
  r = lock->locked && lock->cpu == mycpu();
80104738:	8b 73 08             	mov    0x8(%ebx),%esi
8010473b:	e8 80 f3 ff ff       	call   80103ac0 <mycpu>
80104740:	39 c6                	cmp    %eax,%esi
80104742:	75 df                	jne    80104723 <release+0x13>
  popcli();
80104744:	e8 27 ff ff ff       	call   80104670 <popcli>
  lk->pcs[0] = 0;
80104749:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
80104750:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
80104757:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
8010475c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
80104762:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104765:	5b                   	pop    %ebx
80104766:	5e                   	pop    %esi
80104767:	5d                   	pop    %ebp
  popcli();
80104768:	e9 03 ff ff ff       	jmp    80104670 <popcli>
8010476d:	8d 76 00             	lea    0x0(%esi),%esi

80104770 <acquire>:
{
80104770:	55                   	push   %ebp
80104771:	89 e5                	mov    %esp,%ebp
80104773:	53                   	push   %ebx
80104774:	83 ec 04             	sub    $0x4,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80104777:	e8 a4 fe ff ff       	call   80104620 <pushcli>
  if(holding(lk))
8010477c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
8010477f:	e8 9c fe ff ff       	call   80104620 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
80104784:	8b 03                	mov    (%ebx),%eax
80104786:	85 c0                	test   %eax,%eax
80104788:	75 7e                	jne    80104808 <acquire+0x98>
  popcli();
8010478a:	e8 e1 fe ff ff       	call   80104670 <popcli>
  asm volatile("lock; xchgl %0, %1" :
8010478f:	b9 01 00 00 00       	mov    $0x1,%ecx
80104794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(xchg(&lk->locked, 1) != 0)
80104798:	8b 55 08             	mov    0x8(%ebp),%edx
8010479b:	89 c8                	mov    %ecx,%eax
8010479d:	f0 87 02             	lock xchg %eax,(%edx)
801047a0:	85 c0                	test   %eax,%eax
801047a2:	75 f4                	jne    80104798 <acquire+0x28>
  __sync_synchronize();
801047a4:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
801047a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801047ac:	e8 0f f3 ff ff       	call   80103ac0 <mycpu>
  getcallerpcs(&lk, lk->pcs);
801047b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ebp = (uint*)v - 2;
801047b4:	89 ea                	mov    %ebp,%edx
  lk->cpu = mycpu();
801047b6:	89 43 08             	mov    %eax,0x8(%ebx)
  for(i = 0; i < 10; i++){
801047b9:	31 c0                	xor    %eax,%eax
801047bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801047bf:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801047c0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801047c6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801047cc:	77 1a                	ja     801047e8 <acquire+0x78>
    pcs[i] = ebp[1];     // saved %eip
801047ce:	8b 5a 04             	mov    0x4(%edx),%ebx
801047d1:	89 5c 81 0c          	mov    %ebx,0xc(%ecx,%eax,4)
  for(i = 0; i < 10; i++){
801047d5:	83 c0 01             	add    $0x1,%eax
    ebp = (uint*)ebp[0]; // saved %ebp
801047d8:	8b 12                	mov    (%edx),%edx
  for(i = 0; i < 10; i++){
801047da:	83 f8 0a             	cmp    $0xa,%eax
801047dd:	75 e1                	jne    801047c0 <acquire+0x50>
}
801047df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801047e2:	c9                   	leave  
801047e3:	c3                   	ret    
801047e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(; i < 10; i++)
801047e8:	8d 44 81 0c          	lea    0xc(%ecx,%eax,4),%eax
801047ec:	8d 51 34             	lea    0x34(%ecx),%edx
801047ef:	90                   	nop
    pcs[i] = 0;
801047f0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
801047f6:	83 c0 04             	add    $0x4,%eax
801047f9:	39 c2                	cmp    %eax,%edx
801047fb:	75 f3                	jne    801047f0 <acquire+0x80>
}
801047fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104800:	c9                   	leave  
80104801:	c3                   	ret    
80104802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  r = lock->locked && lock->cpu == mycpu();
80104808:	8b 5b 08             	mov    0x8(%ebx),%ebx
8010480b:	e8 b0 f2 ff ff       	call   80103ac0 <mycpu>
80104810:	39 c3                	cmp    %eax,%ebx
80104812:	0f 85 72 ff ff ff    	jne    8010478a <acquire+0x1a>
  popcli();
80104818:	e8 53 fe ff ff       	call   80104670 <popcli>
    panic("acquire");
8010481d:	83 ec 0c             	sub    $0xc,%esp
80104820:	68 35 7b 10 80       	push   $0x80107b35
80104825:	e8 56 bb ff ff       	call   80100380 <panic>
8010482a:	66 90                	xchg   %ax,%ax
8010482c:	66 90                	xchg   %ax,%ax
8010482e:	66 90                	xchg   %ax,%ax

80104830 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104830:	55                   	push   %ebp
80104831:	89 e5                	mov    %esp,%ebp
80104833:	57                   	push   %edi
80104834:	8b 55 08             	mov    0x8(%ebp),%edx
80104837:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010483a:	53                   	push   %ebx
8010483b:	8b 45 0c             	mov    0xc(%ebp),%eax
  if ((int)dst%4 == 0 && n%4 == 0){
8010483e:	89 d7                	mov    %edx,%edi
80104840:	09 cf                	or     %ecx,%edi
80104842:	83 e7 03             	and    $0x3,%edi
80104845:	75 29                	jne    80104870 <memset+0x40>
    c &= 0xFF;
80104847:	0f b6 f8             	movzbl %al,%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
8010484a:	c1 e0 18             	shl    $0x18,%eax
8010484d:	89 fb                	mov    %edi,%ebx
8010484f:	c1 e9 02             	shr    $0x2,%ecx
80104852:	c1 e3 10             	shl    $0x10,%ebx
80104855:	09 d8                	or     %ebx,%eax
80104857:	09 f8                	or     %edi,%eax
80104859:	c1 e7 08             	shl    $0x8,%edi
8010485c:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
8010485e:	89 d7                	mov    %edx,%edi
80104860:	fc                   	cld    
80104861:	f3 ab                	rep stos %eax,%es:(%edi)
  } else
    stosb(dst, c, n);
  return dst;
}
80104863:	5b                   	pop    %ebx
80104864:	89 d0                	mov    %edx,%eax
80104866:	5f                   	pop    %edi
80104867:	5d                   	pop    %ebp
80104868:	c3                   	ret    
80104869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  asm volatile("cld; rep stosb" :
80104870:	89 d7                	mov    %edx,%edi
80104872:	fc                   	cld    
80104873:	f3 aa                	rep stos %al,%es:(%edi)
80104875:	5b                   	pop    %ebx
80104876:	89 d0                	mov    %edx,%eax
80104878:	5f                   	pop    %edi
80104879:	5d                   	pop    %ebp
8010487a:	c3                   	ret    
8010487b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010487f:	90                   	nop

80104880 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104880:	55                   	push   %ebp
80104881:	89 e5                	mov    %esp,%ebp
80104883:	56                   	push   %esi
80104884:	8b 75 10             	mov    0x10(%ebp),%esi
80104887:	8b 55 08             	mov    0x8(%ebp),%edx
8010488a:	53                   	push   %ebx
8010488b:	8b 45 0c             	mov    0xc(%ebp),%eax
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010488e:	85 f6                	test   %esi,%esi
80104890:	74 2e                	je     801048c0 <memcmp+0x40>
80104892:	01 c6                	add    %eax,%esi
80104894:	eb 14                	jmp    801048aa <memcmp+0x2a>
80104896:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010489d:	8d 76 00             	lea    0x0(%esi),%esi
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
801048a0:	83 c0 01             	add    $0x1,%eax
801048a3:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0){
801048a6:	39 f0                	cmp    %esi,%eax
801048a8:	74 16                	je     801048c0 <memcmp+0x40>
    if(*s1 != *s2)
801048aa:	0f b6 0a             	movzbl (%edx),%ecx
801048ad:	0f b6 18             	movzbl (%eax),%ebx
801048b0:	38 d9                	cmp    %bl,%cl
801048b2:	74 ec                	je     801048a0 <memcmp+0x20>
      return *s1 - *s2;
801048b4:	0f b6 c1             	movzbl %cl,%eax
801048b7:	29 d8                	sub    %ebx,%eax
  }

  return 0;
}
801048b9:	5b                   	pop    %ebx
801048ba:	5e                   	pop    %esi
801048bb:	5d                   	pop    %ebp
801048bc:	c3                   	ret    
801048bd:	8d 76 00             	lea    0x0(%esi),%esi
801048c0:	5b                   	pop    %ebx
  return 0;
801048c1:	31 c0                	xor    %eax,%eax
}
801048c3:	5e                   	pop    %esi
801048c4:	5d                   	pop    %ebp
801048c5:	c3                   	ret    
801048c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801048cd:	8d 76 00             	lea    0x0(%esi),%esi

801048d0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
801048d0:	55                   	push   %ebp
801048d1:	89 e5                	mov    %esp,%ebp
801048d3:	57                   	push   %edi
801048d4:	8b 55 08             	mov    0x8(%ebp),%edx
801048d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
801048da:	56                   	push   %esi
801048db:	8b 75 0c             	mov    0xc(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
801048de:	39 d6                	cmp    %edx,%esi
801048e0:	73 26                	jae    80104908 <memmove+0x38>
801048e2:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
801048e5:	39 fa                	cmp    %edi,%edx
801048e7:	73 1f                	jae    80104908 <memmove+0x38>
801048e9:	8d 41 ff             	lea    -0x1(%ecx),%eax
    s += n;
    d += n;
    while(n-- > 0)
801048ec:	85 c9                	test   %ecx,%ecx
801048ee:	74 0c                	je     801048fc <memmove+0x2c>
      *--d = *--s;
801048f0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801048f4:	88 0c 02             	mov    %cl,(%edx,%eax,1)
    while(n-- > 0)
801048f7:	83 e8 01             	sub    $0x1,%eax
801048fa:	73 f4                	jae    801048f0 <memmove+0x20>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
801048fc:	5e                   	pop    %esi
801048fd:	89 d0                	mov    %edx,%eax
801048ff:	5f                   	pop    %edi
80104900:	5d                   	pop    %ebp
80104901:	c3                   	ret    
80104902:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while(n-- > 0)
80104908:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
8010490b:	89 d7                	mov    %edx,%edi
8010490d:	85 c9                	test   %ecx,%ecx
8010490f:	74 eb                	je     801048fc <memmove+0x2c>
80104911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      *d++ = *s++;
80104918:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    while(n-- > 0)
80104919:	39 c6                	cmp    %eax,%esi
8010491b:	75 fb                	jne    80104918 <memmove+0x48>
}
8010491d:	5e                   	pop    %esi
8010491e:	89 d0                	mov    %edx,%eax
80104920:	5f                   	pop    %edi
80104921:	5d                   	pop    %ebp
80104922:	c3                   	ret    
80104923:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010492a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104930 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
80104930:	eb 9e                	jmp    801048d0 <memmove>
80104932:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104940 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
80104940:	55                   	push   %ebp
80104941:	89 e5                	mov    %esp,%ebp
80104943:	56                   	push   %esi
80104944:	8b 75 10             	mov    0x10(%ebp),%esi
80104947:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010494a:	53                   	push   %ebx
8010494b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(n > 0 && *p && *p == *q)
8010494e:	85 f6                	test   %esi,%esi
80104950:	74 2e                	je     80104980 <strncmp+0x40>
80104952:	01 d6                	add    %edx,%esi
80104954:	eb 18                	jmp    8010496e <strncmp+0x2e>
80104956:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010495d:	8d 76 00             	lea    0x0(%esi),%esi
80104960:	38 d8                	cmp    %bl,%al
80104962:	75 14                	jne    80104978 <strncmp+0x38>
    n--, p++, q++;
80104964:	83 c2 01             	add    $0x1,%edx
80104967:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
8010496a:	39 f2                	cmp    %esi,%edx
8010496c:	74 12                	je     80104980 <strncmp+0x40>
8010496e:	0f b6 01             	movzbl (%ecx),%eax
80104971:	0f b6 1a             	movzbl (%edx),%ebx
80104974:	84 c0                	test   %al,%al
80104976:	75 e8                	jne    80104960 <strncmp+0x20>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
80104978:	29 d8                	sub    %ebx,%eax
}
8010497a:	5b                   	pop    %ebx
8010497b:	5e                   	pop    %esi
8010497c:	5d                   	pop    %ebp
8010497d:	c3                   	ret    
8010497e:	66 90                	xchg   %ax,%ax
80104980:	5b                   	pop    %ebx
    return 0;
80104981:	31 c0                	xor    %eax,%eax
}
80104983:	5e                   	pop    %esi
80104984:	5d                   	pop    %ebp
80104985:	c3                   	ret    
80104986:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010498d:	8d 76 00             	lea    0x0(%esi),%esi

80104990 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104990:	55                   	push   %ebp
80104991:	89 e5                	mov    %esp,%ebp
80104993:	57                   	push   %edi
80104994:	56                   	push   %esi
80104995:	8b 75 08             	mov    0x8(%ebp),%esi
80104998:	53                   	push   %ebx
80104999:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
8010499c:	89 f0                	mov    %esi,%eax
8010499e:	eb 15                	jmp    801049b5 <strncpy+0x25>
801049a0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
801049a4:	8b 7d 0c             	mov    0xc(%ebp),%edi
801049a7:	83 c0 01             	add    $0x1,%eax
801049aa:	0f b6 57 ff          	movzbl -0x1(%edi),%edx
801049ae:	88 50 ff             	mov    %dl,-0x1(%eax)
801049b1:	84 d2                	test   %dl,%dl
801049b3:	74 09                	je     801049be <strncpy+0x2e>
801049b5:	89 cb                	mov    %ecx,%ebx
801049b7:	83 e9 01             	sub    $0x1,%ecx
801049ba:	85 db                	test   %ebx,%ebx
801049bc:	7f e2                	jg     801049a0 <strncpy+0x10>
    ;
  while(n-- > 0)
801049be:	89 c2                	mov    %eax,%edx
801049c0:	85 c9                	test   %ecx,%ecx
801049c2:	7e 17                	jle    801049db <strncpy+0x4b>
801049c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
801049c8:	83 c2 01             	add    $0x1,%edx
801049cb:	89 c1                	mov    %eax,%ecx
801049cd:	c6 42 ff 00          	movb   $0x0,-0x1(%edx)
  while(n-- > 0)
801049d1:	29 d1                	sub    %edx,%ecx
801049d3:	8d 4c 0b ff          	lea    -0x1(%ebx,%ecx,1),%ecx
801049d7:	85 c9                	test   %ecx,%ecx
801049d9:	7f ed                	jg     801049c8 <strncpy+0x38>
  return os;
}
801049db:	5b                   	pop    %ebx
801049dc:	89 f0                	mov    %esi,%eax
801049de:	5e                   	pop    %esi
801049df:	5f                   	pop    %edi
801049e0:	5d                   	pop    %ebp
801049e1:	c3                   	ret    
801049e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801049f0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
801049f0:	55                   	push   %ebp
801049f1:	89 e5                	mov    %esp,%ebp
801049f3:	56                   	push   %esi
801049f4:	8b 55 10             	mov    0x10(%ebp),%edx
801049f7:	8b 75 08             	mov    0x8(%ebp),%esi
801049fa:	53                   	push   %ebx
801049fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *os;

  os = s;
  if(n <= 0)
801049fe:	85 d2                	test   %edx,%edx
80104a00:	7e 25                	jle    80104a27 <safestrcpy+0x37>
80104a02:	8d 5c 10 ff          	lea    -0x1(%eax,%edx,1),%ebx
80104a06:	89 f2                	mov    %esi,%edx
80104a08:	eb 16                	jmp    80104a20 <safestrcpy+0x30>
80104a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104a10:	0f b6 08             	movzbl (%eax),%ecx
80104a13:	83 c0 01             	add    $0x1,%eax
80104a16:	83 c2 01             	add    $0x1,%edx
80104a19:	88 4a ff             	mov    %cl,-0x1(%edx)
80104a1c:	84 c9                	test   %cl,%cl
80104a1e:	74 04                	je     80104a24 <safestrcpy+0x34>
80104a20:	39 d8                	cmp    %ebx,%eax
80104a22:	75 ec                	jne    80104a10 <safestrcpy+0x20>
    ;
  *s = 0;
80104a24:	c6 02 00             	movb   $0x0,(%edx)
  return os;
}
80104a27:	89 f0                	mov    %esi,%eax
80104a29:	5b                   	pop    %ebx
80104a2a:	5e                   	pop    %esi
80104a2b:	5d                   	pop    %ebp
80104a2c:	c3                   	ret    
80104a2d:	8d 76 00             	lea    0x0(%esi),%esi

80104a30 <strlen>:

int
strlen(const char *s)
{
80104a30:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104a31:	31 c0                	xor    %eax,%eax
{
80104a33:	89 e5                	mov    %esp,%ebp
80104a35:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
80104a38:	80 3a 00             	cmpb   $0x0,(%edx)
80104a3b:	74 0c                	je     80104a49 <strlen+0x19>
80104a3d:	8d 76 00             	lea    0x0(%esi),%esi
80104a40:	83 c0 01             	add    $0x1,%eax
80104a43:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104a47:	75 f7                	jne    80104a40 <strlen+0x10>
    ;
  return n;
}
80104a49:	5d                   	pop    %ebp
80104a4a:	c3                   	ret    

80104a4b <swtch>:
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
80104a4b:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80104a4f:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-saved registers
  pushl %ebp
80104a53:	55                   	push   %ebp
  pushl %ebx
80104a54:	53                   	push   %ebx
  pushl %esi
80104a55:	56                   	push   %esi
  pushl %edi
80104a56:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104a57:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104a59:	89 d4                	mov    %edx,%esp

  # Load new callee-saved registers
  popl %edi
80104a5b:	5f                   	pop    %edi
  popl %esi
80104a5c:	5e                   	pop    %esi
  popl %ebx
80104a5d:	5b                   	pop    %ebx
  popl %ebp
80104a5e:	5d                   	pop    %ebp
  ret
80104a5f:	c3                   	ret    

80104a60 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104a60:	55                   	push   %ebp
80104a61:	89 e5                	mov    %esp,%ebp
80104a63:	53                   	push   %ebx
80104a64:	83 ec 04             	sub    $0x4,%esp
80104a67:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
80104a6a:	e8 d1 f0 ff ff       	call   80103b40 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104a6f:	8b 00                	mov    (%eax),%eax
80104a71:	39 d8                	cmp    %ebx,%eax
80104a73:	76 1b                	jbe    80104a90 <fetchint+0x30>
80104a75:	8d 53 04             	lea    0x4(%ebx),%edx
80104a78:	39 d0                	cmp    %edx,%eax
80104a7a:	72 14                	jb     80104a90 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
80104a7c:	8b 45 0c             	mov    0xc(%ebp),%eax
80104a7f:	8b 13                	mov    (%ebx),%edx
80104a81:	89 10                	mov    %edx,(%eax)
  return 0;
80104a83:	31 c0                	xor    %eax,%eax
}
80104a85:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a88:	c9                   	leave  
80104a89:	c3                   	ret    
80104a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80104a90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a95:	eb ee                	jmp    80104a85 <fetchint+0x25>
80104a97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a9e:	66 90                	xchg   %ax,%ax

80104aa0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	53                   	push   %ebx
80104aa4:	83 ec 04             	sub    $0x4,%esp
80104aa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
80104aaa:	e8 91 f0 ff ff       	call   80103b40 <myproc>

  if(addr >= curproc->sz)
80104aaf:	39 18                	cmp    %ebx,(%eax)
80104ab1:	76 2d                	jbe    80104ae0 <fetchstr+0x40>
    return -1;
  *pp = (char*)addr;
80104ab3:	8b 55 0c             	mov    0xc(%ebp),%edx
80104ab6:	89 1a                	mov    %ebx,(%edx)
  ep = (char*)curproc->sz;
80104ab8:	8b 10                	mov    (%eax),%edx
  for(s = *pp; s < ep; s++){
80104aba:	39 d3                	cmp    %edx,%ebx
80104abc:	73 22                	jae    80104ae0 <fetchstr+0x40>
80104abe:	89 d8                	mov    %ebx,%eax
80104ac0:	eb 0d                	jmp    80104acf <fetchstr+0x2f>
80104ac2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104ac8:	83 c0 01             	add    $0x1,%eax
80104acb:	39 c2                	cmp    %eax,%edx
80104acd:	76 11                	jbe    80104ae0 <fetchstr+0x40>
    if(*s == 0)
80104acf:	80 38 00             	cmpb   $0x0,(%eax)
80104ad2:	75 f4                	jne    80104ac8 <fetchstr+0x28>
      return s - *pp;
80104ad4:	29 d8                	sub    %ebx,%eax
  }
  return -1;
}
80104ad6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104ad9:	c9                   	leave  
80104ada:	c3                   	ret    
80104adb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104adf:	90                   	nop
80104ae0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return -1;
80104ae3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104ae8:	c9                   	leave  
80104ae9:	c3                   	ret    
80104aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104af0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104af0:	55                   	push   %ebp
80104af1:	89 e5                	mov    %esp,%ebp
80104af3:	56                   	push   %esi
80104af4:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104af5:	e8 46 f0 ff ff       	call   80103b40 <myproc>
80104afa:	8b 55 08             	mov    0x8(%ebp),%edx
80104afd:	8b 40 1c             	mov    0x1c(%eax),%eax
80104b00:	8b 40 44             	mov    0x44(%eax),%eax
80104b03:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104b06:	e8 35 f0 ff ff       	call   80103b40 <myproc>
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104b0b:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104b0e:	8b 00                	mov    (%eax),%eax
80104b10:	39 c6                	cmp    %eax,%esi
80104b12:	73 1c                	jae    80104b30 <argint+0x40>
80104b14:	8d 53 08             	lea    0x8(%ebx),%edx
80104b17:	39 d0                	cmp    %edx,%eax
80104b19:	72 15                	jb     80104b30 <argint+0x40>
  *ip = *(int*)(addr);
80104b1b:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b1e:	8b 53 04             	mov    0x4(%ebx),%edx
80104b21:	89 10                	mov    %edx,(%eax)
  return 0;
80104b23:	31 c0                	xor    %eax,%eax
}
80104b25:	5b                   	pop    %ebx
80104b26:	5e                   	pop    %esi
80104b27:	5d                   	pop    %ebp
80104b28:	c3                   	ret    
80104b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104b30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104b35:	eb ee                	jmp    80104b25 <argint+0x35>
80104b37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b3e:	66 90                	xchg   %ax,%ax

80104b40 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104b40:	55                   	push   %ebp
80104b41:	89 e5                	mov    %esp,%ebp
80104b43:	57                   	push   %edi
80104b44:	56                   	push   %esi
80104b45:	53                   	push   %ebx
80104b46:	83 ec 0c             	sub    $0xc,%esp
  int i;
  struct proc *curproc = myproc();
80104b49:	e8 f2 ef ff ff       	call   80103b40 <myproc>
80104b4e:	89 c6                	mov    %eax,%esi
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104b50:	e8 eb ef ff ff       	call   80103b40 <myproc>
80104b55:	8b 55 08             	mov    0x8(%ebp),%edx
80104b58:	8b 40 1c             	mov    0x1c(%eax),%eax
80104b5b:	8b 40 44             	mov    0x44(%eax),%eax
80104b5e:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104b61:	e8 da ef ff ff       	call   80103b40 <myproc>
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104b66:	8d 7b 04             	lea    0x4(%ebx),%edi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104b69:	8b 00                	mov    (%eax),%eax
80104b6b:	39 c7                	cmp    %eax,%edi
80104b6d:	73 31                	jae    80104ba0 <argptr+0x60>
80104b6f:	8d 4b 08             	lea    0x8(%ebx),%ecx
80104b72:	39 c8                	cmp    %ecx,%eax
80104b74:	72 2a                	jb     80104ba0 <argptr+0x60>
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104b76:	8b 55 10             	mov    0x10(%ebp),%edx
  *ip = *(int*)(addr);
80104b79:	8b 43 04             	mov    0x4(%ebx),%eax
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104b7c:	85 d2                	test   %edx,%edx
80104b7e:	78 20                	js     80104ba0 <argptr+0x60>
80104b80:	8b 16                	mov    (%esi),%edx
80104b82:	39 c2                	cmp    %eax,%edx
80104b84:	76 1a                	jbe    80104ba0 <argptr+0x60>
80104b86:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104b89:	01 c3                	add    %eax,%ebx
80104b8b:	39 da                	cmp    %ebx,%edx
80104b8d:	72 11                	jb     80104ba0 <argptr+0x60>
    return -1;
  *pp = (char*)i;
80104b8f:	8b 55 0c             	mov    0xc(%ebp),%edx
80104b92:	89 02                	mov    %eax,(%edx)
  return 0;
80104b94:	31 c0                	xor    %eax,%eax
}
80104b96:	83 c4 0c             	add    $0xc,%esp
80104b99:	5b                   	pop    %ebx
80104b9a:	5e                   	pop    %esi
80104b9b:	5f                   	pop    %edi
80104b9c:	5d                   	pop    %ebp
80104b9d:	c3                   	ret    
80104b9e:	66 90                	xchg   %ax,%ax
    return -1;
80104ba0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ba5:	eb ef                	jmp    80104b96 <argptr+0x56>
80104ba7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104bae:	66 90                	xchg   %ax,%ax

80104bb0 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104bb0:	55                   	push   %ebp
80104bb1:	89 e5                	mov    %esp,%ebp
80104bb3:	56                   	push   %esi
80104bb4:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104bb5:	e8 86 ef ff ff       	call   80103b40 <myproc>
80104bba:	8b 55 08             	mov    0x8(%ebp),%edx
80104bbd:	8b 40 1c             	mov    0x1c(%eax),%eax
80104bc0:	8b 40 44             	mov    0x44(%eax),%eax
80104bc3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104bc6:	e8 75 ef ff ff       	call   80103b40 <myproc>
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104bcb:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104bce:	8b 00                	mov    (%eax),%eax
80104bd0:	39 c6                	cmp    %eax,%esi
80104bd2:	73 44                	jae    80104c18 <argstr+0x68>
80104bd4:	8d 53 08             	lea    0x8(%ebx),%edx
80104bd7:	39 d0                	cmp    %edx,%eax
80104bd9:	72 3d                	jb     80104c18 <argstr+0x68>
  *ip = *(int*)(addr);
80104bdb:	8b 5b 04             	mov    0x4(%ebx),%ebx
  struct proc *curproc = myproc();
80104bde:	e8 5d ef ff ff       	call   80103b40 <myproc>
  if(addr >= curproc->sz)
80104be3:	3b 18                	cmp    (%eax),%ebx
80104be5:	73 31                	jae    80104c18 <argstr+0x68>
  *pp = (char*)addr;
80104be7:	8b 55 0c             	mov    0xc(%ebp),%edx
80104bea:	89 1a                	mov    %ebx,(%edx)
  ep = (char*)curproc->sz;
80104bec:	8b 10                	mov    (%eax),%edx
  for(s = *pp; s < ep; s++){
80104bee:	39 d3                	cmp    %edx,%ebx
80104bf0:	73 26                	jae    80104c18 <argstr+0x68>
80104bf2:	89 d8                	mov    %ebx,%eax
80104bf4:	eb 11                	jmp    80104c07 <argstr+0x57>
80104bf6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104bfd:	8d 76 00             	lea    0x0(%esi),%esi
80104c00:	83 c0 01             	add    $0x1,%eax
80104c03:	39 c2                	cmp    %eax,%edx
80104c05:	76 11                	jbe    80104c18 <argstr+0x68>
    if(*s == 0)
80104c07:	80 38 00             	cmpb   $0x0,(%eax)
80104c0a:	75 f4                	jne    80104c00 <argstr+0x50>
      return s - *pp;
80104c0c:	29 d8                	sub    %ebx,%eax
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104c0e:	5b                   	pop    %ebx
80104c0f:	5e                   	pop    %esi
80104c10:	5d                   	pop    %ebp
80104c11:	c3                   	ret    
80104c12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104c18:	5b                   	pop    %ebx
    return -1;
80104c19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104c1e:	5e                   	pop    %esi
80104c1f:	5d                   	pop    %ebp
80104c20:	c3                   	ret    
80104c21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c2f:	90                   	nop

80104c30 <syscall>:
[SYS_procpgdirinfo]    sys_procpgdirinfo,
};

void
syscall(void)
{
80104c30:	55                   	push   %ebp
80104c31:	89 e5                	mov    %esp,%ebp
80104c33:	53                   	push   %ebx
80104c34:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
80104c37:	e8 04 ef ff ff       	call   80103b40 <myproc>
80104c3c:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
80104c3e:	8b 40 1c             	mov    0x1c(%eax),%eax
80104c41:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104c44:	8d 50 ff             	lea    -0x1(%eax),%edx
80104c47:	83 fa 16             	cmp    $0x16,%edx
80104c4a:	77 24                	ja     80104c70 <syscall+0x40>
80104c4c:	8b 14 85 60 7b 10 80 	mov    -0x7fef84a0(,%eax,4),%edx
80104c53:	85 d2                	test   %edx,%edx
80104c55:	74 19                	je     80104c70 <syscall+0x40>
    curproc->tf->eax = syscalls[num]();
80104c57:	ff d2                	call   *%edx
80104c59:	89 c2                	mov    %eax,%edx
80104c5b:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104c5e:	89 50 1c             	mov    %edx,0x1c(%eax)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104c61:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104c64:	c9                   	leave  
80104c65:	c3                   	ret    
80104c66:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c6d:	8d 76 00             	lea    0x0(%esi),%esi
    cprintf("%d %s: unknown sys call %d\n",
80104c70:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104c71:	8d 43 70             	lea    0x70(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
80104c74:	50                   	push   %eax
80104c75:	ff 73 14             	push   0x14(%ebx)
80104c78:	68 3d 7b 10 80       	push   $0x80107b3d
80104c7d:	e8 1e ba ff ff       	call   801006a0 <cprintf>
    curproc->tf->eax = -1;
80104c82:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104c85:	83 c4 10             	add    $0x10,%esp
80104c88:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
80104c8f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104c92:	c9                   	leave  
80104c93:	c3                   	ret    
80104c94:	66 90                	xchg   %ax,%ax
80104c96:	66 90                	xchg   %ax,%ax
80104c98:	66 90                	xchg   %ax,%ax
80104c9a:	66 90                	xchg   %ax,%ax
80104c9c:	66 90                	xchg   %ax,%ax
80104c9e:	66 90                	xchg   %ax,%ax

80104ca0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104ca0:	55                   	push   %ebp
80104ca1:	89 e5                	mov    %esp,%ebp
80104ca3:	57                   	push   %edi
80104ca4:	56                   	push   %esi
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104ca5:	8d 7d da             	lea    -0x26(%ebp),%edi
{
80104ca8:	53                   	push   %ebx
80104ca9:	83 ec 34             	sub    $0x34,%esp
80104cac:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104caf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if((dp = nameiparent(path, name)) == 0)
80104cb2:	57                   	push   %edi
80104cb3:	50                   	push   %eax
{
80104cb4:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104cb7:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104cba:	e8 01 d4 ff ff       	call   801020c0 <nameiparent>
80104cbf:	83 c4 10             	add    $0x10,%esp
80104cc2:	85 c0                	test   %eax,%eax
80104cc4:	0f 84 46 01 00 00    	je     80104e10 <create+0x170>
    return 0;
  ilock(dp);
80104cca:	83 ec 0c             	sub    $0xc,%esp
80104ccd:	89 c3                	mov    %eax,%ebx
80104ccf:	50                   	push   %eax
80104cd0:	e8 ab ca ff ff       	call   80101780 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
80104cd5:	83 c4 0c             	add    $0xc,%esp
80104cd8:	6a 00                	push   $0x0
80104cda:	57                   	push   %edi
80104cdb:	53                   	push   %ebx
80104cdc:	e8 ff cf ff ff       	call   80101ce0 <dirlookup>
80104ce1:	83 c4 10             	add    $0x10,%esp
80104ce4:	89 c6                	mov    %eax,%esi
80104ce6:	85 c0                	test   %eax,%eax
80104ce8:	74 56                	je     80104d40 <create+0xa0>
    iunlockput(dp);
80104cea:	83 ec 0c             	sub    $0xc,%esp
80104ced:	53                   	push   %ebx
80104cee:	e8 1d cd ff ff       	call   80101a10 <iunlockput>
    ilock(ip);
80104cf3:	89 34 24             	mov    %esi,(%esp)
80104cf6:	e8 85 ca ff ff       	call   80101780 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104cfb:	83 c4 10             	add    $0x10,%esp
80104cfe:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104d03:	75 1b                	jne    80104d20 <create+0x80>
80104d05:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
80104d0a:	75 14                	jne    80104d20 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104d0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104d0f:	89 f0                	mov    %esi,%eax
80104d11:	5b                   	pop    %ebx
80104d12:	5e                   	pop    %esi
80104d13:	5f                   	pop    %edi
80104d14:	5d                   	pop    %ebp
80104d15:	c3                   	ret    
80104d16:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104d1d:	8d 76 00             	lea    0x0(%esi),%esi
    iunlockput(ip);
80104d20:	83 ec 0c             	sub    $0xc,%esp
80104d23:	56                   	push   %esi
    return 0;
80104d24:	31 f6                	xor    %esi,%esi
    iunlockput(ip);
80104d26:	e8 e5 cc ff ff       	call   80101a10 <iunlockput>
    return 0;
80104d2b:	83 c4 10             	add    $0x10,%esp
}
80104d2e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104d31:	89 f0                	mov    %esi,%eax
80104d33:	5b                   	pop    %ebx
80104d34:	5e                   	pop    %esi
80104d35:	5f                   	pop    %edi
80104d36:	5d                   	pop    %ebp
80104d37:	c3                   	ret    
80104d38:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104d3f:	90                   	nop
  if((ip = ialloc(dp->dev, type)) == 0)
80104d40:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104d44:	83 ec 08             	sub    $0x8,%esp
80104d47:	50                   	push   %eax
80104d48:	ff 33                	push   (%ebx)
80104d4a:	e8 c1 c8 ff ff       	call   80101610 <ialloc>
80104d4f:	83 c4 10             	add    $0x10,%esp
80104d52:	89 c6                	mov    %eax,%esi
80104d54:	85 c0                	test   %eax,%eax
80104d56:	0f 84 cd 00 00 00    	je     80104e29 <create+0x189>
  ilock(ip);
80104d5c:	83 ec 0c             	sub    $0xc,%esp
80104d5f:	50                   	push   %eax
80104d60:	e8 1b ca ff ff       	call   80101780 <ilock>
  ip->major = major;
80104d65:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104d69:	66 89 46 52          	mov    %ax,0x52(%esi)
  ip->minor = minor;
80104d6d:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104d71:	66 89 46 54          	mov    %ax,0x54(%esi)
  ip->nlink = 1;
80104d75:	b8 01 00 00 00       	mov    $0x1,%eax
80104d7a:	66 89 46 56          	mov    %ax,0x56(%esi)
  iupdate(ip);
80104d7e:	89 34 24             	mov    %esi,(%esp)
80104d81:	e8 4a c9 ff ff       	call   801016d0 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80104d86:	83 c4 10             	add    $0x10,%esp
80104d89:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80104d8e:	74 30                	je     80104dc0 <create+0x120>
  if(dirlink(dp, name, ip->inum) < 0)
80104d90:	83 ec 04             	sub    $0x4,%esp
80104d93:	ff 76 04             	push   0x4(%esi)
80104d96:	57                   	push   %edi
80104d97:	53                   	push   %ebx
80104d98:	e8 43 d2 ff ff       	call   80101fe0 <dirlink>
80104d9d:	83 c4 10             	add    $0x10,%esp
80104da0:	85 c0                	test   %eax,%eax
80104da2:	78 78                	js     80104e1c <create+0x17c>
  iunlockput(dp);
80104da4:	83 ec 0c             	sub    $0xc,%esp
80104da7:	53                   	push   %ebx
80104da8:	e8 63 cc ff ff       	call   80101a10 <iunlockput>
  return ip;
80104dad:	83 c4 10             	add    $0x10,%esp
}
80104db0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104db3:	89 f0                	mov    %esi,%eax
80104db5:	5b                   	pop    %ebx
80104db6:	5e                   	pop    %esi
80104db7:	5f                   	pop    %edi
80104db8:	5d                   	pop    %ebp
80104db9:	c3                   	ret    
80104dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iupdate(dp);
80104dc0:	83 ec 0c             	sub    $0xc,%esp
    dp->nlink++;  // for ".."
80104dc3:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
    iupdate(dp);
80104dc8:	53                   	push   %ebx
80104dc9:	e8 02 c9 ff ff       	call   801016d0 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104dce:	83 c4 0c             	add    $0xc,%esp
80104dd1:	ff 76 04             	push   0x4(%esi)
80104dd4:	68 dc 7b 10 80       	push   $0x80107bdc
80104dd9:	56                   	push   %esi
80104dda:	e8 01 d2 ff ff       	call   80101fe0 <dirlink>
80104ddf:	83 c4 10             	add    $0x10,%esp
80104de2:	85 c0                	test   %eax,%eax
80104de4:	78 18                	js     80104dfe <create+0x15e>
80104de6:	83 ec 04             	sub    $0x4,%esp
80104de9:	ff 73 04             	push   0x4(%ebx)
80104dec:	68 db 7b 10 80       	push   $0x80107bdb
80104df1:	56                   	push   %esi
80104df2:	e8 e9 d1 ff ff       	call   80101fe0 <dirlink>
80104df7:	83 c4 10             	add    $0x10,%esp
80104dfa:	85 c0                	test   %eax,%eax
80104dfc:	79 92                	jns    80104d90 <create+0xf0>
      panic("create dots");
80104dfe:	83 ec 0c             	sub    $0xc,%esp
80104e01:	68 cf 7b 10 80       	push   $0x80107bcf
80104e06:	e8 75 b5 ff ff       	call   80100380 <panic>
80104e0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104e0f:	90                   	nop
}
80104e10:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
80104e13:	31 f6                	xor    %esi,%esi
}
80104e15:	5b                   	pop    %ebx
80104e16:	89 f0                	mov    %esi,%eax
80104e18:	5e                   	pop    %esi
80104e19:	5f                   	pop    %edi
80104e1a:	5d                   	pop    %ebp
80104e1b:	c3                   	ret    
    panic("create: dirlink");
80104e1c:	83 ec 0c             	sub    $0xc,%esp
80104e1f:	68 de 7b 10 80       	push   $0x80107bde
80104e24:	e8 57 b5 ff ff       	call   80100380 <panic>
    panic("create: ialloc");
80104e29:	83 ec 0c             	sub    $0xc,%esp
80104e2c:	68 c0 7b 10 80       	push   $0x80107bc0
80104e31:	e8 4a b5 ff ff       	call   80100380 <panic>
80104e36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104e3d:	8d 76 00             	lea    0x0(%esi),%esi

80104e40 <sys_dup>:
{
80104e40:	55                   	push   %ebp
80104e41:	89 e5                	mov    %esp,%ebp
80104e43:	56                   	push   %esi
80104e44:	53                   	push   %ebx
  if(argint(n, &fd) < 0)
80104e45:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80104e48:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104e4b:	50                   	push   %eax
80104e4c:	6a 00                	push   $0x0
80104e4e:	e8 9d fc ff ff       	call   80104af0 <argint>
80104e53:	83 c4 10             	add    $0x10,%esp
80104e56:	85 c0                	test   %eax,%eax
80104e58:	78 36                	js     80104e90 <sys_dup+0x50>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104e5a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104e5e:	77 30                	ja     80104e90 <sys_dup+0x50>
80104e60:	e8 db ec ff ff       	call   80103b40 <myproc>
80104e65:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104e68:	8b 74 90 2c          	mov    0x2c(%eax,%edx,4),%esi
80104e6c:	85 f6                	test   %esi,%esi
80104e6e:	74 20                	je     80104e90 <sys_dup+0x50>
  struct proc *curproc = myproc();
80104e70:	e8 cb ec ff ff       	call   80103b40 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
80104e75:	31 db                	xor    %ebx,%ebx
80104e77:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104e7e:	66 90                	xchg   %ax,%ax
    if(curproc->ofile[fd] == 0){
80104e80:	8b 54 98 2c          	mov    0x2c(%eax,%ebx,4),%edx
80104e84:	85 d2                	test   %edx,%edx
80104e86:	74 18                	je     80104ea0 <sys_dup+0x60>
  for(fd = 0; fd < NOFILE; fd++){
80104e88:	83 c3 01             	add    $0x1,%ebx
80104e8b:	83 fb 10             	cmp    $0x10,%ebx
80104e8e:	75 f0                	jne    80104e80 <sys_dup+0x40>
}
80104e90:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
80104e93:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104e98:	89 d8                	mov    %ebx,%eax
80104e9a:	5b                   	pop    %ebx
80104e9b:	5e                   	pop    %esi
80104e9c:	5d                   	pop    %ebp
80104e9d:	c3                   	ret    
80104e9e:	66 90                	xchg   %ax,%ax
  filedup(f);
80104ea0:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
80104ea3:	89 74 98 2c          	mov    %esi,0x2c(%eax,%ebx,4)
  filedup(f);
80104ea7:	56                   	push   %esi
80104ea8:	e8 f3 bf ff ff       	call   80100ea0 <filedup>
  return fd;
80104ead:	83 c4 10             	add    $0x10,%esp
}
80104eb0:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104eb3:	89 d8                	mov    %ebx,%eax
80104eb5:	5b                   	pop    %ebx
80104eb6:	5e                   	pop    %esi
80104eb7:	5d                   	pop    %ebp
80104eb8:	c3                   	ret    
80104eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104ec0 <sys_read>:
{
80104ec0:	55                   	push   %ebp
80104ec1:	89 e5                	mov    %esp,%ebp
80104ec3:	56                   	push   %esi
80104ec4:	53                   	push   %ebx
  if(argint(n, &fd) < 0)
80104ec5:	8d 5d f4             	lea    -0xc(%ebp),%ebx
{
80104ec8:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104ecb:	53                   	push   %ebx
80104ecc:	6a 00                	push   $0x0
80104ece:	e8 1d fc ff ff       	call   80104af0 <argint>
80104ed3:	83 c4 10             	add    $0x10,%esp
80104ed6:	85 c0                	test   %eax,%eax
80104ed8:	78 5e                	js     80104f38 <sys_read+0x78>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104eda:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104ede:	77 58                	ja     80104f38 <sys_read+0x78>
80104ee0:	e8 5b ec ff ff       	call   80103b40 <myproc>
80104ee5:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104ee8:	8b 74 90 2c          	mov    0x2c(%eax,%edx,4),%esi
80104eec:	85 f6                	test   %esi,%esi
80104eee:	74 48                	je     80104f38 <sys_read+0x78>
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104ef0:	83 ec 08             	sub    $0x8,%esp
80104ef3:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104ef6:	50                   	push   %eax
80104ef7:	6a 02                	push   $0x2
80104ef9:	e8 f2 fb ff ff       	call   80104af0 <argint>
80104efe:	83 c4 10             	add    $0x10,%esp
80104f01:	85 c0                	test   %eax,%eax
80104f03:	78 33                	js     80104f38 <sys_read+0x78>
80104f05:	83 ec 04             	sub    $0x4,%esp
80104f08:	ff 75 f0             	push   -0x10(%ebp)
80104f0b:	53                   	push   %ebx
80104f0c:	6a 01                	push   $0x1
80104f0e:	e8 2d fc ff ff       	call   80104b40 <argptr>
80104f13:	83 c4 10             	add    $0x10,%esp
80104f16:	85 c0                	test   %eax,%eax
80104f18:	78 1e                	js     80104f38 <sys_read+0x78>
  return fileread(f, p, n);
80104f1a:	83 ec 04             	sub    $0x4,%esp
80104f1d:	ff 75 f0             	push   -0x10(%ebp)
80104f20:	ff 75 f4             	push   -0xc(%ebp)
80104f23:	56                   	push   %esi
80104f24:	e8 f7 c0 ff ff       	call   80101020 <fileread>
80104f29:	83 c4 10             	add    $0x10,%esp
}
80104f2c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104f2f:	5b                   	pop    %ebx
80104f30:	5e                   	pop    %esi
80104f31:	5d                   	pop    %ebp
80104f32:	c3                   	ret    
80104f33:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104f37:	90                   	nop
    return -1;
80104f38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f3d:	eb ed                	jmp    80104f2c <sys_read+0x6c>
80104f3f:	90                   	nop

80104f40 <sys_write>:
{
80104f40:	55                   	push   %ebp
80104f41:	89 e5                	mov    %esp,%ebp
80104f43:	56                   	push   %esi
80104f44:	53                   	push   %ebx
  if(argint(n, &fd) < 0)
80104f45:	8d 5d f4             	lea    -0xc(%ebp),%ebx
{
80104f48:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104f4b:	53                   	push   %ebx
80104f4c:	6a 00                	push   $0x0
80104f4e:	e8 9d fb ff ff       	call   80104af0 <argint>
80104f53:	83 c4 10             	add    $0x10,%esp
80104f56:	85 c0                	test   %eax,%eax
80104f58:	78 5e                	js     80104fb8 <sys_write+0x78>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104f5a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104f5e:	77 58                	ja     80104fb8 <sys_write+0x78>
80104f60:	e8 db eb ff ff       	call   80103b40 <myproc>
80104f65:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104f68:	8b 74 90 2c          	mov    0x2c(%eax,%edx,4),%esi
80104f6c:	85 f6                	test   %esi,%esi
80104f6e:	74 48                	je     80104fb8 <sys_write+0x78>
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104f70:	83 ec 08             	sub    $0x8,%esp
80104f73:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104f76:	50                   	push   %eax
80104f77:	6a 02                	push   $0x2
80104f79:	e8 72 fb ff ff       	call   80104af0 <argint>
80104f7e:	83 c4 10             	add    $0x10,%esp
80104f81:	85 c0                	test   %eax,%eax
80104f83:	78 33                	js     80104fb8 <sys_write+0x78>
80104f85:	83 ec 04             	sub    $0x4,%esp
80104f88:	ff 75 f0             	push   -0x10(%ebp)
80104f8b:	53                   	push   %ebx
80104f8c:	6a 01                	push   $0x1
80104f8e:	e8 ad fb ff ff       	call   80104b40 <argptr>
80104f93:	83 c4 10             	add    $0x10,%esp
80104f96:	85 c0                	test   %eax,%eax
80104f98:	78 1e                	js     80104fb8 <sys_write+0x78>
  return filewrite(f, p, n);
80104f9a:	83 ec 04             	sub    $0x4,%esp
80104f9d:	ff 75 f0             	push   -0x10(%ebp)
80104fa0:	ff 75 f4             	push   -0xc(%ebp)
80104fa3:	56                   	push   %esi
80104fa4:	e8 07 c1 ff ff       	call   801010b0 <filewrite>
80104fa9:	83 c4 10             	add    $0x10,%esp
}
80104fac:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104faf:	5b                   	pop    %ebx
80104fb0:	5e                   	pop    %esi
80104fb1:	5d                   	pop    %ebp
80104fb2:	c3                   	ret    
80104fb3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104fb7:	90                   	nop
    return -1;
80104fb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fbd:	eb ed                	jmp    80104fac <sys_write+0x6c>
80104fbf:	90                   	nop

80104fc0 <sys_close>:
{
80104fc0:	55                   	push   %ebp
80104fc1:	89 e5                	mov    %esp,%ebp
80104fc3:	56                   	push   %esi
80104fc4:	53                   	push   %ebx
  if(argint(n, &fd) < 0)
80104fc5:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80104fc8:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
80104fcb:	50                   	push   %eax
80104fcc:	6a 00                	push   $0x0
80104fce:	e8 1d fb ff ff       	call   80104af0 <argint>
80104fd3:	83 c4 10             	add    $0x10,%esp
80104fd6:	85 c0                	test   %eax,%eax
80104fd8:	78 3e                	js     80105018 <sys_close+0x58>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104fda:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104fde:	77 38                	ja     80105018 <sys_close+0x58>
80104fe0:	e8 5b eb ff ff       	call   80103b40 <myproc>
80104fe5:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104fe8:	8d 5a 08             	lea    0x8(%edx),%ebx
80104feb:	8b 74 98 0c          	mov    0xc(%eax,%ebx,4),%esi
80104fef:	85 f6                	test   %esi,%esi
80104ff1:	74 25                	je     80105018 <sys_close+0x58>
  myproc()->ofile[fd] = 0;
80104ff3:	e8 48 eb ff ff       	call   80103b40 <myproc>
  fileclose(f);
80104ff8:	83 ec 0c             	sub    $0xc,%esp
  myproc()->ofile[fd] = 0;
80104ffb:	c7 44 98 0c 00 00 00 	movl   $0x0,0xc(%eax,%ebx,4)
80105002:	00 
  fileclose(f);
80105003:	56                   	push   %esi
80105004:	e8 e7 be ff ff       	call   80100ef0 <fileclose>
  return 0;
80105009:	83 c4 10             	add    $0x10,%esp
8010500c:	31 c0                	xor    %eax,%eax
}
8010500e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105011:	5b                   	pop    %ebx
80105012:	5e                   	pop    %esi
80105013:	5d                   	pop    %ebp
80105014:	c3                   	ret    
80105015:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80105018:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010501d:	eb ef                	jmp    8010500e <sys_close+0x4e>
8010501f:	90                   	nop

80105020 <sys_fstat>:
{
80105020:	55                   	push   %ebp
80105021:	89 e5                	mov    %esp,%ebp
80105023:	56                   	push   %esi
80105024:	53                   	push   %ebx
  if(argint(n, &fd) < 0)
80105025:	8d 5d f4             	lea    -0xc(%ebp),%ebx
{
80105028:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
8010502b:	53                   	push   %ebx
8010502c:	6a 00                	push   $0x0
8010502e:	e8 bd fa ff ff       	call   80104af0 <argint>
80105033:	83 c4 10             	add    $0x10,%esp
80105036:	85 c0                	test   %eax,%eax
80105038:	78 46                	js     80105080 <sys_fstat+0x60>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
8010503a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010503e:	77 40                	ja     80105080 <sys_fstat+0x60>
80105040:	e8 fb ea ff ff       	call   80103b40 <myproc>
80105045:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105048:	8b 74 90 2c          	mov    0x2c(%eax,%edx,4),%esi
8010504c:	85 f6                	test   %esi,%esi
8010504e:	74 30                	je     80105080 <sys_fstat+0x60>
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80105050:	83 ec 04             	sub    $0x4,%esp
80105053:	6a 14                	push   $0x14
80105055:	53                   	push   %ebx
80105056:	6a 01                	push   $0x1
80105058:	e8 e3 fa ff ff       	call   80104b40 <argptr>
8010505d:	83 c4 10             	add    $0x10,%esp
80105060:	85 c0                	test   %eax,%eax
80105062:	78 1c                	js     80105080 <sys_fstat+0x60>
  return filestat(f, st);
80105064:	83 ec 08             	sub    $0x8,%esp
80105067:	ff 75 f4             	push   -0xc(%ebp)
8010506a:	56                   	push   %esi
8010506b:	e8 60 bf ff ff       	call   80100fd0 <filestat>
80105070:	83 c4 10             	add    $0x10,%esp
}
80105073:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105076:	5b                   	pop    %ebx
80105077:	5e                   	pop    %esi
80105078:	5d                   	pop    %ebp
80105079:	c3                   	ret    
8010507a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105080:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105085:	eb ec                	jmp    80105073 <sys_fstat+0x53>
80105087:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010508e:	66 90                	xchg   %ax,%ax

80105090 <sys_link>:
{
80105090:	55                   	push   %ebp
80105091:	89 e5                	mov    %esp,%ebp
80105093:	57                   	push   %edi
80105094:	56                   	push   %esi
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80105095:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80105098:	53                   	push   %ebx
80105099:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
8010509c:	50                   	push   %eax
8010509d:	6a 00                	push   $0x0
8010509f:	e8 0c fb ff ff       	call   80104bb0 <argstr>
801050a4:	83 c4 10             	add    $0x10,%esp
801050a7:	85 c0                	test   %eax,%eax
801050a9:	0f 88 fb 00 00 00    	js     801051aa <sys_link+0x11a>
801050af:	83 ec 08             	sub    $0x8,%esp
801050b2:	8d 45 d0             	lea    -0x30(%ebp),%eax
801050b5:	50                   	push   %eax
801050b6:	6a 01                	push   $0x1
801050b8:	e8 f3 fa ff ff       	call   80104bb0 <argstr>
801050bd:	83 c4 10             	add    $0x10,%esp
801050c0:	85 c0                	test   %eax,%eax
801050c2:	0f 88 e2 00 00 00    	js     801051aa <sys_link+0x11a>
  begin_op();
801050c8:	e8 63 de ff ff       	call   80102f30 <begin_op>
  if((ip = namei(old)) == 0){
801050cd:	83 ec 0c             	sub    $0xc,%esp
801050d0:	ff 75 d4             	push   -0x2c(%ebp)
801050d3:	e8 c8 cf ff ff       	call   801020a0 <namei>
801050d8:	83 c4 10             	add    $0x10,%esp
801050db:	89 c3                	mov    %eax,%ebx
801050dd:	85 c0                	test   %eax,%eax
801050df:	0f 84 e4 00 00 00    	je     801051c9 <sys_link+0x139>
  ilock(ip);
801050e5:	83 ec 0c             	sub    $0xc,%esp
801050e8:	50                   	push   %eax
801050e9:	e8 92 c6 ff ff       	call   80101780 <ilock>
  if(ip->type == T_DIR){
801050ee:	83 c4 10             	add    $0x10,%esp
801050f1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801050f6:	0f 84 b5 00 00 00    	je     801051b1 <sys_link+0x121>
  iupdate(ip);
801050fc:	83 ec 0c             	sub    $0xc,%esp
  ip->nlink++;
801050ff:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  if((dp = nameiparent(new, name)) == 0)
80105104:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80105107:	53                   	push   %ebx
80105108:	e8 c3 c5 ff ff       	call   801016d0 <iupdate>
  iunlock(ip);
8010510d:	89 1c 24             	mov    %ebx,(%esp)
80105110:	e8 4b c7 ff ff       	call   80101860 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80105115:	58                   	pop    %eax
80105116:	5a                   	pop    %edx
80105117:	57                   	push   %edi
80105118:	ff 75 d0             	push   -0x30(%ebp)
8010511b:	e8 a0 cf ff ff       	call   801020c0 <nameiparent>
80105120:	83 c4 10             	add    $0x10,%esp
80105123:	89 c6                	mov    %eax,%esi
80105125:	85 c0                	test   %eax,%eax
80105127:	74 5b                	je     80105184 <sys_link+0xf4>
  ilock(dp);
80105129:	83 ec 0c             	sub    $0xc,%esp
8010512c:	50                   	push   %eax
8010512d:	e8 4e c6 ff ff       	call   80101780 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80105132:	8b 03                	mov    (%ebx),%eax
80105134:	83 c4 10             	add    $0x10,%esp
80105137:	39 06                	cmp    %eax,(%esi)
80105139:	75 3d                	jne    80105178 <sys_link+0xe8>
8010513b:	83 ec 04             	sub    $0x4,%esp
8010513e:	ff 73 04             	push   0x4(%ebx)
80105141:	57                   	push   %edi
80105142:	56                   	push   %esi
80105143:	e8 98 ce ff ff       	call   80101fe0 <dirlink>
80105148:	83 c4 10             	add    $0x10,%esp
8010514b:	85 c0                	test   %eax,%eax
8010514d:	78 29                	js     80105178 <sys_link+0xe8>
  iunlockput(dp);
8010514f:	83 ec 0c             	sub    $0xc,%esp
80105152:	56                   	push   %esi
80105153:	e8 b8 c8 ff ff       	call   80101a10 <iunlockput>
  iput(ip);
80105158:	89 1c 24             	mov    %ebx,(%esp)
8010515b:	e8 50 c7 ff ff       	call   801018b0 <iput>
  end_op();
80105160:	e8 3b de ff ff       	call   80102fa0 <end_op>
  return 0;
80105165:	83 c4 10             	add    $0x10,%esp
80105168:	31 c0                	xor    %eax,%eax
}
8010516a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010516d:	5b                   	pop    %ebx
8010516e:	5e                   	pop    %esi
8010516f:	5f                   	pop    %edi
80105170:	5d                   	pop    %ebp
80105171:	c3                   	ret    
80105172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
80105178:	83 ec 0c             	sub    $0xc,%esp
8010517b:	56                   	push   %esi
8010517c:	e8 8f c8 ff ff       	call   80101a10 <iunlockput>
    goto bad;
80105181:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80105184:	83 ec 0c             	sub    $0xc,%esp
80105187:	53                   	push   %ebx
80105188:	e8 f3 c5 ff ff       	call   80101780 <ilock>
  ip->nlink--;
8010518d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105192:	89 1c 24             	mov    %ebx,(%esp)
80105195:	e8 36 c5 ff ff       	call   801016d0 <iupdate>
  iunlockput(ip);
8010519a:	89 1c 24             	mov    %ebx,(%esp)
8010519d:	e8 6e c8 ff ff       	call   80101a10 <iunlockput>
  end_op();
801051a2:	e8 f9 dd ff ff       	call   80102fa0 <end_op>
  return -1;
801051a7:	83 c4 10             	add    $0x10,%esp
801051aa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051af:	eb b9                	jmp    8010516a <sys_link+0xda>
    iunlockput(ip);
801051b1:	83 ec 0c             	sub    $0xc,%esp
801051b4:	53                   	push   %ebx
801051b5:	e8 56 c8 ff ff       	call   80101a10 <iunlockput>
    end_op();
801051ba:	e8 e1 dd ff ff       	call   80102fa0 <end_op>
    return -1;
801051bf:	83 c4 10             	add    $0x10,%esp
801051c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051c7:	eb a1                	jmp    8010516a <sys_link+0xda>
    end_op();
801051c9:	e8 d2 dd ff ff       	call   80102fa0 <end_op>
    return -1;
801051ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051d3:	eb 95                	jmp    8010516a <sys_link+0xda>
801051d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801051dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801051e0 <sys_unlink>:
{
801051e0:	55                   	push   %ebp
801051e1:	89 e5                	mov    %esp,%ebp
801051e3:	57                   	push   %edi
801051e4:	56                   	push   %esi
  if(argstr(0, &path) < 0)
801051e5:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
801051e8:	53                   	push   %ebx
801051e9:	83 ec 54             	sub    $0x54,%esp
  if(argstr(0, &path) < 0)
801051ec:	50                   	push   %eax
801051ed:	6a 00                	push   $0x0
801051ef:	e8 bc f9 ff ff       	call   80104bb0 <argstr>
801051f4:	83 c4 10             	add    $0x10,%esp
801051f7:	85 c0                	test   %eax,%eax
801051f9:	0f 88 7a 01 00 00    	js     80105379 <sys_unlink+0x199>
  begin_op();
801051ff:	e8 2c dd ff ff       	call   80102f30 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80105204:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80105207:	83 ec 08             	sub    $0x8,%esp
8010520a:	53                   	push   %ebx
8010520b:	ff 75 c0             	push   -0x40(%ebp)
8010520e:	e8 ad ce ff ff       	call   801020c0 <nameiparent>
80105213:	83 c4 10             	add    $0x10,%esp
80105216:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80105219:	85 c0                	test   %eax,%eax
8010521b:	0f 84 62 01 00 00    	je     80105383 <sys_unlink+0x1a3>
  ilock(dp);
80105221:	8b 7d b4             	mov    -0x4c(%ebp),%edi
80105224:	83 ec 0c             	sub    $0xc,%esp
80105227:	57                   	push   %edi
80105228:	e8 53 c5 ff ff       	call   80101780 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
8010522d:	58                   	pop    %eax
8010522e:	5a                   	pop    %edx
8010522f:	68 dc 7b 10 80       	push   $0x80107bdc
80105234:	53                   	push   %ebx
80105235:	e8 86 ca ff ff       	call   80101cc0 <namecmp>
8010523a:	83 c4 10             	add    $0x10,%esp
8010523d:	85 c0                	test   %eax,%eax
8010523f:	0f 84 fb 00 00 00    	je     80105340 <sys_unlink+0x160>
80105245:	83 ec 08             	sub    $0x8,%esp
80105248:	68 db 7b 10 80       	push   $0x80107bdb
8010524d:	53                   	push   %ebx
8010524e:	e8 6d ca ff ff       	call   80101cc0 <namecmp>
80105253:	83 c4 10             	add    $0x10,%esp
80105256:	85 c0                	test   %eax,%eax
80105258:	0f 84 e2 00 00 00    	je     80105340 <sys_unlink+0x160>
  if((ip = dirlookup(dp, name, &off)) == 0)
8010525e:	83 ec 04             	sub    $0x4,%esp
80105261:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80105264:	50                   	push   %eax
80105265:	53                   	push   %ebx
80105266:	57                   	push   %edi
80105267:	e8 74 ca ff ff       	call   80101ce0 <dirlookup>
8010526c:	83 c4 10             	add    $0x10,%esp
8010526f:	89 c3                	mov    %eax,%ebx
80105271:	85 c0                	test   %eax,%eax
80105273:	0f 84 c7 00 00 00    	je     80105340 <sys_unlink+0x160>
  ilock(ip);
80105279:	83 ec 0c             	sub    $0xc,%esp
8010527c:	50                   	push   %eax
8010527d:	e8 fe c4 ff ff       	call   80101780 <ilock>
  if(ip->nlink < 1)
80105282:	83 c4 10             	add    $0x10,%esp
80105285:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010528a:	0f 8e 1c 01 00 00    	jle    801053ac <sys_unlink+0x1cc>
  if(ip->type == T_DIR && !isdirempty(ip)){
80105290:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105295:	8d 7d d8             	lea    -0x28(%ebp),%edi
80105298:	74 66                	je     80105300 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
8010529a:	83 ec 04             	sub    $0x4,%esp
8010529d:	6a 10                	push   $0x10
8010529f:	6a 00                	push   $0x0
801052a1:	57                   	push   %edi
801052a2:	e8 89 f5 ff ff       	call   80104830 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801052a7:	6a 10                	push   $0x10
801052a9:	ff 75 c4             	push   -0x3c(%ebp)
801052ac:	57                   	push   %edi
801052ad:	ff 75 b4             	push   -0x4c(%ebp)
801052b0:	e8 db c8 ff ff       	call   80101b90 <writei>
801052b5:	83 c4 20             	add    $0x20,%esp
801052b8:	83 f8 10             	cmp    $0x10,%eax
801052bb:	0f 85 de 00 00 00    	jne    8010539f <sys_unlink+0x1bf>
  if(ip->type == T_DIR){
801052c1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801052c6:	0f 84 94 00 00 00    	je     80105360 <sys_unlink+0x180>
  iunlockput(dp);
801052cc:	83 ec 0c             	sub    $0xc,%esp
801052cf:	ff 75 b4             	push   -0x4c(%ebp)
801052d2:	e8 39 c7 ff ff       	call   80101a10 <iunlockput>
  ip->nlink--;
801052d7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
801052dc:	89 1c 24             	mov    %ebx,(%esp)
801052df:	e8 ec c3 ff ff       	call   801016d0 <iupdate>
  iunlockput(ip);
801052e4:	89 1c 24             	mov    %ebx,(%esp)
801052e7:	e8 24 c7 ff ff       	call   80101a10 <iunlockput>
  end_op();
801052ec:	e8 af dc ff ff       	call   80102fa0 <end_op>
  return 0;
801052f1:	83 c4 10             	add    $0x10,%esp
801052f4:	31 c0                	xor    %eax,%eax
}
801052f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801052f9:	5b                   	pop    %ebx
801052fa:	5e                   	pop    %esi
801052fb:	5f                   	pop    %edi
801052fc:	5d                   	pop    %ebp
801052fd:	c3                   	ret    
801052fe:	66 90                	xchg   %ax,%ax
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105300:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105304:	76 94                	jbe    8010529a <sys_unlink+0xba>
80105306:	be 20 00 00 00       	mov    $0x20,%esi
8010530b:	eb 0b                	jmp    80105318 <sys_unlink+0x138>
8010530d:	8d 76 00             	lea    0x0(%esi),%esi
80105310:	83 c6 10             	add    $0x10,%esi
80105313:	3b 73 58             	cmp    0x58(%ebx),%esi
80105316:	73 82                	jae    8010529a <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105318:	6a 10                	push   $0x10
8010531a:	56                   	push   %esi
8010531b:	57                   	push   %edi
8010531c:	53                   	push   %ebx
8010531d:	e8 6e c7 ff ff       	call   80101a90 <readi>
80105322:	83 c4 10             	add    $0x10,%esp
80105325:	83 f8 10             	cmp    $0x10,%eax
80105328:	75 68                	jne    80105392 <sys_unlink+0x1b2>
    if(de.inum != 0)
8010532a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
8010532f:	74 df                	je     80105310 <sys_unlink+0x130>
    iunlockput(ip);
80105331:	83 ec 0c             	sub    $0xc,%esp
80105334:	53                   	push   %ebx
80105335:	e8 d6 c6 ff ff       	call   80101a10 <iunlockput>
    goto bad;
8010533a:	83 c4 10             	add    $0x10,%esp
8010533d:	8d 76 00             	lea    0x0(%esi),%esi
  iunlockput(dp);
80105340:	83 ec 0c             	sub    $0xc,%esp
80105343:	ff 75 b4             	push   -0x4c(%ebp)
80105346:	e8 c5 c6 ff ff       	call   80101a10 <iunlockput>
  end_op();
8010534b:	e8 50 dc ff ff       	call   80102fa0 <end_op>
  return -1;
80105350:	83 c4 10             	add    $0x10,%esp
80105353:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105358:	eb 9c                	jmp    801052f6 <sys_unlink+0x116>
8010535a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    dp->nlink--;
80105360:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
80105363:	83 ec 0c             	sub    $0xc,%esp
    dp->nlink--;
80105366:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
8010536b:	50                   	push   %eax
8010536c:	e8 5f c3 ff ff       	call   801016d0 <iupdate>
80105371:	83 c4 10             	add    $0x10,%esp
80105374:	e9 53 ff ff ff       	jmp    801052cc <sys_unlink+0xec>
    return -1;
80105379:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010537e:	e9 73 ff ff ff       	jmp    801052f6 <sys_unlink+0x116>
    end_op();
80105383:	e8 18 dc ff ff       	call   80102fa0 <end_op>
    return -1;
80105388:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010538d:	e9 64 ff ff ff       	jmp    801052f6 <sys_unlink+0x116>
      panic("isdirempty: readi");
80105392:	83 ec 0c             	sub    $0xc,%esp
80105395:	68 00 7c 10 80       	push   $0x80107c00
8010539a:	e8 e1 af ff ff       	call   80100380 <panic>
    panic("unlink: writei");
8010539f:	83 ec 0c             	sub    $0xc,%esp
801053a2:	68 12 7c 10 80       	push   $0x80107c12
801053a7:	e8 d4 af ff ff       	call   80100380 <panic>
    panic("unlink: nlink < 1");
801053ac:	83 ec 0c             	sub    $0xc,%esp
801053af:	68 ee 7b 10 80       	push   $0x80107bee
801053b4:	e8 c7 af ff ff       	call   80100380 <panic>
801053b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801053c0 <sys_open>:

int
sys_open(void)
{
801053c0:	55                   	push   %ebp
801053c1:	89 e5                	mov    %esp,%ebp
801053c3:	57                   	push   %edi
801053c4:	56                   	push   %esi
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801053c5:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
801053c8:	53                   	push   %ebx
801053c9:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801053cc:	50                   	push   %eax
801053cd:	6a 00                	push   $0x0
801053cf:	e8 dc f7 ff ff       	call   80104bb0 <argstr>
801053d4:	83 c4 10             	add    $0x10,%esp
801053d7:	85 c0                	test   %eax,%eax
801053d9:	0f 88 8e 00 00 00    	js     8010546d <sys_open+0xad>
801053df:	83 ec 08             	sub    $0x8,%esp
801053e2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801053e5:	50                   	push   %eax
801053e6:	6a 01                	push   $0x1
801053e8:	e8 03 f7 ff ff       	call   80104af0 <argint>
801053ed:	83 c4 10             	add    $0x10,%esp
801053f0:	85 c0                	test   %eax,%eax
801053f2:	78 79                	js     8010546d <sys_open+0xad>
    return -1;

  begin_op();
801053f4:	e8 37 db ff ff       	call   80102f30 <begin_op>

  if(omode & O_CREATE){
801053f9:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
801053fd:	75 79                	jne    80105478 <sys_open+0xb8>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
801053ff:	83 ec 0c             	sub    $0xc,%esp
80105402:	ff 75 e0             	push   -0x20(%ebp)
80105405:	e8 96 cc ff ff       	call   801020a0 <namei>
8010540a:	83 c4 10             	add    $0x10,%esp
8010540d:	89 c6                	mov    %eax,%esi
8010540f:	85 c0                	test   %eax,%eax
80105411:	0f 84 7e 00 00 00    	je     80105495 <sys_open+0xd5>
      end_op();
      return -1;
    }
    ilock(ip);
80105417:	83 ec 0c             	sub    $0xc,%esp
8010541a:	50                   	push   %eax
8010541b:	e8 60 c3 ff ff       	call   80101780 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105420:	83 c4 10             	add    $0x10,%esp
80105423:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105428:	0f 84 c2 00 00 00    	je     801054f0 <sys_open+0x130>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
8010542e:	e8 fd b9 ff ff       	call   80100e30 <filealloc>
80105433:	89 c7                	mov    %eax,%edi
80105435:	85 c0                	test   %eax,%eax
80105437:	74 23                	je     8010545c <sys_open+0x9c>
  struct proc *curproc = myproc();
80105439:	e8 02 e7 ff ff       	call   80103b40 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
8010543e:	31 db                	xor    %ebx,%ebx
    if(curproc->ofile[fd] == 0){
80105440:	8b 54 98 2c          	mov    0x2c(%eax,%ebx,4),%edx
80105444:	85 d2                	test   %edx,%edx
80105446:	74 60                	je     801054a8 <sys_open+0xe8>
  for(fd = 0; fd < NOFILE; fd++){
80105448:	83 c3 01             	add    $0x1,%ebx
8010544b:	83 fb 10             	cmp    $0x10,%ebx
8010544e:	75 f0                	jne    80105440 <sys_open+0x80>
    if(f)
      fileclose(f);
80105450:	83 ec 0c             	sub    $0xc,%esp
80105453:	57                   	push   %edi
80105454:	e8 97 ba ff ff       	call   80100ef0 <fileclose>
80105459:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
8010545c:	83 ec 0c             	sub    $0xc,%esp
8010545f:	56                   	push   %esi
80105460:	e8 ab c5 ff ff       	call   80101a10 <iunlockput>
    end_op();
80105465:	e8 36 db ff ff       	call   80102fa0 <end_op>
    return -1;
8010546a:	83 c4 10             	add    $0x10,%esp
8010546d:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105472:	eb 6d                	jmp    801054e1 <sys_open+0x121>
80105474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ip = create(path, T_FILE, 0, 0);
80105478:	83 ec 0c             	sub    $0xc,%esp
8010547b:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010547e:	31 c9                	xor    %ecx,%ecx
80105480:	ba 02 00 00 00       	mov    $0x2,%edx
80105485:	6a 00                	push   $0x0
80105487:	e8 14 f8 ff ff       	call   80104ca0 <create>
    if(ip == 0){
8010548c:	83 c4 10             	add    $0x10,%esp
    ip = create(path, T_FILE, 0, 0);
8010548f:	89 c6                	mov    %eax,%esi
    if(ip == 0){
80105491:	85 c0                	test   %eax,%eax
80105493:	75 99                	jne    8010542e <sys_open+0x6e>
      end_op();
80105495:	e8 06 db ff ff       	call   80102fa0 <end_op>
      return -1;
8010549a:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010549f:	eb 40                	jmp    801054e1 <sys_open+0x121>
801054a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }
  iunlock(ip);
801054a8:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
801054ab:	89 7c 98 2c          	mov    %edi,0x2c(%eax,%ebx,4)
  iunlock(ip);
801054af:	56                   	push   %esi
801054b0:	e8 ab c3 ff ff       	call   80101860 <iunlock>
  end_op();
801054b5:	e8 e6 da ff ff       	call   80102fa0 <end_op>

  f->type = FD_INODE;
801054ba:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801054c0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801054c3:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
801054c6:	89 77 10             	mov    %esi,0x10(%edi)
  f->readable = !(omode & O_WRONLY);
801054c9:	89 d0                	mov    %edx,%eax
  f->off = 0;
801054cb:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
801054d2:	f7 d0                	not    %eax
801054d4:	83 e0 01             	and    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801054d7:	83 e2 03             	and    $0x3,%edx
  f->readable = !(omode & O_WRONLY);
801054da:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801054dd:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
801054e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054e4:	89 d8                	mov    %ebx,%eax
801054e6:	5b                   	pop    %ebx
801054e7:	5e                   	pop    %esi
801054e8:	5f                   	pop    %edi
801054e9:	5d                   	pop    %ebp
801054ea:	c3                   	ret    
801054eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801054ef:	90                   	nop
    if(ip->type == T_DIR && omode != O_RDONLY){
801054f0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801054f3:	85 c9                	test   %ecx,%ecx
801054f5:	0f 84 33 ff ff ff    	je     8010542e <sys_open+0x6e>
801054fb:	e9 5c ff ff ff       	jmp    8010545c <sys_open+0x9c>

80105500 <sys_mkdir>:

int
sys_mkdir(void)
{
80105500:	55                   	push   %ebp
80105501:	89 e5                	mov    %esp,%ebp
80105503:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105506:	e8 25 da ff ff       	call   80102f30 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010550b:	83 ec 08             	sub    $0x8,%esp
8010550e:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105511:	50                   	push   %eax
80105512:	6a 00                	push   $0x0
80105514:	e8 97 f6 ff ff       	call   80104bb0 <argstr>
80105519:	83 c4 10             	add    $0x10,%esp
8010551c:	85 c0                	test   %eax,%eax
8010551e:	78 30                	js     80105550 <sys_mkdir+0x50>
80105520:	83 ec 0c             	sub    $0xc,%esp
80105523:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105526:	31 c9                	xor    %ecx,%ecx
80105528:	ba 01 00 00 00       	mov    $0x1,%edx
8010552d:	6a 00                	push   $0x0
8010552f:	e8 6c f7 ff ff       	call   80104ca0 <create>
80105534:	83 c4 10             	add    $0x10,%esp
80105537:	85 c0                	test   %eax,%eax
80105539:	74 15                	je     80105550 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010553b:	83 ec 0c             	sub    $0xc,%esp
8010553e:	50                   	push   %eax
8010553f:	e8 cc c4 ff ff       	call   80101a10 <iunlockput>
  end_op();
80105544:	e8 57 da ff ff       	call   80102fa0 <end_op>
  return 0;
80105549:	83 c4 10             	add    $0x10,%esp
8010554c:	31 c0                	xor    %eax,%eax
}
8010554e:	c9                   	leave  
8010554f:	c3                   	ret    
    end_op();
80105550:	e8 4b da ff ff       	call   80102fa0 <end_op>
    return -1;
80105555:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010555a:	c9                   	leave  
8010555b:	c3                   	ret    
8010555c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105560 <sys_mknod>:

int
sys_mknod(void)
{
80105560:	55                   	push   %ebp
80105561:	89 e5                	mov    %esp,%ebp
80105563:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105566:	e8 c5 d9 ff ff       	call   80102f30 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010556b:	83 ec 08             	sub    $0x8,%esp
8010556e:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105571:	50                   	push   %eax
80105572:	6a 00                	push   $0x0
80105574:	e8 37 f6 ff ff       	call   80104bb0 <argstr>
80105579:	83 c4 10             	add    $0x10,%esp
8010557c:	85 c0                	test   %eax,%eax
8010557e:	78 60                	js     801055e0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105580:	83 ec 08             	sub    $0x8,%esp
80105583:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105586:	50                   	push   %eax
80105587:	6a 01                	push   $0x1
80105589:	e8 62 f5 ff ff       	call   80104af0 <argint>
  if((argstr(0, &path)) < 0 ||
8010558e:	83 c4 10             	add    $0x10,%esp
80105591:	85 c0                	test   %eax,%eax
80105593:	78 4b                	js     801055e0 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80105595:	83 ec 08             	sub    $0x8,%esp
80105598:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010559b:	50                   	push   %eax
8010559c:	6a 02                	push   $0x2
8010559e:	e8 4d f5 ff ff       	call   80104af0 <argint>
     argint(1, &major) < 0 ||
801055a3:	83 c4 10             	add    $0x10,%esp
801055a6:	85 c0                	test   %eax,%eax
801055a8:	78 36                	js     801055e0 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
801055aa:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801055ae:	83 ec 0c             	sub    $0xc,%esp
801055b1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801055b5:	ba 03 00 00 00       	mov    $0x3,%edx
801055ba:	50                   	push   %eax
801055bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801055be:	e8 dd f6 ff ff       	call   80104ca0 <create>
     argint(2, &minor) < 0 ||
801055c3:	83 c4 10             	add    $0x10,%esp
801055c6:	85 c0                	test   %eax,%eax
801055c8:	74 16                	je     801055e0 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
801055ca:	83 ec 0c             	sub    $0xc,%esp
801055cd:	50                   	push   %eax
801055ce:	e8 3d c4 ff ff       	call   80101a10 <iunlockput>
  end_op();
801055d3:	e8 c8 d9 ff ff       	call   80102fa0 <end_op>
  return 0;
801055d8:	83 c4 10             	add    $0x10,%esp
801055db:	31 c0                	xor    %eax,%eax
}
801055dd:	c9                   	leave  
801055de:	c3                   	ret    
801055df:	90                   	nop
    end_op();
801055e0:	e8 bb d9 ff ff       	call   80102fa0 <end_op>
    return -1;
801055e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801055ea:	c9                   	leave  
801055eb:	c3                   	ret    
801055ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801055f0 <sys_chdir>:

int
sys_chdir(void)
{
801055f0:	55                   	push   %ebp
801055f1:	89 e5                	mov    %esp,%ebp
801055f3:	56                   	push   %esi
801055f4:	53                   	push   %ebx
801055f5:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
801055f8:	e8 43 e5 ff ff       	call   80103b40 <myproc>
801055fd:	89 c6                	mov    %eax,%esi
  
  begin_op();
801055ff:	e8 2c d9 ff ff       	call   80102f30 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80105604:	83 ec 08             	sub    $0x8,%esp
80105607:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010560a:	50                   	push   %eax
8010560b:	6a 00                	push   $0x0
8010560d:	e8 9e f5 ff ff       	call   80104bb0 <argstr>
80105612:	83 c4 10             	add    $0x10,%esp
80105615:	85 c0                	test   %eax,%eax
80105617:	78 77                	js     80105690 <sys_chdir+0xa0>
80105619:	83 ec 0c             	sub    $0xc,%esp
8010561c:	ff 75 f4             	push   -0xc(%ebp)
8010561f:	e8 7c ca ff ff       	call   801020a0 <namei>
80105624:	83 c4 10             	add    $0x10,%esp
80105627:	89 c3                	mov    %eax,%ebx
80105629:	85 c0                	test   %eax,%eax
8010562b:	74 63                	je     80105690 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
8010562d:	83 ec 0c             	sub    $0xc,%esp
80105630:	50                   	push   %eax
80105631:	e8 4a c1 ff ff       	call   80101780 <ilock>
  if(ip->type != T_DIR){
80105636:	83 c4 10             	add    $0x10,%esp
80105639:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010563e:	75 30                	jne    80105670 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105640:	83 ec 0c             	sub    $0xc,%esp
80105643:	53                   	push   %ebx
80105644:	e8 17 c2 ff ff       	call   80101860 <iunlock>
  iput(curproc->cwd);
80105649:	58                   	pop    %eax
8010564a:	ff 76 6c             	push   0x6c(%esi)
8010564d:	e8 5e c2 ff ff       	call   801018b0 <iput>
  end_op();
80105652:	e8 49 d9 ff ff       	call   80102fa0 <end_op>
  curproc->cwd = ip;
80105657:	89 5e 6c             	mov    %ebx,0x6c(%esi)
  return 0;
8010565a:	83 c4 10             	add    $0x10,%esp
8010565d:	31 c0                	xor    %eax,%eax
}
8010565f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105662:	5b                   	pop    %ebx
80105663:	5e                   	pop    %esi
80105664:	5d                   	pop    %ebp
80105665:	c3                   	ret    
80105666:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010566d:	8d 76 00             	lea    0x0(%esi),%esi
    iunlockput(ip);
80105670:	83 ec 0c             	sub    $0xc,%esp
80105673:	53                   	push   %ebx
80105674:	e8 97 c3 ff ff       	call   80101a10 <iunlockput>
    end_op();
80105679:	e8 22 d9 ff ff       	call   80102fa0 <end_op>
    return -1;
8010567e:	83 c4 10             	add    $0x10,%esp
80105681:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105686:	eb d7                	jmp    8010565f <sys_chdir+0x6f>
80105688:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010568f:	90                   	nop
    end_op();
80105690:	e8 0b d9 ff ff       	call   80102fa0 <end_op>
    return -1;
80105695:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010569a:	eb c3                	jmp    8010565f <sys_chdir+0x6f>
8010569c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801056a0 <sys_exec>:

int
sys_exec(void)
{
801056a0:	55                   	push   %ebp
801056a1:	89 e5                	mov    %esp,%ebp
801056a3:	57                   	push   %edi
801056a4:	56                   	push   %esi
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801056a5:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
801056ab:	53                   	push   %ebx
801056ac:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801056b2:	50                   	push   %eax
801056b3:	6a 00                	push   $0x0
801056b5:	e8 f6 f4 ff ff       	call   80104bb0 <argstr>
801056ba:	83 c4 10             	add    $0x10,%esp
801056bd:	85 c0                	test   %eax,%eax
801056bf:	0f 88 87 00 00 00    	js     8010574c <sys_exec+0xac>
801056c5:	83 ec 08             	sub    $0x8,%esp
801056c8:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801056ce:	50                   	push   %eax
801056cf:	6a 01                	push   $0x1
801056d1:	e8 1a f4 ff ff       	call   80104af0 <argint>
801056d6:	83 c4 10             	add    $0x10,%esp
801056d9:	85 c0                	test   %eax,%eax
801056db:	78 6f                	js     8010574c <sys_exec+0xac>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
801056dd:	83 ec 04             	sub    $0x4,%esp
801056e0:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
  for(i=0;; i++){
801056e6:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
801056e8:	68 80 00 00 00       	push   $0x80
801056ed:	6a 00                	push   $0x0
801056ef:	56                   	push   %esi
801056f0:	e8 3b f1 ff ff       	call   80104830 <memset>
801056f5:	83 c4 10             	add    $0x10,%esp
801056f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801056ff:	90                   	nop
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105700:	83 ec 08             	sub    $0x8,%esp
80105703:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
80105709:	8d 3c 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edi
80105710:	50                   	push   %eax
80105711:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105717:	01 f8                	add    %edi,%eax
80105719:	50                   	push   %eax
8010571a:	e8 41 f3 ff ff       	call   80104a60 <fetchint>
8010571f:	83 c4 10             	add    $0x10,%esp
80105722:	85 c0                	test   %eax,%eax
80105724:	78 26                	js     8010574c <sys_exec+0xac>
      return -1;
    if(uarg == 0){
80105726:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
8010572c:	85 c0                	test   %eax,%eax
8010572e:	74 30                	je     80105760 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105730:	83 ec 08             	sub    $0x8,%esp
80105733:	8d 14 3e             	lea    (%esi,%edi,1),%edx
80105736:	52                   	push   %edx
80105737:	50                   	push   %eax
80105738:	e8 63 f3 ff ff       	call   80104aa0 <fetchstr>
8010573d:	83 c4 10             	add    $0x10,%esp
80105740:	85 c0                	test   %eax,%eax
80105742:	78 08                	js     8010574c <sys_exec+0xac>
  for(i=0;; i++){
80105744:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
80105747:	83 fb 20             	cmp    $0x20,%ebx
8010574a:	75 b4                	jne    80105700 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
8010574c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
8010574f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105754:	5b                   	pop    %ebx
80105755:	5e                   	pop    %esi
80105756:	5f                   	pop    %edi
80105757:	5d                   	pop    %ebp
80105758:	c3                   	ret    
80105759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      argv[i] = 0;
80105760:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105767:	00 00 00 00 
  return exec(path, argv);
8010576b:	83 ec 08             	sub    $0x8,%esp
8010576e:	56                   	push   %esi
8010576f:	ff b5 5c ff ff ff    	push   -0xa4(%ebp)
80105775:	e8 36 b3 ff ff       	call   80100ab0 <exec>
8010577a:	83 c4 10             	add    $0x10,%esp
}
8010577d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105780:	5b                   	pop    %ebx
80105781:	5e                   	pop    %esi
80105782:	5f                   	pop    %edi
80105783:	5d                   	pop    %ebp
80105784:	c3                   	ret    
80105785:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010578c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105790 <sys_pipe>:

int
sys_pipe(void)
{
80105790:	55                   	push   %ebp
80105791:	89 e5                	mov    %esp,%ebp
80105793:	57                   	push   %edi
80105794:	56                   	push   %esi
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105795:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
80105798:	53                   	push   %ebx
80105799:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010579c:	6a 08                	push   $0x8
8010579e:	50                   	push   %eax
8010579f:	6a 00                	push   $0x0
801057a1:	e8 9a f3 ff ff       	call   80104b40 <argptr>
801057a6:	83 c4 10             	add    $0x10,%esp
801057a9:	85 c0                	test   %eax,%eax
801057ab:	78 4a                	js     801057f7 <sys_pipe+0x67>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
801057ad:	83 ec 08             	sub    $0x8,%esp
801057b0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801057b3:	50                   	push   %eax
801057b4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801057b7:	50                   	push   %eax
801057b8:	e8 43 de ff ff       	call   80103600 <pipealloc>
801057bd:	83 c4 10             	add    $0x10,%esp
801057c0:	85 c0                	test   %eax,%eax
801057c2:	78 33                	js     801057f7 <sys_pipe+0x67>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801057c4:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(fd = 0; fd < NOFILE; fd++){
801057c7:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
801057c9:	e8 72 e3 ff ff       	call   80103b40 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801057ce:	66 90                	xchg   %ax,%ax
    if(curproc->ofile[fd] == 0){
801057d0:	8b 74 98 2c          	mov    0x2c(%eax,%ebx,4),%esi
801057d4:	85 f6                	test   %esi,%esi
801057d6:	74 28                	je     80105800 <sys_pipe+0x70>
  for(fd = 0; fd < NOFILE; fd++){
801057d8:	83 c3 01             	add    $0x1,%ebx
801057db:	83 fb 10             	cmp    $0x10,%ebx
801057de:	75 f0                	jne    801057d0 <sys_pipe+0x40>
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
801057e0:	83 ec 0c             	sub    $0xc,%esp
801057e3:	ff 75 e0             	push   -0x20(%ebp)
801057e6:	e8 05 b7 ff ff       	call   80100ef0 <fileclose>
    fileclose(wf);
801057eb:	58                   	pop    %eax
801057ec:	ff 75 e4             	push   -0x1c(%ebp)
801057ef:	e8 fc b6 ff ff       	call   80100ef0 <fileclose>
    return -1;
801057f4:	83 c4 10             	add    $0x10,%esp
801057f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057fc:	eb 53                	jmp    80105851 <sys_pipe+0xc1>
801057fe:	66 90                	xchg   %ax,%ax
      curproc->ofile[fd] = f;
80105800:	8d 73 08             	lea    0x8(%ebx),%esi
80105803:	89 7c b0 0c          	mov    %edi,0xc(%eax,%esi,4)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105807:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
8010580a:	e8 31 e3 ff ff       	call   80103b40 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
8010580f:	31 d2                	xor    %edx,%edx
80105811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[fd] == 0){
80105818:	8b 4c 90 2c          	mov    0x2c(%eax,%edx,4),%ecx
8010581c:	85 c9                	test   %ecx,%ecx
8010581e:	74 20                	je     80105840 <sys_pipe+0xb0>
  for(fd = 0; fd < NOFILE; fd++){
80105820:	83 c2 01             	add    $0x1,%edx
80105823:	83 fa 10             	cmp    $0x10,%edx
80105826:	75 f0                	jne    80105818 <sys_pipe+0x88>
      myproc()->ofile[fd0] = 0;
80105828:	e8 13 e3 ff ff       	call   80103b40 <myproc>
8010582d:	c7 44 b0 0c 00 00 00 	movl   $0x0,0xc(%eax,%esi,4)
80105834:	00 
80105835:	eb a9                	jmp    801057e0 <sys_pipe+0x50>
80105837:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010583e:	66 90                	xchg   %ax,%ax
      curproc->ofile[fd] = f;
80105840:	89 7c 90 2c          	mov    %edi,0x2c(%eax,%edx,4)
  }
  fd[0] = fd0;
80105844:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105847:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
80105849:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010584c:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
8010584f:	31 c0                	xor    %eax,%eax
}
80105851:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105854:	5b                   	pop    %ebx
80105855:	5e                   	pop    %esi
80105856:	5f                   	pop    %edi
80105857:	5d                   	pop    %ebp
80105858:	c3                   	ret    
80105859:	66 90                	xchg   %ax,%ax
8010585b:	66 90                	xchg   %ax,%ax
8010585d:	66 90                	xchg   %ax,%ax
8010585f:	90                   	nop

80105860 <sys_fork>:
#include "proc.h"

int
sys_fork(void)
{
  return fork();
80105860:	e9 7b e4 ff ff       	jmp    80103ce0 <fork>
80105865:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010586c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105870 <sys_exit>:
}

int
sys_exit(void)
{
80105870:	55                   	push   %ebp
80105871:	89 e5                	mov    %esp,%ebp
80105873:	83 ec 08             	sub    $0x8,%esp
  exit();
80105876:	e8 e5 e6 ff ff       	call   80103f60 <exit>
  return 0;  // not reached
}
8010587b:	31 c0                	xor    %eax,%eax
8010587d:	c9                   	leave  
8010587e:	c3                   	ret    
8010587f:	90                   	nop

80105880 <sys_wait>:

int
sys_wait(void)
{
  return wait();
80105880:	e9 0b e8 ff ff       	jmp    80104090 <wait>
80105885:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010588c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105890 <sys_kill>:
}

int
sys_kill(void)
{
80105890:	55                   	push   %ebp
80105891:	89 e5                	mov    %esp,%ebp
80105893:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105896:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105899:	50                   	push   %eax
8010589a:	6a 00                	push   $0x0
8010589c:	e8 4f f2 ff ff       	call   80104af0 <argint>
801058a1:	83 c4 10             	add    $0x10,%esp
801058a4:	85 c0                	test   %eax,%eax
801058a6:	78 18                	js     801058c0 <sys_kill+0x30>
    return -1;
  return kill(pid);
801058a8:	83 ec 0c             	sub    $0xc,%esp
801058ab:	ff 75 f4             	push   -0xc(%ebp)
801058ae:	e8 7d ea ff ff       	call   80104330 <kill>
801058b3:	83 c4 10             	add    $0x10,%esp
}
801058b6:	c9                   	leave  
801058b7:	c3                   	ret    
801058b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801058bf:	90                   	nop
801058c0:	c9                   	leave  
    return -1;
801058c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801058c6:	c3                   	ret    
801058c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801058ce:	66 90                	xchg   %ax,%ax

801058d0 <sys_getpid>:

int
sys_getpid(void)
{
801058d0:	55                   	push   %ebp
801058d1:	89 e5                	mov    %esp,%ebp
801058d3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
801058d6:	e8 65 e2 ff ff       	call   80103b40 <myproc>
801058db:	8b 40 14             	mov    0x14(%eax),%eax
}
801058de:	c9                   	leave  
801058df:	c3                   	ret    

801058e0 <sys_sbrk>:

int
sys_sbrk(void)
{
801058e0:	55                   	push   %ebp
801058e1:	89 e5                	mov    %esp,%ebp
801058e3:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
801058e4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801058e7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
801058ea:	50                   	push   %eax
801058eb:	6a 00                	push   $0x0
801058ed:	e8 fe f1 ff ff       	call   80104af0 <argint>
801058f2:	83 c4 10             	add    $0x10,%esp
801058f5:	85 c0                	test   %eax,%eax
801058f7:	78 27                	js     80105920 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
801058f9:	e8 42 e2 ff ff       	call   80103b40 <myproc>
  if(growproc(n) < 0)
801058fe:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
80105901:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105903:	ff 75 f4             	push   -0xc(%ebp)
80105906:	e8 55 e3 ff ff       	call   80103c60 <growproc>
8010590b:	83 c4 10             	add    $0x10,%esp
8010590e:	85 c0                	test   %eax,%eax
80105910:	78 0e                	js     80105920 <sys_sbrk+0x40>
    return -1;
  return addr;
}
80105912:	89 d8                	mov    %ebx,%eax
80105914:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105917:	c9                   	leave  
80105918:	c3                   	ret    
80105919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105920:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105925:	eb eb                	jmp    80105912 <sys_sbrk+0x32>
80105927:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010592e:	66 90                	xchg   %ax,%ax

80105930 <sys_sleep>:

int
sys_sleep(void)
{
80105930:	55                   	push   %ebp
80105931:	89 e5                	mov    %esp,%ebp
80105933:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105934:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105937:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010593a:	50                   	push   %eax
8010593b:	6a 00                	push   $0x0
8010593d:	e8 ae f1 ff ff       	call   80104af0 <argint>
80105942:	83 c4 10             	add    $0x10,%esp
80105945:	85 c0                	test   %eax,%eax
80105947:	0f 88 8a 00 00 00    	js     801059d7 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010594d:	83 ec 0c             	sub    $0xc,%esp
80105950:	68 80 3d 11 80       	push   $0x80113d80
80105955:	e8 16 ee ff ff       	call   80104770 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010595a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  ticks0 = ticks;
8010595d:	8b 1d 60 3d 11 80    	mov    0x80113d60,%ebx
  while(ticks - ticks0 < n){
80105963:	83 c4 10             	add    $0x10,%esp
80105966:	85 d2                	test   %edx,%edx
80105968:	75 27                	jne    80105991 <sys_sleep+0x61>
8010596a:	eb 54                	jmp    801059c0 <sys_sleep+0x90>
8010596c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105970:	83 ec 08             	sub    $0x8,%esp
80105973:	68 80 3d 11 80       	push   $0x80113d80
80105978:	68 60 3d 11 80       	push   $0x80113d60
8010597d:	e8 8e e8 ff ff       	call   80104210 <sleep>
  while(ticks - ticks0 < n){
80105982:	a1 60 3d 11 80       	mov    0x80113d60,%eax
80105987:	83 c4 10             	add    $0x10,%esp
8010598a:	29 d8                	sub    %ebx,%eax
8010598c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010598f:	73 2f                	jae    801059c0 <sys_sleep+0x90>
    if(myproc()->killed){
80105991:	e8 aa e1 ff ff       	call   80103b40 <myproc>
80105996:	8b 40 28             	mov    0x28(%eax),%eax
80105999:	85 c0                	test   %eax,%eax
8010599b:	74 d3                	je     80105970 <sys_sleep+0x40>
      release(&tickslock);
8010599d:	83 ec 0c             	sub    $0xc,%esp
801059a0:	68 80 3d 11 80       	push   $0x80113d80
801059a5:	e8 66 ed ff ff       	call   80104710 <release>
  }
  release(&tickslock);
  return 0;
}
801059aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      return -1;
801059ad:	83 c4 10             	add    $0x10,%esp
801059b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801059b5:	c9                   	leave  
801059b6:	c3                   	ret    
801059b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801059be:	66 90                	xchg   %ax,%ax
  release(&tickslock);
801059c0:	83 ec 0c             	sub    $0xc,%esp
801059c3:	68 80 3d 11 80       	push   $0x80113d80
801059c8:	e8 43 ed ff ff       	call   80104710 <release>
  return 0;
801059cd:	83 c4 10             	add    $0x10,%esp
801059d0:	31 c0                	xor    %eax,%eax
}
801059d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801059d5:	c9                   	leave  
801059d6:	c3                   	ret    
    return -1;
801059d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801059dc:	eb f4                	jmp    801059d2 <sys_sleep+0xa2>
801059de:	66 90                	xchg   %ax,%ax

801059e0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
801059e0:	55                   	push   %ebp
801059e1:	89 e5                	mov    %esp,%ebp
801059e3:	53                   	push   %ebx
801059e4:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
801059e7:	68 80 3d 11 80       	push   $0x80113d80
801059ec:	e8 7f ed ff ff       	call   80104770 <acquire>
  xticks = ticks;
801059f1:	8b 1d 60 3d 11 80    	mov    0x80113d60,%ebx
  release(&tickslock);
801059f7:	c7 04 24 80 3d 11 80 	movl   $0x80113d80,(%esp)
801059fe:	e8 0d ed ff ff       	call   80104710 <release>
  return xticks;
}
80105a03:	89 d8                	mov    %ebx,%eax
80105a05:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105a08:	c9                   	leave  
80105a09:	c3                   	ret    
80105a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105a10 <sys_printhugepde>:

// System calls for debugging huge page allocations/mappings
int
sys_printhugepde()
{
80105a10:	55                   	push   %ebp
80105a11:	89 e5                	mov    %esp,%ebp
80105a13:	57                   	push   %edi
80105a14:	56                   	push   %esi
80105a15:	53                   	push   %ebx
  pde_t *pgdir = myproc()->pgdir;
  int pid = myproc()->pid;
  int i = 0;
  for (i = 0; i < 1024; i++) {
80105a16:	31 db                	xor    %ebx,%ebx
{
80105a18:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pgdir = myproc()->pgdir;
80105a1b:	e8 20 e1 ff ff       	call   80103b40 <myproc>
80105a20:	8b 78 08             	mov    0x8(%eax),%edi
  int pid = myproc()->pid;
80105a23:	e8 18 e1 ff ff       	call   80103b40 <myproc>
80105a28:	8b 70 14             	mov    0x14(%eax),%esi
  for (i = 0; i < 1024; i++) {
80105a2b:	eb 0e                	jmp    80105a3b <sys_printhugepde+0x2b>
80105a2d:	8d 76 00             	lea    0x0(%esi),%esi
80105a30:	83 c3 01             	add    $0x1,%ebx
80105a33:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
80105a39:	74 2e                	je     80105a69 <sys_printhugepde+0x59>
    if((pgdir[i] & PTE_PS) && (pgdir[i] & PTE_U) && (pgdir[i] & PTE_P))
80105a3b:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
80105a3e:	89 c2                	mov    %eax,%edx
80105a40:	81 e2 85 00 00 00    	and    $0x85,%edx
80105a46:	81 fa 85 00 00 00    	cmp    $0x85,%edx
80105a4c:	75 e2                	jne    80105a30 <sys_printhugepde+0x20>
      cprintf("PID %d: PDE[%d] is 0x%x\n", pid, i, pgdir[i]);
80105a4e:	50                   	push   %eax
80105a4f:	53                   	push   %ebx
  for (i = 0; i < 1024; i++) {
80105a50:	83 c3 01             	add    $0x1,%ebx
      cprintf("PID %d: PDE[%d] is 0x%x\n", pid, i, pgdir[i]);
80105a53:	56                   	push   %esi
80105a54:	68 21 7c 10 80       	push   $0x80107c21
80105a59:	e8 42 ac ff ff       	call   801006a0 <cprintf>
80105a5e:	83 c4 10             	add    $0x10,%esp
  for (i = 0; i < 1024; i++) {
80105a61:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
80105a67:	75 d2                	jne    80105a3b <sys_printhugepde+0x2b>
  }
  return 0;
}
80105a69:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a6c:	31 c0                	xor    %eax,%eax
80105a6e:	5b                   	pop    %ebx
80105a6f:	5e                   	pop    %esi
80105a70:	5f                   	pop    %edi
80105a71:	5d                   	pop    %ebp
80105a72:	c3                   	ret    
80105a73:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105a80 <sys_procpgdirinfo>:

int
sys_procpgdirinfo()
{
80105a80:	55                   	push   %ebp
80105a81:	89 e5                	mov    %esp,%ebp
80105a83:	57                   	push   %edi
80105a84:	56                   	push   %esi
  int *buf;
  if(argptr(0, (void*)&buf, 2*sizeof(buf[0])) < 0)
80105a85:	8d 45 e4             	lea    -0x1c(%ebp),%eax
{
80105a88:	53                   	push   %ebx
80105a89:	83 ec 30             	sub    $0x30,%esp
  if(argptr(0, (void*)&buf, 2*sizeof(buf[0])) < 0)
80105a8c:	6a 08                	push   $0x8
80105a8e:	50                   	push   %eax
80105a8f:	6a 00                	push   $0x0
80105a91:	e8 aa f0 ff ff       	call   80104b40 <argptr>
80105a96:	83 c4 10             	add    $0x10,%esp
80105a99:	85 c0                	test   %eax,%eax
80105a9b:	0f 88 90 00 00 00    	js     80105b31 <sys_procpgdirinfo+0xb1>
    return -1;
  pde_t *pgdir = myproc()->pgdir;
80105aa1:	e8 9a e0 ff ff       	call   80103b40 <myproc>
  int base_cnt = 0; // base page count
  int huge_cnt = 0; // huge page count
80105aa6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  int base_cnt = 0; // base page count
80105aad:	31 c9                	xor    %ecx,%ecx
80105aaf:	8b 70 08             	mov    0x8(%eax),%esi
80105ab2:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80105ab8:	eb 12                	jmp    80105acc <sys_procpgdirinfo+0x4c>
80105aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  int i = 0;
  int j = 0;
  for (i = 0; i < 1024; i++) {
    if((pgdir[i] & PTE_PS) && (pgdir[i] & PTE_U) && (pgdir[i] & PTE_P) /*PTE_P, PTE_U and PTE_PS should be set for huge pages*/)
      ++huge_cnt;
    if((pgdir[i] & PTE_U) && (pgdir[i] & PTE_P) && ((pgdir[i] & PTE_PS) == 0) /*Only PTE_P and PTE_U should be set for base pages*/) {
80105ac0:	83 f8 05             	cmp    $0x5,%eax
80105ac3:	74 3a                	je     80105aff <sys_procpgdirinfo+0x7f>
  for (i = 0; i < 1024; i++) {
80105ac5:	83 c6 04             	add    $0x4,%esi
80105ac8:	39 f7                	cmp    %esi,%edi
80105aca:	74 1b                	je     80105ae7 <sys_procpgdirinfo+0x67>
    if((pgdir[i] & PTE_PS) && (pgdir[i] & PTE_U) && (pgdir[i] & PTE_P) /*PTE_P, PTE_U and PTE_PS should be set for huge pages*/)
80105acc:	8b 1e                	mov    (%esi),%ebx
80105ace:	89 d8                	mov    %ebx,%eax
80105ad0:	25 85 00 00 00       	and    $0x85,%eax
80105ad5:	3d 85 00 00 00       	cmp    $0x85,%eax
80105ada:	75 e4                	jne    80105ac0 <sys_procpgdirinfo+0x40>
  for (i = 0; i < 1024; i++) {
80105adc:	83 c6 04             	add    $0x4,%esi
      ++huge_cnt;
80105adf:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
  for (i = 0; i < 1024; i++) {
80105ae3:	39 f7                	cmp    %esi,%edi
80105ae5:	75 e5                	jne    80105acc <sys_procpgdirinfo+0x4c>
          ++base_cnt;
        }
      }
    }
  }
  buf[0] = base_cnt; // base page count
80105ae7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  buf[1] = huge_cnt; // huge page count
80105aea:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  buf[0] = base_cnt; // base page count
80105aed:	89 08                	mov    %ecx,(%eax)
  buf[1] = huge_cnt; // huge page count
80105aef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105af2:	89 78 04             	mov    %edi,0x4(%eax)
  return 0;
80105af5:	31 c0                	xor    %eax,%eax
}
80105af7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105afa:	5b                   	pop    %ebx
80105afb:	5e                   	pop    %esi
80105afc:	5f                   	pop    %edi
80105afd:	5d                   	pop    %ebp
80105afe:	c3                   	ret    
      uint* pgtab = (uint*)P2V(PTE_ADDR(pgdir[i]));
80105aff:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80105b05:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
      for (j = 0; j < 1024; j++) {
80105b0b:	81 eb 00 f0 ff 7f    	sub    $0x7ffff000,%ebx
80105b11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if((pgtab[j] & PTE_U) && (pgtab[j] & PTE_P)) {
80105b18:	8b 10                	mov    (%eax),%edx
80105b1a:	83 e2 05             	and    $0x5,%edx
          ++base_cnt;
80105b1d:	83 fa 05             	cmp    $0x5,%edx
80105b20:	0f 94 c2             	sete   %dl
      for (j = 0; j < 1024; j++) {
80105b23:	83 c0 04             	add    $0x4,%eax
          ++base_cnt;
80105b26:	0f b6 d2             	movzbl %dl,%edx
80105b29:	01 d1                	add    %edx,%ecx
      for (j = 0; j < 1024; j++) {
80105b2b:	39 d8                	cmp    %ebx,%eax
80105b2d:	75 e9                	jne    80105b18 <sys_procpgdirinfo+0x98>
80105b2f:	eb 94                	jmp    80105ac5 <sys_procpgdirinfo+0x45>
    return -1;
80105b31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105b36:	eb bf                	jmp    80105af7 <sys_procpgdirinfo+0x77>

80105b38 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80105b38:	1e                   	push   %ds
  pushl %es
80105b39:	06                   	push   %es
  pushl %fs
80105b3a:	0f a0                	push   %fs
  pushl %gs
80105b3c:	0f a8                	push   %gs
  pushal
80105b3e:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
80105b3f:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105b43:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80105b45:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
80105b47:	54                   	push   %esp
  call trap
80105b48:	e8 c3 00 00 00       	call   80105c10 <trap>
  addl $4, %esp
80105b4d:	83 c4 04             	add    $0x4,%esp

80105b50 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80105b50:	61                   	popa   
  popl %gs
80105b51:	0f a9                	pop    %gs
  popl %fs
80105b53:	0f a1                	pop    %fs
  popl %es
80105b55:	07                   	pop    %es
  popl %ds
80105b56:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105b57:	83 c4 08             	add    $0x8,%esp
  iret
80105b5a:	cf                   	iret   
80105b5b:	66 90                	xchg   %ax,%ax
80105b5d:	66 90                	xchg   %ax,%ax
80105b5f:	90                   	nop

80105b60 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105b60:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
80105b61:	31 c0                	xor    %eax,%eax
{
80105b63:	89 e5                	mov    %esp,%ebp
80105b65:	83 ec 08             	sub    $0x8,%esp
80105b68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b6f:	90                   	nop
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105b70:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
80105b77:	c7 04 c5 c2 3d 11 80 	movl   $0x8e000008,-0x7feec23e(,%eax,8)
80105b7e:	08 00 00 8e 
80105b82:	66 89 14 c5 c0 3d 11 	mov    %dx,-0x7feec240(,%eax,8)
80105b89:	80 
80105b8a:	c1 ea 10             	shr    $0x10,%edx
80105b8d:	66 89 14 c5 c6 3d 11 	mov    %dx,-0x7feec23a(,%eax,8)
80105b94:	80 
  for(i = 0; i < 256; i++)
80105b95:	83 c0 01             	add    $0x1,%eax
80105b98:	3d 00 01 00 00       	cmp    $0x100,%eax
80105b9d:	75 d1                	jne    80105b70 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);

  initlock(&tickslock, "time");
80105b9f:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105ba2:	a1 08 a1 10 80       	mov    0x8010a108,%eax
80105ba7:	c7 05 c2 3f 11 80 08 	movl   $0xef000008,0x80113fc2
80105bae:	00 00 ef 
  initlock(&tickslock, "time");
80105bb1:	68 3a 7c 10 80       	push   $0x80107c3a
80105bb6:	68 80 3d 11 80       	push   $0x80113d80
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105bbb:	66 a3 c0 3f 11 80    	mov    %ax,0x80113fc0
80105bc1:	c1 e8 10             	shr    $0x10,%eax
80105bc4:	66 a3 c6 3f 11 80    	mov    %ax,0x80113fc6
  initlock(&tickslock, "time");
80105bca:	e8 d1 e9 ff ff       	call   801045a0 <initlock>
}
80105bcf:	83 c4 10             	add    $0x10,%esp
80105bd2:	c9                   	leave  
80105bd3:	c3                   	ret    
80105bd4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105bdb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105bdf:	90                   	nop

80105be0 <idtinit>:

void
idtinit(void)
{
80105be0:	55                   	push   %ebp
  pd[0] = size-1;
80105be1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105be6:	89 e5                	mov    %esp,%ebp
80105be8:	83 ec 10             	sub    $0x10,%esp
80105beb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105bef:	b8 c0 3d 11 80       	mov    $0x80113dc0,%eax
80105bf4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105bf8:	c1 e8 10             	shr    $0x10,%eax
80105bfb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80105bff:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105c02:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105c05:	c9                   	leave  
80105c06:	c3                   	ret    
80105c07:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105c0e:	66 90                	xchg   %ax,%ax

80105c10 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105c10:	55                   	push   %ebp
80105c11:	89 e5                	mov    %esp,%ebp
80105c13:	57                   	push   %edi
80105c14:	56                   	push   %esi
80105c15:	53                   	push   %ebx
80105c16:	83 ec 1c             	sub    $0x1c,%esp
80105c19:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80105c1c:	8b 43 30             	mov    0x30(%ebx),%eax
80105c1f:	83 f8 40             	cmp    $0x40,%eax
80105c22:	0f 84 68 01 00 00    	je     80105d90 <trap+0x180>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105c28:	83 e8 20             	sub    $0x20,%eax
80105c2b:	83 f8 1f             	cmp    $0x1f,%eax
80105c2e:	0f 87 8c 00 00 00    	ja     80105cc0 <trap+0xb0>
80105c34:	ff 24 85 e0 7c 10 80 	jmp    *-0x7fef8320(,%eax,4)
80105c3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105c3f:	90                   	nop
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105c40:	e8 fb c5 ff ff       	call   80102240 <ideintr>
    lapiceoi();
80105c45:	e8 96 ce ff ff       	call   80102ae0 <lapiceoi>
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105c4a:	e8 f1 de ff ff       	call   80103b40 <myproc>
80105c4f:	85 c0                	test   %eax,%eax
80105c51:	74 1d                	je     80105c70 <trap+0x60>
80105c53:	e8 e8 de ff ff       	call   80103b40 <myproc>
80105c58:	8b 50 28             	mov    0x28(%eax),%edx
80105c5b:	85 d2                	test   %edx,%edx
80105c5d:	74 11                	je     80105c70 <trap+0x60>
80105c5f:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105c63:	83 e0 03             	and    $0x3,%eax
80105c66:	66 83 f8 03          	cmp    $0x3,%ax
80105c6a:	0f 84 e8 01 00 00    	je     80105e58 <trap+0x248>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105c70:	e8 cb de ff ff       	call   80103b40 <myproc>
80105c75:	85 c0                	test   %eax,%eax
80105c77:	74 0f                	je     80105c88 <trap+0x78>
80105c79:	e8 c2 de ff ff       	call   80103b40 <myproc>
80105c7e:	83 78 10 04          	cmpl   $0x4,0x10(%eax)
80105c82:	0f 84 b8 00 00 00    	je     80105d40 <trap+0x130>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105c88:	e8 b3 de ff ff       	call   80103b40 <myproc>
80105c8d:	85 c0                	test   %eax,%eax
80105c8f:	74 1d                	je     80105cae <trap+0x9e>
80105c91:	e8 aa de ff ff       	call   80103b40 <myproc>
80105c96:	8b 40 28             	mov    0x28(%eax),%eax
80105c99:	85 c0                	test   %eax,%eax
80105c9b:	74 11                	je     80105cae <trap+0x9e>
80105c9d:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105ca1:	83 e0 03             	and    $0x3,%eax
80105ca4:	66 83 f8 03          	cmp    $0x3,%ax
80105ca8:	0f 84 0f 01 00 00    	je     80105dbd <trap+0x1ad>
    exit();
}
80105cae:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105cb1:	5b                   	pop    %ebx
80105cb2:	5e                   	pop    %esi
80105cb3:	5f                   	pop    %edi
80105cb4:	5d                   	pop    %ebp
80105cb5:	c3                   	ret    
80105cb6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105cbd:	8d 76 00             	lea    0x0(%esi),%esi
    if(myproc() == 0 || (tf->cs&3) == 0){
80105cc0:	e8 7b de ff ff       	call   80103b40 <myproc>
80105cc5:	8b 7b 38             	mov    0x38(%ebx),%edi
80105cc8:	85 c0                	test   %eax,%eax
80105cca:	0f 84 a2 01 00 00    	je     80105e72 <trap+0x262>
80105cd0:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105cd4:	0f 84 98 01 00 00    	je     80105e72 <trap+0x262>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105cda:	0f 20 d1             	mov    %cr2,%ecx
80105cdd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105ce0:	e8 3b de ff ff       	call   80103b20 <cpuid>
80105ce5:	8b 73 30             	mov    0x30(%ebx),%esi
80105ce8:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105ceb:	8b 43 34             	mov    0x34(%ebx),%eax
80105cee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            myproc()->pid, myproc()->name, tf->trapno,
80105cf1:	e8 4a de ff ff       	call   80103b40 <myproc>
80105cf6:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105cf9:	e8 42 de ff ff       	call   80103b40 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105cfe:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105d01:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105d04:	51                   	push   %ecx
80105d05:	57                   	push   %edi
80105d06:	52                   	push   %edx
80105d07:	ff 75 e4             	push   -0x1c(%ebp)
80105d0a:	56                   	push   %esi
            myproc()->pid, myproc()->name, tf->trapno,
80105d0b:	8b 75 e0             	mov    -0x20(%ebp),%esi
80105d0e:	83 c6 70             	add    $0x70,%esi
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105d11:	56                   	push   %esi
80105d12:	ff 70 14             	push   0x14(%eax)
80105d15:	68 9c 7c 10 80       	push   $0x80107c9c
80105d1a:	e8 81 a9 ff ff       	call   801006a0 <cprintf>
    myproc()->killed = 1;
80105d1f:	83 c4 20             	add    $0x20,%esp
80105d22:	e8 19 de ff ff       	call   80103b40 <myproc>
80105d27:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105d2e:	e8 0d de ff ff       	call   80103b40 <myproc>
80105d33:	85 c0                	test   %eax,%eax
80105d35:	0f 85 18 ff ff ff    	jne    80105c53 <trap+0x43>
80105d3b:	e9 30 ff ff ff       	jmp    80105c70 <trap+0x60>
  if(myproc() && myproc()->state == RUNNING &&
80105d40:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105d44:	0f 85 3e ff ff ff    	jne    80105c88 <trap+0x78>
    yield();
80105d4a:	e8 71 e4 ff ff       	call   801041c0 <yield>
80105d4f:	e9 34 ff ff ff       	jmp    80105c88 <trap+0x78>
80105d54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105d58:	8b 7b 38             	mov    0x38(%ebx),%edi
80105d5b:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105d5f:	e8 bc dd ff ff       	call   80103b20 <cpuid>
80105d64:	57                   	push   %edi
80105d65:	56                   	push   %esi
80105d66:	50                   	push   %eax
80105d67:	68 44 7c 10 80       	push   $0x80107c44
80105d6c:	e8 2f a9 ff ff       	call   801006a0 <cprintf>
    lapiceoi();
80105d71:	e8 6a cd ff ff       	call   80102ae0 <lapiceoi>
    break;
80105d76:	83 c4 10             	add    $0x10,%esp
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105d79:	e8 c2 dd ff ff       	call   80103b40 <myproc>
80105d7e:	85 c0                	test   %eax,%eax
80105d80:	0f 85 cd fe ff ff    	jne    80105c53 <trap+0x43>
80105d86:	e9 e5 fe ff ff       	jmp    80105c70 <trap+0x60>
80105d8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105d8f:	90                   	nop
    if(myproc()->killed)
80105d90:	e8 ab dd ff ff       	call   80103b40 <myproc>
80105d95:	8b 70 28             	mov    0x28(%eax),%esi
80105d98:	85 f6                	test   %esi,%esi
80105d9a:	0f 85 c8 00 00 00    	jne    80105e68 <trap+0x258>
    myproc()->tf = tf;
80105da0:	e8 9b dd ff ff       	call   80103b40 <myproc>
80105da5:	89 58 1c             	mov    %ebx,0x1c(%eax)
    syscall();
80105da8:	e8 83 ee ff ff       	call   80104c30 <syscall>
    if(myproc()->killed)
80105dad:	e8 8e dd ff ff       	call   80103b40 <myproc>
80105db2:	8b 48 28             	mov    0x28(%eax),%ecx
80105db5:	85 c9                	test   %ecx,%ecx
80105db7:	0f 84 f1 fe ff ff    	je     80105cae <trap+0x9e>
}
80105dbd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105dc0:	5b                   	pop    %ebx
80105dc1:	5e                   	pop    %esi
80105dc2:	5f                   	pop    %edi
80105dc3:	5d                   	pop    %ebp
      exit();
80105dc4:	e9 97 e1 ff ff       	jmp    80103f60 <exit>
80105dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    uartintr();
80105dd0:	e8 3b 02 00 00       	call   80106010 <uartintr>
    lapiceoi();
80105dd5:	e8 06 cd ff ff       	call   80102ae0 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105dda:	e8 61 dd ff ff       	call   80103b40 <myproc>
80105ddf:	85 c0                	test   %eax,%eax
80105de1:	0f 85 6c fe ff ff    	jne    80105c53 <trap+0x43>
80105de7:	e9 84 fe ff ff       	jmp    80105c70 <trap+0x60>
80105dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    kbdintr();
80105df0:	e8 ab cb ff ff       	call   801029a0 <kbdintr>
    lapiceoi();
80105df5:	e8 e6 cc ff ff       	call   80102ae0 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105dfa:	e8 41 dd ff ff       	call   80103b40 <myproc>
80105dff:	85 c0                	test   %eax,%eax
80105e01:	0f 85 4c fe ff ff    	jne    80105c53 <trap+0x43>
80105e07:	e9 64 fe ff ff       	jmp    80105c70 <trap+0x60>
80105e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(cpuid() == 0){
80105e10:	e8 0b dd ff ff       	call   80103b20 <cpuid>
80105e15:	85 c0                	test   %eax,%eax
80105e17:	0f 85 28 fe ff ff    	jne    80105c45 <trap+0x35>
      acquire(&tickslock);
80105e1d:	83 ec 0c             	sub    $0xc,%esp
80105e20:	68 80 3d 11 80       	push   $0x80113d80
80105e25:	e8 46 e9 ff ff       	call   80104770 <acquire>
      wakeup(&ticks);
80105e2a:	c7 04 24 60 3d 11 80 	movl   $0x80113d60,(%esp)
      ticks++;
80105e31:	83 05 60 3d 11 80 01 	addl   $0x1,0x80113d60
      wakeup(&ticks);
80105e38:	e8 93 e4 ff ff       	call   801042d0 <wakeup>
      release(&tickslock);
80105e3d:	c7 04 24 80 3d 11 80 	movl   $0x80113d80,(%esp)
80105e44:	e8 c7 e8 ff ff       	call   80104710 <release>
80105e49:	83 c4 10             	add    $0x10,%esp
    lapiceoi();
80105e4c:	e9 f4 fd ff ff       	jmp    80105c45 <trap+0x35>
80105e51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
80105e58:	e8 03 e1 ff ff       	call   80103f60 <exit>
80105e5d:	e9 0e fe ff ff       	jmp    80105c70 <trap+0x60>
80105e62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
80105e68:	e8 f3 e0 ff ff       	call   80103f60 <exit>
80105e6d:	e9 2e ff ff ff       	jmp    80105da0 <trap+0x190>
80105e72:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105e75:	e8 a6 dc ff ff       	call   80103b20 <cpuid>
80105e7a:	83 ec 0c             	sub    $0xc,%esp
80105e7d:	56                   	push   %esi
80105e7e:	57                   	push   %edi
80105e7f:	50                   	push   %eax
80105e80:	ff 73 30             	push   0x30(%ebx)
80105e83:	68 68 7c 10 80       	push   $0x80107c68
80105e88:	e8 13 a8 ff ff       	call   801006a0 <cprintf>
      panic("trap");
80105e8d:	83 c4 14             	add    $0x14,%esp
80105e90:	68 3f 7c 10 80       	push   $0x80107c3f
80105e95:	e8 e6 a4 ff ff       	call   80100380 <panic>
80105e9a:	66 90                	xchg   %ax,%ax
80105e9c:	66 90                	xchg   %ax,%ax
80105e9e:	66 90                	xchg   %ax,%ax

80105ea0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105ea0:	a1 c0 45 11 80       	mov    0x801145c0,%eax
80105ea5:	85 c0                	test   %eax,%eax
80105ea7:	74 17                	je     80105ec0 <uartgetc+0x20>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105ea9:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105eae:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105eaf:	a8 01                	test   $0x1,%al
80105eb1:	74 0d                	je     80105ec0 <uartgetc+0x20>
80105eb3:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105eb8:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105eb9:	0f b6 c0             	movzbl %al,%eax
80105ebc:	c3                   	ret    
80105ebd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80105ec0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105ec5:	c3                   	ret    
80105ec6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ecd:	8d 76 00             	lea    0x0(%esi),%esi

80105ed0 <uartinit>:
{
80105ed0:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105ed1:	31 c9                	xor    %ecx,%ecx
80105ed3:	89 c8                	mov    %ecx,%eax
80105ed5:	89 e5                	mov    %esp,%ebp
80105ed7:	57                   	push   %edi
80105ed8:	bf fa 03 00 00       	mov    $0x3fa,%edi
80105edd:	56                   	push   %esi
80105ede:	89 fa                	mov    %edi,%edx
80105ee0:	53                   	push   %ebx
80105ee1:	83 ec 1c             	sub    $0x1c,%esp
80105ee4:	ee                   	out    %al,(%dx)
80105ee5:	be fb 03 00 00       	mov    $0x3fb,%esi
80105eea:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105eef:	89 f2                	mov    %esi,%edx
80105ef1:	ee                   	out    %al,(%dx)
80105ef2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105ef7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105efc:	ee                   	out    %al,(%dx)
80105efd:	bb f9 03 00 00       	mov    $0x3f9,%ebx
80105f02:	89 c8                	mov    %ecx,%eax
80105f04:	89 da                	mov    %ebx,%edx
80105f06:	ee                   	out    %al,(%dx)
80105f07:	b8 03 00 00 00       	mov    $0x3,%eax
80105f0c:	89 f2                	mov    %esi,%edx
80105f0e:	ee                   	out    %al,(%dx)
80105f0f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105f14:	89 c8                	mov    %ecx,%eax
80105f16:	ee                   	out    %al,(%dx)
80105f17:	b8 01 00 00 00       	mov    $0x1,%eax
80105f1c:	89 da                	mov    %ebx,%edx
80105f1e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105f1f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105f24:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105f25:	3c ff                	cmp    $0xff,%al
80105f27:	74 78                	je     80105fa1 <uartinit+0xd1>
  uart = 1;
80105f29:	c7 05 c0 45 11 80 01 	movl   $0x1,0x801145c0
80105f30:	00 00 00 
80105f33:	89 fa                	mov    %edi,%edx
80105f35:	ec                   	in     (%dx),%al
80105f36:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105f3b:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105f3c:	83 ec 08             	sub    $0x8,%esp
  for(p="xv6...\n"; *p; p++)
80105f3f:	bf 60 7d 10 80       	mov    $0x80107d60,%edi
80105f44:	be fd 03 00 00       	mov    $0x3fd,%esi
  ioapicenable(IRQ_COM1, 0);
80105f49:	6a 00                	push   $0x0
80105f4b:	6a 04                	push   $0x4
80105f4d:	e8 2e c5 ff ff       	call   80102480 <ioapicenable>
  for(p="xv6...\n"; *p; p++)
80105f52:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
  ioapicenable(IRQ_COM1, 0);
80105f56:	83 c4 10             	add    $0x10,%esp
80105f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(!uart)
80105f60:	a1 c0 45 11 80       	mov    0x801145c0,%eax
80105f65:	bb 80 00 00 00       	mov    $0x80,%ebx
80105f6a:	85 c0                	test   %eax,%eax
80105f6c:	75 14                	jne    80105f82 <uartinit+0xb2>
80105f6e:	eb 23                	jmp    80105f93 <uartinit+0xc3>
    microdelay(10);
80105f70:	83 ec 0c             	sub    $0xc,%esp
80105f73:	6a 0a                	push   $0xa
80105f75:	e8 86 cb ff ff       	call   80102b00 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105f7a:	83 c4 10             	add    $0x10,%esp
80105f7d:	83 eb 01             	sub    $0x1,%ebx
80105f80:	74 07                	je     80105f89 <uartinit+0xb9>
80105f82:	89 f2                	mov    %esi,%edx
80105f84:	ec                   	in     (%dx),%al
80105f85:	a8 20                	test   $0x20,%al
80105f87:	74 e7                	je     80105f70 <uartinit+0xa0>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105f89:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
80105f8d:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105f92:	ee                   	out    %al,(%dx)
  for(p="xv6...\n"; *p; p++)
80105f93:	0f b6 47 01          	movzbl 0x1(%edi),%eax
80105f97:	83 c7 01             	add    $0x1,%edi
80105f9a:	88 45 e7             	mov    %al,-0x19(%ebp)
80105f9d:	84 c0                	test   %al,%al
80105f9f:	75 bf                	jne    80105f60 <uartinit+0x90>
}
80105fa1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105fa4:	5b                   	pop    %ebx
80105fa5:	5e                   	pop    %esi
80105fa6:	5f                   	pop    %edi
80105fa7:	5d                   	pop    %ebp
80105fa8:	c3                   	ret    
80105fa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105fb0 <uartputc>:
  if(!uart)
80105fb0:	a1 c0 45 11 80       	mov    0x801145c0,%eax
80105fb5:	85 c0                	test   %eax,%eax
80105fb7:	74 47                	je     80106000 <uartputc+0x50>
{
80105fb9:	55                   	push   %ebp
80105fba:	89 e5                	mov    %esp,%ebp
80105fbc:	56                   	push   %esi
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105fbd:	be fd 03 00 00       	mov    $0x3fd,%esi
80105fc2:	53                   	push   %ebx
80105fc3:	bb 80 00 00 00       	mov    $0x80,%ebx
80105fc8:	eb 18                	jmp    80105fe2 <uartputc+0x32>
80105fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    microdelay(10);
80105fd0:	83 ec 0c             	sub    $0xc,%esp
80105fd3:	6a 0a                	push   $0xa
80105fd5:	e8 26 cb ff ff       	call   80102b00 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105fda:	83 c4 10             	add    $0x10,%esp
80105fdd:	83 eb 01             	sub    $0x1,%ebx
80105fe0:	74 07                	je     80105fe9 <uartputc+0x39>
80105fe2:	89 f2                	mov    %esi,%edx
80105fe4:	ec                   	in     (%dx),%al
80105fe5:	a8 20                	test   $0x20,%al
80105fe7:	74 e7                	je     80105fd0 <uartputc+0x20>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105fe9:	8b 45 08             	mov    0x8(%ebp),%eax
80105fec:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105ff1:	ee                   	out    %al,(%dx)
}
80105ff2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105ff5:	5b                   	pop    %ebx
80105ff6:	5e                   	pop    %esi
80105ff7:	5d                   	pop    %ebp
80105ff8:	c3                   	ret    
80105ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106000:	c3                   	ret    
80106001:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106008:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010600f:	90                   	nop

80106010 <uartintr>:

void
uartintr(void)
{
80106010:	55                   	push   %ebp
80106011:	89 e5                	mov    %esp,%ebp
80106013:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80106016:	68 a0 5e 10 80       	push   $0x80105ea0
8010601b:	e8 60 a8 ff ff       	call   80100880 <consoleintr>
}
80106020:	83 c4 10             	add    $0x10,%esp
80106023:	c9                   	leave  
80106024:	c3                   	ret    

80106025 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80106025:	6a 00                	push   $0x0
  pushl $0
80106027:	6a 00                	push   $0x0
  jmp alltraps
80106029:	e9 0a fb ff ff       	jmp    80105b38 <alltraps>

8010602e <vector1>:
.globl vector1
vector1:
  pushl $0
8010602e:	6a 00                	push   $0x0
  pushl $1
80106030:	6a 01                	push   $0x1
  jmp alltraps
80106032:	e9 01 fb ff ff       	jmp    80105b38 <alltraps>

80106037 <vector2>:
.globl vector2
vector2:
  pushl $0
80106037:	6a 00                	push   $0x0
  pushl $2
80106039:	6a 02                	push   $0x2
  jmp alltraps
8010603b:	e9 f8 fa ff ff       	jmp    80105b38 <alltraps>

80106040 <vector3>:
.globl vector3
vector3:
  pushl $0
80106040:	6a 00                	push   $0x0
  pushl $3
80106042:	6a 03                	push   $0x3
  jmp alltraps
80106044:	e9 ef fa ff ff       	jmp    80105b38 <alltraps>

80106049 <vector4>:
.globl vector4
vector4:
  pushl $0
80106049:	6a 00                	push   $0x0
  pushl $4
8010604b:	6a 04                	push   $0x4
  jmp alltraps
8010604d:	e9 e6 fa ff ff       	jmp    80105b38 <alltraps>

80106052 <vector5>:
.globl vector5
vector5:
  pushl $0
80106052:	6a 00                	push   $0x0
  pushl $5
80106054:	6a 05                	push   $0x5
  jmp alltraps
80106056:	e9 dd fa ff ff       	jmp    80105b38 <alltraps>

8010605b <vector6>:
.globl vector6
vector6:
  pushl $0
8010605b:	6a 00                	push   $0x0
  pushl $6
8010605d:	6a 06                	push   $0x6
  jmp alltraps
8010605f:	e9 d4 fa ff ff       	jmp    80105b38 <alltraps>

80106064 <vector7>:
.globl vector7
vector7:
  pushl $0
80106064:	6a 00                	push   $0x0
  pushl $7
80106066:	6a 07                	push   $0x7
  jmp alltraps
80106068:	e9 cb fa ff ff       	jmp    80105b38 <alltraps>

8010606d <vector8>:
.globl vector8
vector8:
  pushl $8
8010606d:	6a 08                	push   $0x8
  jmp alltraps
8010606f:	e9 c4 fa ff ff       	jmp    80105b38 <alltraps>

80106074 <vector9>:
.globl vector9
vector9:
  pushl $0
80106074:	6a 00                	push   $0x0
  pushl $9
80106076:	6a 09                	push   $0x9
  jmp alltraps
80106078:	e9 bb fa ff ff       	jmp    80105b38 <alltraps>

8010607d <vector10>:
.globl vector10
vector10:
  pushl $10
8010607d:	6a 0a                	push   $0xa
  jmp alltraps
8010607f:	e9 b4 fa ff ff       	jmp    80105b38 <alltraps>

80106084 <vector11>:
.globl vector11
vector11:
  pushl $11
80106084:	6a 0b                	push   $0xb
  jmp alltraps
80106086:	e9 ad fa ff ff       	jmp    80105b38 <alltraps>

8010608b <vector12>:
.globl vector12
vector12:
  pushl $12
8010608b:	6a 0c                	push   $0xc
  jmp alltraps
8010608d:	e9 a6 fa ff ff       	jmp    80105b38 <alltraps>

80106092 <vector13>:
.globl vector13
vector13:
  pushl $13
80106092:	6a 0d                	push   $0xd
  jmp alltraps
80106094:	e9 9f fa ff ff       	jmp    80105b38 <alltraps>

80106099 <vector14>:
.globl vector14
vector14:
  pushl $14
80106099:	6a 0e                	push   $0xe
  jmp alltraps
8010609b:	e9 98 fa ff ff       	jmp    80105b38 <alltraps>

801060a0 <vector15>:
.globl vector15
vector15:
  pushl $0
801060a0:	6a 00                	push   $0x0
  pushl $15
801060a2:	6a 0f                	push   $0xf
  jmp alltraps
801060a4:	e9 8f fa ff ff       	jmp    80105b38 <alltraps>

801060a9 <vector16>:
.globl vector16
vector16:
  pushl $0
801060a9:	6a 00                	push   $0x0
  pushl $16
801060ab:	6a 10                	push   $0x10
  jmp alltraps
801060ad:	e9 86 fa ff ff       	jmp    80105b38 <alltraps>

801060b2 <vector17>:
.globl vector17
vector17:
  pushl $17
801060b2:	6a 11                	push   $0x11
  jmp alltraps
801060b4:	e9 7f fa ff ff       	jmp    80105b38 <alltraps>

801060b9 <vector18>:
.globl vector18
vector18:
  pushl $0
801060b9:	6a 00                	push   $0x0
  pushl $18
801060bb:	6a 12                	push   $0x12
  jmp alltraps
801060bd:	e9 76 fa ff ff       	jmp    80105b38 <alltraps>

801060c2 <vector19>:
.globl vector19
vector19:
  pushl $0
801060c2:	6a 00                	push   $0x0
  pushl $19
801060c4:	6a 13                	push   $0x13
  jmp alltraps
801060c6:	e9 6d fa ff ff       	jmp    80105b38 <alltraps>

801060cb <vector20>:
.globl vector20
vector20:
  pushl $0
801060cb:	6a 00                	push   $0x0
  pushl $20
801060cd:	6a 14                	push   $0x14
  jmp alltraps
801060cf:	e9 64 fa ff ff       	jmp    80105b38 <alltraps>

801060d4 <vector21>:
.globl vector21
vector21:
  pushl $0
801060d4:	6a 00                	push   $0x0
  pushl $21
801060d6:	6a 15                	push   $0x15
  jmp alltraps
801060d8:	e9 5b fa ff ff       	jmp    80105b38 <alltraps>

801060dd <vector22>:
.globl vector22
vector22:
  pushl $0
801060dd:	6a 00                	push   $0x0
  pushl $22
801060df:	6a 16                	push   $0x16
  jmp alltraps
801060e1:	e9 52 fa ff ff       	jmp    80105b38 <alltraps>

801060e6 <vector23>:
.globl vector23
vector23:
  pushl $0
801060e6:	6a 00                	push   $0x0
  pushl $23
801060e8:	6a 17                	push   $0x17
  jmp alltraps
801060ea:	e9 49 fa ff ff       	jmp    80105b38 <alltraps>

801060ef <vector24>:
.globl vector24
vector24:
  pushl $0
801060ef:	6a 00                	push   $0x0
  pushl $24
801060f1:	6a 18                	push   $0x18
  jmp alltraps
801060f3:	e9 40 fa ff ff       	jmp    80105b38 <alltraps>

801060f8 <vector25>:
.globl vector25
vector25:
  pushl $0
801060f8:	6a 00                	push   $0x0
  pushl $25
801060fa:	6a 19                	push   $0x19
  jmp alltraps
801060fc:	e9 37 fa ff ff       	jmp    80105b38 <alltraps>

80106101 <vector26>:
.globl vector26
vector26:
  pushl $0
80106101:	6a 00                	push   $0x0
  pushl $26
80106103:	6a 1a                	push   $0x1a
  jmp alltraps
80106105:	e9 2e fa ff ff       	jmp    80105b38 <alltraps>

8010610a <vector27>:
.globl vector27
vector27:
  pushl $0
8010610a:	6a 00                	push   $0x0
  pushl $27
8010610c:	6a 1b                	push   $0x1b
  jmp alltraps
8010610e:	e9 25 fa ff ff       	jmp    80105b38 <alltraps>

80106113 <vector28>:
.globl vector28
vector28:
  pushl $0
80106113:	6a 00                	push   $0x0
  pushl $28
80106115:	6a 1c                	push   $0x1c
  jmp alltraps
80106117:	e9 1c fa ff ff       	jmp    80105b38 <alltraps>

8010611c <vector29>:
.globl vector29
vector29:
  pushl $0
8010611c:	6a 00                	push   $0x0
  pushl $29
8010611e:	6a 1d                	push   $0x1d
  jmp alltraps
80106120:	e9 13 fa ff ff       	jmp    80105b38 <alltraps>

80106125 <vector30>:
.globl vector30
vector30:
  pushl $0
80106125:	6a 00                	push   $0x0
  pushl $30
80106127:	6a 1e                	push   $0x1e
  jmp alltraps
80106129:	e9 0a fa ff ff       	jmp    80105b38 <alltraps>

8010612e <vector31>:
.globl vector31
vector31:
  pushl $0
8010612e:	6a 00                	push   $0x0
  pushl $31
80106130:	6a 1f                	push   $0x1f
  jmp alltraps
80106132:	e9 01 fa ff ff       	jmp    80105b38 <alltraps>

80106137 <vector32>:
.globl vector32
vector32:
  pushl $0
80106137:	6a 00                	push   $0x0
  pushl $32
80106139:	6a 20                	push   $0x20
  jmp alltraps
8010613b:	e9 f8 f9 ff ff       	jmp    80105b38 <alltraps>

80106140 <vector33>:
.globl vector33
vector33:
  pushl $0
80106140:	6a 00                	push   $0x0
  pushl $33
80106142:	6a 21                	push   $0x21
  jmp alltraps
80106144:	e9 ef f9 ff ff       	jmp    80105b38 <alltraps>

80106149 <vector34>:
.globl vector34
vector34:
  pushl $0
80106149:	6a 00                	push   $0x0
  pushl $34
8010614b:	6a 22                	push   $0x22
  jmp alltraps
8010614d:	e9 e6 f9 ff ff       	jmp    80105b38 <alltraps>

80106152 <vector35>:
.globl vector35
vector35:
  pushl $0
80106152:	6a 00                	push   $0x0
  pushl $35
80106154:	6a 23                	push   $0x23
  jmp alltraps
80106156:	e9 dd f9 ff ff       	jmp    80105b38 <alltraps>

8010615b <vector36>:
.globl vector36
vector36:
  pushl $0
8010615b:	6a 00                	push   $0x0
  pushl $36
8010615d:	6a 24                	push   $0x24
  jmp alltraps
8010615f:	e9 d4 f9 ff ff       	jmp    80105b38 <alltraps>

80106164 <vector37>:
.globl vector37
vector37:
  pushl $0
80106164:	6a 00                	push   $0x0
  pushl $37
80106166:	6a 25                	push   $0x25
  jmp alltraps
80106168:	e9 cb f9 ff ff       	jmp    80105b38 <alltraps>

8010616d <vector38>:
.globl vector38
vector38:
  pushl $0
8010616d:	6a 00                	push   $0x0
  pushl $38
8010616f:	6a 26                	push   $0x26
  jmp alltraps
80106171:	e9 c2 f9 ff ff       	jmp    80105b38 <alltraps>

80106176 <vector39>:
.globl vector39
vector39:
  pushl $0
80106176:	6a 00                	push   $0x0
  pushl $39
80106178:	6a 27                	push   $0x27
  jmp alltraps
8010617a:	e9 b9 f9 ff ff       	jmp    80105b38 <alltraps>

8010617f <vector40>:
.globl vector40
vector40:
  pushl $0
8010617f:	6a 00                	push   $0x0
  pushl $40
80106181:	6a 28                	push   $0x28
  jmp alltraps
80106183:	e9 b0 f9 ff ff       	jmp    80105b38 <alltraps>

80106188 <vector41>:
.globl vector41
vector41:
  pushl $0
80106188:	6a 00                	push   $0x0
  pushl $41
8010618a:	6a 29                	push   $0x29
  jmp alltraps
8010618c:	e9 a7 f9 ff ff       	jmp    80105b38 <alltraps>

80106191 <vector42>:
.globl vector42
vector42:
  pushl $0
80106191:	6a 00                	push   $0x0
  pushl $42
80106193:	6a 2a                	push   $0x2a
  jmp alltraps
80106195:	e9 9e f9 ff ff       	jmp    80105b38 <alltraps>

8010619a <vector43>:
.globl vector43
vector43:
  pushl $0
8010619a:	6a 00                	push   $0x0
  pushl $43
8010619c:	6a 2b                	push   $0x2b
  jmp alltraps
8010619e:	e9 95 f9 ff ff       	jmp    80105b38 <alltraps>

801061a3 <vector44>:
.globl vector44
vector44:
  pushl $0
801061a3:	6a 00                	push   $0x0
  pushl $44
801061a5:	6a 2c                	push   $0x2c
  jmp alltraps
801061a7:	e9 8c f9 ff ff       	jmp    80105b38 <alltraps>

801061ac <vector45>:
.globl vector45
vector45:
  pushl $0
801061ac:	6a 00                	push   $0x0
  pushl $45
801061ae:	6a 2d                	push   $0x2d
  jmp alltraps
801061b0:	e9 83 f9 ff ff       	jmp    80105b38 <alltraps>

801061b5 <vector46>:
.globl vector46
vector46:
  pushl $0
801061b5:	6a 00                	push   $0x0
  pushl $46
801061b7:	6a 2e                	push   $0x2e
  jmp alltraps
801061b9:	e9 7a f9 ff ff       	jmp    80105b38 <alltraps>

801061be <vector47>:
.globl vector47
vector47:
  pushl $0
801061be:	6a 00                	push   $0x0
  pushl $47
801061c0:	6a 2f                	push   $0x2f
  jmp alltraps
801061c2:	e9 71 f9 ff ff       	jmp    80105b38 <alltraps>

801061c7 <vector48>:
.globl vector48
vector48:
  pushl $0
801061c7:	6a 00                	push   $0x0
  pushl $48
801061c9:	6a 30                	push   $0x30
  jmp alltraps
801061cb:	e9 68 f9 ff ff       	jmp    80105b38 <alltraps>

801061d0 <vector49>:
.globl vector49
vector49:
  pushl $0
801061d0:	6a 00                	push   $0x0
  pushl $49
801061d2:	6a 31                	push   $0x31
  jmp alltraps
801061d4:	e9 5f f9 ff ff       	jmp    80105b38 <alltraps>

801061d9 <vector50>:
.globl vector50
vector50:
  pushl $0
801061d9:	6a 00                	push   $0x0
  pushl $50
801061db:	6a 32                	push   $0x32
  jmp alltraps
801061dd:	e9 56 f9 ff ff       	jmp    80105b38 <alltraps>

801061e2 <vector51>:
.globl vector51
vector51:
  pushl $0
801061e2:	6a 00                	push   $0x0
  pushl $51
801061e4:	6a 33                	push   $0x33
  jmp alltraps
801061e6:	e9 4d f9 ff ff       	jmp    80105b38 <alltraps>

801061eb <vector52>:
.globl vector52
vector52:
  pushl $0
801061eb:	6a 00                	push   $0x0
  pushl $52
801061ed:	6a 34                	push   $0x34
  jmp alltraps
801061ef:	e9 44 f9 ff ff       	jmp    80105b38 <alltraps>

801061f4 <vector53>:
.globl vector53
vector53:
  pushl $0
801061f4:	6a 00                	push   $0x0
  pushl $53
801061f6:	6a 35                	push   $0x35
  jmp alltraps
801061f8:	e9 3b f9 ff ff       	jmp    80105b38 <alltraps>

801061fd <vector54>:
.globl vector54
vector54:
  pushl $0
801061fd:	6a 00                	push   $0x0
  pushl $54
801061ff:	6a 36                	push   $0x36
  jmp alltraps
80106201:	e9 32 f9 ff ff       	jmp    80105b38 <alltraps>

80106206 <vector55>:
.globl vector55
vector55:
  pushl $0
80106206:	6a 00                	push   $0x0
  pushl $55
80106208:	6a 37                	push   $0x37
  jmp alltraps
8010620a:	e9 29 f9 ff ff       	jmp    80105b38 <alltraps>

8010620f <vector56>:
.globl vector56
vector56:
  pushl $0
8010620f:	6a 00                	push   $0x0
  pushl $56
80106211:	6a 38                	push   $0x38
  jmp alltraps
80106213:	e9 20 f9 ff ff       	jmp    80105b38 <alltraps>

80106218 <vector57>:
.globl vector57
vector57:
  pushl $0
80106218:	6a 00                	push   $0x0
  pushl $57
8010621a:	6a 39                	push   $0x39
  jmp alltraps
8010621c:	e9 17 f9 ff ff       	jmp    80105b38 <alltraps>

80106221 <vector58>:
.globl vector58
vector58:
  pushl $0
80106221:	6a 00                	push   $0x0
  pushl $58
80106223:	6a 3a                	push   $0x3a
  jmp alltraps
80106225:	e9 0e f9 ff ff       	jmp    80105b38 <alltraps>

8010622a <vector59>:
.globl vector59
vector59:
  pushl $0
8010622a:	6a 00                	push   $0x0
  pushl $59
8010622c:	6a 3b                	push   $0x3b
  jmp alltraps
8010622e:	e9 05 f9 ff ff       	jmp    80105b38 <alltraps>

80106233 <vector60>:
.globl vector60
vector60:
  pushl $0
80106233:	6a 00                	push   $0x0
  pushl $60
80106235:	6a 3c                	push   $0x3c
  jmp alltraps
80106237:	e9 fc f8 ff ff       	jmp    80105b38 <alltraps>

8010623c <vector61>:
.globl vector61
vector61:
  pushl $0
8010623c:	6a 00                	push   $0x0
  pushl $61
8010623e:	6a 3d                	push   $0x3d
  jmp alltraps
80106240:	e9 f3 f8 ff ff       	jmp    80105b38 <alltraps>

80106245 <vector62>:
.globl vector62
vector62:
  pushl $0
80106245:	6a 00                	push   $0x0
  pushl $62
80106247:	6a 3e                	push   $0x3e
  jmp alltraps
80106249:	e9 ea f8 ff ff       	jmp    80105b38 <alltraps>

8010624e <vector63>:
.globl vector63
vector63:
  pushl $0
8010624e:	6a 00                	push   $0x0
  pushl $63
80106250:	6a 3f                	push   $0x3f
  jmp alltraps
80106252:	e9 e1 f8 ff ff       	jmp    80105b38 <alltraps>

80106257 <vector64>:
.globl vector64
vector64:
  pushl $0
80106257:	6a 00                	push   $0x0
  pushl $64
80106259:	6a 40                	push   $0x40
  jmp alltraps
8010625b:	e9 d8 f8 ff ff       	jmp    80105b38 <alltraps>

80106260 <vector65>:
.globl vector65
vector65:
  pushl $0
80106260:	6a 00                	push   $0x0
  pushl $65
80106262:	6a 41                	push   $0x41
  jmp alltraps
80106264:	e9 cf f8 ff ff       	jmp    80105b38 <alltraps>

80106269 <vector66>:
.globl vector66
vector66:
  pushl $0
80106269:	6a 00                	push   $0x0
  pushl $66
8010626b:	6a 42                	push   $0x42
  jmp alltraps
8010626d:	e9 c6 f8 ff ff       	jmp    80105b38 <alltraps>

80106272 <vector67>:
.globl vector67
vector67:
  pushl $0
80106272:	6a 00                	push   $0x0
  pushl $67
80106274:	6a 43                	push   $0x43
  jmp alltraps
80106276:	e9 bd f8 ff ff       	jmp    80105b38 <alltraps>

8010627b <vector68>:
.globl vector68
vector68:
  pushl $0
8010627b:	6a 00                	push   $0x0
  pushl $68
8010627d:	6a 44                	push   $0x44
  jmp alltraps
8010627f:	e9 b4 f8 ff ff       	jmp    80105b38 <alltraps>

80106284 <vector69>:
.globl vector69
vector69:
  pushl $0
80106284:	6a 00                	push   $0x0
  pushl $69
80106286:	6a 45                	push   $0x45
  jmp alltraps
80106288:	e9 ab f8 ff ff       	jmp    80105b38 <alltraps>

8010628d <vector70>:
.globl vector70
vector70:
  pushl $0
8010628d:	6a 00                	push   $0x0
  pushl $70
8010628f:	6a 46                	push   $0x46
  jmp alltraps
80106291:	e9 a2 f8 ff ff       	jmp    80105b38 <alltraps>

80106296 <vector71>:
.globl vector71
vector71:
  pushl $0
80106296:	6a 00                	push   $0x0
  pushl $71
80106298:	6a 47                	push   $0x47
  jmp alltraps
8010629a:	e9 99 f8 ff ff       	jmp    80105b38 <alltraps>

8010629f <vector72>:
.globl vector72
vector72:
  pushl $0
8010629f:	6a 00                	push   $0x0
  pushl $72
801062a1:	6a 48                	push   $0x48
  jmp alltraps
801062a3:	e9 90 f8 ff ff       	jmp    80105b38 <alltraps>

801062a8 <vector73>:
.globl vector73
vector73:
  pushl $0
801062a8:	6a 00                	push   $0x0
  pushl $73
801062aa:	6a 49                	push   $0x49
  jmp alltraps
801062ac:	e9 87 f8 ff ff       	jmp    80105b38 <alltraps>

801062b1 <vector74>:
.globl vector74
vector74:
  pushl $0
801062b1:	6a 00                	push   $0x0
  pushl $74
801062b3:	6a 4a                	push   $0x4a
  jmp alltraps
801062b5:	e9 7e f8 ff ff       	jmp    80105b38 <alltraps>

801062ba <vector75>:
.globl vector75
vector75:
  pushl $0
801062ba:	6a 00                	push   $0x0
  pushl $75
801062bc:	6a 4b                	push   $0x4b
  jmp alltraps
801062be:	e9 75 f8 ff ff       	jmp    80105b38 <alltraps>

801062c3 <vector76>:
.globl vector76
vector76:
  pushl $0
801062c3:	6a 00                	push   $0x0
  pushl $76
801062c5:	6a 4c                	push   $0x4c
  jmp alltraps
801062c7:	e9 6c f8 ff ff       	jmp    80105b38 <alltraps>

801062cc <vector77>:
.globl vector77
vector77:
  pushl $0
801062cc:	6a 00                	push   $0x0
  pushl $77
801062ce:	6a 4d                	push   $0x4d
  jmp alltraps
801062d0:	e9 63 f8 ff ff       	jmp    80105b38 <alltraps>

801062d5 <vector78>:
.globl vector78
vector78:
  pushl $0
801062d5:	6a 00                	push   $0x0
  pushl $78
801062d7:	6a 4e                	push   $0x4e
  jmp alltraps
801062d9:	e9 5a f8 ff ff       	jmp    80105b38 <alltraps>

801062de <vector79>:
.globl vector79
vector79:
  pushl $0
801062de:	6a 00                	push   $0x0
  pushl $79
801062e0:	6a 4f                	push   $0x4f
  jmp alltraps
801062e2:	e9 51 f8 ff ff       	jmp    80105b38 <alltraps>

801062e7 <vector80>:
.globl vector80
vector80:
  pushl $0
801062e7:	6a 00                	push   $0x0
  pushl $80
801062e9:	6a 50                	push   $0x50
  jmp alltraps
801062eb:	e9 48 f8 ff ff       	jmp    80105b38 <alltraps>

801062f0 <vector81>:
.globl vector81
vector81:
  pushl $0
801062f0:	6a 00                	push   $0x0
  pushl $81
801062f2:	6a 51                	push   $0x51
  jmp alltraps
801062f4:	e9 3f f8 ff ff       	jmp    80105b38 <alltraps>

801062f9 <vector82>:
.globl vector82
vector82:
  pushl $0
801062f9:	6a 00                	push   $0x0
  pushl $82
801062fb:	6a 52                	push   $0x52
  jmp alltraps
801062fd:	e9 36 f8 ff ff       	jmp    80105b38 <alltraps>

80106302 <vector83>:
.globl vector83
vector83:
  pushl $0
80106302:	6a 00                	push   $0x0
  pushl $83
80106304:	6a 53                	push   $0x53
  jmp alltraps
80106306:	e9 2d f8 ff ff       	jmp    80105b38 <alltraps>

8010630b <vector84>:
.globl vector84
vector84:
  pushl $0
8010630b:	6a 00                	push   $0x0
  pushl $84
8010630d:	6a 54                	push   $0x54
  jmp alltraps
8010630f:	e9 24 f8 ff ff       	jmp    80105b38 <alltraps>

80106314 <vector85>:
.globl vector85
vector85:
  pushl $0
80106314:	6a 00                	push   $0x0
  pushl $85
80106316:	6a 55                	push   $0x55
  jmp alltraps
80106318:	e9 1b f8 ff ff       	jmp    80105b38 <alltraps>

8010631d <vector86>:
.globl vector86
vector86:
  pushl $0
8010631d:	6a 00                	push   $0x0
  pushl $86
8010631f:	6a 56                	push   $0x56
  jmp alltraps
80106321:	e9 12 f8 ff ff       	jmp    80105b38 <alltraps>

80106326 <vector87>:
.globl vector87
vector87:
  pushl $0
80106326:	6a 00                	push   $0x0
  pushl $87
80106328:	6a 57                	push   $0x57
  jmp alltraps
8010632a:	e9 09 f8 ff ff       	jmp    80105b38 <alltraps>

8010632f <vector88>:
.globl vector88
vector88:
  pushl $0
8010632f:	6a 00                	push   $0x0
  pushl $88
80106331:	6a 58                	push   $0x58
  jmp alltraps
80106333:	e9 00 f8 ff ff       	jmp    80105b38 <alltraps>

80106338 <vector89>:
.globl vector89
vector89:
  pushl $0
80106338:	6a 00                	push   $0x0
  pushl $89
8010633a:	6a 59                	push   $0x59
  jmp alltraps
8010633c:	e9 f7 f7 ff ff       	jmp    80105b38 <alltraps>

80106341 <vector90>:
.globl vector90
vector90:
  pushl $0
80106341:	6a 00                	push   $0x0
  pushl $90
80106343:	6a 5a                	push   $0x5a
  jmp alltraps
80106345:	e9 ee f7 ff ff       	jmp    80105b38 <alltraps>

8010634a <vector91>:
.globl vector91
vector91:
  pushl $0
8010634a:	6a 00                	push   $0x0
  pushl $91
8010634c:	6a 5b                	push   $0x5b
  jmp alltraps
8010634e:	e9 e5 f7 ff ff       	jmp    80105b38 <alltraps>

80106353 <vector92>:
.globl vector92
vector92:
  pushl $0
80106353:	6a 00                	push   $0x0
  pushl $92
80106355:	6a 5c                	push   $0x5c
  jmp alltraps
80106357:	e9 dc f7 ff ff       	jmp    80105b38 <alltraps>

8010635c <vector93>:
.globl vector93
vector93:
  pushl $0
8010635c:	6a 00                	push   $0x0
  pushl $93
8010635e:	6a 5d                	push   $0x5d
  jmp alltraps
80106360:	e9 d3 f7 ff ff       	jmp    80105b38 <alltraps>

80106365 <vector94>:
.globl vector94
vector94:
  pushl $0
80106365:	6a 00                	push   $0x0
  pushl $94
80106367:	6a 5e                	push   $0x5e
  jmp alltraps
80106369:	e9 ca f7 ff ff       	jmp    80105b38 <alltraps>

8010636e <vector95>:
.globl vector95
vector95:
  pushl $0
8010636e:	6a 00                	push   $0x0
  pushl $95
80106370:	6a 5f                	push   $0x5f
  jmp alltraps
80106372:	e9 c1 f7 ff ff       	jmp    80105b38 <alltraps>

80106377 <vector96>:
.globl vector96
vector96:
  pushl $0
80106377:	6a 00                	push   $0x0
  pushl $96
80106379:	6a 60                	push   $0x60
  jmp alltraps
8010637b:	e9 b8 f7 ff ff       	jmp    80105b38 <alltraps>

80106380 <vector97>:
.globl vector97
vector97:
  pushl $0
80106380:	6a 00                	push   $0x0
  pushl $97
80106382:	6a 61                	push   $0x61
  jmp alltraps
80106384:	e9 af f7 ff ff       	jmp    80105b38 <alltraps>

80106389 <vector98>:
.globl vector98
vector98:
  pushl $0
80106389:	6a 00                	push   $0x0
  pushl $98
8010638b:	6a 62                	push   $0x62
  jmp alltraps
8010638d:	e9 a6 f7 ff ff       	jmp    80105b38 <alltraps>

80106392 <vector99>:
.globl vector99
vector99:
  pushl $0
80106392:	6a 00                	push   $0x0
  pushl $99
80106394:	6a 63                	push   $0x63
  jmp alltraps
80106396:	e9 9d f7 ff ff       	jmp    80105b38 <alltraps>

8010639b <vector100>:
.globl vector100
vector100:
  pushl $0
8010639b:	6a 00                	push   $0x0
  pushl $100
8010639d:	6a 64                	push   $0x64
  jmp alltraps
8010639f:	e9 94 f7 ff ff       	jmp    80105b38 <alltraps>

801063a4 <vector101>:
.globl vector101
vector101:
  pushl $0
801063a4:	6a 00                	push   $0x0
  pushl $101
801063a6:	6a 65                	push   $0x65
  jmp alltraps
801063a8:	e9 8b f7 ff ff       	jmp    80105b38 <alltraps>

801063ad <vector102>:
.globl vector102
vector102:
  pushl $0
801063ad:	6a 00                	push   $0x0
  pushl $102
801063af:	6a 66                	push   $0x66
  jmp alltraps
801063b1:	e9 82 f7 ff ff       	jmp    80105b38 <alltraps>

801063b6 <vector103>:
.globl vector103
vector103:
  pushl $0
801063b6:	6a 00                	push   $0x0
  pushl $103
801063b8:	6a 67                	push   $0x67
  jmp alltraps
801063ba:	e9 79 f7 ff ff       	jmp    80105b38 <alltraps>

801063bf <vector104>:
.globl vector104
vector104:
  pushl $0
801063bf:	6a 00                	push   $0x0
  pushl $104
801063c1:	6a 68                	push   $0x68
  jmp alltraps
801063c3:	e9 70 f7 ff ff       	jmp    80105b38 <alltraps>

801063c8 <vector105>:
.globl vector105
vector105:
  pushl $0
801063c8:	6a 00                	push   $0x0
  pushl $105
801063ca:	6a 69                	push   $0x69
  jmp alltraps
801063cc:	e9 67 f7 ff ff       	jmp    80105b38 <alltraps>

801063d1 <vector106>:
.globl vector106
vector106:
  pushl $0
801063d1:	6a 00                	push   $0x0
  pushl $106
801063d3:	6a 6a                	push   $0x6a
  jmp alltraps
801063d5:	e9 5e f7 ff ff       	jmp    80105b38 <alltraps>

801063da <vector107>:
.globl vector107
vector107:
  pushl $0
801063da:	6a 00                	push   $0x0
  pushl $107
801063dc:	6a 6b                	push   $0x6b
  jmp alltraps
801063de:	e9 55 f7 ff ff       	jmp    80105b38 <alltraps>

801063e3 <vector108>:
.globl vector108
vector108:
  pushl $0
801063e3:	6a 00                	push   $0x0
  pushl $108
801063e5:	6a 6c                	push   $0x6c
  jmp alltraps
801063e7:	e9 4c f7 ff ff       	jmp    80105b38 <alltraps>

801063ec <vector109>:
.globl vector109
vector109:
  pushl $0
801063ec:	6a 00                	push   $0x0
  pushl $109
801063ee:	6a 6d                	push   $0x6d
  jmp alltraps
801063f0:	e9 43 f7 ff ff       	jmp    80105b38 <alltraps>

801063f5 <vector110>:
.globl vector110
vector110:
  pushl $0
801063f5:	6a 00                	push   $0x0
  pushl $110
801063f7:	6a 6e                	push   $0x6e
  jmp alltraps
801063f9:	e9 3a f7 ff ff       	jmp    80105b38 <alltraps>

801063fe <vector111>:
.globl vector111
vector111:
  pushl $0
801063fe:	6a 00                	push   $0x0
  pushl $111
80106400:	6a 6f                	push   $0x6f
  jmp alltraps
80106402:	e9 31 f7 ff ff       	jmp    80105b38 <alltraps>

80106407 <vector112>:
.globl vector112
vector112:
  pushl $0
80106407:	6a 00                	push   $0x0
  pushl $112
80106409:	6a 70                	push   $0x70
  jmp alltraps
8010640b:	e9 28 f7 ff ff       	jmp    80105b38 <alltraps>

80106410 <vector113>:
.globl vector113
vector113:
  pushl $0
80106410:	6a 00                	push   $0x0
  pushl $113
80106412:	6a 71                	push   $0x71
  jmp alltraps
80106414:	e9 1f f7 ff ff       	jmp    80105b38 <alltraps>

80106419 <vector114>:
.globl vector114
vector114:
  pushl $0
80106419:	6a 00                	push   $0x0
  pushl $114
8010641b:	6a 72                	push   $0x72
  jmp alltraps
8010641d:	e9 16 f7 ff ff       	jmp    80105b38 <alltraps>

80106422 <vector115>:
.globl vector115
vector115:
  pushl $0
80106422:	6a 00                	push   $0x0
  pushl $115
80106424:	6a 73                	push   $0x73
  jmp alltraps
80106426:	e9 0d f7 ff ff       	jmp    80105b38 <alltraps>

8010642b <vector116>:
.globl vector116
vector116:
  pushl $0
8010642b:	6a 00                	push   $0x0
  pushl $116
8010642d:	6a 74                	push   $0x74
  jmp alltraps
8010642f:	e9 04 f7 ff ff       	jmp    80105b38 <alltraps>

80106434 <vector117>:
.globl vector117
vector117:
  pushl $0
80106434:	6a 00                	push   $0x0
  pushl $117
80106436:	6a 75                	push   $0x75
  jmp alltraps
80106438:	e9 fb f6 ff ff       	jmp    80105b38 <alltraps>

8010643d <vector118>:
.globl vector118
vector118:
  pushl $0
8010643d:	6a 00                	push   $0x0
  pushl $118
8010643f:	6a 76                	push   $0x76
  jmp alltraps
80106441:	e9 f2 f6 ff ff       	jmp    80105b38 <alltraps>

80106446 <vector119>:
.globl vector119
vector119:
  pushl $0
80106446:	6a 00                	push   $0x0
  pushl $119
80106448:	6a 77                	push   $0x77
  jmp alltraps
8010644a:	e9 e9 f6 ff ff       	jmp    80105b38 <alltraps>

8010644f <vector120>:
.globl vector120
vector120:
  pushl $0
8010644f:	6a 00                	push   $0x0
  pushl $120
80106451:	6a 78                	push   $0x78
  jmp alltraps
80106453:	e9 e0 f6 ff ff       	jmp    80105b38 <alltraps>

80106458 <vector121>:
.globl vector121
vector121:
  pushl $0
80106458:	6a 00                	push   $0x0
  pushl $121
8010645a:	6a 79                	push   $0x79
  jmp alltraps
8010645c:	e9 d7 f6 ff ff       	jmp    80105b38 <alltraps>

80106461 <vector122>:
.globl vector122
vector122:
  pushl $0
80106461:	6a 00                	push   $0x0
  pushl $122
80106463:	6a 7a                	push   $0x7a
  jmp alltraps
80106465:	e9 ce f6 ff ff       	jmp    80105b38 <alltraps>

8010646a <vector123>:
.globl vector123
vector123:
  pushl $0
8010646a:	6a 00                	push   $0x0
  pushl $123
8010646c:	6a 7b                	push   $0x7b
  jmp alltraps
8010646e:	e9 c5 f6 ff ff       	jmp    80105b38 <alltraps>

80106473 <vector124>:
.globl vector124
vector124:
  pushl $0
80106473:	6a 00                	push   $0x0
  pushl $124
80106475:	6a 7c                	push   $0x7c
  jmp alltraps
80106477:	e9 bc f6 ff ff       	jmp    80105b38 <alltraps>

8010647c <vector125>:
.globl vector125
vector125:
  pushl $0
8010647c:	6a 00                	push   $0x0
  pushl $125
8010647e:	6a 7d                	push   $0x7d
  jmp alltraps
80106480:	e9 b3 f6 ff ff       	jmp    80105b38 <alltraps>

80106485 <vector126>:
.globl vector126
vector126:
  pushl $0
80106485:	6a 00                	push   $0x0
  pushl $126
80106487:	6a 7e                	push   $0x7e
  jmp alltraps
80106489:	e9 aa f6 ff ff       	jmp    80105b38 <alltraps>

8010648e <vector127>:
.globl vector127
vector127:
  pushl $0
8010648e:	6a 00                	push   $0x0
  pushl $127
80106490:	6a 7f                	push   $0x7f
  jmp alltraps
80106492:	e9 a1 f6 ff ff       	jmp    80105b38 <alltraps>

80106497 <vector128>:
.globl vector128
vector128:
  pushl $0
80106497:	6a 00                	push   $0x0
  pushl $128
80106499:	68 80 00 00 00       	push   $0x80
  jmp alltraps
8010649e:	e9 95 f6 ff ff       	jmp    80105b38 <alltraps>

801064a3 <vector129>:
.globl vector129
vector129:
  pushl $0
801064a3:	6a 00                	push   $0x0
  pushl $129
801064a5:	68 81 00 00 00       	push   $0x81
  jmp alltraps
801064aa:	e9 89 f6 ff ff       	jmp    80105b38 <alltraps>

801064af <vector130>:
.globl vector130
vector130:
  pushl $0
801064af:	6a 00                	push   $0x0
  pushl $130
801064b1:	68 82 00 00 00       	push   $0x82
  jmp alltraps
801064b6:	e9 7d f6 ff ff       	jmp    80105b38 <alltraps>

801064bb <vector131>:
.globl vector131
vector131:
  pushl $0
801064bb:	6a 00                	push   $0x0
  pushl $131
801064bd:	68 83 00 00 00       	push   $0x83
  jmp alltraps
801064c2:	e9 71 f6 ff ff       	jmp    80105b38 <alltraps>

801064c7 <vector132>:
.globl vector132
vector132:
  pushl $0
801064c7:	6a 00                	push   $0x0
  pushl $132
801064c9:	68 84 00 00 00       	push   $0x84
  jmp alltraps
801064ce:	e9 65 f6 ff ff       	jmp    80105b38 <alltraps>

801064d3 <vector133>:
.globl vector133
vector133:
  pushl $0
801064d3:	6a 00                	push   $0x0
  pushl $133
801064d5:	68 85 00 00 00       	push   $0x85
  jmp alltraps
801064da:	e9 59 f6 ff ff       	jmp    80105b38 <alltraps>

801064df <vector134>:
.globl vector134
vector134:
  pushl $0
801064df:	6a 00                	push   $0x0
  pushl $134
801064e1:	68 86 00 00 00       	push   $0x86
  jmp alltraps
801064e6:	e9 4d f6 ff ff       	jmp    80105b38 <alltraps>

801064eb <vector135>:
.globl vector135
vector135:
  pushl $0
801064eb:	6a 00                	push   $0x0
  pushl $135
801064ed:	68 87 00 00 00       	push   $0x87
  jmp alltraps
801064f2:	e9 41 f6 ff ff       	jmp    80105b38 <alltraps>

801064f7 <vector136>:
.globl vector136
vector136:
  pushl $0
801064f7:	6a 00                	push   $0x0
  pushl $136
801064f9:	68 88 00 00 00       	push   $0x88
  jmp alltraps
801064fe:	e9 35 f6 ff ff       	jmp    80105b38 <alltraps>

80106503 <vector137>:
.globl vector137
vector137:
  pushl $0
80106503:	6a 00                	push   $0x0
  pushl $137
80106505:	68 89 00 00 00       	push   $0x89
  jmp alltraps
8010650a:	e9 29 f6 ff ff       	jmp    80105b38 <alltraps>

8010650f <vector138>:
.globl vector138
vector138:
  pushl $0
8010650f:	6a 00                	push   $0x0
  pushl $138
80106511:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
80106516:	e9 1d f6 ff ff       	jmp    80105b38 <alltraps>

8010651b <vector139>:
.globl vector139
vector139:
  pushl $0
8010651b:	6a 00                	push   $0x0
  pushl $139
8010651d:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80106522:	e9 11 f6 ff ff       	jmp    80105b38 <alltraps>

80106527 <vector140>:
.globl vector140
vector140:
  pushl $0
80106527:	6a 00                	push   $0x0
  pushl $140
80106529:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
8010652e:	e9 05 f6 ff ff       	jmp    80105b38 <alltraps>

80106533 <vector141>:
.globl vector141
vector141:
  pushl $0
80106533:	6a 00                	push   $0x0
  pushl $141
80106535:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
8010653a:	e9 f9 f5 ff ff       	jmp    80105b38 <alltraps>

8010653f <vector142>:
.globl vector142
vector142:
  pushl $0
8010653f:	6a 00                	push   $0x0
  pushl $142
80106541:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80106546:	e9 ed f5 ff ff       	jmp    80105b38 <alltraps>

8010654b <vector143>:
.globl vector143
vector143:
  pushl $0
8010654b:	6a 00                	push   $0x0
  pushl $143
8010654d:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106552:	e9 e1 f5 ff ff       	jmp    80105b38 <alltraps>

80106557 <vector144>:
.globl vector144
vector144:
  pushl $0
80106557:	6a 00                	push   $0x0
  pushl $144
80106559:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010655e:	e9 d5 f5 ff ff       	jmp    80105b38 <alltraps>

80106563 <vector145>:
.globl vector145
vector145:
  pushl $0
80106563:	6a 00                	push   $0x0
  pushl $145
80106565:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010656a:	e9 c9 f5 ff ff       	jmp    80105b38 <alltraps>

8010656f <vector146>:
.globl vector146
vector146:
  pushl $0
8010656f:	6a 00                	push   $0x0
  pushl $146
80106571:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106576:	e9 bd f5 ff ff       	jmp    80105b38 <alltraps>

8010657b <vector147>:
.globl vector147
vector147:
  pushl $0
8010657b:	6a 00                	push   $0x0
  pushl $147
8010657d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106582:	e9 b1 f5 ff ff       	jmp    80105b38 <alltraps>

80106587 <vector148>:
.globl vector148
vector148:
  pushl $0
80106587:	6a 00                	push   $0x0
  pushl $148
80106589:	68 94 00 00 00       	push   $0x94
  jmp alltraps
8010658e:	e9 a5 f5 ff ff       	jmp    80105b38 <alltraps>

80106593 <vector149>:
.globl vector149
vector149:
  pushl $0
80106593:	6a 00                	push   $0x0
  pushl $149
80106595:	68 95 00 00 00       	push   $0x95
  jmp alltraps
8010659a:	e9 99 f5 ff ff       	jmp    80105b38 <alltraps>

8010659f <vector150>:
.globl vector150
vector150:
  pushl $0
8010659f:	6a 00                	push   $0x0
  pushl $150
801065a1:	68 96 00 00 00       	push   $0x96
  jmp alltraps
801065a6:	e9 8d f5 ff ff       	jmp    80105b38 <alltraps>

801065ab <vector151>:
.globl vector151
vector151:
  pushl $0
801065ab:	6a 00                	push   $0x0
  pushl $151
801065ad:	68 97 00 00 00       	push   $0x97
  jmp alltraps
801065b2:	e9 81 f5 ff ff       	jmp    80105b38 <alltraps>

801065b7 <vector152>:
.globl vector152
vector152:
  pushl $0
801065b7:	6a 00                	push   $0x0
  pushl $152
801065b9:	68 98 00 00 00       	push   $0x98
  jmp alltraps
801065be:	e9 75 f5 ff ff       	jmp    80105b38 <alltraps>

801065c3 <vector153>:
.globl vector153
vector153:
  pushl $0
801065c3:	6a 00                	push   $0x0
  pushl $153
801065c5:	68 99 00 00 00       	push   $0x99
  jmp alltraps
801065ca:	e9 69 f5 ff ff       	jmp    80105b38 <alltraps>

801065cf <vector154>:
.globl vector154
vector154:
  pushl $0
801065cf:	6a 00                	push   $0x0
  pushl $154
801065d1:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
801065d6:	e9 5d f5 ff ff       	jmp    80105b38 <alltraps>

801065db <vector155>:
.globl vector155
vector155:
  pushl $0
801065db:	6a 00                	push   $0x0
  pushl $155
801065dd:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
801065e2:	e9 51 f5 ff ff       	jmp    80105b38 <alltraps>

801065e7 <vector156>:
.globl vector156
vector156:
  pushl $0
801065e7:	6a 00                	push   $0x0
  pushl $156
801065e9:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
801065ee:	e9 45 f5 ff ff       	jmp    80105b38 <alltraps>

801065f3 <vector157>:
.globl vector157
vector157:
  pushl $0
801065f3:	6a 00                	push   $0x0
  pushl $157
801065f5:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
801065fa:	e9 39 f5 ff ff       	jmp    80105b38 <alltraps>

801065ff <vector158>:
.globl vector158
vector158:
  pushl $0
801065ff:	6a 00                	push   $0x0
  pushl $158
80106601:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80106606:	e9 2d f5 ff ff       	jmp    80105b38 <alltraps>

8010660b <vector159>:
.globl vector159
vector159:
  pushl $0
8010660b:	6a 00                	push   $0x0
  pushl $159
8010660d:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80106612:	e9 21 f5 ff ff       	jmp    80105b38 <alltraps>

80106617 <vector160>:
.globl vector160
vector160:
  pushl $0
80106617:	6a 00                	push   $0x0
  pushl $160
80106619:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
8010661e:	e9 15 f5 ff ff       	jmp    80105b38 <alltraps>

80106623 <vector161>:
.globl vector161
vector161:
  pushl $0
80106623:	6a 00                	push   $0x0
  pushl $161
80106625:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
8010662a:	e9 09 f5 ff ff       	jmp    80105b38 <alltraps>

8010662f <vector162>:
.globl vector162
vector162:
  pushl $0
8010662f:	6a 00                	push   $0x0
  pushl $162
80106631:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80106636:	e9 fd f4 ff ff       	jmp    80105b38 <alltraps>

8010663b <vector163>:
.globl vector163
vector163:
  pushl $0
8010663b:	6a 00                	push   $0x0
  pushl $163
8010663d:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106642:	e9 f1 f4 ff ff       	jmp    80105b38 <alltraps>

80106647 <vector164>:
.globl vector164
vector164:
  pushl $0
80106647:	6a 00                	push   $0x0
  pushl $164
80106649:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
8010664e:	e9 e5 f4 ff ff       	jmp    80105b38 <alltraps>

80106653 <vector165>:
.globl vector165
vector165:
  pushl $0
80106653:	6a 00                	push   $0x0
  pushl $165
80106655:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010665a:	e9 d9 f4 ff ff       	jmp    80105b38 <alltraps>

8010665f <vector166>:
.globl vector166
vector166:
  pushl $0
8010665f:	6a 00                	push   $0x0
  pushl $166
80106661:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106666:	e9 cd f4 ff ff       	jmp    80105b38 <alltraps>

8010666b <vector167>:
.globl vector167
vector167:
  pushl $0
8010666b:	6a 00                	push   $0x0
  pushl $167
8010666d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106672:	e9 c1 f4 ff ff       	jmp    80105b38 <alltraps>

80106677 <vector168>:
.globl vector168
vector168:
  pushl $0
80106677:	6a 00                	push   $0x0
  pushl $168
80106679:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010667e:	e9 b5 f4 ff ff       	jmp    80105b38 <alltraps>

80106683 <vector169>:
.globl vector169
vector169:
  pushl $0
80106683:	6a 00                	push   $0x0
  pushl $169
80106685:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
8010668a:	e9 a9 f4 ff ff       	jmp    80105b38 <alltraps>

8010668f <vector170>:
.globl vector170
vector170:
  pushl $0
8010668f:	6a 00                	push   $0x0
  pushl $170
80106691:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80106696:	e9 9d f4 ff ff       	jmp    80105b38 <alltraps>

8010669b <vector171>:
.globl vector171
vector171:
  pushl $0
8010669b:	6a 00                	push   $0x0
  pushl $171
8010669d:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
801066a2:	e9 91 f4 ff ff       	jmp    80105b38 <alltraps>

801066a7 <vector172>:
.globl vector172
vector172:
  pushl $0
801066a7:	6a 00                	push   $0x0
  pushl $172
801066a9:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
801066ae:	e9 85 f4 ff ff       	jmp    80105b38 <alltraps>

801066b3 <vector173>:
.globl vector173
vector173:
  pushl $0
801066b3:	6a 00                	push   $0x0
  pushl $173
801066b5:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
801066ba:	e9 79 f4 ff ff       	jmp    80105b38 <alltraps>

801066bf <vector174>:
.globl vector174
vector174:
  pushl $0
801066bf:	6a 00                	push   $0x0
  pushl $174
801066c1:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
801066c6:	e9 6d f4 ff ff       	jmp    80105b38 <alltraps>

801066cb <vector175>:
.globl vector175
vector175:
  pushl $0
801066cb:	6a 00                	push   $0x0
  pushl $175
801066cd:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
801066d2:	e9 61 f4 ff ff       	jmp    80105b38 <alltraps>

801066d7 <vector176>:
.globl vector176
vector176:
  pushl $0
801066d7:	6a 00                	push   $0x0
  pushl $176
801066d9:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
801066de:	e9 55 f4 ff ff       	jmp    80105b38 <alltraps>

801066e3 <vector177>:
.globl vector177
vector177:
  pushl $0
801066e3:	6a 00                	push   $0x0
  pushl $177
801066e5:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
801066ea:	e9 49 f4 ff ff       	jmp    80105b38 <alltraps>

801066ef <vector178>:
.globl vector178
vector178:
  pushl $0
801066ef:	6a 00                	push   $0x0
  pushl $178
801066f1:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
801066f6:	e9 3d f4 ff ff       	jmp    80105b38 <alltraps>

801066fb <vector179>:
.globl vector179
vector179:
  pushl $0
801066fb:	6a 00                	push   $0x0
  pushl $179
801066fd:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106702:	e9 31 f4 ff ff       	jmp    80105b38 <alltraps>

80106707 <vector180>:
.globl vector180
vector180:
  pushl $0
80106707:	6a 00                	push   $0x0
  pushl $180
80106709:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
8010670e:	e9 25 f4 ff ff       	jmp    80105b38 <alltraps>

80106713 <vector181>:
.globl vector181
vector181:
  pushl $0
80106713:	6a 00                	push   $0x0
  pushl $181
80106715:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
8010671a:	e9 19 f4 ff ff       	jmp    80105b38 <alltraps>

8010671f <vector182>:
.globl vector182
vector182:
  pushl $0
8010671f:	6a 00                	push   $0x0
  pushl $182
80106721:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80106726:	e9 0d f4 ff ff       	jmp    80105b38 <alltraps>

8010672b <vector183>:
.globl vector183
vector183:
  pushl $0
8010672b:	6a 00                	push   $0x0
  pushl $183
8010672d:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106732:	e9 01 f4 ff ff       	jmp    80105b38 <alltraps>

80106737 <vector184>:
.globl vector184
vector184:
  pushl $0
80106737:	6a 00                	push   $0x0
  pushl $184
80106739:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
8010673e:	e9 f5 f3 ff ff       	jmp    80105b38 <alltraps>

80106743 <vector185>:
.globl vector185
vector185:
  pushl $0
80106743:	6a 00                	push   $0x0
  pushl $185
80106745:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
8010674a:	e9 e9 f3 ff ff       	jmp    80105b38 <alltraps>

8010674f <vector186>:
.globl vector186
vector186:
  pushl $0
8010674f:	6a 00                	push   $0x0
  pushl $186
80106751:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106756:	e9 dd f3 ff ff       	jmp    80105b38 <alltraps>

8010675b <vector187>:
.globl vector187
vector187:
  pushl $0
8010675b:	6a 00                	push   $0x0
  pushl $187
8010675d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106762:	e9 d1 f3 ff ff       	jmp    80105b38 <alltraps>

80106767 <vector188>:
.globl vector188
vector188:
  pushl $0
80106767:	6a 00                	push   $0x0
  pushl $188
80106769:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010676e:	e9 c5 f3 ff ff       	jmp    80105b38 <alltraps>

80106773 <vector189>:
.globl vector189
vector189:
  pushl $0
80106773:	6a 00                	push   $0x0
  pushl $189
80106775:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010677a:	e9 b9 f3 ff ff       	jmp    80105b38 <alltraps>

8010677f <vector190>:
.globl vector190
vector190:
  pushl $0
8010677f:	6a 00                	push   $0x0
  pushl $190
80106781:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106786:	e9 ad f3 ff ff       	jmp    80105b38 <alltraps>

8010678b <vector191>:
.globl vector191
vector191:
  pushl $0
8010678b:	6a 00                	push   $0x0
  pushl $191
8010678d:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106792:	e9 a1 f3 ff ff       	jmp    80105b38 <alltraps>

80106797 <vector192>:
.globl vector192
vector192:
  pushl $0
80106797:	6a 00                	push   $0x0
  pushl $192
80106799:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
8010679e:	e9 95 f3 ff ff       	jmp    80105b38 <alltraps>

801067a3 <vector193>:
.globl vector193
vector193:
  pushl $0
801067a3:	6a 00                	push   $0x0
  pushl $193
801067a5:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
801067aa:	e9 89 f3 ff ff       	jmp    80105b38 <alltraps>

801067af <vector194>:
.globl vector194
vector194:
  pushl $0
801067af:	6a 00                	push   $0x0
  pushl $194
801067b1:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
801067b6:	e9 7d f3 ff ff       	jmp    80105b38 <alltraps>

801067bb <vector195>:
.globl vector195
vector195:
  pushl $0
801067bb:	6a 00                	push   $0x0
  pushl $195
801067bd:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
801067c2:	e9 71 f3 ff ff       	jmp    80105b38 <alltraps>

801067c7 <vector196>:
.globl vector196
vector196:
  pushl $0
801067c7:	6a 00                	push   $0x0
  pushl $196
801067c9:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
801067ce:	e9 65 f3 ff ff       	jmp    80105b38 <alltraps>

801067d3 <vector197>:
.globl vector197
vector197:
  pushl $0
801067d3:	6a 00                	push   $0x0
  pushl $197
801067d5:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
801067da:	e9 59 f3 ff ff       	jmp    80105b38 <alltraps>

801067df <vector198>:
.globl vector198
vector198:
  pushl $0
801067df:	6a 00                	push   $0x0
  pushl $198
801067e1:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
801067e6:	e9 4d f3 ff ff       	jmp    80105b38 <alltraps>

801067eb <vector199>:
.globl vector199
vector199:
  pushl $0
801067eb:	6a 00                	push   $0x0
  pushl $199
801067ed:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
801067f2:	e9 41 f3 ff ff       	jmp    80105b38 <alltraps>

801067f7 <vector200>:
.globl vector200
vector200:
  pushl $0
801067f7:	6a 00                	push   $0x0
  pushl $200
801067f9:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
801067fe:	e9 35 f3 ff ff       	jmp    80105b38 <alltraps>

80106803 <vector201>:
.globl vector201
vector201:
  pushl $0
80106803:	6a 00                	push   $0x0
  pushl $201
80106805:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
8010680a:	e9 29 f3 ff ff       	jmp    80105b38 <alltraps>

8010680f <vector202>:
.globl vector202
vector202:
  pushl $0
8010680f:	6a 00                	push   $0x0
  pushl $202
80106811:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80106816:	e9 1d f3 ff ff       	jmp    80105b38 <alltraps>

8010681b <vector203>:
.globl vector203
vector203:
  pushl $0
8010681b:	6a 00                	push   $0x0
  pushl $203
8010681d:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106822:	e9 11 f3 ff ff       	jmp    80105b38 <alltraps>

80106827 <vector204>:
.globl vector204
vector204:
  pushl $0
80106827:	6a 00                	push   $0x0
  pushl $204
80106829:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
8010682e:	e9 05 f3 ff ff       	jmp    80105b38 <alltraps>

80106833 <vector205>:
.globl vector205
vector205:
  pushl $0
80106833:	6a 00                	push   $0x0
  pushl $205
80106835:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
8010683a:	e9 f9 f2 ff ff       	jmp    80105b38 <alltraps>

8010683f <vector206>:
.globl vector206
vector206:
  pushl $0
8010683f:	6a 00                	push   $0x0
  pushl $206
80106841:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106846:	e9 ed f2 ff ff       	jmp    80105b38 <alltraps>

8010684b <vector207>:
.globl vector207
vector207:
  pushl $0
8010684b:	6a 00                	push   $0x0
  pushl $207
8010684d:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106852:	e9 e1 f2 ff ff       	jmp    80105b38 <alltraps>

80106857 <vector208>:
.globl vector208
vector208:
  pushl $0
80106857:	6a 00                	push   $0x0
  pushl $208
80106859:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
8010685e:	e9 d5 f2 ff ff       	jmp    80105b38 <alltraps>

80106863 <vector209>:
.globl vector209
vector209:
  pushl $0
80106863:	6a 00                	push   $0x0
  pushl $209
80106865:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
8010686a:	e9 c9 f2 ff ff       	jmp    80105b38 <alltraps>

8010686f <vector210>:
.globl vector210
vector210:
  pushl $0
8010686f:	6a 00                	push   $0x0
  pushl $210
80106871:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106876:	e9 bd f2 ff ff       	jmp    80105b38 <alltraps>

8010687b <vector211>:
.globl vector211
vector211:
  pushl $0
8010687b:	6a 00                	push   $0x0
  pushl $211
8010687d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106882:	e9 b1 f2 ff ff       	jmp    80105b38 <alltraps>

80106887 <vector212>:
.globl vector212
vector212:
  pushl $0
80106887:	6a 00                	push   $0x0
  pushl $212
80106889:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
8010688e:	e9 a5 f2 ff ff       	jmp    80105b38 <alltraps>

80106893 <vector213>:
.globl vector213
vector213:
  pushl $0
80106893:	6a 00                	push   $0x0
  pushl $213
80106895:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
8010689a:	e9 99 f2 ff ff       	jmp    80105b38 <alltraps>

8010689f <vector214>:
.globl vector214
vector214:
  pushl $0
8010689f:	6a 00                	push   $0x0
  pushl $214
801068a1:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
801068a6:	e9 8d f2 ff ff       	jmp    80105b38 <alltraps>

801068ab <vector215>:
.globl vector215
vector215:
  pushl $0
801068ab:	6a 00                	push   $0x0
  pushl $215
801068ad:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
801068b2:	e9 81 f2 ff ff       	jmp    80105b38 <alltraps>

801068b7 <vector216>:
.globl vector216
vector216:
  pushl $0
801068b7:	6a 00                	push   $0x0
  pushl $216
801068b9:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
801068be:	e9 75 f2 ff ff       	jmp    80105b38 <alltraps>

801068c3 <vector217>:
.globl vector217
vector217:
  pushl $0
801068c3:	6a 00                	push   $0x0
  pushl $217
801068c5:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
801068ca:	e9 69 f2 ff ff       	jmp    80105b38 <alltraps>

801068cf <vector218>:
.globl vector218
vector218:
  pushl $0
801068cf:	6a 00                	push   $0x0
  pushl $218
801068d1:	68 da 00 00 00       	push   $0xda
  jmp alltraps
801068d6:	e9 5d f2 ff ff       	jmp    80105b38 <alltraps>

801068db <vector219>:
.globl vector219
vector219:
  pushl $0
801068db:	6a 00                	push   $0x0
  pushl $219
801068dd:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
801068e2:	e9 51 f2 ff ff       	jmp    80105b38 <alltraps>

801068e7 <vector220>:
.globl vector220
vector220:
  pushl $0
801068e7:	6a 00                	push   $0x0
  pushl $220
801068e9:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
801068ee:	e9 45 f2 ff ff       	jmp    80105b38 <alltraps>

801068f3 <vector221>:
.globl vector221
vector221:
  pushl $0
801068f3:	6a 00                	push   $0x0
  pushl $221
801068f5:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
801068fa:	e9 39 f2 ff ff       	jmp    80105b38 <alltraps>

801068ff <vector222>:
.globl vector222
vector222:
  pushl $0
801068ff:	6a 00                	push   $0x0
  pushl $222
80106901:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106906:	e9 2d f2 ff ff       	jmp    80105b38 <alltraps>

8010690b <vector223>:
.globl vector223
vector223:
  pushl $0
8010690b:	6a 00                	push   $0x0
  pushl $223
8010690d:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106912:	e9 21 f2 ff ff       	jmp    80105b38 <alltraps>

80106917 <vector224>:
.globl vector224
vector224:
  pushl $0
80106917:	6a 00                	push   $0x0
  pushl $224
80106919:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
8010691e:	e9 15 f2 ff ff       	jmp    80105b38 <alltraps>

80106923 <vector225>:
.globl vector225
vector225:
  pushl $0
80106923:	6a 00                	push   $0x0
  pushl $225
80106925:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
8010692a:	e9 09 f2 ff ff       	jmp    80105b38 <alltraps>

8010692f <vector226>:
.globl vector226
vector226:
  pushl $0
8010692f:	6a 00                	push   $0x0
  pushl $226
80106931:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106936:	e9 fd f1 ff ff       	jmp    80105b38 <alltraps>

8010693b <vector227>:
.globl vector227
vector227:
  pushl $0
8010693b:	6a 00                	push   $0x0
  pushl $227
8010693d:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106942:	e9 f1 f1 ff ff       	jmp    80105b38 <alltraps>

80106947 <vector228>:
.globl vector228
vector228:
  pushl $0
80106947:	6a 00                	push   $0x0
  pushl $228
80106949:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
8010694e:	e9 e5 f1 ff ff       	jmp    80105b38 <alltraps>

80106953 <vector229>:
.globl vector229
vector229:
  pushl $0
80106953:	6a 00                	push   $0x0
  pushl $229
80106955:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
8010695a:	e9 d9 f1 ff ff       	jmp    80105b38 <alltraps>

8010695f <vector230>:
.globl vector230
vector230:
  pushl $0
8010695f:	6a 00                	push   $0x0
  pushl $230
80106961:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106966:	e9 cd f1 ff ff       	jmp    80105b38 <alltraps>

8010696b <vector231>:
.globl vector231
vector231:
  pushl $0
8010696b:	6a 00                	push   $0x0
  pushl $231
8010696d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106972:	e9 c1 f1 ff ff       	jmp    80105b38 <alltraps>

80106977 <vector232>:
.globl vector232
vector232:
  pushl $0
80106977:	6a 00                	push   $0x0
  pushl $232
80106979:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
8010697e:	e9 b5 f1 ff ff       	jmp    80105b38 <alltraps>

80106983 <vector233>:
.globl vector233
vector233:
  pushl $0
80106983:	6a 00                	push   $0x0
  pushl $233
80106985:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
8010698a:	e9 a9 f1 ff ff       	jmp    80105b38 <alltraps>

8010698f <vector234>:
.globl vector234
vector234:
  pushl $0
8010698f:	6a 00                	push   $0x0
  pushl $234
80106991:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106996:	e9 9d f1 ff ff       	jmp    80105b38 <alltraps>

8010699b <vector235>:
.globl vector235
vector235:
  pushl $0
8010699b:	6a 00                	push   $0x0
  pushl $235
8010699d:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
801069a2:	e9 91 f1 ff ff       	jmp    80105b38 <alltraps>

801069a7 <vector236>:
.globl vector236
vector236:
  pushl $0
801069a7:	6a 00                	push   $0x0
  pushl $236
801069a9:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
801069ae:	e9 85 f1 ff ff       	jmp    80105b38 <alltraps>

801069b3 <vector237>:
.globl vector237
vector237:
  pushl $0
801069b3:	6a 00                	push   $0x0
  pushl $237
801069b5:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
801069ba:	e9 79 f1 ff ff       	jmp    80105b38 <alltraps>

801069bf <vector238>:
.globl vector238
vector238:
  pushl $0
801069bf:	6a 00                	push   $0x0
  pushl $238
801069c1:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
801069c6:	e9 6d f1 ff ff       	jmp    80105b38 <alltraps>

801069cb <vector239>:
.globl vector239
vector239:
  pushl $0
801069cb:	6a 00                	push   $0x0
  pushl $239
801069cd:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
801069d2:	e9 61 f1 ff ff       	jmp    80105b38 <alltraps>

801069d7 <vector240>:
.globl vector240
vector240:
  pushl $0
801069d7:	6a 00                	push   $0x0
  pushl $240
801069d9:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
801069de:	e9 55 f1 ff ff       	jmp    80105b38 <alltraps>

801069e3 <vector241>:
.globl vector241
vector241:
  pushl $0
801069e3:	6a 00                	push   $0x0
  pushl $241
801069e5:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
801069ea:	e9 49 f1 ff ff       	jmp    80105b38 <alltraps>

801069ef <vector242>:
.globl vector242
vector242:
  pushl $0
801069ef:	6a 00                	push   $0x0
  pushl $242
801069f1:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
801069f6:	e9 3d f1 ff ff       	jmp    80105b38 <alltraps>

801069fb <vector243>:
.globl vector243
vector243:
  pushl $0
801069fb:	6a 00                	push   $0x0
  pushl $243
801069fd:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106a02:	e9 31 f1 ff ff       	jmp    80105b38 <alltraps>

80106a07 <vector244>:
.globl vector244
vector244:
  pushl $0
80106a07:	6a 00                	push   $0x0
  pushl $244
80106a09:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80106a0e:	e9 25 f1 ff ff       	jmp    80105b38 <alltraps>

80106a13 <vector245>:
.globl vector245
vector245:
  pushl $0
80106a13:	6a 00                	push   $0x0
  pushl $245
80106a15:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80106a1a:	e9 19 f1 ff ff       	jmp    80105b38 <alltraps>

80106a1f <vector246>:
.globl vector246
vector246:
  pushl $0
80106a1f:	6a 00                	push   $0x0
  pushl $246
80106a21:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106a26:	e9 0d f1 ff ff       	jmp    80105b38 <alltraps>

80106a2b <vector247>:
.globl vector247
vector247:
  pushl $0
80106a2b:	6a 00                	push   $0x0
  pushl $247
80106a2d:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106a32:	e9 01 f1 ff ff       	jmp    80105b38 <alltraps>

80106a37 <vector248>:
.globl vector248
vector248:
  pushl $0
80106a37:	6a 00                	push   $0x0
  pushl $248
80106a39:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80106a3e:	e9 f5 f0 ff ff       	jmp    80105b38 <alltraps>

80106a43 <vector249>:
.globl vector249
vector249:
  pushl $0
80106a43:	6a 00                	push   $0x0
  pushl $249
80106a45:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80106a4a:	e9 e9 f0 ff ff       	jmp    80105b38 <alltraps>

80106a4f <vector250>:
.globl vector250
vector250:
  pushl $0
80106a4f:	6a 00                	push   $0x0
  pushl $250
80106a51:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106a56:	e9 dd f0 ff ff       	jmp    80105b38 <alltraps>

80106a5b <vector251>:
.globl vector251
vector251:
  pushl $0
80106a5b:	6a 00                	push   $0x0
  pushl $251
80106a5d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106a62:	e9 d1 f0 ff ff       	jmp    80105b38 <alltraps>

80106a67 <vector252>:
.globl vector252
vector252:
  pushl $0
80106a67:	6a 00                	push   $0x0
  pushl $252
80106a69:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80106a6e:	e9 c5 f0 ff ff       	jmp    80105b38 <alltraps>

80106a73 <vector253>:
.globl vector253
vector253:
  pushl $0
80106a73:	6a 00                	push   $0x0
  pushl $253
80106a75:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80106a7a:	e9 b9 f0 ff ff       	jmp    80105b38 <alltraps>

80106a7f <vector254>:
.globl vector254
vector254:
  pushl $0
80106a7f:	6a 00                	push   $0x0
  pushl $254
80106a81:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106a86:	e9 ad f0 ff ff       	jmp    80105b38 <alltraps>

80106a8b <vector255>:
.globl vector255
vector255:
  pushl $0
80106a8b:	6a 00                	push   $0x0
  pushl $255
80106a8d:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106a92:	e9 a1 f0 ff ff       	jmp    80105b38 <alltraps>
80106a97:	66 90                	xchg   %ax,%ax
80106a99:	66 90                	xchg   %ax,%ax
80106a9b:	66 90                	xchg   %ax,%ax
80106a9d:	66 90                	xchg   %ax,%ax
80106a9f:	90                   	nop

80106aa0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106aa0:	55                   	push   %ebp
80106aa1:	89 e5                	mov    %esp,%ebp
80106aa3:	57                   	push   %edi
80106aa4:	56                   	push   %esi
80106aa5:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106aa6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
80106aac:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106ab2:	83 ec 1c             	sub    $0x1c,%esp
80106ab5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106ab8:	39 d3                	cmp    %edx,%ebx
80106aba:	73 49                	jae    80106b05 <deallocuvm.part.0+0x65>
80106abc:	89 c7                	mov    %eax,%edi
80106abe:	eb 0c                	jmp    80106acc <deallocuvm.part.0+0x2c>
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106ac0:	83 c0 01             	add    $0x1,%eax
80106ac3:	c1 e0 16             	shl    $0x16,%eax
80106ac6:	89 c3                	mov    %eax,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106ac8:	39 da                	cmp    %ebx,%edx
80106aca:	76 39                	jbe    80106b05 <deallocuvm.part.0+0x65>
  pde = &pgdir[PDX(va)];
80106acc:	89 d8                	mov    %ebx,%eax
80106ace:	c1 e8 16             	shr    $0x16,%eax
  if(*pde & PTE_P){
80106ad1:	8b 0c 87             	mov    (%edi,%eax,4),%ecx
80106ad4:	f6 c1 01             	test   $0x1,%cl
80106ad7:	74 e7                	je     80106ac0 <deallocuvm.part.0+0x20>
  return &pgtab[PTX(va)];
80106ad9:	89 de                	mov    %ebx,%esi
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106adb:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
  return &pgtab[PTX(va)];
80106ae1:	c1 ee 0a             	shr    $0xa,%esi
80106ae4:	81 e6 fc 0f 00 00    	and    $0xffc,%esi
80106aea:	8d b4 31 00 00 00 80 	lea    -0x80000000(%ecx,%esi,1),%esi
    if(!pte)
80106af1:	85 f6                	test   %esi,%esi
80106af3:	74 cb                	je     80106ac0 <deallocuvm.part.0+0x20>
    else if((*pte & PTE_P) != 0){
80106af5:	8b 06                	mov    (%esi),%eax
80106af7:	a8 01                	test   $0x1,%al
80106af9:	75 15                	jne    80106b10 <deallocuvm.part.0+0x70>
  for(; a  < oldsz; a += PGSIZE){
80106afb:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b01:	39 da                	cmp    %ebx,%edx
80106b03:	77 c7                	ja     80106acc <deallocuvm.part.0+0x2c>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106b05:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106b08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b0b:	5b                   	pop    %ebx
80106b0c:	5e                   	pop    %esi
80106b0d:	5f                   	pop    %edi
80106b0e:	5d                   	pop    %ebp
80106b0f:	c3                   	ret    
      if(pa == 0)
80106b10:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106b15:	74 25                	je     80106b3c <deallocuvm.part.0+0x9c>
      kfree(v);
80106b17:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
80106b1a:	05 00 00 00 80       	add    $0x80000000,%eax
80106b1f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106b22:	81 c3 00 10 00 00    	add    $0x1000,%ebx
      kfree(v);
80106b28:	50                   	push   %eax
80106b29:	e8 92 b9 ff ff       	call   801024c0 <kfree>
      *pte = 0;
80106b2e:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  for(; a  < oldsz; a += PGSIZE){
80106b34:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106b37:	83 c4 10             	add    $0x10,%esp
80106b3a:	eb 8c                	jmp    80106ac8 <deallocuvm.part.0+0x28>
        panic("kfree");
80106b3c:	83 ec 0c             	sub    $0xc,%esp
80106b3f:	68 06 77 10 80       	push   $0x80107706
80106b44:	e8 37 98 ff ff       	call   80100380 <panic>
80106b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106b50 <mappages>:
{
80106b50:	55                   	push   %ebp
80106b51:	89 e5                	mov    %esp,%ebp
80106b53:	57                   	push   %edi
80106b54:	56                   	push   %esi
80106b55:	53                   	push   %ebx
  a = (char*)PGROUNDDOWN((uint)va);
80106b56:	89 d3                	mov    %edx,%ebx
80106b58:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
80106b5e:	83 ec 1c             	sub    $0x1c,%esp
80106b61:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106b64:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106b68:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106b6d:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106b70:	8b 45 08             	mov    0x8(%ebp),%eax
80106b73:	29 d8                	sub    %ebx,%eax
80106b75:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106b78:	eb 3d                	jmp    80106bb7 <mappages+0x67>
80106b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return &pgtab[PTX(va)];
80106b80:	89 da                	mov    %ebx,%edx
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106b82:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  return &pgtab[PTX(va)];
80106b87:	c1 ea 0a             	shr    $0xa,%edx
80106b8a:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106b90:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106b97:	85 c0                	test   %eax,%eax
80106b99:	74 75                	je     80106c10 <mappages+0xc0>
    if(*pte & PTE_P)
80106b9b:	f6 00 01             	testb  $0x1,(%eax)
80106b9e:	0f 85 86 00 00 00    	jne    80106c2a <mappages+0xda>
    *pte = pa | perm | PTE_P;
80106ba4:	0b 75 0c             	or     0xc(%ebp),%esi
80106ba7:	83 ce 01             	or     $0x1,%esi
80106baa:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106bac:	3b 5d dc             	cmp    -0x24(%ebp),%ebx
80106baf:	74 6f                	je     80106c20 <mappages+0xd0>
    a += PGSIZE;
80106bb1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  for(;;){
80106bb7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  pde = &pgdir[PDX(va)];
80106bba:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106bbd:	8d 34 18             	lea    (%eax,%ebx,1),%esi
80106bc0:	89 d8                	mov    %ebx,%eax
80106bc2:	c1 e8 16             	shr    $0x16,%eax
80106bc5:	8d 3c 81             	lea    (%ecx,%eax,4),%edi
  if(*pde & PTE_P){
80106bc8:	8b 07                	mov    (%edi),%eax
80106bca:	a8 01                	test   $0x1,%al
80106bcc:	75 b2                	jne    80106b80 <mappages+0x30>
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106bce:	e8 4d ba ff ff       	call   80102620 <kalloc>
80106bd3:	85 c0                	test   %eax,%eax
80106bd5:	74 39                	je     80106c10 <mappages+0xc0>
    memset(pgtab, 0, PGSIZE);
80106bd7:	83 ec 04             	sub    $0x4,%esp
80106bda:	89 45 d8             	mov    %eax,-0x28(%ebp)
80106bdd:	68 00 10 00 00       	push   $0x1000
80106be2:	6a 00                	push   $0x0
80106be4:	50                   	push   %eax
80106be5:	e8 46 dc ff ff       	call   80104830 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106bea:	8b 55 d8             	mov    -0x28(%ebp),%edx
  return &pgtab[PTX(va)];
80106bed:	83 c4 10             	add    $0x10,%esp
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106bf0:	8d 82 00 00 00 80    	lea    -0x80000000(%edx),%eax
80106bf6:	83 c8 07             	or     $0x7,%eax
80106bf9:	89 07                	mov    %eax,(%edi)
  return &pgtab[PTX(va)];
80106bfb:	89 d8                	mov    %ebx,%eax
80106bfd:	c1 e8 0a             	shr    $0xa,%eax
80106c00:	25 fc 0f 00 00       	and    $0xffc,%eax
80106c05:	01 d0                	add    %edx,%eax
80106c07:	eb 92                	jmp    80106b9b <mappages+0x4b>
80106c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}
80106c10:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106c13:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106c18:	5b                   	pop    %ebx
80106c19:	5e                   	pop    %esi
80106c1a:	5f                   	pop    %edi
80106c1b:	5d                   	pop    %ebp
80106c1c:	c3                   	ret    
80106c1d:	8d 76 00             	lea    0x0(%esi),%esi
80106c20:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106c23:	31 c0                	xor    %eax,%eax
}
80106c25:	5b                   	pop    %ebx
80106c26:	5e                   	pop    %esi
80106c27:	5f                   	pop    %edi
80106c28:	5d                   	pop    %ebp
80106c29:	c3                   	ret    
      panic("remap");
80106c2a:	83 ec 0c             	sub    $0xc,%esp
80106c2d:	68 68 7d 10 80       	push   $0x80107d68
80106c32:	e8 49 97 ff ff       	call   80100380 <panic>
80106c37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c3e:	66 90                	xchg   %ax,%ax

80106c40 <seginit>:
{
80106c40:	55                   	push   %ebp
80106c41:	89 e5                	mov    %esp,%ebp
80106c43:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106c46:	e8 d5 ce ff ff       	call   80103b20 <cpuid>
  pd[0] = size-1;
80106c4b:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106c50:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106c56:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106c5a:	c7 80 18 18 11 80 ff 	movl   $0xffff,-0x7feee7e8(%eax)
80106c61:	ff 00 00 
80106c64:	c7 80 1c 18 11 80 00 	movl   $0xcf9a00,-0x7feee7e4(%eax)
80106c6b:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106c6e:	c7 80 20 18 11 80 ff 	movl   $0xffff,-0x7feee7e0(%eax)
80106c75:	ff 00 00 
80106c78:	c7 80 24 18 11 80 00 	movl   $0xcf9200,-0x7feee7dc(%eax)
80106c7f:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106c82:	c7 80 28 18 11 80 ff 	movl   $0xffff,-0x7feee7d8(%eax)
80106c89:	ff 00 00 
80106c8c:	c7 80 2c 18 11 80 00 	movl   $0xcffa00,-0x7feee7d4(%eax)
80106c93:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106c96:	c7 80 30 18 11 80 ff 	movl   $0xffff,-0x7feee7d0(%eax)
80106c9d:	ff 00 00 
80106ca0:	c7 80 34 18 11 80 00 	movl   $0xcff200,-0x7feee7cc(%eax)
80106ca7:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
80106caa:	05 10 18 11 80       	add    $0x80111810,%eax
  pd[1] = (uint)p;
80106caf:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106cb3:	c1 e8 10             	shr    $0x10,%eax
80106cb6:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80106cba:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106cbd:	0f 01 10             	lgdtl  (%eax)
}
80106cc0:	c9                   	leave  
80106cc1:	c3                   	ret    
80106cc2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106cd0 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106cd0:	a1 c4 45 11 80       	mov    0x801145c4,%eax
80106cd5:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106cda:	0f 22 d8             	mov    %eax,%cr3
}
80106cdd:	c3                   	ret    
80106cde:	66 90                	xchg   %ax,%ax

80106ce0 <switchuvm>:
{
80106ce0:	55                   	push   %ebp
80106ce1:	89 e5                	mov    %esp,%ebp
80106ce3:	57                   	push   %edi
80106ce4:	56                   	push   %esi
80106ce5:	53                   	push   %ebx
80106ce6:	83 ec 1c             	sub    $0x1c,%esp
80106ce9:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
80106cec:	85 f6                	test   %esi,%esi
80106cee:	0f 84 cb 00 00 00    	je     80106dbf <switchuvm+0xdf>
  if(p->kstack == 0)
80106cf4:	8b 46 0c             	mov    0xc(%esi),%eax
80106cf7:	85 c0                	test   %eax,%eax
80106cf9:	0f 84 da 00 00 00    	je     80106dd9 <switchuvm+0xf9>
  if(p->pgdir == 0)
80106cff:	8b 46 08             	mov    0x8(%esi),%eax
80106d02:	85 c0                	test   %eax,%eax
80106d04:	0f 84 c2 00 00 00    	je     80106dcc <switchuvm+0xec>
  pushcli();
80106d0a:	e8 11 d9 ff ff       	call   80104620 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106d0f:	e8 ac cd ff ff       	call   80103ac0 <mycpu>
80106d14:	89 c3                	mov    %eax,%ebx
80106d16:	e8 a5 cd ff ff       	call   80103ac0 <mycpu>
80106d1b:	89 c7                	mov    %eax,%edi
80106d1d:	e8 9e cd ff ff       	call   80103ac0 <mycpu>
80106d22:	83 c7 08             	add    $0x8,%edi
80106d25:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106d28:	e8 93 cd ff ff       	call   80103ac0 <mycpu>
80106d2d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106d30:	ba 67 00 00 00       	mov    $0x67,%edx
80106d35:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106d3c:	83 c0 08             	add    $0x8,%eax
80106d3f:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106d46:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106d4b:	83 c1 08             	add    $0x8,%ecx
80106d4e:	c1 e8 18             	shr    $0x18,%eax
80106d51:	c1 e9 10             	shr    $0x10,%ecx
80106d54:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106d5a:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80106d60:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106d65:	66 89 8b 9d 00 00 00 	mov    %cx,0x9d(%ebx)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106d6c:	bb 10 00 00 00       	mov    $0x10,%ebx
  mycpu()->gdt[SEG_TSS].s = 0;
80106d71:	e8 4a cd ff ff       	call   80103ac0 <mycpu>
80106d76:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106d7d:	e8 3e cd ff ff       	call   80103ac0 <mycpu>
80106d82:	66 89 58 10          	mov    %bx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106d86:	8b 5e 0c             	mov    0xc(%esi),%ebx
80106d89:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106d8f:	e8 2c cd ff ff       	call   80103ac0 <mycpu>
80106d94:	89 58 0c             	mov    %ebx,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106d97:	e8 24 cd ff ff       	call   80103ac0 <mycpu>
80106d9c:	66 89 78 6e          	mov    %di,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106da0:	b8 28 00 00 00       	mov    $0x28,%eax
80106da5:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106da8:	8b 46 08             	mov    0x8(%esi),%eax
80106dab:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106db0:	0f 22 d8             	mov    %eax,%cr3
}
80106db3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106db6:	5b                   	pop    %ebx
80106db7:	5e                   	pop    %esi
80106db8:	5f                   	pop    %edi
80106db9:	5d                   	pop    %ebp
  popcli();
80106dba:	e9 b1 d8 ff ff       	jmp    80104670 <popcli>
    panic("switchuvm: no process");
80106dbf:	83 ec 0c             	sub    $0xc,%esp
80106dc2:	68 6e 7d 10 80       	push   $0x80107d6e
80106dc7:	e8 b4 95 ff ff       	call   80100380 <panic>
    panic("switchuvm: no pgdir");
80106dcc:	83 ec 0c             	sub    $0xc,%esp
80106dcf:	68 99 7d 10 80       	push   $0x80107d99
80106dd4:	e8 a7 95 ff ff       	call   80100380 <panic>
    panic("switchuvm: no kstack");
80106dd9:	83 ec 0c             	sub    $0xc,%esp
80106ddc:	68 84 7d 10 80       	push   $0x80107d84
80106de1:	e8 9a 95 ff ff       	call   80100380 <panic>
80106de6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ded:	8d 76 00             	lea    0x0(%esi),%esi

80106df0 <inituvm>:
{
80106df0:	55                   	push   %ebp
80106df1:	89 e5                	mov    %esp,%ebp
80106df3:	57                   	push   %edi
80106df4:	56                   	push   %esi
80106df5:	53                   	push   %ebx
80106df6:	83 ec 1c             	sub    $0x1c,%esp
80106df9:	8b 45 0c             	mov    0xc(%ebp),%eax
80106dfc:	8b 75 10             	mov    0x10(%ebp),%esi
80106dff:	8b 7d 08             	mov    0x8(%ebp),%edi
80106e02:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
80106e05:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106e0b:	77 4b                	ja     80106e58 <inituvm+0x68>
  mem = kalloc();
80106e0d:	e8 0e b8 ff ff       	call   80102620 <kalloc>
  memset(mem, 0, PGSIZE);
80106e12:	83 ec 04             	sub    $0x4,%esp
80106e15:	68 00 10 00 00       	push   $0x1000
  mem = kalloc();
80106e1a:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106e1c:	6a 00                	push   $0x0
80106e1e:	50                   	push   %eax
80106e1f:	e8 0c da ff ff       	call   80104830 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106e24:	58                   	pop    %eax
80106e25:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106e2b:	5a                   	pop    %edx
80106e2c:	6a 06                	push   $0x6
80106e2e:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e33:	31 d2                	xor    %edx,%edx
80106e35:	50                   	push   %eax
80106e36:	89 f8                	mov    %edi,%eax
80106e38:	e8 13 fd ff ff       	call   80106b50 <mappages>
  memmove(mem, init, sz);
80106e3d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106e40:	89 75 10             	mov    %esi,0x10(%ebp)
80106e43:	83 c4 10             	add    $0x10,%esp
80106e46:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106e49:	89 45 0c             	mov    %eax,0xc(%ebp)
}
80106e4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e4f:	5b                   	pop    %ebx
80106e50:	5e                   	pop    %esi
80106e51:	5f                   	pop    %edi
80106e52:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106e53:	e9 78 da ff ff       	jmp    801048d0 <memmove>
    panic("inituvm: more than a page");
80106e58:	83 ec 0c             	sub    $0xc,%esp
80106e5b:	68 ad 7d 10 80       	push   $0x80107dad
80106e60:	e8 1b 95 ff ff       	call   80100380 <panic>
80106e65:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106e70 <loaduvm>:
{
80106e70:	55                   	push   %ebp
80106e71:	89 e5                	mov    %esp,%ebp
80106e73:	57                   	push   %edi
80106e74:	56                   	push   %esi
80106e75:	53                   	push   %ebx
80106e76:	83 ec 1c             	sub    $0x1c,%esp
80106e79:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e7c:	8b 75 18             	mov    0x18(%ebp),%esi
  if((uint) addr % PGSIZE != 0)
80106e7f:	a9 ff 0f 00 00       	test   $0xfff,%eax
80106e84:	0f 85 bb 00 00 00    	jne    80106f45 <loaduvm+0xd5>
  for(i = 0; i < sz; i += PGSIZE){
80106e8a:	01 f0                	add    %esi,%eax
80106e8c:	89 f3                	mov    %esi,%ebx
80106e8e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106e91:	8b 45 14             	mov    0x14(%ebp),%eax
80106e94:	01 f0                	add    %esi,%eax
80106e96:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
80106e99:	85 f6                	test   %esi,%esi
80106e9b:	0f 84 87 00 00 00    	je     80106f28 <loaduvm+0xb8>
80106ea1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  pde = &pgdir[PDX(va)];
80106ea8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  if(*pde & PTE_P){
80106eab:	8b 4d 08             	mov    0x8(%ebp),%ecx
80106eae:	29 d8                	sub    %ebx,%eax
  pde = &pgdir[PDX(va)];
80106eb0:	89 c2                	mov    %eax,%edx
80106eb2:	c1 ea 16             	shr    $0x16,%edx
  if(*pde & PTE_P){
80106eb5:	8b 14 91             	mov    (%ecx,%edx,4),%edx
80106eb8:	f6 c2 01             	test   $0x1,%dl
80106ebb:	75 13                	jne    80106ed0 <loaduvm+0x60>
      panic("loaduvm: address should exist");
80106ebd:	83 ec 0c             	sub    $0xc,%esp
80106ec0:	68 c7 7d 10 80       	push   $0x80107dc7
80106ec5:	e8 b6 94 ff ff       	call   80100380 <panic>
80106eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return &pgtab[PTX(va)];
80106ed0:	c1 e8 0a             	shr    $0xa,%eax
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106ed3:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  return &pgtab[PTX(va)];
80106ed9:	25 fc 0f 00 00       	and    $0xffc,%eax
80106ede:	8d 84 02 00 00 00 80 	lea    -0x80000000(%edx,%eax,1),%eax
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106ee5:	85 c0                	test   %eax,%eax
80106ee7:	74 d4                	je     80106ebd <loaduvm+0x4d>
    pa = PTE_ADDR(*pte);
80106ee9:	8b 00                	mov    (%eax),%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106eeb:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    if(sz - i < PGSIZE)
80106eee:	bf 00 10 00 00       	mov    $0x1000,%edi
    pa = PTE_ADDR(*pte);
80106ef3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106ef8:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
80106efe:	0f 46 fb             	cmovbe %ebx,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106f01:	29 d9                	sub    %ebx,%ecx
80106f03:	05 00 00 00 80       	add    $0x80000000,%eax
80106f08:	57                   	push   %edi
80106f09:	51                   	push   %ecx
80106f0a:	50                   	push   %eax
80106f0b:	ff 75 10             	push   0x10(%ebp)
80106f0e:	e8 7d ab ff ff       	call   80101a90 <readi>
80106f13:	83 c4 10             	add    $0x10,%esp
80106f16:	39 f8                	cmp    %edi,%eax
80106f18:	75 1e                	jne    80106f38 <loaduvm+0xc8>
  for(i = 0; i < sz; i += PGSIZE){
80106f1a:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
80106f20:	89 f0                	mov    %esi,%eax
80106f22:	29 d8                	sub    %ebx,%eax
80106f24:	39 c6                	cmp    %eax,%esi
80106f26:	77 80                	ja     80106ea8 <loaduvm+0x38>
}
80106f28:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106f2b:	31 c0                	xor    %eax,%eax
}
80106f2d:	5b                   	pop    %ebx
80106f2e:	5e                   	pop    %esi
80106f2f:	5f                   	pop    %edi
80106f30:	5d                   	pop    %ebp
80106f31:	c3                   	ret    
80106f32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106f38:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106f3b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106f40:	5b                   	pop    %ebx
80106f41:	5e                   	pop    %esi
80106f42:	5f                   	pop    %edi
80106f43:	5d                   	pop    %ebp
80106f44:	c3                   	ret    
    panic("loaduvm: addr must be page aligned");
80106f45:	83 ec 0c             	sub    $0xc,%esp
80106f48:	68 68 7e 10 80       	push   $0x80107e68
80106f4d:	e8 2e 94 ff ff       	call   80100380 <panic>
80106f52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106f60 <allocuvm>:
{
80106f60:	55                   	push   %ebp
80106f61:	89 e5                	mov    %esp,%ebp
80106f63:	57                   	push   %edi
80106f64:	56                   	push   %esi
80106f65:	53                   	push   %ebx
80106f66:	83 ec 1c             	sub    $0x1c,%esp
  if(newsz >= KERNBASE)
80106f69:	8b 45 10             	mov    0x10(%ebp),%eax
{
80106f6c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(newsz >= KERNBASE)
80106f6f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106f72:	85 c0                	test   %eax,%eax
80106f74:	0f 88 b6 00 00 00    	js     80107030 <allocuvm+0xd0>
  if(newsz < oldsz)
80106f7a:	3b 45 0c             	cmp    0xc(%ebp),%eax
    return oldsz;
80106f7d:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(newsz < oldsz)
80106f80:	0f 82 9a 00 00 00    	jb     80107020 <allocuvm+0xc0>
  a = PGROUNDUP(oldsz);
80106f86:	8d b0 ff 0f 00 00    	lea    0xfff(%eax),%esi
80106f8c:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  for(; a < newsz; a += PGSIZE){
80106f92:	39 75 10             	cmp    %esi,0x10(%ebp)
80106f95:	77 44                	ja     80106fdb <allocuvm+0x7b>
80106f97:	e9 87 00 00 00       	jmp    80107023 <allocuvm+0xc3>
80106f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    memset(mem, 0, PGSIZE);
80106fa0:	83 ec 04             	sub    $0x4,%esp
80106fa3:	68 00 10 00 00       	push   $0x1000
80106fa8:	6a 00                	push   $0x0
80106faa:	50                   	push   %eax
80106fab:	e8 80 d8 ff ff       	call   80104830 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106fb0:	58                   	pop    %eax
80106fb1:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106fb7:	5a                   	pop    %edx
80106fb8:	6a 06                	push   $0x6
80106fba:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106fbf:	89 f2                	mov    %esi,%edx
80106fc1:	50                   	push   %eax
80106fc2:	89 f8                	mov    %edi,%eax
80106fc4:	e8 87 fb ff ff       	call   80106b50 <mappages>
80106fc9:	83 c4 10             	add    $0x10,%esp
80106fcc:	85 c0                	test   %eax,%eax
80106fce:	78 78                	js     80107048 <allocuvm+0xe8>
  for(; a < newsz; a += PGSIZE){
80106fd0:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106fd6:	39 75 10             	cmp    %esi,0x10(%ebp)
80106fd9:	76 48                	jbe    80107023 <allocuvm+0xc3>
    mem = kalloc();
80106fdb:	e8 40 b6 ff ff       	call   80102620 <kalloc>
80106fe0:	89 c3                	mov    %eax,%ebx
    if(mem == 0){
80106fe2:	85 c0                	test   %eax,%eax
80106fe4:	75 ba                	jne    80106fa0 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
80106fe6:	83 ec 0c             	sub    $0xc,%esp
80106fe9:	68 e5 7d 10 80       	push   $0x80107de5
80106fee:	e8 ad 96 ff ff       	call   801006a0 <cprintf>
  if(newsz >= oldsz)
80106ff3:	8b 45 0c             	mov    0xc(%ebp),%eax
80106ff6:	83 c4 10             	add    $0x10,%esp
80106ff9:	39 45 10             	cmp    %eax,0x10(%ebp)
80106ffc:	74 32                	je     80107030 <allocuvm+0xd0>
80106ffe:	8b 55 10             	mov    0x10(%ebp),%edx
80107001:	89 c1                	mov    %eax,%ecx
80107003:	89 f8                	mov    %edi,%eax
80107005:	e8 96 fa ff ff       	call   80106aa0 <deallocuvm.part.0>
      return 0;
8010700a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
}
80107011:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107014:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107017:	5b                   	pop    %ebx
80107018:	5e                   	pop    %esi
80107019:	5f                   	pop    %edi
8010701a:	5d                   	pop    %ebp
8010701b:	c3                   	ret    
8010701c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return oldsz;
80107020:	89 45 e4             	mov    %eax,-0x1c(%ebp)
}
80107023:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107026:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107029:	5b                   	pop    %ebx
8010702a:	5e                   	pop    %esi
8010702b:	5f                   	pop    %edi
8010702c:	5d                   	pop    %ebp
8010702d:	c3                   	ret    
8010702e:	66 90                	xchg   %ax,%ax
    return 0;
80107030:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
}
80107037:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010703a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010703d:	5b                   	pop    %ebx
8010703e:	5e                   	pop    %esi
8010703f:	5f                   	pop    %edi
80107040:	5d                   	pop    %ebp
80107041:	c3                   	ret    
80107042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80107048:	83 ec 0c             	sub    $0xc,%esp
8010704b:	68 fd 7d 10 80       	push   $0x80107dfd
80107050:	e8 4b 96 ff ff       	call   801006a0 <cprintf>
  if(newsz >= oldsz)
80107055:	8b 45 0c             	mov    0xc(%ebp),%eax
80107058:	83 c4 10             	add    $0x10,%esp
8010705b:	39 45 10             	cmp    %eax,0x10(%ebp)
8010705e:	74 0c                	je     8010706c <allocuvm+0x10c>
80107060:	8b 55 10             	mov    0x10(%ebp),%edx
80107063:	89 c1                	mov    %eax,%ecx
80107065:	89 f8                	mov    %edi,%eax
80107067:	e8 34 fa ff ff       	call   80106aa0 <deallocuvm.part.0>
      kfree(mem);
8010706c:	83 ec 0c             	sub    $0xc,%esp
8010706f:	53                   	push   %ebx
80107070:	e8 4b b4 ff ff       	call   801024c0 <kfree>
      return 0;
80107075:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
8010707c:	83 c4 10             	add    $0x10,%esp
}
8010707f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107082:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107085:	5b                   	pop    %ebx
80107086:	5e                   	pop    %esi
80107087:	5f                   	pop    %edi
80107088:	5d                   	pop    %ebp
80107089:	c3                   	ret    
8010708a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107090 <deallocuvm>:
{
80107090:	55                   	push   %ebp
80107091:	89 e5                	mov    %esp,%ebp
80107093:	8b 55 0c             	mov    0xc(%ebp),%edx
80107096:	8b 4d 10             	mov    0x10(%ebp),%ecx
80107099:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
8010709c:	39 d1                	cmp    %edx,%ecx
8010709e:	73 10                	jae    801070b0 <deallocuvm+0x20>
}
801070a0:	5d                   	pop    %ebp
801070a1:	e9 fa f9 ff ff       	jmp    80106aa0 <deallocuvm.part.0>
801070a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070ad:	8d 76 00             	lea    0x0(%esi),%esi
801070b0:	89 d0                	mov    %edx,%eax
801070b2:	5d                   	pop    %ebp
801070b3:	c3                   	ret    
801070b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801070bf:	90                   	nop

801070c0 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
801070c0:	55                   	push   %ebp
801070c1:	89 e5                	mov    %esp,%ebp
801070c3:	57                   	push   %edi
801070c4:	56                   	push   %esi
801070c5:	53                   	push   %ebx
801070c6:	83 ec 0c             	sub    $0xc,%esp
801070c9:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
801070cc:	85 f6                	test   %esi,%esi
801070ce:	74 59                	je     80107129 <freevm+0x69>
  if(newsz >= oldsz)
801070d0:	31 c9                	xor    %ecx,%ecx
801070d2:	ba 00 00 00 80       	mov    $0x80000000,%edx
801070d7:	89 f0                	mov    %esi,%eax
801070d9:	89 f3                	mov    %esi,%ebx
801070db:	e8 c0 f9 ff ff       	call   80106aa0 <deallocuvm.part.0>
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
801070e0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
801070e6:	eb 0f                	jmp    801070f7 <freevm+0x37>
801070e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070ef:	90                   	nop
801070f0:	83 c3 04             	add    $0x4,%ebx
801070f3:	39 df                	cmp    %ebx,%edi
801070f5:	74 23                	je     8010711a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
801070f7:	8b 03                	mov    (%ebx),%eax
801070f9:	a8 01                	test   $0x1,%al
801070fb:	74 f3                	je     801070f0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
801070fd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80107102:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < NPDENTRIES; i++){
80107105:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80107108:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
8010710d:	50                   	push   %eax
8010710e:	e8 ad b3 ff ff       	call   801024c0 <kfree>
80107113:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
80107116:	39 df                	cmp    %ebx,%edi
80107118:	75 dd                	jne    801070f7 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
8010711a:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010711d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107120:	5b                   	pop    %ebx
80107121:	5e                   	pop    %esi
80107122:	5f                   	pop    %edi
80107123:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80107124:	e9 97 b3 ff ff       	jmp    801024c0 <kfree>
    panic("freevm: no pgdir");
80107129:	83 ec 0c             	sub    $0xc,%esp
8010712c:	68 19 7e 10 80       	push   $0x80107e19
80107131:	e8 4a 92 ff ff       	call   80100380 <panic>
80107136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010713d:	8d 76 00             	lea    0x0(%esi),%esi

80107140 <setupkvm>:
{
80107140:	55                   	push   %ebp
80107141:	89 e5                	mov    %esp,%ebp
80107143:	56                   	push   %esi
80107144:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80107145:	e8 d6 b4 ff ff       	call   80102620 <kalloc>
8010714a:	89 c6                	mov    %eax,%esi
8010714c:	85 c0                	test   %eax,%eax
8010714e:	74 42                	je     80107192 <setupkvm+0x52>
  memset(pgdir, 0, PGSIZE);
80107150:	83 ec 04             	sub    $0x4,%esp
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107153:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  memset(pgdir, 0, PGSIZE);
80107158:	68 00 10 00 00       	push   $0x1000
8010715d:	6a 00                	push   $0x0
8010715f:	50                   	push   %eax
80107160:	e8 cb d6 ff ff       	call   80104830 <memset>
80107165:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
80107168:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
8010716b:	83 ec 08             	sub    $0x8,%esp
8010716e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80107171:	ff 73 0c             	push   0xc(%ebx)
80107174:	8b 13                	mov    (%ebx),%edx
80107176:	50                   	push   %eax
80107177:	29 c1                	sub    %eax,%ecx
80107179:	89 f0                	mov    %esi,%eax
8010717b:	e8 d0 f9 ff ff       	call   80106b50 <mappages>
80107180:	83 c4 10             	add    $0x10,%esp
80107183:	85 c0                	test   %eax,%eax
80107185:	78 19                	js     801071a0 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107187:	83 c3 10             	add    $0x10,%ebx
8010718a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80107190:	75 d6                	jne    80107168 <setupkvm+0x28>
}
80107192:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107195:	89 f0                	mov    %esi,%eax
80107197:	5b                   	pop    %ebx
80107198:	5e                   	pop    %esi
80107199:	5d                   	pop    %ebp
8010719a:	c3                   	ret    
8010719b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
8010719f:	90                   	nop
      freevm(pgdir);
801071a0:	83 ec 0c             	sub    $0xc,%esp
801071a3:	56                   	push   %esi
      return 0;
801071a4:	31 f6                	xor    %esi,%esi
      freevm(pgdir);
801071a6:	e8 15 ff ff ff       	call   801070c0 <freevm>
      return 0;
801071ab:	83 c4 10             	add    $0x10,%esp
}
801071ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
801071b1:	89 f0                	mov    %esi,%eax
801071b3:	5b                   	pop    %ebx
801071b4:	5e                   	pop    %esi
801071b5:	5d                   	pop    %ebp
801071b6:	c3                   	ret    
801071b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801071be:	66 90                	xchg   %ax,%ax

801071c0 <kvmalloc>:
{
801071c0:	55                   	push   %ebp
801071c1:	89 e5                	mov    %esp,%ebp
801071c3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
801071c6:	e8 75 ff ff ff       	call   80107140 <setupkvm>
801071cb:	a3 c4 45 11 80       	mov    %eax,0x801145c4
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801071d0:	05 00 00 00 80       	add    $0x80000000,%eax
801071d5:	0f 22 d8             	mov    %eax,%cr3
}
801071d8:	c9                   	leave  
801071d9:	c3                   	ret    
801071da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801071e0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801071e0:	55                   	push   %ebp
801071e1:	89 e5                	mov    %esp,%ebp
801071e3:	83 ec 08             	sub    $0x8,%esp
801071e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(*pde & PTE_P){
801071e9:	8b 55 08             	mov    0x8(%ebp),%edx
  pde = &pgdir[PDX(va)];
801071ec:	89 c1                	mov    %eax,%ecx
801071ee:	c1 e9 16             	shr    $0x16,%ecx
  if(*pde & PTE_P){
801071f1:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
801071f4:	f6 c2 01             	test   $0x1,%dl
801071f7:	75 17                	jne    80107210 <clearpteu+0x30>
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
801071f9:	83 ec 0c             	sub    $0xc,%esp
801071fc:	68 2a 7e 10 80       	push   $0x80107e2a
80107201:	e8 7a 91 ff ff       	call   80100380 <panic>
80107206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010720d:	8d 76 00             	lea    0x0(%esi),%esi
  return &pgtab[PTX(va)];
80107210:	c1 e8 0a             	shr    $0xa,%eax
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80107213:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  return &pgtab[PTX(va)];
80107219:	25 fc 0f 00 00       	and    $0xffc,%eax
8010721e:	8d 84 02 00 00 00 80 	lea    -0x80000000(%edx,%eax,1),%eax
  if(pte == 0)
80107225:	85 c0                	test   %eax,%eax
80107227:	74 d0                	je     801071f9 <clearpteu+0x19>
  *pte &= ~PTE_U;
80107229:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
8010722c:	c9                   	leave  
8010722d:	c3                   	ret    
8010722e:	66 90                	xchg   %ax,%ax

80107230 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80107230:	55                   	push   %ebp
80107231:	89 e5                	mov    %esp,%ebp
80107233:	57                   	push   %edi
80107234:	56                   	push   %esi
80107235:	53                   	push   %ebx
80107236:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80107239:	e8 02 ff ff ff       	call   80107140 <setupkvm>
8010723e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107241:	85 c0                	test   %eax,%eax
80107243:	0f 84 bd 00 00 00    	je     80107306 <copyuvm+0xd6>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107249:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010724c:	85 c9                	test   %ecx,%ecx
8010724e:	0f 84 b2 00 00 00    	je     80107306 <copyuvm+0xd6>
80107254:	31 f6                	xor    %esi,%esi
80107256:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010725d:	8d 76 00             	lea    0x0(%esi),%esi
  if(*pde & PTE_P){
80107260:	8b 4d 08             	mov    0x8(%ebp),%ecx
  pde = &pgdir[PDX(va)];
80107263:	89 f0                	mov    %esi,%eax
80107265:	c1 e8 16             	shr    $0x16,%eax
  if(*pde & PTE_P){
80107268:	8b 04 81             	mov    (%ecx,%eax,4),%eax
8010726b:	a8 01                	test   $0x1,%al
8010726d:	75 11                	jne    80107280 <copyuvm+0x50>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
8010726f:	83 ec 0c             	sub    $0xc,%esp
80107272:	68 34 7e 10 80       	push   $0x80107e34
80107277:	e8 04 91 ff ff       	call   80100380 <panic>
8010727c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return &pgtab[PTX(va)];
80107280:	89 f2                	mov    %esi,%edx
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80107282:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  return &pgtab[PTX(va)];
80107287:	c1 ea 0a             	shr    $0xa,%edx
8010728a:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80107290:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107297:	85 c0                	test   %eax,%eax
80107299:	74 d4                	je     8010726f <copyuvm+0x3f>
    if(!(*pte & PTE_P))
8010729b:	8b 00                	mov    (%eax),%eax
8010729d:	a8 01                	test   $0x1,%al
8010729f:	0f 84 9f 00 00 00    	je     80107344 <copyuvm+0x114>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
801072a5:	89 c7                	mov    %eax,%edi
    flags = PTE_FLAGS(*pte);
801072a7:	25 ff 0f 00 00       	and    $0xfff,%eax
801072ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    pa = PTE_ADDR(*pte);
801072af:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    if((mem = kalloc()) == 0)
801072b5:	e8 66 b3 ff ff       	call   80102620 <kalloc>
801072ba:	89 c3                	mov    %eax,%ebx
801072bc:	85 c0                	test   %eax,%eax
801072be:	74 64                	je     80107324 <copyuvm+0xf4>
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
801072c0:	83 ec 04             	sub    $0x4,%esp
801072c3:	81 c7 00 00 00 80    	add    $0x80000000,%edi
801072c9:	68 00 10 00 00       	push   $0x1000
801072ce:	57                   	push   %edi
801072cf:	50                   	push   %eax
801072d0:	e8 fb d5 ff ff       	call   801048d0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
801072d5:	58                   	pop    %eax
801072d6:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801072dc:	5a                   	pop    %edx
801072dd:	ff 75 e4             	push   -0x1c(%ebp)
801072e0:	b9 00 10 00 00       	mov    $0x1000,%ecx
801072e5:	89 f2                	mov    %esi,%edx
801072e7:	50                   	push   %eax
801072e8:	8b 45 e0             	mov    -0x20(%ebp),%eax
801072eb:	e8 60 f8 ff ff       	call   80106b50 <mappages>
801072f0:	83 c4 10             	add    $0x10,%esp
801072f3:	85 c0                	test   %eax,%eax
801072f5:	78 21                	js     80107318 <copyuvm+0xe8>
  for(i = 0; i < sz; i += PGSIZE){
801072f7:	81 c6 00 10 00 00    	add    $0x1000,%esi
801072fd:	39 75 0c             	cmp    %esi,0xc(%ebp)
80107300:	0f 87 5a ff ff ff    	ja     80107260 <copyuvm+0x30>
  return d;

bad:
  freevm(d);
  return 0;
}
80107306:	8b 45 e0             	mov    -0x20(%ebp),%eax
80107309:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010730c:	5b                   	pop    %ebx
8010730d:	5e                   	pop    %esi
8010730e:	5f                   	pop    %edi
8010730f:	5d                   	pop    %ebp
80107310:	c3                   	ret    
80107311:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      kfree(mem);
80107318:	83 ec 0c             	sub    $0xc,%esp
8010731b:	53                   	push   %ebx
8010731c:	e8 9f b1 ff ff       	call   801024c0 <kfree>
      goto bad;
80107321:	83 c4 10             	add    $0x10,%esp
  freevm(d);
80107324:	83 ec 0c             	sub    $0xc,%esp
80107327:	ff 75 e0             	push   -0x20(%ebp)
8010732a:	e8 91 fd ff ff       	call   801070c0 <freevm>
  return 0;
8010732f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80107336:	83 c4 10             	add    $0x10,%esp
}
80107339:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010733c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010733f:	5b                   	pop    %ebx
80107340:	5e                   	pop    %esi
80107341:	5f                   	pop    %edi
80107342:	5d                   	pop    %ebp
80107343:	c3                   	ret    
      panic("copyuvm: page not present");
80107344:	83 ec 0c             	sub    $0xc,%esp
80107347:	68 4e 7e 10 80       	push   $0x80107e4e
8010734c:	e8 2f 90 ff ff       	call   80100380 <panic>
80107351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107358:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010735f:	90                   	nop

80107360 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107360:	55                   	push   %ebp
80107361:	89 e5                	mov    %esp,%ebp
80107363:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(*pde & PTE_P){
80107366:	8b 55 08             	mov    0x8(%ebp),%edx
  pde = &pgdir[PDX(va)];
80107369:	89 c1                	mov    %eax,%ecx
8010736b:	c1 e9 16             	shr    $0x16,%ecx
  if(*pde & PTE_P){
8010736e:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
80107371:	f6 c2 01             	test   $0x1,%dl
80107374:	0f 84 00 01 00 00    	je     8010747a <uva2ka.cold>
  return &pgtab[PTX(va)];
8010737a:	c1 e8 0c             	shr    $0xc,%eax
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
8010737d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
80107383:	5d                   	pop    %ebp
  return &pgtab[PTX(va)];
80107384:	25 ff 03 00 00       	and    $0x3ff,%eax
  if((*pte & PTE_P) == 0)
80107389:	8b 84 82 00 00 00 80 	mov    -0x80000000(%edx,%eax,4),%eax
  if((*pte & PTE_U) == 0)
80107390:	89 c2                	mov    %eax,%edx
  return (char*)P2V(PTE_ADDR(*pte));
80107392:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((*pte & PTE_U) == 0)
80107397:	83 e2 05             	and    $0x5,%edx
  return (char*)P2V(PTE_ADDR(*pte));
8010739a:	05 00 00 00 80       	add    $0x80000000,%eax
8010739f:	83 fa 05             	cmp    $0x5,%edx
801073a2:	ba 00 00 00 00       	mov    $0x0,%edx
801073a7:	0f 45 c2             	cmovne %edx,%eax
}
801073aa:	c3                   	ret    
801073ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801073af:	90                   	nop

801073b0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
801073b0:	55                   	push   %ebp
801073b1:	89 e5                	mov    %esp,%ebp
801073b3:	57                   	push   %edi
801073b4:	56                   	push   %esi
801073b5:	53                   	push   %ebx
801073b6:	83 ec 0c             	sub    $0xc,%esp
801073b9:	8b 75 14             	mov    0x14(%ebp),%esi
801073bc:	8b 45 0c             	mov    0xc(%ebp),%eax
801073bf:	8b 55 10             	mov    0x10(%ebp),%edx
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801073c2:	85 f6                	test   %esi,%esi
801073c4:	75 51                	jne    80107417 <copyout+0x67>
801073c6:	e9 a5 00 00 00       	jmp    80107470 <copyout+0xc0>
801073cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801073cf:	90                   	nop
  return (char*)P2V(PTE_ADDR(*pte));
801073d0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801073d6:	8d 8b 00 00 00 80    	lea    -0x80000000(%ebx),%ecx
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
801073dc:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
801073e2:	74 75                	je     80107459 <copyout+0xa9>
      return -1;
    n = PGSIZE - (va - va0);
801073e4:	89 fb                	mov    %edi,%ebx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
801073e6:	89 55 10             	mov    %edx,0x10(%ebp)
    n = PGSIZE - (va - va0);
801073e9:	29 c3                	sub    %eax,%ebx
801073eb:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801073f1:	39 f3                	cmp    %esi,%ebx
801073f3:	0f 47 de             	cmova  %esi,%ebx
    memmove(pa0 + (va - va0), buf, n);
801073f6:	29 f8                	sub    %edi,%eax
801073f8:	83 ec 04             	sub    $0x4,%esp
801073fb:	01 c1                	add    %eax,%ecx
801073fd:	53                   	push   %ebx
801073fe:	52                   	push   %edx
801073ff:	51                   	push   %ecx
80107400:	e8 cb d4 ff ff       	call   801048d0 <memmove>
    len -= n;
    buf += n;
80107405:	8b 55 10             	mov    0x10(%ebp),%edx
    va = va0 + PGSIZE;
80107408:	8d 87 00 10 00 00    	lea    0x1000(%edi),%eax
  while(len > 0){
8010740e:	83 c4 10             	add    $0x10,%esp
    buf += n;
80107411:	01 da                	add    %ebx,%edx
  while(len > 0){
80107413:	29 de                	sub    %ebx,%esi
80107415:	74 59                	je     80107470 <copyout+0xc0>
  if(*pde & PTE_P){
80107417:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pde = &pgdir[PDX(va)];
8010741a:	89 c1                	mov    %eax,%ecx
    va0 = (uint)PGROUNDDOWN(va);
8010741c:	89 c7                	mov    %eax,%edi
  pde = &pgdir[PDX(va)];
8010741e:	c1 e9 16             	shr    $0x16,%ecx
    va0 = (uint)PGROUNDDOWN(va);
80107421:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
  if(*pde & PTE_P){
80107427:	8b 0c 8b             	mov    (%ebx,%ecx,4),%ecx
8010742a:	f6 c1 01             	test   $0x1,%cl
8010742d:	0f 84 4e 00 00 00    	je     80107481 <copyout.cold>
  return &pgtab[PTX(va)];
80107433:	89 fb                	mov    %edi,%ebx
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80107435:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
  return &pgtab[PTX(va)];
8010743b:	c1 eb 0c             	shr    $0xc,%ebx
8010743e:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
  if((*pte & PTE_P) == 0)
80107444:	8b 9c 99 00 00 00 80 	mov    -0x80000000(%ecx,%ebx,4),%ebx
  if((*pte & PTE_U) == 0)
8010744b:	89 d9                	mov    %ebx,%ecx
8010744d:	83 e1 05             	and    $0x5,%ecx
80107450:	83 f9 05             	cmp    $0x5,%ecx
80107453:	0f 84 77 ff ff ff    	je     801073d0 <copyout+0x20>
  }
  return 0;
}
80107459:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
8010745c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80107461:	5b                   	pop    %ebx
80107462:	5e                   	pop    %esi
80107463:	5f                   	pop    %edi
80107464:	5d                   	pop    %ebp
80107465:	c3                   	ret    
80107466:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
8010746d:	8d 76 00             	lea    0x0(%esi),%esi
80107470:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80107473:	31 c0                	xor    %eax,%eax
}
80107475:	5b                   	pop    %ebx
80107476:	5e                   	pop    %esi
80107477:	5f                   	pop    %edi
80107478:	5d                   	pop    %ebp
80107479:	c3                   	ret    

8010747a <uva2ka.cold>:
  if((*pte & PTE_P) == 0)
8010747a:	a1 00 00 00 00       	mov    0x0,%eax
8010747f:	0f 0b                	ud2    

80107481 <copyout.cold>:
80107481:	a1 00 00 00 00       	mov    0x0,%eax
80107486:	0f 0b                	ud2    
