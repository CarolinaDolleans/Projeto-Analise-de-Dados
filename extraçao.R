#### Staging area e uso de memória

# vamos ver quanto cada objeto está ocupando

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}

# Os arquivos que usam mais a memoria do R sao sinistrosRecifeRaw e 
# sinistrosRecife2018Raw com 11641456 e 4667656 respectivamente.


# Removendo todos os objetos menos a base final e a funçao naZero

rm(list = c('sinistrosRecife2018Raw', 'sinistrosRecife2019Raw'
            , 'sinistrosRecife2020Raw', 'sinistrosRecife2021Raw'))
