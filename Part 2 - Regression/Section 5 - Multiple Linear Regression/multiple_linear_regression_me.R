# Multiple Linear Regression

# data pre-processing phase
dataset = read.csv('50_Startups.csv')

# Encoding Categorical Values
dataset$State = factor(dataset$State, 
                       levels  = c('New York', 'California', 'Florida'),
                       labels  = c(1, 2, 3))

# Splitting dataset into training and test set
library(caTools)
set.seed(1234)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# fitting Multiple Linear Regressor Model to Training Set
regressor = lm(formula = Profit ~ ., 
               data = training_set)

# predicting Test set Results
y_pred = predict(regressor, newdata = test_set)
