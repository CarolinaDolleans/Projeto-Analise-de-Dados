# Intalação do pacote epptools

install.packages('eeptools')


# Chamamos pacotes

library(ggplot2)

library(eeptools)


# Vetor das cidades

municipios <- c("Afrânio", "Bezerros", "Capoeiras", "Garanhuns", "Recife")


# Vetor com a população por cidade

populaçao_2020 <- c("19810", "60880", "20048", "140577", "1555000" )


# Vetor com a letalidade do covid por cidade

letalidade_covid <-c("1,56%", "2,93%", "1,70%", "1,87%", "3,69%")


# Criação do dataframe

municipios_pe_covid <- data.frame(
  municipio = municipios,
  populaçao = populaçao_2020,
  letalidade = letalidade_covid
)

# Verificação da estrutura do objeto

str(municipios_pe_covid)



