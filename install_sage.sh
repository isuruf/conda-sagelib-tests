#!/bin/bash

export PATH=/opt/conda/bin:$PATH
conda config --add channels conda-forge
conda create -n sage sage=8.2 python=2 sphinx jmol pillow twisted>=18.4
