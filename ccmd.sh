#!/bin/bash

# Check arguments
if [ $# -lt 2 ]; then 
  echo "Usage: ccmd <source_dir> <include_dir> [<flag1> <flag2> ...]"
  exit 1
fi

# Name variables
src_dir=$1
include_dir=$2
dir=$(pwd)

# Set flags
flags=""
for arg in "${@:3}"; do
    flags="$flags $arg"
done

# Creates the file
echo "[" > compile_commands.json

for file in "$src_dir"/*.c; do

    # write the JSON object to the file
    echo "  {" >> compile_commands.json
    echo "    \"directory\": \"$dir\"," >> compile_commands.json
    echo "    \"file\": \"$file\"," >> compile_commands.json
    echo "    \"command\": \"gcc $flags -I$include_dir -c $file\"" >> compile_commands.json
    echo "  }," >> compile_commands.json
done

# Removes the last character (,)
sed -i '$ s/.$//' compile_commands.json

echo "]" >> compile_commands.json

echo "Succesfully created compile_commands.json"

