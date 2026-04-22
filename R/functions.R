# Functions for multicollinearity simulation

# Generate correlated predictors
generate_X <- function(n, p, rho) {
  Sigma <- matrix(rho, p, p)
  diag(Sigma) <- 1
  MASS::mvrnorm(n, mu = rep(0, p), Sigma = Sigma)
}

# Generate response
generate_y <- function(X, beta, sigma) {
  X %*% beta + rnorm(nrow(X), 0, sigma)
}

# OLS estimator
ols_estimator <- function(X, y) {
  solve(t(X) %*% X) %*% t(X) %*% y
}

# Simulation wrapper
run_simulation <- function(n, p, rho, sigma = 1) {
  
  beta <- rep(1, p)
  
  X <- generate_X(n, p, rho)
  y <- generate_y(X, beta, sigma)
  
  beta_hat <- ols_estimator(X, y)
  
  data.frame(
    n = n,
    p = p,
    rho = rho,
    estimate_mean = mean(beta_hat)
  )
}
