#!/bin/bash

# if ~/CNS11643 dir not exist, then create it.
if [ ! -d "$HOME/CNS11643" ] ; then
    mkdir $HOME/CNS11643
    echo -e "create ~/CNS11643/ \n"
fi
