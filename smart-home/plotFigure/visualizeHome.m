% visualize the power consumption in one home in a single day
 function  visualizeHome(homeNum)

y = textread(strcat('../processedData/microgrid/',num2str(homeNum),'.txt'))
%y = textread('../processedData/microgrid/1.txt')

%Build Figure
figure1 = figure;
set(figure1,'units','normalized','outerposition',[0 0 1 1]);

axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
set(axes1,'FontSize',30,'FontWeight','bold');

len = size(y,1)
%set x,y axis
x=[1:len]


%plot and set font, line type
p = plot(x(1,:),y(:,1));
set(p, 'Color', 'g', 'LineWidth', 3, 'linestyle','-');
% set(p, 'Marker', '<', 'MarkerSize', 10);
    
    
    
  
%set x range and y range
axis([0 len+1 0 max(y)])  

%set x tick and y tick
%set(axes1,'YTick',[0.2,0.4,0.6,0.8,1.0],'YTickLabel',{'20%','40%','60%','80%','100%'},'XGrid','on','YGrid','on');
%set(axes1,'XTick',[200,400,600,800,1000],'XTickLabel',{200,400,600,800,1000},'XGrid','on','YGrid','on');
 set(axes1,'XTick',[0: 24: size(x,2)],'XTickLabel',{0:2:24},'XGrid','on','YGrid','on');
 
 
%set grid on 
set(axes1,'XGrid','on','YGrid','on');
    
%set legend
legend('home1');
p = legend(axes1,'show','FontSize',10,'FontWeight','bold');
set(p, 'Location','NorthWest')

%set x, y Label
set(get(axes1,'XLabel'),'String','Time (Hour)','FontSize',30,'FontWeight','bold');
set(get(axes1,'YLabel'),'String','Consumption power','FontSize',30,'FontWeight','bold');

end
%set title
%title('10000 Attackers, 1000 Proxies');