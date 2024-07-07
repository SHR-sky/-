import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif'] = 'simhei'
plt.rcParams['axes.unicode_minus']=False
 
data = pd.read_csv("data.csv")
data = np.array(data)
print(data)
 
#data是一个多维数组，所以可以用data[:,1]这种分片操作取某一列的值
plt.title("芯片不去偶小队体重占比")
plt.pie(data[0:3,1],labels=data[0:3,0],autopct="%.1ff%%")
plt.legend(data[0:3,0],loc="upper left")
plt.show()

plt.title("张煜体重变化情况")
plt.plot(data[3,1:5],data[1,1:5],'-*')
plt.xlabel("日期")
plt.show()
