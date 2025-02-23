import os
import sys
import blosc
import numpy as np
from time import perf_counter


def write_numpy(arr, file_name):
    np.save(f"{file_name}.npy", arr)
    os.sync()


def write_blosc(arr, file_name, cname="lz4"):
    b_arr = blosc.pack_array(arr, cname=cname)
    with open(f"{file_name}.bl", "wb") as w:
        w.write(b_arr)
    os.sync()


def read_numpy(file_name):
    return np.load(f"{file_name}.npy")


def read_blosc(file_name):
    with open(f"{file_name}.bl", "rb") as r:
        b_arr = r.read()
    return blosc.unpack_array(b_arr)


n = int(sys.argv[1])

mat = np.tile(
    np.arange(256, dtype='uint8'),
    (n // 256) * n * n,
).reshape(n, n, n)

file_name = "q2_3"

t1 = perf_counter()
write_numpy(mat, file_name)
t2 = perf_counter()
print("Write numpy: ", t2-t1)

t1 = perf_counter()
write_blosc(mat, file_name)
t2 = perf_counter()
print("Write blosc: ", t2-t1)

t1 = perf_counter()
read_numpy(file_name)
t2 = perf_counter()
print("Read numpy: ", t2-t1)

t1 = perf_counter()
read_blosc(file_name)
t2 = perf_counter()
print("Read blosc: ", t2-t1)
