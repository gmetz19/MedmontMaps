# MedmontMaps
Program on matlab that maps out the export from the Medmont
upload csv Medmont files to output a color map to show rod and cone function

MEDMONT MAP GRAPHS-------- The main script allows the user to choose from a menu of options to perform different functions which creates a map graph of 1. the cone function from the blue - red data on a 75 pt grid. 2. the rod function data from a cyan test Only 75 of 103 points from the shire test are incorporated into the map grid because the program only keeps points that are spaced 12 units apart. 
Getting Started-----------

Download this repository by cloning it and copy the clone URL for the repository

Open the terminal and change the working directory to where you want to put the cloned repository by typing into the terminal: cd ./NAME-OF-FOLDER

then type git clone and the the copied URL: git clone https://github.com/USERNAME/REPOSITORY Must have Matlab_R2015a downloaded

Export medmont data and covert to a .csv file

label as cyan or red, left or right and save into the same folder with the matlab files

Edit the csv files and delete the two rightmost columns: COLOR and STOPWATCH (Matlab dlmread cannot read any words below the header line specified)

Run the script and choose the which kind of map you want outputted or run the individual functions. The functions prompt the user to choose the medmont data from your files.

Save output graph as a .jpg

Additional information------

If Medmont updates the output excel file header, you can edit the code to change the number of header lines on line 7 where it says: file = csvread(openFile,18,0); and where it reads if it is a Right or Left eye: header = importdata(openFile,'',9); RoL = header{9};
The RightLeftNorms.csv and the rightleftnormsFULL.csv file are comparison files with the values for normal, lower limit of normal,  disease rod, and suspect that correspond with the each x and y coordinates. The file also includes these values reordered for left eye data.
The myGrid2.csv file has x and y coordinates for right or left eyes.
Included in this repository are test files for cyan shire
The compare file rightLeftNorms.csv of normal, diseased rod, and suspect has been updated
