#!/bin/bash

conda="anaconda.sh"

wget https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh -O $conda

chmod +x $conda

sudo bash ./$conda -b -p /opt/anaconda3

sudo chmod -R go-w /opt/anaconda3
sudo chmod -R go+rX /opt/anaconda3

sudo mkdir -p /apps/conda/pkgs
sudo chmod -R oug+rwx conda

rm $conda
