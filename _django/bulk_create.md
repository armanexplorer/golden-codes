---
title: bulk create
---

[Docs](https://docs.djangoproject.com/en/5.0/ref/models/querysets/#bulk-create)


**`bulk_create` in Django**

The `bulk_create` method is a performance optimization technique in Django's Object Relational Mapper (ORM) that allows you to efficiently create multiple model instances in a single database operation. This is significantly faster than saving each instance individually, especially for large datasets.

**Parameters:**

1. **`objs` (list):** This is a required parameter that represents a list of model instances you want to create. Each element in the list should be an instance of the model you're working with. The instances must have all required fields set.

2. **`batch_size` (int, optional):** This parameter controls how many objects are inserted in a single database query. By default, it's set to `None`, which means Django will try to create all objects in one batch. However, there are a few reasons to consider using `batch_size`:

   - **Database limitations:** Some databases might have restrictions on the number of parameters allowed in a single query. In such cases, setting `batch_size` to a smaller value can help avoid errors.
   - **Memory constraints:** If you're dealing with a very large dataset, creating all objects at once might consume a significant amount of memory. Using `batch_size` can help manage memory usage by processing the data in smaller chunks.

**Important Considerations:**

- **Database compatibility:** While `bulk_create` works with most databases, check the Django documentation for any specific limitations with your particular database backend.
- **Signals:** Signals won't be triggered for each instance created using `bulk_create`. If you rely on signals for certain actions (e.g., sending notifications), you might need to handle them manually or use a different approach.
- **Error handling:** If there's an error during the bulk creation process, Django might not provide detailed information about which specific object caused the failure. You'll need to consider error handling strategies in case of potential issues.

**Example:**

```python
from django.shortcuts import render

def create_multiple_objects(request):
    if request.method == 'POST':
        # Assuming you have a form to collect data
        objects_to_create = [MyModel(field1=data1, field2=data2) for data1, data2 in request.POST.items()]
        MyModel.objects.bulk_create(objects_to_create)
        return render(request, 'success.html')
    return render(request, 'create_form.html')
```

- **`update_conflicts` (bool, optional):** This parameter determines how `bulk_create` handles conflicts with existing objects based on unique constraints. Here's how it works:

    - **`update_conflicts=False` (default):** If a conflict occurs (an object with the same unique field values already exists), `bulk_create` will raise a `django.db.IntegrityError`.
    - **`update_conflicts=True`:** If a conflict occurs, existing objects will be updated with the new data provided in the `objs` list. However, it's important to note:
        - Only the fields specified in the `update_fields` parameter (if provided) will be updated.
        - Unique constraints and other database constraints still need to be respected. If an update would violate a constraint, an error will still be raised.

- **`update_fields` (list, optional):** When `update_conflicts` is set to `True`, this parameter specifies a list of field names that should be updated on existing objects that conflict with the new data. This allows you to selectively update specific fields without modifying the entire object.

- **`unique_fields` (list, optional):** This parameter is used in conjunction with `update_conflicts=True` to identify the fields that define uniqueness for conflict detection. If an existing object has the same values for the fields listed in `unique_fields`, it's considered a conflict. This is helpful for ensuring updates only occur on objects with truly identical unique field values.


**Example with `update_conflicts`, `update_fields`, and `unique_fields`:**

```python
class Book(models.Model):
    title = models.CharField(max_length=255)
    author = models.ForeignKey(Author, on_delete=models.CASCADE)
    publication_date = models.DateField()

    class Meta:
        unique_together = (('title', 'author'),)  # Composite unique constraint

# Assuming a list of Book objects with potential conflicts
books_to_create = [
    Book(title="The Hitchhiker's Guide to the Galaxy", author=author1, publication_date=date1),
    Book(title="The Lord of the Rings", author=author2, publication_date=date2),
    Book(title="The Lord of the Rings", author=author2, publication_date=date3),  # Potential conflict
]

# Update publication date for existing conflicting Book
Book.objects.bulk_create(
    books_to_create,
    update_conflicts=True,
    update_fields=['publication_date'],
    unique_fields=['title', 'author'],
)
```

In this example:

- If a Book with the same "title" and "author" already exists, its "publication_date" will be updated with the new value from the `books_to_create` list.
- The `unique_fields` ensures that updates only happen for objects with the exact same title and author combination.

Remember to use these parameters with caution and ensure your data adheres to any database constraints to avoid unexpected behavior.
