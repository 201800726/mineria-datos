install.packages("arules")
library(arules)
data <- read.csv("D:\\mineria\\db_csv_\\db_csv_\\MIGRACION_BDP.csv", sep = ",") 
cluster <- kmeans(data, centers=4)

install.packages("ggplot2")
library(ggplot2)

#Departamento vs. Año de Emigración:
#Esta combinación puede ser útil para identificar si en ciertos 
#departamentos hubo picos de emigración en años específicos.


ggplot(data, aes(x = DEPARTAMENTO, y = PEI5, color = as.factor(cluster$cluster)))+
  geom_point()+
  geom_point(data = as.data.frame(cluster$centers), aes(x=DEPARTAMENTO, y = PEI5), color = "black", size=4, shape=17)+
  labs(title = "Departamento vs. Año de Emigración")+
  theme_minimal()


# Rango de años de interés para filtrar
año_min <- 2005  # Año mínimo
año_max <- 2010  # Año máximo

data_filtrada <- subset(data, PEI5 >= año_min & PEI5 <= año_max)

# Realiza el clustering en los datos filtrados
cluster <- kmeans(data_filtrada[, c("DEPARTAMENTO", "PEI5")], centers = 4)  # Número de clusters

# Agrega la columna de clusters al data frame filtrado
data_filtrada$cluster <- as.factor(cluster$cluster)

# Genera la gráfica con etiquetas, rango de años filtrado, rotación en el eje x y clustering corregido
ggplot(data_filtrada, aes(x = DEPARTAMENTO, y = PEI5, color = cluster)) +
  geom_point() +
  geom_point(data = as.data.frame(cluster$centers), aes(x = DEPARTAMENTO, y = PEI5), color = "black", size = 4, shape = 17) +
  labs(title = "Departamento vs. Año de Emigración (2005 a 2010))",
       x = "Departamento", y = "Año de Emigración") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
