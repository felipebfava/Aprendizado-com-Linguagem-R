## Classes do R
## São objetos atômicos, não se misturam se forem diferentes
## numeric - número, valor real, numeric, double
## character - texto, string, character, caracteres
## logical - lógico, booleano, valor TRUE/FALSE

nome <- "nome" #vetor
idade <- "idade" #vetor
cidade <- "cidade" #vetor
estado <- "estado" #vetor

# Conta o número de caracteres do objeto
nchar(nome)
nchar(idade)
nchar(cidade)
nchar(estado)

# Para unir os vetores/repetí-los
paste(cidade, ",", estado)
paste(estado, estado)

# Para saber o tipo do dado
is.character(nome)
is.

# Para transformar o dado
as.numeric(idade)
as.

## Coerção de classes
gender_vector <- c("Male", "Female", "Trans", "Female", "Male", "Male", "Trans", "Lesbian", "Gay")

gender_vector <- factor(gender_vector, levels = c("Male", "Female", "Trans", "Female", "Male", "Male", "Trans", "Lesbian", "Gay"),
                        labels = c("Male", "Female", "Female", "Female", "Male", "Male", "Male", "Female", "Male"))


gender_vector <- factor(gender_vector, labels = c("Male", "Female", "Trans", "Female", "Male", "Male", "Trans", "Lesbian", "Gay"),
                        levels = c("Male", "Female", "Female", "Female", "Male", "Male", "Male", "Female", "Male"))

gender_vector
factor_gender_vector <- factor(gender_vector)
factor_gender_vector

# teste
is.character(gender_vector)
is.character(factor_gender_vector)
is.factor(gender_vector)
is.factor(factor_gender_vector)

# Para remover objetos/Values
rm(gender_vector)
rm(factor_gender_vector)

vetor1 <- c(0, 0, 1, 1, 0)

vetor2 <- c("Ensino Fundamental", "Ensino Médio", "Ensino Superior")

# Para saber o tipo do dado
class(vetor1) # interpretado como numerical
class(vetor2) # interpretado como character

as.logical(vetor1) # mudou para logical
as.factor(vetor2) # mudou para factor

# Para exibir somente letras do alfabeto latino
letters[0:26]

# Manipulação de Hora e Data
# Formato padrão de Data no R YYYY-MM-DD e Hora HH:MM:SS
# biblioteca lubridate é mais usada e simples

date <- c("27-01-2025 22:47:00")
strptime(date, format = "%d-%m-%Y %H:%M:%S")
?strptime

# retorna o dia(nome),mês, dia(número), horário atual e ano do seu local
base::date()
# retorna ano, mês e dia atual do seu local
Sys.Date()
hora <- Sys.time()
format(hora, "%H:%M:%S")

# extrair somente uma informação do objeto
format(data_hora, "%d")
format(data_hora, "%D")
format(data_hora, "%Y-%m")

