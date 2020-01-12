# -*- mode: sh; sh-indentation: 4; indent-tabs-mode: nil; sh-basic-offset: 4; -*-

# Copyright (c) 2019 Thuan Duong

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0=${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}
0=${${(M)0:#/*}:-$PWD/$0}

# Then ${0:h} to get plugin's directory

if [[ ${zsh_loaded_plugins[-1]} != */zsh-aliyun && -z ${fpath[(r)${0:h}]} ]]
then
    fpath+=( "${0:h}" )
fi

typeset -g ZSH_ALIYUN_DIR=${0:h}

#compdef aliyun
complete -o nospace -F $(which aliyun) aliyun

alias aliyun-region="aliyun ecs DescribeRegions | jq -r '.Regions.Region | .[] | .RegionId'"

# vim:ft=zsh:sw=4:sts=4:et