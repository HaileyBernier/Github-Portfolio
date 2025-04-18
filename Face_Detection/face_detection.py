#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Mar 31 22:07:13 2024

@author: haileybernier
"""
import pandas as pd


from sklearn.metrics.pairwise import euclidean_distances
df = pd.read_csv('face_data.csv')
target_face = [[13,19,16,13,12,25,22,19,25]]
 
distances = euclidean_distances(target_face, df).tolist()[0]
 
min_dist = min(distances)
row = distances.index(min_dist)
       
print("Minimum Distance: ", min_dist)
print("Closest Face:")
print(df.loc[row])
       
       
        
        