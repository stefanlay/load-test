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
  echo "https://x-forwarded-for.cf.$DOMAIN/" >> $FILE
  echo "https://api.cf.$DOMAIN/v2/info/" >> $FILE
done

while true; do
  cat "$FILE" | parallel "curl -sSi -X POST -d @data-1MB.file {}" >> "gen/parallel/$DOMAIN.log" 2>> "gen/parallel/$DOMAIN.err"
done
