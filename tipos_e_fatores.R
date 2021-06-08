# Criaçao de uma variavel fatorial

frutas <- c(4, 3, 4, 2, 3, 1, 4, 2, 1, 1)
recode <- c(banana = 1, maça = 2, morango = 3, pera = 4)
(gender <- factor(frutas, levels = recode, labels = names(recode)))
 

