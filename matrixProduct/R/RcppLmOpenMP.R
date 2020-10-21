#' Linear regression fit
#'
#' This function reads one matrix and one vector to operate linear regression fit, by using
#' Rcpp backend.
#'
#' @param mat Covariates matrix
#' @param vector Dependent vector
#' @return The parameters estimation
#' @export
RcppLmOpenMP <- function(mat, vec, t) {
  
  stopifnot(exists("mat"))
  stopifnot(exists("vec"))
  
  val <- OpenMP(solve(t(mat) %*% mat(mat)), t(mat) %*% vec, t)
  
  invisible(val)
}