# Exercícios usando Switch-case

# Suponha que você esteja desenvolvendo o sistema de um hotel que deva exibir
# mensagens na recepção para diferentes ações dos hospedes, são elas:
# 1.Fazer Check-in
# 2.Chamar serviço de quarto
# 3.Fazer pedido

recepcao <- function(x = "1") {
  if(x > 0 && x < 4) {
    switch (as.character(x),
      "1" = print("Fazer Check-in"),
      "2" = print("Chamar serviço de quarto"),
      "3" = print("Fazer pedido")
    )
  } else {
    print("Número de serviço inválido")
  }
}

recepcao()
recepcao(1)
recepcao(2)
recepcao(3)

# expressões de switch são sempre interpretadas como listas, isso é
# os parâmetros serão interpretados como character
# se mandarmos um numeric (1.54), irá ser interpretado como character ("1.54")
produtos <- function(x) {
  valor <- switch(as.character(x), # para que os valores sejam sempre characteres
        "100" = {
          print("Detergente")
          valor = 1.59
        },
        "101" = {
          print("Esponja")
          valor = 4.59
        },
        "102" = {
          print("Lã de aço")
          valor = 1.79
        },
        NULL # para valores diferentes das opções dos casos
      )
  if(!is.null(valor)) {
    return(paste("R$", valor))
  } else {
    return("Produto não encontrado")
  }
}

# Desenvolva um programa que simule as 4 operações matemáticas básicas.
# A entrada para a escolha de uma das 4 operações disponíveis é dada da seguinte forma:
# Soma
# Subtração
# Multiplicação
# Divisão
# Seguida dos 2 operandos que participarão efetivamente da operação.

matematica <- function(x, y, type) {
  switch(type,
         soma = sum(x, y),
         subtracao = (x - y),
         multiplicacao = (x * y),
         divisao = (x / y),
         NULL
         )
}
matematica(2, 2, "soma")
matematica(2, 2, "subtracao")
matematica(2, 2, "multiplicacao")
matematica(2, 2, "divisao")
matematica(2, 2, "operacaoZ") # retorna NULL


# Faça um programa que calcule o “peso ideal” de um usuário de acordo com um caractere
# identificador de sexo (“M” para Masculino ou “F” para Feminino) inserido pelo mesmo.
# A fórmula para cada um dos dois casos está definida abaixo.

# Caso “M”, utilize a fórmula:
# (peso - 100) x 0,9
# Caso “F”, utilize a fórmula:
# (peso - 100) x 0,85
  
  
peso_ideal <- function(x, peso) {
  switch (x,
    "M" = ((peso - 100) * 0.9),
    "F" = ((peso - 100) * 0.85),
    NULL
  )
}

peso_ideal("M", 80)

age <- c(22, 21, 23, 42, 34, 45, 34)
ifelse(age%%2==0, "YES", "NO")
# se idade par (divide por 2) escolha 'YES' senão 'NO'
