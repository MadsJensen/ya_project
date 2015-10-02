

for file in *.sh
do
    echo "submitting $file"
    qsub -j y -q long.q $file
    mv $file $file.submitted
done
