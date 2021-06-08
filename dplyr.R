library(dplyr)

iris <- iris

# sumários
count(iris, Species) 

# sumários com agrupamentos
iris %>% 
  group_by(Species) %>% 
  summarise(avg = mean(Sepal.Width))

### Transformação de Casos

# seleção de casos
iris %>%  
  filter(Species != "versicolor") %>% 
  group_by(Species, Sepal.Length) %>% 
  summarise(avg = mean(Petal.Length))

### Transformação de Variáveis

# Nova coluna
iris %>% 
  mutate(ratio = Sepal.Width/Sepal.Length)
