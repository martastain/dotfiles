#!/bin/bash

BASEDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

while IFS= read -r file_name
do
    SOURCE_FILE=${BASEDIR}/$file_name
    TARGET_FILE=${HOME}/$file_name

    if [ -f ${TARGET_FILE} ]; then
        rm ${TARGET_FILE}
    fi

    ln -s ${SOURCE_FILE} ${TARGET_FILE}

done < "list_files"



while IFS= read -r dir_name
do
    SOURCE_DIR=${BASEDIR}/$dir_name
    TARGET_DIR=${HOME}/$dir_name

    if [ -d ${TARGET_DIR} ]; then
        rm -rf ${TARGET_DIR}
    fi

    ln -s ${SOURCE_DIR} ${TARGET_DIR}
done < "list_dirs"
