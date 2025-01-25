
# Carregando dados myfitnesspal - aplicativo de bem estar
dados = read.csv(file.choose())
dados

### Eu não possuo dados desse app, então peguei outros e deixei
### as colunas em NA para testes

# deixando a coluna de tempo como NA (representa o booleano 0 ou 1)
df$tempo <- NA
df
str(df)

sexo = c("M", "F", "M", "F", "F")
df$sexo = sexo

# Tirando o salário de João
df[1,3] <- NA
df

# Biblioteca skimr
install.packages("skimr")
library(skimr)

# Gerando relatório do dataframe - skim()
skim(df)


# Verificação de dados com gráficos
# Usando os dados do conjunto mtcars (disponibilizado pelo R)
# para carregar o conjunto mtcars, usa-se data(mtcars)
data(mtcars)
mtcars

# Para saber mais sobre
help("mtcars")
# ou
?mtcars

# histograma simples
hist(mtcars$mpg)

# Gráfico Quantil-Quantil para avaliar normalidade
qqnorm(mtcars$mpg)
qqline(mtcars$mpg)

# Tabelas de frequência
table(mtcars$mpg)

# Gráfico de barras - com informação da tabela
barplot(table(mtcars$gear))

# Tabela de frequência para dados contínuos
cut(mtcars$mpg, 5)
cut(mtcars$mpg, seq(10,35,5))
# criando um gráfico de barras com as frequências de 5 em 5 
barplot(table(cut(mtcars$mpg, seq(10,35,5))))


### EXTRA
# Todas as bases de dados do R
data()

# Verificar base de dados de um pacote específico
data(package = "dplyr")
data(package = "ggplot2")

# Para entender uma base de dados específica
help("PlantGrowth")
?PlantGrowth
