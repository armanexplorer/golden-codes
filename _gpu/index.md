---
---

# get details
```bash
lspci -v | grep -A 10 VGA
```

# verify drivers are loaded
nvidia-smi

# enable GPU Operator
microk8s enable gpu

[nos (GPU partitionting)](https://github.com/nebuly-ai/nos)