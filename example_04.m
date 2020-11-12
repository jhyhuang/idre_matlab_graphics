% IDRE workshop - Advanced Garphics with Matlab
% example 04 - histograms

clc; clear;

% data - Gamma duistribution
shape = [1,2,3,5,9]; scale = [2,2,2,1,0.5];
x = [0:0.05:20];
yd = zeros(length(shape),length(x));
y = zeros(length(shape),length(x));
for i = 1:length(shape)
  yd(i,:) = gamrnd(shape(i),scale(i),1,length(x)); % random data
  y(i,:) = gampdf(x,shape(i),scale(i)); % gemma pdf
end
clear i;

% plot
figure(1)
subplot(2,2,1)
plot(x,y,'-','LineWidth',3); hold; grid on;
set(gca,'XTick',[0:2:20],'Xlim',[0 20],'YTick',[0:0.1:0.5],'Ylim',[0 0.5],'FontSize',14);
xlabel('Observations','FontSize',20)
ylabel('Probability Density','FontSize',20);
title('Gamma distribution','FontSize',22);
legend('k=1.0,\Theta=2.0','k=2.0,\Theta=2.0','k=3.0,\Theta=2.0','k=5.0,\Theta=1.0','k=9.0,\Theta=0.5', ...
       'Location','NorthEast','FontSize',20);
subplot(2,2,2)
for i = 1:length(shape)
  histogram(yd(i,:),10,'Normalization','Probability');
  if i==1
    hold; grid on;
  end
end
clear i;
set(gca,'XTick',[0:2:20],'Xlim',[0 20],'YTick',[0:0.1:0.5],'Ylim',[0 0.5],'FontSize',14);
xlabel('Observations','FontSize',20);
ylabel('Normalized histogram','FontSize',20);
title('Histograms of data','FontSize',22);
