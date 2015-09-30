
scripts_dir = /projects/MINDLAB2015_MR-YoungAddiction/scripts/MR_scripts
cd $scripts_dir
files = *.sh

for file in files
do
    # qsub -j y -q long.q $file
    print $file
done
