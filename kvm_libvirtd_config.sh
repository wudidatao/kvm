#!/bin/bash

. ./hostname.sh

echo "配置kvm开启服务监听"
sed -i 's/#LIBVIRTD_CONFIG/LIBVIRTD_CONFIG/g' /etc/sysconfig/libvirtd
sed -i 's/#LIBVIRTD_ARGS/LIBVIRTD_ARGS/g' /etc/sysconfig/libvirtd

echo "配置TCP连接"
sed -i 's/#listen_tls = 0/listen_tls = 0/g' /etc/libvirt/libvirtd.conf
sed -i 's/#listen_tcp = 1/listen_tcp = 1/g' /etc/libvirt/libvirtd.conf
sed -i 's/#auth_tcp = "sasl"/auth_tcp = "none"/g' /etc/libvirt/libvirtd.conf
sed -i 's/#tcp_port = "16509"/tcp_port = "16509"/g' /etc/libvirt/libvirtd.conf
sed -i 's/#listen_addr = "192.168.0.1"/listen_addr = "0.0.0.0"/g' /etc/libvirt/libvirtd.conf

#配置TLS，还需要调整证书配置，暂时没时间弄，以后再说
#sed -i 's/#listen_tls = 0/listen_tls = 1/g' /etc/libvirt/libvirtd.conf
#sed -i 's/#auth_tls = "none"/auth_tls = "none"/g' /etc/libvirt/libvirtd.conf
#sed -i 's/#tls_port = "16514"/tls_port = "16514"/g' /etc/libvirt/libvirtd.conf
