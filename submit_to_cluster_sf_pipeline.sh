#!/bin/bash

# Script to run Freesufer recon-all on several subjects on the cluster
# version: 0.2
# Author: mje, mads [] cnru.dk

# Loop to create a script per subject and submit to cluster
for SUB in 0004 0005 0006 0007 0008  # TODO: set subject numbers
do
# Assign variables for script and output files
SCRIPT=s_${SUB}_recon-all.sh
export SUBJECTS_DIR=/scratch4/MINDLAB2015_MR-YoungAddiction/minc_mje/
# export SUBJECTS_DIR=/projects/MINDLAB2015_MR-YoungAddiction/scratch/minc_mje/
export DATA_DIR=/scratch4/MINDLAB2015_MR-YoungAddiction/minc/
# export DATA_DIR=/projects/MINDLAB2015_MR-YoungAddiction/scratch/minc
INPUT_FILE=$(find $DATA_DIR/$SUB -name *bgfix.nii)
# echo $input_file
# echo $sub_id

# Generate a single script
cat << EOF > ${SCRIPT}
#!/bin/bash
#$ -S /bin/bash
export TERM vt100
# Make sure MNI and CFIN are in the path
PATH=$PATH:/usr/local/mni/bin:/usr/local/cfin/bin:.

# Add Freesurfer
export FREESURFER_HOME=/usr/local/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh
# Set SUBJECTS_DIR
export SUBJECTS_DIR=/scratch4/MINDLAB2015_MR-YoungAddiction/minc_mje/
# /projects/MINDLAB2015_MR-YoungAddiction/scratch/minc_mje

# Run the program with the parameters:
recon-all -s ${SUB} -i ${INPUT_FILE} -all
EOF

# Make the new script executable
chmod u+x ${SCRIPT}

# Finally submit it to the cluster in the long.q queue
qsub -j y -q long.q ${SCRIPT}

# Rename script after commit
mv ${SCRIPT} ${SCRIPT}.comitted
# rm ${SCRIPT} # Uncomment to delete the scripts after they are commited.
done
