import pyarrow as pa
import pyarrow.parquet as pq
import pandas as pd

df = pd.read_csv("/dtu/projects/02613_2025/data/dmi/2023_01.csv.zip", chunksize=100_000)

first = True 
writer = None 

for chunk in df: 
    chunk_table = pa.Table.from_pandas(chunk) 
    schema = chunk_table.schema 
    if first: 
        first = False 
        writer = pq.ParquetWriter( 
            "q1_3.parquet", schema=schema) 
    writer.write_table(chunk_table) 
writer.close()



