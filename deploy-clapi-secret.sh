#!/bin/bash

template=`cat "templates/cloud-apikey.yaml" | sed "s/{{CL_API}}/$CL_API/g"`

# apply the yml with the substituted value
echo "$template" | kubectl apply -f -