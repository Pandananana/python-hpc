from pyarrow import parquet as pq
from pyarrow import csv
import sys
from time import perf_counter

args = sys.argv
file = args[1]

t1 = perf_counter()
df = csv.read_csv(file).to_pandas()
t2 = perf_counter()
df_indexed = df.set_index("parameterId")
t3 = perf_counter()
df_indexed_sorted = df_indexed.sort_index()
t4 = perf_counter()
df_precip = df_indexed_sorted.loc["precip_past10min"]
t5 = perf_counter()
print("Total Precip: ", df_precip["value"].sum())
t6 = perf_counter()

print("Load data: ", t2 - t1)
print("Build Index: ", t3 - t2)
print("Sort Index: ", t4 - t3)
print("Build + Sort Index: ", t4 - t2)
print("Locate Precip Column: ", t5 - t4)
print("Sum Precip: ", t6 - t5)

print("Total time: ", t6 - t1)
print("Build inex", t5 - t2)

# Total Precip:  12548.630000000001
# Load data:  3.9604252967983484
# Build Index:  0.15628249011933804
# Sort Index:  8.461795290000737
# Build + Sort Index:  8.618077780120075
# Locate Precip Column:  0.4337690370157361
# Sum Precip:  0.001211571041494608
# Total time:  13.013483684975654
# Build inex 9.05184681713581