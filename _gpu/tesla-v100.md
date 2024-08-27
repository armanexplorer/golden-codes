---
title: Nvidia Tesla V100
---

## stable status

Output of `dpkg -l | grep nvidia`:

```bash
ii  libnvidia-cfg1-550:amd64               550.54.15-0ubuntu1                         amd64        NVIDIA binary OpenGL/GLX configuration library
ii  libnvidia-common-550                   550.54.15-0ubuntu1                         all          Shared files used by the NVIDIA libraries
ii  libnvidia-compute-550:amd64            550.54.15-0ubuntu1                         amd64        NVIDIA libcompute package
ii  libnvidia-decode-550:amd64             550.54.15-0ubuntu1                         amd64        NVIDIA Video Decoding runtime libraries
ii  libnvidia-encode-550:amd64             550.54.15-0ubuntu1                         amd64        NVENC Video Encoding runtime library
ii  libnvidia-extra-550:amd64              550.54.15-0ubuntu1                         amd64        Extra libraries for the NVIDIA driver
ii  libnvidia-fbc1-550:amd64               550.54.15-0ubuntu1                         amd64        NVIDIA OpenGL-based Framebuffer Capture runtime library
ii  libnvidia-gl-550:amd64                 550.54.15-0ubuntu1                         amd64        NVIDIA OpenGL/GLX/EGL/GLES GLVND libraries and Vulkan ICD
ii  nvidia-compute-utils-550               550.54.15-0ubuntu1                         amd64        NVIDIA compute utilities
ii  nvidia-dkms-550                        550.54.15-0ubuntu1                         amd64        NVIDIA DKMS package
ii  nvidia-driver-550                      550.54.15-0ubuntu1                         amd64        NVIDIA driver metapackage
ii  nvidia-firmware-550-550.54.15          550.54.15-0ubuntu1                         amd64        Firmware files used by the kernel module
ii  nvidia-kernel-common-550               550.54.15-0ubuntu1                         amd64        Shared files used with the kernel module
ii  nvidia-kernel-source-550               550.54.15-0ubuntu1                         amd64        NVIDIA kernel source package
ii  nvidia-utils-550                       550.54.15-0ubuntu1                         amd64        NVIDIA driver support binaries
ii  xserver-xorg-video-nvidia-550          550.54.15-0ubuntu1                         amd64        NVIDIA binary Xorg driver
```

Output of `cat /proc/driver/nvidia/version`:

```bash
NVRM version: NVIDIA UNIX x86_64 Kernel Module  550.54.15  Tue Mar  5 22:23:56 UTC 2024
GCC version:  gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.2)
```

Output of `nvcc --version`:

```bash

```

Output of `nvidia-smi`:

```bash
Sat Aug 24 11:46:37 2024
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 550.54.15              Driver Version: 550.54.15      CUDA Version: 12.4     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  Tesla V100-SXM2-32GB           Off |   00000000:18:00.0 Off |                    0 |
| N/A   33C    P0             40W /  300W |       0MiB /  32768MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
|   1  Tesla V100-SXM2-32GB           Off |   00000000:3B:00.0 Off |                    0 |
| N/A   28C    P0             39W /  300W |       0MiB /  32768MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
|   2  Tesla V100-SXM2-32GB           Off |   00000000:86:00.0 Off |                    0 |
| N/A   28C    P0             39W /  300W |       0MiB /  32768MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
|   3  Tesla V100-SXM2-32GB           Off |   00000000:AF:00.0 Off |                    0 |
| N/A   32C    P0             39W /  300W |       0MiB /  32768MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+

+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI        PID   Type   Process name                              GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|  No running processes found                                                             |
+-----------------------------------------------------------------------------------------+
```
