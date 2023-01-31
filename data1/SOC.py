import os
import pandas as pd
folder = r"D:\test_development\Battery\data1\LG_HG2_Original_Dataset_McMasterUniversity_Jan_2020\40degC/"

df = pd.DataFrame()

for filename in os.listdir(folder):
    if(filename == 'all_raw.csv'):
        continue
    if(filename == 'all_minute.csv'):
        continue
    if(filename == 'all_second.csv'):
        continue
    file_df = pd.read_csv(folder + filename, usecols=[0, 8, 9, 10, 11], skiprows=29, names=['Time Stamp', 'Voltage', 'Current', 'Temperature', 'Capacity'])
    file_df.loc[file_df['Time Stamp'].str.len() < 15, 'Time Stamp'] = file_df['Time Stamp'] + ' 12:00:00 AM'
    file_df = file_df[1:]

    type_dict = {'Voltage':'float', 'Current':'float', 'Temperature':'float', 'Capacity':'float'}
    file_df['Time Stamp'] = pd.to_datetime(file_df['Time Stamp'], format='%m/%d/%Y %I:%M:%S %p')
    file_df = file_df.astype(type_dict)

    file_df.drop_duplicates(inplace=True, ignore_index=True, subset='Time Stamp')

    file_df.set_index('Time Stamp', inplace=True)
    file_df = file_df.resample('1S').interpolate(method='linear')
    file_df.reset_index(inplace=True)

    df = pd.concat([df, file_df], axis=0, ignore_index=True)

df.drop_duplicates(inplace=True, ignore_index=True, subset='Time Stamp')
df.sort_values(by=['Time Stamp'])
print(df)

df.to_csv(folder + 'all_second.csv', index=None)