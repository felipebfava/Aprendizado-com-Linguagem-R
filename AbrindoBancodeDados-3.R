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

# Passo 1: selecionar o diretório de trabalho (working directory)


## Opção 1 - Manualmente: Session > Set Working Directory > Choose Directory

## Opção 2:
# setwd("C:/Users/User/OneDrive/Área de Trabalho/")
setwd("C:\\Users\\User\\OneDrive\\Área de Trabalho\\Banco de Dados 2.csv")

# ou Função escolher arquivo (para saber o local do arquivo)
dados <- file.choose("C:\\Users\\User\\OneDrive\\Área de Trabalho\\Banco de Dados 2.csv")

# Passo 2: carregar o banco de dados - ele deve estar no mesmo diretório de trabalho escolhido
# ou informe no nome, o caminho como se fosse o setwd 
dados <- read.csv('Banco de Dados 2.csv', sep = ';', dec = ',',
                  stringsAsFactors = TRUE, fileEncoding = "latin1")

# ou
# dados é um Dataframe
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

## Ajustando variáveis ##
##
## O termo Factor se refere a um tipo de dado estatístico usado para armazenar
## variáveis categóricas. A diferença entre uma
## variável categórica (corresponde a alguns valores/escolhas) e uma
## variável contínua (pode corresponder a um número infinito de valores/escolhas)
## é por exemplo: variável categórica Gênero: Macho() ou Fêmea(), possui somente 2 escolhas,
## isso é, 2 níveis de factor (factor levels)
## para mais, Veja a função ?factor()
##

# Transformando Gênero em fator:
dados$Genero # antes
dados$Genero <- factor(dados$Genero, label = c("M", "F"), levels = c(0, 1))
dados$Genero # depois

# Transformando Grau de Instrução em fator:
rm(dados)
dados$Grau_de_Instruçao
# Fazendo desse jeito os dados dessa coluna ficarão do tipo <fct> (factor)
dados$Grau_de_Instruçao <- factor(dados$Grau_de_Instruçao,
                                  label = c("Fundamental", "Médio", "Superior"),
                                  levels = 0:2, order(decreasing = FALSE))

# Mesma coisa do que o comando acima, porém, não faça os dois juntos, pois já estará modificado
# o R não entenderá a substituição e tratará como '<NA>', terá que recarregar a tabela e refazer o processo

# Fazendo desse jeito os dados dessa coluna ficarão do tipo '<ord>' (order)
dados$Grau_de_Instruçao <- factor(dados$Grau_de_Instruçao,
                                  label = c("Fundamental", "Médio", "Superior"),
                                  levels = 0:2, order = TRUE)

# Codificando valores ausentes (missing values):
dados[dados==-999] <- NA
