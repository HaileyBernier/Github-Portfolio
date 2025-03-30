##Face Detection Project

##Overview

This project implements a basic face detection system using numerical facial feature data. It finds the closest matching face from a dataset using Euclidean distance.

##Files Included

face_detection.py: Python script that reads facial data, computes Euclidean distances, and finds the closest matching face.

face_data.csv: Dataset containing numerical facial feature vectors.

##How It Works

The script loads the face_data.csv file.

A target face is defined as a feature vector.

The Euclidean distance between the target face and all dataset entries is computed.

The closest face (minimum distance) is identified and displayed.

##Requirements

Python 3.x

##Required libraries:

pip install pandas scikit-learn

Running the Script

##To run the face detection script:

python face_detection.py

##Future Enhancements

Implement additional distance metrics (Cosine Similarity, Manhattan Distance).

Add data visualization (histograms, pair plots, box plots).

Normalize and preprocess data for better accuracy.

Integrate a machine learning model for improved face classification.

Build a web interface using Flask or Streamlit.

##Author

Hailey Bernier


