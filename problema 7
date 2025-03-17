# Cargar la librería
library(queueing)
library(ggplot2)
# Definir los parámetros del sistema M/M/1
lambda <- 10  # Tasa de llegadas 
mu <- 15      # Tasa de servicio 
c <- 1        # Número de servidores (M/M/1)

# Crear el modelo M/M/1
i_mm1 <- NewInput.MM1(lambda=lambda, mu=mu)
o_mm1 <- QueueingModel(i_mm1)

# Generar el reporte con los resultados
Report(o_mm1)


#GRAFICA 
# Definir parámetros base
mu <- 15  # Tasa de servicio (alertas procesadas por hora)
c <- 1    # Número de servidores (M/M/1)

# Rango de valores de lambda (tasa de llegada) para la gráfica
lambda_values <- seq(5, 14, by=1)  # De 5 a 14 alertas por hora

# Listas para almacenar resultados
Wq_values <- c()  # Tiempo medio en la cola
W_values <- c()   # Tiempo medio en el sistema

# Calcular métricas para cada lambda
for (lambda in lambda_values) {
  i_mm1 <- NewInput.MM1(lambda=lambda, mu=mu)
  o_mm1 <- QueueingModel(i_mm1)
  
  Wq_values <- c(Wq_values, o_mm1$Wq)  # Tiempo medio en la cola
  W_values <- c(W_values, o_mm1$W)    # Tiempo medio en el sistema
}

# Crear un dataframe con los resultados
df <- data.frame(lambda=lambda_values, Wq=Wq_values, W=W_values)

# Graficar los resultados
ggplot(df, aes(x=lambda)) +
  geom_line(aes(y=Wq, color="Tiempo en Cola"), size=1) +
  geom_line(aes(y=W, color="Tiempo en Sistema"), size=1) +
  labs(title="Tiempo medio en el sistema y en la cola en función de λ",
       x="Tasa de Llegada (λ) [alertas por hora]",
       y="Tiempo medio [horas]") +
  scale_color_manual(values=c("Tiempo en Cola"="red", "Tiempo en Sistema"="blue")) +
  theme_minimal()
