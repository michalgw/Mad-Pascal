
(*

   VGA: text mode 80x24 in 2 colors per character. This is like GR.0 in 80 columns and color.

 VGALo: pixel mode 160x192/256 colors (lowres). This is like GR.15 in 256 colors.

VGAMed: pixel mode 320x192/256 colors (stdres). This is like GR.8 in 256 colors.

 VGAHi: pixel mode 640x192/16 colors (hires)

*)


uses crt, vbxe;

const

    vga: array [0..15] of cardinal = (
    $000000,	// black
    $AA0000,	// red
    $00AA00,	// green
    $AA5500,	// yellow
    $0000AA,	// blue
    $AA00AA,	// magenta
    $00AAAA,	// cyan
    $AAAAAA,	// white
    $555555,	// bright black
    $FF5555,	// bright red
    $55FF55,	// bright green
    $FFFF55,	// bright yellow
    $5555FF,	// bright blue
    $FF55FF,	// bright magenta
    $55FFFF,	// bright cyan
    $FFFFFF	// bright white
    );


var i: byte;

    colors : array [0..15] of string = (
    'Black',
    'Red',
    'Green',
    'Yellow',
    'Blue',
    'Magenta',
    'Cyan',
    'White',
    'Bright Black',
    'Bright Red',
    'Bright Green',
    'Bright Yellow',
    'Bright Blue',
    'Bright Magenta',
    'Bright Cyan',
    'Bright White'
    );



procedure initVBXE;
var a, b: byte;
begin

 if VBXE.GraphResult <> VBXE.grOK then begin
  writeln('VBXE not detected');
  halt;
 end;

 SetRGBPalette(1);					// create Palette #1

 for a:=0 to 127 do SetRGBPalette(vga[a and $0f]);

 for b:=0 to 7 do
  for a:=0 to 15 do SetRGBPalette(vga[b]);

 SetRGBPalette(128, 16,16,16);				// background color

 VBXEMode(VBXE.VGA, 1);					// VBXE MODE, OVERLAY PALETTE #1

end;


begin

 initVBXE;

 for i:=0 to 15 do begin

   Position(0, i+4);
   TextOut(colors[i], i);

 end;



 for i:=0 to 7 do begin
   Position(16+i*8, 2);
   TextOut(colors[i], i);
 end;


 for i:=0 to 15 do begin

 // COLOR FOREGROUND = 0..15
 // COLOR BACKGROUND = 0..7

 // COLOR = FOREGROUND + BACKGROUND * 16 + 128

   Position(16, i+4);
   TextOut('00001111', byte(i + 0*16 + 128));

   Position(16+8, i+4);
   TextOut('22223333', byte(i + 1*16 + 128));

   Position(16+8*2, i+4);
   TextOut('44445555', byte(i + 2*16 + 128));

   Position(16+8*3, i+4);
   TextOut('66667777', byte(i + 3*16 + 128));

   Position(16+8*4, i+4);
   TextOut('88889999', byte(i + 4*16 + 128));

   Position(16+8*5, i+4);
   TextOut('AAAABBBB', byte(i + 5*16 + 128));

   Position(16+8*6, i+4);
   TextOut('CCCCDDDD', byte(i + 6*16 + 128));

   Position(16+8*7, i+4);
   TextOut('EEEEFFFF', byte(i + 7*16 + 128));

 end;



 repeat until keypressed;

end.