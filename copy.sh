#!/bin/bash

if [ "$1" = "kai" ] ; then
	if [ -d "Open_Data/" ] ; then
		cp -i Open_Data/Fonts/TW-Kai-*.ttf $HOME/CNS11643
	else
		cp -i data/TW-Kai-*.ttf $HOME/CNS11643
	fi
fi

if [ "$1" = "sung" ] ; then
	if [ -d "Open_Data/" ] ; then
		cp -i Open_Data/Fonts/TW-Sung-*.ttf $HOME/CNS11643
	else
		cp -i data/TW-Sung-*.ttf $HOME/CNS11643
	fi
fi
