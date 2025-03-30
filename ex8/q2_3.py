import sys
import matplotlib.pyplot as plt
from numpy import memmap

def plot_mandelbrot(data):
    plt.imsave('downsampled_results.png', data)


filepath = sys.argv[1]
N = int(sys.argv[2])
n = int(sys.argv[3])

input = memmap(filepath, dtype='int32', mode='r', shape=(N * N,))

downsampled = input.reshape(N,N)[::n,::n]

plot_mandelbrot(downsampled)

