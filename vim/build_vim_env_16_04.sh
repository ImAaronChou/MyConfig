#!/usr/bin/zsh


rm tmp_vim_env_Dockfile
cp ./Dockerfile_16_04 ./tmp_vim_env_Dockfile

#设置权限
cat << EOF >> ./tmp_vim_env_Dockfile
RUN mkdir -p ${HOME} && \\
    echo "${USER}:x:${UID}:${GID}::${HOME}:/bin/bash" >> /etc/passwd && \\
    echo "${GROUP}:x:${GID}:" >> /etc/group && \\
    mkdir -p /etc/sudoers.d && \\
    echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER} && \\
    chmod 0440 /etc/sudoers.d/${USER} && \\
    chown ${UID}:${GID} -R ${HOME} && \\
    echo "${USER}:${USER}" | chpasswd && \\
    echo "export DISPLAY=${DISPLAY}" >> /etc/profile
EOF

docker build . --build-arg REBUILD_VAR=$(date +%Y%m%d-%H%M%S)  -t vim_env -f ./tmp_vim_env_Dockfile
rm tmp_vim_env_Dockfile
cp ./vim ~/.local/bin


