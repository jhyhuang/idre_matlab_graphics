% IDRE workshop - Advanced Garphics with Matlab
% example 05 - scatter+histogram

clc; clear;

% data - small car test data (matlab internal dataset) 
fname = (['carsmall']);
load(fname,'Cylinders','Acceleration','Horsepower','MPG','Mfg','Model');

figure(1)
subplot(2,2,1)
scatter(Horsepower(Cylinders==8),MPG(Cylinders==8),'ob','MarkerFaceColor','b'); hold;
scatter(Horsepower(Cylinders==4),MPG(Cylinders==4),'or','MarkerFaceColor','r');
scatter(Horsepower(Cylinders==6),MPG(Cylinders==6),'oy','MarkerFaceColor','y');
set(gca,'xlim',[50 230],'ylim',[0 50],'FontSize',16); grid on;
xlabel('Horsepower','FontSize',18); ylabel('MPG','FontSize',18);
legend('Cylinder=8','Cylinder=4','Cylinder=6','FontSize',16);
title('Horsepower vs. MPG','FontSize',20);

subplot(3,2,2)
histogram(Horsepower(Cylinders==8),10,'FaceColor','b'); hold;
histogram(Horsepower(Cylinders==4),10,'FaceColor','r');
histogram(Horsepower(Cylinders==6),10,'FaceColor','y');
set(gca,'xlim',[50 230],'ylim',[0 20],'FontSize',14); grid on;
xlabel('Horsepower','FontSize',16); 
legend('Cylinder=8','Cylinder=4','Cylinder=6','FontSize',14);
title('Histogram by Horsepower','FontSize',16);
subplot(3,2,4)
histogram(MPG(Cylinders==8),10,'FaceColor','b'); hold;
histogram(MPG(Cylinders==4),10,'FaceColor','r');
histogram(MPG(Cylinders==6),10,'FaceColor','y');
set(gca,'xlim',[0 50],'ylim',[0 20],'FontSize',14); grid on;
xlabel('MPG','FontSize',16); 
title('Histogram by MPG','FontSize',16);

% arrange tables
tbl_1 = table(Horsepower,MPG,Cylinders);
tbl_2 = table(Horsepower,Acceleration,Cylinders);

figure(2)
subplot(2,2,1)
scatterhistogram(tbl_1,'Horsepower','MPG','GroupVariable','Cylinders', ...
   'NumBins',10,'HistogramDisplayStyle','stairs','LineStyle','-','LineWidth',1.5, ...
   'ScatterPlotLocation','NorthEast','LegendVisible','on');
set(gca,'xlim',[50 230],'ylim',[0 50],'FontSize',14,'title','Horsepower vs. MPG')
subplot(2,2,2)
scatterhistogram(tbl_2,'Horsepower','Acceleration','GroupVariable','Cylinders', ...
   'NumBins',10,'HistogramDisplayStyle','stairs','LineStyle','-','LineWidth',1.5, ...
   'ScatterPlotLocation','NorthEast','LegendVisible','off');
set(gca,'xlim',[50 230],'ylim',[5 30],'FontSize',14,'title','Horsepower vs. Acceleration');
