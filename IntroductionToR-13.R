# Manipulação de Strings
caracter1 <- "A"
caracter2 <- "a"

class(caracter1)
class(caracter2)
caracter1 == caracter2 # FALSE

txt <- "uma string é uma sequência de caracteres"
txt <- 'também pode ser utilizada com aspas simples'

txt <- "no caso de aspas duplas, usa-se 'aspas simples' na string"
txt <- 'no caso de aspas simples, usa-se "aspas duplas" na string'

txt <- "para usar \"aspas duplas\" na string é necessário usar \\"
cat(txt)

# vetor de caracteres com 5 strings vazias
arvore <- character(5)
arvore
length(arvore) # 5

# incluindo string no primeiro e terceiro elemento do vetor
arvore[1] <- "madeiras brutas"
arvore[3] <- "madeiras processadas"
arvore

## ATENÇÃO ##
# um vetor com strings vazias é diferente de um vetor sem strings
str_vazia <- "" # string vazia
char_vazio <- character(0)
str_vazia == char_vazio # logical(0) = FALSE
length()


quantidade <- 10
is.numeric(quantidade) # TRUE
quantidade <- as.character(quantidade)
class(quantidade) # character

# Se um vetor possuir número e tiver pelo menos um character, o vetor será de characteres
# os numéricos serão subtituídos para characteres pelo R fazer coerção de dados

# Strings e Matrizes

m <- rbind(c(1:5), letters[1:5])
m
class(m) # Matrix, array

# Strings e Dataframes
df1 <- data.frame(numeros = 1:5, letras = letters[1:5])
df1
class(df1)

# Como padrão da função data.frame() strings são transformadas em factores.
# Para manter strings como caracteres deve-se usar o argumento: stringAsFactors = FALSE
df1 <- data.frame(numeros = 1:5, letras = letters[1:5], stringAsFactors = FALSE)
str(df1)

# Strings e Listas
ls <- list(1:10, letters[1:5], rnorm(5), m) # 'm' para ser exibida como matriz
ls

# Para contar caracteres
nchar(c("Quantos", "caracteres?")) # 7 11 (18 caracteres, sem espaço)
nchar(c("Quantos caracteres?")) # 19 -> contou o espaço

# Para deixar strings em um mesmo formato
# toupper, deixa todo o texto em maiúscula
# e tolower deixa todo o texto em minúscula
tolower(c("TuDo Em MinÚscUla", "ABCDE"))
toupper(c("TuDo Em mAiúSCuLa", "ABCDE"))

# Recortando strings
substr("Madeiras produzem seiva, nascem de brotos.", 1, 23) # "Madeiras produzem seiva"
?substr

substring("Madeiras produzem seiva, nascem de brotos.", 26, 42) # "nascem de brotos."
?substring

# União, Intersecção, Diferença e Igualdade
vec1 <- c("algumas", "palavras", "aleatórias", "aqui")
vec2 <- c("e", "algumas", "palavras", "ali")

# União
union(vec1, vec2) # "algumas"    "palavras"   "aleatórias" "aqui"       "e"          "ali" 

# Intersecção
intersect(vec1, vec2) # "algumas"  "palavras"

# Diferença
setdiff(vec1, vec2) # "aleatórias" "aqui"
# palavras que estão no vec1 mas não estão no vec2

# Igualdade
identical(vec1, vec2) # FALSE
identical(vec1, vec1) # TRUE

# Verificar se tem um elemento (sequência "aqui") contido em vec1
elem <- "aqui"
elem %in% vec1 # TRUE

# Ordenação em Ordem Alfabética ou oposto
sort(vec1, decreasing = TRUE) # "palavras"   "aqui"       "algumas"    "aleatórias"
?sort

# Pacote stringr facilita as coisas ao trabalharmos com strings
library(stringr)

# Para saber o tamanho de uma string
str_length("Madeiras produzem seiva, nascem de brotos") # 41

# para identificar caracter numa posição específica
txt <- c("Madeiras produzem seiva", "Madeiras nascem de brotos")

# selecionando os primerios caracteres
str_sub(txt, 1, 1) # "M" "M"
# selecionando o segundo caracter de trás para frente
str_sub(txt, 2, -2) # "adeiras produzem seiv"   "adeiras nascem de broto"

# Incluindo caracter ou string numa posição específica
str_sub(txt, 1, 8) <- "MADEIRAS"
txt

# Preencher string em tamanho fixo
# por padrão: left (esquerda)
str_pad(txt, 50) # coloca 50 espaços na esquerda de cada string

# Remove espaço extra
txt <- str_pad(txt, 50) # por padrão: left (esquerda)
str_trim(txt)

# Recortando uma string para obter parte da sequência de caracteres
str_sub(txt, start = 3, end = 11)

# recorte de trás para frente
str_sub(txt, start = -22, end = -1)

# extração de palavras
word(txt, 2)
word(txt, -2)
