# %%
import numpy as np 
import pandas as pd
import matplotlib.pyplot as plt
import zebende as zb
import time

# %%
series_count = 4

# %%
url = 'https://tinyurl.com/zbtestdata64c'

# %%
df = pd.read_csv(url)
print(df.shape)
df = df.iloc[:, :series_count]
df.shape

# %%
tws =  np.array([4, 5, 7, 9, 11, 13, 16, 20, 23, 28, 33, 38, 45, 52, 60, 69, 79, 91, 104, 119, 135, 154, 174, 198, 223, 252, 285, 321,
  362, 407, 457, 513, 575, 645, 723, 809, 905, 1011, 1130, 1261, 1407, 1570])

# %%
df.info()

# %%
mat = df.to_numpy()
print(mat)

# %%
start_time = time.time()
int_data = zb.integrated_series(mat)
dfa, dcca, pdcca = zb.p_dcca(mat, tws) 
end_time = time.time()
print(f"Time taken: {end_time - start_time} seconds")

# %%
pdcca


