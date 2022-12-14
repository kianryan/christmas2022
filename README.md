# RC2014 Merry Christmas 2022

Simple demonstration of [Pi Zero Serial Terminal](https://rc2014.co.uk/modules/pi-zero-serial-terminal/) and 
[RC2014-ym2149](https://github.com/electrified/rc2014-ym2149) cards in the [RC2014](https://rc2014.co.uk/), using the 
built in NASCOM BASIC.

The RC2014-YM2149 uses timings for a [ZX True Tone](https://www.tindie.com/products/quazar/zxtt-zx-true-tone-add-on-for-rc2014-ymay/).  It'll play without, but will sound different.

Pi Zero Serial Terminal is running current versions of [PiGfx](https://github.com/fbergama/pigfx) for access to drawing primitives.

If you have the pre-requisite hardware, deploying it should be as simple as pasting the code directly over a serial terminal.

I have not tested it with MBasic.

Demonstrates from BASIC:

* Generating basic musical tones using the AY/YM chip
* Drawing lines and primitives on the screen with PiGfx.
* Bitmap built using [Piskel](https://www.piskelapp.com/), exported to C data and converted to BASIC DATA statements.
* Bitmap loaded and displayed as Sprite with PiGfx.
* Sprites animated in sync with audio.


See a demo below

<iframe width="560" height="315" src="https://www.youtube.com/embed/yxx2xzdkjWg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>