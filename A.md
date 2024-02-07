# 七鳃鳗性别比例对

## Introduction

### 问题背景
一个种群，其发展与延续必然依赖于繁殖。基因在亲代与子代间传递与变异，繁殖是它的桥梁。我们最为熟知的繁殖是有性繁殖，其种群内部分为雄性与雌性，二者之比成为性比。基于有性繁殖的种群，由于有性生殖来自于两个不同性别生物个体的遗传信息互相结合，所以种群的出生率（增长率）受到性比很大的影响。所以，基于性染色体结合的概率考虑，虽然许多物种在出生时表现出1:1的性别比例，但为了适应环境、延续种群，物种往往会偏离了均匀的性别比例。这被称为适应性性别比变化。七鳃鳗就是这样一个典型的物种。

然而，七鳃鳗的角色很复杂。对于一些湖泊栖息地，它是对生态系统有重大影响的寄生虫，但同时，七鳃鳗也是世界上一些地区的食物来源，并且味道鲜美，受人追捧。

所以，在某些时候，我们烦恼于其性比变化带来的适应能力，希望减少其数量，某些时候，我们又希望它们的这种能力能够得到发挥，从而挽救某些地区濒危的原生种群，以及带来养殖的经济效应

我们研究根据资源可用性改变其性别比例的能力的利弊，建立模型描述其与生长速率的关系，从而研究其对其对生态系统中其他物种的影响，利用七鳃鳗性比变化的优势与劣势，人为影响其种群，保证生态系统的稳定性，从而将这个模型应用到养殖、保护七鳃鳗，以及某些地区对入侵七鳃鳗的防治。

-----------------------

改版

一个种群，其发展与延续必然依赖于繁殖。基于有性繁殖的种群，种群的出生率（增长率）受到性比很大的影响。所以，基于性染色体结合的概率考虑，虽然许多物种在出生时表现出1:1的性别比例，但为了适应环境、延续种群，物种往往会偏离了均匀的性别比例。这被称为适应性性别比变化。七鳃鳗就是这样一个典型的物种。

然而，七鳃鳗的角色很复杂。对于一些湖泊栖息地，它是对生态系统有重大影响的寄生虫，我们希望减少其繁殖；但同时，七鳃鳗也是世界上一些地区的食物来源，并且味道鲜美，受人追捧，在某些地区濒危，我们希望促进其繁殖。

所以，我们研究根据资源可用性改变其性别比例的能力的利弊，建立模型描述其与生长速率的关系，从而研究其对其对生态系统中其他物种的影响，利用七鳃鳗性比变化的优势与劣势，人为影响其种群，保证生态系统的稳定性，从而将这个模型应用到养殖、保护七鳃鳗，以及某些地区对入侵七鳃鳗的防治。









### 问题重述



- 开发和检查一个模型，以提供对当七鳃鳗的种群可以改变其性别比例时，对更大的生态系统的影响的见解 develop and examine a model to provide insights into  the impact on the larger ecological system when the population of lampreys can alter its sex ratio

- 结合问题一的模型，评价改变性别比例能力在相同RA条件下的优势与劣势。



- 研究性别比例的对生态系统稳定性的影响，即在之前模型的基础上，考虑种群性别比例改变，对其他种群影响，从而评价对生态系统的影响


- 



### 工作概要
为了去找到性别比例与环境可用性的关系，我们建立了种群的动态变化模型，并且在模型中逐步添加捕食者、寄生者相互作用，构成了可变性比对生态系统的影响模型，并且最后依据该模型，提出了性比控制对于生态系统中人类的作用。

为了解决这些问题，我们团队将做以下工作：
- 作出假设，将复杂的生态系统以及其中的相互作用关系（如食物链关系），简化为可行的资源-压力关系，并且加入了典型的捕食、寄生关系，用于客观模拟种群变化
- 建立种群模型。基于Logitics模型和种群动力学方程，建立了性别比例-环境可用性的模型，研究其对种群自身，以及生态系统的影响
- 建立生态系统相互作用模型。基于Lotka–Volterra方程式，分别引入捕食者和寄生者，改良模型使其可以描述生态系统中各种群的相互影响，以研究性比的作用，并且采用熵权法改进的TOPSIS评价模型，研究对生态系统稳定性的影响
- 讨论模型的灵敏度以及结论



## 假设与合理性论证



- 环境稳定，在种群基础上考虑问题
- 











