---
title: all about pip
---

[Options Docs](https://pip.pypa.io/en/stable/cli/pip_install/#options)

Some Examples:

`-r, --requirement file`
Install from the given requirements file. This option can be used multiple times.

`-c, --constraint file`
Constrain versions using the given constraints file. This option can be used multiple times.

`--no-deps`
Don’t install package dependencies.

## pip install -e

The command `python -m pip install -e` is used to install a package in "editable" mode:

The main benefits of using `pip install -e` are:

1. **Editable installs**: When you use `pip install -e .` in the root directory of a Python package, it installs the package in "editable" mode. This means that changes made to the source code of the installed package are immediately available without the need to reinstall the package.

2. **Simplifies development**: Editable installs are particularly useful during development when you are actively working on a package. It allows you to test and debug code changes in real-time without having to reinstall the package each time.

3. **Maintains package structure**: When you install a package with `pip install -e`, the package is installed with its full directory structure preserved. This ensures that relative imports and other package-specific functionality work as expected.

4. **Avoids conflicts**: Installing packages directly with `pip install` can lead to conflicts if you have multiple projects using different versions of the same package. Using editable installs and virtual environments helps isolate each project's dependencies.

5. **Follows best practices**: The `python -m pip install -e` command is considered a best practice for installing packages during development. It explicitly specifies the Python interpreter to use and avoids potential issues that can arise from relying on the system's default `pip` command.

## install from mirrors

```bash
pip install --trusted-host https://mirror-pypi.runflare.com -i https://mirror-pypi.runflare.com/simple/ django
```

```bash
source host:

https://mirror-pypi.runflare.com
https://pypi.tuna.tsinghua.edu.cn
https://mirrors.aliyun.com
https://pypi.mirrors.ustc.edu.cn
https://repo.huaweicloud.com
http://pypi.douban.com
http://pypi.sdutlinux.org
source adderess:

https://mirror-pypi.runflare.com/simple/
https://pypi.tuna.tsinghua.edu.cn/simple/
https://mirrors.aliyun.com/pypi/simple/
https://pypi.mirrors.ustc.edu.cn/simple/
https://repo.huaweicloud.com/repository/pypi/simple/
http://pypi.douban.com/simple/
http://pypi.sdutlinux.org/
```
