from pyarrow import parquet as pq
from pyarrow import csv
import sys

args = sys.argv
file = args[1]

table = csv.read_csv(file)

pq.write_table(table, "dmi.parquet")

# -rw-r--r-- 1 s215489 s21 695M Jan 29  2024 dmi.csv
# -rw-r--r-- 1 s215489 s21  86M Mar 19 16:48 dmi.parquet