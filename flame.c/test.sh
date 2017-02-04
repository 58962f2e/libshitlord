#!/bin/bash -x

mkfifo fifo
cat fifo | ./flame &
pid=$!
ps -p ${pid}
perf record -F 99 -p ${pid} -g -- &
ps -p ${pid}
python3 -c 'import sys;sys.stdout.buffer.write(bytes([2,3,4,100,102,104,106,108,33,23,12,3]))' > fifo
perf report -n --stdio
