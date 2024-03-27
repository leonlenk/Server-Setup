#!/bin/bash

# tar everything including hidden files in the template
tar czvf ../assets/skel.tar.gz -C /etc/skel/ .
