
# Primeiro, eu seto a semente aleatoria de geração de dados
# utilizando a função addTaskCallback
semente <- addTaskCallback(function(...) {set.seed(123); TRUE})

semente # chamo a semente

# Criando uma distribuição normal

distribuicao_normal <- rnorm(200)

print(distribuicao_normal) # para ver a distribuição normal

summary(distribuicao_normal) # sumário das distribuição normal

# Criação de uma distribuição binomial
distribuicao_binomial <- rbinom(200, 1, 0.8) # escolhemos 200 casos para uma 
# variável binária com chance de ganhar de 80%

print(distribuicao_binomial) # para ver a distribuição binomial

summary(distribuicao_binomial) # sumário da distribuição binomial

# Variável de index a partir do caso 67
index_simulacao <- seq(67, length(distribuicao_normal))

print(index_simulacao) # para ver a variável de index


# Removendo a tarefa criada no início
removeTaskCallback(semente)
