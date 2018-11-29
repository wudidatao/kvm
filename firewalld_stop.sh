#!/bin/bash

echo "关闭防火墙"
systemctl stop firewalld.service
systemctl disable firewalld.service
sleep 3s

