#!/bin/bash

service mysqld start

if [[ ! -f ~/.trap_in_bashrc ]]; then
    cat <<EOF >>~/.bashrc
trap 'service mysqld stop; exit 0' TERM
EOF
    touch ~/.trap_in_bashrc
fi

if [[ ! -d /var/lib/mysql/epdb ]]; then
    mysqladmin -u root password 'password'
    cat << EOF > /tmp/sql.txt
DELETE FROM mysql.user WHERE user = '' OR ( user = 'root' AND host != 'localhost' );
FLUSH PRIVILEGES;
CREATE DATABASE epdb CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON epdb.* TO 'epuser'@'%' IDENTIFIED BY 'eppasswd';
FLUSH PRIVILEGES;
SELECT user, password, host FROM mysql.user;
EOF
    mysql -uroot -ppassword < /tmp/sql.txt
fi

exec /bin/bash

