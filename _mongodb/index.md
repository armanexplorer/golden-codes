---
---


# restore user in rocket chat
[Reference](https://docs.rocket.chat/setup-and-configure/advanced-workspace-management/restoring-an-admin)

```bash
mongosh

use rocketchat

show dbs

db.getCollection('users').update({username:"armanexplorer"}, {$set: { "services":{"loginToken":{"token":"some-token-id-that-you-will-use-to-login-once"}}, "requirePasswordChange":true} })
```
Then, open the `http://{your server url}/login-token/some-token-id-that-you-will-use-to-login-once` to reset password!
