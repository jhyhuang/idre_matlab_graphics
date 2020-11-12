% IDRE workshop - Advanced Garphics with Matlab
% example 10 - stream plots

clc; clear;

% data - wind (matlab internal dataset)
load wind.mat;
UV = (u.^2+v.^2).^0.5; % velocity on x-y plane
Vel = (u.^2+v.^2+w.^2).^0.5; % velocity

% domain range
xrange = [min(x(:)), max(x(:))];
yrange = [min(y(:)), max(y(:))];
zrange = [min(z(:)), max(z(:))];
[sx,sy,sz] = meshgrid(xrange(1),yrange(1):5:yrange(2),zrange(1):3:zrange(2));
sel_z = 10;

figure(1)
subplot(2,2,1) % 3D streamline
s = streamline(x,y,z,u,v,w,sx,sy,sz); grid on;
set(s,'Color','b','LineWidth',2);
set(gca,'xlim',xrange,'ylim',yrange,'zlim',zrange,'FontSize',16);
xlabel('X','FontSize',20); ylabel('Y','FontSize',20); zlabel('Z','FontSize',20);
title('streamline','FontSize',22);
view(-37.5,45);

subplot(2,2,2)
s = streamtube(x,y,z,u,v,w,sx,sy,sz); set(s,'EdgeColor','none');
set(gca,'xlim',xrange,'ylim',yrange,'zlim',zrange,'FontSize',16);
xlabel('X','FontSize',20); ylabel('Y','FontSize',20); zlabel('Z','FontSize',20);
title('streamtube','FontSize',22);
axis on; grid on;
view([-37.5 45]);

subplot(2,3,4)
s= streamtube(x,y,z,u,v,w,sx,sy,sz); set(s,'EdgeColor','none');
set(gca,'xlim',xrange,'ylim',yrange,'zlim',zrange,'FontSize',16);
axis on; grid on;
light; 
view([-37.5 45]);
title('light','FontSize',22);

subplot(2,3,5)
s= streamtube(x,y,z,u,v,w,sx,sy,sz); set(s,'EdgeColor','none');
set(gca,'xlim',xrange,'ylim',yrange,'zlim',zrange,'FontSize',16);
axis on; grid on;
light; camlight headlight; 
view([-37.5 45]);
title('camlight','FontSize',22);

subplot(2,3,6)
s =streamtube(x,y,z,u,v,w,sx,sy,sz); set(s,'EdgeColor','none');
set(gca,'xlim',xrange,'ylim',yrange,'zlim',zrange,'FontSize',16);
axis on; grid on;
light; camlight left; material dull;
view([-37.5 45]);
title('camlight+material','FontSize',22);

