#! /usr/bin/bash

declare -A project_branch
# 创建数组
project_branch["A"]="develop"
project_branch["A1"]="develop"
project_branch["A2"]="develop"
project_branch["A3"]="develop"

project_branch["B1"]="develop_1"
project_branch["B2"]="develop_1"
project_branch["B3"]="develop_1"


LOCK_FILE="/tmp/checkout_script_lock"
LOCK_DESC=200

checkout_to_branch() {
    cd ${SCRIPT_PATH}/$1 
    OUTPUT_FETCH=$(git fetch 2>&1)
    OUTPUT_CHECKOUT=$(git checkout origin/${project_branch[$1]} 2>&1) 

    #lock
    flock -x ${LOCK_DESC}

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo -e "${SCRIPT_PATH}/\033[32m$1\033[0m"
    echo ""

    if [ -n "${OUTPUT_FETCH}" ]; then
        echo ${OUTPUT_FETCH}
        echo ""
    fi

    echo ${OUTPUT_CHECKOUT}

    #unlock
    flock -u ${LOCK_DESC}
}

SCRIPT_PATH=$(dirname "$(readlink -f "$0")")


# create lock
#exec ${LOCK_DESC}>${LOCK_FILE}
exec 200>${LOCK_FILE}

# 遍历关联数组
for key in "${!project_branch[@]}"; do
    (checkout_to_branch $key)&
done

wait

echo "+++++++++++++++++++++++++++++"
echo "+++++ all checkout done +++++"
echo "+++++++++++++++++++++++++++++"
