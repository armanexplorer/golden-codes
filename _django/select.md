---
title: select_related or prefetch_related?
---

Summary: if the join has very repetative things, `prefetch_related` could be better because will query based on only IDs of the first table. But if the join is neat, the `select_related` would be better because prevents extra queries.

[Ref](https://stackoverflow.com/questions/31237042/whats-the-difference-between-select-related-and-prefetch-related-in-django-orm)

## Select_related and Prefetch_related in Django

In Django, `select_related` and `prefetch_related` are methods used to optimize query performance by fetching related data efficiently.

- **Select_related**: This method is used for one-to-one or one-to-many relationships. It performs a join on the database table when the query is executed, returning all related data in a single query. It is ideal for small related data that will be accessed frequently. For example, when fetching all city names and their provinces, `City.objects.select_related('province').all()` will result in a single SQL query.

- **Prefetch_related**: Unlike `select_related`, `prefetch_related` is suitable for many-to-many relationships. It fetches related data in a separate query after the initial query, making it useful for large related data or data that will be accessed occasionally. For instance, to get all city names of a specific province like "Hubei," you can use `Province.objects.prefetch_related('city_set').get(name__iexact="Hubei Province")`.

These methods help reduce the number of SQL queries and optimize performance by efficiently handling related data in Django ORM.

**Example**:

- To illustrate `select_related`, consider fetching all movies with their associated directors in one query:

  ```python
  movies = Movie.objects.select_related('director').all()
  for movie in movies:
      print(movie.movie_title, movie.director.name)
  ```

- For `prefetch_related`, imagine retrieving movies with their publishers efficiently:

  ```python
  movies = Movie.objects.prefetch_related('publisher').all()
  for movie in movies:
      print(movie.movie_title, movie.publisher.name)
  ```

These examples demonstrate how `select_related` and `prefetch_related` can optimize queries by efficiently handling related data in Django.
