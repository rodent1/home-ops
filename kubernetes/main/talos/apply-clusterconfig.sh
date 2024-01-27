#!/usr/bin/env bash

# Deploy the configuration to the nodes
talosctl apply-config -n 10.1.1.31 -f ./clusterconfig/main-node-1.rodent.casa.yaml
talosctl apply-config -n 10.1.1.32 -f ./clusterconfig/main-node-2.rodent.casa.yaml
talosctl apply-config -n 10.1.1.33 -f ./clusterconfig/main-node-3.rodent.casa.yaml
talosctl apply-config -n 10.1.1.34 -f ./clusterconfig/main-node-4.rodent.casa.yaml
talosctl apply-config -n 10.1.1.35 -f ./clusterconfig/main-node-5.rodent.casa.yaml
