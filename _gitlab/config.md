---
title: gitlab.rb configs
description: Config for Gitlab Omnibus CE Docker Contianer
---

# enable https in the case of reverse proxy
[Reference Link](https://docs.gitlab.com/16.3/omnibus/settings/ssl/)

```bash
external_url 'https://gitlab.example.com'

nginx['listen_port'] = 80
nginx['listen_https'] = false
```

# enable smtp (email)
```bash
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "example.com"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "gitlab"
gitlab_rails['smtp_password'] = "************"
gitlab_rails['smtp_domain'] = "exmaple.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true

gitlab_rails['gitlab_email_enabled'] = true
gitlab_rails['gitlab_email_from'] = 'gitlab@example.come'
gitlab_rails['gitlab_email_display_name'] = 'Example Gitlab'
```

# puma config (to reduce ram usage)
```bash
puma['enable'] = true
puma['ha'] = false
puma['worker_timeout'] = 60
puma['worker_processes'] = 2
puma['min_threads'] = 4
puma['max_threads'] = 4
```

# get custom lines of the gitlab.rb (+ remove empty lines)
```bash
grep -v '^#' gitlab.rb | sed '/^\s*$/d'
```
