## Teste T para duas amostras ##
# Arquivo Banco de Dados 3 (.csv)

# Passo 1: Carregar os pacotes que serão usados
library(dplyr)

# Novos pacotes
## Teste de Levene - estatística inferencial
# usado para avaliar igualdade de variâncias calculada para dois ou mais grupos
install.packages("car")
library(car)

install.packages("RVAideMemoire")
library(RVAideMemoire)

# Passo 2: Carregar o banco de dados
# Importante: Selecionar o working directory
# o Banco de Dados precisa estar no mesmo diretório
# Manualmente: Session > Set Working Directory > Choose Directory
dados <- read.csv2('Banco de Dados 3.csv', stringsAsFactors = T,
                   fileEncoding = "latin1")

## Funcões para visualizar o banco de dados:
View(dados)
glimpse(dados)

# Passo 3: Verificação da normalidade dos dados
# Teste de Shapiro-Wilk por grupo (pacote RVAideMemoire)
# avalia se uma distribuição dos dados se aproxima de uma distribuição normal (distribuição gaussiana)

# byf.shapiro(variável dependente ~ variável independente, nome da tabela)

byf.shapiro(Nota_Biol ~ Posicao_Sala, dados)
# apresenta distribuição normal das notas
# distribuição normal dos dados -> p > 0.05
# distribuição anormal dos dados -> p <= 0.05

byf.shapiro(Nota_Fis ~ Posicao_Sala, dados)
# apresenta distribuição normal das notas

byf.shapiro(Nota_Hist ~ Posicao_Sala, dados)
# apresenta distribuição normal das notas

# Passo 4: Verificação da homogeneidade de variâncias
## Teste de Levene
# leveneTest(variável dependente ~ variável independente, nome da tabela, center = mean)

leveneTest(Nota_Biol ~ Posicao_Sala, dados) # baseado na mediana

# Variâncias dos grupos são homogêneas -> p > 0.05
# Variâncias dos grupos são homogêneas -> p <= 0.05

leveneTest(Nota_Biol ~ Posicao_Sala, dados, center = mean) # baseado na média
leveneTest(Nota_Fis ~ Posicao_Sala, dados, center = mean) # baseado na média
leveneTest(Nota_Hist ~ Posicao_Sala, dados, center = mean) # baseado na média

# Observação:
# por default, o teste realizado pelo pacote car tem como base a mediana, mais robusto

# Passo 5: Realização do teste t para amostras independentes

# t.test(variável dependente ~ variável independente, tabela, var.equal = TRUE)

t.test(Nota_Biol ~ Posicao_Sala, dados, var.equal = TRUE) # variância = true
t.test(Nota_Fis ~ Posicao_Sala, dados, var.equal = FALSE)
t.test(Nota_Hist ~ Posicao_Sala, dados, var.equal = FALSE)

# média do grupo A = média do grupo B -> p > 0.05
# média do grupo A != média do grupo B -> p <= 0.05

# Observação:
# O teste bicaudal é o default; caso deseje unicaudal, inclua:
# alternative = "greater" ou alternative = "less"
# Exemplo: t.test(Nota_Biol ~ Posicao_Sala, dados, var.equal = TRUE, alternative = "greater")
# Nesse caso o teste verifica se a média do primeiro grupo é maior que a média do segundo

# Passo 6: (opcional): Visualização da distribuição dos dados
par(mfrow=c(1,3))
boxplot(Nota_Biol ~ Posicao_Sala, data = dados, ylab = "Notas de Biologia", xlab = "Posição na Sala")
boxplot(Nota_Fis ~ Posicao_Sala, data = dados, ylab = "Notas de Física", xlab = "Posição na Sala")
boxplot(Nota_Hist ~ Posicao_Sala, data = dados, ylab = "Notas de História", xlab = "Posição na Sala")
