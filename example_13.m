% IDRE workshop - Advanced Garphics with Matlab
% example 13 - surf animation

clc; clear;

% data
Nf = 50;
ds = 60;
r = linspace(0.1,1.0,Nf);
R = [r fliplr(r)];

% figure(1)
% for d = 1:Nf-1
%   subplot(7,7,d)
%   [X,Y,Z] = sphere(ds);
%   X = R(d)*X; Y = R(d)*Y; Z = R(d)*Z;
%   surf(X,Y,Z,'FaceColor','g','EdgeColor','none');
%   camlight; lighting gouraud;
%   axis([-1 1 -1 1 -1 1]); axis square; grid on;
%   set(gca,'XTick',[-1:0.5:1],'XTickLabel','','YTick',[-1:0.5:1],'YTickLabel','', ...
%       'ZTick',[-1:0.5:1],'ZTickLabel','');
%   view(-45,45);
%   title_text = ['frame = ',num2str(d)];
%   title(title_text,'FontSize',16);
% end
% clear d;

% animation
fname_out = 'sphere_anim.gif';
h = figure(2);
axis tight manual;
for d = 1:length(R)
  [X,Y,Z] = sphere(ds);
  X = R(d)*X; Y = R(d)*Y; Z = R(d)*Z;
  surf(X,Y,Z,'FaceColor','g','EdgeColor','none');
  camlight; lighting gouraud;
  axis([-1 1 -1 1 -1 1]); axis square; grid on;
  set(gca,'XTick',[-1:0.5:1],'YTick',[-1:0.5:1],'ZTick',[-1:0.5:1],'FontSize',12);
  xlabel('X','Fontsize',16); ylabel('Y','Fontsize',16); zlabel('Z','Fontsize',16);
  view(-45,45);  
  drawnow;
  F = getframe(gcf);
  im = frame2im(F);
  [imind,cm] = rgb2ind(im,256);
  if d==1
    imwrite(imind,cm,fname_out,'gif','Loopcount',0);
  else
    imwrite(imind,cm,fname_out,'gif','DelayTime',0.1,'WriteMode','append');
  end
end
clear d;

