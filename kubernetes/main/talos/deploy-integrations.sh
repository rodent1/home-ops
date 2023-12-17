#!/usr/bin/env bash
# shellcheck disable=2312
pushd integrations >/dev/null 2>&1 || exit 1

if ! kubectl get ns system-controllers >/dev/null 2>&1; then
  kubectl create ns system-controllers
fi

kubectl kustomize --enable-helm ./cni | kubectl apply -f -
rm -rf cni/charts

kubectl kustomize --enable-helm ./kubelet-csr-approver | kubectl apply -f -
rm -rf kubelet-csr-approver/charts
