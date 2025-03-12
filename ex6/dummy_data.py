import numpy as np
arr = np.arange(10)  # 0 to 9
arr = arr.astype('float32')
arr = arr[:, None, None, None]  # (100, 1, 1, 1)
np.save('dummydata.npy', arr)