import multiprocessing
import numpy as np
import matplotlib.pyplot as plt
import time

def mandelbrot_escape_time(c):
    z = 0
    for i in range(100):
        z = z**2 + c
        if np.abs(z) > 2.0:
            return i
    return 100

def generate_mandelbrot_set(points, num_processes):
    pool = multiprocessing.Pool(num_processes)
    results_async = [pool.apply_async(mandelbrot_escape_time, (c,)) for c in points]
    results = [r.get() for r in results_async]
    
    pool.close()
    pool.join()
    return np.array(results)

def plot_mandelbrot(escape_times, width, height):
    plt.imshow(escape_times.reshape((height, width)), cmap='hot', extent=(-2, 2, -2, 2))
    plt.axis('off')
    plt.savefig('mandelbrot_batch.png', bbox_inches='tight', pad_inches=0)

def plot_speedup(num_processes_list, execution_times):
    # Calculate speedup (time with 1 process / time with n processes)
    baseline_time = execution_times[0]
    speedups = [baseline_time / t for t in execution_times]
    
    plt.figure()
    plt.plot(num_processes_list, speedups, 'bo-')
    plt.grid(True)
    plt.xlabel('Number of Processes')
    plt.ylabel('Speedup')
    plt.title('Speedup vs Number of Processes')
    plt.savefig('mandelbrot_speedup_plot.png')
    plt.close()

if __name__ == "__main__":
    # Parameters
    width = 800
    height = 800
    xmin, xmax = -2, 2
    ymin, ymax = -2, 2
    
    # Generate test points once
    x_values = np.linspace(xmin, xmax, width)
    y_values = np.linspace(ymin, ymax, height)
    points = np.array([complex(x, y) for x in x_values for y in y_values])
    
    # Vary number of processes
    max_processes = 48
    num_processes_list = list(range(1, max_processes + 1))
    execution_times = []
    
    print(f"Running with 1 to {max_processes} processes...")
    
    # Run batch job
    for num_proc in num_processes_list:
        start_time = time.time()
        
        # Compute Mandelbrot set
        mandelbrot_set = generate_mandelbrot_set(points, num_proc)
        
        end_time = time.time()
        execution_time = end_time - start_time
        execution_times.append(execution_time)
        
        print(f"Processes: {num_proc}, Time: {execution_time:.2f} seconds")
        
        # Generate image only for the last run
        if num_proc == num_processes_list[-1]:
            plot_mandelbrot(mandelbrot_set, width, height)
    
    # Generate speedup plot
    plot_speedup(num_processes_list, execution_times)
    
    print("\nResults:")
    for proc, time in zip(num_processes_list, execution_times):
        print(f"Processes: {proc}, Time: {time:.2f} seconds")
    print("\nGenerated files: mandelbrot.png, speedup_plot.png")