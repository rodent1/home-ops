# Nvidia GPU Operator Setup on Debian 12 Cluster

This guide will walk you through the process of setting up the Nvidia GPU Operator on a Debian 12 (Bookworm) cluster. Specifically, we're going to install Nvidia drivers, reboot the node, test it, and modify the GPU Operator manifest file.

Remember, if you're working with a Tesla GPU, ensure you install the Tesla drivers.


## Add Debian Bookworm

Start by adding the Debian Bookworm package repository to your system.

```shell
echo "deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
```


## Install GPU Drivers
Next, you'll want to update your package lists for the new repositories. After that, install the Nvidia-Tesla drivers along with the firmware-misc-nonfree package.


```
sudo apt update
sudo apt install nvidia-tesla-driver firmware-misc-nonfree
```

## Reboot Node
Reboot your node to ensure the changes take effect.

```
sudo systemctl reboot
```

# Test GPU Functionality
After your node restarts, you can confirm the Nvidia drivers are working properly with the following command:
```
nvidia-smi
```

# Fix missing ldconfig.real


```
sudo ln -s /sbin/ldconfig /sbin/ldconfig.real
```

This command is necessary to ensure that the Nvidia GPU Operator works correctly on Debian 12.


## Modify GPU-Operator Manifest
Since the latest Nvidia GPU Operator toolkit does not support Debian, we need to manually specify that we're using installed drivers and operating on K3s.

Modify your GPU-Operator Helm Chart values to reflect the following:

```
values:
  nfd:
    enabled: true
  driver:
    enabled: false
  toolkit:
    enabled: true
    version: v1.12.1
    env:
      - name: CONTAINERD_CONFIG
        value: /var/lib/rancher/k3s/agent/etc/containerd/config.toml
      - name: CONTAINERD_SOCKET
        value: /run/k3s/containerd/containerd.sock
      - name: CONTAINERD_RUNTIME_CLASS
        value: nvidia
      - name: CONTAINERD_SET_AS_DEFAULT
        value: "true"
```
