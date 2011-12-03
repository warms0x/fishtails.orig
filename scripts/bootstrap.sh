#!/bin/sh

vagrant status | grep -E "default\ +running" 2>&1 > /dev/null

if [ $? -ne 0 ]; then
    echo "Vagrant VM doesn't appear to be running"
    exit 1
fi


for pkg in git ruby-puppet; do
    echo ">> installing ${pkg}"
    vagrant ssh -c "sudo pkg_add -m -U ${pkg}"
done
