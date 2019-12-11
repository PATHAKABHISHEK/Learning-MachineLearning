# Polynomial Regression

# data pre-processing phase
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# importing dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

# Fitting Simple Linear Regression Model to dataset
from sklearn.linear_model import LinearRegression
lin_regressor = LinearRegression()
lin_regressor.fit(X, y)

# Fitting Polynomial Linear Regression Model to dataset
from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree = 4)
X_poly = poly_reg.fit_transform(X)
poly_reg.fit(X_poly, y)
lin_regressor2 = LinearRegression()
lin_regressor2.fit(X_poly, y)

# Visualizing Linear Regression Results
plt.scatter(X, y, color = "red")
plt.plot(X, lin_regressor.predict(X), color = "blue")
plt.title('Truth or Bluff (Linear Regression)')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.show()

# Visualizing Polynomial Linear Regression Results
plt.scatter(X, y, color = "red")
plt.plot(X, lin_regressor2.predict(poly_reg.fit_transform(X)), color = "blue")
plt.title('Truth or Bluff (Polynomial Regression)')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.show()

# Visualizing Polynomial Linear Regression Results (High Resolution)
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape((len(X_grid), 1))
plt.scatter(X, y, color = "red")
plt.plot(X_grid, lin_regressor2.predict(poly_reg.fit_transform(X_grid)), color = "blue")
plt.title('Truth or Bluff (Polynomial Regression)')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.show()
