#!/bin/bash

echo "系统模块安装检测，包含kvm和kvm_intel即可，如果缺kvm_intel说明主板BOIS没有打开虚拟化支持"
lsmod | grep kvm
sleep 3

echo "加载安装好的kvm模块"
modprobe kvm
modprobe kvm_intel
sleep 3

