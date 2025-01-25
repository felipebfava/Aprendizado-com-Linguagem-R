# Instalando pacotes

## Op??o 1: atrav?s de "packages" no canto inferior direito

## Op??o 2:
install.packages("dplyr")

## Op??o 3:
if(!require(dplyr))
  install.packages("dplyr")


#################### Carregando pacotes ####################

library(car)
require(dplyr)



############### Carregando o banco de dados ###############

# Passo 1: selecionar o diret?rio de trabalho (working directory)


## Op??o 1 - Manualmente: Session > Set Working Directory > Choose Directory

## Op??o 2:
setwd("C:/Users/ferna/Desktop")

# ou Função escolher arquivo (para saber o local do arquivo)
file.choose()

# Passo 2: carregar o banco de dados

dados <- read.csv('Banco de Dados 2.csv', sep = ';', dec = ',',
                  stringsAsFactors = T, fileEncoding = "latin1")

# ou - dados é um Dataframe
## read.csv() funciona para arquivos csv separados por vírgula
## use read.csv2(file.choose()) para arquivos csv separados por ponto-e-vírgula
dados = read.csv(file.choose())
dados

## Outra opcão:
dados <- read.csv2('Banco de Dados 2.csv', stringsAsFactors = T,
                   fileEncoding = "latin1")

# Lendo arquivos xls/xlsx - excel
install.packages("readxl")
library(readxl)

df_excel = read_excel(file.choose())
df_excel

## Funcões para visualizar o banco de dados:
View(dados)
glimpse(dados)
