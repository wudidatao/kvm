#!/bin/bash

zone_name=grafana-0-127
disk_name=grafana-0-127-data.img
disk_size=200G
vdisk_name=vdb

qemu-img create -f qcow2 /opt/lib/libvirt/images/$disk_name $disk_size

virsh attach-disk $zone_name /opt/lib/libvirt/images/$disk_name $vdisk_name --cache=writethrough --subdriver=qcow2 --config --live
