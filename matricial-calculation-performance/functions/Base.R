Base <- function(big_matrix, N) {
  stopifnot(exists("big_matrix"))
  stopifnot(exists("N"))
  Time <- microbenchmark({
    productMat <- big_matrix %*% big_matrix
  }, times = N)$time
  return(Time)  
}
