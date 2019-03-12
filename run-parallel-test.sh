#!/usr/bin/env bash

echo "$$" > "PID_PARALLEL"

if [ "$1" == "" ]; then
  echo "Usage: run-parallel-test.sh [landscape-domain]"
  echo "Example: run-parallel-test.sh eu10.hana.ondemand.com"
  exit 0
fi

DOMAIN="$1"
FILE="$(mktemp)"

rm -rf gen/parallel
mkdir -p gen/parallel

for i in `seq 1 50`; do
  echo "https://hello-go-test.cfapps.$DOMAIN/" >> "$FILE"
done

while true; do
  parallel "curl -sSi" >> "gen/parallel/$DOMAIN.log" 2>> "gen/parallel/$DOMAIN.err" < "$FILE"
done
