#' Product of two matrices
#'
#' This function reads two matrices and operate the product between them, by using
#' OpenMP backend from Rcpp R library interface.
#'
#' @param mat_1 First one matrix
#' @param mat_2 Second one matrix
#' @return A matrix with matrix product result  
#' @export
RcppOpenMP <- function(mat_1, mat_2, t = 1) {
  
  stopifnot(exists("mat_1"))
  stopifnot(exists("mat_2"))
  
  val <- OpenMP(mat_1, mat_2, t)
  
  invisible(val)
}
