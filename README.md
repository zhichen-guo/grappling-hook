# Grappling Hook

This script will `cd` from the working directory to the closest parent directory containing a `.git`, or any intermediate directory between the working directory and the parent directory containing a `.git`.

## Installation

In reality, the script simply `echo` the directory to `cd` to. You have to add a function in your bash file which performs the actual `cd`.

1. Copy the `grappling-hook.sh` script into a directory in your `$PATH`.
2. Add this to your bash file:
```shell
function hook() {
    cd $(grappling-hook.sh "$1")
}
```
3. Don't forget to `source` your bash file so you can use the `hook` function!

## Usage

For the following example file tree:
```
root
|- .git
|- blah
+- dir1
    |- blah
    |- dir2
    |   +- blah
    +- dir3
        +- *YOU'RE HERE* (root/dir1/dir3)
```

1. Use the function without any variables to `cd` from the working directory to the nearest parent directory with a `.git`.
```shellscript
dir3~$ hook
root~$
```
2. To `cd` to an intermediate directory on the path from the working directory to the nearest parent directory with a `.git`, pass the name as a variable
```shellscript
dir3~$ hook dir1
dir1~$
```
&nbsp;&nbsp;&nbsp;&nbsp; The variable must match the name of an intermediate directory.
```shellscript
dir3~$ hook banana
dir3~$
```

