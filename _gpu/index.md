---
title: check gpu device
---

## get details

```bash
lspci -v | grep -A 10 VGA
```

## verify drivers are loaded

```bash
nvidia-smi
```
