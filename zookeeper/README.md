#### 1. mac查看zookeeper版本
> __brew info zookeeper__

    zookeeper: stable 3.4.6 (bottled), HEAD
    Centralized server for distributed coordination of services
    https://zookeeper.apache.org/
    Not installed
    From: https://github.com/Homebrew/homebrew/blob/master/Library/Formula/zookeeper.rb
    ==> Options
    --with-perl
    	Build Perl bindings
    --with-python
    	Build with python support
    --HEAD
    	Install HEAD version
    ==> Caveats
    To have launchd start zookeeper at login:
      ln -sfv /usr/local/opt/zookeeper/*.plist ~/Library/LaunchAgents
    Then to load zookeeper now:
      launchctl load ~/Library/LaunchAgents/homebrew.mxcl.zookeeper.plist
    Or, if you don't want/need launchctl, you can just run:
      zkServer start
  #### 2. 安装zookeeper
> __brew install zookeeper__

#### 3. 启动服务

> __zkServer start__

    JMX enabled by default
    Using config: /usr/local/etc/zookeeper/zoo.cfg
    Starting zookeeper ... STARTED

#### 4. 查看运行状态

> __zkServer status__

    JMX enabled by default
    Using config: /usr/local/etc/zookeeper/zoo.cfg
    Mode: standalone

#### 5. 连接到服务器

> __zkCli__

    Connecting to localhost:2181
    Welcome to ZooKeeper!
    JLine support is enabled
    [zk: localhost:2181(CONNECTING) 0]
    WATCHER::

    WatchedEvent state:SyncConnected type:None path:null
    [zk: localhost:2181(CONNECTED) 0]
> __ls /__

    [zookeeper]

> __ls /zookeeper__

    [quota]

> __ls /zookeeper/quota__

    []

#### 6. zkServer 的常用参数

    tuyudeMacBook-Pro:zookeeper tuyu$ zkServer
    JMX enabled by default
    Using config: /usr/local/etc/zookeeper/zoo.cfg
    Usage: ./zkServer.sh {start|start-foreground|stop|restart|status|upgrade|print-cmd}
