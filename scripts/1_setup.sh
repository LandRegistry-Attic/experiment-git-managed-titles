#!/bin/bash
# This sets up the new machine for the git experiment:
#+ set up a Git user
#+ create a GPG key (with necessary randomisation)
#+ set the GPG home to be pwd

[ -e .setup ] && echo "setup completed... exiting." && exit 0

FULLNAME="Juan Matthys Uys"
EMAIL="opyate@gmail.com"
sudo apt-get update
# clean workspace and env
for f in $(cat .gitignore ) ; do rm -rf $f ; done

# deps
# See http://stackoverflow.com/a/18618204/51280
install() {
  DEBIAN_FRONTEND=noninteractive sudo apt-get -y --force-yes install $@
}
install rng-tools git expect

# set up GPG
# See https://www.gnupg.org/documentation/manuals/gnupg-devel/Unattended-GPG-key-generation.html
[ -e /var/run/rngd.pid ] || sudo rngd -r /dev/urandom

GITCONFFILE=~/.gitconfig
git config --global user.email "$FULLNAME"
git config --global user.name "$EMAIL"

export GNUPGHOME=$(pwd)
export PUBLIC_KEY=foo.pub
export PRIVATE_KEY=foo.sec
gpg --batch --gen-key <<EOF
    %echo Generating a basic OpenPGP key
    Key-Type: DSA
    Key-Length: 1024
    Subkey-Type: ELG-E
    Subkey-Length: 1024
    Name-Real:$FULLNAME
    Name-Email:$EMAIL
    Expire-Date: 0
    Passphrase: hunter2
    %pubring $PUBLIC_KEY
    %secring $PRIVATE_KEY
    # Do a commit here, so that we can later print "done" :-)
    %commit
    %echo done
EOF

# GPG + Git
# See https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
KEY=$(gpg --no-default-keyring --secret-keyring ./$PRIVATE_KEY \
  --keyring ./$PUBLIC_KEY --list-secret-keys | grep "^sec"|cut -d'/' -f2|cut -d' ' -f1)
echo the key is $KEY
git config --global user.signingkey $KEY


gpg --import $PUBLIC_KEY
gpg --allow-secret-key-import --import $PRIVATE_KEY

[ -e .git ] || git init
touch .setup
