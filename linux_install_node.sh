cd /tmp
# 当前最新版本请访问 Node.js 官方网站（https://nodejs.org/en）查看
NODE_VER=20.13.1
wget https://nodejs.org/dist/v${NODE_VER}/node-v${NODE_VER}-linux-x64.tar.xz
sudo tar Jxvf ./node-v${NODE_VER}-linux-x64.tar.xz -C /usr/local/
# 得到 /usr/local/node-v20.10.0-linux-x64 ，因为当前是 v20.10.0

# 创建 Node 相关的二进制文件软链接到 /usr/local/bin/，
# 好让用户能够使用 node、npm 和 yarn 等命令
sudo ln -sf  /usr/local/node-v${NODE_VER}-linux-x64/bin/* /usr/local/bin/
sudo ln -sf  /usr/local/node-v${NODE_VER}-linux-x64/bin/node /usr/local/bin/nodejs

# 将 Node 的可执行文件目录添加到用户的 PATH 环境变量中
echo 'export PATH="${PATH}:/usr/local/node-v${NODE_VER}-linux-x64/bin"' >> ~/.bashrc
# 使 PATH 变量生效
source ~/.bashrc
