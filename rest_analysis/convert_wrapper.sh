#!/bin/bash


script_dir=/projects/MINDLAB2015_MR-YoungAddiction/scripts/ya_project/rest_analysis

cd /projects/MINDLAB2015_MR-YoungAddiction/scratch/bgfixed/

for file in *.nii
do
    $script_dir/convert_dicom.sh $file
done

