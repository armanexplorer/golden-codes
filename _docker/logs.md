---
---


# some tips on docker logs

1. `--follow` or `-f`

    ```shell
    docker logs --follow <container-id>
    ```

2. `--tail` or `-n`

   ```shell
   docker logs --tail 100 <container-id>
   ```

3. `--since`

   ```shell
   docker logs --since 1h <container-id>
   ```

4. `--timestamps`

   ```shell
   docker logs --timestamps <container-id>
   ```

   This will add timestamps to each log entry.

5. `--format`

   ```shell
   docker logs --format '{{.Message}}' <container-id>
   ```

   This will display only the log messages, without any additional information.

Citations:

[1] https://docs.docker.com/engine/reference/commandline/logs/

[2] https://www.papertrail.com/solution/tips/how-to-live-tail-docker-logs/

[3] https://stackoverflow.com/questions/52119832/tail-docker-logs-to-see-recent-records-not-all

[4] https://github.com/moby/moby/issues/13096

[5] https://ioflood.com/blog/docker-logs-tail-command-reference-with-examples/

[6] https://chrisshennan.com/blog/docker-logs-tail-from-the-end-of-log-entries
