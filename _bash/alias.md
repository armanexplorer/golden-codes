---
title: kinds of aliases
description: the compelx aliases
---

{% raw %}

```bash
alias dps='docker ps --format '\''table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.RunningFor}}\t{{ $myPorts := (split .Ports ", ")}}\t{{range $pindex, $port := $myPorts}}{{if eq (index (split $port ":") 0) "0.0.0.0"}}{{index (split (index (split $port ":") 1 ) "/") 0}} {{end}}{{end}}'\'
```

{% endraw %}
