import multiprocessing
import numpy as np
import matplotlib.pyplot as plt
import sys
import zarr

def mandelbrot_escape_time(c):
    z = 0
    for i in range(100):
        z = z**2 + c
        if np.abs(z) > 2.0:
            return i
    return 100

def generate_mandelbrot_set(points, data, N, C):
    vfunc = np.vectorize(mandelbrot_escape_time)
    
    # Process complete chunks
    for i in range(0, N, C):
        end_col = min(i + C, N)
        for j in range(0, N, C):
            end_row = min(j + C, N) 
            chunk = points[i:end_col, j:end_row]
            data[i:end_col, j:end_row] = vfunc(chunk)

def plot_mandelbrot(escape_times):
    plt.imshow(escape_times, cmap='hot', extent=(-2, 2, -2, 2))
    plt.axis('off')
    plt.savefig('mandelbrot_zarr.png', bbox_inches='tight', pad_inches=0)

if __name__ == "__main__":
    N = int(sys.argv[1])
    C = int(sys.argv[2])

    xmin, xmax = -2, 2
    ymin, ymax = -2, 2

    # Precompute points
    x_values = np.linspace(xmin, xmax, N)
    y_values = np.linspace(ymin, ymax, N)
    points = np.array([complex(x, y) for x in x_values for y in y_values])
    points = points.reshape(N,N)

    data = zarr.open("mandelbrot.zarr", mode="w", shape=(N,N), chunks=(C,C), dtype="int32")

    # Compute set
    generate_mandelbrot_set(points, data, N, C)

    # Save set as image
    # plot_mandelbrot(data)