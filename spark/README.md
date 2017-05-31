## spark 集群 环境搭建
+ #### 下载spark的tar包并解压
```
wget https://d3kbcqa49mib13.cloudfront.net/spark-2.1.1-bin-hadoop2.6.tgz
tar -zxvf spark-2.1.1-bin-hadoop2.6.tgz
```
+ #### 配置spark-env.sh
```
1) 将conf/spark-env.sh.template复制为spark-env.sh
2) 添加java和scala的配置信息
      export SCALA_HOME=/usr/local/programs/scala-2.12.2
      export JAVA_HOME=/usr/local/programs/jdk1.8.0_111
```
+ #### 配置slaves
```
1) 将conf/slaves.template复制为slaves
2) 在文件中添加非master主机的ip（即从节点）
      host1
      host2
```
+ #### 启动spark集群
```
1) sbin/start-master.sh
2) sbin/start-slaves.sh
```
> sbin/start-slave.sh ——> 将在本机启动一个worker实例；
>
> sbin/start-slaves.sh ——> 将启动在slaves文件中指定的worker实例
>
> sbin/start-master.sh ——> 在本机上启动一个master实例
>
+ #### 打开spark监控页面
```
在浏览器打开ip:8080进行查看
```
> ip即为运行sbin/master.sh脚本的服务器的ip
>
> 修改spark监控页面的端口号
>
> vim sbin/start-master.sh
>
> SPARK_MASTER_WEBUI_PORT=8080
>
> 将8080改为自己想要的端口即可
