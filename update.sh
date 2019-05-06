#!/bin/bash

cd ~/.dotfiles
git add .
d=$(date +"%d-%m-%Y %T")
git commit -m "$d"
git push origin master
