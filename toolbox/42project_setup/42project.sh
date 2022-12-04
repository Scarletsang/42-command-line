#!/bin/bash

# Creates a new project folder structure
42project() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]
  then
    echo -e $BLUE"
Usage:

42project <dirname>     Creates a new project directory with all corresponding testing tools and development tools.
"$WHITE
    return
  fi
  if [[ ! -f $1 ]]
  then
    echo $GREEN"Creating folder $1..."$BLUE
    # Copy the template to the current directory
    cp -R $(dirname "$(type $0 | awk '{ print $7 }')")/setup $1 &&
    git init $1

    # TODO: Add cbmc bound model checker tests to the spec directory

    echo $GREEN"Finished initiating a project folder."$WHITE
    echo $BLUE"Entering project folder..."$WHITE
  else
    echo $GREEN"Folder $1 exist. Opening into folder $1."$WHITE
  fi
  code $1
}

work() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]
  then
    echo -e $BLUE"
Usage:

work <project_name>     Change directory to the project's src folder
"$WHITE
    return
  fi
  cd $WORKSPACE42/$1/src
}

spec() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]
  then
    echo -e $BLUE"
Usage:

spec <project_name>     Change directory to the project's spec folder
"$WHITE
    return
  fi
  cd $WORKSPACE42/$1/spec
}