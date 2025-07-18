---
title: how to work with ollama
---

## remove models

```bash
# remove specific model
ollama rm <model name>

# remove all models at once
ollama list | awk 'NR>1 {print $1}' | xargs -I {} ollama rm {}

# some place for cache files (?)
open ~/.ollama/models/blobs
```
