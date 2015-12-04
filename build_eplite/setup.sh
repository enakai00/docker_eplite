#!/bin/bash -x

yum -y install epel-release
yum -y install wget git crudini nodejs npm nginx

mkdir -p /opt
useradd -d /opt/etherpad etherpad

su - etherpad -c 'git clone https://github.com/ether/etherpad-lite.git; cd etherpad-lite; git checkout -b 1.5.7 remotes/origin/release/1.5.7'
su - etherpad -c 'cd /opt/etherpad/etherpad-lite; sh bin/installDeps.sh'

