#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]

// [[Rcpp::export]]
arma::mat ArmaBase(const arma::mat& mat_1, const arma::mat& mat_2) {
  return mat_1*mat_2;
}