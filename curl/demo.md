##### 参考链接：http://blog.csdn.net/candyguy242/article/details/8018082

##### 使用atom编写markdown：http://jingyan.baidu.com/album/e5c39bf5aaf9f639d760338d.html?picindex=1

##### markdown语法：http://www.appinn.com/markdown/

#### 将获取的页面保存下来

> **crul -o baidu.html www.baidu.com**

    保存到当前文件夹下，名字是baidu.html

#### 下载文件

> **curl -o liuguoguo.jpg http://img.mukewang.com/55adc267000134ea05680568-200-200.jpg**

    将文件重命名为liuguoguo.jpg

    -rw-r--r--   1 tuyu  staff  6444 May  4 18:16 liuguoguo.jpg

#### 以源文件名保存到本地

> __curl -O http://img.mukewang.com/55adc267000134ea05680568-200-200.jpg__

    -rw-r--r--   1 tuyu  staff  6444 May  4 18:14 55adc267000134ea05680568-200-200.jpg

#### 只显示请求头信息

> **curl -I www.baidu.com**

    HTTP/1.1 200 OK
    Server: bfe/1.0.8.18
    Date: Thu, 04 May 2017 10:17:02 GMT
    Content-Type: text/html
    Content-Length: 277
    Last-Modified: Mon, 13 Jun 2016 02:50:50 GMT
    Connection: Keep-Alive
    ETag: "575e1f8a-115"
    Cache-Control: private, no-cache, no-store, proxy-revalidate, no-transform
    Pragma: no-cache
    Accept-Ranges: bytes

#### 包括protocol头信息

> __curl -i www.baidu.com__

    HTTP/1.1 200 OK
    Server: bfe/1.0.8.18
    Date: Thu, 04 May 2017 10:17:44 GMT
    Content-Type: text/html
    Content-Length: 2381
    Last-Modified: Mon, 23 Jan 2017 13:28:38 GMT
    Connection: Keep-Alive
    ETag: "58860506-94d"
    Cache-Control: private, no-cache, no-store, proxy-revalidate, no-transform
    Pragma: no-cache
    Set-Cookie: BDORZ=27315; max-age=86400; domain=.baidu.com; path=/
    Accept-Ranges: bytes

    <!DOCTYPE html>
    <!--STATUS OK--><html> <head><meta http-equiv=content-type content=text/html;charset=utf-8><meta http-equiv=X-UA-Compatible content=IE=Edge><meta content=always name=referrer><link rel=stylesheet type=text/css href=http://s1.bdstatic.com/r/www/cache/bdorz/baidu.min.css><title>百度一下，你就知道</title></head> <body link=#0000cc>...  </body> </html>
