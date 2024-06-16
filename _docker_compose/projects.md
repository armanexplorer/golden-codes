---
title: project name in docker compose
---

## how set project name

To determine the project name in a Docker Compose file, you can use one of the following methods:

1. **Using the `-p` Flag**:
   - Run `docker-compose -p <project_name> up` to specify the project name on the command line.

2. **Using the `COMPOSE_PROJECT_NAME` Environment Variable**:
   - Set the `COMPOSE_PROJECT_NAME` environment variable before running `docker-compose up`. For example, `export COMPOSE_PROJECT_NAME=<project_name>`.

3. **Using an Environment File**:
   - Create a `.env` file in the root directory of your project and add the line `COMPOSE_PROJECT_NAME=<project_name>` to it. Then, you can run `docker-compose up` without setting the environment variable explicitly.

4. **Using the `name` Property in the `docker-compose.yml` File**:
   - As of Docker Compose v2.3.3, you can specify the project name directly in the `docker-compose.yml` file using the `name` property at the top level. For example:

     ```yaml
     version: '3'
     name: my-project
     services:
       mysql:
         ...
     ```

## get the containers of a specefic project

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

This command will display only the containers with the `project1` prefix, indicating that they belong to the `project1` namespace
