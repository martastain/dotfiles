#!/bin/bash

BASEDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

while IFS= read -r file_name
do
    SOURCE_PATH=${BASEDIR}/$file_name
    TARGET_PATH=${HOME}/$file_name

    if [ -f ${TARGET_PATH} ] || [ -L ${TARGET_PATH} ]; then
        rm ${TARGET_PATH}
    fi

    TARGET_DIR=$(dirname "${TARGET_PATH}")
    if [ -d ${TARGET_DIR} ]; then
        mkdir -p ${TARGET_DIR}
    fi

    echo "Creating link ${SOURCE_PATH} -> ${TARGET_PATH}"
    ln -s ${SOURCE_PATH} ${TARGET_PATH}

done < "list_files"



while IFS= read -r dir_name
do
    SOURCE_DIR=${BASEDIR}/$dir_name
    TARGET_DIR=${HOME}/$dir_name

    if [ -d ${TARGET_DIR} ] || [ -L ${TARGET_DIR} ]; then
        rm -rf ${TARGET_DIR}
    fi

    echo "Creating link ${SOURCE_DIR} -> ${TARGET_DIR}"
    PARENT_DIR=$(dirname "${TARGET_DIR}")
    mkdir -p "${PARENT_DIR}"
    ln -s ${SOURCE_DIR} ${TARGET_DIR}
done < "list_dirs"
