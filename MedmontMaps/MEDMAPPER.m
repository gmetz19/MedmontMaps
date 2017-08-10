%MEDMAPPER
clear all
clc

%script opens up a menu for user to choose which kinds of medmont test was
%conducted and a specific function will output a map of medmont data
choice = input('Choose graph calculation (Type 1 or 2:/n1.BLUE - RED shire/n2.BLUE shire');

if choice == 1 
    %BLUE - RED ON SHIRE GRID 
    %INPUT 103 PTS AND OUPUTS 75 PTS
    %USER INPUTs CYAN AND RED FILE 
    %INPUT MYGRID2 FILE
    BLUEREDshire();
    
end
if choice == 2
    %BLUE ON SHIRE GRID
    %INPUT 103 PTS AND OUPUTS 75 PTS
    %USER INPUTs CYAN
    %INPUT MYGRID2 FILE AND NORM FILE
    BLUEshire();
end
