# Polynomial Regression 

# data  preprocessing phase
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting Linear Regression Model into dataset
lin_reg = lm(formula = Salary ~ .,
             data = dataset)

# Fitting Polynomial Linear Regression Model into dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4

lin_reg2 = lm(formula = Salary ~ ., 
               data = dataset)

library(ggplot2)
# Visualizing Linear Regression Model
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = "red") + 
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = "blue") + 
  ggtitle('Truth vs Bluff (Linear Regression)') + 
  xlab('Level') + 
  ylab('Salary')

# Visualizing Polynomial Linear Regression Model
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = "red") + 
  geom_line(aes(x = dataset$Level, y = predict(lin_reg2, newdata = dataset)),
            colour = "blue") + 
  ggtitle('Truth vs Bluff (Linear Regression)') + 
  xlab('Level') + 
  ylab('Salary')

# Visualizing Polynomial Linear Regression Model (High Resolution)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = "red") + 
  geom_line(aes(x = x_grid, y = predict(lin_reg2, newdata = data.frame(Level = x_grid,
                                                                       Level2 = x_grid^2,
                                                                       Level3 = x_grid^3,
                                                                       Level4 = x_grid^4))),
            colour = "blue") + 
  ggtitle('Truth vs Bluff (Linear Regression)') + 
  xlab('Level') + 
  ylab('Salary')


# predicting a new result with Linear Regression
predict(lin_reg, data.frame(Level = 6.5))

# prediction a new result with Polynomial Regression
predict(lin_reg2, data.frame(Level = 6.5,
                             Level2 = 6.5^2,
                             Level3 = 6.5^3,
                             Level4 = 6.5^4))