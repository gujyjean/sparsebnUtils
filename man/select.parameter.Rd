% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sparsebnUtils-selection.R
\name{select.parameter}
\alias{select.parameter}
\title{Tuning parameter selection}
\usage{
select.parameter(x, data, type = "profile", alpha = 0.1)
}
\arguments{
\item{x}{\code{\link{sparsebnPath}} object.}

\item{data}{\code{\link{sparsebnData}} containing the original data.}

\item{type}{either "\code{profile}" or "\code{full}", default is \code{profile}.}

\item{alpha}{tuning parameter for selection between 0.05 and 0.1, default is 0.5 (see equation (11) in \href{http://www.stat.ucla.edu/~zhou/publications/Fu13-JASA.pdf}{Fu and Zhou (2013)}).}
}
\description{
Choose the best DAG model according to the criterion described in \href{http://www.stat.ucla.edu/~zhou/publications/Fu13-JASA.pdf}{Fu and Zhou (2013)}
(Section 3.4).
}
\details{
A \code{\link{sparsebnPath}} objects represents a \emph{solution path} which depends on the regularization parameter lambda.
Model selection is usually based on an estimated prediction error, and commonly used model selection
methods include the Bayesian information criterion (BIC) and cross-validation (CV) among others. It
is well-known that these criteria tend to produce overly complex models in practice, so instead we
employ an empirical model selection criterion that works well in practice. As lambda is decreased and
thus the model complexity increases, the log-likelihood of the estimated graph will increase. An
increase in model complexity, which is represented by an increase in the total number of predicted
edges, is desirable only if there is a substantial increase in the log-likelihood. In order to select
an optimal parameter, this method computes successive difference ratios between the increase in
log-likelihood and the increase in number of edges and balances these quantities appropriately. For
specific details, please see Section 3.4 in \href{http://www.stat.ucla.edu/~zhou/publications/Fu13-JASA.pdf}{Fu and Zhou (2013)}.
}

