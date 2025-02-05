# Representação dos nomes dos meses em inglês em uma string
month.name

# conteúdo pego do site (devidas referências)
# https://cran.r-project.org/web/packages/stringr/vignettes/regular-expressions.html
# obrigado pelo conteúdo

# Instalando o pacote tidyverse
# Usado para análise de dados, os seguintes pacotes estão incluídos:
# ggplot2 criação de gráficos
# dplyr manipulação dos dados
# tidyr obter dados
# readr ler dados csv, tsv e fwf
# purrr para funções e vetores
# tibble para dataframes
# stringr para strings
# forcats para factores
# lubridate para trabalhar com data-hora

install.packages("tidyverse")
library(tidyverse)

# Expressões Regulares - regex ou regexp
# Usada para extrair partes de Strings
# padrão fruit é uma string que contêm nomes de frutas em inglês
str_extract(fruit, "banana") # banana
str_extract(fruit, regex("pear")) # pera
str_extract(fruit, "watermelon") # melancia

# Colocando de outro jeito
x <- c("apple", "banana", "pear")
str_extract(x, "a")

bananas <- c("banana", "Banana", "BANANA")
str_detect(bananas, "banana")

# O R diferencia letras maiúsculas de minúsculas em strings
# o 'ignore_case = TRUE' ignora isso
str_detect(bananas, regex("banana", ignore_case = TRUE))

# extraindo qualquer sequência em que a letra 'a' esteja no meio
str_extract(x, ".a.")

# o '.' corresponde a qualquer caracter, se em uma sequência tiver presente o '.' em si
# teremos que usar o '\' porém, é usado como um símbolo de escape para strings
# e o R não deixa

dot <- "\." # Erro: '\.' is an unrecognized escape in character string (<input>:1:10)

# Teremos que fazer então, com 2 contrabarras '\\' para o R entender como 1 só
dot <- "\\."
writeLines(dot) # \.

# Exemplo mais claro disso acontecendo
# ache a sequência a.c nessa combinação de strings
str_extract(c("abc", "a.c", "bef"), "a\\.c")

x <- "a\\b"
writeLines(x) # a\b

str_extract(x, "\\\\") # "\\"

# Existe uma série de padrões que corresponde a mais de um caracter
# o '.' que corresponde a qualquer caractere (exceto nova linha)
# o operador '\X' corresponde a um cluster de grafemas
# conjunto de elementos individuais que formam um único símbolo
# Para representar o 'á' é a letra 'a' mais um acento
# o 'o' corresponde ao 'a' enquanto o '\X' corresponde ao acento

x <- "a\u0301"
writeLines(x) # á
str_extract(x, ".") # "a"
str_extract(x, "\\X") # "á"

# '\d' corresponde a qualquer dígito. O complemento '\D' corresponde a qualquer
# caractere que não seja um dígito decimal
str_extract_all("1 + 2 = 3", "\\d+")

# '\d' inclui qualquer caracter na categoria Unicode de Nd ("Número, Dígito Decimal"),
# que também inclui símbolos numéricos de outros idiomas

# Isso ficou meio bugado no R, mas é a representação de
# '1 2 3' ao idioma Khmer (língua oficial de Camboja - google tradutor)
str_detect("១២៣","\\d") # TRUE

# '\s' corresponde a qualquer espaço em branco. Inclui tabulações, novas linhas,
# avanços de formulário e qualquer caracter na categora Z do Unicode
# '\S' corresponde a qualquer caractere que não seja espaço em branco.
(text <- "Some  \t badly\n\t\tspaced \f text")
str_replace_all(text, "\\s+", " ")

# '\w' corresponde a qualquer caractere "palavra", que inclui caracteres alfabéticos,
# marcas e números decimais.
# \W, corresponde a qualquer caractere não-palavra.
str_extract_all("Don't eat that!", "\\w+")
str_split("Don't eat that!", "\\W")

# '\b' corresponde aos limites das palavras, a transição entre caracteres de palavras e não palavras.
# '\B' corresponde ao oposto: limites que têm caracteres de palavras ou não palavras em ambos os lados.

str_replace_all("The quick brown fox", "\\b", "_")
str_replace_all("The quick brown fox", "\\B", "_")

# '|' é o operador de Alternância, que escolhe uma ou mais correspondências possíveis
str_detect(c("abc", "def", "ghi"), "abc|def")

# Outro jeito de usar
str_extract(c("grey", "gray"), "gre|ay") # sim, o R reconhece as cores que as palavras representam
str_extract(c("grey", "gray"), "gr(e|a)y")

# Ou assim, com '?:...' que significa uma escolha, um ou outro.
str_match(c("grey", "gray"), "gr(e|a)y")
str_match(c("grey", "gray"), "gr(?:e|a)y")

# Âncoras, representações de início e fim de string
# '^' corresponde ao início da string.
# '$' corresponde ao final da string.
# se quiser se referir a '^' e '$' use contrabarra '\$', e '\^'.
x <- c("apple", "banana", "pear")
str_extract(x, "^a") # 'a' de 'apple' pois é o único 'a' no início de uma string
str_extract(x, "a$") # 'a' de 'banana' pois é o únio 'a' no fim de uma string

