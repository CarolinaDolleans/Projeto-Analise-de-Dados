
# As duas bases que eu vou combinar sao datasets do World Bank
# A primeira é o índice de Gini por país
# A segunda corresponde a quantidade de terras agrícolas em função do total do território para cada país
gini <- read.csv('bases_originais/API_SI.POV.GINI_DS2_en_csv_v2_2445276.csv', skip=4, stringsAsFactors=F)

terras_agricolas <- read.csv('bases_originais/API_AG.LND.AGRI.ZS_DS2_en_csv_v2_2447957.csv', skip=4, stringsAsFactors=F)

# Combinando as duas bases
gini_terras_agricolas <- left_join(gini, terras_agricolas, by = c("Country.Name", "Country.Code", "Indicator.Name", "Indicator.Code"))

