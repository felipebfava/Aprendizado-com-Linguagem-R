# Ao trabalhar com packages, você pode importar/instalar um pacote com
# install.packages("nome do pacote/biblioteca"),
# ou usar [pacote::função] sem precisar instalar

# instalando a biblioteca/pacote tibble
install.packages("tibble")

# usando um pacote sem instalar
pessoa = tibble::tibble(
  nome = c("Daniel", "Soarez", "Juliano"),
  idade = c("30L", "24L", "25L"),
  empresa = c("Oi", "Intel", "Skynet")
)


# Trabalhando com estruturas
# do site "https://www.estrategiaconcursos.com.br/blog/ciencia-dados-linguagem-r-esquematizada/"


# Estrutura if-else if-else
a = 1
b = 1

# Para fins de exemplo, não faça tantos if-else prejudica o desempenho
soma = function(a, b) {
  if (a == 0) {
    return("valor de a precisa ser diferente de zero")
  } else if(b == 0) {
    return("valor de b precisa ser diferente de zero")
  } else {
    
    valor = a + b
  }
  return(valor)
}
soma(a, b)

# Estrutura ifelse(vetor_de_condicoes, valor_se_TRUE, valor_se_FALSE)
ifelse(c(TRUE, FALSE, FALSE, TRUE), 1, -1) # saída -> 1 -1 -1 1


# Estrutura for
# for(variável in sequência) {
#   comandos a serem repetidos
# }

for(i in 1:10) {
  print(i)
}

for(i in 1:4) {
  for (j in 1:2) {
    print(i*j)
  }
}

#jogando para uma matriz
matriz_vazia <- matrix(nrow = 4, ncol = 4)
matriz_vazia

for(i in 1:4) {
  for (j in 1:4) {
    matriz_vazia[i, j] = (i*j)
  }
}
matriz_vazia
# Em conjuntos de dados maiores é recomendado a família de funções apply
# e o pacote data.table por serem mais eficientes do que um for dentro do for

# Estrutura while
# while(condição) {
#   comandos a serem repetidos
# }

a <- 1
while(a <= 10) {
  print(a)
  a = a + 1
}

# Estrutura repeat --> usado no lugar do do-while
# estrutura do-while não tem no R, usa-se a estrutura repeat
# repeat {
#   comandos a serem repetidos
#   if(condição para que a repetição pare) break()
# }

j <- 1
repeat {
  print(j)
  j = j + 1
  if(j > 10) break()
}
# neste caso a função também incrementa no valor do objeto j
# terá que resetá-lo toda vez

# Estrutura switch-case (pesquisar)
# switch(expressão,
#     ação para caso 1,
#   comando para caso 2,
#     ...,
#   ação para caso n)

# Estrutura Switch 1
estrutura_switch <- function(x, type) {
  switch(type,
         mean = mean(x),
         median = median(x),
         trimmed = mean(x, trim = .1))
}

x <- rnorm(5)
estrutura_switch(x, "mean")
estrutura_switch(x, "median")
estrutura_switch(x, "trimmed") #média aparada

# Estrutura Switch 2
dia_semana <- function(x) {
  if(x > 0 && x < 8) {
    switch (x,
      "1" = print("Domingo, Fim de semana"),
      "2" = print("Segunda-Feira, dia útil"),
      "3" = print("Terça-Feira, dia útil"),
      "4" = print("Quarta-Feira, dia útil"),
      "5" = print("Quinta-Feira, dia útil"),
      "6" = print("Sexta-Feira, dia útil"),
      "7" = print("Sábado, Fim de semana")
    )
  } else {
      return(print("Número inválido para os dias da semana"))
    }
}

dia_semana(1)
dia_semana(3)
dia_semana(6)
dia_semana(10)

# Estrutura tryCatch
# tryCatch(
#   tenta fazer isso
#   expr = {
#     alguma expressão
#   },
#   se ocorrer um aviso, diga-me o aviso
#   warning = function(w) {
#     message('Ocorreu um aviso')
#     imprimir(w)
#     return(NA)
#   },
#   se ocorrer um erro, diga-me o erro
#   error = function(e) {
#     message('Ocorreu um erro')
#     imprimir(e)
#   },
#   finally = function(parâmetros) {
#     ações
#   }
# )

log_e_dividir <- function(x, y) {
  tryCatch (
    {
      resultado = log(x) / y
      return(resultado)
    },
    erro = function(e) {
      message("Ocorreu um erro")
      print(e)
    },
    warning = function(w) {
      message('Ocorreu um aviso')
      print(w)
      return(NA)
    }
  )
}

log_e_dividir(10, 2) # certo
log_e_dividir(10) # erro
log_e_dividir(-10, 2) # warning

# Comando 'next' usado para interromper uma iteração de um laço

x <- c(10:30) # 21 valores
n <- length(x)
soma <- 0
i = 0
for(i in 1 : n) { # loop de 1 até 21
  if (i < 10) { #valores menores que 15 não somarão, valor de i será 9
    next #irá começar com valores maiores do que os da condição no if
  }
  soma = soma + x[i]
  # primeira iteração 0 = 0 + 19 == 19
  # segunda iteração 19 = 19 + 20 == 39
  # terceira iteração 39 = 39 + 21 == 60
  print(paste("i = ", i, ", x[", i,"] = ", x[i], ", soma = ", soma))
}
# mesmo resultado que a função abaixo
sum(x[10:length(x)])

# Listas simples

list("Cris", 37L, 1.54)

# Listas dentro de listas (segunda dimensão)

list("Cris", 37L, 1.54, list("Barra", "RJ")) # em 37L -> L representa o tipo integer

# Matrizes

matrix(2:9, nrow = 1, ncol = 9)
# 2:9 são 8 números, a multiplicação do nrow com o ncol precisa ser 8
# para não dar mensagem de aviso na criação de matriz: (qtd números = nrow * ncol)
# matrix(valor em cada casa (números de 2 a 9), qtd linhas, qtd colunas)

matrix(1:-10, nrow = 1, ncol = 12)
# funciona com números negativos

vetor <- c(2,3)
print(var(vetor)) # cálculo da variância
