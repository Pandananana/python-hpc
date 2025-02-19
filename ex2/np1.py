import numpy as np

def magnitude(arr):
    return np.linalg.norm(arr)

arr = np.array([1, 1, 3, 3, 4])
print(magnitude(arr))