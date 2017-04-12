#!/usr/bin/python

import sys
import re
from datetime import datetime
import csv

reader = csv.reader(sys.stdin, delimiter = "\t")
skippedHeader = False
for line in reader:
	if not skippedHeader:
		skippedHeader = True
		continue
	if len(line) == 19:
		student_id = int(line[3])
		added = str(line[8])
		added = added.replace("+00", "")
		hour = datetime.strptime(added, "%Y-%m-%d %H:%M:%S.%f").hour
		print "{0}\t{1}".format(student_id, hour)	