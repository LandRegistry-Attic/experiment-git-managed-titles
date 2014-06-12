#!/bin/bash

export GNUPGHOME="$(pwd)"
for TITLE in $(find titles/ -name 'title*' -type f) ; do
	./scripts/3_modify.expect $TITLE
done
