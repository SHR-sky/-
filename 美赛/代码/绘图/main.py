from flask import Flask,render_template,request,url_for
import urllib.request
import urllib.parse
from bs4 import BeautifulSoup
import re

import requests  #替代浏览器进行网络请求
import numpy as np
import pandas as pd

#创建应用程序：web应用程序
app=Flask(__name__)

@app.route("/")  
def main():
    #将文件名存储在filename中
    filename='data.csv'   
    # 要读取的csv文件
    data=pd.read_csv(filename)  
    # 处理csv文件的数据
    xaxis=[i for i in range(0,20)]  # 横坐标
    all=data['all'].values.tolist()  # 展示数量1
    now=data['now'].values.tolist()  # 展示数量2
    dup=data['dup'].values.tolist()  # 展示数量3
    # 把数据传入HTML文件里面
    return render_template("002.html",xaxis=xaxis,data_all=all,data_now=now,data_dup=dup)

if __name__=='__main__':
    app.run(debug=True) #启动应用程序->启动一个flask项目