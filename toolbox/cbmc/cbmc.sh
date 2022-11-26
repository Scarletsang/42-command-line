#!/bin/bash

goto-cc() {
  local current_path=$(pwd | sed "s,$WORKSPACE42,,g")
  echo $GREEN"CBMC is compiling your code to into GOTO-binaries to verify your code."$WHITE
  /usr/local/bin/docker exec -it cbmc $0 "/data/$current_path/$1" ${@:2}
}

goto-instrument() {
  local current_path=$(pwd | sed "s,$WORKSPACE42,,g")
  echo $GREEN"CBMC is transforming any found bugs into corresponding assertions, and are adding into the GOTO-binary."$WHITE
  /usr/local/bin/docker exec -it cbmc $0 "/data/$current_path/$1" ${@:2}
}

cbmc() {
  local current_path=$(pwd | sed "s,$WORKSPACE42,,g")
  echo $GREEN"Running CBMC static analyser..."$WHITE
  /usr/local/bin/docker exec -it cbmc $0 "/data/$current_path/$1" ${@:2}
}

init-cbmc() {
  goinfre-docker && open-docker
  if [ ! "$(docker ps -q -f name=cbmc)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=cbmc)" ]; then
      /usr/local/bin/docker start cbmc
    else
      /usr/local/bin/docker run -itd -v $WORKSPACE42:/data --name=cbmc diffblue/cbmc:5.69.1
    fi
    echo $GREEN"CBMC is starting up..."$WHITE
  fi
  echo $GREEN"CBMC is running in $WORKSPACE42"$WHITE
}
