#!/bin/bash

source /opt/docker/bin/entrypoint_source

git clone https://github.com/sagemath/sage.git sagemath
cd sagemath
git checkout 8.2

conda config --add channels conda-forge
conda create -p `pwd`/local sage=8.2 python=2 numpy=1.13
