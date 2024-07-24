---
title: all types of relationships in models
---

[Docs](https://docs.djangoproject.com/en/5.0/topics/db/models/#relationships)

## many-to-one (Foreign Key)

From Many (source of the relationship) to One (target)

Cardinality: many instances of source participate in the relationship with a single instance of destination

- Example: Many articles has one single reporter, but not in reverse

it’s suggested, but not required, that the name of a ForeignKey field (manufacturer in the example above) be the name of the model, lowercase.

[Base Examples](https://docs.djangoproject.com/en/5.0/topics/db/examples/many_to_one/)

## many-to-many

Generally, ManyToManyField instances should go in the object that’s going to be edited on a form. In the above example, toppings is in Pizza (rather than Topping having a pizzas ManyToManyField ) because it’s more natural to think about a pizza having toppings than a topping being on multiple pizzas. The way it’s set up above, the Pizza form would let users select the toppings.

[Base Examples](https://docs.djangoproject.com/en/5.0/topics/db/examples/many_to_many/)

[many-to-many with extra fields](https://docs.djangoproject.com/en/5.0/topics/db/models/#extra-fields-on-many-to-many-relationships)

## one-to-one

[Base Examples](https://docs.djangoproject.com/en/5.0/topics/db/examples/one_to_one/)

- Example: Each Restaurant has only and only one specific Place, and each Place belongs sto only and only one specific Restaurant
