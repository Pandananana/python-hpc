import numpy as np

def outer(x,y):
    x = x[:,None]
    y = y[None,:]
    return x * y

x = np.array([1,2])
y = np.array([3,4,5])

print(outer(x,y))

