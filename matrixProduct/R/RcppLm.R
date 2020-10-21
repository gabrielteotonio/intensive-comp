#' Linear regression fit
#'
#' This function reads one matrix and one vector to operate linear regression fit, by using
#' Rcpp backend.
#'
#' @param mat Covariates matrix
#' @param vector Dependent vector
#' @return The parameters estimation
#' @export
RcppLm <- function(mat, vec) {

  stopifnot(exists("mat"))
  stopifnot(exists("vec"))
  
  val <- fastLm(mat, vec)
  
  invisible(val)
}