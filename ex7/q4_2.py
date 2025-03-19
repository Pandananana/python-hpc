from pyarrow import parquet as pq
from pyarrow import csv
import sys
from time import perf_counter

table = pq.read_table("dmi.parquet")
df = table.to_pandas()

def total_precip(df):
    def process_row(row):
        if row['parameterId'] == 'precip_past10min':
            return row['value']
        else:
            return 0
    
    # Apply the function to each row and sum the results
    total = df.apply(process_row, axis=1).sum()
    
    return total


print("Data loaded, starting calculation")
t1 = perf_counter()
print("Precip: ", total_precip(df))
t2 = perf_counter()
print("Time: ", t2 - t1)

# Data loaded, starting calculation
# Precip:  12548.629999999996
# Time:  62.45747119700536