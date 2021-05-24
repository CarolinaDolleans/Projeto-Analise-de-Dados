library(ff)
library(ffbase)
library(tidyverse)

dados_vacinaçao_brasil <- 'bases_originais/dados_vacinacao_brasil.csv'

# criando o arquivo ff
system.time(extracao_4 <- read.csv.ffdf(file=dados_vacinaçao_brasil))

# Professor, eu não consigo rodar essa função, mesmo deixando ela a noite inteira... A base de dados é muito grande, mas, eu tenho espaço disponível no meu disco e tenho 16 gigas de RAM. Então não entendo porque que não deu certo.


# Tentando a partir da criaçao de um large data original

casos = 3e7

large_data = data.table(a=rpois(casos, 3),
                       b=rbinom(casos, 1, 0.7),
                       c=rnorm(casos),
                       d=sample(c("fogo","agua","terra","ar"), casos, replace=TRUE),
                       e=rnorm(casos),
                       f=rpois(casos, 3),
                       g=rnorm(casos)
)

write_csv(large_data, "large_data.csv") # para exportar a base de dados dentro do meu computador (a única maneira que o system.time funciona...)


# criando o arquivo ff

system.time(extracao4 <- read.csv.ffdf(file= 'large_data.csv'))

# Resultados:
# usuário   sistema decorrido 
#  63.98      9.20     91.58

mean(extracao4[,5])
# Resultado: [1] -6.038011e-05

median(extracao4[,2])
#  Resultado: [1] 1

# pra outras, será preciso amostrar...
extracao4_amostra <- extracao4[sample(nrow(extracao4), 700000) , ]

lm(c ~ ., extracao4_amostra) 

# Resultados: 
  
# Call:  lm(formula = c ~ ., data = extracao4_amostra)

# Coefficients:
#  (Intercept)            a            b          dar        dfogo       dterra  
#     -0.0070437    0.0005080    0.0041696    0.0005067    0.0026947    0.0051127  
#     e            f            g  
# 0.0013065    0.0001432    0.0007368   

  
  