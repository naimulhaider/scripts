#!/bin/bash

CFILE=$1
OBJFILE="x.out"

g++ $CFILE -o $OBJFILE
echo  "Built file: $CFILE -> $OBJFILE"

./$OBJFILE
