#!/usr/bin/zsh


docker build . \
    --build-arg REBUILD_VAR=$(date +%Y%m%d-%H%M%S) \
    --build-arg USER=$USER \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    -t nvim_test \
    -f ./Dockerfile

