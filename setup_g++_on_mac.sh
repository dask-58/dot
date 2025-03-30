#!/bin/bash

brew install gcc

GCC_VERSION=$(gcc --version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)

if [[ -z "$GCC_VERSION" ]]; then
  echo "Error: Failed to determine GCC version"
  exit 1
fi

MAJOR_VERSION=$(echo $GCC_VERSION | cut -d. -f1)

echo "Installed GCC version: $GCC_VERSION (major version: $MAJOR_VERSION)"

if [[ -d "/opt/homebrew/bin" ]]; then
  ln -sf "/opt/homebrew/bin/g++-$MAJOR_VERSION" "/opt/homebrew/bin/g++"
  echo "Created symbolic link: g++-$MAJOR_VERSION -> g++"
else
  echo "Error: Directory /opt/homebrew/bin does not exist"
  exit 1
fi

if [[ -L "/opt/homebrew/bin/g++" ]]; then
  echo "Successfully created g++ symbolic link"
  ls -la /opt/homebrew/bin/g++
else
  echo "Failed to create symbolic link"
  exit 1
fi
