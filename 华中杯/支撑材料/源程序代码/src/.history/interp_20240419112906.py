import pandas as pd
import numpy as np
from pyecharts import Sankey


filename1 = "intep.xlsx"
file1 = pd.read_excel(filename1)
newX = file1['time'].values
newY = file1['I'].values

filename2 = "origin.xlsx"
file2 = pd.read_excel(filename2)
x = file2['time'].values
y = file2['I'].values

scatter = Scatter("散点图示例")
scatter.add("A", x, y)
scatter.add("B", newX, newY)
scatter.render()


# interp_func = np.interp()