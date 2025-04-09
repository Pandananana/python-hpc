from numba import cuda 
import numpy as np
from time import perf_counter

@cuda.jit 
def add_kernel(x, y, a): 
	i = cuda.grid(1) 
	if i < len(x): 
		a[i] = x[i] + y[i]
		
def get_bpg(n, tpb): 
	return (n + (tpb - 1)) // tpb 

x = cuda.pinned_array(1_000_000, dtype=np.float32)
y = cuda.pinned_array_like(x)

x[:] = np.random.rand(1_000_000).astype(np.float32)
y[:] = np.random.rand(1_000_000).astype(np.float32)

dx = cuda.to_device(x)
dy = cuda.to_device(y)
da = cuda.device_array_like(x)

tpb = 512 
bpg = get_bpg(len(x), tpb) 
add_kernel[bpg, tpb](dx, dy, da)
a = da.copy_to_host()

t = perf_counter()
for _ in range(100):
	add_kernel[bpg, tpb](dx, dy, da)
	a = da.copy_to_host()
cuda.synchronize()  # Wait for GPU kernels to finish
t = perf_counter() - t

print("Time: ", t / 100)