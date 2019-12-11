# Simple Linear Regression

# data pre-processing phase

# importing dataset
dataset = read.csv('Salary_Data.csv')

# splitting data into training and test set
library(caTools)
set.seed(1234)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# fitting simple linear regressor model to training set
regressor  = lm(formula = Salary ~ YearsExperience,
                data = training_set)

# predicting test set results
y_pred = predict(regressor, newdata = test_set)

# installing ggplot2 for visualization
# install.packages('ggplot2')
library(ggplot2)

# Visualizing training set results
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), 
             colour = "red") +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, training_set)), 
            colour = "blue") + 
  ggtitle('Salary vs Experience (Training Set)') + 
  xlab('Years of Experience') +
  ylab('Salary')

# Visualizing test set results
ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), 
             colour = "red") + 
  geom_line(aes(x = test_set$YearsExperience, y = predict(regressor, test_set)),
            colour = "blue") + 
  ggtitle('Salary vs Experience (Test Set)') + 
  xlab('Years of Experience') + 
  ylab('Salary')

