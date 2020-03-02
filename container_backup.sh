#!/bin/bash
log() {
    echo -e `/bin/date`'\t'${1}
}

log "Removing all unused images"
docker image prune -a -f
log "Removed all unused images"

log "Initialising the image backup"
set -e
time=`date +%Y%m%d_%H%M%S`
image_name1="newgrafana"
image_name2="newprometheus"
image_name3="grafanaqlikteam"
image_name4="prometheusqlikteam"
image_name5="grafanaoracleteam"
image_name6="prometheusoracleteam"
image_name7="prom/node-exporter"

container_id1=`docker ps -a |grep $image_name1 |awk {'print $1'}`
container_id2=`docker ps -a |grep $image_name2 |awk {'print $1'}`
container_id3=`docker ps -a |grep $image_name3 |awk {'print $1'}`
container_id4=`docker ps -a |grep $image_name4 |awk {'print $1'}`
container_id5=`docker ps -a |grep $image_name5 |awk {'print $1'}`
container_id6=`docker ps -a |grep $image_name6 |awk {'print $1'}`
container_id7=`docker ps -a |grep $image_name7 |awk {'print $1'}`

docker commit $container_id1 $image_name1$time
docker commit $container_id2 $image_name2$time
docker commit $container_id3 $image_name3$time
docker commit $container_id4 $image_name4$time
docker commit $container_id5 $image_name5$time
docker commit $container_id6 $image_name6$time
docker commit $container_id7 $image_name7$time

log "docker image backup is completed"

