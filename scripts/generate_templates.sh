#!/bin/bash

# tar everything including hidden files in the template
tar czvf ./assets/skel.tar.gz -C /etc/skel .

tar czvf ./assets/motd.tar.gz -C /etc/update-motd.d .

sudo tar czvf ./assets/sys_scripts.tar.gz -C /scripts .

sudo cp /arcblroth_acm_ai_logo.ans ./assets

sudo cp /etc/bash.bashrc ./assets

sudo cp /var/spool/cron/crontabs/root ./assets

sudo chown -R $(id -u):$(id -g) ./assets
