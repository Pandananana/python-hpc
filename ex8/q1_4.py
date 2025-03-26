import sys
import pyarrow as pa
import pyarrow.parquet as pq
import pandas as pd

pf = pq.ParquetFile("q1_3.parquet")
print(pf.metadata)

total_precipitation = 0.0
for groupi in range(pf.num_row_groups):
    group = pf.read_row_group(groupi)
    df = group.to_pandas()
    df_precip = df[df['parameterId'] == 'precip_past10min']
    total_precipitation += df_precip["value"].sum()

print(total_precipitation)