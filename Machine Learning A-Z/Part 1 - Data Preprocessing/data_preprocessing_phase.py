# Data Preprocessing Phase

# importing libraries required in future
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# importing dataset to be used
dataset = pd.read_csv('Data.csv')

# here X is independent variable
X = dataset.iloc[:, 0:3].values

# here y is dependent variable
y = dataset.iloc[:, 3].values

# Taking Care of missing values using mean as strategy
from sklearn.preprocessing import Imputer

imputer = Imputer(missing_values = "NaN", strategy = "mean", axis = 0)
X[:, 1:3] = imputer.fit_transform(X[:, 1:3])

# Converting Categorical data into numeric form
from sklearn.preprocessing import LabelEncoder, OneHotEncoder

# Encoding Independent variable
labelencoder_X = LabelEncoder()
X[:, 0] = labelencoder_X.fit_transform(X[:, 0])
onehotencoder = OneHotEncoder(categorical_features = [0])
X = onehotencoder.fit_transform(X).toarray()

# Encoding dependent variable
labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)

# Splitting Data in training and testing set
from sklearn.model_selection import train_test_split
train_X, test_X, train_y, test_y = train_test_split(X, y, test_size = 0.2, random_state = 0)

# This is optional as most models do this process one their own
# feature scaling
from sklearn.preprocessing import StandardScaler

sc_X = StandardScaler()
train_X = sc_X.fit_transform(train_X)
test_X = sc_X.transform(test_X)

sc_y = StandardScaler()
train_y = sc_y.fit_transform(train_y)










