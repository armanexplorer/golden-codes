---
title: All about Here Documents in shell
---

[Docs](https://www.gnu.org/software/bash/manual/bash.html#Here-Documents)

## `<<` vs `<<-`

- `<<` is used to create a here document where the content is preserved exactly as it is, including leading tabs.
- `<<-` is used to create a here document with leading tabs removed, enhancing code readability by allowing indentation without including the leading tabs in the final output.
