#!/bin/bash

. ./hostname.sh

echo "启动libvirtd服务"
systemctl restart libvirtd
systemctl enable libvirtd

echo "检查服务是否启动"
ss -lt | grep 16509
sleep 3

echo "重启后检查virsh系统列表信息 如果有列表表示kvm安装启动成功"
virsh -c qemu:///system list 
virsh -c qemu+tcp://$kvm_host_ip/system
sleep 3