$$
\frac{N(t')-N(t)}{t'-t}=\frac{\Delta N}{\Delta t}=\frac{\mathrm{d}N_{M}}{\mathrm{d}t}
$$








我们首先考虑七鳃鳗的性别比例对于所处系统可用性资源的影响，在一个可用性资源为RA理想的生态系统中，设七鳃鳗与性别有关的繁殖率为r，种群中雄性总数为NM，雌性总数为NF，七鳃鳗的总数为TNF，可以得到方程：

$$
X = N_{F} + N_{M} 
$$
在该生态系统中，下一代的数量，即出生数量总是由种群现在的七鳃鳗总数量决定的，所以，Δ 公式 即 dNf/dNt 是由目前的r，RA，NF, NM决定，我们将后代的公母分开考虑，可得到
$$
\begin{cases}
\frac{\mathrm{d}N_{M}}{\mathrm{d}t}=F(r,RA,N_{F},N_{M})\
 \\
\frac{\mathrm{d}N_{F}}{\mathrm{d}t}=G(r,RA,N_{F},N_{M})\\
\end{cases}
$$
其中，显然，由于该物种进行有性生殖，所以七鳃鳗的繁殖率和雄性和雌性七鳃鳗的个数及其比例有关，可以表达为：
$$
r = \mu(N_{M},N_{F})
$$
并且，由于一个不考虑外来影响、稳定的生态系统中，资源的总量总是一定的，而种群会占据一定的资源。故此，当我们考虑七鳃鳗种群对环境资源的影响时，未被七鳃鳗占用、余下的资源则为可用性资源，显然，可用性资源与七鳃鳗种群中个体的总数成负相关关系
$$
RA = \xi(X)
$$
因此，联立方程（），我们可以知道，方程（）可以表示为
$$
\begin{cases}
\frac{\mathrm{d}N_{M}}{\mathrm{d}t}=F(N_{F},N_{M})\
 \\  \\
\frac{\mathrm{d}N_{F}}{\mathrm{d}t}=G(N_{F},N_{M})\\
\end{cases}
$$
在这里引入logistics模型，并且我们认为七鳃鳗繁衍速度和环境可用性资源成正比，同时也和繁殖率成正比，死亡速率和七鳃鳗数量成正比，死亡系数为β。
由于七鳃鳗的幼崽在成年时才会分化性别，性别会受到环境因素影响。现在先假定在短时间内环境条件不会变，因此设雄性分化率a，雌性分化率为（1-a）为因此我们假设可以得到方程：
$$
\begin{cases}
\frac{\mathrm{d}N_{M}}{\mathrm{d}t}=r \cdot \alpha RA-\beta N_{M} \\
 \\
\frac{\mathrm{d}N_{F}}{\mathrm{d}t}=r \cdot(1 - \alpha )RA-\beta N_{F} \\
\end{cases}
$$
接下来，为了消去消去方程中含有的（），得到只含有（）（）的方程，我们首先确定r的方程，根据繁衍率方程变形可以得到：
$$
r = c\frac{N_{F}N_{M}}{(N+M)^{2}}
$$
其中c为繁衍率系数

接下来确定RA的方程，已经知道它是M和W的二元函数，当数量越多，可用性资源越少，并且他们具有线性关系，设资源利用能力为a因为雄性利用资源能力更强，有a1大于a2，我们假定方程：
$$
RA = RA_{max} - (a_{F}F+a_{M}M)
$$
其中RAmax为未引进七鳃鳗物种时，环境中七鳃鳗可利用资源最大值。

综合以上方程，我们可以得到方程：
$$
\begin{cases}
\frac{\mathrm{d}N_{M}}{\mathrm{d}t}=c\frac{N_{F}N_{M}}{(W+M)^{2}} \cdot \alpha [RA_{max} - (a_{F}F+a_{M}M)]-\beta N_{M} \\
 \\
\frac{\mathrm{d}N_{F}}{\mathrm{d}t}=c\frac{N_{F}N_{M}}{(W+M)^{2}} \cdot(1 - \alpha )[RA_{max} - (a_{F}F+a_{M}M)]-\beta N_{F} \\
\end{cases}
$$
查阅资料后，我们了解到每次七鳃鳗进行繁殖后，双亲都会死亡，因此我们还需要加入双亲的死亡修正项，设每对雌雄双亲能够产生的子代数量为lanta，可以得到方程
$$
\begin{cases}
\frac{\mathrm{d}N_{M}}{\mathrm{d}t}=c\frac{N_{F}N_{M}}{(W+M)^{2}} \cdot \alpha [RA_{max} - (a_{F}F+a_{M}M)]-\beta N_{M}-\frac{r\cdot RA}{\lambda} \\
 \\
\frac{\mathrm{d}N_{F}}{\mathrm{d}t}=c\frac{N_{F}N_{M}}{(W+M)^{2}} \cdot(1 - \alpha )[RA_{max} - (a_{F}F+a_{M}M)]-\beta N_{F}-\frac{r\cdot RA}{\lambda} \\
\end{cases}
$$
该微分方程只含w和m俩个变量，对时间进行求解，能够得出M（t）和W（t）的最终结果，经过Matlab解得到：




结果分析

由于RA代表资源可用性，所以随着时间的增长，种群繁衍，种群中七鳃鳗总数量增加，占用资源变多，导致RA减小，种群增长率减小，最终与死亡率近似相等，种群中个体数量几乎不再增长，从图A可以明显看出，并且随着个体数量的稳定，占用资源总数也不再变化，RA也就不变。

为了更好的研究研究，七鳃鳗性别比例可变对环境的影响，我们以图A为基础，将曲线整合到图B，发现稳定状态下，RA与alpha的关系并非单调，所以我们绘制了图C以观察其中关系。

从图C中，我们可以发现，在78%到56%这一段上，随着alpha的减小，系统稳定状态下的的RA在逐渐下降，说明种群占用资源的能力越来越强，并且在56%时RA最小，占用能力达到最大。

同时，由已知条件，在食物供应不足的环境中，生长速度会更低，雄性的比例可以达到人口的78%左右。在食物更容易获得的环境中，据观察，雄性的比例约占人口的56%。

两者之间形成佐证，由于资源充足条件下，种群更容易繁殖，同时种内竞争小，整个种群会表现得倾向于占用更多资源，使得alpha更小，这与在食物更容易获得的环境中，雄性的比例约占人口的56%小于78%相印证。并且，该模型所得到的图C中的极小值点对应的alpha值60%与真实情况的56%极为接近，说明模型效果良好。

最终，我们绘制图A，得到结论：当性比可以变化时，面对充足的资源，雌性比例会升高，使种群繁殖更快，占用资源更多。
This is the impact on the larger ecological system when the population of lampreys can 
alter its sex ratio



我们采用了热力图，可视化不同性别比例下，七鳃鳗种群对资源的消耗，颜色越浅，可用资源越少，七鳃鳗对生态系统的影响越大，反映了种群总体消耗越多。热力图横轴为时间，用于表现同一性比例下，种群繁衍对生态环境的影响；纵轴为性别比例，用于对比不同性别比例下，对环境资源的不同影响。

我们假设最开始的可用资源总数一样，为80，突出显示初始资源下降到一半，即40左右时的方格，我们可以看出，大概呈现一个从右下角向外凸的趋势，即沿着斜对角线向下时，雌性比例升高，占用的资源增多，这说明当种群中雌性的比例变大时，种群整体消耗的资源的能力更强。

结合食物更容易获得的环境中，雄性比例下降，雌性增多，我们可以知道生态系统资源充足时，七鳃鳗的性别比例变化，雄性从78%左右变为56%左右，让雌性更多，使得整个种群消耗资源能力更强，占有的资源更多，而种群的物质与能量越多，就越有利于种群自身发展，使得更大的生态系统中资源被快速消耗。


并且，我们还可以发现，当几乎只有雄性时，种群更容易灭绝，




消耗，说明在食物供应不足的环境中，生长速度会更低，雄性的比例可以达到人口的78%左右。在食物更容易获得的环境中，据观察，雄性的比例约占人口的56%


当七鳃鳗的种群可以改变其性别比例时，对更大的生态系统有什么影响?











# 问题二

由于在实际情况下，结合问题一模型，我们可以知道随着种群占有的资源增多，数量X变多，每个个体所分到的资源会减少，会导致种群中个体生长速率变慢，又因为已知生长速度较低时，幼体跟倾向于分化为雄性，所以资源可用性会导致性别比例的变化，同时由于性别比例还会影响七鳃鳗种群的捕食能力（资源占用能力），反过来作用于资源可用性。所以，当将七鳃鳗种群引入到生态系统中，考虑不同种群间的相互作用时，这其中必然会出现反馈关系，导致性别比例α动态变化。所以，在这个问题中，我们考虑性别比例的动态变化，列写其与可用性资源变化相关的动力学方程，同时引入捕食者模型，通过探索性别比例如何影响七鳃鳗捕食，从而研究这种变化的优劣。

根据题目所给条件，在营养充足情况下，α在56%左右，在营养不足情况下，α在78%左右，那么我们引入min-max标准化公式进行优化，假定营养层是均匀分布的，每一层对应56%到78%的雄性七鳃鳗雄性转化率，因此得出公式：
$$
\alpha = 56\% + \frac{78\%-56\%}{R_{max}-0}(R_{max}-R_{a})
$$
引用模型一中的模型：
$$
\begin{cases}
\frac{\mathrm{d}N_{M}}{\mathrm{d}t}=r \cdot \alpha RA-\beta N_{M} - \frac{rRA}{\lambda}\\
 \\
\frac{\mathrm{d}N_{F}}{\mathrm{d}t}=r \cdot(1 - \alpha )RA-\beta N_{F} - \frac{rRA}{\lambda} \\ \\
r = c\frac{N_{F}N_{M}}{(R_{F}+R_{M})^{2}}
\end{cases}
$$
但鉴于我们参考的指标不同，我们将模型一中的rRA进行处理。他是衡量七鳃鳗繁殖速率的指标，我们根据LV（展开）方程可以类比知道，rRA正比于被捕生物的数量，记为U。

RA正比于雌雄七鳃鳗捕食的能力和数量，因此我们可以列出关系式：
$$
rRA = \epsilon_{1} U (a_{F}N_{F}+a_{M}N_{M})
$$
其中epsilon为捕食者的捕食者对被捕食者的捕食转换系数

根据LV方程针对雌雄七鳃鳗不同的捕食能力加以修正，我们可以得到被捕食者的变化速率方程：
$$

\frac{\mathrm{d}U}{\mathrm{d}t}=hU-\epsilon_{2}U(a_{F}N_{F}+a_{M}N_{M})

$$
其中h为被捕食者的自然增长速率，epsilon2为被捕食者对捕食者的捕食转换系数，综合以上方程和关系式我们可以得出

$$
\begin{cases}
\frac{\mathrm{d}N_{M}}{\mathrm{d}t}=\left( \alpha-\frac{1}{\lambda} \right)\epsilon_{1}U(a_{F}N_{F}+a_{M}N_{M})\\
 \\
\frac{\mathrm{d}N_{F}}{\mathrm{d}t}=\left( 1- \alpha-\frac{1}{\lambda} \right)\epsilon_{1}U(a_{F}N_{F}+a_{M}N_{M}) \\ \\
\frac{\mathrm{d}U}{\mathrm{d}t}=hU-\epsilon_{2}U(a_{F}N_{F}+a_{M}N_{M})
 \\
 \\
r = c\frac{N_{F}N_{M}}{(R_{F}+R_{M})^{2}} \\
 \\
RA = \frac{\epsilon_{1}U(a_{F}N_{F}+a_{M}N_{M})}{2} \\
 \\
\alpha = 56\% + \frac{78\%-56\%}{R_{max}-0}(R_{max}-R_{a})
\end{cases}
$$

其中M，W，U，α，Ra，r均为变化量

使用matlab进行建模，得出谁和谁的关系图——

由图A，我们可以发现，当性别比例可变时，虽然种群个体总数由于种群间的相互作用，会出现正常的波动，但是长期来看，会逐渐稳定下来，趋近于一个值。由图B，我们可以看到，这个收敛过程是具有一定
周期性的，所以，我们选取其中的一段，如图C所示，进行分析

首先，我们可以看到，在Prey曲线的极大值点处，被捕食者最多时，也就是RA最大时，性别比例接近56%，与实际情况相符，说明模型良好地反映了实际。

然后，我们可以看到，当被捕食者减少时，RA减少，雌性下降地更快，由文献可知，雄性的体长更长，适应环境的能力更强，更能在严苛的环境下，生存并且延续种群。所以，事物减少时，七鳃鳗性别比例改变，让雄性占比增大，可以让雌性下降更快，让雄性相对增多，种群适应能力增强。

同时，结合模型一，由图A可以看到，资源充足时，若雌性占比更多，种群的繁殖速度会更快，最终数量也会更多，也就是雌性

所以，这说明了性别比例可变的优点，也就是能在资源少的时候，提高雄性比例，够应对环境压力。还能在资源多的时候，降低雄性比例，提高种群繁殖速度。

并且，我们以七鳃鳗及其捕食者的数量为笛卡尔坐标系的轴，建立相图，让七鳃鳗与被捕食者间的相互作用关系更加明显，并且为之后量化做准备。

可以看到，图A表示当时间趋近于无穷时，两者的数量变化关系，当猎物数量开始上升，随后不久七鳃鳗的数量也会跟着上升。由于可抓的猎物多了，RA变大，增长率变大。七鳃鳗数量增多之后，过度捕猎会导致猎物的种群规模减小。这样以来自身生存依赖的猎物减少，RA减小，七鳃鳗的数量也随之减小。此时，由于来自于七鳃鳗的威胁变小了，猎物种群又开始加速繁衍，种群规模快速攀升。如此不断反复。猎食者的数量波动相比于猎物的数量总是呈现大约四分之一个周期的滞后效应，我们能很直观地看到猎物和猎食者的种群规模此消彼长的变化关系。

图B中，我们固定了幼年七鳃鳗的性别分化比例，可以发先，曲线的变化幅度明显更大，曲线的面积远大于可变性比对应的面积，说明性比固定时，七鳃鳗种群稳定性会变差，说明了可变性比的优势——让七鳃鳗种群更稳定。

但是，这同样存在弊端，当雄雌比例偏离1：1过大时，一方灭绝的风险会增大，而只能有性生殖的种群，一种性别灭绝就意味着种群的灭绝。












# 问题三

![](file:///C:/Users/sky/AppData/Local/Temp/msohtmlclip1/01/clip_image002.gif)

由于建立的模型以动力学系统模型，所以我们采用自动控制原理，来研究这个系统的稳定性，同时结合第二问中，七鳃鳗种群自身的稳定性从而得到七鳃鳗性别变化对生态系统稳定性的影响。

我们采用Lyapunov 指数来衡量系统内部的稳定性，这样我们不仅可以定性衡量性别比例对生态系统稳定性的影响，还可以定量分析、比较不同性别比例的影响程度。

先假设性别转换不变为a。而为了衡量这个稳定性，我们在问题二的基础上再增加了七鳃鳗的天敌，数量为P，以及七鳃鳗的竞争者，数量为H，根据LV方程，我们前面七鳃鳗的死亡率考虑了被天敌杀死的的数量，因此这次我们将死亡速率进行修正，他由自然死亡速率，竞争速率和被捕食速率组成，自然死亡率和本身数量成正比，竞争速率和自身数量还有竞争者数量成正比，被捕食速率和自身数量和天敌数量成正比，修正方程

$$
\begin{cases}
\beta N_{M} = \beta_{1}N_{M} + \epsilon_{3}N_{M}P + \theta_{1}a_{M}N_{M}H \\ \\
\beta N_{F} = \beta_{1}N_{F} + \epsilon_{3}N_{F}P + \theta_{1}a_{F}N_{F}H
\end{cases}
$$
我们根据lv方程可以得到天敌和竞争者的方程：
$$
\begin{cases}
\frac{\mathrm{d}P}{\mathrm{d}t}=-\beta_{2}P + \epsilon_{4}(a_{1}N_{F}+a_{2}N_{M})P\\ \\
\frac{\mathrm{d}H}{\mathrm{d}t}=h_{2}H-\theta_{1}(a_{1}N_{F}+a_{2}N_{M})H
\end{cases}
$$
结合问题二的模型，我们先行列出该系统的微分方程：

$$
\begin{cases}
\frac{\mathrm{d}N_{M}}{\mathrm{d}t}=\left( \alpha - \frac{1}{\lambda} \right)\epsilon_{1}U(a)(a_{F}N_{F}+a_{M}N_{M})-\beta_{1}N_{M}-\epsilon_{3}N_{M}P-\theta_{1}a_{M}N_{M}\\
 \\
\frac{\mathrm{d}N_{F}}{\mathrm{d}t}=\left( 1-\alpha-\frac{1}{\lambda}\right)\epsilon_{1}U(a_{F}N_{F}+a_{M}N_{M})-\beta_{1}N_{F}-\epsilon_{3}N_{F}P-\theta_{1}a_{F}N_{F}\\ \\
\frac{\mathrm{d}U}{\mathrm{d}t}=hU-\epsilon_{2}U(a_{F}N_{F}+a_{M}N_{M})\\ \\
\frac{\mathrm{d}P}{\mathrm{d}t}=-\beta_{2}P + \epsilon_{4}(a_{1}N_{F}+a_{2}N_{M})P\\ \\
\frac{\mathrm{d}H}{\mathrm{d}t}=h_{2}H-\theta_{1}(a_{1}N_{F}+a_{2}N_{M})H
\end{cases}
$$

其中ε为捕食转换系数，θ为竞争转换系数，h为自然增长系数，β为自然死亡率。
为了计算L值，我们需要构建矩阵形式的微分方程：
$$
\begin{cases}
\frac{\mathrm{d}N_{M}}{\mathrm{d}t}=f(N_{M},N_{F},U)\\
 \\
\frac{\mathrm{d}N_{F}}{\mathrm{d}t}=g(N_{M},N_{F},U)\\ \\
\frac{\mathrm{d}U}{\mathrm{d}t}=h(N_{M},N_{F},U) \\
  \\
\frac{\mathrm{d}P}{\mathrm{d}t}=\phi(N_{M},N_{F},U) \\
 \\
\frac{\mathrm{d}U}{\mathrm{d}t}=\rho(N_{M},N_{F},U)
\end{cases}
$$
为了方便计算我们记算，将方程化为矩阵形式
$$
Y =
\begin{bmatrix}
M \\ W \\ U \\ P \\H
\end{bmatrix}
$$

引入 Jacobian 矩阵J它描述了系统在平衡点附近的局部线性行为：

$$
J = 
\begin{bmatrix}
\frac{\mathrm{d}f}{\mathrm{d}N_{M}} & \frac{\mathrm{d}f}{\mathrm{d}N_{F}} &\frac{\mathrm{d}f}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U}\\
\frac{\mathrm{d}g}{\mathrm{d}N_{M}} & \frac{\mathrm{d}g}{\mathrm{d}N_{F}} & \frac{\mathrm{d}g}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U}\\
\frac{\mathrm{d}h}{\mathrm{d}N_{M}} & \frac{\mathrm{d}h}{\mathrm{d}N_{F}} & \frac{\mathrm{d}h}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U} \\
\frac{\mathrm{d}f}{\mathrm{d}U}&\frac{\mathrm{d}f}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U} \\
\frac{\mathrm{d}f}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U} &\frac{\mathrm{d}f}{\mathrm{d}U}
\end{bmatrix}
$$

