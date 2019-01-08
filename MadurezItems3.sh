#!/bin/bash
#JEFHCO
#INGRESO DE VALORES PARA CUMPLIR CON ESTADO DE MADUREZ ITEMs 3.1 AL 3.10, 3.11
cp -p /etc/sysctl.conf /etc/sysctl.conf.bck27Nov2018
touch /root/valoresNet.txt

echo "net.ipv4.ip_forward = 0" >> /root/valoresNet.txt
echo "net.ipv4.conf.all.send_redirects = 0" >> /root/valoresNet.txt
echo "net.ipv4.conf.default.send_redirects = 0" >> /root/valoresNet.txt
echo "net.ipv4.conf.all.accept_source_route = 0" >> /root/valoresNet.txt
echo "net.ipv4.conf.default.accept_source_route = 0" >> /root/valoresNet.txt
echo "net.ipv4.conf.all.accept_redirects = 0" >> /root/valoresNet.txt
echo "net.ipv4.conf.default.accept_redirects = 0" >> /root/valoresNet.txt
echo "net.ipv4.conf.all.secure_redirects = 0" >> /root/valoresNet.txt
echo "net.ipv4.conf.default.secure_redirects = 0" >> /root/valoresNet.txt
echo "net.ipv4.conf.all.log_martians = 1" >> /root/valoresNet.txt
echo "net.ipv4.conf.default.log_martians = 1" >> /root/valoresNet.txt
echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >> /root/valoresNet.txt
echo "net.ipv4.icmp_ignore_bogus_error_responses = 1" >> /root/valoresNet.txt
echo "net.ipv4.conf.all.rp_filter = 1" >> /root/valoresNet.txt
echo "net.ipv4.conf.default.rp_filter = 1" >> /root/valoresNet.txt
echo "net.ipv4.tcp_syncookies = 1" >> /root/valoresNet.txt
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /root/valoresNet.txt
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /root/valoresNet.txt

while read net

do

        parametro=`echo $net|cut -f1 -d" "`;

        if grep -q "$parametro" /etc/sysctl.conf;
        then
                echo "$parametro --> Texto hallado";
                parm2=$(cat /etc/sysctl.conf |grep "$parametro" );
                echo "$parm2";
                sed -i "s/$parm2/$net/g" /etc/sysctl.conf;
        else
                echo "$parametro --> Texto no hallado";
                echo "$net" >> /etc/sysctl.conf;
        fi
done < /root/valoresNet.txt

/sbin/sysctl -p

