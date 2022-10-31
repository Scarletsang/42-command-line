# A command line setup for my own 42 project setup

## Install

```sh
git clone https://github.com/Scarletsang/42-command-line.git 42cli
echo "source $(pwd)/42cli/init" >> ~/.zshrc
echo "source $(pwd)/42cli/init" >> ~/.bash_profile
```

Then restart your terminal, you will see some bash script sourced to your current session.

## Configure

Change the variables in the bash script called global.

## Usage

Avaliable commands:

42project <dirname>     Creates a new project directory with all corresponding testing tools and development tools.
42spec <filename>       Tests a target file against tests, run inside the spec directory created by 42project.
42testers               See all the avaliable testers
goto-cc                 Compile project into GOTO-binaries
goto-instrument         Write assertions for found bugs to GOTO-binaries (for testsuit generation)
cbmc                    Static analyzer for .c or GOTO-binary file
init-cbmc               Initiates a docker container to run CBMC bounded model checker