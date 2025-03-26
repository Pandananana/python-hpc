import sys
import numpy as np
import matplotlib.pyplot as plt
import multiprocessing
from numpy import memmap

def mandelbrot_escape_time(c):
    """Calculate escape time for a single complex number"""
    z = 0
    for i in range(100):
        z = z**2 + c
        if abs(z) > 2.0:
            return i
    return 100

def process_chunk(chunk, output_array, start_idx):
    """Process a chunk of complex numbers and store results in memory-mapped array"""
    for i, c in enumerate(chunk):
        output_array[start_idx + i] = mandelbrot_escape_time(c)

def generate_mandelbrot_set(n, num_processes):
    """Generate Mandelbrot set using memory-mapped array"""
    # Define the coordinate limits
    xmin, xmax = -2, 2
    ymin, ymax = -2, 2
    
    # Create coordinate arrays
    x = np.linspace(xmin, xmax, n)
    y = np.linspace(ymin, ymax, n)
    
    # Create complex plane
    points = np.array([complex(real, imag) for real in x for imag in y])
    
    # Create memory-mapped array for results
    mmapped_array = memmap('mandelbrot/results.raw', dtype='int32', mode='w+', shape=(n * n,))
    
    # Split points into chunks for multiprocessing
    chunk_size = len(points) // num_processes
    chunks = [(points[i:i + chunk_size], mmapped_array, i) 
             for i in range(0, len(points), chunk_size)]
    
    # Adjust last chunk if necessary
    if len(points) % num_processes != 0:
        chunks[-1] = (points[chunks[-1][1]:], mmapped_array, chunks[-1][2])
    
    # Process chunks in parallel
    processes = []
    for chunk_data in chunks:
        p = multiprocessing.Process(target=process_chunk, 
                                  args=(chunk_data[0], chunk_data[1], chunk_data[2]))
        processes.append(p)
        p.start()
    
    # Wait for all processes to complete
    for p in processes:
        p.join()
    
    return mmapped_array.reshape((n, n))

def plot_mandelbrot(data):
    """Plot the Mandelbrot set"""
    plt.imshow(data, cmap='hot', extent=(-2, 2, -2, 2))
    plt.axis('off')
    plt.savefig('mandelbrot/result.png', bbox_inches='tight', pad_inches=0)
    plt.close()

if __name__ == "__main__":
    n = int(sys.argv[1])
    
    # Set number of processes (adjust based on your CPU)
    num_processes = min(multiprocessing.cpu_count(), 4)
    
    # Generate and plot Mandelbrot set
    mandelbrot_data = generate_mandelbrot_set(n, num_processes)
    plot_mandelbrot(mandelbrot_data)
    
    # Clean up memory-mapped file
    del mandelbrot_data  # Close the memory-mapped array