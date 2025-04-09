from numba import cuda
import numpy as np
import sys

TPB = 32  # Threads per block

@cuda.jit
def reduce_kernel(data, out, n):
    # Shared memory
    sdata = cuda.shared.array(TPB, dtype=out.dtype)

    # Get the 1D grid and block indices
    tid = cuda.threadIdx.x
    i = cuda.grid(1)

    sdata[tid] = data[i] if i < n else 0.0

    # Do reduction for threadblock
    s = 1
    while s < cuda.blockDim.x:
        index = 2 * s * tid
        if (index < cuda.blockDim.x):
            sdata[index] += sdata[index + s]
        s *= 2
        cuda.syncthreads()  # Ensure block is synchronized

    # Write result for this block to global memory
    if tid == 0:
        out[cuda.blockIdx.x] = sdata[0]

def get_grid(n, tpb):
    return (n + (tpb - 1)) // tpb  # Blocks per grid

def reduce(x):
    n = len(x)
    bpg = get_grid(n, TPB)
    dX = cuda.to_device(x)
    out = cuda.device_array(bpg, dtype=x.dtype)
    while bpg > 1:
        reduce_kernel[bpg, TPB](dX, out, n)
        n = bpg
        bpg = get_grid(n, TPB)
        dX[:n] = out[:n]
    reduce_kernel[bpg, TPB](dX, out, n)
    return out

n = int(sys.argv[1])
numbers = np.random.rand(n).astype("float32")
numbers = np.ones(n).astype("float32")
result = reduce(numbers).copy_to_host()
cuda.synchronize()
print(result[0])