#!/bin/bash

sudo yum install -y liberation-sans-fonts libXtst

source /opt/docker/bin/entrypoint_source
conda config --add channels conda-forge
conda create -n sage sage=8.2 python=2 sphinx jmol pillow twisted>=18.4

