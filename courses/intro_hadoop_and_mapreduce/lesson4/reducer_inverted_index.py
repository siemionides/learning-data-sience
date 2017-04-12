#!/usr/bin/python

import sys

nodesList = []
oldWord = None

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

    thisWord, thisNode = data_mapped
    thisNode = int(thisNode)

    if oldWord and oldWord != thisWord:
        nodesList.sort()
        print oldWord, "\t", nodesList, "\tsizeOfNodes:",len(nodesList), "\tsizeDistinctive:", len(set(nodesList)) 
        oldWord = thisWord;
        nodesList = []

    oldWord = thisWord
    nodesList.append (thisNode)

if oldWord != None:
    nodesList.sort()
    print oldWord, "\t", nodesList, "\tsizeOfNodes:",len(nodesList), "\tsizeDistinctive:", len(set(nodesList)) 

