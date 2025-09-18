---
title: how to use docker API for different scenarios
---

## make the anon volume a named one

### python client

```py
import docker
import shutil

client = docker.from_env()

def migrate_anonymous_volume(container_name, new_volume_name):
    try:
        container = client.containers.get(container_name)
        container.stop()

        # Assuming the anonymous volume is mounted to /data inside the container
        data_dir = "/tmp/backup_" + container_name

        # Create temporary directory
        shutil.rmtree(data_dir, ignore_errors=True)  # Clean up existing directory
        os.makedirs(data_dir)

        # Copy data from container to host
        container.exec_run("cp -r /data/* {}".format(data_dir))

        # Create new volume
        client.volumes.create(new_volume_name)

        # Copy data from host to new volume
        # Assuming the new volume is mounted to /data inside the container
        new_volume_mountpoint = client.volumes.get(new_volume_name).get_mountpoint()
        shutil.copytree(data_dir, new_volume_mountpoint)

        # Update container configuration (replace with your method)
        # ...

        # Start container
        container.start()

    except Exception as e:
        print(f"Error processing container {container_name}: {e}")

# List of container names to process
containers = ["container1", "container2"]

for container in containers:
    migrate_anonymous_volume(container, f"new_volume_{container}")
```

### bash client

{% raw %}

```bash
#!/bin/bash

function migrate_anonymous_volume() {
  container_name="$1"
  new_volume_name="$2"

  # Stop the container
  docker stop "$container_name"

  # Create a temporary directory
  backup_dir="/tmp/backup_$container_name"
  rm -rf "$backup_dir"
  mkdir -p "$backup_dir"

  # Copy data from the container to the host
  docker cp "$container_name:/data" "$backup_dir"

  # Create a new volume
  docker volume create "$new_volume_name"

  # Copy data from the host to the new volume
  new_volume_mountpoint=$(docker volume inspect "$new_volume_name" -f '{{ .Mountpoint }}')
  cp -r "$backup_dir"/* "$new_volume_mountpoint"

  # Remove temporary directory
  rm -rf "$backup_dir"

  # Update container configuration to use the new volume
  # Replace this with your specific method for updating the container configuration

  # Start the container
  docker start "$container_name"
}

# List of container names to process
containers=("container1" "container2")

for container in "${containers[@]}"
do
  new_volume_name="new_volume_${container}"
  migrate_anonymous_volume "$container" "$new_volume_name"
done
```

{% endraw %}
