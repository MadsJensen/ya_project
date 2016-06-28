#!/bin/bash
cd /projects/MINDLAB2015_MR-YoungAddiction/scripts/ya_project/rest_analysis/wavelet_preproc_non-lin_scripts

for file in *.sh
do
    qsub -j y -q short.q $file
    mv $file ${file: 0:-2 }"submitted"
done
