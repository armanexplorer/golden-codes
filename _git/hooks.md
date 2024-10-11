---
title: tools for Git Hooks
---

## pre-commit

[website](https://pre-commit.com/)

[Hooks](https://pre-commit.com/hooks)

## repos

[Hooks Repo](https://github.com/pre-commit/pre-commit-hooks)

[Flake8](https://github.com/PyCQA/flake8)

[Flake8 Docs](https://flake8.pycqa.org/en/latest/)

[Black](https://github.com/psf/black)

[Black Documentation](https://black.readthedocs.io/en/stable/usage_and_configuration/the_basics.html)

[Mypy](https://github.com/pre-commit/mirrors-mypy)

[Mypy with existing code base](https://mypy.readthedocs.io/en/stable/existing_code.html)

[pyupgrade](https://github.com/asottile/pyupgrade)

[reorder-python-imports](https://github.com/asottile/reorder-python-imports)

[markdownlint](https://github.com/igorshubovych/markdownlint-cli)

[ruff](https://github.com/astral-sh/ruff-pre-commit)

## good samples

[flake sample](https://github.com/PyCQA/flake8/blob/main/.pre-commit-config.yaml)

[AMAZON CIS](https://github.com/ansible-lockdown/AMAZON2023-CIS/blob/devel/.pre-commit-config.yaml)

## gitleaks

[Repo Link](https://github.com/gitleaks/gitleaks/tree/master)

### ignore false positive

[Link](https://github.com/gitleaks/gitleaks/tree/master?tab=readme-ov-file#gitleaksallow)

Add a comment with `gitleaks:allow` to the line containing the error we want ignore

## detect-secrets

[Repo Link](https://github.com/Yelp/detect-secrets)

### ignore false positives

Add a comment with `pragma: allowlist secret` in that line or `pragma: allowlist nextline secret` in its previous line

[Link](https://github.com/Yelp/detect-secrets?tab=readme-ov-file#inline-allowlisting)
