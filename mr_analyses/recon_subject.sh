

OUTPUT=/projects/MINDLAB2015_MR-YoungAddiction/scripts/ya_project/mr_analyses/recon_logs/recon_log_${1: 0:4}.txt
SCRIPT=/projects/MINDLAB2015_MR-YoungAddiction/scripts/ya_project/mr_analyses/recon_scripts/recon_${1: 0:4}.sh
FILEDIR=/projects/MINDLAB2015_MR-YoungAddiction/scratch/L_and_K/


# Generate a single script
cat <<EOF > ${SCRIPT}
#!/bin/bash
#$ -S /bin/bash
export TERM vt100
# Make sure MNI and CFIN are in the path
PATH=$PATH:/usr/local/mni/bin:/usr/local/cfin/bin:. 
# Setup freesurfer
export FREESURFER_HOME=/usr/local/freesurfer-Linux-centos6_x86_64-stable-pub-v5.3.0
source $FREESURFER_HOME/SetUpFreeSurfer.sh

export SUBJECTS_DIR=/projects/MINDLAB2015_MR-YoungAddiction/scratch/fs_subjects_dir/

recon-all -all -subjid ${1: 0:4} -i $FILEDIR$1 > $OUTPUT

EOF
