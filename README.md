# Atari 2600 dev template #
Simple collection of scripts and templates for quality of life improvements when developing for the Atari 2600.

Please follow visit my homepage and blog [haxor.no](https://www.haxor.no/) for more about me and my projects.

## Build Dependencies ##
I develop using WSL in Windows 10 to make the files on a debian based Linux box. Feel free to use Kali Linux, Ubuntu, Debian etc.

You will need [dasm](https://dasm-assembler.github.io/) to assembly the source code to machine code, and make to automate and simplify the build and test process.

To install the dependencies you first need to add execution permission to the install scipt. Then you can run the script.
```
sudo chmod u+x install_dep.sh
./install_dep.sh
```

## Emulator ##
I use the [Stella](https://stella-emu.github.io/) emulator for testing and debugging.

Install it using the latest [stable release](https://stella-emu.github.io/downloads.html) for your OS.

## Workflow - Build ##
When developing on a Windows box you will need to have a WLS guest OS running on your computer. Once the source code is completed you can build it using the command:

```
make
```

This will build the ROM, and create the link file and symbol file that makes debugging a lot easier.

## Workflow - Linux - Test and debug ##
If you develop on a Linux box start the emulator with your ROM file using the command

```
make run
```

to open the debug console press the "|" key on your keyboard.

## Workflow - Windows - Test and debug ##
If you develop on a Windows box start the emulator with your ROM file using the command

```
emulate.cmd
```

to open the debug console press the "|" key on your keyboard.

