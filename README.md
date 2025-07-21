# iCybie sdk

Software development kit for the iCybie. Repository navigation:

* [`libsrc`](/libsrc/README.md)
* [notes](/notes/README.md)
* [samples](/samples/README.md)

Also there are companion repositories for other features:

* [himage](https://github.com/cartheur-cybie/himage)
* [icaud](https://github.com/cartheur-cybie/icaud)
* [yict](https://github.com/cartheur-cybie/yict)

Where one can revolve around the concept of modifying an iCybie:

* [Super-iCybie](https://github.com/cartheur-cybie/Super-iCybie)

## Version 2.00

This iCybie SDK includes:
* A full C compiler, with some caveats.
* The `iclib` iCybie runtime.
* A limited C runtime.
* Full `C` source to `iclib` runtime.
* Tools to upload programs to your Super-iCybie using RS-232 or FT232RL.
* File compatibility with the Silverlit downloader (`-l.bin`,`-h.bin`).
* A collection of samples.

All developer documentation is in the NOTES\*.TXT files.

### System ROM/Firmware:

This release REQUIRES the *NEW* System ROM firmware + `CROM` for development. `CROMINST 1.1` will upgrade the system ROM for you and install `CROM`. Cartridge programs created with the SDK will run in any iCybie with any of the three known versions of the system ROM.

_Cartridge only_

The current SDK is designed to build `.ic3` programs (256KB cartridge programs that run in any iCybie). These are packaged as two `.BIN` files (`-L.BIN`,`-H.BIN`) for compatibility with the SilverLit Downloader as well as the `sicburn` utility. Note that `sicburn` is a slightly improved version of the old `sicup` utility.

The old `.IC0` format (of the `SICSDK` V1) is no longer supported. If you have previously used the `SICSDK` V1, you should un-install any `.IC0` programs before using the SDK (i.e. run `sicup restore.ic0`)

Developing/installing programs into the system ROM (i.e. `ICSUCK`) is not supported in the SDK.

### What's in the SDK:

Install in any folder, all paths are set up to be relative. You do not need to change `PATH`, `INCLUDE`, or `LIB` variables.

    README.TXT - this file

    BIN\*.EXE - various tools (described below)
    ETC\*.* - extra files needed by compiler

    INC\*.H - common includes (described below)
        INC\IC.H - main include file
        INC\IC_*.H - subsystems included by IC.H

        INC\IC_SFR.H - advanced: for direct access to CPU's SFRs
        INC\IC_MAIN0.H - advanced: for custom startup code

        INC\ICSTD.MAK - standard makefile for most samples

    LIB - library files
	    LIB\CRT3.O - startup file for cartridge personality
        LIB\ICLIB2.LIB - iCybie Library
        LIB\CARTIC3.LCF - link layout file for cartridge/IC3 file

    SAMPLES\
        SAMPLES\HELLO - "hello world"
        SAMPLES\BASE - base program - copy to start your own program

        SAMPLES\TEST1 - general purpose high level test program
        SAMPLES\TEST0 - specialized low level test program

        others, see SAMPLES\README.md

    NOTES\*.TXT - developer documentation
        See NOTES\README.md

    LIBSRC\*.* - source to `iclib` library
        See LIBSRC\README.md

    BINSRC\*.CPP - sources to the tools

        NOTE: source is not available to many critical tools
    
`BIN TOOLS`: Most tools are automatically handled for you by the standard makefile "INC\ICSTD.MAK".

    NMAKE.EXE - Microsoft NMAKE utility

    CC900.EXE - Toshiba compiler
	    THC1.EXE, THC2.EXE - used by compiler
    ASM900.EXE - Toshiba assembler
    TULINK.EXE, TUCONV.EXE, convic3.exe - tools for linking and building images
    TULIB.EXE - library manager
    TUFAL.EXE - dump absolute addresses

    sicburn.exe - transfer from PC to cartridge via serial port
            [old version was formerly called 'sicup']
    sicgrab.exe - advanced tool. Transfer from cartridge to PC via serial port
            [old version was formerly called 'sicdown']

    splitic3.exe - split a 256K .ic3 file into two 128K files
            [ lower (-l.bin) and upper (-h.bin) halves]
    mergeic3.exe - merge two 128K files into one 256K .ic3 file

    aud2c.exe - convert .ADP files to C source
            [ to include sounds in your program ]
    adpcm66.exe - convert 16bit (8kHz) WAV files to 4bit ADPCM

Tools without source are publicly available with copyright held by the appropriate parties. Tools with source are my own creation and are freeware in both source and binary forms.

### ICSDK2 ALPHA RELEASE NOTES:

This release provides low-level services for the iCybie robot. It is not complete nor does it have a working _personality_. The tool for customizing complete personalities is [YICT](https://github.com/cartheur-cybie/yict). Take the time to learn about YICT before proceeding with this SDK.

Components working in-totality:

* Simple startup
* Multi-layered initialization and library code
* Serial initialization (with semi-selectable baud rates)
* General timer services
* System ROM version detection (compensates for old system ROMs)
* LED playback (eyes)
* AUDIO playback (synchronous)
* Reusing 30 sounds from System ROM
* Poll Sensors (10 bits)
* E2PROM Storage Read/Write
* Simple flash ROM writer [not generally useful or recommended]
* IR receive logic (compatible with IR remote, existing robots and charger)
* IR transmit logic
* IR communication to RSC-300 (voice commands)
* Low level PWM motor control for 16 motors (12 legs + head/neck/mouth/tail)
* ADC sampling for 12 legs, battery-voltage and light-level
* Leg - abstract positions use E2PROM calibration info from last calibration
* Motion playback control (legs only)
* Posture control
* Action playback control
* All standard motions (reusing system ROM for space savings)
* All standard actions

Partially complete: (need more work)

* Simple "raw" servo loop (overshoots a lot)
* Basic motion playback for legs and sounds
* Shutdown/power down - done but not tested
* Using standard motion data (with exceptions) - done
* Posture control - done
* Action playback - done
* Standard actions (290 of 'em) - done
* Voice command info and commands - done
* IR TX logic - done (and fixed)
* IR Obstacle logic - old emulate - done (as sample)
* IR Obstacle logic - new - done - needs higher level logic
* Simplified "raw" servo control - done

Not complete and needing development:

* Full 16 motor motion playback (missing head, neck, mouth, tail)
* LED motion/action playback (and proper timing)
* Tilt handling
* Clap detect
* BasicDog personality
* Leg jam detection (faster, variable tolerance)
* Power up after power-down
* Voice recording `**`
* Leg calibration `**`
* `**` => not necessary since you can remove the cartridge and use the default System ROM personality.
* Optimizing routines, in particular frequently called interrupt routines where RAM indirection needs to be removed from `CROM`.

TODO:

* Watch-dog logic, as in watch-dog timer.
* `ICSUCK` technology.
