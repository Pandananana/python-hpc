from pyarrow import parquet as pq
from pyarrow import csv
import sys
from time import perf_counter

table = pq.read_table("dmi.parquet")
df = table.to_pandas()

def total_precip(df):
    total = 0.0
    for i in range(len(df)):
        if i % 100000 == 0:
            print(i)
        row = df.iloc[i]
        if row['parameterId'] == 'precip_past10min':
            total += row['value']
    return total


print("Data loaded, starting calculation")
t1 = perf_counter()
print("Precip: ", total_precip(df))
t2 = perf_counter()
print("Time: ", t2 - t1)

# Precip: 12548.630000001549
# Time:  520.6804335010238