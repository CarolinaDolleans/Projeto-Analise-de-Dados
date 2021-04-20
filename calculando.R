# Criando uma distribuição de poisson
simulacao_poisson <- rpois(600, 230)
print(simulacao_poisson)

# Média da distribuição de poisson
mean(simulacao_poisson)

# Centralização da distribuição de poisson
simulacao_central_poisson <- simulacao_poisson - mean(simulacao_poisson)
hist(simulacao_poisson)
hist(simulacao_central_poisson)
