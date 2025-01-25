# Criando um Dataframe

# Vetores - Base de empregados
id = c(1,2,3,4,5)
nome = c("João", "Maria", "Daniel", "Aline", "Mariana")
salario = c(1000, 2500, 2000, 3000, 3500)

# Criar o Dataframe, nome das colunas
df = data.frame(id, nome, salario)
df

# Filtrar uma linha, df[lin,col]
df[1,]
df[1:3,3]

## Identifica o tipo do dado dentro do Dataframe
str(df[1:3,3])

# Filtrar uma coluna
df[,2]
# ou df$-nome da coluna-
df$nome

# Filtrar uma linha e uma coluna
df[1,3]

# Criar uma nova coluna: tempo de empresa(em anos)
tempo = c(1, 2, 4.5, 3, 0.5)
df$tempo = tempo
df

# Operações com colunas (soma, média, desvio padrão)
sum(df$salario)
mean(df$salario)
sd(df$salario)

# Filtrando Dataframes com operadores lógicos
## Usando o mesmo Dataframe antes criado

# Operadores lógicos
1 == 1
1 != 1
1 == 1
1 > 2
3 < 5
3 >= 4
9 <= 7

1 | 1
1 & 1

# Aplicando em vetores
salario > 2000

# Aplicando em Dataframes
df[df$salario > 2000 & df$tempo > 2,]

# Mais exemplos - Base de dados do proprio R
data("mtcars")
help("mtcars")
mtcars

# Filtrar registros com mais de 4 cilindros(cyl)
mtcars[mtcars$cyl > 4,]

# Filtrar carros com motor de 4 marchas(gear) apenas
mtcars[mtcars$gear == 4,]

# Filtrar carros com menos de 3.0 pounds de peso (wt x 1000 lbs)
mtcars[mtcars$wt < 3.0,]

## Juntando
mtcars[mtcars$cyl > 4 & mtcars$gear == 4 & mtcars$wt < 3.0,]
