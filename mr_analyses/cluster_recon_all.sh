
filelist = dir *.nii

for i in $(seq -f "%04g" 1 112); do
    echo $i;
done
