import pandas as pd
import numpy as np

filename = "2.xlsx"
file = pd.read_excel(filename)
x = file['北京时间'].values
y = file['地面直射辐射量W/m2'].values
print(x)

interp_func = np.interp()