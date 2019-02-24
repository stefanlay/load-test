#!/usr/bin/env bash

if [ "$1" == "" ]; then
  echo "Usage: run-vegeta-test.sh [landscape-domain]"
  echo "Example: run-vegeta-test.sh eu10.hana.ondemand.com"
  exit 0
fi

DOMAIN="$1"
URL1="https://x-forwarded-for.cf.$DOMAIN/"

rm -rf gen/vegeta
mkdir -p gen/vegeta

echo "GET $URL1" | vegeta -cpus=64 attack -name klaeff-get-attack -workers 20 -duration=0 -rate=100 -output gen/vegeta/results.bin &
# echo "POST $URL1" | vegeta -cpus=64 attack -name klaeff-post-attack -body data-1MB.file -workers 20 -duration=0 -rate=100 -output gen/vegeta/results.bin &

PID_VEGETA=$!
echo "$PID_VEGETA" > "PID_VEGETA"
wait $PID_VEGETA
