#### 1. 安装elasticsearch

```
1. 下载tar包elasticsearch-5.4.0.tar.gz

2. 解压elasticsearch-5.4.0.tar.gz
    tar -zxvf elasticsearch-5.4.0.tar.gz

3. 修改elasticsearch.yml,
    network.host: 172.16.0.111

4. 运行elasticsearch（不能以root用户运行）
    ./bin/elasticsearch -d

5. 报错如下：
    max file descriptors [4096] for elasticsearch process is too low, increase to at least [65536]
    max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]

    1） 针对max file descriptors 错误，需要修改/etc/security/limits.conf文件
        添加一行：
        tuyu   hard    nofile    65535
    2) 针对vm.max_map_count错误，需要在/etc/sysctl.d文件夹下新建一个10-xxx.conf文件，里面写上：
        vm.max_map_count = 262144
        让修改生效：
        sysctl -p limits.conf
```
