
# operador pip %>%
# a ideia do operador %>% (pipe) é bem simples: usar o valor resultante da expressão
# do lado esquerdo como primeiro argumento da função do lado direito.


# Exemplo 1: Vamos calcular a raiz quadrada da soma dos valores de 1 a 4. Primeiro, sem o pipe.
x <- c(1, 2, 3, 4)
sqrt(sum(x))

# Agora com o pipe
x %>% sum() %>% sqrt()


?magrittr::divide_by()
# Exemplo 2: Reescreva usando pipe na função
round(mean(sum(1:10)/3), digits = 1)

# Com pipe
sum(1:10) %>%
magrittr::divide_by(3) %>%
mean(, digits = 1) %>%
round()

# Exemplo 3: Reescreva o seguinte usando pipe
x <- rnorm(100)
x.pos <- x[x>0]
media <- mean(x.pos)
saida <- round(media, 1) #comando round define quantas casas aparecerão (ele arredonda)

# Com pipe
x <- rnorm(100)
saida <- x %>%
  .[.>0] %>%
  mean() %>%
round(1)
saida

# Funções no R
# função condicional de parâmetros
maior = function(a,b) {
  if(a<b){
    return(b)
  } else {
    return(a)
  }
}

a = 4
b = 5
maior(a,b) # chamando a função criada

# neste caso, a ordem dos parâmetros não afeta o resultado final
maior(a,b) == maior(b,a) # TRUE
