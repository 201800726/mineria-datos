install.packages("rpart")
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)

hogares <- read.csv('D:\\mineria\\db_csv_\\db_csv_\\HOGAR_BDP.csv', sep=",")

arbol <- rpart(PCH9_I ~
                 ZONA+
                 AREA+
                 PCH1+
                 PCH4+
                 PCH6+
                 PCH8+
                 PCH9_H,
               data = hogares, method = "class")

rpart.plot(arbol, type=2, extra=0, under = TRUE, fallen.leaves = TRUE, box.palette = "BuGn", 
           main ="Internet en el hogar", cex = 1)
