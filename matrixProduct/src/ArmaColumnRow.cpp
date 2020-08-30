#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]

// [[Rcpp::export]]
arma::mat ArmaColumnRow(const arma::mat& mat_1, const arma::mat& mat_2) {
  int n = mat_1.n_rows, m = mat_2.n_cols;
  arma::mat rmat(n, m);
  
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      rmat(i, j) = accu(mat_1.row(i) * mat_2.col(j));
    }
  }
  return rmat;
}