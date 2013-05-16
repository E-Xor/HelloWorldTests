#!/bin/bash

RUN_UNICORN="bundle exec unicorn -c ./config/unicorn/unicorn_hwt_config.rb"
RUN_UNICORN_BG="bundle exec unicorn -c ./config/unicorn/unicorn_hwt_config.rb -D"
SEARCH_UNICORN_PROCESS="ps uax | grep unicorn"
UNICORN_PID_FILE="/tmp/unicorn_hwt.pid"

case "$1" in
-f)
  echo "Running unicorn in the foreground"
  echo "Ctrl+C to stop"
  $RUN_UNICORN
  ;;
-k)
  echo "Killing unicorn"
  echo $(cat "$UNICORN_PID_FILE")
  kill -TERM $(cat "$UNICORN_PID_FILE")
  ;;
*)
  echo "Running unicorn in the background. To stop:"
  echo "$0 -k"
  $RUN_UNICORN_BG
  ;;
esac
