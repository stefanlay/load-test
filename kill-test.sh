#!/usr/bin/env bash

if [ -f "PID_PARALLEL" ]; then
  kill -9 $(<"PID_PARALLEL")
fi

if [ -f "PID_VEGETA" ]; then
  kill -9 $(<"PID_VEGETA")
fi

if [ -f "PID_WRK" ]; then
  kill -9 $(<"PID_WRK")
fi

rm -f "PID_PARALLEL"
rm -f "PID_VEGETA"
rm -f "PID_WRK"
