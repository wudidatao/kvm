#!/bin/bash

echo "linux版本"
cat /etc/redhat-release 
sleep 3

echo "检查虚拟化支持，包含vmx表示支持intel虚拟化，包含svm表示支持amd虚拟化即可"
cat /proc/cpuinfo | egrep 'vmx|svm' 
sleep 3
