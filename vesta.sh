#!/bin/bash

##############################################################################################
# vestacp kurulum
##############################################################################################



renk='\e[0;36m'
mavim='\e[1;34m'
beyaz='\e[1;37m'
NC='\e[0m'             

site="https://burakkandemr"

yanlis="
\033[1;33m###################################################################\033[1;32m \033[0m
\033[1;33m#                                                                 #\033[1;32m \033[0m
\033[1;33m    \033[1;33m=> Yanlis tuslama yapildi, script kapatiliyor.      \033[0m      \033[1;33m \033[0m
\033[1;33m#                                                                 #\033[1;33m \033[0m
\033[1;33m###################################################################\033[1;32m \033[0m
"

#--------------------------------------------------------------------------------------#
update_sorun(){
clear
sleep 0.5
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m     \033[1;33m=> cURL kütüphanesi eksik, lütfen yükleyin.      \033[0m         \033[1;33m \033[0m"
echo -e "\033[1;33m#    \033[1;31m=> yum install curl                        \033[0m\033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
exit

}

burakkandemr_kurulum_bilesenkur(){
sleep 1
clear
yum -y upgrade
curl -O http://vestacp.com/pub/vst-install.sh
bash vst-install.sh --nginx no --apache yes --phpfpm no --named yes --remi yes --vsftpd no --proftpd yes --iptables yes --fail2ban yes --quota no --exim no --dovecot no --spamassassin no --clamav no --softaculous no --mysql yes --postgresql no --hostname $1 --email $2 --password $3
yum -y update
yum install yum-utils
yum-config-manager --enable remi-php72
yum update
service httpd restart
yum install memcached
memcached -d -m 512 -l 127.0.0.1 -p 11211 -u nobody
ps -eaf | grep memcached
yum install php-memcache
yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_8.x | sudo -E bash -
sudo yum install nodejs
sudo npm i -g npm
sudo npm i -g forever
sudo npm audit fix
chmod 777 /tmp
chmod 777 /var/lib/php/session
chown -R admin:admin /var/lib/php/session/
chown -R admin:admin /var/lib/php/opcache/
chown -R admin:admin /var/lib/php/wsdlcache/
chown -R admin:admin /tmp
service httpd restart

}
                                                     
command -v curl >/dev/null 2>&1 || hatakaydi="1"
if [[ $hatakaydi -eq 1 ]]
	then
sleep 1
update_sorun
fi
sleep 0.5
clear
echo -e "\033\e[93mScript Açılıyor [HASANATİLAN V1.0]\033[0m"
sleep 4
clear

echo -e "\033[1;33m######################################################################\033[1;32m \033[0m"
echo -e "# ${beyaz}
#   #   P   r   o   j   e   #              Salvatore Yeni Sürüm V1 ${beyaz}
#  / \ / \ / \ / \ / \ / \ / \        --------------------------------${renk}
# ( B | U | R | K | K | A | N |${mavim}      ¦         burakkandemr        ¦${beyaz}
#  \_/ \_/ \_/ \_/ \_/ \_/ \_/        --------------------------------
"${beyaz}
	echo -e "\033[1;33m \033[0;36m                                                             \033[1;33m \033[0m"
	echo -e "\033[1;33m# \033[0;36m=>  HASANATİLAN Centos 6,7 VestaCP, PHP7,NodeJS Kurulumu \033[0m                       \033[1;33m \033[0m"
	echo -e "\033[1;33m# \033[0;36m=>  Geliştirici: burakkandemr   	 \033[0m                       \033[1;33m \033[0m"
	echo -e "\033[1;33m######################################################################\033[1;32m \033[0m"
	echo -e "\033[1;31m1)  Hemen Kurulum Yap\033[0m"
	echo -e "\033[1;31m2)  Çıkış\033[0m"
read secenek

case $secenek in
 1)
burakkandemr_kurulum_bilesenkur
 ;;

esac