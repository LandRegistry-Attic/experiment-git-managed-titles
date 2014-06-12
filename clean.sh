#!/bin/bash
for f in $(cat .gitignore ) ; do
  if [ $f == ".vagrant/" ] ; then
    echo "skipping .vagrant"
  else
    rm -rf $f
  fi
done
