# load-test

some bash scripts to generate load on web servers

not for general purpose (works on my machine only ;-)


script | description
------------ | -------------
run-parallel-test.sh | run curl using parallel in endless loop, records log file in gen dir
monitor-parallel.sh |
run-vegeta-test.sh | run vegeta load test
monitor-vegeta.sh | create vegeta reports 
kill-test.sh | kill running test processes
