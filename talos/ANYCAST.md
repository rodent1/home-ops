# Talos-native Kubernetes API anycast

This design adds a Cilium-independent Kubernetes API endpoint advertised by
the Talos 1.14 native BGP speaker on the three control-plane nodes.

It is intentionally staged as a draft. Do not apply these machine configs
until Talos 1.14 is deployed and the proposed network allocation has been
confirmed on the UniFi gateway and switch ports.

## Proposed allocation

| Purpose             | Value                    |
| ------------------- | ------------------------ |
| API anycast address | `10.1.66.1/32`           |
| BGP peering VLAN    | VLAN 67, `10.1.67.0/24`  |
| UniFi gateway peer  | `10.1.67.1`, ASN `64513` |
| Talos host ASN      | `64515`                  |
| Control-plane peers | `10.1.67.31-33`          |

The anycast address is outside the node subnet and the Cilium load-balancer
pool. If BGP is unavailable, it becomes cleanly unreachable instead of falling
back to ARP on a connected network.

The existing `10.1.1.30` Talos Layer2 VIP and Cilium `kube-api` Service remain
unchanged. DNS must not move to `10.1.66.1` until the new route has been tested
from every client network.

## UniFi FRR configuration

Merge the Talos peer group into the existing Cilium BGP configuration. UniFi
accepts one BGP configuration per device, so uploading this replaces the
current configuration and briefly resets the existing sessions.

```text
router bgp 64513
  bgp router-id 10.1.1.1
  no bgp ebgp-requires-policy

  neighbor k8s peer-group
  neighbor k8s remote-as 64514
  neighbor 10.1.1.31 peer-group k8s
  neighbor 10.1.1.32 peer-group k8s
  neighbor 10.1.1.33 peer-group k8s
  neighbor 10.1.1.34 peer-group k8s
  neighbor 10.1.1.35 peer-group k8s

  neighbor k8s-host peer-group
  neighbor k8s-host remote-as 64515
  neighbor 10.1.67.31 peer-group k8s-host
  neighbor 10.1.67.32 peer-group k8s-host
  neighbor 10.1.67.33 peer-group k8s-host

  address-family ipv4 unicast
    maximum-paths 3
    neighbor k8s next-hop-self
    neighbor k8s soft-reconfiguration inbound
    neighbor k8s-host next-hop-self
    neighbor k8s-host soft-reconfiguration inbound
  exit-address-family
exit
```

## Why policy routing is required

Traffic enters through VLAN 67. Replies sourced from `10.1.66.1` must return
through the same gateway so stateful firewall and conntrack paths remain
symmetric. Routing rule 100 sends anycast-sourced replies through table 100,
whose default route is `10.1.67.1` on each node.

## Rollout

1. Upgrade Talos and `talosctl` to 1.14 or newer.
2. Confirm that VLAN 67 and all proposed addresses are unused.
3. Create/tag VLAN 67 on the gateway and the three control-plane switch ports.
4. Replace the UniFi FRR configuration with the merged configuration above.
5. Apply the Talos config one control-plane node at a time.
6. Confirm all three BGP sessions and all three ECMP paths for `10.1.66.1/32`.
7. Test repeated TLS and authenticated Kubernetes API requests from every VLAN.
8. Only then consider changing `k8s.internal` to `10.1.66.1`.

Graceful shutdown withdraws the route immediately. The negotiated 9-second
hold time limits stale routes after a hard failure; the 3-second Cilium
keepalive applies the same failure-detection policy to Service VIP routes.

## Rollback

Keep `k8s.internal` on `10.1.1.30` during rollout. If validation fails, remove
the Talos host peer group from FRR and revert these machine-config documents;
the existing Layer2 VIP and Cilium Service continue to provide the API path.
