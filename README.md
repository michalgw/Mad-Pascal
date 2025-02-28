# Mad-Pascal

[Doc PL](http://mads.atari8.info/doc/pl/index.html)

[Doc ENG](http://mads.atari8.info/doc/en/index.html)

## Introduction

**Mad-Pascal**  (MP) is a 32-bit **Turbo Pascal** compiler for **Atari XE/XL**. By design, it is compatible with the **Free Pascal Compilator** (FPC) (the `-MDelphi` switch should be active), which means the possibility of obtaining executable code for **XE/XL**, **PC** and every other platform for which **FPC** exists. **MP** is not a port of **FPC**; it has been written based on of **SUB-Pascal** (2009), **XD-Pascal** (2010), the author of which is [Vasiliy Tereshkov](mailto:vtereshkov@mail.ru).

A program that works on Atari might have problems on **PC** if, for example, the pointers have not been initialized with the address of a variable and the program attempts to write to the address `$0000` (memory protection fault). The strengths of **MP** include fast and convenient possibility of inclusion of inline assembly. A program using inline **ASM** does not work on platforms other than **XE/XL**. **MP** uses 64KB of primary memory; `TMemoryStream` provides usage of extended memory.
Variable allocation is static; there is no dynamic memory management. Parameters are passed to functions by value, variable or constant.

The available features are:

* `If` `Case` `For To` `For In` `While` `Repeat` statements
* Compound statements
* `Label` `Goto` statements
* Arithmetic and boolean operators
* Procedures and functions with up to 8 parameters. Returned value of a function is assigned to a predefined `RESULT` variable
* Static local variables
* Primitive data types, all types except the `ShortReal`/`Real` type are compatible. Pointers are dereferenced as pointers to `Word`:
    * `Cardinal` `Word` `Byte` `Boolean`
    * `Integer` `SmallInt` `ShortInt`
    * `Char` `String` `PChar`
    * `Pointer` `File` `Text`
    * `ShortReal` `Real` (fixed-point)
    * `Float16` https://en.wikipedia.org/wiki/Half-precision_floating-point_format
    * `Single` https://en.wikipedia.org/wiki/Single-precision_floating-point_format
* One-dimensional and Two-dimensional arrays (with zero lower bound) of any primitive type. Arrays are treated as pointers to their origins (like in C) and can be passed to subroutines as parameters
* Predefined type `String` `[N]` which is equivalent to `array [0..N] of Char`
* `Type` aliases.
* `Records`
* `Objects`
* Separate program modules
* Recursion

## Usage

    mp.exe filename.pas
    mads.exe filename.a65 -x -i:base

## Tools

### [MadStrap](http://bocianu.atari.pl/blog/madstrap)

Simple Atari Mad-Pascal common project bootstrap.

Source code at [GitLab](https://gitlab.com/bocianu/madstrap)

### [BLIBS](http://bocianu.atari.pl/blog/blibs)

Set of custom libraries for MadPascal.

Lastest documentation always at [GitLab]( https://bocianu.gitlab.io/blibs/)

### [pasdoc](https://bocianu.atari.pl/blog/pasdoc)

Custom tool for generating documentation from pascal comments in units.

Source code at [GitLab](https://gitlab.com/bocianu/pasdoc)

### [Effectus](https://github.com/Gury8/effectus) - Action! compiler

In new version the source code is generated by using Mad Pascal cross-compiler, which is further compiled to binary code with Mad Assembler.

### [Game tutorial](https://github.com/zbyti/a8-mp-simple-game-tutorial)

Simple game tutorial by using Mad Pascal

### [FiDL](https://gitlab.com/bocianu/fidl)

Display List program editor for 8-bit Atari ANTIC chipset

### [CutAs](https://gitlab.com/bocianu/cutas)

Simple binary data manipulation tool written in javascript (export to Action!, Assembler, C, Pascal)

## Projects in Mad-Pascal

* [StarVagrant](https://github.com/MADRAFi/StarVagrant)
* [MadKingdom](https://gitlab.com/bocianu/MadKingdom)
* [zilch](https://gitlab.com/bocianu/zilch)
* [justpong](https://gitlab.com/bocianu/justpong)
* [hoppe](https://gitlab.com/bocianu/hoppe)
* [PacMad](https://gitlab.com/bocianu/PacMad)
* [k12trailer](https://gitlab.com/bocianu/k12trailer)
* [gr10](https://gitlab.com/bocianu/gr10)
* [oldmansion](https://gitlab.com/bocianu/oldmansion)
* [artur](https://gitlab.com/bocianu/artur)
* [jcq](https://gitlab.com/bocianu/jcq)
* [Fujinet udp shoutbox](https://gitlab.com/bocianu/fujinet-udp-shoutbox)
* [speedway](https://gitlab.com/bocianu/speedway)
* [chessnet](https://gitlab.com/bocianu/chessnet)
* [gr9Lab](https://gitlab.com/amarok8bit/gr9Lab)
* [SortViz](https://gitlab.com/amarok8bit/sortviz)
* [weather](https://gitlab.com/bocianu/weather)
* [cart builder](https://gitlab.com/bocianu/cart_builder)
* [Mole](https://github.com/GSoftwareDevelopment/Mole)
* [SFX-Tracker](https://github.com/GSoftwareDevelopment/SFX-Tracker)
* [SFX-Engine](https://github.com/GSoftwareDevelopment/SFX-Engine)
   * [SFX-Engine-example](https://github.com/GSoftwareDevelopment/SFX-Engine-example)
* [MIDICar-Player](https://github.com/GSoftwareDevelopment/MIDICar-Player)
* [heatmap](https://gitlab.com/delysio/heatmap)
* [Flob](https://gitlab.com/bocianu/flob)
* [Ultima V](https://atariage.com/forums/topic/319655-ultima-v-world-explorer-in-antic-mode-e/page/2/?tab=comments#comment-4903483)
* [mad-pascal-playground](https://github.com/zbyti/mad-pascal-playground)

## Benchmarks

|                             |CC65 |Mad Pascal|Millfork|
|:----------------------------|:----|:--------:|:------:|
|Sieve (less is better)       |602  |577       |579     |
|YoshPlus (higher is better)  |41933|41933     |41933   |
|Chessboard (higher is better)|76   |88        |82      |

[https://github.com/tebe6502/Mad-Pascal/blob/master/samples/benchmark.7z](https://github.com/tebe6502/Mad-Pascal/blob/master/samples/benchmark.7z)

### Floating Point

| iteration x 256             |Atari OS|FastChip|MP Single|MP Real|
|:----------------------------|:-------|:------:|:-------:|:-----:|
|add, sub, mul, div           | 232    | 118    | 64      | 99    |
|add, sub, mul, div, sin, cos | 5820   | 2915   | 3728    | 1231  |

* MP Single: IEEE754-32bit
* MP Real: Q24.8 Fixed Point

[https://github.com/tebe6502/Mad-Pascal/blob/master/samples/fp_benchmark.7z](https://github.com/tebe6502/Mad-Pascal/blob/master/samples/fp_benchmark.7z)

### Suite

![suite-animation](https://github.com/zbyti/a8-mad-pascal-bench-suite/raw/master/suite.gif)

[sources](https://github.com/zbyti/a8-mad-pascal-bench-suite)

## Links

* [HOME Page](http://mads.atari8.info/)
* [Atari Age Forum](https://atariage.com/forums/topic/240919-mad-pascal/)
* [Atari Area Forum](http://www.atari.org.pl/forum/viewtopic.php?id=13373)
* [Mad Pascal Announcement for WUDSN](https://atariage.com/forums/topic/145386-wudsn-ide-the-free-integrated-atari-8-bit-development-plugin-for-eclipse/?do=findComment&comment=4340150)
* [Some advice](https://github.com/ilmenit/CC65-Advanced-Optimizations)
* [Programowanie w Mad Pascal dla C+4](https://c64portal.pl/2021/02/22/programowanie-w-mad-pascal-dla-c4/)
* [Commodore Plus/4, Mad Pascal i bitmapy](https://c64portal.pl/2021/04/10/commodore-plus-4-mad-pascal-i-bitmapy/)
