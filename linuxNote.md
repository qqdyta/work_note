# U盘相关

## 新建分区与挂载

### 查看分区

``` shell
sudo fdisk -l /dev/sda print 
```

### 删除和重建分区

``` shell
sudo fdisk /dev/sda
```

`d` 删除所有存在的分区。

`n` 创建新的分区。

选择默认值（通常默认设置会创建一个新的分区覆盖整个磁盘）。

`w` 写入新的分区表并退出。

### 使用parted删除分区

``` bash
sudo parted /dev/sdc
```

``` bash
(parted) rm 2
(parted) quit
```

### 创建新的分区表

``` shell
sudo fdisk /dev/sdc
```

```bash
Command (m for help): o
Created a new DOS disklabel with disk identifier 0x00000000.

Command (m for help): w
```



### 创建分区

``` shell
sudo fdisk /dev/sda
```

输入 `n` 创建新分区。

按提示选择分区类型、分区号和大小。

输入 `w` 保存分区表并退出。

### 格式化分区

``` shell
sudo mkfs.ext4 /dev/sda1    # ext4
```

``` shell
sudo mkfs.ntfs /dev/sda1    # NTFS
```



# 安装软件

## Node

### 清除旧版本

``` shell
rm -rf ~/.nvm
rm -rf /usr/local/bin/node /usr/local/bin/npm /usr/local/lib/node_modules
```

### 重新安装nvm

``` shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
source ~/.nvm/nvm.sh
nvm install v20
nvm use v20
```

### 设置不同环境下的node环境

### 查看node位置

``` shell
which node
```

/home/seeed/.nvm/versions/node/v14.21.3/bin/node

/home/seeed/.nvm/versions/node/v20.15.0/bin/node

### sudo环境下配置

``` shell
sudo vim /root/.bashrc
```

后在最后添加

``` shell
export PATH=$PATH:/usr/local/bin
```

### 软连接

``` shell
sudo ln -s /home/seeed/.nvm/versions/node/v20.15.0/bin/node /usr/bin/node
```



# 注册服务

### 路径

``` shell
/etc/systemd/system/
```





# 各种软件用法

## SCREEN 用法

### 创建新的对话并命名

``` bash
screen -S name
```

### 断开对话并且让对话后台运行

**分离会话**
要分离一个 `screen` 会话而不终止它，可以按 `Ctrl-A` 然后按 `D`。你会返回到常规的终端提示符，`screen` 会话仍然在后台运行。

**重新连接会话**
要重新连接到一个已分离的会话，首先列出所有会话：

```shell
screen -ls
```

然后使用 `screen -r` 命令重新连接到特定会话：

```shell
screen -r session_name
```

**终止会话**
要终止一个 `screen` 会话，可以重新连接到会话，然后退出终端会话。或者你可以使用以下命令直接终止会话：

```
screen -S session_name -X quit
```

### 在会话中使用screen命令

`screen` 提供了许多内部命令来管理窗口和会话。下面是一些常用命令：

**创建新窗口**
在 `screen` 会话中按 `Ctrl-A` 然后按 `C` 可以创建一个新的窗口。

**切换窗口**
在 `screen` 会话中按 `Ctrl-A` 然后按 `N` 可以切换到下一个窗口，按 `Ctrl-A` 然后按 `P` 切换到上一个窗口。

**关闭窗口**
在 `screen` 会话中按 `Ctrl-D` 可以关闭当前窗口。

**分屏显示**
在 `screen` 会话中按 `Ctrl-A` 然后按 `S` 可以水平分割窗口，按 `Ctrl-A` 然后按 `|` 可以垂直分割窗口。

## 进程相关

### 查看端口被占用

``` shell
sudo lsof -i :3344
```

### 显示进程的详细信息

``` shell
ps -o pid,ppid,cmd -p 204198
```

#### 参数含义

- `ps`：这是一个用于报告当前系统进程状态的命令。
- `-o`：这个选项用于指定输出格式，后面跟着一组用逗号分隔的关键字，这些关键字定义了输出内容的列。
- `pid`：这是一个关键字，表示进程ID。使用 `-o` 选项指定时，它会在输出中显示该列。
- `ppid`：这是一个关键字，表示父进程ID。使用 `-o` 选项指定时，它会在输出中显示该列。
- `cmd`：这是一个关键字，表示启动进程的命令。使用 `-o` 选项指定时，它会在输出中显示该列。
- `-p 204198`：这个选项用于指定要显示的进程ID。`-p` 后跟的数字是进程ID。在本例中，`-p 204198` 表示只显示进程ID为204198的进程信息。



# SSH

## 免密登录设置

将WIN10的id_rsa.pub复制到linux中的`` ~/.ssh/``

`` mv .ssh/id_rsa.pub .ssh/authorized_keys``

```text
chmod 600 .ssh/authorized_keys
chmod 700 .ssh
```

```text
sudo vim /etc/ssh/sshd_config
```

```text
RSAAuthentication yes 
PubkeyAuthentication yes 
AuthorizedKeysFile .ssh/authorized_keys
```

```text
sudo service sshd restart
```
