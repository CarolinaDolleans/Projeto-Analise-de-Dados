# Extração incremental

# Carregando uma base de dados do Diário Oficial de Recife de 2021

diario_oficial_recife_2021 <- read.csv2('http://dados.recife.pe.gov.br/dataset/e968d1ba-a1f3-4c7c-ab91-b1ecf0919178/resource/bc3c2173-6d0f-42c3-bac7-563205b21175/download/diario-oficial-iso-8859-1.csv', sep = ',', encoding = 'UTF-8')

diario_oficial_recife_2021 <- diario_oficial_recife_2021[-c(4,9,42,59),] # retirando algumas observações para a realização do exercício

# Carregando essa mesma base de dados em tempo real

diario_oficial_recife_2021_novo <- read.csv2('http://dados.recife.pe.gov.br/dataset/e968d1ba-a1f3-4c7c-ab91-b1ecf0919178/resource/bc3c2173-6d0f-42c3-bac7-563205b21175/download/diario-oficial-iso-8859-1.csv', sep = ',', encoding = 'UTF-8')

# Pelo que podemos ver na base de dados, existe uma chave real chamada de id
# Vamos fazer a comparação com ela

diario_oficial_incremento <- (!diario_oficial_recife_2021_novo$id %in% diario_oficial_recife_2021$id)

# Jutando a primeira base com o vetor contendo os dados novos

diario_oficial_recife_2021 <- rbind(diario_oficial_recife_2021, diario_oficial_recife_2021[diario_oficial_incremento,])


