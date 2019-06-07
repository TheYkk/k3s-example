#!/bin/bash

# sample value for your variables
HOST=$HOST

# read the yml template from a file and substitute the string 
# {{MYVARNAME}} with the value of the MYVARVALUE variable
template=`cat "templates/kubia.yaml" | sed "s/{{HOST}}/$HOST/g"`

# apply the yml with the substituted value
echo "$template" | kubectl apply -f -