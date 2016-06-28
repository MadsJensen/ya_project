

orig_dir="/projects/MINDLAB2015_MR-YoungAddiction/scratch/bgfixed"
data_dir="/projects/MINDLAB2015_MR-YoungAddiction/scratch/rest_analysis_non-lin"

cd $orig_dir

for file in *.nii
do
    echo cp $1 $data_dir/${file: 0:4}/mp2rage.nii
    # $script_dir/convert_dicom.sh $file
done
