# 萤火虫

## 注意事项

- 一个萤火虫只能对应一个集群，有多个集群请部署多个萤火虫。
- 需要将萤火虫部署在 SC 的集群的主节点上，使用 root 权限进行部署。

## 安装

- 首先从 [萤火虫下载地址](http://192.168.1.82:28122/sc-download) 上下载萤火虫
- 将安装包传到现场要部署 SC 的机器上(主节点，也就是 node1)
- 在本地解压缩后再放到服务器上，建议放在 `/ronds/apps/firefly` 这个目录下
- 执行`bash ./setup.sh -s install`安装萤火虫
- 执行`bash ./open-firewall.sh open`开放防火墙
- 访问 http://xxx.xxx.xxx.xxx:28020 即可

## 升级萤火虫

- 首先执行停止命令 `bash ./setup.sh -s stop`
- 删除 `./app/firefly-auto-deployer` 这个文件
  删除 `./app/public` 这个文件夹
- 将新下载的文件包中的同名文件放到刚刚删除的那个位置
- 给予可执行权限 `chmod +x ./app/firefly-auto-deployer`
- 启动萤火虫 `bash ./setup.sh -s start`

## 命令一览表

```
    bash ./setup.sh -s install # 安装萤火虫
    bash ./setup.sh -s uninstall # 卸载萤火虫

    bash ./setup.sh -s start # 启动萤火虫
    bash ./setup.sh -s stop # 停止萤火虫
    bash ./setup.sh -s restart # 重启萤火虫
    bash ./setup.sh -s status # 查看萤火虫状态
```

## Ubuntu 处理

执行 su 切换 root 用户然后使用 `vi`指令 注释以下文件内容

vi /etc/ssh/sshd_config

```
...
#PermitRootLogin prohibit-password
PermitRootLogin yes # 允许 root 直接登录
...
#PermitEmptyPasswords no
PermitEmptyPasswords no # 因为设置了 root 密码，所以需要修改为 no
...
```

然后重启计算机

```
systemctl restart ssh
```
