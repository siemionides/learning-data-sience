#!/usr/bin/python

import sys
import re
from datetime import datetime
import csv

for line in sys.stdin:
	line = line.strip().split("\t")
	if len(line) == 6:
		weekday = datetime.strptime(line[0], "%Y-%m-%d").weekday()
		sale = float(line[4])
		print "{0}\t{1}".format(weekday, sale)