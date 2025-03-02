import numpy as np

def distmat_1d(x,y):
    x = x[:,None]
    y = y[None,:]
    return np.abs(x-y)




x = np.array([1,2])
y = np.array([3,0.5,1])

print(distmat_1d(x,y))

