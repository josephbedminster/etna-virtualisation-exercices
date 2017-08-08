#!/usr/bin/env bash
# ARG 1 = login de l'etudiant
# ARG 2 = container a run

# psaq=`docker ps -aq`
# $psaq
# rmall=`docker rm -fv $psaq`
# $rmall

docker stop $(docker ps -qa)
docker rm $(docker ps -qa)