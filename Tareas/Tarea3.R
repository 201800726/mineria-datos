install.packages("D:/Descargas/fim4r_1.8.tar.gz", repos = NULL, type = "source")
install.packages("arules")
library(arules)
library(fim4r)

data <- read.csv("D:\\mineria\\db_csv_\\db_csv_\\MIGRACION_BDP.csv", sep = ",")

reglas <- fim4r(data, method = "fpgrowth", target="rules", supp = .2, conf = .5)

reglasframe <- as(reglas, "data.frame")
reglasframe
