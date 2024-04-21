"""
森林火灾模拟的元胞自动机
先随机生成一些树(p0=0.8)用绿色来表示，灰地表示空地,红色表示燃烧着的火灾
规则如下:
一开始没有着火,只有森林和空地,生成森林的概率为0.8。
周围没有燃烧的树会以p1=0.0006的概率变成一棵燃烧的树，模拟闪电
燃烧着的树木,下一秒会变成空地,同时会有一定的概率比如p2=0.8,引燃周围的树
空地有一定的概率p3=0.001生长成新的树木
"""

#导包
import tkinter as tk
import random
import numpy as np
import time
Row=40#行数
Col=40#列数
side=10#正方形边长
height=Row*side#窗体的高度
width=Col*side#窗体的宽度
margin=1#间距
p0=0.8#随机初始化树的概率
p1=0.0006#树木随机生成闪电的概率
p2=0.8#引燃周围的树的概率
p3=0.001#空地生长为新的树的概率
tree=[]#存储坐标和状态0表示空地,1表示树,-1表示着火
def init():
    for i in range(Row):
        row=[]#存储这一行的新状态
        for j in range(Col):
            if random.random()<p0:
               row.append(1)
               canvas.create_rectangle(i*side,j*side,(i+1)*side-margin,(j+1)*side-margin,fill="green")
            else:
               row.append(0)    
               canvas.create_rectangle(i*side,j*side,(i+1)*side-margin,(j+1)*side-margin,fill="black")
        tree.append(row)
    update()
def update():
    global tree
    #随机引燃闪电
    if  random.random()<p1:#闪电劈树
        x=random.randint(0,20)#随机生成引燃的坐标
        y=random.randint(0,20)#
        if tree[x][y]==1:
            tree[x][y]=-1
    #开始更新 
    new_tree=[]
    for i in range(Row):
        row=[]#存储这一行的新状态
        for j in range(Col):
            flag=tree[i][j]#上一个时刻的状态
            if tree[i][j]==0:
                 if random.random()<p3:
                      flag=1
            elif tree[i][j]==1:
                 if tree[(i+Row)%Row][(j-1+Col)%Col]==-1 or tree[(i+Row)%Row][(j+1+Col)%Col]==-1 or tree[(i-1+Row)%Row][(j+Col)%Col]==-1 or tree[(i+1+Row)%Row][(j+Col)%Col]==-1:#如果周围有燃烧的树,那就有一定概率p2燃烧
                     if random.random()<p2:
                         flag=-1#变成燃烧的树
                 if random.random()<p1:#随机生成闪电的概率
                     flag=-1       
            elif tree[i][j]==-1:#如果在燃烧在下一时刻会变成空位
                 flag=0
            if flag==0:
               canvas.create_rectangle(i*side,j*side,(i+1)*side-margin,(j+1)*side-margin,fill="black")
            elif flag==1:
               canvas.create_rectangle(i*side,j*side,(i+1)*side-margin,(j+1)*side-margin,fill="green")
            elif flag==-1:
               canvas.create_rectangle(i*side,j*side,(i+1)*side-margin,(j+1)*side-margin,fill="red")
            row.append(flag)
        new_tree.append(row)
    tree=new_tree
    win.after(1,update)

win=tk.Tk()#创建窗口
win.title("元胞自动机森林火灾模拟")#标题
s=str(width)+"x"+str(height)
win.geometry(s)
canvas=tk.Canvas(win,height=height,width=width)#新建画布工具
canvas.pack()#放置在指定地方
init()
win.mainloop()