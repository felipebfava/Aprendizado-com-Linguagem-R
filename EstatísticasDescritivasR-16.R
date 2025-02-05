# Estatísticas Descritivas no R

# Passo 1: Carregar os pacotes que serão usados
library(dplyr)

# biblioteca nova:
install.packages("psych")
library(psych)

# Passo 2: Carregar o Banco de Dados
# Importante: Selecionar o working directory
# o Banco de Dados precisa estar no mesmo diretório
# Manualmente: Session > Set Working Directory > Choose Directory
dados <- read.csv2('Banco de Dados 2.csv', stringsAsFactors = T,
                   fileEncoding = "latin1")

## Funcões para visualizar o banco de dados:
View(dados)
glimpse(dados)

# Para baixar o dataframe 'dados' do RStudio para seu working directory
write.csv(dados, file = "Banco de dados aulas") # arquivo separado por vírgulas
write.csv2(dados, file = "Banco de dados aulas2") # arquivo separado por ponto-e-vírgula
# nome diferente para ser reconhecido no working directory
# se você renomear o arquivo para '.csv' o excel reconhecerá e converterá para o formato '.csv'


# Tabelas de Frequências Categóricas
# Frequências Absolutas:
table(dados$Genero)
# M  F
# 15 15

table(dados$Grau_de_Instruçao)
# Fundamental       Médio    Superior
# 6          10          14

# Tabela cruzada com frequências absolutas:
table(dados$Genero, dados$Grau_de_Instruçao)

# Frequências Relativas:
prop.table(table(dados$Genero))

prop.table(table(dados$Grau_de_Instruçao)) # em porcentagem

# Tabela cruzada com frequências relativas:
prop.table(table(dados$Genero, dados$Grau_de_Instruçao))


### Medidas para variáveis quantitativas ###

# Tabela de frequências:

## Variáveis discretas:
table(dados$N_Filhos)
# 0  1  2  3  4 
# 15  7  6  1  1

prop.table(table(dados$N_Filhos))
# precisa ser feito a tabela antes para o R não fazer de cada valor na coluna N_Filhos
prop.table(dados$N_Filhos)

# Variáveis contínuas:
# Necessário criar categorias que correspondam as faixas de valor:
## Passo 1: analisar a amplitude
range(dados$Salario)

## Passo 2 (opcional): avaliar a quantidade de categorias adequada (método Sturges)
# técnica estatística utilizada para determinar o número ideal de classes em um histograma
nclass.Sturges(dados$Salario) # 6

## Passo 3: criação da tabela com as faixas
table(cut(dados$Salario, seq(0, 6, l = 7))) # 'l' deve de ser a largura

# Função summary - fornece média, mediana, quartis e valores mín e máx
# mediana = 2°  quartil?

summary(dados$N_Filhos)
summary(dados$Salario)

# Função describe e describe.by (pacote 'psych') - média, desvio, erro, mediana
describe(dados$Salario)
describeBy(dados$Salario, group = dados$Genero)
describeBy(dados$Salario, group = dados$Genero:dados$Grau_de_Instruçao)

# Usando o group_by do pacote dplyr - usando o operador pipe
# use ctrl + shift + m/M = %>%
tabela <- dados %>% group_by(Genero, Grau_de_Instruçao) %>%
  summarise(
    média = mean(Salario),
    DP = sd(Salario),
    mediana = median(Salario)
)
tabela

?summarise
