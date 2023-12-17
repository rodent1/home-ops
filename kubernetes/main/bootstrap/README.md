# Bootstrap

## Install Flux into the cluster

```sh
      kubectl apply --server-side --kustomize ./kubernetes/main/bootstrap/flux
      sops --decrypt ./kubernetes/main/bootstrap/flux/age-key.sops.yaml | kubectl apply -f -
      sops --decrypt ./kubernetes/main/bootstrap/flux/github-deploy-key.sops.yaml | kubectl apply -f -
      sops --decrypt --in-place ./kubernetes/main/flux/vars/cluster-secrets.sops.env
      kubectl apply --server-side --kustomize ./kubernetes/main/flux/vars
      kubectl apply --server-side --kustomize ./kubernetes/main/flux/config
      sops --encrypt --in-place ./kubernetes/main/flux/vars/cluster-secrets.sops.env
```
