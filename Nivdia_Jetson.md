# 软件烧录

## 下载地址

### 官网地址

https://developer.nvidia.com/embedded/linux-tegra-r3274

下载命令

``` bash
wget https://developer.nvidia.com/downloads/embedded/l4t/r32_release_v7.4/t210/jetson-210_linux_r32.7.4_aarch64.tbz2

```

``` bash
wget  https://developer.nvidia.com/downloads/embedded/l4t/r32_release_v7.4/t210/tegra_linux_sample-root-filesystem_r32.7.4_aarch64.tbz2

```



## 解压缩文件

解压缩SDK包

``` bash
tar xjf jetson-210_linux_r32.7.4_aarch64.tbz2
```

解压缩rootfs包

``` bash
sudo tar xpf  tegra_linux_sample-root-filesystem_r32.7.4_aarch64.tbz2 -C Linux_for_Tegra/rootfs/

```

安装jetson相关的deb包

``` bash
cd Linux_for_Tegra
sudo ./apply_binaries.sh
```

**将开发板进入Recovery模式**

### 烧写固件

``` shell
cd Linux_for_Tegra
sudo ./flash.sh jetson-nano-devkit-emmc mmcblk0p1
```

