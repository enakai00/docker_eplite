FROM centos:6.7
MAINTAINER Etsuji Nakai

RUN yum -y install mysql-server
ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh

EXPOSE 3306
CMD ["/usr/local/bin/init.sh"]

