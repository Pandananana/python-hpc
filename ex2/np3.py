import sys
import numpy as np

args = sys.argv
arg_vals = args[1:]
arg_vals = [float(item) for item in arg_vals]

diag = np.diag(arg_vals)
np.save("diag", diag)