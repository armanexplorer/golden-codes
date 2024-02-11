---
---

# upgrade with new values
```bash
# main methods
helm upgrade gpu-operator nvidia/gpu-operator -n gpu-operator-resources --set devicePlugin.enabled=false
helm upgrade gpu-operator nvidia/gpu-operator -n gpu-operator-resources --values custom-values.yaml

# other ones
helm upgrade gpu-operator nvidia/gpu-operator -n gpu-operator-resources -f custom-values.yaml
helm upgrade gpu-operator nvidia/gpu-operator -n gpu-operator-resources --reuse-values -f custom-values.yaml

# also we can use --reset-values to prune current values
```