#' Product of two matrices
#'
#' This function reads two matrices and operate the product between them, by using
#' parallel for method in rows from parallel R library.
#'
#' @param mat_1 First one matrix
#' @param mat_2 Second one matrix
#' @return A matrix with matrix product result  
#' @export
ParallelRow <- function(mat_1, mat_2, t = 1) {
  
  stopifnot(exists("mat_1"))
  stopifnot(exists("mat_2"))
  
  registerDoParallel(cores = t)
  
  val <- foreach(i = 1:dim(mat_1)[1], .combine = "rbind") %dopar% {
    foreach(j = 1:dim(mat_2)[2], .combine = "c") %do% 
      sum(mat_1[i,] * mat_2[,j])
    }
  
  invisible(val)
}