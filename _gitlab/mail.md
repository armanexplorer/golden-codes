---
title: how can I test emails in GitLab
---

## config SMTP

```bash
# edit gitlab.rb smtp configs accordingly
...

# reconfigure gitlab
docker exec -it gitlab gitlab-ctl reconfigure

# open console
gitlab-rails console

# it should print green things
Notify.test_email('armanexplorer@gmail.com', 'Example Gitalb', 'Some test message from Example Gitlab').deliver_now
```
