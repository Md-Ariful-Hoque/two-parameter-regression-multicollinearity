# Main simulation script

library(MASS)

# Load functions
source("../R/functions.R")

# Run simulation
results <- run_simulation(n = 50, p = 5, rho = 0.9)

# Save results
write.csv(results, "../results/output.csv", row.names = FALSE)
