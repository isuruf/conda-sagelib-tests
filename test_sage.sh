#!/bin/bash

cd sagemath

source /opt/docker/bin/entrypoint_source
source activate `pwd`/local
export SAGE_LOCAL=`pwd`/local
export SAGE_ROOT=`pwd`
ls $SAGE_ROOT
ls $SAGE_LOCAL

sage -tp src/ > doctest.txt || true

conda list '^sagelib$'
conda list '^sage$'
cat doctest.txt | grep '^sage -t ' | grep '#' > doctest.summary.txt || true
conda install -y bc
echo `cat doctest.summary.txt | awk '{ print $5 }' | sort | grep -E '[0-9]+' | paste -sd+ | bc` failing individual doctests
cat doctest.summary.txt | awk '{ print $5 }' | sort | grep -vE '[0-9]+' | sort | uniq -c || true
