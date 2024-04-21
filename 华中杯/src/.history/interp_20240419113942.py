import pandas as pd
import numpy as np
from pyecharts import options as opts
from pyecharts.charts import Scatter


filename1 = "interp.xlsx"
file1 = pd.read_excel(filename1)
newX = file1['time'].values
newY = file1['I'].values

filename2 = "origin.xlsx"
file2 = pd.read_excel(filename2)
x = file2['time'].values
y = file2['I'].values

scatter = (
    Scatter(init_opts=opts.InitOpts(width="70%", height="400px"))
    .add_xaxis(list(newX))
    .add_yaxis("I",list(newY))
    .set_global_opts(title_opts=opts.TitleOpts(title="111"))
)

scatter.render("interp.html")


# interp_func = np.interp()