## Samples

_Trivial examples_

* `hello`
    - A simple hello world.
* `base`
    - The base program construct.
    - Copy this to start your own project.

_Useful examples_

* `test1` - The main test program.
    - Test driver for high level features like action playback.
* `sine` - For sine wave generation - WORK IN PROGRESS!
    - An on-the-fly ADPCM encoding and tone generation. Note that encoder is slow, and sine wave generation does not generate a repeatable waveform.
* `dalek` - A mini-personality - WORK IN PROGRESS!
    - A start of a personality code example of having a lot of audio (>180K) - and tricky packing.
* `clinic` - A diagnostic tool for battery and EEPROM settings.

_Low-level examples_

* `test0` - A lower level test program for lower level things, like higher level IR polling and motor control.
* `irprobe` - A low-level IR probe. Great for turning your iCybie into an IR sniffer.

### Building the sources

* `m` = m.bat = build
* `m clean` = remove temp files
* `t` = t.bat = test (using sicup)
