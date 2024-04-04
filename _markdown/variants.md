---
title: strong variants (falvors) of markdown
---

## R Markdown

[Docs](https://rmarkdown.rstudio.com/)

## Quarto

[Docs](https://quarto.org/)

Currently the newer **Quarto replaces Rmarkdown**, that still can be used but it is not longer being developed.

## kramdown

[Docs](https://kramdown.gettalong.org/index.html)

[Covert Kramdown to Latex](https://kramdown.gettalong.org/converter/latex.html)

## bookdown

[Get start](https://bookdown.org/yihui/bookdown/usage.html)

[Supporting R Package for Thesis](https://github.com/ismayc/thesisdown)

Briefly, the difference of bookdown with a main.Rnw (LaTeX+R) plus child .Rmd (Markdown) files, is that there are only several .Rmd files that are merged before to parsing R code and export to LaTeX or whatever ("merge and knitr" approach) or first run the R code of every .Rmd file and then are merged and exported to LaTeX or whatever ("knitr and merge" approach).
