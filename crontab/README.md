# crontab 

日志分割脚本

> crontab -l 

```
0  0  *  *  * /bin/sh  /root/cci-wifi/ng_server/logs/devide_log.sh >> /root/cci-wifi/ng_server/logs/clear_log.log 2>>/root/cci-wifi/ng_server/logs/clear_log.log
1  0  *  *  0 /bin/sh  /root/cci-wifi/ng_server/logs/delete_log.sh >> /root/cci-wifi/ng_server/logs/clear_log.log 2>>/root/cci-wifi/ng_server/logs/clear_log.log
```

> crontab -e 进行编辑

# devide_log.sh

```
#! /usr/bin/sh

# devide_log.sh文件是分割日志文件，每天凌晨都会执行
# author: tuyu
# date  : 2017.10.26
echo $(date +"%Y-%m-%d %H:%M:%S")
echo "本次分割日志文件开始"

# 加载变量
BASE_DIR=$(cd "$(dirname $0)"; pwd)
DEFAULT_CONF=${BASE_DIR}/conf
if [ -n "$1" ] ; then
    echo "加载配置文件$1"
    source $1
else
    echo "加载默认配置文件$DEFAULT_CONF"
    source $DEFAULT_CONF
fi

if [ -n "$accessFile" ] && [ -n "$errorFile" ] && [ -n "$access" ] && [ -n "$error" ]; then
    echo "access=$access"
    echo "error=$error"
    echo "accessFile=$accessFile"
    echo "errorFile=$errorFile"
# 保存昨天的访问日志
    sourAccess=${BASE_DIR}/${accessFile}
    sourError=${BASE_DIR}/${errorFile}
    destAccess=${BASE_DIR}/${access}_$(date -d "yesterday" +"%Y%m%d").log
    destError=${BASE_DIR}/${error}_$(date -d "yesterday" +"%Y%m%d").log
    echo "将$sourAccess的日志复制到$destAccess"
    cp $sourAccess $destAccess;

# 保存昨天的错误日志
    echo "将$sourError的日志复制到$destError"
    cp $sourError $destError;

# 清空日志文件
    echo "清空日志$sourAccess"
    cat /dev/null > $sourAccess;
    echo "清空日志$sourError"
    cat /dev/null > $sourError;
    echo "本次分割日志文件结束"
    echo ""
else
    echo "读取配置文件失败,检查配置文件"
    echo ""
fi
```

# delete_log.sh

```
#! /bin/sh

# delete_log.sh文件是定时删除日志，只保留最近7天的日志,7是通过配置文件配置的
# author: tuyu
# date  : 2017.10.26

echo $(date +"%Y-%m-%d %H:%M:%S")
echo "本次删除历史日志开始"

# 加载变量
BASE_DIR=$(cd "$(dirname $0)"; pwd)
DEFAULT_CONF=${BASE_DIR}/conf
if [ -n "$1" ] ; then
    echo "加载配置文件$1"
    source $1
else
    echo "加载默认配置文件$DEFAULT_CONF"
    source $DEFAULT_CONF
fi

if [ -n "$saveDays" ]; then
    echo "saveDays=$saveDays"

# 删除历史日志文件
    find ${BASE_DIR} -type f -mtime +$saveDays -name "*.log" -exec printf "DELETE file: %s\n" {} \;
    find ${BASE_DIR} -type f -mtime +$saveDays -name "*.log" -exec rm -f {} \;
    echo "本次删除历史日志结束"
    echo ""
else
    echo "读取配置文件失败,检查配置文件"
    echo ""
fi
```

# conf

```
# conf文件是配置日志分割以及清理历史日志的配置文件
# author: tuyu
# date  : 2017.10.26

access=access
error=error

# nginx访问日志文件
accessFile=$access.log

# nginx错误日志文件
errorFile=$error.log

# 日志保留天数
saveDays=7
```
