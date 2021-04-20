# Chamamos a base de dados iris
iris <- iris

# Recuperamos a coluna Petal.Length a partir da linha 67

iris_petal_length <- iris[67:150, "Petal.Length", drop = FALSE]

# Verifico se os valores desses dados que eu recuperei sao maiores do que 5

iris_petal_length > 5




