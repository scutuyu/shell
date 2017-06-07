# windows安装pscp

## 首先到官网下载pscp.exe二进制文件
> https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
>
> 点开网址打开之后如下图：
>
> <img src="https://github.com/scutuyu/shell/blob/master/pscp/pscp.png" width="100%" alt="pscp_download.png" />

## 然后将pscp.exe文件拷贝到C:\Windows\System32

## 打开dos终端就可以运行pscp命令了
> pscp -r file.txt root@10.10.10.10:/usr/local
```
-r 一般在上传文件夹的时候会用
file.txt 是文件名或者文件夹名
root 是Linux服务器的账号
10.10.10.10 是服务器的IP地址
/usr/local 是文件上传的路径
```
