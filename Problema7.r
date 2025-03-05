# Instalar y cargar librería necesaria
install.packages("ggplot2")  # Solo si no está instalada
library(ggplot2)

# Parámetros del sistema
mu <- 15  # Tasa de servicio (alertas por hora)
lambda_values <- seq(1, 14, by=1)  # Rango de valores para lambda

# Cálculo de métricas para cada lambda
rho_values <- lambda_values / mu
L_q_values <- (lambda_values^2) / (mu * (mu - lambda_values))
W_q_values <- L_q_values / lambda_values
W_values <- W_q_values + (1 / mu)

# Resultados para el caso específico lambda = 10
lambda <- 10
P_Wq <- lambda / mu
L_q <- (lambda^2) / (mu * (mu - lambda))
W_q <- L_q / lambda

# Imprimir resultados específicos
cat("1) Probabilidad de que haya alertas en espera: ", P_Wq, "\n")
cat("2) Número medio de alertas en espera: ", L_q, "\n")
cat("3) Tiempo medio en la cola (en horas): ", W_q, "horas\n")
cat("   Tiempo medio en la cola (en minutos): ", W_q * 60, "minutos\n")

# Graficar tiempo en el sistema y en la cola en función de lambda
data <- data.frame(lambda_values, W_q_values, W_values)

ggplot(data, aes(x=lambda_values)) +
  geom_line(aes(y=W_q_values, color="Tiempo en cola Wq"), size=1) +
  geom_line(aes(y=W_values, color="Tiempo total en el sistema W"), size=1) +
  labs(title="Tiempo medio en la cola y en el sistema en función de λ",
       x="Tasa de llegadas (λ) [alertas/hora]", 
       y="Tiempo medio (horas)") +
  scale_color_manual(values=c("Tiempo en cola Wq"="red", "Tiempo total en el sistema W"="blue")) +
  theme_minimal()
