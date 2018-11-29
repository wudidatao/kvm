#!/bin/bash

echo "关闭selinx"
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
sleep 3s
