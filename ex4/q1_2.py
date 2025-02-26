import numpy as np

def outer(x,y):
    result = []
    for i in x:
        new_row = i * y
        result.append(new_row)

    return np.array(result)




x = np.array([1,2])
y = np.array([3,4,5])

print(outer(x,y))

