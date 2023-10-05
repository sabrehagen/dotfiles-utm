#!/bin/bash
CURRENT_DIR=$(dirname "$0")
COMMAND_INPUT_FILE=$CURRENT_DIR/execute-command-input-$(hostname)

touch $COMMAND_INPUT_FILE

main () {
  COMMAND_TO_EXECUTE=$(cat $COMMAND_INPUT_FILE)
  if [ ! -z "$COMMAND_TO_EXECUTE" ]; then
    echo Executing \"$COMMAND_TO_EXECUTE\"
    eval "$COMMAND_TO_EXECUTE"
    echo > $COMMAND_INPUT_FILE
  fi
}

# run every second for a minute to overcome cron's one minute granularity
for i in `seq 1 54`; do
  main
  sleep 1
done
