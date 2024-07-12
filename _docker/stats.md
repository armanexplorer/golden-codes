---
title: monitoring container resource usages
---

[Doc](https://docs.docker.com/reference/cli/docker/container/stats/)

## human-readable command as bash alias

```bash
# docker stats usage - human readable version
alias dstat='printf "%-40s\tMem Usage\tMem %%\t\tCPU %%\n" "Name"; \
  printf "----------------------------------------------------------------------------------------------------\n"; \
  docker stats --no-stream --format "{{.Name}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.CPUPerc}}" | awk '\''{ \
  split($2, a, "[M|G]"); \
  if ($2 ~ /[0-9]+MiB/) { \
    printf("%-40s\t%.2f GiB", $1, a[1] / 1024); \
  } else { \
    printf("%-40s\t%.2f GiB", $1, a[1]); \
  } \
  printf("\t%s\t\t%s\n", $5, $6); \
}'\'' | sort -nrk 2'
```

## string manipulation (for gawk)

[Docs](https://www.gnu.org/software/gawk/manual/html_node/String-Functions.html)

One example:

```bash
awk '{printf("%5.2f\n", $1+$2);}'
```

%: This indicates the beginning of a format specifier.
5: This defines the minimum width of the output to be 5 characters.
.2: This defines the precision to be 2 decimal places.
f: This specifies that the output should be formatted as a floating-point number.
\n: This is a newline character that moves the output cursor to the next line.
