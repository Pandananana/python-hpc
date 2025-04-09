from numba import cuda 
import numpy as np
from time import perf_counter

@cuda.jit 
def matmul_kernel(A, B, C): 
	i, j = cuda.grid(2) 
	if i < A.shape[0] and j < A.shape[1]: 
		tmp = 0
		for k in range(A.shape[1]):
			tmp += A[i, k] * B[k, j]
		C[i, j] = tmp
	

# Create pinned memory
A = cuda.pinned_array((2048,2048))
B = cuda.pinned_array_like(A)

# Add data to pinned memory
A[:] = np.random.rand(2048,2048)
B[:] = np.random.rand(2048,2048)

dA = cuda.to_device(A)
dB = cuda.to_device(B) 
dC = cuda.device_array_like(A)

tpb = 16, 16
bpg = (A.shape[0] // tpb[0], 
	   A.shape[1] // tpb[1])

matmul_kernel[bpg, tpb](dA, dB, dC)
C = dC.copy_to_host()