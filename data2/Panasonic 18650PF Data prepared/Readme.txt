The included example script was created by Dr. Carlos Vidal and Dr. Phillip Kollmeyer at McMaster University in Hamilton, Ontario, Canada.  If this script and the included dataset is utilized for any purporse, the following paper should be referenced along with this Mendeley dataset:

Carlos Vidal, Pawel Malysz, Mina Naguib, Ali Emadi, Phillip J. Kollmeyer, “Estimating battery state of charge using recurrent and non-recurrent neural networks,” Journal of Energy Storage, 2021 (see https://www.sciencedirect.com/ for complete citation information).


The example script is configured to train two different types of machine learning state of charge estimation algorithms - a feedforward neural network with filtered input values and a long short term memory (LSTM) recurrent neural network.  These algorithms are described in detail in the above reference.  The script trains the SOC estimator for normalized data for a Panasonic 18650PF battery dataset which can be found here: https://data.mendeley.com/datasets/wykht8y7tg/1 


%*****************************************************************************************%
-Instructions for Downloading and Running the Script:
1-Select download all files from the Mendeley Data page 
2-The files will be downloaded as a zip file.  Unzip the file to a folder, do not modify the folder structure.
3-Open and run "LSTMvsFNN_Script_Nov_2021_V2.mlx"
4-Further instructions are included in the comments and text in the script (for better experience use the "Matlab Live Code File" with extension *.mlx).


%*****************************************************************************************%
Important - Additional notes regarding the script:
When changing the type of neural network go to line 101 and follow the instructions below.

To select Neural Network Type (line 101): 

Select "1" on the drop down for LSTM
Select "2" on the drop down for FNN

Also go to line 237 and make the same selection of Neural Network Type.

%*****************************************************************************************%
Description of included data files:

-All data is normalized, see "Normalization" folder for example showing how to denormalize data

-Data for -20, -10, 0, 10, and 25degC is included (in the paper, the -20degC data is not used)

-The "X" data has 7 rows, where the data in each row is as follows: { V, I, T, V_0.5mHz, I_0.5mHz, V_5mHz, I_5mHz}, where V is voltage, I is current, T is temperature, and the _0.5mHz and _5mHz data is filtered with a 1st order low pass Butterworth filter

-The "Y" data is state of charge calculated via coulomb counting

-The data is split into Train, Test, and Validation and is saved in the respective folders (see the Journal of Energy Storage paper for a description of how the data is split).  Mix 1 to 4 and US06 are used for training, LA92 -10degC for validation, and LA92, NN, and UDD for testing (UDDS is not used for testing in the paper).

-The training data is split into ten separate files, this allows up to 10 minibatches to be used when training the network, although the script is configured by default for 1 minibatch.


 