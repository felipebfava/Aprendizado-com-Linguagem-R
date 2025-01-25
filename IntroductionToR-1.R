
# Como juntar valores em um vetor
vetor = c(10,20,30,40,50)

## Comando para identificar o tipo do dado
str(vetor)

# Acessando elementos dentro do vetor por indice
vetor[4]

## Indice negativo exibe o vetor sem o numero que ocupava esse indice
vetor[-3]

# Gerando intervalos de dados do vetor
vetor[c(1,2,3)]

## Gerando intervalo de numeros inteiros de 1 a 5
1:5
# ou
seq(5)

### Alternativa para o comando acima
vetor[1:3]

# Gerando sequencia de dados
## from - inicio, to - até onde ir, by - é o passo da contagem
seq(from = 2, to = 20, by = 2)
seq(3)

### Uso do comando help
help("seq")

# Usando intervalos para acessar elementos de um vetor
vetor[seq(from = 1, to = 3, by = 1)]

# Calculos com vetores

# Operações de um vetor com escalar
vetor * 2
vetor + 5
vetor / 2
sqrt(vetor)

# Agregações (média, soma, desvio padrão)
mean(vetor)
sum(vetor)
sd(vetor)
