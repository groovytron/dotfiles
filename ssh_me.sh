#! /bin/bash

function show_help {
    echo "Usage: ssh_me.sh [USERNAME] [HOSTNAME or IP ADDRESS] [PORT]"
}

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    show_help
    exit
fi

if [ -z "$1" ] || [ -z "$2" ]
  then
    echo "Missing argument"
    show_help
    exit
fi

SSH_PORT=22

if [ ! -z "$3" ]
  then
    SSH_PORT=$3
fi

ssh "$1"@"$2" -p "$SSH_PORT" 'cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub
