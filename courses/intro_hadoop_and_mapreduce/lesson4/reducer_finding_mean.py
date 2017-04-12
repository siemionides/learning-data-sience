#!/usr/bin/python

import sys

oldDay = None
oldSaleSum = 0
nrOldDays = 0

# Loop around the data
# It will be in the format key\tval
# Where key is the store name, val is the sale amount
#
# All the sales for a particular store will be presented,
# then the key will change and we'll be dealing with the next store

for line in sys.stdin:
    data_mapped = line.strip().split("\t")
    if len(data_mapped) != 2:
        # Something has gone wrong. Skip this line.
        continue

    thisDay, thisSale = data_mapped
    thisSale = float(thisSale)

    if oldDay and oldDay != thisDay:
        print oldDay, "\t", oldSaleSum / nrOldDays
        oldDay = thisDay;
        oldSaleSum = 0
        nrOldDays = 0
        nodesList = []

    oldDay = thisDay
    oldSaleSum += thisSale
    nrOldDays += 1

if oldDay != None:
    print oldDay, "\t", oldSaleSum / nrOldDays

