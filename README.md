[kvm安装与维护]

#修改主机名
./hostname.sh

#网卡桥接配置
./bridge_br0.sh

#检查kvm基本环境
./kvm_base_check.sh

#关闭NetworkManager
./NetworkManager_stop.sh

#关闭防火墙
./firewalld_stop.sh

#安装kvm相关软件
./yum_install.sh

#关闭selinux
./selinux.sh

#检查kvm安装情况并加载到内核（intel架构）
./kvm_intel_check.sh

#配置kvm的libvirtd
./kvm_libvirtd_config.sh

#安装kvm的libvirtd并检查
./kvm_libvirtd_install.sh

#重启kvm
./kvm_libvirtd_restart.sh

----------------------------
[web界面安装与维护]
#安装web界面webvirtmgr管理kvm
./kvm_webvirtmgr_install.sh

#重启webvirtmgr
./kvm_webvirtmgr_restart.sh

---------------------------
[虚拟机管理]
#kvm创建linux虚拟机模板
#./kvm_vm1.sh
~
