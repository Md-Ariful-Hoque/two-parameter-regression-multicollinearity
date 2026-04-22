compute_variance <- function(x, y, beta) {
  n <- nrow(x)
  p <- ncol(x)
  sigma2 <- t(y - x %*% beta) %*% (y - x %*% beta) / (n - p - 1)
  var <- sigma2 * solve(t(x) %*% x)
  list(sigma2 = sigma2, var = var)
}

compute_ts <- function(beta, var, j) {
  beta[j] / sqrt(var[j, j])
}
