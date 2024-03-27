#!/bin/bash

tar xf skel.tar.gz -C /etc/skel
tar xf skel.tar.gz -C $(eval echo ~$USER)
