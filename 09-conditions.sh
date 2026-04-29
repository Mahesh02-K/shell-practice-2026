#!/bin/bash

N=100

# -lt = less than
# -gt = greater than
# -ne = not equal
# -eq = equal to

if [ $N -lt 10 ]
then
    echo "Given $N is less than 10"
else
    echo "Given $N is not less than 10"
fi 