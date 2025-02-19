import numpy as np
from time import perf_counter
import matplotlib.pyplot as plt

# Generate row sizes (more points for better resolution)
SIZES = np.logspace(2, 8, num=20)
row_mflops = []
vector_sizes_kb = []

for SIZE in SIZES:
    SIZE = int(SIZE)
    mat = np.random.rand(1, SIZE)
    mat = mat.astype("float32")
    
    # Calculate vector size in KB (8 bytes per double)
    vector_size_kb = (SIZE * 4) / 1024
    vector_sizes_kb.append(vector_size_kb)
    
    # Measure row access
    row_start = perf_counter()
    for _ in range(100):  # 1000 > 100 repetitions requirement
        double_row = 2 * mat[0, :]
    row_end = perf_counter()
    
    # Calculate MFLOP/s (2 operations per element: multiply and assign)
    row_time = row_end - row_start
    row_mflops.append((SIZE * 1000 * 2) / (row_time * 1e6))
    
    print(f"Size: {SIZE:>8d}, Vector: {vector_size_kb:>8.2f} KB, "
          f"Row MFLOP/s: {row_mflops[-1]:>8.2f}")

# Create figure
plt.figure(figsize=(10, 6))

# Plot performance
plt.loglog(vector_sizes_kb, row_mflops, 'o-', label='Row vector scaling')

# Add CPU cache size indicators
cache_sizes = {
    'L1': 1024,    # 1 MiB per instance
    'L2': 32768,   # 32 MiB per instance
    'L3': 45056    # 44 MiB shared
}

for cache, size in cache_sizes.items():
    plt.axvline(x=size, linestyle='--', alpha=0.5, 
                label=f'{cache} Cache ({size} KB)')

plt.xlabel('Vector Size (KB)')
plt.ylabel('Performance (MFLOP/s)')
plt.title('Row Vector Scaling Performance')
plt.grid(True)
plt.legend()

plt.tight_layout()
plt.savefig('q1_5_float32.png', dpi=300, bbox_inches='tight')
plt.close()

# Pattern is the same with float32 and float64, since the X-axis is array size