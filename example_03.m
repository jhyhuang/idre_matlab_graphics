% IDRE workshop - Advanced Garphics with Matlab
% example 03 - refine plots

clc; clear; 

% data
load Data_exp3.mat;

figure(1)
subplot(2,2,1) % basic plot
hFit   = line(xfit,yfit); hold;
hE     = errorbar(xdata_m, ydata_m, ydata_s);
hData  = line(xVdata, yVdata ); hModel = line(xmodel, ymodel );
hCI(1) = line(xmodel, ymodelL); hCI(2) = line(xmodel, ymodelU);
title('Step 0: Original data','FontSize',16); 

subplot(2,2,2) % refine #1
hFit   = line(xfit,yfit); hold;
hE     = errorbar(xdata_m, ydata_m, ydata_s);
hData  = line(xVdata, yVdata ); hModel = line(xmodel, ymodel );
hCI(1) = line(xmodel, ymodelL); hCI(2) = line(xmodel, ymodelU);
set(hFit,'Color',[0 0 .5]);
set(hE,'LineStyle','none','Marker', '.','Color',[0.3 0.3 0.3]);
set(hData,'LineStyle','none','Marker', '.');
set(hModel,'LineStyle','--','Color','r');
set(hCI(1),'LineStyle','-.','Color',[0.0 0.5 0.0]);
set(hCI(2),'LineStyle','-.','Color',[0.0 0.5 0.0]);
title('Step 1: Add line styles','FontSize',16);

subplot(2,2,3)
hFit   = line(xfit,yfit); hold;
hE     = errorbar(xdata_m, ydata_m, ydata_s);
hData  = line(xVdata, yVdata ); hModel = line(xmodel, ymodel );
hCI(1) = line(xmodel, ymodelL); hCI(2) = line(xmodel, ymodelU);
set(hFit,'Color',[0 0 .5],'LineWidth',2);
set(hE,'LineStyle','none','LineWidth',1,'Color',[0.3 0.3 0.3],'Marker','o','MarkerSize',6, ...
    'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0.7 0.7 0.7]);
set(hData,'LineStyle','none','Marker','o','MarkerSize',5,'MarkerEdgeColor','none', ...
    'MarkerFaceColor' , [.75 .75 1] );
set(hModel,'LineStyle','--','LineWidth',1.5,'Color','r');
set(hCI(1),'LineStyle','-.','LineWidth',1.5,'Color',[0.0 0.5 0.0]);
set(hCI(2),'LineStyle','-.','LineWidth',1.5,'Color',[0.0 0.5 0.0]);
title('Step 2: Add marker properties','FontSize',16); 

subplot(2,2,4)
hFit   = line(xfit,yfit); hold;
hE     = errorbar(xdata_m, ydata_m, ydata_s);
hData  = line(xVdata, yVdata ); hModel = line(xmodel, ymodel );
hCI(1) = line(xmodel, ymodelL); hCI(2) = line(xmodel, ymodelU);
set(hFit,'Color',[0 0 .5],'LineWidth',2);
set(hE,'LineStyle','none','LineWidth',1,'Color',[0.3 0.3 0.3],'Marker','o','MarkerSize',6, ...
    'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0.7 0.7 0.7]);
set(hData,'LineStyle','none','Marker','o','MarkerSize',5,'MarkerEdgeColor','none', ...
    'MarkerFaceColor' , [.75 .75 1] );
set(hModel,'LineStyle','--','LineWidth',1.5,'Color','r');
set(hCI(1),'LineStyle','-.','LineWidth',1.5,'Color',[0.0 0.5 0.0]);
set(hCI(2),'LineStyle','-.','LineWidth',1.5,'Color',[0.0 0.5 0.0]);
xlabel('Length (m)'); ylabel('Mass (kg)');
text(10,800,sprintf('\\it{C = %0.1g \\pm %0.1g (CI)}',c,cint(2)-c));
legend([hE, hFit, hData, hModel, hCI(1)],'Data (\mu \pm \sigma)', ...
       'Fit (\it{C x^3})','Validation Data','Model (\it{C x^3})', ...
       '95% CI','location','NorthWest' );
title('Step 3: Add legends','FontSize',16); 

figure(2)
subplot(2,2,1)
hFit   = line(xfit,yfit); hold;
hE     = errorbar(xdata_m, ydata_m, ydata_s);
hData  = line(xVdata, yVdata ); hModel = line(xmodel, ymodel );
hCI(1) = line(xmodel, ymodelL); hCI(2) = line(xmodel, ymodelU);
set(hFit,'Color',[0 0 .5],'LineWidth',2);
set(hE,'LineStyle','none','LineWidth',1,'Color',[0.3 0.3 0.3],'Marker','o','MarkerSize',6, ...
    'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0.7 0.7 0.7]);
set(hData,'LineStyle','none','Marker','o','MarkerSize',5,'MarkerEdgeColor','none', ...
    'MarkerFaceColor' , [.75 .75 1] );
set(hModel,'LineStyle','--','LineWidth',1.5,'Color','r');
set(hCI(1),'LineStyle','-.','LineWidth',1.5,'Color',[0.0 0.5 0.0]);
set(hCI(2),'LineStyle','-.','LineWidth',1.5,'Color',[0.0 0.5 0.0]);
set(gca,'Box','off','TickDir','out','TickLength',[0.02 0.02], ...
    'XMinorTick','on','YMinorTick','on','YGrid','on', ...
    'xlim',[8 26],'ylim',[0 2500],'YTick',[0:500:2500],'LineWidth',1,'FontSize',12);
xlabel('Length (m)','FontSize',14,'FontName','AvantGarde');
ylabel('Mass (kg)','FontSize',14,'FontName','AvantGarde');
text(10,800,sprintf('\\it{C = %0.1g \\pm %0.1g (CI)}',c,cint(2)-c),'FontSize',14);
legend([hE, hFit, hData, hModel, hCI(1)],'Data (\mu \pm \sigma)', ...
       'Fit (\it{C x^3})','Validation Data','Model (\it{C x^3})', ...
       '95% CI','location','NorthWest','FontSize',14);
title ('Step4: Refined plot','FontSize',16,'FontWeight','bold');



