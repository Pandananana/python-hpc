import multiprocessing
import numpy as np
import matplotlib.pyplot as plt

def mandelbrot_escape_time(c):
    z = 0
    for i in range(100):
        z = z**2 + c
        if np.abs(z) > 2.0:
            return i
    return 100

def generate_mandelbrot_set(points, num_processes):
    data_size = points.shape[0]

    chunk_size = data_size//num_processes
    chunks = [points[i:i + chunk_size] for i in range(0, data_size, chunk_size)]

    pool = multiprocessing.Pool(num_processes)
    results_async = [pool.apply_async(process_chunk, (chunk,))
                    for chunk in chunks]
    
    results = []
    for r in results_async:
        results.extend(r.get())
    
    pool.close()
    pool.join()

    
    
    return np.array(results)

def process_chunk(chunk):
    result = []
    for item in chunk:
        result.append(mandelbrot_escape_time(item))
    return result

def plot_mandelbrot(escape_times):
    plt.imshow(escape_times, cmap='hot', extent=(-2, 2, -2, 2))
    plt.axis('off')
    plt.savefig('mandelbrot.png', bbox_inches='tight', pad_inches=0)

if __name__ == "__main__":
    width = 800
    height = 800
    xmin, xmax = -2, 2
    ymin, ymax = -2, 2
    num_proc = 4

    # Precompute points
    x_values = np.linspace(xmin, xmax, width)
    y_values = np.linspace(ymin, ymax, height)
    points = np.array([complex(x, y) for x in x_values for y in y_values])

    # Compute set
    mandelbrot_set = generate_mandelbrot_set(points, num_proc)

    # Save set as image
    mandelbrot_set = mandelbrot_set.reshape((height, width))
    plot_mandelbrot(mandelbrot_set)