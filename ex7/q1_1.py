#!/usr/bin/env python3
import os
import time
import pandas as pd
import zipfile

# File path
zip_path = "/dtu/projects/02613_2025/data/dmi/2023_01.csv.zip"

# Method 1: Unzip then read
print("Method 1: Unzip then read")
start_time = time.time()

# Extract the CSV file
with zipfile.ZipFile(zip_path, 'r') as zip_ref:
    csv_name = zip_ref.namelist()[0]  # Assuming only one file in the zip
    zip_ref.extract(csv_name)

# Read the extracted CSV
df1 = pd.read_csv(csv_name)

# Clean up the extracted file
os.remove(csv_name)

method1_time = time.time() - start_time
print(f"Time: {method1_time:.4f} seconds")
print(f"Rows: {len(df1)}")

# Method 2: Read directly from zip
print("\nMethod 2: Read directly from zip")
start_time = time.time()

df2 = pd.read_csv(zip_path)

method2_time = time.time() - start_time
print(f"Time: {method2_time:.4f} seconds")
print(f"Rows: {len(df2)}")

# Compare methods
print("\nComparison:")
faster = "Method 1" if method1_time < method2_time else "Method 2"
ratio = max(method1_time, method2_time) / min(method1_time, method2_time)
print(f"Faster method: {faster}")
print(f"Speed ratio: {ratio:.2f}x")



# Method 1: Unzip then read
# Time: 31.6977 seconds
# Rows: 8142495

# Method 2: Read directly from zip
# Time: 14.8111 seconds
# Rows: 8142495

# Comparison:
# Faster method: Method 2
# Speed ratio: 2.14x