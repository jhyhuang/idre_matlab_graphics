% IDRE workshop - Advanced Garphics with Matlab
% example 09 - surface plot

clc; clear;

% data - peaks (matlab internal function)
n = 101; % number of grids
[X,Y] = meshgrid(0:n-1,0:n-1);
Z = peaks(n);
[dX,dY] = gradient(Z,1);

% plot 
figure(1) % surf
subplot(2,2,1)
surf(X,Y,Z); shading flat; 
set(gca,'xlim',[0 n-1],'XTick',[0:25:n-1],'ylim',[0 n-1],'YTick',[0:25:n-1], ...
    'zlim',[-10 10],'ZTick',[-10:5:10],'clim',[-8 8],'FontSize',16);
xlabel('x','FontSize',20); ylabel('y','FontSize',20); zlabel('value','FontSize',20);
colorbar; 
title('surf','FontSize',24);

subplot(2,2,2);
s = surfc(X,Y,Z); shading flat;
s(2).LineWidth = 2;
set(gca,'xlim',[0 n-1],'XTick',[0:25:n-1],'ylim',[0 n-1],'YTick',[0:25:n-1], ...
    'zlim',[-10 10],'ZTick',[-10:5:10],'clim',[-8 8],'FontSize',16);
xlabel('x','FontSize',20); ylabel('y','FontSize',20); zlabel('value','FontSize',20);
colorbar;
title('surfc','FontSize',24);

figure(2)
subplot(2,3,1)
surfc(Z); shading flat;
set(gca,'xlim',[0 n-1],'XTick',[0:25:n-1],'ylim',[0 n-1],'YTick',[0:25:n-1], ...
    'zlim',[-10 10],'ZTick',[-10:5:10],'clim',[-8 8],'FontSize',16);
view(-15,15);
title('view(-15,15)','FontSize',22);

subplot(2,3,2)
surfc(Z); shading flat;
set(gca,'xlim',[0 n-1],'XTick',[0:25:n-1],'ylim',[0 n-1],'YTick',[0:25:n-1], ...
    'zlim',[-10 10],'ZTick',[-10:5:10],'clim',[-8 8],'FontSize',16);
view(-30,30);
title('view(-30,30)','FontSize',22);

subplot(2,3,3)
surfc(Z); shading flat;
set(gca,'xlim',[0 n-1],'XTick',[0:25:n-1],'ylim',[0 n-1],'YTick',[0:25:n-1], ...
    'zlim',[-10 10],'ZTick',[-10:5:10],'clim',[-8 8],'FontSize',16);
view(-45,45);
title('view(-45,45)','FontSize',22);

subplot(2,3,4)
surfc(Z,'FaceLighting','gouraud'); shading flat;
set(gca,'xlim',[0 n-1],'XTick',[0:25:n-1],'ylim',[0 n-1],'YTick',[0:25:n-1], ...
    'zlim',[-10 10],'ZTick',[-10:5:10],'clim',[-8 8],'FontSize',16);
xlabel('x','FontSize',20); ylabel('y','FontSize',20); zlabel('value','FontSize',20);
view(-30,30);
camlight('right')
title('camlight right','FontSize',22);

subplot(2,3,5)
surfc(Z,'FaceLighting','gouraud'); shading flat;
set(gca,'xlim',[0 n-1],'XTick',[0:25:n-1],'ylim',[0 n-1],'YTick',[0:25:n-1], ...
    'zlim',[-10 10],'ZTick',[-10:5:10],'clim',[-8 8],'FontSize',16);
xlabel('x','FontSize',20); ylabel('y','FontSize',20); zlabel('value','FontSize',20);
view(-30,30);
camlight('headlight');
title('camlight headlight','FontSize',22);

subplot(2,3,6)
sc = surfc(Z,'FaceLighting','gouraud'); shading flat;
set(gca,'xlim',[0 n-1],'XTick',[0:25:n-1],'ylim',[0 n-1],'YTick',[0:25:n-1], ...
    'zlim',[-10 10],'ZTick',[-10:5:10],'clim',[-8 8],'FontSize',16);
xlabel('x','FontSize',20); ylabel('y','FontSize',20); zlabel('value','FontSize',20);
view(-30,30);
camlight('headlight'); material dull;
title('camlight+material','FontSize',22);

