# Main simulation script

run_simulation <- function(n, p, rho) {
  data.frame(
    n = n,
    p = p,
    rho = rho,
    result = rnorm(1)
  )
}

results <- run_simulation(50, 5, 0.9)

write.csv(results, "results/output.csv", row.names = FALSE)
