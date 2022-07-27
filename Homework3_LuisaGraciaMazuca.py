# -*- coding: utf-8 -*-
"""
Created on Mon Jul 25 16:06:58 2022

@author: luisa
"""
#HOMEWORK 3

import pandas as pd
#import statistics
import numpy as np

diabetes = pd.read_csv("C:\\Users\\luisa\\Documents\\Summer 2022\\STAT\\diabetes.csv")

#print(diabetes.to_string())

#PROBLEM 1

diabetes.mean(axis = 'index')

diabetes.median(axis = 'index')

diabetes.std(axis = 'index')

#IQR
def calc_iqr(col):
    return(np.subtract(*np.percentile(col,[75,25])))

for column in diabetes:
    print("The IQR for", column, "is:", calc_iqr(diabetes[column]))

#Other method for IQR
def find_iqr(col):
    q3 = np.quantile(col, 0.75)
    q1 = np.quantile(col, 0.25)
    iqr = q3-q1
    return(iqr)

for column in diabetes:
    print("The IQR for", column, "is:", find_iqr(diabetes[column]))

#Range
def calc_range(col):
    return(col.max()-col.min())

for column in diabetes:
    print("The range for", column, "is:", calc_range(diabetes[column]))
    
#PROBLEM 2
diabetes.hist()

#PROBLEM 3
diabetes.boxplot()

#PROBLEM 4
diabetes.boxplot(by = 'Outcome')
    




     
