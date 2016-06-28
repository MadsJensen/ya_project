

SCRIPT=/projects/MINDLAB2015_MR-YoungAddiction/scripts/ya_project/rest_analysis/wavelet_preproc_non-lin_scripts/wavelet_preproc_non-lin_$1.sh
OUTPUT=/projects/MINDLAB2015_MR-YoungAddiction/scripts/ya_project/rest_analysis/wavelet_preproc_non-lin_logs/$1_log.txt
FILEDIR=/projects/MINDLAB2015_MR-YoungAddiction/scratch/rest_analysis_non-lin/$1


# Generate a single script
cat <<EOF > ${SCRIPT}
#!/bin/bash
#$ -S /bin/bash
export TERM vt100
# Make sure MNI and CFIN are in the path
PATH=$PATH:/usr/local/mni/bin:/usr/local/cfin/bin:. 
# Setup AFNI
export PATH=/usr/local/AFNIbin:${PATH}
export FSLDIR=/usr/local/fsl
source $FSLDIR/etc/fslconf/fsl.sh  

cd $FILEDIR

python ~/fmri_spt/speedyppX3.py -d rest.nii -a mp2rage.nii -o --skullstrip --nobandpass --wds --SP --tpattern=alt+z2 --ss=MNI152 --csfpeel=6 --csftemp=MNI152 --zeropad=100 --rmot --rmotd --rcsf  >>  $OUTPUT 2>&1 

EOF

