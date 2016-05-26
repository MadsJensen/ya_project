#!/bin/bash


script_dir=/projects/MINDLAB2015_MR-YoungAddiction/scripts/ya_project/mr_analyses

cd /projects/MINDLAB2015_MR-YoungAddiction/scratch/L_and_K/

for file in *.nii
do
    $script_dir/recon_subject.sh $file
done

