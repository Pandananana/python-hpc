import sys
import numpy as np

args = sys.argv
arg_grades = args[1:]
arg_grades = [int(item) for item in arg_grades]
mean_grade = np.mean(arg_grades)

print(mean_grade, "Pass" if mean_grade >= 5 else "Fail")
