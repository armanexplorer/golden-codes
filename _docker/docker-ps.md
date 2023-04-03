---
title: all about docker ps formatting
description: Format like the go template
---

# how to have ports in brief
```bash
docker ps --format 'table {{.Names}}\t{{ $myPorts := (split .Ports ", ")}}\t{{range $pindex, $port := $myPorts}}{{if eq (index (split $port ":") 0) "0.0.0.0"}}{{index (split $port ":") 1}} {{end}}{{end}}'
```

# without type
```bash
docker ps --format 'table {{.Names}}\t{{ $myPorts := (split .Ports ", ")}}\t{{range $pindex, $port := $myPorts}}{{if eq (index (split $port ":") 0) "0.0.0.0"}}{{index (split (index (split $port ":") 1 ) "/") 0}} {{end}}{{end}}'
```

# general case
```bash
docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.RunningFor}}\t{{ $myPorts := (split .Ports ", ")}}\t{{range $pindex, $port := $myPorts}}{{if eq (index (split $port ":") 0) "0.0.0.0"}}{{index (split (index (split $port ":") 1 ) "/") 0}} {{end}}{{end}}'
```

