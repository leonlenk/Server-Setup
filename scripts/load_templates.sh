#!/bin/bash

tar xf ../assets/skel.tar.gz -C /etc/skel
tar xf ../assets/skel.tar.gz -C $(eval echo ~$USER)
