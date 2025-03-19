from pyarrow import parquet as pq
from pyarrow import csv
import sys

args = sys.argv
file = args[1]

df = csv.read_csv(file).to_pandas()

def total_precip(df):
    df_precip = df[df['parameterId'] == 'precip_past10min']
    return df_precip["value"].sum()

print(total_precip(df))