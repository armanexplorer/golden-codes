---
title: all about makefiles
---

## check makefile is OK

```bash
cat -e -t -v makefile_name
```

## vars

[Docs](https://www.gnu.org/software/make/manual/html_node/Setting.html)
[Ref](https://earthly.dev/blog/makefile-variables/)

## Integrate with Bash

[Docs](https://www.squash.io/integrating-bash-script-into-makefile-in-linux/)

## special variables

[Docs](https://www.gnu.org/software/make/manual/html_node/Special-Variables.html)

## run bash script

[Ref](https://stackoverflow.com/questions/2497675/how-to-run-a-bash-script-from-a-makefile)

## temp var

[Ref](https://stackoverflow.com/questions/1909188/define-make-variable-at-rule-execution-time)

### run in one shell solution

```makefile
out.tar:
   set -e ;\
   TMP=$$(mktemp -d) ;\
   echo hi $$TMP/hi.txt ;\
   tar -C $$TMP cf $@ . ;\
   rm -rf $$TMP ;\
```

### use separate lines

```makefile
get-backup-dir: TEMP = $(shell find "$(BACKUP_DIR)" -maxdepth 1 -type d -printf '%p\n' | sort -r | head -n1)
get-backup-dir: ## print that last backup dir
 @echo "The relative path is:\n $(TEMP)"
```

### using eavl

```makefile
out.tar :
    $(eval TMP := $(shell mktemp -d))
    @echo hi $(TMP)/hi.txt
    tar -C $(TMP) cf $@ .
    rm -rf $(TMP)
```

## call another target with arg

```makefile
.PHONY: callee
callee:
 @echo $(XYZ)

.PHONY: caller
caller: XYZ = 2
caller: a
caller:
 @echo 'test'
```

## if empty

```makefile
    ifeq ($(a),)
        b=2
    else
        b=$(a)
    endif
```

## multiprocess jobs

[Docs](https://www.ibm.com/docs/en/aix/7.3?topic=command-using-make-in-parallel-run-mode)

You can also use `MAKEFLAGS += 2` in the Makefile to be able to have two parallel processes
To use all of cpus:

```makefile
NPROCS = $(shell grep -c 'processor' /proc/cpuinfo)
MAKEFLAGS += -j$(NPROCS)
```
