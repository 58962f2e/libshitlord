#!/bin/bash

#Linux perf_events has a variety of capabilities, including CPU sampling. Using it to sample all CPUs and generate a flame graph:
#
## git clone https://github.com/brendangregg/FlameGraph  # or download it from github
## cd FlameGraph
## perf record -F 99 -a -g -- sleep 60
perf script | ~/git/FlameGraph/stackcollapse-perf.pl > out.perf-folded
~/git/FlameGraph/flamegraph.pl out.perf-folded > /tmp/a.svg
#The perf record command samples at 99 Hertz (-F 99) across all CPUs (-a), capturing stack traces so that a call graph (-g) of function ancestry can be generated later. The samples are saved in a perf.data file, which are read by perf script.
#
#I create the intermediate file, out.perf-folded, to make it a little quicker when creating multiple filtered flame graphs from the same data. Eg:
#
## perf script | ./stackcollapse-perf.pl > out.perf-folded
## grep -v cpu_idle out.perf-folded | ./flamegraph.pl > nonidle.svg
## grep ext4 out.perf-folded | ./flamegraph.pl > ext4internals.svg
## egrep 'system_call.*sys_(read|write)' out.perf-folded | ./flamegraph.pl > rw.svg
