#!/bin/bash

stage=$1

if [[ $stage == 1 ]]
then
    read res
    if [[ $res = yes ]]
    then
        exit
    fi
    echo STAGE 1
fi
