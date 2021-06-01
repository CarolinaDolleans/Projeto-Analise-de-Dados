library(data.table)
library(dplyr)
library(tidyverse)

# Não consegui ler a base de dados a partir de fread porque não consegui pegar o link, a opção "copiar" não apareceu no endereço seguinte: https://ourworldindata.org/grapher/battle-related-deaths-in-state-based-conflicts-since-1946-by-world-region 
# A base de dados é um dataset de todas as guerras que ocorreram por ano e por região do mundo assim que seu número de vítimas.
guerras_por_regiao <- read.csv('bases_originais/battle-related-deaths-in-state-based-conflicts-since-1946-by-world-region.csv')

# Criando um vetor que identifica a região Americas
Americas <- "Americas"

# Filtrando o banco de dados para guardar apenas os conflitos que ocorreram na região Americas
guerras_americas <- guerras_por_regiao %>% 
  filter(Entity %in% Americas) 

# Transformando o dataset guerras_americas long em wide 
guerras_americas_wide <- guerras_americas %>% 
  pivot_wider(names_from = Year, values_from = Battle.related.deaths)

