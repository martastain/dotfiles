#!/bin/bash

# Base config files: bash, vim, screen, mc

files_base=(
    ".vim"
    ".bin"
    ".config/mc"

    ".bashrc"
    ".gitconfig"
    ".profile"
    ".selected_editor"
    ".screenrc"
    ".config/imageview.sh"
)

# Extended (for workstations) configuration files

files_extended=(
    ".mutt"
    ".ncmpcpp"
    ".irssi/scripts"
    ".irssi/molokai.theme"
)

# Cygwin specific files

files_cygwin=(
    ".minttyrc"
)

#
# Deployment script
#

base_dir=$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )

function deploy_list {
    declare -a list=("${!1}")
    for rel_path in ${list[@]}; do
        source_path=${base_dir}/home/${rel_path}
        target_path=${HOME}/${rel_path}
        target_dir=$(dirname "${target_path}")

        if [ ! -d ${target_dir} ]; then
            mkdir -p ${target_dir}
        fi

        if [ -e ${target_path} ]; then
            rm -r ${target_path}
        fi

        echo "Creating link: ${target_path}"
        ln -s ${source_path} ${target_path}
    done
}


deploy_list files_base[@]


while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -a|--all)
            deploy_list files_extended[@]
            ;;
        *)
            # unknown option
        ;;
    esac
    shift # past argument or value
done



#
# Cygwin specific
#

if [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ]; then
    deploy_list files_cygwin[@]
fi

