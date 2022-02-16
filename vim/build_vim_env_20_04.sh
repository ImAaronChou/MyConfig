#!/usr/bin/zsh

rm tmp_vim_env_Dockfile
cp ./Dockerfile_20_04 ./tmp_vim_env_Dockfile

docker build . \
    --build-arg REBUILD_VAR=$(date +%Y%m%d-%H%M%S) \
    --build-arg USER=$USER \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    -t vim_env \
    -f ./tmp_vim_env_Dockfile

rm tmp_vim_env_Dockfile
cp ./vim ~/.local/bin


