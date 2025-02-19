import sys
import numpy as np
from time import perf_counter

file_path = sys.argv[1]
file = np.load(file_path)

p = int(sys.argv[2])

files = [file] * (p+1)

start_time = perf_counter()
res = np.linalg.multi_dot(files)
end_time = perf_counter()

print(end_time - start_time)
np.save("np5", res)