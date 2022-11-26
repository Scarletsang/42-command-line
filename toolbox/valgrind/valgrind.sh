#!/bin/bash

valgrind() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]
  then
    echo -e $BLUE"
Usage:

valgrind <valgrind_arguments>  Run valgrind directly
"$WHITE
    return
  fi
  local current_path=$(pwd | sed "s,$WORKSPACE42,,g")
  local cmd=$(echo "${@:0}" | sed "s,\./,/data$current_path/,g")
  echo $GREEN"Running valgrind $cmd..."$WHITE
  /usr/local/bin/docker exec -it valgrind bash -c "$cmd"
}

valgrind-cli() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]
  then
    echo -e $BLUE"
Usage:

valgrind-cli <comannds>        Execute any command inside docker container without entering it
"$WHITE
    return
  fi
  local current_path=$(pwd | sed "s,$WORKSPACE42,,g")
  /usr/local/bin/docker exec -it valgrind bash -c "cd /data$current_path && ${@:1}"
}

init-valgrind() {
  goinfre-docker && open-docker
  if [ ! "$(docker ps -q -f name=valgrind)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=valgrind)" ]; then
      /usr/local/bin/docker start valgrind
    else
      local dockerfile=$(dirname "$(type $0 | awk '{ print $7 }')")/valgrindDockerfile
      chmod 755 $dockerfile
      /usr/local/bin/docker build . -t valgrind -f $dockerfile &&
      /usr/local/bin/docker run -itd -v $WORKSPACE42:/data --name=valgrind valgrind
    fi
    echo $GREEN"Valgrind is starting up..."$WHITE
  fi
  echo $GREEN"Valgrind is running in $WORKSPACE42"$WHITE
}
