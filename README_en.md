*author:Sukuna*

# xv6_Sifive_u

The operating system based on fu740

## Usage

Get the code from GitHub:

```
git clone https://github.com/HUST-OS/xv6-sifive_u.git
cd xv6-sifive_u
```

Run with QEMU:

```
make qemu
```

## Our Work

- Debug the boot loader and sbi to make sure the multicores will work smoothly.
- Debug the UART machine and corresponding console function.
- Debug the primary file system interface,use RAM to simulate the disk.
- Debug the FAT32 file system to provide stable file interfaces to user application.

## Available Branches

- Main:stable version.