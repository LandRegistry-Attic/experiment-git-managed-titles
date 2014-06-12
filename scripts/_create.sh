#!/bin/bash

export GNUPGHOME="$(pwd)/../.."
NEW="title_$(uuidgen)"
# TODO make this 45kB in size...
touch $NEW
git add $NEW
git commit -S -m "adding title $NEW in $(pwd)"


