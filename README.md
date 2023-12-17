# Create compile_commands (ccmd).

Creates the `compile_commands.json` file for `clangd`.

## Installation.

1. Clone this repo or download the `ccmd.sh` file. 
2. Make sure that it is executable by doing `chmod +x ccmd.sh`
3. Make it executable from anywhere by creating a symbolic link in your `PATH`:

`ln -s /path/to/ccmd.sh /path/to/PATH`
  
##### In case you don't have a `PATH` directory do this between step 2 and 3:

- Create a new directory (e.g. `/home/user/mybin`) and add this to your `.bashrc` or `.zshrc`: 

`export PATH="${PATH}:/home/user/mybin"`

Now `mybin` is in your `PATH`. 

## Usage.
In your project root directory just run `ccmd <source_dir> <include_dir> [<flag1> <flag2> ...]` where `<source_dir>` and `<include_dir>` are the directories of the source code and the headers respectively. You can also specify another flags, like `-Wall -g`.

## Recomendation.
In order to make it easier to rerun the tool after adding new files to your project, you can add this rule to your `makefile`:

```
ccmd:
    ccmd $(SRC_DIR) $(INC_DIR) $(CFLAGS)
```
Where the variables are properly assigned. 
