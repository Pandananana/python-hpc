import numpy as np
from numba import jit
from time import perf_counter

# Optimize loop order with k before j to improve memory access patterns:
# - B uses k for rows and j for columns; C uses j for columns
# - Since B and C are stored row-wise in memory (NumPy default), placing the j loop innermost
#   maximizes cache locality by accessing consecutive elements in each row
# - This reduces cache misses and improves performance, especially for large matrices

@jit(nopython=True)
def matmul_jit(A, B):
    C = np.zeros((A.shape[0], B.shape[1]))
    for i in range(A.shape[0]):
        for k in range(A.shape[1]):
            for j in range(B.shape[1]):
                C[i,j] += A[i,k] * B[k,j]
    return C

def matmul(A, B):
    C = np.zeros((A.shape[0],B.shape[1]))
    for i in range(A.shape[0]):
        for k in range(A.shape[1]):
            for j in range(B.shape[1]):
                C[i,j] += A[i,k] * B[k,j]
    return C


A = np.random.rand(100,100)
B = np.random.rand(100,100)

matmul_jit(A,B)

t1 = perf_counter()
for _ in range(100):
    matmul(A,B)
t2 = perf_counter()

print("Default: ", t2-t1)

t1 = perf_counter()
for _ in range(100):
    matmul_jit(A,B)
t2 = perf_counter()

print("JIT: ", t2-t1)

# Default:  63.34244175511412
# JIT:  0.02472969307564199
# Speedup: 2564x