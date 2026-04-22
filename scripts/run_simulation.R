# Main simulation script

library(MASS)
library(car)
library(pracma)
library(doParallel)
library(foreach)
library(doRNG)

# Load functions
source("../R/simulation_core.R")

# Run simulation
x1  <- test(n = 30,  p = 3,  rho = 0.80)
x2  <- test(n = 50,  p = 3,  rho = 0.80)
x3  <- test(n = 50,  p = 5,  rho = 0.80)
x4  <- test(n = 100, p = 3,  rho = 0.80)
x5  <- test(n = 100, p = 5,  rho = 0.80)
x6  <- test(n = 100, p = 10, rho = 0.80)
x7  <- test(n = 200, p = 3,  rho = 0.80)
x8  <- test(n = 200, p = 5,  rho = 0.80)
x9  <- test(n = 200, p = 10, rho = 0.80)
x10 <- test(n = 300, p = 3,  rho = 0.80)
x11 <- test(n = 300, p = 5,  rho = 0.80)
x12 <- test(n = 300, p = 10, rho = 0.80)

# Combine results
res1 <- cbind(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12)

# Add scenario information
n_row   <- c(30, 50, 50, 100, 100, 100, 200, 200, 200, 300, 300, 300)
p_row   <- c(3, 3, 5, 3, 5, 10, 3, 5, 10, 3, 5, 10)
rho_row <- rep(0.80, 12)

res_final1 <- rbind(
  n   = n_row,
  p   = p_row,
  rho = rho_row,
  res1
)

# Save results
write.csv(res_final1, "../results/res_final1.csv", row.names = TRUE)
saveRDS(res_final1, "../results/res_final1.rds")

# Print result
print(res_final1)
