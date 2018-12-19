#!/bin/bash
fdisk /dev/vdb
mkfs.xfs /dev/vdb1
mkdir -p /data
mount /dev/vdb1 /data
echo "/dev/vdb1 /data xfs defaults 1 2" >> /etc/fstab