进行线性化处理，得到线性化的矩阵方程组：

$$
\frac{\mathrm{d}Y}{\mathrm{d}t}=JY
$$
然后计算系统的平衡点，假设dY/dt =0 时, Y0：
$$
Y_{0} =
\begin{bmatrix}
M_{0} \\ W_{0} \\ U_{0}
\end{bmatrix}
$$

平衡点可能有n组解，我们将第i组平衡点解带入Jacobian 矩阵，算出J的特征值lambda：

$$
\mid J\mid-\lambda T\mid = 0
$$

该方程一共有i组参数，每组参数可能有m个解（通常m和n的值相等），我们将第i组参数的第j个解带入到Lyapunov 指数的公式：

$$
L_{ij}=\lim_{ t \to \infty } 1/t\ln(\mid e^{\lambda_{ij}t}\mid) 
$$

Lij表示第i组平衡点的第j个特征值下的Lyapunov 指数，我们根据自动控制理论可以知道，每组特征值反映了系统在相应平衡点附近的稳定性信息。我们对每一组特征值分析该平衡点的稳定性信息，再分析每一个组平衡点的稳定性信息得出该系统总的稳定性信息。


$$
\frac{\mathrm{d}Y}{\mathrm{d}t}=0
$$

现在我们得到在固定性别转换系数a下的系统稳定性，接着我们借助问题一的模型讨论a随系统资源可用性变化时系统的稳定性，加入时变方程：

