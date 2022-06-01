set.seed(10)

n_patch <- 10

D <- matrix(rpois(n = n_patch^2, lambda = 2), nrow = n_patch)
B <- rpois(n = n_patch, lambda = 10)
K <- 3.2e6
K_vec <- runif(n_patch, 0, 1) * K
S <- K_vec

D <- D / rowSums(D)

B <- (B / max(B)) * 10

p <- 735
q <- 0.003
c <- 557000
r <- 0.08

growth <- function(S, r, K){
  r * S * (1 - (S / K))
}

harvest <- function(S, E, q){
  S * E * q
}

equil_S <- function(E, q, r, K){
  (1 - ((q * E) / r)) * K
}

# G(S)
S <- seq(from = 1, to = K, length.out = 100)
G <- growth(S, r, K)
plot(S, G, xlab = "Stock size", ylab = "Growth", ylim = c(0, 8e4))


# H(E)
E1 <- 6.1
E2 <- 13.2
E3 <- 24.4

H1 <- harvest(S,E1, q)
H2 <- harvest(S, E2, q)
H3 <- harvest(S, E3, q)
lines(S, H1)
lines(S, H2)
lines(S, H3)

# Effort-yield curve
#(Maximum attainable effort in equilibrium is r/q)
E <- 1:26
equil <- equil_S(E, q, r, K)
Y <- growth(equil, r, K)

equil_p <- equil_S(c(E1, E2, E3), q, r, K)
Y_p <- growth(equil_p, r, K)
plot(E, Y, xlab = "Effort", ylab = "Equilibrium yield", ylim = c(0, 8e4))
abline(h = Y_p, v = c(E1, E2, E3), col = c("blue", "red", "green"))

# Simulate entry

S <- K
E <- 1
plot(S / K, E, xlim = c(0, 1), ylim = c(0, 100))
dif <- 1
while(dif != 0){
  S_last <- S
  H <- harvest(S, E, q)
  G <- growth(S, r, K)
  S <- S + G - H
  E <- max(E + (0.0000005 * ((p * q * S) - c)), 0)
  R <- p * H
  C <- c * E
  P <- R - C
  col <- ifelse(P < 0, "red", "blue")
  col <- ifelse(P == 0, "black", col)
  points(S / K, E, col = col)
  dif <- S_last - S
}

#Cost
R <- p * Y
C <- c * E
plot(E, R)
lines(E, C)


E_oa <- function(c, p, q, r, K, MPA = 1){
  (1 - c / (p * q * K)) * (r/q) * MPA
}


E_oa(c, p, q, r, K_vec)
S <- K_vec
E <- E_oa(c, p, q, r, K_vec)
plot(S/K_vec, type = "p", ylim = c(0, 1))
dif <- 1
while(dif != 0){
  last_last <- last
  last <- E
  tot <- sum(S)
  H <- harvest(S, E, q)
  G <- colSums(growth(S, r, K_vec) * D)
  S <- pmin(pmax(S + G - H, 0), K_vec)
  R <- p * H
  C <- c * E
  P <- R - C
  E <- pmax(E + (0.0000005 * ((p * q * S) - c)), 0)
  col <- ifelse(P < 0, "red", "blue")
  col <- ifelse(P == 0, "black", col)
  points(S / K_vec, col = col)
  dif <- tot - sum(S)
}

MC <- R/B

MPA_index <- tibble(id = 1:n_patch, B = B, MC = MC) %>% 
  arrange(MC) %>% 
  mutate(pct = cumsum(B) / sum(B)) %>% 
  filter(pct <= 0.4) %>% 
  pull(id)

MPA <- rep(1, n_patch)
MPA[MPA_index] <- 0

E_oa(c, p, q, r, K_vec, MPA = MPA)

# S <- K_vec
E <- E_oa(c, p, q, r, K_vec) * MPA
plot(S/K_vec, type = "p", ylim = c(0, 1))
dif <- 1
while(dif != 0){
  # browser()
  last_last <- last
  last <- E
  tot <- sum(S)
  H <- harvest(S, E, q)
  G <- colSums(growth(S, r, K_vec) * D)
  S <- pmin(pmax(S + G - H, 0), K_vec)
  R <- p * H
  C <- c * E
  P <- R - C
  E <- pmax(E + (0.0000005 * ((p * q * S) - c)), 0) * MPA
  col <- ifelse(P < 0, "red", "blue")
  col <- ifelse(P == 0, "black", col)
  points(S / K_vec, col = col)
  dif <- tot - sum(S)
}

last

E













