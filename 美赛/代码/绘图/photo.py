import os
import time
import csv
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif'] = 'simhei'
plt.rcParams['axes.unicode_minus']=False
i=0
j=0
k=0
x=0
cnt = 0
num = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
month = [1,1,2,3,4,5,6,7,8,9,10,11,12,12]
file = open("file.csv", 'w').close()
FileFloderPath = 'F:\\摄影\\hust'
FF = os.listdir(FileFloderPath)
for x in range (len(FF)):
    FFP = FileFloderPath + "\\" + FF[x]
    FilePathLists = os.listdir(FFP)
    for i in range (len(FilePathLists)):
        ImgFilePath = FFP + "\\" + FilePathLists[i]
        Imglist = os.listdir(ImgFilePath)
        for j in range(len(Imglist)):
            ImageDate = time.ctime(os.path.getmtime(ImgFilePath + '\\' + Imglist[j]))
            with open("file.csv","a",encoding="utf-8",newline="") as f:
                csv_writer = csv.writer(f)
                z = ImageDate
                csv_writer.writerow(z)
                print(z)
                cnt = cnt + 1
            f.close
data = pd.read_csv("file.csv")
data = np.array(data)
for k in range(cnt-1):
    if(data[k,4] == 'D' and data[k,5] == 'e' and data[k,6] == 'c'):
        num[12]=num[12]+1
    if(data[k,4] == 'N' and data[k,5] == 'o' and data[k,6] == 'v'):
        num[11]=num[11]+1
    if(data[k,4] == 'O' and data[k,5] == 'c' and data[k,6] == 't'):
        num[10]=num[10]+1
    if(data[k,4] == 'S' and data[k,5] == 'e' and data[k,6] == 'p'):
        num[9]=num[9]+1
    if(data[k,4] == 'A' and data[k,5] == 'u' and data[k,6] == 'g'):
        num[8]=num[8]+1
    if(data[k,4] == 'J' and data[k,5] == 'u' and data[k,6] == 'l'):
        num[7]=num[7]+1
    if(data[k,4] == 'J' and data[k,5] == 'u' and data[k,6] == 'n'):
        num[6]=num[6]+1
    if(data[k,4] == 'M' and data[k,5] == 'a' and data[k,6] == 'y'):
        num[5]=num[5]+1
    if(data[k,4] == 'A' and data[k,5] == 'p' and data[k,6] == 'r'):
        num[4]=num[4]+1
    if(data[k,4] == 'M' and data[k,5] == 'a' and data[k,6] == 'r'):
        num[3]=num[3]+1
    if(data[k,4] == 'F' and data[k,5] == 'e' and data[k,6] == 'b'):
        num[2]=num[2]+1
    if(data[k,4] == 'J' and data[k,5] == 'a' and data[k,6] == 'n'):
        num[1]=num[1]+1
plt.title("大一至今出片数量图")
plt.pie(num[1:13],labels=month[1:13],autopct="%.1ff%%")
plt.legend(month[1:13],loc="upper left")
plt.show()

plt.title("大一至今出片数量曲线")
plt.plot(month[1:13],num[1:13],'-*')
plt.xlabel("日期")
plt.show()