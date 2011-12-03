#!/bin/sh -x

NAME="openbsd-5.0-base"

rm -f package.box
vagrant box list | grep ${NAME} 2>&1 > /dev/null

if [ $? -eq 0 ]; then
    vagrant box remove ${NAME} 2>&1 > /dev/null
fi

echo ">> Exporting image"
vagrant package --base openbsd-vagrant-base

echo ">> Importing base box"
vagrant box add ${NAME} package.box
