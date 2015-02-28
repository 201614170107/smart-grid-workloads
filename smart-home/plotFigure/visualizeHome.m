% visualize the power consumption in one home in a single day

%Note: input a = [1:15:288]

 function  visualizeHome(homeNum)

sample = textread(strcat('../processedData/microgrid/',num2str(homeNum(1,1)),'.txt'));
 
 y = zeros(size(sample,1), size(homeNum,2));
 homeSize = size(homeNum,2)
 
 for i = 1: homeSize
    y(:,i) = textread(strcat('../processedData/microgrid/',num2str(homeNum(1,i)),'.txt'));
 end


strcat('../processedData/microgrid/',num2str(homeNum(1,i)),'.txt')

%Build Figure
figure1 = figure;
set(figure1,'units','normalized','outerposition',[0 0 1 1]);

axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
set(axes1,'FontSize',30,'FontWeight','bold');

len = size(y,1)
%set x,y axis
x=[1:len];


%plot and set font, line type
ac = 1
bc = 1
cc = 0
for i = 1:homeSize
p = plot(x(1,:),y(:,i));
set(p, 'Color', [ac bc cc], 'LineWidth', 3, 'linestyle','-');
ac  =rand
bc  =rand
cc =rand
% set(p, 'Marker', '<', 'MarkerSize', 10);
end    
    
    
  maxHeight = 0;
  for i = 1:homeSize
      if(maxHeight < max(y(:,i)))
           maxHeight = max(y(:,i));
      end
  end
  
%set x range and y range
axis([0 len+1 0 maxHeight])  

%set x tick and y tick
%set(axes1,'YTick',[0.2,0.4,0.6,0.8,1.0],'YTickLabel',{'20%','40%','60%','80%','100%'},'XGrid','on','YGrid','on');
%set(axes1,'XTick',[200,400,600,800,1000],'XTickLabel',{200,400,600,800,1000},'XGrid','on','YGrid','on');
 set(axes1,'XTick',[0: 24: size(x,2)],'XTickLabel',{0:2:24},'XGrid','on','YGrid','on');
 
 
%set grid on 
set(axes1,'XGrid','on','YGrid','on');
    
%set legend
%legend('home1');
% p = legend(axes1,'show','FontSize',10,'FontWeight','bold');
% set(p, 'Location','NorthWest')

%set x, y Label
set(get(axes1,'XLabel'),'String','Time (Hour)','FontSize',30,'FontWeight','bold');
set(get(axes1,'YLabel'),'String','Consumption power (kW)','FontSize',30,'FontWeight','bold');


%save to file
set(gcf, 'PaperPosition', [0 0 13 7]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [13 7]); %Set the paper to have width 5 and height 5.
%saveas(gcf, 'SolarTrace_High', 'pdf') %Save figure
saveas(gcf, '.\figures\HomeUsageTrace', 'pdf') %Save figure  
saveas(gca, strcat('.\figures\HomeUsageTrace', '.eps'),'psc2') %Save figure 


end
%set title
%title('10000 Attackers, 1000 Proxies');

