#!/usr/bin/python

import sys
import re
import csv

reader = csv.reader(sys.stdin, delimiter = "\t")
skippedHeader = False
for line in reader:
	if not skippedHeader:
		skippedHeader = True
		continue
	if len(line) == 19:
		node_type = int(line[0])
		body = str(line[4])
		body = body.replace("\n", " ")
		body = ''.join([i if i not in '.,!?:;"()<>[]#$=-/' else ' ' for i in body])
		for word in body.split(" "):
			if word.strip() != '':
				print "{0}\t{1}".format(word.lower(), node_type)	