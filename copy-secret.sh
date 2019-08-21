#!/bin/bash

kubectl get secret $DOMAIN_NICE-tls-prod --namespace=cert-manager --export -o yaml | kubectl apply --namespace=kube-system -f -