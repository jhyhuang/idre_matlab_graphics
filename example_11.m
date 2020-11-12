% IDRE workshop - Advanced Garphics with Matlab
% example 11 - colormaps

clc; clear;

% load data from Kings
load Kings.mat;
Snow = Snow/1000; % mm -> m
Snow(Snow<=0.5) = NaN;
crange_elev = [0 4400]; crange_snow = [0 2];

% load colormap
load Color_elev.dat; Color_elev = Color_elev/255;
load Color_snow.dat; Color_snow = Color_snow/255;

figure(1)
ax = subplot(2,3,1); % elev
pcolor(Lon,Lat,Elev); shading flat;
set(gca,'xlim',[-119.75 -118.30],'ylim',[36.55 37.25],'clim',crange_elev,'FontSize',14);
set(gca,'XTickLabel','','YTickLabel','');
title('Elevation (m)','FontSize',22);
colormap(ax,Color_elev);
axp = get(ax,'Position');
cb = colorbar('horiz');set(cb,'Position',[axp(1) axp(2)-0.03 axp(3) 0.02]);
clear ax axp cb;

ax = subplot(2,3,2); % snow
pcolor(Lon,Lat,Snow); shading flat;
set(gca,'xlim',[-119.75 -118.30],'ylim',[36.55 37.25],'clim',crange_snow,'FontSize',14);
set(gca,'XTickLabel','','YTickLabel','');
title('Snow depth (m)','FontSize',22);
colormap(ax,Color_snow); 
axp = get(ax,'Position');
cb = colorbar('horiz');set(cb,'Position',[axp(1) axp(2)-0.03 axp(3) 0.02]);
clear ax axp cb;
 
% combine two axes
ax1 = subplot(2,3,4);
pcolor(Lon,Lat,Elev); shading flat; % elev
set(gca,'xlim',[-119.75 -118.30],'ylim',[36.55 37.25],'clim',crange_elev,'FontSize',14);
set(gca,'XTickLabel','','YTickLabel','');
title('Combined colormaps','FontSize',22);
ax1_pos = get(ax1,'Position');
ax2 = axes;
pcolor(Lon,Lat,Snow); shading flat; % snow
set(gca,'xlim',[-119.75 -118.30],'ylim',[36.55 37.25],'XTick','','YTick','','clim',crange_snow); 
linkaxes([ax1 ax2]); % link two axes
set(ax2,'Color','none','Visible','off'); 
colormap(ax1,Color_elev); colormap(ax2,Color_snow);
set([ax1,ax2],'Position',ax1_pos);

