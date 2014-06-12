#!/bin/bash

# deps
install() {
  DEBIAN_FRONTEND=noninteractive sudo apt-get -y --force-yes install $@
}
install rng-tools git 

# set up GPG

[ -e /var/run/rngd.pid ] || sudo rngd -r /dev/urandom
gpg --batch --gen-key <<EOF
    %echo Generating a basic OpenPGP key
    Key-Type: DSA
    Key-Length: 1024
    Subkey-Type: ELG-E
    Subkey-Length: 1024
    Name-Real: Juan Uys
    Name-Comment: with a classic passphrase
    Name-Email: juan@uys.io
    Expire-Date: 0
    Passphrase: hunter2
    %pubring foo.pub
    %secring foo.sec
    # Do a commit here, so that we can later print "done" :-)
    %commit
    %echo done
EOF

# GPG Agent
KEY=$(gpg --no-default-keyring --secret-keyring ./foo.sec \
  --keyring ./foo.pub --list-secret-keys | grep "^sec"|cut -d'/' -f2|cut -d' ' -f1)
echo the key is $KEY

# create loads of titles (flat JSON files in our case)

# modify/commit/sign every title a few times

# check the Git footprint (large?)

# auditing (log per title), performance of auditing

# retrieve a specific version of a title; walk back in time. Performance of this.
