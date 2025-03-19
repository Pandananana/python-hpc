import pandas as pd

df = pd.read_csv("/dtu/projects/02613_2025/data/dmi/2023_01.csv.zip")

def df_memsize(df):
    return df.memory_usage(deep=True).sum()

print(df_memsize(df))