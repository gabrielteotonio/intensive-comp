# TItle: Simulation
# Author: Gabriel Teotonio
# Date: 2020-10-17

setwd("/home/ghft1/intensive-comp/matrixProduct")

library(devtools)
devtools::load_all()

library(matrixProduct)
library(microbenchmark)
library(pryr)
library(readr)
library(dplyr)

trials <- 10000
n_obs <- 1000


for (i in 1:trials) {
  res <- data.frame(expr = character(0), 
                    time = numeric(0),
                    trial = numeric(0),
                    memory_used = numeric(0))
  
  x_1 <- rnorm(n_obs, 0, 1)
  x_2 <- rnorm(n_obs, 5, 2)
  
  y <- 3 + 2*x_1 + 5*x_2
  
  res <- microbenchmark(lm = lm(y ~ x_1 + x_2),
                        lmInternal = .Call(stats:::C_Cdqrls, cbind(x_1, x_2), y, tol = 1e-07, FALSE),
                        lmFast = RcppLm,
                        times = 1
  )
  
  res$trial <- i
  res$memory_used <- mem_used()
  
  write.table(res, "vignettes/results/results_lm.csv", sep = ",", 
              col.names = !file.exists("vignettes/results/results_lm.csv"), 
              append = TRUE, row.names = FALSE)
  
  rm(res)
  
}
