generate_data <- function(n, p, rho) {
  R <- matrix(rep(rho, p * p), nrow = p) - diag(rho - 1, p, p)
  Lambda <- diag(eigen(R)$values)
  G <- eigen(R)$vectors
  H <- pracma::randortho(n)[,1:p]
  x <- H %*% Lambda^(0.5) %*% t(G)
  e <- rnorm(n)
  list(x = x, e = e)
}
