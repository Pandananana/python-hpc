from numba import cuda 

@cuda.jit 
def add_kernel(x, y, a): 
	i = cuda.grid(1) 
	if i < len(x): 
		a[i] = x[i] + y[i]