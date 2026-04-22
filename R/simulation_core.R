one_rep <- function(i, j, n, p, rho) {

  data <- generate_data(n, p, rho)
  x <- data$x
  e <- data$e

  beta <- rep(1/sqrt(p), p)
  y <- x %*% beta + e

  ols <- ols_estimator(x, y)

  stats <- compute_variance(x, y, ols)
  ts_ols <- compute_ts(ols, stats$var, j)

  return(ts_ols)
}
