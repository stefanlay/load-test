#!/usr/bin/env bash

cat gen/vegeta/results.bin | vegeta report
vegeta report -type=json "gen/vegeta/results.bin" > "gen/vegeta/metrics.json"
cat "gen/vegeta/results.bin" | vegeta plot > "gen/vegeta/plot.html"
cat "gen/vegeta/results.bin" | vegeta report -type="hist[0,100ms,200ms,300ms]"
