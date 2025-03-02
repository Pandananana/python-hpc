import sys
import numpy as np

@profile
def distance_matrix(p1, p2):
    p1, p2 = np.radians(p1), np.radians(p2)

    D = np.empty((len(p1), len(p2)))
    for i in range(len(p1)):
        dsin2 = np.sin(0.5 * (p1[i] - p2)) ** 2
        cosprod = np.cos(p1[i, 0]) * np.cos(p2[:, 0])
        a = dsin2[:,0] + cosprod * dsin2[:,1]
        D[i, :] = 2 * np.arcsin(np.sqrt(a))

    D *= 6371  # Earth radius in km
    return D


def load_points(fname):
    data = np.loadtxt(fname, delimiter=',', skiprows=1, usecols=(1, 2))
    return data


def distance_stats(D):
    # Extract upper triangular part to avoid duplicate entries
    assert D.shape[0] == D.shape[1], 'D must be square'
    idx = np.triu_indices(D.shape[0], k=1)
    distances = D[idx]
    return {
        'mean': float(distances.mean()),
        'std': float(distances.std()),
        'max': float(distances.max()),
        'min': float(distances.min()),
    }


fname = sys.argv[1]
points = load_points(fname)
D = distance_matrix(points, points)
stats = distance_stats(D)
print(stats)


# Function: distance_matrix at line 4

# Line #      Hits         Time  Per Hit   % Time  Line Contents
# ==============================================================
#      4                                           @profile
#      5                                           def distance_matrix(p1, p2):
#      6         1         19.7     19.7      0.3      p1, p2 = np.radians(p1), np.radians(p2)
#      7                                           
#      8         1         15.6     15.6      0.3      D = np.empty((len(p1), len(p2)))
#      9       100         65.9      0.7      1.2      for i in range(len(p1)):
#     10        99       2242.5     22.7     39.4          dsin2 = np.sin(0.5 * (p1[i] - p2)) ** 2
#     11        99       1216.8     12.3     21.4          cosprod = np.cos(p1[i, 0]) * np.cos(p2[:, 0])
#     12        99        544.7      5.5      9.6          a = dsin2[:,0] + cosprod * dsin2[:,1]
#     13        99       1567.6     15.8     27.5          D[i, :] = 2 * np.arcsin(np.sqrt(a))
#     14                                           
#     15         1         18.4     18.4      0.3      D *= 6371  # Earth radius in km
#     16         1          0.7      0.7      0.0      return D

#   0.01 seconds - q2_6.py:4 - distance_matrix