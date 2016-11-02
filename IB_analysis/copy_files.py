import os
import glob
from shutil import copyfile

root_dir = "/projects/MINDLAB2015_MR-YoungAddiction/misc/behavioural/"
target_dir = "/projects/MINDLAB2015_MR-YoungAddiction/" \
             "scratch/MJ/IB_analysis/data"

os.chdir(root_dir)

subjects = glob.glob("subject*")
subjects.sort()


for subject in subjects:
    src = root_dir + subject + "/%s_singleTone1.csv" % subject
    dst = target_dir + "/%s_singleTone1.csv" % subject
    copyfile(src, dst)

    src = root_dir + subject + "/%s_singlePress.csv" % subject
    dst = target_dir + "/%s_singlePress.csv" % subject
    copyfile(src, dst)

    src = root_dir + subject + "/%s_actionTone1.csv" % subject
    dst = target_dir + "/%s_actionTone1.csv" % subject
    copyfile(src, dst)

    src = root_dir + subject + "/%s_actionPress.csv" % subject
    dst = target_dir + "/%s_actionPress.csv" % subject
    copyfile(src, dst)
