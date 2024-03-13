#!/bin/sh
sharedir=/home/${USER}/workspace/vmshare
mkdir -p $sharedir
sudo mount -t 9p -o trans=virtio share $sharedir -oversion=9p2000.L
sudo chown -R $USER $sharedir
