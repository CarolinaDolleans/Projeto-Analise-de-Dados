install.packages("ade4")
install.packages("arules")
install.packages("forcats")


library(ade4)
library(arules)
library(forcats)
library(dplyr)
library(tidyr)
library(tidyverse)

acervo_bolsonaro <- read.csv2('https://app.workbenchdata.com/workflows/7924/steps/step-x58393/current-result-table.csv', sep = ',', encoding = 'UTF-8')

# DISCRETIZACAO

# filtro por tipo de dado

factors_bolsonaro <- unlist(lapply(acervo_bolsonaro, is.factor))  
bolsonaro_factors <- acervo_bolsonaro[ , factors_bolsonaro]
str(bolsonaro_factors)

# Discretização
inteiros_bolsonaro <- unlist(lapply(acervo_bolsonaro, is.integer))  
bolsonaro_inteiros <- acervo_bolsonaro[, inteiros_bolsonaro]
str(bolsonaro_inteiros)

bolsonaro_inteiros$favorite_count <- discretize(bolsonaro_inteiros$favorite_count, method = "interval", breaks = 3, labels = c('pouco', 'médio', 'muito'))
