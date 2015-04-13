%load data
usage = load('..\processData\data\house_1\average_electricity.txt');
time = load('..\processData\data\house_1\timestamp.txt');
maxLen = size(usage,1)
start =223+12*24;
len = 12*24*3+1
%convert time
time = (time - datenum('01-Jan-1970')) / 86400;


%Build Figure
figure1 = figure;
set(figure1,'units','normalized','outerposition',[0 0 1 1]);

axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
set(axes1,'FontSize',30,'FontWeight','bold');

%plot and set font, line type
p = plot(time(start: start+len-1,1),usage(start: start+len-1,1));
set(p, 'Color', 'b', 'LineWidth', 3, 'linestyle','-');

%set x-tick
%set(axes1,'YTick',[0.2,0.4,0.6,0.8,1.0],'YTickLabel',{'20%','40%','60%','80%','100%'},'XGrid','on','YGrid','on');
set(axes1,'XTick',time(start: 12*24:start+len-1),'XTickLabel', time(start: 12*24:start+len-1),'XGrid','on','YGrid','on');
datetick('x', 'mm/dd HH:MM' ,'keepticks')

%set grid on 
set(axes1,'XGrid','on','YGrid','on');
    
%set legend
% legend(axes1,'show','Location','NorthWest','FontSize',10,'FontWeight','bold');
% legend('sample');

%set x, y Label
set(get(axes1,'XLabel'),'String','Time','FontSize',30,'FontWeight','bold');
set(get(axes1,'YLabel'),'String','Power (W)','FontSize',30,'FontWeight','bold');



%save to file
set(gcf, 'PaperPosition', [0 0 13 7]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [13 7]); %Set the paper to have width 5 and height 5.
%saveas(gcf, 'SolarTrace_High', 'pdf') %Save figure
saveas(gcf, '.\figs\ElectricityUsage', 'pdf') %Save figure  
saveas(gca, strcat('.\figs\ElectricityUsage', '.eps'),'psc2') %Save figure 

%set title
%title('10000 Attackers, 1000 Proxies');
 