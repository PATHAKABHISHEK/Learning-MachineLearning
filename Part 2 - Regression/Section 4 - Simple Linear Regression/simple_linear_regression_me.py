# Simple Linear Regression

# importing libraries and packages
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# data pre-processing phase
dataset = pd.read_csv('Salary_Data.csv')

# creating matrix X and vector y
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values

# Converting whole dataset into training and testing set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 1/3, random_state = 0)

# there is no need for feature scaling as the model we will be 
# using further for linear regression will take care for scaling.

# fitting the linear regression model to training set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)


# predicting the test set results
y_pred = regressor.predict(X_test)

# visualizing data points and simple linear regression model
# Visulaizing Training set results
plt.scatter(X_train, y_train, color = "red")
plt.plot(X_train, regressor.predict(X_train), color = "blue")
plt.title('Salary vs Experience (Training set)')
plt.xlabel('Experience')
plt.ylabel('Salary')
plt.show()

# Visualizing Test Set results
plt.scatter(X_test, y_test, color = "red")
plt.plot(X_test, regressor.predict(X_test), color = "blue")
plt.title('Salary vs Experience (Test set)')
plt.xlabel('Experience')
plt.ylabel('Salary')
plt.show()