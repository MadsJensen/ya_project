import pandas as pd
import os
import glob

#data_path = "/projects/MINDLAB2015_MR-YoungAddiction/scratch/" +\
#           "MJ/IB_analysis/data"
data_path = "/Users/au194693/projects/ya_project/IB_analysis/data"

os.chdir(data_path)

id = pd.read_excel("id_gruppe.xlsx")
id = id[:109]
id.columns = ["id", "group"]

condtions = ["singlePress", "actionPress1", "actionTone1", "singleTone1"]

file_list = glob.glob("subje*")

# extracts sub id and make a list
subjects = list(set([f[8:11] for f in file_list]))
subjects.sort()

all_data = pd.DataFrame()

for subject in subjects:
    subject_data = pd.DataFrame()
    for condition in condtions:
        data_file = "subject_%s_%s.csv" % (subject, condition)
        data = pd.read_csv(data_file, delimiter=";")

        if (condition == "singlePress") | (condition == "actionPress"):
            data["recalc_1"] = (data["ansAngle"] < 90) & (
                data["pressAngle"] > 270)
            data["recalc_2"] = (data["ansAngle"] > 270) & (
                data["pressAngle"] < 90)
            for index, row in data.iterrows():
                if row.recalc_1:
                    data.ansAngle.ix[index] = row.ansAngle + 360

            for index, row in data.iterrows():
                if row.recalc_2:
                    data.pressAngle.ix[index] = row.pressAngle + 360

            data["error_time"] = (
                data["ansAngle"] - data["pressAngle"]) * 2560 / 360

        if (condition == "singleTone1") or (condition == "actionTone1"):
            data["recalc_1"] = (data["ansAngle"] < 90) & (
                data["toneAngle"] > 270)
            data["recalc_2"] = (data["ansAngle"] > 270) & (
                data["toneAngle"] < 90)
            for index, row in data.iterrows():
                if row.recalc_1:
                    data.ansAngle.ix[index] = row.ansAngle + 360

            for index, row in data.iterrows():
                if row.recalc_2:
                    data.toneAngle.ix[index] = row.toneAngle + 360

            data["error_time"] = (
                data["ansAngle"] - data["toneAngle"]) * 2560 / 360

        # TODO: add group number to subject

        subject_data = subject_data.append(data, ignore_index=True)
        subject_data["group"] = (
            id.loc[id["id"] == int(subject)].group.get_values()[0])

    all_data = all_data.append(subject_data, ignore_index=True)
