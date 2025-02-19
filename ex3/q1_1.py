import numpy as np
from time import perf_counter

SIZE = 100

mat = np.random.rand(SIZE, SIZE)

column_start = perf_counter()
for _ in range(1000):
    double_column = 2 * mat[:, 0]
column_end = perf_counter()

row_start = perf_counter()
for _ in range(1000):
    double_row = 2 * mat[0, :]
row_end = perf_counter()

print("Column time: ", column_end - column_start)
print("Row time: ", row_end - row_start)

# They take basically the same time
# Column time:  0.0019739560084417462
# Row time:  0.001890301937237382