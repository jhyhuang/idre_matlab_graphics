% IDRE workshop - Advanced Garphics with Matlab
% example 06 - barplot

clc; clear;

% data - COVID 19 in California
fname_in = ['COVID19_states.csv']; % file name
url = ['https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv']; 
websave(fname_in,url); % save file to local drive
fmt = ['%s %s %f %f %f']; % data format (date, state, fids, confirmed cases, deaths)
fid = fopen(fname_in,'rt'); % open file
ori_data = textscan(fid,fmt,'HeaderLines',1,'Delimiter',','); % scan data text
clear fname_in fmt fid ans;
idx = find(strcmp(ori_data{2}(:),'California'));
dates = ori_data{1}(idx);
confirmed_cases = ori_data{4}(idx);
death_cases = ori_data{5}(idx);
daily_cases(:,1) = max(diff(confirmed_cases),0); % daily data
daily_cases(:,2) = max(diff(death_cases),0);
dates(1) = [];
clear idx ori_data confirmed_cases death_cases;
avgdays = 14;
dx = 14;

% plot
figure(1) % bar plot
subplot(2,2,1)
b = bar([1:2:length(dates)],daily_cases(1:2:end,1)); hold;
b.FaceAlpha = 0.5;
plot([1:length(dates)],movmean(daily_cases(:,1),avgdays),'-b','LineWidth',3);
set(gca,'xlim',[50 length(dates)],'XTick',[1:dx:length(dates)],'XTicklabel',dates(1:dx:end), ...
    'Ylim',[0 14000],'FontSize',14);
xtickangle(45);
temp = [num2str(avgdays) '-day moving mean'];
legend('Cases',temp,'Location','NorthWest','FontSize',20);
title_text = ['Cal COVID-19 daily cases (bar plot)'];
title(title_text,'FontSize',22);

subplot(2,2,2)
b = bar([1:2:length(dates)],daily_cases(1:2:end,1)); hold;
b.FaceAlpha = 0.5;
b = bar([1:2:length(dates)],daily_cases(1:2:end,2));
b.FaceAlpha = 0.5; clear b;
plot([1:length(dates)],movmean(daily_cases(:,1),avgdays),'-b','LineWidth',3);
plot([1:length(dates)],movmean(daily_cases(:,2),avgdays),'r','LineWidth',3);
set(gca,'xlim',[50 length(dates)],'XTick',[1:dx:length(dates)],'XTicklabel',dates(1:dx:end), ...
    'Ylim',[0 1.4e5],'Yscale','log','FontSize',14);
legend('Cases','Deaths','Location','NorthWest','FontSize',20);
xtickangle(45);
title_text = ['Cal COVID-19 daily data (bar plot)'];
title(title_text,'FontSize',22);

subplot(2,2,3)
stem([1:2:length(dates)],daily_cases(1:2:end,1),'LineWidth',2); hold;
plot([1:length(dates)],movmean(daily_cases(:,1),avgdays),'-b','LineWidth',3);
set(gca,'xlim',[50 length(dates)],'XTick',[1:dx:length(dates)],'XTicklabel',dates(1:dx:end), ...
    'Ylim',[0 14000],'FontSize',14);
xtickangle(45);
temp = [num2str(avgdays) '-day moving mean'];
legend('Cases',temp,'Location','NorthWest','FontSize',20);
title_text = ['Cal COVID-19 daily cases (stem plot)'];
title(title_text,'FontSize',22);

subplot(2,2,4)
stairs([1:2:length(dates)],daily_cases(1:2:end,1),'LineWidth',2); hold;
plot([1:length(dates)],movmean(daily_cases(:,1),avgdays),'-b','LineWidth',3);
set(gca,'xlim',[50 length(dates)],'XTick',[1:dx:length(dates)],'XTicklabel',dates(1:dx:end), ...
    'Ylim',[0 14000],'FontSize',14);
xtickangle(45);
temp = [num2str(avgdays) '-day moving mean'];
legend('Cases',temp,'Location','NorthWest','FontSize',20);
title_text = ['Cal COVID-19 daily cases (stairs plot)'];
title(title_text,'FontSize',22);
