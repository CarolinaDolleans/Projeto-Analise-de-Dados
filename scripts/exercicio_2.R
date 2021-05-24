1. Extraia em padrão ff todas as bases de situação final de alunos disponíveis neste endereço: http://dados.recife.pe.gov.br/dataset/situacao-final-dos-alunos-por-periodo-letivo

situacaofinalalunos2020 <- 'bases_originais/situacaofinalalunos2020.csv'
situacaofinalalunos2019 <- 'bases_originais/situacaofinalalunos2019.csv'
situacaofinalalunos2018 <- 'bases_originais/situacaofinalalunos2018.csv'
situacaofinalalunos2017 <- 'bases_originais/situacaofinalalunos2017.csv'
situacaofinalalunos2016 <- 'bases_originais/situacaofinalalunos2016.csv'
situacaofinalalunos2015 <- 'bases_originais/situacaofinalalunos2015.csv'
situacaofinalalunos2014 <- 'bases_originais/situacaofinalalunos2014.csv'
situacaofinalalunos2013 <- 'bases_originais/situacaofinalalunos2013.csv'
situacaofinalalunos2012 <- 'bases_originais/situacaofinalalunos2012.csv'
situacaofinalalunos2011 <- 'bases_originais/situacaofinalalunos2011.csv'

extracao2020 <- read.csv.ffdf(file=situacaofinalalunos2020)
extracao2019 <- read.csv.ffdf(file=situacaofinalalunos2019)
extracao2018 <- read.csv.ffdf(file=situacaofinalalunos2018)
extracao2017 <- read.csv.ffdf(file=situacaofinalalunos2017)
extracao2016 <- read.csv.ffdf(file=situacaofinalalunos2016)
extracao2015 <- read.csv.ffdf(file=situacaofinalalunos2015)
extracao2014 <- read.csv.ffdf(file=situacaofinalalunos2014)
extracao2013 <- read.csv.ffdf(file=situacaofinalalunos2013)
extracao2012 <- read.csv.ffdf(file=situacaofinalalunos2012)
extracao2011 <- read.csv.ffdf(file=situacaofinalalunos2011)

2. Junte todas as bases extraídas em um único objeto ff
library(ffbase)
library(data.table)

situacaofinaltotal <- ffdfrbind.fill(extracao2020, extracao2019, extracao2018, 
                                 extracao2017, extracao2016, extracao2015, 
                                 extracao2014, extracao2013, extracao2012, 
                                 extracao2011)

3. Limpe sua staging area

rm(list = c('extracao2020', 'extracao2019', 'extracao2018', 'extracao2017', 
            'extracao2016', 'extracao2015', 'extracao2014', 'extracao2013', 
            'extracao2012', 'extracao2011'))

4. Exporte a base única em formato nativo do R

saveRDS(situacaofinaltotal, "bases_tratadas/situacaofinaltotal.rds")

