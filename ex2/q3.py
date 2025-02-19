def sorttuples(arr):
    arr = sorted(arr, key=lambda val: val[1])
    return arr

print(sorttuples([(2, 5), (1, 2), (4, 4), (2, 3), (2, 1)]))