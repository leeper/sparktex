## Generate LaTeX sparklines in R

The **sparktex** package, [available on CRAN](http://cran.r-project.org/web/packages/sparktex/index.html), provides functionality to generate LaTeX [sparklines](http://en.wikipedia.org/wiki/Sparkline), a high-density graphical display generally attributed to information designer [Edward Tufte](http://www.edwardtufte.com/tufte/). The package converts R data to LaTeX syntax for use with the LaTeX [sparklines package](http://www.ctan.org/pkg/sparklines).

The package can produce both sparklines and "sparkspikes" (sparkline-like barplots) that can be placed directly as in-line text or in table and figure environments. The display of these plots is highly customizable and the package documentation includes numerous examples.

Note: Due to dependency on the sparklines LaTeX package, **sparktex** can only produce output for PDF output.

[![Build Status](https://travis-ci.org/leeper/sparktex.svg?branch=master)](https://travis-ci.org/leeper/sparktex)
