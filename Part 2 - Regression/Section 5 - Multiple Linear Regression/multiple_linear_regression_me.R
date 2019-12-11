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

# Backward Elimination Steps
# step 1: take all independent variables for fitting model
# step 2: check P values of all independent varibales and take 
#         maximum of all the independent variable and check 
#         whether if maximum value is > S ie Significance, 
#         if greater than remove it from set of independent 
#         variables and repeat this step until there is no more this case.
# step 3: if there is no more such independent variables which 
#         has less significance then the model finally created 
#         will be optimal model. 

regressor = lm(formula = Profit ~ R.D.Spend + Administration + 
                 Marketing.Spend + State,
               data = dataset)
summary(regressor)
regressor = lm(formula = Profit ~ R.D.Spend + Administration + 
                 Marketing.Spend,
               data = dataset)
summary(regressor)
regressor = lm(formula = Profit ~ R.D.Spend + 
                 Marketing.Spend,
               data = dataset)
summary(regressor)
regressor = lm(formula = Profit ~ R.D.Spend, 
               data = dataset)
summary(regressor)