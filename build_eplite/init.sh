#!/bin/bash -x

sed -i "s/__FIP__/${FIP}/" /etc/nginx/conf.d/eplite.conf
sed -i "s/__DBIP__/${DB_PORT_3306_TCP_ADDR}/" /opt/etherpad/etherpad-lite/settings.json

service etherpad-lite start
service nginx start

if [[ ! -f ~/.trap_in_bashrc ]]; then
    cat <<EOF >>~/.bashrc
trap 'service nginx stop; service etherpad-lite stop; exit 0' TERM
EOF
    touch ~/.trap_in_bashrc
fi

exec /bin/bash
