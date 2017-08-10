function [] = BLUEshireTESTING1()
%new function can read right or left data and reads medmont file
%with medmont default header
    
    %open cyan data
    fprintf('Choose patient file: cyan shire grid\n')
    openFile = uigetfile({'*.csv'},'File Selector');
    file = csvread(openFile,18,0);

    %read in third column of values
    value = file(:,3);

    %open compare file
    openFile2 = fopen('rightLeftNorms.csv');
    file2 = csvread('rightLeftNorms.csv',1,0);

    %reads in 5th and 6th columns
    LLnorm = file2(:,4);
    diseasedRod = file2(:,5);

    %open my grid with 75 pts
    openFile3 = fopen('myGrid2.csv');
    file3 = csvread('myGrid2.csv',1,0);
    Xval = file3(:,3);
    Yval = file3(:,4);

    %right or left eye
    header = importdata(openFile,'',9);
    RoL = header{9};
    RoL = RoL(6:10)
    if RoL =='Left,'
        Xval = file3(:,6);
        LLnorm = file2(:,12);
        diseasedRod = file2(:,13);
    end

    %take out values
    OutV = [2,4,5,6,7,9,70,76,69,17,16,68,67,75,74,78,73,15,14,72,77,71,82,12,81,19,79,80];
    value(OutV) = [];

    %initialize severity vectors
    Xnorm = [];
    Ynorm = [];
    Xdis = [];
    Ydis = [];
    Xsus = [];
    Ysus = [];
    Xdead = [];
    Ydead = [];
    
    %assign colors
    norm = 'b';
    dis = 'y';
    sus = 'o';
    dead = 'r';

    %step through points and add to severtiy vectors
    for i = 1:75
        if value(i) >=LLnorm(i) 
            % normal
            Xnorm = [Xnorm Xval(i)];
            Ynorm = [Ynorm Yval(i)];
        end
        if value(i) >= diseasedRod(i) && value(i) < LLnorm(i)
            % diseased rod
            Xdis = [Xdis Xval(i)];
            Ydis = [Ydis Yval(i)];
        end
        if value(i) >= 0 && value(i) < diseasedRod(i)
            %suspect
            Xsus = [Xsus Xval(i)];
            Ysus = [Ysus Yval(i)];
        end
        if value(i)<0
            %not seen
            Xdead = [Xdead Xval(i)];
            Ydead = [Ydead Yval(i)];
        end
    end

    %scatter plot
    sz = 2000;
    figure('Name','Graphical Representation of Medmont Data for blue')
    scatter(Xnorm,Ynorm,sz,'s',norm,'filled', 'markerEdgeColor','k','DisplayName','Normal')
    legend('-DynamicLegend')
    hold on
    scatter(Xdis,Ydis,sz,'s',dis,'filled', 'markerEdgeColor','k','DisplayName','Diseased Rod')
    legend('-DynamicLegend')
    hold on
    scatter(Xsus,Ysus,sz,'s',sus,'filled', 'markerEdgeColor','k','DisplayName','Suspect')
    legend('-DynamicLegend')
    hold on
    scatter(Xdead,Ydead,sz,'s',dead,'filled', 'markerEdgeColor','k','DisplayName','not seen')
    legend('-DynamicLegend')
    hold off
    
    %customize axes
    legend('Location','northwest')
    axis([-7 7 -4.5 5.75]);
    xlabel({'Eccentricity (deg)','N                                                       T'})
    ylabel('Eccentricity (deg)')
    hold on
    plot(0,0,'+r','MarkerSize',20)
    set(gca,'fontsize',24);
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

