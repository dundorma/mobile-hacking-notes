#!/usr/bin/env bash

# Check if a filename is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <package name>"
  exit 1
fi

mkdir $1

# Use the provided file as input
adb shell pm path $1 | awk -F':' '{print $2}' | while IFS= read -r line; do
  adb pull $line $1/
done

