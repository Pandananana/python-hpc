import fast_monte_carlo
from time import perf_counter
import matplotlib.pyplot as plt

# Measure execution times
times = []
for i in range(1, 17):
    t1 = perf_counter()
    fast_monte_carlo.calculate(i)
    t2 = perf_counter()
    times.append((i, t2-t1))

# Calculate speedups
speedup = []
single_core_speed = times[0][1]

for time in times:
    speedup.append((time[0], single_core_speed / time[1]))

print(speedup)

# Extract data for plotting
cores = [s[0] for s in speedup]
speedup_values = [s[1] for s in speedup]

# Create a simple plot
plt.figure(figsize=(10, 6))
plt.plot(cores, speedup_values, 'bo-', linewidth=2, markersize=8)
plt.plot(cores, cores, 'r--', label='Ideal linear speedup')  # Add ideal speedup line for reference
plt.xlabel('Number of Cores')
plt.ylabel('Speedup')
plt.title('Performance Speedup vs. Number of Cores')
plt.grid(True)
plt.legend()

# Save the plot
plt.savefig('speedup_graph.png')
plt.show()  # Optional: display the plot if running in interactive environment

print("Graph saved as 'speedup_graph.png'")