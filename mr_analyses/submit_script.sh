#!/bin/bash

cd /projects/MINDLAB2015_MR-YoungAddiction/scripts/ya_project/mr_analyses/recon_scripts

for file in *.sh
do
    qsub -j y -q long.q $file
    mv $file ${file: 0:-2 }"submitted"
done
