# RS测试预扫操作说明

## 设备

- 一条绿色网线
- 一条灰色电源线
- 带屏蔽的路由器
- 电脑及适配的电源和网线



## 设备摆放



<img src="file:///C:/Users/qqdyta/Documents/WXWork/1688855768420414/Cache/Image/2024-07/be8682de-1dbc-4576-a262-01275e717f42.jpg" alt="img" style="zoom: 67%;" />

<img src="file:///C:/Users/qqdyta/Documents/WXWork/1688855768420414/Cache/Image/2024-07/1933d0b2-85db-48ba-8746-63001c94dc62.jpg" alt="img" style="zoom:67%;" />





## 连接

测试设备连接网线和直流电源， 网线连接路由器，电脑通过网线连接同一个路由器，然后使用文件夹附带的mobaxterm软件进行SSH远程控制。首先确认一下电脑的IP地址是多少，假设是192.168.254.XX

![屏幕截图(8)](C:\Users\qqdyta\Pictures\Screenshots\屏幕截图(8).png)

参考上图，打开mobaxterm在顶部的Tools菜单中打开Network scanner， 然后在IP address前三个框中输入IP的前三位，后面两个框代表扫描的范围，保持1和254， 然后点击start scan                                          

![image-20240704091303512](C:\Users\qqdyta\AppData\Roaming\Typora\typora-user-images\image-20240704091303512.png)



![image-20240704091508203](C:\Users\qqdyta\AppData\Roaming\Typora\typora-user-images\image-20240704091508203.png)

如图找到Name为SENSINGCAM100的设备，然后点击所在行的第一列的绿色箭头，或者直接获取其IP进行SSH

进入设备以后用户名为root   密码为sick，，，进入终端后输入sh gpiotest.sh后按下回车，正常情况下设备的两个灯会开始闪烁





然后使用文件夹中的VLC media player安装包安装软件，安装后打开，点击 菜单-打开网络串口

![屏幕截图(9)](C:\Users\qqdyta\Pictures\Screenshots\屏幕截图(9).png)

如下图所示，将下面的指令中的IP地址替换为设备的IP:     rtsp://192.168.1.3/live/0     然后点击播放。 软件出现设备的画面就OK

![image-20240704091915991](C:\Users\qqdyta\AppData\Roaming\Typora\typora-user-images\image-20240704091915991.png)