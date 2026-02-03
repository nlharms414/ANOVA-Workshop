set.seed(1234)

a <- rnorm(1000,10,1)
b <- rnorm(1000,20,1)
c <- rnorm(1000,30,1)

x <- seq(0, 100, length.out = 100) # sequence of x-values
a <- dnorm(x, mean = 25, sd = 10) # calculate densities
b <- dnorm(x, mean = 50, sd = 10)
c <- dnorm(x, mean = 75, sd = 10)
plot(x, a,
     type = "l", 
     main = "Theoretical Normal Density Curve",
     xlab = "Values", ylab = "Density",
     col = "red", lwd = 2) 
lines(x,b,col = "blue", lwd = 2)
lines(x,c,col = "green", lwd = 2)
abline(v = c(25,50,75), col = c("red","blue","green"), lty = 2)

library(ggplot2)

ggplot(data.frame(x = c(0,40)), aes(x = x)) +
  stat_function(fun = dnorm, args = list(mean = 10, sd = 3), color = "#E69F00", linewidth = 1.5) +
  stat_function(fun = dnorm, args = list(mean = 20, sd = 3), color = "#0072B2", linewidth = 1.5) +
  stat_function(fun = dnorm, args = list(mean = 30, sd = 3), color = "#CC79A7", linewidth = 1.5) + 
  geom_vline(xintercept = c(10,20,30), 
             color = c("#E69F00","#0072B2","#CC79A7"), 
             linetype = "dashed") +
  geom_text(data = data.frame(
    x = c(12, 22, 32),
    y = c(0.05, 0.05, 0.05),
    label = c("mu[1] == 25", "mu[2] == 50", "mu[3] == 75")),
    aes(x = x, y = y, label = label), parse = TRUE) +
  labs(x = "Plant growth (cm)") +
  theme(axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        axis.title.y = element_blank())

