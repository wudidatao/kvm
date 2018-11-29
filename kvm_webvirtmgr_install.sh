#!/bin/bash

. ./hostname.sh

yum install epel-release
yum install git python-pip libvirt-python libxml2-python python-websockify supervisor

cd /usr/local/src/
git clone git://github.com/retspen/webvirtmgr.git

cd /usr/local/src/webvirtmgr
pip install --upgrade pip
pip install -r requirements.txt
#初始化环境，创建表，创建管理员信息，默认root,密码123456
./manage.py syncdb 
#生成静态文件
./manage.py collectstatic
#如需再创建其他管理员账号可执行这个
#./manage.py createsuperuser

#将相关目录拷贝到web
cd /usr/local/src
mkdir -pv /var/www
cp -Rv webvirtmgr /var/www/webvirtmgr

#配置supervisor
echo "
[program:webvirtmgr]
command=/usr/bin/python /var/www/webvirtmgr/manage.py run_gunicorn -c /var/www/webvirtmgr/conf/gunicorn.conf.py
directory=/var/www/webvirtmgr
autostart=true
autorestart=true
logfile=/var/log/supervisor/webvirtmgr.log
log_stderr=true
user=root

[program:webvirtmgr-console]
command=/usr/bin/python /var/www/webvirtmgr/console/webvirtmgr-console
directory=/var/www/webvirtmgr
autostart=true
autorestart=true
stdout_logfile=/var/log/supervisor/webvirtmgr-console.log
redirect_stderr=true
user=root
" >> /etc/supervisord.conf

#绑定IP
sed -i "s/127.0.0.1/$kvm_host_ip/g" /var/www/webvirtmgr/conf/gunicorn.conf.py

#设置local_settings.py文件
cd /var/www/webvirtmgr/webvirtmgr/local
cp local_settings.py.example local_settings.py

#启动supervisor
systemctl start supervisord
systemctl enable supervisord

echo "访问服务 http://$kvm_host_ip:8000"