重新进行以上步骤，我们可以得到固定a和变化a下系统的稳定性水平









问题四



我们在第三问的模型中已经将更多的生态系统参与者以变量形式加入进来（第一二问是假设他们不变）因此我们借助第三问的微分方程：

可以得到物种连续变化的一个示意图，但这次我们考虑七鳃鳗性别比例对于七鳃鳗竞争者（也就是寄生虫）以及七鳃鳗的天敌的影响，并且进行定性定量分析。

当a不变化如下：

![TMN9WPLK(N}_VR_WL%JPA57](file:///C:/Users/sky/AppData/Local/Temp/msohtmlclip1/01/clip_image004.jpg)

（这个换个横轴小的图，不看稳定性，第三问分析过了）

可以得出结论：

当a是变化，满足方程：

![](file:///C:/Users/sky/AppData/Local/Temp/msohtmlclip1/01/clip_image006.gif)

我们可以结合上面微分方程，得到如下物种变化：

![[WGIR{`RMOS6}TXJ3[9`T5U_tmb](file:///C:/Users/sky/AppData/Local/Temp/msohtmlclip1/01/clip_image008.jpg)

可以得出结论：

我们在对比a变和不变分析可以知道：  性别比例如何影响其他参与者

同时自然中物种数量变化是离散的，我们再度引入了元胞自动机进行可视化处理，便于我们更容易了解其中的变化过程。我们通过问题一和问题二已经了解到了七鳃鳗作为捕食者与被捕食者的关系，现在我们只考虑七鳃鳗以及竞争者还有天敌三个物种进行

本文讨论三者之间相互作用主要表现在俩个方面，捕食关系和竞争关系，寄生者和七鳃鳗构成竞争关系，天敌和七鳃鳗构成捕食关系

我们的工作量是量化这三个方面的内容。我们将生态系统用n×n小格组成，我们用一小格代表一个地区，每一格都是一个种群。当天敌和寄生者占据一个地区时，会受到周围八格中七鳃鳗的影响，使其死亡率和增长率受到变化，同时七鳃鳗性别的不同导致的影响程度也不相同。

对于3个种群来说他们的蔓延情况有方程，其中sigmma为蔓延因子：

$$
\sum\limits_{m=-1}^{1}\sum\limits_{n=-1}^{1}P_{i+m,j+m}(t+\Delta t) = \sigma P_{ij}(t)
$$
蔓延因子是元胞自动机的临近规则系数，和捕食关系和竞争关系有关，它也展现该生态系统下物种，并且等于增长率减去死亡率。

增长率是由自身的自然增长速率加上与其他种群相关的速率，死亡率都是自然死亡速率加上与其他种群相关的速率，根据前面模型三的部分分析,我们得出四个蔓延因子，并且做出总的动态变化方程
$$
\begin{cases}
\sum\limits_{m=-1}^{1}\sum\limits_{n=-1}^{1}P_{i+m,j+m}(t+\Delta t) = [(\sigma_{1}-\beta_{1}) + K_{1}(a_{F}F_{ij}(t) + a_{M}M_{ij}(t))]P_{ij}(t)\\
\sum\limits_{m=-1}^{1}\sum\limits_{n=-1}^{1}H_{i+m,j+m}(t+\Delta t) = [(\sigma_{2}-\beta_{2}) - K_{2}(a_{F}F_{ij}(t) + a_{M}M_{ij}(t))]H_{ij}(t) \\
\sum\limits_{m=-1}^{1}\sum\limits_{n=-1}^{1}N_{Fi+m,j+m}(t+\Delta t) = [(b_{3}\alpha-\beta_{3}) - K_{4}a_{F}P_{ij}(t) - K_{5}a_{M}H_{ij}(t)]N_{Fij}(t) \\
\sum\limits_{m=-1}^{1}\sum\limits_{n=-1}^{1}N_{Mi+m,j+m}(t+\Delta t) = [(b_{3}(1-\alpha)-\beta_{3}) - K_{4}a_{M}P_{ij}(t) - K_{5}a_{F}H_{ij}(t)]P_{ij}(t)
\end{cases}

$$

![](file:///C:/Users/sky/AppData/Local/Temp/msohtmlclip1/01/clip_image014.gif)

综上，我们通过matlab得到：












































元胞自动机

元胞自动机规则
 

自动机的元胞只有三种——七鳃鳗 和 竞争者（寄生物）和 捕食者，并且由于每一格都代表种群，三种不同元胞不可重合

七鳃鳗格子有参数：总数量，性别比例，增长率，死亡率，被捕食率，被竞争率
捕食者格子有参数：总数量，增长率，死亡率，捕食率
竞争者格子有参数：总数量，增长率，死亡率，竞争率

其中（为了方便叙述，我都认为是线性的，具体建模可以改为非线性的函数关系，由于这是离散的，两者并无本质区别）

捕食者增长率 = 捕食率 乘以 常数 + 常数
竞争者增长率 = 竞争率 乘以 常数 + 常数
七鳃鳗增长率 = 性别比例 乘以 常数 + 常数

七鳃鳗性别比例 = 周围八格的空格 乘以 常数

捕食者死亡率 = 常数
竞争者死亡率 = 常数
（与七鳃鳗之间的相互作用，全部等效在增长率上，所以此处可以都认为是常数）
七鳃鳗死亡率 = 负常数 乘以 竞争率 + 负常数 乘以 捕食率 + 常数

竞争率 = 常数 乘以 竞争者周围八格的七鳃鳗数 （此处忽略种间竞争）
被竞争率 = 常数 乘以 七鳃鳗周围八格的竞争者数
捕食率 = 常数 乘以 竞争者周围八格的七鳃鳗数 
被捕食率 = 常数 乘以 七鳃鳗周围八格的捕食者数

最后，考虑种群分开与组合
对于以上三种元胞
上下左右四个格子中，如果有 空格/同种元胞 就移动过去随机数量的（也就是总数量减随机数，空格/同种元胞 加上这个数）
若没有空格或相同细胞，就不动

H寄生者，P捕食者

|

本文讨论了三者之间的相互作用。主要表现在两个方面: 捕食与竞争。寄生者H与七鳃鳗构成竞争关系，捕食者P与七鳃鳗构成捕食关系。
我们的工作是量化这三个方面的内容。我们用一小格代表一个地区，每一格都是一个种群，当七鳃鳗种群占据一个地区时，会受到周围八格中竞争者和捕食者的影响，使其死亡率发生变化，同时其增长率受到，种群内部性别比例的影响。我们将捕食者的影响称为捕食率，这影响捕食者增长率和七鳃鳗死亡率；我们将寄生者的影响称为竞争率，这影响竞争者增长率和七鳃鳗死亡率。

当程序进入循环，我们引入具体规则：当种群可能向周围八格中随机迁徙，并且通过每个物种周围八格其他物种的存在情况，来分别计算七鳃鳗、捕食者、寄生者种群的增长率和死亡率，算式如下：

综上，我们在matlab完成仿真。





总结一
引入环境可用资源的概念，研究发现可变的性别比例，让七鳃鳗种群利用资源的能力更强，让更大的生态系统中的资源可用性更低

总结二
引入被捕食者，研究这条食物链，发现可变的性别比例带来的优势是，让资源不足时，七鳃鳗种群更能适应环境的雄性增多，使得种群可以应对更大环境压力，资源充足的时候，七鳃鳗种群更有利于繁衍和占用资源的雌性增多，使得种群能够占据生态系统中更多的资源

总结三
引入捕食者和竞争者，构成典型的食物网，使模型描述了一个可以被研究的生态系统，从而引入自动控制理论的L指数，发现七鳃鳗性别比例的变化，让生态系统稳定性更强

总结四
在模型三的基础上，离散化模型，使其更加符合现实中种群内部繁衍的规律，并且引入元胞自动机，来描述整个生态系统中各个种群间的相互作用，最终发现在七鳃鳗种群中具有可变性别比例的生态系统中，七鳃鳗种群更加稳定导致了其他种群也更加稳定，并且用元胞自动机进行了可视化



优点与改进
优点




改进：
- 本模型基于运算的方便、模型复杂度的考虑，只考虑三种典型种群构成的两个典型关系，但实际上，自然界的种群更多，也在存在互利共生等更多复杂的关系。
- 本模型忽略了生产者转化外部能量的环节，而是认为系统的物质与能量始终保持稳定，也就是可用资源总量不变，但是实际上，生态系统不是一个孤立的系统，存在外部物质与能量的影响












Summary I.
Introducing the concept of environmentally available resources, the study found that variable sex ratios allow lamprey populations to utilize resources more and allow for lower resource availability in larger ecosystems

Summary Two
Introducing the concept of predators and examining this food chain, it was found that variable sex ratios have the advantage of increasing the number of males who are better able to adapt to the environment when resources are scarce, allowing the population to cope with greater environmental pressures, and increasing the number of females who are better able to reproduce and take up resources when resources are plentiful, allowing the population to take up a greater share of the resources in the ecosystem

Summary Three
The introduction of predators and competitors that form a typical food web allows the model to describe an ecosystem that can be studied, thus introducing the L-index of automated control theory, which was found to change the sex ratio of lampreys, allowing for greater ecosystem stability

Summarize IV
On the basis of model three, the model was discretized to make it more consistent with the real law of reproduction within populations, and metacellular automata were introduced to describe the interactions among populations in the whole ecosystem, and it was finally found that in ecosystems with variable sex ratios in the lamprey population, the greater stability of the lamprey population led to greater stability of the other populations as well, and was visualized with metacellular automata



Advantages and Improvements
Advantages




Improvements:
- This model is based on the convenience of arithmetic, model complexity considerations, only consider three typical populations constitute two typical relationships, but in fact, the natural world has more populations, but also in the existence of mutualistic symbiosis and other more complex relationships.
- The model ignores the transformation of external energy by producers, and considers that the material and energy of the system always remain stable, that is, the total amount of available resources remains unchanged, but in fact, the ecosystem is not an isolated system, and there are influences of external material and energy.






 Sensitivity analysis of β and L




























\begin{table}[!htbp]
	\begin{center}
		\begin{threeparttable}
			\caption{The data of sea lamprey}
			\begin{tabular}{ccccc}
				\toprule
				\multicolumn{1}{m{2cm}}{\centering Year}
				&\multicolumn{1}{m{2cm}}{\centering \% Males}
				&\multicolumn{1}{m{2cm}}{\centering n}
				&\multicolumn{1}{m{2cm}}{\centering Males}
				&\multicolumn{1}{m{2cm}}{\centering Females}\\
				\midrule
				$2007$&53\%&3,124&1,666&1,460\\
				$2008$&57\%&2,228&1,264&964\\
				$2009$&54\%&2,725&1,485&1,240\\
				$2010$ &58\%&8,841&5,146&3,695\\
				$2011$ &60\%&10,912&6,555&4,357\\
				$2012$ &60\%&14,047&8,442&5,605\\
				$2013$ &61\%&8,947&5,495&3,452\\
				$2014$ &59\%&8,696&5,131&3,565\\
				\bottomrule
			\end{tabular}\label{tb:002}
			\small
			1. Sex ratio of sea lamprey in tributaries to Lakes Michigan and Huron\cite{3}
			
			2. the sum number of the Males is 59,522, for females the number is 59,522 
		\end{threeparttable}
	\end{center}
\end{table}



\begin{table}[!htbp]
	\begin{center}
		\begin{threeparttable}
			\caption{The data of sea lamprey}
			\begin{tabular}{cccc}
				\toprule
				\multicolumn{1}{m{2cm}}{\centering $\alpha$}
				&\multicolumn{1}{m{2cm}}{\centering Lyapunov exponent of Male}
				&\multicolumn{1}{m{2cm}}{\centering Lyapunov exponent of Female}
				&\multicolumn{1}{m{2cm}}{\centering Lyapunov exponent of Prey}\\
				\midrule
				$0.1$ & -2.9957 & -2.3026 & -2.3026 \\
				$0.3$& -2.9957 & -2.3026 & -2.3026 \\
				$0.5$& -2.3026 & -2.3026 & -2.9957 \\ 
				$0.7$ & -2.3026 & -2.3026 & -2.9957 \\
				$0.9$ & -2.3026 & -2.3026 & -2.9957 \\
				$changeable$ &-2.3180&-2.3180 & -2.5164\\
				\bottomrule
			\end{tabular}\label{tb:003}
			\small
			1. Sex ratio of sea lamprey in tributaries to Lakes Michigan and Huron\cite{3}
			
			2. the sum number of the Males is 59,522, for females the number is 59,522 
		\end{threeparttable}
	\end{center}
\end{table}
