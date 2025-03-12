import ctypes
import multiprocessing as mp
import sys
from time import perf_counter as time
import numpy as np
from PIL import Image

def init(shared_arr_):
    global shared_arr
    shared_arr = shared_arr_

def tonumpyarray(mp_arr):
    return np.frombuffer(mp_arr, dtype='float32')

def reduce_step(args):
    b, e, s, elemshape = args
    arr = tonumpyarray(shared_arr).reshape((-1,) + elemshape)
    arr[b] = sum(arr[b:e:s])

if __name__ == '__main__':
    n_processes = 48
    chunk_values = [2**i for i in range(1,15)]

    data = np.load(sys.argv[1])
    elemshape = data.shape[1:]
    shared_arr = mp.RawArray(ctypes.c_float, data.size)
    arr = tonumpyarray(shared_arr).reshape(data.shape)
    
    for chunk in chunk_values:
        run_times = []  # Store times for 5 runs
        for i in range(5):
            # Reset array before each run (not timed)
            np.copyto(arr, data)

            # Time only the parallel computation
            t_start = time()
            pool = mp.Pool(n_processes, initializer=init, initargs=(shared_arr,))
            s = 1
            while s <= len(arr):
                pool.map(reduce_step,
                         [(i, i + chunk*s, s, elemshape) for i in range(0, len(arr), chunk)],
                         chunksize=1)
                s = s * chunk
            pool.close()
            pool.join()
            t_end = time()
            run_times.append(t_end - t_start)  # Record time for this run

        # Compute average over 5 runs
        avg_time = sum(run_times) / 5
        print(f"Chunk {chunk}: {avg_time:.6f} seconds")
    
    # Final output for the last chunk
    final_image = arr[0]
    final_image /= len(arr)
    Image.fromarray((255 * final_image).astype('uint8')).save('result.png')

# Chunk 2: 3.935737 seconds
# Chunk 4: 1.419696 seconds
# Chunk 8: 0.851745 seconds
# Chunk 16: 0.607975 seconds
# Chunk 32: 0.486005 seconds
# Chunk 64: 0.459869 seconds
# Chunk 128: 0.395946 seconds
# Chunk 256: 0.398550 seconds
# Chunk 512: 0.401441 seconds
# Chunk 1024: 0.416982 seconds
# Chunk 2048: 0.471830 seconds
# Chunk 4096: 0.564867 seconds
# Chunk 8192: 0.782352 seconds
# Chunk 16384: 0.892547 seconds