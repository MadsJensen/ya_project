from __future__ import print_function
"""
@author: cjb
"""

CLOBBER = False
FAKE = False
VERBOSE = True

import os, sys
import errno  # should do some error checking...
import subprocess
# ENH: install "official" version of stormdb on isis/hyades
path_to_stormdb = '/users/cjb/src/git/cfin-tools/stormdb/stormdb'
sys.path.append(path_to_stormdb)

# change to stormdb.access (mod. __init__.py)
from access import Query

proj_code = 'MINDLAB2015_MR-YoungAddiction'

db = Query(proj_code)
proj_folder = os.path.join('/projects', proj_code)
scratch_folder = os.path.join(proj_folder, 'scratch')

recon_all_bin = '/opt/local/freesurfer-releases/5.3.0/bin/recon-all'
subjects_dir = os.path.join(scratch_folder, 'fs_subjects_dir')
script_dir = proj_folder+'/scripts/MR_scripts'

included_subjects = db.get_subjects()
# just test with first one!
included_subjects = [included_subjects[1]]

for sub in included_subjects:

    # this is an example of getting the DICOM files as a list
    sequence_name = 't1_mp2rage_sag_p2_iso_UNI_Images'
    mr_study = db.get_studies(sub, modality='MR', unique=True)
    if mr_study is not None:
        # This is a 2D list with [series_name, series_number]
        series = db.get_series(sub, mr_study[0], 'MR')
    # Change this to be more elegant: check whether any item in series
    # matches sequence_name
    T1_file_names = db.get_files(sub, mr_study[0], 'MR',
                                 series[sequence_name])

    input_dicom = T1_file_names[0]  # first DICOM file

    bash_script = ['#!/usr/bin/env bash']
    bash_script.append('#$ -S /bin/bash')  # for qsub

    # have to explicitly source bashrc (non-login shell)
    bash_script.append('source ~/.bashrc')
    bash_script.append("export FREESURFER_HOME=/usr/local/freesurfer")
    bash_script.append("source $FREESURFER_HOME/SetUpFreeSurfer.sh")
    # bash_script.append('use mne') # set paths
    bash_script.append('export SUBJECTS_DIR=' + subjects_dir)

    bash_script.append('export SUBJECT=' + sub[:4])

    bash_script.append('recon-all -s ' + sub[:4] + ' -i ' + input_dicom +
                       ' -all')
    # Can do some exit value checking too...
    # bash_script.append('if [[ $? != 0 ]] ; then exit 1; fi')

    # we could just write each line directly into the script_file
    # instead of first generating the bash_script list
    # but it may be beneficial at some stage to /first/ write all
    # the scripts and only then submit all of them at once
    os.chdir(script_dir)
    script_name = 'sub_recon_' + sub + '.sh'
    script_file = open(script_name, 'wt')
    for item in bash_script:
        script_file.write("%s\n" % item)
    script_file.close()

    process = subprocess.Popen(["chmod u+x " + script_name], shell=True)
    process.communicate()
    # remove the echo " ... " to make this run for real...
#    qsub_cmd = '"qsub -j y -q long.q ' + script_name + '"'    
    qsub_cmd = ["qsub -j y -q long.q ", script_name]
    process = subprocess.Popen(qsub_cmd, shell=True)
#    process = subprocess.Popen("qsub", "-j", "y", "-q",
#                               script_name, shell=True)
    process.communicate()
