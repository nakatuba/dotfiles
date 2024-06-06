#!/bin/bash

set -eu

(
  cd ~/Dropbox/Apps/remotely-save/notes

  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    git init

    if [ "$(uname)" = "Darwin" ]; then
      xattr -w com.dropbox.ignored 1 .git
      xattr -w 'com.apple.fileprovider.ignore#P' 1 .git
    elif [ "$(uname)" = "Linux" ]; then
      attr -s com.dropbox.ignored -V 1 .git
    fi

    git remote add origin https://github.com/nakatuba/notes.git
  fi

  git fetch
  git reset origin/main

  git add --all
  git diff --staged --quiet || git commit -m "$(date +"%Y-%m-%d %H:%M:%S")"
  git push
)
