#!/usr/bin/python

# Format of each line is:
# date\ttime\tstore name\titem description\tcost\tmethod of payment
#
# We want elements 2 (store name) and 4 (cost)
# We need to write them out to standard output, separated by a tab

import re
import sys

for line in sys.stdin:
    regex =     '([^ ]*) ([^ ]*) ([^ ]*) \[([^]]*)\] "([^"]*)" ([^ ]*) ([^ ]*)'
    data = re.match(regex, line).groups()
    if len(data) == 7:
        ip, client, username_client, time, request, status_code, size_object = data
        print "{0}\t{1}".format(request.split(" ")[1], status_code)

