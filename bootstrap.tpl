#!/bin/bash -xe
whoami
apt-get -y update
apt-get -y install unattended-upgrades
apt-get -y install nfs-common 
mkdir /efs
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${efsid}.efs.eu-central-1.amazonaws.com:/ /efs
curl 'https://bootstrap.pypa.io/get-pip.py' -o 'get-pip.py'
python get-pip.py
apt-get -y remove python-urllib3
apt-get -y purge python-urllib3 
pip install awscli
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list
apt-get -y update
apt-get -y install docker-engine
apt-get -y install fail2ban
apt-get -y remove python-chardet
apt-get -y purge python-chardet
pip install docker-compose
docker run -d -e WORDPRESS_DB_HOST=${dbhost}:3306 -e WORDPRESS_DB_PASSWORD=wpdbwpdb -e WORDPRESS_DB_USER=wpdb -e WORDPRESS_DB_NAME=wpdb  -v /efs/wordpress:/var/www/html -p 80:80 wordpress:latest