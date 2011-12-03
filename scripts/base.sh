#!/bin/sh

SSHCONFIG=".sshconfig"

function fail_unless_on() {
    vagrant status | grep -E "default\ +running" 2>&1 > /dev/null

    if [ $? -ne 0 ]; then
        echo "Vagrant VM doesn't appear to be running"
        exit 1
    fi
}

function ensure_ssh_config() {
    if [ ! -f "${SSHCONFIG}" ]; then
        vagrant ssh_config > .sshconfig
    fi
}
