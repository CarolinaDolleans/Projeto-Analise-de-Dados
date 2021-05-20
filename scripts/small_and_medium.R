library(data.table)

dados_vacinaçao_pe <- 'bases_originais/dados_vacinacao_pe.csv'

# extração direta via read.csv
system.time(extracao_1 <- read.csv2(dados_vacinaçao_pe))

Essa extração demorou 30.17 segundos.

# extração via amostragem com read.csv

# ler apenas as primeiras 200 linhas
amostra_1 <- read.csv2(dados_vacinaçao_pe, nrows=20)  

amostra_1_classes <- sapply(amostra_1, class) # encontra a classe da amostra amostra

# fazemos a leitura passando as classes de antemão, a partir da amostra
system.time(extracao_2 <- data.frame(read.csv2('bases_originais/dados_vacinacao_pe.csv', colClasses=amostra_1_classes) ) )  

Professor, eu tentei várias vezes, mas, essa extração não funciona e não entendi porque...

# extração via função fread, que já faz amostragem automaticamente
system.time(extracao_3 <- fread(dados_vacinaçao_pe))

Essa extração foi seis vezes mais rápida que a primeira (5.04 segundos).
