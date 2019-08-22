#!/bin/bash

template=`cat "templates/kubia.yaml" | sed "s/{{DOMAIN_NAME}}/$DOMAIN_NAME/g" | sed "s/{{DOMAIN_NICE}}/$DOMAIN_NICE/g"`

# apply the yml with the substituted value
echo "$template" | kubectl apply -f -