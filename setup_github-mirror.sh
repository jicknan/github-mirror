#!/bin/sh
git push
ssh csix_dev 'sh (cd ~/code/githube-mirror; git pull; sudo cp -v github-mirror.sh /usr/local/sbin/)'
