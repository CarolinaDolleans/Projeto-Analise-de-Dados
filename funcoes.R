# Criei uma função que retorna a média de x menos x ou o x menos
# a média em função do valor de x
funcao_iris <- function(x) {
  if (x > 3) {
  x <- mean(x) - x
  } else
  x <- x - mean(x)
  return(x)
}

# Teste da função
funcao_iris(iris$Sepal.Width)
