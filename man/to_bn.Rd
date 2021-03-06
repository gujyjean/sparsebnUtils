% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bnlearn-compatibility.R
\name{to_bn}
\alias{to_bn}
\title{Conversion to bnlearn object}
\usage{
to_bn(x)
}
\arguments{
\item{x}{An object of type \code{\link{sparsebnPath}}, \code{\link{sparsebnFit}}, \code{\link{edgeList}},
\code{\link[bnlearn]{bn-class}}, \code{\link[igraph]{igraph}}, or \code{\link[network]{network}}.}
}
\description{
\code{to_bn} converts an object to a \code{\link[bnlearn]{bn-class}} object. Works on both fitted
objects and graphs themselves. In the first case, every underlying 'edges' component is converted to
\code{\link[bnlearn]{bn-class}}. In the second, the conversion applies directly to the object.
}

