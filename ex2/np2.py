import sys
import numpy as np

args = sys.argv
arg_vals = args[1:]
arg_vals = [float(item) for item in arg_vals]

def magnitude(arr):
    return np.linalg.norm(arr)

print(magnitude(np.array(arg_vals)))