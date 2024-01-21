---
title: install and update
---

# get node.js version compatible with Rocket.Chat version
`curl https://releases.rocket.chat/latest/info -s | jq '.nodeVersion' -r`
(you can replace latest with `v.2.2` for example)

# isntall
[install methods](https://www.rocket.chat/install)
[debian](https://docs.rocket.chat/deploy/deploy-rocket.chat/additional-deployment-methods/deploy-on-debian)
[docker](https://docs.rocket.chat/deploy/deploy-rocket.chat/deploy-with-docker-and-docker-compose)