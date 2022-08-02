# -*- coding: utf-8 -*-
"""
Created on Sun Jul 31 14:34:33 2022

@author: luisa
"""
#PROBLEM 1
import math

def cholesky (A):
    
    for i in range(len(A)):
        for j in range(len(i)):
            sum = 0
            for k in range(len(j)):
                sum += L[i][k] * L[j][k]
            if i == j:
                L[i][j] = math.sqrt(A[i][i] - sum)
            else:
                L[i][j] = (1.0/L[j][j] * (A[i][j] - sum))
    return L


#PROBLEM 2
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
#import numpy as np
#import matplotlib.pyplot as plt

#Load file
inmate_info = pd.read_csv("C:\\Users\\luisa\\Documents\\Summer 2022\\STAT\\HVD_June_2021.csv")

#a
#Create bar plot
inmate_info['Sentence (Years)'].value_counts().plot(kind = 'bar')

inmate_info.groupby('Sentence (Years)').size().plot(kind = 'bar')

sns.countplot(inmate_info['Sentence (Years)'])

#b
#get top two categories for the TDCJ Offense variable
inmate_info['TDCJ Offense'].value_counts()

#Replace Life and Capital Life values
inmate_info['Sentence (Years)'].replace(["Life", "Capital Life", "LWOP", "Death"], [100, 200,100, 200], inplace = True)

#type(inmate_info['Sentence (Years)'][1])

sentence = inmate_info['Sentence (Years)']

#convert to numeric
sentence_int = pd.to_numeric(sentence)

#Replace values greater than 200 with 200
cond = sentence_int > 200

sentence_int.loc[cond] = 200

#Generate Boxplot
#inmate_info.boxplot(column = 'Sentence (Years)', by = "TDCJ Offense")
#sns.boxplot(x = 'TDCJ Offense', y = 'Sentence (Years)', data = inmate_info)

sns.boxplot(x = 'TDCJ Offense', y = sentence_int, data = inmate_info) #works, too crowded

#Select two top categories and create new df
df_top1 = inmate_info[inmate_info['TDCJ Offense'] == 'MURDER']

df_top2 = inmate_info[inmate_info['TDCJ Offense'] == 'AGG ROBBERY']

merge = [df_top1, df_top2]

merged_top2 = pd.concat(merge)

#convert to numeric and replace values in a new col
sentence_from_merged =  merged_top2['Sentence (Years)']
sentence_merged_num = pd.to_numeric(sentence_from_merged)

#replace > 200
sentence_merged_num.loc[cond] = 200

#create boxplot
sns.boxplot(x = 'TDCJ Offense', y = sentence_merged_num, data = merged_top2)

#c
#obtain new df with information about Life and Capital Life only
inmate_info2 = pd.read_csv("C:\\Users\\luisa\\Documents\\Summer 2022\\STAT\\HVD_June_2021.csv")
df_life = inmate_info2[inmate_info2['Sentence (Years)'] == 'Life']
df_capital_life = inmate_info2[inmate_info2['Sentence (Years)'] == 'Capital Life']

merge_life = [df_life, df_capital_life]
merged_capital_life = pd.concat(merge_life)

top_facilities = merged_capital_life['Current Facility'].value_counts()
top_facilities.head(10)

#d
sns.boxplot(x = 'Race', y = sentence_int, data= inmate_info)

#e
plt.hist(inmate_info[inmate_info['Gender'] == 'M']['Age'].reset_index(drop=True), alpha=0.6, label="Male")
plt.hist(inmate_info[inmate_info['Gender'] == 'F']['Age'].reset_index(drop=True), alpha=0.6, label="Male")
plt.legend()
plt.show()

#Other way
inmate_info.plot.hist(column = ['Age'], by = 'Gender') #not working atm

plt.style.use('seaborn-deep')
x1 = inmate_info['Gender'] == 'M'
x2 = inmate_info['Gender'] == 'F'
y = inmate_info['Age']
plt.hist([x1,y], label= ['x', 'y'])
plt.hist([x2,y], label= ['x', 'y'])
plt.legend(loc='upper right')
plt.show() #not working

#f
#divide data by M
df_m = inmate_info[inmate_info['Gender'] == 'M']
top_county_m = df_m['County'].value_counts()
top10_county_m = top_county_m.head(10)

top10M_county_df = pd.DataFrame(top10_county_m.reset_index().values, columns=['County', 'Count'])

sns.set_theme(style="whitegrid")
ax = sns.barplot(x="County", y="Count", data= top10M_county_df)

#Divide data by F
df_f = inmate_info[inmate_info['Gender'] == 'F']
top_county_f = df_f['County'].value_counts()
top10_county_f = top_county_f.head(10)

top10F_county_df = pd.DataFrame(top10_county_f.reset_index().values, columns=['County', 'Count Females'])

sns.barplot(x='County', y='Count Females', data= top10F_county_df)

#g
top_counties_capital = merged_capital_life['County'].value_counts()
top_counties_capital.head(10)

#Get data from El Paso only
df_EP = inmate_info2[inmate_info2['County'] == 'El Paso']

#get lowest and greatest value from Sentence (Years)
df_EP['Sentence (Years)'].min()
df_EP['Sentence (Years)'].max()




