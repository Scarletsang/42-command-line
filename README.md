# Dockerized 42 Toolbox!

You need valgrind? You need some obscure static code analysier? A tester need cMake, a tools needs a packages that are too hectic to install on your 42 computer? Simply use docker and run the VM in the goinfre file!

This is a collection of bash scripts that initialize different tools in Docker, and it also comes with some utilies scripts that you can install if you like.

**This repository is designed to be modular, click inside the toolbox directory, and choose a tool you are interested and just use it. Remember the folder utils inside the toolbox is the only dependencies for every tool that sparks your interest. Each tool has its own README to guide you through any installations.**

## You want to install all the tools?

Run the following command:

```bash
chmod 755 ./init
echo "source $(pwd)/init" >> ~/.zshrc
echo "export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin" >> ~/.zshrc
```

## Configure

Docker needs to mount be mount to a folder so that the tools can access your code. I recommand to mount it to a folder where most your 42 projects are located. Simply go to toolbox/utils/global.sh and type in the absolute path of the folder you want the tools to have access to.

## Usage

Avaliable commands:

42project <dirname>     Creates a new project directory with all corresponding testing tools and development tools.
work <project_name>     Change directory to the project's src folder
spec <project_name>     Change directory to the project's spec folder

goinfre-docker          Delete the original docker location and move it to goinfre
open-docker             Start up docker

init-cbmc               Initiates a docker container to run CBMC bounded model checker
cbmc <cbmc_arguments>   Static analyzer for .c or GOTO-binary file
goto-cc                 Compile project into GOTO-binaries
goto-instrument         Write assertions for found bugs to GOTO-binaries (for testsuit generation)

init-valgrind                  Initiates a docker container to run valgrind
valgrind <valgrind_arguments>  Run valgrind directly
valgrind-cli <comannds>        Execute any command inside docker container without entering it