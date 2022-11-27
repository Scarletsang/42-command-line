#!/bin/bash

valgrind() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo -e $BLUE"
Usage:

valgrind <valgrind_arguments>  Run valgrind directly
"$WHITE
    return
  fi
  local current_path=$(pwd | sed "s,^$WORKSPACE42,,g")
  if [ "$current_path" = $(pwd) ]; then
    echo -e $RED"You are not inside the workspace specified."$WHITE
    echo -e $BLUE"Valgrind can only be ran inside the specified workspace, currently it is set to \"$WORKSPACE42\". To change it, please change it inside \"$(dirname "$(type open-docker | awk '{ print $7 }')")/global\"."$WHITE
    return
  fi
  if [[ -z "$(! docker stats --no-stream 2> /dev/null)" ]]; then
    echo -e $RED"Docker is not running"$WHITE
    echo -e $BLUE"Please run init-valgrind to initiate valgrind"$WHITE
    return
  fi
  local cmd=$(echo "${@:0}" | sed "s,\./,/data$current_path/,g")
  echo $GREEN"Running valgrind $cmd..."$WHITE
  /usr/local/bin/docker exec -it valgrind bash -c "$cmd"
}

valgrind-cli() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo -e $BLUE"
Usage:

valgrind-cli <comannds>        Execute any command inside docker container without entering it
"$WHITE
    return
  fi
  local current_path=$(pwd | sed "s,^$WORKSPACE42,,g")
  if [ "$current_path" = $(pwd) ]; then
    echo -e $RED"You are not inside the workspace specified."$WHITE
    echo -e $BLUE"Valgrind can only be ran inside the specified workspace, currently it is set to \"$WORKSPACE42\". To change it, please change it inside \"$(dirname "$(type open-docker | awk '{ print $7 }')")/global\"."$WHITE
    return
  fi
  if [[ -z "$(! docker stats --no-stream 2> /dev/null)" ]]; then
    echo -e $RED"Docker is not running"$WHITE
    echo -e $BLUE"Please run init-valgrind to initiate valgrind"$WHITE
    return
  fi
  /usr/local/bin/docker exec -it valgrind bash -c "cd /data$current_path && ${@:1}"
}

init-valgrind() {
  goinfre-docker && open-docker
  if [ ! "$(docker ps -q -f name=valgrind)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=valgrind)" ]; then
      /usr/local/bin/docker start valgrind
    else
      local dockerfile=$(dirname "$(type $0 | awk '{ print $7 }')")/Dockerfile
      chmod 755 $dockerfile
      /usr/local/bin/docker build . -t valgrind -f $dockerfile &&
      /usr/local/bin/docker run -itd -v $WORKSPACE42:/data --name=valgrind valgrind
    fi
    echo $GREEN"Valgrind is starting up..."$WHITE
  fi
  echo $GREEN"Valgrind is running in $WORKSPACE42"$WHITE
}
