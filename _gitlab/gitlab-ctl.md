---
title: control the gitlab configs
---

## print current config

```bash
gitlab-ctl show-config
```

## restart or reconfigure

[Docs](https://docs.gitlab.com/ee/administration/restart_gitlab.html)

```bash
sudo gitlab-ctl restart

sudo gitlab-ctl restart nginx

sudo gitlab-ctl status

sudo gitlab-ctl reconfigure
```

## diff-config

This command will show the differences between the current `gitlab.rb` configuration and the default configuration template (`gitlab.rb.template`)

```bash
gitlab-ctl diff-config
```
