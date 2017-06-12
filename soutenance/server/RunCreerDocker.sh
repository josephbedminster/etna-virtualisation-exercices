#!/usr/bin/env bash
# ARG 1 = contenu du dockerfile
# ARG 2 = nom du container

container=$1
name=$2
echo -e $container > a.txt
mkdir /var/images/${name}
touch /var/images/${name}/Dockerfile
echo -e $container > /var/images/${name}/Dockerfile
docker build -t $name /var/images/${name}/.