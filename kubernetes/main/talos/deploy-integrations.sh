#!/usr/bin/env bash
# shellcheck disable=2312
pushd integrations >/dev/null 2>&1 || exit 1

if ! kubectl get ns system-controllers >/dev/null 2>&1; then
  kubectl create ns system-controllers
fi

rm -rf cni/charts
envsubst < ../apps/kube-system/cilium/app/values.yaml > cni/values.yaml
kustomize build --enable-helm cni | kubectl apply -f -
rm cni/values.yaml
rm -rf cni/charts

kubectl kustomize --enable-helm ./kubelet-csr-approver | kubectl apply -f -
rm -rf kubelet-csr-approver/charts
