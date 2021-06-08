# DATA TABLE
library(dplyr)
library(data.table)

acervo_bolsonaro <- read.csv2('https://app.workbenchdata.com/workflows/7924/steps/step-x58393/current-result-table.csv', sep = ',', encoding = 'UTF-8')

acervo_bolsonaro_DT <- acervo_bolsonaro %>% setDT()
class(acervo_bolsonaro_DT)

(acervo_bolsonaro_DT[ , lm(formula = retweet_count ~ favorite_count)])
