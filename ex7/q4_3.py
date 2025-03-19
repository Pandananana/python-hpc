from pyarrow import parquet as pq
from pyarrow import csv
import sys
from time import perf_counter

table = pq.read_table("dmi.parquet")
df = table.to_pandas()

def total_precip(df):
    df_precip = df[df['parameterId'] == 'precip_past10min']
    return df_precip["value"].sum()


print("Data loaded, starting calculation")
t1 = perf_counter()
print("Precip: ", total_precip(df))
t2 = perf_counter()
print("Time: ", t2 - t1)

# Data loaded, starting calculation
# Precip:  12548.630000000001
# Time:  0.514039060100913