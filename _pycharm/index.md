---
title: ‌how to work with Pycharm Editors
---

## install Pycharm Professional

### Setup the thing (\\:/)

Download and extract somewhere (like `~/`) and go to `scripts` and run `sh install.sh`

This will add a script to load some ENV variables in ZSH, BASH and Profile.

These Envs make the `pycharm.sh` file to use some special `VM_OPTIONS` file

Close the current terminal and open another terminal to run `pycharm.sh` in the following steps.

### Download

Download the tar.gz file from [here](https://www.jetbrains.com/pycharm/download/?section=linux)

### Extract

Extract to `/opt` (as recommended by Linux FHS) like [here](https://www.jetbrains.com/help/pycharm/installation-guide.html#standalone):

```bash
sudo tar xzf pycharm-*.tar.gz -C /opt/
```

### Configure

run `pycharm.sh`:

```bash
cd /opt/pycharm-2022.2.4/bin
sh pycharm.sh
```

### Create a desktop entry

On the `Welcome` screen, click `Options Menu | Create Desktop Entry`.

### Add to JetBrains Toolbox

*warning*: it might be not necessary if you fill the `state.json` (in `~/.local/share/JetBrains/Toolbox`) truly according to the current path of your app with something like this:

```json
{
    "channelId": "PyCharm-P-982d7ffa-8962-4afe-9a39-0a5b9f7c3d6d",
    "toolId": "PyCharm-P",
    "productCode": "PY",
    "tag": "pycharm",
    "displayName": "PyCharm Professional",
    "displayVersion": "2024.1.1",
    "buildNumber": "241.15989.155",
    "installLocation": "/home/x/.local/share/JetBrains/Toolbox/apps/pycharm-professional",
    "launchCommand": "bin/pycharm.sh"
}
```

**WARN**: Be careful if the app path is under root access you CANNOT use this and should continue reading!

---

In the `Extract` step, you should extract here:

```bash
sudo tar xzf pycharm-*.tar.gz -C ~/.local/share/JetBrains/Toolbox/apps/

# change the name to be obvious for JetBrains Toolbox
cd ~/.local/share/JetBrains/Toolbox/apps/
mv pycharm-2024.1.1 pycharm-professional
```

Then you should probably wait (maybe some minutes) or restart to make JetBrains Tools understand the change and load the Pycharm Professional in the apps list

#### The thing (\\:/)

After the app loaded, you should go to the app settings and go to the `Edit JVM options`. There, you should set the place of your jvm and more like this:

```conf
-javaagent:/home/x/ja-netfilter/ja-netfilter.jar=jetbrains
--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED
```

Fill the `x` after `/home/` with the right place for your thing!
