#!/bin/bash

folders=( "mods" "config" )
modpacks=( "server" "client" )

for folder in ${folders[@]}; do
    mkdir -p "common/$folder"
    for modpack in ${modpacks[@]}; do
        mkdir -p "$modpack/$folder"
    done
done

mkdir repos

cd repos

echo "Cloning repos"

for modpack in $modpacks; do
    git clone -b "$modpack" git@github.com:reza0310/modpack.git "$modpack"
done

cd -
