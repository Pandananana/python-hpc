# Parallel fraction 
F = 100/120
print("Parallel Fraction: ", F)

# Speedup for p = 10
S_p = 1 / ((1 - F) + F / 10)
print("Speedup with p=10 : ", S_p)

# Max speedup
S_inf = 1 / (1 - F)
print("Max speedup: ", S_inf)

# Strategy
p = 4
F_a = 100 / 105
S_pa = 1 / ((1 - F_a) + F_a / p)
S_pb = 1 / ((1 - F) + F / 8)
runtime_a = 105 / S_pa
runtime_b = 120 / S_pb

print(F_a)
print("Runtime a: ", runtime_a)
print("Runtime b: ", runtime_b)