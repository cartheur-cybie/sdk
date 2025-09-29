## iCSDK

_iCybie Software Development Kit:_ A set of code to enable development of iCybie programs.

### Overview

This directory contains various technical notes on the hardware and software of the iCybie and iCSDK Library (iCLib2). Of particular interest is the Toshiba CPU, iCybie's main CPU, and how it is utilized. For more details, see the [source](/binsrc/README.md) code to the iCLib2 [library](/lib/iclib2.lib).

### Hardware:

The iCybie has three CPUs:

* The main Toshiba CPU,
* A SunSite daughter CPU for sound playback (and other features) and,
* A RSC-300 voice recognition CPU (in iCybie's head).

The main features are in the Toshiba CPU, which has 8KB of RAM, 256KB of system ROM, 256KB of optional cartridge ROM, 128 bytes of E2PROM, and many peripherals including interfaces to the other two CPUs.

The main CPU can controlled by writing programs that run from the cartridge. The ICSDK provides the tools, library and samples for these programs.

The other two CPUs (SunSite and RSC-300) are not user programmable, and must be used as-is.

_Hardware notes_
* ports.txt - SFR and I/O port usage
* e2prom.txt - access to 64 byte E2PROM
* timers.txt - CPU timer usage
* misc.txt - serial port, ADC, etc
* irlogic.txt - IR interface logic
* ircodes.txt - IR codes

_Not written yet_
* rsc300.txt - interface to the RSC-300 voice recognition CPU
* sunplus.txt - interface to the SunPlus daughter CPU

### Software/Firmware

The software/firmware for the Toshiba CPU comes from two locations, the System ROM and the (optional) Cartridge ROM. Both ROMs are 256KB in size (for a maximum of 512KB of ROM). Compatibility with the System ROM raises many restrictions on the layout of memory (ROM and RAM). These are discussed in the
following technical notes.

* memmap.txt - general memory map and usage restrictions
* most other documentation is in the `IcLib2` source code, see [here](/libsrc/README.md)
