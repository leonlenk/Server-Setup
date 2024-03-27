#!/bin/bash

sudo tar xf ./assets/skel.tar.gz -C /etc/skel
tar xf ./assets/skel.tar.gz -C $(eval echo ~$USER)

sudo rm /etc/update-motd.d/*
sudo tar xf ./assets/motd.tar.gz -C /etc/update-motd.d

sudo mkdir /scripts/
sudo tar xf ./assets/sys_scripts.tar.gz -C /scripts/

sudo cp ./assets/arcblroth_acm_ai_logo.ans /

sudo cp ./assets/bash.bashrc /etc/

sudo cp ./assets/root /var/spool/cron/crontabs/
