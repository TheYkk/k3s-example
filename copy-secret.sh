#!/bin/bash

kubectl get secret $DOMAIN_NICE-tls-prod --namespace=cert-manager --export -o yaml | kubectl apply --validate=false --namespace=kube-system -f -
kubectl get secret $DOMAIN_NICE-tls-prod --namespace=cert-manager --export -o yaml | kubectl apply --validate=false --namespace=default -f -