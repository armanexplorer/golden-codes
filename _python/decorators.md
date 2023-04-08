---
layout: default
title: Decorators
description: How we can use decorators to check errors in function arguments
---

# Class Decorators

These are some practical exampels of Class Decorators:

```python
 
class ErrorCheck:
    """
    Check the input arguments be integer
    """
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

# Function Decorators

These are some practical examples of function decorators:

```python
"""
Create a cache (lookup table) to make fibonacci very faster!
"""
import functools
from decorators import count_calls

def cache(func):
    """Keep a cache of previous function calls"""
    @functools.wraps(func)
    def wrapper_cache(*args, **kwargs):
        cache_key = args + tuple(kwargs.items())
        if cache_key not in wrapper_cache.cache:
            wrapper_cache.cache[cache_key] = func(*args, **kwargs)
        return wrapper_cache.cache[cache_key]
    wrapper_cache.cache = dict()
    return wrapper_cache

@cache
@count_calls
def fibonacci(num):
    if num < 2:
        return num
    return fibonacci(num - 1) + fibonacci(num - 2)
```
The output:
```py
>>> fibonacci(10)
Call 1 of 'fibonacci'
...
Call 11 of 'fibonacci'
55

>>> fibonacci(8)
21
```