import os
import glob
from shutil import copyfile

root_dir = "/projects/MINDLAB2015_MR-YoungAddiction/misc/behavioural"
target_dir = "/projects/MINDLAB2015_MR-YoungAddiction/" \
             "scratch/MJ/IB_analysis/data"

os.chdir(root_dir)

subjects = glob.glob("subject*")
subjects.sort()


for subject in subjects:
    src = root_dir + subject + "/%s_singleTone1.csv" % subject
    dst = target_dir + "/%s_singleTone1.csv" % subject
    print(src)
    print(dst)
