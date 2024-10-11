install.packages("arules")
library(arules)

data <- read.csv('D:\\mineria\\db_csv_\\db_csv_\\PERSONA_BDP.csv', sep=",")

data

data <- data[ , !names(data) %in% c("PEA")]
data <- data[ , !names(data) %in% c("POCUPA")]
data <- data[ , !names(data) %in% c("PEI")]

reglas <- apriori(data, parameter = list(support=0.3, confidence=0.6 ))


inspect(reglas[700:800])
inspect(reglas[900:1000])
inspect(reglas[2400:2500])
