---
layout: default
title: Class Decorator
description: How we can use decorators to check errors in function arguments
---

These are some practical exampels of Class Decorators:

```python
 
class ErrorCheck:
 
    def __init__(self, function):
        self.function = function
 
    def __call__(self, *params):
        if any([isinstance(i, str) for i in params]):
            raise TypeError("parameter cannot be a string !!")
        else:
            return self.function(*params)
 
 
@ErrorCheck
def add_numbers(*numbers):
    return sum(numbers)
 
#  returns 6
print(add_numbers(1, 2, 3))
 
# raises Error. 
print(add_numbers(1, '2', 3)) 
```