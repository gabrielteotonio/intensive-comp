#' Product of two matrices
#'
#' This function reads two matrices and operate the product between them, by using
#' RcppParallel backend and applying parallelFor for method in rows from RcppParallel R library.
#'
#' @param mat_1 First one matrix
#' @param mat_2 Second one matrix
#' @return A matrix with matrix product result  
#' @export
RcppParallel <- function(mat_1, mat_2, t = 1) {
  
  stopifnot(exists("mat_1"))
  stopifnot(exists("mat_2"))
  
  RcppParallel::setThreadOptions(numThreads = t)
  
  val <- RcppParallelLoop(mat_1, mat_2)
  
  invisible(val)
}
