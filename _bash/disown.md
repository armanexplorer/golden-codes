---
title: disown in bash
---

## example

I was running following django management command:

```bash
python manage.py my_custom_command
```

Then I wanted to close the terminal because it took long. So, I did this:

```bash
^Z
disown %1

top  # also ps can work to see the status of process

# here the job was in T mode, which means `Stopped`. So I should make it continue

kill -CONT -97 # 97 is the PID you can get with running `ps` command
top

# now the job will go to S mode (Sleeping, waiting for CPU) and then R mode (Running)
```
