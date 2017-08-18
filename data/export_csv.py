#!/usr/bin/python
import struct, glob, os
from operator import itemgetter

MAX_MEASUREMENT = 50000

def export_csv_line(f_csv, values):	
	csv = ''
	for v in values:
		csv += str(v) + ','
	
	csv = csv[:-1]

	f_csv.write(csv);    
	f_csv.write("\r\n");

 
f_raw = open('samples.data', 'r')
f_csv = open('samples.csv', 'w+')
for i in xrange(MAX_MEASUREMENT):  
	data = f_raw.read(64)
	export_csv_line(f_csv, map(ord, data))

f_csv.close()
f_raw.close()
