---
title: rclone has been used by seldon as file storage
---

## install

```bash
sudo -v ; curl https://rclone.org/install.sh | sudo bash
```

[Install](https://rclone.org/install/)

[Docs](https://rclone.org/docs/)

[s3](https://rclone.org/s3/)

[Repo](https://github.com/rclone/rclone)

## connect to Google Drive API

[Google Drive with rclone](https://rclone.org/drive/)

[Full Doc](https://rclone.org/drive/#making-your-own-client-id)

1. Get the client ID and client secret
    - Go to <https://console.developers.google.com/> and login with a google account (not important to be same with your Google Drive account)
    - Select a project or create a new one
    - Go to `ENABLE APIS AND SERVICES` and search for `Google Drive API` at top search bar and enable this
    - Click on `Credentials` in left side panel
    - You should configure Consent Screen if you did not before. To this end, click on `CONFIGURE CONSENT SCREEN` button at top right
    - Select `External` and `CREATE` -> Enter App name, User Support Email, and Developer Contact Email with deliberate things and click `save`
    - Add the `auth/docs` Google Drive API scope to the list of scopes to have the read only permission of content (for download) -> click `Save and continue`
    - ADD YOUR GOOGLE DRIVE ACCOUNT EMAIL IN THE TEST USERS
    - Go to `Credentials` again -> Click on `+ CREATE CREDENTIALS` at top -> `OAuth client ID`
    - Choose `Desktop app` and click on `Create`
    - Note the `Client ID` and `Client Secret` provided here
    - This would be `Testing` app and the access will only be valid for only one week. After that, you should grant access again, which is easy. You can also publish your app to prevent this but it might throw some confirmation when you are configuring for remote according to docs.

2. Configure `rclone` with new remote using `rclone config`. Then enter the details and not go for advanced configurations (defaults are enough). The remote type code is `17` (Google Drive) and the access request should be `2` (Read-only)

3. After configuring the remote, you can list directories and files separately using following commands:

    ```bash
    # list directories
    rclone lsd <remote_name>:

    rclone ls <remote_name>:
    ```

4. To download a file:

```bash
# -P or --progress and -v flag for verbose output
rclone -P -v copy <remote_name>:file_name.txt .
```
