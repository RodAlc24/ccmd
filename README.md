# Create compile_commands (ccmd)

Creates the `compile_commands.json` file for `clangd`.

## Installation

- Clone this repo or download the `ccmd` file. 
- Make sure that it is executable by doing `chmod +x ccmd`.
- Make it is executable from anywhere by doing one of the options below:
  - Move it to a directory that is in your `PATH`.
  - Move it to a new directory (e.g. `/home/mybin/`) and add it to your `PATH` by writing this in your `.bashrc` or `.zshrc`: 
    - `export PATH="${PATH}:/home/mybin"`.

## Usage
In your project root directory just run `ccmd <source_dir> <include_dir> [<flag1> <flag2> ...]` where `<source_dir>` and `<include_dir>` are the directories of the source code and the headers respectively. You can also specify another flags, like `-Wall -g`.

## Recomendation
In order to make it easier to rerun the tool after adding new files to your project, you can add this rule to your `makefile`:

```
ccmd:
    ccmd $(SRC_DIR) $(INC_DIR) $(CFLAGS)
```
Where the variables are properly assigned. 
