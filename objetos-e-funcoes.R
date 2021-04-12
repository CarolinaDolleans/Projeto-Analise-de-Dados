# Vetor simples

vetor <- c(7,0,8,2,7,5) 


# Banco iris

banco_iris <- iris


# Pacote dplyr

library(dplyr)


# Banco com apenas duas variáveis

banco_reduzido <- banco_iris %>%
  select(Sepal.Length, Petal.Length)


# Regressão linear entre Petal.Length (VD) e Sepal.Length (VI)

reg_iris <- lm(Petal.Length ~ Sepal.Length, banco_reduzido)

# Sumário da regressão

summary(reg_iris)
