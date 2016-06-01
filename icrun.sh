#!/bin/bash

CFILE=$1
OBJFILE="x.out"
CFILENAME=${CFILE%.cpp}
INPUTFILE="$CFILENAME.in"

g++ $CFILE -o $OBJFILE
echo  "Built file: $CFILE -> $OBJFILE"

./$OBJFILE < $INPUTFILE
