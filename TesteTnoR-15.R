# Teste - T para uma amostra no R

# Passo 1: Carregar os pacotes que serão usados
library(dplyr)

# Passo 2: Carregar o Banco de Dados
# Importante: Selecionar o working directory
# o Banco de Dados precisa estar no mesmo diretório
# Manualmente: Session > Set Working Directory > Choose Directory
# O arquivo já está em .csv

dados <- read.csv2('Banco de Dados 2.csv', stringsAsFactors = T,
                   fileEncoding = "latin1")

## Funcões para visualizar o banco de dados:
View(dados)
glimpse(dados)

## Funções adicionais caso a tabela bugue ##
# Transformando Gênero em fator:
dados$Genero <- factor(dados$Genero, label = c("M", "F"), levels = c(0, 1))

# Fazendo desse jeito os dados dessa coluna ficarão do tipo '<ord>' (order)
dados$Grau_de_Instruçao <- factor(dados$Grau_de_Instruçao,
                                  label = c("Fundamental", "Médio", "Superior"),
                                  levels = 0:2, order = TRUE)

# Passo 3: Verificação da normalidade de dados
# Teste de Shapiro-Wilk tem o objetivo de avaliar uma distribuição de dados
# que se aproxima de uma distribuição normal

# H0 - distribuição dos dados = normal
# H1 - distribuição dos dados != normal (anormal)

shapiro.test(dados$Altura) # W = 0.95384, p-value = 0.214
# logo, os dados têm distribuição normal

# Passo 4: Realização do teste T para uma amostra
# Teste T de Student usado quando queremos tirar conclusões de um
# grupo inteiro de indivíduos com base em apenas uma pequena amostra coletada.
# Info: A média de altura nacional Brasileira é 1,67m ou 167cm
# 'mu' indica o valor verdadeiro da média (ou diferença nas médias se tiver duas amostras)
t.test(dados$Altura, mu = 167) # mean of x # 168.4333
?t.test

# H0 - média da amostra = valor de referência
# H1 - média da amostra != valor de referência

# Observação:
# O teste bicaudal é o default; caso deseje unicaudal, inclua:
# alternative = "greater" ou alternative = "less"
# Exemplo: t.test(dados$Altura, mu = 167, alternative = "greater")
# Nesse caso o teste verifica se a média amostral é maior que a média testada

# Passo 5 (opcional): Visualização da distribuição dos dados
boxplot(dados$Altura, ylab = "Altura (cm)") # 'ylab' - rótulo do eixo y
