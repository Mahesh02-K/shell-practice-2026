#!/bin/bash

N=9

# -lt = less than
# -gt = greater than
# -ne = not equal
# -eq = equal to

if [ $N -lt 10 ]
then
    echo "Given number $N is less than 10"
else
    echo "Given number $N is not less than 10"
fi 