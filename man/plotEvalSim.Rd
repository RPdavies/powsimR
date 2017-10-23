% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Plot.R
\name{plotEvalSim}
\alias{plotEvalSim}
\title{Visualize power assessment}
\usage{
plotEvalSim(evalRes, annot=TRUE)
}
\arguments{
\item{evalRes}{The output of \code{\link{evaluateSim}}.}

\item{annot}{A logical vector. If \code{TRUE}, a short figure legend under the plot is included.}
}
\value{
A ggplot object.
}
\description{
This function plots the results of \code{\link{evaluateSim}} for assessing the setup performance, i.e. normalisation method performance.
}
\examples{
\dontrun{
## not yet
}
}
\author{
Beate Vieth
}