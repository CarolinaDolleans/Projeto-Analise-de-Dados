library(funModeling) 
library(tidyverse) 
library(data.table)

# Vamos fazer o EDA da base de dados da vacinaçao contra a covid-19 no estado de Pernambuco

dados_vacinaçao_pe <- 'bases_originais/dados_vacinacao_pe.csv'

glimpse(dados_vacinaçao_pe) # olhada nos dados
status(dados_vacinaçao_pe) # estrutura dos dados (missing etc)
freq(dados_vacinaçao_pe) # frequência das variáveis fator
plot_num(dados_vacinaçao_pe) # exploração das variáveis numéricas
profiling_num(dados_vacinaçao_pe) # estatísticas das variáveis numéricas

# Resultados: 
# > glimpse(dados_vacinaçao_pe) # olhada nos dados
# chr "bases_originais/dados_vacinacao_pe.csv"
# > status(dados_vacinaçao_pe) # estrutura dos dados (missing etc)
# variable q_zeros p_zeros q_na p_na q_inf p_inf      type unique
# var      var       0       0    0    0     0     0 character      1
# > freq(dados_vacinaçao_pe) # frequência das variáveis fator
# var frequency percentage cumulative_perc
# 1 bases_originais/dados_vacinacao_pe.csv         1        100             100
# > plot_num(dados_vacinaçao_pe) # exploração das variáveis numéricas
# Erro: At least one layer must contain all faceting variables: `variable`.
# * Plot is missing `variable`
# * Layer 1 is missing `variable`
# Run `rlang::last_error()` to see where the error occurred.
# > profiling_num(dados_vacinaçao_pe) # estatísticas das variáveis numéricas
# Error in profiling_num(dados_vacinaçao_pe) : 
#  None of the input variables are numeric, integer nor logical


# EDA com uma base de daos original 

casos = 1e4

base_de_dados = data.table(a=rpois(casos, 7),
                        b=rbinom(casos, 1, 0.7),
                        c=rnorm(casos),
                        e=rnorm(casos),
                        f=rpois(casos, 3),
                        g=rnorm(casos)
)


glimpse(base_de_dados) # olhada nos dados
status(base_de_dados) # estrutura dos dados (missing etc)
freq(base_de_dados) # frequência das variáveis fator
plot_num(base_de_dados) # exploração das variáveis numéricas
profiling_num(base_de_dados) # estatísticas das variáveis numéricas


# Resultados:

# > glimpse(base_de_dados) # olhada nos dados
# Rows: 10,000
# Columns: 6
# $ a <int> 5, 8, 5, 6, 4, 8, 7, 14, 7, 6, 6, 5, 8, 6, 5, 9, 9, 6, 4, 5, 9, 9, ...
# $ b <int> 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1...
# $ c <dbl> -0.93877907, -0.35221775, -0.68061423, 0.19574665, -1.17636878, -0....
# $ e <dbl> 0.20714487, -0.81463934, 1.11609133, -0.12392246, 0.73536299, -1.78...
# $ f <int> 4, 5, 4, 3, 1, 5, 3, 2, 6, 3, 2, 1, 3, 4, 3, 3, 2, 1, 7, 1, 0, 1, 2...
# $ g <dbl> 0.68559358, 1.83203446, -0.74479241, 2.16477772, -0.91259288, -0.44...
# > status(base_de_dados) # estrutura dos dados (missing etc)
# variable q_zeros p_zeros q_na p_na q_inf p_inf    type unique
# a        a      13  0.0013    0    0     0     0 integer     20
# b        b    2993  0.2993    0    0     0     0 integer      2
# c        c       0  0.0000    0    0     0     0 numeric  10000
# e        e       0  0.0000    0    0     0     0 numeric  10000
# f        f     482  0.0482    0    0     0     0 integer     13
# g        g       0  0.0000    0    0     0     0 numeric  10000
# > freq(base_de_dados) # frequência das variáveis fator
# NULL
# Warning message:
#   In freq(base_de_dados) :
#   None of the input variables are factor nor character
# > plot_num(base_de_dados) # exploração das variáveis numéricas
# > profiling_num(base_de_dados) # estatísticas das variáveis numéricas
# variable         mean   std_dev variation_coef      p_01      p_05       p_25
# 1        a  6.999600000 2.6193675      0.3742167  2.000000  3.000000  5.0000000
# 2        b  0.700700000 0.4579743      0.6535954  0.000000  0.000000  0.0000000
# 3        c -0.011279854 0.9962464    -88.3208516 -2.362017 -1.670208 -0.6898806
# 4        e -0.009833781 1.0115967   -102.8695574 -2.319326 -1.682611 -0.6964635
# 5        f  3.021300000 1.7395830      0.5757730  0.000000  1.000000  2.0000000
# 6        g -0.007634207 1.0011189   -131.1359309 -2.333492 -1.685458 -0.6750512
# p_50      p_75      p_95      p_99     skewness kurtosis      iqr
# 1  7.000000000 9.0000000 12.000000 14.000000  0.384597293 3.198784 4.000000
# 2  1.000000000 1.0000000  1.000000  1.000000 -0.876512171 1.768274 1.000000
# 3  0.002669531 0.6614912  1.605926  2.294417 -0.043868653 3.017646 1.351372
# 4 -0.012993691 0.6689396  1.652731  2.343872 -0.004618775 2.984758 1.365403
# 5  3.000000000 4.0000000  6.000000  8.000000  0.601457265 3.431718 2.000000
# 6  0.004135197 0.6561390  1.623948  2.288613 -0.029151131 2.991015 1.331190
# range_98                              range_80
# 1                               [2, 14]                               [4, 10]
# 2                                [0, 1]                                [0, 1]
# 3 [-2.36201725619786, 2.29441742265533] [-1.29370805187781, 1.24002764601456]
# 4 [-2.31932621693947, 2.34387197200987] [-1.31361756498284, 1.28847426906145]
# 5                                [0, 8]                                [1, 5]
# 6 [-2.33349230237101, 2.28861286129916] [-1.29692832277303, 1.27720642808734]

