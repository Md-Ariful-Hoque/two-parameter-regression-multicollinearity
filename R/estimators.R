ols_estimator <- function(x, y) {
  solve(t(x) %*% x) %*% t(x) %*% y
}

ridge_estimator <- function(x, y, k) {
  I <- diag(ncol(x))
  solve(t(x) %*% x + k * I) %*% t(x) %*% y
}
