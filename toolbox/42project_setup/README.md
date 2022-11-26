# **42 Project directory**

Have you ever felt that your development environment is clunky? Even a simple task as write tests for your own code requires a main.c, or even a seperate Makefile just for testing if you are lazy. So in the end you rely on pre-programmed testers that other students have written. Want to write a little bit more documentation of your code outside of the code, so that you can give your collaborators and your evaluator better understanding of your code? You can't because your project directory is your directory to submit.

This is a template that allows you to put different things in different folder. It's not magic trick, its simply called "planning".

## Installation

```bash
chmod 755 ./init
echo "source $(pwd)/init" >> ~/.zshrc
echo "export PATH=$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" >> ~/.zshrc
```

## Configure

The work and spec command allow fast access to your source files or test files in different projects. Please specify where your 42 projects are located in toolbox/utils/global.sh

## Usage

```bash
42project <dirname>     Creates a new project directory with all corresponding testing tools and development tools.
work <project_name>     Change directory to the project's src folder
spec <project_name>     Change directory to the project's spec folder
```

## The folder structure

.
├── src/                     # Where your source files are
├── spec/                    # Where you stores your tests
├── docs/                    # Where you store external documentation, e.g. an image of the architecture of your system, or some thoughts you have during development
├── .vscode                  # Where your vscode debugger is located.
└── README.md                # Some words to put here so other people can read when they access your github page.

## How do you submit then?

To submit your project, simply make a new branch, e.g. named submit.

```bash
# Creates a branch named "submit"
git branch submit
# Go to the submit branch"
git checkout submit
# Add submission repository address, called the repository "submit"
git remote add <submission-address> submit
# Check if you have missing or extra files in this branch
git ls-files
# After you have git add, git commit (you should still be 
# in the submit branch now) push the submit branch of the
# local repository to the submit branch of the submission 
# repository.
git push submit submit
```

Notes that the first branch created on the 42 submission repository will be the HEAD branch of that repository, and you can call it anything. But it is always better to name your remote repository branch to be the same as your local one.

## How to move files between branches?

In the last phrase of development before submission. Maybe you would like to go back and forth between the main (for development) and the submit (for production) branch.

This is how you switch between branches:

```bash
git checkout main
git checkout submit
```

Now, I want to get all the src files from my main branch in my submit branch, 

```bash
# Go to the branch that you want to have the files in
git checkout submit
# Moves all the files inside src/ directory of the main branch to the submit branch
git checkout main -- src
```

## Resources

[vscode debugger](https://haglobah.github.io/Mastering-42/core/vscode_debugger.html#Running%20the%20Debugger)