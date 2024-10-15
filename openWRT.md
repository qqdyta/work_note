# 下载

[[OpenWrt Wiki\] Table of Hardware: Firmware downloads](https://openwrt.org/toh/views/toh_fwdownload)根据机型选择下载的固件

下载的固件使用树莓派烧录软件烧录进入SD卡中，然后启动

将主控电脑接入设备的LAN口，在192.168.1.1处登录

## 软件操作

``` shell
opkg update
```

``` bash
https://github.com/vernesong/OpenClash/wiki
```

# 软件升级

首先使用``` opkg update``` 

其次使用``` opkg upgrade``` 

``` shell
opkg list-upgradable
opkg list-upgradable | cut -d ' ' -f 1 | xargs opkg upgrade
opkg upgrade package1 package2 ...
```



# 安装OPENClash

```shell
opkg update
opkg install coreutils-nohup bash iptables dnsmasq-full curl ca-certificates ipset ip-full iptables-mod-tproxy iptables-mod-extra libcap libcap-bin ruby ruby-yaml kmod-tun kmod-inet-diag unzip luci-compat luci luci-base
```

