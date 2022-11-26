# **Valgrind**

Valgrind is powerful to check memory leaks and other security issues. Using docker to run Valgrind resolves allows a clean environment to run valgrind in.

## Installation

```bash
chmod 755 ./init
echo "source $(pwd)/init" >> ~/.zshrc
```

## Configure

Docker needs to mount be mount to a folder so that he can valgrind access your code. I recommand to mount it to a folder where most your 42 projects are located. Simply go to toolbox/utils/global.sh and type in the absolute path of the folder you want valgrind to have access to.

## Usage

To start up valgrind in a docker container, run:

```bash
init-valgrind
```

To compile your code inside the valgrind docker container, type:

```bash
# syntax
valgrind-cli <commands that are avaliable in the docker container>
# examples
valgrind-cli make re
valgrind-cli gcc main.c hi.c
valgrind-cli ls
```

Docker container has all the normal bash commands, ls, cd ...etc. also with Make and gcc.

To run valgrind, simply run how you would normally use valgrind:

```bash
valgrind --leak-check=full ./a.out
```
