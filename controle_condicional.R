# Aqui, eu criei uma variavel dummy que vale 2 quando Sepal.Width
# é maior do que 3.5 e 0 quando não é
iris$Sepal.Width.Dummy <- ifelse(iris$Sepal.Width > 3.5, 1, 0)

# A seguir, criei a mesma coisa, porém, com algoritmo mais complexo

if (iris$Sepal.Width > 3.5) {
  iris$Sepal.Width.Dummy = 1
} else {
  iris$Sepal.Width.Dummy = 0
}

# não funcionou mas não entendi o que eu fiz de errado...


# Fiz um algoritmo condicional mais simples, conforme a aula

x <- runif(1, 0, 8)

if (x <= 4) {
   y <- 7
} else {
  y <- 10
}

y
x

