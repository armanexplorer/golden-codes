---
title: all about test in django
---

[Docs](https://docs.djangoproject.com/en/5.0/topics/testing/tools/)

## asserts

[check exception raises](https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertRaises)

## TransactionTestCase

Note that we have to use `TransactionTestCase` and not `TestCase`. `TestCase` wraps every test inside a transaction block which gets rolled back at the end of the test. This is not suitable for our tests, which rely on having control over the outer transaction block. `TransactionTestCase` doesn’t wrap anything in a transaction, so our code can actually make changes to the test database.
