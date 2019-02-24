#!/usr/bin/env bash

if [ -f "PID_PARALLEL" ]; then
  kill -9 $(<"PID_PARALLEL") && rm "PID_PARALLEL"
fi

if [ -f "PID_VEGETA" ]; then
  kill -9 $(<"PID_VEGETA") && rm "PID_VEGETA"
fi
