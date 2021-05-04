##########

install.packages("microbenchmark")
library(microbenchmark)

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")

# exporta em formato excel
library(writexl)

write_xlsx(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.xlsx")

# carrega base de dados em formato nativo R
sinistrosRecife <- readRDS('bases_tratadas/sinistrosRecife.rds')

# carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade
sinistrosRecife <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';')

# carrega em formato excel
library(readxl)

sinistrosRecife <- read_excel("bases_tratadas/sinistrosRecife.xlsx")

# compara os dois processos de exportação, usando a função microbenchmark

microbenchmark(a <- saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds"), 
               b <- write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv"),
               c <- write_xlsx(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.xlsx"),
               times = 30L)

microbenchmark(a <- readRDS('bases_tratadas/sinistrosRecife.rds'), 
               b <- read.csv2('bases_tratadas/sinistrosRecife.csv',sep = ';'), 
               c <- read_excel("bases_tratadas/sinistrosRecife.xlsx"),
               times = 10L)
