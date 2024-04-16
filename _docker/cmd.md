---
title: all about CMD in dockerfile
---

[Reference](https://www.baeldung.com/linux/docker-cmd-multiple-commands)

```dockerfile
CMD ["executable", "param1", "param2"]

# equal to /bin/sh -c executable param1 param2
CMD executable param1 param2 

CMD ["/bin/bash", "-c", "echo FIRST COMMAND;echo SECOND COMMAND"]

```
