#!/bin/bash

for FOLDER in ./*/; do
    # gio set "$FOLDER" -t unset metadata::custom-icon
    for img in ./"$FOLDER"/*; do
        if [[ ${img##*.} == "jpg" ]]; then
            IMAGENAME="$(basename "$img")"
            break
        fi
    done
    if [[ -n $IMAGENAME ]]; then
        gio set "$FOLDER" -t string metadata::custom-icon "$IMAGENAME"
        unset IMAGENAME
    fi
done
