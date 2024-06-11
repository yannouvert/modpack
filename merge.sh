#!/bin/bash

folders=( "mods" "config" )
modpacks=( "server" "client" )

echo "Clean client and server folders"

for folder in ${folders[@]}; do
    rm -r "repos/client/$folder/"*
    rm -r "repos/server/$folder/"*
done

echo "Copying files"

for folder in ${folders[@]}; do
    cp -r "client/$folder/"* "repos/client/$folder/"
    cp -r "server/$folder/"* "repos/server/$folder/"
    for modpack in ${modpacks[@]}; do
        cp -r "common/$folder/"* "repos/$modpack/$folder/"
    done
done
