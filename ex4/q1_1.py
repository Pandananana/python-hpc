import numpy as np

def standardize_rows(data, mean, std):
    return (data - mean ) / std

data = np.array([[1,2,3],[4,5,6]])
mean = np.array([0.5,1,3])
std = np.array([1,2,3])

print(standardize_rows(data,mean,std))

