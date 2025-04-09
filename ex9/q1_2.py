import numpy as np
from numba import jit
from time import perf_counter

@jit(nopython=True)
def matmul_jit(A, B):
    C = np.zeros((A.shape[0],B.shape[1]))
    for i in range(A.shape[0]):
        for j in range(B.shape[1]):
            for k in range(A.shape[1]):
                C[i,j] += A[i,k] * B[k,j]
    return C

def matmul(A, B):
    C = np.zeros((A.shape[0],B.shape[1]))
    for i in range(A.shape[0]):
        for j in range(B.shape[1]):
            for k in range(A.shape[1]):
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

# Default:  64.12029002304189
# JIT:  0.09722570492886007
# Speedup: 625x