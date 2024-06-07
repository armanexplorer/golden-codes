---
---

# test the mail server
```bash
gitlab-rails console
Notify.test_email('recipient@example.com', 'Test Subject', 'Test Body').deliver_now
```
