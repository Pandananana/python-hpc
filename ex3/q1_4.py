import numpy as np
from time import perf_counter
import matplotlib.pyplot as plt

# Generate matrix sizes
SIZES = np.logspace(1, 4.5, num=20)
column_mflops = []
row_mflops = []
matrix_sizes_kb = []

for SIZE in SIZES:
    SIZE = int(SIZE)
    mat = np.random.rand(SIZE, SIZE)
    
    # Calculate matrix size in KB (8 bytes per double)
    matrix_size_kb = (SIZE * SIZE * 8) / 1024
    matrix_sizes_kb.append(matrix_size_kb)
    
    # Measure column access
    column_start = perf_counter()
    for _ in range(1000):
        double_column = 2 * mat[:, 0]
    column_end = perf_counter()
    
    # Measure row access
    row_start = perf_counter()
    for _ in range(1000):
        double_row = 2 * mat[0, :]
    row_end = perf_counter()
    
    # Calculate MFLOP/s (2 operations per element: multiply and assign)
    column_time = column_end - column_start
    row_time = row_end - row_start
    
    column_mflops.append((SIZE * 1000 * 2) / (column_time * 1e6))
    row_mflops.append((SIZE * 1000 * 2) / (row_time * 1e6))
    
    print(f"Size: {SIZE:>5d}, Matrix: {matrix_size_kb:>8.2f} KB, "
          f"Column MFLOP/s: {column_mflops[-1]:>8.2f}, "
          f"Row MFLOP/s: {row_mflops[-1]:>8.2f}")

# Create figure with two subplots
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 12))

# Plot 1: Raw performance
ax1.loglog(matrix_sizes_kb, column_mflops, 'o-', label='Column access')
ax1.loglog(matrix_sizes_kb, row_mflops, 'o-', label='Row access')

# Add CPU cache size indicators (XeonGold6226R)
cache_sizes = {
    'L1': 1024,    # 1 MiB per instance
    'L2': 32768,   # 32 MiB per instance
    'L3': 45056    # 44 MiB shared
}

for cache, size in cache_sizes.items():
    ax1.axvline(x=size, linestyle='--', alpha=0.5, 
                label=f'{cache} Cache ({size} KB)')

ax1.set_xlabel('Matrix Size (KB)')
ax1.set_ylabel('Performance (MFLOP/s)')
ax1.set_title('Memory Access Performance: Row vs Column')
ax1.grid(True)
ax1.legend()

# Plot 2: Performance ratio
ratio = np.array(row_mflops) / np.array(column_mflops)
ax2.semilogx(matrix_sizes_kb, ratio, 'o-', label='Row/Column Ratio')
ax2.axhline(y=1, linestyle='--', color='gray', alpha=0.5)

for cache, size in cache_sizes.items():
    ax2.axvline(x=size, linestyle='--', alpha=0.5, 
                label=f'{cache} Cache ({size} KB)')

ax2.set_xlabel('Matrix Size (KB)')
ax2.set_ylabel('Performance Ratio (Row/Column)')
ax2.set_title('Relative Performance: Row vs Column Access')
ax2.grid(True)
ax2.legend()

plt.tight_layout()
plt.savefig('cache_performance.png', dpi=300, bbox_inches='tight')
plt.close()