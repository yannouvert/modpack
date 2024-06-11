#!/bin/bash

modpacks=( "server" "client" )

echo "Pushing repos"

for modpack in ${modpacks[@]}; do
    cd "repos/$modpack"
#    git rm --cached -r .
    git add .
    git status
    read -p "Validate (y/n) ? " answer
    if [[ $answer =~ ^[Yy]$ ]]; then
        git commit -m "Update $modpack mods and config"
        git push
    fi
    cd -
done
