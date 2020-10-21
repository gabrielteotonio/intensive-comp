#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]

// [[Rcpp::export]]
arma::vec fastLm(const arma::mat& X, const arma::vec& y) {
  
  arma::vec coef = arma::solve(X, y);
  return coef;

}