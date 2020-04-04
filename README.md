

# docker image for node

该镜像以官方node-alpine镜像为基础，安装了`PM2`，体积相对比较小，由于国内npm下载速度太慢，默认使用`taobao`镜像源。

## 使用方法

### 1.获取镜像

```
docker pull jassue/node
```

### 2.运行容器

```
docker run -itd --name node -p 80:80 -p 8080:8080 -v /data/app:/app jassue/node
```

也可以使用docker-compose：

```
version: "3"
services:
  node:
    image: jassue/node
    container_name: node
    tty: true
    environment:
      - NODE_ENV=development
    volumes:
      - /data/app:/app
    working_dir: /app
    ports:
      - "80:80"
      - "8080:8080"
    networks:
      - docker_network

networks:
  docker_network:
    driver: bridge
```

然后执行

~~~
docker-compose up -d
~~~

注意：容器启动后默认使用`PM2`将工作目录下的`pm2.conf.json`作为配置启动进程，关于`PM2`的具体介绍和配置方法请查看[官方文档](https://pm2.keymetrics.io/)，通过配置就可以帮我们实现多进程启动。