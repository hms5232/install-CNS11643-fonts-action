#!/bin/bash

mkdir -p /usr/local/share/fonts/
sudo mv -i $HOME/CNS11643 /usr/local/share/fonts/
sudo chown -R root:staff /usr/local/share/fonts/CNS11643
sudo chmod 644 /usr/local/share/fonts/CNS11643/*
sudo chmod 755 /usr/local/share/fonts/CNS11643

# update cache of fonts
sudo fc-cache -fv
