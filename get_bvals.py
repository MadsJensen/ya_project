# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import numpy as np
from nibabel.nicom.dicomreaders import read_mosaic_dwi_dir
import os
import sys
# import errno  # should do some error checking...
# import subprocess
# ENH: install "official" version of stormdb on isis/hyades
# path_to_stormdb = '/users/cjb/src/git/cfin-tools/stormdb/stormdb'
path_to_stormdb = "/users/cjb/src/git/cfin-tools/stormdb/stormdb"
sys.path.append(path_to_stormdb)

# change to stormdb.access (mod. __init__.py)
from access import Query

proj_code = 'MINDLAB2015_MR-YoungAddiction'

db = Query(proj_code)
proj_folder = os.path.join('/projects', proj_code)
scratch_folder = os.path.join(proj_folder, 'scratch')

# recon_all_bin = '/opt/local/freesurfer-releases/5.3.0/bin/recon-all'
subjects_dir = os.path.join(scratch_folder, 'minc_mje/')
output_dir = os.path.join(scratch_folder, 'minc_mje/dt_recon/')
bval_dir = os.path.join(proj_folder, 'misc/')
script_dir = os.path.join(proj_folder, 'scripts/MR_scripts')

included_subjects = db.get_subjects()
# included_subjects = included_subjects[3:]
# just test with first one!
# included_subjects = [included_subjects[0]]

for sub in included_subjects:
    # this is an example of getting the DICOM files as a list
    sequence_name = 'ep2d_diff_free_Slow_kurtosis_noIR_ORIG'
    mr_study = db.get_studies(sub, modality='MR', unique=True)
    # if mr_study is not None:
    try:
        # This is a 2D list with [series_name, series_number]
        series = db.get_series(sub, mr_study[0], 'MR')
        # Change this to be more elegant: check whether any item in series
        # matches sequence_name
        try:
            T1_file_names = db.get_files(sub, mr_study[0], 'MR',
                                         series[sequence_name])

            dcm_dir = T1_file_names[0][:-55]  # first DICOM file
            data, affine, bvals, bvecs = read_mosaic_dwi_dir(dcm_dir)
            np.savetxt("%s%s_bvals" % (bval_dir, sub[:4]), bvals)
            np.savetxt("%s%s_bvecs" % (bval_dir, sub[:4]), bvecs)

        except:
            pass
    except:
        pass
    #     process = subprocess.Popen(["chmod u+x " + script_name], shell=True)
    #     process.communicate()
    #      # remove the echo " ... " to make this run for real...
    #     qsub_cmd = '"qsub -j y -q long.q ' + script_name + '"'
    # #    qsub_cmd = ["qsub -j y -q long.q ", script_name]
    #     process = subprocess.Popen([qsub_cmd], shell=True)
    #     process.communicate()
