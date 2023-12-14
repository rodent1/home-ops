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
talosctl -n 10.1.1.31 apply-config --file clusterconfig/main-node-1.rodent.casa.yaml --insecure
talosctl -n 10.1.1.32 apply-config --file clusterconfig/main-node-2.rodent.casa.yaml --insecure
talosctl -n 10.1.1.33 apply-config --file clusterconfig/main-node-3.rodent.casa.yaml --insecure
talosctl -n 10.1.1.34 apply-config --file clusterconfig/node*.yaml --insecure
talosctl -n 10.1.1.35 apply-config --file clusterconfig/node*.yaml --insecure
```

### Bootstrap

```
talosctl -n 10.1.1.31 bootstrap
talosctl -n 10.1.1.31 kubeconfig -f
kubectl get no -o wide
```

### Post Talos Setup

```
kubectl kustomize --enable-helm ./cni | kubectl apply -f -
kubectl kustomize --enable-helm ./kubelet-csr-approver | kubectl apply -f -
```
