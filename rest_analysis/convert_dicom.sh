

OUTPUT=/projects/MINDLAB2015_MR-YoungAddiction/scripts/ya_project/rest_analyses/convert_logs/convert_log_${1: 0:4}.txt
SCRIPT=/projects/MINDLAB2015_MR-YoungAddiction/scripts/ya_project/mr_analyses/convert_scripts/convert_${1: 0:4}.sh
FILEDIR=/projects/MINDLAB2015_MR-YoungAddiction/scratch/rest_analysis/

cat <<EOF > ${SCRIPT}
#!/bin/bash
#$ -S /bin/bash
export TERM vt100
# Make sure MNI and CFIN are in the path
PATH=$PATH:/usr/local/mni/bin:/usr/local/cfin/bin:. 
# Setup freesurfer
export FREESURFER_HOME=/usr/local/freesurfer-Linux-centos6_x86_64-stable-pub-v5.3.0
source $FREESURFER_HOME/SetUpFreeSurfer.sh

SUBJECT_DIR=$FILEDIR/${1: 0:4}

mkdir $SUBJECT_DIR

mri_convert -it siemens_dicom -ot nii /projects/MINDLAB2015_MR-YoungAddiction/raw/${1: 0:4}/*/MR/*Rest_3mm/files/*ACQ00001*.dcm $SUBJECT_DIR/rest.nii > $OUTPUT

EOF



