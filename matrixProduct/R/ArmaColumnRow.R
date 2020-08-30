#' Product of two matrices
#'
#' This function reads two matrices and operate the product between them, by using
#' for method in rows/columns from Armadillo C++ library.
#'
#' @param mat_1 First one matrix
#' @param mat_2 Second one matrix
#' @return A matrix with matrix product result  
#' @export
ArmaColumnRow <- function(mat_1, mat_2) {
  
  stopifnot(exists("mat_1"))
  stopifnot(exists("mat_2"))
  
  val <- ArmaColumnRow(mat_1, mat_2)
  
  invisible(val)
}