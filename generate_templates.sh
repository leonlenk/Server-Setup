#!/bin/bash

# tar everything including hidden files in the template
tar czvf skel.tar.gz -C /etc/skel/ .
