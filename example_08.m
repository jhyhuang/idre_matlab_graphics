% IDRE workshop - Advanced Garphics with Matlab
% example 08 - contour, pcolor, and vector plot (quiver)

clc; clear;

% data - peaks (matlab internal function)
n = 101; % number of grids
[X,Y] = meshgrid(0:n-1,0:n-1);
Z = peaks(n);
[dX,dY] = gradient(Z,1);

% plot 
figure(1) % contour 
subplot(2,2,1)
contour(X,Y,Z,20,'LineWidth',2); shading flat; 
set(gca,'xlim',[0 n-1],'XTick',[0:20:n-1],'Ylim',[0 n-1],'YTick',[0:20:n-1],'clim',[-8 8],'FontSize',16);
xlabel('x','FontSize',20); ylabel('y','FontSize',20);
title('contour','FontSize',22); 
colorbar; 

subplot(2,2,2) % contourf
contourf(X,Y,Z,20); shading flat; 
set(gca,'xlim',[0 n-1],'XTick',[0:20:n-1],'Ylim',[0 n-1],'YTick',[0:20:n-1],'clim',[-8 8],'FontSize',16);
xlabel('x','FontSize',20); ylabel('y','FontSize',20);
title('contourf','FontSize',24); 
colorbar;

subplot(2,2,3)
contourf(X,Y,Z,20,'LineColor','none'); shading flat; 
set(gca,'xlim',[0 n-1],'XTick',[0:20:n-1],'Ylim',[0 n-1],'YTick',[0:20:n-1],'clim',[-8 8],'FontSize',16);
xlabel('x','FontSize',20); ylabel('y','FontSize',20);
title('contourf','FontSize',22); 
colorbar;

subplot(2,2,4)
pcolor(X,Y,Z); shading flat; 
set(gca,'xlim',[0 n-1],'XTick',[0:20:n-1],'Ylim',[0 n-1],'YTick',[0:20:n-1],'clim',[-8 8],'FontSize',16);
xlabel('x','FontSize',20); ylabel('y','FontSize',20);
title('pcolor','FontSize',22); 
colorbar;
colormap(jet);

figure(2)
subplot(2,2,1) % quiver
quiver(X,Y,dX,dY); hold;
selx = [20:40]; sely = [40:60]; 
line([selx(1) selx(1)],[sely(1) sely(end)],'Color','r'); line([selx(1) selx(end)],[sely(1) sely(1)],'Color','r');
line([selx(end) selx(end)],[sely(1) sely(end)],'Color','r'); line([selx(1) selx(end)],[sely(end) sely(end)],'Color','r');
set(gca,'xlim',[0 n-1],'XTick',[0:20:n-1],'Ylim',[0 n-1],'YTick',[0:20:n-1],'FontSize',16);
xlabel('x','FontSize',20); ylabel('y','FontSize',20);
title('Gradient (quiver)','FontSize',22); 

subplot(2,2,2)
contourf(X,Y,Z,20); hold;
q = quiver(X(sely,selx),Y(sely,selx),dX(sely,selx),dY(sely,selx));
set(q,'Color','w','LineWidth',2);
set(gca,'xlim',[20 40],'Ylim',[40 60],'FontSize',16);
xlabel('x','FontSize',20); ylabel('y','FontSize',20);
title('quiver (zoom in)','FontSize',22); 


