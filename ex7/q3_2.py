from pyarrow import parquet as pq
from pyarrow import csv
import sys
from time import perf_counter

t1 = perf_counter()
table = pq.read_table("dmi.parquet")
print("Read: ", perf_counter() - t1)

t1 = perf_counter()
pq.write_table(table, "dmi.parquet")
print("Write: ", perf_counter() - t1)



# Read:  1.0115472539328039
# Write:  1.630222475156188

### COMPARISON

# Method 1: Unzip then read csv
# Time: 31.6977 seconds

# Method 2: Read csv directly from zip
# Time: 14.8111 seconds