#### 搭建3台centos 7的服务器
参考链接： http://www.cnblogs.com/chenyansong/p/5525764.html

> + 172.16.0.111
> + 172.16.0.112
> + 172.16.0.113

1. __配置zookeeper的配置文件__

    在conf目录下将zoo_sample.cfg拷贝为zoo.cfg
2. __修改dataDir的值为/tmp/zookeeper/data,新增dataLogDir=/tmp/zookeeper/dataLog,并把集群的配置信息也配上__
```
dataDir=/tmp/zookeeper/data #快照文件目录
dataLogDir=/tmp/zookeeper/dataLog #事务日志文件目录
server.1=172.16.0.111:2888:3888 #1表示服务器的id，将会存放在dataDir目录下的myid文件中，同理2，3，将会存放在对应服务器的dataDir目录中
server.2=172.16.0.112:2888:3888 #172.16.0.112表示服务器的ip地址，2888 表示 1、2、3 号 zookeeper 服务器与 zookeeper 集群中的 leader 服务器交流信息的端口
server.3=172.16.0.113:2888:3888 #3888 表示当 zookeeper 集群中的 leader 服务器挂掉之后，用来选举新的 leader 服务器时交流信息的端口
```
> 配置文件在3台服务器上都是一样的

3. __创建dataDir和dataLogDir目录__
```
mkdir -p /tmp/zookeeper/{data, dataLog}
vim /tmp/zookeeper/data/myid
```
> 每台服务器myid文件分别写上1，2，3

4. __关闭防火墙__
```
systemctl stop firewalld.service
```
> 3台服务器都需要关闭防火墙

5. __启动zookeeper__
```
zkServer.sh start
```
6. __查看zookeeper服务器的状态__
```
zkServer.sh status
```
        [root@tuyu zookeeper-3.4.10]# zkServer.sh status
        ZooKeeper JMX enabled by default
        Using config: /usr/local/share/applications/zookeeper/zookeeper-3.4.10/bin/../conf/zoo.cfg
        Mode: leader
7. __在/etc/bashrc文件中添加如下内容：__
```
alias zkServer=zkServer.sh
alias zkCli=zkCli.sh
```
> 以后启动，重启，停止zookeeper就可以不用zkServer.sh，而可以只用zkServer
