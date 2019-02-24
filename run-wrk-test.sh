#!/usr/bin/env bash

if [ "$1" == "" ]; then
  echo "Usage: run-wrk-test.sh [landscape-domain]"
  echo "Example: run-wrk-test.sh eu10.hana.ondemand.com"
  exit 0
fi

DOMAIN="$1"
URL1="https://x-forwarded-for.cf.$DOMAIN/"

rm -rf gen/wrk
mkdir -p gen/wrk

wrk -t50 -c200 -d30s $URL1 &

PID_WRK=$!
echo "$PID_WRK" > "PID_WRK"
wait $PID_WRK
