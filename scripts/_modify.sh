#!/bin/bash
TITLE=$1
export GNUPGHOME="$(pwd)"
echo "change to title, random string: $(uuidgen)" >> $TITLE
git add $TITLE
git commit -S -m "changing title $TITLE"
