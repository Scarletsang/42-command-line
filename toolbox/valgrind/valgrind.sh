#!/bin/bash

valgrind() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]
  then
    echo -e $BLUE"
Usage:

valgrind <valgrind_arguments>  Run valgrind directly
"$WHITE
  local path=$(pwd | sed "s,$WORKSPACE42,,g")
  local cmd=$(echo "${@:1}" | /usr/bin/perl -0777 -pe "s,((?:-(?:\w|=)+\s)*\s)./(\w+),\1/data$path/\2,s")
  echo $GREEN"Running $cmd..."$WHITE
  /usr/local/bin/docker exec -it valgrind /usr/bin/valgrind $cmd
}

valgrind-cli() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]
  then
    echo -e $BLUE"
Usage:

valgrind-cli <comannds>        Execute any command inside docker container without entering it
"$WHITE
  local path=$(pwd | sed "s,$WORKSPACE42,,g")
  /usr/local/bin/docker exec -it valgrind bash -c "cd /data$path && ${@:1}"
}

init-valgrind() {
  goinfre-docker && open-docker
  if [ ! "$(docker ps -q -f name=valgrind)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=valgrind)" ]; then
      /usr/local/bin/docker start valgrind
    else
      DOCKER_BUILDKIT=0 /usr/local/bin/docker build . -t valgrind -f $(dirname ${BASH_SOURCE:-$0})/valgrindDockerfile &&
      /usr/local/bin/docker run -itd -v $WORKSPACE42:/data --name=valgrind valgrind
    fi
    echo $GREEN"Valgrind is starting up..."$WHITE
  fi
  echo $GREEN"Valgrind is running in $WORKSPACE42"$WHITE
}
