# Primeiro, eu fixo a semente
set.seed(651) 

# Bootstraping com função replicate, replicando a amostra de 100 casos 10 vezes
boots_dist_normal_10 <- replicate(10, sample(distribuicao_normal, 100, replace = TRUE)) 

# calculando as média com bootstrapping de 10 e de 100 amostras de 100 casos
media_10_amostras <-replicate(10, mean(sample(distribuicao_normal, 100, replace = TRUE))) 
print(media_10_amostras)

media_100_amostras <-replicate(100, mean(sample(distribuicao_normal, 100, replace = TRUE)))
print(media_100_amostras)

# Comparando com a média real
mean(media_10_amostras) # média do boostraping de 10 amostras

mean(media_100_amostras) # média do boostraping de 100 amostras

mean(distribuicao_normal) # média real
