---
title: how to work with watchtower
---

## in docker compose

[Docs](https://containrrr.dev/watchtower/usage-overview/)

[Good Link](https://www.webhi.com/how-to/update-automatically-docker-containers-with-watchtower-on-ubuntu-18-04-20-04-22-04/)

Put the config in the docker compose file to make watchtower watch the **services inside that docker compose**:

```yaml
  watchtower:
    image: containrrr/watchtower
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - $HOME/.docker/config.json:/config.json:ro
      - /var/run/docker.sock:/var/run/docker.sock
    env_file:
      - watchtower.env
#    command: notify-upgrade
    command: --interval 30
    restart: unless-stopped
```

The env example:

```bash
WATCHTOWER_CLEANUP=true
WATCHTOWER_REMOVE_VOLUMES=true

# Possible values are: panic, fatal, error, warn, info, debug or trace.
WATCHTOWER_NOTIFICATIONS_LEVEL=info
WATCHTOWER_NOTIFICATIONS_HOSTNAME=myhostname
WATCHTOWER_NOTIFICATIONS_DELAY=2

# spaces should be separated by '+' (i.e., URL Encoded)
WATCHTOWER_NOTIFICATION_URL="smtp://SMTP_USERNAME:SMTP_PASSWORD@SMTP_HOST:587/?auth=Plain&from=EMAIL_FROM_ADDRESS&fromname=EMAIL_FROM_NAME&subject=&to=EMAIL1,EMAIL2 rocketchat://[username@]rocketchat-host/token[/channel|@recipient]" # pragma: allowlist secret

# Legacy settings (use with 'notify-upgrade' as 'command' to construct shoutrrr URL)
#WATCHTOWER_NOTIFICATIONS=email
#WATCHTOWER_NOTIFICATION_EMAIL_FROM=
#WATCHTOWER_NOTIFICATION_EMAIL_TO=
#WATCHTOWER_NOTIFICATION_EMAIL_SERVER=
#WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT
#WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=
#WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=
#WATCHTOWER_NOTIFICATION_EMAIL_DELAY=2
```

[Email URL format](https://containrrr.dev/shoutrrr/v0.8/services/email/)

[RocketChat URL format](https://containrrr.dev/shoutrrr/v0.8/services/rocketchat/)

## pre/post update/check hooks

[Docs](https://containrrr.dev/watchtower/lifecycle-hooks/)
