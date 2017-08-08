#!/usr/bin/env bash
# ARG 1 = Conf du proxy
# ARG 2 = Liste des links students

conf=$1
links=$2

test=`docker ps | grep -c proxy`
if [ $test = 1 ]
then 
	docker stop proxy | docker rm -f proxy
fi


rmconf=`rm /var/images/proxy/src/default.conf`
$rmconf
touchconf=`touch /var/images/proxy/src/default.conf`
$touchconf
addconf=`echo $conf >> /var/images/proxy/src/default.conf`
$addconf
build=`docker build -t proxy:latest /var/images/proxy`
$build
rundocker=`docker run -p 443:80 -td --name proxy $links proxy`
$rundocker