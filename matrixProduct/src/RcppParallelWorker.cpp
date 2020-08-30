#include <RcppParallel.h>
#include <Rcpp.h>
// [[Rcpp::depends(RcppParallel)]]

using namespace RcppParallel;

struct ProductMatrix : public Worker
{
  // source matrices
  const RMatrix<double> mat_1;
  const RMatrix<double> mat_2;
  
  // destination matrix
  RMatrix<double> rmat;
  
  // initialize with source and destination
  ProductMatrix(const Rcpp::NumericMatrix mat_1,
                const Rcpp::NumericMatrix mat_2,
                Rcpp::NumericMatrix rmat) 
  : mat_1(mat_1), mat_2(mat_2), rmat(rmat) {}
  
  // execute the matrix product
  void operator()(std::size_t begin, std::size_t end) {
    for (std::size_t i = begin; i < end; i++) {
      for (std::size_t j = 0; j < mat_2.nrow(); j++) {
        
        // rows we will operate on
        RMatrix<double>::Row row1 = mat_1.row(i);
        RMatrix<double>::Row row2 = mat_2.row(j);
        
        rmat(i, j) = std::inner_product(row1.begin(), 
                                        row1.begin() + mat_1.nrow(), 
                                        row2.begin(), 
                                        0.0);
      }
    }
  }
};



// [[Rcpp::export]]
Rcpp::NumericMatrix RcppParallelLoop(Rcpp::NumericMatrix mat_1, Rcpp::NumericMatrix mat_2) {
  
  // allocate the output matrix
  Rcpp::NumericMatrix rmat(mat_1.nrow(), mat_2.ncol());
  
  // ProductMatrix functor (pass inputs and output matrices)
  ProductMatrix productMatrix(mat_1, mat_2, rmat);
  
  // call parallelFor to do the work
  parallelFor(0, mat_1.nrow(), productMatrix);
  
  // return the output matrix
  return rmat;
}
