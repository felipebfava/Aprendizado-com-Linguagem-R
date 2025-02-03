# Funções apply(), lapply(), sapply() e tapply()
# Para operações matemáticas/modificações em dataframes, vetores, matrizes ou listas (afins).

# Função apply()
# Quando quiser aplicar uma função em alguma linha ou coluna de uma matriz ou dataframes
# apply(nome, dimensao, operacao)
# dimensao -> 1 = linha, 2 = coluna

data <- data.frame(a = c(3, 5, 6, 7, 8),
                   b = c(23, 45, 67, 87, 98),
                   c = c(1, 2, 2, 3, 56))
data

apply(data, 1, sum) # imprime a soma de cada linha
apply(data, 2, sum) # imprime a soma de cada coluna

dados <- apply(data, 1, mean) # imprime a média de cada linha
mean(dados)

# função de arredondar os números em casas decimais
round(apply(data, 2, mean), 1) # máximo de até 5 casas após o ponto (vírgula)

# transformando o apply que retorna numerics, nesse caso, em uma lista
vector <- apply(data, 2, sd) # encontra o desvio padrão de cada coluna
as.list(vector)
class(vector)

# Funçvector# Função lapply()
# Quando quiser aplicar uma função a cada elemento de uma lista, vetor ou
# dataframe e obter uma lista como resultado
# lapply(nome, operacao)

# encontra a média de cada coluna e retorna como uma lista
dados <- lapply(data, mean)
dados

# multiplica o valor de cada coluna por 2 e retorna como uma lista
lapply(data, function(data) data*2)

# usando o lapply() em lista
x <- list(a=1, b=1:5, c=1:10)
x

lapply(x, sum) # soma de cada elemento na lista (em linha)
lista <- lapply(x, mean) # média de cada elemento na lista (em linha)
is.list(lista) # retorna TRUE

# multiplica cada elemento por 5 e retorna como uma lista
lapply(x, function(x) x*5)

# Função sapply()
# Quando quiser aplicar uma função a cada elemento de uma lista, vetor ou
# dataframe e obter um vetor em vez de uma lista
# sapply(nome, operacao)

sapply(data, mean) # média de cada coluna e retorna como vetor

# com um dataframe divide o valor de cada elemento e retorna como vetor "matrix" "array"
class(sapply(data, function(x) x/2))

# com uma lista divide o valor de cada elemento  retorna como "list"
class(sapply(x, function(x) x/2))

# Função tapply()
# Quando quiser aplicar uma função a subconjuntos de um vetor e os subconjuntos
# forem definidos por algum outro vetor, geralmente um factor
# tapply(nome, indice, operacao)
# indice -> lista de um ou mais factores

# base de dados iris do R
head(iris)

# encontra o comprimento máximo de Sepal de cada uma das três espécies
tapply(iris$Sepal.Length, iris$Species, max)

# encontra a largura média de Sepal de cada uma das três espécies
tapply(iris$Sepal.Width, iris$Species, mean)

# encontra o Petal.Width mínimo de cada uma das três espécies
tapply(iris$Petal.Width, iris$Species, min)
