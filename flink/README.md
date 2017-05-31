## flink 集群 环境搭建
+ #### 下载flink的tar包并解压
```
1) wget http://apache.fayea.com/flink/flink-1.2.1/flink-1.2.1-bin-hadoop26-scala_2.11.tgz
2) tar -zxvf flink-1.2.1-bin-hadoop26-scala_2.11.tgz
```
+ #### 配置flink-conf.yaml
```
1) vim conf/flink-conf.yaml
2) 修改jobmanager的ip地址，新增jdk的路径
      jobmanager.rpc.address: host1
      env.java.home: /usr/local/programs/jdk1.8.0_111
```
+ #### 配置masters
```
host1：8081
```
+ #### 配置slaves
```
host2
host3
```
+ #### 启动flink集群
```
bin/start-cluster.sh
```
+ #### 打开flink监控界面
```
浏览器输入：host1:8081
```
