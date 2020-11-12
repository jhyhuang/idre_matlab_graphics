% IDRE workshop - Advanced Garphics with Matlab
% example 12 - geo plots

clc; clear;

% data
load COVID19_global.mat

% selecte a date
idx = find(time=='01-Nov-2020');

% create a table for geo plot
tbl = table(Lat_Long(:,1),Lat_Long(:,2),Totalcases(:,idx));
tbl.Properties.VariableNames = {'Lat','Long','Cases'};
tbl.Severity = discretize(tbl.Cases,[0 1e3 5e3 1e4 5e4 1e5 5e5 1e6 5e6 1e7], ...
               'categorical', {'1-1,000','1,001-5,000','5,001-10,000','10,001-50,000', ...
                               '50,001-100,000','100,001-500,000','500,000-1,000,000', ...
                               '1,000,001-5,000,000','5,000,001-10,000,000'});
tbl(tbl.(1)==0,:) = [];
tbl(tbl.(3)<=0,:) = []; tbl(isnan(tbl.(3)),:) = [];
gb = geobubble(tbl,'Lat','Long','SizeVariable','Cases','ColorVariable','Severity','MapCenter',[20 20]);
gb.BubbleWidthRange = [10 60];
cmap = colormap(flipud(autumn(9)));
gb.BubbleColorList = cmap;
% gb.Basemap = 'colorterrain';
% gb.Basemap = 'satellite';
set(gb,'FontSize',16);
title_text = ['COVID-19 cases as ' char(time(idx))];
title(title_text);

