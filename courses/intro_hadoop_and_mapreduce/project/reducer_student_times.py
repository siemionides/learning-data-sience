#!/usr/bin/python

import sys

hoursMap = {}
oldStudent = None

def printMaxHours():
    maxValue = max(hoursMap.values())
    hours_with_max_value =  [key for key, value in hoursMap.items() if value == maxValue]
    for hour in hours_with_max_value:
        print "{0}\t{1}".format(oldStudent, hour)


def addHour( hour):
    if hour in hoursMap:
        hoursMap[hour] += 1
    else:
        hoursMap[hour] = 1


for line in sys.stdin:
    data_mapped = line.strip().split("\t")
    if len(data_mapped) != 2:
        continue

    thisStudent, thisHour = data_mapped
    thisStudent = int(thisStudent)
    thisHour = int(thisHour)

    if oldStudent and oldStudent != thisStudent:
        printMaxHours()
        oldStudent = thisStudent;
        hoursMap = {}

    oldStudent = thisStudent
    addHour(thisHour)

if oldStudent != None:
    printMaxHours()
