

files = *.sh

for file in files
do
    # qsub -j y -q long.q $file
    print $file
done
