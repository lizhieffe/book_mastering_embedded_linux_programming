#!/bin/sh

set -e

DIR=~/development/book_mastering_embedded_linux_programming/rootfs
OUTPUT_DEV=/dev/sdd1
OUTPUT_NAME=uRamdisk

cd "$DIR"
find . | cpio -H newc -ov --owner root:root > /tmp/initramfs.cpio
cd /tmp
gzip initramfs.cpio
mkimage -A arm -O linux -T ramdisk -d initramfs.cpio.gz "$OUTPUT_NAME"
echo
echo "Ramdisk is created at /tmp/$OUTPUT_NAME"

sudo mount "$OUTPUT_DEV" /mnt
rm /mnt/"$OUTPUT_NAME"
cp /tmp/"$OUTPUT_NAME" /mnt
sudo umount /mnt
echo "Copied the root filesystem to $OUTPUT_DEV"
