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

or

talosctl apply-config -n 10.1.1.31 -f ./clusterconfig/main-node-1.rodent.casa.yaml
talosctl apply-config -n 10.1.1.32 -f ./clusterconfig/main-node-2.rodent.casa.yaml
talosctl apply-config -n 10.1.1.33 -f ./clusterconfig/main-node-3.rodent.casa.yaml
talosctl apply-config -n 10.1.1.34 -f ./clusterconfig/main-worker-1.rodent.casa.yaml
talosctl apply-config -n 10.1.1.35 -f ./clusterconfig/main-worker-2.rodent.casa.yaml
```

### Bootstrap

```
talosctl -n 10.1.1.31 bootstrap
talosctl -n 10.1.1.31 kubeconfig -f
kubectl get no -o wide
```

### Post Talos Setup

```
./deploy-integrations.sh

or

kubectl kustomize --enable-helm ./integrations/cni | kubectl apply -f -
kubectl kustomize --enable-helm ./integrations/kubelet-csr-approver | kubectl apply -f -
rm -rf cni/charts
rm -rf kubelet-csr-approver/charts
```
