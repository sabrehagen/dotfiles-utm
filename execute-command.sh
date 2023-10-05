#!/bin/bash
CURRENT_DIR=$(dirname "$0")

if [ -z "$2" ]; then
  echo "usage: ./execute-command.sh HOSTNAME_PATTERN COMMAND"
  exit 1
fi

COMMAND_INPUT_FILE=$CURRENT_DIR/execute-command-input-$1*
printf "${@:2}" > $COMMAND_INPUT_FILE
