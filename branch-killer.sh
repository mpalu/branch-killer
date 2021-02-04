#!/bin/bash

GIT_FOLDER=("$HOME/workspace/bitbucket" "$HOME/workspace/github")

for parent_directory in ${GIT_FOLDER[*]} ; do
  cd "$parent_directory" || exit

  for project in */ ; do
    cd "$project" || exit

    DELETE_MESSAGE="- Deleting local branches from $project"
    echo "${DELETE_MESSAGE%?}"
    git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D > /dev/null 2>&1
    
    cd ..
  done
  
  cd ..
done
