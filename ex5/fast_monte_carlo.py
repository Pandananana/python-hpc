import random
import multiprocessing

def sample():
    x = random.uniform(-1.0, 1.0)
    y = random.uniform(-1.0, 1.0)
    if x**2 + y**2 <= 1:
        return 1
    else:
        return 0

def sample_multiple(samples_partial):
    return sum(sample() for i in range(samples_partial))

def calculate(n_proc):
    samples = 1000000
    hits = 0

    chunk_size = samples//n_proc
    pool = multiprocessing.Pool(n_proc)
    results_async = [pool.apply_async(sample_multiple, (chunk_size,))
                    for i in range(n_proc)]
    hits = sum(r.get() for r in results_async)
    pi = 4.0 * hits/samples

    return pi

if __name__ == '__main__':
    pi = calculate(10)
    print("Pi: ", pi)