---
title: about Karl's Path SEarch library WHICH
---

kpsewhich is a command-line tool that is part of the **kpathsea library**, which is used by TeX and related programs to **quickly locate files needed during typesetting**.

The key points about kpsewhich are:

- It is used to examine variables and find files needed by TeX and related programs, such as .sty files, font files, etc.
- It maintains a database of known files in the TeX directory structure, similar to how shells maintain a cache of executables in the PATH. This allows fast lookups without having to recursively search the entire directory tree.
- The "kpse" part of the name stands for "**Karl's Path SEarch**", referring to Karl Berry who developed the kpathsea library. The "which" part is similar to the Unix "which" command that locates executables.
- kpsewhich is more sophisticated than a typical "which" command, as it can return different results depending on the TeX program being used, search variables set in texmf.cnf, and whether to search the on-disk files or just the in-memory database.
- Users often use kpsewhich to troubleshoot TeX-related issues, such as missing files or incorrect paths.

In summary, kpsewhich is an essential tool for working with TeX and LaTeX in Linux, as it allows quickly locating the files needed by these typesetting systems.

[More Detail](https://tex.stackexchange.com/questions/492093/what-does-kpsewhich-stand-for)
