---
title: can we overload methods in python?!
---

[Link1](https://stackoverflow.com/questions/10202938/how-do-i-use-method-overloading-in-python)

## something

```py
from multipledispatch import dispatch

@dispatch(int, int)
def add(x, y):
    return x + y

@dispatch(float, float)
def add(x, y):
    return x + y

result1 = add(2, 3)  # Calls add(int, int)
result2 = add(2.5, 3.1)  # Calls add(float, float)
```
