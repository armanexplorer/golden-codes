---
title: how to work with inspect in python
---

## example of reading the method body

```py
import inspect

class MyClass:
    def my_method(self):
        print("This is the body of my_method.")

# Create an instance of MyClass
obj = MyClass()

# Access and print the body of my_method
method_body = inspect.getsource(obj.my_method)
print(method_body)
```
