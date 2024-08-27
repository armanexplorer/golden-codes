---
title: how to install the driver
---

[CUDA installation](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html)


## get GPU model details

```bash
# the model
lspci | grep -i nvidia

# lspci -v | grep -A 10 VGA

# the driver version being used
cat /proc/driver/nvidia/version

# installed packages
dpkg -l | grep nvidia
```

## verify drivers are loaded

```bash
nvidia-smi
```

## find the arch

```bash
arch

# or

uname -m
```

## NVIDIA driver

Check the [Link](https://www.nvidia.com/download/index.aspx) to find the right version and download it.

## get CUDA version

WARNING: `nvidia-smi` shows some CUDA version which is only driver CUDA version **support**, not the current CUDA version.

```bash
# recommended
/usr/local/cuda/bin/nvcc --version

# second method
realpath /usr/local/cuda

# third method
head -n 5 /usr/local/cuda/version.json | grep version
```

## apt --fix-broken install

Some error:

```bash
dpkg: error processing archive /var/cache/apt/archives/libnvidia-gl-560_560.35.03-0ubuntu1_amd64.deb (--unpack):
 trying to overwrite '/usr/lib/x86_64-linux-gnu/libnvidia-api.so.1', which is also in package libnvidia-extra-545:amd64 545.23.08-0ubuntu1
dpkg-deb: error: paste subprocess was killed by signal (Broken pipe)
```

The solution:

```bash
dpkg -i --force-overwrite /var/cache/apt/archives/libnvidia-gl-560_560.35.03-0ubuntu1_amd64.deb

apt --fix-broken install
```
