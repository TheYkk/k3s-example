#!/bin/bash

template=`cat "templates/CluseterIssuer.yaml" | sed "s/{{MAIL}}/$MAIL/g"`

# apply the yml with the substituted value
echo "$template" | kubectl apply -f -
