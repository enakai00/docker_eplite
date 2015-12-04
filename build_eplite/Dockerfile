FROM centos:6.7
MAINTAINER Etsuji Nakai

ADD setup.sh /usr/local/bin/setup.sh
RUN chmod u+x /usr/local/bin/setup.sh
RUN /usr/local/bin/setup.sh

ADD settings.json /opt/etherpad/etherpad-lite/settings.json
ADD eplite.conf /etc/nginx/conf.d/eplite.conf
ADD etherpad-lite /etc/init.d/etherpad-lite
RUN chmod 755 /etc/init.d/etherpad-lite

ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh
CMD ["/usr/local/bin/init.sh"]

