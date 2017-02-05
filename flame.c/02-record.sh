#!/bin/bash -x

mkfifo fifo
rm perf-folded  perf.data  perf.data.old

cat fifo | ./flame &
pid=$!
perf record -F 99 -p ${pid} -g -- &
ps -p ${pid}
sleep 1
# python3 -c 'import sys,math;sys.stdout.buffer.write(bytes([int(0x80+0x80*math.sin(i)) for i in range(30)]))' > fifo
./img2skyline.py a.png > fifo

sleep 20 
wait ${pid}
kill %2
