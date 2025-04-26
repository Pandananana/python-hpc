import numpy as np
from matplotlib import pyplot as plt
import os
import matplotlib.colors as mcolors
URL = "/zhome/66/2/168935/uni/python_hpc/exercises/ex11/subhists"
subhists = os.listdir(URL)
combined_hist = []
for subhist in subhists:
    subhist = np.load(f"{URL}/{subhist}")
    combined_hist.append(subhist)

combined_hist = np.array(combined_hist)
print("Combined shape: ", combined_hist.shape)

combined_hist = np.sum(combined_hist, axis=0)

# Create an array for the bin centers
bin_edges = np.linspace(0, 256, 65)  # 65 points to get 64 bins
bin_centers = (bin_edges[:-1] + bin_edges[1:]) / 2

# Create colors for each bar based on HSV color space
colors = []
for h in bin_centers:
    # Convert h from 0-256 to 0-1 for HSV
    hue = h / 256
    # Create RGB color from HSV (hue, 1, 1)
    rgb = mcolors.hsv_to_rgb([hue, 1, 1])
    colors.append(rgb)

# Create the bar plot with the bin centers as x values and appropriate colors
plt.figure(figsize=(12, 6))
bars = plt.bar(bin_centers, combined_hist, width=4, color=colors, align='center')

plt.title("Face Histograms")
plt.xlabel("Hue (0-256)")
plt.ylabel("Number")

# Adjust the x-axis ticks and limits for better readability
plt.xlim(0, 256)
plt.xticks(np.linspace(0, 256, 9))  # Show 9 ticks from 0 to 256

plt.savefig("combined_hist.png", dpi=300)
plt.show()