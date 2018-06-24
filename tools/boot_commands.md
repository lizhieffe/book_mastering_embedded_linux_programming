# Boot Commands

The sequence of commands are the ones to type into the serial console after BeagalBone Black is powered on in order to load kernel and root filesystem.

```
fatload mmc 0:1 0x80200000 zImage
fatload mmc 0:1 0x80f00000 am335x-boneblack.dtb
fatload mmc 0:1 0x81000000 uRamdisk
setenv bootargs console=ttyO0,115200 rdinit=/sbin/init
bootz 0x80200000 0x81000000 0x80f00000
```
