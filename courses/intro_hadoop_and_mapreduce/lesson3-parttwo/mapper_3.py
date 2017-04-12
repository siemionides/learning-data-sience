#!/usr/bin/python

# Format of each line is:
# date\ttime\tstore name\titem description\tcost\tmethod of payment
#
# We want elements 2 (store name) and 4 (cost)
# We need to write them out to standard output, separated by a tab

import re
import sys

nonParsed = 0

for line in sys.stdin:
    regex =     '([^ ]*) ([^ ]*) ([^ ]*) \[([^]]*)\] "([^"]*)" ([^ ]*) ([^ ]*)'
    data = re.match(regex, line)
    if data is None:
	nonParsed += 1
	continue

    data = data.groups()
    if len(data) == 7:

        ip, client, username_client, time, request, status_code, size_object = data
        print "{0}\t{1}".format(request.replace("http://www.the-associates.co.uk", ""), status_code)