#!/usr/bin/env python3

# convert in.jpg -monochrome -resize 500x500 -monochrome out.png

import sys
from PIL import Image

i = Image.open(sys.argv[1])
#print(i)
x,y = i.size
#print(x,y)
#print(i.getpixel((0,0)))
values = []
for xx in range(x):
	try:
		value = min(yy for yy in range(y) if i.getpixel((xx,yy)) == 0)
		values.append(value)
	except:
		pass

mm = max(values)
sys.stdout.buffer.write(bytes(int(int(0xFF * (v/mm)) & 0xFF) for v in values))
