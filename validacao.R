library(data.table)
library(dplyr)
library(tidyverse)
library(validate)

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

asia_countries <-c("China", "India", "Indonesia", "Pakistan", "Bangladesh", "Japan", "Philippines", "Vietnam", "Turkey", "Iran", "Thailand", "Myanmar", "South Korea", "Iraq", "Afghanistan", "Saudi Arabia", "Uzbekistan", "Malaysia", "Yemen", "Nepal", "North Korea", "Sri Lanka", "Kazakhstan", "Syria", "Cambodia", "Jordan", "Azerbaijan", "United Arab Emirates", "Tajikistan", "Israel", "Laos", "Lebanon", "Kyrgyzstan", "Turkmenistan", "Singapore", "Oman", "State of Palestine", "Kuwait", "Georgia", "Mongolia", "Armenia", "Qatar", "Bahrain", "Timor-Leste", "Cyprus", "Bhutan", "Maldives", "Brunei") # vetor que identifica países latino americanos

asia <- general_data %>% filter(location %in% asia_countries) # filtra casos apenas no vetor

asia <- asia %>% select(location, new_cases, new_deaths)

regras_asia <- validator(new_cases >= 0, new_deaths >= 0)

validacao_asia <- confront(asia, regras_asia)

summary(validacao_asia)

plot(validacao_asia)
