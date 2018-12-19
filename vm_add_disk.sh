#!/bin/bash

vdisk_name=/dev/vdb
vdisk_partion=/dev/vdb1
vdisk_dir=/data

fdisk $vdisk_name
mkfs.xfs $vdisk_partion
mkdir -p $vdisk_dir
mount $vdisk_partion $vdisk_dir
echo "$vdisk_partion $vdisk_dir xfs defaults 1 2" >> /etc/fstab
