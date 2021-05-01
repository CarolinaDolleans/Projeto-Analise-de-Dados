# Carregando as bases de 2021, 2020, 2019 e 2018 de sinistros de trânsito do site da PCR

sinistros_recife_2018_raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2485590a-3b35-4ad0-b955-8dfc36b61021/download/acidentes_2018.csv', sep = ';', encoding = 'UTF-8')

sinistros_recife_2019_raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

sinistros_recife_2020_raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistros_recife_2021_raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

# junta as bases de dados com comando rbind (juntas por linhas)

sinistros_recife_2018_raw <- sinistros_recife_2018_raw[, - c(10, 11, 12)]

names(sinistros_recife_2018_raw)[1] <- "data"

sinistros_recife_2019_raw <- sinistros_recife_2019_raw[,- c(10, 11, 12)]

names(sinistros_recife_2019_raw)[1] <- "data"

sinistros_recife_raw <- rbind(sinistros_recife_2021_raw, 
                              sinistros_recife_2020_raw, 
                              sinistros_recife_2019_raw, 
                              sinistros_recife_2018_raw)

# Transformando a coluna "complemento" em fator

sinistros_recife_raw$complemento <- as.factor(sinistros_recife_raw$complemento)
