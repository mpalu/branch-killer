#!/bin/bash

PROJECTS_FOLDER="$1"

cd "$PROJECTS_FOLDER" || exit

for project in */ ; do
  cd "$project" || exit

  DELETE_MESSAGE="- Deleting local branches from $project"
  echo "${DELETE_MESSAGE%?}"
  git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D > /dev/null 2>&1
  git fetch > /dev/null 2>&1
  git branch --prune > /dev/null 2>&1
  
  cd ..
done
  
