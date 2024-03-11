# knowledgegraph

#### 介绍
可视化知识图谱，比较简陋，基于Neo4j+Mysql+Spring Boot+vue，基础架构改的是若依前后端分离版(搜索RuoYi-Vue)。

#### 软件架构
软件架构说明


#### 安装教程

1、部署

（1）部署使用Docker进行，计划将后端、前端、两个数据库、一个缓存均单独以容器运行，容器间通信使用自定义docker网络，在规划好每个容器的ip后把对应的代码改为服务器设置：前端代码使用本地npm工具打成dist包，用以服务器上使用Nginx部署；后端代码使用maven工具打成jar包，用以服务器上使用adoptopenjdk部署；MySQL数据库使用Navicat导出一份sql脚本。

（2）服务器工作；在拿到阿里云配置好的实例服务器后，首先使用MobaXterm Personal远程连接到服务器进行对应系统更新，下载安装Docker（20.10.13），并创建Docker的自定义网络，拉取以下镜像：nginx（1.21）、mysql（5.7）、adoptopenjdk（8-jre-openj9）、neo4j（community）、redis（6.0）；部署过程如下：

①使用mysql（5.7）起容器实例，这里将MySQL容器的数据文件夹挂载至服务器上，将容器数据持久化；指定容器使用自定义网络ip为192.168.1.2并将容器端口3306挂载至服务器端口。将对应挂载的端口开放，本地远程使用Navicat远程连接我们的数据库，使用本地备份的数据脚本，在服务器数据库构建对应的数据库。容器命令为：

```shell
docker run --name mysql \
  -e MYSQL_ROOT_PASSWORD='11223' \
  --net mynet --ip 192.168.1.2 \
  -p13306:3306 \
  -v /liaoquefei/docker_data/mysql_data:/var/lib/mysql \
  -v /liaoquefei/docker_data/mysql_inf/my.cnf:/etc/mysql/conf.d/config-file.cnf \
  -d mysql:5.7
```

②使用neo4j（community）起容器实例，这里同样将Neo4j容器的数据文件夹挂载至服务器上，将容器数据持久化；指定容器使用自定义网络ip为192.168.1.4并将容器端口7474、7687挂载至服务器端口（方便后期本地远程连接数据库）。容器命令为：

```shell
docker run --name neo4j \
  --net mynet --ip 192.168.1.4 --publish=7474:7474 --publish=7687:7687 \
  --volume=/liaoquefei/docker_data/neo4j_data:/data \
  -d neo4j:community
```



③使用redis（6.0）起容器实例，指定容器使用自定义网络ip为192.168.1.3。容器命令为：

```shell
docker run --name redis \
  --net mynet --ip 192.168.1.3 \
  -d redis
```



④使用adoptopenjdk（8-jre-openj9）镜像制作新的运行jar包的镜像japp:1.0，首先创建Dockerfile文件，文件内容为：

```shell
FROM adoptopenjdk:8-jre-openj9
CMD ["java", "-jar", "/opt/app/knowledgegraph-admin.jar"]
```



然后制作新镜像japp:1.0，指定容器使用自定义网络ip为192.168.1.6将容器jar包文件夹挂载至服务器放jar包的文件夹，端口8080挂载至服务器。容器命令为：

```shell
docker run --name myapp \
  -v /liaoquefei/knowledgegraph/jar:/opt/app \
  --net mynet --ip 192.168.1.6 \
  -p 8080:8080 \
  -d japp:1.0
```



⑤使用nginx（1.21）起容器实例，将容器的网页文件夹挂载至服务器放的dist包文件的全路径，挂载容器配置文件到服务器进行配置，挂载容器80端口至服务器访问网站的端口。容器命令为：

```shell
docker run --name nginx \
  --net mynet --ip 192.168.1.3 \
  -p 80:80 -v \
  /liaoquefei/docker_data/nginx_data/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /liaoquefei/docker_data/nginx_data/dist:/usr/share/nginx/html:ro \
  -d nginx:1.21
```

⑥最后将服务器对应nginx挂载的端口对外开放，通过本地浏览器测试部署是否成功。

#### 使用说明

1.  xxxx
2.  xxxx
3.  xxxx

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  Gitee 官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解 Gitee 上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是 Gitee 最有价值开源项目，是综合评定出的优秀开源项目
5.  Gitee 官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  Gitee 封面人物是一档用来展示 Gitee 会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
