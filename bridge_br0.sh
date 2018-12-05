#!/bin/bash

#复制网卡配置信息
#cp /etc/sysconfig/network-scripts/ifcfg-enp0s25 /etc/sysconfig/network-scripts/ifcfg-br0

#网卡配置文件中增加BRIDGE=br0,修改BOOTPROTO=none，修改TYPE=Bridge，注释IPADDR GATEWAY NETMASK
#网桥配置文件中修改NAME=br0 DEVICE=br0，修改BOOTPROTO=static，修改IPADDR GATEWAY NETMASK为实际情况，如果DNS无效，再设置DNS
#有些时候需要设置MAC地址 HWADDR=
#重启网络
systemctl restart network.service
