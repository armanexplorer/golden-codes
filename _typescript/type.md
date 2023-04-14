---
layout: default
title: Types
description: Different ways of defining types in TypeScript
---

# Define custom type using object



```typescript
const person = {
  name: 'John',
  age: 30,
  location: 'New York'
};

type PersonKeys = keyof typeof person;

// PersonKeys is the same as "name" | "age" | "location"
```
```typescript
type Person = {
  [K in PersonKeys]: K extends 'age' ? number : string;
};

// Person is the same as { name: string, age: number, location: string }
```