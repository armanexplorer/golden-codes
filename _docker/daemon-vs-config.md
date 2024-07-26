---
title: /etc/docker/daemon.json VS. $HOME/.docker/config.json
---

### Docker Daemon File (daemon.json)

* **Purpose:** Configures the Docker daemon itself.
* **Location:** Typically found at `/etc/docker/daemon.json` on Linux systems.
* **Contents:** Contains settings related to the `Docker daemon`'s behavior, such as `storage drivers`, `network configuration`, `TLS settings`, and more.
* **Example settings:**
    * Storage driver: `{"storage-driver": "overlay2"}`
    * Insecure registries: `{"insecure-registries": ["[invalid URL removed]"]}
    * Log driver: `{"log-driver": "json-file"}`

### Docker Config File (config.json)

* **Purpose:** Stores `authentication credentials` for Docker registries.
* **Location:** Typically found at `~/.docker/config.json` on Linux systems.
* **Contents:** Contains username, password, and other authentication information for accessing Docker registries.
* **Example content:**

  ```json
  {
      "auths": {
          "https://my-registry.example.com": {
              "auth": "base64encoded_credentials"
          }
      }
  }
  ```

**In summary:**

* The Docker daemon file controls how the Docker daemon operates.
* The Docker config file manages authentication information for accessing Docker registries.
