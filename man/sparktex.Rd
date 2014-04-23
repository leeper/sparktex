\name{sparktex}
\alias{sparktex}
\title{Generate sparktex output}
\description{Generate sparktex output for LaTeX from input value}
\usage{
sparktex(y, x=NULL, height=1.75, width=NULL,
		type=c("sparkline","sparkspike"),
		color=NULL, linewidth=NULL,
		rectangle=NULL, sparkdot=NULL, 
		normalize=FALSE, catfile="", ...)
}
\arguments{
  \item{y}{A vector of data values.}
  \item{x}{An optional vector containing horizontal positions of \code{y} values. If \code{NULL}, evenly spaced positions will be calculated automatically.}
  \item{height}{The height of the sparkplot as a percentage of line height. Default is 1.75, per sparklines documentation.}
  \item{width}{The width of the sparkline. See examples.}
  \item{type}{Either "sparkline" for a lineplot or "sparkspike" for a barplot.}
  \item{color}{Optionally, a two-element character specifying a LaTeX color model and color specification for the sparkline or sparkspikes.}
  \item{linewidth}{An optional value specifying the width of the sparkspikes or the width of the sparkline. No unit is implied, so the user must specify an appropriate unit of measurement.}
  \item{rectangle}{Optionally, a two- or four-element vector specifying the vertical lower and upper bounds of a background rectangle to draw behind the full width of the sparkline (if both values are equal, nothing is drawn) and, optionally, the LaTeX color model and color specification for the rectangles. If only the bounds are specified, the default color model and specification is used ("gray","0.9"). See examples.}
  \item{sparkdot}{An optional argument which, if specified, should consist of a list of three-element vectors, where the elements are - respectively - an x value, a y value, and a color. If specifying sparkdot(s), it is probably best to specify \code{x} values to prevent misplacement due to automatic rescaling of x.}
  \item{normalize}{A logical specifying whether y should be rescaled to the dimensions (0,1). If \code{height=1} and \code{normalize=TRUE}, the entire sparkline fits within a single LaTeX line. If \code{normalize=FALSE} and/or \code{height} > 1 (default is 1.75), the sparkline will spillover vertically.}
  \item{catfile}{An optional file where the output should be written. If \code{""} (the default), the output is sent to \code{stdout}.}
  \item{...}{Optional arguments passed to \code{\link{cat}}.}
}

\details{
This package can be used to generate the LaTeX markup necessary to display sparklines (lineplots) and sparkspikes (barplots) for the \code{sparklines} environment from the \dQuote{sparklines} LaTeX package. Markup can either be written to \code{stdout}, e.g. to incorporate directly in a \code{Sweave} or \code{knitr} output, or saved to file. The sparklines can be included in LaTeX body text or other environments, e.g., \code{tabular}, making it a relatively flexible means of incorporating simple in-text graphics.
}
\value{
A call to \code{sparktex} invisibly returns a three-element list containing:
  \item{x}{A numeric vector of (possibly adjusted) x positions.}
  \item{y}{A numeric vector of (possibly adjusted) y positions.}
  \item{tex}{A character string containing the LaTeX output.}
  
If \code{file} is not an emptry string, then the content of \code{tex} are written to the file, otherwise the content is sent to \code{stdout}.
}

\references{
For information on the LaTeX sparklines package, see \url{http://www.ctan.org/pkg/sparklines}.
}
\author{Thomas J. Leeper, with contributions from Andy Barbour}
\note{The \code{sparklines} environment is only available with \code{pdflatex}. \code{\\usepackage\{sparklines\}} must be declared in the LaTeX preamble.}
%\seealso{}
\examples{
# Output from all examples included in `sparktex-examples.pdf`

# data for sparklines
vals <- sin(seq(1:10))

# basic sparkline
sparktex(vals)

# a wider sparkline
sparktex(vals, width=40)

# a thicker sparkline
sparktex(vals, linewidth=3)

# a sparkspike/barplot
sparktex(vals, type="sparkspike")

# constrain y to (0,1)
sparktex(vals, normalize=TRUE)

# constrain the sparkline to LaTeX line height
sparktex(vals, height=1)

# a gray background
sparktex(vals, rectangle=c(1,2))

# a colored background
sparktex(vals, rectangle=c(1,2,"rgb","0.5,0.7,0.3"))

# two colored background rectangles
sparktex(vals, rectangle=list(c(1,2,"rgb","0.5,0.7,0.3"), c(-1,0,"rgb","0.2,0.7,0.3")))

# a sparkline with start and end points
sparktex(vals, sparkdot=list(c(0.0864,sin(1),"blue"), c(0.9136,sin(10),"red")))

# a thick purple sparkline
sparktex(vals, linewidth='2px', normalize=TRUE, color=c("named","purple"))
}
%\keyword{}