---
title: all kinds of pipelines
---

[Pipeline Types](https://docs.gitlab.com/ee/ci/pipelines/pipeline_architectures.html)

[Downstream Pipelines (parent-child and multi-project)](https://docs.gitlab.com/ee/ci/pipelines/downstream_pipelines.html)

[Settings](https://docs.gitlab.com/16.7/ee/ci/pipelines/settings.html)

## run downstream example

```yaml
stages:
  - "staging"
  - "production"

trigger_staging:
  stage: staging
  trigger:
    project: group/sub-group/the-project
    strategy: depend
    branch: develop
  except:
    changes:
      - "*.md"

trigger_production:
  stage: production
  trigger:
    project: group/sub-group/the-project
    strategy: depend
    branch: main
  except:
    changes:
      - "*.md"

```
