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
nvm use v20.15.0
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

