#!/bin/bash

echo "关闭NM"
systemctl stop NetworkManager
systemctl disable NetworkManager
