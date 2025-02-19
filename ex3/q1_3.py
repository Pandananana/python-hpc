import numpy as np
from time import perf_counter

SIZES = np.logspace(1, 4.5)


for SIZE in SIZES:
    SIZE = int(SIZE)
    mat = np.random.rand(SIZE, SIZE)

    column_start = perf_counter()
    for _ in range(1000):
        double_column = 2 * mat[:, 0]
    column_end = perf_counter()

    row_start = perf_counter()
    for _ in range(1000):
        double_row = 2 * mat[0, :]
    row_end = perf_counter()

    column_time = column_end - column_start
    row_time = row_end - row_start

    print(f"Size: {SIZE}, Column Time: {column_time:.6f}, Row Time: {row_time:.6f}")