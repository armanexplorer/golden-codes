---
title: ci/cd in gitlab
description: some descriptoin about the ci/cd in gitlab
---

# Stages vs Jobs
In GitLab CI, stages and jobs are different concepts that work together to define the pipeline. Here are the differences between stages and jobs:

Stages:
- Define when each job runs in the pipeline.
- Used to group jobs based on the development workflow and control the order of execution for CI CD jobs.
- Pipelines execute each stage in order, where all jobs in a single stage run in parallel.
- After a stage completes, the pipeline moves on to execute the next stage and runs those jobs, and the process continues like this until the pipeline completes or a job fails.
- If a job fails, the jobs in later stages don't start at all.

Jobs:
- Define what to do in the pipeline, such as jobs that compile or test code.
- Jobs are executed by runners and executed in the environment of the runner.
- Each job is run independently from each other.
- Jobs can run sequentially, in parallel, or out of order using DAG (Directed Acyclic Graphs).
- You can pass files between jobs and store them in build artifacts so that they can be downloaded from the interface.

In summary, stages and jobs are both important concepts in GitLab CI that work together to define the pipeline. Stages define when each job runs in the pipeline, while jobs define what to do in the pipeline. Jobs are executed by runners and can run sequentially, in parallel, or out of order using DAG.

# docker --rm 

In summary, when you pass the --rm flag to the docker run command while running a continuous command like python manage.py runserver, the container will be removed when the command is stopped or exits. The --rm flag removes the container and its associated file system, but not any volumes that were created or any data that was stored in those volumes.

If you want to remove the volumes associated with the container when it is removed, you can use the -v flag along with the --rm flag