#!/bin/bash

source /opt/docker/bin/entrypoint_source
source activate sage
git clone https://github.com/sagemath/sage.git sagemath
cd sagemath
git checkout 8.2
sage -tp src/doc/en/prep/Advanced-2DPlotting.rst > doctest.txt || true
conda list '^sagelib$'
conda list '^sage$'
cat doctest.txt | grep '^sage -t ' | grep '#' > doctest.summary.txt || true
conda install -y bc
echo `cat doctest.summary.txt | awk '{ print $5 }' | sort | grep -E '[0-9]+' | paste -sd+ | bc` failing individual doctests
cat doctest.summary.txt | awk '{ print $5 }' | sort | grep -vE '[0-9]+' | sort | uniq -c || true
