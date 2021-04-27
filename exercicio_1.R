# Criação das variáveis normais de desvio padrão diferente
  
var_norm_1 <- rnorm(700, 300, 50)
  
var_norm_2 <- rnorm(700, 600, 20)

# Criação de uma variável de contagem poisson

var_pois <- rpois(700, 1)

# Criação de uma variável de contagem com dispersão (binomial negativa)

var_nbinom <- rnbinom(700, 1, 0.7)
  
# Criação de uma variável binomial

var_binom <- rbinom(700, 1, 0.7)

# Criação uma variável qualitativa que apresenta um valor quando a 
# variável binomial é 0 e outro quando é 1
  
var_cat <- ifelse(var_binom == 1, 60, 105)

# Criação de uma variável de index

indexSimulacao <- seq(1, length(var_norm_1))

# Juntando todas as variáveis para criar um dataframe

dataframe <- data.frame(var_norm_1, var_norm_2, var_pois, 
                          var_nbinom, var_binom, var_cat, 
                          indexSimulacao)

# Centralizando todas as variáveis normais

var_norm_1 <- var_norm_1 - mean(var_norm_1)

var_norm_2 <- var_norm_2 - mean(var_norm_2)

# Trocando os 0 por 1 nas variáveis de contagem

var_pois <- for (i in dataframe$indexSimulacao) {
  if (var_pois == 1) {
    var_pois <- 0
  } and if (var_pois == 0) {
    var_pois <- 1
  } else {
    var_pois <- var_pois
  }
}
# professor, eu tentei isso para trocar apenas os 0 e os 1, porém, não
# funcionou, e não entendo porque...

var_pois <- ifelse(var_pois == 0, 1, 0)
 
var_nbinom <- ifelse(var_nbinom == 1, 0, 1)

var_binom <- ifelse(var_binom == 1, 0, 1)  

# Criando um novo dataframe composto por uma amostra de 100 casos do dataframe
# original

amostra_100 <- sample(dataframe$indexSimulacao, 100, replace = FALSE)
# criação da amostra de 100 casos sem repetição

dataframe_amostra_100 <- dataframe [amostra_100,]
# seleção da amostra no datafram original para criar o novo dataframe

