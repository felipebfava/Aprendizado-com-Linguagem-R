# Usando SQL no R
# Pacote sqldf
install.packages("sqldf")
library(sqldf)

# Conjunto de dados airquality
data("airquality")
airquality

# Como usar o sqldf - df vem de dataframe
## precisar carregar o comando como objeto antes de usar o sqldf
sql = "

SELECT *
FROM airquality

"
sqldf(sql)

# Filtrar no mês = 5

sql = "

SELECT *
FROM airquality
WHERE Month = 5

"

sqldf(sql)

# Calcular a média de Temp (temperatura) por Month (mês)
sql = "

SELECT
  Month,
  AVG(Temp) AS avg_Temp
FROM airquality
GROUP BY
  Month

"
sqldf(sql)
