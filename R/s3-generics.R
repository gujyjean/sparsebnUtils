#
#  s3-generics.R
#  sparsebnUtils
#
#  Created by Bryon Aragam (local) on 1/22/16.
#  Copyright (c) 2014-2016 Bryon Aragam. All rights reserved.
#

#
# PACKAGE SPARSEBNUTILS: Generics
#
#   CONTENTS:
#

### Constructors ----------------------------------------
#' @rdname sparsebnData
#' @export
sparsebnData <- function(x, ...) UseMethod("sparsebnData", x)

#' @rdname sparsebnPath
#' @export
sparsebnPath <- function(x) UseMethod("sparsebnPath", x)

#' @rdname sparsebnFit
#' @export
sparsebnFit <- function(x) UseMethod("sparsebnFit", x)

#' @rdname sparse
#' @export
sparse <- function(x, ...) UseMethod("sparse", x)

#' @rdname edgeList
#' @export
edgeList <- function(x) UseMethod("edgeList", x)

### User methods ----------------------------------------

#' Conversion to edgeList object
#'
#' \code{to_edgeList} converts an object to an \code{\link{edgeList}} object. Works on both fitted
#' objects and graphs themselves. In the first case, every underlying 'edges' component is converted to
#' \code{\link{edgeList}}. In the second, the conversion applies directly to the object.
#'
#' @param x An object of type \code{\link{sparsebnPath}}, \code{\link{sparsebnFit}}, \code{\link[graph]{graphNEL-class}},
#' \code{\link[igraph]{igraph}}, or \code{\link[network]{network}}.
#'
#' @export
to_edgeList <- function(x) UseMethod("to_edgeList", x)

### Generics for various exported utility functions

#' get.adjacency.matrix
#'
#' Extracts the adjacency matrix of the associated graph object.
#'
#' @param x any \code{R} object.
#'
#' @return
#' \code{matrix}
#'
#' @export
get.adjacency.matrix <- function(x) UseMethod("get.adjacency.matrix", x)

#' get.lambdas
#'
#' Extracts the lambda values from a \code{\link{sparsebnPath}} object.
#'
#' @param x a \code{\link{sparsebnPath}} object.
#'
#' @return
#' Vector of \code{numeric} lambda values in fitted object.
#'
#' @export
get.lambdas <- function(x) UseMethod("get.lambdas", x)

#' get.nodes
#'
#' Returns the node names associated with a fitted object.
#'
#' @param x a \code{\link{sparsebnFit}} or \code{\link{sparsebnPath}} object.
#'
#' @return
#' Vector of \code{character} names.
#'
#' @export
get.nodes <- function(x) UseMethod("get.nodes", x)

#' num.nodes
#'
#' Extracts the number of nodes of the associated graph object.
#'
#' @param x a \code{\link{sparsebnFit}} or \code{\link{sparsebnPath}} object.
#'
#' @return
#' Number of nodes as \code{integer}.
#'
#' @export
num.nodes <- function(x) UseMethod("num.nodes", x)

#' num.edges
#'
#' Extracts the number of edges of the associated graph object.
#'
#' @param x a \code{\link{sparsebnFit}} or \code{\link{sparsebnPath}} object.
#'
#' @return
#' Number of edges as \code{integer}.
#'
#' @export
num.edges <- function(x) UseMethod("num.edges", x)

#' num.samples
#'
#' Extracts the number of samples used to estimate the associated object.
#'
#' @param x a \code{\link{sparsebnFit}} or \code{\link{sparsebnPath}} object.
#'
#' @return
#' Number of samples as \code{integer}.
#'
#' @export
num.samples <- function(x) UseMethod("num.samples", x)

#' is.zero
#'
#' Determines whether or not the object is the same as the null or zero object from its class.
#'
#' @param x a fitted object.
#'
#' @return
#' \code{TRUE} or \code{FALSE}.
#'
#' @export
is.zero <- function(x) UseMethod("is.zero", x)

#' Estimate the parameters of a Bayesian network
#'
#' Given the structure of a Bayesian network, estimate the parameters (weights) using ordinary least
#' squares (for Gaussian data) or logistic regression (for discrete data).
#'
#' The low-level fitting methods are \code{\link{fit_glm_dag}} (for continuous data)
#' and \code{\link{fit_multinom_dag}} (for discrete data).
#'
#' @param fit fitted \code{\link{sparsebnFit}} or \code{\link{sparsebnPath}} object containing the Bayesian network structure to fit.
#' @param data Data to use for fitting.
#' @param ... (optional) additional arguments to pass to \code{\link{lm}} or \code{\link{glm}}.
#'
#' @export
estimate.parameters <- function(fit, data, ...){
    stopifnot(is.sparsebnData(data))
    UseMethod("estimate.parameters", fit)
}

#' Covariance and precision matrices
#'
#' Methods for computing covariance and precision matrices given an estimated directed graph.
#'
#' For Gaussian data, the precision matrix corresponds to an undirected graphical model for the
#' distribution. This undirected graph can be tied to the corresponding directed graphical model;
#' see Sections 2.1 and 2.2 (equation (6)) of Aragam and Zhou (2015) for more details.
#'
#' @param x fitted \code{\link{sparsebnFit}} or \code{\link{sparsebnPath}} object.
#' @param data data as \code{\link{sparsebnData}} object.
#' @param ... (optional) additional parameters
#'
#' @return
#' Covariance (or precision) matrix as \code{\link[Matrix]{Matrix}} object.
#'
#' @name get.covariance
#' @export
get.covariance <- function(x, data, ...) UseMethod("get.covariance", x)

#' @rdname get.covariance
#' @export
get.precision <- function(x, data, ...) UseMethod("get.precision", x)

#' @rdname sparsebn-functions
#' @export
pick_family <- function(x) UseMethod("pick_family", x)

#' Recode discrete data
#'
#' Recodes discrete data so that the levels correspond to \code{0...n-1}, where \code{n}
#' is the total number of levels in a discrete factor.
#'
#' Assumes data is unordered. Ordered factors are not supported at this time.
#'
#' @param x an R object to coerce.
#'
#' @examples
#' x <- 1:5
#' coerce_discrete(x) # output: 0 1 2 3 4
#'
#' x <- c("high", "normal", "high", "low")
#' coerce_discrete(x) # output: 0 2 0 1
#'
#' @name coerce_discrete
#' @export
coerce_discrete <- function(x) UseMethod("coerce_discrete", x)

#' @rdname sparsebn-functions
#' @export
reIndexC <- function(x) UseMethod("reIndexC", x)

#' @rdname sparsebn-functions
#' @export
reIndexR <- function(x) UseMethod("reIndexR", x)

# Internal generics --------------------------------------
.num_edges <- function(x) UseMethod(".num_edges", x)
# to_B <- function(x) UseMethod("to_B", x)

