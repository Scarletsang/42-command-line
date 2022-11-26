# **CBMC Static model checker**

If you knows where the bug is, then you would have already know how to fix it, then how can you make tests to locate your bug in a logical way? You can't. I always think that unit test is necessary but also arbitary. I could not make a good test if I don't know where the bug is, but if I know where the bug is, why do I need to write tests?

A static checker does not run your code, but transform your code into some kind of mathematical model, and analysis it.

## Installation

To initialize docker and run cbmc in it, run:

```bash
chmod 755 ./init
echo "source $(pwd)/init" >> ~/.zshrc
```

It will be running in the background now.

## Configure

Docker needs to mount be mount to a folder so that he can cbmc access your code. I recommand to mount it to a folder where most your 42 projects are located. Simply go to toolbox/utils/global.sh and type in the absolute path of the folder you want cbmc to have access to.

## Usage

First time you use cbmc, it will run cbmc in the docker:

```bash
init-cbmc
```

cbmc, goto-cc and goto-instrument is now avaliable as command to be used.

For example to evaluate a function in a file named test.c:

```bash
cbmc test.c --function get_next_line --show-properties --bounds-check --pointer-check --unwind 6 --bounds-check --unwinding-assertions
```

## Resources

[CBMC offical reference](http://www.cprover.org/cprover-manual/)