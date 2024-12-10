#!/bin/bash

# 软件包列表
packages=("stress" "vim" "mpv")

# 更新软件包列表
sudo apt update

# 安装指定的软件包
for pkg in "${packages[@]}"
do
    echo "正在安装 $pkg..."
    sudo apt install -y $pkg
done

# 清理不再需要的自动安装的软件包
sudo apt autoremove -y

echo "所有软件包安装完成。"