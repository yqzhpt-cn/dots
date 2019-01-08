#!/usr/bin/env bash

cp -i $(pwd)/.vimrc ~/.vimrc

vim +'PlugInstall --sync' +qa # Install plugins non-interactively

cp -i $(pwd)/.ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/.ycm_extra_conf 