# Para strings multilinhas, você pode usar regex(multiline = TRUE).
# Isso muda o comportamento de ^and $, e introduz três novos operadores:
# '^' agora corresponde ao início de cada linha.
# '$' agora corresponde ao final de cada linha.
# '\A' corresponde ao início da entrada.
# '\z' corresponde ao final da entrada.
# '\Z' corresponde ao final da entrada, mas antes do terminador de linha final, se existir.

x <- "Line 1\nLine 2\nLine 3\n"
str_extract_all(x, "^Line..") # "Line 1"
str_extract_all(x, regex("^Line..", multiline = TRUE)) # "Line 1" "Line 2" "Line 3"
str_extract_all(x, regex("\\ALine..", multiline = TRUE)) # "Line 1"

# Repetição de caracteres
# ?: 0 ou 1.
# +: 1 ou mais.
# *: 0 ou mais.
x <- "1888 is the longest year in Roman numerals: MDCCCLXXXVIII"
str_extract(x, "CC?") # "CC"
str_extract(x, "CC+") # "CCC"
str_extract(x, 'C[LX]+') # "CLXXX"

# Você também pode especificar o número de correspondências com precisão:
# {n}: exatamente n
# {n,}: n ou mais
# {n,m}: entre n e m
str_extract(x, "C{2}") # "CC"
str_extract(x, "C{2,}") # "CCC"
str_extract(x, "C{2,3}") # "CCC"

# Por padrão, corresponderão à string mais longa possível, porém
# pode corresponder à string mais curta possível colocando um '?' depois delas:
# ??: 0 ou 1, prefira 0.
# +?: 1 ou mais, combine o mínimo de vezes possível.
# *?: 0 ou mais, combine o mínimo de vezes possível.
# {n,}?: n ou mais, combine o mínimo de vezes possível.
# {n,m}?: entre n e m, , correspondem o mínimo de vezes possível, mas pelo menos n.
str_extract(x, c("C{2,3}", "C{2,3}?")) # "CCC" "CC" 
str_extract(x, c("C[LX]+", "C[LX]+?")) # "CLXXX" "CL"

# Você também pode tornar as correspondências possessivas colocando um + depois delas,
# o que significa que se partes posteriores da correspondência falharem,
# a repetição não será tentada novamente com um número menor de caracteres.
# Esse é um recurso avançado usado para melhorar o desempenho em cenários de pior caso
# (chamado de “backtracking catastrófico”)
# ?+: 0 ou 1, possessivo.
# ++: 1 ou mais, possessivo.
# *+: 0 ou mais, possessivo.
# {n}+: exatamente n, possessivo.
# {n,}+: n ou mais, possessivo.
# {n,m}+: entre n e m, possessivo.
# Um conceito relacionado é o parêntesis atomic-match(?>...) , .
# Se uma correspondência posterior falhar e o mecanismo precisar voltar atrás,
# uma correspondência atômica é mantida como está: ela é bem-sucedida ou falha como um todo.
str_detect("ABC", "(?>A|.B)C") # FALSE
str_detect("ABC", "(?:A|.B)C") # TRUE

# A correspondência atômica falha porque corresponde a A,
# e então o próximo caractere é um C, então falha.
# A correspondência regular é bem-sucedida porque corresponde a A,
# mas então C não corresponde, então volta atrás e tenta B em vez disso.


## do inglês Look arounds (olhe ao redor) ##

# Essas afirmações olham para frente ou para trás da partida atual sem “consumir”
# nenhum caractere (ou seja, alterar a posição de entrada).

# (?=...): afirmação de look-ahead positiva. Corresponde se ...corresponde à entrada atual.

# (?!...): asserção negativa de look-ahead. Corresponde se ... não corresponder na entrada atual.

# (?<=...): afirmação positiva look-behind. Corresponde se ...corresponde ao texto
# que precede a posição atual, com o último caractere da correspondência sendo o caractere imediatamente
# anterior à posição atual. O comprimento deve ser limitado (ou seja, no *ou +).

# (?<!...): asserção negativa look-behind. Corresponde se ... não corresponder ao texto
# que precede a posição atual. O comprimento deve ser limitado (ou seja, no *ou +).

# Elas são úteis quando você deseja verificar se um padrão existe, mas não deseja incluí-lo no resultado

x <- c("1 piece", "2 pieces", "3")
str_extract(x, "\\d+(?= pieces?)") # "1" "2" NA

y <- c("100", "$400")
str_extract(y, "(?<=\\$)\\d+") # NA    "400"

# Comentários
# Existem duas maneiras de incluir comentários em uma expressão regular. A primeira é com (?#...)
str_detect("xyz", "x(?#this is a comment)") # TRUE

# O segundo é usar regex(comments = TRUE). Este formulário ignora espaços e quebras de linha,
# e qualquer coisa depois de #. Para corresponder a um espaço literal,
# você precisará escapá-lo: "\\ ". Esta é uma maneira útil de descrever expressões regulares complexas
phone <- regex("
  \\(?       # optional opening parens
  (\\d{3})   # area code
  \\)?       # optional closing parens
  (?:-|\\ )? # optional dash or space
  (\\d{3})   # another three numbers
  (?:-|\\ )? # optional dash or space
  (\\d{3})   # three more numbers
  ", comments = TRUE)
str_match(c("514-791-8141", "(514) 791 8141"), phone)
