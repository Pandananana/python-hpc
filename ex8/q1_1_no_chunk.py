import sys
import pandas as pd

pd_path = sys.argv[1]

df = pd.read_csv(pd_path)

df_precip = df[df['parameterId'] == 'precip_past10min']
total_precipitation = df_precip["value"].sum()

print(total_precipitation)