import sys
import pandas as pd

pd_path = sys.argv[1]
c_size = sys.argv[2]

dfc = pd.read_csv(pd_path, chunksize=int(c_size))

total_precipitation = 0.0
for df in dfc:
    df_precip = df[df['parameterId'] == 'precip_past10min']
    total_precipitation += df_precip["value"].sum()

print(total_precipitation)