#!/bin/bash
#ghook.sh (grappling hook)

find_directory() {
  local path="$1"
  while [ "$path" != "/" ]; do
    if [ -d "$path/.git" ]; then
      echo "$path"
      return
    fi

    path=$(dirname "$path")
  done
}

find_directory_with_stop() {
  local target_dir="$1"
  local path="$2"
  while [ "$path" != "/" ]; do
    if [ -d "$path/.git" ]; then
      echo "$path"
      return
    elif [ "$target_dir" == $(basename "$path") ]; then
      echo "$path"
      return
    fi

    path=$(dirname "$path")
  done
}

current_path=$(pwd)

if [ -z "$1" ]; then
  target_directory=$(find_directory "$current_path")
else
  target_directory=$(find_directory_with_stop "$1" "$current_path")
fi

if [ -n "$target_directory" ]; then
  echo "$target_directory"
else
  echo "."
fi