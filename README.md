# k3s-example

## Setup k3s
[k3s](https://k3s.io/)
## Install Cert manager

[Cert Manager](https://docs.cert-manager.io/en/latest/getting-started/install/kubernetes.html)

```bash
kubectl create namespace cert-manager

kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v0.8.0/cert-manager.yaml

```

## Setup letsencrypt Issuer
```bash
kubectl apply -f clus.yaml
```
## Setup Traefik
```bash
kubectl apply -f traefik.yaml
```
## Setup Example app
```bash
kubectl apply -f kubia.yaml
```
## Setup Example node app
```bash
kubectl apply -f node-example.yaml
```
## Setup Kubernetes dashboard
```bash
kubectl apply -f dash.yaml
```
## Setup DroneCi [Docs](https://docs.drone.io/installation/github/kubernetes/)

```bash
kubectl apply -f drone.yaml
```
## Create token for dashboard
```bash
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
```