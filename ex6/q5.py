import ctypes
import multiprocessing as mp
import sys
from time import perf_counter as time
import numpy as np
from PIL import Image
import matplotlib.pyplot as plt

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
    chunk_size = 500  # Fixed chunk size as requested
    n_processes_list = range(1, 49)  # 1 to 48 processes

    data = np.load(sys.argv[1])
    elemshape = data.shape[1:]
    shared_arr = mp.RawArray(ctypes.c_float, data.size)
    arr = tonumpyarray(shared_arr).reshape(data.shape)
    
    # Store timing results
    speedup_data = []
    baseline_time = None
    
    for n_processes in n_processes_list:
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
                        [(i, i + chunk_size*s, s, elemshape) for i in range(0, len(arr), chunk_size)],
                        chunksize=1)
                s = s * chunk_size
            pool.close()
            pool.join()
            t_end = time()
            run_times.append(t_end - t_start)

        # Compute average over 5 runs
        avg_time = sum(run_times) / 5
        print(f"Processes {n_processes}: {avg_time:.6f} seconds")
        
        # Store first run (1 process) as baseline for speedup calculation
        if n_processes == 1:
            baseline_time = avg_time
        speedup = baseline_time / avg_time
        speedup_data.append(speedup)
    
    # Generate speedup plot
    plt.figure(figsize=(10, 6))
    plt.plot(n_processes_list, speedup_data, 'b.-', label=f'Chunk size = {chunk_size}')
    plt.plot(n_processes_list, list(n_processes_list), 'r--', label='Ideal speedup')
    plt.xlabel('Number of Processes')
    plt.ylabel('Speedup')
    plt.title('Speedup vs Number of Processes')
    plt.grid(True)
    plt.legend()
    plt.savefig('speedup_plot.png')
    plt.close()
    
    # Final output using max processes (48)
    final_image = arr[0]
    final_image /= len(arr)
    Image.fromarray((255 * final_image).astype('uint8')).save('result.png')