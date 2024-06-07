---

---

# get the containers of a specefic project
Docker Compose does not provide a direct command to list the current namespaces (project names). However, you can list all running containers and filter them by the project name using the `docker ps` command. The project name is used as a prefix for the container names created by Docker Compose.

To list all running containers and their project names, you can use the following command:

```bash
docker ps --format '{{.Names}}'
```

This command will display the names of all running containers. The project name is the prefix of the container name, separated by an underscore.

For example, if you see container names like `project1_web_1`, `project1_db_1`, `project2_web_1`, and `project2_db_1`, you have two projects running: `project1` and `project2`.

To filter the containers by a specific project name, you can use the `grep` command:

```bash
docker ps --format '{{.Names}}' | grep '^project1'
```

This command will display only the containers with the `project1` prefix, indicating that they belong to the `project1` namespace[1][2][4].

Citations:
[1] https://stackoverflow.com/questions/70915151/how-to-show-all-running-containers-created-by-docker-compose-globally-regardle
[2] https://docs.docker.com/engine/reference/commandline/compose_ps/
[3] https://www.interviewbit.com/docker-interview-questions/
[4] https://docs.docker.com/engine/reference/commandline/compose_down/
[5] https://docs.docker.com/compose/compose-file/compose-file-v3/
[6] https://docs.docker.com/compose/compose-file/compose-file-v2/
