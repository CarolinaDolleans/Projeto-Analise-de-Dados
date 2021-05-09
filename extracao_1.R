# Extrações básicas

# arquivos de texto com read.csv2
licitacoes_concluidas_recife <- read.csv2('http://dados.recife.pe.gov.br/dataset/591a6ed4-7beb-4304-a2a1-2af521517a06/resource/c5d7505c-381c-4670-a0c2-1fbf56df50b1/download/dados_abertos_licitacao_concluida.csv', sep = ';', encoding = 'UTF-8')

# arquivos json
install.packages('rjson')
library(rjson)

relacao_vacinados_recife <- fromJSON(file = "http://dados.recife.pe.gov.br/dataset/f381d9ea-4839-44a6-b4fe-788239189900/resource/159fabd3-f156-411a-a949-e6b5c0bc2ad8/download/metadados_vacinados.json")

relacao_vacinados_recife <- as.data.frame(relacao_vacinados_recife)

# arquivos xml
install.packages('XML')
library(XML)

# Aqui, professor, tentei extrair várias bases de dados em XML, porém não deu certo...

datasets_nasa <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/nasa/nasa.xml")

mondial <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/mondial/mondial-3.0.xml")

psd_7003 <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/pir/psd7003.xml")

swiss_prot <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/SwissProt/SwissProt.xml")

yahoo <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/auctions/yahoo.xml")

uwm <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/courses/uwm.xml")


# Essa base de dados foi a única que consegui extrair desse repositório de datasets

wsu <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/courses/wsu.xml")



