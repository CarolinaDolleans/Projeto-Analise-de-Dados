# Aplicando as funções da família apply
lapply(iris[1:3, -5], median) 

# Tentei criar uma função de repetiçao para fazer um gráfico em pontos, mas não 
# funcionou...

funçao_iris_2 <- function(x,y) {
  for (i in 1:4) { 
  x <- iris[ , i]
  y <- iris[i,]
  plot(y ~ x,
       main = names(iris)[i], 
       xlab = "Eixo X",
       ylab = "Eixo Y",
       col = "blue")
  }
}
