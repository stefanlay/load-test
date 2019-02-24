#!/usr/bin/env bash

ERROR_COUNT=$(cat gen/parallel/*.err | wc -l)
REQUEST_5_COUNT=$(cat gen/parallel/*.log | grep "HTTP/1.1 5" | wc -l)
REQUEST_4_COUNT=$(cat gen/parallel/*.log | grep "HTTP/1.1 4" | wc -l)
REQUEST_2_COUNT=$(cat gen/parallel/*.log | grep "HTTP/1.1 2" | wc -l)

echo "Err: $ERROR_COUNT"
echo "2xx: $REQUEST_2_COUNT"
echo "4xx: $REQUEST_4_COUNT"
echo "5xx: $REQUEST_5_COUNT"
