#!/bin/bash

#创建虚拟机硬盘
#raw kvm默认磁盘设备，也叫裸设备，一次性分配空间，性能最好，无法压缩，增量备份和快照
#qcow2 用多少创建多少空间，性能不如raw，可以压缩，增量备份和快照


qemu-img create -f qcow2 /var/lib/libvirt/images/vm1-disk.img 50G
qemu-img create -f raw /var/lib/libvirt/images/vm3-disk.img 50G


virt-install \
#os-variant rhel7 \
--name vm1 \
--memory 1024MiB,maxmemory=1024MiB \
--vcpus 2,maxvcpus=2 \
--network bridge=br0 \
--disk device=disk,path=/var/lib/libvirt/images/vm1-disk.img,format=qcow2,size=3,bus=virtio,cache=writeback,io=threads \
--location  /var/lib/libvirt/images/CentOS-7-x86_64-Minimal-1804.iso \
--graphics vnc,port=-1 \
--autostart
