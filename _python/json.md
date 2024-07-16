---
title: all about json library in Python
---

## store utf-8 characters to be readable as text too

When you use `json.dump(data, f)`, the `data` could be ready by `json.load(f)`. But if you want to be able to also read the data using text editors, you should care of the utf-8 chars.

To ensure proper handling of German characters as an example with umlauts (ä, ö, ü), you need to specify the encoding during the dumping process. Here's how:

**1. Use the `ensure_ascii=False` argument:**

```python
import json

data = {"Nachricht": "Hallo Welt!"}  # German message

with open("data.json", "w", encoding="utf-8") as f:
  json.dump(data, f, ensure_ascii=False)
```

In this example:

* `ensure_ascii=False` tells `json.dump` not to restrict the output to ASCII characters.
* `encoding="utf-8"` specifies the encoding used to represent the text. UTF-8 is the standard encoding for handling characters from various languages, including German.

**Important:**

* Make sure the file you're writing to (`data.json` in this case) is also opened with the same encoding ("utf-8").
* Your system locale settings might affect how text is interpreted. If you encounter issues, consider setting your locale to German using tools like `locale` on Linux/macOS.
