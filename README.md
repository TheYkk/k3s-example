# k3s-example

## Clone git repo

```bash
git clone https://gitlab.com/theykk/k3s-example
```

## Setup Env HOST

```bash
export CL_API=$(echo -n 'CLOUD FLARE API KEY' | base64) #change
export DOMAIN_NAME="theykk.net" #change
export MAIL="yusufkaan142@gmail.com" #change
export DOMAIN_NICE=$(echo $DOMAIN_NAME | tr . -)
export IP="IPADDR" #change
```

## Alias

```bash
alias k="kubectl"
alias kd="kubectl delete -f"
alias ka="kubectl apply -f"
alias kan="kubectl -A"
alias kg="kubectl  get all -A"
alias kp="kubectl proxy --address 0.0.0.0 --accept-hosts '.*'"
alias kca='f(){ kubectl "$@" -A -o wide;  unset -f f; }; f'

```

## Setup k3s

[k3s](https://k3s.io/)

```bash
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--no-deploy traefik --tls-san=$IP "  sh -
```

## Install Cert manager

[Cert Manager](https://docs.cert-manager.io/en/latest/getting-started/install/kubernetes.html)

```bash
kubectl create namespace cert-manager

kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v0.9.1/cert-manager.yaml

```

## Setup Cloudflare API key

```bash
./deploy-clapi-secret.sh
```

## Setup Cluster Issuer

```bash
./deploy-clusterissuer.sh
```

## Setup Certificate

```bash
./deploy-cert.sh
```

## Setup Traefik

```bash
./deploy-traefik.sh
```

## Setup Example app

```bash
./deploy-kubia.sh
```

## Setup Example node app

```bash
./deploy-node-example.sh
```

## Setup Kubernetes dashboard

```bash
./deploy-dash.sh
```

## Setup DroneCi [Docs](https://docs.drone.io/installation/github/kubernetes/)

```bash
./deploy-drone.sh
```

## Create token for dashboard

```bash
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
```
