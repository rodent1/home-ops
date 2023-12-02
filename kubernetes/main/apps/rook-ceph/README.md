# Rook-Ceph Cleanup Instructions

This document describes the necessary steps to clean up a Rook-Ceph installation. Follow these instructions carefully to avoid any data loss or system crashes.

## Step 1: Remove the rook-ceph namespace directory from your app directory

Before you can remove Rook-Ceph from your Kubernetes cluster, you must first remove the `rook-ceph` namespace directory from your application directory.

## Step 2: Run the cleanup commands

After removing the `rook-ceph` namespace directory from your application directory, you can start the cleanup process by running the following commands:

```bash
k delete ns rook-ceph

k -n rook-ceph patch configmap rook-ceph-mon-endpoints --type merge -p '{"metadata":{"finalizers": []}}'
k -n rook-ceph patch cephblockpool ceph-blockpool --type merge -p '{"metadata":{"finalizers": []}}'
k -n rook-ceph patch cephcluster rook-ceph --type merge -p '{"metadata":{"finalizers": []}}'
k -n rook-ceph patch cephfilesystem ceph-filesystem --type merge -p '{"metadata":{"finalizers": []}}'
k -n rook-ceph patch cephobjectstore ceph-objectstore --type merge -p '{"metadata":{"finalizers": []}}'
k -n rook-ceph patch secret rook-ceph-mon --type merge -p '{"metadata":{"finalizers": []}}'
```

These commands remove the finalizers from Rook-Ceph resources which allows the Kubernetes garbage collector to delete these resources.

**Warning:** Make sure to verify that all your data is backed up and that you no longer need the Rook-Ceph resources before running these commands, as they will permanently delete the Rook-Ceph namespace and all associated resources.

## Step 3: Run the ansible task `ceph-reset`

After running the cleanup commands and verifying that all the rook-ceph resources have been removed, you should run the Ansible task `ceph-reset` to clean up any remaining components:

```bash
task ansible:ceph-reset
```

This Ansible task will ensure that all the left-over components from Rook-Ceph are properly cleaned up from your system.
