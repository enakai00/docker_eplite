# docker_eplite
Dockerfile for Etherpad-Lite

## Build images
```
# cd docker_epmysql
# docker build -t epmysql:ver1.0 ./
```
```
# cd docker_eplite
# docker build -t eplite:ver1.0 ./
```

## Run on a sigle node

```
# docker run -itd --name epmysql --expose 3306 epmysql:ver1.0
# docker run -itd --name eplite -p 80:80 -e FIP=192.168.253.17 --link epmysql:db eplite:ver1.0
```

FIP is an IP address (or hostname) of the host which clients access to.

## Run on separate nodes

On MySQL node.
```
# docker run -itd --name epmysql -p 3306:3306 epmysql:ver1.0
```

On Etherpad-Lite node.
```
# docker run -itd --name eplite -p 80:80 \
  -e FIP=192.168.253.19 \
  -e DB_PORT_3306_TCP_ADDR=192.168.253.18 \
  eplite:ver1.0
```

FIP is an IP address (or hostname) of the host which clients access to.

DB_PORT_3306_TCP_ADDR is an IP address (or hostname) of the MySQL host which Etherpad-Lite access to.
