
library(AER)
library(tidyverse)

n <- 1000

set.seed(42)
dat <- tibble(id = 1:n,
              apt_lo = rnorm(n = n, mean = 2, sd = 1),
              eff = rnorm(n = n, mean = 2, sd = 1),
              # type = sample(c("C", "D", "A", "N"), size = n, replace = T, prob = c(0.6, 0.2, 0.2, 0.2)),
              Z = rbinom(n = n, size = 1, prob = 0.5),
              e = rnorm(n = n, 0, 0.1)) %>% 
  # pivot_wider(names_from = type, values_from = a, values_fill = 0) %>% 
  mutate(A = ifelse(apt_lo > mean(apt_lo), 1, 0)) %>%
  mutate(
    # S = case_when(C == 1 ~ Z,
    # D == 1 ~ 1*(1-Z),
    # A == 1 ~ 1,
    # N == 1 ~ 0),
    S = A == 1 | Z == 1,
    Y = apt_lo + (S * eff) + e)

lm(Y ~ S, data = dat) %>% 
  summary()

first_stage <- glm(S ~ Z, data = dat)
summary(first_stage)
S_hat <- predict(first_stage)

lm(Y ~ S_hat, data = dat) %>% 
  summary()


iv_reg <- ivreg(Y ~ S | Z, data = dat)
summary(iv_reg)


