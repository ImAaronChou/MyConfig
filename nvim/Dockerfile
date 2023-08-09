FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

#如果没安装ca证书，会导致github证书不被信任，使用该变量可跳过git的证书验证
ENV GIT_SSL_NO_VERIFY=1

RUN apt-get update && apt-get install  -q -y --no-install-recommends --fix-missing sudo  

#更新apt源
RUN sed -i "s/archive.ubuntu.com/mirrors.163.com/g" /etc/apt/sources.list && \
    sed -i "s/security.ubuntu.com/mirrors.163.com/g" /etc/apt/sources.list && \
    apt-get update 

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ARG USER=unknow
ARG UID=unknow
ARG GID=unknow
ENV HOME /home/${USER}

RUN mkdir -p /home/${USER} && \
    echo "${USER}:x:${UID}:${GID}::/home/${USER}:/bin/bash" >> /etc/passwd && \
    echo "${USER}:x:${GID}:" >> /etc/group && \
    mkdir -p /etc/sudoers.d && \
    echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER} && \
    chmod 0440 /etc/sudoers.d/${USER} && \
    chown ${UID}:${GID} -R ${HOME} && \
    echo "${USER}:${USER}" | chpasswd && \
    echo "export DISPLAY=:0" >> /etc/profile 
