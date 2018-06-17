#!/bin/bash

/usr/bin/sudo -n yum install -y libXtst

source /opt/docker/bin/entrypoint_source
conda config --add channels conda-forge
conda create -n sage sage=8.2 python=2 sphinx jmol pillow twisted openjdk>8.0.121

