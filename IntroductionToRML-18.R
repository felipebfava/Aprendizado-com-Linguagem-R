# Passo 1: Feature plot - Configurando bibliotecas a serem usadas
install.packages("caret")
install.packages("RANN")

library(RANN)
library(caret)
data(iris)

# Passo 2: Mostrando os dados em iris
str(iris) # equivalente ao glimpse para mostrar dados e suas classes

# função que faz grafos reticulados (Lattice graph)
featurePlot(x = iris[,1:4], y=iris$Species, plot='pairs')

# Passo 2: Pré Processamento junto com Predição
Titanic <- read.csv("Titanic.csv")
age.mean <- mean(Titanic$Age, na.rm = TRUE)
age.sd <- sd(Titanic$Age, na.rm = TRUE)

# knnImpute é uma transformação de dados que é primeiramente configurada com base no
# método usado para estimar os valores ausentes em machine learning
pre <- preProcess(Titanic, method = "knnImpute", k = 5)
?preProcess

Titanic.imputed <- predict(pre,Titanic)
?predict
# Saída: [1] 71 47 19 NA NA NA

Titanic$Age[10:15]
Titanic.imputed$Age[10:15]*age.sd+age.mean
# Saída: [1] 71.000 47.000 19.000 47.400 27.184 43.400

# Passo 3: Data Splitting - Criação de uma partição de dados - Predição

data <- data.frame(vars = as.factor(c("Brown", "Blonde", "Black", "Red", "Grey")))
# Variável Dummy
dv <- dummyVars(~vars, data=data, fullRank = T)
?dummyVars()
cbind(data, predict(dv, data))
