# Bootstrap

## Talos

### Create Talos Secrets

```
talhelper gensecret > talsecret.sops.yaml
sops -e -i talsecret.sops.yaml
talhelper genconfig
export TALOSCONFIG=~/home-ops/kubernetes/main/talos/clusterconfig/talosconfig
```

```
./apply-clusterconfig.sh

```

### Bootstrap

```
talosctl -n 10.1.1.31 bootstrap
talosctl -n 10.1.1.31 kubeconfig -f
kubectl get no -o wide
```

### Post Talos Setup

```
task talos:bootstrap cluster=main controller=10.1.1.31

```
