ARG VERSION
FROM ubuntu:${VERSION}

LABEL maintainer="yunnysunny@gmail.com"


# 安装依赖
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
  && sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
  && apt-get update \
  && apt-get --no-install-recommends  install tzdata -y \
  && apt-get clean \
  && rm /var/lib/apt/lists/* -rf

# 使用东八区时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime