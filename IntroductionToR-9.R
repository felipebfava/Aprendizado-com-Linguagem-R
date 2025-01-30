# Diferença entre '=' e '<-' é nenhuma
# por convenção recomenda-se '<-' nas atribuições de variável
# em funções usar o '<-' pode dar erro.

# Você pode importar um pacote -> install.packages("nome do pacote/biblioteca"),
# ou usar [pacote::função]

# instalando a biblioteca/pacote
install.packages("tibble")

# usando um pacote sem instalar
pessoa = tibble::tibble(
  nome = c("Daniel", "Soarez", "Juliano"),
  idade = c("30L", "24L", "25L"),
  empresa = c("Oi", "Intel", "Skynet")
)

# Criando funções
# Chamada de função

# Exemplo 1
# Não precisa passar parâmetro
primeira_funcao = function(a) {
  print("Olá Mundo")
}

primeira_funcao()

segunda_funcao <- function(a) { # objeto(a) declarado na função tem que ser usado dentro dela
  print(a)
}

# Exemplo 2
# Passando parâmetro
segunda_funcao(10) # certo, pois só temos 1 argumento na função
segunda_funcao(a = "Olá") # certo
segunda_funcao(a <- "Olá") # certo, mesma coisa usando '=' ou '<-'
segunda_funcao(b = "Olá") # errado
segunda_funcao(a = "Bom", b = "Olá") # errado, não temos 2 argumentos na função

# Exemplo 3

#argumentos usados
NO <- 1
t <- 2
lambda <- 0.5

#operações
lambda_t <- lambda * t
Nt <- lambda * NO
Nt

# Convertendo para uma função
terceira_funcao = function(NO, t, lambda) { #passando argumentos que iremos usar
  lambda_t = lambda * t
  Nt = lambda * NO
  print(Nt)
}

terceira_funcao(NO = 1, t = 2, lambda = 0.5) #certo, identificando cada parâmetro
terceira_funcao(1, 2, 0.5) #certo, não precisando identificar cada parâmetro

# Exercícios usando funções
# 1-Calcule o quadrado de um número

quadrado <- function(a) {
  valor = a * 2
  return(valor)
}

quadrado(1)

# 2-Soma quaisquer dois valores

soma <- function(a, b) {
  valor = a + b
  return(valor)
}

soma(2, 3)

# 3-Calcule a área de um retângulo cuja base e altura sejam conhecidos.
# Área = base x Altura -> A = b x h

calculo <- function(b, h) {
  A = b * h
  return(A)
}

calculo(1, 2)

# 4-Converta reais em euros, dado que 1 euro = 7 reais

converter <- function(reais) {
  euro = reais / 7
  return(euro)
}

converter(10)

# 5-Calcule o índice de massa corporal (IMC) a partir do peso e altura da pessoa.

imc <- function(peso, altura) {
  IMC <- peso/(altura*2)
  return(IMC)
}

imc(78, 1.80)

# 6-Calcule a porcentagem de qualquer valor, sendo o default da função 10%
# Sem valor padrão (default)
porcentagem <- function(valor, porc) { #os valores que vierem serão usados como parâmetro, sem outra opção
  resultado = valor * (porc / 100)
  return(resultado)
}

porcentagem(100, 5) #passagem certa com os dois parâmetros

# Com valor padrão (default)
porcentagem <- function(valor, porc = 10) { #parâmetro padrão (default) 10%
  resultado = valor * (porc / 100)
  return(resultado)
}

porcentagem(100) #se segundo parâmetro não informado, usa o padrão porc = 10


list("Cris", 37L, 1.54, list("Barra", "RJ")) # em 37L -> L representa o tipo integer
matrix(2:9, nrow = 1, ncol = 9)
# 2:9 são 8 números, a multiplicação do nrow com o ncol precisa ser 8
# para não dar mensagem de aviso na criação de matriz: (qtd números = nrow * ncol)
# matrix(valor em cada casa (números de 2 a 9), qtd linhas, qtd colunas)

vetor <- c(2,3)
print(var(vetor))
