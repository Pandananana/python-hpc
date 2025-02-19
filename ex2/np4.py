import sys
import numpy as np

file_path = sys.argv[1]
file = np.load(file_path)
n, m = np.shape(file)

cols = []
rows = []

for i in range(0,n):
    rows.append(np.mean(file[i,:]))
    
for i in range(0,m):
    cols.append(np.mean(file[:,i]))

np.save("cols", cols)
np.save("rows", rows)