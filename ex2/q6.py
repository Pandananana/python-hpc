import sys

args = sys.argv
arg_nums = args[1:]
arg_even = filter(lambda x: int(x) % 2 == 0, arg_nums)

print(list(arg_even))
