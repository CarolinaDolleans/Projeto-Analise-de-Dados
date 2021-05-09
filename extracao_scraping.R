# extrair / carregar arquivos texto

library(dplyr)
library(rvest)

# Doctor Who

url_doctor_who_episodes <- "https://pt.wikipedia.org/wiki/Lista_de_epis%C3%B3dios_de_Doctor_Who"

url_doctor_who_episodes_tables <- url_doctor_who_episodes %>% read_html %>% html_nodes("table")

url_doctor_who_episodes_links <- url %>% read_html %>% html_nodes(("link"))

# A tabela que eu quero é a tabela número 31, lista dos episódios da terceira temporada da nova série

episodios_temporada_tres_dw <- as.data.frame(html_table(url_doctor_who_episodes_tables[33]))

# Worldometers Covid _ 8 de maio de 2021

url_worldometers_covid <- "https://www.worldometers.info/coronavirus/"

url_worldometers_covid_tables <- url_worldometers_covid %>% read_html %>% html_nodes("table")

covid_paises_08_05_2021 <- as.data.frame(html_table(url_worldometers_covid_tables))



