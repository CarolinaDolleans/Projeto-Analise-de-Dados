install.packages("data.table")
install.packages("funModeling")
install.packages("tidyverse")

library(data.table)
library(funModeling) 
library(tidyverse) 


covid19PE <- fread('https://dados.seplag.pe.gov.br/apps/basegeral.csv')
vacinas_covid_AC <- fread('https://s3-sa-east-1.amazonaws.com/ckan.saude.gov.br/PNI/vacina/uf/2021-06-29/uf%3DAC/part-00000-58278d94-f11c-43f5-bd32-6b7cb7a379ac.c000.csv')

# Primeiro, vamos identificar qual é a estrutura dos dados dessa base:
status(vacinas_covid_AC)

# Obtivemos os resultados seguintes:
                                            p_zeros     q_na   p_na        q_inf p_inf
document_id                              0.000000e+00     0 0.000000000     0     0
paciente_id                              0.000000e+00     0 0.000000000     0     0
paciente_idade                           1.228996e-05     0 0.000000000     0     0
paciente_datanascimento                  3.379738e-05     0 0.000000000     0     0
paciente_enumsexobiologico               0.000000e+00     0 0.000000000     0     0
paciente_racacor_codigo                  0.000000e+00     0 0.000000000     0     0
paciente_racacor_valor                   0.000000e+00     0 0.000000000     0     0
paciente_endereco_coibgemunicipio        0.000000e+00  2117 0.006504460     0     0
paciente_endereco_copais                 0.000000e+00  2114 0.006495242     0     0
paciente_endereco_nmmunicipio            0.000000e+00     0 0.000000000     0     0
paciente_endereco_nmpais                 0.000000e+00     0 0.000000000     0     0
paciente_endereco_uf                     0.000000e+00     0 0.000000000     0     0
paciente_endereco_cep                    0.000000e+00 50334 0.154650673     0     0
paciente_nacionalidade_enumnacionalidade 0.000000e+00     0 0.000000000     0     0
estabelecimento_valor                    0.000000e+00     0 0.000000000     0     0
estabelecimento_razaosocial              0.000000e+00     0 0.000000000     0     0
estalecimento_nofantasia                 0.000000e+00     0 0.000000000     0     0
estabelecimento_municipio_codigo         0.000000e+00     0 0.000000000     0     0
estabelecimento_municipio_nome           0.000000e+00     0 0.000000000     0     0
estabelecimento_uf                       0.000000e+00     0 0.000000000     0     0
vacina_grupoatendimento_codigo           2.851270e-03     0 0.000000000     0     0
vacina_grupoatendimento_nome             0.000000e+00     0 0.000000000     0     0
vacina_categoria_codigo                  0.000000e+00  1213 0.003726929     0     0
vacina_categoria_nome                    0.000000e+00     0 0.000000000     0     0
vacina_lote                              0.000000e+00     0 0.000000000     0     0
vacina_fabricante_nome                   0.000000e+00     0 0.000000000     0     0
vacina_fabricante_referencia             0.000000e+00     0 0.000000000     0     0
vacina_dataaplicacao                     0.000000e+00     0 0.000000000     0     0
vacina_descricao_dose                    0.000000e+00     0 0.000000000     0     0
vacina_codigo                            0.000000e+00     0 0.000000000     0     0
vacina_nome                              0.000000e+00     0 0.000000000     0     0
sistema_origem                           0.000000e+00     0 0.000000000     0     0
data_importacao_rnds                     0.000000e+00     0 0.000000000     0     0
id_sistema_origem                        0.000000e+00     0 0.000000000     0     0

# Podemos observar que as variáveis seguintes têm NAs: paciente_endereco_coibgemunicipio, paciente_endereco_copais, paciente_endereco_cep, vacina_categoria_codigo.
# Segundo o dicionário dessa base, paciente_endereco_coibgemunicipio corresponde ao código IBGE do município de endereço do vacinado.
# A variável paciente_endereco_copais corresponde ao código do país de endereço do vacinado.
# Notamos que o numero de NAs dessas duas últimas variáveis saão quase iguais.
# Além disso, a variável paciente_endereco_cep corresponde aos 5 digitos para anonimização e 7 digitos para identificação. A quantidade de NAs para essa variavel é a maior do banco.
# Enfim, a última variável com NA é a variável vacina_categoria_codigo que corresponde ao nome da vacina.

# Vamos fazer a shadow matrix dessa base de de dados:

x <- as.data.frame(abs(is.na(vacinas_covid_AC))) 

# Agora mantemos apenas as variáveis que têm NAs e procuramos correações entre as variáveis;

y <- x[which(sapply(x, sd) > 0)]
cor(y)

# O resultado que obtivemos é o seguinte:
                                      paciente_endereco_coibgemunicipio  paciente_endereco_copais  paciente_endereco_cep  vacina_categoria_codigo
paciente_endereco_coibgemunicipio                       1.000000000              0.999286563           0.189175483             0.001323543
paciente_endereco_copais                                0.999286563              1.000000000           0.189040518             0.001331494
paciente_endereco_cep                                   0.189175483              0.189040518           1.000000000            -0.000361363
vacina_categoria_codigo                                 0.001323543              0.001331494          -0.000361363             1.000000000

# Confirmando nossa intuição inicial, os resultados mostram que exite uma correlação forte entre as duas primeiras variáveis. Porém, não há outra corelação.
# Deduzimos então que os valores ausentes na primeira e segunda variável foram causados pelo mesmo mecanismo. No entanto, os NAs nas outras variáveis parecem ser aleatórios.

# Visto que essa base de dados esta no menor grão e contém valores em chracateres, não é possível fazer uma busca de padrões entre os valores específicos das variáveis e os NAs
# Vamos tentar observar os NAs em função dos municípios:
# modificação já que vão temos uma base numérica
vacinas_covid_AC_mun <- vacinas_covid_AC %>% group_by(estabelecimento_municipio_nome) %>% summarise(across(everything(), list(sum)))

# Professor, não funcionou e eu não consigo entender porque....
