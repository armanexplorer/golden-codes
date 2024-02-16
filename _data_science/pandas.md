---
title: some hacks in pandas
---

## group_by

Get the first column of each group:

```py
result = df.groupby('YourColumn', as_index=False).first()
```

`include_groups`: whether to include the group keys as the first level of the resulting DataFrame

## sort based on some columns

[Docs](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.sort_values.html)
[StackOverflow](https://stackoverflow.com/questions/39525928/pandas-sort-lambda-function)

```python
# method 1
df['sort_val'] = df['a'] * df['b']
df = df.sort_values('sort_val').drop('sort_val', 1)

# method 2
df = df.loc[(df['a'] * df['b']).sort_values().index]

# iloc has minor improvement in performance
df = df.iloc[(df['a']* df['b']).sort_values().index]
```

## Chart visualization

[Ref](https://pandas.pydata.org/docs/user_guide/visualization.html)

## plots

[Ref](https://neptune.ai/blog/pandas-plot-deep-dive-into-plotting-directly-with-pandas)

[Practilcal Ref with Dataste](https://data-flair.training/blogs/pandas-visualization-tutorial/)

### bar

[Docs](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.plot.bar.html)

## Cookbook

[Ref](https://pandas.pydata.org/docs/user_guide/cookbook.html)
