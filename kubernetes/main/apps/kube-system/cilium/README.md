## Update: As of UnifiOS 4.1, you just need to upload a config file to the UDM Pro web ui and then configure BGP in cilium.

### BGP Config file

```conf
# FRRouting Configuration
#
router bgp 64513
  bgp router-id 10.1.1.1
  no bgp ebgp-requires-policy

  redistribute connected
  redistribute static

  neighbor k8s peer-group
  neighbor k8s remote-as 64514

  neighbor 10.1.1.31 peer-group k8s
  neighbor 10.1.1.32 peer-group k8s
  neighbor 10.1.1.33 peer-group k8s
  neighbor 10.1.1.34 peer-group k8s
  neighbor 10.1.1.35 peer-group k8s

  address-family ipv4 unicast
    neighbor k8s activate
    neighbor k8s send-community all
    neighbor k8s soft-reconfiguration inbound
```

### CiliumBGPPeeringPolicy config file

[l3.yaml](./config/l3.yaml)
