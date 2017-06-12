#!/usr/bin/env bash
# ARG 1 = login de l'etudiant
# ARG 2 = container a run

login=$1
container=$2

test=`docker ps | grep -c $1`
if [ $test = 1 ]
then 
	docker stop $login
	docker rm $login
fi

docker run -td -h $login --name $login $container