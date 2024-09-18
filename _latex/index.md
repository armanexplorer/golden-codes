---
title: different typesettings based on TeX
---

[TeX Live](https://www.tug.org/texlive/)

[Getting Start](https://www.tug.org/begin.html)

[Docs](https://latexref.xyz/)

[What is TeX and LaTeX and other typesettings?](https://www.overleaf.com/learn/latex/Articles/What%27s_in_a_Name%3A_A_Guide_to_the_Many_Flavours_of_TeX)

For example, to say “I am using pdfLaTeX” means “I am preparing my typeset document using the LaTeX macro package and processing it with the pdfTeX engine”.

## XeLaTeX

[Docs](https://www.overleaf.com/learn/latex/XeLaTeX)

## pdfLaTeX

[Docs](https://www.math.rug.nl/~trentelman/jacob/pdflatex/pdflatex.html)

## LuaLaTeX

[WikiPedia](https://en.wikipedia.org/wiki/LuaTeX)

[Docs](https://www.luatex.org/)

From the user perspective we have `pdfTeX` as stable and more or less frozen `8 bit` engine, `XeTeX` as `unicode input` and `font aware` engine using libraries for font handling, and LuaTeX as engine that is `programmable` and delegates as much as possible to `Lua`, with the objective to keep the core engine lean and mean.

## latexmk

[Docs](https://mg.readthedocs.io/latexmk.html)

[Manual](https://texdoc.org/serve/latexmk.man1.pdf/0)

If you use cross-references, you often have to run LaTeX more than once, if you use BibTeX for your bibliography or if you want to have a glossary you even need to run external programs in-between.

To avoid all this hassle, you should simply use Latexmk!

Latexmk is a Perl script which you just have to run once and it does everything else for you ... completely automagically.
