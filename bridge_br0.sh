#!/bin/bash

#复制网卡配置信息
#cp /etc/sysconfig/network-scripts/ifcfg-enp0s25 /etc/sysconfig/network-scripts/ifcfg-br0

#网卡配置文件中增加BRIDGE=br0,修改BOOTPROTO=none，注释IPADDR GATEWAY NETMASK
TYPE=Ethernet
BOOTPROTO=none
NAME=enp0s25
DEVICE=enp0s25
ONBOOT=yes
BRIDGE=br0

#网桥配置文件中修改NAME=br0 DEVICE=br0，修改TYPE=Bridge，修改BOOTPROTO=static，修改IPADDR GATEWAY NETMASK为实际情况，如果DNS无效，再设置DNS
TYPE=Bridge
BOOTPROTO=static
NAME=br0
DEVICE=br0
IPADDR=192.168.1.250
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
DNS1=114.114.114.114
ONBOOT=yes

#重启网络
systemctl restart network.service
