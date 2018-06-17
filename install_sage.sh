#!/bin/bash

source /opt/docker/bin/entrypoint_source
conda config --add channels conda-forge
conda create -n sage sage=8.2 python=2

