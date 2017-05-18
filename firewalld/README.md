#### 1. centos 7 查看防火墙状态
> __systemctl status firewalld.service__

```
[root@tuyu ~]# systemctl status firewalld.service
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled; vendor preset: enabled)
   Active: inactive (dead) since Thu 2017-05-18 15:12:24 CST; 1h 5min ago
     Docs: man:firewalld(1)
  Process: 2631 ExecStart=/usr/sbin/firewalld --nofork --nopid $FIREWALLD_ARGS (code=exited, status=0/SUCCESS)
 Main PID: 2631 (code=exited, status=0/SUCCESS)

May 18 14:59:14 tuyu.example.com systemd[1]: Starting firewalld - dynamic firewall daemon...
May 18 14:59:14 tuyu.example.com systemd[1]: Started firewalld - dynamic firewall daemon.
May 18 15:12:24 tuyu.example.com systemd[1]: Stopping firewalld - dynamic firewall daemon...
May 18 15:12:24 tuyu.example.com systemd[1]: Stopped firewalld - dynamic firewall daemon.
```

> __firewall-cmd --state__

```
[root@tuyu ~]# firewall-cmd --state
not running
```

#### 2. centos 7 关闭防火墙

> __systemctl stop firewalld.service__

#### 3. centos 7 开启防火墙

> __ systemctl start firewalld.service__

#### 4. centos 7 防火墙允许9200端口可以被访问

> __firewall-cmd --permanent --add-port=9200/tcp__
>
> __firewall-cmd --reload__

    1）先将9200端口加入，并注明是tcp还是udp，--permanent表示永久
    2）然后将配置载入--reload

#### 5. centos 7 显示所有允许被访问的服务

> __firewall-cmd --permanent --list-all__

```
[root@tuyu ~]# firewall-cmd --permanent --list-all
public
  target: default
  icmp-block-inversion: no
  interfaces:
  sources:
  services: dhcpv6-client ssh
  ports: 9200/tcp
  protocols:
  masquerade: no
  forward-ports:
  sourceports:
  icmp-blocks:
  rich rules:
```
