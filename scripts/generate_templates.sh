#!/bin/bash

# tar everything including hidden files in the template
tar czvf ./assets/skel.tar.gz -C /etc/skel .

sudo tar czvf ./assets/sys_scripts.tar.gz -C /scripts .

sudo cp /arcblroth_acm_ai_logo.ans ./assets

sudo cp /etc/bash.bashrc ./assets