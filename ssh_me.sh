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

SSH_USER=$1
SSH_HOST=$2

SSH_PORT=22

if [ -n "$3" ]
  then
    SSH_PORT=$3
fi

ssh-copy-id -i ~/.ssh/id_rsa.pub -p "$SSH_PORT" "$SSH_USER@$SSH_HOST"
