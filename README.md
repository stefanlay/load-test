# load-test

some bash scripts to generate load on web servers

not for general purpose (works on my machine only ;-)


script | description
------------ | -------------
run-parallel-test.sh | run curl using parallel in endless loop, records log file in gen dir
monitor-parallel.sh | monitor parallel requests (call using watch)
run-vegeta-test.sh | run vegeta load test
monitor-vegeta.sh | create vegeta reports (call using watch)
run-wrk-test.sh | run wrk load test
monitor-wrk.sh | create wrk reports (call using watch)
kill-test.sh | kill running test processes

requires: parallel, vegeta, wrk

brew install parallel
brew install vegeta
brew install wrk
