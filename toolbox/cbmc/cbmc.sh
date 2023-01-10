#!/bin/bash

goto-cc() {
  local current_path=$(pwd | sed "s,$WORKSPACE42,,g")
  echo $GREEN"CBMC is compiling your code to into GOTO-binaries to verify your code."$WHITE
  /usr/local/bin/docker exec -it cbmc $0 "/data$current_path/$1" ${@:2}
}

goto-instrument() {
  local current_path=$(pwd | sed "s,$WORKSPACE42,,g")
  echo $GREEN"CBMC is transforming any found bugs into corresponding assertions, and are adding into the GOTO-binary."$WHITE
  /usr/local/bin/docker exec -it cbmc $0 "/data$current_path/$1" ${@:2}
}

cbmc() {
  local current_path=$(pwd | sed "s,$WORKSPACE42,,g")
  echo $GREEN"Running CBMC static analyser..."$WHITE
  /usr/local/bin/docker exec -it cbmc $0 "/data$current_path/$1" ${@:2}
}

cbmc-cli() {
  local current_path=$(pwd | sed "s,$WORKSPACE42,,g")
  echo $GREEN"CBMC is compiling your code to into GOTO-binaries to verify your code."$WHITE
  /usr/local/bin/docker exec -it cbmc bash -c "cd /data$current_path && ${@:1}"
}

init-cbmc() {
  goinfre-docker && open-docker
  if [ ! "$(docker ps -q -f name=cbmc)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=cbmc)" ]; then
      /usr/local/bin/docker start cbmc
    else
      local dockerfile=$(dirname "$(type $0 | awk '{ print $7 }')")/Dockerfile
      chmod 755 $dockerfile
      /usr/local/bin/docker build . -t cbmc -f $dockerfile &&
      /usr/local/bin/docker run -itd -v $WORKSPACE42:/data --name=cbmc cbmc
    fi
    echo $GREEN"CBMC is starting up..."$WHITE
  fi
  echo $GREEN"CBMC is running in $WORKSPACE42"$WHITE
}
