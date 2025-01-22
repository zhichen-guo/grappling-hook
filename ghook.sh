#!/bin/bash
#ghook.sh (grappling hook)

moving_path=$(pwd)

find_directory() {
  while [ "$moving_path" != "/" ]; do
    if [ -d "$moving_path/.git" ]; then
      echo "$moving_path"
      return
    fi

    moving_path=$(dirname "$moving_path")
  done
}


# If a directory name is passed, find the specified directory
target_directory=$(find_directory)

if [ -n "$target_directory" ]; then
  cd "$target_directory" && echo "$target_directory"
else
  echo "No root git repo found"
fi