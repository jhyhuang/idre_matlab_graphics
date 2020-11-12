% IDRE workshop - Advanced Garphics with Matlab
% example 07 - 3D line plot

clc; clear;

% data - spiral function
t = linspace(0,20,501);
xtp = exp(t./10).*sin(5*t);
ytp = exp(t./10).*cos(5*t);

% plot
figure(1)
subplot(2,2,1)
plot3(xtp,ytp,t,'-','LineWidth',3,'Color','b'); grid on;
set(gca,'xlim',[-8 8],'ylim',[-8 8],'ZTick',[0:5:20],'FontSize',14);
xlabel('x','FontSize',20);
ylabel('y','FontSize',20);
zlabel('time','FontSize',20);
title('Spiral function','FontSize',22);

subplot(2,2,2)
p = plot3(xtp,ytp,t,'-','LineWidth',3); grid on;
cmap = [uint8(jet(length(t))*255) uint8(ones(length(t),1))].'; % modified jet
drawnow;
set(p.Edge,'ColorBinding','interpolated','ColorData',cmap);
set(gca,'xlim',[-8 8],'ylim',[-8 8],'ZTick',[0:5:20],'FontSize',14);
xlabel('x','FontSize',20);
ylabel('y','FontSize',20);
zlabel('time','FontSize',20);
title('Spiral function (w/ color)','FontSize',22);


