# Pico Nuke
Raspberry Pi flash nuke to reset the flash to all 0s for all supported boards.

It compiles the code from `pico-examples` [repository](https://github.com/raspberrypi/pico-examples/blob/master/flash/nuke/nuke.c) for every supported board. 

This is a necessary step if you want to test multiple programs that may write into flash memory.

For example, when you switch from [Pico HSM](https://github.com/polhenarejos/pico-hsm) to [Pico OpenPGP](https://github.com/polhenarejos/pico-openpgp) (or viceversa), you need first to wipe out your Pico.

## How to use
1. Download the UF2 file corresponding to the version of your board from [Release section](https://github.com/polhenarejos/pico-nuke/releases)
2. Put your pico into uf2 loading (BOOTSEL+Reset).
3. Copy the `.uf2` file to the mounted device (usually `RP2-RPI`).
4. Wait until the led blinks 3 times.
5. After completion, pico will enter again into uf2 loading.
6. Load your desired program (the other `.uf2` file).
