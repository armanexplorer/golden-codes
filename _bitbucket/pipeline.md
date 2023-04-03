---
---

# multiple branch

## bitbucket-specefic way (glob patterns)
```yaml
pipelines:
  branches:
    '{rev,staging}':
      - step:
        script:
          - echo 'step'
```

```yaml
pipelines:
  branches:
    '{feature/*,fix/*}':
      - step:
        script:
          - echo 'step'
```


## using anchors and aliaises
```yaml
pipelines:
  branches:
    rev: &sharedsteps
      - step:
          script:
            - echo 'step'
    staging: *sharedsteps
```

## some cool which POSSIBLY IS NOT SUPPORTED by bitbucket
```yaml
pipelines:
  branches:
    [rev, staging]:
    - step:
      script:
      - echo 'step'
```