function [] = BLUEREDshire1()
%new function can read right or left data and reads medmont file
%with medmont default header
        
        %open cyan data
        fprintf('Choose patient file: cyan data\n')
        openFile = uigetfile({'*.csv'},'File Selector');
        file = csvread(openFile,18,0);

        %read in 3rd column of blue values
        valueB = file(:,3);

        %open red data
        fprintf('Choose patient file: red data\n')
        openFile2 = uigetfile({'*.csv'},'File Selector');
        file2 = csvread(openFile2,18,0);

        %read in third column of red values
        valueR = file2(:,3);

        %open my grid with 75 pts
        openFile3 = fopen('myGrid2.csv');
        file3 = csvread('myGrid2.csv',1,0);
        Xval = file3(:,3);
        Yval = file3(:,4);

        %subtract red from blue
        value = valueB - valueR;

        %right or left eye
        header = importdata(openFile,'',9);
        RoL = header{9};
        RoL = RoL(6:10)
        %flip x coordinates if left eye
        if RoL =='Left,'
            Xval = Xval*(-1);
        end
       
        %take out values
        OutV = [2,4,5,6,7,9,70,76,69,17,16,68,67,75,74,78,73,15,14,72,77,71,82,12,81,19,79,80];
        value(OutV) = [];

        %initialize color vectors
        XBval = [];
        YBval = [];
        XWval = [];
        YWval = [];

        %black: cones
        %white: rods
        b = 'k';
        w = 'w';

        %step through points and assign to the white and black vectors
        for i = 1:75
            if value(i) >=5
                XWval = [XWval Xval(i)];
                YWval = [YWval Yval(i)];
            end
            if value(i) <5 
                XBval = [XBval Xval(i)];
                YBval = [YBval Yval(i)];
            end
        end

        %scatter plot 
        sz = 2000;
        figure('Name','Graphical Representation of Medmont Data for BLUE - RED')
        scatter(XBval,YBval,sz,'s',b,'filled', 'markerEdgeColor','k')
        hold on
        scatter(XWval,YWval,sz,'s',w,'filled', 'markerEdgeColor','k')
        hold on 
        plot(0,0,'+r','MarkerSize',20)
        hold off

        %customize axes
        legend('cones','rods','Location','northwest')
        axis([-7 7 -4.5 5.75])
        xlabel({'Eccentricity (deg)','N                                                   T'})
        ylabel('Eccentricity (deg)')
        set(gca,'fontsize',24)
        set(gca,'FontName','Arial');
        set(gca,'TickDir','out');
    
         ax = gca;
         ax.XTick = [-6 -4 -2 0 2 4 6];
         ax.YTick = [-4 -2 0 2 4];
         ax.XTickLabel = {'-72', ' -48', '-24', '0', '24', '48', '72'};
         ax.YTickLabel = {' -48', '-24', '0', '24', '48'};
        
        %saves local variables to the base workspace
        save myvar.mat
        evalin('base','load myvar.mat')
end

